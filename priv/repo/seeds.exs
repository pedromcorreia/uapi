Uapi.Accounts.create_store(%{name: "Alphaville", latitude: -25.3767591, longitude: -49.208658})
Uapi.Accounts.create_store(%{name: "Macaé", latitude: -25.3763591, longitude: -49.208958})

Uapi.Accounts.create_store(%{
  name: "Jardim Paulista",
  latitude: -25.3763531,
  longitude: -49.208958
})

Uapi.Accounts.create_store(%{name: "Centro", latitude: -25.3763501, longitude: -49.208358})
Uapi.Accounts.create_store(%{name: "Alto da XV", latitude: -25.3763511, longitude: -49.208158})
Uapi.Accounts.create_store(%{name: "Cabral", latitude: -25.3763521, longitude: -49.208558})
Uapi.Accounts.create_store(%{name: "Centro 2", latitude: -25.3763531, longitude: -49.208998})
Uapi.Accounts.create_store(%{name: "Bigorilho", latitude: -25.3763541, longitude: -49.208918})
Uapi.Accounts.create_store(%{name: "Centro Civico", latitude: -25.3763551, longitude: -49.208938})

Enum.map(Uapi.Accounts.list_stores(), fn store ->
  for i <- 0..10 do
    Uapi.Accounts.create_food(%{
      store: store.id,
      name: Faker.Food.dish(),
      price: Enum.random(0..10)
    })
  end
end)
