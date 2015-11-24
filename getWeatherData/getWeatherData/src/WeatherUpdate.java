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
         String urlHead = "http://api.openweathermap.org/data/2.5/forecast/daily?";
         String urlTail = "&cnt=16&mode=json&appid=";
         String key = "2de143494c0b295cca9337e1e96b00e0";
         ResultSet rs = stmt.executeQuery( "SELECT park_name, latitude, longitude FROM locations" );
         int countUpdate = 0;
         int countInsert = 0;
         Statement stat = c.createStatement();
         while ( rs.next() ) {
        	 String name = rs.getString("park_name");
        	 double lat = rs.getDouble("latitude");
        	 double lon = rs.getDouble("longitude");
        	 String url = urlHead + "lat=" + lat + "&lon=" + lon + urlTail + key;
        	 JSONObject json = JsonReader.readJsonFromUrl(url);
        	 JSONArray weatherArray = json.getJSONArray("list");
        	 for (int i = 0; i < weatherArray.length(); i++) {
        		 JSONObject weather = weatherArray.getJSONObject(i);
        		 Long dateEpoch = weather.getLong("dt");
        		 Date date = new Date(dateEpoch*1000);
        		 java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        		 double temp = (((JSONObject) weather.get("temp")).getDouble("min") + ((JSONObject) weather.get("temp")).getDouble("max")) / 2;
        		 double precip = 0;
        		 if(weather.has("rain")) {
        			    precip = weather.getDouble("rain");
        			}
        		 double wind = weather.getDouble("speed");
        		 double humidity = weather.getDouble("humidity");
                 ResultSet count = stat.executeQuery("SELECT * FROM weathers "
                    + "WHERE park_name='"+name+"' AND date='"+sqlDate+"'; ");
                 if (count.next()) 
                     countUpdate += stat.executeUpdate("UPDATE weathers "
        		 		+ "SET temp="+temp+", precip="+precip+", wind="+wind+", humidity="+humidity
        		 		+ " WHERE park_name='"+name+"' AND date='"+sqlDate+"'; ");
                 else
                     countInsert += stat.executeUpdate( "INSERT INTO weathers (park_name, date, temp, precip, wind, humidity) "
                        + " VALUES ('"+name+"', '"+sqlDate+"', "+temp+", "+precip+", "+wind+", "+humidity+")");        	 }
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