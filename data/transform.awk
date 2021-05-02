# $ gawk -f transform.awk 2018_Central_Park_Squirrels.csv

BEGIN {
    FPAT = "([^,]*)|(\"([^\"]|(\"\"))*\")"
}

{
  record = ""

  for (i = 1; i <= NF; i++) {
    if (i == NF) {
      match($i, /^POINT \(([\-0-9.]+) ([\-0-9.]+)\)$/, point)

      record = record "\"(" point[1] "," point[2] ")\""
    } else if (i == 6) {
      match($i, /^([0-9]{2})([0-9]{2})([0-9]{4})$/, date)

      record = record date[3] "-" date[1] "-" date[2]
    } else {
      record = record $i
    }

    if (i != NF) {
      record = record ","
    }
  }

  print record
}