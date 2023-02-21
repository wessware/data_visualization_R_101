{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "b0d51e23",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:07.974708Z",
     "iopub.status.busy": "2023-02-21T07:13:07.972057Z",
     "iopub.status.idle": "2023-02-21T07:13:09.500329Z",
     "shell.execute_reply": "2023-02-21T07:13:09.498230Z"
    },
    "papermill": {
     "duration": 1.536471,
     "end_time": "2023-02-21T07:13:09.502807",
     "exception": false,
     "start_time": "2023-02-21T07:13:07.966336",
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
   "id": "b84e8faa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.543312Z",
     "iopub.status.busy": "2023-02-21T07:13:09.510820Z",
     "iopub.status.idle": "2023-02-21T07:13:09.602921Z",
     "shell.execute_reply": "2023-02-21T07:13:09.600896Z"
    },
    "papermill": {
     "duration": 0.099502,
     "end_time": "2023-02-21T07:13:09.605494",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.505992",
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
   "id": "7555bc6d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.614705Z",
     "iopub.status.busy": "2023-02-21T07:13:09.613091Z",
     "iopub.status.idle": "2023-02-21T07:13:09.644203Z",
     "shell.execute_reply": "2023-02-21T07:13:09.642418Z"
    },
    "papermill": {
     "duration": 0.038052,
     "end_time": "2023-02-21T07:13:09.646473",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.608421",
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
   "id": "562a26c6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.655755Z",
     "iopub.status.busy": "2023-02-21T07:13:09.653987Z",
     "iopub.status.idle": "2023-02-21T07:13:09.675223Z",
     "shell.execute_reply": "2023-02-21T07:13:09.673460Z"
    },
    "papermill": {
     "duration": 0.028197,
     "end_time": "2023-02-21T07:13:09.677629",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.649432",
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
   "id": "60f5e771",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.687447Z",
     "iopub.status.busy": "2023-02-21T07:13:09.685877Z",
     "iopub.status.idle": "2023-02-21T07:13:09.720467Z",
     "shell.execute_reply": "2023-02-21T07:13:09.718062Z"
    },
    "papermill": {
     "duration": 0.042792,
     "end_time": "2023-02-21T07:13:09.723619",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.680827",
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
   "id": "6ceb7c85",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.734139Z",
     "iopub.status.busy": "2023-02-21T07:13:09.732473Z",
     "iopub.status.idle": "2023-02-21T07:13:09.773791Z",
     "shell.execute_reply": "2023-02-21T07:13:09.771259Z"
    },
    "papermill": {
     "duration": 0.049675,
     "end_time": "2023-02-21T07:13:09.776854",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.727179",
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
   "id": "79ca1576",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.787488Z",
     "iopub.status.busy": "2023-02-21T07:13:09.785896Z",
     "iopub.status.idle": "2023-02-21T07:13:09.806360Z",
     "shell.execute_reply": "2023-02-21T07:13:09.804068Z"
    },
    "papermill": {
     "duration": 0.028861,
     "end_time": "2023-02-21T07:13:09.809344",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.780483",
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
   "id": "528e24c8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.820281Z",
     "iopub.status.busy": "2023-02-21T07:13:09.818654Z",
     "iopub.status.idle": "2023-02-21T07:13:09.834631Z",
     "shell.execute_reply": "2023-02-21T07:13:09.832774Z"
    },
    "papermill": {
     "duration": 0.024676,
     "end_time": "2023-02-21T07:13:09.837852",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.813176",
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
   "id": "66ecd3ab",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T07:13:09.848799Z",
     "iopub.status.busy": "2023-02-21T07:13:09.847200Z",
     "iopub.status.idle": "2023-02-21T07:13:09.862779Z",
     "shell.execute_reply": "2023-02-21T07:13:09.861021Z"
    },
    "papermill": {
     "duration": 0.024073,
     "end_time": "2023-02-21T07:13:09.865752",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.841679",
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
   "execution_count": null,
   "id": "a46b54e2",
   "metadata": {
    "papermill": {
     "duration": 0.003711,
     "end_time": "2023-02-21T07:13:09.873182",
     "exception": false,
     "start_time": "2023-02-21T07:13:09.869471",
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
   "duration": 5.566678,
   "end_time": "2023-02-21T07:13:09.997422",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-21T07:13:04.430744",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
