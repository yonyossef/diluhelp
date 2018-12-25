jQuery(function() {
  var cultivars, yieldrecs;
  
  $('#plot_cultivar_id').parent().hide();
  $('#plot_yieldrec_id').parent().hide();
  $('#plot_yieldwish_kg').parent().hide();
  $('#plot_arms').parent().hide();
  
  
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
        var cultivar, escaped_cultivar, yoptions, has_arms;
        
        cultivar = $('#plot_cultivar_id :selected').text();
        console.log(cultivar)
        
        escaped_cultivar = cultivar.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        yoptions = $(yieldrecs).filter("optgroup[label=" + escaped_cultivar + "]").html();   
        // <optgroup label="בונבוני"><option reckg="2333" carms="false" value="3">רגילה</option></optgroup>  
        
        has_arms = $('#plot_cultivar_id :selected').attr('carms');
        if (has_arms === "true") {
          $('#plot_arms').parent().show();
        } else {
          $('#plot_arms').parent().hide();
        }
        
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
                return parseInt(old,10) + parseInt(ideal,10);
              });
            });
            
            ideal = 0;
            $("#plot_yieldwish_kg option[value='0']").prop('selected', true);
            //$('#plot_yieldwish_kg').selectedIndex = '0';
            
            return $('#plot_yieldwish_kg').parent().show();
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

function selectItemByValue(elmnt, value) {
  for(var i=0; i < elmnt.options.length; i++)
  {
    if(elmnt.options[i].value == value)
      elmnt.selectedIndex = i;
  }
};