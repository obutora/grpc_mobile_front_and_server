import { Metadata, ServerUnaryCall } from "@grpc/grpc-js";
import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from "@nestjs/common";
import { RpcException } from "@nestjs/microservices";
import { Server } from "http";
import { Observable } from "rxjs";

@Injectable()
export class AuthGuard implements CanActivate { 
    canActivate(context: ExecutionContext): boolean | Promise<boolean> | Observable<boolean> {
        console.log('AuthGuard');
        const metaData = context.switchToRpc().getContext() as Metadata;
        const authToken = metaData.get('authorization')[0];

        try {
            // NOTE : ここで認証ロジックを入れる
            console.log('Auth Guard/metaData', authToken);

            // 認証に失敗したことを想定して、
            // エラーを返す場合は以下のコメントを外す
            // throw new Error();

            // metaDataをサーバーでセットする例            
            metaData.add('role', 'admin');

            // 認証成功の場合はtrueを返せばOK
            return true;
            // throw new Error();
        } catch (e) { 
            throw new RpcException({
                code: 16,
                message: 'unauthorized error. please check your authorization in metaData.',
            });
        }
        return true;
     };
    
}