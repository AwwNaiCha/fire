import java.sql.Connection;
import java.util.Arrays;
import java.util.Date;
import java.util.Scanner;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class GetFireLevel{
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
         System.out.println("Updating fire level data...");
         Statement stmt1 = c.createStatement();
         ResultSet prcp = stmt1.executeQuery("SELECT * FROM monthly_prcps;");
         String[] month = {"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
         Statement stmt2 = c.createStatement();
         while ( prcp.next() ) {
        	 int[] visitor = new int[12];
        	 int[] camp = new int[12];
        	 double[] prcpData = new double[12];
        	 double[] tempData = new double[12];
        	 double[] fire = new double[12];
        	 String name = prcp.getString("park_name");
        	 //get visitor data
        	 Statement pop = c.createStatement();
        	 ResultSet visitorData = pop.executeQuery("SELECT * FROM visitornumbers WHERE park_name='"+name+"';");
        	 if (visitorData.next()) {
        		 for (int i = 0; i < 12; i++)	visitor[i] = visitorData.getInt(month[i]);
        	 }
        	 ResultSet campData = pop.executeQuery("SELECT * FROM campernumbers WHERE park_name='"+name+"';");
        	 if (campData.next()) {
        		 for (int i = 0; i < 12; i++)	camp[i] = campData.getInt(month[i]);
        	 }
        	 
        	 //get prcp and temp data and calculate fire level
        	 ResultSet temp = stmt2.executeQuery("SELECT * FROM montly_temps WHERE park_name='"+name+"';");
        	 temp.next();
        	 for (int i = 0; i < 12; i++) {
        		 prcpData[i] = prcp.getDouble(month[i]);
        		 tempData[i] = temp.getDouble(month[i]);
        		 if (tempData[i] >= 70 && prcpData[i] <= 0.05)	fire[i] = 6;
        		 else if (tempData[i] >= 60 && prcpData[i] <= 0.3)	fire[i] = 5;
        		 else if (tempData[i] >= 50 && prcpData[i] <= 0.6)	fire[i] = 4;
        		 else if (tempData[i] >= 40 && prcpData[i] <= 1)	fire[i] = 3;
        		 else if (tempData[i] >= 30 && prcpData[i] <= 1.5)	fire[i] = 2;
        		 else	fire[i] = 1;
        		 if (Math.log(visitor[i] + 2 * camp[i]) / Math.log(2) / 10 >= 1.6 && fire[i] < 6)
        			 fire[i]++;
        	 }
        	 
        	 ResultSet checkExist = stmt2.executeQuery("SELECT * FROM monthly_fire_levels WHERE park_name='"+name+"';");
        	 if (checkExist.next()) {
        		 stmt2.executeUpdate("DELETE FROM monthly_fire_levels WHERE park_name='" +name+"';");
        	 }
        	 stmt2.executeUpdate("INSERT INTO monthly_fire_levels (park_name, jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)"
        	 		+ "Values ('"+name+"', "+fire[0]+", "+fire[1]+", "+fire[2]+", "+fire[3]+","
        	 		+fire[4]+", "+fire[5]+", "+fire[6]+", "+fire[7]+", "+fire[8]+", "+fire[9]+","
        	 		+fire[10]+ ", "+fire[11]+");");
        	 pop.close();
         }
          stmt1.close();
          stmt2.close();
          c.commit();
          c.close();
          System.out.println("Finished");
      } catch (Exception e) {
         e.printStackTrace();
         System.err.println(e.getClass().getName()+": "+e.getMessage());
         System.exit(0);
      }
   }
}