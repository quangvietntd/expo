with (import ../. {});

let

  sdk = androidenv.androidsdk {
     platformVersions = [ "26" "27" ];
     buildToolsVersions = [ "27.0.3" ];
     abiVersions = [ "x86" "x86_64"];
     useGoogleAPIs = true;
     useExtraSupportLibs = true;
     useGooglePlayServices = true;
     useInstantApps = true;
   };

   ndk = androidenv.androidndk_17c.override { fullNDK = true; };

in

mkShell {
  LANG="en_US.UTF-8";
  JAVA_TOOL_OPTIONS="-Xmx4096m -Dfile.encoding=UTF-8 -XX:+HeapDumpOnOutOfMemoryError";
  JAVA_HOME=openjdk8;
  ANDROID_HOME="${sdk}/libexec";
  ANDROID_NDK_HOME="${ndk}/libexec/android-ndk-r17c";
  nativeBuildInputs = [
    nodejs-8_x
    openjdk8
    sdk
  ];
  passthru = { inherit sdk ndk; };
}
