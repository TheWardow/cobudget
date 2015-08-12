class AllocationsController < AuthenticatedController
  api :GET, '/allocations?group_id=', 'Get allocations for a particular group'
  def index
    group = Group.find(params[:group_id])
    render json: group.allocations
  end

  api :POST, '/allocations/', 'Create allocation'
  def create
    create_resource(allocation_params_create)
  end

  api :PUT, '/allocations/:allocation_id', 'Update allocation'
  def update
    update_resource(allocation_params_update)
  end

  private
    def allocation
      @allocation ||= Allocation.find(params[:id])
    end

    def allocation_params_create
      params.require(:allocation).permit(:user_id, :group_id, :amount)
    end

    def allocation_params_update
      params.require(:allocation).permit(:amount)
    end
end
