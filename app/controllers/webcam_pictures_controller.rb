class WebcamPicturesController < ApplicationController
  # GET /webcam_pictures
  # GET /webcam_pictures.json
  def index
    @webcam_pictures = WebcamPicture.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @webcam_pictures }
    end
  end

  # GET /webcam_pictures/1
  # GET /webcam_pictures/1.json
  def show
    @webcam_picture = WebcamPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @webcam_picture }
    end
  end

  # GET /webcam_pictures/new
  # GET /webcam_pictures/new.json
  def new
    @webcam_picture = WebcamPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @webcam_picture }
    end
  end

  # GET /webcam_pictures/1/edit
  def edit
    @webcam_picture = WebcamPicture.find(params[:id])
  end

  # POST /webcam_pictures
  # POST /webcam_pictures.json
  def create

    if params[:type] == "data" 
      #we need to save this to a file and set the path in webcam_picture. It's posted as binary data in params image
      picsize = params[:image].length
      #logger.info("we got the data ;) size="+picsize.to_s )
      
      #create a new tempfile named fileupload
      tempfile = Tempfile.new("webcamupload")
      tempfile.binmode
      
      #get the file and decode it with base64 then write it to the tempfile
      tempfile.write( Base64.decode64( params[:image] ) )
     
      #create a new uploaded file
      uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, :filename => "webcamupload.png", :original_filename => "webcamupload.png") 
     
      @webcam_picture = WebcamPicture.new(params[:webcam_picture])
      @webcam_picture.snapshot = uploaded_file
      @webcam_picture.name = "live webcam shot!"

      if @webcam_picture.save
     
        #remove the tempfile now
        tempfile.delete

        flash[:notice] = "Picture saved!"
        redirect_to :action => "index"
      else
        logger.info("save failed!")
        flash.now[:error] = "Binary data not saved"
        render action: "index"
      end
    elsif params[:type] == "pixel"      # reconstruct from csv data in image 0,1,2,3| 0,1,2,...
      
      picsize = params[:image].length
      logger.info("we get some csv values!"+picsize.to_s )
      
      @webcam_pictures = WebcamPicture.all
      render action: "index", notice: "Data csv received server side! size="+picsize.to_s

    else                                  # regular carrierwave upload
    
      @webcam_picture = WebcamPicture.new(params[:webcam_picture])
      respond_to do |format|
        if @webcam_picture.save
          format.html { redirect_to @webcam_picture, notice: 'Webcam picture was successfully created.' }
          format.json { render json: @webcam_picture, status: :created, location: @webcam_picture }
        else
          format.html { render action: "new" }
          format.json { render json: @webcam_picture.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PUT /webcam_pictures/1
  # PUT /webcam_pictures/1.json
  def update
    @webcam_picture = WebcamPicture.find(params[:id])

    respond_to do |format|
      if @webcam_picture.update_attributes(params[:webcam_picture])
        format.html { redirect_to @webcam_picture, notice: 'Webcam picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @webcam_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webcam_pictures/1
  # DELETE /webcam_pictures/1.json
  def destroy
    @webcam_picture = WebcamPicture.find(params[:id])
    @webcam_picture.destroy

    respond_to do |format|
      format.html { redirect_to webcam_pictures_url }
      format.json { head :no_content }
    end
  end
end
