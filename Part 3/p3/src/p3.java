import javax.xml.transform.Result;
import java.net.PasswordAuthentication;
import java.sql.*;
import java.util.Scanner;

public class p3 {

    private static String USERID = "";
    private static String PASSWORD = "";

    public static void main(String[] args) throws SQLException {

        USERID = args[0];
        PASSWORD = args[1];

        // Connection to the database
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e)
        {
            System.out.println("Where is your Oracle JDBC Driver");
            e.printStackTrace();
            return;
        }

        Connection connection = null;

        try {
            connection = DriverManager.getConnection("jdbc:oracle:thin:@csorcl.cs.wpi.edu:1521:orcl", USERID, PASSWORD);
        } catch(SQLException e) {
            System.out.println("Connection Failed! Check output console.");
            e.printStackTrace();
            return;
        }

        //System.out.println("Connection Successful!");

        if(args.length == 2){
            System.out.println("1 - Report Location Information");
            System.out.println("2 - Report Path Information");
            System.out.println("3 - Report Staff Office Information");
            System.out.println("4 - Update Location Type");
            System.out.println("5 - Exit Program");
            return;
        }

        else if(args[2].equals("1")){

            System.out.println("Enter LocationID: ");
            Scanner userInput = new Scanner(System.in);

            String userLocation = userInput.nextLine();

            String locationQuery = "SELECT * FROM Location" + " WHERE locationID = " + "'" + userLocation + "'";

            try {
                //System.out.println(locationQuery);
                Statement stmt = connection.createStatement();
                ResultSet rset = stmt.executeQuery(locationQuery);

                // Takes in the user input location
                rset.next();
                System.out.println("Location Information");
                System.out.println("LocationID: " + rset.getString("locationID"));
                System.out.println("Location Name: " + rset.getString("locationName"));
                System.out.println("Location Type: " + rset.getString("locationType"));
                System.out.println("X-Coordinate: " + rset.getInt("xcoord"));
                System.out.println("Y-Coordinate: " + rset.getInt("ycoord"));
                System.out.println("Floor: " + rset.getString("floor"));
                return;

            } catch (SQLException e){
                System.out.println(e.getMessage());
            }
        }

        else if(args[2].equals("2")){

            Scanner userInput = new Scanner(System.in);
            System.out.println("Enter PathID: ");

            String pathQuery = "SELECT * FROM PathEdge WHERE pathID = " + "'"+ userInput.nextLine() + "'" ;

            try {
                Statement stmt = connection.createStatement();
                ResultSet rset = stmt.executeQuery(pathQuery);

                while(rset.next()){
                    System.out.println(rset.getString("startingID") + " " + rset.getString("endingID"));
                }
                return;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

        else if(args[2].equals("3")){
            Scanner userInput = new Scanner(System.in);
            System.out.println("Enter Account Name: ");

            String accountQuery = "SELECT * FROM Staff JOIN Location ON Staff.locationID = Location.locationID JOIN" +
                    " OFFICE ON Office.locationID = Staff.locationID WHERE Staff.accountName = " + "'" + userInput.nextLine() + "'";
            try {
                Statement stmt = connection.createStatement();
                ResultSet rset = stmt.executeQuery(accountQuery);

                rset.next();
                System.out.println("Staff Office Information");
                System.out.println("Account Name: " + rset.getString("accountName"));
                System.out.println("Office Name: " + rset.getString("locationID"));
                System.out.println("X-Coordinate: " + rset.getInt("xcoord"));
                System.out.println("Y-Coordinate: " + rset.getInt("ycoord"));
                System.out.println("Floor: " + rset.getString("floor"));
                System.out.println("Maximum Occupancy: " + rset.getInt("maxoccupancy"));

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

         else if(args[2].equals("4")){
            System.out.println("Enter the locationID: ");
            Scanner userInputLocation = new Scanner(System.in);
            String inputLocation = userInputLocation.nextLine();
            System.out.println("Inputted Location: " + inputLocation);

            System.out.println("Enter the new Location Type:");
            Scanner userInputType = new Scanner(System.in);
            String newLocationType = userInputType.nextLine();
            System.out.println("User Location Type: " + newLocationType);

            String updateSQL = "UPDATE Location SET locationType =" + "'" + newLocationType + "'" + " WHERE locationID =" + "'" +
                    inputLocation + "'";

            System.out.println(updateSQL);

            Statement stmt = connection.createStatement();
            int updatedRow = stmt.executeUpdate(updateSQL);

            System.out.println("Row Updated Successfully!");
        }

         else if(args[2].equals("5")){
             System.out.println("Exiting program...");
             return;
        }
         else {
             System.out.println("Invalid parameters. Please follow the format of: USERNAME PASSWORD ARGUMENT");
             System.out.println("Arguments range from 1 - 5. If you want to see what each value does please enter just your username and password.");
        }
    }

}