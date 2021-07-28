$(function() {

  // 検索フォームをクリックすると文字が消える
  $('.search-input').on('click', function(){
    $(this).removeAttr('placeholder');
  });

  // ユーザー情報のアコーディオンメニュー
  if(window.matchMedia('(max-width: 480px)').matches){
    $('.user-info .name').remove();
    $('.user-info .suma').show();
  }else{
    $('.user-info').hover(
      function(){
        $('.list').stop().slideDown();
      },
      function(){
        $('.list').slideUp();
    });
  }

  //ページスクロールでtop移動
  $('#page_top').on('click', function(){
    $('html, body').animate({
      'scrollTop':0
    },500
    );
  });
  //一定の位置まできたらスクロールボタン表示
  if($('.scroll-btn-show').length){
    var scrollBtnShow = $('.scroll-btn-show').offset().top;
  }
  var pageTop = $('#page_top');
  $(window).scroll(function(){
    if($(window).scrollTop() > scrollBtnShow){
      pageTop.fadeIn();
    }else{
      pageTop.fadeOut();
    }
  });  
  //「相談一覧」へスクロール移動
  $('#show-btn').on('click', function(){
    var id = $(this).attr('href');
    var position = $(id).offset().top;
    $('html, body').animate({
      'scrollTop': position
    }, 500);
  });

  //一定の位置まできたら相談ボタン表示
  if(window.matchMedia('(min-width: 480px)').matches){
    if($('.soudan-btn-show').length){
      var soudanBtnShow = $('.soudan-btn-show').offset().top;
    }
    var soudanScroll = $('#soudan-scroll');
    $(window).scroll(function(){
      if($(window).scrollTop() > soudanBtnShow){
        soudanScroll.fadeIn();
      }else{
        soudanScroll.fadeOut();
      }
    });  
  }

  // メール文章の内容を取得
  if($('.comment-text').length){
    $('.says').on('click', function(){
      var text = $(this).text();
      var res = $.trim(text);
      $('.comment-text').val(">>" + res + "\n\n");
    });
  }

  // コメント文の内容を取得して引用する
  if($('.comment .text').length){
    $('.text').on('click', function(){
      var commentText = $(this).text();
      var commentRes = $.trim(commentText);
      $('.comment-text').val(">>" + commentRes + "\n\n");
    });
  }

  // コメント欄の改行
  $('.comment .text').each(function(){
    var txt = $(this).html();
    $(this).html(txt.replace(/\n/g, '<br>'));
  });  


});