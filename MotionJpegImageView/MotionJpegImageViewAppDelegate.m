//
//  MotionJpegImageViewAppDelegate.m
//  MotionJpegImageView
//
//  Created by Matthew Eagar on 10/4/11.
//  Copyright 2011 ThinkFlood Inc. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is furnished
// to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "MotionJpegImageViewAppDelegate.h"
#import "MotionJpegImageView.h"

@interface MotionJpegImageViewAppDelegate ()
{
    IBOutlet UIWebView *webView;
    IBOutlet MotionJpegImageView *imageView;
}
@end

@implementation MotionJpegImageViewAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    // Demonstrates the dramatic performance difference between loading M-JPEGs 
    // through UIWebView (top) vs MotionJpegImageView (bottom)
    
    NSURL *url = [NSURL URLWithString:@"http://webcam6.med.miami.edu/mjpg/video.mjpg"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

    imageView.url = url;
    [imageView play];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [webView stopLoading];
    [imageView pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [webView reload];
    [imageView play];
}


@end
