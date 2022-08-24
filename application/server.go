package main

import (
  "fmt"
  "log"
  "net/http"
  "time"
)

func appHandler(w http.ResponseWriter, r *http.Request) {

  fmt.Println(time.Now(), "Hello this new fresh server")

}

func appServerGO(w http.ResponseWriter, r *http.Request) {

  fmt.Fprintf(w, "ITEA course DevOps!")

}

func appAWS(w http.ResponseWriter, r *http.Request) {

  fmt.Fprintf(w, "AWS")
}


func main() {
//  http.HandleFunc("/time", appHandler)

  fileServer := http.FileServer(http.Dir("./static"))
  http.Handle("/", fileServer)

  http.HandleFunc("/itea", appServerGO)
  http.HandleFunc("/aws", appAWS)


  log.Println("Started, serving on port 8080")
  err := http.ListenAndServe(":8080", nil)

  if err != nil {
    log.Fatal(err.Error())
  }
}
