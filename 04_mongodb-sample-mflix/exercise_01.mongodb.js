use("sample_mflix");


/*db.comments.find({ email: "john_bishop@fakegmail.com" });
db.comments.findOne({ email: "john_bishop@fakegmail.com" });
db.comments.findOne({name: "John Bishop"});
db.comments.findOne({ type: "movies", rate: "TV-G"});
db.theaters.find({ "location.address.state": "AL" }).count();
db.movies.find({ plot: { $regex: "American", $options: "i" } }).count()
db.movies.find({ plot: { $regex: "street.$", $options: "i" } }).count();
db.movies.find({ plot: { $regex: "street.$", $options: "i" } });
db.movies.find({}).sort({ runtime: -1 }).limit(5)
db.movies.find({ runtime: { $lt: 60 } }).sort({ runtime: -1 }).limit(5)
db.movies.find({ year: { $gt: 1954, $lt: 1966 } }).sort({ year: 1 }).limit(3)
db.movies.find({ released: { $gte: ISODate("1990-01-01T00:00:00Z"), $lt: ISODate("2001-01-01T00:00:00Z") } }).count()
db.movies.find({
  countries: {$in: ["USA"]},
  year: {$gte: 1950, $lte: 1970}
}).limit(3)
db.movies.find({ 
  genres: { $all: ["Drama", "History"] },
  released: { $gt: ISODate("1970-01-01T00:00:00Z") }
}).count()
db.movies.find({ cast: "Roy L. McCardell" }).count()
db.movies.find({ directors: "Hal Roach" }).count()
db.movies.find({ directors: { $in: ["Hal Roach"] } });
db.movies.find(
{ 
directors: { $in: ["Hal Roach"] } 
}, 
{
title: 1, 
"awards.wins": 1, _id: 0 
}
);
db.movies.find(
  {
    year: 1995,              // condition #1
    genres: "Action"         // condition #2  → implicit AND
  },
  { _id: 0, title: 1, year: 1, genres: 1 }   // projection
);
db.movies.find(
  {
    $or: [
      { languages: "French" },
      { languages: "Spanish" }
    ]
  },
  { _id: 0, title: 1, languages: 1 }
);
*/


db.movies.find(
  {
    year: { $gt: 2010 },                         
    $or: [
      { genres: "Drama" },                       
      { "imdb.rating": { $gte: 8 } }             
    ]
  },
  { _id: 0, title: 1, year: 1, genres: 1, "imdb.rating": 1 }
).limit(10);
