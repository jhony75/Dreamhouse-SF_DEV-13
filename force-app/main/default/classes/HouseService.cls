public with sharing class HouseService {
    // AuraEnabled - Definição
    // A função pode ser chama pelo frontend para realizar um
    // serviço no backend.
    // cacheable - Definição
    // Se o que retorna desse método pode ser cacheado (guardado em memória)
    // pelo sistema. Isso evita carregamento desncesessário.
    @AuraEnabled(cacheable=true)
    public static List<House__c> getRecords() { // Busca registros de house__c
        try {
            // List<House__c> lstHouses = [] - Má prática, tipo da variavel no nome
            List<House__c> houses = [
                SELECT Id,
                       Name,
                       Address__c,
                       State__c,
                       City__c,
                    Zip__c
                FROM House__c
                WITH USER_MODE // É para usar o modo do usuário que disparou a chamada, respeitando suas permissões
                ORDER BY CreatedDate // Ordena a listagem de resultados por data de criação do registro
                LIMIT 10 // Limita o número de registros retornados pela query
            ];
            return houses;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}