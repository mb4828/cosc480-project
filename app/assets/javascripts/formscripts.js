var formscripts = (function(){
  
  var checkedAtLeastOne = function(error_msg){
      // check all checkboxes, stop if a checked box is found and clear error message
      var valid = false;      
      $('input[type="checkbox"]').each(function(){
          if ($(this).is(":checked")) {
              $('#checkbox-errors').html('');
              valid = true;
              return;
          }
      });

      // no checked boxes found, block submit and display an error message
      if (!valid) {
          $('#checkbox-errors').html(error_msg);
          return false;
      }
      return true;
  };

  return {

    init: function(){
        // for graceful degredation, javascript powered buttons will only be displayed if user has javascript enabled
        $('.checkboxes').hide();
        $('.bootstrap-button').show();
        this.setButtons();
        this.setCourseFormValidation();
        myspectrum.init();  // initialize spectrum color box
    },

    /* toggles the actual checkboxes on and off for the days of the week buttons
     * (the checkboxes that are displayed on the form are "fake" bootstrap buttons and 
     * have "real" checkbox counterparts) */
    checkToggle: function(day){
      courseform.elements[day + "-check"].checked = !courseform.elements[day + "-check"].checked;
    },

    /* sets the bootstrap form buttons to match the actual form checkboxes */
    setButtons: function(){
        courseform.elements["sun-check"].checked ? $('#sun').addClass('active').attr('aria-pressed','true') : $('#sun').removeClass('active').attr('aria-pressed','false');
      courseform.elements["mon-check"].checked ? $('#mon').addClass('active').attr('aria-pressed','true') : $('#mon').removeClass('active').attr('aria-pressed','false');
      courseform.elements["tue-check"].checked ? $('#tue').addClass('active').attr('aria-pressed','true') : $('#tue').removeClass('active').attr('aria-pressed','false');
      courseform.elements["wed-check"].checked ? $('#wed').addClass('active').attr('aria-pressed','true') : $('#wed').removeClass('active').attr('aria-pressed','false');
      courseform.elements["thu-check"].checked ? $('#thu').addClass('active').attr('aria-pressed','true') : $('#thu').removeClass('active').attr('aria-pressed','false');
      courseform.elements["fri-check"].checked ? $('#fri').addClass('active').attr('aria-pressed','true') : $('#fri').removeClass('active').attr('aria-pressed','false');
      courseform.elements["sat-check"].checked ? $('#sat').addClass('active').attr('aria-pressed','true') : $('#sat').removeClass('active').attr('aria-pressed','false');

    },

    /* sets up validation parameters for the edit course page */
    setCourseFormValidation: function() {
        // regular expressions
        var string_regex = '^.{1,30}$';
        var time_regex = '^([1-9]|1[0-2]):([0-5][0-9])[ap]m$';
        var hex_regex = '^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$';

        // max characters
        var string_max = 30;
        var time_max = 7;
        var hex_max = 7;

        // error messages
        var asterisk = "<span class='glyphicon glyphicon-asterisk' aria-hidden='true'></span> ";
        var name_error = asterisk + 'This field is required';
        var desc_error = asterisk + 'This field is required';
        var check_error = asterisk + 'Select at least one day';
        var time_error = asterisk + 'Format time like "1:23pm"';
        var hex_error = asterisk + 'This field is required';

        // set up form fields
        $('#name-field').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', name_error);
        $('#desc-field').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', desc_error);
        $('#start-field').attr('pattern', time_regex).attr('maxlength', time_max).attr('required', true).attr('data-error', time_error);
        $('#end-field').attr('pattern', time_regex).attr('maxlength', time_max).attr('required', true).attr('data-error', time_error);
        $('#color-field').attr('pattern', hex_regex).attr('maxlength', hex_max).attr('required', true).attr('data-error', hex_error);

        // add custom validation to checkboxes and submit button (at least one day must be checked)
        $('.bootstrap-button').click(function(){checkedAtLeastOne(check_error)});
        $('button[type="submit"]').click(function(){return checkedAtLeastOne(check_error)});

        // activate validations in html mode
        $('#courseform').attr('data-html', true).validator();
    },

    /* special method to set up validations for the edit schedule page */
    setScheduleFormValidation: function() {
        // regular expressions
        var string_regex = '^.{1,30}$';

        // max characters
        var string_max = 30;

        // error messages
        var asterisk = "<span class='glyphicon glyphicon-asterisk' aria-hidden='true'></span> ";
        var name_error = asterisk + 'This field is required';
        var email_error = asterisk + 'Please enter a valid e-mail address';

        // set up form fields
        $('#user-first-name').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', name_error);
        $('#user-last-name').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', name_error);
        $('#user-email').attr('required', true).attr('data-error', email_error);

        // activate validations in html mode
        $('#scheduleform').attr('data-html', true).validator();
    },

  }

}());

