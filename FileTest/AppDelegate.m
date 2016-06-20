//
//  AppDelegate.m
//  FileTest
//
//  Created by MF839-014 on 2016. 6. 20..
//  Copyright © 2016년 MF839-014. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *curDir = [fileManager currentDirectoryPath];
    NSLog(@"Current dir = %@", curDir);
    
    NSArray *docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *docDir = [docDirs objectAtIndex: 0];
    NSLog(@"docDir = %@", docDir);
    
    
    if([fileManager changeCurrentDirectoryPath: docDir] == YES) {
        curDir = [fileManager currentDirectoryPath];
        NSLog(@"Current dir = %@", curDir);
    }
    
    
    NSString *tmpDir = NSTemporaryDirectory();
    NSLog(@"tmp dir = %@", tmpDir);
    
    
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:docDir error:NULL];
    NSLog(@"File List = %@", fileList);
    
    NSString *newDirName = @"Test";
    
    if([fileManager createDirectoryAtPath:newDirName withIntermediateDirectories:YES attributes:nil error:nil] == YES)
    {
        NSLog(@"폴더 생성");
    }
    
    fileList = [fileManager contentsOfDirectoryAtPath: docDir error:nil];
    NSLog(@"File List =%@", fileList);
    
    NSDictionary *attributes;
    attributes = [fileManager attributesOfItemAtPath: docDir error:nil];
    NSLog(@"파일 정보 %@", [attributes objectForKey:NSFileType]);
    
    NSArray *myArr1 = [NSArray arrayWithObjects:@"Test1", @"Test2", @"Test3", nil];
    NSArray *myArr2 = [NSArray arrayWithObjects:@"Test1", @"Test2", nil];
    
    NSString *fileName1 = [NSString stringWithFormat: @"%@%@", docDir, @"/arr1.xml"];
    NSString *fileName2 = [NSString stringWithFormat: @"%@%@", docDir, @"/arr2.xml"];

    [myArr1 writeToFile:fileName1 atomically:YES];
    [myArr2 writeToFile:fileName2 atomically:YES];
    
    NSString *newFileName1 = [NSString stringWithFormat:@"%@%@", docDir, @"/Test/array.xml"];
    
    if([fileManager moveItemAtPath:fileName1 toPath:newFileName1 error:nil] == YES) {
        NSLog(@"파일 이름 변경");
    }
    
    NSString *newFileName2 = [NSString stringWithFormat: @"%@%@", docDir, @"/Test/array2.xml"];
    
    if([fileManager copyItemAtPath:fileName2 toPath:newFileName2 error:nil] == YES) {
        NSLog(@"파일 복사");
    }
    
    if([fileManager fileExistsAtPath:newFileName2] == YES) {
        NSLog(@"파일 존재함");
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
