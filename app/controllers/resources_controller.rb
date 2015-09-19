class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
    cookies[:link_id] = nil
    cookies[:link_path] = "/resources"
  end

  def show
    @resource = Resource.find(params[:id])
    @resourcetopic = ResourceTopic.where(resource_id: params[:id])
    @comments = Comment.where(resource_id: @resource.id)
    @topics   = @resource.topics

    cookies[:link_id] = @resource.id
    cookies[:link_path] = "/resources/#{cookies[:link_id]}"

  end

  def new
    @resource = Resource.new
    @jointopic = ResourceTopic.new
    @topics = Topic.all

    # take me back
    cookies[:link_id] = nil
    cookies[:link_path] = "/resources/new"
  end

  def create
    @resource = Resource.new(resource_params)
    respond_to do |format|
      if @resource.save
        # for each topic checked:
        params[:topic_id].values.each do |i|
          @jointopic = ResourceTopic.create(resource_id: @resource.id, topic_id: i.to_i)
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
    cookies[:link_id] = @resource.id
    cookies[:link_path] = "/resources/#{cookies[:link_id]}/edit"
  end

  def update
    # save the topics now associated with the updated resource
    update_topic_ids = params[:topic_id].values
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
        # UPDATE JOIN TABLE (where necessary)
        update_topic_ids.each do |i|
          topic = ResourceTopic.where(topic_id: i, resource_id: @resource.id)
          if topic==[]
             ResourceTopic.create(resource_id: @resource.id, topic_id: i.to_i)
          end
        end
        # find everything currently associated with this resource, destroy unwanted joins
        ResourceTopic.where(resource_id: @resource.id).select do |i|
          if update_topic_ids.include?(i[:topic_id].to_s)
          else
            i.destroy
          end
        end

    CLIENT.send(mail({
      to: "nialbima@gmail.com", #User.find(@resource.user_id).email
      from: "#{current_user.email}", #
      subject: "#{@resource.name} - Update Submitted",
      text: "HEY THERE. #{@resource.name} was just updated."}))

      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
  end
  end

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
