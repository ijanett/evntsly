events = [
    {name: "Fwitter Launch Party", location: "Fwitter Land", date: "Sun, Jul 28", time: "5:00 PM", description: "Join us for a chance to meet the app developers. Food and drinks will be served."},
    {name: "Puppy Hour", location: "Pup City", date: "Sat, Aug 10", time: "1:00 PM", description: "Come meet and play with the cutest puppies in town! Ask about adoption options."},
    {name: "Royal Ballet", location: "Royal Center", date: "Fri, Aug 16", time: "7:00 PM", description: "Can't miss the greatest show performed by the best ballet dancers of our time!"},
    {name: "Without Borders Brunch", location: "Travelers Hall", date: "Sun, Aug 18", time: "12:00 PM", description: "Great for those who enjoy traveling and new adventures! Enjoy diverse dishes from around the world."}
]

events.each do |event|
    Event.create(event)
end