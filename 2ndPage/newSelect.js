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
  


CalRange = {"min":0,"max":1000 }

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

