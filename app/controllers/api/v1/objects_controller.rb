class Api::V1::ObjectsController < ApiController
  before_action :change_currency

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
      respond_with find_model.where(find_selector)
    end

    def random
      respond_with find_model.order("RANDOM()").first
    end

    private

      def find_selector
        params.permit(all_column_names)
      end

      def change_currency
        if params[:unit_price]
          params[:unit_price] = (params[:unit_price].to_f * 100).round
        end
      end

      def all_column_names
        Merchant.column_names | Customer.column_names | InvoiceItem.column_names |
        Transaction.column_names | Item.column_names | Invoice.column_names
      end

      def find_model
       controller_name.classify.constantize
      end

end
