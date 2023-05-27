//
//  ProductViewModel.h
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "ImageDownloader.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ProductFetchDataDelegate <NSObject>

-(void)addProductInMutableArray: (Product *) product;

@end

@interface ProductViewModel : NSObject

-(void)fetchProductUsingJSON;

@property(nonatomic, weak, readwrite) id <ProductFetchDataDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
