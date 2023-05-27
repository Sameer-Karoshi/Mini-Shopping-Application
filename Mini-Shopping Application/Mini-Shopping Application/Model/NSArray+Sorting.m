//
//  NSArray_Sorting.m
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//

#import "NSArray+Sorting.h"

@implementation NSArray_Sorting

+(NSArray<Product *> *) sortProductsByPrice: (NSMutableArray<Product *>*) products {
    NSArray *sortedProductsByPriceArray = [products sortedArrayUsingComparator:^NSComparisonResult(Product *a, Product *b) {
        return [a.productPrice compare: b.productPrice];
    }];
    return sortedProductsByPriceArray;
}

+(NSArray<Product *> *) sortProductsByCategory: (NSMutableArray<Product *>*) products {
    NSArray *sortedProductsByCategoryArray = [products sortedArrayUsingComparator:^NSComparisonResult(Product *a, Product *b) {
        return [a.productCategory compare: b.productCategory];
    }];
    return sortedProductsByCategoryArray;
}

@end
