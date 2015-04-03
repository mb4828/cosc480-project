/* HELPER: toggles the actual checkboxes on and off for the days of the week buttons
 * (the checkboxes that are displayed on the form are "fake" bootstrap buttons and have "real" checkbox counterparts) */
function checkToggle(id, day){
    courseform.elements[day + "-check"].checked = !courseform.elements[day + "-check"].checked;
}

/* HELPER: sets the "fake" form buttons to match the "real" form checkboxes */
function setButtons(id){
    courseform.elements["sun-check"].checked ? $('#sun').addClass('active').attr('aria-pressed','true') : $('#sun').removeClass('active').attr('aria-pressed','false');
    courseform.elements["mon-check"].checked ? $('#mon').addClass('active').attr('aria-pressed','true') : $('#mon').removeClass('active').attr('aria-pressed','false');
    courseform.elements["tue-check"].checked ? $('#tue').addClass('active').attr('aria-pressed','true') : $('#tue').removeClass('active').attr('aria-pressed','false');
    courseform.elements["wed-check"].checked ? $('#wed').addClass('active').attr('aria-pressed','true') : $('#wed').removeClass('active').attr('aria-pressed','false');
    courseform.elements["thu-check"].checked ? $('#thu').addClass('active').attr('aria-pressed','true') : $('#thu').removeClass('active').attr('aria-pressed','false');
    courseform.elements["fri-check"].checked ? $('#fri').addClass('active').attr('aria-pressed','true') : $('#fri').removeClass('active').attr('aria-pressed','false');
    courseform.elements["sat-check"].checked ? $('#sat').addClass('active').attr('aria-pressed','true') : $('#sat').removeClass('active').attr('aria-pressed','false');
}
