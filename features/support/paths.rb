# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the new schedule page$/i
        self.send('new_schedule_path'.to_sym)

    when /^the edit schedule page for schedule (.*)$/i
        self.send('edit_schedule_path'.to_sym, $1)

    when /^the show schedule page for schedule (.*)$/i
        self.send('schedule_path'.to_sym, $1)

    when /^the new courses page for course (.*)$/i
        self.send('new_schedule_course_path'.to_sym, $1)

    when /^the edit courses page for schedule (.*) course (.*)$/i
        self.send('edit_schedule_course_path'.to_sym, $1, $2)

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{path_components.join('_')}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
