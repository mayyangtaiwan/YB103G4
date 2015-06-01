$(function() {
	$('.tagBox').accordion({collapsible: true, active: false, heightStyle: "content" });
	$('.IngreMainCat').accordion({collapsible: true, active: false, heightStyle: "content" });
});

Liked = [];
Hate = [];

$(function() {
	$( "#AllTable #test" ).draggable({
		appendTo: "body",
		helper: "clone",
        revert: "invalid",
    });

	$( ".LikeBox div" ).droppable({
		drop: function( event, ui ) {
			var $item = ui.draggable;
			$item.appendTo("#likeTable");

	        var ingre = $item.text();
	        Liked.push(ingre);
	        Liked = $.unique(Liked)
		}	
		}); 

		$( ".HateBox div" ).droppable({
		drop: function( event, ui ) {
			var $item = ui.draggable;
			$item.appendTo("#hateTable");

	        var ingre = $item.text();
	        Hate.push(ingre);
	        Hate = $.unique(Hate)
		}	
		}); 
});

  // $(function() {
  //   $( "div.droptrue" ).sortable({
  //     connectWith: "div"
  //   });

  //   $( "#AllTable, #hateTable, #likeTable" ).disableSelection();
  // });

Perference = { "A": 0, "B": 0, "C": 0,"D": 0, "E": 0, "F": 0, "G": 0, "H": 0, "I": 0, "J":0}
  $(function() {
    $( "#slider-range-A" ).slider({
      range: "min",
      min: 0,
      max: 1,
      value: 0,
      slide: function( event, ui ) {
        Perference['A'] = ui.value;
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
        Perference['B'] = ui.value;
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
        Perference['C'] = ui.value;
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
        Perference['D'] = ui.value;
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
        Perference['E'] = ui.value;
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
  




  // var keys;
  // d3.csv("tagsAll-Name.csv",function (csv) {
  //   keys=csv;
  //   start();
  // });

  // function onSelect(d) {
  //   var name = d.V2;
  //   document.getElementById('likeTable').innerHTML= name;
  //   document.getElementById('SearchBox').value = "";
  // }

  // function start() {
  //   var mc = autocomplete(document.getElementById('SearchBox'))
  //   .keys(keys)
  //   .dataField("V2")
  //   .placeHolder("請輸入手上已有的，或是想吃的食材...")
  //   .width(960)
  //   .height(500)
  //   .onSelected(onSelect)
  //   .render();
  // }







