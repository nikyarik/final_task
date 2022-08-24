package main

import (
  "fmt"
  "log"
  "net/http"
  "time"
)

func appHandler(w http.ResponseWriter, r *http.Request) {

  fmt.Fprintf(time.Now(), "Hello this new fresh server")

}

func appServerGO(w http.ResponseWriter, r *http.Request) {

  fmt.Fprintf("ITEA course DevOps!")

}

func appAWS(w http.ResponseWriter, r *http.Request) {

  fmt.Fprintf("AWS")
  fmt.Fprintf(<img src="https://media1.giphy.com/media/10FwycrnAkpshW/giphy.gif" alt="awsGif">)

}


func main() {
  http.HandleFunc("/", appHandler)

  http.HandleFunc("/server_go", appServerGO)

  log.Println("Started, serving on port 8080")
  err := http.ListenAndServe(":8080", nil)

  if err != nil {
    log.Fatal(err.Error())
  }
}
