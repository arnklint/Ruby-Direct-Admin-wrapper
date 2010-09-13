class EmailAccount < DirectAdmin
  def list(domain)
    post('CMD_API_POP', 
      :action => 'list',
      :domain => domain
    )
  end
  
  def create(domain, user, password, quota = 5)
    post('CMD_API_POP',
      :action => 'create',
      :domain => domain, 
      :user => user,
      :passwd => password,
      :quota => quota
    )
  end
  
  def delete(domain, user)
    post('CMD_API_POP', 
      :action => 'delete', 
      :domain => domain, 
      :user => user
    )  
  end
  
  def change_password(email, oldpassword, newpassword)
    post('CMD_CHANGE_EMAIL_PASSWORD',
      :email => email,
      :oldpassword => oldpassword,
      :password1 => newpassword,
      :password2 => newpassword
    )
  end
end