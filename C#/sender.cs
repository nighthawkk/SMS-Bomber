using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text;

class Program
{
    static async Task SendGetRequest(string phoneNumber)
    {
        string decodedUrl = Encoding.UTF8.GetString(Convert.FromBase64String("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9"));
        string fullUrl = $"{decodedUrl}{phoneNumber}";

        using (HttpClient client = new HttpClient())
        {
            HttpResponseMessage response = await client.GetAsync(fullUrl);
            string responseBody = await response.Content.ReadAsStringAsync();
            Console.WriteLine(responseBody);
        }
    }

    static void Main(string[] args)
    {
        if (args.Length != 1)
        {
            Console.WriteLine("Usage: sender.exe <phone_number>");
            return;
        }

        string phoneNumber = args[0];
        SendGetRequest(phoneNumber).Wait();
    }
}
