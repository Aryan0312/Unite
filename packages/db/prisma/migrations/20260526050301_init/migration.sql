/*
  Warnings:

  - You are about to drop the `mapElements` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `spaceElements` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "Avatar_id_key";

-- DropIndex
DROP INDEX "Element_id_key";

-- DropIndex
DROP INDEX "Map_id_key";

-- DropIndex
DROP INDEX "Space_id_key";

-- DropIndex
DROP INDEX "User_id_key";

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "role" SET DEFAULT 'User';

-- DropTable
DROP TABLE "mapElements";

-- DropTable
DROP TABLE "spaceElements";

-- CreateTable
CREATE TABLE "SpaceElement" (
    "id" TEXT NOT NULL,
    "elementId" TEXT NOT NULL,
    "spaceId" TEXT NOT NULL,
    "x" INTEGER NOT NULL,
    "y" INTEGER NOT NULL,

    CONSTRAINT "SpaceElement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MapElement" (
    "id" TEXT NOT NULL,
    "mapId" TEXT NOT NULL,
    "elementId" TEXT,
    "x" INTEGER,
    "y" INTEGER,

    CONSTRAINT "MapElement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "SpaceElement_spaceId_idx" ON "SpaceElement"("spaceId");

-- CreateIndex
CREATE INDEX "SpaceElement_elementId_idx" ON "SpaceElement"("elementId");

-- CreateIndex
CREATE INDEX "MapElement_mapId_idx" ON "MapElement"("mapId");

-- CreateIndex
CREATE INDEX "MapElement_elementId_idx" ON "MapElement"("elementId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_avatarId_fkey" FOREIGN KEY ("avatarId") REFERENCES "Avatar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpaceElement" ADD CONSTRAINT "SpaceElement_elementId_fkey" FOREIGN KEY ("elementId") REFERENCES "Element"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SpaceElement" ADD CONSTRAINT "SpaceElement_spaceId_fkey" FOREIGN KEY ("spaceId") REFERENCES "Space"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MapElement" ADD CONSTRAINT "MapElement_mapId_fkey" FOREIGN KEY ("mapId") REFERENCES "Map"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MapElement" ADD CONSTRAINT "MapElement_elementId_fkey" FOREIGN KEY ("elementId") REFERENCES "Element"("id") ON DELETE SET NULL ON UPDATE CASCADE;
