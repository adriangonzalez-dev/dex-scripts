DECLARE @TagIdsToCheck TABLE (TagId INT);

INSERT INTO @TagIdsToCheck (TagId)
VALUES
    (215), (216), (219), (218), (217), (214), (41), (168), (152),
    (28), (159), (42), (55), (27), (150), (18), (17), (29), (46),
    (165), (22), (51), (138), (77), (158), (84), (85), (149), (54),
    (110), (108), (109), (103), (155), (62), (111), (64), (147);

SELECT TIC.TagId, 'GroupTag' AS TableName, GC.Code AS Local_,
       TG.Name AS TagName
FROM GroupTag GT
INNER JOIN @TagIdsToCheck TIC ON GT.TagId = TIC.TagId
INNER JOIN Group_copy GC ON GT.GroupId = GC.GroupId
INNER JOIN Tag TG ON GT.TagId = TG.TagId;