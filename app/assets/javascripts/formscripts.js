var formscripts = (function(){
  
  return {

    init: function(){
        /* for graceful degredation, javascript powered buttons will only be displayed if user has javascript 
         enabled in their browser */
        $('.checkboxes').hide();
        $('.bootstrap-button').show();
        this.setButtons();
        this.setValidation();
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

    /* sets up validation parameters for the form */
    setValidation: function() {
        // regular expressions
        var string_regex = '^.{1,30}$';
        var time_regex = '^([1-9]|1[0-2]):([0-5][0-9])[ap]m$';

        // max characters
        var string_max = 30;
        var time_max = 7;

        // error messages
        var asterisk = "<span class='glyphicon glyphicon-asterisk' aria-hidden='true'></span> ";
        var name_error = asterisk + 'This field is required';
        var desc_error = asterisk + 'This field is required';
        var check_error = asterisk + 'Select at least one day';
        var string_error = asterisk + 'This field is required';
        var time_error = asterisk + 'Format time like "1:23pm"';

        // apply to form fields
        $('#name-field').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', name_error);
        $('#desc-field').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', desc_error);
        $('#start-field').attr('pattern', time_regex).attr('maxlength', time_max).attr('required', true).attr('data-error', time_error);
        $('#end-field').attr('pattern', time_regex).attr('maxlength', time_max).attr('required', true).attr('data-error', time_error);
        // $('input[id=user-first-name]').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', string_error);
        // $('input[id=user-last-name]').attr('pattern', string_regex).attr('maxlength', string_max).attr('required', true).attr('data-error', string_error);
        // $('input[id=user-email]').attr('required', true).attr('data-error', string_error);

        // set up checkbox rule (at least one day must be checked)
        $('#sat-check').attr('data-check', {check: function(e){ 
            $('input[type="checkbox"]').each(function() {
                if ($(this).is(":checked")) { return true; }
            });
            return false;
        }});
        
        $('#sat-check').attr('data-errors', {check: check_error});

        // apply to form
        $('#courseform').attr('data-html', true).validator();
    },

  }

}());

