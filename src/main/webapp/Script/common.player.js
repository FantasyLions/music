(function(){
	var selecteItem=null;   
    var ui_playerbar=null;
    var ui_player=null;
    var ui_playlist=null;
    var list_content=null;
    var playMode=0;
	var appName = 'Player';
	var UserIsLogin = (common.isLogin()=='true');
	var _isListFrist = true;
	var uLikeType = {all:-1,song:1,singer:2,album:3,ualbum:4,user:5};
	var urlList = {
		//获得歌曲信息
		getSongInfo:'http://music.migu.cn/webfront/player/findsong.do',
		//获得歌词
		getSongLyr:'http://music.migu.cn/webfront/player/lyrics.do',
		//获得用户收藏
		getCollect:'http://music.migu.cn/webfront/collect/findcollect.do',
		//添加收藏
		addCollect:'http://music.migu.cn/webfront/collect/addcollect.do',
		//删除收藏
		delCollect:'http://music.migu.cn/webfront/collect/delcollect.do',
		//获得歌单
		getSongList:'http://music.migu.cn/webfront/playlist/getPlayList.do',
		//创建歌单
		creatSongList:'http://music.migu.cn/webfront/playlist/creatPlayList.do',
		//删除歌单
		deleteSongList:'http://music.migu.cn/webfront/playlist/deletePlayList.do',
		//修改歌单名：
		renameSongList:'http://music.migu.cn/webfront/playlist/changePlayList.do',
		//获得歌单歌曲列表
		getListInfo:'http://music.migu.cn/webfront/playlist/getPlayListDetail.do',
		//添加歌曲到歌单
		addSongToList:'http://music.migu.cn/webfront/playlist/addPlayListTone.do',
		//删除歌曲到歌单
		deleteSongToList:'http://music.migu.cn/webfront/playlist/deletePlayListTone.do',
		//歌曲详细路径
		songInfoUrl:'http://music.migu.cn/webfront/song/songdetail.do',
		//歌手详细路径
		singerInfoUrl:'http://music.migu.cn/#/singer/',
		//专辑详细路径
		albumInfoUrl:'http://music.migu.cn/#/album/',
		//精选集详细路径
		jxjInfoUrl:'http://music.migu.cn/#/ualbum/',
		//定购页面详细路径
		toOrder:'http://music.migu.cn/webfront/order/showOrder.do'
		//通过专辑，歌手，
	};
	var getHTML = {
		//歌曲列
		songLiHtml:'<li class="js-iparent" data-action="iplay" song_id="${songId}"><div class="col col-0"><input type="checkbox" class="cke"/></div><div class="col col-1"><div class="playicn"></div></div><div class="col col-2">${songName}</div><div class="col col-3"><span title="${singerName}">${singerName}</span></div><div class="col col-4"><div class="icns"><a href="javascript:void(0);" hidefocus="true" data-action="icolor" class="icn icn-ring" title="彩铃">彩铃</a><a href="javascript:void(0);" hidefocus="true" data-action="idown" class="icn icn-down" title="下载">下载</a><a href="javascript:void(0);" hidefocus="true" data-action="ilike" class="icn icn-fav" title="收藏">收藏</a><a href="javascript:void(0);" hidefocus="true" data-action="iadd" class="icn icn-add" title="添加">添加</a></div></div><div class="col col-5"><div class="icns" style="width:35px;"><a href="javascript:void(0);" hidefocus="true" data-action="idelete" class="icn icn-del" title="删除">删除</a></div></div></li>',
		songLiHtml_2:'<li class="js-iparent" song_id="${songId}"><div class="col col-0"><input type="checkbox" class="cke"/></div><div class="col col-1"><div class="playicn"></div></div><div class="col col-2">${songName}</div><div class="col col-3"><span title="${singerName}">${singerName}</span></div><div class="col col-4"><div class="icns"><a href="javascript:void(0);" hidefocus="true" data-action="icolor" class="icn icn-ring" title="彩铃">彩铃</a><a href="javascript:void(0);" hidefocus="true" data-action="idown" class="icn icn-down" title="下载">下载</a><a href="javascript:void(0);" hidefocus="true" data-action="ilike" class="icn icn-fav" title="收藏">收藏</a><a href="javascript:void(0);" hidefocus="true" data-action="iadd" class="icn icn-add" title="添加">添加</a></div></div><div class="col col-5"><div class="icns" style="width:35px;"><a href="javascript:void(0);" hidefocus="true" class="icn icn-del" title="删除">删除</a></div></div></li>',
		//没登陆
		noLoginHtml:'<div class="nocnt"><i class="ico ico-sorry"></i><p class="tips-f20">对不起，需要登录后才能查看!</p><a href="http://music.migu.cn/webfront/UcLogin/login.do?t=login&returnUrl=" class="f14">登录</a><em class="14">|</em><a href="http://music.migu.cn/webfront/UcLogin/login.do?t=register&returnUrl=" class="f14">注册</a></div>',
		//没收藏
		noCollectListHtml:'<div class="nocnt"><p class="tips-f20">暂无收藏内容！</p><p class="f12 lh24">可以从网站的音乐列表和曲库里<br />将歌曲、歌手、专辑等内容<i class="icn-fav01 mr5 ml5" style=""></i>添加到"我的收藏"！</p></div>',
		//图片列
		imgListHtml:'<li item_id="${itemid}"><a class="mod_poster" href="${itemHref}"><img src="${poster}" title="${itemname}" alt="${itemname}"><p class="tools" style="display:none"><input type="checkbox" class="icn-modlist-checkbox fl"> <span class="icn-songlist icn-songlist-play icn-play-pos fr" title="播放"></span></p><span class="icn-img-del icn-songlist icn-songlist-del icn-del-pos fr" title="删除"></span></a><p class="mv_singer"><a href="${itemHref}">${itemname}</a></p></li>',
		//歌单没歌曲
		noSongListHtml:'<div class="nocnt"><p class="tips-f20">本歌单暂无歌曲！</p><p class="f12 lh24">可以从"<em style="color:#458fce;">临时列表</em>"和"<em style="color:#458fce;">我的收藏</em>"里，将歌曲<i class="icn-add01 mr5 ml5" style=""></i>添加到本歌单中！</p></div>',
		//歌单列
		songListHtml:'<li class="fl" l_id={playListID}><div class="myslt-li-t" ><em class="name">${listName}</em><em>(${totalCount})</em><i class="icn-songlist icn-songlist-edit" title="编辑"></i><i class="icn-songlist icn-songlist-del" title="删除"></i></div><div class="edit-con" style="display:none;"><span class="overlay-add-info clearfix"><input type="text" class="fl icn mr5 input_rename" value=""><a href="javascript:void(0);" class="icn icn-overyay-sure fl icn-rename"></a><i class="icn-songlist icn-songlist-edit-cancel mt5 ml5"></i></span></div></li>'
	};	
	var actionMap={
        // lock-锁定播放条
        lock:function(event){
            var lock=!Boolean(ui_playerbar.data("lock"));
            playerUI.setLock(lock);
        },
        // play-播放暂停
        play:function(){
            if(FlashACR.getIsPlaying()){
                FlashACR.pause();
                ui_player.find(".ply").removeClass("pas");
            }else{
                FlashACR.proceed();
                ui_player.find(".ply").addClass("pas");
            }
        },
        //调整播放进度
        seekto:function(per){
            var position=Math.min(FlashACR.getCurrentDuration()-200,FlashACR.getTotalDuration()*per);
            FlashACR.seek(position);
        },
        // prev-上一首
        prev:function(){
            if(selecteItem){
                var p=selecteItem.prev();
                if(p.length>0){
                    p.click();
                }else{
                    var arr=selecteItem.parent().children();
                    arr[arr.length-1].click();
                }
            }
        },
        // next-下一首
        next:function(){
            if(selecteItem){
                var p=selecteItem.next();
                if(p.length>0){
                    p.click();
                }else{
                    selecteItem.parent().children()[0].click();
                }
            }
        },
        //随机下一首
        ranplay:function(){
            var arr= list_content.children();
            var n=Math.floor(Math.random()*arr.length);
            arr[n].click();
        },
        //重复播放
        replay:function(){
            if(selecteItem){
                actionMap.play();
            }
        },
		// down-下载
		down:function(event){
			event.stopPropagation();//停止事件传递
			var target = $(event.target);
			var songid = target.parent('.playing_tools').attr('song_id');
			if(songid){
				var url = urlList.toOrder +'?songId='+songid+'&type=down';
				window.open(url,'_blank');	
			}else{
				common.util.showPrompt(target,'请添加歌曲','','player_tooltip');
			}
			return false;
		},
        // like-收藏
        like:function(event){
			event.stopPropagation();//停止事件传递
			var target = $(event.target);
			var songid = target.parent('.playing_tools').attr('song_id');
			if(songid){
				playerUI.collectSong(target,songid,true,null,function(){
					$('.panel_list:eq(1)').find('.tab-title li[type="song"]').trigger('click')	;
					//$('.listtools .icn-pldown').hide();
				});
			}else{
				common.util.showPrompt(target,'请添加歌曲','','player_tooltip');
			}
			return false;
        },
        // color-彩铃
        color:function(event){
			event.stopPropagation();//停止事件传递
            var target = $(event.target);
			var songid = target.parent('.playing_tools').attr('song_id');
			if(songid){
				var url = urlList.toOrder +'?songId='+songid+'&type=color';
				window.open(url,'_blank');
			}else{
				common.util.showPrompt(target,'请添加歌曲','','player_tooltip');
			}
			return false;
        },
		// share-收藏
		share:function(event){
			event.stopPropagation();
			var target = $(event.target);
			var songid = target.parent('.playing_tools').attr('song_id');
			if(songid){
				$('.palyer_share').attr('itemid',songid).toggle();
				var _this = this;
				$('.palyer_share').hover(function(){
					if (_this._shareTimer){
						clearTimeout(_this._shareTimer);
					}
					$(this).show();
				},function(){
					if(_this._shareTimer){
						clearTimeout(_this._shareTimer);
					}
					$(this).hide();
				});
				if(this._shareTimer){
					clearTimeout(this._shareTimer);
				}
				this._shareTimer = setTimeout(function(){
					$('.palyer_share').hide();
				}, 2000);

			}else{
				common.util.showPrompt(target,'请添加歌曲','','player_tooltip');
			}
			return false;
		},
		// play_b-标清
		play_b:function(event){		
			event.stopPropagation();//停止事件传递
			var target = $(event.target);
			if(selecteItem && !target.hasClass('current')){
				var data = selecteItem.data("songItem");
				data.isColor = false;
				selecteItem.data("songItem",data);
				ui_player.find(".ply").removeClass("pas");
				FlashACR.load(encodeURI(data.mp3).replace(/\+/g,'%2B'));
				$('.icn-bq-gq>i').removeClass('current');
				target.addClass('current');
			}
			return false;
		},
		// play_g-高清
		play_g:function(event){		
			event.stopPropagation();//停止事件传递
			var target = $(event.target);
			if(selecteItem && !target.hasClass('current')){
				var data = selecteItem.data("songItem");
				if(data.cmp3 && data.cmp3!=""){					
					ui_player.find(".ply").removeClass("pas");
					FlashACR.load(encodeURI(data.cmp3).replace(/\+/g,'%2B')); 
					$('.icn-bq-gq>i').removeClass('current');
					target.addClass('current');
				}else{
					common.util.showPrompt(target,'该歌曲没有彩铃版本','','player_tooltip');
				}
			}
			return false;
		},
        // setvolume-设置音量
        setvolume:function(){
            $(".m-vol").toggle();
			playerUI._volTimeout=setTimeout(function(){
				$(".m-vol").hide();
			},1500);
        },
        // setmode-设置循环模式
        setmode:function(event){			
			var mode = 0;
			var target = $(event.target);
			if(target.hasClass('icn-loop')) mode=0;
			if(target.hasClass('icn-single')) mode=1;
			if(target.hasClass('icn-order')) mode=2;            
            playerUI.setPlayMode(mode);
        },
        // playlist-打开播放列表
        playlist:function(){
            ui_playlist.toggle();
			//打开列表时，初始化临时列表滚动条
			var tempList = $('.listhdc em:eq(0)');
			if(ui_playlist.is(':visible') && tempList.hasClass('cur')){
				tempList.trigger('click');
			}
        },
        // clear-清空播放列表
        clear:function(){
            list_content.empty();
			FlashACR.stop();
            FlashACR.setProperty("songList",[]);
            FlashACR.flush();  
			player_lyrics_scroll.clear();			
			$(".words .fc1").text(''); //歌曲名清空
			$(".words .by").text('');
			ui_player.find(".ply").removeClass("pas");
        },
        // close-关闭播放列表
        close:function(){
            ui_playlist.hide();
        },
        // iplay-列表项播放
        iplay:function(event){
			event.stopPropagation();//停止事件传递
			if(event.target && !$(event.target).is(':checkbox')){
				var _this=$(event.currentTarget);				
				if(selecteItem){
					selecteItem.removeClass("z-sel");
				}
				_this.addClass("z-sel");
				_this.siblings('li').find('.playicn').hide();
				_this.find('.playicn').show();
				selecteItem=_this;				
				playerUI.playSong(_this.data("songItem"));
			}
        },
        // ilike-列表项收藏
        ilike:function(event){
            event.stopPropagation();//停止事件传递
            var _this=$(event.currentTarget);
            var el_item=_this.parents("li");			
            var item=el_item.data("songItem");
			var s_id = item ? item.songId : el_item.attr('song_id');
			playerUI.collectSong(_this,s_id,true,null,function(){
				$('.panel_list:eq(1)').find('.tab-title li[type="song"]').trigger('click');	
				//$('.listtools .icn-pldown').hide();
			});
        },
		//idown - 下载歌曲
		idown:function(event){
			event.stopPropagation();//停止事件传递
			var _this=$(event.currentTarget);
            var el_item=_this.parents("li");			
            var item=el_item.data("songItem");
			var s_id = item ? item.songId : el_item.attr('song_id');
			var url = urlList.toOrder +'?songId='+s_id+'&type=down';
			window.open(url,'_blank');
		},
		icolor:function(event){
			event.stopPropagation();//停止事件传递
			var _this=$(event.currentTarget);
            var el_item=_this.parents("li");			
            var item=el_item.data("songItem");
			var s_id = item ? item.songId : el_item.attr('song_id');
			var url = urlList.toOrder +'?songId='+s_id+'&type=color';
			window.open(url,'_blank');
		},
		//isadd - 添加到歌单
		iadd:function(event){
			event.stopPropagation();
			var _this=$(event.currentTarget);
			if(UserIsLogin){
				var el_item=_this.parents("li");
				//显示选择状态
				el_item.addClass('z-sel');
				el_item.find(".icns").show();	

				var item=el_item.data("songItem");
				var s_id = item ? item.songId : el_item.attr('song_id');				
				var tarObj = $(event.currentTarget);
				var div = $('#m-playlist-overlay').attr('song_id',s_id);
				//设置弹出框高度
				div.height($(window).height()-tarObj.offset().top-30).show();
				playerUI._showToolDiv(div,tarObj,false,function(){
					if(selecteItem[0] && el_item[0] && selecteItem[0] != el_item[0]){
						el_item.removeClass('z-sel');
					}
					el_item.find(".icns").hide();	
				});
			}else{
				common.util.showPrompt(_this,'请先登录','','player_tooltip');
			}
		},
        // idelete-列表项删除
        idelete:function(event){
            event.stopPropagation();
			var arr= list_content.children();
			if(arr.length==1){
				this.clear();
			}else{
				var _this=$(event.currentTarget);			
				var el_item=_this.parents("li");
				if(selecteItem[0] && el_item[0] && selecteItem[0] == el_item[0]){
					actionMap.next();
				}
				//var item=el_item.data("songItem");
				var item = el_item.attr('song_id');
				playerUI.delSong(item);			
				el_item.remove();
			}
        }
    };
	var playerUI = {
		_volTimeout:null,
		_testSListName:function(name){
			var re  = /[\'\"#%&|*^+`{}’”\-<>\/\\]/i;
			if(re.test(name)){
				return {flag:false,text:'请勿输入特殊字符'};
			}else if( name != common.util.subString(name,32,false)){
				return {flag:false,text:'最多输入16个汉字或32个字符'};
			}else if($.trim(name)==''){
				return {flag:false,text:'歌单名字不能为空'};
			}
			return {flag:true};
		},
		//改变列表宽度
		change_w:function(){
			$(".scroll").each(function(){
				if($(this).find(".scrollbar").hasClass("disable"))
				{
					$(this).find(".viewport").css("width","100%");
					$(this).find(".overview").css("width","100%");
				}
				else
				{
					$(this).find(".viewport").css("width","98%");	
				}
			});
		} ,
		initPlayerUI:function(){
			var _this = this;
			//歌曲列表
			ui_playlist.delegate('.js-iparent','mouseover',function(event){
				$(this).find(".icns").show();	
				//$(this).find(".playicn").show();
			});
			ui_playlist.delegate('.js-iparent','mouseout',function(event){
				$(this).find(".icns").hide();
			});
			 //音量调节
			$("#id-volvaluebar").click(function(event){
				var per=1-(_this.mouseCoords(event).y-$(this).offset().top)/$(this).height();
				_this.setVolume(per);				
			});
			$("#id-volbar .btn").mousedown(function(event){
				$("#id-volbar").bind("mousemove",function(event){
					var bar=$(this).find(".vbg");
					var per=1-(_this.mouseCoords(event).y-$(bar).offset().top)/$(bar).height();
					per=Math.max(0,Math.min(per,1));
					$(this).find(".curr").height(93*per);
					$(this).find(".btn").css("top",81*(1-per));
					$(this).data("vol_value",per);
				});
			});
			$("#id-volbar").mouseup(function(event){
				var value=$(this).data("vol_value");
				$(this).unbind("mousemove");
				_this.setVolume(value);
			});
			$(".m-vol").hover(function(){
				clearTimeout(_this._volTimeout);
				$(this).show();
			},function(){ 
				clearTimeout(_this._volTimeout);
				$(this).hide();
			});
			//播放进度调节
			$("#id-playbar").click(function(event){
				var per=(_this.mouseCoords(event).x-$(this).offset().left)/$(this).width();
				per=Math.max(0,Math.min(per,1));
				actionMap.seekto(per);
			});
			$("#id-thumb").mousedown(function(event){
				$("#id-playbar").bind("mousemove",function(event){
					var per=(_this.mouseCoords(event).x-$(this).offset().left)/$(this).width();
					per=Math.max(0,Math.min(per,1));
					$(this).find(".cur").width(per*100+"%");
				}).data("draging",true);
			});
			$("#g_player").mouseup(function(event){
				if($("#id-playbar").data("draging")){
					$("#id-playbar").unbind("mousemove").data("draging",false);
				}
			});
			//展开/收起播放条
			ui_playerbar.mouseenter(function(event){
				_this.viewPlayer(true);
			}).mouseleave(function(event){
				if(!ui_playerbar.data("lock")){
					_this.viewPlayer(false);
				}
			});		
			//分享面板
			$('.palyer_share a').unbind('click').bind('click',function(event){
				event.preventDefault();
				event.stopPropagation();
				var sid = $(this).parent('.palyer_share').attr('itemid');
				var shareType = $(this).attr('type');
				var info = common.getItemInfo(sid,'song');
				if(info.code== "000000" && info.msg){
					info = info.msg;
					shareOpenf(shareType,info.itemname,'',sid,'song',info.itempic ||'');
				}
			});
			
			//三个面板切换
			$('.listhdc em').click(function(){
				var i=$(this).index();
				$(this).addClass('cur').siblings().removeClass("cur");	
				var panel = $(".list-tab-con .panel_list").eq(i);

				var $scrollbar=$('#m-playlist-scroll'+(i+1));
				$scrollbar.tinyscrollbar();
				var scrollbar = $scrollbar.data("plugin_tinyscrollbar");
				//显示
				if(panel.attr('_loaded') =='true'){
					panel.show().siblings().hide();
				}else{
					panel.find('.tab-title li:eq(0)').trigger("click");
					panel.attr('_loaded','true').show().siblings().hide();
					if(panel.attr('id') =='my_songList_panel'){
						var h1 = panel.find('ul.myslt-title').height();
						var span =panel.find('.mySongList');
						span.height((span.height()-h1));
					}
				}
				//全部播放按钮显示隐藏
				if(i==0 && panel.is(':visible')){
					$('.listtools .icn-pldown').hide();
					$('.listtools .icn-addMyPlaylist,.listtools .icn-addMyCollect').show();
				}else{					
					$('.listtools .icn-pldown').show();
					if(i==1 && !panel.find('.tab-title li:eq(0)').hasClass('cur')) $('.listtools .icn-pldown').hide();
					$('.listtools .icn-addMyPlaylist,.listtools .icn-addMyCollect').hide();
				}
				//全选框是否勾选
				var ul = i==0? panel.find('ul:visible') : panel.find('ul.list_span:visible');
				if(ul.find('li').length !=0 &&ul.find('li').length == ul.find('li :checkbox:checked').length){
					$('#playlist-allCbox').prop('checked',true);
				}else{
					$('#playlist-allCbox').removeAttr('checked');
				}
				//end
				if(scrollbar) scrollbar.update();				
				playerUI.change_w();
			});			
			//面板里的小标签切换
			ui_playlist.delegate('.tab-title li','click',function(event){
				event.stopPropagation();
				var target = $(event.target);
				//i为小按钮
				if(target.is('i')){					
					return ;
				}
				var i=$(this).index(),j=$(this).parents(".panel_list:first").index()+1;
				$(this).addClass("cur").siblings().removeClass("cur");
				var list_panel = $(this).parent().siblings(".myalllst-con");				
				if(list_panel.hasClass('myCollect')){
					userCollect.init(function($span,$scroll){
						$scroll.tinyscrollbar();
						var scrollbar = $scroll.data("plugin_tinyscrollbar");						
						$span.show().siblings(".list_span").hide();
						if(scrollbar) scrollbar.update();
						playerUI.change_w();
						$('.listtools .icn-pldown').hide();
						if($span.attr('type')=='song' && $span.is(':visible')){
							$('.listtools .icn-pldown').show();
						}
					});
				}else if(list_panel.hasClass('mySongList')){					
					userSongList.init(function($span,$scroll){
						$scroll.tinyscrollbar();
						var scrollbar = $scroll.data("plugin_tinyscrollbar");						
						$span.show().siblings(".list_span").hide();
						if(scrollbar) scrollbar.update();
						playerUI.change_w();
					});
				}
			});

			userCollect.initEvent();
			userSongList.initList();
			userSongList.initEvent();

			/* 以下依赖于显示的面板*/
			//反选
			$('#playlist-allCbox').click(function(){
				var checked = $(this).is(':checked');
				var ul = $('.overview:visible');
				if(ul.attr('type') != 'tempList'){
					ul = ul.find('.list_span:visible');
					var imgLiType = ul.attr('type');
				}
				var checkbox = ul.find('li :checkbox');	
				if(checked){
					$(checkbox).attr('checked','checked');
					if(imgLiType && imgLiType!='song'){
						ul.find('.mod_poster').addClass('selected');
					}
				}else{
					$(checkbox).removeAttr('checked');
					if(imgLiType && imgLiType!='song'){
						ul.find('.mod_poster').removeClass('selected');
					}
				}				
			});
			//全选
			$('.listtools .icn-all').click(function(){
				var ul = $('.overview:visible');
				if(ul.attr('type') != 'tempList'){
					ul = ul.find('.list_span:visible');
					var imgLiType = ul.attr('type');
				}
				ul.find('li :checkbox').attr('checked','checked');
				$('#playlist-allCbox').attr('checked','checked');
				if(imgLiType && imgLiType!='song'){
					ul.find('.mod_poster').addClass('selected');
				}
			});
			//删除
			$('.listtools .icn-delitem').click(function(){
				var ul = $('.overview:visible');
				
				var type = ul.attr('type');
				if(type != 'tempList'){
					ul = ul.find('.list_span:visible');
				}
				var checkbox = ul.find('li :checkbox:checked');
				var arr=[], positions = [];
				checkbox.each(function(){
					var li = $(this).parents('li');
					var data = li.data('songItem');
					arr.push(data?data.songId:(li.attr('song_id') || li.attr('item_id')));
					positions.push(li.index());
					li.remove();
				});
				if(arr.length ==0){
					common.util.showPrompt($(this),'请选择歌曲','','player_tooltip');
					return false;
				}
				if( type == 'tempList'){					
					_this.delSongList(arr);
				}else if(type == 'myCollect'){
					 var t = ul.attr('type');
					_this.collectSong(null,arr.join(','),false,uLikeType[t],function(){
						var ul = $('.overview:visible').find('.list_span:visible'); 
						if(ul.attr('type') !='song'){
						ul.find("li").each(function(){
							if(($(this).index()+1)%5==0){
								$(this).css("margin-right","0");	
							}else{
								$(this).removeAttr('style');
							}
						});	
						}
					});
				}else if(type == 'mySongList'){
					var li = $('#my_songList_panel').find('.myslt-title li.cur');
					var name = li.find('.name').text();
					name = $.trim(name);
					var lid = li.attr('l_id');
					userSongList.deleteSongToList(lid,name,1,arr.join(','),positions.join(','));
				}
				common.util.showPrompt($(this),'删除成功','','player_tooltip');
			});
			//清空列表
			$('.listtools .icn-clearlist').click(function(){
				var ul = $('.overview:visible');
				var type = ul.attr('type');
				if(type != 'tempList'){
					ul = ul.find('.list_span:visible');
				}
				if( type == 'tempList'){					
					_this.clearList();
				}else if(type == 'myCollect'){
					var lis = ul.find('li');
					var ulike = ul.index()+1;
					var itemids = [];
					lis.each(function(){
						itemids.push($(this).attr('song_id') || $(this).attr('item_id'));
					});
					_this.collectSong(null,itemids.join(','),false,ulike);
					ul.empty();
				}else if(type == 'mySongList'){
					var li = $('#my_songList_panel').find('.myslt-title li.cur');
					var name =li.find('.name').text();
					name = $.trim(name);
					var lid = li.attr('l_id');
					userSongList.deleteSongToList(lid,name,0);
					ul.empty();
				}

			});
			//全部播放
			$('.listtools .icn-pldown').click(function(){
				var ul = $('.overview:visible');
				
				var type = ul.attr('type');
				if(type != 'tempList'){
					ul = ul.find('.list_span:visible');
					var checkbox = ul.find('li :checkbox:checked');
					var arr=[];
					checkbox.each(function(){
						var li = $(this).parents('li');
						var sid = li.attr('song_id');
						arr.push(sid);
					});
					if(arr.length ==0){
						common.util.showPrompt($(this),'请选择歌曲','','player_tooltip');
					}else{
						playerUI.playList(arr);
						common.util.showPrompt($(this),'播放成功','','player_tooltip');
					}
				}
			});
			//批量添加到我的收藏
			$('.listtools .icn-addMyCollect').click(function(){
				var ul = $('.overview:visible');				
				var type = ul.attr('type');
				if(type == 'tempList'){
					var checkbox = ul.find('li :checkbox:checked');
					var arr=[];
					checkbox.each(function(){
						var li = $(this).parents('li');
						var data = li.data('songItem');
						arr.push(data?data.songId:(li.attr('song_id') || li.attr('item_id')));						
					});
					if(arr.length ==0){
						common.util.showPrompt($(this),'请选择歌曲','','player_tooltip');
						return false;
					}else{
						_this.collectSong($(this),arr.join(','));
					}
				}
			});
			//批量添加到歌单
			$('.listtools .icn-addMyPlaylist').click(function(){
				var ul = $('.overview:visible');				
				var type = ul.attr('type');
				if(type == 'tempList'){
					var checkbox = ul.find('li :checkbox:checked');
					var arr=[];
					checkbox.each(function(){
						var li = $(this).parents('li');
						var data = li.data('songItem');
						arr.push(data?data.songId:(li.attr('song_id') || li.attr('item_id')));						
					});
					if(arr.length ==0){
						common.util.showPrompt($(this),'请选择歌曲','','player_tooltip');
						return false;
					}else{
						if(UserIsLogin){
							var tarObj = $(this);
							var div = $('#m-playlist-overlay').attr('song_id',arr.join(',')).show();							
							//div.height($(window).height()-tarObj.offset().top-30).show();
							playerUI._showToolDiv(div,tarObj,true);
						}else{
							common.showLoginWin();
						}
					}
				}
			});
		},
		//Flash工具集(Audio+Cookie+Remote)
		initFlashACR:function(){
			var _this = this;
			FlashACR.addEventListener("AudioReady",function(){
				
					actionMap.play();
				
			});
			FlashACR.addEventListener("Loading",function(){
				var per=FlashACR.getDownloadProgress()*100;
				$(".m-pbar .rdy").width(per+"%");
			});
			FlashACR.addEventListener("SecurityError",function(){
			   // print("SecurityError");
			});
			FlashACR.addEventListener("IOError",function(){
			   // print("IOError");
			});
			FlashACR.addEventListener("Seek",function(position){
				var duration=FlashACR.getTotalDuration();
				var per = position/duration*100;
				if(!$("#id-playbar").data("draging")){
					$(".m-pbar .cur").width(per+"%");
				}
				$(".m-pbar .time").html("<em>"+_this.formatTime(position/1000)+"</em>/"+_this.formatTime(duration/1000));
			});
			FlashACR.addEventListener("SoundComplete",function(){
			   // print("SoundComplete");
				if(playMode==1){
					actionMap.replay();
				}else if(playMode==2){
					actionMap.ranplay();
				}else{
					actionMap.next();
				}
			});
			//工具就绪
			FlashACR.addEventListener("Ready",function(){
				FlashACR.getLocal("migu_com", "/");
				// 获取循环模式,音量,锁定状态,歌曲列表
				_this.setPlayMode(FlashACR.getProperty("playMode"));
				_this.setVolume(FlashACR.getProperty("volume"));
				_this.setLock(FlashACR.getProperty("lock"));
				var songLists = FlashACR.getProperty("songList");
				if(songLists.length>50){
					 FlashACR.setProperty("songList",[]);
					 FlashACR.flush();
					 $(".words .fc1").text('请添加歌曲');
				}else if(songLists.length>0&&songLists.length<50){
					_this.addSongList(songLists,true,true);
					list_content.children()[0].click();
					FlashACR.stop();
					ui_player.find(".ply").removeClass("pas");
				}
			});
		},
		//查询所有带data-action属性的标签,设置相应的处理函数
		setAction:function(root){
			root.find("*[data-action]").each(function(index,domEle){
				$(this).unbind('click').click(function(event){
					actionMap[$(this).attr("data-action")](event);
				});
			});
		},
		//获取鼠标位置
		mouseCoords:function(ev){
			if(ev.pageX || ev.pageY){
				return {x:ev.pageX, y:ev.pageY};
			}
			return {
				x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
				y:ev.clientY + document.body.scrollTop  - document.body.clientTop
			};
		},
		//格式化时间
		formatTime:function(num){
			num=isNaN(num)?0:num;
			var mm=Math.floor(num/60);
			var ss=Math.floor(num%60);
			return (mm<10?"0"+mm:mm)+":"+(ss<10?"0"+ss:ss);
		},
		//设置音量
		setVolume:function(per){
			per=isNaN(per)?0.8:per;
			per=Math.max(0,Math.min(per,1));
			$("#id-volbar").data("vol_value",per);
			$("#id-volbar").find(".curr").height(93*per);
			$("#id-volbar").find(".btn").css("top",81*(1-per));
			$(".icn-vol").toggleClass("icn-volno",per<0.05);
			FlashACR.setVolume(per);
			FlashACR.setProperty("volume",per);
		},
		//显示/隐藏播放条
		viewPlayer:function(b){
			ui_playerbar.stop();
			ui_playerbar.animate({top:b?-53:-7},200);
		} ,   
		//设置循环模式
		setPlayMode:function(mode){
			if(!Boolean(mode)){
				mode=0;
			}
			playMode=mode;
			var arr1=[".icn-loop",".icn-single",".icn-order"];
			var arr2=["icn-loop-fos","icn-single-fos","icn-order-fos"];
			var arr3=["循环","单首","随机"];
			var ui=$(".j-flag[data-action='setmode']");
			ui.removeClass(arr2.join(' '));
			ui.filter(arr1[mode]).addClass(arr2[mode]);
			FlashACR.setProperty("playMode",mode);
			FlashACR.flush();
		},
		//清除播放列表
		clearList:function(){
			actionMap.clear();
		},
		//设置播放条锁定状态
		setLock:function(lock){
			if(lock==null || lock==undefined || lock===""){
				lock=true;
			}
			ui_playerbar.toggleClass("m-playbar-lock",lock);
			ui_playerbar.toggleClass("m-playbar-unlock",!lock);
			ui_playerbar.data("lock",lock);
			if(!lock){
				this.viewPlayer(false);
			}else{
				this.viewPlayer(true);
			}
			FlashACR.setProperty("lock",lock);
			FlashACR.flush();
		},
		//根据歌曲id(数组)获得信息并播放。isappend为true则为添加。isInplayer用于提示框是否是在播放器内。
		playList:function(arr,type,isappend,target,isInplayer,isColor){	
			if(common.util.hasPlayerVersion('10.0.0')){
				var _this = playerUI;
				var url = urlList.getSongInfo;
				var songid = '';
				if($.isArray(arr)){
					songid = arr.join(',');
				}else{
					songid = arr;
				}	
				type = type || 'song';
				url += '?itemid='+songid+'&type='+type;
				if(target ){
					var _rex = $(target).attr('data_log') || $(target).parent('.icon_tools').attr('data_log');
					_rex ? (url += '&'+_rex):'';
				};
				FlashACR.get(url,null,function(itemData){
					if(itemData){
						var obj=JSON.parse(itemData);
						if(obj.code=='000000'){
							if(obj.msg.length > 0){
								
								if(isColor){
									var arr = obj.msg,item;
									for(var i=0,len=arr.length;i<len;i++){
										item = arr[i];
										//item.mp3 = null;//-------------------彩铃;
										//item.mp4 = null;
										item.isColor = true;			
									}									
								}
								_this.addSongList(obj.msg,isappend);
								if(target){
									isInplayer ? common.util.showPrompt(target,isappend?'添加成功':'播放成功'):g_iframe.contentWindow.common.util.showPrompt(target,isappend?'添加成功':'播放成功');
								}
							}else{
								isInplayer ? common.util.showPrompt(target,'试听引入中'): g_iframe.contentWindow.common.util.showPrompt(target,'试听引入中');
								return false;
							}
						}else{
							$(".words .fc1").text('加载失败');
							if(target){
								isInplayer ? common.util.showPrompt(target,isappend?'添加失败':'播放失败'):g_iframe.contentWindow.common.util.showPrompt(target,isappend?'添加失败':'播放失败');
							}
						}
					}else{
						$(".words .fc1").text('加载失败');
						if(target) common.util.showPrompt(target,isappend?'添加失败':'播放失败');
					}
				});
			}else{
				//更新flash版本
				common.showFlashUpateWin();
			}
		},
		addSongList:function(arr,isappend,nocatch){
			var item;
			var songId;
			var item_el=null;
			if(!isappend){
				arr.reverse(); //若是多个歌曲播放,需要倒序，这样在页面显示上才正确
			}
			for(var i= 0,len = arr.length;i<len;i++){
				item=arr[i];
				
					//避免重复
					list_content.children("li").each(function(i,n){
						if($(n).data("songItem").songId==item.songId){
							$(n).remove();
						}
					});
				
				//添加歌曲到头部
				var tpl_listItem = getHTML.songLiHtml;
				item_el=$(tpl2str(tpl_listItem,item)).mouseover(function(){
					$(this).addClass("z-hover");
				}).mouseout(function(){
					$(this).removeClass("z-hover");
				});
				item_el.data("songItem",item);
				if(isappend){
					list_content.append(item_el);
				}else{
					list_content.prepend(item_el);
				}
			}
			this.setAction(list_content);
			if(!isappend){
				list_content.children()[0].click();
			}
			//-------本地保存-------
			var list=FlashACR.getProperty("songList");
			if(!Boolean(list)){
				list=[];
			}
			if(!Boolean(nocatch)){
				//避免重复
				for(var j=0;j<arr.length;j++){
					item=arr[j];
					for(var i=0;i<list.length;i++){
						if(list[i].songId==item.songId){
							list.splice(i,1);
							i--;
						}
					}
				}
				//合并列表并保存
				if(isappend){
					list=list.concat(arr);
				}else{
					arr.reverse();//对应上面的倒序再逆转回来
					list=arr.concat(list);
				}
				FlashACR.setProperty("songList",list);
				FlashACR.flush();
			}
		},
		
		//播放歌曲
		playSong:function(songInfo){
			$(".words .fc1").text('加载中......');        
			$(".m-pbar .rdy").width("0%");
			ui_player.find(".ply").removeClass("pas");
			ui_player.find('.playing_tools').attr('song_id',songInfo.songId);
			FlashACR.stop();
			if(songInfo){
				$(".words .fc1").text(common.util.subString(songInfo.songName||'',40,true)); //.attr('href',urlList.songInfoUrl+'?id='+songInfo.songId);
				$(".words .by").text(common.util.subString(songInfo.singerName||'',20,true));
				if(songInfo.isColor){
					if(songInfo.cmp3 && songInfo.cmp3!=""){
						FlashACR.load(encodeURI(songInfo.cmp3).replace(/\+/g,'%2B'));						
						$('.icn-bq-gq>i').removeClass('current');
						$('.icn-bq-gq>i:eq(1)').addClass('current');
					}else{
						$(".words .fc1").text('该歌曲没有高清版本');
					}
				}else{
					if(songInfo.mp3){
						FlashACR.load(encodeURI(songInfo.mp3).replace(/\+/g,'%2B'));			
						$('.icn-bq-gq>i').removeClass('current');
						$('.icn-bq-gq>i:eq(0)').addClass('current');
					}else if(!songInfo.mp3 && songInfo.cmp3){
						FlashACR.load(encodeURI(songInfo.cmp3).replace(/\+/g,'%2B'));						
						$('.icn-bq-gq>i').removeClass('current');
						$('.icn-bq-gq>i:eq(1)').addClass('current');
					}else{
						$(".words .fc1").text('加载歌曲失败');
						actionMap.next();
					}
				}
				ui_playlist.find('.cover>img').attr('src',songInfo.poster || 'http://img01.12530.com/res/images/default.jpg');
				this.getSongLyirc(songInfo.songId);
			}
			
		},
		//根据歌曲ID获取歌词
		getSongLyirc:function(songid){
			var self = this;
			if(selecteItem){
				var data = selecteItem.data("songItem");
				if(data.lyric){
					player_lyrics_scroll.init({lrcArr:data.lyric});
					return ;
				}
			}
			if(songid){
				var url = urlList.getSongLyr;		
				$.ajax({
					type : "get",
					url: url,
					dataType:'text',
					data: {songid:songid},								
					success: function(result){
						if(result){
							result = result.replace(/\"/g, "");							
							lyric = result.replace(/\\r\\n/g,'\\n').split('\\n');//html字符串需要转意
							player_lyrics_scroll.init({lrcArr:lyric});
							if(selecteItem){
								var data = selecteItem.data("songItem");
								data.lyric = lyric;
								selecteItem.data('songItem',data);
							}							
						}else{
							player_lyrics_scroll.init({lrcArr:[]});
						}
					},
					error:function(){
						player_lyrics_scroll.init({lrcArr:[]});
					}
				});
			}
		},
		//临时列表删除指定歌曲
		delSong:function(songId){
			var list=FlashACR.getProperty("songList");
			if(!Boolean(list)){
				return;
			}
			var item=null;
			for(var i=0;i<list.length;i++){
				item=list[i];
				if(item.songId==songId){
					list.splice(i,1);
					i--;
				}
			}
			//保存
			FlashACR.setProperty("songList",list);
			FlashACR.flush();
		},
		delSongList:function(arr){
			var list=FlashACR.getProperty("songList");
			if(!Boolean(list)){
				return;
			}
			var item=null,len = arr.length;
			var selectId = selecteItem ? selecteItem.attr('song_id') :'';
			var flag = false; //标志删除的是否有当前播放列
			for(var i=0;i<list.length;i++){
				item=list[i];
				for(var j=0;j<arr.length;j++){
					var di = arr[j];
					if(item.songId == di){
						list.splice(i,1);
						i--;
						len--;
					}
					if(selectId && selectId == di){
						flag = true;
					}
				}
				if(len==0){
					break;
				}
			}			
			//保存
			FlashACR.setProperty("songList",list);
			FlashACR.flush();
			//若删除的有当前播放歌曲，则清空歌词
			if(flag){
				FlashACR.stop();           
				player_lyrics_scroll.clear();
				$(".words .fc1").text(''); //歌曲名清空
				$(".words .by").text('');
				//$('.words').text('');
				var children = list_content.children();
				if(children.length>0)
					children[0].click();
			}
		},
		_showToolDiv:function(div,tarObj,up,callback){			
			var self = this;
			div.hover(function () {
                clearTimeout(self._timer);               
                $(this).show();
            }, function () {                
                clearTimeout(self._timer);
                $(this).hide();
				if(callback) callback.call(playerUI,div,tarObj);
            });
			var top ,left;
			if(up){
				top = $(tarObj).offset().top - div.height();
				left = $(tarObj).offset().left + Math.round($(tarObj).width() / 2 - div.width() / 2) - 35;
			}else{
				top = $(tarObj).offset().top + 16;
				left = $(tarObj).offset().left + Math.round($(tarObj).width() / 2 - div.width() / 2) + 45;
			}
			div.offset({
				top: top,
				left: left
			});
			if (this._timer) {
				clearTimeout(this._timer);
			}
			this._timer = setTimeout(function () {
				div.hide();
				if(callback) callback.call(playerUI,div,tarObj);
			}, 1000);
		},
		collectSong:function(target,songid,addCollect,type,callbackFunc){
			if(UserIsLogin){
				var url;
				if(addCollect!=false){				
					url = urlList.addCollect;
				}else{
					url = urlList.delCollect;
				}
				$.ajax({url: url,data: {itemid:songid,ulike:(type ||uLikeType.song)},dataType:'json',type:'post',
					success: function (data) {
						if(data.code=='000000' && (data.state=='1' || data.state=='2')){
							if(target && addCollect!=false) common.util.showPrompt(target,data.state=='1'?'收藏成功':'你已收藏','','player_tooltip');;
							if(callbackFunc) callbackFunc.call(playerUI,data,addCollect);
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});				
			}else{
				common.showLoginWin();						
			}
		}
	};
	var userCollect = {		
		init:function(callBackFuc){
			var panel = $('.panel_list:eq(1)');
			if(UserIsLogin){
				var li = panel.find('.tab-title li.cur');
				var li_type = li.attr('type');
				var li_index = li.index();
				var list_span = panel.find('.list_span:eq('+li_index+')');
				var scroll_p = panel.find('.scroll');
				var url = urlList.getCollect;
				var _this = this;
				var _html = getHTML;
				//默认一百条数据
				$.ajax({url: url,data: {ulike:uLikeType[li_type],pagenum:1,pagesize:100},dataType:'json',cache:false,
					success: function (data) {
						if(data.code=='000000'){
							var list = data.msg;
							if(list.length ==0 ){								
								list_span.html(_html.noCollectListHtml).css('float','none');
							}else{
								var lis_html='';
								var urls = urlList;
								for(var i=0,len = list.length;i<len;i++){
									var item = list[i];
									if(li_index == 0){
										//歌曲列表
										lis_html+= tpl2str(_html.songLiHtml_2,item);
									}else{
										var info;
										if(li_index == 1){
											//歌手列表
											info = {itemid:item.singerId,poster:item.poster,itemname:item.singerName||'',itemHref:urls.singerInfoUrl+item.singerId};
										}else if(li_index == 2){
											//专辑
											info = {itemid:item.albumId,poster:item.poster,itemname:item.albumName,itemHref:urls.albumInfoUrl+item.albumId};
										}else if(li_index == 3){
											//精选集
											info = {itemid:item.ualbumId,poster:item.poster,itemname:item.ualbumName,itemHref:urls.jxjInfoUrl+item.ualbumId};
										}										
										lis_html += tpl2str(_html.imgListHtml,info);
									}
								}
								list_span.html(lis_html);
								if(li_index == 0) list_span.find('li .icns>a.icn-fav').remove();
							}
						}else{
							list_span.html(_html.noCollectListHtml).css('float','none');
						}
						_this.initLiEvent();
						callBackFuc.call(playerUI,list_span,scroll_p);
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});	
				//myclt-title
			}else{
				var noLogin = getHTML.noLoginHtml;
				panel.html(noLogin);
			}
		},
		initLiEvent:function(){					
			//最后一列去右边距,生成后要用
			$(".myalllst-con .mod_list li").each(function(){
				if(($(this).index()+1)%5==0){
					$(this).css("margin-right","0");	
				}	
			});
			var panel = $('.panel_list:eq(1)');
			playerUI.setAction(panel);
		},
		initEvent:function(){
			var panel = $('.panel_list:eq(1)');
			var ul = panel.find('.myCollect .list_span:first');
			//点击播放
			ul.delegate('li','click',function(event){			
				event.stopPropagation();//停止事件传递
				var s_id = $(this).attr('song_id');
				if(event.target && !$(event.target).is(':checkbox')){
					playerUI.playList(s_id);
				}
			});
			//删除歌曲
			ul.delegate('a.icn-del','click',function(event){
				event.stopPropagation();//停止事件传递
				var _this=$(event.currentTarget);				
				var s_id=_this.parents("li").attr('song_id');
				var url = urlList.delCollect;				
				$.ajax({url: url,data: {itemid:s_id,ulike:uLikeType.song},dataType:'json',type:'post',cache:false,
					success: function (data) {
						if(data.code=='000000' && data.state=='1'){
							_this.parents("li").remove();
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});	
			});
			//删除收藏
			var imgUl = panel.find('.myCollect .list_span:gt(0)');
			imgUl.delegate('.icn-img-del','click',function(event){
				event.stopPropagation();//停止事件传递
				event.preventDefault();
				var target=$(event.currentTarget);
				var ul = $('.overview:visible');
				ul = ul.find('.list_span:visible'); 
				var t = ul.attr('type');
				var songid = $(target).parents('li').attr('item_id');
				playerUI.collectSong(null,songid,false,uLikeType[t],function(data,isCollect){
					$(target).parents('li').remove();
					var ul = $('.overview:visible').find('.list_span:visible'); 
					ul.find("li").each(function(){
						if(($(this).index()+1)%5==0){
							$(this).css("margin-right","0");	
						}else{
							$(this).removeAttr('style');
						}
					});
				});
			});
			//checkbox选择
			imgUl.delegate('.icn-modlist-checkbox','click',function(event){
				var isChecked = $(this).prop('checked');
				if(isChecked){
					$(this).parents('.mod_poster').addClass('selected');
				}else{
					$(this).parents('.mod_poster').removeClass('selected');
				}
			});
			//专辑播放
			imgUl.delegate('.icn-songlist-play','click',function(event){
				event.stopPropagation();//停止事件传递
				event.preventDefault();
				var target=$(event.currentTarget);
				var ul = $('.overview:visible');
				ul = ul.find('.list_span:visible'); 
				var t = ul.attr('type');
				var itemid = $(target).parents('li').attr('item_id');
				playerUI.playList(itemid,t,false,target,true);
			});
		}
	};
	var userSongList = {
		//生成弹出框和tab页面的歌单列表
		initList:function(){
			//获得用户歌单
			if(UserIsLogin){
				var url = urlList.getSongList;
				var url_html = getHTML;
				$.ajax({url: url,dataType:'json',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							var lists = data.playListInfoList;
							var util = common.util;
							var li_html1 ='',li_html2='',item,ul_html='';
							for(var i=0,len=lists.length;i<len;i++){
								item = lists[i];
								li_html1 += util.stringFormat('<li l_id="{0}"><span class="pl10 fl name">{1}</span><span class="pr10 fr">（{2}）</span></li>',item.playListID,item.listName,item.totalCount);
								li_html2 += tpl2str(url_html.songListHtml,item);
								ul_html += '<ul class="f-cb tab-con list_span" style="display:none;"></ul>';
							}
							$('#m-playlist-overlay').find('ul.m-playlist-o-list').html(li_html1);
							$('#my_songList_panel').find('ul.myslt-title').html(li_html2);
							$('#my_songList_panel').find('.mySongList .overview').html(ul_html);
							
						}else{
							ymPrompt.alert(data.desc);
						}
					},
					error:function(res){
						ymPrompt.alert(res.desc);
					}
				});
			}else{
				var noLogin = getHTML.noLoginHtml;
				$('#my_songList_panel').html(noLogin);
			}
		},
		init:function(callBackFuc){
			var panel = $('.panel_list:eq(2)');
			if(UserIsLogin){
				var li = panel.find('.tab-title li.cur');				
				var li_index = li.index();
				var list_span = panel.find('.list_span:eq('+li_index+')');
				var scroll_p = panel.find('.scroll');
				
				var url = urlList.getListInfo;
				var _this = this;
				var _html = getHTML;
				var lid = li.attr('l_id');
				var name = $.trim(li.find('.name').text());
				$.ajax({url: url,data: {listName:name,playListID:lid},dataType:'json',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							var list = data.contents;
							if(list.length ==0 ){								
								list_span.html(_html.noSongListHtml);
							}else{
								var lis_html='';
								for(var i=0,len = list.length;i<len;i++){
									var item = list[i];
									lis_html+= tpl2str(_html.songLiHtml_2,item);									
								}
								list_span.html(lis_html);								
								_this.initListEvent();
							}
							callBackFuc.call(playerUI,list_span,scroll_p);
						}else{
							ymPrompt.alert(data.desc);
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});	
				
			}else{
				var noLogin = getHTML.noLoginHtml;
				panel.html(noLogin);
			}
		},
		initEvent:function(){
			var panel = $('.panel_list:eq(2)');
			//添加歌单
			$(".overlay-add-btn,.icn-songlist-creat").click(function(event){
				event.stopPropagation();
				$(this).hide().siblings().show();
				$(this).siblings().find('input').focus();
			});
			
			//确定添加歌单
			$('#my_songList_panel').find('.icn-creat-new').click(function(event){
				event.stopPropagation();
				var name = $(this).siblings('.input_songList').val();
				name = $.trim(name);
				var result = playerUI._testSListName(name);
				if(result.flag == false){
					common.util.showPrompt($(this),result.text,'','player_tooltip');
					return ;
				}else if($('#my_songList_panel').find('.myslt-title>li').length>=50){
					common.util.showPrompt($(this),'最多可创建50个歌单','','player_tooltip');
					$(this).parent().hide().siblings().show();
					return;
				}
				var url = urlList.creatSongList;
				var _html = getHTML;
				$(this).parent().hide().siblings().show();
				$.ajax({url: url,data: {listName:name},dataType:'json',type:'post',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							var ul = $('#my_songList_panel').find('.myslt-title');
							var item = {listName:name,totalCount:0,playListID:data.playListID};
							var li =  tpl2str(_html.songListHtml,item);
							ul.append(li);
							ul.find('li:last').trigger('click');//选中当前创建的歌单
							$('#my_songList_panel').find('.mySongList .overview').append('<ul class="f-cb tab-con list_span" style="display:none;"></ul>');	
							
							//弹出框
							var ul = $('#m-playlist-overlay').find('.m-playlist-o-list');
							ul.append('<li l_id="'+data.playListID+'"><span class="pl10 fl name">'+name+'</span><span class="pr10 fr">（0）</span></li>');
						}else{
							ymPrompt.alert(data.desc);							
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});	
			});
			//编辑歌单
			panel.delegate('.icn-songlist-edit','click',function(event){	
				event.stopPropagation();
				panel.find('.icn-songlist-edit-cancel:visible').trigger('click');
				var p = $(this).parent();
				p.hide().siblings(".edit-con").show();
				var name = $.trim(p.find('.name').text());
				p.siblings(".edit-con").find('input').val(name).focus();
			});
			//取消编辑
			panel.delegate('.icn-songlist-edit-cancel','click',function(event){	
				event.stopPropagation();
				$(this).parents(".edit-con:first").hide().siblings(".myslt-li-t").show();	
				//创建歌单上的取消按钮
				if($(this).hasClass('alone_cancel')){
					$(this).parent().hide().siblings().show();
				}
			});
			
			//修改歌单名字
			panel.delegate('.icn-rename','click',function(event){	
				event.stopPropagation();
				var li = $(this).parents('li');
				var oldname = $.trim(li.find('.name').text());
				var newname = $(this).siblings('input.input_rename').val();
				newname = $.trim(newname);
				var result = playerUI._testSListName(newname);				
				if(result.flag == false){
					common.util.showPrompt($(this),result.text,'','player_tooltip');
					return ;
				}
				var url = urlList.renameSongList;
				var btn = $(this);
				var lid = li.attr('l_id');
				$.ajax({url: url,data: {oldListName:oldname,newListName:newname,playListID:lid},dataType:'json',type:'post',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							li.find('.name').text(newname);
							btn.parents(".edit-con:first").hide().siblings(".myslt-li-t").show();
							//弹出框
							var lis2 = $('#m-playlist-overlay').find('.m-playlist-o-list>li[l_id="'+lid+'"]');
							lis2.find('.name').text(newname);
							/*
							lis2.each(function(){
								var em_name = $(this).find('.name');
								var n = $.trim(em_name.text());
								if(n == name){
									em_name.text(newname);
									return false;
								}
							});*/
						}else{
							ymPrompt.alert(data.desc);
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});				
			});
			//我的歌单 按钮 hover
			panel.delegate('.myslt-title li','mouseover',function(event){
				$(this).find(".myslt-li-t .icn-songlist").show();	
			});
			panel.delegate('.myslt-title li','mouseout',function(event){
				$(this).find(".myslt-li-t .icn-songlist").hide();	
			});
			//删除歌单按钮
			panel.delegate('.icn-songlist-del','click',function(event){	
				event.stopPropagation();
				var _this=$(event.currentTarget);
				var li = $(this).parents('li');
				var div = $('#m-removelist-overlay').data('s_li',li).show();
				var tarObj = $(event.currentTarget);
				playerUI._showToolDiv(div,tarObj);
			});
			//删除取消
			$('#m-removelist-overlay').find('.icn-overyay-cancel').click(function(){
				$('#m-removelist-overlay').hide();
			});
			//删除确定
			$('#m-removelist-overlay').find('.icn-overyay-sure').click(function(event){
				event.stopPropagation();
				var li = $('#m-removelist-overlay').data('s_li');
				var name = $.trim($(li).find('.name').text());
				var lid = li.attr('l_id')
				var url = urlList.deleteSongList;
				$.ajax({url: url,data: {listName:name,playListID:lid},dataType:'json',type:'post',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							$(li).remove();
							if(li.hasClass('cur')){
								$('#my_songList_panel').find('.myslt-title li:first').trigger('click');
							}
							if($('#my_songList_panel').find('.myslt-title li').length==0){
								$('.listtools  a.icn-clearlist').trigger('click'); //清空歌曲列表
							}
							//弹出框
							var lis2 = $('#m-playlist-overlay').find('.m-playlist-o-list>li[l_id="'+lid+'"]');
							lis2.remove();
							/*
							lis2.each(function(){
								var em_name = $(this).find('.name');
								var n = $.trim(em_name.text());
								if(n == name){
									$(this).remove();
									return false;
								}
							});*/
						}else{
							ymPrompt.alert(data.desc);
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});				
				$('#m-removelist-overlay').hide();
			});
			//弹出框添加歌单
			$('#m-playlist-overlay').find('.icn-overyay-sure').click(function(event){
				event.stopPropagation();
				var name = $(this).siblings('.input_songList').val();
				name = $.trim(name);
				var result = playerUI._testSListName(name);
				if(result.flag == false){
					common.util.showPrompt($(this),result.text,'','player_tooltip');
					return ;
				}else if($('#my_songList_panel').find('.myslt-title>li').length>=50){
					common.util.showPrompt($(this),'最多可创建50个歌单','','player_tooltip');
					$(this).parent().hide().siblings('span').show();
					return;
				}
				var url = urlList.creatSongList;
				var _html = getHTML;
				var parent = $(this).parent();
				$.ajax({url: url,data: {listName:name},dataType:'json',type:'post',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							var ul = $('#my_songList_panel').find('.myslt-title');
							var item = {listName:name,totalCount:0,playListID:data.playListID};
							var li =  tpl2str(_html.songListHtml,item);
							ul.append(li);
							$('#my_songList_panel').find('.mySongList .overview').append('<ul class="f-cb tab-con list_span" style="display:none;"></ul>');

							var over_ul = $('#m-playlist-overlay').find('.m-playlist-o-list');
							var li = $('<li l_id="'+data.playListID+'"><span class="pl10 fl name">'+name+'</span><span class="pr10 fr">（0）</span></li>');
							over_ul.append(li);
							li.trigger('click');
							parent.hide().siblings('span').show();//回到“添加歌单按钮”状态
						}else{
							ymPrompt.alert(data.desc);
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});	
			});
			//弹出框将歌曲添加到歌单
			$('#m-playlist-overlay').delegate('li','click',function(event){	
				event.stopPropagation();
				var _this=$(event.currentTarget);
				var song_id = $('#m-playlist-overlay').attr('song_id');
				var name = $.trim($(this).find('.name').text());
				var lid = $(this).attr('l_id');
				var url = urlList.addSongToList;
				var li = $(this);
				$.ajax({url: url,data: {songId:song_id,listName:name,playListID:lid},dataType:'json',type:'post',cache:false,
					success: function (data) {
						if(data.resultCode=='0'){
							var countLi1 = li.find('.name').siblings();
							var c = countLi1.text().replace(/[（）()]/g, "");

							var num = Number(c)+1;
							countLi1.text('（'+num+'）');

							var lis2 = $('#my_songList_panel').find('.myslt-title>li[l_id="'+lid+'"]');
							var countLi2 = lis2.find('.name').siblings('em');
							countLi2.text('('+num+')');
							if(lis2.hasClass('cur')){
								lis2.trigger('click');
							}
						}else{
							ymPrompt.alert(data.desc);
						}
					},
					error:function(res){
						ymPrompt.alert(res);
					}
				});	
			});
			
			var _div = panel.find('.mySongList');
			//点击播放
			_div.delegate('li','click',function(event){			
				event.stopPropagation();//停止事件传递
				var s_id = $(this).attr('song_id');
				if(event.target && !$(event.target).is(':checkbox')){
					playerUI.playList(s_id);
				}
			});
			//删除
			_div.delegate('a.icn-del','click',function(event){
				event.stopPropagation();//停止事件传递
				var _this=$(event.currentTarget);
				var li = _this.parents("li");
				var cList = panel.find('.myslt-title >li.cur');
				var name = $.trim(cList.find('.name').text());
				var lid = cList.attr('l_id');
				var s_id= li.attr('song_id');
				userSongList.deleteSongToList(lid,name,1,s_id,li.index(),li);
				
			});			
		},
		initListEvent:function(){
			//最后一列去右边距,生成后要用
			$(".myalllst-con .mod_list li").each(function(){
				if(($(this).index()+1)%5==0){
					$(this).css("margin-right","0");	
				}	
			});
			var panel = $('.panel_list:eq(2)');
			playerUI.setAction(panel);
			
		},
		deleteSongToList:function(lid,listName,type,s_id,position,target){
			var url = urlList.deleteSongToList;	
			lid = lid || target.attr('l_id');
			var data = {type :type,listName:listName,playListID:lid};
			if(s_id) data.songId = s_id;
			if(position !=null) data.positions = position;
			$.ajax({url: url,data: data,dataType:'json',type:'post',cache:false,
				success: function (data) {
					if(data.resultCode=='0'){
						if(target) target.remove();
						var cList = $('#my_songList_panel').find('.myslt-title li.cur');
						var num = cList.find('.name').siblings('em');
						//弹出框同步
						var over_list = $('#m-playlist-overlay').find('.m-playlist-o-list>li[l_id="'+lid+'"]');						
						var over_num = over_list.find('.name').siblings();
						
						if(type == 0){
							num.text('(0)');
							over_num.text('（0）');
						}else if(s_id){
							len = num.text().replace(/[（）()]/g, "");
							var removeLen = s_id.split(',').length;
							num.text('('+(len-removeLen)+')');
							over_num.text('（'+(len-removeLen)+'）');
						}
						
					}
				},
				error:function(res){
					ymPrompt.alert(res);
				}
			});	
		}
	};

/////////////////////////////////////////////////////////////////////////////////////////
//  歌词滚动函数
//  调用：player_lyrics_scroll.init({lrcArr:lrcArr,playerId:container});    
//  lrcArr为歌词数组，container为player的id
/////////////////////////////////////////////////////////////////////////////////////////
LRC=function(){this.initialize.apply(this,arguments);};
LRC.prototype={
    arrLyricTime:[],
    arrLyric:[],//全局可用，必须执行初始化
    initialize:function(arg){
        //私有
        this.lyricTable=arg.lyricTable;//目标歌词table
        this.lyricWrapper=arg.lyricWrapper;//目标歌词容器div
        this.curRowClassName=arg.curRowClassName;//选择行css样式名
        this.separator=arg.separator;//歌词行分隔符 如：<BR>
		this.rowHeight = arg.rowHeight || 25;//每一行的高度
        //执行初始化
        this.arrLyricTime=[];
        this.arrLyric=[];
        this.initArray(arg.lyric);
        this.arrLyricTime=this.sort(this.arrLyricTime);
        this.setLyricTable(this.arrLyric);
    },
    initArray:function(lyric){
        var lrc_re=new RegExp('\[[0-9:.]*\]','g');//g全局标志，获取所有匹配结果必须
        var lrc_arr=lyric;
        var lrc_temp=0;
        var lrc_filter=0;//无效行过滤标记
        for(var i=0;i<lrc_arr.length;i++){
            var lrc_txt=$.trim( lrc_arr[i].replace(/\[[\w\W]*\]/g,''));//add to lyric text array
            if(lrc_txt==''){
                lrc_filter++;
                continue;
            }       
            this.arrLyric[i-lrc_filter]=lrc_txt;
            while((lrc_result = lrc_re.exec(lrc_arr[i])) != null){
                var lrc_second=this.parseSecond(lrc_result.toString().replace(/\[|\]/g,''));
                if(!isNaN(lrc_second))
                    this.arrLyricTime[lrc_temp++]=(i-lrc_filter)+'|'+lrc_second;//arrLyricTime格式为"行号|秒",如：1|50,2|60
            }
        }
    },
    /*
    *  公开函数 
    *  IsLyricValid()判断是否合法lrc歌词    
    *  DoSync()定位歌词
    */
    IsLyricValid:function(arrLyricTime){
        return this.arrLyricTime.length>0; 
    },
    DoSync:function(curPosition){
        var lrc_times=this.arrLyricTime;
        for(var i=0;i<lrc_times.length;i++){
            var lrc_arrPre=lrc_times[i].split('|');
            
            if(i==0&&curPosition<lrc_arrPre[1]) break;//防止抖动
            
            if(lrc_times[i+1]==undefined){
                this.setRow(lrc_arrPre[0]);
                break;
            }
            
            var lrc_arrNext=lrc_times[i+1].split('|');
            if(curPosition>=lrc_arrPre[1]&&curPosition<lrc_arrNext[1]){
                this.setRow(lrc_arrPre[0]);
                break;
            }
        } 
    },
    /////////////////////////////////////////////////////////////////////////////////////////
    //以下为内部辅助函数
    /////////////////////////////////////////////////////////////////////////////////////////
    parseSecond:function(time){
        try{
            var lrc_arr=time.split(':');//time格式为时间格式 00:00
            return parseInt(lrc_arr[0])*60+parseFloat(lrc_arr[1]);
        }catch(ex){
            return 0;
        }
    },
    setLyricTable:function(arrLyric){
        this.lyricWrapper.scrollTop=0;//滚动条置顶
        
        if(this.lyricTable.rows.length>0){ 
            this.clearTable(this.lyricTable);
        }
        for(var i=0;i<arrLyric.length;i++){
			var num = this.lyricTable.rows.length-1 >=0 ? this.lyricTable.rows.length:0;
            var lrc_tr=this.lyricTable.insertRow(num);
            var lrc_cell=lrc_tr.insertCell(0);
            lrc_cell.innerHTML=arrLyric[i];
        }
    },
    clearTable:function(lyricTable){
        var lrc_rowNum=lyricTable.rows.length;
        for (var i=0;i<lrc_rowNum;i++){
            lyricTable.deleteRow(i);
            lrc_rowNum=lrc_rowNum-1;
            i=i-1;
        } 
    },
    setRow:function(index){
        this.setRowClass(index);
        this.setScroll(index);
    },
    setRowClass:function(index){
        var lrc_rows=this.lyricTable.rows;
        for(var i=0;i<lrc_rows.length;i++){
             lrc_rows[i].className='';//TODO:直接添加样式至元素，防止外部css干扰
        }
        lrc_rows[index].className=this.curRowClassName;
    },
    tempIndex:0,
    setScroll:function(index){       
     	if(Number(index)>=this.tempIndex){
     		 $(this.lyricTable).css({marginTop:0 - (Number(index)-this.tempIndex) * this.rowHeight});
     	}else{
     		 $(this.lyricTable).css({marginTop:0});
     	}	 
    },
    sort:function(arrLyricTime){
        for(var i=0;i<arrLyricTime.length-1;i++){
            for(var ii=i+1;ii<arrLyricTime.length;ii++){
                var lrc_cur=parseFloat(arrLyricTime[i].split('|')[1]);
                var lrc_next=parseFloat(arrLyricTime[ii].split('|')[1]);
                if(lrc_cur>lrc_next){
                    var lrc_temp=arrLyricTime[i];
                    arrLyricTime[i]=arrLyricTime[ii];
                    arrLyricTime[ii]=lrc_temp;
                }
            }
        }    
        return arrLyricTime;
    }
};

var player_lyrics_scroll = player_lyrics_scroll || {};
player_lyrics_scroll = {
	isDoSync:true,//是否设置同步
	uiLRC:null,
	timerId:null,
	scrollId:null,
	resetId:null,
	lrcUrL:"",
	lrcArr:null,	
	wrapperId:'lrcWrapper',
	panelId:'lrcTable',
	rowHeight:30,//歌词每一行的高度
	init:function(data){
		if(data){
			$.extend(player_lyrics_scroll, data);
			if(this.lrcArr&&$.isArray(this.lrcArr)&&this.lrcArr.length>0){
				this.initLrc(this.lrcArr);	
			}else{
				this.initLrc([]);
				$('#'+this.panelId).html("<tr><td>该歌曲暂无歌词！</td></tr>");
			}
		}
	},
	clear:function(){
		var _this = player_lyrics_scroll;
		_this.clearLrcPanel(_this.panelId);
		clearTimeout(_this.resetId);
		clearInterval(_this.scrollId);
		clearInterval(_this.timerId);
		ui_playlist.find('.cover>img').attr('src', 'http://img01.12530.com/res/images/default.jpg');
	},
	initLrc:function(res){
		var _this = player_lyrics_scroll;
		_this.clearLrcPanel(_this.panelId);
		clearTimeout(_this.resetId);
		clearInterval(_this.scrollId);
		clearInterval(_this.timerId);             
		//同步歌词
		
		_this.uiLRC=new LRC({lyric:res,lyricTable:_this.getElme(_this.panelId),lyricWrapper:_this.getElme(_this.wrapperId),curRowClassName:'curRow',separator:'',rowHeight:_this.rowHeight});
		_this.uiLRC.tempIndex=parseInt($(_this.uiLRC.lyricTable).parent().height()/50);
		$(_this.uiLRC.lyricTable).css({marginTop:0});
		if(_this.uiLRC.IsLyricValid()&&_this.isDoSync){
			_this.timerId=setInterval(function(){ 
				if(_this.isDoSync)             
					_this.uiLRC.DoSync(_this.GetCurrentPosition());//执行同步
			},100);
		}else if(!_this.isDoSync){
			$('#'+this.wrapperId).css("overflow","auto");
		}
	},
	getElme:function(id){
		return document.getElementById(id);
	},
	//时时得到播放器播放时长
	GetCurrentPosition:function(){
		return (FlashACR.getPosition()/1000);
	},
	//清除面板
	clearLrcPanel:function(panelId){		
		$('#'+this.panelId).html("");
		
	},
	//恢复同步
	resetLrc :function(){
		if(this.uiLRC!=null&&this.uiLRC.IsLyricValid()){
			
		        this.timerId=setInterval(function(){ 
		        	if(this.isDoSync)
		                this.uiLRC.DoSync(this.GetCurrentPosition());
		        },100);
			
	    }
	},
	changeDoSync:function(flag){
		if(flag){
			this.isDoSync=true;
			this.resetLrc();
			$('#'+this.wrapperId).css("overflow","hidden");
		}else{
			 clearInterval(this.scrollId);
			 this.isDoSync=false;
		     this.resetId=setTimeout(function(){
		    	 this.resetLrc();
		     },2000);
		     $('#'+this.wrapperId).css("overflow","auto");
		}
	}
};
//页面playerHtml
function getPlayerHtml(){
	var html = '<div class="g-btmbar" onselectstart ="return false"><div id="id-playerbar" style="top: -7px;" class="m-playbar m-playbar-unlock"><div class="updn"><a data-action="lock" hidefocus="true" class="btn" href="javascript:void(0);"></a></div><div class="bg"></div><div title="展开播放条" class="hand"></div><div id="g_player" class="wrap"><div class="btns"><a title="上一首" class="prv" data-action="prev" hidefocus="true" href="javascript:void(0);">上一首</a><a title="播放/暂停" class="ply" data-action="play" hidefocus="true" href="javascript:void(0);">播放/暂停</a><a title="下一首" class="nxt" data-action="next" hidefocus="true" href="javascript:void(0);">下一首</a></div><div class="head"><a class="mask" hidefocus="true" href="javascript:void(0);"></a></div><div class="play"><div class="j-flag words"><span class="fc1 f-fl f14" >请添加歌曲</span><span class="by f-fl"></span></div><div class="m-pbar"><div id="id-playbar" class="j-flag barbg"><div style="width: 0%;" class="j-flag rdy"></div><div style="width: 0%;" class="j-flag cur"><span style="cursor: default;" id="id-thumb" class="j-flag btn f-tdn f-alpha"></span></div></div><span class="j-flag time"><em>00:00</em>/ 00:00</span><div class="oper f-fl playing_tools"><a title="彩铃" class="icn icn-ring" data-action="color" hidefocus="true"href="javascript:void(0);">彩铃</a><a title="下载" class="icn icn-down" data-action="down" hidefocus="true"href="javascript:void(0);">下载</a><a title="收藏" class="icn icn-fav" data-action="like" hidefocus="true"href="javascript:void(0);">收藏</a><a title="分享" class="icn icn-share" data-action="share" hidefocus="true"href="javascript:void(0);">分享</a><div class="com_share_wrap sprt palyer_share" style="display:none;"><a href="javascript:void(0);" target="_blank" class="sprt com_share_sina" title="新浪微博" type="sina">新浪微博</a><a href="javascript:void(0);" class="sprt com_share_wx" title="微信" type="wx">微信</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_qzone" title="腾讯空间" type="qzone">腾讯空间</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_qq" title="腾讯QQ" type="qqWin">腾讯QQ</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_tx" title="腾讯微博" type="qq">腾讯微博</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_rr" title="人人网" type="renren">人人网</a><a href="javascript:void(0);" target="_blank" class="sprt com_share_fx" title="飞信" type="feixin">飞信</a></div><span title="" class="icn icn-bq-gq" hidefocus="true" href="javascript:void(0);"><i class="current playing_b_item" data-action="play_b">全曲</i><i class="playing_g_item" data-action="play_g">彩铃</i></span></div></div></div><div style="width:35px;" class="ctrl f-fl f-pr"><div style="display: none;" id="id-volbar" class="j-flag m-vol"><div class="j-t barbg"></div><div id="id-volvaluebar" class="j-t vbg"><div style="height: 46.5px;" class="curr"></div><span style="top: 40.5px;" class="j-t btn f-alpha"></span></div></div><a class="j-flag icn icn-vol" data-action="setvolume" hidefocus="true"href="javascript:void(0);"></a></div><div style="width:115px;" class="ctrl f-fl f-pr"><a title="循环" class="j-flag icn icn-shuffle icn-loop" data-action="setmode"hidefocus="true" href="javascript:void(0);"></a><a title="随机" class="j-flag icn icn-shuffle icn-order" data-action="setmode"hidefocus="true" href="javascript:void(0);"></a><a title="单曲" class="j-flag icn icn-shuffle icn-single" data-action="setmode"hidefocus="true" href="javascript:void(0);"></a></div><div style="width:35px;" class="ctrl f-fl f-pr"><a class="j-flag icn icn-file icn-list s-fc3" data-action="playlist"hidefocus="true" title="播放列表" href="javascript:void(0);"></a></div><div style="width:2px;" class="ctrl f-fl f-pr"></div><div style="display:none;" id="g_playlist" class="list"><div class="listhd"><div class="listhdc"><h4 class="j-flag"><em class="mylist cur">临时列表</em>|<em class="">我的收藏</em>|<em class="">我的歌单</em></h4><span data-action="close" class="close j-flag">关闭</span></div></div><div class="listbd"><div class="listleft"><div class="listbdc list-tab-con"><div class="scroll j-flag panel_list" id="m-playlist-scroll1"><div class="viewport fl"><ul class="f-cb overview" id="playList_temp" type="tempList" style="top: 0px; width: 100%;"></ul></div><div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div></div><div style="display: none;" class="j-flag panel_list"><ul class="myclt-title tab-title clearfix"><li class="fl cur" type="song">歌曲</li><li class="fl" type="singer">歌手</li><li class="fl" type="album">专辑</li><li class="fl" type="ualbum">精选集</li></ul><div class="myalllst-con myclt-con myCollect"><div class="scroll" id="m-playlist-scroll2"><div class="viewport fl"><div class="overview" type="myCollect"><ul class="tab-con f-cb list_span" type="song"></ul><ul class="mod_list tab-con list_span" style="display:none;" type="singer"></ul><ul class="mod_list tab-con list_span" style="display:none;" type="album"></ul><ul class="mod_list tab-con list_span" style="display:none;" type="ualbum"></ul></div></div><div class="scrollbar"><div class="track"><div class="thumb"></div></div></div></div></div></div><div class="j-flag pst_r panel_list" style="display: none;" id="my_songList_panel"><ul class="myslt-title tab-title clearfix" style="min-height:15px;height:auto;_height:15px;"></ul><div class="creat-new"><a class="icn-songlist icn-songlist-creat"></a><span class="overlay-add-info clearfix" style="display:none;width:160px;"><input type="text" class="fl icn mr5 input_songList" value="我的音乐"><a href="javascript:void(0);" class="icn icn-overyay-sure fl icn-creat-new"></a><i class="icn-songlist icn-songlist-edit-cancel mt5 ml5 alone_cancel"></i></span></div><div class="myalllst-con myslt-con pt10 mySongList" style="border-top: 1px solid #555555;"><div class="scroll" id="m-playlist-scroll3"><div class="viewport fl"><div class="overview" type="mySongList"></div></div><div class="scrollbar"><div class="track"><div class="thumb"></div></div></div></div></div></div></div><ul class="listtools"><li><div class="col col-0"><input type="checkbox" id="playlist-allCbox" class="cke"></div><div class="col col-2"><a class="icn icn-all" hidefocus="true" href="javascript:void(0);">全选</a><a class="icn icn-delitem" hidefocus="true" href="javascript:void(0);">删除</a><a class="icn icn-pldown" hidefocus="true" href="javascript:void(0);" style="display:none;">全部播放</a></div><div class="col col-x3 fr"><a class="icn icn-clearlist fr" hidefocus="true" href="javascript:void(0);">清空列表</a><a class="icn icn-addMyPlaylist fr" hidefocus="true" href="javascript:void(0);">添加到我的歌单</a><a class="icn icn-addMyCollect fr" hidefocus="true" href="javascript:void(0);">添加到我的收藏</a></div></li></ul></div><div class="listlrc"><a href="javascript:void(0);" class="cover"><img src="http://img01.12530.com/res/images/default.jpg" alt="" style="cursor:default"/></a><div class="lrc" id="lrcWrapper"><table id="lrcTable" cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" ><tr><td>该歌曲暂无歌词！</td></tr></table></div></div></div></div></div></div></div><div class="m-playlist-overlay" id="m-playlist-overlay" style="left: 50px; top: 100px; display:none;width:260px;overflow: auto;"><span class="icn icn-overlay-sj ml20"></span><div class="m-playlist-overlay-con"><ul class="m-playlist-o-list"></ul><div class="overlay-add-wrap"><span class="icn overlay-add-btn white">新建歌单</span><span class="overlay-add-info clearfix" style="display:none"><input type="text" value="我的音乐" class="fl icn input_songList"/><a class="icn icn-overyay-sure fr icn-creat-add" href="javascript:void(0);"></a></span></div></div></div><div class="m-playlist-overlay" id="m-removelist-overlay" style="left: 82px; top: 257px; width:110px; display:none;"><span class="icn icn-overlay-sj ml20"></span><div class="m-playlist-overlay-con" style="padding:10px;"><p class="pb5">删除歌单</p><div class="clearfix"><a class="icn icn-overyay-sure fl mr10" href="javascript:void(0);"></a><a class="icn icn-overyay-cancel fr" href="javascript:void(0);"></a></div></div></div>';
	return html;
};
$(window).load(function(){
	var html = getPlayerHtml();
	$('body').append(html);

	ui_playerbar=$("#id-playerbar");
	ui_player=$("#g_player");
	ui_playlist=$("#g_playlist");
	list_content=$("#playList_temp");

	playerUI.setAction($(".g-btmbar"));
	playerUI.initPlayerUI();
	playerUI.initFlashACR();
	$('.listhdc em').eq(0).trigger("click");
});
window[appName]={
	toPlayList:playerUI.playList,
	clearList:playerUI.clearList,
	viewPlayer:playerUI.viewPlayer
}
})();