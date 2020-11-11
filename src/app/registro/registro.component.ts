import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {
  level:string;
  user:string;
  pass:string;
  nuevoUser = {user:"", pass:"", tipo:"U", nombre:"", apellidos:"", correo:"", fecha:""};
  usuarios:any = [{user:"", pass:"", tipo:"U", nombre:"", apellidos:"", correo:"", fecha:""}];
  tmpUser = {user:"", pass:"", tipo:"U", nombre:"", apellidos:"", correo:"", fecha:""};


  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.msg.success("Hola");
  }

  agregarUsuario(){
    if(this.nuevoUser.user == '' ||this.nuevoUser.pass == '' ||
      this.nuevoUser.tipo == '' || this.nuevoUser.nombre == ''  ||
      this.nuevoUser.apellidos == '' || this.nuevoUser.correo == ''  ||
      this.nuevoUser.fecha == '' ){
      this.msg.error("Completa todos los campos");
      console.log("Completa");
      return;
    }
    this.datos.postUsuario(this.nuevoUser).subscribe(resp => {
      if(resp['result']=='ok'){
        let usuario = JSON.parse(JSON.stringify(this.nuevoUser))
        this.logueo();
        this.usuarios.push(usuario);
        this.nuevoUser.user = '';
        this.nuevoUser.pass = '';
        this.nuevoUser.tipo = '';
        this.nuevoUser.nombre = '';
        this.nuevoUser.apellidos = '';
        this.nuevoUser.correo = '';
        this.nuevoUser.fecha = '';
        this.msg.success("El usuario se guardo correctamente.");
        
        console.log("Exito");
      }else{
        this.msg.error("El usuario no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  logueo(){
    this.user = this.nuevoUser.user;
    this.pass = this.nuevoUser.pass;
    this.datos.login(this.user,this.pass ).subscribe(resp => {
      if(resp['auth']=='si'){
        this.datos.setCuenta(this.user, resp['token'], resp['level'])
        this.router.navigate(['/inicio']);
        this.msg.success("Bienvenido "+this.user)
      }else{
        this.msg.error("Error de usuario y/o contraseña");
      }
  },error=>{
    this.msg.error("Error de conexión.");
    console.log(error);
  })
}

}
