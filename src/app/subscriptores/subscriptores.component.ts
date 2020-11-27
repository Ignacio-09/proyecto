import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-subscriptores',
  templateUrl: './subscriptores.component.html',
  styleUrls: ['./subscriptores.component.css']
})
export class SubscriptoresComponent implements OnInit {
  level:string;
  user:string;
  buscar: string;

  seguidores:any = [{correo:""}];
  tmpSeg:any = {correo_seg:""};

  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.llenarSeguidores();
  }

  llenarSeguidores(){
    this.datos.getSeguidores().subscribe(resp => {
      this.seguidores = resp;
      
    }, error => {
      console.log(error);
    })
  }

  
  temporalSeguidor(seguidor){
    this.tmpSeg = JSON.parse(JSON.stringify(seguidor));
    
  }

  

  confirmarEliminar(){
    this.datos.deleteSeg(this.tmpSeg).subscribe(resp => {
      if(resp['result']=='ok'){
        let i = this.seguidores.indexOf( this.seguidores.find( seguidor => seguidor.correo == this.tmpSeg.correo));
        this.seguidores.splice(i,1);
        this.llenarSeguidores();
        this.msg.success("El subscriptor se elimino correctamente.");
      }else{
        this.msg.error("El subscriptor no se ha podido guardar.");
      }
      
    }, error => {
      console.log(error);
    });
  }

  buscarSeguidor(){
    if(this.buscar != ''){
      this.datos.buscarSeguidor(this.buscar).subscribe(resp => {
          this.seguidores = resp;
         
      }, error => {
        console.log(error);
      });
    } else {
      this.llenarSeguidores();
    }
  }

}
