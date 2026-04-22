import sys
import pandas as pd
from datetime import datetime
from sqlalchemy import create_engine
from PyQt6.QtWidgets import (QApplication, QMainWindow, QWidget, QVBoxLayout, 
                             QHBoxLayout, QPushButton, QTableWidget, 
                             QTableWidgetItem, QComboBox, QLabel, QMessageBox)
from PyQt6.QtCore import Qt

# --- DATABASE CONFIG ---
DB_CONFIG = {
    "user": "root",
    "password": "password", # Remember to hide this for GitHub
    "host": "127.0.0.1",
    "port": 3306,
    "database": "logistica_lala"
}

class WMSInterface(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Lala WMS - Executive Control Panel")
        self.setMinimumSize(800, 600)
        
        # Database Engine
        self.engine = create_engine(f"mysql+mysqlconnector://{DB_CONFIG['user']}:{DB_CONFIG['password']}@{DB_CONFIG['host']}:{DB_CONFIG['port']}/{DB_CONFIG['database']}")

        # UI Elements
        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.layout = QVBoxLayout(self.central_widget)

        # Header
        self.label = QLabel("Warehouse Inventory Management System")
        self.label.setStyleSheet("font-size: 18px; font-weight: bold; color: #2c3e50;")
        self.layout.addWidget(self.label)

        # Controls Layout
        self.controls_layout = QHBoxLayout()
        self.query_selector = QComboBox()
        self.query_selector.addItems([
            "Full Inventory Summary",
            "Locked Pallets (Quarantine)",
            "High Stock Items (>100 units)"
        ])
        self.btn_run = QPushButton("Run Query")
        self.btn_export = QPushButton("Export to Excel")
        
        # Styling buttons
        self.btn_run.setStyleSheet("background-color: #3498db; color: white; padding: 5px;")
        self.btn_export.setStyleSheet("background-color: #27ae60; color: white; padding: 5px;")

        self.controls_layout.addWidget(self.query_selector)
        self.controls_layout.addWidget(self.btn_run)
        self.controls_layout.addWidget(self.btn_export)
        self.layout.addLayout(self.controls_layout)

        # Data Table
        self.table = QTableWidget()
        self.layout.addWidget(self.table)

        # Events
        self.btn_run.clicked.connect(self.load_data)
        self.btn_export.clicked.connect(self.export_data)

        self.df = pd.DataFrame() # Temporary storage

    def get_query(self):
        selection = self.query_selector.currentText()
        if selection == "Full Inventory Summary":
            return "SELECT SKU, DESCRIPTION, LOTE, SUM(AMOUNT) as TOTAL FROM warehouse_b_inventory GROUP BY SKU, DESCRIPTION, LOTE"
        elif selection == "Locked Pallets (Quarantine)":
            return "SELECT * FROM warehouse_b_inventory WHERE STATUS = 'L'"
        else:
            return "SELECT SKU, SUM(AMOUNT) as TOTAL FROM warehouse_b_inventory GROUP BY SKU HAVING TOTAL > 100"

    def load_data(self):
        try:
            query = self.get_query()
            self.df = pd.read_sql(query, self.engine)
            
            # Setup table dimensions
            self.table.setColumnCount(len(self.df.columns))
            self.table.setRowCount(len(self.df.index))
            self.table.setHorizontalHeaderLabels(self.df.columns)

            # Fill table
            for i in range(len(self.df.index)):
                for j in range(len(self.df.columns)):
                    self.table.setItem(i, j, QTableWidgetItem(str(self.df.iloc[i, j])))
            
            self.table.resizeColumnsToContents()
        except Exception as e:
            QMessageBox.critical(self, "Database Error", str(e))

    def export_data(self):
        if not self.df.empty:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            filename = f"GUI_Report_{timestamp}.xlsx"
            self.df.to_excel(filename, index=False)
            QMessageBox.information(self, "Success", f"Report saved as {filename}")
        else:
            QMessageBox.warning(self, "Warning", "No data to export. Run a query first.")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = WMSInterface()
    window.show()
    sys.exit(app.exec())
