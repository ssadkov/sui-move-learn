module my_name_contract::SimpleStorage {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use sui::transfer;
	use std::string;

    // Определение структуры с двумя полями
    struct StoredData has key, store {
        id: UID,      // Уникальный идентификатор объекта
        birthdate: u64,  // Дата рождения (14111987)
        name: string::String, // Имя (sadkov)
    }

    // Функция для создания объекта с числом и именем
    public entry fun store_data(ctx: &mut TxContext) {
        let data = StoredData {
            id: object::new(ctx),  // Создаём новый объект
            birthdate: 14111987,   // Записываем дату рождения
            name: string::utf8(b"sadkov_string")        // Записываем имя
        };
        transfer::public_share_object(data); // Делаем объект публичным
    }
}
