/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projekat.bean;

import com.projekat.entity.Cart;
import com.projekat.entity.CartItems;
import com.projekat.entity.User;
import com.projekat.sessionBean.SessionUtils;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jack
 */
@ManagedBean
@SessionScoped
public class LoginBean implements Serializable {

    private static final long serialVersionUID = 1L;

    @PersistenceContext(unitName = "CS230-PZ-SavaJeremic2733PU")
    private EntityManager em;

    private int userId;
    private String username;
    private String password;
    private String name;

    private boolean admin = false;
    private boolean loggedIn = false;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    public void setLoggedIn(boolean loggedIn) {
        this.loggedIn = loggedIn;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String login() throws IOException {
        User user = null;
        boolean validator;

        try {
            user = (User) em.createNamedQuery("User.findByUsername")
                    .setParameter("username", username)
                    .getSingleResult();
            validator = validateUser(user);
            getAllOrders();
        } catch (NoResultException e) {
            validator = false;
        }

        if (validator) {
            HttpSession session = SessionUtils.getSession();
            session.setAttribute("data", user);
            int id = Integer.parseInt(session.getAttribute("data").toString());
            System.out.println("SESSION: " + id);
            loggedIn = true;
            if (username.equalsIgnoreCase("admin")) {
                admin = true;
            }
            Cart cart = new Cart(userId);
            return "/index.xhtml";
        } else {
            FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Input values are incorrect.", "Please try again!");
            FacesContext.getCurrentInstance().addMessage(null, fm);
            return "index";
        }
    }
    
    public List<CartItems> getAllOrders() {
        ArrayList<CartItems> list;
        list = new ArrayList<>(em.createNamedQuery("CartItems.findByCartId", CartItems.class).setParameter("cartId", ajDi()).getResultList());
        System.out.println("list " + list);
        return list;
    }

    private boolean validateUser(User user) {
        if (username.equalsIgnoreCase(user.getUsername()) && password.equals(user.getPassword())) {
            return true;
        }
        return false;
    }

    public String logout() {
        HttpSession session = SessionUtils.getSession();
        session.invalidate();
        return "index";
    }

    public int ajDi() {
        int id = 0;
        try {
            HttpSession session = SessionUtils.getSession();
            id = Integer.parseInt(session.getAttribute("data").toString());
            System.out.println("IDDD " + id);
        } catch (NullPointerException e) {
            e.printStackTrace();
        }
        return id;
    }
}
