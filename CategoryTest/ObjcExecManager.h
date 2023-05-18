//
//  ObjcExecManager.h
//  Test
//
//  Created by ME7O on 5/18/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjcExecManager : NSObject

@property (nonatomic, strong, readonly) NSMutableDictionary *loadLevelMap;


+ (instancetype)sharedManager;

- (void)updateClassListForKey:(NSString *)key;

- (NSArray *)classListForKey:(NSString *)cls;

- (NSString *)classNameForKey:(NSString *)key;

- (NSInteger)categoryLoadIdxForName:(NSString *)categoryName;

- (void)execCategoryClass:(NSString *)clsName sel:(NSString *)selName;

@end

NS_ASSUME_NONNULL_END
