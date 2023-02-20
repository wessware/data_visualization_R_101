{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "6ecef796",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:00.148915Z",
     "iopub.status.busy": "2023-02-20T09:33:00.146740Z",
     "iopub.status.idle": "2023-02-20T09:33:01.833365Z",
     "shell.execute_reply": "2023-02-20T09:33:01.831087Z"
    },
    "papermill": {
     "duration": 1.69626,
     "end_time": "2023-02-20T09:33:01.836895",
     "exception": false,
     "start_time": "2023-02-20T09:33:00.140635",
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
   "id": "ce23ab74",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:01.878290Z",
     "iopub.status.busy": "2023-02-20T09:33:01.844550Z",
     "iopub.status.idle": "2023-02-20T09:33:02.244315Z",
     "shell.execute_reply": "2023-02-20T09:33:02.241363Z"
    },
    "papermill": {
     "duration": 0.40842,
     "end_time": "2023-02-20T09:33:02.248290",
     "exception": false,
     "start_time": "2023-02-20T09:33:01.839870",
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
   "id": "392acbe9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:02.257895Z",
     "iopub.status.busy": "2023-02-20T09:33:02.256271Z",
     "iopub.status.idle": "2023-02-20T09:33:02.281064Z",
     "shell.execute_reply": "2023-02-20T09:33:02.278266Z"
    },
    "papermill": {
     "duration": 0.033045,
     "end_time": "2023-02-20T09:33:02.284478",
     "exception": false,
     "start_time": "2023-02-20T09:33:02.251433",
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
   "id": "f75870e2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:02.294715Z",
     "iopub.status.busy": "2023-02-20T09:33:02.292863Z",
     "iopub.status.idle": "2023-02-20T09:33:02.314450Z",
     "shell.execute_reply": "2023-02-20T09:33:02.312098Z"
    },
    "papermill": {
     "duration": 0.030018,
     "end_time": "2023-02-20T09:33:02.317723",
     "exception": false,
     "start_time": "2023-02-20T09:33:02.287705",
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
   "id": "0044d440",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:02.328073Z",
     "iopub.status.busy": "2023-02-20T09:33:02.326375Z",
     "iopub.status.idle": "2023-02-20T09:33:02.371876Z",
     "shell.execute_reply": "2023-02-20T09:33:02.368625Z"
    },
    "papermill": {
     "duration": 0.055074,
     "end_time": "2023-02-20T09:33:02.376209",
     "exception": false,
     "start_time": "2023-02-20T09:33:02.321135",
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
   "id": "08145a16",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:02.388109Z",
     "iopub.status.busy": "2023-02-20T09:33:02.386277Z",
     "iopub.status.idle": "2023-02-20T09:33:02.464581Z",
     "shell.execute_reply": "2023-02-20T09:33:02.462274Z"
    },
    "papermill": {
     "duration": 0.087453,
     "end_time": "2023-02-20T09:33:02.467905",
     "exception": false,
     "start_time": "2023-02-20T09:33:02.380452",
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
   "execution_count": 7,
   "id": "93fe8fe5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:02.478751Z",
     "iopub.status.busy": "2023-02-20T09:33:02.476898Z",
     "iopub.status.idle": "2023-02-20T09:33:02.498404Z",
     "shell.execute_reply": "2023-02-20T09:33:02.496427Z"
    },
    "papermill": {
     "duration": 0.0298,
     "end_time": "2023-02-20T09:33:02.501340",
     "exception": false,
     "start_time": "2023-02-20T09:33:02.471540",
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
   "id": "e11e51c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:33:02.512628Z",
     "iopub.status.busy": "2023-02-20T09:33:02.511011Z",
     "iopub.status.idle": "2023-02-20T09:33:03.120624Z",
     "shell.execute_reply": "2023-02-20T09:33:03.118469Z"
    },
    "papermill": {
     "duration": 0.618404,
     "end_time": "2023-02-20T09:33:03.123679",
     "exception": false,
     "start_time": "2023-02-20T09:33:02.505275",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nSUVORK5CYII="
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
   "execution_count": null,
   "id": "3884f57f",
   "metadata": {
    "papermill": {
     "duration": 0.004111,
     "end_time": "2023-02-20T09:33:03.132338",
     "exception": false,
     "start_time": "2023-02-20T09:33:03.128227",
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
   "duration": 7.178896,
   "end_time": "2023-02-20T09:33:03.258370",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-20T09:32:56.079474",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
