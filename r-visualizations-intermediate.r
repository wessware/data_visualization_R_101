{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "913c7c1b",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:55.603391Z",
     "iopub.status.busy": "2023-02-21T07:50:55.601285Z",
     "iopub.status.idle": "2023-02-21T07:50:57.054594Z",
     "shell.execute_reply": "2023-02-21T07:50:57.052613Z"
    },
    "papermill": {
     "duration": 1.463472,
     "end_time": "2023-02-21T07:50:57.057973",
     "exception": false,
     "start_time": "2023-02-21T07:50:55.594501",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "32be5243",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.098490Z",
     "iopub.status.busy": "2023-02-21T07:50:57.068052Z",
     "iopub.status.idle": "2023-02-21T07:50:57.156235Z",
     "shell.execute_reply": "2023-02-21T07:50:57.154428Z"
    },
    "papermill": {
     "duration": 0.097383,
     "end_time": "2023-02-21T07:50:57.159589",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.062206",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "loan_data <- read.table(file ='/kaggle/input/r-visualization-datasets/synthesized_loan_data.csv', header=TRUE, sep=',')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "116451c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.170901Z",
     "iopub.status.busy": "2023-02-21T07:50:57.169357Z",
     "iopub.status.idle": "2023-02-21T07:50:57.200797Z",
     "shell.execute_reply": "2023-02-21T07:50:57.197805Z"
    },
    "papermill": {
     "duration": 0.040524,
     "end_time": "2023-02-21T07:50:57.204089",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.163565",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t4000 obs. of  12 variables:\n",
      " $ Gender           : int  1 1 0 1 1 1 1 2 1 1 ...\n",
      " $ Married          : int  1 1 0 1 1 1 1 0 1 1 ...\n",
      " $ Dependents       : num  1.015 2.794 1.021 0.968 1.929 ...\n",
      " $ Education        : int  0 1 0 0 0 0 0 1 0 1 ...\n",
      " $ Self_Employed    : int  0 2 1 0 0 1 1 0 0 0 ...\n",
      " $ ApplicantIncome  : int  60 299 497 35 340 217 493 118 429 371 ...\n",
      " $ CoapplicantIncome: num  2263.4 207.1 -222.1 1874.2 47.1 ...\n",
      " $ LoanAmount       : num  120.3 97.3 99 141.1 322.9 ...\n",
      " $ Loan_Amount_Term : num  362 186 361 360 360 ...\n",
      " $ Credit_History   : num  1 0.994 0.999 0.999 0.98 ...\n",
      " $ Property_Area    : int  2 1 0 2 0 1 0 0 1 0 ...\n",
      " $ Loan_Status      : int  1 1 1 1 1 1 0 0 1 1 ...\n"
     ]
    }
   ],
   "source": [
    "str(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b620e027",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.216021Z",
     "iopub.status.busy": "2023-02-21T07:50:57.214438Z",
     "iopub.status.idle": "2023-02-21T07:50:57.238467Z",
     "shell.execute_reply": "2023-02-21T07:50:57.235957Z"
    },
    "papermill": {
     "duration": 0.033633,
     "end_time": "2023-02-21T07:50:57.241987",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.208354",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>4000</li><li>12</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 4000\n",
       "\\item 12\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 4000\n",
       "2. 12\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 4000   12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "8787e3db",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.254133Z",
     "iopub.status.busy": "2023-02-21T07:50:57.252535Z",
     "iopub.status.idle": "2023-02-21T07:50:57.285286Z",
     "shell.execute_reply": "2023-02-21T07:50:57.283011Z"
    },
    "papermill": {
     "duration": 0.042074,
     "end_time": "2023-02-21T07:50:57.288474",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.246400",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Gender'</li><li>'Married'</li><li>'Dependents'</li><li>'Education'</li><li>'Self_Employed'</li><li>'ApplicantIncome'</li><li>'CoapplicantIncome'</li><li>'LoanAmount'</li><li>'Loan_Amount_Term'</li><li>'Credit_History'</li><li>'Property_Area'</li><li>'Loan_Status'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Gender'\n",
       "\\item 'Married'\n",
       "\\item 'Dependents'\n",
       "\\item 'Education'\n",
       "\\item 'Self\\_Employed'\n",
       "\\item 'ApplicantIncome'\n",
       "\\item 'CoapplicantIncome'\n",
       "\\item 'LoanAmount'\n",
       "\\item 'Loan\\_Amount\\_Term'\n",
       "\\item 'Credit\\_History'\n",
       "\\item 'Property\\_Area'\n",
       "\\item 'Loan\\_Status'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Gender'\n",
       "2. 'Married'\n",
       "3. 'Dependents'\n",
       "4. 'Education'\n",
       "5. 'Self_Employed'\n",
       "6. 'ApplicantIncome'\n",
       "7. 'CoapplicantIncome'\n",
       "8. 'LoanAmount'\n",
       "9. 'Loan_Amount_Term'\n",
       "10. 'Credit_History'\n",
       "11. 'Property_Area'\n",
       "12. 'Loan_Status'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Gender\"            \"Married\"           \"Dependents\"       \n",
       " [4] \"Education\"         \"Self_Employed\"     \"ApplicantIncome\"  \n",
       " [7] \"CoapplicantIncome\" \"LoanAmount\"        \"Loan_Amount_Term\" \n",
       "[10] \"Credit_History\"    \"Property_Area\"     \"Loan_Status\"      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "1d69360c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.300696Z",
     "iopub.status.busy": "2023-02-21T07:50:57.299130Z",
     "iopub.status.idle": "2023-02-21T07:50:57.338493Z",
     "shell.execute_reply": "2023-02-21T07:50:57.336015Z"
    },
    "papermill": {
     "duration": 0.048688,
     "end_time": "2023-02-21T07:50:57.341579",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.292891",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Gender</th><th scope=col>Married</th><th scope=col>Dependents</th><th scope=col>Education</th><th scope=col>Self_Employed</th><th scope=col>ApplicantIncome</th><th scope=col>CoapplicantIncome</th><th scope=col>LoanAmount</th><th scope=col>Loan_Amount_Term</th><th scope=col>Credit_History</th><th scope=col>Property_Area</th><th scope=col>Loan_Status</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td> 1.015491399</td><td>0</td><td>0</td><td> 60</td><td>2263.42674</td><td>120.26457</td><td>362.0349</td><td> 0.99961766</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td> 2.793550141</td><td>1</td><td>2</td><td>299</td><td> 207.07874</td><td> 97.33355</td><td>185.8551</td><td> 0.99444959</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0</td><td>0</td><td> 1.020575435</td><td>0</td><td>1</td><td>497</td><td>-222.10515</td><td> 98.95750</td><td>361.4115</td><td> 0.99913174</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td> 0.967627816</td><td>0</td><td>0</td><td> 35</td><td>1874.20080</td><td>141.12198</td><td>360.4270</td><td> 0.99927334</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>1</td><td> 1.929354123</td><td>0</td><td>0</td><td>340</td><td>  47.08091</td><td>322.93678</td><td>360.0139</td><td> 0.97988152</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1</td><td>1</td><td> 1.019926907</td><td>0</td><td>1</td><td>217</td><td>4004.66380</td><td>113.08243</td><td>141.0226</td><td> 0.99551361</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>1</td><td>1</td><td> 1.017309121</td><td>0</td><td>1</td><td>493</td><td> 123.33179</td><td> 71.73101</td><td>454.3824</td><td>-0.02227312</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>2</td><td>0</td><td> 0.079434043</td><td>1</td><td>0</td><td>118</td><td>2178.91362</td><td> 86.84224</td><td>359.6003</td><td> 0.98571950</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>1</td><td>1</td><td> 1.006438176</td><td>0</td><td>0</td><td>429</td><td>  72.06035</td><td>247.38132</td><td>360.7803</td><td> 1.00021215</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>1</td><td>1</td><td>-0.004120586</td><td>1</td><td>0</td><td>371</td><td>1848.17048</td><td> 57.52351</td><td>358.8623</td><td> 0.99498590</td><td>0</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & Gender & Married & Dependents & Education & Self\\_Employed & ApplicantIncome & CoapplicantIncome & LoanAmount & Loan\\_Amount\\_Term & Credit\\_History & Property\\_Area & Loan\\_Status\\\\\n",
       "  & <int> & <int> & <dbl> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 1 &  1.015491399 & 0 & 0 &  60 & 2263.42674 & 120.26457 & 362.0349 &  0.99961766 & 2 & 1\\\\\n",
       "\t2 & 1 & 1 &  2.793550141 & 1 & 2 & 299 &  207.07874 &  97.33355 & 185.8551 &  0.99444959 & 1 & 1\\\\\n",
       "\t3 & 0 & 0 &  1.020575435 & 0 & 1 & 497 & -222.10515 &  98.95750 & 361.4115 &  0.99913174 & 0 & 1\\\\\n",
       "\t4 & 1 & 1 &  0.967627816 & 0 & 0 &  35 & 1874.20080 & 141.12198 & 360.4270 &  0.99927334 & 2 & 1\\\\\n",
       "\t5 & 1 & 1 &  1.929354123 & 0 & 0 & 340 &   47.08091 & 322.93678 & 360.0139 &  0.97988152 & 0 & 1\\\\\n",
       "\t6 & 1 & 1 &  1.019926907 & 0 & 1 & 217 & 4004.66380 & 113.08243 & 141.0226 &  0.99551361 & 1 & 1\\\\\n",
       "\t7 & 1 & 1 &  1.017309121 & 0 & 1 & 493 &  123.33179 &  71.73101 & 454.3824 & -0.02227312 & 0 & 0\\\\\n",
       "\t8 & 2 & 0 &  0.079434043 & 1 & 0 & 118 & 2178.91362 &  86.84224 & 359.6003 &  0.98571950 & 0 & 0\\\\\n",
       "\t9 & 1 & 1 &  1.006438176 & 0 & 0 & 429 &   72.06035 & 247.38132 & 360.7803 &  1.00021215 & 1 & 1\\\\\n",
       "\t10 & 1 & 1 & -0.004120586 & 1 & 0 & 371 & 1848.17048 &  57.52351 & 358.8623 &  0.99498590 & 0 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 12\n",
       "\n",
       "| <!--/--> | Gender &lt;int&gt; | Married &lt;int&gt; | Dependents &lt;dbl&gt; | Education &lt;int&gt; | Self_Employed &lt;int&gt; | ApplicantIncome &lt;int&gt; | CoapplicantIncome &lt;dbl&gt; | LoanAmount &lt;dbl&gt; | Loan_Amount_Term &lt;dbl&gt; | Credit_History &lt;dbl&gt; | Property_Area &lt;int&gt; | Loan_Status &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 1 |  1.015491399 | 0 | 0 |  60 | 2263.42674 | 120.26457 | 362.0349 |  0.99961766 | 2 | 1 |\n",
       "| 2 | 1 | 1 |  2.793550141 | 1 | 2 | 299 |  207.07874 |  97.33355 | 185.8551 |  0.99444959 | 1 | 1 |\n",
       "| 3 | 0 | 0 |  1.020575435 | 0 | 1 | 497 | -222.10515 |  98.95750 | 361.4115 |  0.99913174 | 0 | 1 |\n",
       "| 4 | 1 | 1 |  0.967627816 | 0 | 0 |  35 | 1874.20080 | 141.12198 | 360.4270 |  0.99927334 | 2 | 1 |\n",
       "| 5 | 1 | 1 |  1.929354123 | 0 | 0 | 340 |   47.08091 | 322.93678 | 360.0139 |  0.97988152 | 0 | 1 |\n",
       "| 6 | 1 | 1 |  1.019926907 | 0 | 1 | 217 | 4004.66380 | 113.08243 | 141.0226 |  0.99551361 | 1 | 1 |\n",
       "| 7 | 1 | 1 |  1.017309121 | 0 | 1 | 493 |  123.33179 |  71.73101 | 454.3824 | -0.02227312 | 0 | 0 |\n",
       "| 8 | 2 | 0 |  0.079434043 | 1 | 0 | 118 | 2178.91362 |  86.84224 | 359.6003 |  0.98571950 | 0 | 0 |\n",
       "| 9 | 1 | 1 |  1.006438176 | 0 | 0 | 429 |   72.06035 | 247.38132 | 360.7803 |  1.00021215 | 1 | 1 |\n",
       "| 10 | 1 | 1 | -0.004120586 | 1 | 0 | 371 | 1848.17048 |  57.52351 | 358.8623 |  0.99498590 | 0 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "   Gender Married Dependents   Education Self_Employed ApplicantIncome\n",
       "1  1      1        1.015491399 0         0              60            \n",
       "2  1      1        2.793550141 1         2             299            \n",
       "3  0      0        1.020575435 0         1             497            \n",
       "4  1      1        0.967627816 0         0              35            \n",
       "5  1      1        1.929354123 0         0             340            \n",
       "6  1      1        1.019926907 0         1             217            \n",
       "7  1      1        1.017309121 0         1             493            \n",
       "8  2      0        0.079434043 1         0             118            \n",
       "9  1      1        1.006438176 0         0             429            \n",
       "10 1      1       -0.004120586 1         0             371            \n",
       "   CoapplicantIncome LoanAmount Loan_Amount_Term Credit_History Property_Area\n",
       "1  2263.42674        120.26457  362.0349          0.99961766    2            \n",
       "2   207.07874         97.33355  185.8551          0.99444959    1            \n",
       "3  -222.10515         98.95750  361.4115          0.99913174    0            \n",
       "4  1874.20080        141.12198  360.4270          0.99927334    2            \n",
       "5    47.08091        322.93678  360.0139          0.97988152    0            \n",
       "6  4004.66380        113.08243  141.0226          0.99551361    1            \n",
       "7   123.33179         71.73101  454.3824         -0.02227312    0            \n",
       "8  2178.91362         86.84224  359.6003          0.98571950    0            \n",
       "9    72.06035        247.38132  360.7803          1.00021215    1            \n",
       "10 1848.17048         57.52351  358.8623          0.99498590    0            \n",
       "   Loan_Status\n",
       "1  1          \n",
       "2  1          \n",
       "3  1          \n",
       "4  1          \n",
       "5  1          \n",
       "6  1          \n",
       "7  0          \n",
       "8  0          \n",
       "9  1          \n",
       "10 1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(loan_data, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "4a4c7eef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.354402Z",
     "iopub.status.busy": "2023-02-21T07:50:57.352866Z",
     "iopub.status.idle": "2023-02-21T07:50:57.372334Z",
     "shell.execute_reply": "2023-02-21T07:50:57.369983Z"
    },
    "papermill": {
     "duration": 0.02913,
     "end_time": "2023-02-21T07:50:57.375426",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.346296",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Gender'</li><li>'Married'</li><li>'Dependents'</li><li>'Education'</li><li>'Self_Employed'</li><li>'ApplicantIncome'</li><li>'CoapplicantIncome'</li><li>'LoanAmount'</li><li>'Loan_Amount_Term'</li><li>'Credit_History'</li><li>'Property_Area'</li><li>'Loan_Status'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Gender'\n",
       "\\item 'Married'\n",
       "\\item 'Dependents'\n",
       "\\item 'Education'\n",
       "\\item 'Self\\_Employed'\n",
       "\\item 'ApplicantIncome'\n",
       "\\item 'CoapplicantIncome'\n",
       "\\item 'LoanAmount'\n",
       "\\item 'Loan\\_Amount\\_Term'\n",
       "\\item 'Credit\\_History'\n",
       "\\item 'Property\\_Area'\n",
       "\\item 'Loan\\_Status'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Gender'\n",
       "2. 'Married'\n",
       "3. 'Dependents'\n",
       "4. 'Education'\n",
       "5. 'Self_Employed'\n",
       "6. 'ApplicantIncome'\n",
       "7. 'CoapplicantIncome'\n",
       "8. 'LoanAmount'\n",
       "9. 'Loan_Amount_Term'\n",
       "10. 'Credit_History'\n",
       "11. 'Property_Area'\n",
       "12. 'Loan_Status'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Gender\"            \"Married\"           \"Dependents\"       \n",
       " [4] \"Education\"         \"Self_Employed\"     \"ApplicantIncome\"  \n",
       " [7] \"CoapplicantIncome\" \"LoanAmount\"        \"Loan_Amount_Term\" \n",
       "[10] \"Credit_History\"    \"Property_Area\"     \"Loan_Status\"      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "9a74004c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.388748Z",
     "iopub.status.busy": "2023-02-21T07:50:57.387173Z",
     "iopub.status.idle": "2023-02-21T07:50:57.402348Z",
     "shell.execute_reply": "2023-02-21T07:50:57.400582Z"
    },
    "papermill": {
     "duration": 0.025115,
     "end_time": "2023-02-21T07:50:57.405524",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.380409",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "loan_discrete = loan_data[c('Gender','Married','Dependents','Education','Self_Employed','Credit_History','Property_Area','Loan_Status')]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "e8df91dd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.419132Z",
     "iopub.status.busy": "2023-02-21T07:50:57.417532Z",
     "iopub.status.idle": "2023-02-21T07:50:57.431237Z",
     "shell.execute_reply": "2023-02-21T07:50:57.429461Z"
    },
    "papermill": {
     "duration": 0.023397,
     "end_time": "2023-02-21T07:50:57.433763",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.410366",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "loan_continous = loan_data[c('ApplicantIncome','CoapplicantIncome','LoanAmount','Loan_Amount_Term','Credit_History')]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "44643795",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:57.446834Z",
     "iopub.status.busy": "2023-02-21T07:50:57.445235Z",
     "iopub.status.idle": "2023-02-21T07:50:57.994306Z",
     "shell.execute_reply": "2023-02-21T07:50:57.992302Z"
    },
    "papermill": {
     "duration": 0.558205,
     "end_time": "2023-02-21T07:50:57.996857",
     "exception": false,
     "start_time": "2023-02-21T07:50:57.438652",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n7MCanupNBECy+O6fzr30yv6Jh51x6PbVnoXREHZUR6a2IUmSZwYKzdns4Jbl/flsW21VhwIY\nv/qeefjKy+be8NsVBxzxwfPffXB9mlZ7IkZD2FEduaZpSbLw4bUDO9Q9G3aL1g5M2K+tulMB\njE+rF9/ysVO/lJ122IVfnTmlw/sKNmM+PEF11LcdtG1t9me3Lxu82d91312r+/aa4dcmAYy1\nYqH7/NPm1b1x9ryzTlB1mztX7KiStPbUI6Z+/Ko5N2/ziV3a+3/05S80bvPGmds3V3ssgHGn\ne9k1f+zunzWt8Z677x7aWNMweY9d/BRl8yPsqJrJ7zrvpN5L5l981vKedNLuB5x3zvEuIAOM\nvdWP/CVJkm987vx1N7bucPq3vuz32G1+0qLfkw4AEIJLJAAAQQg7AIAghB0AQBDCDgAgCGEH\nABCEsAMACELYAQAEIeyA8afY+5OvXfC2g/5p6y0n1Obqt3z5Kw94y7H/9YN7Kv20qxafmabp\nMQ+vqPQTAeOWb54Axpd87+LjD5z+jV8vbdx66mFvOXK7ttzSxY/deuN3Tvrpt/7rqM/c/e1P\n1qbVHhFgtIQdMJ4UB075572v+u2KIz/97SvPOKo5+2zE9a969NyZh5w7/z/fNO3Nt56+Z3Vn\nBBg1P4oFxpE/X/ueL9379O6n/OS7Zx09VHVJkuRaJ8259jd7t9Tecf4xfRv8PYvFnv7CRh3z\nhQoDnfmKPgEQhbADxpGvffzGbO3Lvn/Bm168lKnZ8ic3/fyGH13WnX++7NYsXnjKUW9+xVZt\ndU1bTN3z4E9f8dOhgpv/mo4JO5619Jfz9tqxvaE227Tldq879L03/7Vr3X3+Zv5nZ+w9uaW+\ndsttdjrqI5cs6/uH/iux8yRJvjFly/ZJF/d23vWeA3durttiTd73egPr50exwHhRHHjm80tW\ntU78wqvqsy95h5fv+4aXr3Oz68nr93jNvz+ebnfMrOMnd2R/d+v35pz4luvv+MZvv3nc4B36\nVt3+T4ctnPjvJ138z1Ofvv/GC6+4+t/2enrVsv8Z3Pv9Xz5qn5MX1G+559HHf6xj4K8//Pon\n9rltx5HvPEmSwsCK9+5x6PL9j71g7uyGjLf+Aesn7IDxom/Nvf2FYsvkaetuXPXnb3zmK39a\nd8trZp85c5umJEkuetP/ezydfNvj907fsj5JkiT57PUf2/PtX5x1/tlvP2PihCRJejp/uf2c\nWxeefUCSJEly0t7LJ739uz/9RWfvIW11+Z5HDvmPaxtf/ta7Fl23S0suSZKzz5z12lcf+sxz\nz7LenSdJsnrJ+Z1z7/75yXtV6ogA8RQBxoeeZ25KkmS7A29cd+MTtx76glfFt963rFgs9nc9\nkE3TaR+7a90793beliTJtFPvKhaL35m6ZSbb+GRvfmj1sWsPSpLkuqe7i8Xi0v89IkmSw298\nfN2H33XqtCRJ3v3Q8vXuvFgsXvnqLdJM/VN9+SLAiHmPHTBe5Jr2qMukqx9buO7GbQ+4YegF\ncdWSC4e296y4IV8s/v4L+6TrqGs7IEmSlb9fOXifmsZdt6l9/lU0rXn+p6XLfvWXJEmO2qtj\n3eeaNGvPke88SZLa5j1elvMqDWwAP4oFxotMbqsTt22+7Im5v+uas3tT7sV3WPng7evcuzZJ\nkmmfuPLzB2/7grvVTdhj8D/S9CV28uyjazJJkrzgfXGZ+vaR7zxJkjTTVOrPA/Aiwg4YRz78\n+QMuPfon7/74//xh3uEvXCv2XfDB24Zu1W/xL9n0lIHOKW9+8z8PbRxY+9B1P/rd1rs3rveJ\nttr/VUly1/z7lh85Y/uhjX+75TcbZecAw3GRHxhHJv77/PdPaXvw8ncede6C1ev8ApF879LP\nznzt5X/uHdpSUz95zs5bLLr6vbf8rXto43c+9G9HH3304yN44ezY7TMvq83e9N6PPNw1MLil\nb+XvTvzEvRtl5wDDccUOGEfSTNO8u37ZOf3gBWcd9eN5nz7szfvv2FH7+IN/+M2v/ndZ/W7f\nve8379ljt6E7n/LTeV999TGHTdr17Ue97bU7bfHALxZc/fM/TTvu6mNftv6Latn6V/38onfs\nPvt7e75q+rHvOfRlyVM/uerqlfu+O7nxyvJ3DjAcYQeML7Wte3zv90u+/6XPfO07P7jt+m+t\n7K/Z/pW7/Ospl/znGSdsV5dd8v5j822Dv38kaX7Fv99//4TTTvvMD7//9ev7aie+euezv3rD\nme9/4adoh7Pbh7/76y0v+M+Lvv7teZ9NW7Z507svuupzB7c0X7lRdg7wktJi0W8zBwCIwLs5\nAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQd\nAEAQwg4AIIj/D+op9CJBjqXnAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = loan_data) +\n",
    "  geom_bar(mapping = aes(x = Gender))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "3c715aff",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:58.011508Z",
     "iopub.status.busy": "2023-02-21T07:50:58.009827Z",
     "iopub.status.idle": "2023-02-21T07:50:58.303456Z",
     "shell.execute_reply": "2023-02-21T07:50:58.300353Z"
    },
    "papermill": {
     "duration": 0.304654,
     "end_time": "2023-02-21T07:50:58.306916",
     "exception": false,
     "start_time": "2023-02-21T07:50:58.002262",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh\n7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAAC\nIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAA\nAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACkar1AqqrsbExkago\nXpPJZFNTU6lU2lRL4k2SyWQURdlstq6urtZrCVbv/wV2mM1ca2trmdk4juM4Ln8fKhHHcRRF\niUTCJlfPJjmNi8VimdnAw667u7vCJmtsbOzu7s7n85tqSbxJb3z39PR0d3fXei3BymazxWLR\nDrOZ6+zsLDObyWSSyeS6deuGbD3DTSaTqaurK5VK5f9DUIlkMpnNZivc4VKplE6n+5sNPOzy\n+XyFTdbQ0NDT05PL5TbVkniThoaGKIry+bzsqJ5MJlMoFOwwm7nyp2gikYjj2GlcPYlEojfs\nbHL1pNPpbDZb1R32HjsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgECkhuZpSvmVP7jxhp/c/9jyrsSosTt+5ITTPjh52yiKoqh477w5P1z48AtrkhN3\ne9/Us6eNa+hbUn9TZR4CADB8DdEVu59dMX3ur175yLRzvnrpBYeO754z48w7X1gbRdFzd1w0\na/4De3/0lEs+e2LTn35+4eduKL7+kP6myjwEAGA4G4qwK3S/cP2ivx7wpYs/fOg+O07c42Nn\nXjGlJXnnnCeiUu4b858af9zMYw7fZ9J7Djj3yrM6Xvrp3Bc7oijqd6rMQwAAhrchCbuuP2+/\nww4fGjfi9YF48lZ1Pe1ru1ctfL6rMGXKmN7Rupb9JzdlFt37chRF/U2VeQgAwDA3FO9Oy2x1\nwNVXH9B3s2ft0zctXbv9tJ1zHd+NomjXhnTf1C4NqbsfXxUdH+U6Hn/bqdzBbz8eHf/azcce\ne+xHP/pR3+wJJ5ywzTbbVLL4RCJRX1+fyWQqOQhlJBKJKIoymUzvH6iGVCqVTCbtMJu5pqam\nMrOpVCqRSJS/D5VIpVJRFMVxbJOrJ5FIVL7DxWK596AN9ccOljz049nX3NQz7sgLj9guv6Qj\niqKRqTf+smlLJ/Nru6IoKna//VR/428cf8mS73//+303P/rRj44dO7bCNau6IZBKpXq/p1A9\ndpjNXH19/Sa5D5WI49gmV1uFO1woFMrMDt03+tzKZ266dvZPHllx0NGnX/7JQ+vjeE0mG0XR\nynyxKZnsvc/ynkKyJRNFUaKfqf7G+56lpaVll1126buZTqfz+Xwly04mk8VisVQqVXIQykgm\nk3EcF4vF8v8EoRLJZLJUKtlhNnPlv133Xuoo/1calUgkEr3X9Sv8e5My4jhOJpMV7nCxWEy+\nXkFvNURht2bJz8+b/s3k7kdeeeOJO7e9Fqrpxt2jaOEz6/Jj615b3+J1+a32bykzVeYhvQ48\n8MADDzyw72Z7e3t7e3slK29tbe3o6MjlcpUchDJaW1uTyWRXV1dnZ2et1xKs5ubmQqFgh9nM\nlf92nc1m0+n06tWrh2w9w002m21sbCwWixX+vUkZ6XR6xIgRle9wW1tbf1ND8Z6bUrHz8gvm\n1B12zpyLT+2ruiiK6lsOGZ1J/vS+Zb03ezoefXBNbq/Dty0zVeYhAADD3FBcsetcNvfJzp5p\nuzcseuihN544O2HPSS3Tj574+VtmLBh1/qTWnruu+3rDqMNO3K4piqIozvQ31e9DAACGt6EI\nuzV//HMURTd/9fL1B0eM/eJt1+094djLzui+et6si5d3xePffdBlM0/pu4TY31SZhwAADGdx\n2B8LaG9vr/Atit5jV22977Hr7Oz0DrDqGch77M4555whWw+8rdmzZ5eZ9R67aut7j92KFStq\nvZZg9b7Hbvny5RUep8bvsQMAYAgIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgECkar2A6kokEslkspIjxHFc+UEoI47jaFP8l6IMpzFbhPKnaCKRiOPYaVw9\niUQiiiKbXFW9m1zhDpdKpTKzgYddY2Nj5SdoU1PTJlkMZdTX19fX19d6FYGzw2zmWltbN8l9\nqEQcxza52irc4UKhUGY28LBbu3ZtPp+v5Aitra0dHR25XG5TLYk3aWlpSSaT69at6+zsrPVa\ngtXc3FwoFOwwm7nly5eXmc1ms+l0evXq1UO2nuEmm802NDQUi8WVK1fWei3BSqfTzc3NK1as\nqPA4I0eO7G8q8LArlUrlr1gO8AgVHoQNsslV5TRmi1D+FHUaV1vf3trk6und26rusA9PAAAE\nQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEA\nBELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgB\nAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELY\nAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC\n2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAEQtgBAARC2AEABELYAQAE\nQtgBAARC2AEABELYAQAEQtgBAARC2AEABCJV6wWE4Jxzzqn1EhjuZs+eXeslAFB7rtgBAARC\n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\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQqVovoLqampqSyWQlR4jjuLm5\neVOtB6pk5MiRZWbjOI6iKJvNDtVyYDDKn8ZRFMVxvMH7UKFEImGTq6ry07hQKJSZDTzs1q1b\nV/7r36ARI0asW7eup6dnUy0JqmHVqlVlZhsbGwuFQldX15CtBwah/GlcV1eXTqfXrl07ZOsZ\nburq6rLZbKlUKv8fgkqkUqnGxsYKd7hUKrW2tvb7FJUcevNXKBTy+XwlRyiVSpUfBKqt/Cla\nLBaLxaLTmM1c+VM0nU47jasqnU5HUVQqlWxy9fS+flLVHfYeOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQKRqvYBBKN47b84PFz78wprkxN3eN/Xs\naeMatsSvAoBN7Jxzzqn1EhjuZs+eXdsFbHlX7J6746JZ8x/Y+6OnXPLZE5v+9PMLP3dDsdZL\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = loan_data) +\n",
    "  geom_bar(mapping = aes(x = Married))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "7c4235ce",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:58.322198Z",
     "iopub.status.busy": "2023-02-21T07:50:58.320527Z",
     "iopub.status.idle": "2023-02-21T07:50:59.336657Z",
     "shell.execute_reply": "2023-02-21T07:50:59.334823Z"
    },
    "papermill": {
     "duration": 1.0264,
     "end_time": "2023-02-21T07:50:59.339131",
     "exception": false,
     "start_time": "2023-02-21T07:50:58.312731",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nO3de5zc87348e/M7H2TzeaiRSiSaELcoj2KcnJccmhP9ThK3SPRuhStXhQth9St\nrbpVSynHpW1IqB8tdTlFSRV1UFVFUC3qFrnKZrPZ2/z+GNaaZGcnkcxk3vt8/tHHzvf7nZ3P\n5/v5drwyOzubymazCQAAlS9d7gEAALB6CDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAgqgq9wBWvwULFpR7CH2qq6urra3t6upqaWkp91gqQ0NDQ1dX17Jly8o9kMowZMiQJEla\nW1s7OjrKPZYKkE6nBw8e/Pbbb/uc9mLU1NTU19dns9m333673GOpDHV1dalUaunSpeUeSGUY\nPHhwOp1ua2vzhF+MoUOH9rUrYNh1dXWVewiFpNPp7u7utXyQa49UKpWs9Wu69kin00mSZLNZ\nZ6xI6XS6q6tL2BUpnU67ulaW01WkVCqVewZzxj4gP4oFAAhC2AEABCHsAACCEHYAAEEIOwCA\nIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQ\nhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACC\nEHYAAEFUlfjxrvnSYXVnXHbAOvUr2tl934xLb531+CuLM+O22G7Kl6eOaqgqYhcAAElS2lfs\nss///sqbX1vYmc2ucPeLN5164cyHtt/niNO/OnnQ3+455WuXdxexCwCAnBK97jXnoYtO+tED\n81ra+zwi237BzGdGH3jefruPTpJkzLmp/SafO/3VKYeObCy0CwCAd5XoFbvm8fudcsb3zvv+\nSX0dsGzRrJfbuiZNGpm7Wdu804RBNY/d90bhXQAA9CjRK3Y1TSPHNCVd7XV9HdC+5MkkSTZv\nqO7ZsllD1Z1PLkoOLrQr55prrrnnnntyX2cymSuvvHINzGD1SKfTSZJkMpnm5uZyj6UyZDKZ\nqqqqmpqacg+kkjQ0NNTXr/BtrLxPKpVKkmTIkCHlHkhlyD19pVIpT19Fyp0xp6tIudNVV1fn\nCb9f3d2F3o+2tvwKQveyJUmSDK967xXEEdWZzpa2wrty3nzzzWeeeSb3dVVVVVVVKSZ10EEH\nleBRcq677rrcI+a+GGhSqVTu//CB5S6n6667rpTXVZ7cow/Aa6w0zxirXc9i5b7o+d+eA3r2\nlm2IReg9yKhXYJFPX8vPvfeWvKeIwkuflPvJZG1W4Mz09X+Z5VchWdHqJCW8hru6ugrsXVue\n0dI19UmSLOjsHpTJ5LbM6+jKNNcU3pWz9dZb90wynU63tbUlsfTMKN7U+lVTU9Pd3d3Z2Vnu\ngZRCedc39+gD6hpLpVK1tbWVO+W8Z4a8iVTEvHoPMt4VWFVVlUqlOjo6ijx++bn3taaFl36F\nW8gpcGb62tXvKuTtKsHJ7+7ubmho6Gvv2hJ21Y1bJsms2Us7N6x9p96eX9o5ZKfmwrty9txz\nzz333LPn5ty5c0s48FJoaWnJ+2LgaGpq6uzsbG1tLfdASqG865t79AF1jWUymdra2iVLlmT7\n+FX9tVzeM0Pe2lXEUvYeZLwrsLGxMZVKFT+j5Y/sa00LL/0Kt5BT4Mz0tavfVcjbVZqTXyDs\n1pafcNU177J+TeauB+bkbnYseeKRxe3b7r5u4V0AAPQoc9i9+MtfXP2zW5MkSVI1J+w77oVr\npt392OzXX3zqqtPOb1hvt8kbDOpnFwAA7yrzj2JfvfeO2+ZvMHXyXkmSjNn/rGOWXTTjwtPm\ntaVGbz3xrDOO6KnOArsAAMgpadhlajb49a9/3XvLzpdO37nnRioz6bBvTDpsRfcssAsAgCRJ\nyv6jWAAAVhdhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLAD\nAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYA\nAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4A\nIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEA\nBCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCA\nIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQ\nhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIIQdAEAQwg4AIAhhBwAQhLADAAhC2AEABCHsAACC\n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\nMw03f2vnnptbf36jJEkWd3W/9fi35rR3/fu1l4wfXP3OA43c9efHjOs5spjv39c3X8Gc0/U1\nqWThM//v0Xd/Br3DuX9466239l+nvv8TBoQj7IAg2hc9kyRJ09imtvl3dGWzfzl/u94fd1fb\nPDFJkkV/WdRzfPPYg3rfvapuzH8Mq1v80u+KvHtVwxbr1bz3FJqqSuW+mPP7fyRJcsC2I3p/\n89FTJ/R8Xcz37+ubLy9Tu+Fd3z00+8r1223UvMlWOx585Ncvn3HX/M4P9PsgQOXycSdAEC9e\n+0SSJP868cNJuiZJki1PvOoHu66fd0ztkG3eu5HKr6XqVJLtXlbk3VOp6hUOI12VTpIk/f7v\nna4b2utG/9+/r2++Qv964rVzpnzrlltuu2/WA3/47TXXXXHh17+2/S1P/W5Sr1cEgQFC2AER\nZDvnn3DFc9WNW5y84eC6jk9nUl/tXDh2jz127Dmgc+mzN/36z+tu3dCzZeHsmUmyR8/NrmUv\n3TqvrXGriXXDdijm7n1ZZ+dNkuSRGU/M22/3DXo2vnHP//V8XTesqOEVqaNl9uN/XTh8648d\ncOQJBxx5QpIkz9xx5uafPu34U//09E92WNnvBlQ6P4oFKl535/wLJn9y1qJlE8/4xaBMqqpu\nzLTNhz3/88PueaO155jrj/3PAw888OVez3lL3rj6m796oed7zDhx78Vd3f921sQi796XEVt9\n90M1mf897PjZSzpzW9oX/fnoEx/vOeADfv8e2WySJMmSN3+y/fbbf/57f+rZvvHH/yVJks53\nHx0YULxiB1Sev19/3reeaE6SJEm6F7318qzbfvXXN5duus/Zt33tnT878dXbL73iowd/avQW\n/3XAZz+26bCn7p35898+t+WUnx/6ofdeEmsc+bEffm78Mwcevt2YIX++74b/d9/fP7Td8T//\n1EeKvHtfMnWb/Pa8fbb+yo0TNtnh0EP2/FDy5m3X/HzR9gcld17Vc8wH+f5JklQPrk6S5Kc/\nunLZZtsduN93dl/np/ec+a+ffnHq9uNHdS/8xy1XXpWpHj7tnAn9fh8goHL/Wi7ASsh93Elv\n9YOHbbbDp79z5W8733/kwtl3HrX3xHWbB9U0DBu3zU6nX3FHR6+PdqtPpzbZ+97nb/3+jpuN\nrKuqHrb+2IO+fuHr7V1F3v36ccNrmz7Z++F6fwRJNpt9ePrZu0wYNai2avCIDT937I8Xtzyd\n9Pq4k8Lfv99v3t7yxGe23bguU7XeVt/JZrOtb/zhy/vv/pERTVXpzODhG0zc+ws3/2nuqp1e\noNKlslm/PAUMOA2Z9LqfvefFm3cp90AAVifvsQMACELYAQAE4ZcngIHov/bdt/nj65R7FACr\nmffYAQAE4UexAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB/H9S\nKyrGjW0d4wAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = loan_data) +\n",
    "  geom_bar(mapping = aes(x = Dependents))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "49fe2c73",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:59.355207Z",
     "iopub.status.busy": "2023-02-21T07:50:59.353552Z",
     "iopub.status.idle": "2023-02-21T07:50:59.584867Z",
     "shell.execute_reply": "2023-02-21T07:50:59.582954Z"
    },
    "papermill": {
     "duration": 0.241795,
     "end_time": "2023-02-21T07:50:59.587424",
     "exception": false,
     "start_time": "2023-02-21T07:50:59.345629",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nuaEdFQDAcLCevTqtbfUDSZK8o6aic8tWNdlbH1iRHP7Kw3vvvfcnP/lJ597jjjtu7NixZT55\nNptNkqSioqK+vr6/Bgysj3q7CFRUVCRJks1mrR4wwvV2ESi1RyaTKf/EYrHY0xP26ssPuY7W\n1UmSjMm+dqOxqSKTX9XS+fDZZ5+dP39+58NZs2ZVVlb26kuk0+nengIE07dFwOoBDMLqUSgU\neti7noVdOledJMnL+Y66TKa0ZVl7IdOY6zxg/PjxM2bM6HxYXV3d2tpa5pNXVFSk0+mOjo72\n9vZejeqaa67p1fHri9J/RuTz+aEeyLDQ5+kRVezpUf66UWL1WEc2m02lUv7HUpLNZjOZjNWj\nU+zp0dvVow/To1gsZl6toDd5wl59+SFXUbttkixYuDY/qfKVb2nR2vyo3Rs7D9hpp5122mmn\nzofLly9vbm4u88kbGhpyuVx7e3v5p8RWV1eXJMmqVauGeiDDQml65PN506PE9Oiqvr6+srLS\n9OhUW1ubTqddjZL6+vpMJlMoFFyQEtOjq7q6uj5Mj6qqqu52rWdvnqhq3Ht8LvPrO5aWHrav\nvv/u5rbpM8p9FR0AQGDrWdglqdxpB0177No58+9buGTxg1ef/fWacfvOnFg31MMCABh669mv\nYpMk2fyQc49vvWjehWcva0lN2X7Pc+ces77FKQDAgFj/wi5JZfY76jP7HTXUwwAAGGbc7QIA\nCELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAA\nQQg7AIAghB0AQBDCDgAgCGEHABCEsAMACELYAQAEIewAAIIQdgAAQQg7AIAghB0AQBDCDgAg\nCGEHABCEsAMACELYAQAEIewAAIIQdgAAQWSHegDDyKOPPrpq1aqGhoaxY8cO9ViGhUKhMNRD\nGEYWLlzY3NxcX18/bty4oR7LsGB6dLVo0aKVK1fW1dWNHz9+qMcyLBQKhY6OjqEexXDx2GOP\nrVixora2dsKECUM9lmGhUCgUi8WhHsVwsXjx4uXLl1dXV0+aNKlfnjDl4nY69dRT77jjjve+\n973nnXfeUI+FYeezn/3sbbfdtvfee3/ta18b6rEw7Hz+85//zW9+s9tuu1188cVDPRaGnXPO\nOeeXv/zlzjvvfPnllw/1WBh2zj333Jtvvnn69Onf/va3++UJ/SoWACAIYf9kKREAAAuNSURB\n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\nrkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = loan_data) +\n",
    "  geom_bar(mapping = aes(x = Education))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "7866e1ca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:59.604434Z",
     "iopub.status.busy": "2023-02-21T07:50:59.602962Z",
     "iopub.status.idle": "2023-02-21T07:50:59.864502Z",
     "shell.execute_reply": "2023-02-21T07:50:59.861551Z"
    },
    "papermill": {
     "duration": 0.27349,
     "end_time": "2023-02-21T07:50:59.867626",
     "exception": false,
     "start_time": "2023-02-21T07:50:59.594136",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nljc911utk3Z624SW/7nmicIO26R0470rhiY3PzffghVD43fpTCkV2l56aWXHR57rjW984xvf\n+MaRm4sXL16yZEktw3d1dfX29g4MDNTyIFBv1V/nHR0dpVKpt7d3zOZZ33R0dDQ3Nw8ODi5d\nurTRs4RVLBYLhYIdrp9isdjW1lYul2v87yZVFAqFcePG1b7DVa75jcWHJwZX/PqrF583/PNN\nUkqpUvq/3qHWTVtbOveY1JS75rdPPXe3nttuWTaw/d4TU0orW6pyCgDAem4swq5r2gemNvV/\n/LPfuPXOe++7+/Z5cz9624rm9753Sso0nXzAtPsuPfO6W+99/IE7Lzn9i60b7XX4Ju0ppZUu\nVTkFAGD9lhmbd4/1Pjr/oq9854/3PDxU6Nj01dPecvgH9tiyM6WUKqVf/Pf5835xy8K+zNRt\ndzvmw0dv3vb37w6vbKnKKS+yePHiGt/y0tXV1dPTU/1bsbNnz67lKaB2c+fOrbLqW7H1Nvyt\n2IGBAd8orB/fiq23kW/FLlq0qNGzhDX8rdiFCxfW+Djd3d0rWxqjsGsUYcd6Qtg1lrAbA8Ku\n3oTdGBiDsBubXykGAEDdCTsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABB\nCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAI\nYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh\n7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCE\nHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISw\nAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2\nAABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIO\nACAIYQcAEISwAwAIQtgBAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgB\nAAQh7AAAghB2AABBCDsAgCCEHQBAEMIOACAIYQcAEISwAwAIQtgBAASRb/QA9dXW1pbN1hSv\n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\nnvz99w7db+aGne1NbeNf8y97z7n0huHjd1+0cyaT+dKjz3+7YXmvrmL7Rs+9fbD6tvzh8s/t\nvePmHS1NG2y0xcEnnv/UwEoHANZVFYC1yRP/+5GUUq6wwbuP/+T3fn7TM31DL77P8kevmlos\nFFpfPev4k88645QDd5uSUtru8G+O3OHcKZ3FCW+pVCpP/vaX8y56Q0rp6G9f9Ytf/mk0Ayy8\n5z0ppV0v/UuV+3x32gb5lilNha4jPjrn4rmff/O0zpTSjgf9a7F7x1M/M/fcT3/oVS35TK74\nmyX9w/cvZjOd0zfKZPL/9u4jTzv1w2/fddOU0sRdPjb0z9MOe+oP/zkuny20veZ9x33sU6d8\ncO9pnSmlvU+7oVKp9D17fTaTmT77dyN3XvLXz6SUdvmvu192W26/8KCUUssGM4444eMfPea9\nr2krdG27eUrpPfcsHM22AOsEYQesdW76xqnb/f39cNlcx4zd3vbRT8+95a9LRu5w5vQNCq2v\nvemZFSNHrvrwdimls+5fPHzz+an01G1vSymd87dlo3z24bB7SU3t2w/f57vTNkgpnXz9o8M3\nVyz8SUop1zzpt8/2DR+57zt7ppTe/X/PDN8sZjMppdnfv/u55ygPXnLM1imlWTc8Wnlh2JXf\n/YrWQutrb3y8Z/h2afDpj8zozmRbblzSX6lUTtqkozjhzSPTXnPQ1Ey2ef6ygerbMrRiwSua\ncq2vfNudSweGl5b/7fotWwvCDoIRdsDaqfzQn2/65gVnHfbve248rimllMnk3zT7G5VKZbDn\nzlwms81Hbnn+vfsX/zqltM3Jzx2sPew22feok1/klFPPG77Pd6dtUGid9vyzOnLZV+7wvZGb\nSx48I6X0ttueGr5ZzGbaXnnY8+8/uGJBay670czvv2Da3qevSCltfeLvnn/nRXefnFLa43v3\nVyqVu/5r55TS1x9fXqlUyqXlr20tdL/u3Jfdlsf/94CU0v4/f/j5q7ecvI2wg2B8KhZYO2U2\n3XrmrK1nzpp9aqr0z//Ztz961Oxr5h41683/duH0n5UqlT9/cafMF194zpI/L1lTT/+yn4rN\n5v/pB6/kM6l5w3/8eJRM9oU/FaVzy3+6EJhv2fwtE1p+9tCvUjrg+cf7nv15SmnK4Zs9/2D7\n5MNTOufxa59IB06Zcsins8ft9aUL7jnqszs8c/vH7u4dfM/5B6WU+hZV25anuh9MKR28fffz\nj089YkY6589V/ozAOkfYAWuRUv/DBxx84qTdz/7yiVv942imecc3H/Wjm3rGTznx2jNvT1c2\npZS2+dgl/7nnpBec3jx+u7GcdtVkXvix3EImVcr9L7rfS3xoNpPJp5QqQ5WUUvP4PU7apP3i\nb3wuffb7133oR/nmTefuOjGllLLVtiX7v9mU0gs+GZxteYkf1Aes04QdsBbJNU286adX9982\n7csnfvYFS03jp6SUmia0tEx4cy5z0tDiLd/0pjeOrA6tuOfKH98+cdvWMR13VSy+d15Kbxq5\nWep/6OqFfW2v2+0Fd2vpelNK3/jrZQ+m7V8xcnD5376VUnrlXq8cvnn0adue+4Ervv3ofR++\n6YlN9rtqg3w2pVR9WzbMbpbSLZfftvDAvTcZWX3i+j/U4Q8KNJIfdwKsTTJNF75l0yUPfu7Q\n83/5T1euKgNfP+6klNK7z9o237L5mVtNWPCt913/RO/I+neP//dDDjnk4bX4S1rPE9/86I/u\n+/ut8uUf239Zqbz7WS8Mu2L3u965Yes9Xznq5qf7ho9UhhZ99tCvZ7LNp7918vCRKQednctk\nPv6Btz09WDrii7sOH6y+Ld2v++wrmnLXvu/Ee3uGhpcGltx+zMf+WK8/LdAgrtgBa5d3fuf6\n9+y4w3c+tNf139h1v12223BcS++ix2/51dV/uH/Jdkd89QszulNKJ/30oq+95tD9pm79joPf\nvsMWE+785bxv/eIv28z61mGvWGNX7B78/jn/cc+EFx+fuMvxJ75lkxcff1ltG+9wwbum333I\nkTttPv72G773gxv++oqdTvzWfpu+6I7Z/7r6k9fufOruU3d431Hv2Kx9xa9/8M1r7np2z1Ov\n36vzuZ/h1zT+Xz80ueOc/7mnpXPP0zbvHDmz6rZs9otz3rnt7O/P2GzmYe/d9xXpyZ9c+q0l\nb3hP+vklq/FnAdZejf70BsALlYeWXH7OKfvO3GrDzvZcrml89+Q3/tu7z/vu/5afd5/F9/78\nA/vvNrGzval1wrTtdjnjaz8bfN5ynX7cSUpp65N+X6lUvjttg+ZxOz//rK58dtN9fzFyc+nD\nZ6V//lTsZvv/csHVn3/jazduyRcmTNryPR8+7/GB0ounHfbYby87eJ+dNhhXzLd0TN1+j099\n81cvGPKer+6SUtr2P/7wguPVt+V3l529x4wp7c35ju7J7zr+wmXL70o+FQuxZCoVv90GoL5a\nc9mJb7/+gav2WFMPOP8T2+30uTuuerr33zdoWVOPCQSwFr8hBYCXUh585vgL7+6Y/CFVB7yA\n99gB64sHr3rrjCP/t8odmsfv9sSDPxyzeVbPcR/8SO+CH9yybOCoH3y40bMAax1hB6wvXv2O\nnzz7jsY89TsOOKBzxw3XyEP9et5X/zo0/rBPfv/re2+8Rh4QiMR77AAAgvAeOwCAIIQdAEAQ\nwg4AIAhhBwAQhLADAAhC2AEABCHsAACCEHYAAEEIOwCAIP5/pAeKJaK/CVIAAAAASUVORK5C\nYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = loan_data) +\n",
    "  geom_bar(mapping = aes(x = Self_Employed))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "56642cdc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:50:59.887420Z",
     "iopub.status.busy": "2023-02-21T07:50:59.884319Z",
     "iopub.status.idle": "2023-02-21T07:51:00.965212Z",
     "shell.execute_reply": "2023-02-21T07:51:00.963351Z"
    },
    "papermill": {
     "duration": 1.092825,
     "end_time": "2023-02-21T07:51:00.967969",
     "exception": false,
     "start_time": "2023-02-21T07:50:59.875144",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd5xcZaH44TN1a3Y3BakRSAIEQovXAlwQKbmg13hRQKQnIEWKiCj6u0GIVEWa\nIAgXpEkkoVxQFEQBIXBpEkFAuihVCOnb28zvj4Flk80OE5iy++Z5/shn5pwzO+95Z9+db2Zn\nd2PZbDYCAGD4i1d6AAAAFIewAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIRLLS\nAyi+xYsXV3oIURRFVVVVyWSytbW10gMpifr6+kQi0dnZ2dHRUemxlERDQ0NbW1tPT0+lB1J8\nyWSyrq4uiqJly5YF+fvJ0+l0KpUKdenV1dUlk8murq729vZKj6UkRowY0d7eHuTSSyQS9fX1\nURQ1NzdnMplKD6f40ul0Op1uaWmp9EBKora2NpVKdXd3t7W1VXosURRFI0eOHGxXgGHX29tb\n6SFEURTlnjKHyGCKLhaLxePxKNwTjMfjmUwmyLNLJBK5xy6TyQT57BJFUSwWC/Kxi1aPpZfN\nZoM8u3g83rf0gjzBbDZr6Q0FvhULABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAI\nYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQ\nCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABCIZJnv\n7+pvHFx96qVfW6NmZTsz986+5La5f3mtOTFx809PO3b6uNpkAbsAAIii8r5il33x/itueXNJ\nTza70t0v33zS+XMe2uYrh53yrYPq/373jOMvyxSwCwCAnDK97jX/oQu+d9EDC1u6Bj0i23Xe\nnGfH73vO3ruOj6JowtmxvQ86e9Yb0w5cty7fLgAA3lOmV+yaJu0949QfnfPj7w12QOfSua92\n9E6Zsm7ualXT9pPr0/PufSv/LgAA+pTpFbt0w7oTGqLerurBDuhqfTKKos1qU31bNq1N/v7J\npdH++XblXH311XfffXfuciKRuOKKK0pwBqssHo/HYrGmpqZKD6QkEolEFEVVVVWpVOoDDx6O\nYrFYfX19dpC3DQxrsVgsd6GhoaGyIymR1WHppdPpUE8wHo/X1dXV1tZWeiDF13/pBfm1xdIr\nm0wm3/vRhsqPIGQ6W6MoGp18/xXEMalET0tH/l05b7/99rPPPpu7nEwmk8lynNR+++33q1/9\nqu/fKIr6X8gd0P/43Ma+7X0Hr55WOkUr7Bpsxvq29+3tf+QKez+K3DIOWHlWSqWEfXbxeDwe\nD/Z3GgS/9MI+weGy9Po/fX90/XugiE9Dg+nt7c2zd6g8APF0TRRFi3sy9e99xi/s7k00pfPv\nytlqq636TjIej3d0dERlkbujvrsbeGHgwYNdXd3kOf3BpjHP9PbfUqyJra6u7urqyv+/omEq\nHo+n0+koijo7O4N82SCZTMbj8a6uwd/RO5yl0+l4PN7b29vd3V3psZREVVVVd3e3pTccJRKJ\nRCIxjJZeEZ+I+/dAGZ7fM5lMnle1h0rYpeq2iKK5z7f3jK16t95ebO9p3L4p/66c3Xfffffd\nd++7umDBgvKMuaWlpe/flV4YePBgV1c3eU5/sGnMM739txRrYquqqtrb24N87kyn07lnl9bW\n1iCfPmtqatLpdKhLrLGxMR6Pd3d3h3qC6XS6o6NjGMVB4VKpVG7ptbW15X/FZZiqrq6urq4e\nRp+ZRRxq/x4ozwzkCbuh8mJ+ddNO66QTdz4wP3e1u/WJR5u7PrHrWvl3AQDQp8Jh9/JN1111\n7W1RFEWx9Hf2mvjS1TPvmvf8v15++sqTz61de5eD1qv/gF0AALynwt+KfeOeO367aL3pB02N\nomjCPqcf1XnB7PNPXtgRG7/VjqefelhfdebZBQBATlnDLpFe7ze/+U3/LTtcMmuHviuxxJSD\nT5hy8MpumWcXAABRFFX8W7EAABSLsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISw\nAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiE\nsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAI\nhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMA\nCISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLAD\nAAiEsAMACISwAwAIhLADAAiEsAMACISwAwAIhLADAAiEsAMACESy0gMovlgsVs476ru7gRfy\njKpsgxya8pz+YNOYZ3r7bynixMZisbAfprBPMOBTi1aDxy7gs4tCP8FhdGrFfb6IBlRBpQQY\ndqNHjy7nHfXd3cALeUZVtkEOTXlOf7BpzDO9/bcUcWIbGhqK9aGGppEjR1Z6CCUU9hKrqqqq\nqqqq9ChKZcSIEZUeQmk1NTVVegglNIyWXhGH2r8HyjADvb29efYGGHaLFy8u5x313d3AC3lG\nVbZBDk15Tn+wacwzvf23FGtim5qaWlpaenp6ivLRhpRUKlVfXx9F0dKlSzOZTKWHU3xVVVXp\ndLq5ubnSAymJESNGJJPJzs7Otra2So+lJBobG9va2rq7uys9kOJLJpO5Zg116aXT6erq6mXL\nllV6IIUq4hNx/x4ow/N7NpsdNWrUYHsDDLv8JVv0O+q7u4EX8oyqbIMcmvKc/mDTmGd6+28p\n4sRmMpkgH6ZEIpG70NvbG+SzSzabzWazQT52URRls9ncv6GeYBTu0ovH331Te6gnOOyWXhGH\n2r8HKj4DfngCACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDJct1R5t7Zl9w29y+vNScmbv7pacdOH1e7\n3F03v3Hu/t+4b4XbpOu2uun606IoevuhGYed9VT/XYdcdcMeo6tLPWgAgGGkTGH38s0nnT/n\nlQOOPuaQkT2/u+ziGcd3zbrs6P6vFtaOmvr972/b/yYPX3nhi5Om5C4veWJJzeipxx02qW/v\n+iNS5Rg3AMDwUZawy3adN+fZ8fues/eu46MomnB2bO+Dzp71xrQD163rOyRRs/F2223cd3Xp\nC7PPa93wf47dIXd1/jPLmjbbbrvtJkUAAAyiHO+x61w699WO3ilT1s1drWrafnJ9et69bw12\nfLa3+bwf3vSFGSeOSsZyW55Y1jlyclNv+7K35i/JlmHEAADDUDlesetqfTKKos1q3//m6aa1\nyd8/uTTaf+XHv3zLaS+N3uOHm4/s2/J4S3f2gQu/etFz3dlssm6N3fY77oipW/btvffee596\n6t134CUSienTp5fiLAaqq6vr+3elFwYePNjV1U2e0x9sGvNMb/8txZrYWCxWXV2dTqeL8tGG\nlEQikbtQW1ubzQb4H6VkMplIJEJdYrmHL5VKhXqCsVisqqoqlQrwzTbx+LuvpNTU1AS59BKJ\nRDweH0afmUUcav8eKMMMZDKZPHvLEXaZztYoikYn3391cEwq0dPSsfKDu/51xvUvfvnCU/q2\n9Ha90ZJIbTBmux/POrUp2/zI7Vf+5PKTqja6dtrEptwBjzzyyI033pi7nEwmjzrqqFKdyfJq\namr6/l3phYEHD3Z1dZPn9AebxjzT239LESe2qqqqWB9qaKquDvnHj8JeYolEIuATtPSGtWH0\nmVnEofbvgTLMQG9vb5695Qi7eLomiqLFPZn6914qWNjdm2ha+Wshr91+Xkvdjnv1f/tdet0b\nbrjhvWtVO+xz4gu/n3fPFU9PO2f73KampqZ11333+7yJRCL/CRdR7o767m7ghYEHD3Z1dZPn\n9AebxjzT239LsSY2kUhkMpkg/1cdi8VyrxyE+kmYO7v8/6MdvuLxeCwWy2azoZ6gpTd8xWKx\nWCw2jD4zi/hA9O+BMjy+mUym73svA5Uj7FJ1W0TR3Ofbe8ZWvTuOF9t7GrdvWtmx2Wtu/Me4\nA76Z/wNOXrPmrkXv9F094ogjjjjiiL6rCxYs+OhjLsTixYv7/l3phYEHD3Z1dZPn9AebxjzT\n239LsSZ29OjRzc3N3d3dRfloQ0o6nW5oaIiiaOnSpcPoS3Dhampq0un00qVLKz2QkmhsbEyl\nUp2dnS0tLZUeS0mMGjWqpaWlq6ur0gMpvlQq1djYGEXRsmXLgmy76urq6urqJUuWVHoghSri\nE3H/HijP8/uYMWMG21WOH56obtppnXTizgfm5652tz7xaHPXJ3Zda+CRbfNvfKy5a/rn1u6/\ncckLFx/69aPf6up7Bsrc92Zb02YbD7w5AMDqrCx/eSKW/s5eE1+6euZd857/18tPX3nyubVr\n73LQevVRFL1803VXXXtb34Fv3v5AesQnN6lZ7nXEhnH7jG57+3szL/vz08+/+LcnZl9w4tzW\nEYd/XdgBACynTL+geMI+px/VecHs809e2BEbv9WOp596WK4o37jnjt8uWm/6QVNzh91339sN\nGx64wm3jyTGnXfzDqy6ddeHpJ3UkRozbaPMTz585uT7An5kCAPgoyvUnxWKJKQefMOXgFTfv\ncMmsHfpdPfSqOYeu7NZVIycd+f/OPLJkowMACEBZvhULAEDpCTsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBA\nCDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCA\nQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQCQrPYDia2pqKucd9d3dwAt5RlW2QQ5NeU5/sGnMM739txRrYmOxWH19fTabLcpHG1Ji\nsVjuQkNDQ2VHUiLxeDwWi4W6xBKJRBRF6XQ61BOMx+N1dXW1tbWVHkjx9V96QX5tGXZLr4hD\n7d8DZZiBTCaTZ2+AYdfR0VHOO+q7u4EX8oyqbIMcmvKc/mDTmGd6+28p1sTW1dV1dXX19vYW\n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\nURR1tz7xaHPXV3Zdq/8xS164+ISznznjkovWSue+5Zq57822pk9sXMjNm5qa+v+avQULFnzo\noa6S3Guhfa+IDrww8ODBrq5u8pz+YNOYZ3r7bynixGYymSAfpr43+vT29gb57JLNZrPZbJCP\nXfTeLw0N+ASjcJde3/vqQj3BTCYzvD4zizjU/j1Q8RlYtVfs2t544qZf//GZl99s602uPW7S\nf+yx17+Nrf/gm8XS39lr4nevnnnX2idOGtn9m4vPrV17l4PWq4+i6OWbrruvrXH6QVMbxu0z\nuu3I78287Jj9dm6Ktc/743VzW0ec/PWN898cAIA+qxB2N5/8tf3PuKEz8/4PK8341pF7z5g1\n59Q9P/C2E/Y5/ajOC2aff/LCjtj4rXY8/dTDcv9zeeOeO367aL3pB02NJ8ecdvEPr7p01oWn\nn9SRGDFuo81PPH/m5PpU/psDANCn0LD7x43773XanLE7HXrOfx++/VYTamOdLz314GWnf/uK\n0/ZKb/2PX35lgw+4fSwx5eATphy84uYdLpm1w3uXq0ZOOvL/nXnkqtwcAIA+hYbdOd/6Tf26\n05676/LaeCy35ZM77flvO34+s/5aNxx7bvSVi0o2QgAAClLotzRnv9O28eHH9VVdTixee9wx\nm7S/c30JBgYAwKopNOzq4/GOtzsGbu94uyOW8HMMAACVV2jYfWujxpeuPeqxxcv9TdiupX85\n5ooXGiccV4KBAQCwagp9j930m049ZdKx/77BVoccM/3ft5xQHbX//akHr/7ZlS+0pS+8cXpJ\nhwgAQCEKDbumTY565o/JA47670vP/P6l720ctclnL774l0dO/IC/IQEAQBmswu+xW2+nw+99\n9rDXn5v3t7+/2RlVrTNus09sOtbvkwMAGCJW9W/Fxtab+Mn1JpZkKAAAfBSr8Irbgnm3Hrbn\nlGm3vpK7etduk7f9zwNvePSd0gwMAIBVU2jYLX3xfzbeZs8rb5uXqn73JqM+sdEr98ze9983\n+vmzi0s2PAAAClVo2P3iy//dWjN57qtvXL772NyWT5x1w8uvPviZ2o4f7P0/JRseAACFKjTs\nzn9p6YSDfvbva9X031i9xqcuPHKTJS/+tAQDAwBg1RQadr3ZbLoxPXB7ojYRRZmiDgkAgA+j\n0LA7ZoOG5y876bXO3v4bM13/mvmz50asd0QJBgYAwKop9NedHHnzD87Y+juTJu58wren//uW\nE2rj3f945pFrzvvRXQt7Zt5+TEmHCABAIQoNu1GbH/+32xJ7HzFj5jfn9m2sHjXxh9ff+INP\nrVGasQEAsApW4RcUb/D5b/75lSOffvi+x597pa03ufa4SZ/b8ZMNiVjpBgcAQOFW8S9PxNKb\nbztl821LMxYAAD4Cf+sVACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMlKD6D46urqynlHfXc38EKeUZVtkENTntMfbBrzTG//LcWa2FgsVl1dnU6ni/LRhpRE\nIpG7UFtbm81mKzuYUkgmk4lEItQllnv4UqlUqCeYW3qpVKrSAym+ePzdV1JqamqCXHqJRCIe\njw+jz8wiDrV/D5RhBjKZTJ69AYZd3+Ipzx313d3AC3lGVbZBDk15Tn+wacwzvf23FHFiQ32M\nYrFY7kI8Hg/y2SV3gqE+fH0CPsFYLBbk2fX/Ihbk0ovH48PrsSv688UKVVA6fV/GVyrAsGtu\nbi7nHfXd3cALeUZVtkEOTXlOf7BpzDO9/bcUa2LT6XRbW1t3d3dRPtqQkk6ncy+HtLS05P9v\n3zBVU1OTTqdDXWKNjY3xeLy7u7ulpaXSYymJUaNGtbe3d3V1VXogxZdKpRobG6Moam1t7e3t\nrfRwiq+6urq6unoYLb0iDrV/D5RnBqqrqwfbNWzKGgCA/IQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHcCfV3UAACAASURB\nVABAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCE\nHQBAIIQdAEAghB0AQCCS5bqjzL2zL7lt7l9ea05M3PzT046dPq52xbvO9iy+5fLL7njwrws7\n4muP3ehLBx652+S1crvefmjGYWc91f/gQ666YY/R1WUaOwDAcFCmsHv55pPOn/PKAUcfc8jI\nnt9ddvGM47tmXXb0Cq8W/uHM78x6pmHa4d+cuE7dk3dff8nMo9t/ds0eY+ujKFryxJKa0VOP\nO2xS38Hrj0iVZ+QAAMNFWcIu23XenGfH73vO3ruOj6JowtmxvQ86e9Yb0w5ct67vkN7O1y6d\nt2DHM8+ZOmlkFEUbTdziX4/uc+slT+9x1jZRFM1/ZlnTZtttt92kwe4BAIByvMeuc+ncVzt6\np0xZN3e1qmn7yfXpefe+1f+Y3o5/rr/hhl8Y1/DehtjkxqruJS25K08s6xw5uam3fdlb85dk\nyzBiAIBhqByv2HW1PhlF0Wa173/zdNPa5O+fXBrt//4x6cYdLrhgh76r3S3PXflmy/rTN8ld\nfbylO/vAhV+96LnubDZZt8Zu+x13xNQt+w7+6U9/+utf/zp3OZlM3nnnnaU8m/eNHj2679+V\nXhh48GBXVzd5Tn+wacwzvf23FGtiY7FYQ0PDBx83nI0cObLSQyiVWCwW6hKLxWJRFFVXV1dV\nVVV6LCURi8VGjBhR6VGUVlNTU6WHUCrDa+kVcaj9e6AMM9Db25tnbznCLtPZGkXR6OT7rw6O\nSSV6WjoGO/6Vx26/8KdXdo/7/Izd14uiqLfrjZZEaoMx2/141qlN2eZHbr/yJ5efVLXRtdMm\nvrs2Ojo6li1blrucTCZzX/jKIHdHfXc38MLAgwe7urrJc/qDTWOe6e2/pYgTG/xjFPYJhn12\nUdAnGPCp5YR9gsPo7Ir+fLFCFZRO/rsoR9jF0zVRFC3uydQnErktC7t7E03pgUd2LX7+yosu\nvOPxRTvu9Y0z9tu5OhaLoiiRXveGG25475CqHfY58YXfz7vniqennbN9btNuu+220UYbvXtf\n8XhLS0tpz+c9uTvqu7uBFwYePNjV1U2e0x9sGvNMb/8txZrYurq6jo6O/P8rGqYSiURNTU0U\nRa2trdlsgG9tSKVSyWSyvb290gMpiZqamkQi0d3d3dnZWemxlERdXV1nZ2dPT0+lB1J8fUuv\nra0tk8lUejjFl0qlUqlUW1tbpQdSqCI+EffvgTI8v2ez2TwvbJcj7FJ1W0TR3Ofbe8ZWvRt2\nL7b3NG6/4mvRza/cfcJ3fpbY4vNnX37QJmPy/SqTyWvW3LXonb6rW2+99dZbb913dcGCBcUb\nez4dHR19/670wsCDB7u6uslz+oNNY57p7b+lWBNbV1fX1dXV3d1dlI82pKTT6dyzS2dnZ5DP\nLrFYLB6Ph7rEqqqqEolEb29vqCdYW1vb1dXV1dVV6YEUXyqV6lt6Qf6nMYqiRCIxjD4zizjU\n/j1QnhnIE3bl+OGJ6qad1kkn7nxgfu5qd+sTjzZ3fWLXtfofk820nfG9S6p2+eYlJx++QtUt\neeHiQ79+9Ftdfc9AmfvebGvabOMyjBwAYBgpy687iaW/s9fE71498661T5w0svs3F59bu/Yu\nB61XH0XRyzddd19b4/SDprbNn/VMW/f0LWrnPfbY+4OrmbD1pKaGcfuMbjvyezMvO2a/nZti\n7fP+eN3c1hEnf13YAQAsp0y/oHjCPqcf1XnB7PNPXtgRG7/VjqefeljupcI37rnjt4vWm37Q\n1OaX/hlF0VU/PqP/rRrG/vd1F28TT4457eIfXnXprAtPP6kjMWLcRpufeP7MyfV+QTEAwHLK\n9SfFYokpB58w5eAVN+9wyazc7zhZa/szfrP9oLeuGjnpyP935pGlGx4AwPBXjvfYAQBQBsIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQyUoPoPhSqVQ576jv7gZeyDOqsg1yaMpz+oNNY57p7b+liBObTAa4\nOqIoSiQSuQvJZDKbzVZ2MKUQj8djsVioSywWi0VRFI/HQz3BKIoSiUSQZ9d/6cXjAb6qkkgk\nhtfSK+JQ+/dAxWcgwKeuhoaGct5R390NvJBnVGUb5NCU5/QHm8Y809t/S7EmNhaL1dbWFuVD\nDVkjRoyo9BBKJRaLhbrEcmGXTqcr/uRRIqvD0quvr6/0EEpleC29Ig61fw+UYQZ6e3vz7A0w\n7BYuXFjOO+q7u4EX8oyqbIMcmvKc/mDTmGd6+28p1sSOHj162bJl3d3dRfloQ0o6nc593Vm8\neHEmk6n0cIqvpqYmnU4vXbq00gMpicbGxlQq1dHR0dLSUumxlMSoUaNaWlq6uroqPZDiS6VS\njY2NURQtWbIk/xPzMFVdXV1dXb1kyZJKD6RQRXwi7t8D5Xl+HzNmzGC7Anw1GABg9STsAAAC\nIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAA\nAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHs\nAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh\n7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAAC\nIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAA\nAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewA\nAAIh7AAAAiHsAAACIewAAAKRLNcdZe6dfcltc//yWnNi4uafnnbs9HG1A+86zzGF3BwAYLVW\nplfsXr75pPPnPLTNVw475VsH1f/97hnHX5ZZlWMKuTkAwGquLGGX7TpvzrPj9z117123nfRv\nOxx39jGt/7pz1huthR5TyM0BAFZ75Qi7zqVzX+3onTJl3dzVqqbtJ9en5937VoHHFHJzAADK\n8U61rtYnoyjarDbVt2XT2uTvn1wa7V/QMR9481tvvfXhhx/OXY7H46ecckrJTmU5I0aM6Pt3\npRcGHjzY1dVNntMfbBrzTG//LcWa2FgsVltbm8kE+D3/ePzd/87V19dns9nKDqYUEolEPB4P\ndYklEokoilKpVKgnGIvFampqqqqqKj2Q4utbenV1daEuvUQiMYw+M4s41P49UIYZyP/5U46w\ny3S2RlE0Ovn+q4NjUomelo4Cj/nAmz///PN33XVX7nIymTzzzDNLcRYD5b709H0BGnhh4MGD\nXV3d5Dn9waYxz/T231LEiU2lUh980HCWTqcrPYQSCnuJ5Z5BKz2KUrH0hrVhtPSKONT+PVCG\nGejt7c2zN1aG/zc0v37O/kfNvfjGW8ZWvfuVaM7Xv3Z703euOeeThRzzgTev1Ct2+eVeNuju\n7q70QEoinU7HYrHe3t6enp5Kj6Ukqqqquru7Q33FLvfE2dXVFerLBgEvvVQqFY/HA1566XS6\np6fH0huOcv/f6OrqqvRASiK39DKZzFD42pLNZqurqwfbW45X7FJ1W0TR3Ofbe/rK7MX2nsbt\nmwo85gNvvscee+yxxx59VxcsWFDS0ylQTU1NKpVqbm6u9EBKoqmpKZlMdnV1tbaG+VMs6XS6\nra1tKCzgokun07lnl5aWliCfPmtqatLpdKhLr7GxMZetLS0tlR5LSYwaNaq9vT3IOEilUo2N\njVEUtba25n/FZZiqrq6urq4Odek1NDSk0+nu7u4hcoJ5wq4cPzxR3bTTOunEnQ/Mz13tbn3i\n0eauT+y6VoHHFHJzAADK8utOYunv7DXxpatn3jXv+X+9/PSVJ59bu/YuB61XH0XRyzddd9W1\nt+U/Jt8uAADeU6a/3zBhn9OP6rxg9vknL+yIjd9qx9NPPSxXlG/cc8dvF603/aCpeY7JvwsA\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = loan_data) +\n",
    "  geom_bar(mapping = aes(x = Credit_History))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "a425dee0",
   "metadata": {
    "papermill": {
     "duration": 0.007324,
     "end_time": "2023-02-21T07:51:00.982860",
     "exception": false,
     "start_time": "2023-02-21T07:51:00.975536",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 9.020722,
   "end_time": "2023-02-21T07:51:01.112764",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-21T07:50:52.092042",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
