- [Levo Actions](#levo-actions)
  - [Schema Conformance Action](#schema-conformance-action)
    - [Usage](#usage)
    - [Output](#output)
  - [Test Plan Action](#test-plan-action)
    - [Usage](#usage-1)
    - [Output](#output-1)
  - [Scan Repository](#scan-repository)
    - [Usage](#usage-2)
    - [Output](#output-2)
# Levo Actions

## Schema Conformance Action

This action executes an Schema Conformance test and reports results to your [Levo](https://levo.ai) organization dashboard.

This action will require you to have a Levo account and provide a target url and OAS schema as well. 
### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/schema-conformance@v2
  with:
    # Authorization key required to execute the Levo CLI. Please refer to https://app.levo.ai/settings/keys to get your authorization key.
    authorization-key: ''

    # The ID of your organization in Levo dashboard. Please refer to https://app.levo.ai/settings/organization to get your organization id.
    organization-id: ''

    # URL or file path of the application under test OAS schema.
    schema: ''

    # URL for the instance of the application under test.
    target: ''

    # [OPTIONAL] If you decide not to report the result of this execution back to Saas set this value to false. Default: true.
    report: true

    # [OPTIONAL] Use this option to pass CLI extra arguments like headers or verbosity. Please use \\\˝ to escape quotes.
    cli_extra_args: "-H \\\"Authorization: Bearer 1234\\\" --verbosity INFO"
```
<!-- end usage -->

### Output

This action will generate two output fields:
```yaml
outputs:
  success:
    description: '# of succesful test cases'
  failed:
    description: '# of failed test cases'
```

## Test Plan Action

This action executes a test plan and reports results to your [Levo](https://levo.ai) organization dashboard.

This action will require you to have a Levo account and provide a target url and test plan LRN.
### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/test-plan@v2
  with:
    # Authorization key required to execute the Levo CLI. Please refer to https://app.levo.ai/settings/keys to get your authorization key.
    authorization-key: ''

    # The ID of your organization in Levo dashboard. Please refer to https://app.levo.ai/settings/organization to get your organization id.
    organization-id: ''

    # URL for the instance of the application under test.
    target: ''

    # Test plan LRN. You can get this value from the test plan section in Saas.
    plan: ''

    # [OPTIONAL] Base64 encoded environment file content.
    base64_env: ''

    # [OPTIONAL] If you decide not to report the result of this execution back to Saas set this value to false. Default: true.
    report: true

    # [OPTIONAL] Use this option to pass CLI extra arguments like headers or verbosity. Please use \\\˝ to escape quotes.
    cli_extra_args: "-H \\\"Authorization: Bearer 1234\\\" --verbosity INFO"
```
<!-- end usage -->

### Output

This action will generate two output fields:
```yaml
outputs:
  success:
    description: '# of successful test cases'
  failed:
    description: '# of failed test cases'
  skipped:
    description: '# of skipped test cases'
```

## Test Application Action

This action executes tests for an application and reports results to your [Levo](https://levo.ai) organization dashboard.

This action will require you to have a Levo account and provide an application LRN, a target url, and user details with which you can access your APIs.
### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/test-application@v2
  with:
    # Authorization key required to execute the Levo CLI. Please refer to https://app.levo.ai/settings/keys to get your authorization key.
    authorization-key: ''

    # The ID of your organization in Levo dashboard. Please refer to https://app.levo.ai/settings/organization to get your organization id.
    organization-id: ''

    # URL for the instance of the application under test.
    target: ''

    # Application LRN. You can get this value from the Apps section in Saas.
    app-lrn: ''

    # user-id which can access the APIs of the application under test.
    user-id: ''

    # [OPTIONAL] Test categories in comma separate string. eg - "BASELINE,SSRF,CORS". Leave it blank to run all categories
    categories: ''

    # [OPTIONAL] Base64 encoded environment file content.
    base64_env: ''

    # [OPTIONAL] If you decide not to report the result of this execution back to Saas set this value to false. Default: true.
    report: true

    # [OPTIONAL] Use this option to pass CLI extra arguments like headers or verbosity. Please use \\\˝ to escape quotes.
    cli_extra_args: "-H \\\"Authorization: Bearer 1234\\\" --verbosity INFO"
```
<!-- end usage -->

### Output

This action will generate two output fields:
```yaml
outputs:
  success:
    description: '# of successful test cases'
  failed:
    description: '# of failed test cases'
  skipped:
    description: '# of skipped test cases'
```

## Scan Repository

This action scans a repository and import results to your [Levo-app](https://app.levo.ai) organization dashboard.

This action will require you to have a Levo account and provide a Authorization Key and Organization ID.

### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/scan@v2.1.2
  with:
    # Authorization key required to execute the Levo CLI. Please refer to https://app.levo.ai/settings/keys to get your authorization key.
    authorization-key: ''

    # The ID of your organization in Levo dashboard. Please refer to https://app.levo.ai/settings/organization to get your organization id.
    organization-id: ''
    
    # The name of the application to be created in Levo.
    app-name: ''

    # [Optional] The name of the environment in which app must be created in Levo.
    env-name: ''
```
<!-- end usage -->

### Output

This action will create an application in Levo[https://app.levo.ai] and import the results of the scan.

