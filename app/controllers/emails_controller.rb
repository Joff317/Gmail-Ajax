class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show
    @email.update(
      read: @email.read
    )
    respond_to do |format|
        format.html { redirect_to emails_path, notice: "Email was successfully updated." }
        format.js {}
      
    end
  end

  # GET /emails/new
  def new
    create
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(body: Faker::Lorem.paragraph, object: Faker::Book.title)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    @email_list = Email.all
    @email.update(
      read: !@email.read
    )
    respond_to do |format|
        format.html { redirect_to emails_path }
        format.js {}
      
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: "Email was successfully destroyed." }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:object, :body)
    end
end
