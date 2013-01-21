#TDOAuth 1.0.0 (Kelp mode)

Kelp http://kelp.phate.org/ <br/>
BSD License<br/>
Fork from https://github.com/tweetdeck/TDOAuth Max Howell <max@tweetdeck.com>


A BSD-licensed single-header-single-source OAuth1 implementation.

**example:**
```objective-c
// argument of request
NSDictionary *params = [NSDictionary new];
NSError *error;

NSURLRequest *rq = [TDOAuth URLRequestForUrl:EndpointMyTickets
                                GETParameters:params
                                         host:_oauth.host        // like "api.yourdomain.com:8080/rest"
                                  consumerKey:_oauth.consumerKey
                               consumerSecret:_oauth.consumerSecret   
                                  accessToken:_oauth.accessToken
                                  tokenSecret:_oauth.accessTokenSecret];
// response
NSData * data = [NSURLConnection sendSynchronousRequest:rq returningResponse:nil error:&error];
```