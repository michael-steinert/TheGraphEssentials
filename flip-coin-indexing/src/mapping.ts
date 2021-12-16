import {
    FlipCoin,
    BetPlaced,
    Funded,
    OwnershipTransferred
} from "../generated/FlipCoin/FlipCoin";
import {BetPlacedEntity} from "../generated/schema";

export function handleBetPlaced(event: BetPlaced): void {
    // Entities can be loaded from the Store using a String ID
    // This ID needs to be unique across all entities of the same type
    let entity = BetPlacedEntity.load(event.transaction.from.toHex());

    // Entities only exist after they have been saved to the Store
    // Null Checks allow creating Entities on Demand
    if (!entity) {
        entity = new BetPlacedEntity(event.transaction.from.toHex());
    }

    // Entity Fields can be set based on Event Parameters
    entity.user = event.params.user;
    entity.bet = event.params.bet;
    entity.win = event.params.win;
    entity.side = event.params.side;

    // Entities can be written to the Store
    entity.save();
}

export function handleFunded(event: Funded): void {
    // TODO
}

export function handleOwnershipTransferred(event: OwnershipTransferred): void {
}
