# Infraestructura con Pulumi

1- Crear proyecto pulumi
```shell
mkdir pulumi-iac
cd pulumi-iac
pulumi new java
```
> Nota: Debemos crear cuenta pulumi y generar un token

2- Verificar el stack creado
```shell
pulumi stack ls
```

3- Desplegar el stack
```shell
pulumi up
```

4- Agregar dependencia de Digital Ocean de Pulumi
```xml
<!-- https://mvnrepository.com/artifact/com.pulumi/digitalocean -->
<dependency>
    <groupId>com.pulumi</groupId>
    <artifactId>digitalocean</artifactId>
    <version>4.18.0</version>
</dependency>
```

5- Crear Recuros usando Pulumi 

```java
import com.pulumi.Context;
import com.pulumi.Pulumi;
import com.pulumi.core.Output;
import com.pulumi.digitalocean.Tag;
import com.pulumi.digitalocean.TagArgs;
import com.pulumi.digitalocean.Droplet;
import com.pulumi.digitalocean.DropletArgs;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;

public class App {
    public static void main(String[] args) {

        Pulumi.run(ctx -> {
       
        var iacDroplet = new Droplet("web", DropletArgs.builder()
            .image("debian-12-x64")
            .name("iac-everyone-server-1")
            .region("nyc1")
            .size("s-1vcpu-512mb-10gb")
            .build());
        });
    }
}
```

6- Verificar recursos en creados en Pulumi Web Console y DigitalOcean Web Console