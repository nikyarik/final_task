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

}


func main() {
  http.HandleFunc("/", appHandler)
  http.HandleFunc("/server_go", appServerGO)
  http.HandleFunc("/aws", appAWS)


  log.Println("Started, serving on port 8080")
  err := http.ListenAndServe(":8080", nil)

  if err != nil {
    log.Fatal(err.Error())
  }
}
