//
//  WeatherTableViewCell.h
//  MyWeatherApplication
//
//  Created by Pankaj Gaikar on 24/12/14.
//  Copyright (c) 2014 Pankaj Gaikar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell
{
    
}
@property(nonatomic,weak)IBOutlet UILabel *humidityLablel;
@property(nonatomic,weak)IBOutlet UILabel *pressureLablel;
@property(nonatomic,weak)IBOutlet UILabel *speedLablel;
@property(nonatomic,weak)IBOutlet UILabel *degLablel;
@property(nonatomic,weak)IBOutlet UILabel *dayLablel;
@property(nonatomic,weak)IBOutlet UILabel *minLablel;
@property(nonatomic,weak)IBOutlet UILabel *maxLablel;
@property(nonatomic,weak)IBOutlet UILabel *mornLablel;
@property(nonatomic,weak)IBOutlet UILabel *eveLablel;
@property(nonatomic,weak)IBOutlet UILabel *nightLablel;
@property(nonatomic,weak)IBOutlet UILabel *weatherLablel;
@property(nonatomic,weak)IBOutlet UILabel *dateLablel;
@end
