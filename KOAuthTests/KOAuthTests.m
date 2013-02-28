//
//  KOAuthTests.m
//  KOAuthTests
//
//  Created by Kelp on 2013/01/24.
//

#import "KOAuthTests.h"
#import "KOAuth.h"


@implementation KOAuthTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGetRequestToken
{
    NSURL *url = [NSURL URLWithString:@"http://term.ie/oauth/example/request_token.php"];
    NSMutableURLRequest *request = [KOAuth URLRequestForRequestTokenWithUrl:url
                                                                consumerKey:@"key" consumerSecret:@"secret"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil && ((NSHTTPURLResponse *)response).statusCode == 200 && data.length > 0) {
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        STAssertEqualObjects(content, @"oauth_token=requestkey&oauth_token_secret=requestsecret", nil);
    }
    else {
        STFail(nil);
    }
}

- (void)testGetAccessToken
{
    NSURL *url = [NSURL URLWithString:@"http://term.ie/oauth/example/access_token.php"];
    NSMutableURLRequest *request = [KOAuth URLRequestForAccessTokenWithUrl:url
                                                               consumerKey:@"key"
                                                            consumerSecret:@"secret"
                                                              requestToken:@"requestkey"
                                                               tokenSecret:@"requestsecret"
                                                              oauthVerfier:@""];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil && ((NSHTTPURLResponse *)response).statusCode == 200 && data.length > 0) {
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        STAssertEqualObjects(content, @"oauth_token=accesskey&oauth_token_secret=accesssecret", nil);
    }
    else {
        STFail(nil);
    }
}

- (void)testHTTPGet
{
    NSURL *url = [NSURL URLWithString:@"http://term.ie/oauth/example/echo_api.php"];
    NSMutableURLRequest *request = [KOAuth URLRequestForUrl:url
                                              GETParameters:@{@"name": @"kelp"}
                                                consumerKey:@"key"
                                             consumerSecret:@"secret"
                                                accessToken:@"accesskey"
                                                tokenSecret:@"accesssecret"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil && ((NSHTTPURLResponse *)response).statusCode == 200 && data.length > 0) {
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        STAssertEqualObjects(content, @"name=kelp", nil);
    }
    else {
        STFail(nil);
    }
}

- (void)testHTTPPost
{
    NSURL *url = [NSURL URLWithString:@"http://term.ie/oauth/example/echo_api.php"];
    NSMutableURLRequest *request = [KOAuth URLRequestForUrl:url
                                              POSTParameters:@{@"name": @"Kelp", @"group": @"<A>" }
                                                    consumerKey:@"key"
                                                consumerSecret:@"secret"
                                                    accessToken:@"accesskey"
                                                    tokenSecret:@"accesssecret"];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil && ((NSHTTPURLResponse *)response).statusCode == 200 && data.length > 0) {
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        STAssertEqualObjects(content, @"name=Kelp&group=%3CA%3E", nil);
    }
    else {
        STFail(nil);
    }
}


@end
