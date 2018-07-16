
var placeSearch, autocomplete;
var componentForm = {
  route: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var restaurantAddress = document.getElementById('autocomplete');

    if (restaurantAddress) {
      var autocomplete = new google.maps.places.Autocomplete(restaurantAddress, { type: [ 'restaurant' ] });
      // When the user selects an address from the dropdown, populate the address
        // fields in the form.

      autocomplete.addListener('place_changed', function(){

        var place = autocomplete.getPlace();
        console.log(place)
        for (var component in componentForm) {
          console.log(component)
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          console.log (addressType)
          console.log(componentForm[addressType])
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
            var name = place.name;
            console.log(name)
            console.log(place.place_id)
            document.getElementById('restaurant_name').value = name;

          }
        }
      })

      // autocomplete.setFields(
      // ['address_components', 'geometry', 'icon', 'name']);

      //prevent enter from submitting the form without selecting something
      google.maps.event.addDomListener(restaurantAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

// function fillInAddress() {
//   // Get the place details from the autocomplete object.
//   // var place = autocomplete.getPlace();

//   for (var component in componentForm) {
//     document.getElementById(component).value = '';
//     document.getElementById(component).disabled = false;
//   }

//   // Get each component of the address from the place details
//   // and fill the corresponding field on the form.
//   for (var i = 0; i < place.address_components.length; i++) {
//     var addressType = place.address_components[i].types[0];
//     if (componentForm[addressType]) {
//       var val = place.address_components[i][componentForm[addressType]];
//       document.getElementById(addressType).value = val;
//     }
//   }
// }

export { autocomplete };
