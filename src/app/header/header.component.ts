import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DatosService } from '../datos.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  cuenta: string = "Mi cuenta";
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
      if (this.datos.getCuenta().user != '') {
        this.cuenta = this.datos.getCuenta().user;
      }     
  }

  salir(){
    this.datos.setCuenta('','','');
    this.router.navigate(['']);
    this.msg.success("Adiosin!")
    this.cuenta = "Mi cuenta"

  }

}
