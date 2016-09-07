# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tomodachi.Repo.insert!(%Tomodachi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Tomodachi.Repo
alias Tomodachi.Person
alias Tomodachi.Hobby

Repo.delete_all(Hobby)
Repo.delete_all(Person)

andrew = %Person{
  name: "Andrew",
  age: 29
}
bob = %Person{
  name: "Bob",
  age: 55
}
alice = %Person{
  name: "Alice",
  age: 16
}

andrew = Repo.insert!(andrew)
bob = Repo.insert!(bob)
Repo.insert!(alice)

go = %Hobby{
  title: "Go",
  description: "Go (traditional Chinese: 圍棋; simplified Chinese: 围棋; pinyin: About this sound wéiqí; Japanese: 囲碁; rōmrally: \"encircling game\") is an abstract strategy board game for two players, in which the aim is to surround more territory than the opponent.",
  active: true,
  person_id: andrew.id
}
encryption = %Hobby{
  title: "Encryption",
  description: "In cryptography, encryption is the process of encoding messages or information in such a way that only authorized parties can read it.",
  active: true,
  person_id: bob.id
}

Repo.insert!(go)
Repo.insert!(encryption)
