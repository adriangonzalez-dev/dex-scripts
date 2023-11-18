/* Esta query trae los nombres de ls restaurantes que poseen cierta etiqueta */

SELECT
  G.Code
FROM
  DexMcdDb.dbo."Group" G
  INNER JOIN DexMcdDb.dbo.GroupTag GT ON G.GroupId = GT.GroupId
WHERE
  GT.TagId = 259;

  /* Esta query trae un total */

  SELECT
  G.Code as Restaurante,
  (SELECT COUNT(*) FROM DexMcdDb.dbo."Group" G2
   INNER JOIN DexMcdDb.dbo.GroupTag GT2 ON G2.GroupId = GT2.GroupId
   WHERE GT2.TagId = 259) as Total
FROM
  DexMcdDb.dbo."Group" G
  INNER JOIN DexMcdDb.dbo.GroupTag GT ON G.GroupId = GT.GroupId
WHERE
  GT.TagId = 259;

  /* Esta query trae el restaurante, playlist y calendario  */
  SELECT
  G.Code as Restaurante,
  P.Name as "Playlist Default",
  S.Name as Calendario
FROM
  DexMcdDb.dbo."Group" G
  INNER JOIN DexMcdDb.dbo.GroupTag GT ON G.GroupId = GT.GroupId
  LEFT JOIN DexMcdDb.dbo.Playlist P ON G.PlaylistId = P.PlaylistId
  LEFT JOIN DexMcdDb.dbo.Schedule S ON G.ScheduleId = S.ScheduleId
WHERE
  GT.TagId = 259;

  /* Esta query trae una todos los resultados unicos de "Mostrador"*/
  SELECT DISTINCT
  G.Code as Restaurante,
  P.Name as "Playlist Default",
  S.Name as Calendario
FROM
  DexMcdDb.dbo."Group" G
  INNER JOIN DexMcdDb.dbo.GroupTag GT ON G.GroupId = GT.GroupId
  LEFT JOIN DexMcdDb.dbo.Playlist P ON G.PlaylistId = P.PlaylistId
  LEFT JOIN DexMcdDb.dbo.Schedule S ON G.ScheduleId = S.ScheduleId
WHERE G.CustomerId = 3
  AND G.Code LIKE '%01MOSTRADOR%';