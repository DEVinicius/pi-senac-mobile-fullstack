import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

export async function initPrisma() {
    await prisma.$connect();
}

export default prisma