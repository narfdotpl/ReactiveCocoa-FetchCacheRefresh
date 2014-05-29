//
//  main.m
//  ReactiveCocoa-FetchCacheRefresh
//
//  Created by Maciej Konieczny on 2014-05-29.
//


#import <Foundation/Foundation.h>

#import "ExampleManager.h"



int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ExampleManager *manager = [ExampleManager new];

        [[manager fetchNumber] subscribeNext:^(NSNumber *number) {
            NSLog(@"Subscriber #1: %@", number);
        }];

        [[manager fetchNumber] subscribeNext:^(NSNumber *number) {
            NSLog(@"Subscriber #2: %@", number);
        }];

        [manager refreshNumber];

        [[manager fetchNumber] subscribeNext:^(NSNumber *number) {
            NSLog(@"Subscriber #3: %@", number);
        }];

        NSLog(@"Goodbye, World!");
    }

    return 0;
}

