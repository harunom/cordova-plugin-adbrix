/********* CDVAdbrix.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

#import <AdBrix/AdBrix.h>

@interface CDVAdbrix : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;

- (void)retention:(CDVInvokedUrlCommand*)command;

@end

@implementation CDVAdbrix

- (void)retention:(CDVInvokedUrlCommand*)command
{
    NSString* activityName = [command.arguments objectAtIndex:0];
    NSString* subName = [command.arguments objectAtIndex:1];

    NSLog(@"Activity Name: %@, Sub Name: %@", activityName, subName);

    if ([subName isKindOfClass:[NSNull class]])
    {
        [AdBrix retention:activityName];
    }
    else
    {
        [AdBrix retention:activityName param:subName];
    }
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
