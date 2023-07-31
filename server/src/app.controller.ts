import { Controller, Get, UseGuards } from '@nestjs/common';
import { AppService } from './app.service';
import { GrpcMethod, RpcException } from '@nestjs/microservices';
import { GetSampleRequest, Sample, SampleServiceController } from './gen_type/sample';
import { Metadata } from '@grpc/grpc-js';
import { AuthGuard } from './guard/auth.guard';


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
}
