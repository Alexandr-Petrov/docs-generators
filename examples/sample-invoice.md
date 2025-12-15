---
# Invoice Details
invoice_title: INVOICE
invoice_number: INV-2024-001
invoice_date: December 10, 2025
due_date: January 10, 2026

# From (Your Information)
from_name: John Doe Consulting
from_address: 123 Business Avenue
from_city: San Francisco, CA 94102
from_email: billing@johndoe.com
from_phone: +1 (555) 123-4567
from_tax_id: 12-3456789

# To (Client Information)
to_name: Acme Corporation
to_address: 456 Corporate Blvd, Suite 200
to_city: New York, NY 10001
to_email: accounts@acmecorp.com
to_tax_id: 98-7654321

# Description
description: |
  Thank you for your business! This invoice covers software development services 
  provided during November 2025.

# Items
items:
  - description: Backend API Development
    details: REST API implementation with authentication
    quantity: 40
    rate: 150
    amount: 6000
  
  - description: Database Design
    details: PostgreSQL schema design and optimization
    quantity: 16
    rate: 150
    amount: 2400
  
  - description: DevOps Setup
    details: CI/CD pipeline configuration
    quantity: 12
    rate: 150
    amount: 1800
  
  - description: Code Review & Testing
    details: QA and code quality improvements
    quantity: 8
    rate: 150
    amount: 1200

# Calculations
currency: USD
subtotal: 11400
tax_rate: 8.5
tax_amount: 969
discount: 0
total: 12369

# Additional Information
notes: |
  Please make payment within 30 days. Late payments may incur a 1.5% monthly interest charge.
  All work has been completed as per the agreed scope of work.

payment_terms: |
  Net 30 days from invoice date.

payment_methods: |
  - Bank Transfer: Account #1234567890, Routing #987654321
  - PayPal: billing@johndoe.com
  - Check: Payable to "John Doe Consulting"
---
