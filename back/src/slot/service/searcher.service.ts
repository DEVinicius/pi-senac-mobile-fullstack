import { randomUUID } from "node:crypto";
import prisma from "../../../prisma/factory";

class SlotSearcher {
  public async searchByProfessionalId(professionalId: number) {
    let hour = 5;

    const today = new Date();
    today.setHours(hour, 0, 0, 0);

    const endDay = new Date();
    endDay.setHours(15, 0, 0, 0);

    const slotsSearched = await prisma.appointment.findMany({
      where: {
        professional_id: professionalId,
        start: {
          gte: today,
        },
        end: {
          lte: endDay,
        },
      },
    });

    if (slotsSearched.length > 0) return slotsSearched;

    const slots: { id: string; start: Date; end: Date }[] = [];

    while (hour < 15) {
      const date = new Date();
      date.setHours(hour, 0, 0, 0);
      const end_first = new Date();
      end_first.setHours(hour, 30, 0, 0);

      const end_final = new Date();
      end_final.setHours(hour + 1, 0, 0, 0);

      const slot = {
        id: randomUUID(),
        start: date,
        end: end_first,
      };

      const second_slot = {
        id: randomUUID(),
        start: end_first,
        end: end_final,
      };

      hour++;
      slots.push(slot);
      slots.push(second_slot);
    }

    const newSlots = await prisma.appointment.createMany({
      data: slots.map((s) => {
        return {
          end: s.end,
          start: s.start,
          professional_id: professionalId,
        };
      }),
    });

    return await prisma.appointment.findMany({
      where: {
        professional_id: professionalId,
        start: {
          gte: today,
        },
        end: {
          lte: endDay,
        },
      },
    });;
  }
}

export default new SlotSearcher();
