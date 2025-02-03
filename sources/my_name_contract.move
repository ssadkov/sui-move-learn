module my_name_contract::SimpleStorage {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use sui::transfer;

    // Определение структуры для хранения числа
    struct StoredNumber has key, store {
        id: UID, // Уникальный идентификатор объекта
        value: u64, // Число, которое мы сохраняем
    }

    // Функция для создания объекта с числом
    public entry fun store_number(ctx: &mut TxContext) {
        let num = StoredNumber {
            id: object::new(ctx), // Создаём новый объект
            value: 14111987, // Сохраняем число
        };
        transfer::public_share_object(num); // Делаем объект публичным
    }
}
