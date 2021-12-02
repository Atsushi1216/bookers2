class SearchsController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
      elsif method == "backward_match"
        User.where('name LIKE ?','%'+content+'')
      elsif method == "forward_match"
        User.where('name LIKE ?',''+content+'%')
      end
    elsif model == 'book'
      if method == 'perfect'
        Book.where(title: content,body: content)
      elsif method == 'partial'
        Book.where('title LIKE ? OR body like ? ', '%'+content+'%', '%'+content+'%')
      elsif method == "backward_match"
        Book.where('title LIKE ? OR body like ? ','%'+content+'','%'+content+'')
      elsif method == "forward_match"
        Book.where('title LIKE ? OR body like ? ',''+content+'%',''+content+'%')
      end
    end
  end
end

