class HydroponicsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @title = 'Bancadas'
    @hydroponics = Hydroponic.where(greenhouse_id: params[:greenhouse_id])
  end

  def show
    @title = "Bancada #{params[:hydroponic_id]}"
    @data = [
      [{ name: 'Temperatura e Umidade', data: get_param('temperature') }, { name: 'Umidade', data: get_param('humidity') }],
      [{ name: 'PH', data: get_param('ph') }],
      [{ name: 'Condutividade', data: get_param('ce') }],
      [{ name: 'Vazão', data: get_param('waterflow') }]
    ]
  end

  private

  def get_param(param)
    HydroponicData.hydroponic_param(params[:hydroponic_id], param)
  end
end
