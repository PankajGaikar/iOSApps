//
//  ViewController.m
//  MyWeatherApplication
//
//  Created by Pankaj Gaikar on 24/12/14.
//  Copyright (c) 2014 Pankaj Gaikar. All rights reserved.
//

#import "ViewController.h"
#import "WeatherTableViewCell.h"
#define kBASE_URL @"http://api.openweathermap.org/data/2.5/forecast/daily"
@interface ViewController ()
{
    IBOutlet UITableView *weatherTableView;
    NSDictionary *resultDict;
    NSArray *weatherArray;
}
@end

@implementation ViewController



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)getCityWeather:(NSString *)City
{
    
    NSString *cityURLString = [NSString stringWithFormat:@"%@?q=%@&mode=json&units=metric&cnt=14",kBASE_URL, City];
    NSURL *weatherURL = [NSURL URLWithString:cityURLString];
    NSLog(@"%@",weatherURL);
    NSData *weatherData = [NSData dataWithContentsOfURL:weatherURL];
    //  NSLog(@"%@ Weather NSDATA",WeatherData);
    NSDictionary  *weatherDictionary = [NSJSONSerialization JSONObjectWithData:weatherData options:NSJSONReadingMutableContainers error:Nil];
    if(weatherDictionary)
    {
        resultDict=weatherDictionary;
        if([resultDict valueForKey:@"list"])
        {
            weatherArray =[resultDict valueForKey:@"list"];
        }
        
    }
    [weatherTableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    if(searchBar.text.length>0)
        [self getCityWeather:searchBar.text];
}

#pragma mark -
#pragma mark UITableViewDelegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return weatherArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"WeatherCell";
    
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(weatherArray)
    {
        NSDictionary *weatherDict=[weatherArray objectAtIndex:indexPath.row];
        cell.humidityLablel.text=[[weatherDict valueForKey:@"humidity"] stringValue];
        cell.pressureLablel.text=[[weatherDict valueForKey:@"pressure"] stringValue];
        cell.speedLablel.text=[[weatherDict valueForKey:@"speed"] stringValue];
        cell.degLablel.text=[[weatherDict valueForKey:@"deg"] stringValue];
        NSDictionary *tempDict=[weatherDict valueForKey:@"temp"];
        if(tempDict)
        {
            cell.dayLablel.text=[[tempDict valueForKey:@"day"] stringValue];
            cell.eveLablel.text=[[tempDict valueForKey:@"eve"] stringValue];
            cell.maxLablel.text=[[tempDict valueForKey:@"max"] stringValue];
            cell.minLablel.text=[[tempDict valueForKey:@"min"] stringValue];
            cell.mornLablel.text=[[tempDict valueForKey:@"morn"] stringValue];
            cell.nightLablel.text=[[tempDict valueForKey:@"night"] stringValue];
            
        }
        NSArray *wArray=[weatherDict valueForKey:@"weather"];
        if(wArray && wArray.count>0)
        {
            NSDictionary *wDict=[wArray objectAtIndex:0];
            cell.weatherLablel.text=[wDict valueForKey:@"description"];
            
        }
        
        if([weatherDict valueForKey:@"dt"])
        {
            NSDate *lastUpdate = [[NSDate alloc] initWithTimeIntervalSince1970:[[weatherDict valueForKey:@"dt"] longLongValue]];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
            [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
            cell.dateLablel.text=[dateFormatter stringFromDate:lastUpdate];
        }
        
    }
    return cell;
    
}


@end
