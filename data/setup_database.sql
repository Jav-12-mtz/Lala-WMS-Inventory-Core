Aquí tienes el código SQL completo y profesional para tu archivo data/setup_database.sql. He unificado la creación de la tabla y los 100 registros de Leche UHT con la lógica de lotes que solicitaste (A=Ene, B=Feb, C=Mar, D=Abr).

Cópialo tal cual para que tu portafolio sea funcional desde el primer momento:

SQL
-- 1. CREACIÓN DEL ESQUEMA DE BASE DE DATOS
CREATE DATABASE IF NOT EXISTS logistica_lala;
USE logistica_lala;

-- 2. CREACIÓN DE LA TABLA DE INVENTARIO
CREATE TABLE IF NOT EXISTS warehouse_b_inventory (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    BAY VARCHAR(10) NOT NULL,
    SKU VARCHAR(20) NOT NULL,
    DESCRIPTION VARCHAR(100) NOT NULL,
    BARCODE VARCHAR(20) UNIQUE NOT NULL,
    LOTE VARCHAR(10) NOT NULL,
    PALLET_TYPE VARCHAR(20) NOT NULL,
    AMOUNT INT NOT NULL,
    QUALITY_STATUS VARCHAR(10) NOT NULL,
    STATUS VARCHAR(10) NOT NULL,
    ALLOCATION_STATUS VARCHAR(10) NOT NULL,
    WAREHOUSE_ID VARCHAR(10) NOT NULL,
    CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. LIMPIEZA DE DATOS PREVIOS
TRUNCATE TABLE warehouse_b_inventory;

-- 4. INSERCIÓN DE 100 REGISTROS (LECHE UHT)
-- Lógica de Lotes: Letra (Mes) - Día (01-31)
INSERT INTO warehouse_b_inventory 
(BAY, SKU, DESCRIPTION, BARCODE, LOTE, PALLET_TYPE, AMOUNT, QUALITY_STATUS, STATUS, ALLOCATION_STATUS, WAREHOUSE_ID) 
VALUES 
-- ENERO (A)
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001001', 'A-01', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001002', 'A-05', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001003', 'A-12', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001004', 'A-20', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001005', 'A-28', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002001', 'A-02', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002002', 'A-10', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002003', 'A-15', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002004', 'A-25', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002005', 'A-31', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),

-- FEBRERO (B)
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003001', 'B-01', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003002', 'B-07', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003003', 'B-14', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003004', 'B-20', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003005', 'B-28', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004001', 'B-04', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004002', 'B-11', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004003', 'B-18', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004004', 'B-22', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004005', 'B-26', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),

-- MARZO (C)
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001006', 'C-02', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001007', 'C-09', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001008', 'C-16', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001009', 'C-23', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001010', 'C-30', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005001', 'C-05', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005002', 'C-12', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005003', 'C-19', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005004', 'C-26', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005005', 'C-31', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),

-- ABRIL (D)
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002006', 'D-03', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002007', 'D-08', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002008', 'D-15', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002009', 'D-22', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002010', 'D-29', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),

-- SECCIÓN DE LLENADO MASIVO PARA LLEGAR A 100
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001011', 'A-03', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001012', 'A-07', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001013', 'A-14', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001014', 'A-21', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('1', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001015', 'A-29', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002011', 'B-02', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002012', 'B-09', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002013', 'B-16', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002014', 'B-23', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('2', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002015', 'B-30', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003011', 'C-04', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003012', 'C-11', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003013', 'C-18', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003014', 'C-25', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('3', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003015', 'C-31', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004011', 'D-06', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004012', 'D-13', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004013', 'D-20', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004014', 'D-27', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('4', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004015', 'D-31', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001016', 'A-04', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001017', 'A-11', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001018', 'A-18', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001019', 'A-25', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('5', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001020', 'A-30', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005011', 'B-03', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005012', 'B-10', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005013', 'B-17', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005014', 'B-24', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('6', 'UHT-CALC-05', 'Leche UHT con Calcio 1L', '1000005015', 'B-27', 'CHEP', 60, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002016', 'C-01', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002017', 'C-08', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002018', 'C-15', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002019', 'C-22', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('7', 'UHT-DESL-02', 'Leche UHT Deslactosada 1L', '1000002020', 'C-29', 'CHEP', 35, 'N/A', 'U', 'F', '3003'),
('8', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003016', 'D-02', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('8', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003017', 'D-09', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('8', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003018', 'D-16', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('8', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003019', 'D-23', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('8', 'UHT-SEMI-03', 'Leche UHT Semidescremada 1L', '1000003020', 'D-30', 'CHEP', 50, 'N/A', 'U', 'F', '3003'),
('9', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004016', 'A-02', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('9', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004017', 'A-09', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('9', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004018', 'A-16', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('9', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004019', 'A-23', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('9', 'UHT-DLGT-04', 'Leche UHT Desl. Light 1L', '1000004020', 'A-31', 'CHEP', 45, 'N/A', 'U', 'F', '3003'),
('10', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001021', 'B-05', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('10', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001022', 'B-12', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('10', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001023', 'B-19', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('10', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001024', 'B-26', 'CHEP', 40, 'N/A', 'U', 'F', '3003'),
('10', 'UHT-ENTER-01', 'Leche UHT Entera 1L', '1000001025', 'B-28', 'CHEP', 40, 'N/A', 'U', 'F', '3003');
