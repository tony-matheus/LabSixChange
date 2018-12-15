class ExchangesController < ApplicationController
  def index
  end

  def convert
    value = ExchangeService.new.perform(
        params[:source_currency],
        params[:target_currency],
        params[:amount]
    )
    render json: { value: value}
  end

  def bitcoin
    value = if(params[:exchange] == "from")
              ExchangeService.new.to_bitcoin(
                  params[:target_currency],
                  params[:amount]
              );
            elsif params[:exchange] == "to"
              ExchangeService.new.from_bitcoin(
                  params[:source_currency],
                  params[:amount]
              );
            end

    render json: { value: value}
  end
end
