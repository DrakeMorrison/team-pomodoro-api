CREATE TABLE "Users" (
  "Id" int NOT NULL PRIMARY KEY,
  "Name" varchar
);

CREATE TABLE "Projects" (
  "Id" int NOT NULL PRIMARY KEY,
  "Name" varchar,
  "isArchived" bit,
  "Description" varchar
);

CREATE TABLE "UsersToProjects" (
  "Id" int NOT NULL PRIMARY KEY,
  "UserId" int,
  "ProjectId" int
);

CREATE TABLE "Tasks" (
  "Id" int,
  "Name" varchar,
  "EstimatedPomodori" int,
  "ActualPomodori" int,
  "InternalInterruptions" int,
  "ExternalInterruptions" int,
  "UserId" varchar,
  "isArchived" bit,
  "ProjectId" int,
  "RecordId" int,
  "isAssigned" bit
);

CREATE TABLE "Records" (
  "Id" int,
  "StartTime" datetime,
  "EndTime" datetime,
  "ProjectId" int
);

ALTER TABLE "Tasks" ADD FOREIGN KEY ("UserId") REFERENCES "Users" ("Id");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("Id");

ALTER TABLE "Records" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("Id");

ALTER TABLE "Tasks" ADD FOREIGN KEY ("RecordId") REFERENCES "Records" ("Id");

ALTER TABLE "UsersToProjects" ADD FOREIGN KEY ("UserId") REFERENCES "Users" ("Id");

ALTER TABLE "UsersToProjects" ADD FOREIGN KEY ("ProjectId") REFERENCES "Projects" ("Id");