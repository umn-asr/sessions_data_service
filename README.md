# sessions.umn.edu

A public API for data about UMN Sessions.

## Sessions?

You're probably familar with Terms (i.e., Fall 2015, etc.). Terms are further broken down into sessions. That session data is what this service returns.

## Usage

### Get Everything:

URL  | What Data is Returned
------------- | -------------
`https://sessions.umn.edu/sessions.json` | All data is JSON format
`https://sessions.umn.edu/sessions.xml` | All data is XML format


### Filter by Institution

URL  | What Data is Returned
------------- | -------------
`https://sessions.umn.edu/sessions.json?q=institution_id=UMNTC` | All data for UMNTC institution
`https://sessions.umn.edu/sessions.json?q=institution_id=UMNMO|UMNTC` | All data for UMNMO and UMNTC institutions

### Filter by Term

URL  | What Data is Returned
------------- | -------------
`https://sessions.umn.edu/sessions.json?q=term_id=1159` | All data for Fall 2014 term
`https://sessions.umn.edu/sessions.json?q=term_id=1155|1159` | All data for Summer 2015 and Fall 2015 terms

### Filter by Academic Career

URL  | What Data is Returned
------------- | -------------
`https://sessions.umn.edu/sessions.json?q=academic_career_id=ugrd` | All data for undergrad acadamic career
`https://sessions.umn.edu/sessions.json?q=academic_career_id=ugrd|law` | All data for undergrad and law academic careers

### Filter by Multiple Criteria

Just seperate your criteria with commas

`https://sessions.umn.edu/sessions.json?q=academic_career_id=ugrd|law,term_id=1159,institution_id=UMNTC`

## Data Returned

You will get a collection of `session` resources back. The format will depend on if you choose XML or JSON, but the data will be like this example:

```yaml
session:
  type: 'session'
  session_id: 'umntc_ugrd_1159_017'
  academic_career:
    type: 'academic_career'
    academic_career_id: 'ugrd'
  institution:
    type: 'institution'
    institution_id: 'umntc'
    abbreviation: 'umntc'
  term:
    type: 'term'
    term_id: '1159'
    strm: '1159'
  session_code: '017'
  session_name: '11 wk Session'
  begin_date: '2015-09-08'
  end_date: '2015-11-23'
  enrollement_open_date: '2015-05-01'
```

## Development

* [Setup](#setup)
* [Testing](#testing)
* [Server](#server)
* [Deployment](#deployment)

### Setup

To get started with this app, run `./script/setup` to get dependencies installed and setup.

### Testing

This app uses RSpec for testing. There's a series of requests specs under `./spec/requests/`.

To run the test suite, run `./script/test`.

To run an individual test, `script/test path/to/single_spec.rb`.

### Server

- `script/server` starts a web server for local development, [http://localhost:3000](http://localhost:3000)

### Deployment

We have two deployment targets:

1. production: https://sessions.umn.edu
1. staging: https://sessions-staging.umn.edu

We have a deploy script that runs Capistrano under the covers to deploy the app: 

- `script/deploy`
  - Deploys to staging.
  - Requires you to enter your SSH passphrase
- `script/deploy production`
  - Deploys to production
  - Requires you to enter your SSH passphrase

### Owners

Who is responsible for the web application after initial development?
 * [See this spreadsheet](https://docs.google.com/spreadsheets/d/1JOCG2MZnzsQ_ja8B-pEBqARSXyvoR0TwDb_APO3cdL4/edit?usp=sharing).
