import { Component, OnDestroy, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit, OnDestroy {

  inicio = "Inicio de sesión";
  user = "";
  password = "";
  auth = false;

  entrar(){
    this.datos.login(this.user, this.password).subscribe(resp => {
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
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) {

  }
  ngOnInit(): void {
    this.user = this.datos.getCuenta().user;
    if (this.datos.getCuenta().user != '') {
      this.router.navigate(['/inicio']);
    }  
  }

  reloadPage(){
    window.location.reload();
  }

  ngOnDestroy() {
    if (this.datos.getCuenta().user != '') {
      this.reloadPage();
    }
  }

}
