--Partupdate.sql
--SET ENVIROMENTAL VARIABLES
SET FEEDBACK OFF
SET HEADING OFF
SET VERIFY OFF

--PROMPT BEGINS
COLUMN FOLDIT NEWLINE

PROMPT **********  Update Part Information  **********
PROMPT

ACCEPT  v_part_num NUMBER FORMAT 999 PROMPT 'Enter Part Number to Update (format 999): '
PROMPT

DEFINE v_part_description = 'N/A'
DEFINE v_part_qtyonhand = 'N/A'
DEFINE v_error_message = 'PART NUMBER NOT FOUND!!! Rerun the program!!!'

SET TERMOUT OFF
SPOOL C:\oracle\IS380\partupdateinfo.sql
SELECT 'DEFINE v_part_description = '  foldit, '''' || PART_DESCRIPTION ||'''',
       'DEFINE v_part_qtyonhand = ' foldit, '''' || PART_QTYONHAND ||'''',
       'DEFINE v_error_message = 'foldit, ''''   || 'Part Number Found. Below is the current information:' || ''''
        FROM PART
        WHERE PART_NUM = &v_part_num ;
        
SPOOL OFF
SET TERMOUT ON

START C:\oracle\IS380\partupdateinfo.sql
PROMPT &v_error_message
PROMPT Part Description          : &v_part_description
PROMPT Current Inventory Quantity: &v_part_qtyonhand
PROMPT
PROMPT** Verify part information:                            **
PROMPT** If you DONT want to update OR Part NOT FOUND,       **
PROMPT**    Press [CTRL] [C] twice to ABORT                  **
PAUSE** If you wish to continue and update, press [ENTER]   **

--FIRST UPDATE RESULT FROM ACCEPT STATEMENT
PROMPT Type New Description or press [ENTER] to accept current description
ACCEPT  v_part_description DEFAULT '&v_part_description' PROMPT  '(Current Description: &v_part_description) : '
-- Variable below must be surounded by single quotes because the data type of the column is VARCHAR
UPDATE PART
SET PART_DESCRIPTION = '&v_part_description'
WHERE PART_NUM = &v_part_num ;
PROMPT 

--SECOND UPDAE PROMPT FROM ACCEPT STATEMENT
PROMPT Type New Quantity or press [ENTER] to accept Current Inventory Quantity 
ACCEPT  v_part_qtyonhand NUMBER DEFAULT &v_part_qtyonhand PROMPT '(Current Inventory Quantity : &v_part_qtyonhand) : '
UPDATE PART
SET PART_QTYONHAND = &v_part_qtyonhand
WHERE PART_NUM = &v_part_num ; 

--PROMPTS CREATED TO DISPLAY INFORMATION UPDATED OR CHANGED TO USER
PROMPT 
PROMPT Updated Part Number Information:
PROMPT Part Number               : &v_part_num
PROMPT Part Description          :        &v_part_description
PROMPT Current Inventory Quantity: &v_part_qtyonhand


--RESET ENVIRONMENTAL VARIABLES
SET FEEDBACK ON
SET HEADING ON
SET VERIFY ON

