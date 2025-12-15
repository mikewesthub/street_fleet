# GitHub Actions Workflows

## CI Workflow

The `ci.yml` workflow is a GitHub Actions conversion of the original Jenkinsfile. It runs the test suite for the StreetFleet Rails application.

### Workflow Details

**Triggers:**
- Push to `master` or `main` branches
- Pull requests targeting `master` or `main` branches

**Environment:**
- Ruby 2.3.0 (matching the Jenkins pipeline)
- PostgreSQL 13 (service container)
- Redis 6 (service container)
- Ubuntu latest runner

**Stages:**

1. **Checkout code** - Retrieves the repository code
2. **Install system dependencies** - Installs postgresql-client and nodejs
3. **Cache Ruby gems** - Caches bundled gems for faster builds
4. **Install Ruby dependencies** - Runs bundle install
5. **Configure database** - Copies database.yml.travis to database.yml
6. **Setup test database** - Creates and migrates the test database
7. **Run RSpec tests** - Executes the RSpec test suite with JUnit formatter
8. **Publish test results** - Publishes test results (runs even on failure)

### Differences from Jenkins Pipeline

1. **Service Containers**: GitHub Actions uses service containers for PostgreSQL and Redis instead of assuming they're available on the host
2. **Caching**: Added gem caching to improve build performance
3. **Test Result Publishing**: Uses a GitHub Actions marketplace action instead of Jenkins' built-in JUnit publisher
4. **Cleanup**: GitHub Actions automatically cleans up workspace, so no explicit cleanWs() needed

### Required Secrets

No secrets are required for this workflow. All necessary credentials are configured within the workflow or use default values.

### Notes

- The workflow uses pinned action versions (commit SHAs) for security
- Timeout is set to 30 minutes (matching Jenkins configuration)
- The RspecJunitFormatter gem will need to be in the Gemfile for JUnit XML output
- Build retention is not configured in GitHub Actions but can be managed in repository settings
