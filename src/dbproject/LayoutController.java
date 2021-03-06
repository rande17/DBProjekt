/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbproject;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import org.postgresql.util.PSQLException;

/**
 * FXML Controller class
 *
 * @author rickie
 */
public class LayoutController implements Initializable {

    String dburl = "jdbc:postgresql://horton.elephantsql.com:5432/pjuckfbw";
    String username = "pjuckfbw";
    String password = "7BpKJanLBglXhFEs0maW4C0i5c5AyyND";

    @FXML
    private Button searchCoach;
    @FXML
    private Button allCoaches;
    @FXML
    private Button allWinning;
    @FXML
    private Button allTeams;
    @FXML
    private Button allTournaments;
    @FXML
    private TextField textCoach;
    @FXML
    private Button searchWinning;
    @FXML
    private TextField textWinner;
    @FXML
    private Button searchTeam;
    @FXML
    private TextField textTeam;
    @FXML
    private Button searchTournament;
    @FXML
    private TextField textTournament;
    @FXML
    private TextArea output;

    /**
     * Initializes the controller class.     *
     * @param url some javaFX standard
     * @param rb some javaFX standard
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    private void dbQuery(String sql, int outputs, String args) {
        String results = "";
        try {
            Class.forName("org.postgresql.Driver");
        } catch (java.lang.ClassNotFoundException e) {
            results = "DB class not found";
          //  System.out.println(e);
        }

        try {
            try (Connection db = DriverManager.getConnection(dburl, username, password); PreparedStatement st = db.prepareStatement(sql)) {
                if (args != null) {
                 //   System.out.println(sql.replace("?", args));
                    try {
                        st.setString(2, args);
                        st.setString(1, args);
                    } catch (PSQLException e) {
                        st.setString(1, args);
                    }
                }
                try (ResultSet rs = st.executeQuery()) {
                    while (rs.next()) {
                        for (int i = 1; i <= outputs; i++) {
                            if (i != outputs) {
                                results += (rs.getString(i) + " - ");
                            } else {
                                results += (rs.getString(i) + "\n");
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {
            results = "Failure in DB query";
            //System.out.println(e);
        }
        output.setText(results);
    }

    // Here it selects only the names from Teams and Coachs(couch), and puts it into one string output
    @FXML
    private void allCoaches(ActionEvent event) {
        dbQuery("SELECT DISTINCT(name), CONCAT('Coach: ', coach) FROM Teams", 2, null);
    }

    // people.email is people.nickname, and the other way around.
    // It selects the nicknames from people, and then it looks into Teams so it can go into Tournaments, so that it can find out whether or not the Team/people are currently on a team, and whether that team has won or not.
    @FXML
    private void allWinning(ActionEvent event) {
        dbQuery("SELECT DISTINCT(People.name) FROM People"
                + " INNER JOIN is_on ON People.nickname = is_on.nickname"
                + " INNER JOIN Teams ON is_on.teamname = Teams.name"
                + " INNER JOIN plays_in ON Teams.name = plays_in.teamname"
                + " INNER JOIN Tournaments ON plays_in.tournamentname = Tournaments.name"
                + " WHERE Tournaments.winner = Teams.name"
                + " UNION SELECT DISTINCT(Teams.coach) FROM Teams"
                + " INNER JOIN plays_in ON Teams.name = plays_in.teamname"
                + " INNER JOIN Tournaments ON plays_in.tournamentname = Tournaments.name"
                + " WHERE Tournaments.winner = Teams.name", 1, null);
    }

    // Here it selects the name of the team, and then it counts the amount of names on the team, and then it prints out the Name of the team and the number of names/player+coachs on the team.
    @FXML
    private void allTeams(ActionEvent event) {
        dbQuery("SELECT Teams.name, CONCAT('Players: ', COUNT(People.name)) FROM Teams"
                + " INNER JOIN is_on ON Teams.name = is_on.teamname"
                + " INNER JOIN People ON is_on.nickname = People.nickname "
                + " GROUP BY Teams.name", 2, null);
    }

    @FXML
    private void allTournaments(ActionEvent event) {
        dbQuery("SELECT DISTINCT(name) FROM Tournaments", 1, null);
    }

    @FXML
    private void searchCoach(ActionEvent event) {
        dbQuery("SELECT DISTINCT(name), CONCAT('Coach: ', coach)"
                + " FROM Teams"
                + " WHERE UPPER(coach) LIKE UPPER(CONCAT('%', ? , '%'))", 2, textCoach.getText());
    }

    @FXML
    private void searchWinner(ActionEvent event) {
        dbQuery("SELECT DISTINCT(People.name) FROM People"
                + " INNER JOIN is_on ON People.nickname = is_on.nickname"
                + " INNER JOIN Teams ON is_on.teamname = Teams.name"
                + " INNER JOIN plays_in ON Teams.name = plays_in.teamname"
                + " INNER JOIN Tournaments ON plays_in.tournamentname = Tournaments.name"
                + " WHERE Tournaments.winner = Teams.name "
                + " AND UPPER(People.name) LIKE UPPER(CONCAT('%', ? , '%'))"
                + " UNION SELECT DISTINCT(Teams.coach) FROM Teams"
                + " INNER JOIN plays_in ON Teams.name = plays_in.teamname"
                + " INNER JOIN Tournaments ON plays_in.tournamentname = Tournaments.name"
                + " WHERE Tournaments.winner = Teams.name"
                + " AND UPPER(Teams.coach) LIKE UPPER(CONCAT('%', ? , '%'))", 1, textWinner.getText());
    }

    @FXML
    private void searchTeam(ActionEvent event) {
        dbQuery("SELECT Teams.name, CONCAT('Players: ', COUNT(People.name)) FROM Teams"
                + " INNER JOIN is_on ON Teams.name = is_on.teamname"
                + " INNER JOIN People ON is_on.nickname = People.nickname"
                + " WHERE UPPER(Teams.name) LIKE UPPER(CONCAT('%', ? , '%'))"
                + " GROUP BY Teams.name", 2, textTeam.getText());
    }

    @FXML
    private void searchTournament(ActionEvent event) {
        int numberOfTeams;
        try {
            numberOfTeams = Integer.parseInt(textTournament.getText());
            dbQuery("SELECT DISTINCT(Tournaments.name) FROM Tournaments "
                    + " INNER JOIN plays_in ON Tournaments.name = plays_in.tournamentname"
                    + " GROUP by Tournaments.name"
                    + " HAVING count(plays_in.teamname) >= CAST(? AS integer)", 1, "" + numberOfTeams);
        } catch (NumberFormatException e) {
            output.setText("That was not a number");
        }

    }

}
