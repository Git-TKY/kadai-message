class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new(content: 'sample')
  end

  def create
    @message = Message.new(message_params)
        
    if @message.save
      flash[:success] = "Messageが正常に投稿されました"
      redirect_to @message #message_path(@message)
    else
      flash.now[:danger] = "Messageが投稿できませんでした"
      render :new
    end
  end
  ##### redirect_to と render の違い
# redirect_to @message は 処理を messages#show のアクションへと強制的に移動させるもので
# create アクション実行後に更に show アクションが実行され、show.html.erb が呼ばれます。
# render :new は、単に messages/new.html.erb を表示するだけです（messages#newのアクションは実行しない）。

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    flash[:success] = 'Message は正常に削除されました'
    redirect_to messages_url
  end
  
  private
  
  #Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  end
end