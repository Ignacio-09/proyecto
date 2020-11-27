import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {

  correo:string = '';
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
  }

  subscribir(){
    if(this.correo == ''){
      this.msg.error('Completa el campo');
      return;
    }

    this.datos.postSeguidors(this.correo).subscribe( resp => {
      if(resp['result']=='ok'){
        this.correo ='';
        this.msg.success("El correo se guardo correctamente.");
      }else{
        console.log(resp);
        this.msg.error("El correo no se ha podido guardar.");
      }
    }, error =>{
      console.log(error);
    });
  }
  
}
