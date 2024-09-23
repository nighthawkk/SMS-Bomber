#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <unistd.h>
#include <openssl/bio.h>
#include <openssl/evp.h>

// Function to decode base64
char *base64_decode(const char *input) {
    int length = strlen(input);
    int padding = 0;

    if (input[length - 1] == '=')
        padding++;
    if (input[length - 2] == '=')
        padding++;

    int decoded_length = (length * 3) / 4 - padding;
    char *decoded = malloc(decoded_length + 1);
    if (!decoded) return NULL;

    BIO *bio = BIO_new_mem_buf(input, -1);
    BIO *b64 = BIO_new(BIO_f_base64());
    bio = BIO_push(b64, bio);
    BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL);
    BIO_read(bio, decoded, length);
    decoded[decoded_length] = '\0';

    BIO_free_all(bio);
    return decoded;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <phone_number>\n", argv[0]);
        return 1;
    }

    // Hard-coded base64 encoded URL
    char *decoded_url = base64_decode("aHR0cHM6Ly9sb3R0ZXJ5LWFwaXMtenFta2tscDViYS1lbS5hLnJ1bi5hcHAvc2VuZE9UUC8/cGhvbmU9");
    if (!decoded_url) {
        fprintf(stderr, "Failed to decode URL\n");
        return 1;
    }

    // Construct the full URL
    char full_url[256];
    snprintf(full_url, sizeof(full_url), "%s%s", decoded_url, argv[1]);

    // Use libcurl to send GET request
    CURL *curl;
    CURLcode res;

    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();
    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, full_url);
        res = curl_easy_perform(curl);
        if(res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        }
        curl_easy_cleanup(curl);
    }

    free(decoded_url);
    curl_global_cleanup();
    return 0;
}
