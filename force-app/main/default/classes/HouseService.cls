public with sharing class HouseService {
    // AuraEnabled - Definição
    // A função pode ser chama pelo frontend para realizar um
    // serviço no backend.
    // cacheable - Definição
    // Se o que retorna desse método pode ser cacheado (guardado em memória)
    // pelo sistema. Isso evita carregamento desncesessário.
    @AuraEnabled(cacheable=true)
    public List<House__c> getRecords() { // Busca registros de house__c
        HouseRepository houseRepository = new HouseRepository();
        try {
            return houseRepository.getRecords();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}