

class DoltBranchSelector
  def initialize(app)
    @app = app
  end
  
  def call(env)
    session = env['rack.session']
    active_branch = 'main'
    if session[:active_branch]
      active_branch = session[:active_branch]
    end
    ActiveRecord::Base.connection.execute("CALL DOLT_CHECKOUT('" + active_branch + "')")
    @app.call(env)
  end
end
