//
//  TheaterDetailViewController.m
//  LessionDouBan
//
//  Created by lanou3g on 16/6/30.
//  Copyright © 2016年 liman. All rights reserved.
//

#import "TheaterDetailViewController.h"

@interface TheaterDetailViewController ()<BMKGeoCodeSearchDelegate, BMKMapViewDelegate>

@property (strong, nonatomic) BMKMapView* mapView;

@property (strong, nonatomic) BMKGeoCodeSearch *searcher;

@end

@implementation TheaterDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    //设置代理
    _mapView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    //当不适用地图的时候,把代理设置为 nil
    _mapView.delegate = nil;
}
- (void)loadView {
    [super loadView];
    self.bbb = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    
 
    _mapView = [[BMKMapView alloc] init];
    _mapView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    _mapView.zoomLevel = 17; // 比例
    self.view = _mapView;

    
    //初始化检索对象
    _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    BMKGeoCodeSearchOption *geoCodeSearchOption = [[BMKGeoCodeSearchOption alloc]init];
    geoCodeSearchOption.city= @"北京市";
    geoCodeSearchOption.address = @"海淀区上地10街10号";
    BOOL flag = [_searcher geoCode:geoCodeSearchOption];
    if(flag)
    {
        YCLog(@"geo检索发送成功");
    }
    else
    {
        YCLog(@"geo检索发送失败");
    }
    
    
    
}

- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    YCLogFunc;
    // 大头针
    BMKPointAnnotation *pointAnnotation = [[BMKPointAnnotation alloc] init];
    pointAnnotation.coordinate = result.location;
    pointAnnotation.title = result.address;
    [_mapView addAnnotation:pointAnnotation];
    _mapView.centerCoordinate = result.location;
}
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    //当做大头针视图的标识符
    NSString *annotationViewID = @"annotationID";
    //根据标识符,查找一个可以复用的大头针
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
    //如果没有可复用的大头针,就创建一个新的大头针,并加上标识符
    //BMKPinAnnotationView 是BMKAnnotationView子类,添加了颜色以及一个动画效果
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationViewID];
        //下面两个是设置效果
        //设置颜色
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorRed;
        //设置动画效果(从天而降的动画效果)
        //        ((BMKPinAnnotationView *)annotationView).animatesDrop = YES;
    }
    
    annotationView.annotation = annotation;
    //设可以点击大头针弹出信息
    //    annotationView.canShowCallout = YES;
    return annotationView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
