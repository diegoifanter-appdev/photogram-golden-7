class PicturesController < ApplicationController

  def index
   
    @photo_list = Photo.all
   
    render("pic_templates/all_photos.html.erb")
  
  end
  
  def new_form
    
    render("pic_templates/blank_form.html.erb")
    
  end 
  
  def create_photo
    
  source = params.fetch("the_source")
  caption = params.fetch("the_caption")
  photo = Photo.new
  photo.source = source
  photo.caption = caption
  photo.save
  @number_of_photos = Photo.count
  
  #render("pic_templates/photo_created.html.erb")
  redirect_to("/photos")
  
  end
  
  def show_details
    
    photo_id = params.fetch("id")
    @photo = Photo.find(photo_id)

    render("pic_templates/photo_details.html.erb")
    
  end  
  
  def edit_form
    
    @photo_id = params.fetch("id")
    @photo = Photo.find(@photo_id)
    
    render("pic_templates/edit_form.html.erb")
  
  end
  
  def update_row
    
  source = params.fetch("the_source")
  caption = params.fetch("the_caption")
  @id =params.fetch("id")
  
  photo = Photo.find(@id)
  photo.source = source
  photo.caption = caption
  photo.save
    
  #render("pic_templates/photo_updated.html.erb")
  redirect_to("/photos/"+@id)
  
  end
  
  def delete_row
    id = params.fetch("id")
    photo = Photo.find(id)
    photo.destroy
    @number_of_photos = Photo.count
    
    #render("pic_templates/photo_deleted.html.erb")
    redirect_to("/photos")
    
  end  
end