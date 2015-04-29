var myspectrum = (function(){

  var COLOR_PALETTE = ['#b6d7a8', '#9fc5e8', '#ea9999', '#b4a7d6', '#f9cb9c', '#ffffff'];

  return {

      /* takes a hex color and luminosity factor (-0.1 is 10% darker, 0.2 is 20% lighter) and returns
       * a new color. Via Craig Buckler at www.sitepoint.com. */
      colorLuminance: function(hex, lum){
          // validate hex string
	        hex = String(hex).replace(/[^0-9a-f]/gi, '');
	        if (hex.length < 6) {
		        hex = hex[0]+hex[0]+hex[1]+hex[1]+hex[2]+hex[2];
	        }
	        lum = lum || 0;

	        // convert to decimal and change luminosity
	        var rgb = "#", c, i;
	        for (i = 0; i < 3; i++) {
		        c = parseInt(hex.substr(i*2,2), 16);
		        c = Math.round(Math.min(Math.max(0, c + (c * lum)), 255)).toString(16);
		        rgb += ("00"+c).substr(c.length);
	        }

	        return rgb;
      },

      getInitColor: function(idtag){
        var randval = Math.floor(Math.random() * COLOR_PALETTE.length)

        if ($(idtag).val() == "") {
            $(idtag).val(COLOR_PALETTE[randval]);   // sets the form field so that it isn't empty
            return COLOR_PALETTE[randval];
        }
        else return $(idtag).val();
      },

      init: function(){
          var idtag = '#color-field';

          $(idtag).spectrum({
              showPaletteOnly: true,
              hideAfterPaletteSelect:true,
              preferredFormat:"hex",
              palette: [  ["#f00", "#f90", "#ff0", "#0f0", "#0ff", "#00f", "#90f", "#f0f"],
                          ["#f4cccc", "#fce5cd", "#fff2cc", "#d9ead3", "#d0e0e3", "#cfe2f3", "#d9d2e9", "#ead1dc"],
                          ["#ea9999", "#f9cb9c", "#ffe599", "#b6d7a8", "#a2c4c9", "#9fc5e8", "#b4a7d6", "#d5a6bd"],
                          ["#e06666", "#f6b26b", "#ffd966", "#93c47d", "#76a5af", "#6fa8dc", "#8e7cc3", "#c27ba0"],
                          ["#c00", "#e69138", "#f1c232", "#6aa84f", "#45818e", "#3d85c6", "#674ea7", "#a64d79"],
                          ["#666", "#999", "#ccc", "#eee", "#f3f3f3", "#fff"]
                       ],
              color: this.getInitColor(idtag),
              //change: function(color) {createSchedule(id);saveCourse(id);}
          });
      },

  };

}());
