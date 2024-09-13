package main.java.ma.EcoMove.B1.service;

import main.java.ma.EcoMove.B1.dao.Interface.IClient;
import main.java.ma.EcoMove.B1.entity.Client;
import main.java.ma.EcoMove.B1.service.IService.IClientService;

import java.util.Optional;

public class ClientService  implements IClientService {
    private final IClient clientDAO ;

    public ClientService (IClient clientDAO){
        this.clientDAO = clientDAO;

    }
    @Override
    public Optional<Client> findByEmail(String email){
        return clientDAO.findByEmail(email);
    }
@override
    public Client registerClient (String nom , String prenom, String email, String telephone){

    }


}
