import { Component, OnInit } from '@angular/core';
import { DatosService } from '../datos.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-acerca',
  templateUrl: './acerca.component.html',
  styleUrls: ['./acerca.component.css']
})
export class AcercaComponent implements OnInit {

  constructor(private datos:DatosService, private router:Router, private msg:ToastrService) {  }

  ngOnInit(): void {
  
  }

}
