class PostsController < ApplicationController
 	 before_action :authorize
 	def index
        @posts = Post.all.order('created_at DESC')
        
    end

    def new
    	@posts = Post.new
        @events = Event.new
    end

    def show
        @posts = Post.all.shuffle
        @post = Post.find(params[:id])
        @comment = Comment.new
    end

    def create
        # @posts = Post.new(post_params)
        # @events = Event.new(event_params)    
        
        current_user.posts << Post.create({
          :title => params[:title],
          :body => params[:body],
          :youtube_url => params[:youtube_url],
          :image_url => params[:image_url],
          :lat => params[:lat],
          :lng => params[:lng]
        })
       # if  current_user.save 
       #   redirect_to posts_path, notice: 'Post was successfully created.' 
       # else
       #   redirect_to new_post_path
       # end
          
    respond_to do |format|     
        if current_user.save
            
            format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @posts }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end

            

def edit
    @post = Post.find(params[:id])
end

def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:title,:body,:youtube_url,:image_url))
        redirect_to posts_path
    else 
        render :edit
    end
end

def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'post was successfully destroyed.' }
      format.json { head :no_content }
    end
    
end


private
	def post_params
		params.require(:post).permit(:title,:body,:youtube_url, :image_url)
	end

    

end
