import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Route} from '@angular/router';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';

import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { InicioComponent } from './inicio/inicio.component';
import { MenuComponent } from './menu/menu.component';
import { FooterComponent } from './footer/footer.component';
import { DatosService } from './datos.service';
import { SeguridadGuard } from './seguridad.guard';
import { LoginComponent } from './login/login.component';
import { RegistroComponent } from './registro/registro.component';
import { ProductosComponent } from './productos/productos.component';
import { UsuariosComponent } from './usuarios/usuarios.component';
import { MicuentaComponent } from './micuenta/micuenta.component';
import { CarritoComponent } from './carrito/carrito.component';
import { ComputadorasComponent } from './computadoras/computadoras.component';
import { HardwareComponent } from './hardware/hardware.component';
import { AccesoriosComponent } from './accesorios/accesorios.component';
import { PartesComponent } from './partes/partes.component';
import { BuscarComponent } from './buscar/buscar.component';
import { AcercaComponent } from './acerca/acerca.component';
import { SubscriptoresComponent } from './subscriptores/subscriptores.component';

const rutas: Route[] = [
  {path:'', component: InicioComponent},
  {path:'inicio', component: InicioComponent},
  {path:'computadoras', component: ComputadorasComponent},
  {path:'computadoras/:tipo', component: ComputadorasComponent},
  {path:'hardware', component: HardwareComponent},
  {path:'hardware/:tipo', component: HardwareComponent},
  {path:'accesorios', component: AccesoriosComponent},
  {path:'accesorios/:tipo', component: AccesoriosComponent},
  {path:'buscar/:valor', component: BuscarComponent},
  {path:'partes/:tipo', component: PartesComponent},
  {path:'login', component: LoginComponent},
  {path:'registro', component: RegistroComponent},
  {path:'productos', component: ProductosComponent, canActivate: [SeguridadGuard]},
  {path:'usuarios', component: UsuariosComponent, canActivate: [SeguridadGuard]},
  {path:'subscriptores', component: SubscriptoresComponent, canActivate: [SeguridadGuard]},
  {path:'micuenta', component: MicuentaComponent},
  {path:'carrito', component: CarritoComponent},
  {path:'acerca', component: AcercaComponent},
  {path:'**', component: InicioComponent}
]

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    InicioComponent,
    MenuComponent,
    FooterComponent,
    LoginComponent,
    RegistroComponent,
    ProductosComponent,
    UsuariosComponent,
    MicuentaComponent,
    CarritoComponent,
    ComputadorasComponent,
    HardwareComponent,
    AccesoriosComponent,
    PartesComponent,
    BuscarComponent,
    AcercaComponent,
    SubscriptoresComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot(rutas),
    BrowserAnimationsModule, // required animations module
    ToastrModule.forRoot(),
  ],
  providers: [DatosService,CookieService,SeguridadGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }
