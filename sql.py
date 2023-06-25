import pyodbc
class MySQL:
    def __init__(self):
        self.conn = None

    def __enter__(self):
        self.conn = pyodbc.connect('Driver={SQL Server};'
                                   'Server=DESKTOP-FD8825Q\MSSQLSERVER01;'
                                   'Database=MEYEPRO;'
                                   'Trusted_Connection=yes;')
        self.conn.autocommit = True

    def __exit__(self, *args):
        if self.conn:
            self.conn.close()
            self.conn = None