class WebAccount < DirectAdmin
  
  def create(domain, username, email, password, package = "packagename")
    post('CMD_API_ACCOUNT_USER', 
      :action => "create",
      :add => "Submit",
      :username => username,
      :email => email,
      :passwd => password,
      :passwd2 => password,
      :package => package, 
      :ip => @server_ip, 
      :notify => "no", #TODO: notifiera via venio istället
      :domain => domain
    )
  end
  
  def add_domain(domain)
    post('CMD_DOMAIN', 
      :action => 'create',
      :domain => domain,
      :ubandwidth => 'unlimited',
      :uquota => 'unlimited',
      :ssl => 'OFF',
      :cgi => 'OFF',
      :php => 'OFF',
      :create => 'Create'
    )
  end
  
  def delete_domain(domain)
    post('CMD_DOMAIN', 
      :select0 => domain,
      :delete => 'yes', 
      :confirmed => "Confirm"
    )
  end
  
  def delete(username)
    post('CMD_SELECT_USERS',
      :delete => "yes", 
      :select0 => username,
      :confirmed => "Confirm"
    )
  end
  
  def usage(username)
    post('CMD_API_SHOW_USER_USAGE',
      :user => username
    )
  end

end