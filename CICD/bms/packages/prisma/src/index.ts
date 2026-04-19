import { PrismaClient } from "../generated/prisma/client";
import { PrismaPg } from "@prisma/adapter-pg";
import { Pool } from "pg";

const connectionString = process.env.DATABASE_URL;

// 1. Create the pg Pool
const pool = new Pool({ connectionString });

// 2. Initialize the adapter with the pool
const adapter = new PrismaPg(pool);

// 3. Pass the adapter inside the configuration object
export const client = new PrismaClient({ adapter });