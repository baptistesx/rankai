fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios submit_ios_dev_app

```sh
[bundle exec] fastlane ios submit_ios_dev_app
```

Submit a new iOS Dev app to Firebase AppDistribution

### ios generate_dev_certificates

```sh
[bundle exec] fastlane ios generate_dev_certificates
```

Generate dev certificate and provisionning profile

### ios generate_adhoc_certificates

```sh
[bundle exec] fastlane ios generate_adhoc_certificates
```

Generate adhoc certificate and provisionning profile

### ios get_dev_development_certificates

```sh
[bundle exec] fastlane ios get_dev_development_certificates
```

Get dev development certificate and provisionning profile

### ios get_dev_adhoc_certificates

```sh
[bundle exec] fastlane ios get_dev_adhoc_certificates
```

Get dev adhoc certificate and provisionning profile

### ios register_new_device

```sh
[bundle exec] fastlane ios register_new_device
```

Register new device

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
