import { Component, OnDestroy, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit, OnDestroy {
  level:string;
  user:string;
  pass:string;

  acepta: boolean = true;
  oferta: boolean = true;
  existe: boolean = false;
  nuevoUser:any = {user:"", pass:"", tipo:"U", nombre:"", apellidos:"", correo:"", fecha:""};
  tmpUser:any = {user:""};
  usuario: string;

  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = '';
    if (this.datos.getCuenta().user != '') {
      this.router.navigate(['/inicio']);
    } else {
    this.msg.success("Bienvenido");
    }
  }
  
  comprobarUsuarios(){
    this.datos.compUsuario(this.nuevoUser.user).subscribe(resp => {
      this.tmpUser = resp;
      this.usuario = this.tmpUser.user;

      if (this.usuario == this.nuevoUser.user) {
        this.existe = true;
      } else {
        this.existe = false;
      }
    }, error => {
      console.log(error);
    })
  }


  agregarUsuario(){
    if(this.nuevoUser.user == '' ||this.nuevoUser.pass == '' ||
      this.nuevoUser.tipo == '' || this.nuevoUser.nombre == ''  ||
      this.nuevoUser.apellidos == '' || this.nuevoUser.correo == ''  ||
      this.nuevoUser.fecha == '' || this.acepta ==false ){
      this.msg.error("Completa todos los campos");
      return;
    }
    
    if(this.nuevoUser.user == this.tmpUser.user) {
      this.msg.error("Usuario ya existente");
      return;
    }

    if(this.oferta==true){
          this.datos.postSeguidors(this.nuevoUser.correo).subscribe(resp=>{
            if(resp['result']=='ok'){
              this.oferta = false;
              
            }else{
              this.oferta = false;
              
            }
          }, error=>{
            console.log(error);
          });
    }

    this.datos.postUsuario(this.nuevoUser).subscribe(resp => {
      if(resp['result']=='ok'){
        this.logueo();
        this.nuevoUser.user = '';
        this.nuevoUser.pass = '';
        this.nuevoUser.tipo = '';
        this.nuevoUser.nombre = '';
        this.nuevoUser.apellidos = '';
        this.nuevoUser.correo = '';
        this.nuevoUser.fecha = '';
        this.msg.success("El usuario se guardo correctamente.");
        
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

ngOnDestroy(): void {
  if (this.datos.getCuenta().user != '') {
    window.location.reload();
  }
}


}
