DECLARE @TagIdsToCheck TABLE (TagId INT);

INSERT INTO @TagIdsToCheck (TagId)
VALUES
    (215), (216), (219), (218), (217), (214), (41), (168), (152),
    (28), (159), (42), (55), (27), (150), (18), (17), (29), (46),
    (165), (22), (51), (138), (77), (158), (84), (85), (149), (54),
    (110), (108), (109), (103), (155), (62), (111), (64), (147);

SELECT TIC.TagId, 'MediaComponentTag' AS TableName, MCT.MediaComponentId AS id,
       MC.Name AS MediaName, MC.Path AS MediaPath, TG.Name AS TagName
FROM MediaComponentTag MCT
INNER JOIN @TagIdsToCheck TIC ON MCT.TagId = TIC.TagId
INNER JOIN MediaComponent MC ON MCT.MediaComponentId = MC.MediaComponentId
INNER JOIN Tag TG ON MCT.TagId = TG.TagId;