require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DevicesController do

  def mock_device(stubs={})
    @mock_device ||= mock_model(Device, stubs)
  end

  describe "GET index" do
    it "assigns all devices as @devices" do
      Device.stub!(:find).with(:all).and_return([mock_device])
      get :index
      assigns[:devices].should == [mock_device]
    end
  end

  describe "GET show" do
    it "assigns the requested device as @device" do
      Device.stub!(:find).with("37").and_return(mock_device)
      get :show, :id => "37"
      assigns[:device].should equal(mock_device)
    end
  end

  describe "GET new" do
    it "assigns a new device as @device" do
      Device.stub!(:new).and_return(mock_device)
      get :new
      assigns[:device].should equal(mock_device)
    end
  end

  describe "GET edit" do
    it "assigns the requested device as @device" do
      Device.stub!(:find).with("37").and_return(mock_device)
      get :edit, :id => "37"
      assigns[:device].should equal(mock_device)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created device as @device" do
        Device.stub!(:new).with({'these' => 'params'}).and_return(mock_device(:save => true))
        post :create, :device => {:these => 'params'}
        assigns[:device].should equal(mock_device)
      end

      it "redirects to the created device" do
        Device.stub!(:new).and_return(mock_device(:save => true))
        post :create, :device => {}
        response.should redirect_to(device_url(mock_device))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved device as @device" do
        Device.stub!(:new).with({'these' => 'params'}).and_return(mock_device(:save => false))
        post :create, :device => {:these => 'params'}
        assigns[:device].should equal(mock_device)
      end

      it "re-renders the 'new' template" do
        Device.stub!(:new).and_return(mock_device(:save => false))
        post :create, :device => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested device" do
        Device.should_receive(:find).with("37").and_return(mock_device)
        mock_device.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :device => {:these => 'params'}
      end

      it "assigns the requested device as @device" do
        Device.stub!(:find).and_return(mock_device(:update_attributes => true))
        put :update, :id => "1"
        assigns[:device].should equal(mock_device)
      end

      it "redirects to the device" do
        Device.stub!(:find).and_return(mock_device(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(device_url(mock_device))
      end
    end

    describe "with invalid params" do
      it "updates the requested device" do
        Device.should_receive(:find).with("37").and_return(mock_device)
        mock_device.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :device => {:these => 'params'}
      end

      it "assigns the device as @device" do
        Device.stub!(:find).and_return(mock_device(:update_attributes => false))
        put :update, :id => "1"
        assigns[:device].should equal(mock_device)
      end

      it "re-renders the 'edit' template" do
        Device.stub!(:find).and_return(mock_device(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested device" do
      Device.should_receive(:find).with("37").and_return(mock_device)
      mock_device.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the devices list" do
      Device.stub!(:find).and_return(mock_device(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(devices_url)
    end
  end

end
