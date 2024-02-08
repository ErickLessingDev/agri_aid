require 'csv'

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
        @cattle.weight_records.destroy_all
        @cattle.destroy
        redirect_to cattles_path, notice: 'Cattle was successfully deleted.'
    end

    def new_weigh
        @cattle = Cattle.find(params[:id])
        @weight_record = WeightRecord.new
    end
    
    def create_weigh
        @cattle = Cattle.find(params[:id])
        @weight_record = @cattle.weight_records.build(weight_record_params)
        @weight_record.previous_weight = @cattle.weight
        if @weight_record.save
            @cattle.update(weight: @weight_record.new_weight)
            redirect_to cattles_path, notice: 'Weight record was successfully added.'
        else
            render :new_weigh
        end
    end


    def download_template
        csv_data = CSV.generate do |csv|
            csv << ['eid', 'weight', 'birthdate']
        end

        send_data csv_data, filename: "cattle_template.csv"
    end

    def upload_csv
        # Empty action to render the form
    end

    def process_csv
        csv_file = params[:csv_file]
    
        if csv_file.present?
          # Process the uploaded CSV file here
          puts "Processing CSV file: #{csv_file.original_filename}"
          CSV.foreach(csv_file.path, headers: true) do |row|
            eid = row['eid']
            weight = row['weight']
            birthdate = row['birthdate']
    
            cattle = Cattle.find_or_initialize_by(eid: eid)
            cattle.weight = weight
            cattle.birthdate = birthdate
            cattle.save
          end
          flash[:success] = "CSV file uploaded successfully."
          redirect_to root_path
        else
          flash[:error] = "Please select a CSV file."
          redirect_back(fallback_location: root_path)
        end
    end

    private

    def weight_record_params
        params.require(:weight_record).permit(:new_weight, :recorded_at)
    end

    def cattle_params
        params.require(:cattle).permit(:eid, :weight, :birthdate)
    end
end
