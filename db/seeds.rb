Task.create!( title:      "test_task",
              start_date: "2021/1/1",
              end_date:   "2021/1/31",
              all_day:    true )

5.times do |n|
  title =      "test_task-#{n}"
  start_date = "2021/1/1"
  end_date =   "2021/2/5"
  Task.create!( title:      title,
                start_date: start_date,
                end_date:   end_date )
end
