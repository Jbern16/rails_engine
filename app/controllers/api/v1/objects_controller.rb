class Api::V1::ObjectsController < ApiController

    def index
      respond_with find_model.all
    end

    def show
      respond_with find_model.find(params[:id])
    end

    def find
      respond_with find_model.find_by(find_selector)
    end

    def find_all
      respond_with find_model.where(find_selector.to_h)
    end

    def random
      respond_with find_model.order("RANDOM()").first
    end

    private

    def find_selector
      params.slice(:id, :name, :first_name, :last_name, :unit_price,
                   :merchant_id, :description, :quantity, :customer_id,
                   :item_id, :invoice_id)
    end

    def find_model
       File.basename(controller_name).classify.constantize
    end

end
