import java.sql.Connection;
import java.util.Date;
import java.util.Scanner;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONObject;

public class WeatherUpdate {
   public static void main(String args[]) {
      Connection c = null;
      try {
         Class.forName("org.postgresql.Driver");
          Scanner in = new Scanner(System.in);
          System.out.println("Input username of schoolpro_development database:");
          String username = in.nextLine();
          System.out.println("Input password:");
          String password = in.nextLine();
         c = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/schoolpro_development",
            username, password);
         c.setAutoCommit(false);
         System.out.println("Opened database successfully");
         System.out.println("Updating weather data...");
         Statement stmt = c.createStatement();
         String urlHead = "https://api.forecast.io/forecast/";
         //String urlTail = "&cnt=16&mode=json&appid=";
         String key = "55e139d26fd8aae4135e3fe2f7231a9e";
         ResultSet rs = stmt.executeQuery( "SELECT park_name, latitude, longitude FROM locations" );
         int countUpdate = 0;
         int countInsert = 0;
         String[] month = {"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
         Statement stat = c.createStatement();
         while ( rs.next() ) {
        	 String name = rs.getString("park_name");
        	 double lat = rs.getDouble("latitude");
        	 double lon = rs.getDouble("longitude");
             String url = urlHead + key + "/" + lat + "," + lon;
             JSONObject json = JsonReader.readJsonFromUrl(url);
        	 JSONArray weatherArray = json.getJSONObject("daily").getJSONArray("data");
        	 for (int i = 0; i < weatherArray.length(); i++) {
                 //get weather information
        		 JSONObject weather = weatherArray.getJSONObject(i);
        		 Long dateEpoch = weather.getLong("time");
        		 Date date = new Date(dateEpoch*1000);
        		 java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        		 double temp = (weather.getDouble("temperatureMin") + weather.getDouble("temperatureMax")) / 2;
        		 double precip = weather.getDouble("precipIntensity") * 24;
        		 double wind = weather.getDouble("windSpeed");
        		 double humidity = weather.getDouble("humidity");
                 
                 //calculate fire level
                 int fire = 1;
                 if (wind >= 30 && humidity <= 0.2 && temp >= 70 && precip <= 0.00001)  fire = 6;
                 else if (wind >= 20 && humidity <= 0.3 && temp >= 60 && precip <= 0.00001) fire = 5;
                 else if (wind >= 10 && humidity <= 0.3 && temp >= 50 && precip <= 0.01)    fire = 4;
                 else if (wind >= 5 && humidity <= 0.4 && temp >= 40 && precip <= 0.03) fire = 3;
                 else if (humidity <= 0.5 && temp >= 30 && precip <= 0.04)  fire = 2;
                 
                 //add population effect to fire level
                 ResultSet getMonth = stat.executeQuery("SELECT EXTRACT(MONTH FROM TIMESTAMP '"+sqlDate+"') as m;");
                 getMonth.next();
                 String currentMonth = month[getMonth.getInt("m")-1];
                 ResultSet getVisitor = stat.executeQuery("SELECT * FROM visitornumbers WHERE park_name = '"+name+"';");
                 int visitor = 0;
                 int camp = 0;
                 if (getVisitor.next())
                     visitor = getVisitor.getInt(currentMonth);
                 ResultSet getCamp = stat.executeQuery("SELECT * FROM campernumbers WHERE park_name = '"+name+"';");
                 if (getCamp.next())
                     camp = getCamp.getInt(currentMonth);
                 if (Math.log(visitor + 2 * camp) / Math.log(2) / 10 >= 1.5 && fire < 6)   fire++;
                 
                 //update or insert data
                 ResultSet count = stat.executeQuery("SELECT * FROM weathers "
                    + "WHERE park_name='"+name+"' AND date='"+sqlDate+"'; ");
                 if (count.next()) 
                     countUpdate += stat.executeUpdate("UPDATE weathers "
        		 		+ "SET temp="+temp+", precip="+precip+", wind="+wind+", humidity="+humidity+", \"fireLevel\"=" + fire
                        + " WHERE park_name='"+name+"' AND date='"+sqlDate+"'; ");
                 else
                     countInsert += stat.executeUpdate( "INSERT INTO weathers (park_name, date, temp, precip, wind, humidity, \"fireLevel\") "
                        + " VALUES ('"+name+"', '"+sqlDate+"', "+temp+", "+precip+", "+wind+", "+humidity+", "+fire+")");        	 }
          }
          stat.close();
          rs.close();
          stmt.close();
          c.commit();
          c.close();
          System.out.println(countUpdate + " data updated");
          System.out.println(countInsert + " data inserted");
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
      }
   }
}