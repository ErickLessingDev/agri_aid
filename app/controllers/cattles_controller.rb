class CattlesController < ApplicationController

    def index
        @cattles = Cattle.all
    end

    def new
        @cattle = Cattle.new
    end

    def create
        @cattle = Cattle.new(cattle_params)
    
        if @cattle.save
          redirect_to cattles_path, notice: 'Cattle was successfully created.'
        else
          render :new
        end
    end

    def show
        @cattle = Cattle.find(params[:id])
      end
    
    def edit
        @cattle = Cattle.find(params[:id])
    end

    def destroy
        @cattle = Cattle.find(params[:id])
        @cattle.destroy
        redirect_to cattles_path, notice: 'Cattle was successfully deleted.'
    end

    private
    def cattle_params
        params.require(:cattle).permit(:eid, :weight, :birthdate)
    end
end
