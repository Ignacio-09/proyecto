import { Component, OnDestroy, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.css']
})
export class CarritoComponent implements OnInit {
  level:string;
  user:string;

  sbtotal:number;
  carritos:any;
  carrito:any = {id_car:"", nombre_prod:"", precio_car:"", piezas_car:"", id_prod:""};
  tmpCarrito:any = {id_car:"", nombre_prod:"", precio_car:"", piezas_car:"", id_prod:""};

  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.user = this.datos.getCuenta().user;
    if(this.level == 'U'){
      this.llenarCarrito(this.user);
    } else {
      this.msg.info("No has iniciado sesión");
      this.router.navigate(['/']);
      return ;
    }
  }

  llenarCarrito(user){
    this.datos.getCarrito(user).subscribe(resp => {
      this.carritos = resp;
      
    }, error => {
      console.log(error);
      if(error.status==408) this.router.navigate(['']);
    })
  }

  temporalCarrito(carrito){
    
    this.tmpCarrito = JSON.parse(JSON.stringify(carrito));
    
  }

  modificarCarrito(){
    this.datos.putCarrito(this.tmpCarrito).subscribe(resp => {
      if(resp['result']=='ok'){
        let i = this.carritos.indexOf( this.carritos.find( carrito => carrito.id_car == this.tmpCarrito.id_car ));
        this.carritos[i].piezas_car  = this.tmpCarrito.piezas_car;
      
        
        
        this.llenarCarrito(this.user);
        this.msg.success("El Producto se guardo correctamente.");
      }else{
        this.msg.error("El Producto no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  subtotal(i){
    this.sbtotal =  this.carritos[i].precio_car * this.carritos[i].piezas_car;
    
    return this.sbtotal;
  }

  quitarCarrito(){
    this.datos.deleteCarrito(this.tmpCarrito).subscribe(resp => {
      if(resp['result']=='ok'){
        this.llenarCarrito(this.user);
        this.msg.success("El producto se elimino correctamente.");
      }else{
        this.msg.error("El producto no se ha podido eliminar.");
      }
    }, error => {
      console.log(error);
    });
  }

  mandarCuenta(){
    this.router.navigate(['/micuenta'])
  }
}
