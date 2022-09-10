class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index]  # deviseのメソッドで「ログインしていないユーザーをログイン画面に送る」メソッド
    
    def index
        @tweets = Tweet.all 
    end

    def new
        # 新規投稿用レイアウト作成
        @tweet = Tweet.new 
    end

    def create
        @tweet = Tweet.new(tweet_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
        @tweet.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
        @tweet.save
        redirect_to tweets_path
    end

    def show
        @tweet = Tweet.find(params[:id])
        @user = @tweet.user
        @favorites = @tweet.favorites
        @comment = current_user.comments.build
        @comments = @tweet.comments
    end

    private
    def tweet_params
      params.require(:tweet).permit(:body) # tweetモデルのbodyカラムのみを許可
    end

end
