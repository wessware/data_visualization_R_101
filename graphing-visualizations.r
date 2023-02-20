{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "da39e7aa",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-20T09:28:32.190413Z",
     "iopub.status.busy": "2023-02-20T09:28:32.188500Z",
     "iopub.status.idle": "2023-02-20T09:28:33.715214Z",
     "shell.execute_reply": "2023-02-20T09:28:33.713335Z"
    },
    "papermill": {
     "duration": 1.534957,
     "end_time": "2023-02-20T09:28:33.718408",
     "exception": false,
     "start_time": "2023-02-20T09:28:32.183451",
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
    "library(tidyverse) "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "25b7b91d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:28:33.755682Z",
     "iopub.status.busy": "2023-02-20T09:28:33.725008Z",
     "iopub.status.idle": "2023-02-20T09:28:34.099851Z",
     "shell.execute_reply": "2023-02-20T09:28:34.096997Z"
    },
    "papermill": {
     "duration": 0.382259,
     "end_time": "2023-02-20T09:28:34.103212",
     "exception": false,
     "start_time": "2023-02-20T09:28:33.720953",
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
    "loan_data <- read_csv('/kaggle/input/r-visualization-datasets/synthesized_loan_data.csv', col_names=TRUE, col_types=NULL)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ad453d85",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:28:34.111762Z",
     "iopub.status.busy": "2023-02-20T09:28:34.110252Z",
     "iopub.status.idle": "2023-02-20T09:28:34.131869Z",
     "shell.execute_reply": "2023-02-20T09:28:34.129416Z"
    },
    "papermill": {
     "duration": 0.028602,
     "end_time": "2023-02-20T09:28:34.134535",
     "exception": false,
     "start_time": "2023-02-20T09:28:34.105933",
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
   "execution_count": 4,
   "id": "5196368e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:28:34.143724Z",
     "iopub.status.busy": "2023-02-20T09:28:34.142211Z",
     "iopub.status.idle": "2023-02-20T09:28:34.159399Z",
     "shell.execute_reply": "2023-02-20T09:28:34.157617Z"
    },
    "papermill": {
     "duration": 0.024406,
     "end_time": "2023-02-20T09:28:34.161851",
     "exception": false,
     "start_time": "2023-02-20T09:28:34.137445",
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
   "id": "70e26f35",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:28:34.171839Z",
     "iopub.status.busy": "2023-02-20T09:28:34.170213Z",
     "iopub.status.idle": "2023-02-20T09:28:34.207315Z",
     "shell.execute_reply": "2023-02-20T09:28:34.204153Z"
    },
    "papermill": {
     "duration": 0.046799,
     "end_time": "2023-02-20T09:28:34.211840",
     "exception": false,
     "start_time": "2023-02-20T09:28:34.165041",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "spc_tbl_ [4,000 × 12] (S3: spec_tbl_df/tbl_df/tbl/data.frame)\n",
      " $ Gender           : num [1:4000] 1 1 0 1 1 1 1 2 1 1 ...\n",
      " $ Married          : num [1:4000] 1 1 0 1 1 1 1 0 1 1 ...\n",
      " $ Dependents       : num [1:4000] 1.015 2.794 1.021 0.968 1.929 ...\n",
      " $ Education        : num [1:4000] 0 1 0 0 0 0 0 1 0 1 ...\n",
      " $ Self_Employed    : num [1:4000] 0 2 1 0 0 1 1 0 0 0 ...\n",
      " $ ApplicantIncome  : num [1:4000] 60 299 497 35 340 217 493 118 429 371 ...\n",
      " $ CoapplicantIncome: num [1:4000] 2263.4 207.1 -222.1 1874.2 47.1 ...\n",
      " $ LoanAmount       : num [1:4000] 120.3 97.3 99 141.1 322.9 ...\n",
      " $ Loan_Amount_Term : num [1:4000] 362 186 361 360 360 ...\n",
      " $ Credit_History   : num [1:4000] 1 0.994 0.999 0.999 0.98 ...\n",
      " $ Property_Area    : num [1:4000] 2 1 0 2 0 1 0 0 1 0 ...\n",
      " $ Loan_Status      : num [1:4000] 1 1 1 1 1 1 0 0 1 1 ...\n",
      " - attr(*, \"spec\")=\n",
      "  .. cols(\n",
      "  ..   Gender = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Married = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Dependents = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Education = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Self_Employed = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   ApplicantIncome = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   CoapplicantIncome = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   LoanAmount = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Loan_Amount_Term = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Credit_History = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Property_Area = \u001b[32mcol_double()\u001b[39m,\n",
      "  ..   Loan_Status = \u001b[32mcol_double()\u001b[39m\n",
      "  .. )\n",
      " - attr(*, \"problems\")=<externalptr> \n"
     ]
    }
   ],
   "source": [
    "str(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "bcaa70aa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:28:34.222709Z",
     "iopub.status.busy": "2023-02-20T09:28:34.221112Z",
     "iopub.status.idle": "2023-02-20T09:28:34.251403Z",
     "shell.execute_reply": "2023-02-20T09:28:34.249164Z"
    },
    "papermill": {
     "duration": 0.039269,
     "end_time": "2023-02-20T09:28:34.254620",
     "exception": false,
     "start_time": "2023-02-20T09:28:34.215351",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     Gender          Married         Dependents          Education     \n",
       " Min.   :0.0000   Min.   :0.0000   Min.   :-0.094091   Min.   :0.0000  \n",
       " 1st Qu.:1.0000   1st Qu.:0.0000   1st Qu.:-0.008843   1st Qu.:0.0000  \n",
       " Median :1.0000   Median :1.0000   Median : 0.019169   Median :0.0000  \n",
       " Mean   :0.8273   Mean   :0.6218   Mean   : 0.757781   Mean   :0.3172  \n",
       " 3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.: 1.077978   3rd Qu.:1.0000  \n",
       " Max.   :2.0000   Max.   :2.0000   Max.   : 3.320750   Max.   :1.0000  \n",
       " Self_Employed    ApplicantIncome CoapplicantIncome   LoanAmount     \n",
       " Min.   :0.0000   Min.   :-44.0   Min.   : -377.6   Min.   : -7.707  \n",
       " 1st Qu.:0.0000   1st Qu.:132.0   1st Qu.:  130.2   1st Qu.: 88.172  \n",
       " Median :0.0000   Median :267.0   Median : 1751.3   Median :111.837  \n",
       " Mean   :0.1673   Mean   :266.5   Mean   : 1697.6   Mean   :130.406  \n",
       " 3rd Qu.:0.0000   3rd Qu.:396.2   3rd Qu.: 2393.1   3rd Qu.:140.772  \n",
       " Max.   :2.0000   Max.   :565.0   Max.   :39977.9   Max.   :788.614  \n",
       " Loan_Amount_Term Credit_History    Property_Area     Loan_Status   \n",
       " Min.   : 74.8    Min.   :-0.1445   Min.   :0.0000   Min.   :0.000  \n",
       " 1st Qu.:359.3    1st Qu.: 0.9864   1st Qu.:0.0000   1st Qu.:1.000  \n",
       " Median :360.4    Median : 0.9925   Median :1.0000   Median :1.000  \n",
       " Mean   :346.7    Mean   : 0.8404   Mean   :0.8135   Mean   :0.787  \n",
       " 3rd Qu.:361.3    3rd Qu.: 0.9973   3rd Qu.:1.0000   3rd Qu.:1.000  \n",
       " Max.   :514.5    Max.   : 1.0199   Max.   :2.0000   Max.   :1.000  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "404453f5",
   "metadata": {
    "papermill": {
     "duration": 0.003303,
     "end_time": "2023-02-20T09:28:34.261184",
     "exception": false,
     "start_time": "2023-02-20T09:28:34.257881",
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
   "duration": 5.898628,
   "end_time": "2023-02-20T09:28:34.416612",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-20T09:28:28.517984",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
