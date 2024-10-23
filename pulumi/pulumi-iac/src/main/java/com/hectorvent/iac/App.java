package com.hectorvent.iac;

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
            // Create a new Droplet in nyc1
            var web = new Droplet("web", DropletArgs.builder()
                .image("debian-12-x64")
                .name("iac-everyone-server-1")
                .region("nyc1")
                .size("s-1vcpu-512mb-10gb")
                .build());
        });
    }
}
