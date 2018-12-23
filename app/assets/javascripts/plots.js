jQuery(function() {
  var cultivars;
  $('#plot_cultivar_id').parent().hide();
  cultivars = $('#plot_cultivar_id').html();
  console.log(cultivars);
  return $('#plot_species_id').change(function() {
    var species, escaped_species, options, bool_has_arms, relevant_cultivars, cultivar;
    species = $('#plot_species_id :selected').text();
    escaped_species = species.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(cultivars).filter("optgroup[label=" + escaped_species + "]").html();
    console.log(options);
    if (options) {
      $('#plot_cultivar_id').html(options);
      return $('#plot_cultivar_id').parent().show();
    } else {
      $('#plot_cultivar_id').empty();
      return $('#plot_cultivar_id').parent().hide();
    }
  });
});

jQuery_arms(function() {
    // cultivar = $('#plot_cultivar_id :selected').text();
    //   if (cultivar.has_arms)
        
      
    
});