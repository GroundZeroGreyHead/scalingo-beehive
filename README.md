## Objectives

- Code Readability and correctness: Ensure the code is easy to read, understand, and maintain.

  - I took an "API FIRST" approach, where by the api returns json to client this allow us to decouple the client from the api.
  - The api is versioned, this was implemented as path versioning for simplicity

- Early Spec Discovery: Identify and address any missing specifications early in the process.

  - Here it wasn't clear if beehives names should be unique
  - I enforced a limit on the weight, since beehives 🐝 can't be more than a tonne 🤔. Numericality of the weight field to ensure it is within the specified range (0 to 1000)

- Infrastructure:

  - I run a docker compose script to facilitate isolation and portable environment

- Robust error handling and thorough Testing
  - In that all controller actions return appopriate errors to the client.
  - Ensure controller and model objects are comprehensivly tested.

## Design Overview

The project is divided into two main parts:

1.  API using Ruby on Rails
2.  Frontend using Vue.js

### API (Ruby on Rails)

The API is responsible for:

- View the list of all beehives 🐝
- Add a new beehive 🐝 to the existing ones
- View the details of a specific beehive 🐝

A beehive has a name and a weight. The name must be at least 6 characters long (this is validated with a test).

### Frontend (Vue.js)

The frontend has two main screens:

- Home Page (/): Lists existing beehives and contains a form to add a new one.
- Details Page (/hives/): Shows details of a specific beehive.

## Implementation Details

### Ruby on Rails API

- Database: PostgreSQL
- Endpoints:
  - `GET api/v1/beehives`: List all beehives
  - `POST api/v1/beehives`: Add a new beehive
  - `GET api/v1/beehives/:id`: View details of a specific beehive

### Vue.js Frontend

- Components:

  - `BeehiveList`: Displays the list of beehives and a form to allow for creating new beehive

  - `BeehiveDetail`: Shows details of a specific beehive

### Considerations

- Error Handling: Implement robust error handling to ensure the application handles failures gracefully.

- Security: Protect against common security threats, such as SQL injection and XSS attacks.

- Performance: Implement pagination to handle large datasets efficiently.

- Apply COR mechanism to restrict clients access to the api

### Testing

- Use RSpec for testing the Rails API.
- Ensure all endpoints | models have comprehensive test coverage.

### TODO

- Deployment: TODO Scalingo, since i have never deployed to scalingo, i would have enjoyed this opportunity, but unfortunately i am out of time.

### Additional Considerations 🤔

- Adding a Observability agent(data dog) for telemetry data

- Cache mechanism incase of increased load on the db

- Elastic load balancing to reduce the risk of overloading our api

- Documentation of our api as part of our knowledge corpus

- Possibly consider using typescript for the web client

- Authentification and authorization of our client

**Running the Implementation**

1.  **Build, Test and Run the Application:**

I provided a Makefile to simplify, running, testing and building the application, to this end you can run the implementation

- Run and build

  - Open a terminal

    - `git clone https://github.com/GroundZeroGreyHead/scalingo-beehive.git`

    - `cd scalingo-beehive`

    - `git submodule update --init --recursive`

    - To run the beehives app 🐝 👉 `make run`

  - As soon as the server is up and running

  - Then set up

    - Open a new terminal window
    - If your running this for the first time. We run a set up target to create db , migrate and add some seed data.

          make setup

  - checkout 👉 [beehives app](http://localhost:8080/) 🐝

- Running tests

  - while the app is running, open another terminal, Note before running tests
    the database is cleared to have a isolation and consistency in our tests.

        make test

Note: if you need to continue running the app with seed data:

     make seed

Don't forget to clean up.

    make teardown

🍻 Cheers!

Mubarak 🐝
