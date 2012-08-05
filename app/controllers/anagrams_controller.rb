class AnagramsController < ApplicationController
  
  before_filter :get_attachment, only: :create
  
  def get_attachment
    @attachment = Attachment.last
  end
  
  def create
    @anagram = @attachment.anagrams.build(params[:anagram])
    if @anagram.save
      flash[:success] = "created"
      redirect_to @attachment
    else
      flash[:error] = "text field can't be blank"
      redirect_to @attachment
    end
  end
end
