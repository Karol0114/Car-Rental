function animacja(){
$(document).ready(
	function(){
		$('#prelogo').animate({"opacity":"0.3", "width":"5%"},1000).animate({"opacity":"1", "width":"30%"},1000);

	}
);
}
setInterval('animacja()',100);






function preloader(){
	$('#preloader').delay(1000).animate({"opacity":"0"},2000).animate({"z-index":"-1"},100);
}





$(window).scroll(function(){
   var top = $(window).scrollTop();
   var find_class_small = $.contains('nav', '.small');
 
   if(top > 50 && find_class_small == false) {
    $('nav').addClass('small'); 
   }
   else {
    $('nav').removeClass('small'); 
   }
 
});

$(document).ready(
	function(){
			$("#kacper").mouseenter(
		function(){	
				$("#opis1").fadeIn(100);
				$("#img1").animate({width:"120%", marginLeft:"-2.5%"},200);
			},
		);
		$("#kacper").mouseleave(
		function(){	
				$("#opis1").fadeOut(200);
				$("#img1").animate({width:"100%", marginLeft:"1.5%"},200);
			},
		);
		
		$("#wojtek").mouseenter(
		function(){	
				$("#opis2").fadeIn(200);
				$("#img2").animate({width:"120%", marginLeft:"-2.5%"},200);
			},
		);
		$("#wojtek").mouseleave(
		function(){	
				$("#opis2").fadeOut(100);
				$("#img2").animate({width:"100%", marginLeft:"1.5%"},200);
			},
		);
		
		$("#dawid").mouseenter(
		function(){	
				$("#opis3").fadeIn(200);
				$("#img3").animate({width:"120%", marginLeft:"-2.5%"},200);
			},
		);
		$("#dawid").mouseleave(
		function(){	
				$("#opis3").fadeOut(100);
				$("#img3").animate({width:"100%", marginLeft:"1.5%"},200);
			},
		);
		
		$("#kamil").mouseenter(
		function(){	
				$("#opis4").fadeIn(200);
				$("#img4").animate({width:"120%", marginLeft:"-2.5%"},200);
			},
		);
		$("#kamil").mouseleave(
		function(){	
				$("#opis4").fadeOut(100);
				$("#img4").animate({width:"100%", marginLeft:"1.5%"},200);
			},
		);
		
		$("#maciek").mouseenter(
		function(){	
				$("#opis5").fadeIn(200);
				$("#img5").animate({width:"120%", marginLeft:"-2.5%"},200);
			},
		);
		$("#maciek").mouseleave(
		function(){	
				$("#opis5").fadeOut(100);
				$("#img5").animate({width:"100%", marginLeft:"1.5%"},200);
			},
		);
	}
);
