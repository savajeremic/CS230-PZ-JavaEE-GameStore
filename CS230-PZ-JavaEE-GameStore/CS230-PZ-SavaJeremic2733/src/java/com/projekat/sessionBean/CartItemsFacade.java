/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projekat.sessionBean;

import com.projekat.entity.CartItems;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Jack
 */
@Stateless
public class CartItemsFacade extends AbstractFacade<CartItems> {

    @PersistenceContext(unitName = "CS230-PZ-SavaJeremic2733PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CartItemsFacade() {
        super(CartItems.class);
    }
    
}
