class User
	attr_accessor :login, :full_name, :email, :age

	def json
	    {:user => 
          {:login => self.login, 
           :full_name => self.full_name, 
           :email => self.email, 
           :age => self.age
          }
        }.to_json
	end

	def base_url(value)
		"http://localhost:3000/users/#{value.to_s}"
	end
end