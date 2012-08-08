class AnagramsController < ApplicationController
  
  
  def create
    @attachment = Attachment.last
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
