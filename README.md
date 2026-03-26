- [Levo Actions](#levo-actions)
  - [Schema Conformance Action](#schema-conformance-action)
    - [Usage](#usage)
    - [Output](#output)
  - [Test Plan Action](#test-plan-action)
    - [Usage](#usage-1)
    - [Output](#output-1)
  - [Test Application Action](#test-application-action)
    - [Usage](#usage-2)
    - [Output](#output-2)
  - [Scan Repository](#scan-repository)
    - [Usage](#usage-3)
    - [Output](#output-3)
  - [DAST Scanner](#dast-scanner)
    - [Usage](#usage-4)
    - [Output](#output-4)
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

## DAST Scanner

This action runs dynamic application security testing (DAST) on your web app or API and reports findings to your [Levo](https://levo.ai) organization dashboard.

This action will require Docker to be available on the runner. Providing a Levo account (`authorization-key` + `organization-id`) is optional but enables sending findings to the Levo platform.

### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/dast-scan@v1
  with:
    # URL of the application to scan.
    target-url: 'https://your-app.example.com'

    # [OPTIONAL] Levo.ai API key. Get it from https://app.levo.ai/settings/keys
    authorization-key: ''

    # [OPTIONAL] Levo.ai organization ID. Get it from https://app.levo.ai/settings/organization
    organization-id: ''

    # [OPTIONAL] Application name for Levo integration.
    app-name: ''

    # [OPTIONAL] Environment name for Levo integration.
    env-name: ''

    # [OPTIONAL] Scan depth: smart or thorough. Default: smart
    scan-depth: 'smart'

    # [OPTIONAL] Fail workflow on findings with this severity or higher: critical, high, medium, or none. Default: critical
    fail-on-severity: 'critical'

    # [OPTIONAL] Output format: json, sarif, table, or quiet. Default: json
    output-format: 'json'

    # [OPTIONAL] Send findings to Levo platform. Default: true
    send-issues: 'true'

    # [OPTIONAL] Scan timeout in seconds. Default: 1800
    timeout: '1800'

    # [OPTIONAL] OpenAI API key for AI-powered analysis.
    openai-api-key: ''

    # [OPTIONAL] Anthropic API key for AI-powered analysis.
    anthropic-api-key: ''

    # [OPTIONAL] Use this option to pass extra CLI arguments.
    extra-args: ''

    # [OPTIONAL] Shadownet Docker image to use (e.g. `levoai/levoai-shadownet:1.2.3`). Default: levoai/levoai-shadownet:latest
    levo-docker-image: 'levoai/levoai-shadownet:latest'
```
<!-- end usage -->

### Output

```yaml
outputs:
  scan-report:
    description: 'Path to the scan report file (JSON or SARIF)'
  scan-id:
    description: 'Unique scan ID'
  findings-count:
    description: 'Total number of findings'
  critical-findings:
    description: 'Number of critical findings'
  high-findings:
    description: 'Number of high severity findings'
  exit-code:
    description: 'Scan exit code (0=success, non-zero=failure or findings above threshold)'
```

