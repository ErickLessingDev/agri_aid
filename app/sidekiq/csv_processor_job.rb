class CsvProcessorJob
  include Sidekiq::Job

  def perform(csv_file_path)
    # Add your CSV processing logic here
    # For example:
    CSV.foreach(csv_file_path, headers: true) do |row|
      # Process each row of the CSV file
    end
end
