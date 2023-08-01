/* eslint-disable */
import { Metadata } from "@grpc/grpc-js";
import { GrpcMethod, GrpcStreamMethod } from "@nestjs/microservices";
import { Observable } from "rxjs";
import { Timestamp } from "./google/protobuf/timestamp";

export const protobufPackage = "sample";

export enum SampleType {
  NORMAL = 0,
  SPECIAL = 1,
  UNRECOGNIZED = -1,
}

/**
 * enumや自前の型も定義可能
 * 配列を使いたい場合repeatedとする
 */
export interface Sample {
  id: number;
  name: string;
  type: SampleType;
  child: ChildSample | undefined;
  updatedAt: Timestamp | undefined;
  tags: string[];
}

export interface ChildSample {
  id: string;
  childName: string;
}

/** リクエストにも型が必要 */
export interface GetSampleRequest {
  id: string;
}

export interface StreamResult {
  value: number;
}

export const SAMPLE_PACKAGE_NAME = "sample";

export interface SampleServiceClient {
  getSample(request: GetSampleRequest, metadata: Metadata, ...rest: any): Observable<Sample>;

  getStreamingSample(request: GetSampleRequest, metadata: Metadata, ...rest: any): Observable<StreamResult>;
}

export interface SampleServiceController {
  getSample(request: GetSampleRequest, metadata: Metadata, ...rest: any): Promise<Sample> | Observable<Sample> | Sample;

  getStreamingSample(request: GetSampleRequest, metadata: Metadata, ...rest: any): Observable<StreamResult>;
}

export function SampleServiceControllerMethods() {
  return function (constructor: Function) {
    const grpcMethods: string[] = ["getSample", "getStreamingSample"];
    for (const method of grpcMethods) {
      const descriptor: any = Reflect.getOwnPropertyDescriptor(constructor.prototype, method);
      GrpcMethod("SampleService", method)(constructor.prototype[method], method, descriptor);
    }
    const grpcStreamMethods: string[] = [];
    for (const method of grpcStreamMethods) {
      const descriptor: any = Reflect.getOwnPropertyDescriptor(constructor.prototype, method);
      GrpcStreamMethod("SampleService", method)(constructor.prototype[method], method, descriptor);
    }
  };
}

export const SAMPLE_SERVICE_NAME = "SampleService";
