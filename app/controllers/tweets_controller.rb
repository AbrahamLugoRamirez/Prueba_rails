class TweetsController < ApplicationController

before_action :authenticate_user!

def index
    @tweets = current_user.tweets
end

def show
    @tweets = current_user.tweets
end
def new
    @tweets = Tweet.show
  end

def create
    @tweets = Tweet.new(tweets_params)
    
        if @tweets.save
            
            redirect_to tweets_path, notice: 'hello'
            puts "Se guardó bien!"
        else
            puts @tweets.errors.full_messages.join(", ")

        end
    
end
def destroy
    @post = Tweet.find(params[:id])
    @post.destroy
    redirect_to tweets_path
end

private
def tweets_params
    params.require(:tweet).permit(:username, :description)
end

end
