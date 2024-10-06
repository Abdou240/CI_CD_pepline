name: Java CI with Maven

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          java-version: '11'
          distribution: 'microsoft'

      - name: Build with Maven
        run: mvn -B package --file pox.xml

      - name: Validate Maven Project
        run: mvn validate --file pox.xml
