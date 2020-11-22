import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {
  level:string;
  user:string;
  productos:any;
  carta: boolean;
  contador: number = 0;
  mensaje: string = `<div class="tarjeta-wrap" ></div> `;
  carritos:any = [];
  constructor(private datos:DatosService, private router:Router) { }

  ngOnInit(): void {
    this.carta = true;
    this.level = this.datos.getCuenta().level;
    this.user = this.datos.getCuenta().user;
    this.llenarProductos();
  }

  llenarProductos(){
    this.datos.getProductos().subscribe(resp => {
      this.productos = resp;
      //console.log(resp);
    }, error => {
      console.log(error);
      if(error.status==408) this.router.navigate(['']);
    })
  }

  agregarCarrito(producto){
    console.log("Se ha agreagado al carrito: " + producto.nombre_prod);
    this.carritos.push(producto.nombre_prod);
    console.log(this.carritos.indexOf(producto.nombre_prod));
    console.log(this.carritos);
  }

  existe(producto){
    if (this.carritos.indexOf(producto.nombre_prod) >= 0) {
      console.log(this.carritos.indexOf(producto.nombre_prod));
      return true;
    } else {
      return false;
    }
  }
}

