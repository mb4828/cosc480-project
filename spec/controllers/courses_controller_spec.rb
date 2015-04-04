require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe "root route" do 
    it "routes to schedules#new" do 
      expect(:get => '/').to route_to(:controller => "schedules",:action => "new")
    end
  end

 describe "GET #new" do
    it "routes correctly" do
      get :index 
      expect(response.status).to eq(200)
    end
  end


  #need to figure out what to show.
  #describe "GET #show" do
  #  it "routes correctly" do
  #    expect(Product).to receive(:find).with("1") { p }
  #    get :show, id: 1
  #    p = Product.new
  #    expect(response.status).to eq(200)
  #  end

  # it "renders the show template" do
  #    expect(Product).to receive(:find).with("1") { p }
  #    get :show, id: 1
  #    expect(response).to render_template(:show)
  #  end
  #end

  describe "create new course" do 

    it "should show success flash message and redirect to index upon successful creation" do
      c = Course.new
      expect(Course).to receive (:new){c}
      expect(c).to receive(:save){true}
      post :create,{:course => {"name" => "intro", "description" => "cosc 101", "sunday" => false, "monday" => true, "tuesday" => false, "wednesday" => true, "thursday" => false, "friday" => true, "saturday" => false, "start_time" => "10:20am", "end_time" => "11:10am", :schedule_id => "1"}, :schedule_id => "1"}
      expect(response).to redirect_to (schedule_courses_path)
      flash['notice'] != nil
    end

    it "should show failure flash message and redirect to index upon failed creation" do
      c = Course.new
      expect(Course).to receive(:new){c}
      expect(c).to receive(:save){nil}
      post :create,{:course => {"name" => "intro", "description" => "cosc 101", "sunday" => false, "monday" => true, "tuesday" => false, "wednesday" => true, "thursday" => false, "friday" => true, "saturday" => false, "start_time" => "10:20am", "end_time" => "11:10am", :schedule_id => "1"}, :schedule_id => "1"}
      expect(response).to redirect_to (schedule_courses_path)
      flash['warning'] != nil
    end
 end


  describe "Update a course" do 

    it "should show success flash message and redirect to index upon successful update" do
      c = Course.new
      expect(Course).to receive(:find).with("1"){c}
      expect(c).to receive(:update){true}
      put :update,{:course => {"id" => "1", "name" => "intro", "description" => "cosc 101", "sunday" => false, "monday" => true, "tuesday" => false, "wednesday" => true, "thursday" => false, "friday" => true, "saturday" => false, "start_time" => "10:20am", "end_time" => "11:10am", :schedule_id => "1"}, :schedule_id => "1"}
      expect(response).to redirect_to (schedule_courses_path)
      flash['notice'] != nil
    end

    it "should show failure flash message and redirect to index upon failed creation" do
      c = Course.new
      expect(Course).to receive(:find).with("1"){c}
      expect(c).to receive(:update){nil}
      put :update,{:course => {"id" => "1", "name" => "intro", "description" => "cosc 101", "sunday" => false, "monday" => true, "tuesday" => false, "wednesday" => true, "thursday" => false, "friday" => true, "saturday" => false, "start_time" => "10:20am", "end_time" => "11:10am", :schedule_id => "1"}, :schedule_id => "1"}
      expect(response).to redirect_to (schedule_courses_path)
      flash['warning'] != nil
    end
 end

  describe "delete a  course" do 

    it "should show success flash message and redirect to index upon successful deletion" do
      c = Course.new
      expect(Course).to receive(:find).with("1"){c}
      expect(c).to receive(:delete){true}
      delete :destroy,{:course => {"id"=>"1","name" => "intro", "description" => "cosc 101", "sunday" => false, "monday" => true, "tuesday" => false, "wednesday" => true, "thursday" => false, "friday" => true, "saturday" => false, "start_time" => "10:20am", "end_time" => "11:10am", :schedule_id => "1"}, :schedule_id => "1"}
      expect(response).to redirect_to (schedule_courses_path)
      flash['notice'] != nil
    end

    it "should show failure flash message and redirect to index upon failed deletion" do
      c = Course.new
      expect(Course).to receive(:find).with("1"){c}
      expect(c). to receive(:delete){nil}
      delete :destroy,{:course => {"id"=>"1","name" => "intro", "description" => "cosc 101", "sunday" => false, "monday" => true, "tuesday" => false, "wednesday" => true, "thursday" => false, "friday" => true, "saturday" => false, "start_time" => "10:20am", "end_time" => "11:10am", :schedule_id => "1"}, :schedule_id => "1"}
      expect(response).to redirect_to (schedule_courses_path)
      flash['warning'] != nil
    end
 end

 

  


end
