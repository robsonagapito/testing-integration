class RestSupport
	attr_accessor :response

	def get(url)
		self.response = RestClient.get url, :content_type => :json, :accept => :json
	end

	def post(url, json)
		self.response = RestClient.post url, json, :content_type => :json, :accept => :json
	end

	def put(url, json)
		self.response = RestClient.put url, json, :content_type => :json, :accept => :json
	end

	def patch(url, json)
		self.response = RestClient.patch url, json, :content_type => :json, :accept => :json
	end

	def delete(url)
		self.response = RestClient.delete url, :content_type => :json, :accept => :json
	end

	def code_status
		self.response.code
	end

	def json
		JSON.parse(self.response)
	end

end
