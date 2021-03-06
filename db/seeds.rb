events = [
    {name: "Fwitter Launch Party", location: "Fwitter Land", date: "Sun, Jul 28", time: "5:00 PM", description: "Join us for a chance to meet the app developers. Food and drinks will be served."},
    {name: "Puppy Hour", location: "Pup City", date: "Sat, Aug 10", time: "1:00 PM", description: "Come pet and play with the cutest puppies you'll ever meet! Ask about adopting a pup."},
    {name: "Royal Ballet", location: "Royal Center", date: "Fri, Aug 16", time: "7:00 PM", description: "Can't miss the greatest show performed by the best ballet dancers of our time!"},
    {name: "Without Borders Brunch", location: "Travelers Hall", date: "Sun, Aug 18", time: "12:00 PM", description: "Great for those who love traveling and new adventures! Enjoy diverse dishes from around the world."},
    {name: "Arts and Crafts Fair", location: "Craft Park", date: "Sat, Aug 24", time: "10:00 AM", description: "Shop and browse through the many arts and crafts vendors; pottery, paintings, jewelry, and much more."},
    {name: "Water Lantern Festival", location: "Lake Litty", date: "Sat, Sep 7", time: "5:00 PM", description: "A family friendly event that you'll cherish for a lifetime. Experience the magic of hundreds of lanterns lighting up the night."},
    {name: "Floral Design Workshop: Weddings", location: "Bouquet Studio", date: "Sat, Sep 21", time: "6:30 PM", description: "Come and learn tips and tricks on how to create the most beautiful designs. All tools, flowers, vases, and instruction will be provided."}
]

events.each do |event|
    Event.create(event)
end