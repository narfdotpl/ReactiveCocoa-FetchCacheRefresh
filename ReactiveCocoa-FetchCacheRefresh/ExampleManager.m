//
//  ExampleManager.m
//  ReactiveCocoa-FetchCacheRefresh
//
//  Created by Maciej Konieczny on 2014-05-29.
//


#import "ExampleManager.h"


@interface ExampleManager ()

@property (strong, nonatomic) RACSignal *fetchNumber;
@property (strong, nonatomic) NSNumber *everBiggerNumber;
@property (strong, nonatomic) NSNumber *memoizedNumber;

@end



@implementation ExampleManager


#pragma mark - Public API


- (RACSignal *)fetchNumber
{
    if (!_fetchNumber) {
        _fetchNumber = RACObserve(self, memoizedNumber);
        [self refreshNumber];
    }

    return _fetchNumber;
}

- (void)refreshNumber
{
    NSLog(@"Performing refresh...");
    [[self fetchNumberPrivate] subscribeNext:^(NSNumber *number) {
        self.memoizedNumber = number;
    }];
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

- (RACSignal *)fetchNumberPrivate
{
    NSLog(@"Performing potentially time-consuming fetch...");

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:self.everBiggerNumber];

        return [RACDisposable new];
    }];
}


@end
