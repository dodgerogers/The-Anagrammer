class AttachmentsController < ApplicationController
  
  def new
    @attachment = Attachment.new
  end
  
  def show
    @attachment = Attachment.last
    @anagrams = @attachment.anagrams
  end
  
  def create
    beginning = Time.now
    if params[:attachment].blank?
      flash[:error] = "Please upload a file"
      render 'new'
    else
      @attachment = Attachment.new
      @attachment.uploaded_file = params[:attachment]
      @time = (Time.now - beginning)
      if @attachment.save
        flash[:success] = "File uploaded in #{@time} seconds"
        redirect_to @attachment
     end
    end
  end
end
