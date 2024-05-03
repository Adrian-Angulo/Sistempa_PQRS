// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
    'use strict';
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation');
  
    // Loop over them and prevent submission
    Array.from(forms).forEach(form => {
      form.addEventListener('submit', event => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
  
        form.classList.add('was-validated');
      }, false);
    });
  })();

  // cambiar formularios al darle click en el boton

  
document.getElementById('btn-navbar').addEventListener('click', function() {
    var registro = document.getElementById('formResgistro');
    var login = document.getElementById('formInicioSession');
    var btn = document.getElementById('btn-navbar');
    // Verifica si registro está visible
    if (registro.style.display === 'none') {
        btn.innerText = 'Iniciar Session';
      registro.style.display = ''; // Muestra registro
      
      login.style.display = 'none';   // Oculta login
    } else {
        btn.innerText = 'Registrarse';
      registro.style.display = 'none';   // Oculta registro
      login.style.display = '';  // Muestra login
    }
  });