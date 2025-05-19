# Data Analyst Assessment Solutions

## Overview
Repository containing my SQL solutions for the [Company Name] Data Analyst assessment.

## Files
| File | Description |
|------|-------------|
| `Assessment_Q1.sql` | High-value customers with multiple products |
| `Assessment_Q2.sql` | Transaction frequency analysis |
| `Assessment_Q3.sql` | Account inactivity detection |
| `Assessment_Q4.sql` | Customer Lifetime Value (CLV) estimation |

## Challenges Faced

### 1. Schema Mismatch
- **Issue**: The `is_regular_savings` column didn't exist in my database.
- **Solution**: Used alternative columns like `confirmed_amount > 0` to identify valid accounts.

### 2. Unrealistic Transaction Counts
- **Issue**: Initial queries returned 3,000+ transactions for one user.
- **Fix**: Added `transaction_status = 'success'` filter and date ranges.

### 3. CLV Calculation
- **Challenge**: Handling kobo-to-currency conversion.
- **Approach**: Divided amounts by 100 and used `ROUND()` for precision.

### 4. GitHub Setup
- **Hurdle**: Authentication errors during first push.
- **Resolution**: Switched to SSH keys for secure access.

## How to Run
```bash
-- Example for Q1
mysql -u username -p database_name < Assessment_Q1.sql
```