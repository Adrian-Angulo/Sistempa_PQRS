    <!-- Modal -->
    <div
      class="modal fade"
      id="Bloquear<%= usu.getId_U()%>"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style=" background-color: rgb(14, 34, 56); color: white;">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Bloqueo de usuario</h1>
            <button style="background-color: white"
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body" style="background-color: rgb(247, 251, 255);">

           <label for="" style="font-size: 20px;">  ¿ Estas segura de bloquear a </label> <label for="" style="font-size: 20px; font-weight: bold;"><%= usu.getNombre()+" "+usu.getApellido() %> ?</label> 
           
           

          </div>
          <div class="modal-footer justify-content-center" style=" background-color: rgb(14, 34, 56);">
            <a 
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Confrimar
          </a>
            
          </div>
        </div>
      </div>
    </div>