class BaseAction < ::Aldous::ControllerAction
  def default_view_data
    {
      current_user: current_user,
      current_ability: current_ability,
    }
  end

  def preconditions
    []
  end

  def default_error_respondable
    Defaults::ServerErrorView
  end

  private

  def current_user
    @current_user ||= FindCurrentUserService.perform(session).user
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end

