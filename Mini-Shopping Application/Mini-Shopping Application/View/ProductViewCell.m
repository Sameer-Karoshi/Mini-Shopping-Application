//
//  ProductViewCell.m
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 22/05/23.
//

#import "ProductViewCell.h"

@implementation ProductViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed: 0 green: 0 blue: 0.5 alpha: 0.1];
        
        _productTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _productTitle.numberOfLines = 0;
        _productTitle.translatesAutoresizingMaskIntoConstraints = NO;
        [_productTitle setContentHuggingPriority: UILayoutPriorityDefaultHigh forAxis: UILayoutConstraintAxisVertical];
        [self.contentView addSubview:_productTitle];
        
        _productDescription = [[UILabel alloc] initWithFrame:CGRectZero];
        _productDescription.numberOfLines = 0;
        _productDescription.translatesAutoresizingMaskIntoConstraints = NO;
        [_productDescription setContentHuggingPriority: UILayoutPriorityDefaultHigh + 1 forAxis: UILayoutConstraintAxisVertical];
        [self.contentView addSubview:_productDescription];
        
        _productPrice = [[UILabel alloc] initWithFrame:CGRectZero];
        _productPrice.numberOfLines = 0;
        _productPrice.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_productPrice];
        
        _productRating = [[UILabel alloc] initWithFrame:CGRectZero];
        _productRating.numberOfLines = 0;
        _productRating.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_productRating];
        
        _productCategory = [[UILabel alloc] initWithFrame:CGRectZero];
        _productCategory.numberOfLines = 0;
        _productCategory.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_productCategory];
        
        _productImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _productImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_productImageView];
        
        _productViewCellInternalSpacing = 10.0;
        _productImageViewHeight = 80.0;
        _productImageViewWidth = 80.0;
        
        [self addConstraints];
    }
    return self;
}

-(void)addConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.productImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant: self.productViewCellInternalSpacing],
        [self.productImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant: self.productViewCellInternalSpacing],
        [self.productImageView.heightAnchor constraintEqualToConstant: self.productImageViewHeight],
        [self.productImageView.widthAnchor constraintEqualToConstant: self.productImageViewWidth],

        [self.productTitle.leadingAnchor constraintEqualToAnchor:self.productImageView.trailingAnchor constant: self.productViewCellInternalSpacing],
        [self.productTitle.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant: self.productViewCellInternalSpacing],
        [self.productTitle.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -self.productViewCellInternalSpacing],
        
        [self.productDescription.leadingAnchor constraintEqualToAnchor: self.productTitle.leadingAnchor],
        [self.productDescription.topAnchor constraintEqualToAnchor:self.productTitle.bottomAnchor constant: self.productViewCellInternalSpacing],
        [self.productDescription.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant: -self.productViewCellInternalSpacing],
        
        [self.productPrice.leadingAnchor constraintEqualToAnchor:self.productDescription.leadingAnchor],
        [self.productPrice.topAnchor constraintEqualToAnchor:self.productDescription.bottomAnchor constant: self.productViewCellInternalSpacing],
        [self.productPrice.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant: -self.productViewCellInternalSpacing],
        
        [self.productRating.leadingAnchor constraintEqualToAnchor:self.productPrice.trailingAnchor constant: self.productViewCellInternalSpacing],
        [self.productRating.topAnchor constraintEqualToAnchor:self.productDescription.bottomAnchor constant: self.productViewCellInternalSpacing],
        [self.productRating.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant: -self.productViewCellInternalSpacing],
        
        [self.productCategory.leadingAnchor constraintEqualToAnchor:self.productRating.trailingAnchor constant: self.productViewCellInternalSpacing],
        [self.productCategory.topAnchor constraintEqualToAnchor:self.productDescription.bottomAnchor constant: self.productViewCellInternalSpacing],
        [self.productCategory.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant: -self.productViewCellInternalSpacing],
    ]];
}

@end

