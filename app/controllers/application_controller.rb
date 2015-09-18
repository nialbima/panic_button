class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  CLIENT = SendGrid::Client.new(api_user: 'nialbima', api_key: 'password1')

  def mail(options={})
    mail = SendGrid::Mail.new do |m|
      m.to = options[:to]
      m.from = options[:from]
      m.subject = options[:subject]
      m.text = options[:text]
    end
  end


  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end
  helper_method :current_user

end
