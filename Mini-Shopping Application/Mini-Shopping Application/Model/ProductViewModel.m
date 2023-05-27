//
//  ProductViewModel.m
//  Mini-Shopping Application
//
//  Created by Sameer Karoshi on 23/05/23.
//

#import "ProductViewModel.h"

@implementation ProductViewModel 

-(void)fetchProductUsingJSON {
    // https://dummyjson.com/products
    NSString *urlString = @"https://dummyjson.com/products";
    NSURL *url = [NSURL URLWithString: urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *productsJSON = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &error];
        
        if (error) {
            return;
        }
        
        for (NSDictionary *productDictionary in productsJSON[@"products"]) {
            Product *product = Product.new;
            [ImageDownloader downloadProductImageWithURL:productDictionary[@"thumbnail"] completion:^(UIImage *image, NSError *error) {
                if (error) {
                    return;
                }
                product.productImage = image;
            }];
            product.productName = productDictionary[@"title"];
            product.productDescription = productDictionary[@"description"];
            product.productPrice = productDictionary[@"price"];
            product.productRating = productDictionary[@"rating"];
            product.productCategory = productDictionary[@"category"];
            [self.delegate addProductInMutableArray: product];
        }
    }] resume];
}
@end
