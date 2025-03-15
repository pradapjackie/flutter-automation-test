# Create directory
mkdir -p test_driver

# Create the driver file
echo 'import "package:integration_test/integration_test_driver.dart";

Future<void> main() => integrationDriver();' > test_driver/integration_test.dart