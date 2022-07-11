- [Levo Actions](#levo-actions)
  - [Schema Conformance Action](#schema-conformance-action)
    - [Usage](#usage)
    - [Output](#output)
  - [Test Plan Action](#test-plan-action)
    - [Usage](#usage-1)
    - [Output](#output-1)
# Levo Actions

## Schema Conformance Action

This action executes an Schema Conformance test and reports results to your [Levo](https://levo.ai) organization dashboard.

This action will require you to have a Levo account and provide a target url and OAS schema as well. 
### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/schema-conformance@v1-beta
  with:
    # Authorization key required to exetuce the Levo CLI. Please refer to https://app.levo.ai/settings/keys to get your authorization key.
    authorization-key: ''

    # The ID of your organization in Levo dashboard. Please refer to https://app.levo.ai/settings/organization to get your organization id.
    organization-id: ''

    # URL or file path of the application under test OAS schema.
    schema: ''

    # URL for the instance of the application under test.
    target: ''

    # Base64 encoded environment file content.
    base64_env: ''

    # If youd decide not to report the result of this execution back to Saas set this value to false. Default: true.
    report: true
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

This action executes atest plan and reports results to your [Levo](https://levo.ai) organization dashboard.

This action will require you to have a Levo account and provide a target url and test plan LRN.
### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/schema-conformance@v1-beta
  with:
    # Authorization key required to exetuce the Levo CLI. Please refer to https://app.levo.ai/settings/keys to get your authorization key.
    authorization-key: ''

    # The ID of your organization in Levo dashboard. Please refer to https://app.levo.ai/settings/organization to get your organization id.
    organization-id: ''

    # URL for the instance of the application under test.
    target: ''

    # Test plan LRN. You can get this value from the test plan section in Saas.
    plan: ''

    # Base64 encoded environment file content.
    base64_env: ''

    # If youd decide not to report the result of this execution back to Saas set this value to false. Default: true.
    report: true
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
  skipped:
    description: '# of skipped test cases'
```

