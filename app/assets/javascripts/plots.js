jQuery(function() {
  var cultivars, yieldrecs;
  
  $('#plot_cultivar_id').parent().hide();
  $('#plot_yieldrec_id').parent().hide();
  $('#plot_yieldwish_kg').parent().hide();
  
  cultivars = $('#plot_cultivar_id').html();
  yieldrecs = $('#plot_yieldrec_id').html();
  
  console.log(cultivars);
  
  return $('#plot_species_id').change(function() {
    var species, escaped_species, options;
    
    species = $('#plot_species_id :selected').text();
    escaped_species = species.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(cultivars).filter("optgroup[label=" + escaped_species + "]").html();
    console.log(options);
    
    if (options) {
      $('#plot_cultivar_id').html(options);
      $('#plot_cultivar_id').parent().show();
      
      return $('#plot_cultivar_id').change(function() {
        var cultivar, escaped_cultivar, yoptions;
        
        cultivar = $('#plot_cultivar_id :selected').text();
        console.log(cultivar)
        
        escaped_cultivar = cultivar.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        yoptions = $(yieldrecs).filter("optgroup[label=" + escaped_cultivar + "]").html();   
        // <optgroup label="בונבוני"><option reckg="2333" carms="false" value="3">רגילה</option></optgroup>  
        
        if (yoptions) {
          $('#plot_yieldrec_id').html(yoptions);
          $('#plot_yieldrec_id').parent().show();
          
        
          return $('#plot_yieldrec_id').change(function() {
            var yieldrec, ideal;
            
            yieldrec = $('#plot_yieldrec_id :selected').text();
            ideal = $('#plot_yieldrec_id :selected').attr('reckg');
            console.log(yieldrec);
            console.log("RECKG="+ideal);
  
            $('#plot_yieldwish_kg option').each(function() {
              $(this).html(function(n,old) {
                var sum = old + ideal;
                return sum;
              });
            });
            $('#plot_yieldwish_kg').parent().show();
          });
        } else {
          $('#plot_yieldrec_id').empty();
          return $('#plot_yieldrec_id').parent().hide();
        }
      });
    } else {
      $('#plot_cultivar_id').empty();
      return $('#plot_cultivar_id').parent().hide();
    }
  });
});

jQuery_strength(function() {
  var yieldrecs;
  $('#plot_yieldrec_id').parent().hide();
  yieldrecs = $('#plot_cultivar_id').html();
  console.log(yieldrecs);
  return $('#plot_cultivar_id').change(function() {
    var cultivar, escaped_cultivar, options;
    cultivar = $('#plot_cultivar_id :selected').text();
    escaped_cultivar = cultivar.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(yieldrecs).filter("optgroup[label=" + escaped_cultivar + "]").html();
    console.log(options);
    if (options) {
      $('#plot_yieldrec_id').html(options);
      return $('#plot_yieldrec_id').parent().show();
    } else {
      $('#plot_yieldrec_id').empty();
      return $('#plot_yieldrec_id').parent().hide();
    }
  });
});