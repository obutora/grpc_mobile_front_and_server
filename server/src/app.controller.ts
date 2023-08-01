import { Controller, Get, UseGuards } from '@nestjs/common';
import { AppService } from './app.service';
import { GrpcMethod, GrpcStreamMethod, RpcException } from '@nestjs/microservices';
import { GetSampleRequest, Sample, SampleServiceController, StreamResult } from './gen_type/sample';
import { Metadata } from '@grpc/grpc-js';
import { AuthGuard } from './guard/auth.guard';
import { Observable, Subject } from 'rxjs';


@Controller()
export class AppController implements SampleServiceController {
  constructor(private readonly appService: AppService) {}


  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
  @UseGuards(AuthGuard)
  @GrpcMethod('SampleService')
  getSample(data: GetSampleRequest, metadata: Metadata): Sample{
    console.log('data', data);
    console.log('metadata', metadata);
    console.log('auth', metadata.get('authorization')[0]);
    
    return {
      id: 1,
      name: `sample ${data.id}`,
      type: 0,
      child: {
        id: 'uuid',
        childName: 'child',
      },
      updatedAt: {
        seconds: Math.round(Date.now() / 1000),
        nanos: 0,
      },
      tags: ['tag1', 'tag2'],
    };
  }

  // @UseGuards(AuthGuard)
  @GrpcMethod('SampleService')
  getStreamingSample(request: GetSampleRequest, metadata: Metadata, ...rest: any): Observable<StreamResult> {
    console.log('streaming start');
    const subject = new Subject<StreamResult>();
    var value = 0;

  

    const onNext = async () => { 
      value++;
      console.log('value', value);

      if (value > 101) {
        subject.complete();
        return;
      }

      await new Promise(resolve => setTimeout(resolve, 10));
      subject.next({
        value,
      });
    };

    subject.subscribe({
      next: onNext,
      error: (e) => { new RpcException({ code: 4, message: e.message }) },
      complete() {
        subject.complete();
        console.log('completed');
      },
      
    });

    onNext();

    return subject.asObservable();
  }
}
