class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :correct_user_for_docs, only: [:edit, :update, :destroy]
  before_action :current_user_documents, only:[:show]
  before_action :get_identification_type
  before_action :check_current_profile
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = current_user.documents.build
    get_identification_type

  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = current_user.documents.build(document_params)
    get_identification_type
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title,:file, :slug)
    end

    # check if the user is authorised to edit,update or destroy the cv
    def correct_user_for_docs
      @document = current_user.documents.find_by(params[:friendly])
          redirect_to documents_path, notice: "Not authorised to edit this document" if @document.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_documents
        if user_signed_in?
          @documents = current_user.documents.order("created_at DESC")
       end
     end

    # Get get identification type for the current_user
     def get_identification_type
       if user_signed_in?
       @identification_type = current_user.cvs.find_by(params[:identification_type])
      end
     end

     # check if  the current user login in can view the page
       def check_current_profile
          if user_signed_in?
            if current_user.profile_type == "Business"
              redirect_to root_path , notice:"Not authorised to view this page"
            end
          end
       end
end
