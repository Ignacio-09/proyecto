import { Injectable } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { CookieService } from "ngx-cookie-service";

const URL:string = "http://localhost/crud/";

@Injectable({
  providedIn: 'root'
})
export class DatosService {
  private cuenta = {user:"", token:"", level:""}
  private temaActivo = {idtema:'', nombre:''};

  constructor(private http: HttpClient, private galleta:CookieService) { }

  setCuenta(user,token,nivel){
    this.cuenta.user = user;
    this.cuenta.token = token;
    this.cuenta.level = nivel;
    this.galleta.set('user',user);
    this.galleta.set('token',token);
    this.galleta.set('level',nivel);
  }

  getCuenta(){
    this.cuenta.user = this.galleta.get('user');
    this.cuenta.token = this.galleta.get('token');
    this.cuenta.level = this.galleta.get('level');
    return this.cuenta;
  }

  login(u, p){
    let Params = new HttpParams();
    Params = Params.append('user', u);
    Params = Params.append('pass', p);

    return this.http.get(URL + "login.php",{params:Params});
  }


  getProductos(){
    return this.http.get(URL + "inicio.php");
  }

  postProducto(producto){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    let formData = new FormData();
    formData.append('nombre_prod', producto.nombre_prod);
    formData.append('precio_prod', producto.precio_prod);
    formData.append('desc_prod', producto.desc_prod);
    formData.append('categoria', producto.categoria);
    formData.append('url_prod', producto.url_prod);
    return this.http.post(URL + "productos.php", formData, {headers:Headers});
  }

  putProducto(producto){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    let Params = new HttpParams();
    Params = Params.append('nombre_prod', producto.nombre_prod);
    Params = Params.append('precio_prod', producto.precio_prod);
    Params = Params.append('desc_prod', producto.desc_prod);
    Params = Params.append('categoria', producto.categoria);
    Params = Params.append('url_prod', producto.url_prod);

    Params = Params.append('id_prod', producto.id_prod);
    console.log(Headers);
    console.log(Params);
    return this.http.put(URL + "productos.php", null, {headers: Headers, params: Params});
  }

  deleteProducto(producto){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    let Params = new HttpParams();
    Params = Params.append('id_prod', producto.id_prod);
    return this.http.delete(URL + "productos.php", {headers: Headers, params: Params});
  }

  buscarProducto(buscar){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    let Params = new HttpParams();
    Params = Params.append('nombre_prod', buscar);  
    console.log(Params);
    return this.http.get(URL + "productos.php", {headers:Headers, params:Params});
  }

  postUsuario(usuario){

    let formData = new FormData();
    formData.append('user', usuario.user);
    formData.append('nombre', usuario.nombre);
    formData.append('apellidos', usuario.apellidos);
    formData.append('fecha_nac', usuario.fecha);
    formData.append('correo', usuario.correo);
    
    formData.append('pass', usuario.pass);
    formData.append('tipo_user', usuario.tipo);

    return this.http.post(URL + "registros.php", formData);
  }

  postUser(usuario){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    let formData = new FormData();
    formData.append('user', usuario.user);  
    formData.append('pass', usuario.pass);
    formData.append('nombre', usuario.nombre);
    formData.append('tipo_user', usuario.tipo_user);
    return this.http.post(URL + "usuarios.php", formData,{headers: Headers});
  }

  getUsuarios(){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    console.log(Headers);
    return this.http.get(URL + "usuarios.php", {headers:Headers});
  }

  getUsuario(user){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    let Params = new HttpParams();
    Params = Params.append('user', user);  
    console.log(Params);
    return this.http.get(URL + "usuarios.php", {headers:Headers, params:Params});
  }

  compUsuario(user){
    let Params = new HttpParams();
    Params = Params.append('user', user);  
    return this.http.get(URL + "registros.php", {params:Params});
  }


  putUsuario(usuario){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    
    let Params = new HttpParams();
    Params = Params.append('user', usuario.user);
    Params = Params.append('pass', usuario.pass);
    Params = Params.append('tipo_user', usuario.tipo_user);
    Params = Params.append('nombre', usuario.nombre);

    return this.http.put(URL + "usuarios.php", null, {headers: Headers, params: Params});
  }

  deleteUsuario(usuario){
    let Headers = new HttpHeaders();
    Headers = Headers.append('Authorization', this.cuenta.token);
    
    let Params = new HttpParams();
    Params = Params.append('user', usuario.user);

    return this.http.delete(URL + "usuarios.php", {headers: Headers, params: Params});
  }


}


