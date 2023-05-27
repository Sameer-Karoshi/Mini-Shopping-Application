//
//  Products.h
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject

@property (strong, nonatomic) UIImage *productImage;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productDescription;
@property (strong, nonatomic) NSString *productPrice;
@property (strong, nonatomic) NSString *productRating;
@property (strong, nonatomic) NSString *productCategory;

@end

NS_ASSUME_NONNULL_END
