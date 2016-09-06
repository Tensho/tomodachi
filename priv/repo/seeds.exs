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

Tomodachi.Repo.delete_all(Tomodachi.Hobby)
Tomodachi.Repo.delete_all(Tomodachi.Person)

andrew = %Tomodachi.Person{
  name: "Andrew",
  age: 29
}
bob = %Tomodachi.Person{
  name: "Bob",
  age: 55
}
alice = %Tomodachi.Person{
  name: "Alice",
  age: 16
}

andrew = Tomodachi.Repo.insert!(andrew)
bob = Tomodachi.Repo.insert!(bob)
alice = Tomodachi.Repo.insert!(alice)

go = %Tomodachi.Hobby{
  title: "Go",
  description: "Go (traditional Chinese: 圍棋; simplified Chinese: 围棋; pinyin: About this sound wéiqí; Japanese: 囲碁; rōmrally: \"encircling game\") is an abstract strategy board game for two players, in which the aim is to surround more territory than the opponent.",
  active: true,
  person_id: andrew.id
}
encryption = %Tomodachi.Hobby{
  title: "Encryption",
  description: "In cryptography, encryption is the process of encoding messages or information in such a way that only authorized parties can read it.",
  active: true,
  person_id: bob.id
}

Tomodachi.Repo.insert!(go)
Tomodachi.Repo.insert!(encryption)
