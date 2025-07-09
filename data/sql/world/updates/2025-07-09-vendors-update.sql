-- Innkeeper Allison in Stormwind
INSERT INTO npc_vendor (entry, item)
SELECT 6740, 666
WHERE NOT EXISTS (
  SELECT 1 FROM npc_vendor WHERE entry = 6740 AND item = 666
);

-- Innkeeper Gryshka in Orgrimmar
INSERT INTO npc_vendor (entry, item)
SELECT 6929, 666
WHERE NOT EXISTS (
  SELECT 1 FROM npc_vendor WHERE entry = 6929 AND item = 666
);

-- Amisi Azuregaze in Dalaran
INSERT INTO npc_vendor (entry, item)
SELECT 28687, 666
WHERE NOT EXISTS (
  SELECT 1 FROM npc_vendor WHERE entry = 28687 AND item = 666
);
