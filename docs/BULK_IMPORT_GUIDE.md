# 🎯 Bulk Question Import Guide

## Overview

This guide explains how to import thousands of MCQ questions at once using CSV/Excel files instead of entering them one by one.

## 📊 CSV Format

Create a CSV file with the following columns:

```
topic,question,option_a,option_b,option_c,option_d,correct_answer,explanation,difficulty_level
```

## Example CSV Format

```csv
topic,question,option_a,option_b,option_c,option_d,correct_answer,explanation,difficulty_level
Mathematics,What is 2+2?,3,4,5,6,B,Basic addition,Easy
Mathematics,What is the derivative of x²?,2x,x,2,x²,A,Power rule of differentiation,Hard
English,Choose the correct spelling,Occassion,Occasion,Ocasion,Occation,B,Double C and double S,Medium
```

## Column Details

| Column | Required | Format | Example |
|--------|----------|--------|----------|
| `topic` | ✅ Yes | String | "Mathematics", "English", "Physics" |
| `question` | ✅ Yes | String | "What is...?" |
| `option_a` | ✅ Yes | String | "Option A text" |
| `option_b` | ✅ Yes | String | "Option B text" |
| `option_c` | ✅ Yes | String | "Option C text" |
| `option_d` | ✅ Yes | String | "Option D text" |
| `correct_answer` | ✅ Yes | A/B/C/D | "B" |
| `explanation` | ❌ Optional | String | "Explanation text" |
| `difficulty_level` | ❌ Optional | Easy/Medium/Hard | "Easy" |

## 📁 Supported File Formats

- ✅ CSV (.csv)
- ✅ Excel (.xlsx, .xls) - Will be converted to CSV by system
- ✅ JSON (for advanced users)

## 🚀 How to Import

1. Go to Admin Panel → Questions → Bulk Import
2. Select exam type (SSC/HSC/Admission/BCS)
3. Choose your CSV file
4. Preview the data (first 5 rows)
5. Click "Import"
6. Monitor import progress
7. Download error report if any issues

## ⚠️ Common Issues & Solutions

### Issue: "File too large"
**Solution:** Split your CSV into multiple files (max 10MB per file)

### Issue: "Invalid column format"
**Solution:** Ensure correct_answer is exactly one of: A, B, C, D

### Issue: "Duplicate topics"
**Solution:** Use exact same spelling for topics you want grouped together

### Issue: "Encoding error"
**Solution:** Save CSV with UTF-8 encoding (especially for Bangla text)

## 📝 Bulk Import Best Practices

1. **Validate before import:**
   - Check CSV in Excel first
   - Verify all required columns exist
   - Ensure no empty required fields

2. **Use consistent naming:**
   - "Mathematics" not "Math" or "Maths"
   - "Physics" not "Phy"
   - Consistent spelling for same topic

3. **Include explanations:**
   - Helps students understand why answer is correct
   - Improves learning experience

4. **Add difficulty levels:**
   - Helps create adaptive tests
   - Better analytics

## 🔄 Sample Import Workflow

```
1. Prepare 1000 questions in Excel
2. Export as CSV
3. Upload via Admin Panel
4. System processes in background
5. Get confirmation email
6. View report: 950 imported, 50 failed
7. Download error report
8. Fix issues and retry
```

## 📞 Need Help?

Check the error log after each import to identify specific row issues.

---

**Pro Tip:** Start with a small test file (10-20 questions) to validate format before importing thousands!