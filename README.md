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
  - [Source Code API Discovery](#source-code-api-discovery)
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

## Source Code API Discovery

This action statically analyzes application source code to discover REST API endpoints and imports them into your [Levo.ai](https://app.levo.ai) organization as an OpenAPI 3.0.1 specification. The application is never executed, no traffic is captured, and no staging environment is required — source code never leaves the runner; only the generated specification is uploaded.

Requires a Levo account (Authorization Key + Organization ID) and Docker on the runner.

### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/scan@v2.1.2
  with:
    # Levo CLI authorization key. Get yours at https://app.levo.ai/settings/keys
    authorization-key: ''

    # Your Levo organization ID. Find it at https://app.levo.ai/settings/organization
    organization-id: ''

    # Application name to display on the Levo dashboard. The application record is created automatically on first scan.
    app-name: ''

    # Programming language of the repository. Supported: java, jar, javascript, typescript, python, c, cpp, csharp, php, ruby, apk
    language: ''

    # [Optional] Relative subdirectory (e.g. ./path/to/sub-directory) to scan. Use "." to scan the repository root.
    dir: '.'

    # [Optional] Target environment. Default: staging.
    env-name: ''
```
<!-- end usage -->

### Output

The action imports discovered endpoints into the Levo dashboard under the application named by `app-name`, in the environment named by `env-name`.

## DAST Scanner

This action runs dynamic application security testing (DAST) on your web app or API and reports findings to your [Levo](https://levo.ai) organization dashboard.

This action will require Docker to be available on the runner. Providing a Levo account (`authorization-key` + `organization-id`) is optional but enables sending findings to the Levo platform.

### Usage

<!-- start usage -->
```yaml
- uses: levoai/actions/dast-scan@v2
  with:
    # URL of the application to scan.
    target-url: 'https://your-app.example.com'

    # [OPTIONAL] Levo.ai API key. Get it from https://app.levo.ai/settings/keys
    authorization-key: ''

    # [OPTIONAL] Levo.ai organization ID. Get it from https://app.levo.ai/settings/organization
    organization-id: ''

    # [OPTIONAL] Environment ID for Levo integration
    env-id: ''

    # [OPTIONAL] Scan depth: smart or thorough. Default: smart
    scan-depth: 'smart'

    # [OPTIONAL] Fail workflow on findings with this severity or higher: critical, high, medium, or none. Default: critical
    fail-on-severity: 'critical'

    # [OPTIONAL] Report file format: json or sarif. Default: json (findings outputs are only extracted from json)
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

    # [OPTIONAL] Default: latest
    version: 'latest'
```
<!-- end usage -->

The action wraps common `shadownet scan` options (auth, cookies, headers, crawl limits, AI, CVE, chatbot, domain filters, etc.). Timeout is passed as `--timeout` via the `timeout` input. See [`dast-scan/action.yaml`](dast-scan/action.yaml) for all inputs. Use `extra-args` for any other CLI flags.

### YAML config & authentication

For everything not exposed as a dedicated input, point `config-file` at a [`levo-dast.yml`](dast-scan/examples/levo-dast.yml) in your repo — it is mounted into the scanner and passed as `--config`. Dedicated inputs / env take precedence over YAML values. (File paths *inside* the YAML that reference other repo files are not auto-mounted.)

> **Always-overridden keys:** the action *unconditionally* passes its `scan-depth`, `output-format`, and `timeout` inputs (which have defaults), so the corresponding YAML keys — `scan.depth`, `reporting.output`, `scan.timeout` — are always clobbered and cannot be driven from `config-file`. Set those via the matching action inputs. (Keys like `crawl.max_pages`/`max_depth` are passed only when their input is set, so they *do* work from YAML.)
>
> **Exception — gating:** `fail-on-severity` is enforced by the action *after* the scan, so it does **not** override `reporting.fail_on` set in `levo-dast.yml`. The scanner exits non-zero on a YAML `fail_on` before the action's gate runs, so `fail-on-severity: none` cannot suppress it. Configure gating in one place, not both.

```yaml
with:
  target-url: 'https://your-app.example.com'
  config-file: 'levo-dast.yml'
```

Advanced authentication inputs:

| Input | Maps to | Notes |
| --- | --- | --- |
| `multi-step-auth` | `--multi-step-auth` | DOM-driven N-step form login (username/password → MFA → …). Off by default. |
| `auth-fields` | `--auth-field` (repeatable) | One `[<prefix>=]<locator>:<value>` per line for apps with 3+ credential inputs. |
| `auth-custom-instructions` | `SHADOWNET_AUTH_CUSTOM_INSTRUCTIONS` | Free-text login guidance for AI-guided auth (`auth: ai`). |
| `wait-for-mfa` | `--wait-for-mfa` | Pause after login for manual MFA/verification. |
| `mfa-static-code` | `SHADOWNET_MFA_STATIC_CODE` | Static OTP for test/demo apps; falls back to `wait-for-mfa` if the OTP field isn't found. |

### CI integration

- **Job summary** — every run writes a findings table to the workflow run's **Summary** page (`$GITHUB_STEP_SUMMARY`), so the result is visible without opening the logs.
- **PR comment** — on `pull_request` events the action posts (and updates in place on re-runs) a sticky comment with the findings summary. This requires the workflow to grant `pull-requests: write`:

  ```yaml
  permissions:
    contents: read
    pull-requests: write
  ```

  The PR-comment step is **fail-soft**: if the token lacks permission, it logs a warning and the scan still completes normally.
- **Report artifact** — the action does not upload artifacts itself; upload `${{ steps.<id>.outputs.scan-report }}` from your workflow (see the sample below) to make the full report downloadable from the run page.

Copy-paste-ready examples live in [`dast-scan/examples/`](dast-scan/examples/):

- [`dast-scan.yml`](dast-scan/examples/dast-scan.yml) — PR + nightly schedule + manual dispatch, with artifact upload.
- [`dast-on-merge.yml`](dast-scan/examples/dast-on-merge.yml) — scan on every merge to `main`, driven by a committed `levo-dast.yml` + secrets.
- [`levo-dast.yml`](dast-scan/examples/levo-dast.yml) — starter YAML config to commit alongside it.

### Output

```yaml
outputs:
  scan-report:
    description: 'Path to the scan report file (JSON or SARIF)'
  scan-id:
    description: 'Unique scan ID (unknown when output-format is sarif)'
  findings-count:
    description: 'Total number of findings (from JSON report only; 0 when output-format is sarif)'
  critical-findings:
    description: 'Number of critical findings (from JSON report only; 0 when output-format is sarif)'
  high-findings:
    description: 'Number of high severity findings (from JSON report only; 0 when output-format is sarif)'
  medium-findings:
    description: 'Number of medium severity findings (JSON only)'
  low-findings:
    description: 'Number of low severity findings (JSON only)'
  info-findings:
    description: 'Informational count (JSON only; uses info or informational in report)'
  findings-by-severity:
    description: 'Full JSON object of per-severity counts from the report'
  exit-code:
    description: 'Scan exit code (0=success, non-zero=failure or findings above threshold)'
```

