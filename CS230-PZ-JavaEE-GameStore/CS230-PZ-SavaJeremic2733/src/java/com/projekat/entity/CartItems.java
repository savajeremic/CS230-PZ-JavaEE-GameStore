/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projekat.entity;

import com.projekat.sessionBean.SessionUtils;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jack
 */
@Entity
@Table(name = "cart_items")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CartItems.findAll", query = "SELECT c FROM CartItems c")
    , @NamedQuery(name = "CartItems.findByCartItemsId", query = "SELECT c FROM CartItems c WHERE c.cartItemsId = :cartItemsId")
    , @NamedQuery(name = "CartItems.findByCartId", query = "SELECT c FROM CartItems c JOIN c.cartId g WHERE g.cartId = :cartId")
    , @NamedQuery(name = "CartItems.findByFlagId", query = "SELECT c FROM CartItems c WHERE c.flagId = :flagId")})
public class CartItems implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cartItemsId")
    private Integer cartItemsId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "flag_id")
    private int flagId;
    @JoinColumn(name = "game_id", referencedColumnName = "gameId")
    @ManyToOne(optional = false)
    private Game gameId;
    @JoinColumn(name = "cart_id", referencedColumnName = "cartId")
    @ManyToOne(optional = false)
    private Cart cartId;

    public CartItems() {
    }
    
    public CartItems(Game gameId) {
        this.gameId = gameId;
    }

    public CartItems(Integer cartItemsId) {
        this.cartItemsId = cartItemsId;
    }

    public CartItems(Integer cartItemsId, int flagId) {
        this.cartItemsId = cartItemsId;
        this.flagId = flagId;
    }

    public Integer getCartItemsId() {
        return cartItemsId;
    }

    public void setCartItemsId(Integer cartItemsId) {
        this.cartItemsId = cartItemsId;
    }

    public int getFlagId() {
        return flagId;
    }

    public void setFlagId(int flagId) {
        this.flagId = flagId;
    }

    public Game getGameId() {
        return gameId;
    }

    public void setGameId(Game gameId) {
        this.gameId = gameId;
    }

    public Cart getCartId() {
        return cartId;
    }

    public void setCartId(Cart cartId) {
        this.cartId = cartId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartItemsId != null ? cartItemsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CartItems)) {
            return false;
        }
        CartItems other = (CartItems) object;
        if ((this.cartItemsId == null && other.cartItemsId != null) || (this.cartItemsId != null && !this.cartItemsId.equals(other.cartItemsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.projekat.entity.CartItems[ cartItemsId=" + cartItemsId + " ]";
    }

}
