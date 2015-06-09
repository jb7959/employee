json.array!(@timecards) do |timecard|
  json.extract! timecard, :id, :emp_id, :date, :time
  json.url timecard_url(timecard, format: :json)
end
