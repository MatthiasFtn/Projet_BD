document.addEventListener('DOMContentLoaded', function() {
    var dElems = document.querySelectorAll('.datepicker');
    var dInstances = M.Datepicker.init(dElems, {autoClose: true});
    var sElems = document.querySelectorAll('select');
    var sInstances = M.FormSelect.init(sElems, {dropdownOptions: {
      1:1,
      2:2,
      3:3
    }});
  });


  document.addEventListener('DOMContentLoaded', function() {
    
  });