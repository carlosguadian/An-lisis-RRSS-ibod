##extraer info usuarios y eliminar duplicados
usersInfo = users_data(tmls)
usersInfo = usersInfo[!duplicated(usersInfo), ]

write.csv(usersInfo, file='./infoUsers.csv', row.names=F)

# obtener los miembros de una lista
sens <- lists_members(slug = "Nombre de la lista", owner_user = "nombre de usuario")
sens

write.csv(sens, file='./lista.csv', row.names=F)

## Cuantos seguidores tiene un perfil
usuario <- lookup_users("poner usuario")

## si el usuario tiene muchos seguidores puede costar un poco
usuario_flw <- get_followers(
  "usuario", n = usuario$followers_count, retryonratelimit = TRUE
)

#obtener información de los usuarios
usuario_users <- lookup_users(usuario_flw$user_id)

datos_ususarios <- users_data(usuario_users)

write.csv(feijoousers, file='./seguidores-usuario.csv', row.names=F)
