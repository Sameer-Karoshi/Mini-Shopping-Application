//
//  ProductViewCell.h
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 22/05/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductViewCell : UITableViewCell

@property(nonatomic) UILabel *productTitle;
@property(nonatomic) UILabel *productDescription;
@property(nonatomic) UILabel *productPrice;
@property(nonatomic) UILabel *productRating;
@property(nonatomic) UILabel *productCategory;
@property(nonatomic) UIImageView *productImageView;

@property (nonatomic) float productViewCellInternalSpacing;
@property (nonatomic) float productImageViewHeight;
@property (nonatomic) float productImageViewWidth;

@end

NS_ASSUME_NONNULL_END
