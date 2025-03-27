import esbuild from "esbuild";
import { sassPlugin } from "esbuild-sass-plugin";

const build = async () => {
  await esbuild.build({
    entryPoints: ["app/javascript/application.js"],
    bundle: true,
    sourcemap: true,
    outdir: "app/assets/builds",
  });

  await esbuild.build({
    entryPoints: ["app/assets/stylesheets/application.bootstrap.scss"],
    bundle: true,
    sourcemap: true,
    outdir: "app/assets/builds",
    plugins: [sassPlugin()]
  });
};

build().catch((err) => {
  console.error("❌ Build failed:", err);
  process.exit(1);
});

