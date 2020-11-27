import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-partes',
  templateUrl: './partes.component.html',
  styleUrls: ['./partes.component.css']
})
export class PartesComponent implements OnInit {

  level:string;
  user:string;
  productos:any;

  tipo:string;
  piezas:number = 1;

  carrito:any = {user:"",id_prod:"", nombre_prod:"", precio_car:"", piezas_car:""};
  tmpProd:any = {id_prod:"", nombre_prod:"", precio_car:""};
  carritos:any = [];

  constructor(private datos:DatosService, private router:Router,private route:ActivatedRoute, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.user = this.datos.getCuenta().user;
    this.llenarProductos();
    console.log(this.productos);
    if (this.level ==  'U') {
      this.llenarCarrito(this.user);
    }
    

    this.route.params.subscribe((params:Params)=>{
      this.tipo = params.tipo;
      console.log(this.tipo);
    });
  }

  llenarProductos(){
    this.datos.getProductos().subscribe(resp => {
      this.productos = resp;
      console.log(resp);
    }, error => {
      console.log(error);
      if(error.status==408) this.router.navigate(['']);
    })
  }
  llenarCarrito(user){
    this.datos.getCarrito(user).subscribe(resp => {
      this.carritos = resp;
      //console.log(resp);
    }, error => {
      console.log(error);
      if(error.status==408) this.router.navigate(['']);
    })
  }

  tmpCarrito(producto){
    this.tmpProd = JSON.parse(JSON.stringify(producto));
  }
  
  agregarCarrito(){
    console.log("Se ha agregado al carrito: " + this.tmpProd.nombre_prod);
    this.carrito.user = this.user;
    this.carrito.id_prod = this.tmpProd.id_prod;
    this.carrito.nombre_prod = this.tmpProd.nombre_prod;
    this.carrito.precio_car = this.tmpProd.precio_prod;
    this.carrito.piezas_car = this.piezas;
    console.log(this.carrito);
    
    this.datos.postCarrito(this.carrito).subscribe(resp => {
      if(resp['result']=='ok'){
        let carro = JSON.parse(JSON.stringify(this.carrito));
        this.carritos.push(carro);
        console.log(this.carritos);
        this.tmpProd.id_prod = '';
        this.tmpProd.nombre_prod = '';
        this.tmpProd.precio_prod = '';
        this.tmpProd.piezas = 1;
        this.piezas = 1;
        this.msg.success("El producto se guardo correctamente.");
      }else{
        this.msg.error("El producto no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });

    
  }

  existe(producto){
    if (this.carritos.indexOf( this.carritos.find( carrito => carrito.id_prod == producto.id_prod )) >= 0) {
      return true;
    } else {
      return false;
    }
  }

}
