jQuery(function() {
  var cultivars, yieldrecs;
  var o = new Option("option text", "value");
  
  $('#plot_name').on('keypress', function(e) {
    return e.which !== 13;
  }); 
  $('#plot_linedist_meters').on('keypress', function(e) {
    return e.which !== 13;
  });
  $('#plot_treedist_meters').on('keypress', function(e) {
    return e.which !== 13;
  });
  $('#plot_arms').on('keypress', function(e) {
    return e.which !== 13;
  }); 
  
  
  // if $(getAllUrlParams().newplot === 'retry') {
    $('#plot_species_id').parent().hide();
    $('#plot_cultivar_id').parent().hide();
    $('#plot_yieldrec_id').parent().hide();
    $('#plot_yieldwish_kg').parent().hide();
    $('#plot_arms').parent().hide();
    $('#plot_linedist_meters').parent().hide();
    $('#plot_treedist_meters').parent().hide();
    $('#calcsubmit').hide();
    
  // }
  $('#plot_name').on('keyup paste', function() {
    $('#plot_species_id').parent().show();
  }); 
  
  $('#plot_species_id').prepend($('<option>', {
      value: 'prompt',
      selected: 'selected',
      text: 'בחר את מין הפרי'
  }));
  
  
  cultivars = $('#plot_cultivar_id').html();
  yieldrecs = $('#plot_yieldrec_id').html();
  
  console.log(cultivars);
  
  return $('#plot_species_id').change(function() {
    var species, escaped_species, options;
    
    if ($('#plot_name').val() === "") {
      $("#plot_name").val("החלקה שלי")
    }
    $("#plot_species_id option[value='prompt']").remove();

    $('#plot_yieldrec_id').parent().hide();
    $('#plot_yieldwish_kg').parent().hide();
    $('#plot_arms').parent().hide();
    $('#plot_linedist_meters').parent().hide();
    $('#plot_treedist_meters').parent().hide();
    $('#calcsubmit').hide();
    
    species = $('#plot_species_id :selected').text();
    escaped_species = species.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(cultivars).filter("optgroup[label=" + escaped_species + "]").html();
    console.log(options);
    
    if (options) {
      var o = new Option("option text", "value");
      $('#plot_cultivar_id').html(options);
      $('#plot_cultivar_id').prepend($('<option>', {
          value: 'prompt',
          selected: 'selected',
          text: 'בחר את זן הפרי'
      }));
      $('#plot_cultivar_id').parent().show();
      
      return $('#plot_cultivar_id').change(function() {
        var cultivar, escaped_cultivar, yoptions, has_arms;
        
        $("#plot_cultivar_id option[value='prompt']").remove();

        cultivar = $('#plot_cultivar_id :selected').text();
        console.log(cultivar)
        
        escaped_cultivar = cultivar.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
        yoptions = $(yieldrecs).filter("optgroup[label=" + escaped_cultivar + "]").html();   
        // <optgroup label="בונבוני"><option reckg="2333" carms="false" value="3">רגילה</option></optgroup>  
        
        has_arms = $('#plot_cultivar_id :selected').attr('carms');
        
        if (yoptions) {
          var o = new Option("option text", "value");
          $('#plot_yieldrec_id').html(yoptions);
          $('#plot_yieldrec_id').prepend($('<option>', {
              value: 'prompt',
              selected: 'selected',
              text: 'בחר את חוזק החלקה'
          }));
          $('#plot_yieldrec_id').parent().show();
          
          return $('#plot_yieldrec_id').change(function() {
            var yieldrec, ideal, i=0;
            
            $("#plot_yieldrec_id option[value='prompt']").remove();

            yieldrec = $('#plot_yieldrec_id :selected').text();
            ideal = $('#plot_yieldrec_id :selected').attr('reckg');
            
            if (yieldrec === "") {
              $('#plot_linedist_meters').parent().hide(); 
            } else {
              $('#plot_linedist_meters').parent().show();
              
              return $('#plot_linedist_meters').on('keyup paste', function() {
                if(!$('#plot_linedist_meters').val()){
                  $('#plot_treedist_meters').parent().hide();
                } else {
                  $('#plot_treedist_meters').parent().show();
                }
                var linedist = $('#plot_linedist_meters').val();
                if (linedist === "" || linedist < 0) {
                  $('#plot_treedist_meters').parent().hide();    
                } else {
                  $('#plot_treedist_meters').parent().show();
                  
                  return $('#plot_treedist_meters').on('keyup paste', function() {
                    var treedist = $('#plot_treedist_meters').val();
                    if (treedist === "" || treedist < 0) {
                      $('#calcsubmit').hide();
                    } else {
                      if (has_arms === "true") {
                        $('#plot_arms').parent().show();
                        
                        return $('#plot_arms').on('keyup paste', function() {
                          var arms = $('#plot_arms').val();
                          if (arms === "" || arms < 0) {
                            $('#calcsubmit').hide();
                          } else {
                            $('#calcsubmit').show();
                          }
                        });
                      } else {
                        $('#plot_arms').parent().hide();
                        $('#calcsubmit').show();
                      }
                    }
                  });
                  
                }
              });
              
              
            }
            
            console.log(yieldrec);
            console.log("RECKG="+ideal);
            
            $('#plot_yieldwish_kg option').each(function() {
              $(this).html(function(n,old) {
                console.log("OLD="+old);
                console.log("i="+i);
                console.log("IDEAL="+ideal);
                return parseInt(ideal,10) + (i++)*500-1000;
              });
            });
            
            ideal = 0;
            $("#plot_yieldwish_kg option[value='0']").prop('selected', true);
            
            return $('#plot_yieldwish_kg').parent().show();
          });
        } else {
          $('#plot_yieldrec_id').empty();
          $('#calcsubmit').hide();
          $('#plot_yieldwish_kg').parent().hide();
          $('#plot_linedist_meters').parent().hide();
          $('#plot_treedist_meters').parent().hide();
          alert('לזן זה חסרים נתונים במערכת')
          return $('#plot_yieldrec_id').parent().hide();
        }
      });
    } else {
      $('#plot_cultivar_id').empty();
      return $('#plot_cultivar_id').parent().hide();
    }
  });
});