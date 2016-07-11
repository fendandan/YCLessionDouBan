//
//  RequestUrl.h
//  LessionDouBan
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 liman. All rights reserved.
//

#ifndef RequestUrl_h
#define RequestUrl_h

// 活动列表
#define ActivityRequest_URL @"http://api.douban.com/v2/event/list?type=all&district=all&loc=108288&photo_cate=image&photo_count=5&start=0&day_type=future&apikey=062bcf31694a52d212836d943bdef876"
// 活动详情
#define ActivityDetailRequest_URL(ID) [NSString stringWithFormat:@"http://api.douban.com/v2/event/%@/photos?count=5&apikey=062bcf31694a52d212836d943bdef876",ID]

// 影院列表
#define TheaterRequest_URL @"http://115.28.227.1/teacher/yihuiyun/lanouproject/cinemalist.php"
// 影院详情

// 电影列表
#define MovieRequest_URL @"http://api.douban.com/v2/movie/nowplaying?app_name=doubanmovie&client=e:iPhone4,1%7Cy:iPhoneOS_6.1%7Cs:mobile%7Cf:doubanmovie_2%7Cv:3.3.1%7Cm:PP_market%7Cudid:aa1b815b8a4d1e961347304e74b9f9593d95e1c5&alt=json&city=%E5%8C%97%E4%BA%ACversion=2&start=0&apikey=0df993c66c0c636e29ecbb5344252a4a"
// 影片详情
#define MovieDetailRequest_URL(ID) [NSString stringWithFormat:@"http://api.douban.com/v2/movie/subject/%@?apikey=0df993c66c0c636e29ecbb5344252a4a",ID]

// 登录接口
#define LoginRequest_URL @"http://162.211.125.85/douban/user.php/DLogin"
// 注册接口
#define RegistRequest_URL @"http://162.211.125.85/douban/user.php/DRegister"


#endif /* RequestUrl_h */
