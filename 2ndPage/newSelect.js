  $(function() {
    $('.tagBox').accordion({collapsible: true, active: false, heightStyle: "content" });
    $('.IngreMainCat').accordion({collapsible: true, active: false, heightStyle: "content" });
  });


Like = [];
Hate = [];

  $(function() {
    $( "#AllTable .test" ).draggable({
      appendTo: "body",
      helper: "clone",
      revert: "invalid",
      
    });


    $( ".tagBox #AllTable" ).droppable({
      drop: function( event, ui ) {
        var $item = ui.draggable;
        $item.appendTo(".tagBox #AllTable");
        var ingre = $item.text();
        if($.inArray(ingre,Hate) > -1){
          var index = Hate.indexOf(ingre);
          if (index > -1) {
            Hate.splice(index, 1);
          }
        }
                if($.inArray(ingre,Like) > -1){
          var index = Like.indexOf(ingre);
          if (index > -1) {
            Like.splice(index, 1);
          }
        }
      } 
    }); 

    $( ".LikeBox .droptrue" ).droppable({
      drop: function( event, ui ) {
        var $item = ui.draggable;
        $item.appendTo("#likeTable");
        var ingre = $item.text();
        Like.push(ingre);
        if($.inArray(ingre,Hate) > -1){
          var index = Hate.indexOf(ingre);
          if (index > -1) {
            Hate.splice(index, 1);
          }
        }
      } 
    }); 

    $( ".HateBox .droptrue" ).droppable({
      drop: function( event, ui ) {
        var $item = ui.draggable;
        $item.appendTo("#hateTable");
        var ingre = $item.text();
        Hate.push(ingre);
        if($.inArray(ingre,Like) > -1){
          var index = Like.indexOf(ingre);
          if (index > -1) {
            Like.splice(index, 1);
          }
        }
      } 
    });
  });  
// $(function() {
// $("#likeTable > div").click(function(){alert("123")});
// });
//     $( "#likeTable > div" ).click(function( event ) {
//       var $item = $( this ),
//         $target = $( event.target );
//         alert( $item );
//             return false;
//     });

Perference = { "Meat": 0, "F": 0, "G": 0, "H": 0, "I": 0, "J":0}


  $(function() {
    $( "#slider-range-A" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        if(ui.value == 1){
        Perference['Meat'] = ui.value;        
        }
      }
    });
  });

  $(function() {
    $( "#slider-range-B" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        if(ui.value == 1){
        Perference['Meat'] = ui.value;        
        }
  
      }
    });
  });
  

  $(function() {
    $( "#slider-range-C" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        if(ui.value == 1){
        Perference['Meat'] = ui.value;        
        }
  
      }
    });
  });
  

  $(function() {
    $( "#slider-range-D" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        if(ui.value == 1){
        Perference['Meat'] = ui.value;        
        }
  
      }
    });
  });
  

  $(function() {
    $( "#slider-range-E" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        if(ui.value == 1){
        Perference['Meat'] = ui.value;        
        }
  
      }
    });
  });
  

  $(function() {
    $( "#slider-range-F" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        Perference['F'] = ui.value;
      }
    });
  });
  

  $(function() {
    $( "#slider-range-G" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        Perference['G'] = ui.value;
      }
    });
  });
  

  $(function() {
    $( "#slider-range-H" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        Perference['H'] = ui.value;
      }
    });
  });
  

  $(function() {
    $( "#slider-range-I" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        Perference['I'] = ui.value;
      }
    });
  });
  

  $(function() {
    $( "#slider-range-J" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        Perference['J'] = ui.value;
      }
    });
  });
  


CalRange = {"min":75,"max":800 }

  $(function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 1000,
      values: [ 75, 800 ],
      slide: function( event, ui ) {
        $( "#amount" ).val("  "+ ui.values[ 0 ] + " 大卡 ～ "+ ui.values[ 1 ] + " 大卡");
        CalRange['min'] = ui.values[ 0 ];
        CalRange['max'] = ui.values[ 1 ];
      }
    });
    $( "#amount" ).val("  "+ $( "#slider-range" ).slider( "values", 0 ) + " 大卡 ～ " + $( "#slider-range" ).slider( "values", 1 ) + " 大卡");
  });



  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      height: 510,
      width: 460,
      modal: true,
    });
 
    $( "#opener" ).click(function() {
      $( "#dialog" ).dialog( "open" );
    });
  });

  $(function() {
    $( document ).tooltip();
  });

  $(function() {
    $(window).load(function(){
      //$('#nav').stop().animate({'opacity':'0.2'},400);
      var scrollTop = $(window).scrollTop();
      //if(scrollTop != 0)
        $('#nav').stop().animate({'opacity':'0.6'},400);
      //else  
        //$('#nav').stop().animate({'opacity':'1'},400);
    });
    
     $(window).scroll(function(){
      var scrollTop = $(window).scrollTop();
      if(scrollTop != 0)
        $('#nav').stop().animate({'opacity':'0.6'},400);
      else
        $('#nav').stop().animate({'opacity':'1'},400); 
        
    });
    
    $('#nav').hover(
      function (e) {
        //var scrollTop = $(window).scrollTop();
        //if(scrollTop != 0){
          $('#nav').stop().animate({'opacity':'1'},400);
        //}
      },
      function (e) {
        //var scrollTop = $(window).scrollTop();
        //if(scrollTop != 0){
          $('#nav').stop().animate({'opacity':'0.6'},400);
        //}
      }
    );
  });
  

$('#starclick').on('click', function(event, target) {
  var liked = '';
  var hate= '';
  var preference = '';
  var limitcal = '';
    liked = Like.join(',');
  hate = Hate.join(',');
  preference += Preference['Meat']+','+Preference['F']+','+Preference['G']+','+Preference['H']+','+Preference['I']+','+Preference['J'];
  limitcal += CalRange['min']+','+CalRange['max'];
  
  $('input[name = "liked"]').attr('value',liked);
  $('input[name = "hate"]').attr('value',hate);
  $('input[name = "preference"]').attr('value',preference);
  $('input[name = "limitcal"]').attr('value',limitcal);
  //$.post( "../results/", {'liked': liked,  'hate': hate, 'preference': preference });
});