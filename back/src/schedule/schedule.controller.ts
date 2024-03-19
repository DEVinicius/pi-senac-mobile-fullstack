import { Request, Response } from "express";
import prisma from "../../prisma/factory";

export class ScheduleController {
  public async finish(request: Request, response: Response) {
    try {

      console.log(request.body)

      const slotId = Number(request.body.slotId);
      const userId = Number(request.body.userId);

      if (!slotId || !userId)
        throw new Error("Dados de Slot | Usuario Invalidos");

      if(userId != 1) throw new Error('Usuario não encontrado')

      //ensure slot is free
      const slot = await prisma.appointment.findFirst({
        where: {
          id: slotId,
        },
      });

      if (slot?.user_id) throw new Error("Agendamento já ocupado");

      await prisma.appointment.update({
        where: {
          id: slotId
        },
        data: {
          user_id: userId
        }
      })

      return response.json({
        message: "Agendamento Realizado com sucesso",
      });
    } catch (error: any) {
      return response.status(400).json({
        error: error.message,
      });
    }
  }

  public async searchScheduleByUserId(request: Request, response: Response) {
    try {
      const userId = Number(request.query.userId);
      if (!userId) throw new Error("Usuario não enviado como parametro");
      if (userId != 1) throw new Error("Usuario Inexistente");

      const appointment = await prisma.appointment.findMany({
        where: {
          user_id: userId,
        },
      });

      return response.status(200).json({ appointment });
    } catch (error: any) {
      return response.status(400).json({
        error: error.message,
      });
    }
  }
}
