<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String path=request.getContextPath();
request.setAttribute("path", path);%>
<%-- 
<html>
<head>
<meta charset="utf-8">
<title>咪咕音乐网_和你在一起</title>
<meta name="keywords"    content="咪咕音乐，彩铃，移动彩铃，手机彩铃，中国移动，12530，mp3，高品质音乐，无损音乐，在线听歌，歌曲下载，振铃，歌曲，铃音，特级会员，电台，mv，演唱会直播，音乐网站，音乐播放器" />
<meta name="description" content="咪咕音乐网是中国移动官方音乐门户，旨在提供音乐首发、高品质音乐试听、彩铃订购、歌曲下载、铃音管理、音乐电台、音乐视频等一站式音乐互动体验，好音乐尽在music.migu.cn！" />
<link rel="stylesheet" href="${path}/Style/global.min.css"/>
<style>
body{color:gray}.main_swap{width:1100px;height:auto;margin:40px auto 20px}.g_glo{width:1100px;height:310px;padding:20px 0;border-bottom:1px solid #e4e5e6;border-top:1px solid #fbfcfd}.g_glo .sider{float:right;width:250px}.g_0{border-top:0;padding-top:0;height:340px}.g_1{height:210px}.g_2{height:370px}.g_3{height:190px}.g_4{height:340px;padding-bottom:0}.g_rank{float:right;width:250px;height:340px;background:#2e3235}.g_rank .mod_song_list li{background:#494e53;border-bottom:1px solid #3a3e42;margin:0}.g_rank .mod_song_list li:hover{background:#393e42}.g_rank .mod_song_list li .song_name{margin:0 2px 0 10px}.g_rank .mod_song_list li .singer_name{margin-left:2px}.g_rank .mod_song_list li .num{background:none;color:#a0a0a0}.g_rank .mod_song_list li a{color:#b9c2ca;font-size:12px}.g_rank .mod_song_list li a:hover{color:#458fce;text-decoration:none}.g_rank .mod_song_list li .song_name{width:auto}.g_rank .icon_tools{margin-right:5px}.m_tabs_03{background:url(${path}/Images/sprt_index.png) no-repeat 0 -301px;display:inline-block;text-indent:-9993em;overflow:hidden;width:250px;height:40px}.m_tabs_03 li{display:block;width:125px;height:40px;float:left;cursor:pointer}.g_rank .cur{background-position:0 -341px}.g_rank .news{padding:10px;float:left;position:relative}.g_rank .news .post .cover{float:left;margin-right:10px}.g_rank .news .post img{width:60px;height:60px}.g_rank .news .post .name{color:#458fce}.g_rank .news .post_info{width:150px;float:left}.m_news_list{float:left;overflow:hidden}.m_news_list li{float:left;margin:5px 0;width:100%;clear:both}.m_news_list li a{color:#b9c2ca}.g_rank .tools{height:39px;padding:0 10px;line-height:39px;background:#494e53;color:#ffecc2;border-bottom:1px solid #3a3e42;margin:0}.g_rank .tools a{color:#fff;background:#458fce;display:inline-block;padding:2px 5px;height:20px;line-height:20px}.g_rank .tools a:hover{text-decoration:underline}.g_rank em{color:#f90}.g_rank .flag_info{background:url(${path}/Images/sprt.png) no-repeat -80px -325px;display:inline-block;zoom:1;width:40px;height:40px;position:absolute;top:-1px;left:0}.g_xgsf{float:left;width:840px;position:relative}.g_xgsf ul{margin-top:20px}.g_xgsf .tools{background:0}.g_xgsf .tools .play{display:none}.g_xgsf li{position:relative}.g_xgsf .flag{background:url(${path}/Images/sprt.png) no-repeat -122px -325px;display:inline-block;zoom:1;width:33px;height:35px;position:absolute;top:-4px;right:5px;color:#fff;padding-left:4px;padding-top:3px;line-height:12px}.g_xgsf li:hover .play{display:block}.g_xgsf .mod_list{overflow:visible}.g_mrzd{float:right;width:250px;height:215px}.g_mrzd .post{line-height:20px}.g_mrzd .post .post_info{float:right;width:145px;height:80px;overflow:hidden}.g_mrzd .post .post_info a{color:#458fce}.g_mrzd .post .post_info a.name{font-size:14px;font-weight:700}.g_mrzd .tools a{margin-right:1px}.g_szyyb{width:390px;float:left;position:relative}.g_szyyb .mod_song_list{margin-top:18px}.g_szyyb .tools a,.g_tsphb .tools a{margin-right:5px}.g_tsphb{width:390px;float:left;margin-left:40px;position:relative}.g_tsphb .mod_song_list{margin-top:18px}.g_gxcl ul{float:left;width:100%;overflow:hidden;margin-top:20px}.g_gxcl ul li{margin:2px 0;height:25px;line-height:25px;clear:both;cursor:default;float:left;width:100%}.g_gxcl ul li a{color:#458fce;margin:0 5px}.g_gxcl ul li .sprt{margin-top:2px}.g_gxcl ul li.shadow{background-color:#eaecee}.g_mvtj{float:left;width:840px;position:relative}.g_mvtj ul{margin-top:20px}.g_mvtj .mod_list li{width:150px;height:145px;margin:0 18px 0 0}.g_mvtj .mod_list li .mod_poster,.g_mvtj .mod_list li .mod_poster img{width:150px;height:100px}.g_lyh{float:right;width:250px;height:215px}.g_lyh .post{line-height:20px;clear:both;float:left;width:100%}.g_lyh .post p span{width:75px;overflow:hidden;margin-right:3px;height:20px;line-height:20px;display:block;float:left}.g_lyh .post .post_info{float:right;width:175px;overflow:hidden}.g_lyh .post .post_info a{color:#458fce;cursor:pointer;text-decoration:none}.g_lyh .post .post_info a.sprt:hover{background-position:0 -1044px}.g_lyh .post img{width:65px;hegiht:65px}.g_lyh .post .post_info a.name{font-size:14px;font-weight:700}.g_lyh .post p{margin-top:2px;width:165px;padding:2px 5px;float:left;background-color:#eff1f3}.g_lyh .post p a{float:left;color:#999 !important;width:80px}.g_gdtuj{float:left;width:840px;position:relative}.g_gdtuj .m_tabs_item{margin-top:20px;width:560px;padding-left:280px;float:left;position:relative;overflow:hidden}.g_gdtuj .post_big{position:absolute;left:0;top:0;width:260px !important;height:300px !important;z-index:9}.g_gdtuj .post_big .mod_poster,.g_gdtuj .post_big .mod_poster img{width:260px;height:270px}.g_gdtuj .mod_list{width:560px}.g_gdtuj .mod_list li{height:150px}.g_gdtuj .tabs_01_swap{height:330px}.g_yyzt{float:right;width:250px;overflow:hidden}.g_yyzt .post{float:left;width:100%;overflow:hidden}.g_yyzt .post li{border-top:1px dashed #ccc;line-height:24px;padding-top:10px;padding-bottom:11px;width:100%;float:left;position:relative}.g_yyzt .post li .sprt{text-align:center;color:#458FCE;font-family:'Microsoft YaHei';}.g_yyzt .post a{color:#161616}.g_yyzt .post_big,.g_yyzt .post_big_2{float:left;width:250px;height:90px;margin-top:10px !important;border-top:0!important;position:relative;text-indent:0 !important;line-height:22px !important}.g_yyzt .post_big{border:none !important;padding:0 !important;margin-bottom:10px !important}.g_yyzt .post_big img{width:250px;height:90px}.g_yyzt .post_big p{position:absolute;bottom:0;left:0;height:30px;line-height:30px;width:100%;background:url(${path}/Images/sprt.png) repeat-x 0 -1808px;text-align:center;color:#fff}.g_yyzt .post_big_2 img{width:90px;height:90px}.g_yyzt .post_big_2 .jxj_intro{width:150px;height:90px}.g_yyzt .post_big_2 .jxj_intro a{display:block;width:100%}.g_yyzt .post_big_2 .jxj_intro .jxj_tit{font-size:14px;font-weight:700}.m_banner{float:left;width:820px}.m_banner_con{
    position: relative;
    overflow: hidden;
    width: 820px;
    height: 340px;
    background-image: url(${path}/Images/4bfe38ac-eac4-4286-b502-544b69274efb.jpg_RsT_820x340.jpg);
}.m_banner_con .preload{height:100%;width:100%;position:absolute;top:0;left:0;z-index:100000;text-align:center;background:#FFF}.m_banner_wapper{width:100%;height:340px;padding:0;margin:0;float:left;overflow:hidden}.m_banner_wapper li{display:none;overflow:hidden;margin:0;float:left;position:relative}.m_banner_wapper li,ul.m_banner_wapper li img{width:820px;height:340px;padding:0}.m_banner_desc{z-index:100px;position:absolute;bottom:0;left:0;width:100%;height:30px;padding:10px 0;background:url(${path}/Images/sprt_index.png) repeat-x 0 -386px}.m_banner_desc p{color:#fff;font-size:22px;line-height:30px;font-weight:400;text-indent:15px;font-family:'Hiragino Sans GB',"Microsoft YaHei"}.m_banner_navigator_wapper{float:left;height:10px;position:absolute;right:20px;bottom:20px}.m_banner_navigator li{position:relative;cursor:pointer;list-style:none;margin-left:5px;height:10px;width:10px;float:left;display:block;text-align:center}.m_banner_next,.m_banner_pre{position:absolute;display:block;cursor:pointer;bottom:150px;z-index:9}.m_banner_navigator li.active{background-position:0 -416px !important}.m_banner_next{right:0}.m_banner_pre{left:0}.sprt_index{background:url(${path}/Images/sprt_index.png) no-repeat;display:inline-block;text-indent:-9993em;overflow:hidden}.sprt_index_title_gdtj{background-position:0 0;width:98px;height:25px}.sprt_index_title_gxcl{background-position:0 -30px;width:97px;height:25px}.sprt_index_title_lybq{background-position:0 -60px;width:99px;height:25px}.sprt_index_title_lyh{background-position:0 -90px;width:80px;height:25px}.sprt_index_title_mrzd{background-position:0 -120px;width:96px;height:25px}.sprt_index_title_mvtj{background-position:0 -150px;width:83px;height:25px}.sprt_index_title_yyphb{background-position:0 -180px;width:185px;height:25px}.sprt_index_title_yyxgb{background-position:-186px -180px;width:185px;height:25px}.sprt_index_title_tsphb{background-position:0 -210px;width:123px;height:25px}.sprt_index_title_xgsf{background-position:0 -240px;width:108px;height:25px}.sprt_index_title_yyzt{background-position:0 -270px;width:97px;height:25px}.sprt_index_title_jxj{background-position:-130px -90px;width:75px;height:25px}.layoutBg{background:url(${path}/Images/alphabg.png);display:none;position:absolute;left:0;top:0;width:100%;z-index:10000}#followMeLayout{display:none;left:0;position:absolute;top:0;width:100%;z-index:10001}#followMe{left:50%;margin-left:-550px;position:absolute;top:0;width:1100px}#follow01{display:none;height:270px;position:absolute;right:0;top:70px;width:347px;z-index:10006}#follow01continue{cursor:pointer;height:30px;left:90px;position:absolute;top:220px;width:70px;z-index:10100}#follow01shut{cursor:pointer;height:30px;left:189px;position:absolute;top:220px;width:70px;z-index:10100}#followStep1mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow01bg{background:url(${path}/Images/guide/follow01.png) no-repeat;display:none;height:270px;position:absolute;right:0;top:80px;width:347px;z-index:10002}#followStep1{background:#fff;color:#c7c7c7;position:absolute;right:10px;top:50px;z-index:10004}#follow02{display:none;height:172px;position:absolute;right:130px;top:116px;width:597px;z-index:10006}#follow02continue{cursor:pointer;height:27px;left:92px;position:absolute;top:115px;width:66px;z-index:10100}#follow02shut{cursor:pointer;height:27px;left:189px;position:absolute;top:115px;width:66px;z-index:10100}#followStep2mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow02bg{background:url(${path}/Images/guide/follow02.png) no-repeat;display:none;height:172px;position:absolute;right:130px;top:116px;width:597px;z-index:10002}#followStep2{background:#fff;color:#c7c7c7;position:absolute;right:0;top:180px;z-index:10000}#follow03{display:none;height:270px;position:absolute;right:608px;top:140px;width:349px;z-index:10006}#follow03continue{cursor:pointer;height:27px;left:93px;position:absolute;top:210px;width:66px;z-index:10100}#follow03shut{cursor:pointer;height:27px;left:192px;position:absolute;top:210px;width:66px;z-index:10100}#followStep3mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow03bg{background:url(${path}/Images/guide/follow03.png) no-repeat;display:none;height:270px;position:absolute;right:608px;top:140px;width:349px;z-index:10002}#followStep3{background:#fff;color:#c7c7c7;position:absolute;right:590px;top:100px;z-index:10000}#follow04{display:none;height:269px;position:absolute;left:0;top:915px;width:565px;z-index:10006}#follow04continue{cursor:pointer;height:27px;left:200px;position:absolute;top:210px;width:66px;z-index:10100}#follow04shut{cursor:pointer;height:27px;left:267px;position:absolute;top:210px;width:66px;z-index:10100}#followStep4mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow04bg{background:url(${path}/Images/guide/follow04.png) no-repeat;display:none;height:269px;position:absolute;left:0;top:915px;width:565px;z-index:10002}#followStep4{background:#fff;color:#c7c7c7;position:absolute;left:322px;top:887px;z-index:10000}#follow05{display:none;height:276px;position:fixed;right:5px;bottom:60px;width:570px;z-index:10006}#follow05continue{cursor:pointer;height:27px;left:170px;position:absolute;top:210px;width:66px;z-index:10100}#follow05shut{cursor:pointer;height:27px;left:300px;position:absolute;top:116px;width:217px;z-index:10100}#follow05_start{cursor:pointer;height:27px;left:125px;position:absolute;top:116px;width:320px;z-index:10100}#followStep5mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow05bg{background:url(${path}/Images/guide/follow05_temp.png) no-repeat;display:none;height:276px;position:fixed;right:5px;bottom:60px;width:570px;z-index:10002}#followStep5{background:#fff;color:#c7c7c7;position:absolute;left:325px;top:887px;z-index:10000}.sprt_ico_fankong { display: inline-block; background: url(${path}/Images/sprt.png) -200px -1500px no-repeat;width: 38px; height: 38px;*zoom: 1;}.sprt_ico_fankong:hover { background-position: -200px -1540px; }.tabs_01_swap {position: relative;float: left;overflow: hidden;width: 840px;height: 200px;}.g_xgsf .tabs_01_swap .tabs_01_con .mod_list li{ height:200px !important;}

</style>
</head>
<body> --%>
<script type="text/javascript" src="${path}/Script/common.js"></script>
<style>
body{color:gray}.main_swap{width:1100px;height:auto;margin:40px auto 20px}.g_glo{width:1100px;height:310px;padding:20px 0;border-bottom:1px solid #e4e5e6;border-top:1px solid #fbfcfd}.g_glo .sider{float:right;width:250px}.g_0{border-top:0;padding-top:0;height:340px}.g_1{height:210px}.g_2{height:370px}.g_3{height:190px}.g_4{height:340px;padding-bottom:0}.g_rank{float:right;width:250px;height:340px;background:#2e3235}.g_rank .mod_song_list li{background:#494e53;border-bottom:1px solid #3a3e42;margin:0}.g_rank .mod_song_list li:hover{background:#393e42}.g_rank .mod_song_list li .song_name{margin:0 2px 0 10px}.g_rank .mod_song_list li .singer_name{margin-left:2px}.g_rank .mod_song_list li .num{background:none;color:#a0a0a0}.g_rank .mod_song_list li a{color:#b9c2ca;font-size:12px}.g_rank .mod_song_list li a:hover{color:#458fce;text-decoration:none}.g_rank .mod_song_list li .song_name{width:auto}.g_rank .icon_tools{margin-right:5px}.m_tabs_03{background:url(${path}/Images/sprt_index.png) no-repeat 0 -301px;display:inline-block;text-indent:-9993em;overflow:hidden;width:250px;height:40px}.m_tabs_03 li{display:block;width:125px;height:40px;float:left;cursor:pointer}.g_rank .cur{background-position:0 -341px}.g_rank .news{padding:10px;float:left;position:relative}.g_rank .news .post .cover{float:left;margin-right:10px}.g_rank .news .post img{width:60px;height:60px}.g_rank .news .post .name{color:#458fce}.g_rank .news .post_info{width:150px;float:left}.m_news_list{float:left;overflow:hidden}.m_news_list li{float:left;margin:5px 0;width:100%;clear:both}.m_news_list li a{color:#b9c2ca}.g_rank .tools{height:39px;padding:0 10px;line-height:39px;background:#494e53;color:#ffecc2;border-bottom:1px solid #3a3e42;margin:0}.g_rank .tools a{color:#fff;background:#458fce;display:inline-block;padding:2px 5px;height:20px;line-height:20px}.g_rank .tools a:hover{text-decoration:underline}.g_rank em{color:#f90}.g_rank .flag_info{background:url(${path}/Images/sprt.png) no-repeat -80px -325px;display:inline-block;zoom:1;width:40px;height:40px;position:absolute;top:-1px;left:0}.g_xgsf{float:left;width:840px;position:relative}.g_xgsf ul{margin-top:20px}.g_xgsf .tools{background:0}.g_xgsf .tools .play{display:none}.g_xgsf li{position:relative}.g_xgsf .flag{background:url(${path}/Images/sprt.png) no-repeat -122px -325px;display:inline-block;zoom:1;width:33px;height:35px;position:absolute;top:-4px;right:5px;color:#fff;padding-left:4px;padding-top:3px;line-height:12px}.g_xgsf li:hover .play{display:block}.g_xgsf .mod_list{overflow:visible}.g_mrzd{float:right;width:250px;height:215px}.g_mrzd .post{line-height:20px}.g_mrzd .post .post_info{float:right;width:145px;height:80px;overflow:hidden}.g_mrzd .post .post_info a{color:#458fce}.g_mrzd .post .post_info a.name{font-size:14px;font-weight:700}.g_mrzd .tools a{margin-right:1px}.g_szyyb{width:390px;float:left;position:relative}.g_szyyb .mod_song_list{margin-top:18px}.g_szyyb .tools a,.g_tsphb .tools a{margin-right:5px}.g_tsphb{width:390px;float:left;margin-left:40px;position:relative}.g_tsphb .mod_song_list{margin-top:18px}.g_gxcl ul{float:left;width:100%;overflow:hidden;margin-top:20px}.g_gxcl ul li{margin:2px 0;height:25px;line-height:25px;clear:both;cursor:default;float:left;width:100%}.g_gxcl ul li a{color:#458fce;margin:0 5px}.g_gxcl ul li .sprt{margin-top:2px}.g_gxcl ul li.shadow{background-color:#eaecee}.g_mvtj{float:left;width:840px;position:relative}.g_mvtj ul{margin-top:20px}.g_mvtj .mod_list li{width:150px;height:145px;margin:0 18px 0 0}.g_mvtj .mod_list li .mod_poster,.g_mvtj .mod_list li .mod_poster img{width:150px;height:100px}.g_lyh{float:right;width:250px;height:215px}.g_lyh .post{line-height:20px;clear:both;float:left;width:100%}.g_lyh .post p span{width:75px;overflow:hidden;margin-right:3px;height:20px;line-height:20px;display:block;float:left}.g_lyh .post .post_info{float:right;width:175px;overflow:hidden}.g_lyh .post .post_info a{color:#458fce;cursor:pointer;text-decoration:none}.g_lyh .post .post_info a.sprt:hover{background-position:0 -1044px}.g_lyh .post img{width:65px;hegiht:65px}.g_lyh .post .post_info a.name{font-size:14px;font-weight:700}.g_lyh .post p{margin-top:2px;width:165px;padding:2px 5px;float:left;background-color:#eff1f3}.g_lyh .post p a{float:left;color:#999 !important;width:80px}.g_gdtuj{float:left;width:840px;position:relative}.g_gdtuj .m_tabs_item{margin-top:20px;width:560px;padding-left:280px;float:left;position:relative;overflow:hidden}.g_gdtuj .post_big{position:absolute;left:0;top:0;width:260px !important;height:300px !important;z-index:9}.g_gdtuj .post_big .mod_poster,.g_gdtuj .post_big .mod_poster img{width:260px;height:270px}.g_gdtuj .mod_list{width:560px}.g_gdtuj .mod_list li{height:150px}.g_gdtuj .tabs_01_swap{height:330px}.g_yyzt{float:right;width:250px;overflow:hidden}.g_yyzt .post{float:left;width:100%;overflow:hidden}.g_yyzt .post li{border-top:1px dashed #ccc;line-height:24px;padding-top:10px;padding-bottom:11px;width:100%;float:left;position:relative}.g_yyzt .post li .sprt{text-align:center;color:#458FCE;font-family:'Microsoft YaHei';}.g_yyzt .post a{color:#161616}.g_yyzt .post_big,.g_yyzt .post_big_2{float:left;width:250px;height:90px;margin-top:10px !important;border-top:0!important;position:relative;text-indent:0 !important;line-height:22px !important}.g_yyzt .post_big{border:none !important;padding:0 !important;margin-bottom:10px !important}.g_yyzt .post_big img{width:250px;height:90px}.g_yyzt .post_big p{position:absolute;bottom:0;left:0;height:30px;line-height:30px;width:100%;background:url(${path}/Images/sprt.png) repeat-x 0 -1808px;text-align:center;color:#fff}.g_yyzt .post_big_2 img{width:90px;height:90px}.g_yyzt .post_big_2 .jxj_intro{width:150px;height:90px}.g_yyzt .post_big_2 .jxj_intro a{display:block;width:100%}.g_yyzt .post_big_2 .jxj_intro .jxj_tit{font-size:14px;font-weight:700}.m_banner{float:left;width:820px}.m_banner_con{
    position: relative;
    overflow: hidden;
    width: 820px;
    height: 340px;
    background-image: url(${path}/Images/4bfe38ac-eac4-4286-b502-544b69274efb.jpg_RsT_820x340.jpg);
}.m_banner_con .preload{height:100%;width:100%;position:absolute;top:0;left:0;z-index:100000;text-align:center;background:#FFF}.m_banner_wapper{width:100%;height:340px;padding:0;margin:0;float:left;overflow:hidden}.m_banner_wapper li{display:none;overflow:hidden;margin:0;float:left;position:relative}.m_banner_wapper li,ul.m_banner_wapper li img{width:820px;height:340px;padding:0}.m_banner_desc{z-index:100px;position:absolute;bottom:0;left:0;width:100%;height:30px;padding:10px 0;background:url(${path}/Images/sprt_index.png) repeat-x 0 -386px}.m_banner_desc p{color:#fff;font-size:22px;line-height:30px;font-weight:400;text-indent:15px;font-family:'Hiragino Sans GB',"Microsoft YaHei"}.m_banner_navigator_wapper{float:left;height:10px;position:absolute;right:20px;bottom:20px}.m_banner_navigator li{position:relative;cursor:pointer;list-style:none;margin-left:5px;height:10px;width:10px;float:left;display:block;text-align:center}.m_banner_next,.m_banner_pre{position:absolute;display:block;cursor:pointer;bottom:150px;z-index:9}.m_banner_navigator li.active{background-position:0 -416px !important}.m_banner_next{right:0}.m_banner_pre{left:0}.sprt_index{background:url(${path}/Images/sprt_index.png) no-repeat;display:inline-block;text-indent:-9993em;overflow:hidden}.sprt_index_title_gdtj{background-position:0 0;width:98px;height:25px}.sprt_index_title_gxcl{background-position:0 -30px;width:97px;height:25px}.sprt_index_title_lybq{background-position:0 -60px;width:99px;height:25px}.sprt_index_title_lyh{background-position:0 -90px;width:80px;height:25px}.sprt_index_title_mrzd{background-position:0 -120px;width:96px;height:25px}.sprt_index_title_mvtj{background-position:0 -150px;width:83px;height:25px}.sprt_index_title_yyphb{background-position:0 -180px;width:185px;height:25px}.sprt_index_title_yyxgb{background-position:-186px -180px;width:185px;height:25px}.sprt_index_title_tsphb{background-position:0 -210px;width:123px;height:25px}.sprt_index_title_xgsf{background-position:0 -240px;width:108px;height:25px}.sprt_index_title_yyzt{background-position:0 -270px;width:97px;height:25px}.sprt_index_title_jxj{background-position:-130px -90px;width:75px;height:25px}.layoutBg{background:url(${path}/Images/alphabg.png);display:none;position:absolute;left:0;top:0;width:100%;z-index:10000}#followMeLayout{display:none;left:0;position:absolute;top:0;width:100%;z-index:10001}#followMe{left:50%;margin-left:-550px;position:absolute;top:0;width:1100px}#follow01{display:none;height:270px;position:absolute;right:0;top:70px;width:347px;z-index:10006}#follow01continue{cursor:pointer;height:30px;left:90px;position:absolute;top:220px;width:70px;z-index:10100}#follow01shut{cursor:pointer;height:30px;left:189px;position:absolute;top:220px;width:70px;z-index:10100}#followStep1mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow01bg{background:url(${path}/Images/guide/follow01.png) no-repeat;display:none;height:270px;position:absolute;right:0;top:80px;width:347px;z-index:10002}#followStep1{background:#fff;color:#c7c7c7;position:absolute;right:10px;top:50px;z-index:10004}#follow02{display:none;height:172px;position:absolute;right:130px;top:116px;width:597px;z-index:10006}#follow02continue{cursor:pointer;height:27px;left:92px;position:absolute;top:115px;width:66px;z-index:10100}#follow02shut{cursor:pointer;height:27px;left:189px;position:absolute;top:115px;width:66px;z-index:10100}#followStep2mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow02bg{background:url(${path}/Images/guide/follow02.png) no-repeat;display:none;height:172px;position:absolute;right:130px;top:116px;width:597px;z-index:10002}#followStep2{background:#fff;color:#c7c7c7;position:absolute;right:0;top:180px;z-index:10000}#follow03{display:none;height:270px;position:absolute;right:608px;top:140px;width:349px;z-index:10006}#follow03continue{cursor:pointer;height:27px;left:93px;position:absolute;top:210px;width:66px;z-index:10100}#follow03shut{cursor:pointer;height:27px;left:192px;position:absolute;top:210px;width:66px;z-index:10100}#followStep3mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow03bg{background:url(${path}/Images/guide/follow03.png) no-repeat;display:none;height:270px;position:absolute;right:608px;top:140px;width:349px;z-index:10002}#followStep3{background:#fff;color:#c7c7c7;position:absolute;right:590px;top:100px;z-index:10000}#follow04{display:none;height:269px;position:absolute;left:0;top:915px;width:565px;z-index:10006}#follow04continue{cursor:pointer;height:27px;left:200px;position:absolute;top:210px;width:66px;z-index:10100}#follow04shut{cursor:pointer;height:27px;left:267px;position:absolute;top:210px;width:66px;z-index:10100}#followStep4mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow04bg{background:url(${path}/Images/guide/follow04.png) no-repeat;display:none;height:269px;position:absolute;left:0;top:915px;width:565px;z-index:10002}#followStep4{background:#fff;color:#c7c7c7;position:absolute;left:322px;top:887px;z-index:10000}#follow05{display:none;height:276px;position:fixed;right:5px;bottom:60px;width:570px;z-index:10006}#follow05continue{cursor:pointer;height:27px;left:170px;position:absolute;top:210px;width:66px;z-index:10100}#follow05shut{cursor:pointer;height:27px;left:300px;position:absolute;top:116px;width:217px;z-index:10100}#follow05_start{cursor:pointer;height:27px;left:125px;position:absolute;top:116px;width:320px;z-index:10100}#followStep5mask{background:#fff;display:none;opacity:0;position:absolute;right:10px;top:50px;width:83px;z-index:10002;height:32px}#follow05bg{background:url(${path}/Images/guide/follow05_temp.png) no-repeat;display:none;height:276px;position:fixed;right:5px;bottom:60px;width:570px;z-index:10002}#followStep5{background:#fff;color:#c7c7c7;position:absolute;left:325px;top:887px;z-index:10000}.sprt_ico_fankong { display: inline-block; background: url(${path}/Images/sprt.png) -200px -1500px no-repeat;width: 38px; height: 38px;*zoom: 1;}.sprt_ico_fankong:hover { background-position: -200px -1540px; }.tabs_01_swap {position: relative;float: left;overflow: hidden;width: 840px;height: 200px;}.g_xgsf .tabs_01_swap .tabs_01_con .mod_list li{ height:200px !important;}

</style>
<div class="head">
<style>.btm_bar_info{display:block}/*修复回复评论时间信息位置bug*/</style>
<div class="head_swap" style="position:relative">
    <div class="head_top">
        <span class="slogan fl"><a href="http://music.migu.cn">中国移动旗下音乐门户</a>| <a href="http://www.10086.cn/web_notice/navigation/" target="_blank">集团产品</a>|<a href="javascript:;" class="ml5 setHome_index">设为首页</a>| <a href="javascript:;" class="ml5 addFav_index">加入收藏</a> </span>
         <ul class="login fr m0" id ="web_login">
             <li><em class="sprt sprt_icon_user"></em><a href="javascript:;" id="a_login"  class="mr5">登录</a><span class="line">| </span><a href="javascript:;" target="_blank" id="a_register">注册</a></li>
         <li><em class="sprt sprt_icon_memmber"></em><a href="http://music.migu.cn/#/ringmonth/184_114.html" id ="a_usercenter" >会员</a></li>
         </ul>
    </div>
    <div class="head_mid">
         <a class="logo sprt sprt_icon_logo fl mt10" title="咪咕音乐" href="http://music.migu.cn">咪咕音乐</a>
         <div class="search_bar_wrap">
         <div class="search fl f-pr" id="searchBar1">
              <div class="nui-ipt fl"><input class="nui-ipt-input" type="text" autocomplete="off"   tabindex="1" maxlength="256" value='岁月缝花(小时代4灵魂尽头片尾曲)' style="color: gray;"/></div>
              <input class="nui-ipt-btn sprt sprt_icon_search fl" type="button" autocomplete="off"  tabindex="1" maxlength="256" />
         </div>
              <a href = "javascript:;" class="fl sprt sprt_btn_ktmghy fl ml20"></a><a href="javascript:;" class="fl sprt sprt_btn_lyk fl ml10 ring_manage"></a>
         </div>
    </div>
    <div class="nav">
        <ul>
            <li><a class="list" href="http://music.migu.cn">首页</a></li>
            <li><a class="list" href="http://music.migu.cn/#/color/184_61.html">彩铃</a>
            <ul style="left: -36px; display: none; width:500px;">
                  <li><a class="list" href="http://music.migu.cn/#/color/184_61.html">彩铃推荐</a></li>
                  <li><a class="list" href="http://music.migu.cn/personality/index.html" target="_blank">个性彩铃</a></li>
                  <!--<li><a class="list" href="http://music.migu.cn/html/external/quanzicailing.html" target="_blank">圈子彩铃</a></li>-->
                  <li><a class="list" href="http://music.migu.cn/lyh/184_1007.html" target="_blank">铃音盒</a></li>
                          <li><a class="list" href="http://music.migu.cn/#/zhuanti/184_1493.html" target="_blank">彩铃DIY</a></li> 
            </ul>
            </li>
            <li><a class="list" href="http://music.migu.cn/#/singer">乐库</a>
                <ul style="left: -36px; display: none; ">
                <li><a class="list" href="http://music.migu.cn/#/tag">分类</a></li>
                <li><a class="list" href="http://music.migu.cn/#/album">专辑</a></li>
                <li><a class="list" href="http://music.migu.cn/#/singer">歌手</a></li>
                            <li><a class="list" href="http://music.migu.cn/#/ualbum/184_1345.html">精选集</a></li>
            </ul>
             </li>                  
             <li><a class="list" href="http://music.migu.cn/#/rank/184_76.html">排行榜</a></li>
             <li><a class="list" href="http://fm.migu.cn" target="_blank">电台</a></li>
             <li><a class="list" href="http://music.migu.cn/mv/184_1472.html" target="_blank">视频</a>
                <ul style="left: -14px; display: none; ">
                <li><a class="list" href="http://music.migu.cn/mv/184_1472.html" target="_blank">MV</a></li>
                <li><a class="list" href="http://music.migu.cn/mv/184_2275.html" target="_blank">咪咕现场</a></li>
             </ul>
             <li><a class="list" href="http://music.migu.cn/zhuanti/184_62.html" target="_blank">专题</a></li>
             <li><a class="list" href="http://mclub.migu.cn" target="_blank">社区</a>
             <ul style="left: -86px; display: none; ">
             
                     <li><a class="list" href="http://mclub.migu.cn/mxxz.php" target="_blank">音乐人小站</a></li>
                     <li><a class="list" href="http://mclub.migu.cn/club.php" target="_blank">咪咕小组</a></li>
                     <li><a class="list" href="http://music.migu.cn/#/ringmonth/184_114.html">会员</a></li>
                  </ul>
              </li>
<li class="list"> 
<a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html">大剧院</a> 
<ul style="width:500px;left:-235px;"> 
<li><a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html#ycsk_djy">演出实况</a></li> 
<li><a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html#gdcl_djy">古典彩铃</a></li> 
<li><a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html#ycsd_djy">演出速递</a></li> 
<li><a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html#tqmh_djy">台前幕后</a></li> 
<li><a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html#gdyyrm_djy">古典音乐入门</a></li> 
<li><a  target="_top" class="list" href="http://music.migu.cn/gjdjy/184_2511.html#hyzq_djy">会员专区</a></li> 
</ul> 
</li> 
        </ul>
        <ul class="sub_nav">
            <li class=""><em class="sprt sprt_icon_origin ml20"></em><a href="http://i.migu.cn" target="_blank">原创</a></li>
            <li class=""><em class="sprt sprt_icon_sing ml20"></em><a href="http://music.migu.cn/ringmonth/184_1042.html" target="_blank">客户端</a></li>
            <li class=""><em class="sprt sprt_icon_download ml20"></em><a href="http://open.migu.cn?loc=P9Z1Y1L3N12&locno=1" target="_blank">开放合作</a></li> 
            <!--新产品 start--> 
            <li class="new_product"><em class="sprt sprt_icon_star ml20"></em><a>新产品</a>
                 <dl>
                <dd><a href="http://music.migu.cn/hj/index.html?loc=P9Z1Y1L3N13&locno=1" target="_blank">咪咕环境音乐</a></dd>
                <dd><a href="http://family.migu.cn" target="_blank">咪咕家庭音乐</a></dd>
                <dd><a href="http://211.137.107.18:8888/page/cm/index.html" target="_blank">企业彩铃</a></dd>
                <dd><a href="http://music.migu.cn/webfront/payment/index.do?loc=P9Z1Y1L3N13&locno=2" target="_blank">咪咕币</a></dd>
                 </dl>
            </li>
            <!--新产品  end-->
               </ul>
           </div>
    <!-- 會員日廣告 -->
    <div id="huiyuanri" style="display: none;">
      <a href="http://mclub.migu.cn/space.php?do=thread&id=182158" target="_blank" style="position:absolute;right:-70px;top:140px;" ><img src="${path}/Images/6f54e48b-4f27-479d-97fe-b526144b9d8f.png" alt="每周三，特会免费音乐敞开下" title="每周三，特会免费音乐敞开下"></a>
    </div>
</div></div>
<!--/header--> 
<!-- </body>
</html> -->