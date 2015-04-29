var schedulescripts = (function() {

  var INITIAL_OFFSET = 45;      // initial distance from top of "day" div to beginning of 6am hour in pixels
  var HOUR_HEIGHT = 35;         // height of each hour in pixels

  return {

    /* HELPER: takes a string containing a time (e.g. 9:02am) and returns the number of minutes since 6am,
     * assuming time is after 6am and before 11pm, otherwise -1 is returned */
    getMinutes: function(timestr){
      var hour = parseInt(timestr.slice(0, timestr.indexOf(":")));
      var min = parseInt(timestr.slice(-4,-2));
      var pmflag = timestr.search("pm");

      if (pmflag == -1 && (hour < 6 || hour == 12)) return -1;        // return -1 if time is before 6am
      if (pmflag != -1 && hour == 11 && min > 0) return -1;           // return -1 if time is after 11pm

      var minutes = min;

      if (pmflag == -1){
          minutes += (hour - 6) * 60;         // morning
      } else {
          if (hour == 12){
              minutes += 360;                 // 12pm
          } else {
              minutes += 360 + hour * 60;     // afternoon/evening
          }
      }

      return minutes;
    },

    /* HELPER: takes the start time in minutes since 6am and returns the offset in pixels that the classbox should have */
    getOffset: function(startmin){
      var hours = startmin / 60;
      var rest = startmin % 60;
      return Math.floor(INITIAL_OFFSET + (hours * HOUR_HEIGHT) + (rest / HOUR_HEIGHT));
    },

    /* HELPER: takes the start/end time in minutes since 6am and returns the height in pixels that the classbox should have,
     * assuming end is after start, otherwise -1 is returned */
    getHeight: function(startmin, endmin) {
      var diff = endmin - startmin;

      if (diff < 0) return -1;        // return -1 if start is after end

      var height = Math.ceil(diff * (HOUR_HEIGHT / 60));

      if (height < 20) {
          return 20;                  // make sure the box is big enough for the text!
      } else {
          return height;
      }
    },

    /* takes a day (e.g. "sun"), descriptive text, a start time string (e.g. "10:15am"), and an end time string and
     * creates a box in the appropriate day of the week column on the page */
    makeBox: function(id, day, desc, start, end, color){
      var startmin = this.getMinutes(start);
      var endmin = this.getMinutes(end);

      if (startmin == -1 || endmin == -1) return -1;     // something is invalid so give up

      var offset = this.getOffset(startmin);
      var height = this.getHeight(startmin, endmin);

      if (height == -1) return -1;                       // something is invalid so give up

      // construct a new classbox and add to the DOM
      var classbox = "<div class='cbox" + id + " classbox' style='" +
                          "height:" + height + "px; " +
                          "top:" + offset + "px;" +
                          "line-height:" + height + "px;" +
                          "background: linear-gradient(" + myspectrum.colorLuminance(color, 0.2) + "," + myspectrum.colorLuminance(color, -0.2) + ");" +
                      "'>" + desc + "</td></div>";
      $('#'+day).append(classbox);
    },

    /* removes classboxes for a particular course from the visualized schedule */
    deleteSchedule: function(id){ $('.cbox'+id).remove(); },

    /* generates classboxes for a particular course on the visualized schedule */
    createSchedule: function(id){
        // delete all previously created classboxes for this course
        this.deleteSchedule(id);

        // create new boxes
        var desc = $("#course-"+id+"-desc").text();
        var start = $("#course-"+id+"-start").text();
        var end = $("#course-"+id+"-end").text();
        var color = $('#course-'+id+'-color').text();

        if ($("#course-"+id+"-sun").text() == "true") this.makeBox(id, 'sun', desc, start, end, color);
        if ($("#course-"+id+"-mon").text() == "true") this.makeBox(id, 'mon', desc, start, end, color);
        if ($("#course-"+id+"-tue").text() == "true") this.makeBox(id, 'tue', desc, start, end, color);
        if ($("#course-"+id+"-wed").text() == "true") this.makeBox(id, 'wed', desc, start, end, color);
        if ($("#course-"+id+"-thu").text() == "true") this.makeBox(id, 'thu', desc, start, end, color);
        if ($("#course-"+id+"-fri").text() == "true") this.makeBox(id, 'fri', desc, start, end, color);
        if ($("#course-"+id+"-sat").text() == "true") this.makeBox(id, 'sat', desc, start, end, color);

        // update form disp colors - talks to myspectrum_initialize.js (bad code, I know)
        $('#disp-'+id).css('background-color', color).css('background', 'linear-gradient('+ myspectrum.colorLuminance(color, 0.2) + "," + myspectrum.colorLuminance(color, -0.2) + ')');

        // install mouseover handlers to do fancy highlighting magic    
        function enter(){
            $('.cbox'+id).css('background', 'linear-gradient('+ myspectrum.colorLuminance(color, 0.4) + "," + color + ')');
            $('.cbox'+id).css('border', '1px solid #DAA520');
            $('#disp-'+id).css('background', 'linear-gradient('+ myspectrum.colorLuminance(color, 0.4) + "," + color + ')');
            $('#disp-'+id).css('border', '1px solid #DAA520');
        }

        function leave(){
            $('.cbox'+id).css('background', 'linear-gradient('+ myspectrum.colorLuminance(color, 0.2) + "," + myspectrum.colorLuminance(color, -0.2) + ')');
            $('.cbox'+id).css('border', '1px solid gray');
            $('#disp-'+id).css('background', 'linear-gradient('+ myspectrum.colorLuminance(color, 0.2) + "," + myspectrum.colorLuminance(color, -0.2) + ')');
            $('#disp-'+id).css('border', '1px solid gray');
        }
        
        $('.cbox'+id).mouseenter(function(){enter()});
        $('#disp-'+id).mouseenter(function(){enter()});
        $('.cbox'+id).mouseleave(function(){leave()});
        $('#disp-'+id).mouseleave(function(){leave()});

        // disable selection
        $('.cbox'+id).addClass('noselect');

        // fade the boxes in
        $('.cbox'+id).fadeIn(600);
    },
  }

}());
