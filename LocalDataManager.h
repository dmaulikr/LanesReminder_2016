//
//  LocalDataManager.h
//  LanesReminder
//
//  Created by Sanjeev_Bharti on 5/8/16.
//  Copyright © 2016 Sanjeev_Bharti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseDataManager;


@interface LocalDataManager : NSObject

+ (instancetype)sharedManager;


@end
