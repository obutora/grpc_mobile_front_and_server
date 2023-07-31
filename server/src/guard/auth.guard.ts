import { Metadata } from "@grpc/grpc-js";
import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from "@nestjs/common";
import { RpcException } from "@nestjs/microservices";
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

            // 認証に失敗したことを想定して、テスト的に例外を投げる
            throw new Error();

        } catch (e) { 
            throw new RpcException({
                code: 16,
                message: 'unauthorized error. please check your authorization in metaData.',
            });
        }
        return true;
     };
    
}