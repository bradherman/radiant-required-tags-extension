class Admin::TagsController < Admin::ResourceController
  
  def index 
    #@tags = Tag.all
    @tags = Tag.find(:all, :conditions => ['title LIKE ?', "%#{params[:search]}%"])   
    response_for :plural
  end
  
  def show
    @tag = load_model
  end
  
  def cloud
    @tags = Tag.sized(Tag.with_count)
    response_for :plural
  end
  
  def remove
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag successfully removed."
    redirect_to "/admin/tags"
  end
    
end
