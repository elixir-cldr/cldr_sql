Cldr.Sql.start()

alias Cldr.Repo
alias Cldr.Model

Repo.insert! %Model{
  name: "Kip",
  amount: 1
}

Repo.insert! %Model{
  name: "Björn",
  amount: 2
}

Repo.insert! %Model{
  name: "José",
  amount: 2
}

Repo.insert! %Model{
  name: "Alan",
  amount: 3
}

Repo.insert! %Model{
  name: "Årne",
  amount: 4
}

Repo.insert! %Model{
  name: "Aårne",
  amount: 5
}

Repo.insert! %Model{
  name: "Weiß",
  amount: 6
}

Repo.insert! %Model{
  name: "Weiss",
  amount: 6
}

Repo.insert! %Model{
  name: "Worf",
  amount: 7
}

Repo.insert! %Model{
  name: "Wöff",
  amount: 8
}
