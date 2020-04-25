//
//  Constants.m
//  ios-receipt-scan-example
//
//  Version 0.0.1
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Paulo Miguel Almeida Rodenas <paulo.ubuntu@gmail.com>
//
//  Get the latest version from here:
//
//  https://github.com/nfscan/ios-receipt-scan-example
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "Constants.h"

@implementation Constants

// HTTP Endpoints

/**
 *  Return the base url
 *
 *  @return a NSString
 */


+(NSString*) HOST{
    static NSString* baseUrl;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *env = [[NSProcessInfo processInfo] environment];
        NSString *overrideBaseUrl = [env valueForKey:@"BASE_URL"];
        if(overrideBaseUrl && ![overrideBaseUrl isEqualToString:@""]){
            baseUrl = overrideBaseUrl;
        }else{
#ifdef DEBUG
            NSLog(@"%s BASE_URL ENVIRONMENTAL VARIABLES ISN'T SET",__PRETTY_FUNCTION__);
#endif
            baseUrl = @"http://youripaddress:8080/nfscan-server/";
        }
    });
    return baseUrl;
}

//+(NSString*) HOST{
//    static NSString* baseUrl;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSDictionary *env = [[NSProcessInfo processInfo] environment];
//        NSString *overrideBaseUrl = [env valueForKey:@"BASE_URL"];
//        if(overrideBaseUrl && ![overrideBaseUrl isEqualToString:@""]){
//            baseUrl = overrideBaseUrl;
//        }else{
//#ifdef DEBUG
//            NSLog(@"%s BASE_URL ENVIRONMENTAL VARIABLES ISN'T SET",__PRETTY_FUNCTION__);
//#endif
//            baseUrl = @"http://youripaddress:8080/nfscan-server/";
//        }
//    });
//    return baseUrl;
//}

/**
 *  Return the process authentication http endpoint
 *
 *  @return a NSString
 */
+(NSString*) PROCESS_AUTH_SERVICE
{
    return [[Constants HOST] stringByAppendingString:[NSString stringWithFormat:@"fe/taxreceipts/process/auth.action"]];
}

/**
 *  Return the process start http endpoint
 *
 *  @return a NSString
 */
+(NSString*) PROCESS_START_SERVICE
{
    return [[Constants HOST] stringByAppendingString:[NSString stringWithFormat:@"fe/taxreceipts/process/start.action"]];
}

/**
 *  Return the process check http endpoint
 *
 *  @return a NSString
 */
+(NSString*) PROCESS_CHECK_SERVICE
{
    return [[Constants HOST] stringByAppendingString:[NSString stringWithFormat:@"fe/taxreceipts/process/check.action"]];
}

/**
 *  Return the donate http endpoint
 *
 *  @return a NSString
 */
+(NSString*) DONATE_SERVICE
{
    return [[Constants HOST] stringByAppendingString:[NSString stringWithFormat:@"fe/taxreceipts/process/donate.action"]];
}

/**
 *  Return the Date format expected by the nfscan-server
 *
 *  @return a NSString
 */
+(NSString*) DATE_FORMAT
{
    static NSString* value;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        value = @"dd/MM/yyyy";
    });
    
    return value;
}

@end
