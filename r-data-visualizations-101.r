{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "5e1747a6",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-20T08:20:33.407207Z",
     "iopub.status.busy": "2023-02-20T08:20:33.403821Z",
     "iopub.status.idle": "2023-02-20T08:20:34.894102Z",
     "shell.execute_reply": "2023-02-20T08:20:34.892245Z"
    },
    "papermill": {
     "duration": 1.498736,
     "end_time": "2023-02-20T08:20:34.897091",
     "exception": false,
     "start_time": "2023-02-20T08:20:33.398355",
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
    "library(tidyverse) # metapackage of all tidyverse packages"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "03a3ee65",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T08:20:34.938437Z",
     "iopub.status.busy": "2023-02-20T08:20:34.904979Z",
     "iopub.status.idle": "2023-02-20T08:20:34.964449Z",
     "shell.execute_reply": "2023-02-20T08:20:34.962647Z"
    },
    "papermill": {
     "duration": 0.06695,
     "end_time": "2023-02-20T08:20:34.967041",
     "exception": false,
     "start_time": "2023-02-20T08:20:34.900091",
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
       "<ol class=list-inline><li>'dataset_NN.csv'</li><li>'synthesized_loan_data.csv'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'dataset\\_NN.csv'\n",
       "\\item 'synthesized\\_loan\\_data.csv'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'dataset_NN.csv'\n",
       "2. 'synthesized_loan_data.csv'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"dataset_NN.csv\"            \"synthesized_loan_data.csv\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "list.files(path = \"../input/r-visualization-datasets\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f8392874",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T08:20:34.975956Z",
     "iopub.status.busy": "2023-02-20T08:20:34.974442Z",
     "iopub.status.idle": "2023-02-20T08:20:35.288783Z",
     "shell.execute_reply": "2023-02-20T08:20:35.287095Z"
    },
    "papermill": {
     "duration": 0.321979,
     "end_time": "2023-02-20T08:20:35.291784",
     "exception": false,
     "start_time": "2023-02-20T08:20:34.969805",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m4000\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m12\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[32mdbl\u001b[39m (12): Gender, Married, Dependents, Education, Self_Employed, ApplicantIn...\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "loan_data <- read_csv('/kaggle/input/r-visualization-datasets/synthesized_loan_data.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "29265e91",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T08:20:35.301573Z",
     "iopub.status.busy": "2023-02-20T08:20:35.300076Z",
     "iopub.status.idle": "2023-02-20T08:20:35.315179Z",
     "shell.execute_reply": "2023-02-20T08:20:35.313252Z"
    },
    "papermill": {
     "duration": 0.023014,
     "end_time": "2023-02-20T08:20:35.318169",
     "exception": false,
     "start_time": "2023-02-20T08:20:35.295155",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "names(loan_data) <- make.names(names(loan_data), unique=TRUE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "9a41d3d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T08:20:35.327558Z",
     "iopub.status.busy": "2023-02-20T08:20:35.326076Z",
     "iopub.status.idle": "2023-02-20T08:20:35.362669Z",
     "shell.execute_reply": "2023-02-20T08:20:35.360702Z"
    },
    "papermill": {
     "duration": 0.043924,
     "end_time": "2023-02-20T08:20:35.365232",
     "exception": false,
     "start_time": "2023-02-20T08:20:35.321308",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 5 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender</th><th scope=col>Married</th><th scope=col>Dependents</th><th scope=col>Education</th><th scope=col>Self_Employed</th><th scope=col>ApplicantIncome</th><th scope=col>CoapplicantIncome</th><th scope=col>LoanAmount</th><th scope=col>Loan_Amount_Term</th><th scope=col>Credit_History</th><th scope=col>Property_Area</th><th scope=col>Loan_Status</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>1</td><td>1.0154914</td><td>0</td><td>0</td><td> 60</td><td>2263.42674</td><td>120.26457</td><td>362.0349</td><td>0.9996177</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td>2.7935501</td><td>1</td><td>2</td><td>299</td><td> 207.07874</td><td> 97.33355</td><td>185.8551</td><td>0.9944496</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>0</td><td>0</td><td>1.0205754</td><td>0</td><td>1</td><td>497</td><td>-222.10515</td><td> 98.95750</td><td>361.4115</td><td>0.9991317</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td>0.9676278</td><td>0</td><td>0</td><td> 35</td><td>1874.20080</td><td>141.12198</td><td>360.4270</td><td>0.9992733</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td>1.9293541</td><td>0</td><td>0</td><td>340</td><td>  47.08091</td><td>322.93678</td><td>360.0139</td><td>0.9798815</td><td>0</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 5 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Gender & Married & Dependents & Education & Self\\_Employed & ApplicantIncome & CoapplicantIncome & LoanAmount & Loan\\_Amount\\_Term & Credit\\_History & Property\\_Area & Loan\\_Status\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1 & 1 & 1.0154914 & 0 & 0 &  60 & 2263.42674 & 120.26457 & 362.0349 & 0.9996177 & 2 & 1\\\\\n",
       "\t 1 & 1 & 2.7935501 & 1 & 2 & 299 &  207.07874 &  97.33355 & 185.8551 & 0.9944496 & 1 & 1\\\\\n",
       "\t 0 & 0 & 1.0205754 & 0 & 1 & 497 & -222.10515 &  98.95750 & 361.4115 & 0.9991317 & 0 & 1\\\\\n",
       "\t 1 & 1 & 0.9676278 & 0 & 0 &  35 & 1874.20080 & 141.12198 & 360.4270 & 0.9992733 & 2 & 1\\\\\n",
       "\t 1 & 1 & 1.9293541 & 0 & 0 & 340 &   47.08091 & 322.93678 & 360.0139 & 0.9798815 & 0 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 5 × 12\n",
       "\n",
       "| Gender &lt;dbl&gt; | Married &lt;dbl&gt; | Dependents &lt;dbl&gt; | Education &lt;dbl&gt; | Self_Employed &lt;dbl&gt; | ApplicantIncome &lt;dbl&gt; | CoapplicantIncome &lt;dbl&gt; | LoanAmount &lt;dbl&gt; | Loan_Amount_Term &lt;dbl&gt; | Credit_History &lt;dbl&gt; | Property_Area &lt;dbl&gt; | Loan_Status &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 1.0154914 | 0 | 0 |  60 | 2263.42674 | 120.26457 | 362.0349 | 0.9996177 | 2 | 1 |\n",
       "| 1 | 1 | 2.7935501 | 1 | 2 | 299 |  207.07874 |  97.33355 | 185.8551 | 0.9944496 | 1 | 1 |\n",
       "| 0 | 0 | 1.0205754 | 0 | 1 | 497 | -222.10515 |  98.95750 | 361.4115 | 0.9991317 | 0 | 1 |\n",
       "| 1 | 1 | 0.9676278 | 0 | 0 |  35 | 1874.20080 | 141.12198 | 360.4270 | 0.9992733 | 2 | 1 |\n",
       "| 1 | 1 | 1.9293541 | 0 | 0 | 340 |   47.08091 | 322.93678 | 360.0139 | 0.9798815 | 0 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  Gender Married Dependents Education Self_Employed ApplicantIncome\n",
       "1 1      1       1.0154914  0         0              60            \n",
       "2 1      1       2.7935501  1         2             299            \n",
       "3 0      0       1.0205754  0         1             497            \n",
       "4 1      1       0.9676278  0         0              35            \n",
       "5 1      1       1.9293541  0         0             340            \n",
       "  CoapplicantIncome LoanAmount Loan_Amount_Term Credit_History Property_Area\n",
       "1 2263.42674        120.26457  362.0349         0.9996177      2            \n",
       "2  207.07874         97.33355  185.8551         0.9944496      1            \n",
       "3 -222.10515         98.95750  361.4115         0.9991317      0            \n",
       "4 1874.20080        141.12198  360.4270         0.9992733      2            \n",
       "5   47.08091        322.93678  360.0139         0.9798815      0            \n",
       "  Loan_Status\n",
       "1 1          \n",
       "2 1          \n",
       "3 1          \n",
       "4 1          \n",
       "5 1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(loan_data, 5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "e231c253",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T08:20:35.375638Z",
     "iopub.status.busy": "2023-02-20T08:20:35.374004Z",
     "iopub.status.idle": "2023-02-20T08:20:35.444520Z",
     "shell.execute_reply": "2023-02-20T08:20:35.442780Z"
    },
    "papermill": {
     "duration": 0.078412,
     "end_time": "2023-02-20T08:20:35.446967",
     "exception": false,
     "start_time": "2023-02-20T08:20:35.368555",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 10 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender</th><th scope=col>Married</th><th scope=col>Dependents</th><th scope=col>Education</th><th scope=col>Self_Employed</th><th scope=col>ApplicantIncome</th><th scope=col>CoapplicantIncome</th><th scope=col>LoanAmount</th><th scope=col>Loan_Amount_Term</th><th scope=col>Credit_History</th><th scope=col>Property_Area</th><th scope=col>Loan_Status</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>1</td><td> 0.980095745</td><td>0</td><td>0</td><td>209</td><td>2533.47044</td><td> 90.09948</td><td>360.7316</td><td> 0.98924070</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>0</td><td>0</td><td>-0.026423607</td><td>1</td><td>0</td><td> 99</td><td>1519.58126</td><td> 53.96926</td><td>359.8383</td><td> 0.98696203</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td>-0.013460168</td><td>1</td><td>0</td><td>131</td><td>  24.68071</td><td>102.69695</td><td>359.6281</td><td>-0.07854187</td><td>0</td><td>0</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td>-0.003450191</td><td>1</td><td>0</td><td>142</td><td>1234.00575</td><td>115.00828</td><td>178.6480</td><td> 0.99026200</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td>-0.023265246</td><td>0</td><td>0</td><td>260</td><td>5506.00291</td><td>129.57623</td><td>359.6364</td><td> 0.99490716</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td> 2.118012081</td><td>0</td><td>0</td><td>248</td><td>2693.04974</td><td>176.17221</td><td>360.6654</td><td> 1.00704656</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>0</td><td>0</td><td>-0.002574432</td><td>0</td><td>0</td><td>249</td><td>1949.72806</td><td>117.27761</td><td>361.0443</td><td> 0.98617663</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td> 0.010151537</td><td>0</td><td>0</td><td>300</td><td>2882.20209</td><td>136.09887</td><td>361.7223</td><td> 0.99460263</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><td>0</td><td>1</td><td>-0.002625099</td><td>0</td><td>0</td><td>385</td><td> 182.63109</td><td>191.73318</td><td>360.7231</td><td> 0.98902865</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><td>1</td><td>1</td><td> 0.007270990</td><td>0</td><td>0</td><td>462</td><td>2590.28657</td><td>119.75630</td><td>360.2763</td><td> 0.99778939</td><td>1</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 10 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Gender & Married & Dependents & Education & Self\\_Employed & ApplicantIncome & CoapplicantIncome & LoanAmount & Loan\\_Amount\\_Term & Credit\\_History & Property\\_Area & Loan\\_Status\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1 & 1 &  0.980095745 & 0 & 0 & 209 & 2533.47044 &  90.09948 & 360.7316 &  0.98924070 & 1 & 1\\\\\n",
       "\t 0 & 0 & -0.026423607 & 1 & 0 &  99 & 1519.58126 &  53.96926 & 359.8383 &  0.98696203 & 1 & 1\\\\\n",
       "\t 1 & 1 & -0.013460168 & 1 & 0 & 131 &   24.68071 & 102.69695 & 359.6281 & -0.07854187 & 0 & 0\\\\\n",
       "\t 1 & 1 & -0.003450191 & 1 & 0 & 142 & 1234.00575 & 115.00828 & 178.6480 &  0.99026200 & 2 & 1\\\\\n",
       "\t 1 & 1 & -0.023265246 & 0 & 0 & 260 & 5506.00291 & 129.57623 & 359.6364 &  0.99490716 & 0 & 1\\\\\n",
       "\t 1 & 1 &  2.118012081 & 0 & 0 & 248 & 2693.04974 & 176.17221 & 360.6654 &  1.00704656 & 1 & 1\\\\\n",
       "\t 0 & 0 & -0.002574432 & 0 & 0 & 249 & 1949.72806 & 117.27761 & 361.0443 &  0.98617663 & 1 & 1\\\\\n",
       "\t 1 & 1 &  0.010151537 & 0 & 0 & 300 & 2882.20209 & 136.09887 & 361.7223 &  0.99460263 & 0 & 1\\\\\n",
       "\t 0 & 1 & -0.002625099 & 0 & 0 & 385 &  182.63109 & 191.73318 & 360.7231 &  0.98902865 & 1 & 0\\\\\n",
       "\t 1 & 1 &  0.007270990 & 0 & 0 & 462 & 2590.28657 & 119.75630 & 360.2763 &  0.99778939 & 1 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 10 × 12\n",
       "\n",
       "| Gender &lt;dbl&gt; | Married &lt;dbl&gt; | Dependents &lt;dbl&gt; | Education &lt;dbl&gt; | Self_Employed &lt;dbl&gt; | ApplicantIncome &lt;dbl&gt; | CoapplicantIncome &lt;dbl&gt; | LoanAmount &lt;dbl&gt; | Loan_Amount_Term &lt;dbl&gt; | Credit_History &lt;dbl&gt; | Property_Area &lt;dbl&gt; | Loan_Status &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 |  0.980095745 | 0 | 0 | 209 | 2533.47044 |  90.09948 | 360.7316 |  0.98924070 | 1 | 1 |\n",
       "| 0 | 0 | -0.026423607 | 1 | 0 |  99 | 1519.58126 |  53.96926 | 359.8383 |  0.98696203 | 1 | 1 |\n",
       "| 1 | 1 | -0.013460168 | 1 | 0 | 131 |   24.68071 | 102.69695 | 359.6281 | -0.07854187 | 0 | 0 |\n",
       "| 1 | 1 | -0.003450191 | 1 | 0 | 142 | 1234.00575 | 115.00828 | 178.6480 |  0.99026200 | 2 | 1 |\n",
       "| 1 | 1 | -0.023265246 | 0 | 0 | 260 | 5506.00291 | 129.57623 | 359.6364 |  0.99490716 | 0 | 1 |\n",
       "| 1 | 1 |  2.118012081 | 0 | 0 | 248 | 2693.04974 | 176.17221 | 360.6654 |  1.00704656 | 1 | 1 |\n",
       "| 0 | 0 | -0.002574432 | 0 | 0 | 249 | 1949.72806 | 117.27761 | 361.0443 |  0.98617663 | 1 | 1 |\n",
       "| 1 | 1 |  0.010151537 | 0 | 0 | 300 | 2882.20209 | 136.09887 | 361.7223 |  0.99460263 | 0 | 1 |\n",
       "| 0 | 1 | -0.002625099 | 0 | 0 | 385 |  182.63109 | 191.73318 | 360.7231 |  0.98902865 | 1 | 0 |\n",
       "| 1 | 1 |  0.007270990 | 0 | 0 | 462 | 2590.28657 | 119.75630 | 360.2763 |  0.99778939 | 1 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "   Gender Married Dependents   Education Self_Employed ApplicantIncome\n",
       "1  1      1        0.980095745 0         0             209            \n",
       "2  0      0       -0.026423607 1         0              99            \n",
       "3  1      1       -0.013460168 1         0             131            \n",
       "4  1      1       -0.003450191 1         0             142            \n",
       "5  1      1       -0.023265246 0         0             260            \n",
       "6  1      1        2.118012081 0         0             248            \n",
       "7  0      0       -0.002574432 0         0             249            \n",
       "8  1      1        0.010151537 0         0             300            \n",
       "9  0      1       -0.002625099 0         0             385            \n",
       "10 1      1        0.007270990 0         0             462            \n",
       "   CoapplicantIncome LoanAmount Loan_Amount_Term Credit_History Property_Area\n",
       "1  2533.47044         90.09948  360.7316          0.98924070    1            \n",
       "2  1519.58126         53.96926  359.8383          0.98696203    1            \n",
       "3    24.68071        102.69695  359.6281         -0.07854187    0            \n",
       "4  1234.00575        115.00828  178.6480          0.99026200    2            \n",
       "5  5506.00291        129.57623  359.6364          0.99490716    0            \n",
       "6  2693.04974        176.17221  360.6654          1.00704656    1            \n",
       "7  1949.72806        117.27761  361.0443          0.98617663    1            \n",
       "8  2882.20209        136.09887  361.7223          0.99460263    0            \n",
       "9   182.63109        191.73318  360.7231          0.98902865    1            \n",
       "10 2590.28657        119.75630  360.2763          0.99778939    1            \n",
       "   Loan_Status\n",
       "1  1          \n",
       "2  1          \n",
       "3  0          \n",
       "4  1          \n",
       "5  1          \n",
       "6  1          \n",
       "7  1          \n",
       "8  1          \n",
       "9  0          \n",
       "10 1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "tail(loan_data, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "204db5e4",
   "metadata": {
    "papermill": {
     "duration": 0.003424,
     "end_time": "2023-02-20T08:20:35.453963",
     "exception": false,
     "start_time": "2023-02-20T08:20:35.450539",
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
   "duration": 5.989802,
   "end_time": "2023-02-20T08:20:35.579958",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-20T08:20:29.590156",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
