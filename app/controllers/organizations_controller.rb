class OrganizationsController < GroupsController
  # Change the settings of inherited_resources for organizations
  defaults resource_class: Organization

  before_filter :redirect_to_members, only: [ :index ]

  def index
    respond_to do |format|
      format.html {
        if request.xhr?
          render partial: 'list',
                 object: collection
        end
      }
      format.json {
        render json: current_user.organizations.map{|o| o.api_attributes }
      }
    end
  end

  def show
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        render json: resource.api_attributes
      }
    end
  end

  def create
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        create! do |success, error|
          success.json { 
            render json: resource.api_attributes
          }
          error.json {
            render json: resource.errors
          }
        end
      }
    end
  end

  def update
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        update! do |success, error|
          success.json { 
            render json: resource.api_attributes
          }
          error.json {
            render json: resource.errors
          }
        end
      }
    end
  end

  def destroy
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        destroy! do |success, error|
          success.json {
            render json: resource.api_attributes
          }
          error.json {
            render json: resource.errors
          }
        end
      }
    end
  end

  protected

  def collection
    get_collection_ivar ||
      set_collection_ivar(build_collection)
  end

  def build_collection
    col =
      case params[:section]
      when 'others'
        user_signed_in? ?
          current_user.other_organizations :
          Organization
      else
        user_signed_in? ?
          current_user.organizations :
          Kaminari.paginate_array([])
      end

    col.page(params[:page])
  end

  private

  def redirect_to_members
    if current_subject.is_a? Organization
      redirect_to contacts_path
    end
  end
end
