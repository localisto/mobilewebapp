



 $('#home').live('pageshow', function (event, ui) {

          $('.iosSlider').iosSlider({
          snapToChildren: true,
          desktopClickDrag: true,
          keyboardControls: true,
          onSliderLoaded: sliderTest,
          onSlideStart: sliderTest,
          onSlideComplete: slideComplete,
          navNextSelector: $('.next'),
            navPrevSelector: $('.prev'),
        });
        
   
      
      function sliderTest(args) {
        try {
          console.log(args);
        } catch(err) {
        }
      }
      
      function slideComplete(args) {
      
        $('.next, .prev').removeClass('unselectable');
        
          if(args.currentSlideNumber == 1) {
      
              $('.prev').addClass('unselectable');
      
          } else if(args.currentSliderOffset == args.data.sliderMax) {
      
              $('.next').addClass('unselectable');
      
          }
      
      }    
        

});


 $('#project').live('pageshow', function (event, ui) {

        
        $('#project .iosSlider').iosSlider({
          snapToChildren: true,
          desktopClickDrag: true,
          keyboardControls: true,
          navNextSelector: $('.next'),
          navPrevSelector: $('.prev'),
          navSlideSelector: $('.selectors .item'),
          onSlideChange: slideChange
        });
        
     
      
      function slideChange(args) {
        
        console.log(args);
        $('.selectors .item').removeClass('selected');
        $('.selectors .item:eq(' + (args.currentSlideNumber - 1) + ')').addClass('selected');
        
      }
});



 $('#question').live('pageshow', function (event, ui) {

 $('.iosSlider').iosSlider({
          snapToChildren: true,
          desktopClickDrag: true,
          infiniteSlider: false,
          snapSlideCenter: true,
          onSlideChange: slideChange
        });
 });



