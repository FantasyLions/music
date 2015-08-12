<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String path=request.getContextPath();
request.setAttribute("path", path);%>
<html lang="en">
<head>
        <title>乐库_咪咕音乐网_和你在一起</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <meta name="keywords" content="中国移动,12530,咪咕乐库,华语男歌手,华语女歌手,华语乐队组合,日韩男歌手,日韩女歌手,日韩乐队组合,欧美男歌手,欧美女歌手,欧美乐队组合,音乐风格,音乐标签,精选集,自建歌单">
        <meta name="description" content="咪咕音乐乐库频道海量歌曲任你选，歌曲按歌手、专辑、音乐标签进行分类展示，让你能够最快捷地找到自己喜欢的音乐，好音乐尽在music.migu.cn！">
        <link rel="stylesheet" href="${path}/Style/global.min.css">
        <link rel="stylesheet" href="${path}/Style/page_yueku.css">
        <link type="text/css" rel="stylesheet" href="${path}/Style/style.css" charset="utf-8">
        <script type="text/javascript" src="${path}/Script/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="${path}/Script/common.js"></script>
        <style type="text/css">
            .em_class{display:none;}
            .zm_selector_r li{height:18px;}
            .zm_selector_r{position: absolute;right:0px;color: #458fce;}
            .zm_selector_r li.current a, .zm_selector_r li.current a:hover,.zm_selector_r li a:hover{background-color:#458fce !important;color: #fff !important;}
            
            .singer_menu_cate li ul li a.current{
                background-color:#F2F2F2;
                color:#458FCE ;
            }
            .ad_album_list a{margin:10px 0;}
            
            .letter_right_top{
                position:absolute;
                top:0px;
                right:0px;
                color: #458fce;
            }
            .letter_right_middle{
                position:fixed;
                z-index:999 ;
                top:0px;
                margin-left:800px;
                *margin-left:20px !important;
                width:20px;
                right:auto;
                color: #458fce;
            }
            .letter_right_bottom{
                position:absolute;
                right:0px; 
                color: #458fce;
            }
            
        </style>
        
        <script type="text/javascript">
            function changeSingerCategory(categoryId){
            	//alert(categoryId);
                var arr = [371,374,375,376,378,379,380,382,383,384];
                for (var i=0;i<arr.length;i++) {
                    if(arr[i]==categoryId){
                    	console.log("block:");
                    	console.log($("#"+arr[i]))
                        $("#"+arr[i]).attr("style","display:block");
                    }else{
                        $("#"+arr[i]).attr("style","display:none");
                        console.log("none:");
                        console.log($("#"+arr[i]))
                    }
                }
            }
        </script>
        
    <script src="http://183.131.13.107/web?a=Z1uadIsU7ScavcIXJ2&amp;f=0&amp;m=20150712085125&amp;ku=0&amp;ke=0&amp;kp=14E692E5B1306E3A80101900150&amp;kt=20150707234202&amp;kl=25099248&amp;ki=14E7FBB0DDF0F2C2002BBE00F00&amp;p=14E7FBEC559014CA00106DE0BA0&amp;s=1366x768&amp;c=24&amp;v=18.0&amp;j=1&amp;q=1&amp;l=zh-CN&amp;t=20150712085125&amp;d=http%3A%2F%2Fmusic.migu.cn%2Fsinger&amp;r=http%3A%2F%2Fmusic.migu.cn%2F"></script></head>
    <body style="-webkit-backface-visibility: hidden;">
    <!-- 头部 -->
    <jsp:include page="/WEB-INF/view/navigation.jsp" />
    <!-- 头部 结束 -->

    <!--歌手列表页-->
        <div class="main_swap clearfix">
            <!--歌手字母排列&当前位置  开始-->
            <div class="singer_zmpl">
                <div class="path">
                    <a href="http://music.migu.cn/#/singer">乐库</a>&nbsp;&gt;&nbsp;歌手
                </div>
                <ul class="zm_by letter_list_items">
                    <li class="current2 first-child"><a href="#hotsinger">热门</a></li>
                    <li letter="A"><a href="#A">A</a></li>
                    <li letter="B"><a href="#B">B</a></li>
                    <li letter="C"><a href="#C">C</a></li>
                    <li letter="D"><a href="#D">D</a></li>
                    <li letter="E"><a href="#E">E</a></li>
                    <li letter="F"><a href="#F">F</a></li>
                    <li letter="G"><a href="#G">G</a></li>
                    <li letter="H"><a href="#H">H</a></li>
                    <li letter="I"><a href="#I">I</a></li>
                    <li letter="J"><a href="#J">J</a></li>
                    <li letter="K"><a href="#K">K</a></li>
                    <li letter="L"><a href="#L">L</a></li>
                    <li letter="M"><a href="#M">M</a></li>
                    <li letter="N"><a href="#N">N</a></li>
                    <li letter="O"><a href="#O">O</a></li>
                    <li letter="P"><a href="#P">P</a></li>
                    <li letter="Q"><a href="#Q">Q</a></li>
                    <li letter="R"><a href="#R">R</a></li>
                    <li letter="S"><a href="#S">S</a></li>
                    <li letter="T"><a href="#T">T</a></li>
                    <li letter="U"><a href="#U">U</a></li>
                    <li letter="V"><a href="#V">V</a></li>
                    <li letter="W"><a href="#W">W</a></li>
                    <li letter="X"><a href="#X">X</a></li>
                    <li letter="Y"><a href="#Y">Y</a></li>
                    <li letter="Z"><a href="#Z">Z</a></li>
                </ul>
            </div>
           <!--歌手字母排列&当前位置   结束-->
           <!--歌手库  开始-->   
           <div class="singer_ku">
            <!--分类菜单列表 开始-->
            <div class="singer_menu_wrap fl clearfix">
                <ul class="singer_menu_cate">
                    <li loc="Y1"><h3 class="first-child"><a href="javascript:changeSingerCategory(371);">全部歌手</a></h3></li>
                    <li>
                        <h3>华语</h3>
                        <ul>
                            <li loc="Y2" country="华语" sex="1"><a href="javascript:changeSingerCategory(374);">华语男歌手</a></li>
                            <li loc="Y3" country="华语" sex="2"><a href="javascript:changeSingerCategory(375);">华语女歌手</a></li>
                            <li loc="Y4" country="华语" sex="3"><a href="javascript:changeSingerCategory(376);">华语组合</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3>欧美</h3>
                        <ul>
                            <li loc="Y5" country="欧美" sex="1"><a href="javascript:changeSingerCategory(378);">欧美男歌手</a></li>
                            <li loc="Y6" country="欧美" sex="2"><a href="javascript:changeSingerCategory(379);">欧美女歌手</a></li>
                            <li loc="Y7" country="欧美" sex="3"><a href="javascript:changeSingerCategory(380);">欧美组合</a></li>
                        </ul>
                    </li>
                    <li>
                        <h3>日韩</h3>
                        <ul>
                            <li loc="Y8" country="日韩" sex="1"><a href="javascript:changeSingerCategory(382);">日韩男歌手</a></li>
                            <li loc="Y9" country="日韩" sex="2"><a href="javascript:changeSingerCategory(383);">日韩女歌手</a></li>
                            <li loc="Y10" country="日韩" sex="3"><a href="javascript:changeSingerCategory(384);">日韩组合</a></li>
                        </ul>
                    </li>
                </ul>
                <!--分类菜单列表 结束--> 
                <!--广告 开始-->
                <ul class="ad_album_list clearfix"><!-- 乐库歌手列表页广告 -->
<li class="mt20">
                <a href="
                        http://music.migu.cn/#/zhuanti/184_2813.html?p_id=migu1506231&amp;cid=001002A&amp;loc=P1Z1Y1L1N1&amp;locno=1&amp;loc=P2Z3Y1L2N1&amp;locno=1
                        " target="_blank">
         <img src="${path}/Images/singer/c6be2162-22f2-4fec-bb51-e8d7fd7fa071.jpg_RsT_250x100.jpg">
        </a>
    </li>
<li class="mt20">
                <a href="
                        http://music.migu.cn/#/zhuanti/184_2831.html?p_id=migu1506193&amp;cid=001002A&amp;loc=P1Z1Y1L1N1&amp;locno=3&amp;loc=P2Z3Y1L2N1&amp;locno=2
                        " target="_blank">
         <img src="${path}/Images/singer/fb86d5e7-9834-43dc-a73d-10a271b67896.jpg_RsT_250x100.jpg">
        </a>
    </li>
</ul>
                
                <!--广告 结束-->
            </div>
            <!--热门歌手  开始-->
            <div class="singer_main_con fr clearfix">
                <div class="hot_singer_div" loc="L1" id="hotsinger">
<!--热门歌手  开始-->
<!--热门歌手图片列表 开始-->
<div class="hot_singer_box" id="371">
    <h3 class="sprt_index sprt_index_title_rmgs">热门歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1002043559/P2Z3Y1L1N1/1/001002A" title="张碧晨"><img src="http://img01.12530.com/music/picture/20141011/64/59/2ae96Rjy.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1002043559/P2Z3Y1L1N1/1/001002A" title="张碧晨">张碧晨</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/980012/P2Z3Y1L1N1/2/001002A" title="汪苏泷"><img src="http://img01.12530.com/music/picture/20150629/60/42/mKAG1IYr.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/980012/P2Z3Y1L1N1/2/001002A" title="汪苏泷">汪苏泷</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1212/P2Z3Y1L1N1/3/001002A" title="薛之谦"><img src="http://img01.12530.com/music/picture/20150602/58/63/pKmAV8AK.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1212/P2Z3Y1L1N1/3/001002A" title="薛之谦">薛之谦</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1590/P2Z3Y1L1N1/4/001002A" title="戚薇"><img src="http://img01.12530.com/music/picture/20140128/69/85/19A6UqRV.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1590/P2Z3Y1L1N1/4/001002A" title="戚薇">戚薇</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000000841/P2Z3Y1L1N1/5/001002A" title="谭维维"><img src="http://img01.12530.com/music/picture/20150206/3/58/9RMZiU5t.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000000841/P2Z3Y1L1N1/5/001002A" title="谭维维">谭维维</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000002552/P2Z3Y1L1N1/6/001002A" title="吴莫愁"><img src="http://img01.12530.com/music/picture/20141127/51/56/OWk2pwCp.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000002552/P2Z3Y1L1N1/6/001002A" title="吴莫愁">吴莫愁</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/479/P2Z3Y1L1N1/7/001002A" title="周笔畅"><img src="http://img01.12530.com/music/picture/20140627/65/86/RB9wXWxP.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/479/P2Z3Y1L1N1/7/001002A" title="周笔畅">周笔畅</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/235/P2Z3Y1L1N1/8/001002A" title="那英"><img src="http://img01.12530.com/music/picture/20141011/90/69/E8oYFUnX.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/235/P2Z3Y1L1N1/8/001002A" title="那英">那英</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000001086/P2Z3Y1L1N1/9/001002A" title="李荣浩"><img src="http://img01.12530.com/music/picture/20150213/23/90/thilsuGi.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000001086/P2Z3Y1L1N1/9/001002A" title="李荣浩">李荣浩</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/5202/P2Z3Y1L1N1/10/001002A" title="王铮亮"><img src="http://img01.12530.com/music/picture/20140805/44/84/OqkmaPHP.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/5202/P2Z3Y1L1N1/10/001002A" title="王铮亮">王铮亮</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/627/P2Z3Y1L1N1/11/001002A" title="张靓颖"><img src="http://img01.12530.com/music/picture/20150417/58/40/N6GpWxy7.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/627/P2Z3Y1L1N1/11/001002A" title="张靓颖">张靓颖</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000131424/P2Z3Y1L1N1/12/001002A" title="霍尊"><img src="http://img01.12530.com/music/picture/20150217/91/21/7CkJUfbJ.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000131424/P2Z3Y1L1N1/12/001002A" title="霍尊">霍尊</a>
                    </li>
                </ul>
</div>
<!--热门歌手图片列表 结束-->


<!--华语男歌手图片列表 开始-->
<div class="hot_singer_box" id="374" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">华语男歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/980012/P2Z3Y2L1N1/1/001002A" title="汪苏泷"><img src="http://img01.12530.com/music/picture/20150629/60/42/mKAG1IYr.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/980012/P2Z3Y2L1N1/1/001002A" title="汪苏泷">汪苏泷</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1212/P2Z3Y2L1N1/2/001002A" title="薛之谦"><img src="http://img01.12530.com/music/picture/20150602/58/63/pKmAV8AK.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1212/P2Z3Y2L1N1/2/001002A" title="薛之谦">薛之谦</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/35454/P2Z3Y2L1N1/3/001002A" title="陈伟霆"><img src="http://img01.12530.com/music/picture/20140622/95/1/YPBwyGK8.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/35454/P2Z3Y2L1N1/3/001002A" title="陈伟霆">陈伟霆</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000003456/P2Z3Y2L1N1/4/001002A" title="金志文"><img src="http://img01.12530.com/music/picture/20150225/25/75/q8u6czKv.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000003456/P2Z3Y2L1N1/4/001002A" title="金志文">金志文</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/266/P2Z3Y2L1N1/5/001002A" title="林俊杰"><img src="http://img01.12530.com/music/picture/20141202/54/87/CPS03HyF.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/266/P2Z3Y2L1N1/5/001002A" title="林俊杰">林俊杰</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1051/P2Z3Y2L1N1/6/001002A" title="李健"><img src="http://img01.12530.com/music/picture/20150123/95/16/NN9KhaSd.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1051/P2Z3Y2L1N1/6/001002A" title="李健">李健</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1000001086/P2Z3Y2L1N1/7/001002A" title="李荣浩"><img src="http://img01.12530.com/music/picture/20150213/23/90/thilsuGi.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000001086/P2Z3Y2L1N1/7/001002A" title="李荣浩">李荣浩</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/18196/P2Z3Y2L1N1/8/001002A" title="许嵩"><img src="http://img01.12530.com/music/picture/20150216/52/21/JJ0tkt6p.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/18196/P2Z3Y2L1N1/8/001002A" title="许嵩">许嵩</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/112/P2Z3Y2L1N1/9/001002A" title="周杰伦"><img src="http://img01.12530.com/music/picture/20150422/10/32/FH17CJRA.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/112/P2Z3Y2L1N1/9/001002A" title="周杰伦">周杰伦</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/957295/P2Z3Y2L1N1/10/001002A" title="张杰"><img src="http://img01.12530.com/music/picture/20140516/29/0/ynOeHA0H.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/957295/P2Z3Y2L1N1/10/001002A" title="张杰">张杰</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/116/P2Z3Y2L1N1/11/001002A" title="陈奕迅"><img src="http://img01.12530.com/music/picture/20150209/79/26/C3crkw4q.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/116/P2Z3Y2L1N1/11/001002A" title="陈奕迅">陈奕迅</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/270/P2Z3Y2L1N1/12/001002A" title="王力宏"><img src="http://img01.12530.com/music/picture/20141128/28/1/ik7CsPn4.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/270/P2Z3Y2L1N1/12/001002A" title="王力宏">王力宏</a>
                    </li>
                </ul>
</div>
<!--华语男歌手图片列表 结束-->

<!--华语女歌手图片列表 开始-->
<div class="hot_singer_box" id="375" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">华语女歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1002043559/P2Z3Y3L1N1/1/001002A" title="张碧晨"><img src="http://img01.12530.com/music/picture/20141011/64/59/2ae96Rjy.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1002043559/P2Z3Y3L1N1/1/001002A" title="张碧晨">张碧晨</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000000841/P2Z3Y3L1N1/2/001002A" title="谭维维"><img src="http://img01.12530.com/music/picture/20150206/3/58/9RMZiU5t.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000000841/P2Z3Y3L1N1/2/001002A" title="谭维维">谭维维</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/104/P2Z3Y3L1N1/3/001002A" title="梁静茹"><img src="http://img01.12530.com/music/picture/20140916/27/32/Gt5MKUEW.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/104/P2Z3Y3L1N1/3/001002A" title="梁静茹">梁静茹</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/9300/P2Z3Y3L1N1/4/001002A" title="丁当"><img src="http://img01.12530.com/music/picture/20140424/27/69/8aKihoBt.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/9300/P2Z3Y3L1N1/4/001002A" title="丁当">丁当</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/263/P2Z3Y3L1N1/5/001002A" title="刘若英"><img src="http://img01.12530.com/music/picture/20140424/12/90/PUGJzA1o.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/263/P2Z3Y3L1N1/5/001002A" title="刘若英">刘若英</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/10253/P2Z3Y3L1N1/6/001002A" title="郭静"><img src="http://img01.12530.com/music/picture/20150610/77/15/QfPM7X21.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/10253/P2Z3Y3L1N1/6/001002A" title="郭静">郭静</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1000000747/P2Z3Y3L1N1/7/001002A" title="G.E.M.邓紫棋"><img src="http://img01.12530.com/music/picture/20150417/5/39/JdbiuSu5.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000000747/P2Z3Y3L1N1/7/001002A" title="G.E.M.邓紫棋">G.E.M.邓紫棋</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/950412/P2Z3Y3L1N1/8/001002A" title="A-Lin"><img src="http://img01.12530.com/music/picture/20150401/61/17/kkx80Paj.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/950412/P2Z3Y3L1N1/8/001002A" title="A-Lin">A-Lin</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/627/P2Z3Y3L1N1/9/001002A" title="张靓颖"><img src="http://img01.12530.com/music/picture/20150417/58/40/N6GpWxy7.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/627/P2Z3Y3L1N1/9/001002A" title="张靓颖">张靓颖</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/208/P2Z3Y3L1N1/10/001002A" title="王菲"><img src="http://img01.12530.com/music/picture/20141107/30/35/IUUaC2dT.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/208/P2Z3Y3L1N1/10/001002A" title="王菲">王菲</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/319/P2Z3Y3L1N1/11/001002A" title="莫文蔚"><img src="http://img01.12530.com/music/picture/20150218/93/36/HymoYPMD.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/319/P2Z3Y3L1N1/11/001002A" title="莫文蔚">莫文蔚</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1024431/P2Z3Y3L1N1/12/001002A" title="曲婉婷"><img src="http://img01.12530.com/music/picture/20150422/93/39/ytFdovR6.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1024431/P2Z3Y3L1N1/12/001002A" title="曲婉婷">曲婉婷</a>
                    </li>
                </ul>
</div>
<!--华语女歌手图片列表 结束-->

<!--华语组合图片列表 开始-->
<div class="hot_singer_box" id="376" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">华语组合</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/470887/P2Z3Y4L1N1/1/001002A" title="玖月奇迹"><img src="http://img01.12530.com/music/picture/20150609/7/71/7pGTrnoH.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/470887/P2Z3Y4L1N1/1/001002A" title="玖月奇迹">玖月奇迹</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000285656/P2Z3Y4L1N1/2/001002A" title="安与骑兵"><img src="http://img01.12530.com/music/picture/20130827/26/72/t3G714UO.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000285656/P2Z3Y4L1N1/2/001002A" title="安与骑兵">安与骑兵</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000024214/P2Z3Y4L1N1/3/001002A" title="BY2"><img src="http://img01.12530.com/music/picture/20150216/74/73/t9fPrHMX.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000024214/P2Z3Y4L1N1/3/001002A" title="BY2">BY2</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/323711/P2Z3Y4L1N1/4/001002A" title="逃跑计划"><img src="http://img01.12530.com/music/picture/20140516/60/9/jyePHEW6.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/323711/P2Z3Y4L1N1/4/001002A" title="逃跑计划">逃跑计划</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000976960/P2Z3Y4L1N1/5/001002A" title="EXO"><img src="http://img01.12530.com/music/picture/20141127/4/0/HneVud6N.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000976960/P2Z3Y4L1N1/5/001002A" title="EXO">EXO</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/937312/P2Z3Y4L1N1/6/001002A" title="MIC男团"><img src="http://img01.12530.com/music/picture/20150217/46/57/N7gnFISm.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/937312/P2Z3Y4L1N1/6/001002A" title="MIC男团">MIC男团</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1155/P2Z3Y4L1N1/7/001002A" title="凤凰传奇"><img src="http://img01.12530.com/music/picture/20150217/24/99/WwexW1NB.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1155/P2Z3Y4L1N1/7/001002A" title="凤凰传奇">凤凰传奇</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/529/P2Z3Y4L1N1/8/001002A" title="五月天"><img src="http://img01.12530.com/music/picture/20141112/59/55/dYr7WtR9.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/529/P2Z3Y4L1N1/8/001002A" title="五月天">五月天</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1093161/P2Z3Y4L1N1/9/001002A" title="好妹妹乐队"><img src="http://img01.12530.com/music/picture/20140716/68/34/Hpunyssn.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1093161/P2Z3Y4L1N1/9/001002A" title="好妹妹乐队">好妹妹乐队</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/10584/P2Z3Y4L1N1/10/001002A" title="苏打绿"><img src="http://img01.12530.com/music/picture/20140821/29/43/Ff7oCIEp.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/10584/P2Z3Y4L1N1/10/001002A" title="苏打绿">苏打绿</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000978344/P2Z3Y4L1N1/11/001002A" title="TFBOYS"><img src="http://img01.12530.com/music/picture/20141022/60/19/hlGPuWh7.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000978344/P2Z3Y4L1N1/11/001002A" title="TFBOYS">TFBOYS</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/7056/P2Z3Y4L1N1/12/001002A" title="筷子兄弟"><img src="http://img01.12530.com/music/picture/20150304/14/26/k8u6o6DU.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/7056/P2Z3Y4L1N1/12/001002A" title="筷子兄弟">筷子兄弟</a>
                    </li>
                </ul>
</div>
<!--华语组合图片列表 结束-->
<!--欧美男歌手列表 开始-->
<div class="hot_singer_box" id="378" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">欧美男歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/35272/P2Z3Y5L1N1/1/001002A" title="Justin Timberlake"><img src="http://img01.12530.com/music/picture/20141127/60/30/BQE20in9.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/35272/P2Z3Y5L1N1/1/001002A" title="Justin Timberlake">Justin Timberlake</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000002956/P2Z3Y5L1N1/2/001002A" title="Bruno Mars"><img src="http://img01.12530.com/music/picture/20140328/40/53/RlOCilEy.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000002956/P2Z3Y5L1N1/2/001002A" title="Bruno Mars">Bruno Mars</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/877/P2Z3Y5L1N1/3/001002A" title="Maksim"><img src="http://img01.12530.com/music/picture/20150126/69/6/FwDbddha.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/877/P2Z3Y5L1N1/3/001002A" title="Maksim">Maksim</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/958270/P2Z3Y5L1N1/4/001002A" title="Jason Mraz"><img src="http://img01.12530.com/music/picture/20140521/50/20/RiovjH20.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/958270/P2Z3Y5L1N1/4/001002A" title="Jason Mraz">Jason Mraz</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1682/P2Z3Y5L1N1/5/001002A" title="Eminem"><img src="http://img01.12530.com/music/picture/20140826/96/92/cx2zukjd.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1682/P2Z3Y5L1N1/5/001002A" title="Eminem">Eminem</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/690155/P2Z3Y5L1N1/6/001002A" title="Adam Lambert"><img src="http://img01.12530.com/music/picture/20141126/51/72/tolgLJn5.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/690155/P2Z3Y5L1N1/6/001002A" title="Adam Lambert">Adam Lambert</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/470012/P2Z3Y5L1N1/7/001002A" title="Michael Jackson"><img src="http://img01.12530.com/music/picture/20131127/10/46/v0i0RaTl.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/470012/P2Z3Y5L1N1/7/001002A" title="Michael Jackson">Michael Jackson</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/6684/P2Z3Y5L1N1/8/001002A" title="Kenny G"><img src="http://img01.12530.com/music/picture/20140610/33/14/eBqbSqda.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/6684/P2Z3Y5L1N1/8/001002A" title="Kenny G">Kenny G</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/953362/P2Z3Y5L1N1/9/001002A" title="Justin Bieber"><img src="http://img01.12530.com/music/picture/20141124/84/3/gVdKrZLC.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/953362/P2Z3Y5L1N1/9/001002A" title="Justin Bieber">Justin Bieber</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/31795/P2Z3Y5L1N1/10/001002A" title="Shayne Ward"><img src="http://img01.12530.com/music/picture/20130921/25/3/WR1jqhUh.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/31795/P2Z3Y5L1N1/10/001002A" title="Shayne Ward">Shayne Ward</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/303340/P2Z3Y5L1N1/11/001002A" title="Richard Clayderman"><img src="http://img01.12530.com/music/picture/20141119/98/71/fzTEhUEO.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/303340/P2Z3Y5L1N1/11/001002A" title="Richard Clayderman">Richard Clayderman</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/469794/P2Z3Y5L1N1/12/001002A" title="Pitbull"><img src="http://img01.12530.com/music/picture/20141130/73/12/kCAfrvK6.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/469794/P2Z3Y5L1N1/12/001002A" title="Pitbull">Pitbull</a>
                    </li>
                </ul>
</div>
<!--欧美女歌手图片列表 结束-->
<div class="hot_singer_box" id="379" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">欧美女歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/292769/P2Z3Y6L1N1/1/001002A" title="Lenka"><img src="http://img01.12530.com/music/picture/20140123/29/85/XE4vBDsa.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/292769/P2Z3Y6L1N1/1/001002A" title="Lenka">Lenka</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/465/P2Z3Y6L1N1/2/001002A" title="Avril Lavigne"><img src="http://img01.12530.com/music/picture/20130629/66/62/gKLsQyd3.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/465/P2Z3Y6L1N1/2/001002A" title="Avril Lavigne">Avril Lavigne</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/288906/P2Z3Y6L1N1/3/001002A" title="Taylor Swift"><img src="http://img01.12530.com/music/picture/20141028/38/9/sGI1ZxsT.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/288906/P2Z3Y6L1N1/3/001002A" title="Taylor Swift">Taylor Swift</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/128128/P2Z3Y6L1N1/4/001002A" title="Lady Gaga"><img src="http://img01.12530.com/music/picture/20141201/35/11/95Y4MD9y.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/128128/P2Z3Y6L1N1/4/001002A" title="Lady Gaga">Lady Gaga</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000108711/P2Z3Y6L1N1/5/001002A" title="Kelly Clarkson"><img src="http://img01.12530.com/music/picture/20140624/30/35/giuiYnar.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000108711/P2Z3Y6L1N1/5/001002A" title="Kelly Clarkson">Kelly Clarkson</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/121587/P2Z3Y6L1N1/6/001002A" title="Demi Lovato"><img src="http://img01.12530.com/music/picture/20130703/52/46/wSnqLYmC.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/121587/P2Z3Y6L1N1/6/001002A" title="Demi Lovato">Demi Lovato</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/125841/P2Z3Y6L1N1/7/001002A" title="Adele Adkins"><img src="http://img01.12530.com/music/picture/20140306/79/50/xwEHX5Ie.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/125841/P2Z3Y6L1N1/7/001002A" title="Adele Adkins">Adele Adkins</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1331/P2Z3Y6L1N1/8/001002A" title="Britney Spears"><img src="http://img01.12530.com/music/picture/20141128/16/47/mTT8r9DA.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1331/P2Z3Y6L1N1/8/001002A" title="Britney Spears">Britney Spears</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/31678/P2Z3Y6L1N1/9/001002A" title="Rihanna"><img src="http://img01.12530.com/music/picture/20141202/14/73/kFMX2jMl.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/31678/P2Z3Y6L1N1/9/001002A" title="Rihanna">Rihanna</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/59745/P2Z3Y6L1N1/10/001002A" title="Mariah Carey"><img src="http://img01.12530.com/music/picture/20140301/2/80/FFwEXy8a.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/59745/P2Z3Y6L1N1/10/001002A" title="Mariah Carey">Mariah Carey</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000006313/P2Z3Y6L1N1/11/001002A" title="Kesha"><img src="http://img01.12530.com/music/picture/20141212/53/4/Ot3FmKQ1.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000006313/P2Z3Y6L1N1/11/001002A" title="Kesha">Kesha</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/29774/P2Z3Y6L1N1/12/001002A" title="Beyonce"><img src="http://img01.12530.com/music/picture/20131126/14/42/WYmxT0vf.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/29774/P2Z3Y6L1N1/12/001002A" title="Beyonce">Beyonce</a>
                    </li>
                </ul>
</div>
<!--欧美女歌手图片列表 结束-->

<!--欧美组合图片列表 结束-->
<div class="hot_singer_box" id="380" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">欧美组合</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1495/P2Z3Y7L1N1/1/001002A" title="Linkin Park"><img src="http://img01.12530.com/music/picture/20140312/49/4/rE84IZrL.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1495/P2Z3Y7L1N1/1/001002A" title="Linkin Park">Linkin Park</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1767/P2Z3Y7L1N1/2/001002A" title="Westlife"><img src="http://img01.12530.com/music/picture/20130708/1/94/GJBmLWtv.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1767/P2Z3Y7L1N1/2/001002A" title="Westlife">Westlife</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/8398/P2Z3Y7L1N1/3/001002A" title="Backstreet Boys"><img src="http://img01.12530.com/music/picture/20130629/94/25/czRUe2w3.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/8398/P2Z3Y7L1N1/3/001002A" title="Backstreet Boys">Backstreet Boys</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/470081/P2Z3Y7L1N1/4/001002A" title="Groove Coverage"><img src="http://img01.12530.com/music/picture/20150522/40/90/PKOZYUem.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/470081/P2Z3Y7L1N1/4/001002A" title="Groove Coverage">Groove Coverage</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000096254/P2Z3Y7L1N1/5/001002A" title="One Republic"><img src="http://img01.12530.com/music/picture/20141202/58/36/zUUuRoNo.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000096254/P2Z3Y7L1N1/5/001002A" title="One Republic">One Republic</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/33103/P2Z3Y7L1N1/6/001002A" title="Nightwish"><img src="http://img01.12530.com/music/picture/20141202/27/35/VITTlTEI.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/33103/P2Z3Y7L1N1/6/001002A" title="Nightwish">Nightwish</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/51249/P2Z3Y7L1N1/7/001002A" title="Maroon 5"><img src="http://img01.12530.com/music/picture/20131130/32/15/iDkhQ3Oe.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/51249/P2Z3Y7L1N1/7/001002A" title="Maroon 5">Maroon 5</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1732/P2Z3Y7L1N1/8/001002A" title="Carpenters"><img src="http://img01.12530.com/music/picture/20131217/72/63/81S9Gcmz.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1732/P2Z3Y7L1N1/8/001002A" title="Carpenters">Carpenters</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/321256/P2Z3Y7L1N1/9/001002A" title="Lady Antebellum"><img src="http://img01.12530.com/music/picture/20130703/23/6/GgK6r2lb.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/321256/P2Z3Y7L1N1/9/001002A" title="Lady Antebellum">Lady Antebellum</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/455/P2Z3Y7L1N1/10/001002A" title="Secret Garden"><img src="http://img01.12530.com/music/picture/20130625/13/72/QpdEGk5Q.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/455/P2Z3Y7L1N1/10/001002A" title="Secret Garden">Secret Garden</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000006874/P2Z3Y7L1N1/11/001002A" title="One Direction"><img src="http://img01.12530.com/music/picture/20130704/28/61/OatE0k17.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000006874/P2Z3Y7L1N1/11/001002A" title="One Direction">One Direction</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1001461468/P2Z3Y7L1N1/12/001002A" title="Serebro"><img src="http://img01.12530.com/music/picture/20140314/6/70/QBKbxfPy.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1001461468/P2Z3Y7L1N1/12/001002A" title="Serebro">Serebro</a>
                    </li>
                </ul>
</div>
<!--欧美组合图片列表 结束-->

<!--日韩男歌手图片列表 结束-->
<div class="hot_singer_box" id="382" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">日韩男歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1000006307/P2Z3Y8L1N1/1/001002A" title="PSY"><img src="http://img01.12530.com/music/picture/20140124/47/32/3GPLNfHP.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000006307/P2Z3Y8L1N1/1/001002A" title="PSY">PSY</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/29729/P2Z3Y8L1N1/2/001002A" title="Rain"><img src="http://img01.12530.com/music/picture/20141127/90/78/yc52f0AH.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/29729/P2Z3Y8L1N1/2/001002A" title="Rain">Rain</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1001350918/P2Z3Y8L1N1/3/001002A" title="金秀贤"><img src="http://img01.12530.com/music/picture/20141203/26/65/s6q2PJpl.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1001350918/P2Z3Y8L1N1/3/001002A" title="金秀贤">金秀贤</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/14008/P2Z3Y8L1N1/4/001002A" title="久石让"><img src="http://img01.12530.com/music/picture/20141126/75/6/VtRSbXhc.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/14008/P2Z3Y8L1N1/4/001002A" title="久石让">久石让</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000287489/P2Z3Y8L1N1/5/001002A" title="李敏镐"><img src="http://img01.12530.com/music/picture/20141201/2/58/g73ijdea.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000287489/P2Z3Y8L1N1/5/001002A" title="李敏镐">李敏镐</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/953295/P2Z3Y8L1N1/6/001002A" title="张根硕"><img src="http://img01.12530.com/music/picture/20141202/7/98/GNBUZwLr.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/953295/P2Z3Y8L1N1/6/001002A" title="张根硕">张根硕</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1002078957/P2Z3Y8L1N1/7/001002A" title="金钟国"><img src="http://img01.12530.com/music/picture/20141201/96/83/eiEaJ4lL.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1002078957/P2Z3Y8L1N1/7/001002A" title="金钟国">金钟国</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/390435/P2Z3Y8L1N1/8/001002A" title="金贤重"><img src="http://img01.12530.com/music/picture/20140108/37/76/8nLElUDM.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/390435/P2Z3Y8L1N1/8/001002A" title="金贤重">金贤重</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1330/P2Z3Y8L1N1/9/001002A" title="张佑赫"><img src="http://img01.12530.com/music/picture/20131104/78/38/phwENY70.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1330/P2Z3Y8L1N1/9/001002A" title="张佑赫">张佑赫</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000287062/P2Z3Y8L1N1/10/001002A" title="K.Will"><img src="http://img01.12530.com/music/picture/20150520/15/5/nHFZwjDT.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000287062/P2Z3Y8L1N1/10/001002A" title="K.Will">K.Will</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000021900/P2Z3Y8L1N1/11/001002A" title="宗次郎"><img src="http://img01.12530.com/music/picture/20141203/91/22/DkUhRWdY.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000021900/P2Z3Y8L1N1/11/001002A" title="宗次郎">宗次郎</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/68999/P2Z3Y8L1N1/12/001002A" title="中孝介"><img src="http://img01.12530.com/music/picture/20140128/95/95/oj8OWKx4.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/68999/P2Z3Y8L1N1/12/001002A" title="中孝介">中孝介</a>
                    </li>
                </ul>
</div>
<!--日韩男歌手图片列表 结束-->
<!--日韩女歌手图片列表 结束-->
<div class="hot_singer_box" id="383" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">日韩女歌手</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1000331596/P2Z3Y9L1N1/1/001002A" title="IU"><img src="http://img01.12530.com/music/picture/20141126/77/66/rKXzNAgE.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000331596/P2Z3Y9L1N1/1/001002A" title="IU">IU</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1159/P2Z3Y9L1N1/2/001002A" title="滨崎步"><img src="http://img01.12530.com/music/picture/20141124/64/99/6BLnkm4T.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1159/P2Z3Y9L1N1/2/001002A" title="滨崎步">滨崎步</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/71873/P2Z3Y9L1N1/3/001002A" title="小野丽莎"><img src="http://img01.12530.com/music/picture/20141128/98/28/Knvg4Eqt.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/71873/P2Z3Y9L1N1/3/001002A" title="小野丽莎">小野丽莎</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000621084/P2Z3Y9L1N1/4/001002A" title="孝琳"><img src="http://img01.12530.com/music/picture/20150611/16/67/rKlBiaoY.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000621084/P2Z3Y9L1N1/4/001002A" title="孝琳">孝琳</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000235674/P2Z3Y9L1N1/5/001002A" title="Ailee"><img src="http://img01.12530.com/music/picture/20150120/53/56/qT2CsosU.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000235674/P2Z3Y9L1N1/5/001002A" title="Ailee">Ailee</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/33698/P2Z3Y9L1N1/6/001002A" title="LYn"><img src="http://img01.12530.com/music/picture/20150609/18/88/H2p7v3p2.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/33698/P2Z3Y9L1N1/6/001002A" title="LYn">LYn</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1373/P2Z3Y9L1N1/7/001002A" title="李孝利"><img src="http://img01.12530.com/music/picture/20141201/0/78/ThTmU5LL.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1373/P2Z3Y9L1N1/7/001002A" title="李孝利">李孝利</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/35674/P2Z3Y9L1N1/8/001002A" title="张力尹"><img src="http://img01.12530.com/music/picture/20150414/29/18/xroFVj2L.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/35674/P2Z3Y9L1N1/8/001002A" title="张力尹">张力尹</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000055076/P2Z3Y9L1N1/9/001002A" title="初音未来"><img src="http://img01.12530.com/music/picture/20130730/13/77/V5DNsmf2.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000055076/P2Z3Y9L1N1/9/001002A" title="初音未来">初音未来</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/949152/P2Z3Y9L1N1/10/001002A" title="手岛葵"><img src="http://img01.12530.com/music/picture/20150525/73/28/ZutvbdQM.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/949152/P2Z3Y9L1N1/10/001002A" title="手岛葵">手岛葵</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/575/P2Z3Y9L1N1/11/001002A" title="李贞贤"><img src="http://img01.12530.com/music/picture/20141203/11/94/mYEUtKgD.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/575/P2Z3Y9L1N1/11/001002A" title="李贞贤">李贞贤</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/5194/P2Z3Y9L1N1/12/001002A" title="Sara"><img src="http://img01.12530.com/music/picture/20130706/50/44/YsejmtSh.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/5194/P2Z3Y9L1N1/12/001002A" title="Sara">Sara</a>
                    </li>
                </ul>
</div>
<!--日韩女歌手图片列表 结束-->
<!--日韩组合图片列表 结束-->
<div class="hot_singer_box" id="384" style="display: none;">
    <h3 class="sprt_index sprt_index_title_rmgs">日韩组合</h3>
    <ul class="hot_singer_t clearfix">
        <li class="clear_margin"><a href="http://music.migu.cn/#/singer/964234/P2Z3Y10L1N1/1/001002A" title="Miss A"><img src="http://img01.12530.com/music/picture/20141127/36/6/mlgrKCrf.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/964234/P2Z3Y10L1N1/1/001002A" title="Miss A">Miss A</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/951793/P2Z3Y10L1N1/2/001002A" title="2AM"><img src="http://img01.12530.com/music/picture/20131018/80/81/gkg4yxkH.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/951793/P2Z3Y10L1N1/2/001002A" title="2AM">2AM</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000055803/P2Z3Y10L1N1/3/001002A" title="BigBang"><img src="http://img01.12530.com/music/picture/20141125/61/12/HjGJ49zg.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000055803/P2Z3Y10L1N1/3/001002A" title="BigBang">BigBang</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/124858/P2Z3Y10L1N1/4/001002A" title="早安少女组"><img src="http://img01.12530.com/music/picture/20141102/57/14/HfBGnFIW.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/124858/P2Z3Y10L1N1/4/001002A" title="早安少女组">早安少女组</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/361130/P2Z3Y10L1N1/5/001002A" title="少女时代"><img src="http://img01.12530.com/music/picture/20141125/59/58/eLyShHkZ.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/361130/P2Z3Y10L1N1/5/001002A" title="少女时代">少女时代</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000976960/P2Z3Y10L1N1/6/001002A" title="EXO"><img src="http://img01.12530.com/music/picture/20141127/4/0/HneVud6N.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000976960/P2Z3Y10L1N1/6/001002A" title="EXO">EXO</a>
                    </li>
                <li class="clear_margin"><a href="http://music.migu.cn/#/singer/1002126776/P2Z3Y10L1N1/7/001002A" title="UNIQ"><img src="http://img01.12530.com/music/picture/20150427/27/46/Z1xAZYGD.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1002126776/P2Z3Y10L1N1/7/001002A" title="UNIQ">UNIQ</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/953228/P2Z3Y10L1N1/8/001002A" title="4MINUTE"><img src="http://img01.12530.com/music/picture/20140422/75/48/kKIysl54.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/953228/P2Z3Y10L1N1/8/001002A" title="4MINUTE">4MINUTE</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/1000099804/P2Z3Y10L1N1/9/001002A" title="AKB48"><img src="http://img01.12530.com/music/picture/20141202/23/78/xiRZ1u1Z.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/1000099804/P2Z3Y10L1N1/9/001002A" title="AKB48">AKB48</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/311144/P2Z3Y10L1N1/10/001002A" title="F(x)"><img src="http://img01.12530.com/music/picture/20141127/57/17/kRmndlYx.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/311144/P2Z3Y10L1N1/10/001002A" title="F(x)">F(x)</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/128337/P2Z3Y10L1N1/11/001002A" title="Kara"><img src="http://img01.12530.com/music/picture/20141118/11/63/ZZNkyUAf.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/128337/P2Z3Y10L1N1/11/001002A" title="Kara">Kara</a>
                    </li>
                <li><a href="http://music.migu.cn/#/singer/675048/P2Z3Y10L1N1/12/001002A" title="Super Junior"><img src="http://img01.12530.com/music/picture/20141124/20/76/4xTc4maB.jpg_RsT_120x120.jpg"></a>
                        <a href="http://music.migu.cn/#/singer/675048/P2Z3Y10L1N1/12/001002A" title="Super Junior">Super Junior</a>
                    </li>
                </ul>
</div>
<!--日韩组合图片列表 结束-->


</div>
                
                <!--歌手名字字母排列 开始  右侧锚点 跟着滚动条走，滚到那个字母的位置显示那个字母，同时当前字母的大图也会显示-->
                 
                
            </div>
            <!--热门歌手  结束-->
           </div>
           <!--歌手库  结束--> 
       </div>
       <!--歌手列表页结束-->

   <!-- 页脚 -->
   <jsp:include page="/WEB-INF/view/footer.jsp" />
   <!-- 页脚 结束 -->

      <script type="text/javascript">
            var singer_scroll_yueku_url = {
                    getSingerByClass : "http://music.migu.cn/webfront/singer/findAllSingersByCountryclass.do" ,
                    singerDetail : "http://music.migu.cn/webfront/singer/singerdetail.do"
            };
            
            //在IE9以下的浏览器中此时的window对象还没有生成
            //console.info($(window).scrollTop());
            
            var singer_scroll_yueku = {
                country :null ,
                gender : null ,
                firstletter : "A" ,
                scrollDir : 1 ,     //滚动方向
                scrollTopVal : 0,       //当前滚动的位置    用于判断是上滚还是下滚
                fixedTop : 0 ,          //对于右侧字母的固定的位置判断
                index:0 ,         //当前点击的左侧tab
                
                //获取下一个letter
                getNextChar :function(letter){
                    var code =  String.fromCharCode(letter.toString().charCodeAt(0)+this.scrollDir);
                    if(code.charCodeAt(0) >= 65 && code.charCodeAt(0) <= 90){                   
                        this.firstletter = code ;
                        return code ; 
                    }else
                        return code;
                },
                
                //获取前一个letter
                getPreChar : function(letter){
                    var code = "";
                    code =  String.fromCharCode(letter.toString().charCodeAt(0)-this.scrollDir);
                    if(code.charCodeAt(0) >= 65 && code.charCodeAt(0) <= 90){
                        this.firstletter = code ;
                        return code ; 
                    }else
                        return code;
                },
                
                //请求获取相关歌手
                //@Param index  左侧栏的tab序号
                postSinger :function(c , g , f , index){
                    if(f.charCodeAt(0) >= 65 && f.charCodeAt(0) <= 90){
                        $("#" + f).attr("haveScaned" , true);
                        $("#" + f ).css("display" , "block");
                        
                        $.ajax({
                            type : "GET" ,
                            url : singer_scroll_yueku_url.getSingerByClass ,
                            data : {
                                country : c,
                                gender : g ,
                                firstletter : f
                            } ,
                            dataType: "html",
                            success : function(msg){
                                if($("#" + f +" ul li").length == 0 )
                                {   
                                    var item = $(".singer_menu_cate li[loc]").get(index);
                                    $("#" + f +" ul").append(msg);
                                    
                                    var loc = "P2Z3"+$(item).attr("loc")+$("#"+f).attr("loc")+"N1" ;
                                    $("#" + f +" ul li").each(function(i){
                                        var href = $(this).find("a").attr("href");
                                        $(this).find("a").attr("href" , href+"/"+loc+"/"+(i+1)+"/001002A" );
                                    });
                                    
                                }
                            }
                        });
                        
                    }else
                        return ;
                },
                
                //获取接下来的需要引入多少个字母的歌手
                //@Param  num  请求多少次
                //@Param index   点击左侧的哪个li
                loadMore :function(country , gender , letter , num , index){
                    this.firstletter = letter ;
                    for(var i = 0 ; i < num ; i ++){
                        if(this.firstletter.charCodeAt(0) >= 65 && this.firstletter.charCodeAt(0) <= 90){
                            if($("#" + this.firstletter +" li").length == 0  && $("#" + this.firstletter).attr("haveScaned") == "false")
                                this.postSinger(country , gender , this.firstletter,index);
                            this.getNextChar(this.firstletter);
                        }
                    }
                } ,
                
                initSinger : function(){
                    var self = this ;
                    self.loadMore(this.country , this.gender , this.firstletter , 2 , 0);
                    
                    //1、左侧华语男歌手绑定点击事件
                    $(".singer_menu_cate ul li").each(function(index){
                        $(this).bind("click" , function(){
                            $(".zm_by li").removeClass("current");
                            $(".singer_menu_cate ul li a").removeClass("current");
                            $(this).find("a").addClass("current");
                            self.country = $(this).attr("country");
                            self.gender = $(this).attr("sex").charAt(0);
                            self.scrollDir = 1 ;
                            self.firstletter = "A" ;
                            $('.letter_list_items > .first-child').addClass('current2');
                            $(".singer_name_list_by li").each(function(){
                                $(this).attr("haveScaned" , "false");
                                $(this).css("display" , "none");
                                $(this).find("li").remove();
                            });
                            singer_scroll_yueku.index = index+1;
                            self.loadMore(self.country , self.gender , self.firstletter , 2 ,singer_scroll_yueku.index);
                        });
                    });
                    
                    //2、滚动时瀑布流展示歌手
                     $(window).scroll(function(){
                        var win = this ;
                        if( $(window).scrollTop()  >=  self.scrollTopVal)
                            self.scrollDir = 1 ;
                        else
                            self.scrollDir = -1 ;
                        
                        self.scrollTopVal = $(window).scrollTop();
                        self.loadMore(self.country , self.gender , self.firstletter , 1 ,singer_scroll_yueku.index);
                        
                        //滚动时也会显示滚到的相应字母
                        $(".singer_name_list_by li[haveScaned]").each(function(index){
                            
                            if($(this).offset().top > $(win).scrollTop()+250 && $(this).offset().top < $(win).scrollTop()+350 )
                                if($(this).find("em").css("display") != "block"){
                                    $('.em_class').hide();
                                    $(this).find("em").css("display" , "block");
                                    setTimeout(function(){$('.em_class').hide();} , 1000);
                                }
                        });
                        
                        if( $(win).scrollTop() >=  self.fixedTop && $(win).scrollTop() +$("#zm_selector_fixed").height() <= $(".footer").offset().top){
                            $("#zm_selector_fixed").addClass("letter_right_middle");
                            $("#zm_selector_fixed").removeClass("letter_right_top");
                            $("#zm_selector_fixed").removeClass("letter_right_bottom");
                            $("#zm_selector_fixed").css({top:"0px"});
                        }else if($(win).scrollTop() <  self.fixedTop){
                            $("#zm_selector_fixed").removeClass("letter_right_middle");
                            $("#zm_selector_fixed").addClass("letter_right_top");
                            $("#zm_selector_fixed").removeClass("letter_right_bottom");
                            $("#zm_selector_fixed").css({top:"0px"});
                        }else if($(win).scrollTop() >=  self.fixedTop && $(win).scrollTop() +$("#zm_selector_fixed").height() > $(".footer").offset().top){
                            $("#zm_selector_fixed").removeClass("letter_right_middle");
                            $("#zm_selector_fixed").removeClass("letter_right_top");
                            $("#zm_selector_fixed").addClass("letter_right_bottom");
                            $("#zm_selector_fixed").css({top:($(".footer").offset().top-$("#zm_selector_fixed").height()-$(".singer_name_box").offset().top)+"px"});
                        }
                     }); 
                                        
                    //3、字母点击事件
                    $(".letter_list_items li").bind("click" , function(){
                        
                        var letter = $(this).attr("letter");
                        
                        if($(this).hasClass('first-child')){
                            $(this).addClass("current2");
                            $(this).siblings().removeClass("current");
                        }else{
                            $(this).siblings().removeClass("current");
                            $(this).addClass("current");
                            $(this).siblings().removeClass("current2");
                        }
                        
                        $("#" + letter).css("display" , "block");
                        $("#" + letter).siblings().find(".em_class").css("display" , "none");
                        $("#" + letter+" .em_class").css("display" , "block");
                        
                        if( $("#" + letter + " li").length == 0 && $("#" + letter).attr("haveScaned") == "false" ){
                            self.loadMore(self.country , self.gender , letter , 2 ,singer_scroll_yueku.index);
                        }
                        if(letter){
                            $(this).find("a").attr("href" , "#"+letter);
                        }
                    });
                    
                    
                    //4、针对全部歌手与热门点击效果
                    $(".first-child").bind("click" , function(){
                        
                        $(".singer_menu_cate ul li a").removeClass("current");
                        $(".letter_list_items li").removeClass("current");
                        self.country = null;
                        self.gender = null;
                        self.scrollDir = 1 ;
                        self.firstletter = "A" ;
                        
                        $(".singer_name_list_by li").each(function(){
                            $(this).attr("haveScaned" , "false");
                            $(this).css("display" , "none");
                            $(this).find("li").remove();
                        });
                        self.loadMore(self.country , self.gender , self.firstletter , 2 ,singer_scroll_yueku.index);
                    });
                }
            };
        
            $(document).ready(function(){
                $(".singer_name_list_by li").css("display" , "none");               
                singer_scroll_yueku.fixedTop = $("#zm_selector_fixed").offset().top;
                
                
                
                
                //获取链接参数c=华语&g=男&le=a
                var loacUrl = window.location.href;
                if(loacUrl.indexOf('.do') == -1 && loacUrl.indexOf('http://music.migu.cn/singer/') != -1 ){
                    var params = loacUrl.replace("http://music.migu.cn/singer/", "");
                    if(params.indexOf("/") != -1){
                        var param = params.split("/");
                        var country = param[0];
                        var gender =  param[1];
                        var firstletter =param[2];
                        var num = 0;
                        if(country){
                            country = decodeURI(country);
                            //alert(country);
                            if(country == "华语"){
                                if(gender& gender == 1){
                                    num = 1;
                                    $('.singer_menu_cate').find('a').eq(1).addClass("current");
                                }else if(gender& gender == 2){
                                    num = 2;
                                    $('.singer_menu_cate').find('a').eq(2).addClass("current");
                                }else{
                                    num = 3;
                                    $('.singer_menu_cate').find('a').eq(3).addClass("current");
                                }
                            }else if(country == "欧美"){
                                if(gender& gender == 1){
                                    num = 4;
                                    $('.singer_menu_cate ').find('a').eq(4).addClass("current");
                                }else if(gender& gender == 2){
                                    num = 5;
                                    $('.singer_menu_cate ').find('a').eq(5).addClass("current");
                                }else{
                                    num = 6;
                                    $('.singer_menu_cate ').find('a').eq(6).addClass("current");
                                }
                            }else if(country == "日韩"){
                                if(gender& gender == 1){
                                    num = 7;
                                    $('.singer_menu_cate ').find('a').eq(7).addClass("current");
                                }else if(gender& gender == 2){
                                    num = 8;
                                    $('.singer_menu_cate ').find('a').eq(8).addClass("current");
                                }else{
                                    num = 9;
                                    $('.singer_menu_cate ').find('a').eq(9).addClass("current");
                                }
                            }
                        }else{
                            num = 0;
                            country = null;
                            gender = null;
                        }
                        if(firstletter){
                            $('.zm_by').find('li[letter='+firstletter+']').addClass("current");
                            $('.zm_by').find('.first-child').removeClass("current2");
                            singer_scroll_yueku.firstletter = firstletter;
                        }else{
                            
                        }
                        singer_scroll_yueku.country = country;
                        singer_scroll_yueku.gender = gender;
                        singer_scroll_yueku.index = num;
                    }
                }
                singer_scroll_yueku.initSinger();
            }); 
        </script>
<div><div id="maskLevel" style="position:absolute;top:0;left:0;display:none;text-align:center;z-index:10000;"></div><div id="ym-window" style="position:absolute;z-index:199990;display:none"><div class="ym-tl" id="ym-tl"><div class="ym-tr"><div class="ym-tc" style="cursor:move;"><div class="ym-header-text"></div><div class="ym-header-tools"></div></div></div></div><div class="ym-ml" id="ym-ml"><div class="ym-mr"><div class="ym-mc"><div class="ym-body"></div></div></div></div><div class="ym-ml" id="ym-btnl"><div class="ym-mr"><div class="ym-btn"></div></div></div><div class="ym-bl" id="ym-bl"><div class="ym-br"><div class="ym-bc"></div></div></div></div></div><script src="${path}/Style/ada.min.js?Z1uadIsU7ScavcIXJ2"></script><div id="userdata_el" _ada_kp="14E692E5B1306E3A80101900150" _ada_kt="20150707234202" _ada_lvt="1436662258938" style="visibility: hidden; position: absolute;"></div></body></html>