## Running the Application

To run the application locally, follow these steps:

1. Clone the repository:
  ```bash
  git clone https://github.com/learning-git-labs/devops-<initials>.git
  ```
2. Navigate to the project directory:
  ```bash
  cd devops-<initials>
  ```
3. Install the dependencies:
  ```bash
  pip install -r requirements.txt
  ```
4. Run the application:
  ```bash
  uvicorn app:app --host 0.0.0.0 --port 8000
  ```