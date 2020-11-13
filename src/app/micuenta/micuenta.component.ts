import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-micuenta',
  templateUrl: './micuenta.component.html',
  styleUrls: ['./micuenta.component.css']
})
export class MicuentaComponent implements OnInit {
  level:string;
  user:string;
  editar : boolean;
  usuario: any = [{user:"", pass:"", nombre:"", apellidos:"", correo:"", fecha_nac:""}];
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.user = this.datos.getCuenta().user;
    this.llenarUsuario();
    this.editar = false;
    console.log(this.user);
    console.log(this.usuario.pass);
    if(this.user == ''){
      this.msg.error("No has iniciado sesion");
      return ;
    }
  }

  llenarUsuario(){
    this.datos.getUsuario(this.user).subscribe(resp =>{
      this.usuario = resp;
      console.log("Usuario");
      console.log(this.usuario);
      console.log("RESP");
      console.log(resp);
    }, error => {
      console.log(error);
    })
    
  }

  editarUsuario(){
    this.msg.success("Hola");
    this.editar = true;
  }
  eliminarUsuario(){
    this.msg.success("Seras eliminado");
  }
  regresar(){
    this.router.navigate(['/inicio']);
  }

  guardarCambios(){
    this.editar = false;
  }

  cancelar(){
    this.editar = false;
  }

}
