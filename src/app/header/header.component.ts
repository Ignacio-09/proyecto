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
  level: string;
  user: string;
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.user =  this.datos.getCuenta().user;
    this.level = this.datos.getCuenta().level;
      if (this.datos.getCuenta().user != '') {
        this.cuenta = this.datos.getCuenta().user;
      } else {
        this.router.navigate(['/inicio']);
      }
  }

  salir(){
    this.datos.setCuenta('','','');
    this.cuenta = "Mi cuenta"
    window.location.reload();
  }

}
