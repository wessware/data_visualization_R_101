{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "7cfce9cc",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:19.432519Z",
     "iopub.status.busy": "2023-02-20T11:45:19.429811Z",
     "iopub.status.idle": "2023-02-20T11:45:20.846526Z",
     "shell.execute_reply": "2023-02-20T11:45:20.844865Z"
    },
    "papermill": {
     "duration": 1.428847,
     "end_time": "2023-02-20T11:45:20.848954",
     "exception": false,
     "start_time": "2023-02-20T11:45:19.420107",
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
   "id": "3e5a806f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:20.893509Z",
     "iopub.status.busy": "2023-02-20T11:45:20.863811Z",
     "iopub.status.idle": "2023-02-20T11:45:20.917992Z",
     "shell.execute_reply": "2023-02-20T11:45:20.916306Z"
    },
    "papermill": {
     "duration": 0.06478,
     "end_time": "2023-02-20T11:45:20.920285",
     "exception": false,
     "start_time": "2023-02-20T11:45:20.855505",
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
   "id": "71630c5f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:20.936152Z",
     "iopub.status.busy": "2023-02-20T11:45:20.934711Z",
     "iopub.status.idle": "2023-02-20T11:45:21.233185Z",
     "shell.execute_reply": "2023-02-20T11:45:21.231321Z"
    },
    "papermill": {
     "duration": 0.309102,
     "end_time": "2023-02-20T11:45:21.235806",
     "exception": false,
     "start_time": "2023-02-20T11:45:20.926704",
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
   "execution_count": 4,
   "id": "fb73f8d5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.252180Z",
     "iopub.status.busy": "2023-02-20T11:45:21.250664Z",
     "iopub.status.idle": "2023-02-20T11:45:21.296231Z",
     "shell.execute_reply": "2023-02-20T11:45:21.294510Z"
    },
    "papermill": {
     "duration": 0.056206,
     "end_time": "2023-02-20T11:45:21.298611",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.242405",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "loan_data_1 <- read.table(file = '/kaggle/input/r-visualization-datasets/synthesized_loan_data.csv', header=TRUE, sep=',')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "fe88ea8d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.314810Z",
     "iopub.status.busy": "2023-02-20T11:45:21.313381Z",
     "iopub.status.idle": "2023-02-20T11:45:21.327736Z",
     "shell.execute_reply": "2023-02-20T11:45:21.326125Z"
    },
    "papermill": {
     "duration": 0.024775,
     "end_time": "2023-02-20T11:45:21.329920",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.305145",
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
   "execution_count": 6,
   "id": "ba14e34e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.346006Z",
     "iopub.status.busy": "2023-02-20T11:45:21.344546Z",
     "iopub.status.idle": "2023-02-20T11:45:21.360083Z",
     "shell.execute_reply": "2023-02-20T11:45:21.358556Z"
    },
    "papermill": {
     "duration": 0.025799,
     "end_time": "2023-02-20T11:45:21.362215",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.336416",
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
   "execution_count": 7,
   "id": "84250db5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.378978Z",
     "iopub.status.busy": "2023-02-20T11:45:21.377504Z",
     "iopub.status.idle": "2023-02-20T11:45:21.424233Z",
     "shell.execute_reply": "2023-02-20T11:45:21.422594Z"
    },
    "papermill": {
     "duration": 0.057544,
     "end_time": "2023-02-20T11:45:21.426548",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.369004",
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
       "<ol class=list-inline><li>'spec_tbl_df'</li><li>'tbl_df'</li><li>'tbl'</li><li>'data.frame'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'spec\\_tbl\\_df'\n",
       "\\item 'tbl\\_df'\n",
       "\\item 'tbl'\n",
       "\\item 'data.frame'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'spec_tbl_df'\n",
       "2. 'tbl_df'\n",
       "3. 'tbl'\n",
       "4. 'data.frame'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"spec_tbl_df\" \"tbl_df\"      \"tbl\"         \"data.frame\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "class(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "a6b18b70",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.444704Z",
     "iopub.status.busy": "2023-02-20T11:45:21.443222Z",
     "iopub.status.idle": "2023-02-20T11:45:21.461795Z",
     "shell.execute_reply": "2023-02-20T11:45:21.459345Z"
    },
    "papermill": {
     "duration": 0.03017,
     "end_time": "2023-02-20T11:45:21.464581",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.434411",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'data.frame'"
      ],
      "text/latex": [
       "'data.frame'"
      ],
      "text/markdown": [
       "'data.frame'"
      ],
      "text/plain": [
       "[1] \"data.frame\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "class(loan_data_1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "4f8b41b7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.482352Z",
     "iopub.status.busy": "2023-02-20T11:45:21.480897Z",
     "iopub.status.idle": "2023-02-20T11:45:21.497240Z",
     "shell.execute_reply": "2023-02-20T11:45:21.495522Z"
    },
    "papermill": {
     "duration": 0.027598,
     "end_time": "2023-02-20T11:45:21.499550",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.471952",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "4000"
      ],
      "text/latex": [
       "4000"
      ],
      "text/markdown": [
       "4000"
      ],
      "text/plain": [
       "[1] 4000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "nrow(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "bed277b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.517633Z",
     "iopub.status.busy": "2023-02-20T11:45:21.516201Z",
     "iopub.status.idle": "2023-02-20T11:45:21.532088Z",
     "shell.execute_reply": "2023-02-20T11:45:21.530500Z"
    },
    "papermill": {
     "duration": 0.027534,
     "end_time": "2023-02-20T11:45:21.534482",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.506948",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "12"
      ],
      "text/latex": [
       "12"
      ],
      "text/markdown": [
       "12"
      ],
      "text/plain": [
       "[1] 12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "ncol(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "10904d8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.552719Z",
     "iopub.status.busy": "2023-02-20T11:45:21.551189Z",
     "iopub.status.idle": "2023-02-20T11:45:21.570158Z",
     "shell.execute_reply": "2023-02-20T11:45:21.567929Z"
    },
    "papermill": {
     "duration": 0.030763,
     "end_time": "2023-02-20T11:45:21.572736",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.541973",
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
   "execution_count": 12,
   "id": "7d0c1a71",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.590953Z",
     "iopub.status.busy": "2023-02-20T11:45:21.589483Z",
     "iopub.status.idle": "2023-02-20T11:45:21.623953Z",
     "shell.execute_reply": "2023-02-20T11:45:21.621824Z"
    },
    "papermill": {
     "duration": 0.046112,
     "end_time": "2023-02-20T11:45:21.626385",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.580273",
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
   "execution_count": 13,
   "id": "bbf1ab1e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.646139Z",
     "iopub.status.busy": "2023-02-20T11:45:21.644570Z",
     "iopub.status.idle": "2023-02-20T11:45:21.669147Z",
     "shell.execute_reply": "2023-02-20T11:45:21.667023Z"
    },
    "papermill": {
     "duration": 0.036923,
     "end_time": "2023-02-20T11:45:21.671588",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.634665",
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
    "str(loan_data_1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "0c5dcd6e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.690193Z",
     "iopub.status.busy": "2023-02-20T11:45:21.688615Z",
     "iopub.status.idle": "2023-02-20T11:45:21.722033Z",
     "shell.execute_reply": "2023-02-20T11:45:21.720257Z"
    },
    "papermill": {
     "duration": 0.045726,
     "end_time": "2023-02-20T11:45:21.725079",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.679353",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Gender</th><th scope=col>Married</th><th scope=col>Dependents</th><th scope=col>Education</th><th scope=col>Self_Employed</th><th scope=col>ApplicantIncome</th><th scope=col>CoapplicantIncome</th><th scope=col>LoanAmount</th><th scope=col>Loan_Amount_Term</th><th scope=col>Credit_History</th><th scope=col>Property_Area</th><th scope=col>Loan_Status</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1.0154914</td><td>0</td><td>0</td><td> 60</td><td>2263.42674</td><td>120.26457</td><td>362.0349</td><td>0.9996177</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>2.7935501</td><td>1</td><td>2</td><td>299</td><td> 207.07874</td><td> 97.33355</td><td>185.8551</td><td>0.9944496</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0</td><td>0</td><td>1.0205754</td><td>0</td><td>1</td><td>497</td><td>-222.10515</td><td> 98.95750</td><td>361.4115</td><td>0.9991317</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td>0.9676278</td><td>0</td><td>0</td><td> 35</td><td>1874.20080</td><td>141.12198</td><td>360.4270</td><td>0.9992733</td><td>2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>1</td><td>1.9293541</td><td>0</td><td>0</td><td>340</td><td>  47.08091</td><td>322.93678</td><td>360.0139</td><td>0.9798815</td><td>0</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & Gender & Married & Dependents & Education & Self\\_Employed & ApplicantIncome & CoapplicantIncome & LoanAmount & Loan\\_Amount\\_Term & Credit\\_History & Property\\_Area & Loan\\_Status\\\\\n",
       "  & <int> & <int> & <dbl> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 1 & 1.0154914 & 0 & 0 &  60 & 2263.42674 & 120.26457 & 362.0349 & 0.9996177 & 2 & 1\\\\\n",
       "\t2 & 1 & 1 & 2.7935501 & 1 & 2 & 299 &  207.07874 &  97.33355 & 185.8551 & 0.9944496 & 1 & 1\\\\\n",
       "\t3 & 0 & 0 & 1.0205754 & 0 & 1 & 497 & -222.10515 &  98.95750 & 361.4115 & 0.9991317 & 0 & 1\\\\\n",
       "\t4 & 1 & 1 & 0.9676278 & 0 & 0 &  35 & 1874.20080 & 141.12198 & 360.4270 & 0.9992733 & 2 & 1\\\\\n",
       "\t5 & 1 & 1 & 1.9293541 & 0 & 0 & 340 &   47.08091 & 322.93678 & 360.0139 & 0.9798815 & 0 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 12\n",
       "\n",
       "| <!--/--> | Gender &lt;int&gt; | Married &lt;int&gt; | Dependents &lt;dbl&gt; | Education &lt;int&gt; | Self_Employed &lt;int&gt; | ApplicantIncome &lt;int&gt; | CoapplicantIncome &lt;dbl&gt; | LoanAmount &lt;dbl&gt; | Loan_Amount_Term &lt;dbl&gt; | Credit_History &lt;dbl&gt; | Property_Area &lt;int&gt; | Loan_Status &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 1 | 1.0154914 | 0 | 0 |  60 | 2263.42674 | 120.26457 | 362.0349 | 0.9996177 | 2 | 1 |\n",
       "| 2 | 1 | 1 | 2.7935501 | 1 | 2 | 299 |  207.07874 |  97.33355 | 185.8551 | 0.9944496 | 1 | 1 |\n",
       "| 3 | 0 | 0 | 1.0205754 | 0 | 1 | 497 | -222.10515 |  98.95750 | 361.4115 | 0.9991317 | 0 | 1 |\n",
       "| 4 | 1 | 1 | 0.9676278 | 0 | 0 |  35 | 1874.20080 | 141.12198 | 360.4270 | 0.9992733 | 2 | 1 |\n",
       "| 5 | 1 | 1 | 1.9293541 | 0 | 0 | 340 |   47.08091 | 322.93678 | 360.0139 | 0.9798815 | 0 | 1 |\n",
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
    "head(loan_data_1, 5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "d8d667e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.744631Z",
     "iopub.status.busy": "2023-02-20T11:45:21.742972Z",
     "iopub.status.idle": "2023-02-20T11:45:21.783998Z",
     "shell.execute_reply": "2023-02-20T11:45:21.782262Z"
    },
    "papermill": {
     "duration": 0.053381,
     "end_time": "2023-02-20T11:45:21.786378",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.732997",
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
   "execution_count": 16,
   "id": "ad98eded",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.806535Z",
     "iopub.status.busy": "2023-02-20T11:45:21.804892Z",
     "iopub.status.idle": "2023-02-20T11:45:21.838700Z",
     "shell.execute_reply": "2023-02-20T11:45:21.836975Z"
    },
    "papermill": {
     "duration": 0.046357,
     "end_time": "2023-02-20T11:45:21.840951",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.794594",
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
   "execution_count": 17,
   "id": "9e0af0e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.861517Z",
     "iopub.status.busy": "2023-02-20T11:45:21.859894Z",
     "iopub.status.idle": "2023-02-20T11:45:21.901044Z",
     "shell.execute_reply": "2023-02-20T11:45:21.899159Z"
    },
    "papermill": {
     "duration": 0.053633,
     "end_time": "2023-02-20T11:45:21.903468",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.849835",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 4000 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>LoanAmount</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>120.26457</td></tr>\n",
       "\t<tr><td> 97.33355</td></tr>\n",
       "\t<tr><td> 98.95750</td></tr>\n",
       "\t<tr><td>141.12198</td></tr>\n",
       "\t<tr><td>322.93678</td></tr>\n",
       "\t<tr><td>113.08243</td></tr>\n",
       "\t<tr><td> 71.73101</td></tr>\n",
       "\t<tr><td> 86.84224</td></tr>\n",
       "\t<tr><td>247.38132</td></tr>\n",
       "\t<tr><td> 57.52351</td></tr>\n",
       "\t<tr><td> 96.04693</td></tr>\n",
       "\t<tr><td>107.45529</td></tr>\n",
       "\t<tr><td>151.99357</td></tr>\n",
       "\t<tr><td> 82.46201</td></tr>\n",
       "\t<tr><td> 99.53966</td></tr>\n",
       "\t<tr><td>277.21209</td></tr>\n",
       "\t<tr><td>125.75830</td></tr>\n",
       "\t<tr><td> 80.32886</td></tr>\n",
       "\t<tr><td>154.05351</td></tr>\n",
       "\t<tr><td> 98.71319</td></tr>\n",
       "\t<tr><td> 99.38791</td></tr>\n",
       "\t<tr><td> 85.01376</td></tr>\n",
       "\t<tr><td>144.18466</td></tr>\n",
       "\t<tr><td> 77.37477</td></tr>\n",
       "\t<tr><td>157.52420</td></tr>\n",
       "\t<tr><td>148.11388</td></tr>\n",
       "\t<tr><td> 78.72279</td></tr>\n",
       "\t<tr><td> 98.56886</td></tr>\n",
       "\t<tr><td> 53.66302</td></tr>\n",
       "\t<tr><td>101.31484</td></tr>\n",
       "\t<tr><td>⋮</td></tr>\n",
       "\t<tr><td>132.14920</td></tr>\n",
       "\t<tr><td> 73.74107</td></tr>\n",
       "\t<tr><td> 85.04195</td></tr>\n",
       "\t<tr><td>161.04479</td></tr>\n",
       "\t<tr><td>127.37789</td></tr>\n",
       "\t<tr><td>252.45005</td></tr>\n",
       "\t<tr><td>156.33061</td></tr>\n",
       "\t<tr><td> 14.99938</td></tr>\n",
       "\t<tr><td>155.33278</td></tr>\n",
       "\t<tr><td>122.38441</td></tr>\n",
       "\t<tr><td>140.33676</td></tr>\n",
       "\t<tr><td> 91.16024</td></tr>\n",
       "\t<tr><td>163.31450</td></tr>\n",
       "\t<tr><td>152.43125</td></tr>\n",
       "\t<tr><td>104.79393</td></tr>\n",
       "\t<tr><td> 95.47853</td></tr>\n",
       "\t<tr><td> 60.61562</td></tr>\n",
       "\t<tr><td>131.42019</td></tr>\n",
       "\t<tr><td>121.58088</td></tr>\n",
       "\t<tr><td> 80.68963</td></tr>\n",
       "\t<tr><td> 90.09948</td></tr>\n",
       "\t<tr><td> 53.96926</td></tr>\n",
       "\t<tr><td>102.69695</td></tr>\n",
       "\t<tr><td>115.00828</td></tr>\n",
       "\t<tr><td>129.57623</td></tr>\n",
       "\t<tr><td>176.17221</td></tr>\n",
       "\t<tr><td>117.27761</td></tr>\n",
       "\t<tr><td>136.09887</td></tr>\n",
       "\t<tr><td>191.73318</td></tr>\n",
       "\t<tr><td>119.75630</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 4000 × 1\n",
       "\\begin{tabular}{l}\n",
       " LoanAmount\\\\\n",
       " <dbl>\\\\\n",
       "\\hline\n",
       "\t 120.26457\\\\\n",
       "\t  97.33355\\\\\n",
       "\t  98.95750\\\\\n",
       "\t 141.12198\\\\\n",
       "\t 322.93678\\\\\n",
       "\t 113.08243\\\\\n",
       "\t  71.73101\\\\\n",
       "\t  86.84224\\\\\n",
       "\t 247.38132\\\\\n",
       "\t  57.52351\\\\\n",
       "\t  96.04693\\\\\n",
       "\t 107.45529\\\\\n",
       "\t 151.99357\\\\\n",
       "\t  82.46201\\\\\n",
       "\t  99.53966\\\\\n",
       "\t 277.21209\\\\\n",
       "\t 125.75830\\\\\n",
       "\t  80.32886\\\\\n",
       "\t 154.05351\\\\\n",
       "\t  98.71319\\\\\n",
       "\t  99.38791\\\\\n",
       "\t  85.01376\\\\\n",
       "\t 144.18466\\\\\n",
       "\t  77.37477\\\\\n",
       "\t 157.52420\\\\\n",
       "\t 148.11388\\\\\n",
       "\t  78.72279\\\\\n",
       "\t  98.56886\\\\\n",
       "\t  53.66302\\\\\n",
       "\t 101.31484\\\\\n",
       "\t ⋮\\\\\n",
       "\t 132.14920\\\\\n",
       "\t  73.74107\\\\\n",
       "\t  85.04195\\\\\n",
       "\t 161.04479\\\\\n",
       "\t 127.37789\\\\\n",
       "\t 252.45005\\\\\n",
       "\t 156.33061\\\\\n",
       "\t  14.99938\\\\\n",
       "\t 155.33278\\\\\n",
       "\t 122.38441\\\\\n",
       "\t 140.33676\\\\\n",
       "\t  91.16024\\\\\n",
       "\t 163.31450\\\\\n",
       "\t 152.43125\\\\\n",
       "\t 104.79393\\\\\n",
       "\t  95.47853\\\\\n",
       "\t  60.61562\\\\\n",
       "\t 131.42019\\\\\n",
       "\t 121.58088\\\\\n",
       "\t  80.68963\\\\\n",
       "\t  90.09948\\\\\n",
       "\t  53.96926\\\\\n",
       "\t 102.69695\\\\\n",
       "\t 115.00828\\\\\n",
       "\t 129.57623\\\\\n",
       "\t 176.17221\\\\\n",
       "\t 117.27761\\\\\n",
       "\t 136.09887\\\\\n",
       "\t 191.73318\\\\\n",
       "\t 119.75630\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 4000 × 1\n",
       "\n",
       "| LoanAmount &lt;dbl&gt; |\n",
       "|---|\n",
       "| 120.26457 |\n",
       "|  97.33355 |\n",
       "|  98.95750 |\n",
       "| 141.12198 |\n",
       "| 322.93678 |\n",
       "| 113.08243 |\n",
       "|  71.73101 |\n",
       "|  86.84224 |\n",
       "| 247.38132 |\n",
       "|  57.52351 |\n",
       "|  96.04693 |\n",
       "| 107.45529 |\n",
       "| 151.99357 |\n",
       "|  82.46201 |\n",
       "|  99.53966 |\n",
       "| 277.21209 |\n",
       "| 125.75830 |\n",
       "|  80.32886 |\n",
       "| 154.05351 |\n",
       "|  98.71319 |\n",
       "|  99.38791 |\n",
       "|  85.01376 |\n",
       "| 144.18466 |\n",
       "|  77.37477 |\n",
       "| 157.52420 |\n",
       "| 148.11388 |\n",
       "|  78.72279 |\n",
       "|  98.56886 |\n",
       "|  53.66302 |\n",
       "| 101.31484 |\n",
       "| ⋮ |\n",
       "| 132.14920 |\n",
       "|  73.74107 |\n",
       "|  85.04195 |\n",
       "| 161.04479 |\n",
       "| 127.37789 |\n",
       "| 252.45005 |\n",
       "| 156.33061 |\n",
       "|  14.99938 |\n",
       "| 155.33278 |\n",
       "| 122.38441 |\n",
       "| 140.33676 |\n",
       "|  91.16024 |\n",
       "| 163.31450 |\n",
       "| 152.43125 |\n",
       "| 104.79393 |\n",
       "|  95.47853 |\n",
       "|  60.61562 |\n",
       "| 131.42019 |\n",
       "| 121.58088 |\n",
       "|  80.68963 |\n",
       "|  90.09948 |\n",
       "|  53.96926 |\n",
       "| 102.69695 |\n",
       "| 115.00828 |\n",
       "| 129.57623 |\n",
       "| 176.17221 |\n",
       "| 117.27761 |\n",
       "| 136.09887 |\n",
       "| 191.73318 |\n",
       "| 119.75630 |\n",
       "\n"
      ],
      "text/plain": [
       "     LoanAmount\n",
       "1    120.26457 \n",
       "2     97.33355 \n",
       "3     98.95750 \n",
       "4    141.12198 \n",
       "5    322.93678 \n",
       "6    113.08243 \n",
       "7     71.73101 \n",
       "8     86.84224 \n",
       "9    247.38132 \n",
       "10    57.52351 \n",
       "11    96.04693 \n",
       "12   107.45529 \n",
       "13   151.99357 \n",
       "14    82.46201 \n",
       "15    99.53966 \n",
       "16   277.21209 \n",
       "17   125.75830 \n",
       "18    80.32886 \n",
       "19   154.05351 \n",
       "20    98.71319 \n",
       "21    99.38791 \n",
       "22    85.01376 \n",
       "23   144.18466 \n",
       "24    77.37477 \n",
       "25   157.52420 \n",
       "26   148.11388 \n",
       "27    78.72279 \n",
       "28    98.56886 \n",
       "29    53.66302 \n",
       "30   101.31484 \n",
       "⋮    ⋮         \n",
       "3971 132.14920 \n",
       "3972  73.74107 \n",
       "3973  85.04195 \n",
       "3974 161.04479 \n",
       "3975 127.37789 \n",
       "3976 252.45005 \n",
       "3977 156.33061 \n",
       "3978  14.99938 \n",
       "3979 155.33278 \n",
       "3980 122.38441 \n",
       "3981 140.33676 \n",
       "3982  91.16024 \n",
       "3983 163.31450 \n",
       "3984 152.43125 \n",
       "3985 104.79393 \n",
       "3986  95.47853 \n",
       "3987  60.61562 \n",
       "3988 131.42019 \n",
       "3989 121.58088 \n",
       "3990  80.68963 \n",
       "3991  90.09948 \n",
       "3992  53.96926 \n",
       "3993 102.69695 \n",
       "3994 115.00828 \n",
       "3995 129.57623 \n",
       "3996 176.17221 \n",
       "3997 117.27761 \n",
       "3998 136.09887 \n",
       "3999 191.73318 \n",
       "4000 119.75630 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data['LoanAmount']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "61b4ec5f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.924451Z",
     "iopub.status.busy": "2023-02-20T11:45:21.922935Z",
     "iopub.status.idle": "2023-02-20T11:45:21.970847Z",
     "shell.execute_reply": "2023-02-20T11:45:21.969119Z"
    },
    "papermill": {
     "duration": 0.060666,
     "end_time": "2023-02-20T11:45:21.973007",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.912341",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 4000 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>LoanAmount</th><th scope=col>Loan_Status</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>120.26457</td><td>1</td></tr>\n",
       "\t<tr><td> 97.33355</td><td>1</td></tr>\n",
       "\t<tr><td> 98.95750</td><td>1</td></tr>\n",
       "\t<tr><td>141.12198</td><td>1</td></tr>\n",
       "\t<tr><td>322.93678</td><td>1</td></tr>\n",
       "\t<tr><td>113.08243</td><td>1</td></tr>\n",
       "\t<tr><td> 71.73101</td><td>0</td></tr>\n",
       "\t<tr><td> 86.84224</td><td>0</td></tr>\n",
       "\t<tr><td>247.38132</td><td>1</td></tr>\n",
       "\t<tr><td> 57.52351</td><td>1</td></tr>\n",
       "\t<tr><td> 96.04693</td><td>1</td></tr>\n",
       "\t<tr><td>107.45529</td><td>1</td></tr>\n",
       "\t<tr><td>151.99357</td><td>0</td></tr>\n",
       "\t<tr><td> 82.46201</td><td>1</td></tr>\n",
       "\t<tr><td> 99.53966</td><td>1</td></tr>\n",
       "\t<tr><td>277.21209</td><td>0</td></tr>\n",
       "\t<tr><td>125.75830</td><td>1</td></tr>\n",
       "\t<tr><td> 80.32886</td><td>1</td></tr>\n",
       "\t<tr><td>154.05351</td><td>1</td></tr>\n",
       "\t<tr><td> 98.71319</td><td>1</td></tr>\n",
       "\t<tr><td> 99.38791</td><td>1</td></tr>\n",
       "\t<tr><td> 85.01376</td><td>1</td></tr>\n",
       "\t<tr><td>144.18466</td><td>1</td></tr>\n",
       "\t<tr><td> 77.37477</td><td>1</td></tr>\n",
       "\t<tr><td>157.52420</td><td>1</td></tr>\n",
       "\t<tr><td>148.11388</td><td>0</td></tr>\n",
       "\t<tr><td> 78.72279</td><td>1</td></tr>\n",
       "\t<tr><td> 98.56886</td><td>0</td></tr>\n",
       "\t<tr><td> 53.66302</td><td>1</td></tr>\n",
       "\t<tr><td>101.31484</td><td>0</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>132.14920</td><td>1</td></tr>\n",
       "\t<tr><td> 73.74107</td><td>1</td></tr>\n",
       "\t<tr><td> 85.04195</td><td>1</td></tr>\n",
       "\t<tr><td>161.04479</td><td>1</td></tr>\n",
       "\t<tr><td>127.37789</td><td>1</td></tr>\n",
       "\t<tr><td>252.45005</td><td>1</td></tr>\n",
       "\t<tr><td>156.33061</td><td>1</td></tr>\n",
       "\t<tr><td> 14.99938</td><td>0</td></tr>\n",
       "\t<tr><td>155.33278</td><td>1</td></tr>\n",
       "\t<tr><td>122.38441</td><td>0</td></tr>\n",
       "\t<tr><td>140.33676</td><td>1</td></tr>\n",
       "\t<tr><td> 91.16024</td><td>1</td></tr>\n",
       "\t<tr><td>163.31450</td><td>1</td></tr>\n",
       "\t<tr><td>152.43125</td><td>0</td></tr>\n",
       "\t<tr><td>104.79393</td><td>1</td></tr>\n",
       "\t<tr><td> 95.47853</td><td>1</td></tr>\n",
       "\t<tr><td> 60.61562</td><td>0</td></tr>\n",
       "\t<tr><td>131.42019</td><td>1</td></tr>\n",
       "\t<tr><td>121.58088</td><td>1</td></tr>\n",
       "\t<tr><td> 80.68963</td><td>1</td></tr>\n",
       "\t<tr><td> 90.09948</td><td>1</td></tr>\n",
       "\t<tr><td> 53.96926</td><td>1</td></tr>\n",
       "\t<tr><td>102.69695</td><td>0</td></tr>\n",
       "\t<tr><td>115.00828</td><td>1</td></tr>\n",
       "\t<tr><td>129.57623</td><td>1</td></tr>\n",
       "\t<tr><td>176.17221</td><td>1</td></tr>\n",
       "\t<tr><td>117.27761</td><td>1</td></tr>\n",
       "\t<tr><td>136.09887</td><td>1</td></tr>\n",
       "\t<tr><td>191.73318</td><td>0</td></tr>\n",
       "\t<tr><td>119.75630</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 4000 × 2\n",
       "\\begin{tabular}{ll}\n",
       " LoanAmount & Loan\\_Status\\\\\n",
       " <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 120.26457 & 1\\\\\n",
       "\t  97.33355 & 1\\\\\n",
       "\t  98.95750 & 1\\\\\n",
       "\t 141.12198 & 1\\\\\n",
       "\t 322.93678 & 1\\\\\n",
       "\t 113.08243 & 1\\\\\n",
       "\t  71.73101 & 0\\\\\n",
       "\t  86.84224 & 0\\\\\n",
       "\t 247.38132 & 1\\\\\n",
       "\t  57.52351 & 1\\\\\n",
       "\t  96.04693 & 1\\\\\n",
       "\t 107.45529 & 1\\\\\n",
       "\t 151.99357 & 0\\\\\n",
       "\t  82.46201 & 1\\\\\n",
       "\t  99.53966 & 1\\\\\n",
       "\t 277.21209 & 0\\\\\n",
       "\t 125.75830 & 1\\\\\n",
       "\t  80.32886 & 1\\\\\n",
       "\t 154.05351 & 1\\\\\n",
       "\t  98.71319 & 1\\\\\n",
       "\t  99.38791 & 1\\\\\n",
       "\t  85.01376 & 1\\\\\n",
       "\t 144.18466 & 1\\\\\n",
       "\t  77.37477 & 1\\\\\n",
       "\t 157.52420 & 1\\\\\n",
       "\t 148.11388 & 0\\\\\n",
       "\t  78.72279 & 1\\\\\n",
       "\t  98.56886 & 0\\\\\n",
       "\t  53.66302 & 1\\\\\n",
       "\t 101.31484 & 0\\\\\n",
       "\t ⋮ & ⋮\\\\\n",
       "\t 132.14920 & 1\\\\\n",
       "\t  73.74107 & 1\\\\\n",
       "\t  85.04195 & 1\\\\\n",
       "\t 161.04479 & 1\\\\\n",
       "\t 127.37789 & 1\\\\\n",
       "\t 252.45005 & 1\\\\\n",
       "\t 156.33061 & 1\\\\\n",
       "\t  14.99938 & 0\\\\\n",
       "\t 155.33278 & 1\\\\\n",
       "\t 122.38441 & 0\\\\\n",
       "\t 140.33676 & 1\\\\\n",
       "\t  91.16024 & 1\\\\\n",
       "\t 163.31450 & 1\\\\\n",
       "\t 152.43125 & 0\\\\\n",
       "\t 104.79393 & 1\\\\\n",
       "\t  95.47853 & 1\\\\\n",
       "\t  60.61562 & 0\\\\\n",
       "\t 131.42019 & 1\\\\\n",
       "\t 121.58088 & 1\\\\\n",
       "\t  80.68963 & 1\\\\\n",
       "\t  90.09948 & 1\\\\\n",
       "\t  53.96926 & 1\\\\\n",
       "\t 102.69695 & 0\\\\\n",
       "\t 115.00828 & 1\\\\\n",
       "\t 129.57623 & 1\\\\\n",
       "\t 176.17221 & 1\\\\\n",
       "\t 117.27761 & 1\\\\\n",
       "\t 136.09887 & 1\\\\\n",
       "\t 191.73318 & 0\\\\\n",
       "\t 119.75630 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 4000 × 2\n",
       "\n",
       "| LoanAmount &lt;dbl&gt; | Loan_Status &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| 120.26457 | 1 |\n",
       "|  97.33355 | 1 |\n",
       "|  98.95750 | 1 |\n",
       "| 141.12198 | 1 |\n",
       "| 322.93678 | 1 |\n",
       "| 113.08243 | 1 |\n",
       "|  71.73101 | 0 |\n",
       "|  86.84224 | 0 |\n",
       "| 247.38132 | 1 |\n",
       "|  57.52351 | 1 |\n",
       "|  96.04693 | 1 |\n",
       "| 107.45529 | 1 |\n",
       "| 151.99357 | 0 |\n",
       "|  82.46201 | 1 |\n",
       "|  99.53966 | 1 |\n",
       "| 277.21209 | 0 |\n",
       "| 125.75830 | 1 |\n",
       "|  80.32886 | 1 |\n",
       "| 154.05351 | 1 |\n",
       "|  98.71319 | 1 |\n",
       "|  99.38791 | 1 |\n",
       "|  85.01376 | 1 |\n",
       "| 144.18466 | 1 |\n",
       "|  77.37477 | 1 |\n",
       "| 157.52420 | 1 |\n",
       "| 148.11388 | 0 |\n",
       "|  78.72279 | 1 |\n",
       "|  98.56886 | 0 |\n",
       "|  53.66302 | 1 |\n",
       "| 101.31484 | 0 |\n",
       "| ⋮ | ⋮ |\n",
       "| 132.14920 | 1 |\n",
       "|  73.74107 | 1 |\n",
       "|  85.04195 | 1 |\n",
       "| 161.04479 | 1 |\n",
       "| 127.37789 | 1 |\n",
       "| 252.45005 | 1 |\n",
       "| 156.33061 | 1 |\n",
       "|  14.99938 | 0 |\n",
       "| 155.33278 | 1 |\n",
       "| 122.38441 | 0 |\n",
       "| 140.33676 | 1 |\n",
       "|  91.16024 | 1 |\n",
       "| 163.31450 | 1 |\n",
       "| 152.43125 | 0 |\n",
       "| 104.79393 | 1 |\n",
       "|  95.47853 | 1 |\n",
       "|  60.61562 | 0 |\n",
       "| 131.42019 | 1 |\n",
       "| 121.58088 | 1 |\n",
       "|  80.68963 | 1 |\n",
       "|  90.09948 | 1 |\n",
       "|  53.96926 | 1 |\n",
       "| 102.69695 | 0 |\n",
       "| 115.00828 | 1 |\n",
       "| 129.57623 | 1 |\n",
       "| 176.17221 | 1 |\n",
       "| 117.27761 | 1 |\n",
       "| 136.09887 | 1 |\n",
       "| 191.73318 | 0 |\n",
       "| 119.75630 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "     LoanAmount Loan_Status\n",
       "1    120.26457  1          \n",
       "2     97.33355  1          \n",
       "3     98.95750  1          \n",
       "4    141.12198  1          \n",
       "5    322.93678  1          \n",
       "6    113.08243  1          \n",
       "7     71.73101  0          \n",
       "8     86.84224  0          \n",
       "9    247.38132  1          \n",
       "10    57.52351  1          \n",
       "11    96.04693  1          \n",
       "12   107.45529  1          \n",
       "13   151.99357  0          \n",
       "14    82.46201  1          \n",
       "15    99.53966  1          \n",
       "16   277.21209  0          \n",
       "17   125.75830  1          \n",
       "18    80.32886  1          \n",
       "19   154.05351  1          \n",
       "20    98.71319  1          \n",
       "21    99.38791  1          \n",
       "22    85.01376  1          \n",
       "23   144.18466  1          \n",
       "24    77.37477  1          \n",
       "25   157.52420  1          \n",
       "26   148.11388  0          \n",
       "27    78.72279  1          \n",
       "28    98.56886  0          \n",
       "29    53.66302  1          \n",
       "30   101.31484  0          \n",
       "⋮    ⋮          ⋮          \n",
       "3971 132.14920  1          \n",
       "3972  73.74107  1          \n",
       "3973  85.04195  1          \n",
       "3974 161.04479  1          \n",
       "3975 127.37789  1          \n",
       "3976 252.45005  1          \n",
       "3977 156.33061  1          \n",
       "3978  14.99938  0          \n",
       "3979 155.33278  1          \n",
       "3980 122.38441  0          \n",
       "3981 140.33676  1          \n",
       "3982  91.16024  1          \n",
       "3983 163.31450  1          \n",
       "3984 152.43125  0          \n",
       "3985 104.79393  1          \n",
       "3986  95.47853  1          \n",
       "3987  60.61562  0          \n",
       "3988 131.42019  1          \n",
       "3989 121.58088  1          \n",
       "3990  80.68963  1          \n",
       "3991  90.09948  1          \n",
       "3992  53.96926  1          \n",
       "3993 102.69695  0          \n",
       "3994 115.00828  1          \n",
       "3995 129.57623  1          \n",
       "3996 176.17221  1          \n",
       "3997 117.27761  1          \n",
       "3998 136.09887  1          \n",
       "3999 191.73318  0          \n",
       "4000 119.75630  1          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data[c('LoanAmount', 'Loan_Status')]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "54823c6d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:21.994545Z",
     "iopub.status.busy": "2023-02-20T11:45:21.993047Z",
     "iopub.status.idle": "2023-02-20T11:45:22.017511Z",
     "shell.execute_reply": "2023-02-20T11:45:22.009189Z"
    },
    "papermill": {
     "duration": 0.037973,
     "end_time": "2023-02-20T11:45:22.020193",
     "exception": false,
     "start_time": "2023-02-20T11:45:21.982220",
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
   "execution_count": 20,
   "id": "a6035b67",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.042499Z",
     "iopub.status.busy": "2023-02-20T11:45:22.040962Z",
     "iopub.status.idle": "2023-02-20T11:45:22.057745Z",
     "shell.execute_reply": "2023-02-20T11:45:22.056062Z"
    },
    "papermill": {
     "duration": 0.030222,
     "end_time": "2023-02-20T11:45:22.059988",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.029766",
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
       "<ol class=list-inline><li>1</li><li>1</li><li>0</li><li>1</li><li>1</li><li>1</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 1\n",
       "\\item 1\n",
       "\\item 0\n",
       "\\item 1\n",
       "\\item 1\n",
       "\\item 1\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 1\n",
       "2. 1\n",
       "3. 0\n",
       "4. 1\n",
       "5. 1\n",
       "6. 1\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 1 1 0 1 1 1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(loan_data$Gender)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "56501e6a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.082454Z",
     "iopub.status.busy": "2023-02-20T11:45:22.080960Z",
     "iopub.status.idle": "2023-02-20T11:45:22.092954Z",
     "shell.execute_reply": "2023-02-20T11:45:22.091266Z"
    },
    "papermill": {
     "duration": 0.026266,
     "end_time": "2023-02-20T11:45:22.095873",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.069607",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#converting characters to numerical values\n",
    "#loan_data <- type_convert(loan_data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "f2e605ff",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.118577Z",
     "iopub.status.busy": "2023-02-20T11:45:22.117024Z",
     "iopub.status.idle": "2023-02-20T11:45:22.143743Z",
     "shell.execute_reply": "2023-02-20T11:45:22.142005Z"
    },
    "papermill": {
     "duration": 0.040637,
     "end_time": "2023-02-20T11:45:22.146067",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.105430",
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
   "execution_count": 23,
   "id": "a869c46c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.169748Z",
     "iopub.status.busy": "2023-02-20T11:45:22.168084Z",
     "iopub.status.idle": "2023-02-20T11:45:22.291925Z",
     "shell.execute_reply": "2023-02-20T11:45:22.290183Z"
    },
    "papermill": {
     "duration": 0.138417,
     "end_time": "2023-02-20T11:45:22.294363",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.155946",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22m`funs()` was deprecated in dplyr 0.8.0.\n",
      "\u001b[36mℹ\u001b[39m Please use a list of either functions or lambdas:\n",
      "\n",
      "# Simple named list: list(mean = mean, median = median)\n",
      "\n",
      "# Auto named with `tibble::lst()`: tibble::lst(mean, median)\n",
      "\n",
      "# Using lambdas list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))”\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender</th><th scope=col>Married</th><th scope=col>Dependents</th><th scope=col>Education</th><th scope=col>Self_Employed</th><th scope=col>ApplicantIncome</th><th scope=col>CoapplicantIncome</th><th scope=col>LoanAmount</th><th scope=col>Loan_Amount_Term</th><th scope=col>Credit_History</th><th scope=col>Property_Area</th><th scope=col>Loan_Status</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0.82725</td><td>0.62175</td><td>0.7577812</td><td>0.31725</td><td>0.16725</td><td>266.4717</td><td>1697.632</td><td>130.4056</td><td>346.6711</td><td>0.8404388</td><td>0.8135</td><td>0.787</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Gender & Married & Dependents & Education & Self\\_Employed & ApplicantIncome & CoapplicantIncome & LoanAmount & Loan\\_Amount\\_Term & Credit\\_History & Property\\_Area & Loan\\_Status\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0.82725 & 0.62175 & 0.7577812 & 0.31725 & 0.16725 & 266.4717 & 1697.632 & 130.4056 & 346.6711 & 0.8404388 & 0.8135 & 0.787\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 12\n",
       "\n",
       "| Gender &lt;dbl&gt; | Married &lt;dbl&gt; | Dependents &lt;dbl&gt; | Education &lt;dbl&gt; | Self_Employed &lt;dbl&gt; | ApplicantIncome &lt;dbl&gt; | CoapplicantIncome &lt;dbl&gt; | LoanAmount &lt;dbl&gt; | Loan_Amount_Term &lt;dbl&gt; | Credit_History &lt;dbl&gt; | Property_Area &lt;dbl&gt; | Loan_Status &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 0.82725 | 0.62175 | 0.7577812 | 0.31725 | 0.16725 | 266.4717 | 1697.632 | 130.4056 | 346.6711 | 0.8404388 | 0.8135 | 0.787 |\n",
       "\n"
      ],
      "text/plain": [
       "  Gender  Married Dependents Education Self_Employed ApplicantIncome\n",
       "1 0.82725 0.62175 0.7577812  0.31725   0.16725       266.4717       \n",
       "  CoapplicantIncome LoanAmount Loan_Amount_Term Credit_History Property_Area\n",
       "1 1697.632          130.4056   346.6711         0.8404388      0.8135       \n",
       "  Loan_Status\n",
       "1 0.787      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summarise_all(loan_data, funs(mean))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "7e6eea10",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.318304Z",
     "iopub.status.busy": "2023-02-20T11:45:22.316811Z",
     "iopub.status.idle": "2023-02-20T11:45:22.362787Z",
     "shell.execute_reply": "2023-02-20T11:45:22.361164Z"
    },
    "papermill": {
     "duration": 0.060521,
     "end_time": "2023-02-20T11:45:22.365062",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.304541",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender_mean</th><th scope=col>Married_mean</th><th scope=col>Dependents_mean</th><th scope=col>Education_mean</th><th scope=col>Self_Employed_mean</th><th scope=col>ApplicantIncome_mean</th><th scope=col>CoapplicantIncome_mean</th><th scope=col>LoanAmount_mean</th><th scope=col>Loan_Amount_Term_mean</th><th scope=col>Credit_History_mean</th><th scope=col>Property_Area_mean</th><th scope=col>Loan_Status_mean</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0.82725</td><td>0.62175</td><td>0.7577812</td><td>0.31725</td><td>0.16725</td><td>266.4717</td><td>1697.632</td><td>130.4056</td><td>346.6711</td><td>0.8404388</td><td>0.8135</td><td>0.787</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Gender\\_mean & Married\\_mean & Dependents\\_mean & Education\\_mean & Self\\_Employed\\_mean & ApplicantIncome\\_mean & CoapplicantIncome\\_mean & LoanAmount\\_mean & Loan\\_Amount\\_Term\\_mean & Credit\\_History\\_mean & Property\\_Area\\_mean & Loan\\_Status\\_mean\\\\\n",
       " <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0.82725 & 0.62175 & 0.7577812 & 0.31725 & 0.16725 & 266.4717 & 1697.632 & 130.4056 & 346.6711 & 0.8404388 & 0.8135 & 0.787\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 12\n",
       "\n",
       "| Gender_mean &lt;dbl&gt; | Married_mean &lt;dbl&gt; | Dependents_mean &lt;dbl&gt; | Education_mean &lt;dbl&gt; | Self_Employed_mean &lt;dbl&gt; | ApplicantIncome_mean &lt;dbl&gt; | CoapplicantIncome_mean &lt;dbl&gt; | LoanAmount_mean &lt;dbl&gt; | Loan_Amount_Term_mean &lt;dbl&gt; | Credit_History_mean &lt;dbl&gt; | Property_Area_mean &lt;dbl&gt; | Loan_Status_mean &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 0.82725 | 0.62175 | 0.7577812 | 0.31725 | 0.16725 | 266.4717 | 1697.632 | 130.4056 | 346.6711 | 0.8404388 | 0.8135 | 0.787 |\n",
       "\n"
      ],
      "text/plain": [
       "  Gender_mean Married_mean Dependents_mean Education_mean Self_Employed_mean\n",
       "1 0.82725     0.62175      0.7577812       0.31725        0.16725           \n",
       "  ApplicantIncome_mean CoapplicantIncome_mean LoanAmount_mean\n",
       "1 266.4717             1697.632               130.4056       \n",
       "  Loan_Amount_Term_mean Credit_History_mean Property_Area_mean Loan_Status_mean\n",
       "1 346.6711              0.8404388           0.8135             0.787           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#mean, median, mode, min, max, sum\n",
    "summarise_all(loan_data, lst(mean))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "d9198861",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.389133Z",
     "iopub.status.busy": "2023-02-20T11:45:22.387633Z",
     "iopub.status.idle": "2023-02-20T11:45:22.417822Z",
     "shell.execute_reply": "2023-02-20T11:45:22.415520Z"
    },
    "papermill": {
     "duration": 0.045633,
     "end_time": "2023-02-20T11:45:22.420905",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.375272",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 1 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>averageAmount</th><th scope=col>sdRating</th><th scope=col>sumAmount</th><th scope=col>genderMode</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>130.4056</td><td>81.96639</td><td>521622.2</td><td>numeric</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 1 × 4\n",
       "\\begin{tabular}{llll}\n",
       " averageAmount & sdRating & sumAmount & genderMode\\\\\n",
       " <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 130.4056 & 81.96639 & 521622.2 & numeric\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 1 × 4\n",
       "\n",
       "| averageAmount &lt;dbl&gt; | sdRating &lt;dbl&gt; | sumAmount &lt;dbl&gt; | genderMode &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 130.4056 | 81.96639 | 521622.2 | numeric |\n",
       "\n"
      ],
      "text/plain": [
       "  averageAmount sdRating sumAmount genderMode\n",
       "1 130.4056      81.96639 521622.2  numeric   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data %>%\n",
    "    summarise(averageAmount = mean(LoanAmount), sdRating = sd(LoanAmount), sumAmount = sum(LoanAmount), genderMode = mode(Gender))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "83b31820",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.445488Z",
     "iopub.status.busy": "2023-02-20T11:45:22.443897Z",
     "iopub.status.idle": "2023-02-20T11:45:22.475824Z",
     "shell.execute_reply": "2023-02-20T11:45:22.474151Z"
    },
    "papermill": {
     "duration": 0.046597,
     "end_time": "2023-02-20T11:45:22.478167",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.431570",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Gender</th><th scope=col>averageAmount</th><th scope=col>sdAmount</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td> 91.40542</td><td>35.70358</td></tr>\n",
       "\t<tr><td>1</td><td>141.37775</td><td>88.15553</td></tr>\n",
       "\t<tr><td>2</td><td>113.36754</td><td>54.55682</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Gender & averageAmount & sdAmount\\\\\n",
       " <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 &  91.40542 & 35.70358\\\\\n",
       "\t 1 & 141.37775 & 88.15553\\\\\n",
       "\t 2 & 113.36754 & 54.55682\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 3\n",
       "\n",
       "| Gender &lt;dbl&gt; | averageAmount &lt;dbl&gt; | sdAmount &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 0 |  91.40542 | 35.70358 |\n",
       "| 1 | 141.37775 | 88.15553 |\n",
       "| 2 | 113.36754 | 54.55682 |\n",
       "\n"
      ],
      "text/plain": [
       "  Gender averageAmount sdAmount\n",
       "1 0       91.40542     35.70358\n",
       "2 1      141.37775     88.15553\n",
       "3 2      113.36754     54.55682"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data %>%\n",
    "    group_by(Gender) %>%\n",
    "    summarise(averageAmount = mean(LoanAmount),\n",
    "             sdAmount = sd(LoanAmount))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "4776bcc5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.503231Z",
     "iopub.status.busy": "2023-02-20T11:45:22.501691Z",
     "iopub.status.idle": "2023-02-20T11:45:22.530428Z",
     "shell.execute_reply": "2023-02-20T11:45:22.528777Z"
    },
    "papermill": {
     "duration": 0.04369,
     "end_time": "2023-02-20T11:45:22.532732",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.489042",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Education</th><th scope=col>averageAmount</th><th scope=col>sdAmount</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>144.0091</td><td>91.05846</td></tr>\n",
       "\t<tr><td>1</td><td>101.1295</td><td>45.61195</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Education & averageAmount & sdAmount\\\\\n",
       " <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 & 144.0091 & 91.05846\\\\\n",
       "\t 1 & 101.1295 & 45.61195\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| Education &lt;dbl&gt; | averageAmount &lt;dbl&gt; | sdAmount &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 0 | 144.0091 | 91.05846 |\n",
       "| 1 | 101.1295 | 45.61195 |\n",
       "\n"
      ],
      "text/plain": [
       "  Education averageAmount sdAmount\n",
       "1 0         144.0091      91.05846\n",
       "2 1         101.1295      45.61195"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data %>%\n",
    "    group_by(Education) %>%\n",
    "    summarise(averageAmount = mean(LoanAmount),\n",
    "             sdAmount = sd(LoanAmount))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "37f2196a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.557801Z",
     "iopub.status.busy": "2023-02-20T11:45:22.556272Z",
     "iopub.status.idle": "2023-02-20T11:45:22.585279Z",
     "shell.execute_reply": "2023-02-20T11:45:22.583592Z"
    },
    "papermill": {
     "duration": 0.044196,
     "end_time": "2023-02-20T11:45:22.587742",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.543546",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 3 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Married</th><th scope=col>averageAmount</th><th scope=col>sdAmount</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td> 96.9995</td><td>39.10600</td></tr>\n",
       "\t<tr><td>1</td><td>151.3371</td><td>94.05081</td></tr>\n",
       "\t<tr><td>2</td><td>116.6471</td><td>58.24950</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 3 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Married & averageAmount & sdAmount\\\\\n",
       " <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 &  96.9995 & 39.10600\\\\\n",
       "\t 1 & 151.3371 & 94.05081\\\\\n",
       "\t 2 & 116.6471 & 58.24950\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 3 × 3\n",
       "\n",
       "| Married &lt;dbl&gt; | averageAmount &lt;dbl&gt; | sdAmount &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 0 |  96.9995 | 39.10600 |\n",
       "| 1 | 151.3371 | 94.05081 |\n",
       "| 2 | 116.6471 | 58.24950 |\n",
       "\n"
      ],
      "text/plain": [
       "  Married averageAmount sdAmount\n",
       "1 0        96.9995      39.10600\n",
       "2 1       151.3371      94.05081\n",
       "3 2       116.6471      58.24950"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data %>%\n",
    "    group_by(Married) %>%\n",
    "    summarise(averageAmount = mean(LoanAmount),\n",
    "             sdAmount = sd(LoanAmount))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "d40fc346",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-20T11:45:22.613631Z",
     "iopub.status.busy": "2023-02-20T11:45:22.612124Z",
     "iopub.status.idle": "2023-02-20T11:45:22.640335Z",
     "shell.execute_reply": "2023-02-20T11:45:22.638705Z"
    },
    "papermill": {
     "duration": 0.043656,
     "end_time": "2023-02-20T11:45:22.642573",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.598917",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Loan_Status</th><th scope=col>averageAmount</th><th scope=col>sdAmount</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>151.9754</td><td>107.79394</td></tr>\n",
       "\t<tr><td>1</td><td>124.5677</td><td> 72.35502</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Loan\\_Status & averageAmount & sdAmount\\\\\n",
       " <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 & 151.9754 & 107.79394\\\\\n",
       "\t 1 & 124.5677 &  72.35502\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| Loan_Status &lt;dbl&gt; | averageAmount &lt;dbl&gt; | sdAmount &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 0 | 151.9754 | 107.79394 |\n",
       "| 1 | 124.5677 |  72.35502 |\n",
       "\n"
      ],
      "text/plain": [
       "  Loan_Status averageAmount sdAmount \n",
       "1 0           151.9754      107.79394\n",
       "2 1           124.5677       72.35502"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "loan_data %>%\n",
    "    group_by(Loan_Status) %>%\n",
    "    summarise(averageAmount = mean(LoanAmount),\n",
    "             sdAmount = sd(LoanAmount))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "6884e46e",
   "metadata": {
    "papermill": {
     "duration": 0.011754,
     "end_time": "2023-02-20T11:45:22.665477",
     "exception": false,
     "start_time": "2023-02-20T11:45:22.653723",
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
   "duration": 6.899658,
   "end_time": "2023-02-20T11:45:22.804124",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-20T11:45:15.904466",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
