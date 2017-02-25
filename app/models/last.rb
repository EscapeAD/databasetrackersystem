class Last


  def self.last
    final = Person.last(20).concat(Reserve.last(20)).concat(Event.last(20)).concat(Booth.last(20))
            .sort_by {|x| x['created_at']}
            .reverse.last(20)

    return final.map do |check|
      if Person.all.include? check
         ["#{check.created_at.strftime("%d-%m-%Y - %I:%M:%S %p")}","User #{check.name} added to database"]
       elsif Reserve.all.include? check
         ["#{check.created_at.strftime("%d-%m-%Y - %I:%M:%S %p")} "," #{Person.find(check.person_id).name} attended event #{Event.find(check.event_id).name}"]
       elsif Event.all.include? check
         ["#{check.created_at.strftime("%d-%m-%Y - %I:%M:%S %p")} ", "Event #{check.name} added to database"]
       elsif Booth.all.include? check
         ["#{check.created_at.strftime("%d-%m-%Y - %I:%M:%S %p")} ", "Booth #{check.name} added to database"]
      end
    end
  end

end
