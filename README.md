##remote-modals-demo

This application shows how to implement remote modals windows in rails application.

The original version was the code for the article: <http://www.jetthoughts.com/blog/tech/2014/08/27/5-steps-to-add-remote-modals-to-your-rails-app.html>. However this code uses [Slim](http://slim-lang.com/) whereas the article doesn't. 

Working (well, it's not) demo you can find on heroku: <http://remote-modals-demo.herokuapp.com/>

Once the setup is done, to actually use it, the magic in the controller is:
```ruby
	class MessagesController < ApplicationController
		respond_to :html, :json

		def new
    		@message = Message.new
    		respond_modal_with @message
		end
	end
```
And in the view, to actually invoke the modal, you say:
```HTML+ERB
	<%= link_to 'Add message', new_message_path, data: { modal: true } %>
```
