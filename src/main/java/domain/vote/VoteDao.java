package domain.vote;

import domain.common.BaseDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VoteDao extends BaseDao {
    public void save(Vote vote) {
        final String query = "INSERT INTO vote (user_id, discovery_id, type, date_added) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE type = ? ";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, vote.getUserId());
            statement.setInt(2, vote.getDiscoveryId());
            statement.setString(3, vote.getType().toString());
            statement.setObject(4, vote.getDateAdded());
            statement.setString(5, vote.getType().toString());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int countByDiscovery(int discoveryId){
        final String query ="SELECT (SELECT COUNT(discovery_id) FROM vote WHERE discovery_id =? AND type ='UP') - (SELECT COUNT(discovery_id) FROM vote WHERE discovery_id =? AND type = 'DOWN') AS vote_count";

        try (Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(query)){
            statement.setInt(1,discoveryId);
            statement.setInt(2,discoveryId);
            ResultSet resultSet = statement.executeQuery();
            resultSet.next();
            return resultSet.getInt("vote_count");
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}