//
//  KOAuthTests.m
//  KOAuthTests
//
//  Created by Kelp on 2013/01/24.
//  Copyright (c) 2013 Accuvally Inc. All rights reserved.
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

- (void)testKOAuth
{
    NSURL *url = [NSURL URLWithString:@"http://demo.uservoice.com/api/v1/articles.json"];
    NSMutableURLRequest *request = [KOAuth URLRequestForUrl:url
                                              GETParameters:nil
                                                consumerKey:@"pZJocTBPbg5FN4bAwczDLQ"
                                             consumerSecret:@"Q7UKcxRYLlSJN4CxegUYI6t0uprdsSAGthRIDvYmI"
                                                accessToken:nil tokenSecret:nil];
    NSLog(@"%@", request.allHTTPHeaderFields);
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error == nil && ((NSHTTPURLResponse *)response).statusCode == 200 && data.length > 0) {
        NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if ([content rangeOfString:@"{\"response_data\":{\"page\":1,"].location == NSNotFound) {
            STFail(@"UserVoice list articles failed.");
        }
    }
    else {
        STFail(@"UserVoice web service error.");
    }
}


@end
