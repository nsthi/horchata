require 'lob'
@lob = Lob(api_key: "test_e4cb08d44bb092cb18e74a66ee25457f542")

@lob.postcards.create(
  name: "John Joe",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  }
  front: "postcardback.pdf",
  message: "Heya!"
)

