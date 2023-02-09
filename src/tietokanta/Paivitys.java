package tietokanta;

import tietokanta.Yhteys;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Sis‰lt‰‰ tietokannan tietojen muuttamisessa tarvittavat metodit.
 * @author Jukka Harju
 */
public class Paivitys {
    private Connection yhteys;

    public Paivitys(Connection avattuYhteys) {
        yhteys = avattuYhteys;
    }

    /**
     * Suorittaa INSERT-, UPDATE- sek‰ DELETE-lauseet.
     * @param  sqlLause    Suoritettava SQL-lause.
     * @return suoritusOk  true, mik‰li lauseen suorittaminen
     *                     onnistui, muutoin false.
     */
    public boolean suoritaSqlLause(String sqlLause) {
        boolean suoritusOk = true;
        Statement statement = null;

        try {
            statement = yhteys.createStatement();
            statement.executeUpdate(sqlLause);
        } catch (SQLException ex) {
            Yhteys.kasitteleVirhe(
                "Virhe SQL-lauseen suorittamisessa.", ex);
            suoritusOk = false;
        } finally {
            try {
                statement.close();
            } catch (SQLException ex) {
                Yhteys.kasitteleVirhe("Virhe sulkemisessa.", ex);
            }
        }

        return suoritusOk;
    }
}
