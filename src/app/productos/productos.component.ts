import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { error } from '@angular/compiler/src/util';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {

  productos:any;
  buscar = '';
  level:string;
  user:string;
  
  nuevoProducto = {id_prod:'',nombre_prod:'', precio_prod:'', tipo_prod:'Computadora',estado_prod:'Nuevo',valor_prod:'Alienware', desc_prod:'Sin descripcion', url_prod:''};
  tmpProducto = {id_prod:'',nombre_prod:'',  precio_prod:'', tipo_prod:'',estado_prod:'',valor_prod:'', desc_prod:'', url_prod:''};
  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) { }

  ngOnInit(): void {
    this.level = this.datos.getCuenta().level;
    this.user = this.datos.getCuenta().user;
    this.buscar = "";
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

  agregarProducto(){
    if(this.nuevoProducto.nombre_prod == '' && this.nuevoProducto.precio_prod == '' &&
       this.nuevoProducto.desc_prod == '' &&
       this.nuevoProducto.url_prod == '' && this.nuevoProducto.tipo_prod == '' && 
       this.nuevoProducto.valor_prod == '' && this.nuevoProducto.estado_prod == ''){
      this.msg.error("Completa todos los campos");
      return;
    }
    this.datos.postProducto(this.nuevoProducto).subscribe(resp => {
      if(resp['result']=='ok'){
        let producto = JSON.parse(JSON.stringify(this.nuevoProducto))
        this.productos.push(producto);
        this.nuevoProducto.nombre_prod = '';
        this.nuevoProducto.precio_prod = '';
        this.nuevoProducto.desc_prod = 'Sin descripcion';
        this.nuevoProducto.url_prod = '';
        this.nuevoProducto.tipo_prod = 'Computadora';
        this.nuevoProducto.valor_prod = 'Alienware';
       this.nuevoProducto.estado_prod = 'Nuevo';
        this.msg.success("El producto se guardo correctamente.");
      }else{
        this.msg.error("El producto no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  temporalProducto(producto){
    console.log(producto);
    this.tmpProducto = JSON.parse(JSON.stringify(producto));
  }

  guardarCambios(){
    this.datos.putProducto(this.tmpProducto).subscribe(resp => {
      if(resp['result']=='ok'){
        let i = this.productos.indexOf( this.productos.find( producto => producto.id_prod == this.tmpProducto.id_prod ));
        this.productos[i].nombre_prod  = this.tmpProducto.nombre_prod ;
        this.productos[i].precio_prod = this.tmpProducto.precio_prod;
        this.productos[i].desc_prod = this.tmpProducto.desc_prod;
        this.productos[i].tipo_prod = this.tmpProducto.tipo_prod;
        this.productos[i].valor_prod = this.tmpProducto.valor_prod;
        this.productos[i].estado_prod = this.tmpProducto.estado_prod;
        this.productos[i].url_prod = this.tmpProducto.url_prod;
        this.llenarProductos();
        this.msg.success("El Producto se guardo correctamente.");
      }else{
        this.msg.error("El Producto no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  confirmarEliminar(){
    this.datos.deleteProducto(this.tmpProducto).subscribe(resp => {
      if(resp['result']=='ok'){
        this.llenarProductos();
        this.msg.success("El producto se elimino correctamente.");
      }else{
        this.msg.error("El producto no se ha podido guardar.");
      }
    }, error => {
      console.log(error);
    });
  }

  buscarProductos(){
    if(this.buscar != ''){
      this.datos.buscarProducto(this.buscar).subscribe(resp => {
          this.productos = resp;
          console.log(resp);
      }, error => {
        console.log(error);
      });
    } else {
      this.llenarProductos();
    }
  }


}
