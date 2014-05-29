//
//  ExampleManager.m
//  ReactiveCocoa-FetchCacheRefresh
//
//  Created by Maciej Konieczny on 2014-05-29.
//


#import "ExampleManager.h"


@interface ExampleManager ()

@property (strong, nonatomic) NSNumber *everBiggerNumber;

@end



@implementation ExampleManager


#pragma mark - Public API


- (RACSignal *)fetchNumber
{
    NSLog(@"Performing potentially time-consuming fetch...");

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:self.everBiggerNumber];

        return [RACDisposable new];
    }];
}

- (void)refreshNumber
{
    NSLog(@"Performing refresh...");
    #warning TODO: implement `-refreshNumber`
}



#pragma mark - Private API


- (NSNumber *)everBiggerNumber
{
    if (!_everBiggerNumber) {
        _everBiggerNumber = @0;
    }

    _everBiggerNumber = @(_everBiggerNumber.integerValue + 1);

    return _everBiggerNumber;
}


@end
