import { Component,OnDestroy, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-micuenta',
  templateUrl: './micuenta.component.html',
  styleUrls: ['./micuenta.component.css']
})
export class MicuentaComponent implements OnInit, OnDestroy {
  level:string;
  user:string;
  editar : boolean;
  usuario: any = [{user:"", pass:"", nombre:"", apellidos:"", correo:"", fecha_nac:""}];
  userTemp: any = {user:"", pass:"", nombre:"", apellidos:"", correo:"", fecha_nac:""};
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.user = this.datos.getCuenta().user;
    this.llenarUsuario();
    this.editar = false;
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

  temporalCuenta(){
    this.userTemp = JSON.parse(JSON.stringify(this.usuario[0]));
    console.log(this.usuario[0]);
  }

  guardarCambios(){
    this.datos.putCuenta(this.usuario[0]).subscribe(resp => {
      if(resp['result']=='ok'){
        console.log(this.usuario[0].fecha_nac);
        console.log(this.userTemp.fecha_nac);
        console.log(this.usuario[0]);
        this.llenarUsuario();
        this.msg.success("Los datos se guardaron correctamente.");
      }else{
        this.msg.error("No se pudo actualizar los datos.");
      }
    }, error => {
      console.log(error);
    });
    this.editar = false;
  }

  editarUsuario(){
    this.msg.success("Edita tus datos");
    this.editar = true;
    this.temporalCuenta()
  }

  regresar(){
    this.router.navigate(['/inicio']);
  }

  cancelar(){
    this.editar = false;
    this.usuario[0].user  = this.userTemp.user ;
        this.usuario[0].pass = this.userTemp.pass;
        this.usuario[0].apellidos = this.userTemp.apellidos;
        this.usuario[0].nombre = this.userTemp.nombre;
        this.usuario[0].correo = this.userTemp.correo;
        this.usuario[0].fecha_nac = this.userTemp.fecha_nac;
        this.llenarUsuario();
  }
  
  confirmarEliminar(){
    this.datos.deleteUsuario(this.userTemp).subscribe(resp => {
      if(resp['result']=='ok'){
        this.msg.success("Tu cuenta se elimino correctamente.");
        this.datos.setCuenta('','','');
        this.router.navigate(['/inicio']);
      }else{
        this.msg.error("La cuenta no se pudo eliminar.");
      }
    }, error => {
      console.log(error);
    });
  }

  ngOnDestroy() {
    if (this.datos.getCuenta().user == '') {
      window.location.reload();
    }
  }


}
