import { Request, Response } from "express";
import slotSearcher from "./service/searcher.service";

export class SlotController {
  public async searchSlot(request: Request, response: Response) {
    try {
      if (!request.query.professionalId)
        throw new Error("Profissional nao enviado");
      const slots = await slotSearcher.searchByProfessionalId(
        parseInt(request.query.professionalId as string)
      );
      return response.json(slots);
    } catch (error: any) {
      return response.status(400).json({
        error: error.message,
      });
    }
  }
}
