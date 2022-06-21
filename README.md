# Levo Actions

# Schema Conformance Action

This action executes an Schema Conformance test and reports results to your [Levo](https://levo.ai) organization dashboard.

This action will require you to have a Levo account and provide a target url and OAS schema as well. 
## Usage

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
```
<!-- end usage -->

## Output

This action will generate two output fields:
```yaml
outputs:
  success:
    description: 'Succeded test cases'
  failed:
    description: 'failed test cases'
```

