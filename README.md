#KOAuth

Kelp http://kelp.phate.org/  
[MIT License][mit]
[MIT]: http://www.opensource.org/licenses/mit-license.php


##example
```objective-c
NSURL *url = [NSURL URLWithString:@"http://demo.uservoice.com/api/v1/articles.json"];
NSMutableURLRequest *request = [KOAuth URLRequestForUrl:url
                                          GETParameters:nil
                                            consumerKey:@"pZJocTBPbg5FN4bAwczDLQ"
                                         consumerSecret:@"Q7UKcxRYLlSJN4CxegUYI6t0uprdsSAGthRIDvYmI"
                                            accessToken:nil tokenSecret:nil];
NSLog(@"Headers:\n%@", request.allHTTPHeaderFields);

NSURLResponse *response = nil;
NSError *error = nil;
NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
if (error == nil && ((NSHTTPURLResponse *)response).statusCode == 200 && data && data.length > 0) {
    NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Response:\n%@", content);
}
else {
    STFail(@"UserVoice web service error.");
}
```