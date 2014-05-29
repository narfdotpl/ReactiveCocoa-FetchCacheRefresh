//
//  ExampleManager.h
//  ReactiveCocoa-FetchCacheRefresh
//
//  Created by Maciej Konieczny on 2014-05-29.
//


#import <Foundation/Foundation.h>

#import <ReactiveCocoa/ReactiveCocoa.h>



@interface ExampleManager : NSObject

- (RACSignal *)fetchNumber;
- (void)refreshNumber;

@end
