json.array!(@timecards) do |timecard|
  json.extract! timecard, :id, :employees_id, :date, :time
  json.url timecard_url(timecard, format: :json)
end
