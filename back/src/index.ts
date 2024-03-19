import express from "express";
import { SlotController } from "./slot/slot.controller";
import { ScheduleController } from "./schedule/schedule.controller";
import { initPrisma } from "../prisma/factory";
import bodyParser from "body-parser";
import cors from "cors";

const jsonParser = bodyParser.json();

const app = express();
app.use(jsonParser);
app.use(cors());

initPrisma();

const slotController = new SlotController();
const scheduleController = new ScheduleController();

app.get("/slot", slotController.searchSlot.bind(slotController));
app.get(
  "/schedule",
  scheduleController.searchScheduleByUserId.bind(scheduleController)
);
app.post("/schedule", scheduleController.finish.bind(scheduleController));

app.listen("3000", () => {
  console.log("App Is running on port 3000");
});
