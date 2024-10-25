import { Component, OnInit } from '@angular/core';
import { HelloService } from '../hello.service';

// @Component({
//   selector: 'app-hello',
//   templateUrl: './hello.component.html',
//   styleUrls: ['./hello.component.css']
// })
@Component({
  selector: 'app-hello',
  template: `<h1>{{ message }}</h1>`,
  styles: []
})
export class HelloComponent implements OnInit {
  message: string = '';

  constructor(private helloService: HelloService) { }

  ngOnInit(): void {
    this.helloService.getHelloMessage().subscribe(
      data => this.message = data,
      error => console.error('Error fetching message', error)
    );
  }
}
