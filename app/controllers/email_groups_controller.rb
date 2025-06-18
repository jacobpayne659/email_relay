class EmailGroupsController < ApplicationController
  before_action :set_email_group, only: %i[ show edit update destroy ]

  # GET /email_groups or /email_groups.json
  def index
    @email_groups = EmailGroup.all
  end

  # GET /email_groups/1 or /email_groups/1.json
  def show
  end

  # GET /email_groups/new
  def new
    @email_group = EmailGroup.new
  end

  # GET /email_groups/1/edit
  def edit
  end

  # POST /email_groups or /email_groups.json
  def create
    @email_group = EmailGroup.new(email_group_params)

    respond_to do |format|
      if @email_group.save
        format.html { redirect_to @email_group, notice: "Email group was successfully created." }
        format.json { render :show, status: :created, location: @email_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_groups/1 or /email_groups/1.json
  def update
    respond_to do |format|
      if @email_group.update(email_group_params)
        format.html { redirect_to @email_group, notice: "Email group was successfully updated." }
        format.json { render :show, status: :ok, location: @email_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_groups/1 or /email_groups/1.json
  def destroy
    @email_group.destroy!

    respond_to do |format|
      format.html { redirect_to email_groups_path, status: :see_other, notice: "Email group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_group
      @email_group = EmailGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def email_group_params
      params.expect(email_group: [ :name, :group_email, :message_count ])
    end
end
