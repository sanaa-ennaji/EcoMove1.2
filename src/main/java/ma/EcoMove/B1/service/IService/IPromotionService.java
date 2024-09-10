package main.java.ma.EcoMove.B1.service.IService;

import main.java.ma.EcoMove.B1.entity.Promotion;

import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

public interface IPromotionService {
    void createPromotion(Promotion promotion) throws SQLException;
    Promotion getPromotionById(UUID id) throws SQLException;
    List<Promotion> getAllPromotions() throws SQLException;
    void updatePromotion(Promotion promotion) throws SQLException;
    void deletePromotion(UUID id) throws SQLException;
}
