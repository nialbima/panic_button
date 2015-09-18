class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.find(params[:id])
    @resourcetopic = ResourceTopic.where(resource_id: params[:id])
    @comments = Comment.where(resource_id: @resource.id)
    @topics   = @resource.topics
  end

  def new
    @resource = Resource.new
    @jointopic = ResourceTopic.new
    @topics = Topic.all
    # binding.pry
  end

  def create
    binding.pry

    @resource = Resource.new(resource_params)

    respond_to do |format|
        if @resource.save

        # for each topic checked:
        params[:topic_id].values.each do |i|
          @jointopic = ResourceTopic.new
          @jointopic.resource_id = @resource.id
          @jointopic.topic_id = i.to_i
          @jointopic.save
          binding.pry
        end

        #end
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @topics = Topic.all
  end

  def update
    binding.pry

    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }

        CLIENT.send(mail({
          to: "nialbima@gmail.com", #User.find(@resource.user_id).email
          from: "#{current_user.email}", #
          subject: "#{@resource.name} - Update Submitted",
          text: "HEY THERE. #{@resource.name} was just updated."
          }))

      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
  end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    # delete from join table
    ResourceTopic.where(resource_id: @resource.id).each do |rt|
      rt.destroy
    end

    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:name, :description, :link, :img_url, :week, :user_id, topic_id: [])
    end
end
