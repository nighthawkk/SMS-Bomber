import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Scanner;

public class Sender {
    public static void sendGetRequest(String phoneNumber) throws IOException {
        String decodedUrl = new String(Base64.getDecoder().decode("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"));
        String fullUrl = decodedUrl + phoneNumber;
        URL obj = new URL(fullUrl);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");

        Scanner scanner = new Scanner(con.getInputStream());
        while (scanner.hasNext()) {
            System.out.println(scanner.nextLine());
        }
        scanner.close();
    }

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.out.println("Usage: java Sender <phone_number>");
            return;
        }

        String phoneNumber = args[0];
        sendGetRequest(phoneNumber);
    }
}
