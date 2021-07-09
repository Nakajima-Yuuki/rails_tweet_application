class PostsController < ApplicationController
  def index

    @posts = [
      
      "今日からでRailsの勉強するよー！",
      "投稿一覧ページ作成中！"
    ]
  end
end
