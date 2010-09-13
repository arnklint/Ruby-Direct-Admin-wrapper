require 'net/http'

class DirectAdmin
  
  class Error < ::StandardError
  end  
  
  def initialize(username, password)
    #@config = YAML.load(ERB.new(File.read(RAILS_ROOT + '/config/direct_admin.yml')).result)[RAILS_ENV].symbolize_keys
    @auth_username = username
    @auth_password = password
    @http=Net::HTTP.new('directadmin.domain.com', 2222)
  end
  
  private

  def post(uri, *args)
    options = args.first || {}
    params = ""
    options.each do |o|
      params << "#{o[0]}=#{o[1]}&"
    end
    uri = "/#{uri}?#{params}api=yes"
    resp = ""
    begin
      @http.start() {|http|
        req = Net::HTTP::Get.new(uri)
        req.basic_auth @auth_username, @auth_password
        response = http.request(req)
        resp = response.body
      }
      resp
    rescue
    end
    
  end
  
  # TODO: get usage, get HTTP verb
  def get()
    
  end

end

#w = WebAccount.new("account_name", "account_password")
#create user account
#w.create("domain.com", "user", "jonas@domain.com", "password", "account")
#w.usage("anvandare")

#e = EmailAccount.new("username", "password")

#e.create("domain.com", "email_username", "pass")
#e.create("domain.com", "email_username2", "password")
#e.change_password("email@address.com", "original_password", "new_password")

#e = EmailAccount.new("username", "jonasa")
#e.list("domain.se")

#Delete user account
#w.delete("username")