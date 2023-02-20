{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "bb77c991",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:05.669706Z",
     "iopub.status.busy": "2023-02-20T09:34:05.667474Z",
     "iopub.status.idle": "2023-02-20T09:34:06.967602Z",
     "shell.execute_reply": "2023-02-20T09:34:06.965658Z"
    },
    "papermill": {
     "duration": 1.308657,
     "end_time": "2023-02-20T09:34:06.970015",
     "exception": false,
     "start_time": "2023-02-20T09:34:05.661358",
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
   "id": "c2f9a597",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.006400Z",
     "iopub.status.busy": "2023-02-20T09:34:06.977522Z",
     "iopub.status.idle": "2023-02-20T09:34:07.292373Z",
     "shell.execute_reply": "2023-02-20T09:34:07.289849Z"
    },
    "papermill": {
     "duration": 0.322051,
     "end_time": "2023-02-20T09:34:07.295158",
     "exception": false,
     "start_time": "2023-02-20T09:34:06.973107",
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
   "id": "78f8ee03",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.304730Z",
     "iopub.status.busy": "2023-02-20T09:34:07.303321Z",
     "iopub.status.idle": "2023-02-20T09:34:07.321442Z",
     "shell.execute_reply": "2023-02-20T09:34:07.319804Z"
    },
    "papermill": {
     "duration": 0.025434,
     "end_time": "2023-02-20T09:34:07.323667",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.298233",
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
   "id": "4810dbe9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.333138Z",
     "iopub.status.busy": "2023-02-20T09:34:07.331690Z",
     "iopub.status.idle": "2023-02-20T09:34:07.349315Z",
     "shell.execute_reply": "2023-02-20T09:34:07.347505Z"
    },
    "papermill": {
     "duration": 0.024558,
     "end_time": "2023-02-20T09:34:07.351582",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.327024",
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
   "id": "f00d9ece",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.361500Z",
     "iopub.status.busy": "2023-02-20T09:34:07.359997Z",
     "iopub.status.idle": "2023-02-20T09:34:07.394294Z",
     "shell.execute_reply": "2023-02-20T09:34:07.392160Z"
    },
    "papermill": {
     "duration": 0.041963,
     "end_time": "2023-02-20T09:34:07.396955",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.354992",
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
   "id": "66fcfb3f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.407074Z",
     "iopub.status.busy": "2023-02-20T09:34:07.405596Z",
     "iopub.status.idle": "2023-02-20T09:34:07.432611Z",
     "shell.execute_reply": "2023-02-20T09:34:07.430929Z"
    },
    "papermill": {
     "duration": 0.034202,
     "end_time": "2023-02-20T09:34:07.434741",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.400539",
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
   "id": "9e94d3d8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.473627Z",
     "iopub.status.busy": "2023-02-20T09:34:07.443729Z",
     "iopub.status.idle": "2023-02-20T09:34:07.489068Z",
     "shell.execute_reply": "2023-02-20T09:34:07.487405Z"
    },
    "papermill": {
     "duration": 0.052863,
     "end_time": "2023-02-20T09:34:07.491372",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.438509",
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
   "id": "4dea6bb1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.502114Z",
     "iopub.status.busy": "2023-02-20T09:34:07.500690Z",
     "iopub.status.idle": "2023-02-20T09:34:07.985602Z",
     "shell.execute_reply": "2023-02-20T09:34:07.983684Z"
    },
    "papermill": {
     "duration": 0.492489,
     "end_time": "2023-02-20T09:34:07.987820",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.495331",
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
   "execution_count": 9,
   "id": "73c03a18",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T09:34:07.999387Z",
     "iopub.status.busy": "2023-02-20T09:34:07.997817Z",
     "iopub.status.idle": "2023-02-20T09:34:08.273368Z",
     "shell.execute_reply": "2023-02-20T09:34:08.271632Z"
    },
    "papermill": {
     "duration": 0.283543,
     "end_time": "2023-02-20T09:34:08.275689",
     "exception": false,
     "start_time": "2023-02-20T09:34:07.992146",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nAAAASUVORK5CYII="
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
    "  geom_bar(mapping = aes(x = Property_Area))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "b1bb9433",
   "metadata": {
    "papermill": {
     "duration": 0.004406,
     "end_time": "2023-02-20T09:34:08.284757",
     "exception": false,
     "start_time": "2023-02-20T09:34:08.280351",
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
   "duration": 6.054544,
   "end_time": "2023-02-20T09:34:08.411203",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-20T09:34:02.356659",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
