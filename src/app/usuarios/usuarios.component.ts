import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  styleUrls: ['./usuarios.component.css']
})
export class UsuariosComponent implements OnInit {

  level:string;
  user:string;
  nuevoUser = {user:"", pass:"", tipo_user:"A", nombre:""};
  usuarios:any = [{user:"", pass:"", tipo_user:"", nombre:""}];
  tmpUser = {user:"", pass:"", tipo_user:"", nombre:""};

  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.llenarUsuarios();

  }

  llenarUsuarios(){
    this.datos.getUsuarios().subscribe(resp => {
      this.usuarios = resp;
      //console.log(resp);
    }, error => {
      console.log(error);
    })
  }

  agregarUsuario(){
    if(this.nuevoUser.user == '' ||this.nuevoUser.pass == '' ||
      this.nuevoUser.tipo_user == '' ||this.nuevoUser.nombre == ''){
      this.msg.error("Completa todos los campos");
      return;
    }
    this.datos.postUser(this.nuevoUser).subscribe(resp => {
      if(resp['result']=='ok'){
        let usuario = JSON.parse(JSON.stringify(this.nuevoUser))
        this.usuarios.push(usuario);
        this.nuevoUser.user = '';
        this.nuevoUser.pass = '';
        this.nuevoUser.nombre = '';
        this.nuevoUser.tipo_user = '';
        this.msg.success("El usuario se guardo correctamente.");
      }else{
        this.msg.error("El usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  temporalUsuario(msj){
    console.log(msj);
    this.tmpUser = JSON.parse(JSON.stringify(msj));
  }

  guardarCambios(){
    this.datos.putUsuario(this.tmpUser).subscribe(resp => {
      if(resp['result']=='ok'){
        this.llenarUsuarios();
        this.msg.success("El Usuario se guardo correctamente.");
      }else{
        this.msg.error("El Usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  confirmarEliminar(){
    this.datos.deleteUsuario(this.tmpUser).subscribe(resp => {
      if(resp['result']=='ok'){
        this.llenarUsuarios();
        this.msg.success("El usuario se elimino correctamente.");
      }else{
        this.msg.error("El usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

}
