<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html><head>
        <meta charset="utf-8">
        <title>乐库_咪咕音乐网_和你在一起</title>
        <meta name="keywords" content="咪咕音乐，彩铃，移动彩铃，手机彩铃，中国移动，12530，mp3，高品质音乐，无损音乐，在线听歌，歌曲下载，振铃，歌曲，铃音，特级会员，电台，mv，演唱会直播，音乐网站，音乐播放器">
        <meta name="description" content="咪咕音乐网是中国移动官方音乐门户，旨在提供音乐首发、高品质音乐试听、彩铃订购、歌曲下载、铃音管理、音乐电台、音乐视频等一站式音乐互动体验，好音乐尽在music.migu.cn！">    
    <link rel="stylesheet" href="http://img01.12530.com/res/css/global.min.css">
    <link rel="stylesheet" href="http://img01.12530.com/res/css/player_core.css">
    </head>
    <body style="overflow:hidden;">
        <iframe name="g_iframe" id="g_iframe" class="g-iframe" scrolling="auto" frameborder="0" src="about:blank"></iframe>
        <script type="text/javascript" src="//libs.baidu.com/jquery/1.7.2/jquery.min.js"></script>
        <!--如果cdn jQ加载不成功 加载本地jQ库 -->
        <script type="text/javascript">if(!window.jQuery){ var s = document.createElement('script');s.src = '//music.migu.cn/js/jquery-1.7.2.min.js';document.body.appendChild(s);}</script>
        <script type="text/javascript" src="//music.migu.cn/js/common.js"></script><div><div id="maskLevel" style="position:absolute;top:0;left:0;display:none;text-align:center;z-index:10000;"></div><div id="ym-window" style="position:absolute;z-index:199990;display:none"><div class="ym-tl" id="ym-tl"><div class="ym-tr"><div class="ym-tc" style="cursor:move;"><div class="ym-header-text"></div><div class="ym-header-tools"></div></div></div></div><div class="ym-ml" id="ym-ml"><div class="ym-mr"><div class="ym-mc"><div class="ym-body"></div></div></div></div><div class="ym-ml" id="ym-btnl"><div class="ym-mr"><div class="ym-btn"></div></div></div><div class="ym-bl" id="ym-bl"><div class="ym-br"><div class="ym-bc"></div></div></div></div></div>
    <script type="text/javascript" src="//music.migu.cn/js/player/player.flash.js"></script>
    <script type="text/javascript" src="//music.migu.cn/js/player/common.player.js"></script>
    <script type="text/javascript" src="//music.migu.cn/js/player/FlashACR.js"></script>
       <script>
        var Hash = function() {
                var d,e,f,a = this,
                b = document.documentMode,
                c = a.history,
                getPath = function() {
                    var b = a.location.href.indexOf("#");
                    return - 1 == b ? "": a.location.href.substr(b + 1)
                },
                h = function() {
                    var a = getPath();
                    a != e && (e = a, d(a, !1))
                },
                i = function() {
                    var a = "onhashchange",
                    b = a in document.body;
                    return b || (document.body.setAttribute(a, "return;"), b = "function" == typeof document.body[a]),
                    b && (void 0 === document.documentMode || document.documentMode > 7)
                },
                j = function() {
                    var b,
                    a = document.createElement();
                    return a.innerHTML = '<iframe src="javascript:void(0)" tabindex="-1" style="display: none;"></iframe>',
                    b = a.childNodes[0],
                    document.body.appendChild(b),
                    b
                },
                k = function(a) {
                    try {
                        var b = f.contentWindow.document;
                        b.open(),
                        b.write("<html><body>" + a + "</body></html>"),
                        b.close(),
                        e = a
                    } catch(c) {
                        setTimeout(function() {
                            k(a)
                        },
                        10)
                    }
                },
                l = function() {
                    try {
                        f = j()
                    } catch(b) {
                        return setTimeout(l, 10),
                        void 0
                    }
                    k(e);
                    var c = e;
                    setInterval(function() {
                        var b,
                        h;
                        try {
                            b = f.contentWindow.document.body.innerText,
                            b != c ? (c = b, a.location.hash = e = b, d(b, !0)) : (h = getPath(), h != e && k(h))
                        } catch(i) {}
                    },
                    50)
                };
                return {
                    init: function(f) {
                        d || (d = f, e = getPath(), f(e, !0), i() ? a.addEventListener ? a.addEventListener("hashchange", h, !1) : a.attachEvent && a.attachEvent("onhashchange", h) : a.ActiveXObject ? (!b || 8 > b) && l() : (c.navigationMode && (c.navigationMode = "compatible"), setInterval(h, 50)))
                    },
                    go: function(b) {
                        b != e && (f ? k(b) : (a.location.hash = e = b, d(b, !1)))
                    }
                }
            } ();

            var GDispatcher = (function() {
                var _lastPage = '',
                _igReg = /f=(.*?)/,
                _hReg = /\/?#.* /,
                _default = '/184_11.html';
                function _isIE10plus() {
                    var _ua = window.navigator.userAgent;
                    return (/msie\s+(.*?);/i.test(_ua) || /trident\/.+rv:([\d\.]+)/i.test(_ua)) && (parseInt(RegExp.$1) >= 10);
                };
                function _onHashChange(_hash,flag) {
                    
                    var _url,
                    _iframe =  window.top.document.getElementById('g_iframe');
                    if (!_hash || _igReg.test(_hash)) {
                        _url = _default;
                    } else {
                        _url = _hash.replace('/m/', '/#/');
                    }
                    
                    if(  _iframe.contentWindow.location.href == ('http://music.migu.cn/#'+_url) && !flag) return;
                    
                    _iframe.contentWindow.location.href = 'http://music.migu.cn'+(_url);
                    
                    if(_url == _default) window.top.location.hash ="";
                    else window.top.location.hash = _url;
                    _lastPage = _url;
                    $(_iframe).load(function(){
                       var title = $(this)[0].contentWindow.document.title;
                       if(title) window.top.document.title=title;
                    });
                };
                Hash.init(_onHashChange);               
            })(); 
       </script>
    

<object type="application/x-shockwave-flash" id="ContentForFlashACR" name="ContentForFlashACR" width="1" height="1" data="http://music.migu.cn/js/player/FlashACR.swf"><param name="allowscriptaccess" value="always"><param name="flashvars" value="partner=PartnerForFlashACR&amp;debugEnabled=true"></object><div class="g-btmbar" onselectstart="return false"><div id="id-playerbar" style="top: -7px;" class="m-playbar m-playbar-unlock"><div class="updn"><a data-action="lock" hidefocus="true" class="btn" href="javascript:void(0);"></a></div><div class="bg"></div><div title="展开播放条" class="hand"></div><div id="g_player" class="wrap"><div class="btns"><a title="上一首" class="prv" data-action="prev" hidefocus="true" href="javascript:void(0);">上一首</a><a title="播放/暂停" class="ply" data-action="play" hidefocus="true" href="javascript:void(0);">播放/暂停</a><a title="下一首" class="nxt" data-action="next" hidefocus="true" href="javascript:void(0);">下一首</a></div><div class="head"><a class="mask" hidefocus="true" href="javascript:void(0);"></a></div><div class="play"><div class="j-flag words"><span class="fc1 f-fl f14">请添加歌曲</span><span class="by f-fl"></span></div><div class="m-pbar"><div id="id-playbar" class="j-flag barbg"><div style="width: 0%;" class="j-flag rdy"></div><div style="width: 0%;" class="j-flag cur"><span style="cursor: default;" id="id-thumb" class="j-flag btn f-tdn f-alpha"></span></div></div><span class="j-flag time"><em>00:00</em>/ 00:00</span><div class="oper f-fl playing_tools"><a title="彩铃" class="icn icn-ring" data-action="color" hidefocus="true" href="javascript:void(0);">彩铃</a><a title="下载" class="icn icn-down" data-action="down" hidefocus="true" href="javascript:void(0);">下载</a><a title="收藏" class="icn icn-fav" data-action="like" hidefocus="true" href="javascript:void(0);">收藏</a><a title="分享" class="icn icn-share" data-action="share" hidefocus="true" href="javascript:void(0);">分享</a><div class="com_share_wrap sprt palyer_share" style="display:none;"><a href="javascript:void(0);" target="_blank" class="sprt com_share_sina" title="新浪微博" type="sina">新浪微博</a><a href="javascript:void(0);" class="sprt com_share_wx" title="微信" type="wx">微信</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_qzone" title="腾讯空间" type="qzone">腾讯空间</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_qq" title="腾讯QQ" type="qqWin">腾讯QQ</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_tx" title="腾讯微博" type="qq">腾讯微博</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_rr" title="人人网" type="renren">人人网</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_fx" title="飞信" type="feixin">飞信</a></div><span title="" class="icn icn-bq-gq" hidefocus="true" href="javascript:void(0);"><i class="current playing_b_item" data-action="play_b">全曲</i><i class="playing_g_item" data-action="play_g">彩铃</i></span></div></div></div><div style="width:35px;" class="ctrl f-fl f-pr"><div style="display: none;" id="id-volbar" class="j-flag m-vol"><div class="j-t barbg"></div><div id="id-volvaluebar" class="j-t vbg"><div style="height: 46.5px;" class="curr"></div><span style="top: 40.5px;" class="j-t btn f-alpha"></span></div></div><a class="j-flag icn icn-vol" data-action="setvolume" hidefocus="true" href="javascript:void(0);"></a></div><div style="width:115px;" class="ctrl f-fl f-pr"><a title="循环" class="j-flag icn icn-shuffle icn-loop" data-action="setmode" hidefocus="true" href="javascript:void(0);"></a><a title="随机" class="j-flag icn icn-shuffle icn-order" data-action="setmode" hidefocus="true" href="javascript:void(0);"></a><a title="单曲" class="j-flag icn icn-shuffle icn-single" data-action="setmode" hidefocus="true" href="javascript:void(0);"></a></div><div style="width:35px;" class="ctrl f-fl f-pr"><a class="j-flag icn icn-file icn-list s-fc3" data-action="playlist" hidefocus="true" title="播放列表" href="javascript:void(0);"></a></div><div style="width:2px;" class="ctrl f-fl f-pr"></div><div style="display:none;" id="g_playlist" class="list"><div class="listhd"><div class="listhdc"><h4 class="j-flag"><em class="mylist cur">临时列表</em>|<em class="">我的收藏</em>|<em class="">我的歌单</em></h4><span data-action="close" class="close j-flag">关闭</span></div></div><div class="listbd"><div class="listleft"><div class="listbdc list-tab-con"><div class="scroll j-flag panel_list" id="m-playlist-scroll1" _loaded="true"><div class="viewport fl" style="width: 98%;"><ul class="f-cb overview" id="playList_temp" type="tempList" style="top: 0px; width: 100%;"></ul></div><div class="scrollbar" style="height: 0px;"><div class="track" style="height: 0px;"><div class="thumb"><div class="end"></div></div></div></div></div><div style="display: none;" class="j-flag panel_list"><ul class="myclt-title tab-title clearfix"><li class="fl cur" type="song">歌曲</li><li class="fl" type="singer">歌手</li><li class="fl" type="album">专辑</li><li class="fl" type="ualbum">精选集</li></ul><div class="myalllst-con myclt-con myCollect"><div class="scroll" id="m-playlist-scroll2"><div class="viewport fl" style="width: 98%;"><div class="overview" type="myCollect"><ul class="tab-con f-cb list_span" type="song"></ul><ul class="mod_list tab-con list_span" style="display:none;" type="singer"></ul><ul class="mod_list tab-con list_span" style="display:none;" type="album"></ul><ul class="mod_list tab-con list_span" style="display:none;" type="ualbum"></ul></div></div><div class="scrollbar"><div class="track"><div class="thumb"></div></div></div></div></div></div><div class="j-flag pst_r panel_list" style="display: none;" id="my_songList_panel"><div class="nocnt"><i class="ico ico-sorry"></i><p class="tips-f20">对不起，需要登录后才能查看!</p><a href="http://music.migu.cn/webfront/UcLogin/login.do?t=login&amp;returnUrl=" class="f14">登录</a><em class="14">|</em><a href="http://music.migu.cn/webfront/UcLogin/login.do?t=register&amp;returnUrl=" class="f14">注册</a></div></div></div><ul class="listtools"><li><div class="col col-0"><input type="checkbox" id="playlist-allCbox" class="cke"></div><div class="col col-2"><a class="icn icn-all" hidefocus="true" href="javascript:void(0);">全选</a><a class="icn icn-delitem" hidefocus="true" href="javascript:void(0);">删除</a><a class="icn icn-pldown" hidefocus="true" href="javascript:void(0);" style="">全部播放</a></div><div class="col col-x3 fr"><a class="icn icn-clearlist fr" hidefocus="true" href="javascript:void(0);">清空列表</a><a class="icn icn-addMyPlaylist fr" hidefocus="true" href="javascript:void(0);" style="display: none;">添加到我的歌单</a><a class="icn icn-addMyCollect fr" hidefocus="true" href="javascript:void(0);" style="display: none;">添加到我的收藏</a></div></li></ul></div><div class="listlrc"><a href="javascript:void(0);" class="cover"><img src="http://img01.12530.com/res/images/default.jpg" alt="" style="cursor:default"></a><div class="lrc" id="lrcWrapper"><table id="lrcTable" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%"><tbody><tr><td>该歌曲暂无歌词！</td></tr></tbody></table></div></div></div></div></div></div></div><div class="m-playlist-overlay" id="m-playlist-overlay" style="left: 50px; top: 100px; display:none;width:260px;overflow: auto;"><span class="icn icn-overlay-sj ml20"></span><div class="m-playlist-overlay-con"><ul class="m-playlist-o-list"></ul><div class="overlay-add-wrap"><span class="icn overlay-add-btn white">新建歌单</span><span class="overlay-add-info clearfix" style="display:none"><input type="text" value="我的音乐" class="fl icn input_songList"><a class="icn icn-overyay-sure fr icn-creat-add" href="javascript:void(0);"></a></span></div></div></div><div class="m-playlist-overlay" id="m-removelist-overlay" style="left: 82px; top: 257px; width:110px; display:none;"><span class="icn icn-overlay-sj ml20"></span><div class="m-playlist-overlay-con" style="padding:10px;"><p class="pb5">删除歌单</p><div class="clearfix"><a class="icn icn-overyay-sure fl mr10" href="javascript:void(0);"></a><a class="icn icn-overyay-cancel fr" href="javascript:void(0);"></a></div></div></div></body></html>