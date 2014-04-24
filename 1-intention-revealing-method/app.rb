require './setup'

class ProjectsController
  def index
    if user_created_week_ago?
      @projects = current_user.active_projects

    # If not admitted we show some featured projects, and set a marketing flash
    # message when user is new
    else
      if current_user && current_user.created_at > (Time.now - 7*24*3600)
        @flash_msg = 'Sign up for having your own projects, and see promo ones!'
      end
      @projects = Project.featured
    end
  end

  private
  def user_created_week_ago?
    current_user && current_user.created_at < (Time.now - 7*24*3600)
  end
end

require './tests' if __FILE__ == $0
