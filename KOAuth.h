/*
 KOAuth
 MIT License
 https://github.com/Kelp404/KOAuth
 
 Fork from https://github.com/tweetdeck/TDOAuth Max Howell <max@tweetdeck.com>
 */

#import <Foundation/Foundation.h>

/*
 This OAuth implementation doesn't cover the whole spec (eg. it’s HMAC only).
 But you'll find it works with almost all the OAuth implementations you need
 to interact with in the wild. How ace is that?!
 */
@interface KOAuth : NSObject {
    NSString *_signatureSecret;
    NSDictionary *_params; // these are pre-percent encoded
    NSDictionary *_encodedFormParameters;
}

// *all keys and values of parameters should be NSString*
/**
 Generate a NSMutableURLRequest instance with oauth for HTTP GET.
 @param url: http/https url
 @param unencodedParameters: http get parameters
 @param consumerKey
 @param consumerSecret
 @param accessToken
 @param tokenSecret
 @return: NSMutableURLRequest
 */
+ (NSMutableURLRequest *)URLRequestForUrl:(NSURL *)url GETParameters:(NSDictionary *)unencodedParameters consumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken tokenSecret:(NSString *)tokenSecret;
/**
 Generate a NSMutableURLRequest instance with oauth for HTTP POST.
 @param url: http/https url
 @param unencodedParameters: http get parameters
 @param consumerKey
 @param consumerSecret
 @param accessToken
 @param tokenSecret
 @return: NSMutableURLRequest
 */
+ (NSMutableURLRequest *)URLRequestForUrl:(NSURL *)url POSTParameters:(NSDictionary *)unencodedParameters consumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken tokenSecret:(NSString *)tokenSecret;
/**
 Generate a NSMutableURLRequest instance with oauth for HTTP PUT.
 @param url: http/https url
 @param unencodedParameters: http get parameters
 @param consumerKey
 @param consumerSecret
 @param accessToken
 @param tokenSecret
 @return: NSMutableURLRequest
 */
+ (NSMutableURLRequest *)URLRequestForUrl:(NSURL *)url PUTParameters:(NSDictionary *)unencodedParameters consumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken tokenSecret:(NSString *)tokenSecret;
/**
 Generate a NSMutableURLRequest instance with oauth for HTTP DELETE.
 @param url: http/https url
 @param unencodedParameters: http get parameters
 @param consumerKey
 @param consumerSecret
 @param accessToken
 @param tokenSecret
 @return: NSMutableURLRequest
 */
+ (NSMutableURLRequest *)URLRequestForUrl:(NSURL *)url DELETEParameters:(NSDictionary *)unencodedParameters consumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret accessToken:(NSString *)accessToken tokenSecret:(NSString *)tokenSecret;

// request for request_token
+ (NSMutableURLRequest *)URLRequestForRequestTokenWithUrl:(NSURL *)url consumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret;
// request for access_token
+ (NSMutableURLRequest *)URLRequestForAccessTokenWithUrl:(NSURL *)url consumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret requestToken:(NSString *)requestToken tokenSecret:(NSString *)tokenSecret oauthVerfier:(NSString *)oauthVerfier;

@end
