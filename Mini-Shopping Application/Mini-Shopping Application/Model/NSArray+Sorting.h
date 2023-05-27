//
//  NSArray_Sorting.h
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//

#import <Foundation/Foundation.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSArray_Sorting : NSArray

+(NSArray<Product *> *) sortProductsByPrice: (NSMutableArray<Product *>*) products;
+(NSArray<Product *> *) sortProductsByCategory: (NSMutableArray<Product *>*) products;

@end

NS_ASSUME_NONNULL_END
