    
from sql import MySQL


class VenueApi:
    def __init__(self,venue) -> None:
        self.venue = venue
        
    def venue_details(self):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                SELECT * FROM VENUE
                    ''')
        lst=[]
        for row in cursor.fetchall():
            lst.append(self.venue.Venue(id=row.ID,name=row.NAME))
        
 
        return {"data":lst}
    def update_venue_details(self,venue):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   UPDATE VENUE SET ID = '{venue.id}',
                   NAME='{venue.name}'
                   WHERE  ID='{venue.id}'
                   ''')
    
        return {
                "data":venue
                }
    def delete_venue_details(self,venue):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                   DELETE FROM VENUE WHERE ID = '{venue.id}'
                    ''')
    

        return {"data":"okay"}
    def add_venue(self,venue):
        sql = MySQL()
        sql.__enter__()
        cursor = sql.conn.cursor()
        cursor.execute(f'''
                INSERT INTO VENUE
                VALUES
                ('{venue.name}')
                ''')
    
        return {"data":"okay"}
