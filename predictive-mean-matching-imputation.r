{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "7b5febd5",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2023-02-21T13:17:57.593221Z",
     "iopub.status.busy": "2023-02-21T13:17:57.590063Z",
     "iopub.status.idle": "2023-02-21T13:18:00.959860Z",
     "shell.execute_reply": "2023-02-21T13:18:00.957463Z"
    },
    "papermill": {
     "duration": 3.385697,
     "end_time": "2023-02-21T13:18:00.962930",
     "exception": false,
     "start_time": "2023-02-21T13:17:57.577233",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘mice’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    filter\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    cbind, rbind\n",
      "\n",
      "\n",
      "Loading required package: colorspace\n",
      "\n",
      "Loading required package: grid\n",
      "\n",
      "VIM is ready to use.\n",
      "\n",
      "\n",
      "Suggestions and bug-reports can be submitted at: https://github.com/statistikat/VIM/issues\n",
      "\n",
      "\n",
      "Attaching package: ‘VIM’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:datasets’:\n",
      "\n",
      "    sleep\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(writexl)\n",
    "library(mice)\n",
    "library(VIM)\n",
    "library(ggplot2)\n",
    "library(plyr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "f7df521a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:01.050470Z",
     "iopub.status.busy": "2023-02-21T13:18:00.991240Z",
     "iopub.status.idle": "2023-02-21T13:18:04.232018Z",
     "shell.execute_reply": "2023-02-21T13:18:04.229113Z"
    },
    "papermill": {
     "duration": 3.25996,
     "end_time": "2023-02-21T13:18:04.235967",
     "exception": false,
     "start_time": "2023-02-21T13:18:00.976007",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df <- read.table(file = '/kaggle/input/weather-australia/weather_data_australia.csv', header=TRUE, sep=',')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c67ecf59",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.259165Z",
     "iopub.status.busy": "2023-02-21T13:18:04.257287Z",
     "iopub.status.idle": "2023-02-21T13:18:04.320532Z",
     "shell.execute_reply": "2023-02-21T13:18:04.318320Z"
    },
    "papermill": {
     "duration": 0.07778,
     "end_time": "2023-02-21T13:18:04.323574",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.245794",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 23</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Date</th><th scope=col>Location</th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustDir</th><th scope=col>WindGustSpeed</th><th scope=col>WindDir9am</th><th scope=col>⋯</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainToday</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>⋯</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>12/1/2008 </td><td>Albury</td><td>13.4</td><td>22.9</td><td>0.6</td><td>NA</td><td>NA</td><td>W  </td><td>44</td><td>W  </td><td>⋯</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>12/2/2008 </td><td>Albury</td><td> 7.4</td><td>25.1</td><td>0.0</td><td>NA</td><td>NA</td><td>WNW</td><td>44</td><td>NNW</td><td>⋯</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12/3/2008 </td><td>Albury</td><td>12.9</td><td>25.7</td><td>0.0</td><td>NA</td><td>NA</td><td>WSW</td><td>46</td><td>W  </td><td>⋯</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>12/4/2008 </td><td>Albury</td><td> 9.2</td><td>28.0</td><td>0.0</td><td>NA</td><td>NA</td><td>NE </td><td>24</td><td>SE </td><td>⋯</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>12/5/2008 </td><td>Albury</td><td>17.5</td><td>32.3</td><td>1.0</td><td>NA</td><td>NA</td><td>W  </td><td>41</td><td>ENE</td><td>⋯</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>12/6/2008 </td><td>Albury</td><td>14.6</td><td>29.7</td><td>0.2</td><td>NA</td><td>NA</td><td>WNW</td><td>56</td><td>W  </td><td>⋯</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>NA</td><td>NA</td><td>20.6</td><td>28.9</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>12/7/2008 </td><td>Albury</td><td>14.3</td><td>25.0</td><td>0.0</td><td>NA</td><td>NA</td><td>W  </td><td>50</td><td>SW </td><td>⋯</td><td>49</td><td>19</td><td>1009.6</td><td>1008.2</td><td> 1</td><td>NA</td><td>18.1</td><td>24.6</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>12/8/2008 </td><td>Albury</td><td> 7.7</td><td>26.7</td><td>0.0</td><td>NA</td><td>NA</td><td>W  </td><td>35</td><td>SSE</td><td>⋯</td><td>48</td><td>19</td><td>1013.4</td><td>1010.1</td><td>NA</td><td>NA</td><td>16.3</td><td>25.5</td><td>No </td><td>2</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>12/9/2008 </td><td>Albury</td><td> 9.7</td><td>31.9</td><td>0.0</td><td>NA</td><td>NA</td><td>NNW</td><td>80</td><td>SE </td><td>⋯</td><td>42</td><td> 9</td><td>1008.9</td><td>1003.6</td><td>NA</td><td>NA</td><td>18.3</td><td>30.2</td><td>No </td><td>1</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>12/10/2008</td><td>Albury</td><td>13.1</td><td>30.1</td><td>1.4</td><td>NA</td><td>NA</td><td>W  </td><td>28</td><td>S  </td><td>⋯</td><td>58</td><td>27</td><td>1007.0</td><td>1005.7</td><td>NA</td><td>NA</td><td>20.1</td><td>28.2</td><td>Yes</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 23\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & Date & Location & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustDir & WindGustSpeed & WindDir9am & ⋯ & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainToday & RainTomorrow\\\\\n",
       "  & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <int> & <chr> & ⋯ & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 12/1/2008  & Albury & 13.4 & 22.9 & 0.6 & NA & NA & W   & 44 & W   & ⋯ & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8 & No  & 2\\\\\n",
       "\t2 & 12/2/2008  & Albury &  7.4 & 25.1 & 0.0 & NA & NA & WNW & 44 & NNW & ⋯ & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3 & No  & 2\\\\\n",
       "\t3 & 12/3/2008  & Albury & 12.9 & 25.7 & 0.0 & NA & NA & WSW & 46 & W   & ⋯ & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2 & No  & 2\\\\\n",
       "\t4 & 12/4/2008  & Albury &  9.2 & 28.0 & 0.0 & NA & NA & NE  & 24 & SE  & ⋯ & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5 & No  & 2\\\\\n",
       "\t5 & 12/5/2008  & Albury & 17.5 & 32.3 & 1.0 & NA & NA & W   & 41 & ENE & ⋯ & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7 & No  & 2\\\\\n",
       "\t6 & 12/6/2008  & Albury & 14.6 & 29.7 & 0.2 & NA & NA & WNW & 56 & W   & ⋯ & 55 & 23 & 1009.2 & 1005.4 & NA & NA & 20.6 & 28.9 & No  & 2\\\\\n",
       "\t7 & 12/7/2008  & Albury & 14.3 & 25.0 & 0.0 & NA & NA & W   & 50 & SW  & ⋯ & 49 & 19 & 1009.6 & 1008.2 &  1 & NA & 18.1 & 24.6 & No  & 2\\\\\n",
       "\t8 & 12/8/2008  & Albury &  7.7 & 26.7 & 0.0 & NA & NA & W   & 35 & SSE & ⋯ & 48 & 19 & 1013.4 & 1010.1 & NA & NA & 16.3 & 25.5 & No  & 2\\\\\n",
       "\t9 & 12/9/2008  & Albury &  9.7 & 31.9 & 0.0 & NA & NA & NNW & 80 & SE  & ⋯ & 42 &  9 & 1008.9 & 1003.6 & NA & NA & 18.3 & 30.2 & No  & 1\\\\\n",
       "\t10 & 12/10/2008 & Albury & 13.1 & 30.1 & 1.4 & NA & NA & W   & 28 & S   & ⋯ & 58 & 27 & 1007.0 & 1005.7 & NA & NA & 20.1 & 28.2 & Yes & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 23\n",
       "\n",
       "| <!--/--> | Date &lt;chr&gt; | Location &lt;chr&gt; | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustDir &lt;chr&gt; | WindGustSpeed &lt;int&gt; | WindDir9am &lt;chr&gt; | ⋯ ⋯ | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainToday &lt;chr&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 12/1/2008  | Albury | 13.4 | 22.9 | 0.6 | NA | NA | W   | 44 | W   | ⋯ | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 | No  | 2 |\n",
       "| 2 | 12/2/2008  | Albury |  7.4 | 25.1 | 0.0 | NA | NA | WNW | 44 | NNW | ⋯ | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 | No  | 2 |\n",
       "| 3 | 12/3/2008  | Albury | 12.9 | 25.7 | 0.0 | NA | NA | WSW | 46 | W   | ⋯ | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 | No  | 2 |\n",
       "| 4 | 12/4/2008  | Albury |  9.2 | 28.0 | 0.0 | NA | NA | NE  | 24 | SE  | ⋯ | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 | No  | 2 |\n",
       "| 5 | 12/5/2008  | Albury | 17.5 | 32.3 | 1.0 | NA | NA | W   | 41 | ENE | ⋯ | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 | No  | 2 |\n",
       "| 6 | 12/6/2008  | Albury | 14.6 | 29.7 | 0.2 | NA | NA | WNW | 56 | W   | ⋯ | 55 | 23 | 1009.2 | 1005.4 | NA | NA | 20.6 | 28.9 | No  | 2 |\n",
       "| 7 | 12/7/2008  | Albury | 14.3 | 25.0 | 0.0 | NA | NA | W   | 50 | SW  | ⋯ | 49 | 19 | 1009.6 | 1008.2 |  1 | NA | 18.1 | 24.6 | No  | 2 |\n",
       "| 8 | 12/8/2008  | Albury |  7.7 | 26.7 | 0.0 | NA | NA | W   | 35 | SSE | ⋯ | 48 | 19 | 1013.4 | 1010.1 | NA | NA | 16.3 | 25.5 | No  | 2 |\n",
       "| 9 | 12/9/2008  | Albury |  9.7 | 31.9 | 0.0 | NA | NA | NNW | 80 | SE  | ⋯ | 42 |  9 | 1008.9 | 1003.6 | NA | NA | 18.3 | 30.2 | No  | 1 |\n",
       "| 10 | 12/10/2008 | Albury | 13.1 | 30.1 | 1.4 | NA | NA | W   | 28 | S   | ⋯ | 58 | 27 | 1007.0 | 1005.7 | NA | NA | 20.1 | 28.2 | Yes | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "   Date       Location MinTemp MaxTemp Rainfall Evaporation Sunshine\n",
       "1  12/1/2008  Albury   13.4    22.9    0.6      NA          NA      \n",
       "2  12/2/2008  Albury    7.4    25.1    0.0      NA          NA      \n",
       "3  12/3/2008  Albury   12.9    25.7    0.0      NA          NA      \n",
       "4  12/4/2008  Albury    9.2    28.0    0.0      NA          NA      \n",
       "5  12/5/2008  Albury   17.5    32.3    1.0      NA          NA      \n",
       "6  12/6/2008  Albury   14.6    29.7    0.2      NA          NA      \n",
       "7  12/7/2008  Albury   14.3    25.0    0.0      NA          NA      \n",
       "8  12/8/2008  Albury    7.7    26.7    0.0      NA          NA      \n",
       "9  12/9/2008  Albury    9.7    31.9    0.0      NA          NA      \n",
       "10 12/10/2008 Albury   13.1    30.1    1.4      NA          NA      \n",
       "   WindGustDir WindGustSpeed WindDir9am ⋯ Humidity9am Humidity3pm Pressure9am\n",
       "1  W           44            W          ⋯ 71          22          1007.7     \n",
       "2  WNW         44            NNW        ⋯ 44          25          1010.6     \n",
       "3  WSW         46            W          ⋯ 38          30          1007.6     \n",
       "4  NE          24            SE         ⋯ 45          16          1017.6     \n",
       "5  W           41            ENE        ⋯ 82          33          1010.8     \n",
       "6  WNW         56            W          ⋯ 55          23          1009.2     \n",
       "7  W           50            SW         ⋯ 49          19          1009.6     \n",
       "8  W           35            SSE        ⋯ 48          19          1013.4     \n",
       "9  NNW         80            SE         ⋯ 42           9          1008.9     \n",
       "10 W           28            S          ⋯ 58          27          1007.0     \n",
       "   Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainToday RainTomorrow\n",
       "1  1007.1       8       NA       16.9    21.8    No        2           \n",
       "2  1007.8      NA       NA       17.2    24.3    No        2           \n",
       "3  1008.7      NA        2       21.0    23.2    No        2           \n",
       "4  1012.8      NA       NA       18.1    26.5    No        2           \n",
       "5  1006.0       7        8       17.8    29.7    No        2           \n",
       "6  1005.4      NA       NA       20.6    28.9    No        2           \n",
       "7  1008.2       1       NA       18.1    24.6    No        2           \n",
       "8  1010.1      NA       NA       16.3    25.5    No        2           \n",
       "9  1003.6      NA       NA       18.3    30.2    No        1           \n",
       "10 1005.7      NA       NA       20.1    28.2    Yes       2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "683561b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.348004Z",
     "iopub.status.busy": "2023-02-21T13:18:04.346188Z",
     "iopub.status.idle": "2023-02-21T13:18:04.368227Z",
     "shell.execute_reply": "2023-02-21T13:18:04.366261Z"
    },
    "papermill": {
     "duration": 0.037699,
     "end_time": "2023-02-21T13:18:04.370980",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.333281",
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
       "<ol class=list-inline><li>'Date'</li><li>'Location'</li><li>'MinTemp'</li><li>'MaxTemp'</li><li>'Rainfall'</li><li>'Evaporation'</li><li>'Sunshine'</li><li>'WindGustDir'</li><li>'WindGustSpeed'</li><li>'WindDir9am'</li><li>'WindDir3pm'</li><li>'WindSpeed9am'</li><li>'WindSpeed3pm'</li><li>'Humidity9am'</li><li>'Humidity3pm'</li><li>'Pressure9am'</li><li>'Pressure3pm'</li><li>'Cloud9am'</li><li>'Cloud3pm'</li><li>'Temp9am'</li><li>'Temp3pm'</li><li>'RainToday'</li><li>'RainTomorrow'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Date'\n",
       "\\item 'Location'\n",
       "\\item 'MinTemp'\n",
       "\\item 'MaxTemp'\n",
       "\\item 'Rainfall'\n",
       "\\item 'Evaporation'\n",
       "\\item 'Sunshine'\n",
       "\\item 'WindGustDir'\n",
       "\\item 'WindGustSpeed'\n",
       "\\item 'WindDir9am'\n",
       "\\item 'WindDir3pm'\n",
       "\\item 'WindSpeed9am'\n",
       "\\item 'WindSpeed3pm'\n",
       "\\item 'Humidity9am'\n",
       "\\item 'Humidity3pm'\n",
       "\\item 'Pressure9am'\n",
       "\\item 'Pressure3pm'\n",
       "\\item 'Cloud9am'\n",
       "\\item 'Cloud3pm'\n",
       "\\item 'Temp9am'\n",
       "\\item 'Temp3pm'\n",
       "\\item 'RainToday'\n",
       "\\item 'RainTomorrow'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Date'\n",
       "2. 'Location'\n",
       "3. 'MinTemp'\n",
       "4. 'MaxTemp'\n",
       "5. 'Rainfall'\n",
       "6. 'Evaporation'\n",
       "7. 'Sunshine'\n",
       "8. 'WindGustDir'\n",
       "9. 'WindGustSpeed'\n",
       "10. 'WindDir9am'\n",
       "11. 'WindDir3pm'\n",
       "12. 'WindSpeed9am'\n",
       "13. 'WindSpeed3pm'\n",
       "14. 'Humidity9am'\n",
       "15. 'Humidity3pm'\n",
       "16. 'Pressure9am'\n",
       "17. 'Pressure3pm'\n",
       "18. 'Cloud9am'\n",
       "19. 'Cloud3pm'\n",
       "20. 'Temp9am'\n",
       "21. 'Temp3pm'\n",
       "22. 'RainToday'\n",
       "23. 'RainTomorrow'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Date\"          \"Location\"      \"MinTemp\"       \"MaxTemp\"      \n",
       " [5] \"Rainfall\"      \"Evaporation\"   \"Sunshine\"      \"WindGustDir\"  \n",
       " [9] \"WindGustSpeed\" \"WindDir9am\"    \"WindDir3pm\"    \"WindSpeed9am\" \n",
       "[13] \"WindSpeed3pm\"  \"Humidity9am\"   \"Humidity3pm\"   \"Pressure9am\"  \n",
       "[17] \"Pressure3pm\"   \"Cloud9am\"      \"Cloud3pm\"      \"Temp9am\"      \n",
       "[21] \"Temp3pm\"       \"RainToday\"     \"RainTomorrow\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "2e6f339d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.394450Z",
     "iopub.status.busy": "2023-02-21T13:18:04.392438Z",
     "iopub.status.idle": "2023-02-21T13:18:04.415456Z",
     "shell.execute_reply": "2023-02-21T13:18:04.413050Z"
    },
    "papermill": {
     "duration": 0.038863,
     "end_time": "2023-02-21T13:18:04.419469",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.380606",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df_numerical <- df[c('MinTemp','MaxTemp','Rainfall','Evaporation','Sunshine','WindGustSpeed','WindSpeed9am','WindSpeed3pm','Humidity9am','Humidity3pm',\n",
    " 'Pressure9am',\n",
    " 'Pressure3pm',\n",
    " 'Cloud9am',\n",
    " 'Cloud3pm',\n",
    " 'Temp9am',\n",
    " 'Temp3pm', 'RainTomorrow')]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "cadf1d93",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.444141Z",
     "iopub.status.busy": "2023-02-21T13:18:04.442431Z",
     "iopub.status.idle": "2023-02-21T13:18:04.463782Z",
     "shell.execute_reply": "2023-02-21T13:18:04.461897Z"
    },
    "papermill": {
     "duration": 0.035847,
     "end_time": "2023-02-21T13:18:04.466250",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.430403",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.4800976213392"
      ],
      "text/latex": [
       "0.4800976213392"
      ],
      "text/markdown": [
       "0.4800976213392"
      ],
      "text/plain": [
       "[1] 0.4800976"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Sunshine))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "eea81132",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.489653Z",
     "iopub.status.busy": "2023-02-21T13:18:04.487937Z",
     "iopub.status.idle": "2023-02-21T13:18:04.509925Z",
     "shell.execute_reply": "2023-02-21T13:18:04.507834Z"
    },
    "papermill": {
     "duration": 0.036683,
     "end_time": "2023-02-21T13:18:04.512584",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.475901",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.431665062560154"
      ],
      "text/latex": [
       "0.431665062560154"
      ],
      "text/markdown": [
       "0.431665062560154"
      ],
      "text/plain": [
       "[1] 0.4316651"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Evaporation))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "8d931de9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.535942Z",
     "iopub.status.busy": "2023-02-21T13:18:04.534285Z",
     "iopub.status.idle": "2023-02-21T13:18:04.557482Z",
     "shell.execute_reply": "2023-02-21T13:18:04.555004Z"
    },
    "papermill": {
     "duration": 0.038431,
     "end_time": "2023-02-21T13:18:04.560719",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.522288",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$RainTomorrow))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "82ed4f01",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.584135Z",
     "iopub.status.busy": "2023-02-21T13:18:04.582360Z",
     "iopub.status.idle": "2023-02-21T13:18:04.605876Z",
     "shell.execute_reply": "2023-02-21T13:18:04.603186Z"
    },
    "papermill": {
     "duration": 0.039314,
     "end_time": "2023-02-21T13:18:04.609619",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.570305",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.384215591915303"
      ],
      "text/latex": [
       "0.384215591915303"
      ],
      "text/markdown": [
       "0.384215591915303"
      ],
      "text/plain": [
       "[1] 0.3842156"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Cloud9am))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "0c51f6e4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.633521Z",
     "iopub.status.busy": "2023-02-21T13:18:04.631736Z",
     "iopub.status.idle": "2023-02-21T13:18:04.676775Z",
     "shell.execute_reply": "2023-02-21T13:18:04.674016Z"
    },
    "papermill": {
     "duration": 0.060715,
     "end_time": "2023-02-21T13:18:04.680196",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.619481",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>13.4</td><td>22.9</td><td>0.6</td><td>NA</td><td>NA</td><td>44</td><td>20</td><td>24</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td> 7.4</td><td>25.1</td><td>0.0</td><td>NA</td><td>NA</td><td>44</td><td> 4</td><td>22</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12.9</td><td>25.7</td><td>0.0</td><td>NA</td><td>NA</td><td>46</td><td>19</td><td>26</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td> 9.2</td><td>28.0</td><td>0.0</td><td>NA</td><td>NA</td><td>24</td><td>11</td><td> 9</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>17.5</td><td>32.3</td><td>1.0</td><td>NA</td><td>NA</td><td>41</td><td> 7</td><td>20</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>14.6</td><td>29.7</td><td>0.2</td><td>NA</td><td>NA</td><td>56</td><td>19</td><td>24</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>NA</td><td>NA</td><td>20.6</td><td>28.9</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 17\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 13.4 & 22.9 & 0.6 & NA & NA & 44 & 20 & 24 & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8 & 2\\\\\n",
       "\t2 &  7.4 & 25.1 & 0.0 & NA & NA & 44 &  4 & 22 & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3 & 2\\\\\n",
       "\t3 & 12.9 & 25.7 & 0.0 & NA & NA & 46 & 19 & 26 & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2 & 2\\\\\n",
       "\t4 &  9.2 & 28.0 & 0.0 & NA & NA & 24 & 11 &  9 & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5 & 2\\\\\n",
       "\t5 & 17.5 & 32.3 & 1.0 & NA & NA & 41 &  7 & 20 & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7 & 2\\\\\n",
       "\t6 & 14.6 & 29.7 & 0.2 & NA & NA & 56 & 19 & 24 & 55 & 23 & 1009.2 & 1005.4 & NA & NA & 20.6 & 28.9 & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 17\n",
       "\n",
       "| <!--/--> | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustSpeed &lt;int&gt; | WindSpeed9am &lt;int&gt; | WindSpeed3pm &lt;int&gt; | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 13.4 | 22.9 | 0.6 | NA | NA | 44 | 20 | 24 | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 | 2 |\n",
       "| 2 |  7.4 | 25.1 | 0.0 | NA | NA | 44 |  4 | 22 | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 | 2 |\n",
       "| 3 | 12.9 | 25.7 | 0.0 | NA | NA | 46 | 19 | 26 | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 | 2 |\n",
       "| 4 |  9.2 | 28.0 | 0.0 | NA | NA | 24 | 11 |  9 | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 | 2 |\n",
       "| 5 | 17.5 | 32.3 | 1.0 | NA | NA | 41 |  7 | 20 | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 | 2 |\n",
       "| 6 | 14.6 | 29.7 | 0.2 | NA | NA | 56 | 19 | 24 | 55 | 23 | 1009.2 | 1005.4 | NA | NA | 20.6 | 28.9 | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed WindSpeed9am\n",
       "1 13.4    22.9    0.6      NA          NA       44            20          \n",
       "2  7.4    25.1    0.0      NA          NA       44             4          \n",
       "3 12.9    25.7    0.0      NA          NA       46            19          \n",
       "4  9.2    28.0    0.0      NA          NA       24            11          \n",
       "5 17.5    32.3    1.0      NA          NA       41             7          \n",
       "6 14.6    29.7    0.2      NA          NA       56            19          \n",
       "  WindSpeed3pm Humidity9am Humidity3pm Pressure9am Pressure3pm Cloud9am\n",
       "1 24           71          22          1007.7      1007.1       8      \n",
       "2 22           44          25          1010.6      1007.8      NA      \n",
       "3 26           38          30          1007.6      1008.7      NA      \n",
       "4  9           45          16          1017.6      1012.8      NA      \n",
       "5 20           82          33          1010.8      1006.0       7      \n",
       "6 24           55          23          1009.2      1005.4      NA      \n",
       "  Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "1 NA       16.9    21.8    2           \n",
       "2 NA       17.2    24.3    2           \n",
       "3  2       21.0    23.2    2           \n",
       "4 NA       18.1    26.5    2           \n",
       "5  8       17.8    29.7    2           \n",
       "6 NA       20.6    28.9    2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df_numerical)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "d03238fa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:04.704595Z",
     "iopub.status.busy": "2023-02-21T13:18:04.702826Z",
     "iopub.status.idle": "2023-02-21T13:18:11.690271Z",
     "shell.execute_reply": "2023-02-21T13:18:11.686178Z"
    },
    "papermill": {
     "duration": 7.003708,
     "end_time": "2023-02-21T13:18:11.694064",
     "exception": false,
     "start_time": "2023-02-21T13:18:04.690356",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A matrix: 658 × 18 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>RainTomorrow</th><th scope=col>MaxTemp</th><th scope=col>MinTemp</th><th scope=col>WindSpeed9am</th><th scope=col>Temp9am</th><th scope=col>Humidity9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Rainfall</th><th scope=col>Temp3pm</th><th scope=col>Humidity3pm</th><th scope=col>WindGustSpeed</th><th scope=col>Pressure3pm</th><th scope=col>Pressure9am</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col></th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>58236</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5989</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>1977</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>7688</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>1458</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>684</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>288</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2467</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>209</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>440</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>211</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2618</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>5743</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2515</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>1228</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>28630</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>33</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>21</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>1</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>5</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>1</td><td>0</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>0</td><td>1</td><td>0</td><td>1</td><td>0</td><td>0</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    10</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    10</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>   0</td><td>    1</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    11</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    1</td><td>    0</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>51</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   1</td><td>   1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    12</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    13</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    0</td><td>    0</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>63</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    1</td><td>    14</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    0</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    1</td><td>    15</td></tr>\n",
       "\t<tr><th scope=row>187</th><td>1</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    16</td></tr>\n",
       "\t<tr><th scope=row></th><td>0</td><td>1261</td><td>1485</td><td>1767</td><td>1767</td><td>2654</td><td>3062</td><td>3261</td><td>3609</td><td>4507</td><td>10263</td><td>15028</td><td>15065</td><td>55888</td><td>59358</td><td>62790</td><td>69835</td><td>311600</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A matrix: 658 × 18 of type dbl\n",
       "\\begin{tabular}{r|llllllllllllllllll}\n",
       "  & RainTomorrow & MaxTemp & MinTemp & WindSpeed9am & Temp9am & Humidity9am & WindSpeed3pm & Rainfall & Temp3pm & Humidity3pm & WindGustSpeed & Pressure3pm & Pressure9am & Cloud9am & Cloud3pm & Evaporation & Sunshine & \\\\\n",
       "\\hline\n",
       "\t58236 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0\\\\\n",
       "\t5989 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1\\\\\n",
       "\t1977 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1\\\\\n",
       "\t7688 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 2\\\\\n",
       "\t1458 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1\\\\\n",
       "\t684 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 2\\\\\n",
       "\t288 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 2\\\\\n",
       "\t2467 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 3\\\\\n",
       "\t209 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1\\\\\n",
       "\t440 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 2\\\\\n",
       "\t211 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 1 & 2\\\\\n",
       "\t2618 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 0 & 3\\\\\n",
       "\t5743 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 1 & 2\\\\\n",
       "\t2515 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 0 & 3\\\\\n",
       "\t1228 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 3\\\\\n",
       "\t28630 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 4\\\\\n",
       "\t33 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 1\\\\\n",
       "\t15 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 0 & 2\\\\\n",
       "\t2 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 1 & 2\\\\\n",
       "\t21 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 0 & 3\\\\\n",
       "\t1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 1 & 1 & 2\\\\\n",
       "\t3 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 0 & 0 & 4\\\\\n",
       "\t4 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 1 & 0 & 0 & 4\\\\\n",
       "\t1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 1 & 0 & 4\\\\\n",
       "\t12 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 0 & 0 & 0 & 0 & 5\\\\\n",
       "\t18 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 1 & 1\\\\\n",
       "\t5 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 1 & 1 & 0 & 2\\\\\n",
       "\t2 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 1 & 1 & 2\\\\\n",
       "\t2 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 1 & 0 & 0 & 0 & 4\\\\\n",
       "\t1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 1 & 0 & 1 & 0 & 1 & 0 & 0 & 4\\\\\n",
       "\t⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t1 & 1 &    0 &    0 &    1 &    0 &    0 &    1 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 & 1 &    0 &    0 &    1 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     1 &     0 &     0 &     0 &     0 &     13\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    1 &    1 &    0 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     1 &     0 &     10\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &    1 &     0 &     1 &     0 &     0 &     0 &     0 &     1 &     10\\\\\n",
       "\t2 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     1 &     0 &     0 &     11\\\\\n",
       "\t2 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     1 &     0 &     0 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     1 &     1 &     0 &     0 &     0 &     0 &     11\\\\\n",
       "\t2 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     1 &     0 &     0 &     1 &     0 &     0 &     11\\\\\n",
       "\t12 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     1 &     0 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t10 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     13\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &    0 &     1 &     1 &     1 &     0 &     0 &     0 &     0 &     12\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &    1 &     0 &     0 &     0 &     0 &     1 &     0 &     0 &     12\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     1 &     0 &     0 &     0 &     0 &     0 &     1 &     13\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     1 &     0 &     0 &     0 &     0 &     0 &     0 &     14\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     1 &     1 &     11\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     0 &     1 &     1 &     1 &     0 &     12\\\\\n",
       "\t3 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     1 &     14\\\\\n",
       "\t51 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     15\\\\\n",
       "\t3 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    1 &    1 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     14\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     1 &     0 &     0 &     0 &     0 &     0 &     0 &     15\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     1 &     1 &     12\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     1 &     0 &     13\\\\\n",
       "\t4 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     1 &     1 &     0 &     0 &     0 &     0 &     14\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     1 &     1 &     0 &     0 &     14\\\\\n",
       "\t63 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     1 &     1 &     14\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     1 &     0 &     15\\\\\n",
       "\t1 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     1 &     15\\\\\n",
       "\t187 & 1 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     16\\\\\n",
       "\t & 0 & 1261 & 1485 & 1767 & 1767 & 2654 & 3062 & 3261 & 3609 & 4507 & 10263 & 15028 & 15065 & 55888 & 59358 & 62790 & 69835 & 311600\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A matrix: 658 × 18 of type dbl\n",
       "\n",
       "| <!--/--> | RainTomorrow | MaxTemp | MinTemp | WindSpeed9am | Temp9am | Humidity9am | WindSpeed3pm | Rainfall | Temp3pm | Humidity3pm | WindGustSpeed | Pressure3pm | Pressure9am | Cloud9am | Cloud3pm | Evaporation | Sunshine | <!----> |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 58236 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 |\n",
       "| 5989 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 |\n",
       "| 1977 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 |\n",
       "| 7688 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 2 |\n",
       "| 1458 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 |\n",
       "| 684 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 2 |\n",
       "| 288 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 2 |\n",
       "| 2467 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 3 |\n",
       "| 209 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 |\n",
       "| 440 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 2 |\n",
       "| 211 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 2 |\n",
       "| 2618 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 3 |\n",
       "| 5743 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 2 |\n",
       "| 2515 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 3 |\n",
       "| 1228 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 3 |\n",
       "| 28630 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 4 |\n",
       "| 33 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 |\n",
       "| 15 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 2 |\n",
       "| 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 2 |\n",
       "| 21 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 3 |\n",
       "| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 1 | 2 |\n",
       "| 3 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 4 |\n",
       "| 4 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 4 |\n",
       "| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 4 |\n",
       "| 12 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 5 |\n",
       "| 18 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 1 | 1 |\n",
       "| 5 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 2 |\n",
       "| 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 2 |\n",
       "| 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 4 |\n",
       "| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 | 0 | 0 | 4 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 1 | 1 |    0 |    0 |    1 |    0 |    0 |    1 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 | 1 |    0 |    0 |    1 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     1 |     0 |     0 |     0 |     0 |     13 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    1 |    1 |    0 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     1 |     0 |     10 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |    1 |     0 |     1 |     0 |     0 |     0 |     0 |     1 |     10 |\n",
       "| 2 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     1 |     0 |     0 |     11 |\n",
       "| 2 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     1 |     0 |     0 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     1 |     1 |     0 |     0 |     0 |     0 |     11 |\n",
       "| 2 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     1 |     0 |     0 |     1 |     0 |     0 |     11 |\n",
       "| 12 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     1 |     0 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 10 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     13 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |    0 |     1 |     1 |     1 |     0 |     0 |     0 |     0 |     12 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |    1 |     0 |     0 |     0 |     0 |     1 |     0 |     0 |     12 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     1 |     0 |     0 |     0 |     0 |     0 |     1 |     13 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     1 |     0 |     0 |     0 |     0 |     0 |     0 |     14 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     1 |     1 |     11 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     0 |     1 |     1 |     1 |     0 |     12 |\n",
       "| 3 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     1 |     14 |\n",
       "| 51 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     15 |\n",
       "| 3 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    1 |    1 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     14 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     1 |     0 |     0 |     0 |     0 |     0 |     0 |     15 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     1 |     1 |     12 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     1 |     0 |     13 |\n",
       "| 4 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     1 |     1 |     0 |     0 |     0 |     0 |     14 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     1 |     1 |     0 |     0 |     14 |\n",
       "| 63 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     1 |     1 |     14 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     1 |     0 |     15 |\n",
       "| 1 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     1 |     15 |\n",
       "| 187 | 1 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     16 |\n",
       "| <!----> | 0 | 1261 | 1485 | 1767 | 1767 | 2654 | 3062 | 3261 | 3609 | 4507 | 10263 | 15028 | 15065 | 55888 | 59358 | 62790 | 69835 | 311600 |\n",
       "\n"
      ],
      "text/plain": [
       "      RainTomorrow MaxTemp MinTemp WindSpeed9am Temp9am Humidity9am\n",
       "58236 1            1       1       1            1       1          \n",
       "5989  1            1       1       1            1       1          \n",
       "1977  1            1       1       1            1       1          \n",
       "7688  1            1       1       1            1       1          \n",
       "1458  1            1       1       1            1       1          \n",
       "684   1            1       1       1            1       1          \n",
       "288   1            1       1       1            1       1          \n",
       "2467  1            1       1       1            1       1          \n",
       "209   1            1       1       1            1       1          \n",
       "440   1            1       1       1            1       1          \n",
       "211   1            1       1       1            1       1          \n",
       "2618  1            1       1       1            1       1          \n",
       "5743  1            1       1       1            1       1          \n",
       "2515  1            1       1       1            1       1          \n",
       "1228  1            1       1       1            1       1          \n",
       "28630 1            1       1       1            1       1          \n",
       "33    1            1       1       1            1       1          \n",
       "15    1            1       1       1            1       1          \n",
       "2     1            1       1       1            1       1          \n",
       "21    1            1       1       1            1       1          \n",
       "1     1            1       1       1            1       1          \n",
       "3     1            1       1       1            1       1          \n",
       "4     1            1       1       1            1       1          \n",
       "1     1            1       1       1            1       1          \n",
       "12    1            1       1       1            1       1          \n",
       "18    1            1       1       1            1       1          \n",
       "5     1            1       1       1            1       1          \n",
       "2     1            1       1       1            1       1          \n",
       "2     1            1       1       1            1       1          \n",
       "1     1            1       1       1            1       1          \n",
       "⋮     ⋮            ⋮       ⋮       ⋮            ⋮       ⋮          \n",
       "1     1               0       0       1            0       0       \n",
       "1     1               0       0       1            0       0       \n",
       "1     1               0       0       0            1       1       \n",
       "1     1               0       0       0            0       0       \n",
       "2     1               0       0       0            0       0       \n",
       "2     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "2     1               0       0       0            0       0       \n",
       "12    1               0       0       0            0       0       \n",
       "10    1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "3     1               0       0       0            0       0       \n",
       "51    1               0       0       0            0       0       \n",
       "3     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "4     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "63    1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "1     1               0       0       0            0       0       \n",
       "187   1               0       0       0            0       0       \n",
       "      0            1261    1485    1767         1767    2654       \n",
       "      WindSpeed3pm Rainfall Temp3pm Humidity3pm WindGustSpeed Pressure3pm\n",
       "58236 1            1        1       1           1             1          \n",
       "5989  1            1        1       1           1             1          \n",
       "1977  1            1        1       1           1             1          \n",
       "7688  1            1        1       1           1             1          \n",
       "1458  1            1        1       1           1             1          \n",
       "684   1            1        1       1           1             1          \n",
       "288   1            1        1       1           1             1          \n",
       "2467  1            1        1       1           1             1          \n",
       "209   1            1        1       1           1             1          \n",
       "440   1            1        1       1           1             1          \n",
       "211   1            1        1       1           1             1          \n",
       "2618  1            1        1       1           1             1          \n",
       "5743  1            1        1       1           1             1          \n",
       "2515  1            1        1       1           1             1          \n",
       "1228  1            1        1       1           1             1          \n",
       "28630 1            1        1       1           1             1          \n",
       "33    1            1        1       1           1             1          \n",
       "15    1            1        1       1           1             1          \n",
       "2     1            1        1       1           1             1          \n",
       "21    1            1        1       1           1             1          \n",
       "1     1            1        1       1           1             1          \n",
       "3     1            1        1       1           1             1          \n",
       "4     1            1        1       1           1             1          \n",
       "1     1            1        1       1           1             1          \n",
       "12    1            1        1       1           1             1          \n",
       "18    1            1        1       1           1             0          \n",
       "5     1            1        1       1           1             0          \n",
       "2     1            1        1       1           1             0          \n",
       "2     1            1        1       1           1             0          \n",
       "1     1            1        1       1           1             0          \n",
       "⋮     ⋮            ⋮        ⋮       ⋮           ⋮             ⋮          \n",
       "1        1            0        0       0            0             1      \n",
       "1        0            1        0       0            0             0      \n",
       "1        0            1        1       1            0             0      \n",
       "1        1            1        1       1            0             1      \n",
       "2        1            1        1       1            0             0      \n",
       "2        1            1        1       1            0             0      \n",
       "1        1            0        1       1            1             0      \n",
       "1        1            0        1       1            0             1      \n",
       "2        1            0        1       1            0             1      \n",
       "12       1            0        1       1            0             1      \n",
       "10       1            0        1       1            0             0      \n",
       "1        1            0        0       0            1             1      \n",
       "1        0            1        1       1            0             0      \n",
       "1        0            1        0       0            1             0      \n",
       "1        0            1        0       0            1             0      \n",
       "1        0            1        0       0            0             1      \n",
       "1        0            1        0       0            0             0      \n",
       "3        0            1        0       0            0             0      \n",
       "51       0            1        0       0            0             0      \n",
       "3        0            0        1       1            0             0      \n",
       "1        0            0        0       0            1             0      \n",
       "1        0            0        0       0            0             1      \n",
       "1        0            0        0       0            0             1      \n",
       "4        0            0        0       0            0             1      \n",
       "1        0            0        0       0            0             0      \n",
       "63       0            0        0       0            0             0      \n",
       "1        0            0        0       0            0             0      \n",
       "1        0            0        0       0            0             0      \n",
       "187      0            0        0       0            0             0      \n",
       "      3062         3261     3609    4507        10263         15028      \n",
       "      Pressure9am Cloud9am Cloud3pm Evaporation Sunshine       \n",
       "58236 1           1        1        1           1        0     \n",
       "5989  1           1        1        1           0        1     \n",
       "1977  1           1        1        0           1        1     \n",
       "7688  1           1        1        0           0        2     \n",
       "1458  1           1        0        1           1        1     \n",
       "684   1           1        0        1           0        2     \n",
       "288   1           1        0        0           1        2     \n",
       "2467  1           1        0        0           0        3     \n",
       "209   1           0        1        1           1        1     \n",
       "440   1           0        1        1           0        2     \n",
       "211   1           0        1        0           1        2     \n",
       "2618  1           0        1        0           0        3     \n",
       "5743  1           0        0        1           1        2     \n",
       "2515  1           0        0        1           0        3     \n",
       "1228  1           0        0        0           1        3     \n",
       "28630 1           0        0        0           0        4     \n",
       "33    0           1        1        1           1        1     \n",
       "15    0           1        1        1           0        2     \n",
       "2     0           1        1        0           1        2     \n",
       "21    0           1        1        0           0        3     \n",
       "1     0           1        0        1           1        2     \n",
       "3     0           1        0        0           0        4     \n",
       "4     0           0        1        0           0        4     \n",
       "1     0           0        0        1           0        4     \n",
       "12    0           0        0        0           0        5     \n",
       "18    1           1        1        1           1        1     \n",
       "5     1           1        1        1           0        2     \n",
       "2     1           1        0        1           1        2     \n",
       "2     1           1        0        0           0        4     \n",
       "1     1           0        1        0           0        4     \n",
       "⋮     ⋮           ⋮        ⋮        ⋮           ⋮        ⋮     \n",
       "1         1           0        0        0           0        12\n",
       "1         1           0        0        0           0        13\n",
       "1         0           0        0        1           0        10\n",
       "1         0           0        0        0           1        10\n",
       "2         0           0        1        0           0        11\n",
       "2         0           0        0        0           0        12\n",
       "1         0           0        0        0           0        12\n",
       "1         1           0        0        0           0        11\n",
       "2         0           0        1        0           0        11\n",
       "12        0           0        0        0           0        12\n",
       "10        0           0        0        0           0        13\n",
       "1         1           0        0        0           0        12\n",
       "1         0           0        1        0           0        12\n",
       "1         0           0        0        0           1        13\n",
       "1         0           0        0        0           0        14\n",
       "1         1           0        0        1           1        11\n",
       "1         0           1        1        1           0        12\n",
       "3         0           0        0        0           1        14\n",
       "51        0           0        0        0           0        15\n",
       "3         0           0        0        0           0        14\n",
       "1         0           0        0        0           0        15\n",
       "1         1           0        0        1           1        12\n",
       "1         1           0        0        1           0        13\n",
       "4         1           0        0        0           0        14\n",
       "1         0           1        1        0           0        14\n",
       "63        0           0        0        1           1        14\n",
       "1         0           0        0        1           0        15\n",
       "1         0           0        0        0           1        15\n",
       "187       0           0        0        0           0        16\n",
       "      15065       55888    59358    62790       69835    311600"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nqNCuAAAAAElFTkSuQmCC"
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
    "md.pattern(df_numerical)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "90c9865c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:11.724330Z",
     "iopub.status.busy": "2023-02-21T13:18:11.722537Z",
     "iopub.status.idle": "2023-02-21T13:18:13.005874Z",
     "shell.execute_reply": "2023-02-21T13:18:13.003702Z"
    },
    "papermill": {
     "duration": 1.301861,
     "end_time": "2023-02-21T13:18:13.008957",
     "exception": false,
     "start_time": "2023-02-21T13:18:11.707096",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<dl>\n",
       "\t<dt>$rr</dt>\n",
       "\t\t<dd><table class=\"dataframe\">\n",
       "<caption>A matrix: 17 × 17 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>MinTemp</th><td>143975</td><td>143579</td><td>141712</td><td>82012</td><td>74980</td><td>134457</td><td>142848</td><td>141452</td><td>142500</td><td>140528</td><td>130116</td><td>130105</td><td>89333</td><td>85861</td><td>143382</td><td>141419</td><td>143975</td></tr>\n",
       "\t<tr><th scope=row>MaxTemp</th><td>143579</td><td>144199</td><td>141729</td><td>82025</td><td>75011</td><td>134635</td><td>142807</td><td>141617</td><td>142427</td><td>140696</td><td>130148</td><td>130187</td><td>89290</td><td>85948</td><td>143306</td><td>141589</td><td>144199</td></tr>\n",
       "\t<tr><th scope=row>Rainfall</th><td>141712</td><td>141729</td><td>142199</td><td>81711</td><td>74379</td><td>132534</td><td>141108</td><td>139552</td><td>140645</td><td>138569</td><td>128259</td><td>128206</td><td>88868</td><td>85325</td><td>141514</td><td>139453</td><td>142199</td></tr>\n",
       "\t<tr><th scope=row>Evaporation</th><td> 82012</td><td> 82025</td><td> 81711</td><td>82670</td><td>71382</td><td> 77645</td><td> 82170</td><td> 81751</td><td> 81591</td><td> 80490</td><td> 81740</td><td> 81737</td><td>72281</td><td>69616</td><td> 81973</td><td> 80917</td><td> 82670</td></tr>\n",
       "\t<tr><th scope=row>Sunshine</th><td> 74980</td><td> 75011</td><td> 74379</td><td>71382</td><td>75625</td><td> 71110</td><td> 75385</td><td> 75160</td><td> 74674</td><td> 74497</td><td> 74942</td><td> 74934</td><td>66857</td><td>65253</td><td> 74946</td><td> 74745</td><td> 75625</td></tr>\n",
       "\t<tr><th scope=row>WindGustSpeed</th><td>134457</td><td>134635</td><td>132534</td><td>77645</td><td>71110</td><td>135197</td><td>134833</td><td>134898</td><td>133272</td><td>132791</td><td>124416</td><td>124457</td><td>81578</td><td>79511</td><td>134107</td><td>133649</td><td>135197</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed9am</th><td>142848</td><td>142807</td><td>141108</td><td>82170</td><td>75385</td><td>134833</td><td>143693</td><td>141844</td><td>141929</td><td>139721</td><td>130027</td><td>129929</td><td>89362</td><td>85807</td><td>142800</td><td>140606</td><td>143693</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed3pm</th><td>141452</td><td>141617</td><td>139552</td><td>81751</td><td>75160</td><td>134898</td><td>141844</td><td>142398</td><td>140298</td><td>140148</td><td>129270</td><td>129464</td><td>87903</td><td>85926</td><td>141160</td><td>141037</td><td>142398</td></tr>\n",
       "\t<tr><th scope=row>Humidity9am</th><td>142500</td><td>142427</td><td>140645</td><td>81591</td><td>74674</td><td>133272</td><td>141929</td><td>140298</td><td>142806</td><td>140186</td><td>129358</td><td>129258</td><td>89228</td><td>85681</td><td>142806</td><td>140345</td><td>142806</td></tr>\n",
       "\t<tr><th scope=row>Humidity3pm</th><td>140528</td><td>140696</td><td>138569</td><td>80490</td><td>74497</td><td>132791</td><td>139721</td><td>140148</td><td>140186</td><td>140953</td><td>127912</td><td>128110</td><td>87078</td><td>85786</td><td>140323</td><td>140953</td><td>140953</td></tr>\n",
       "\t<tr><th scope=row>Pressure9am</th><td>130116</td><td>130148</td><td>128259</td><td>81740</td><td>74942</td><td>124416</td><td>130027</td><td>129270</td><td>129358</td><td>127912</td><td>130395</td><td>130171</td><td>85827</td><td>83024</td><td>130158</td><td>128735</td><td>130395</td></tr>\n",
       "\t<tr><th scope=row>Pressure3pm</th><td>130105</td><td>130187</td><td>128206</td><td>81737</td><td>74934</td><td>124457</td><td>129929</td><td>129464</td><td>129258</td><td>128110</td><td>130171</td><td>130432</td><td>85819</td><td>83100</td><td>130059</td><td>128932</td><td>130432</td></tr>\n",
       "\t<tr><th scope=row>Cloud9am</th><td> 89333</td><td> 89290</td><td> 88868</td><td>72281</td><td>66857</td><td> 81578</td><td> 89362</td><td> 87903</td><td> 89228</td><td> 87078</td><td> 85827</td><td> 85819</td><td>89572</td><td>81958</td><td> 89453</td><td> 87328</td><td> 89572</td></tr>\n",
       "\t<tr><th scope=row>Cloud3pm</th><td> 85861</td><td> 85948</td><td> 85325</td><td>69616</td><td>65253</td><td> 79511</td><td> 85807</td><td> 85926</td><td> 85681</td><td> 85786</td><td> 83024</td><td> 83100</td><td>81958</td><td>86102</td><td> 85887</td><td> 86048</td><td> 86102</td></tr>\n",
       "\t<tr><th scope=row>Temp9am</th><td>143382</td><td>143306</td><td>141514</td><td>81973</td><td>74946</td><td>134107</td><td>142800</td><td>141160</td><td>142806</td><td>140323</td><td>130158</td><td>130059</td><td>89453</td><td>85887</td><td>143693</td><td>141213</td><td>143693</td></tr>\n",
       "\t<tr><th scope=row>Temp3pm</th><td>141419</td><td>141589</td><td>139453</td><td>80917</td><td>74745</td><td>133649</td><td>140606</td><td>141037</td><td>140345</td><td>140953</td><td>128735</td><td>128932</td><td>87328</td><td>86048</td><td>141213</td><td>141851</td><td>141851</td></tr>\n",
       "\t<tr><th scope=row>RainTomorrow</th><td>143975</td><td>144199</td><td>142199</td><td>82670</td><td>75625</td><td>135197</td><td>143693</td><td>142398</td><td>142806</td><td>140953</td><td>130395</td><td>130432</td><td>89572</td><td>86102</td><td>143693</td><td>141851</td><td>145460</td></tr>\n",
       "</tbody>\n",
       "</table>\n",
       "</dd>\n",
       "\t<dt>$rm</dt>\n",
       "\t\t<dd><table class=\"dataframe\">\n",
       "<caption>A matrix: 17 × 17 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>MinTemp</th><td>   0</td><td> 396</td><td>2263</td><td>61963</td><td>68995</td><td> 9518</td><td>1127</td><td>2523</td><td>1475</td><td>3447</td><td>13859</td><td>13870</td><td>54642</td><td>58114</td><td> 593</td><td>2556</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>MaxTemp</th><td> 620</td><td>   0</td><td>2470</td><td>62174</td><td>69188</td><td> 9564</td><td>1392</td><td>2582</td><td>1772</td><td>3503</td><td>14051</td><td>14012</td><td>54909</td><td>58251</td><td> 893</td><td>2610</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Rainfall</th><td> 487</td><td> 470</td><td>   0</td><td>60488</td><td>67820</td><td> 9665</td><td>1091</td><td>2647</td><td>1554</td><td>3630</td><td>13940</td><td>13993</td><td>53331</td><td>56874</td><td> 685</td><td>2746</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Evaporation</th><td> 658</td><td> 645</td><td> 959</td><td>    0</td><td>11288</td><td> 5025</td><td> 500</td><td> 919</td><td>1079</td><td>2180</td><td>  930</td><td>  933</td><td>10389</td><td>13054</td><td> 697</td><td>1753</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Sunshine</th><td> 645</td><td> 614</td><td>1246</td><td> 4243</td><td>    0</td><td> 4515</td><td> 240</td><td> 465</td><td> 951</td><td>1128</td><td>  683</td><td>  691</td><td> 8768</td><td>10372</td><td> 679</td><td> 880</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>WindGustSpeed</th><td> 740</td><td> 562</td><td>2663</td><td>57552</td><td>64087</td><td>    0</td><td> 364</td><td> 299</td><td>1925</td><td>2406</td><td>10781</td><td>10740</td><td>53619</td><td>55686</td><td>1090</td><td>1548</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed9am</th><td> 845</td><td> 886</td><td>2585</td><td>61523</td><td>68308</td><td> 8860</td><td>   0</td><td>1849</td><td>1764</td><td>3972</td><td>13666</td><td>13764</td><td>54331</td><td>57886</td><td> 893</td><td>3087</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed3pm</th><td> 946</td><td> 781</td><td>2846</td><td>60647</td><td>67238</td><td> 7500</td><td> 554</td><td>   0</td><td>2100</td><td>2250</td><td>13128</td><td>12934</td><td>54495</td><td>56472</td><td>1238</td><td>1361</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Humidity9am</th><td> 306</td><td> 379</td><td>2161</td><td>61215</td><td>68132</td><td> 9534</td><td> 877</td><td>2508</td><td>   0</td><td>2620</td><td>13448</td><td>13548</td><td>53578</td><td>57125</td><td>   0</td><td>2461</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Humidity3pm</th><td> 425</td><td> 257</td><td>2384</td><td>60463</td><td>66456</td><td> 8162</td><td>1232</td><td> 805</td><td> 767</td><td>   0</td><td>13041</td><td>12843</td><td>53875</td><td>55167</td><td> 630</td><td>   0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Pressure9am</th><td> 279</td><td> 247</td><td>2136</td><td>48655</td><td>55453</td><td> 5979</td><td> 368</td><td>1125</td><td>1037</td><td>2483</td><td>    0</td><td>  224</td><td>44568</td><td>47371</td><td> 237</td><td>1660</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Pressure3pm</th><td> 327</td><td> 245</td><td>2226</td><td>48695</td><td>55498</td><td> 5975</td><td> 503</td><td> 968</td><td>1174</td><td>2322</td><td>  261</td><td>    0</td><td>44613</td><td>47332</td><td> 373</td><td>1500</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Cloud9am</th><td> 239</td><td> 282</td><td> 704</td><td>17291</td><td>22715</td><td> 7994</td><td> 210</td><td>1669</td><td> 344</td><td>2494</td><td> 3745</td><td> 3753</td><td>    0</td><td> 7614</td><td> 119</td><td>2244</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Cloud3pm</th><td> 241</td><td> 154</td><td> 777</td><td>16486</td><td>20849</td><td> 6591</td><td> 295</td><td> 176</td><td> 421</td><td> 316</td><td> 3078</td><td> 3002</td><td> 4144</td><td>    0</td><td> 215</td><td>  54</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Temp9am</th><td> 311</td><td> 387</td><td>2179</td><td>61720</td><td>68747</td><td> 9586</td><td> 893</td><td>2533</td><td> 887</td><td>3370</td><td>13535</td><td>13634</td><td>54240</td><td>57806</td><td>   0</td><td>2480</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Temp3pm</th><td> 432</td><td> 262</td><td>2398</td><td>60934</td><td>67106</td><td> 8202</td><td>1245</td><td> 814</td><td>1506</td><td> 898</td><td>13116</td><td>12919</td><td>54523</td><td>55803</td><td> 638</td><td>   0</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>RainTomorrow</th><td>1485</td><td>1261</td><td>3261</td><td>62790</td><td>69835</td><td>10263</td><td>1767</td><td>3062</td><td>2654</td><td>4507</td><td>15065</td><td>15028</td><td>55888</td><td>59358</td><td>1767</td><td>3609</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n",
       "</dd>\n",
       "\t<dt>$mr</dt>\n",
       "\t\t<dd><table class=\"dataframe\">\n",
       "<caption>A matrix: 17 × 17 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>MinTemp</th><td>    0</td><td>  620</td><td>  487</td><td>  658</td><td>  645</td><td>  740</td><td>  845</td><td>  946</td><td>  306</td><td>  425</td><td>  279</td><td>  327</td><td>  239</td><td>  241</td><td>  311</td><td>  432</td><td> 1485</td></tr>\n",
       "\t<tr><th scope=row>MaxTemp</th><td>  396</td><td>    0</td><td>  470</td><td>  645</td><td>  614</td><td>  562</td><td>  886</td><td>  781</td><td>  379</td><td>  257</td><td>  247</td><td>  245</td><td>  282</td><td>  154</td><td>  387</td><td>  262</td><td> 1261</td></tr>\n",
       "\t<tr><th scope=row>Rainfall</th><td> 2263</td><td> 2470</td><td>    0</td><td>  959</td><td> 1246</td><td> 2663</td><td> 2585</td><td> 2846</td><td> 2161</td><td> 2384</td><td> 2136</td><td> 2226</td><td>  704</td><td>  777</td><td> 2179</td><td> 2398</td><td> 3261</td></tr>\n",
       "\t<tr><th scope=row>Evaporation</th><td>61963</td><td>62174</td><td>60488</td><td>    0</td><td> 4243</td><td>57552</td><td>61523</td><td>60647</td><td>61215</td><td>60463</td><td>48655</td><td>48695</td><td>17291</td><td>16486</td><td>61720</td><td>60934</td><td>62790</td></tr>\n",
       "\t<tr><th scope=row>Sunshine</th><td>68995</td><td>69188</td><td>67820</td><td>11288</td><td>    0</td><td>64087</td><td>68308</td><td>67238</td><td>68132</td><td>66456</td><td>55453</td><td>55498</td><td>22715</td><td>20849</td><td>68747</td><td>67106</td><td>69835</td></tr>\n",
       "\t<tr><th scope=row>WindGustSpeed</th><td> 9518</td><td> 9564</td><td> 9665</td><td> 5025</td><td> 4515</td><td>    0</td><td> 8860</td><td> 7500</td><td> 9534</td><td> 8162</td><td> 5979</td><td> 5975</td><td> 7994</td><td> 6591</td><td> 9586</td><td> 8202</td><td>10263</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed9am</th><td> 1127</td><td> 1392</td><td> 1091</td><td>  500</td><td>  240</td><td>  364</td><td>    0</td><td>  554</td><td>  877</td><td> 1232</td><td>  368</td><td>  503</td><td>  210</td><td>  295</td><td>  893</td><td> 1245</td><td> 1767</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed3pm</th><td> 2523</td><td> 2582</td><td> 2647</td><td>  919</td><td>  465</td><td>  299</td><td> 1849</td><td>    0</td><td> 2508</td><td>  805</td><td> 1125</td><td>  968</td><td> 1669</td><td>  176</td><td> 2533</td><td>  814</td><td> 3062</td></tr>\n",
       "\t<tr><th scope=row>Humidity9am</th><td> 1475</td><td> 1772</td><td> 1554</td><td> 1079</td><td>  951</td><td> 1925</td><td> 1764</td><td> 2100</td><td>    0</td><td>  767</td><td> 1037</td><td> 1174</td><td>  344</td><td>  421</td><td>  887</td><td> 1506</td><td> 2654</td></tr>\n",
       "\t<tr><th scope=row>Humidity3pm</th><td> 3447</td><td> 3503</td><td> 3630</td><td> 2180</td><td> 1128</td><td> 2406</td><td> 3972</td><td> 2250</td><td> 2620</td><td>    0</td><td> 2483</td><td> 2322</td><td> 2494</td><td>  316</td><td> 3370</td><td>  898</td><td> 4507</td></tr>\n",
       "\t<tr><th scope=row>Pressure9am</th><td>13859</td><td>14051</td><td>13940</td><td>  930</td><td>  683</td><td>10781</td><td>13666</td><td>13128</td><td>13448</td><td>13041</td><td>    0</td><td>  261</td><td> 3745</td><td> 3078</td><td>13535</td><td>13116</td><td>15065</td></tr>\n",
       "\t<tr><th scope=row>Pressure3pm</th><td>13870</td><td>14012</td><td>13993</td><td>  933</td><td>  691</td><td>10740</td><td>13764</td><td>12934</td><td>13548</td><td>12843</td><td>  224</td><td>    0</td><td> 3753</td><td> 3002</td><td>13634</td><td>12919</td><td>15028</td></tr>\n",
       "\t<tr><th scope=row>Cloud9am</th><td>54642</td><td>54909</td><td>53331</td><td>10389</td><td> 8768</td><td>53619</td><td>54331</td><td>54495</td><td>53578</td><td>53875</td><td>44568</td><td>44613</td><td>    0</td><td> 4144</td><td>54240</td><td>54523</td><td>55888</td></tr>\n",
       "\t<tr><th scope=row>Cloud3pm</th><td>58114</td><td>58251</td><td>56874</td><td>13054</td><td>10372</td><td>55686</td><td>57886</td><td>56472</td><td>57125</td><td>55167</td><td>47371</td><td>47332</td><td> 7614</td><td>    0</td><td>57806</td><td>55803</td><td>59358</td></tr>\n",
       "\t<tr><th scope=row>Temp9am</th><td>  593</td><td>  893</td><td>  685</td><td>  697</td><td>  679</td><td> 1090</td><td>  893</td><td> 1238</td><td>    0</td><td>  630</td><td>  237</td><td>  373</td><td>  119</td><td>  215</td><td>    0</td><td>  638</td><td> 1767</td></tr>\n",
       "\t<tr><th scope=row>Temp3pm</th><td> 2556</td><td> 2610</td><td> 2746</td><td> 1753</td><td>  880</td><td> 1548</td><td> 3087</td><td> 1361</td><td> 2461</td><td>    0</td><td> 1660</td><td> 1500</td><td> 2244</td><td>   54</td><td> 2480</td><td>    0</td><td> 3609</td></tr>\n",
       "\t<tr><th scope=row>RainTomorrow</th><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td></tr>\n",
       "</tbody>\n",
       "</table>\n",
       "</dd>\n",
       "\t<dt>$mm</dt>\n",
       "\t\t<dd><table class=\"dataframe\">\n",
       "<caption>A matrix: 17 × 17 of type dbl</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>MinTemp</th><td>1485</td><td> 865</td><td> 998</td><td>  827</td><td>  840</td><td>  745</td><td> 640</td><td> 539</td><td>1179</td><td>1060</td><td> 1206</td><td> 1158</td><td> 1246</td><td> 1244</td><td>1174</td><td>1053</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>MaxTemp</th><td> 865</td><td>1261</td><td> 791</td><td>  616</td><td>  647</td><td>  699</td><td> 375</td><td> 480</td><td> 882</td><td>1004</td><td> 1014</td><td> 1016</td><td>  979</td><td> 1107</td><td> 874</td><td> 999</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Rainfall</th><td> 998</td><td> 791</td><td>3261</td><td> 2302</td><td> 2015</td><td>  598</td><td> 676</td><td> 415</td><td>1100</td><td> 877</td><td> 1125</td><td> 1035</td><td> 2557</td><td> 2484</td><td>1082</td><td> 863</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Evaporation</th><td> 827</td><td> 616</td><td>2302</td><td>62790</td><td>58547</td><td> 5238</td><td>1267</td><td>2143</td><td>1575</td><td>2327</td><td>14135</td><td>14095</td><td>45499</td><td>46304</td><td>1070</td><td>1856</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Sunshine</th><td> 840</td><td> 647</td><td>2015</td><td>58547</td><td>69835</td><td> 5748</td><td>1527</td><td>2597</td><td>1703</td><td>3379</td><td>14382</td><td>14337</td><td>47120</td><td>48986</td><td>1088</td><td>2729</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>WindGustSpeed</th><td> 745</td><td> 699</td><td> 598</td><td> 5238</td><td> 5748</td><td>10263</td><td>1403</td><td>2763</td><td> 729</td><td>2101</td><td> 4284</td><td> 4288</td><td> 2269</td><td> 3672</td><td> 677</td><td>2061</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed9am</th><td> 640</td><td> 375</td><td> 676</td><td> 1267</td><td> 1527</td><td> 1403</td><td>1767</td><td>1213</td><td> 890</td><td> 535</td><td> 1399</td><td> 1264</td><td> 1557</td><td> 1472</td><td> 874</td><td> 522</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>WindSpeed3pm</th><td> 539</td><td> 480</td><td> 415</td><td> 2143</td><td> 2597</td><td> 2763</td><td>1213</td><td>3062</td><td> 554</td><td>2257</td><td> 1937</td><td> 2094</td><td> 1393</td><td> 2886</td><td> 529</td><td>2248</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Humidity9am</th><td>1179</td><td> 882</td><td>1100</td><td> 1575</td><td> 1703</td><td>  729</td><td> 890</td><td> 554</td><td>2654</td><td>1887</td><td> 1617</td><td> 1480</td><td> 2310</td><td> 2233</td><td>1767</td><td>1148</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Humidity3pm</th><td>1060</td><td>1004</td><td> 877</td><td> 2327</td><td> 3379</td><td> 2101</td><td> 535</td><td>2257</td><td>1887</td><td>4507</td><td> 2024</td><td> 2185</td><td> 2013</td><td> 4191</td><td>1137</td><td>3609</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Pressure9am</th><td>1206</td><td>1014</td><td>1125</td><td>14135</td><td>14382</td><td> 4284</td><td>1399</td><td>1937</td><td>1617</td><td>2024</td><td>15065</td><td>14804</td><td>11320</td><td>11987</td><td>1530</td><td>1949</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Pressure3pm</th><td>1158</td><td>1016</td><td>1035</td><td>14095</td><td>14337</td><td> 4288</td><td>1264</td><td>2094</td><td>1480</td><td>2185</td><td>14804</td><td>15028</td><td>11275</td><td>12026</td><td>1394</td><td>2109</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Cloud9am</th><td>1246</td><td> 979</td><td>2557</td><td>45499</td><td>47120</td><td> 2269</td><td>1557</td><td>1393</td><td>2310</td><td>2013</td><td>11320</td><td>11275</td><td>55888</td><td>51744</td><td>1648</td><td>1365</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Cloud3pm</th><td>1244</td><td>1107</td><td>2484</td><td>46304</td><td>48986</td><td> 3672</td><td>1472</td><td>2886</td><td>2233</td><td>4191</td><td>11987</td><td>12026</td><td>51744</td><td>59358</td><td>1552</td><td>3555</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Temp9am</th><td>1174</td><td> 874</td><td>1082</td><td> 1070</td><td> 1088</td><td>  677</td><td> 874</td><td> 529</td><td>1767</td><td>1137</td><td> 1530</td><td> 1394</td><td> 1648</td><td> 1552</td><td>1767</td><td>1129</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>Temp3pm</th><td>1053</td><td> 999</td><td> 863</td><td> 1856</td><td> 2729</td><td> 2061</td><td> 522</td><td>2248</td><td>1148</td><td>3609</td><td> 1949</td><td> 2109</td><td> 1365</td><td> 3555</td><td>1129</td><td>3609</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>RainTomorrow</th><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>   0</td><td>   0</td><td>   0</td><td>   0</td><td>    0</td><td>    0</td><td>    0</td><td>    0</td><td>   0</td><td>   0</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n",
       "</dd>\n",
       "</dl>\n"
      ],
      "text/latex": [
       "\\begin{description}\n",
       "\\item[\\$rr] A matrix: 17 × 17 of type dbl\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "\\hline\n",
       "\tMinTemp & 143975 & 143579 & 141712 & 82012 & 74980 & 134457 & 142848 & 141452 & 142500 & 140528 & 130116 & 130105 & 89333 & 85861 & 143382 & 141419 & 143975\\\\\n",
       "\tMaxTemp & 143579 & 144199 & 141729 & 82025 & 75011 & 134635 & 142807 & 141617 & 142427 & 140696 & 130148 & 130187 & 89290 & 85948 & 143306 & 141589 & 144199\\\\\n",
       "\tRainfall & 141712 & 141729 & 142199 & 81711 & 74379 & 132534 & 141108 & 139552 & 140645 & 138569 & 128259 & 128206 & 88868 & 85325 & 141514 & 139453 & 142199\\\\\n",
       "\tEvaporation &  82012 &  82025 &  81711 & 82670 & 71382 &  77645 &  82170 &  81751 &  81591 &  80490 &  81740 &  81737 & 72281 & 69616 &  81973 &  80917 &  82670\\\\\n",
       "\tSunshine &  74980 &  75011 &  74379 & 71382 & 75625 &  71110 &  75385 &  75160 &  74674 &  74497 &  74942 &  74934 & 66857 & 65253 &  74946 &  74745 &  75625\\\\\n",
       "\tWindGustSpeed & 134457 & 134635 & 132534 & 77645 & 71110 & 135197 & 134833 & 134898 & 133272 & 132791 & 124416 & 124457 & 81578 & 79511 & 134107 & 133649 & 135197\\\\\n",
       "\tWindSpeed9am & 142848 & 142807 & 141108 & 82170 & 75385 & 134833 & 143693 & 141844 & 141929 & 139721 & 130027 & 129929 & 89362 & 85807 & 142800 & 140606 & 143693\\\\\n",
       "\tWindSpeed3pm & 141452 & 141617 & 139552 & 81751 & 75160 & 134898 & 141844 & 142398 & 140298 & 140148 & 129270 & 129464 & 87903 & 85926 & 141160 & 141037 & 142398\\\\\n",
       "\tHumidity9am & 142500 & 142427 & 140645 & 81591 & 74674 & 133272 & 141929 & 140298 & 142806 & 140186 & 129358 & 129258 & 89228 & 85681 & 142806 & 140345 & 142806\\\\\n",
       "\tHumidity3pm & 140528 & 140696 & 138569 & 80490 & 74497 & 132791 & 139721 & 140148 & 140186 & 140953 & 127912 & 128110 & 87078 & 85786 & 140323 & 140953 & 140953\\\\\n",
       "\tPressure9am & 130116 & 130148 & 128259 & 81740 & 74942 & 124416 & 130027 & 129270 & 129358 & 127912 & 130395 & 130171 & 85827 & 83024 & 130158 & 128735 & 130395\\\\\n",
       "\tPressure3pm & 130105 & 130187 & 128206 & 81737 & 74934 & 124457 & 129929 & 129464 & 129258 & 128110 & 130171 & 130432 & 85819 & 83100 & 130059 & 128932 & 130432\\\\\n",
       "\tCloud9am &  89333 &  89290 &  88868 & 72281 & 66857 &  81578 &  89362 &  87903 &  89228 &  87078 &  85827 &  85819 & 89572 & 81958 &  89453 &  87328 &  89572\\\\\n",
       "\tCloud3pm &  85861 &  85948 &  85325 & 69616 & 65253 &  79511 &  85807 &  85926 &  85681 &  85786 &  83024 &  83100 & 81958 & 86102 &  85887 &  86048 &  86102\\\\\n",
       "\tTemp9am & 143382 & 143306 & 141514 & 81973 & 74946 & 134107 & 142800 & 141160 & 142806 & 140323 & 130158 & 130059 & 89453 & 85887 & 143693 & 141213 & 143693\\\\\n",
       "\tTemp3pm & 141419 & 141589 & 139453 & 80917 & 74745 & 133649 & 140606 & 141037 & 140345 & 140953 & 128735 & 128932 & 87328 & 86048 & 141213 & 141851 & 141851\\\\\n",
       "\tRainTomorrow & 143975 & 144199 & 142199 & 82670 & 75625 & 135197 & 143693 & 142398 & 142806 & 140953 & 130395 & 130432 & 89572 & 86102 & 143693 & 141851 & 145460\\\\\n",
       "\\end{tabular}\n",
       "\n",
       "\\item[\\$rm] A matrix: 17 × 17 of type dbl\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "\\hline\n",
       "\tMinTemp &    0 &  396 & 2263 & 61963 & 68995 &  9518 & 1127 & 2523 & 1475 & 3447 & 13859 & 13870 & 54642 & 58114 &  593 & 2556 & 0\\\\\n",
       "\tMaxTemp &  620 &    0 & 2470 & 62174 & 69188 &  9564 & 1392 & 2582 & 1772 & 3503 & 14051 & 14012 & 54909 & 58251 &  893 & 2610 & 0\\\\\n",
       "\tRainfall &  487 &  470 &    0 & 60488 & 67820 &  9665 & 1091 & 2647 & 1554 & 3630 & 13940 & 13993 & 53331 & 56874 &  685 & 2746 & 0\\\\\n",
       "\tEvaporation &  658 &  645 &  959 &     0 & 11288 &  5025 &  500 &  919 & 1079 & 2180 &   930 &   933 & 10389 & 13054 &  697 & 1753 & 0\\\\\n",
       "\tSunshine &  645 &  614 & 1246 &  4243 &     0 &  4515 &  240 &  465 &  951 & 1128 &   683 &   691 &  8768 & 10372 &  679 &  880 & 0\\\\\n",
       "\tWindGustSpeed &  740 &  562 & 2663 & 57552 & 64087 &     0 &  364 &  299 & 1925 & 2406 & 10781 & 10740 & 53619 & 55686 & 1090 & 1548 & 0\\\\\n",
       "\tWindSpeed9am &  845 &  886 & 2585 & 61523 & 68308 &  8860 &    0 & 1849 & 1764 & 3972 & 13666 & 13764 & 54331 & 57886 &  893 & 3087 & 0\\\\\n",
       "\tWindSpeed3pm &  946 &  781 & 2846 & 60647 & 67238 &  7500 &  554 &    0 & 2100 & 2250 & 13128 & 12934 & 54495 & 56472 & 1238 & 1361 & 0\\\\\n",
       "\tHumidity9am &  306 &  379 & 2161 & 61215 & 68132 &  9534 &  877 & 2508 &    0 & 2620 & 13448 & 13548 & 53578 & 57125 &    0 & 2461 & 0\\\\\n",
       "\tHumidity3pm &  425 &  257 & 2384 & 60463 & 66456 &  8162 & 1232 &  805 &  767 &    0 & 13041 & 12843 & 53875 & 55167 &  630 &    0 & 0\\\\\n",
       "\tPressure9am &  279 &  247 & 2136 & 48655 & 55453 &  5979 &  368 & 1125 & 1037 & 2483 &     0 &   224 & 44568 & 47371 &  237 & 1660 & 0\\\\\n",
       "\tPressure3pm &  327 &  245 & 2226 & 48695 & 55498 &  5975 &  503 &  968 & 1174 & 2322 &   261 &     0 & 44613 & 47332 &  373 & 1500 & 0\\\\\n",
       "\tCloud9am &  239 &  282 &  704 & 17291 & 22715 &  7994 &  210 & 1669 &  344 & 2494 &  3745 &  3753 &     0 &  7614 &  119 & 2244 & 0\\\\\n",
       "\tCloud3pm &  241 &  154 &  777 & 16486 & 20849 &  6591 &  295 &  176 &  421 &  316 &  3078 &  3002 &  4144 &     0 &  215 &   54 & 0\\\\\n",
       "\tTemp9am &  311 &  387 & 2179 & 61720 & 68747 &  9586 &  893 & 2533 &  887 & 3370 & 13535 & 13634 & 54240 & 57806 &    0 & 2480 & 0\\\\\n",
       "\tTemp3pm &  432 &  262 & 2398 & 60934 & 67106 &  8202 & 1245 &  814 & 1506 &  898 & 13116 & 12919 & 54523 & 55803 &  638 &    0 & 0\\\\\n",
       "\tRainTomorrow & 1485 & 1261 & 3261 & 62790 & 69835 & 10263 & 1767 & 3062 & 2654 & 4507 & 15065 & 15028 & 55888 & 59358 & 1767 & 3609 & 0\\\\\n",
       "\\end{tabular}\n",
       "\n",
       "\\item[\\$mr] A matrix: 17 × 17 of type dbl\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "\\hline\n",
       "\tMinTemp &     0 &   620 &   487 &   658 &   645 &   740 &   845 &   946 &   306 &   425 &   279 &   327 &   239 &   241 &   311 &   432 &  1485\\\\\n",
       "\tMaxTemp &   396 &     0 &   470 &   645 &   614 &   562 &   886 &   781 &   379 &   257 &   247 &   245 &   282 &   154 &   387 &   262 &  1261\\\\\n",
       "\tRainfall &  2263 &  2470 &     0 &   959 &  1246 &  2663 &  2585 &  2846 &  2161 &  2384 &  2136 &  2226 &   704 &   777 &  2179 &  2398 &  3261\\\\\n",
       "\tEvaporation & 61963 & 62174 & 60488 &     0 &  4243 & 57552 & 61523 & 60647 & 61215 & 60463 & 48655 & 48695 & 17291 & 16486 & 61720 & 60934 & 62790\\\\\n",
       "\tSunshine & 68995 & 69188 & 67820 & 11288 &     0 & 64087 & 68308 & 67238 & 68132 & 66456 & 55453 & 55498 & 22715 & 20849 & 68747 & 67106 & 69835\\\\\n",
       "\tWindGustSpeed &  9518 &  9564 &  9665 &  5025 &  4515 &     0 &  8860 &  7500 &  9534 &  8162 &  5979 &  5975 &  7994 &  6591 &  9586 &  8202 & 10263\\\\\n",
       "\tWindSpeed9am &  1127 &  1392 &  1091 &   500 &   240 &   364 &     0 &   554 &   877 &  1232 &   368 &   503 &   210 &   295 &   893 &  1245 &  1767\\\\\n",
       "\tWindSpeed3pm &  2523 &  2582 &  2647 &   919 &   465 &   299 &  1849 &     0 &  2508 &   805 &  1125 &   968 &  1669 &   176 &  2533 &   814 &  3062\\\\\n",
       "\tHumidity9am &  1475 &  1772 &  1554 &  1079 &   951 &  1925 &  1764 &  2100 &     0 &   767 &  1037 &  1174 &   344 &   421 &   887 &  1506 &  2654\\\\\n",
       "\tHumidity3pm &  3447 &  3503 &  3630 &  2180 &  1128 &  2406 &  3972 &  2250 &  2620 &     0 &  2483 &  2322 &  2494 &   316 &  3370 &   898 &  4507\\\\\n",
       "\tPressure9am & 13859 & 14051 & 13940 &   930 &   683 & 10781 & 13666 & 13128 & 13448 & 13041 &     0 &   261 &  3745 &  3078 & 13535 & 13116 & 15065\\\\\n",
       "\tPressure3pm & 13870 & 14012 & 13993 &   933 &   691 & 10740 & 13764 & 12934 & 13548 & 12843 &   224 &     0 &  3753 &  3002 & 13634 & 12919 & 15028\\\\\n",
       "\tCloud9am & 54642 & 54909 & 53331 & 10389 &  8768 & 53619 & 54331 & 54495 & 53578 & 53875 & 44568 & 44613 &     0 &  4144 & 54240 & 54523 & 55888\\\\\n",
       "\tCloud3pm & 58114 & 58251 & 56874 & 13054 & 10372 & 55686 & 57886 & 56472 & 57125 & 55167 & 47371 & 47332 &  7614 &     0 & 57806 & 55803 & 59358\\\\\n",
       "\tTemp9am &   593 &   893 &   685 &   697 &   679 &  1090 &   893 &  1238 &     0 &   630 &   237 &   373 &   119 &   215 &     0 &   638 &  1767\\\\\n",
       "\tTemp3pm &  2556 &  2610 &  2746 &  1753 &   880 &  1548 &  3087 &  1361 &  2461 &     0 &  1660 &  1500 &  2244 &    54 &  2480 &     0 &  3609\\\\\n",
       "\tRainTomorrow &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0 &     0\\\\\n",
       "\\end{tabular}\n",
       "\n",
       "\\item[\\$mm] A matrix: 17 × 17 of type dbl\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "\\hline\n",
       "\tMinTemp & 1485 &  865 &  998 &   827 &   840 &   745 &  640 &  539 & 1179 & 1060 &  1206 &  1158 &  1246 &  1244 & 1174 & 1053 & 0\\\\\n",
       "\tMaxTemp &  865 & 1261 &  791 &   616 &   647 &   699 &  375 &  480 &  882 & 1004 &  1014 &  1016 &   979 &  1107 &  874 &  999 & 0\\\\\n",
       "\tRainfall &  998 &  791 & 3261 &  2302 &  2015 &   598 &  676 &  415 & 1100 &  877 &  1125 &  1035 &  2557 &  2484 & 1082 &  863 & 0\\\\\n",
       "\tEvaporation &  827 &  616 & 2302 & 62790 & 58547 &  5238 & 1267 & 2143 & 1575 & 2327 & 14135 & 14095 & 45499 & 46304 & 1070 & 1856 & 0\\\\\n",
       "\tSunshine &  840 &  647 & 2015 & 58547 & 69835 &  5748 & 1527 & 2597 & 1703 & 3379 & 14382 & 14337 & 47120 & 48986 & 1088 & 2729 & 0\\\\\n",
       "\tWindGustSpeed &  745 &  699 &  598 &  5238 &  5748 & 10263 & 1403 & 2763 &  729 & 2101 &  4284 &  4288 &  2269 &  3672 &  677 & 2061 & 0\\\\\n",
       "\tWindSpeed9am &  640 &  375 &  676 &  1267 &  1527 &  1403 & 1767 & 1213 &  890 &  535 &  1399 &  1264 &  1557 &  1472 &  874 &  522 & 0\\\\\n",
       "\tWindSpeed3pm &  539 &  480 &  415 &  2143 &  2597 &  2763 & 1213 & 3062 &  554 & 2257 &  1937 &  2094 &  1393 &  2886 &  529 & 2248 & 0\\\\\n",
       "\tHumidity9am & 1179 &  882 & 1100 &  1575 &  1703 &   729 &  890 &  554 & 2654 & 1887 &  1617 &  1480 &  2310 &  2233 & 1767 & 1148 & 0\\\\\n",
       "\tHumidity3pm & 1060 & 1004 &  877 &  2327 &  3379 &  2101 &  535 & 2257 & 1887 & 4507 &  2024 &  2185 &  2013 &  4191 & 1137 & 3609 & 0\\\\\n",
       "\tPressure9am & 1206 & 1014 & 1125 & 14135 & 14382 &  4284 & 1399 & 1937 & 1617 & 2024 & 15065 & 14804 & 11320 & 11987 & 1530 & 1949 & 0\\\\\n",
       "\tPressure3pm & 1158 & 1016 & 1035 & 14095 & 14337 &  4288 & 1264 & 2094 & 1480 & 2185 & 14804 & 15028 & 11275 & 12026 & 1394 & 2109 & 0\\\\\n",
       "\tCloud9am & 1246 &  979 & 2557 & 45499 & 47120 &  2269 & 1557 & 1393 & 2310 & 2013 & 11320 & 11275 & 55888 & 51744 & 1648 & 1365 & 0\\\\\n",
       "\tCloud3pm & 1244 & 1107 & 2484 & 46304 & 48986 &  3672 & 1472 & 2886 & 2233 & 4191 & 11987 & 12026 & 51744 & 59358 & 1552 & 3555 & 0\\\\\n",
       "\tTemp9am & 1174 &  874 & 1082 &  1070 &  1088 &   677 &  874 &  529 & 1767 & 1137 &  1530 &  1394 &  1648 &  1552 & 1767 & 1129 & 0\\\\\n",
       "\tTemp3pm & 1053 &  999 &  863 &  1856 &  2729 &  2061 &  522 & 2248 & 1148 & 3609 &  1949 &  2109 &  1365 &  3555 & 1129 & 3609 & 0\\\\\n",
       "\tRainTomorrow &    0 &    0 &    0 &     0 &     0 &     0 &    0 &    0 &    0 &    0 &     0 &     0 &     0 &     0 &    0 &    0 & 0\\\\\n",
       "\\end{tabular}\n",
       "\n",
       "\\end{description}\n"
      ],
      "text/markdown": [
       "$rr\n",
       ":   \n",
       "A matrix: 17 × 17 of type dbl\n",
       "\n",
       "| <!--/--> | MinTemp | MaxTemp | Rainfall | Evaporation | Sunshine | WindGustSpeed | WindSpeed9am | WindSpeed3pm | Humidity9am | Humidity3pm | Pressure9am | Pressure3pm | Cloud9am | Cloud3pm | Temp9am | Temp3pm | RainTomorrow |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| MinTemp | 143975 | 143579 | 141712 | 82012 | 74980 | 134457 | 142848 | 141452 | 142500 | 140528 | 130116 | 130105 | 89333 | 85861 | 143382 | 141419 | 143975 |\n",
       "| MaxTemp | 143579 | 144199 | 141729 | 82025 | 75011 | 134635 | 142807 | 141617 | 142427 | 140696 | 130148 | 130187 | 89290 | 85948 | 143306 | 141589 | 144199 |\n",
       "| Rainfall | 141712 | 141729 | 142199 | 81711 | 74379 | 132534 | 141108 | 139552 | 140645 | 138569 | 128259 | 128206 | 88868 | 85325 | 141514 | 139453 | 142199 |\n",
       "| Evaporation |  82012 |  82025 |  81711 | 82670 | 71382 |  77645 |  82170 |  81751 |  81591 |  80490 |  81740 |  81737 | 72281 | 69616 |  81973 |  80917 |  82670 |\n",
       "| Sunshine |  74980 |  75011 |  74379 | 71382 | 75625 |  71110 |  75385 |  75160 |  74674 |  74497 |  74942 |  74934 | 66857 | 65253 |  74946 |  74745 |  75625 |\n",
       "| WindGustSpeed | 134457 | 134635 | 132534 | 77645 | 71110 | 135197 | 134833 | 134898 | 133272 | 132791 | 124416 | 124457 | 81578 | 79511 | 134107 | 133649 | 135197 |\n",
       "| WindSpeed9am | 142848 | 142807 | 141108 | 82170 | 75385 | 134833 | 143693 | 141844 | 141929 | 139721 | 130027 | 129929 | 89362 | 85807 | 142800 | 140606 | 143693 |\n",
       "| WindSpeed3pm | 141452 | 141617 | 139552 | 81751 | 75160 | 134898 | 141844 | 142398 | 140298 | 140148 | 129270 | 129464 | 87903 | 85926 | 141160 | 141037 | 142398 |\n",
       "| Humidity9am | 142500 | 142427 | 140645 | 81591 | 74674 | 133272 | 141929 | 140298 | 142806 | 140186 | 129358 | 129258 | 89228 | 85681 | 142806 | 140345 | 142806 |\n",
       "| Humidity3pm | 140528 | 140696 | 138569 | 80490 | 74497 | 132791 | 139721 | 140148 | 140186 | 140953 | 127912 | 128110 | 87078 | 85786 | 140323 | 140953 | 140953 |\n",
       "| Pressure9am | 130116 | 130148 | 128259 | 81740 | 74942 | 124416 | 130027 | 129270 | 129358 | 127912 | 130395 | 130171 | 85827 | 83024 | 130158 | 128735 | 130395 |\n",
       "| Pressure3pm | 130105 | 130187 | 128206 | 81737 | 74934 | 124457 | 129929 | 129464 | 129258 | 128110 | 130171 | 130432 | 85819 | 83100 | 130059 | 128932 | 130432 |\n",
       "| Cloud9am |  89333 |  89290 |  88868 | 72281 | 66857 |  81578 |  89362 |  87903 |  89228 |  87078 |  85827 |  85819 | 89572 | 81958 |  89453 |  87328 |  89572 |\n",
       "| Cloud3pm |  85861 |  85948 |  85325 | 69616 | 65253 |  79511 |  85807 |  85926 |  85681 |  85786 |  83024 |  83100 | 81958 | 86102 |  85887 |  86048 |  86102 |\n",
       "| Temp9am | 143382 | 143306 | 141514 | 81973 | 74946 | 134107 | 142800 | 141160 | 142806 | 140323 | 130158 | 130059 | 89453 | 85887 | 143693 | 141213 | 143693 |\n",
       "| Temp3pm | 141419 | 141589 | 139453 | 80917 | 74745 | 133649 | 140606 | 141037 | 140345 | 140953 | 128735 | 128932 | 87328 | 86048 | 141213 | 141851 | 141851 |\n",
       "| RainTomorrow | 143975 | 144199 | 142199 | 82670 | 75625 | 135197 | 143693 | 142398 | 142806 | 140953 | 130395 | 130432 | 89572 | 86102 | 143693 | 141851 | 145460 |\n",
       "\n",
       "\n",
       "$rm\n",
       ":   \n",
       "A matrix: 17 × 17 of type dbl\n",
       "\n",
       "| <!--/--> | MinTemp | MaxTemp | Rainfall | Evaporation | Sunshine | WindGustSpeed | WindSpeed9am | WindSpeed3pm | Humidity9am | Humidity3pm | Pressure9am | Pressure3pm | Cloud9am | Cloud3pm | Temp9am | Temp3pm | RainTomorrow |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| MinTemp |    0 |  396 | 2263 | 61963 | 68995 |  9518 | 1127 | 2523 | 1475 | 3447 | 13859 | 13870 | 54642 | 58114 |  593 | 2556 | 0 |\n",
       "| MaxTemp |  620 |    0 | 2470 | 62174 | 69188 |  9564 | 1392 | 2582 | 1772 | 3503 | 14051 | 14012 | 54909 | 58251 |  893 | 2610 | 0 |\n",
       "| Rainfall |  487 |  470 |    0 | 60488 | 67820 |  9665 | 1091 | 2647 | 1554 | 3630 | 13940 | 13993 | 53331 | 56874 |  685 | 2746 | 0 |\n",
       "| Evaporation |  658 |  645 |  959 |     0 | 11288 |  5025 |  500 |  919 | 1079 | 2180 |   930 |   933 | 10389 | 13054 |  697 | 1753 | 0 |\n",
       "| Sunshine |  645 |  614 | 1246 |  4243 |     0 |  4515 |  240 |  465 |  951 | 1128 |   683 |   691 |  8768 | 10372 |  679 |  880 | 0 |\n",
       "| WindGustSpeed |  740 |  562 | 2663 | 57552 | 64087 |     0 |  364 |  299 | 1925 | 2406 | 10781 | 10740 | 53619 | 55686 | 1090 | 1548 | 0 |\n",
       "| WindSpeed9am |  845 |  886 | 2585 | 61523 | 68308 |  8860 |    0 | 1849 | 1764 | 3972 | 13666 | 13764 | 54331 | 57886 |  893 | 3087 | 0 |\n",
       "| WindSpeed3pm |  946 |  781 | 2846 | 60647 | 67238 |  7500 |  554 |    0 | 2100 | 2250 | 13128 | 12934 | 54495 | 56472 | 1238 | 1361 | 0 |\n",
       "| Humidity9am |  306 |  379 | 2161 | 61215 | 68132 |  9534 |  877 | 2508 |    0 | 2620 | 13448 | 13548 | 53578 | 57125 |    0 | 2461 | 0 |\n",
       "| Humidity3pm |  425 |  257 | 2384 | 60463 | 66456 |  8162 | 1232 |  805 |  767 |    0 | 13041 | 12843 | 53875 | 55167 |  630 |    0 | 0 |\n",
       "| Pressure9am |  279 |  247 | 2136 | 48655 | 55453 |  5979 |  368 | 1125 | 1037 | 2483 |     0 |   224 | 44568 | 47371 |  237 | 1660 | 0 |\n",
       "| Pressure3pm |  327 |  245 | 2226 | 48695 | 55498 |  5975 |  503 |  968 | 1174 | 2322 |   261 |     0 | 44613 | 47332 |  373 | 1500 | 0 |\n",
       "| Cloud9am |  239 |  282 |  704 | 17291 | 22715 |  7994 |  210 | 1669 |  344 | 2494 |  3745 |  3753 |     0 |  7614 |  119 | 2244 | 0 |\n",
       "| Cloud3pm |  241 |  154 |  777 | 16486 | 20849 |  6591 |  295 |  176 |  421 |  316 |  3078 |  3002 |  4144 |     0 |  215 |   54 | 0 |\n",
       "| Temp9am |  311 |  387 | 2179 | 61720 | 68747 |  9586 |  893 | 2533 |  887 | 3370 | 13535 | 13634 | 54240 | 57806 |    0 | 2480 | 0 |\n",
       "| Temp3pm |  432 |  262 | 2398 | 60934 | 67106 |  8202 | 1245 |  814 | 1506 |  898 | 13116 | 12919 | 54523 | 55803 |  638 |    0 | 0 |\n",
       "| RainTomorrow | 1485 | 1261 | 3261 | 62790 | 69835 | 10263 | 1767 | 3062 | 2654 | 4507 | 15065 | 15028 | 55888 | 59358 | 1767 | 3609 | 0 |\n",
       "\n",
       "\n",
       "$mr\n",
       ":   \n",
       "A matrix: 17 × 17 of type dbl\n",
       "\n",
       "| <!--/--> | MinTemp | MaxTemp | Rainfall | Evaporation | Sunshine | WindGustSpeed | WindSpeed9am | WindSpeed3pm | Humidity9am | Humidity3pm | Pressure9am | Pressure3pm | Cloud9am | Cloud3pm | Temp9am | Temp3pm | RainTomorrow |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| MinTemp |     0 |   620 |   487 |   658 |   645 |   740 |   845 |   946 |   306 |   425 |   279 |   327 |   239 |   241 |   311 |   432 |  1485 |\n",
       "| MaxTemp |   396 |     0 |   470 |   645 |   614 |   562 |   886 |   781 |   379 |   257 |   247 |   245 |   282 |   154 |   387 |   262 |  1261 |\n",
       "| Rainfall |  2263 |  2470 |     0 |   959 |  1246 |  2663 |  2585 |  2846 |  2161 |  2384 |  2136 |  2226 |   704 |   777 |  2179 |  2398 |  3261 |\n",
       "| Evaporation | 61963 | 62174 | 60488 |     0 |  4243 | 57552 | 61523 | 60647 | 61215 | 60463 | 48655 | 48695 | 17291 | 16486 | 61720 | 60934 | 62790 |\n",
       "| Sunshine | 68995 | 69188 | 67820 | 11288 |     0 | 64087 | 68308 | 67238 | 68132 | 66456 | 55453 | 55498 | 22715 | 20849 | 68747 | 67106 | 69835 |\n",
       "| WindGustSpeed |  9518 |  9564 |  9665 |  5025 |  4515 |     0 |  8860 |  7500 |  9534 |  8162 |  5979 |  5975 |  7994 |  6591 |  9586 |  8202 | 10263 |\n",
       "| WindSpeed9am |  1127 |  1392 |  1091 |   500 |   240 |   364 |     0 |   554 |   877 |  1232 |   368 |   503 |   210 |   295 |   893 |  1245 |  1767 |\n",
       "| WindSpeed3pm |  2523 |  2582 |  2647 |   919 |   465 |   299 |  1849 |     0 |  2508 |   805 |  1125 |   968 |  1669 |   176 |  2533 |   814 |  3062 |\n",
       "| Humidity9am |  1475 |  1772 |  1554 |  1079 |   951 |  1925 |  1764 |  2100 |     0 |   767 |  1037 |  1174 |   344 |   421 |   887 |  1506 |  2654 |\n",
       "| Humidity3pm |  3447 |  3503 |  3630 |  2180 |  1128 |  2406 |  3972 |  2250 |  2620 |     0 |  2483 |  2322 |  2494 |   316 |  3370 |   898 |  4507 |\n",
       "| Pressure9am | 13859 | 14051 | 13940 |   930 |   683 | 10781 | 13666 | 13128 | 13448 | 13041 |     0 |   261 |  3745 |  3078 | 13535 | 13116 | 15065 |\n",
       "| Pressure3pm | 13870 | 14012 | 13993 |   933 |   691 | 10740 | 13764 | 12934 | 13548 | 12843 |   224 |     0 |  3753 |  3002 | 13634 | 12919 | 15028 |\n",
       "| Cloud9am | 54642 | 54909 | 53331 | 10389 |  8768 | 53619 | 54331 | 54495 | 53578 | 53875 | 44568 | 44613 |     0 |  4144 | 54240 | 54523 | 55888 |\n",
       "| Cloud3pm | 58114 | 58251 | 56874 | 13054 | 10372 | 55686 | 57886 | 56472 | 57125 | 55167 | 47371 | 47332 |  7614 |     0 | 57806 | 55803 | 59358 |\n",
       "| Temp9am |   593 |   893 |   685 |   697 |   679 |  1090 |   893 |  1238 |     0 |   630 |   237 |   373 |   119 |   215 |     0 |   638 |  1767 |\n",
       "| Temp3pm |  2556 |  2610 |  2746 |  1753 |   880 |  1548 |  3087 |  1361 |  2461 |     0 |  1660 |  1500 |  2244 |    54 |  2480 |     0 |  3609 |\n",
       "| RainTomorrow |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |     0 |\n",
       "\n",
       "\n",
       "$mm\n",
       ":   \n",
       "A matrix: 17 × 17 of type dbl\n",
       "\n",
       "| <!--/--> | MinTemp | MaxTemp | Rainfall | Evaporation | Sunshine | WindGustSpeed | WindSpeed9am | WindSpeed3pm | Humidity9am | Humidity3pm | Pressure9am | Pressure3pm | Cloud9am | Cloud3pm | Temp9am | Temp3pm | RainTomorrow |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| MinTemp | 1485 |  865 |  998 |   827 |   840 |   745 |  640 |  539 | 1179 | 1060 |  1206 |  1158 |  1246 |  1244 | 1174 | 1053 | 0 |\n",
       "| MaxTemp |  865 | 1261 |  791 |   616 |   647 |   699 |  375 |  480 |  882 | 1004 |  1014 |  1016 |   979 |  1107 |  874 |  999 | 0 |\n",
       "| Rainfall |  998 |  791 | 3261 |  2302 |  2015 |   598 |  676 |  415 | 1100 |  877 |  1125 |  1035 |  2557 |  2484 | 1082 |  863 | 0 |\n",
       "| Evaporation |  827 |  616 | 2302 | 62790 | 58547 |  5238 | 1267 | 2143 | 1575 | 2327 | 14135 | 14095 | 45499 | 46304 | 1070 | 1856 | 0 |\n",
       "| Sunshine |  840 |  647 | 2015 | 58547 | 69835 |  5748 | 1527 | 2597 | 1703 | 3379 | 14382 | 14337 | 47120 | 48986 | 1088 | 2729 | 0 |\n",
       "| WindGustSpeed |  745 |  699 |  598 |  5238 |  5748 | 10263 | 1403 | 2763 |  729 | 2101 |  4284 |  4288 |  2269 |  3672 |  677 | 2061 | 0 |\n",
       "| WindSpeed9am |  640 |  375 |  676 |  1267 |  1527 |  1403 | 1767 | 1213 |  890 |  535 |  1399 |  1264 |  1557 |  1472 |  874 |  522 | 0 |\n",
       "| WindSpeed3pm |  539 |  480 |  415 |  2143 |  2597 |  2763 | 1213 | 3062 |  554 | 2257 |  1937 |  2094 |  1393 |  2886 |  529 | 2248 | 0 |\n",
       "| Humidity9am | 1179 |  882 | 1100 |  1575 |  1703 |   729 |  890 |  554 | 2654 | 1887 |  1617 |  1480 |  2310 |  2233 | 1767 | 1148 | 0 |\n",
       "| Humidity3pm | 1060 | 1004 |  877 |  2327 |  3379 |  2101 |  535 | 2257 | 1887 | 4507 |  2024 |  2185 |  2013 |  4191 | 1137 | 3609 | 0 |\n",
       "| Pressure9am | 1206 | 1014 | 1125 | 14135 | 14382 |  4284 | 1399 | 1937 | 1617 | 2024 | 15065 | 14804 | 11320 | 11987 | 1530 | 1949 | 0 |\n",
       "| Pressure3pm | 1158 | 1016 | 1035 | 14095 | 14337 |  4288 | 1264 | 2094 | 1480 | 2185 | 14804 | 15028 | 11275 | 12026 | 1394 | 2109 | 0 |\n",
       "| Cloud9am | 1246 |  979 | 2557 | 45499 | 47120 |  2269 | 1557 | 1393 | 2310 | 2013 | 11320 | 11275 | 55888 | 51744 | 1648 | 1365 | 0 |\n",
       "| Cloud3pm | 1244 | 1107 | 2484 | 46304 | 48986 |  3672 | 1472 | 2886 | 2233 | 4191 | 11987 | 12026 | 51744 | 59358 | 1552 | 3555 | 0 |\n",
       "| Temp9am | 1174 |  874 | 1082 |  1070 |  1088 |   677 |  874 |  529 | 1767 | 1137 |  1530 |  1394 |  1648 |  1552 | 1767 | 1129 | 0 |\n",
       "| Temp3pm | 1053 |  999 |  863 |  1856 |  2729 |  2061 |  522 | 2248 | 1148 | 3609 |  1949 |  2109 |  1365 |  3555 | 1129 | 3609 | 0 |\n",
       "| RainTomorrow |    0 |    0 |    0 |     0 |     0 |     0 |    0 |    0 |    0 |    0 |     0 |     0 |     0 |     0 |    0 |    0 | 0 |\n",
       "\n",
       "\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "$rr\n",
       "              MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed\n",
       "MinTemp        143975  143579   141712       82012    74980        134457\n",
       "MaxTemp        143579  144199   141729       82025    75011        134635\n",
       "Rainfall       141712  141729   142199       81711    74379        132534\n",
       "Evaporation     82012   82025    81711       82670    71382         77645\n",
       "Sunshine        74980   75011    74379       71382    75625         71110\n",
       "WindGustSpeed  134457  134635   132534       77645    71110        135197\n",
       "WindSpeed9am   142848  142807   141108       82170    75385        134833\n",
       "WindSpeed3pm   141452  141617   139552       81751    75160        134898\n",
       "Humidity9am    142500  142427   140645       81591    74674        133272\n",
       "Humidity3pm    140528  140696   138569       80490    74497        132791\n",
       "Pressure9am    130116  130148   128259       81740    74942        124416\n",
       "Pressure3pm    130105  130187   128206       81737    74934        124457\n",
       "Cloud9am        89333   89290    88868       72281    66857         81578\n",
       "Cloud3pm        85861   85948    85325       69616    65253         79511\n",
       "Temp9am        143382  143306   141514       81973    74946        134107\n",
       "Temp3pm        141419  141589   139453       80917    74745        133649\n",
       "RainTomorrow   143975  144199   142199       82670    75625        135197\n",
       "              WindSpeed9am WindSpeed3pm Humidity9am Humidity3pm Pressure9am\n",
       "MinTemp             142848       141452      142500      140528      130116\n",
       "MaxTemp             142807       141617      142427      140696      130148\n",
       "Rainfall            141108       139552      140645      138569      128259\n",
       "Evaporation          82170        81751       81591       80490       81740\n",
       "Sunshine             75385        75160       74674       74497       74942\n",
       "WindGustSpeed       134833       134898      133272      132791      124416\n",
       "WindSpeed9am        143693       141844      141929      139721      130027\n",
       "WindSpeed3pm        141844       142398      140298      140148      129270\n",
       "Humidity9am         141929       140298      142806      140186      129358\n",
       "Humidity3pm         139721       140148      140186      140953      127912\n",
       "Pressure9am         130027       129270      129358      127912      130395\n",
       "Pressure3pm         129929       129464      129258      128110      130171\n",
       "Cloud9am             89362        87903       89228       87078       85827\n",
       "Cloud3pm             85807        85926       85681       85786       83024\n",
       "Temp9am             142800       141160      142806      140323      130158\n",
       "Temp3pm             140606       141037      140345      140953      128735\n",
       "RainTomorrow        143693       142398      142806      140953      130395\n",
       "              Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "MinTemp            130105    89333    85861  143382  141419       143975\n",
       "MaxTemp            130187    89290    85948  143306  141589       144199\n",
       "Rainfall           128206    88868    85325  141514  139453       142199\n",
       "Evaporation         81737    72281    69616   81973   80917        82670\n",
       "Sunshine            74934    66857    65253   74946   74745        75625\n",
       "WindGustSpeed      124457    81578    79511  134107  133649       135197\n",
       "WindSpeed9am       129929    89362    85807  142800  140606       143693\n",
       "WindSpeed3pm       129464    87903    85926  141160  141037       142398\n",
       "Humidity9am        129258    89228    85681  142806  140345       142806\n",
       "Humidity3pm        128110    87078    85786  140323  140953       140953\n",
       "Pressure9am        130171    85827    83024  130158  128735       130395\n",
       "Pressure3pm        130432    85819    83100  130059  128932       130432\n",
       "Cloud9am            85819    89572    81958   89453   87328        89572\n",
       "Cloud3pm            83100    81958    86102   85887   86048        86102\n",
       "Temp9am            130059    89453    85887  143693  141213       143693\n",
       "Temp3pm            128932    87328    86048  141213  141851       141851\n",
       "RainTomorrow       130432    89572    86102  143693  141851       145460\n",
       "\n",
       "$rm\n",
       "              MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed\n",
       "MinTemp             0     396     2263       61963    68995          9518\n",
       "MaxTemp           620       0     2470       62174    69188          9564\n",
       "Rainfall          487     470        0       60488    67820          9665\n",
       "Evaporation       658     645      959           0    11288          5025\n",
       "Sunshine          645     614     1246        4243        0          4515\n",
       "WindGustSpeed     740     562     2663       57552    64087             0\n",
       "WindSpeed9am      845     886     2585       61523    68308          8860\n",
       "WindSpeed3pm      946     781     2846       60647    67238          7500\n",
       "Humidity9am       306     379     2161       61215    68132          9534\n",
       "Humidity3pm       425     257     2384       60463    66456          8162\n",
       "Pressure9am       279     247     2136       48655    55453          5979\n",
       "Pressure3pm       327     245     2226       48695    55498          5975\n",
       "Cloud9am          239     282      704       17291    22715          7994\n",
       "Cloud3pm          241     154      777       16486    20849          6591\n",
       "Temp9am           311     387     2179       61720    68747          9586\n",
       "Temp3pm           432     262     2398       60934    67106          8202\n",
       "RainTomorrow     1485    1261     3261       62790    69835         10263\n",
       "              WindSpeed9am WindSpeed3pm Humidity9am Humidity3pm Pressure9am\n",
       "MinTemp               1127         2523        1475        3447       13859\n",
       "MaxTemp               1392         2582        1772        3503       14051\n",
       "Rainfall              1091         2647        1554        3630       13940\n",
       "Evaporation            500          919        1079        2180         930\n",
       "Sunshine               240          465         951        1128         683\n",
       "WindGustSpeed          364          299        1925        2406       10781\n",
       "WindSpeed9am             0         1849        1764        3972       13666\n",
       "WindSpeed3pm           554            0        2100        2250       13128\n",
       "Humidity9am            877         2508           0        2620       13448\n",
       "Humidity3pm           1232          805         767           0       13041\n",
       "Pressure9am            368         1125        1037        2483           0\n",
       "Pressure3pm            503          968        1174        2322         261\n",
       "Cloud9am               210         1669         344        2494        3745\n",
       "Cloud3pm               295          176         421         316        3078\n",
       "Temp9am                893         2533         887        3370       13535\n",
       "Temp3pm               1245          814        1506         898       13116\n",
       "RainTomorrow          1767         3062        2654        4507       15065\n",
       "              Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "MinTemp             13870    54642    58114     593    2556            0\n",
       "MaxTemp             14012    54909    58251     893    2610            0\n",
       "Rainfall            13993    53331    56874     685    2746            0\n",
       "Evaporation           933    10389    13054     697    1753            0\n",
       "Sunshine              691     8768    10372     679     880            0\n",
       "WindGustSpeed       10740    53619    55686    1090    1548            0\n",
       "WindSpeed9am        13764    54331    57886     893    3087            0\n",
       "WindSpeed3pm        12934    54495    56472    1238    1361            0\n",
       "Humidity9am         13548    53578    57125       0    2461            0\n",
       "Humidity3pm         12843    53875    55167     630       0            0\n",
       "Pressure9am           224    44568    47371     237    1660            0\n",
       "Pressure3pm             0    44613    47332     373    1500            0\n",
       "Cloud9am             3753        0     7614     119    2244            0\n",
       "Cloud3pm             3002     4144        0     215      54            0\n",
       "Temp9am             13634    54240    57806       0    2480            0\n",
       "Temp3pm             12919    54523    55803     638       0            0\n",
       "RainTomorrow        15028    55888    59358    1767    3609            0\n",
       "\n",
       "$mr\n",
       "              MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed\n",
       "MinTemp             0     620      487         658      645           740\n",
       "MaxTemp           396       0      470         645      614           562\n",
       "Rainfall         2263    2470        0         959     1246          2663\n",
       "Evaporation     61963   62174    60488           0     4243         57552\n",
       "Sunshine        68995   69188    67820       11288        0         64087\n",
       "WindGustSpeed    9518    9564     9665        5025     4515             0\n",
       "WindSpeed9am     1127    1392     1091         500      240           364\n",
       "WindSpeed3pm     2523    2582     2647         919      465           299\n",
       "Humidity9am      1475    1772     1554        1079      951          1925\n",
       "Humidity3pm      3447    3503     3630        2180     1128          2406\n",
       "Pressure9am     13859   14051    13940         930      683         10781\n",
       "Pressure3pm     13870   14012    13993         933      691         10740\n",
       "Cloud9am        54642   54909    53331       10389     8768         53619\n",
       "Cloud3pm        58114   58251    56874       13054    10372         55686\n",
       "Temp9am           593     893      685         697      679          1090\n",
       "Temp3pm          2556    2610     2746        1753      880          1548\n",
       "RainTomorrow        0       0        0           0        0             0\n",
       "              WindSpeed9am WindSpeed3pm Humidity9am Humidity3pm Pressure9am\n",
       "MinTemp                845          946         306         425         279\n",
       "MaxTemp                886          781         379         257         247\n",
       "Rainfall              2585         2846        2161        2384        2136\n",
       "Evaporation          61523        60647       61215       60463       48655\n",
       "Sunshine             68308        67238       68132       66456       55453\n",
       "WindGustSpeed         8860         7500        9534        8162        5979\n",
       "WindSpeed9am             0          554         877        1232         368\n",
       "WindSpeed3pm          1849            0        2508         805        1125\n",
       "Humidity9am           1764         2100           0         767        1037\n",
       "Humidity3pm           3972         2250        2620           0        2483\n",
       "Pressure9am          13666        13128       13448       13041           0\n",
       "Pressure3pm          13764        12934       13548       12843         224\n",
       "Cloud9am             54331        54495       53578       53875       44568\n",
       "Cloud3pm             57886        56472       57125       55167       47371\n",
       "Temp9am                893         1238           0         630         237\n",
       "Temp3pm               3087         1361        2461           0        1660\n",
       "RainTomorrow             0            0           0           0           0\n",
       "              Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "MinTemp               327      239      241     311     432         1485\n",
       "MaxTemp               245      282      154     387     262         1261\n",
       "Rainfall             2226      704      777    2179    2398         3261\n",
       "Evaporation         48695    17291    16486   61720   60934        62790\n",
       "Sunshine            55498    22715    20849   68747   67106        69835\n",
       "WindGustSpeed        5975     7994     6591    9586    8202        10263\n",
       "WindSpeed9am          503      210      295     893    1245         1767\n",
       "WindSpeed3pm          968     1669      176    2533     814         3062\n",
       "Humidity9am          1174      344      421     887    1506         2654\n",
       "Humidity3pm          2322     2494      316    3370     898         4507\n",
       "Pressure9am           261     3745     3078   13535   13116        15065\n",
       "Pressure3pm             0     3753     3002   13634   12919        15028\n",
       "Cloud9am            44613        0     4144   54240   54523        55888\n",
       "Cloud3pm            47332     7614        0   57806   55803        59358\n",
       "Temp9am               373      119      215       0     638         1767\n",
       "Temp3pm              1500     2244       54    2480       0         3609\n",
       "RainTomorrow            0        0        0       0       0            0\n",
       "\n",
       "$mm\n",
       "              MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed\n",
       "MinTemp          1485     865      998         827      840           745\n",
       "MaxTemp           865    1261      791         616      647           699\n",
       "Rainfall          998     791     3261        2302     2015           598\n",
       "Evaporation       827     616     2302       62790    58547          5238\n",
       "Sunshine          840     647     2015       58547    69835          5748\n",
       "WindGustSpeed     745     699      598        5238     5748         10263\n",
       "WindSpeed9am      640     375      676        1267     1527          1403\n",
       "WindSpeed3pm      539     480      415        2143     2597          2763\n",
       "Humidity9am      1179     882     1100        1575     1703           729\n",
       "Humidity3pm      1060    1004      877        2327     3379          2101\n",
       "Pressure9am      1206    1014     1125       14135    14382          4284\n",
       "Pressure3pm      1158    1016     1035       14095    14337          4288\n",
       "Cloud9am         1246     979     2557       45499    47120          2269\n",
       "Cloud3pm         1244    1107     2484       46304    48986          3672\n",
       "Temp9am          1174     874     1082        1070     1088           677\n",
       "Temp3pm          1053     999      863        1856     2729          2061\n",
       "RainTomorrow        0       0        0           0        0             0\n",
       "              WindSpeed9am WindSpeed3pm Humidity9am Humidity3pm Pressure9am\n",
       "MinTemp                640          539        1179        1060        1206\n",
       "MaxTemp                375          480         882        1004        1014\n",
       "Rainfall               676          415        1100         877        1125\n",
       "Evaporation           1267         2143        1575        2327       14135\n",
       "Sunshine              1527         2597        1703        3379       14382\n",
       "WindGustSpeed         1403         2763         729        2101        4284\n",
       "WindSpeed9am          1767         1213         890         535        1399\n",
       "WindSpeed3pm          1213         3062         554        2257        1937\n",
       "Humidity9am            890          554        2654        1887        1617\n",
       "Humidity3pm            535         2257        1887        4507        2024\n",
       "Pressure9am           1399         1937        1617        2024       15065\n",
       "Pressure3pm           1264         2094        1480        2185       14804\n",
       "Cloud9am              1557         1393        2310        2013       11320\n",
       "Cloud3pm              1472         2886        2233        4191       11987\n",
       "Temp9am                874          529        1767        1137        1530\n",
       "Temp3pm                522         2248        1148        3609        1949\n",
       "RainTomorrow             0            0           0           0           0\n",
       "              Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "MinTemp              1158     1246     1244    1174    1053            0\n",
       "MaxTemp              1016      979     1107     874     999            0\n",
       "Rainfall             1035     2557     2484    1082     863            0\n",
       "Evaporation         14095    45499    46304    1070    1856            0\n",
       "Sunshine            14337    47120    48986    1088    2729            0\n",
       "WindGustSpeed        4288     2269     3672     677    2061            0\n",
       "WindSpeed9am         1264     1557     1472     874     522            0\n",
       "WindSpeed3pm         2094     1393     2886     529    2248            0\n",
       "Humidity9am          1480     2310     2233    1767    1148            0\n",
       "Humidity3pm          2185     2013     4191    1137    3609            0\n",
       "Pressure9am         14804    11320    11987    1530    1949            0\n",
       "Pressure3pm         15028    11275    12026    1394    2109            0\n",
       "Cloud9am            11275    55888    51744    1648    1365            0\n",
       "Cloud3pm            12026    51744    59358    1552    3555            0\n",
       "Temp9am              1394     1648     1552    1767    1129            0\n",
       "Temp3pm              2109     1365     3555    1129    3609            0\n",
       "RainTomorrow            0        0        0       0       0            0\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# rr - both pair of variable values are available and observed\n",
    "# rm - the first value in the row is available while the second value in the column is missing\n",
    "# mr - the first variable in the row is missing while the second variable in the column is present\n",
    "# mm - both pair of value variables are missing\n",
    "\n",
    "md.pairs(df_numerical)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "bd0c22ca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:13.042058Z",
     "iopub.status.busy": "2023-02-21T13:18:13.040207Z",
     "iopub.status.idle": "2023-02-21T13:18:14.322602Z",
     "shell.execute_reply": "2023-02-21T13:18:14.320296Z"
    },
    "papermill": {
     "duration": 1.30215,
     "end_time": "2023-02-21T13:18:14.325607",
     "exception": false,
     "start_time": "2023-02-21T13:18:13.023457",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOydd1wUV/v2z2ylLgIqICBYAAt2BMVKUWIBS2LsLSaaxPgYNVFjiYmxPDHGRI3x\nMXaNii3BFmPFgogtKqIiIqiAiErvZXfeP86bYX+7uLBlzp5d7u8f+eDMZvbamVPuc+bc12FY\nlkUAAAAAAACA6SMwtgAAAAAAAADAMEBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBg\nBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAA\nAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAm\nQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcA\nAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAA\nYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBg\nBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAA\nAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAm\nQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcA\nAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAA\nYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBg\nBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAA\nAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAm\nQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcAAAAAAGAmQGAHAAAAAABgJkBgBwAAAAAAYCZAYAcA\n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"
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
    "pbox(df_numerical,pos=1,cex=0.7)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "62a25e76",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:18:14.362832Z",
     "iopub.status.busy": "2023-02-21T13:18:14.360963Z",
     "iopub.status.idle": "2023-02-21T13:22:25.349747Z",
     "shell.execute_reply": "2023-02-21T13:22:25.347573Z"
    },
    "papermill": {
     "duration": 251.036732,
     "end_time": "2023-02-21T13:22:25.378919",
     "exception": false,
     "start_time": "2023-02-21T13:18:14.342187",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      " iter imp variable\n",
      "  1   1  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  1   2  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  1   3  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  1   4  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  1   5  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  2   1  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  2   2  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  2   3  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  2   4  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  2   5  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  3   1  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  3   2  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  3   3  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  3   4  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  3   5  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  4   1  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  4   2  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  4   3  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  4   4  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  4   5  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  5   1  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  5   2  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  5   3  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  5   4  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n",
      "  5   5  MinTemp  MaxTemp  Rainfall  Evaporation  Sunshine  WindGustSpeed  WindSpeed9am  WindSpeed3pm  Humidity9am  Humidity3pm  Pressure9am  Pressure3pm  Cloud9am  Cloud3pm  Temp9am  Temp3pm\n"
     ]
    }
   ],
   "source": [
    "imputer <- mice(df_numerical)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "13abb787",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:25.416764Z",
     "iopub.status.busy": "2023-02-21T13:22:25.414981Z",
     "iopub.status.idle": "2023-02-21T13:22:25.537514Z",
     "shell.execute_reply": "2023-02-21T13:22:25.535510Z"
    },
    "papermill": {
     "duration": 0.144925,
     "end_time": "2023-02-21T13:22:25.540443",
     "exception": false,
     "start_time": "2023-02-21T13:22:25.395518",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>13.4</td><td>22.9</td><td>0.6</td><td> 5.8</td><td> 8.2</td><td>44</td><td>20</td><td>24</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td>8</td><td>7</td><td>16.9</td><td>21.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td> 7.4</td><td>25.1</td><td>0.0</td><td> 6.8</td><td> 7.9</td><td>44</td><td> 4</td><td>22</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>1</td><td>5</td><td>17.2</td><td>24.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12.9</td><td>25.7</td><td>0.0</td><td> 6.6</td><td>12.5</td><td>46</td><td>19</td><td>26</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>7</td><td>2</td><td>21.0</td><td>23.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td> 9.2</td><td>28.0</td><td>0.0</td><td> 4.4</td><td>11.3</td><td>24</td><td>11</td><td> 9</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>0</td><td>1</td><td>18.1</td><td>26.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>17.5</td><td>32.3</td><td>1.0</td><td> 8.2</td><td> 8.9</td><td>41</td><td> 7</td><td>20</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td>7</td><td>8</td><td>17.8</td><td>29.7</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>14.6</td><td>29.7</td><td>0.2</td><td>11.4</td><td>12.2</td><td>56</td><td>19</td><td>24</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>1</td><td>0</td><td>20.6</td><td>28.9</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 17\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 13.4 & 22.9 & 0.6 &  5.8 &  8.2 & 44 & 20 & 24 & 71 & 22 & 1007.7 & 1007.1 & 8 & 7 & 16.9 & 21.8 & 2\\\\\n",
       "\t2 &  7.4 & 25.1 & 0.0 &  6.8 &  7.9 & 44 &  4 & 22 & 44 & 25 & 1010.6 & 1007.8 & 1 & 5 & 17.2 & 24.3 & 2\\\\\n",
       "\t3 & 12.9 & 25.7 & 0.0 &  6.6 & 12.5 & 46 & 19 & 26 & 38 & 30 & 1007.6 & 1008.7 & 7 & 2 & 21.0 & 23.2 & 2\\\\\n",
       "\t4 &  9.2 & 28.0 & 0.0 &  4.4 & 11.3 & 24 & 11 &  9 & 45 & 16 & 1017.6 & 1012.8 & 0 & 1 & 18.1 & 26.5 & 2\\\\\n",
       "\t5 & 17.5 & 32.3 & 1.0 &  8.2 &  8.9 & 41 &  7 & 20 & 82 & 33 & 1010.8 & 1006.0 & 7 & 8 & 17.8 & 29.7 & 2\\\\\n",
       "\t6 & 14.6 & 29.7 & 0.2 & 11.4 & 12.2 & 56 & 19 & 24 & 55 & 23 & 1009.2 & 1005.4 & 1 & 0 & 20.6 & 28.9 & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 17\n",
       "\n",
       "| <!--/--> | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustSpeed &lt;int&gt; | WindSpeed9am &lt;int&gt; | WindSpeed3pm &lt;int&gt; | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 13.4 | 22.9 | 0.6 |  5.8 |  8.2 | 44 | 20 | 24 | 71 | 22 | 1007.7 | 1007.1 | 8 | 7 | 16.9 | 21.8 | 2 |\n",
       "| 2 |  7.4 | 25.1 | 0.0 |  6.8 |  7.9 | 44 |  4 | 22 | 44 | 25 | 1010.6 | 1007.8 | 1 | 5 | 17.2 | 24.3 | 2 |\n",
       "| 3 | 12.9 | 25.7 | 0.0 |  6.6 | 12.5 | 46 | 19 | 26 | 38 | 30 | 1007.6 | 1008.7 | 7 | 2 | 21.0 | 23.2 | 2 |\n",
       "| 4 |  9.2 | 28.0 | 0.0 |  4.4 | 11.3 | 24 | 11 |  9 | 45 | 16 | 1017.6 | 1012.8 | 0 | 1 | 18.1 | 26.5 | 2 |\n",
       "| 5 | 17.5 | 32.3 | 1.0 |  8.2 |  8.9 | 41 |  7 | 20 | 82 | 33 | 1010.8 | 1006.0 | 7 | 8 | 17.8 | 29.7 | 2 |\n",
       "| 6 | 14.6 | 29.7 | 0.2 | 11.4 | 12.2 | 56 | 19 | 24 | 55 | 23 | 1009.2 | 1005.4 | 1 | 0 | 20.6 | 28.9 | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed WindSpeed9am\n",
       "1 13.4    22.9    0.6       5.8         8.2     44            20          \n",
       "2  7.4    25.1    0.0       6.8         7.9     44             4          \n",
       "3 12.9    25.7    0.0       6.6        12.5     46            19          \n",
       "4  9.2    28.0    0.0       4.4        11.3     24            11          \n",
       "5 17.5    32.3    1.0       8.2         8.9     41             7          \n",
       "6 14.6    29.7    0.2      11.4        12.2     56            19          \n",
       "  WindSpeed3pm Humidity9am Humidity3pm Pressure9am Pressure3pm Cloud9am\n",
       "1 24           71          22          1007.7      1007.1      8       \n",
       "2 22           44          25          1010.6      1007.8      1       \n",
       "3 26           38          30          1007.6      1008.7      7       \n",
       "4  9           45          16          1017.6      1012.8      0       \n",
       "5 20           82          33          1010.8      1006.0      7       \n",
       "6 24           55          23          1009.2      1005.4      1       \n",
       "  Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "1 7        16.9    21.8    2           \n",
       "2 5        17.2    24.3    2           \n",
       "3 2        21.0    23.2    2           \n",
       "4 1        18.1    26.5    2           \n",
       "5 8        17.8    29.7    2           \n",
       "6 0        20.6    28.9    2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(complete(imputer))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "7e8ea796",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:25.582371Z",
     "iopub.status.busy": "2023-02-21T13:22:25.580548Z",
     "iopub.status.idle": "2023-02-21T13:22:25.707391Z",
     "shell.execute_reply": "2023-02-21T13:22:25.705336Z"
    },
    "papermill": {
     "duration": 0.151356,
     "end_time": "2023-02-21T13:22:25.709774",
     "exception": false,
     "start_time": "2023-02-21T13:22:25.558418",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>13.4</td><td>22.9</td><td>0.6</td><td>5.6</td><td> 8.0</td><td>44</td><td>20</td><td>24</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td>8</td><td>7</td><td>16.9</td><td>21.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td> 7.4</td><td>25.1</td><td>0.0</td><td>5.0</td><td>10.0</td><td>44</td><td> 4</td><td>22</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>0</td><td>5</td><td>17.2</td><td>24.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12.9</td><td>25.7</td><td>0.0</td><td>4.8</td><td>12.1</td><td>46</td><td>19</td><td>26</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>1</td><td>2</td><td>21.0</td><td>23.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td> 9.2</td><td>28.0</td><td>0.0</td><td>6.4</td><td>12.8</td><td>24</td><td>11</td><td> 9</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>1</td><td>6</td><td>18.1</td><td>26.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>17.5</td><td>32.3</td><td>1.0</td><td>6.2</td><td> 7.2</td><td>41</td><td> 7</td><td>20</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td>7</td><td>8</td><td>17.8</td><td>29.7</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>14.6</td><td>29.7</td><td>0.2</td><td>4.6</td><td> 9.6</td><td>56</td><td>19</td><td>24</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>3</td><td>6</td><td>20.6</td><td>28.9</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 17\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "  & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 13.4 & 22.9 & 0.6 & 5.6 &  8.0 & 44 & 20 & 24 & 71 & 22 & 1007.7 & 1007.1 & 8 & 7 & 16.9 & 21.8 & 2\\\\\n",
       "\t2 &  7.4 & 25.1 & 0.0 & 5.0 & 10.0 & 44 &  4 & 22 & 44 & 25 & 1010.6 & 1007.8 & 0 & 5 & 17.2 & 24.3 & 2\\\\\n",
       "\t3 & 12.9 & 25.7 & 0.0 & 4.8 & 12.1 & 46 & 19 & 26 & 38 & 30 & 1007.6 & 1008.7 & 1 & 2 & 21.0 & 23.2 & 2\\\\\n",
       "\t4 &  9.2 & 28.0 & 0.0 & 6.4 & 12.8 & 24 & 11 &  9 & 45 & 16 & 1017.6 & 1012.8 & 1 & 6 & 18.1 & 26.5 & 2\\\\\n",
       "\t5 & 17.5 & 32.3 & 1.0 & 6.2 &  7.2 & 41 &  7 & 20 & 82 & 33 & 1010.8 & 1006.0 & 7 & 8 & 17.8 & 29.7 & 2\\\\\n",
       "\t6 & 14.6 & 29.7 & 0.2 & 4.6 &  9.6 & 56 & 19 & 24 & 55 & 23 & 1009.2 & 1005.4 & 3 & 6 & 20.6 & 28.9 & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 17\n",
       "\n",
       "| <!--/--> | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustSpeed &lt;int&gt; | WindSpeed9am &lt;int&gt; | WindSpeed3pm &lt;int&gt; | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 13.4 | 22.9 | 0.6 | 5.6 |  8.0 | 44 | 20 | 24 | 71 | 22 | 1007.7 | 1007.1 | 8 | 7 | 16.9 | 21.8 | 2 |\n",
       "| 2 |  7.4 | 25.1 | 0.0 | 5.0 | 10.0 | 44 |  4 | 22 | 44 | 25 | 1010.6 | 1007.8 | 0 | 5 | 17.2 | 24.3 | 2 |\n",
       "| 3 | 12.9 | 25.7 | 0.0 | 4.8 | 12.1 | 46 | 19 | 26 | 38 | 30 | 1007.6 | 1008.7 | 1 | 2 | 21.0 | 23.2 | 2 |\n",
       "| 4 |  9.2 | 28.0 | 0.0 | 6.4 | 12.8 | 24 | 11 |  9 | 45 | 16 | 1017.6 | 1012.8 | 1 | 6 | 18.1 | 26.5 | 2 |\n",
       "| 5 | 17.5 | 32.3 | 1.0 | 6.2 |  7.2 | 41 |  7 | 20 | 82 | 33 | 1010.8 | 1006.0 | 7 | 8 | 17.8 | 29.7 | 2 |\n",
       "| 6 | 14.6 | 29.7 | 0.2 | 4.6 |  9.6 | 56 | 19 | 24 | 55 | 23 | 1009.2 | 1005.4 | 3 | 6 | 20.6 | 28.9 | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed WindSpeed9am\n",
       "1 13.4    22.9    0.6      5.6          8.0     44            20          \n",
       "2  7.4    25.1    0.0      5.0         10.0     44             4          \n",
       "3 12.9    25.7    0.0      4.8         12.1     46            19          \n",
       "4  9.2    28.0    0.0      6.4         12.8     24            11          \n",
       "5 17.5    32.3    1.0      6.2          7.2     41             7          \n",
       "6 14.6    29.7    0.2      4.6          9.6     56            19          \n",
       "  WindSpeed3pm Humidity9am Humidity3pm Pressure9am Pressure3pm Cloud9am\n",
       "1 24           71          22          1007.7      1007.1      8       \n",
       "2 22           44          25          1010.6      1007.8      0       \n",
       "3 26           38          30          1007.6      1008.7      1       \n",
       "4  9           45          16          1017.6      1012.8      1       \n",
       "5 20           82          33          1010.8      1006.0      7       \n",
       "6 24           55          23          1009.2      1005.4      3       \n",
       "  Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "1 7        16.9    21.8    2           \n",
       "2 5        17.2    24.3    2           \n",
       "3 2        21.0    23.2    2           \n",
       "4 6        18.1    26.5    2           \n",
       "5 8        17.8    29.7    2           \n",
       "6 6        20.6    28.9    2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(complete(imputer, 2))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "5d570001",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:25.749291Z",
     "iopub.status.busy": "2023-02-21T13:22:25.747414Z",
     "iopub.status.idle": "2023-02-21T13:22:25.769145Z",
     "shell.execute_reply": "2023-02-21T13:22:25.766919Z"
    },
    "papermill": {
     "duration": 0.045335,
     "end_time": "2023-02-21T13:22:25.772012",
     "exception": false,
     "start_time": "2023-02-21T13:22:25.726677",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "NULL"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "imputer$imputer$Sunshine"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "e68a5a57",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:25.810039Z",
     "iopub.status.busy": "2023-02-21T13:22:25.808104Z",
     "iopub.status.idle": "2023-02-21T13:22:25.829813Z",
     "shell.execute_reply": "2023-02-21T13:22:25.827485Z"
    },
    "papermill": {
     "duration": 0.043523,
     "end_time": "2023-02-21T13:22:25.832410",
     "exception": false,
     "start_time": "2023-02-21T13:22:25.788887",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "NULL"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "imputer$imputer$Evaporation"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "eea084f3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:25.872104Z",
     "iopub.status.busy": "2023-02-21T13:22:25.870256Z",
     "iopub.status.idle": "2023-02-21T13:22:25.890733Z",
     "shell.execute_reply": "2023-02-21T13:22:25.888800Z"
    },
    "papermill": {
     "duration": 0.043397,
     "end_time": "2023-02-21T13:22:25.893130",
     "exception": false,
     "start_time": "2023-02-21T13:22:25.849733",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "NULL"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "imputer$imputer$Cloud9am"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "07c72995",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:25.932115Z",
     "iopub.status.busy": "2023-02-21T13:22:25.929909Z",
     "iopub.status.idle": "2023-02-21T13:22:26.467824Z",
     "shell.execute_reply": "2023-02-21T13:22:26.465123Z"
    },
    "papermill": {
     "duration": 0.561108,
     "end_time": "2023-02-21T13:22:26.470941",
     "exception": false,
     "start_time": "2023-02-21T13:22:25.909833",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df_numerical_imputed <- complete(imputer, \"long\", inc=TRUE)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "a78d7d8d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:26.509120Z",
     "iopub.status.busy": "2023-02-21T13:22:26.507263Z",
     "iopub.status.idle": "2023-02-21T13:22:26.688869Z",
     "shell.execute_reply": "2023-02-21T13:22:26.686677Z"
    },
    "papermill": {
     "duration": 0.203466,
     "end_time": "2023-02-21T13:22:26.691424",
     "exception": false,
     "start_time": "2023-02-21T13:22:26.487958",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 872760 × 19</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>.imp</th><th scope=col>.id</th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0</td><td> 1</td><td>13.4</td><td>22.9</td><td> 0.6</td><td>NA</td><td>NA</td><td>44</td><td>20</td><td>24</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0</td><td> 2</td><td> 7.4</td><td>25.1</td><td> 0.0</td><td>NA</td><td>NA</td><td>44</td><td> 4</td><td>22</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0</td><td> 3</td><td>12.9</td><td>25.7</td><td> 0.0</td><td>NA</td><td>NA</td><td>46</td><td>19</td><td>26</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0</td><td> 4</td><td> 9.2</td><td>28.0</td><td> 0.0</td><td>NA</td><td>NA</td><td>24</td><td>11</td><td> 9</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0</td><td> 5</td><td>17.5</td><td>32.3</td><td> 1.0</td><td>NA</td><td>NA</td><td>41</td><td> 7</td><td>20</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>0</td><td> 6</td><td>14.6</td><td>29.7</td><td> 0.2</td><td>NA</td><td>NA</td><td>56</td><td>19</td><td>24</td><td>55</td><td>23</td><td>1009.2</td><td>1005.4</td><td>NA</td><td>NA</td><td>20.6</td><td>28.9</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>0</td><td> 7</td><td>14.3</td><td>25.0</td><td> 0.0</td><td>NA</td><td>NA</td><td>50</td><td>20</td><td>24</td><td>49</td><td>19</td><td>1009.6</td><td>1008.2</td><td> 1</td><td>NA</td><td>18.1</td><td>24.6</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>0</td><td> 8</td><td> 7.7</td><td>26.7</td><td> 0.0</td><td>NA</td><td>NA</td><td>35</td><td> 6</td><td>17</td><td>48</td><td>19</td><td>1013.4</td><td>1010.1</td><td>NA</td><td>NA</td><td>16.3</td><td>25.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>0</td><td> 9</td><td> 9.7</td><td>31.9</td><td> 0.0</td><td>NA</td><td>NA</td><td>80</td><td> 7</td><td>28</td><td>42</td><td> 9</td><td>1008.9</td><td>1003.6</td><td>NA</td><td>NA</td><td>18.3</td><td>30.2</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>0</td><td>10</td><td>13.1</td><td>30.1</td><td> 1.4</td><td>NA</td><td>NA</td><td>28</td><td>15</td><td>11</td><td>58</td><td>27</td><td>1007.0</td><td>1005.7</td><td>NA</td><td>NA</td><td>20.1</td><td>28.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>11</th><td>0</td><td>11</td><td>13.4</td><td>30.4</td><td> 0.0</td><td>NA</td><td>NA</td><td>30</td><td>17</td><td> 6</td><td>48</td><td>22</td><td>1011.8</td><td>1008.7</td><td>NA</td><td>NA</td><td>20.4</td><td>28.8</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>0</td><td>12</td><td>15.9</td><td>21.7</td><td> 2.2</td><td>NA</td><td>NA</td><td>31</td><td>15</td><td>13</td><td>89</td><td>91</td><td>1010.5</td><td>1004.2</td><td> 8</td><td> 8</td><td>15.9</td><td>17.0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>13</th><td>0</td><td>13</td><td>15.9</td><td>18.6</td><td>15.6</td><td>NA</td><td>NA</td><td>61</td><td>28</td><td>28</td><td>76</td><td>93</td><td> 994.3</td><td> 993.0</td><td> 8</td><td> 8</td><td>17.4</td><td>15.8</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>14</th><td>0</td><td>14</td><td>12.6</td><td>21.0</td><td> 3.6</td><td>NA</td><td>NA</td><td>44</td><td>24</td><td>20</td><td>65</td><td>43</td><td>1001.2</td><td>1001.8</td><td>NA</td><td> 7</td><td>15.8</td><td>19.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>0</td><td>15</td><td> 8.4</td><td>24.6</td><td> 0.0</td><td>NA</td><td>NA</td><td>NA</td><td> 4</td><td>30</td><td>57</td><td>32</td><td>1009.7</td><td>1008.7</td><td>NA</td><td>NA</td><td>15.9</td><td>23.5</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>16</th><td>0</td><td>16</td><td> 9.8</td><td>27.7</td><td>  NA</td><td>NA</td><td>NA</td><td>50</td><td>NA</td><td>22</td><td>50</td><td>28</td><td>1013.4</td><td>1010.3</td><td> 0</td><td>NA</td><td>17.3</td><td>26.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>17</th><td>0</td><td>17</td><td>14.1</td><td>20.9</td><td> 0.0</td><td>NA</td><td>NA</td><td>22</td><td>11</td><td> 9</td><td>69</td><td>82</td><td>1012.2</td><td>1010.4</td><td> 8</td><td> 1</td><td>17.2</td><td>18.1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>0</td><td>18</td><td>13.5</td><td>22.9</td><td>16.8</td><td>NA</td><td>NA</td><td>63</td><td> 6</td><td>20</td><td>80</td><td>65</td><td>1005.8</td><td>1002.2</td><td> 8</td><td> 1</td><td>18.0</td><td>21.5</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>19</th><td>0</td><td>19</td><td>11.2</td><td>22.5</td><td>10.6</td><td>NA</td><td>NA</td><td>43</td><td>24</td><td>17</td><td>47</td><td>32</td><td>1009.4</td><td>1009.7</td><td>NA</td><td> 2</td><td>15.5</td><td>21.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>20</th><td>0</td><td>20</td><td> 9.8</td><td>25.6</td><td> 0.0</td><td>NA</td><td>NA</td><td>26</td><td>17</td><td> 6</td><td>45</td><td>26</td><td>1019.2</td><td>1017.1</td><td>NA</td><td>NA</td><td>15.8</td><td>23.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>21</th><td>0</td><td>21</td><td>11.5</td><td>29.3</td><td> 0.0</td><td>NA</td><td>NA</td><td>24</td><td> 9</td><td> 9</td><td>56</td><td>28</td><td>1019.3</td><td>1014.8</td><td>NA</td><td>NA</td><td>19.1</td><td>27.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>22</th><td>0</td><td>22</td><td>17.1</td><td>33.0</td><td> 0.0</td><td>NA</td><td>NA</td><td>43</td><td>17</td><td>22</td><td>38</td><td>28</td><td>1013.6</td><td>1008.1</td><td>NA</td><td> 1</td><td>24.5</td><td>31.6</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>23</th><td>0</td><td>23</td><td>20.5</td><td>31.8</td><td> 0.0</td><td>NA</td><td>NA</td><td>41</td><td>19</td><td>20</td><td>54</td><td>24</td><td>1007.8</td><td>1005.7</td><td>NA</td><td>NA</td><td>23.8</td><td>30.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>24</th><td>0</td><td>24</td><td>15.3</td><td>30.9</td><td> 0.0</td><td>NA</td><td>NA</td><td>33</td><td> 6</td><td>13</td><td>55</td><td>23</td><td>1011.0</td><td>1008.2</td><td> 5</td><td>NA</td><td>20.9</td><td>29.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>25</th><td>0</td><td>25</td><td>12.6</td><td>32.4</td><td> 0.0</td><td>NA</td><td>NA</td><td>43</td><td> 4</td><td>19</td><td>49</td><td>17</td><td>1012.9</td><td>1010.1</td><td>NA</td><td>NA</td><td>21.5</td><td>31.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>26</th><td>0</td><td>26</td><td>16.2</td><td>33.9</td><td> 0.0</td><td>NA</td><td>NA</td><td>35</td><td> 9</td><td>13</td><td>45</td><td>19</td><td>1010.9</td><td>1007.6</td><td>NA</td><td> 1</td><td>23.2</td><td>33.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>27</th><td>0</td><td>27</td><td>16.9</td><td>33.0</td><td> 0.0</td><td>NA</td><td>NA</td><td>57</td><td> 0</td><td>26</td><td>41</td><td>28</td><td>1006.8</td><td>1003.6</td><td>NA</td><td> 1</td><td>26.6</td><td>31.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>28</th><td>0</td><td>28</td><td>20.1</td><td>32.7</td><td> 0.0</td><td>NA</td><td>NA</td><td>48</td><td>13</td><td>30</td><td>56</td><td>15</td><td>1005.2</td><td>1001.7</td><td>NA</td><td>NA</td><td>24.6</td><td>32.1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>29</th><td>0</td><td>29</td><td>19.7</td><td>27.2</td><td> 0.0</td><td>NA</td><td>NA</td><td>46</td><td>19</td><td>30</td><td>49</td><td>22</td><td>1004.8</td><td>1004.2</td><td>NA</td><td>NA</td><td>21.6</td><td>26.1</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>30</th><td>0</td><td>30</td><td>12.5</td><td>24.2</td><td> 1.2</td><td>NA</td><td>NA</td><td>50</td><td>11</td><td>22</td><td>78</td><td>70</td><td>1005.6</td><td>1003.4</td><td> 8</td><td> 8</td><td>12.5</td><td>18.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>⋮</th><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><th scope=row>872731</th><td>5</td><td>145431</td><td> 9.3</td><td>28.0</td><td>0</td><td> 7.6</td><td>10.8</td><td>28</td><td> 6</td><td>11</td><td>36</td><td>16</td><td>1019.9</td><td>1016.9</td><td>4</td><td>2</td><td>16.6</td><td>27.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872732</th><td>5</td><td>145432</td><td> 8.0</td><td>24.6</td><td>0</td><td> 6.6</td><td> 8.7</td><td>33</td><td>11</td><td>13</td><td>46</td><td>25</td><td>1021.7</td><td>1018.8</td><td>4</td><td>0</td><td>13.8</td><td>23.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872733</th><td>5</td><td>145433</td><td>12.7</td><td>22.2</td><td>0</td><td>12.4</td><td> 3.2</td><td>37</td><td>19</td><td>13</td><td>59</td><td>34</td><td>1024.3</td><td>1021.7</td><td>8</td><td>8</td><td>13.9</td><td>21.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872734</th><td>5</td><td>145434</td><td> 9.4</td><td>22.7</td><td>0</td><td> 6.4</td><td>10.8</td><td>35</td><td>13</td><td>17</td><td>62</td><td>32</td><td>1026.6</td><td>1023.6</td><td>8</td><td>4</td><td>11.8</td><td>22.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872735</th><td>5</td><td>145435</td><td> 5.4</td><td>20.5</td><td>0</td><td> 4.8</td><td>10.6</td><td>46</td><td>20</td><td>28</td><td>56</td><td>32</td><td>1029.2</td><td>1025.3</td><td>2</td><td>2</td><td>11.1</td><td>20.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872736</th><td>5</td><td>145436</td><td> 5.6</td><td>19.4</td><td>0</td><td> 7.2</td><td>11.6</td><td>43</td><td>22</td><td>24</td><td>61</td><td>22</td><td>1029.6</td><td>1027.1</td><td>0</td><td>3</td><td> 9.7</td><td>18.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872737</th><td>5</td><td>145437</td><td> 1.5</td><td>19.2</td><td>0</td><td> 3.4</td><td>10.3</td><td>37</td><td>17</td><td>22</td><td>45</td><td>18</td><td>1030.7</td><td>1026.7</td><td>7</td><td>1</td><td> 6.8</td><td>17.6</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872738</th><td>5</td><td>145438</td><td> 3.8</td><td>19.8</td><td>0</td><td> 5.4</td><td>11.3</td><td>39</td><td>19</td><td>17</td><td>42</td><td>22</td><td>1028.7</td><td>1024.1</td><td>1</td><td>0</td><td> 8.6</td><td>18.9</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872739</th><td>5</td><td>145439</td><td> 4.5</td><td>18.8</td><td>0</td><td> 7.6</td><td> 9.9</td><td>31</td><td>13</td><td>15</td><td>42</td><td>26</td><td>1026.9</td><td>1022.4</td><td>0</td><td>1</td><td> 9.5</td><td>18.6</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872740</th><td>5</td><td>145440</td><td> 4.9</td><td>20.7</td><td>0</td><td> 3.8</td><td>12.1</td><td>37</td><td>17</td><td>24</td><td>38</td><td>11</td><td>1027.1</td><td>1023.9</td><td>0</td><td>1</td><td>10.3</td><td>19.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872741</th><td>5</td><td>145441</td><td> 1.2</td><td>20.8</td><td>0</td><td>11.4</td><td>13.1</td><td>43</td><td>13</td><td>28</td><td>29</td><td> 6</td><td>1029.8</td><td>1025.9</td><td>0</td><td>0</td><td> 7.9</td><td>19.9</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872742</th><td>5</td><td>145442</td><td> 0.5</td><td>21.7</td><td>0</td><td> 5.2</td><td>13.1</td><td>43</td><td>13</td><td>20</td><td>27</td><td>19</td><td>1029.0</td><td>1025.0</td><td>0</td><td>1</td><td> 9.5</td><td>20.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872743</th><td>5</td><td>145443</td><td> 4.0</td><td>20.0</td><td>0</td><td> 2.0</td><td>10.4</td><td>39</td><td>13</td><td>26</td><td>58</td><td>26</td><td>1030.2</td><td>1026.7</td><td>1</td><td>0</td><td> 9.1</td><td>19.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872744</th><td>5</td><td>145444</td><td> 3.4</td><td>19.8</td><td>0</td><td> 6.8</td><td>10.1</td><td>43</td><td>19</td><td>24</td><td>54</td><td>23</td><td>1031.8</td><td>1027.7</td><td>1</td><td>1</td><td> 8.7</td><td>18.9</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872745</th><td>5</td><td>145445</td><td> 3.2</td><td>18.6</td><td>0</td><td> 5.6</td><td>11.4</td><td>46</td><td>15</td><td>20</td><td>56</td><td>29</td><td>1031.0</td><td>1027.2</td><td>1</td><td>1</td><td> 8.2</td><td>17.4</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872746</th><td>5</td><td>145446</td><td> 2.4</td><td>19.1</td><td>0</td><td> 6.4</td><td> 9.3</td><td>33</td><td>17</td><td>17</td><td>59</td><td>24</td><td>1030.0</td><td>1026.2</td><td>0</td><td>0</td><td> 8.0</td><td>18.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872747</th><td>5</td><td>145447</td><td> 5.1</td><td>19.7</td><td>0</td><td> 3.2</td><td> 8.9</td><td>46</td><td>13</td><td>17</td><td>56</td><td>29</td><td>1028.5</td><td>1025.8</td><td>1</td><td>7</td><td> 8.5</td><td>19.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872748</th><td>5</td><td>145448</td><td> 2.5</td><td>21.2</td><td>0</td><td>11.8</td><td> 8.7</td><td>35</td><td>17</td><td>19</td><td>57</td><td>32</td><td>1027.2</td><td>1023.0</td><td>5</td><td>4</td><td>10.3</td><td>20.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872749</th><td>5</td><td>145449</td><td> 2.3</td><td>21.4</td><td>0</td><td> 8.6</td><td> 5.7</td><td>22</td><td>11</td><td> 7</td><td>60</td><td>28</td><td>1026.9</td><td>1022.8</td><td>7</td><td>8</td><td> 8.9</td><td>20.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872750</th><td>5</td><td>145450</td><td> 2.6</td><td>22.5</td><td>0</td><td> 3.4</td><td>10.3</td><td>19</td><td> 9</td><td> 7</td><td>59</td><td>24</td><td>1025.0</td><td>1021.4</td><td>0</td><td>2</td><td> 8.8</td><td>22.1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872751</th><td>5</td><td>145451</td><td> 5.2</td><td>24.3</td><td>0</td><td> 4.2</td><td>11.3</td><td>24</td><td>11</td><td>11</td><td>53</td><td>24</td><td>1023.8</td><td>1020.0</td><td>0</td><td>3</td><td>12.3</td><td>23.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872752</th><td>5</td><td>145452</td><td> 6.4</td><td>23.4</td><td>0</td><td> 4.8</td><td>13.6</td><td>31</td><td>15</td><td>17</td><td>53</td><td>25</td><td>1025.8</td><td>1023.0</td><td>1</td><td>0</td><td>11.2</td><td>23.1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872753</th><td>5</td><td>145453</td><td> 8.0</td><td>20.7</td><td>0</td><td> 4.9</td><td> 8.5</td><td>41</td><td>19</td><td>26</td><td>56</td><td>32</td><td>1028.1</td><td>1024.3</td><td>7</td><td>7</td><td>11.6</td><td>20.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872754</th><td>5</td><td>145454</td><td> 7.4</td><td>20.6</td><td>0</td><td> 3.2</td><td>10.4</td><td>35</td><td>15</td><td>17</td><td>63</td><td>33</td><td>1027.2</td><td>1023.3</td><td>1</td><td>1</td><td>11.0</td><td>20.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872755</th><td>5</td><td>145455</td><td> 3.5</td><td>21.8</td><td>0</td><td> 4.2</td><td>11.1</td><td>31</td><td>15</td><td>13</td><td>59</td><td>27</td><td>1024.7</td><td>1021.2</td><td>0</td><td>1</td><td> 9.4</td><td>20.9</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872756</th><td>5</td><td>145456</td><td> 2.8</td><td>23.4</td><td>0</td><td> 2.0</td><td> 7.1</td><td>31</td><td>13</td><td>11</td><td>51</td><td>24</td><td>1024.6</td><td>1020.3</td><td>5</td><td>5</td><td>10.1</td><td>22.4</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872757</th><td>5</td><td>145457</td><td> 3.6</td><td>25.3</td><td>0</td><td> 5.6</td><td>10.1</td><td>22</td><td>13</td><td> 9</td><td>56</td><td>21</td><td>1023.5</td><td>1019.1</td><td>2</td><td>5</td><td>10.9</td><td>24.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872758</th><td>5</td><td>145458</td><td> 5.4</td><td>26.9</td><td>0</td><td> 5.8</td><td>11.2</td><td>37</td><td> 9</td><td> 9</td><td>53</td><td>24</td><td>1021.0</td><td>1016.8</td><td>0</td><td>0</td><td>12.5</td><td>26.1</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872759</th><td>5</td><td>145459</td><td> 7.8</td><td>27.0</td><td>0</td><td> 6.2</td><td>10.8</td><td>28</td><td>13</td><td> 7</td><td>51</td><td>24</td><td>1019.4</td><td>1016.5</td><td>3</td><td>2</td><td>15.1</td><td>26.0</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>872760</th><td>5</td><td>145460</td><td>14.9</td><td>22.0</td><td>0</td><td> 5.6</td><td> 4.1</td><td>33</td><td>17</td><td>17</td><td>62</td><td>36</td><td>1020.2</td><td>1017.9</td><td>8</td><td>8</td><td>15.0</td><td>20.9</td><td>3</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 872760 × 19\n",
       "\\begin{tabular}{r|lllllllllllllllllll}\n",
       "  & .imp & .id & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "  & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 0 &  1 & 13.4 & 22.9 &  0.6 & NA & NA & 44 & 20 & 24 & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8 & 2\\\\\n",
       "\t2 & 0 &  2 &  7.4 & 25.1 &  0.0 & NA & NA & 44 &  4 & 22 & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3 & 2\\\\\n",
       "\t3 & 0 &  3 & 12.9 & 25.7 &  0.0 & NA & NA & 46 & 19 & 26 & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2 & 2\\\\\n",
       "\t4 & 0 &  4 &  9.2 & 28.0 &  0.0 & NA & NA & 24 & 11 &  9 & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5 & 2\\\\\n",
       "\t5 & 0 &  5 & 17.5 & 32.3 &  1.0 & NA & NA & 41 &  7 & 20 & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7 & 2\\\\\n",
       "\t6 & 0 &  6 & 14.6 & 29.7 &  0.2 & NA & NA & 56 & 19 & 24 & 55 & 23 & 1009.2 & 1005.4 & NA & NA & 20.6 & 28.9 & 2\\\\\n",
       "\t7 & 0 &  7 & 14.3 & 25.0 &  0.0 & NA & NA & 50 & 20 & 24 & 49 & 19 & 1009.6 & 1008.2 &  1 & NA & 18.1 & 24.6 & 2\\\\\n",
       "\t8 & 0 &  8 &  7.7 & 26.7 &  0.0 & NA & NA & 35 &  6 & 17 & 48 & 19 & 1013.4 & 1010.1 & NA & NA & 16.3 & 25.5 & 2\\\\\n",
       "\t9 & 0 &  9 &  9.7 & 31.9 &  0.0 & NA & NA & 80 &  7 & 28 & 42 &  9 & 1008.9 & 1003.6 & NA & NA & 18.3 & 30.2 & 1\\\\\n",
       "\t10 & 0 & 10 & 13.1 & 30.1 &  1.4 & NA & NA & 28 & 15 & 11 & 58 & 27 & 1007.0 & 1005.7 & NA & NA & 20.1 & 28.2 & 2\\\\\n",
       "\t11 & 0 & 11 & 13.4 & 30.4 &  0.0 & NA & NA & 30 & 17 &  6 & 48 & 22 & 1011.8 & 1008.7 & NA & NA & 20.4 & 28.8 & 1\\\\\n",
       "\t12 & 0 & 12 & 15.9 & 21.7 &  2.2 & NA & NA & 31 & 15 & 13 & 89 & 91 & 1010.5 & 1004.2 &  8 &  8 & 15.9 & 17.0 & 1\\\\\n",
       "\t13 & 0 & 13 & 15.9 & 18.6 & 15.6 & NA & NA & 61 & 28 & 28 & 76 & 93 &  994.3 &  993.0 &  8 &  8 & 17.4 & 15.8 & 1\\\\\n",
       "\t14 & 0 & 14 & 12.6 & 21.0 &  3.6 & NA & NA & 44 & 24 & 20 & 65 & 43 & 1001.2 & 1001.8 & NA &  7 & 15.8 & 19.8 & 2\\\\\n",
       "\t15 & 0 & 15 &  8.4 & 24.6 &  0.0 & NA & NA & NA &  4 & 30 & 57 & 32 & 1009.7 & 1008.7 & NA & NA & 15.9 & 23.5 & 3\\\\\n",
       "\t16 & 0 & 16 &  9.8 & 27.7 &   NA & NA & NA & 50 & NA & 22 & 50 & 28 & 1013.4 & 1010.3 &  0 & NA & 17.3 & 26.2 & 2\\\\\n",
       "\t17 & 0 & 17 & 14.1 & 20.9 &  0.0 & NA & NA & 22 & 11 &  9 & 69 & 82 & 1012.2 & 1010.4 &  8 &  1 & 17.2 & 18.1 & 1\\\\\n",
       "\t18 & 0 & 18 & 13.5 & 22.9 & 16.8 & NA & NA & 63 &  6 & 20 & 80 & 65 & 1005.8 & 1002.2 &  8 &  1 & 18.0 & 21.5 & 1\\\\\n",
       "\t19 & 0 & 19 & 11.2 & 22.5 & 10.6 & NA & NA & 43 & 24 & 17 & 47 & 32 & 1009.4 & 1009.7 & NA &  2 & 15.5 & 21.0 & 2\\\\\n",
       "\t20 & 0 & 20 &  9.8 & 25.6 &  0.0 & NA & NA & 26 & 17 &  6 & 45 & 26 & 1019.2 & 1017.1 & NA & NA & 15.8 & 23.2 & 2\\\\\n",
       "\t21 & 0 & 21 & 11.5 & 29.3 &  0.0 & NA & NA & 24 &  9 &  9 & 56 & 28 & 1019.3 & 1014.8 & NA & NA & 19.1 & 27.3 & 2\\\\\n",
       "\t22 & 0 & 22 & 17.1 & 33.0 &  0.0 & NA & NA & 43 & 17 & 22 & 38 & 28 & 1013.6 & 1008.1 & NA &  1 & 24.5 & 31.6 & 2\\\\\n",
       "\t23 & 0 & 23 & 20.5 & 31.8 &  0.0 & NA & NA & 41 & 19 & 20 & 54 & 24 & 1007.8 & 1005.7 & NA & NA & 23.8 & 30.8 & 2\\\\\n",
       "\t24 & 0 & 24 & 15.3 & 30.9 &  0.0 & NA & NA & 33 &  6 & 13 & 55 & 23 & 1011.0 & 1008.2 &  5 & NA & 20.9 & 29.0 & 2\\\\\n",
       "\t25 & 0 & 25 & 12.6 & 32.4 &  0.0 & NA & NA & 43 &  4 & 19 & 49 & 17 & 1012.9 & 1010.1 & NA & NA & 21.5 & 31.2 & 2\\\\\n",
       "\t26 & 0 & 26 & 16.2 & 33.9 &  0.0 & NA & NA & 35 &  9 & 13 & 45 & 19 & 1010.9 & 1007.6 & NA &  1 & 23.2 & 33.0 & 2\\\\\n",
       "\t27 & 0 & 27 & 16.9 & 33.0 &  0.0 & NA & NA & 57 &  0 & 26 & 41 & 28 & 1006.8 & 1003.6 & NA &  1 & 26.6 & 31.2 & 2\\\\\n",
       "\t28 & 0 & 28 & 20.1 & 32.7 &  0.0 & NA & NA & 48 & 13 & 30 & 56 & 15 & 1005.2 & 1001.7 & NA & NA & 24.6 & 32.1 & 2\\\\\n",
       "\t29 & 0 & 29 & 19.7 & 27.2 &  0.0 & NA & NA & 46 & 19 & 30 & 49 & 22 & 1004.8 & 1004.2 & NA & NA & 21.6 & 26.1 & 1\\\\\n",
       "\t30 & 0 & 30 & 12.5 & 24.2 &  1.2 & NA & NA & 50 & 11 & 22 & 78 & 70 & 1005.6 & 1003.4 &  8 &  8 & 12.5 & 18.2 & 2\\\\\n",
       "\t⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t872731 & 5 & 145431 &  9.3 & 28.0 & 0 &  7.6 & 10.8 & 28 &  6 & 11 & 36 & 16 & 1019.9 & 1016.9 & 4 & 2 & 16.6 & 27.3 & 2\\\\\n",
       "\t872732 & 5 & 145432 &  8.0 & 24.6 & 0 &  6.6 &  8.7 & 33 & 11 & 13 & 46 & 25 & 1021.7 & 1018.8 & 4 & 0 & 13.8 & 23.5 & 2\\\\\n",
       "\t872733 & 5 & 145433 & 12.7 & 22.2 & 0 & 12.4 &  3.2 & 37 & 19 & 13 & 59 & 34 & 1024.3 & 1021.7 & 8 & 8 & 13.9 & 21.0 & 2\\\\\n",
       "\t872734 & 5 & 145434 &  9.4 & 22.7 & 0 &  6.4 & 10.8 & 35 & 13 & 17 & 62 & 32 & 1026.6 & 1023.6 & 8 & 4 & 11.8 & 22.3 & 2\\\\\n",
       "\t872735 & 5 & 145435 &  5.4 & 20.5 & 0 &  4.8 & 10.6 & 46 & 20 & 28 & 56 & 32 & 1029.2 & 1025.3 & 2 & 2 & 11.1 & 20.2 & 2\\\\\n",
       "\t872736 & 5 & 145436 &  5.6 & 19.4 & 0 &  7.2 & 11.6 & 43 & 22 & 24 & 61 & 22 & 1029.6 & 1027.1 & 0 & 3 &  9.7 & 18.3 & 2\\\\\n",
       "\t872737 & 5 & 145437 &  1.5 & 19.2 & 0 &  3.4 & 10.3 & 37 & 17 & 22 & 45 & 18 & 1030.7 & 1026.7 & 7 & 1 &  6.8 & 17.6 & 2\\\\\n",
       "\t872738 & 5 & 145438 &  3.8 & 19.8 & 0 &  5.4 & 11.3 & 39 & 19 & 17 & 42 & 22 & 1028.7 & 1024.1 & 1 & 0 &  8.6 & 18.9 & 2\\\\\n",
       "\t872739 & 5 & 145439 &  4.5 & 18.8 & 0 &  7.6 &  9.9 & 31 & 13 & 15 & 42 & 26 & 1026.9 & 1022.4 & 0 & 1 &  9.5 & 18.6 & 2\\\\\n",
       "\t872740 & 5 & 145440 &  4.9 & 20.7 & 0 &  3.8 & 12.1 & 37 & 17 & 24 & 38 & 11 & 1027.1 & 1023.9 & 0 & 1 & 10.3 & 19.8 & 2\\\\\n",
       "\t872741 & 5 & 145441 &  1.2 & 20.8 & 0 & 11.4 & 13.1 & 43 & 13 & 28 & 29 &  6 & 1029.8 & 1025.9 & 0 & 0 &  7.9 & 19.9 & 2\\\\\n",
       "\t872742 & 5 & 145442 &  0.5 & 21.7 & 0 &  5.2 & 13.1 & 43 & 13 & 20 & 27 & 19 & 1029.0 & 1025.0 & 0 & 1 &  9.5 & 20.5 & 2\\\\\n",
       "\t872743 & 5 & 145443 &  4.0 & 20.0 & 0 &  2.0 & 10.4 & 39 & 13 & 26 & 58 & 26 & 1030.2 & 1026.7 & 1 & 0 &  9.1 & 19.0 & 2\\\\\n",
       "\t872744 & 5 & 145444 &  3.4 & 19.8 & 0 &  6.8 & 10.1 & 43 & 19 & 24 & 54 & 23 & 1031.8 & 1027.7 & 1 & 1 &  8.7 & 18.9 & 2\\\\\n",
       "\t872745 & 5 & 145445 &  3.2 & 18.6 & 0 &  5.6 & 11.4 & 46 & 15 & 20 & 56 & 29 & 1031.0 & 1027.2 & 1 & 1 &  8.2 & 17.4 & 2\\\\\n",
       "\t872746 & 5 & 145446 &  2.4 & 19.1 & 0 &  6.4 &  9.3 & 33 & 17 & 17 & 59 & 24 & 1030.0 & 1026.2 & 0 & 0 &  8.0 & 18.8 & 2\\\\\n",
       "\t872747 & 5 & 145447 &  5.1 & 19.7 & 0 &  3.2 &  8.9 & 46 & 13 & 17 & 56 & 29 & 1028.5 & 1025.8 & 1 & 7 &  8.5 & 19.2 & 2\\\\\n",
       "\t872748 & 5 & 145448 &  2.5 & 21.2 & 0 & 11.8 &  8.7 & 35 & 17 & 19 & 57 & 32 & 1027.2 & 1023.0 & 5 & 4 & 10.3 & 20.3 & 2\\\\\n",
       "\t872749 & 5 & 145449 &  2.3 & 21.4 & 0 &  8.6 &  5.7 & 22 & 11 &  7 & 60 & 28 & 1026.9 & 1022.8 & 7 & 8 &  8.9 & 20.3 & 2\\\\\n",
       "\t872750 & 5 & 145450 &  2.6 & 22.5 & 0 &  3.4 & 10.3 & 19 &  9 &  7 & 59 & 24 & 1025.0 & 1021.4 & 0 & 2 &  8.8 & 22.1 & 2\\\\\n",
       "\t872751 & 5 & 145451 &  5.2 & 24.3 & 0 &  4.2 & 11.3 & 24 & 11 & 11 & 53 & 24 & 1023.8 & 1020.0 & 0 & 3 & 12.3 & 23.3 & 2\\\\\n",
       "\t872752 & 5 & 145452 &  6.4 & 23.4 & 0 &  4.8 & 13.6 & 31 & 15 & 17 & 53 & 25 & 1025.8 & 1023.0 & 1 & 0 & 11.2 & 23.1 & 2\\\\\n",
       "\t872753 & 5 & 145453 &  8.0 & 20.7 & 0 &  4.9 &  8.5 & 41 & 19 & 26 & 56 & 32 & 1028.1 & 1024.3 & 7 & 7 & 11.6 & 20.0 & 2\\\\\n",
       "\t872754 & 5 & 145454 &  7.4 & 20.6 & 0 &  3.2 & 10.4 & 35 & 15 & 17 & 63 & 33 & 1027.2 & 1023.3 & 1 & 1 & 11.0 & 20.3 & 2\\\\\n",
       "\t872755 & 5 & 145455 &  3.5 & 21.8 & 0 &  4.2 & 11.1 & 31 & 15 & 13 & 59 & 27 & 1024.7 & 1021.2 & 0 & 1 &  9.4 & 20.9 & 2\\\\\n",
       "\t872756 & 5 & 145456 &  2.8 & 23.4 & 0 &  2.0 &  7.1 & 31 & 13 & 11 & 51 & 24 & 1024.6 & 1020.3 & 5 & 5 & 10.1 & 22.4 & 2\\\\\n",
       "\t872757 & 5 & 145457 &  3.6 & 25.3 & 0 &  5.6 & 10.1 & 22 & 13 &  9 & 56 & 21 & 1023.5 & 1019.1 & 2 & 5 & 10.9 & 24.5 & 2\\\\\n",
       "\t872758 & 5 & 145458 &  5.4 & 26.9 & 0 &  5.8 & 11.2 & 37 &  9 &  9 & 53 & 24 & 1021.0 & 1016.8 & 0 & 0 & 12.5 & 26.1 & 2\\\\\n",
       "\t872759 & 5 & 145459 &  7.8 & 27.0 & 0 &  6.2 & 10.8 & 28 & 13 &  7 & 51 & 24 & 1019.4 & 1016.5 & 3 & 2 & 15.1 & 26.0 & 2\\\\\n",
       "\t872760 & 5 & 145460 & 14.9 & 22.0 & 0 &  5.6 &  4.1 & 33 & 17 & 17 & 62 & 36 & 1020.2 & 1017.9 & 8 & 8 & 15.0 & 20.9 & 3\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 872760 × 19\n",
       "\n",
       "| <!--/--> | .imp &lt;int&gt; | .id &lt;int&gt; | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustSpeed &lt;int&gt; | WindSpeed9am &lt;int&gt; | WindSpeed3pm &lt;int&gt; | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0 |  1 | 13.4 | 22.9 |  0.6 | NA | NA | 44 | 20 | 24 | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 | 2 |\n",
       "| 2 | 0 |  2 |  7.4 | 25.1 |  0.0 | NA | NA | 44 |  4 | 22 | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 | 2 |\n",
       "| 3 | 0 |  3 | 12.9 | 25.7 |  0.0 | NA | NA | 46 | 19 | 26 | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 | 2 |\n",
       "| 4 | 0 |  4 |  9.2 | 28.0 |  0.0 | NA | NA | 24 | 11 |  9 | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 | 2 |\n",
       "| 5 | 0 |  5 | 17.5 | 32.3 |  1.0 | NA | NA | 41 |  7 | 20 | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 | 2 |\n",
       "| 6 | 0 |  6 | 14.6 | 29.7 |  0.2 | NA | NA | 56 | 19 | 24 | 55 | 23 | 1009.2 | 1005.4 | NA | NA | 20.6 | 28.9 | 2 |\n",
       "| 7 | 0 |  7 | 14.3 | 25.0 |  0.0 | NA | NA | 50 | 20 | 24 | 49 | 19 | 1009.6 | 1008.2 |  1 | NA | 18.1 | 24.6 | 2 |\n",
       "| 8 | 0 |  8 |  7.7 | 26.7 |  0.0 | NA | NA | 35 |  6 | 17 | 48 | 19 | 1013.4 | 1010.1 | NA | NA | 16.3 | 25.5 | 2 |\n",
       "| 9 | 0 |  9 |  9.7 | 31.9 |  0.0 | NA | NA | 80 |  7 | 28 | 42 |  9 | 1008.9 | 1003.6 | NA | NA | 18.3 | 30.2 | 1 |\n",
       "| 10 | 0 | 10 | 13.1 | 30.1 |  1.4 | NA | NA | 28 | 15 | 11 | 58 | 27 | 1007.0 | 1005.7 | NA | NA | 20.1 | 28.2 | 2 |\n",
       "| 11 | 0 | 11 | 13.4 | 30.4 |  0.0 | NA | NA | 30 | 17 |  6 | 48 | 22 | 1011.8 | 1008.7 | NA | NA | 20.4 | 28.8 | 1 |\n",
       "| 12 | 0 | 12 | 15.9 | 21.7 |  2.2 | NA | NA | 31 | 15 | 13 | 89 | 91 | 1010.5 | 1004.2 |  8 |  8 | 15.9 | 17.0 | 1 |\n",
       "| 13 | 0 | 13 | 15.9 | 18.6 | 15.6 | NA | NA | 61 | 28 | 28 | 76 | 93 |  994.3 |  993.0 |  8 |  8 | 17.4 | 15.8 | 1 |\n",
       "| 14 | 0 | 14 | 12.6 | 21.0 |  3.6 | NA | NA | 44 | 24 | 20 | 65 | 43 | 1001.2 | 1001.8 | NA |  7 | 15.8 | 19.8 | 2 |\n",
       "| 15 | 0 | 15 |  8.4 | 24.6 |  0.0 | NA | NA | NA |  4 | 30 | 57 | 32 | 1009.7 | 1008.7 | NA | NA | 15.9 | 23.5 | 3 |\n",
       "| 16 | 0 | 16 |  9.8 | 27.7 |   NA | NA | NA | 50 | NA | 22 | 50 | 28 | 1013.4 | 1010.3 |  0 | NA | 17.3 | 26.2 | 2 |\n",
       "| 17 | 0 | 17 | 14.1 | 20.9 |  0.0 | NA | NA | 22 | 11 |  9 | 69 | 82 | 1012.2 | 1010.4 |  8 |  1 | 17.2 | 18.1 | 1 |\n",
       "| 18 | 0 | 18 | 13.5 | 22.9 | 16.8 | NA | NA | 63 |  6 | 20 | 80 | 65 | 1005.8 | 1002.2 |  8 |  1 | 18.0 | 21.5 | 1 |\n",
       "| 19 | 0 | 19 | 11.2 | 22.5 | 10.6 | NA | NA | 43 | 24 | 17 | 47 | 32 | 1009.4 | 1009.7 | NA |  2 | 15.5 | 21.0 | 2 |\n",
       "| 20 | 0 | 20 |  9.8 | 25.6 |  0.0 | NA | NA | 26 | 17 |  6 | 45 | 26 | 1019.2 | 1017.1 | NA | NA | 15.8 | 23.2 | 2 |\n",
       "| 21 | 0 | 21 | 11.5 | 29.3 |  0.0 | NA | NA | 24 |  9 |  9 | 56 | 28 | 1019.3 | 1014.8 | NA | NA | 19.1 | 27.3 | 2 |\n",
       "| 22 | 0 | 22 | 17.1 | 33.0 |  0.0 | NA | NA | 43 | 17 | 22 | 38 | 28 | 1013.6 | 1008.1 | NA |  1 | 24.5 | 31.6 | 2 |\n",
       "| 23 | 0 | 23 | 20.5 | 31.8 |  0.0 | NA | NA | 41 | 19 | 20 | 54 | 24 | 1007.8 | 1005.7 | NA | NA | 23.8 | 30.8 | 2 |\n",
       "| 24 | 0 | 24 | 15.3 | 30.9 |  0.0 | NA | NA | 33 |  6 | 13 | 55 | 23 | 1011.0 | 1008.2 |  5 | NA | 20.9 | 29.0 | 2 |\n",
       "| 25 | 0 | 25 | 12.6 | 32.4 |  0.0 | NA | NA | 43 |  4 | 19 | 49 | 17 | 1012.9 | 1010.1 | NA | NA | 21.5 | 31.2 | 2 |\n",
       "| 26 | 0 | 26 | 16.2 | 33.9 |  0.0 | NA | NA | 35 |  9 | 13 | 45 | 19 | 1010.9 | 1007.6 | NA |  1 | 23.2 | 33.0 | 2 |\n",
       "| 27 | 0 | 27 | 16.9 | 33.0 |  0.0 | NA | NA | 57 |  0 | 26 | 41 | 28 | 1006.8 | 1003.6 | NA |  1 | 26.6 | 31.2 | 2 |\n",
       "| 28 | 0 | 28 | 20.1 | 32.7 |  0.0 | NA | NA | 48 | 13 | 30 | 56 | 15 | 1005.2 | 1001.7 | NA | NA | 24.6 | 32.1 | 2 |\n",
       "| 29 | 0 | 29 | 19.7 | 27.2 |  0.0 | NA | NA | 46 | 19 | 30 | 49 | 22 | 1004.8 | 1004.2 | NA | NA | 21.6 | 26.1 | 1 |\n",
       "| 30 | 0 | 30 | 12.5 | 24.2 |  1.2 | NA | NA | 50 | 11 | 22 | 78 | 70 | 1005.6 | 1003.4 |  8 |  8 | 12.5 | 18.2 | 2 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 872731 | 5 | 145431 |  9.3 | 28.0 | 0 |  7.6 | 10.8 | 28 |  6 | 11 | 36 | 16 | 1019.9 | 1016.9 | 4 | 2 | 16.6 | 27.3 | 2 |\n",
       "| 872732 | 5 | 145432 |  8.0 | 24.6 | 0 |  6.6 |  8.7 | 33 | 11 | 13 | 46 | 25 | 1021.7 | 1018.8 | 4 | 0 | 13.8 | 23.5 | 2 |\n",
       "| 872733 | 5 | 145433 | 12.7 | 22.2 | 0 | 12.4 |  3.2 | 37 | 19 | 13 | 59 | 34 | 1024.3 | 1021.7 | 8 | 8 | 13.9 | 21.0 | 2 |\n",
       "| 872734 | 5 | 145434 |  9.4 | 22.7 | 0 |  6.4 | 10.8 | 35 | 13 | 17 | 62 | 32 | 1026.6 | 1023.6 | 8 | 4 | 11.8 | 22.3 | 2 |\n",
       "| 872735 | 5 | 145435 |  5.4 | 20.5 | 0 |  4.8 | 10.6 | 46 | 20 | 28 | 56 | 32 | 1029.2 | 1025.3 | 2 | 2 | 11.1 | 20.2 | 2 |\n",
       "| 872736 | 5 | 145436 |  5.6 | 19.4 | 0 |  7.2 | 11.6 | 43 | 22 | 24 | 61 | 22 | 1029.6 | 1027.1 | 0 | 3 |  9.7 | 18.3 | 2 |\n",
       "| 872737 | 5 | 145437 |  1.5 | 19.2 | 0 |  3.4 | 10.3 | 37 | 17 | 22 | 45 | 18 | 1030.7 | 1026.7 | 7 | 1 |  6.8 | 17.6 | 2 |\n",
       "| 872738 | 5 | 145438 |  3.8 | 19.8 | 0 |  5.4 | 11.3 | 39 | 19 | 17 | 42 | 22 | 1028.7 | 1024.1 | 1 | 0 |  8.6 | 18.9 | 2 |\n",
       "| 872739 | 5 | 145439 |  4.5 | 18.8 | 0 |  7.6 |  9.9 | 31 | 13 | 15 | 42 | 26 | 1026.9 | 1022.4 | 0 | 1 |  9.5 | 18.6 | 2 |\n",
       "| 872740 | 5 | 145440 |  4.9 | 20.7 | 0 |  3.8 | 12.1 | 37 | 17 | 24 | 38 | 11 | 1027.1 | 1023.9 | 0 | 1 | 10.3 | 19.8 | 2 |\n",
       "| 872741 | 5 | 145441 |  1.2 | 20.8 | 0 | 11.4 | 13.1 | 43 | 13 | 28 | 29 |  6 | 1029.8 | 1025.9 | 0 | 0 |  7.9 | 19.9 | 2 |\n",
       "| 872742 | 5 | 145442 |  0.5 | 21.7 | 0 |  5.2 | 13.1 | 43 | 13 | 20 | 27 | 19 | 1029.0 | 1025.0 | 0 | 1 |  9.5 | 20.5 | 2 |\n",
       "| 872743 | 5 | 145443 |  4.0 | 20.0 | 0 |  2.0 | 10.4 | 39 | 13 | 26 | 58 | 26 | 1030.2 | 1026.7 | 1 | 0 |  9.1 | 19.0 | 2 |\n",
       "| 872744 | 5 | 145444 |  3.4 | 19.8 | 0 |  6.8 | 10.1 | 43 | 19 | 24 | 54 | 23 | 1031.8 | 1027.7 | 1 | 1 |  8.7 | 18.9 | 2 |\n",
       "| 872745 | 5 | 145445 |  3.2 | 18.6 | 0 |  5.6 | 11.4 | 46 | 15 | 20 | 56 | 29 | 1031.0 | 1027.2 | 1 | 1 |  8.2 | 17.4 | 2 |\n",
       "| 872746 | 5 | 145446 |  2.4 | 19.1 | 0 |  6.4 |  9.3 | 33 | 17 | 17 | 59 | 24 | 1030.0 | 1026.2 | 0 | 0 |  8.0 | 18.8 | 2 |\n",
       "| 872747 | 5 | 145447 |  5.1 | 19.7 | 0 |  3.2 |  8.9 | 46 | 13 | 17 | 56 | 29 | 1028.5 | 1025.8 | 1 | 7 |  8.5 | 19.2 | 2 |\n",
       "| 872748 | 5 | 145448 |  2.5 | 21.2 | 0 | 11.8 |  8.7 | 35 | 17 | 19 | 57 | 32 | 1027.2 | 1023.0 | 5 | 4 | 10.3 | 20.3 | 2 |\n",
       "| 872749 | 5 | 145449 |  2.3 | 21.4 | 0 |  8.6 |  5.7 | 22 | 11 |  7 | 60 | 28 | 1026.9 | 1022.8 | 7 | 8 |  8.9 | 20.3 | 2 |\n",
       "| 872750 | 5 | 145450 |  2.6 | 22.5 | 0 |  3.4 | 10.3 | 19 |  9 |  7 | 59 | 24 | 1025.0 | 1021.4 | 0 | 2 |  8.8 | 22.1 | 2 |\n",
       "| 872751 | 5 | 145451 |  5.2 | 24.3 | 0 |  4.2 | 11.3 | 24 | 11 | 11 | 53 | 24 | 1023.8 | 1020.0 | 0 | 3 | 12.3 | 23.3 | 2 |\n",
       "| 872752 | 5 | 145452 |  6.4 | 23.4 | 0 |  4.8 | 13.6 | 31 | 15 | 17 | 53 | 25 | 1025.8 | 1023.0 | 1 | 0 | 11.2 | 23.1 | 2 |\n",
       "| 872753 | 5 | 145453 |  8.0 | 20.7 | 0 |  4.9 |  8.5 | 41 | 19 | 26 | 56 | 32 | 1028.1 | 1024.3 | 7 | 7 | 11.6 | 20.0 | 2 |\n",
       "| 872754 | 5 | 145454 |  7.4 | 20.6 | 0 |  3.2 | 10.4 | 35 | 15 | 17 | 63 | 33 | 1027.2 | 1023.3 | 1 | 1 | 11.0 | 20.3 | 2 |\n",
       "| 872755 | 5 | 145455 |  3.5 | 21.8 | 0 |  4.2 | 11.1 | 31 | 15 | 13 | 59 | 27 | 1024.7 | 1021.2 | 0 | 1 |  9.4 | 20.9 | 2 |\n",
       "| 872756 | 5 | 145456 |  2.8 | 23.4 | 0 |  2.0 |  7.1 | 31 | 13 | 11 | 51 | 24 | 1024.6 | 1020.3 | 5 | 5 | 10.1 | 22.4 | 2 |\n",
       "| 872757 | 5 | 145457 |  3.6 | 25.3 | 0 |  5.6 | 10.1 | 22 | 13 |  9 | 56 | 21 | 1023.5 | 1019.1 | 2 | 5 | 10.9 | 24.5 | 2 |\n",
       "| 872758 | 5 | 145458 |  5.4 | 26.9 | 0 |  5.8 | 11.2 | 37 |  9 |  9 | 53 | 24 | 1021.0 | 1016.8 | 0 | 0 | 12.5 | 26.1 | 2 |\n",
       "| 872759 | 5 | 145459 |  7.8 | 27.0 | 0 |  6.2 | 10.8 | 28 | 13 |  7 | 51 | 24 | 1019.4 | 1016.5 | 3 | 2 | 15.1 | 26.0 | 2 |\n",
       "| 872760 | 5 | 145460 | 14.9 | 22.0 | 0 |  5.6 |  4.1 | 33 | 17 | 17 | 62 | 36 | 1020.2 | 1017.9 | 8 | 8 | 15.0 | 20.9 | 3 |\n",
       "\n"
      ],
      "text/plain": [
       "       .imp .id    MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed\n",
       "1      0     1     13.4    22.9     0.6     NA          NA       44           \n",
       "2      0     2      7.4    25.1     0.0     NA          NA       44           \n",
       "3      0     3     12.9    25.7     0.0     NA          NA       46           \n",
       "4      0     4      9.2    28.0     0.0     NA          NA       24           \n",
       "5      0     5     17.5    32.3     1.0     NA          NA       41           \n",
       "6      0     6     14.6    29.7     0.2     NA          NA       56           \n",
       "7      0     7     14.3    25.0     0.0     NA          NA       50           \n",
       "8      0     8      7.7    26.7     0.0     NA          NA       35           \n",
       "9      0     9      9.7    31.9     0.0     NA          NA       80           \n",
       "10     0    10     13.1    30.1     1.4     NA          NA       28           \n",
       "11     0    11     13.4    30.4     0.0     NA          NA       30           \n",
       "12     0    12     15.9    21.7     2.2     NA          NA       31           \n",
       "13     0    13     15.9    18.6    15.6     NA          NA       61           \n",
       "14     0    14     12.6    21.0     3.6     NA          NA       44           \n",
       "15     0    15      8.4    24.6     0.0     NA          NA       NA           \n",
       "16     0    16      9.8    27.7      NA     NA          NA       50           \n",
       "17     0    17     14.1    20.9     0.0     NA          NA       22           \n",
       "18     0    18     13.5    22.9    16.8     NA          NA       63           \n",
       "19     0    19     11.2    22.5    10.6     NA          NA       43           \n",
       "20     0    20      9.8    25.6     0.0     NA          NA       26           \n",
       "21     0    21     11.5    29.3     0.0     NA          NA       24           \n",
       "22     0    22     17.1    33.0     0.0     NA          NA       43           \n",
       "23     0    23     20.5    31.8     0.0     NA          NA       41           \n",
       "24     0    24     15.3    30.9     0.0     NA          NA       33           \n",
       "25     0    25     12.6    32.4     0.0     NA          NA       43           \n",
       "26     0    26     16.2    33.9     0.0     NA          NA       35           \n",
       "27     0    27     16.9    33.0     0.0     NA          NA       57           \n",
       "28     0    28     20.1    32.7     0.0     NA          NA       48           \n",
       "29     0    29     19.7    27.2     0.0     NA          NA       46           \n",
       "30     0    30     12.5    24.2     1.2     NA          NA       50           \n",
       "⋮      ⋮    ⋮      ⋮       ⋮       ⋮        ⋮           ⋮        ⋮            \n",
       "872731 5    145431  9.3    28.0    0         7.6        10.8     28           \n",
       "872732 5    145432  8.0    24.6    0         6.6         8.7     33           \n",
       "872733 5    145433 12.7    22.2    0        12.4         3.2     37           \n",
       "872734 5    145434  9.4    22.7    0         6.4        10.8     35           \n",
       "872735 5    145435  5.4    20.5    0         4.8        10.6     46           \n",
       "872736 5    145436  5.6    19.4    0         7.2        11.6     43           \n",
       "872737 5    145437  1.5    19.2    0         3.4        10.3     37           \n",
       "872738 5    145438  3.8    19.8    0         5.4        11.3     39           \n",
       "872739 5    145439  4.5    18.8    0         7.6         9.9     31           \n",
       "872740 5    145440  4.9    20.7    0         3.8        12.1     37           \n",
       "872741 5    145441  1.2    20.8    0        11.4        13.1     43           \n",
       "872742 5    145442  0.5    21.7    0         5.2        13.1     43           \n",
       "872743 5    145443  4.0    20.0    0         2.0        10.4     39           \n",
       "872744 5    145444  3.4    19.8    0         6.8        10.1     43           \n",
       "872745 5    145445  3.2    18.6    0         5.6        11.4     46           \n",
       "872746 5    145446  2.4    19.1    0         6.4         9.3     33           \n",
       "872747 5    145447  5.1    19.7    0         3.2         8.9     46           \n",
       "872748 5    145448  2.5    21.2    0        11.8         8.7     35           \n",
       "872749 5    145449  2.3    21.4    0         8.6         5.7     22           \n",
       "872750 5    145450  2.6    22.5    0         3.4        10.3     19           \n",
       "872751 5    145451  5.2    24.3    0         4.2        11.3     24           \n",
       "872752 5    145452  6.4    23.4    0         4.8        13.6     31           \n",
       "872753 5    145453  8.0    20.7    0         4.9         8.5     41           \n",
       "872754 5    145454  7.4    20.6    0         3.2        10.4     35           \n",
       "872755 5    145455  3.5    21.8    0         4.2        11.1     31           \n",
       "872756 5    145456  2.8    23.4    0         2.0         7.1     31           \n",
       "872757 5    145457  3.6    25.3    0         5.6        10.1     22           \n",
       "872758 5    145458  5.4    26.9    0         5.8        11.2     37           \n",
       "872759 5    145459  7.8    27.0    0         6.2        10.8     28           \n",
       "872760 5    145460 14.9    22.0    0         5.6         4.1     33           \n",
       "       WindSpeed9am WindSpeed3pm Humidity9am Humidity3pm Pressure9am\n",
       "1      20           24           71          22          1007.7     \n",
       "2       4           22           44          25          1010.6     \n",
       "3      19           26           38          30          1007.6     \n",
       "4      11            9           45          16          1017.6     \n",
       "5       7           20           82          33          1010.8     \n",
       "6      19           24           55          23          1009.2     \n",
       "7      20           24           49          19          1009.6     \n",
       "8       6           17           48          19          1013.4     \n",
       "9       7           28           42           9          1008.9     \n",
       "10     15           11           58          27          1007.0     \n",
       "11     17            6           48          22          1011.8     \n",
       "12     15           13           89          91          1010.5     \n",
       "13     28           28           76          93           994.3     \n",
       "14     24           20           65          43          1001.2     \n",
       "15      4           30           57          32          1009.7     \n",
       "16     NA           22           50          28          1013.4     \n",
       "17     11            9           69          82          1012.2     \n",
       "18      6           20           80          65          1005.8     \n",
       "19     24           17           47          32          1009.4     \n",
       "20     17            6           45          26          1019.2     \n",
       "21      9            9           56          28          1019.3     \n",
       "22     17           22           38          28          1013.6     \n",
       "23     19           20           54          24          1007.8     \n",
       "24      6           13           55          23          1011.0     \n",
       "25      4           19           49          17          1012.9     \n",
       "26      9           13           45          19          1010.9     \n",
       "27      0           26           41          28          1006.8     \n",
       "28     13           30           56          15          1005.2     \n",
       "29     19           30           49          22          1004.8     \n",
       "30     11           22           78          70          1005.6     \n",
       "⋮      ⋮            ⋮            ⋮           ⋮           ⋮          \n",
       "872731  6           11           36          16          1019.9     \n",
       "872732 11           13           46          25          1021.7     \n",
       "872733 19           13           59          34          1024.3     \n",
       "872734 13           17           62          32          1026.6     \n",
       "872735 20           28           56          32          1029.2     \n",
       "872736 22           24           61          22          1029.6     \n",
       "872737 17           22           45          18          1030.7     \n",
       "872738 19           17           42          22          1028.7     \n",
       "872739 13           15           42          26          1026.9     \n",
       "872740 17           24           38          11          1027.1     \n",
       "872741 13           28           29           6          1029.8     \n",
       "872742 13           20           27          19          1029.0     \n",
       "872743 13           26           58          26          1030.2     \n",
       "872744 19           24           54          23          1031.8     \n",
       "872745 15           20           56          29          1031.0     \n",
       "872746 17           17           59          24          1030.0     \n",
       "872747 13           17           56          29          1028.5     \n",
       "872748 17           19           57          32          1027.2     \n",
       "872749 11            7           60          28          1026.9     \n",
       "872750  9            7           59          24          1025.0     \n",
       "872751 11           11           53          24          1023.8     \n",
       "872752 15           17           53          25          1025.8     \n",
       "872753 19           26           56          32          1028.1     \n",
       "872754 15           17           63          33          1027.2     \n",
       "872755 15           13           59          27          1024.7     \n",
       "872756 13           11           51          24          1024.6     \n",
       "872757 13            9           56          21          1023.5     \n",
       "872758  9            9           53          24          1021.0     \n",
       "872759 13            7           51          24          1019.4     \n",
       "872760 17           17           62          36          1020.2     \n",
       "       Pressure3pm Cloud9am Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "1      1007.1       8       NA       16.9    21.8    2           \n",
       "2      1007.8      NA       NA       17.2    24.3    2           \n",
       "3      1008.7      NA        2       21.0    23.2    2           \n",
       "4      1012.8      NA       NA       18.1    26.5    2           \n",
       "5      1006.0       7        8       17.8    29.7    2           \n",
       "6      1005.4      NA       NA       20.6    28.9    2           \n",
       "7      1008.2       1       NA       18.1    24.6    2           \n",
       "8      1010.1      NA       NA       16.3    25.5    2           \n",
       "9      1003.6      NA       NA       18.3    30.2    1           \n",
       "10     1005.7      NA       NA       20.1    28.2    2           \n",
       "11     1008.7      NA       NA       20.4    28.8    1           \n",
       "12     1004.2       8        8       15.9    17.0    1           \n",
       "13      993.0       8        8       17.4    15.8    1           \n",
       "14     1001.8      NA        7       15.8    19.8    2           \n",
       "15     1008.7      NA       NA       15.9    23.5    3           \n",
       "16     1010.3       0       NA       17.3    26.2    2           \n",
       "17     1010.4       8        1       17.2    18.1    1           \n",
       "18     1002.2       8        1       18.0    21.5    1           \n",
       "19     1009.7      NA        2       15.5    21.0    2           \n",
       "20     1017.1      NA       NA       15.8    23.2    2           \n",
       "21     1014.8      NA       NA       19.1    27.3    2           \n",
       "22     1008.1      NA        1       24.5    31.6    2           \n",
       "23     1005.7      NA       NA       23.8    30.8    2           \n",
       "24     1008.2       5       NA       20.9    29.0    2           \n",
       "25     1010.1      NA       NA       21.5    31.2    2           \n",
       "26     1007.6      NA        1       23.2    33.0    2           \n",
       "27     1003.6      NA        1       26.6    31.2    2           \n",
       "28     1001.7      NA       NA       24.6    32.1    2           \n",
       "29     1004.2      NA       NA       21.6    26.1    1           \n",
       "30     1003.4       8        8       12.5    18.2    2           \n",
       "⋮      ⋮           ⋮        ⋮        ⋮       ⋮       ⋮           \n",
       "872731 1016.9      4        2        16.6    27.3    2           \n",
       "872732 1018.8      4        0        13.8    23.5    2           \n",
       "872733 1021.7      8        8        13.9    21.0    2           \n",
       "872734 1023.6      8        4        11.8    22.3    2           \n",
       "872735 1025.3      2        2        11.1    20.2    2           \n",
       "872736 1027.1      0        3         9.7    18.3    2           \n",
       "872737 1026.7      7        1         6.8    17.6    2           \n",
       "872738 1024.1      1        0         8.6    18.9    2           \n",
       "872739 1022.4      0        1         9.5    18.6    2           \n",
       "872740 1023.9      0        1        10.3    19.8    2           \n",
       "872741 1025.9      0        0         7.9    19.9    2           \n",
       "872742 1025.0      0        1         9.5    20.5    2           \n",
       "872743 1026.7      1        0         9.1    19.0    2           \n",
       "872744 1027.7      1        1         8.7    18.9    2           \n",
       "872745 1027.2      1        1         8.2    17.4    2           \n",
       "872746 1026.2      0        0         8.0    18.8    2           \n",
       "872747 1025.8      1        7         8.5    19.2    2           \n",
       "872748 1023.0      5        4        10.3    20.3    2           \n",
       "872749 1022.8      7        8         8.9    20.3    2           \n",
       "872750 1021.4      0        2         8.8    22.1    2           \n",
       "872751 1020.0      0        3        12.3    23.3    2           \n",
       "872752 1023.0      1        0        11.2    23.1    2           \n",
       "872753 1024.3      7        7        11.6    20.0    2           \n",
       "872754 1023.3      1        1        11.0    20.3    2           \n",
       "872755 1021.2      0        1         9.4    20.9    2           \n",
       "872756 1020.3      5        5        10.1    22.4    2           \n",
       "872757 1019.1      2        5        10.9    24.5    2           \n",
       "872758 1016.8      0        0        12.5    26.1    2           \n",
       "872759 1016.5      3        2        15.1    26.0    2           \n",
       "872760 1017.9      8        8        15.0    20.9    3           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df_numerical_imputed"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "8a563aab",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:26.733185Z",
     "iopub.status.busy": "2023-02-21T13:22:26.731183Z",
     "iopub.status.idle": "2023-02-21T13:22:30.296615Z",
     "shell.execute_reply": "2023-02-21T13:22:30.294289Z"
    },
    "papermill": {
     "duration": 3.5894,
     "end_time": "2023-02-21T13:22:30.299509",
     "exception": false,
     "start_time": "2023-02-21T13:22:26.710109",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nFKs2eZTnVKEAAAAASUVORK5CYII="
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
    "pbox(df_numerical_imputed,pos=1,cex=0.7)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "56965502",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:30.345023Z",
     "iopub.status.busy": "2023-02-21T13:22:30.342829Z",
     "iopub.status.idle": "2023-02-21T13:22:34.552191Z",
     "shell.execute_reply": "2023-02-21T13:22:34.549995Z"
    },
    "papermill": {
     "duration": 4.234768,
     "end_time": "2023-02-21T13:22:34.555266",
     "exception": false,
     "start_time": "2023-02-21T13:22:30.320498",
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
      "“\u001b[1m\u001b[22mRemoved 69835 rows containing missing values (`geom_point()`).”\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdebxUdf0/8DPLvXPvwIULXlBExF2U3NLUlEJLv0Zp+RMQl1xwX3DJr2VoKWpi\nmpoLmGZpkltufdNUvl/NPTOVNNwV9yCFELjA3Wfm98fUOF6512GZAT48n3/wmM+cM5/z/nzm\nzNwXZ86cieVyuQgAgNVffGUXAADAiiHYAQAEQrADAAiEYAcAEAjBDgAgEIIdAEAgBDsAgEAI\ndgAAgUiu7AKWUUtLS3Nzc7m3kk6nq6qq2tvbm5qayr2tNVwqlUokEua53FKpVE1NTTabXbhw\n4cquJXBVVVU1NTXmudyqqqrS6XQURY2Nja63X1bxeLyurm7BggUru5DA5ec5iqJFixZlMpmu\nVuvTp09Xi1bXYJfL5boZ8AoUj8djsVhltrWGM8+VEY/HK/byWZMlk0m7dAUkk8l4PB5FUSaT\nEezKLR6PZ7NZ81xu+V06m80u2xuIj2IBAAIh2AEABEKwAwAIhGAHABAIwQ4AIBCCHQBAIAQ7\nAIBACHYAAIEQ7AAAAiHYAQAEQrADAAiEYAcAEAjBDgAgEIIdAEAgBDsAgEAIdgAAgRDsAAAC\nIdgBAARCsAMACIRgBwAQCMEOACAQgh0AQCAEOwCAQAh2AACBEOwAAAIh2AEABEKwAwAIhGAH\nABCICgW7tsY3rv7JGd8dM2rUQYeddtZFf35v0ZLWyj5626T/PuGI/Q85+uyLrnu7qaMytXXj\njDPOqKqqOvLII/PNadOmHXXUUR9//HG+eeONN5500kmFlcePH3/22WcXmhdeeOFDDz2Uv93Y\n2Dh+/PhXX30135w9e/bkyZMXLFiQb7744os/+9nPCg+cOnXq9ddfX2jefffdjzzySKF5xx13\nvPXWW/nbCxYsmDx58uzZs/PNV1999eSTT54/f36++fjjj59//vmFB/7+97+/5ZZbCs3LLrvs\n3nvvzd9uaWk57bTTnnvuuXxz5syZJ5988syZM4tH3dzcnG/edtttP/jBDwr9/PrXv54yZUqh\nedBBB1177bX5221tbVOnTi3U88Ybbxx11FGzZs3KN//v//7vsMMOKzxwypQpEyZMKDTPOOOM\nyy+/vNA88cQTp06dmr89Z86c8ePHv//++/nm/Pnzp06d2tbWlm/ecssthxxySOGBZ511VvFz\ndOuttz711FP5201NTYcddtijjz5a6HbixIlz5szJN6dPn37yySe3tLSUMuof/ehHf/zjHwv1\nnHzyyYXnutOon3vuueKd5O67777yyisLzRtvvLHQTxRFI0eOLDxlH3/88cSJEwv9zJo1a/Lk\nyU1NTUsc9ZVXXjlx4sRCc/z48YVqW1pajj766L/85S/5Zqfn+tVXXx0/fnxra2u+OXXq1OI9\n86qrrrrmmmsKzbFjx95www352x9++OHee+9dmNvp06ePHDmy8Bx1eq7Hjx8/ZsyYQnPChAnF\n3X7/+98v7PDvv//+yJEjp0+fnm8+9dRTe++994cffphv3nXXXUcffXThgUccccTo0aMLzfPP\nP//2228vjLp4D+/0XH/44Yc333xzR8e/33Aee+yxX/ziF12N+vjjjy88KfnX9YwZM/LNWbNm\nTZw4sfD+8M477xTvJI8//vgdd9xRaI4ePfrkk08uNIcNG3bFFVcU6jn55JPffvvtwmQWv+1M\nnz69+P3h4osv/vGPf1xoHnLIIZdccskSR/3666/vvffer7/+eqGf4j38l7/8ZfErZdiwYXvs\nsUeh+Z3vfOeqq67K3549e/bIkSOfeeaZfLPTHn7FFVcMGzas8MBzzz33qKOOKjRPP/304tf1\nyJEj77777vztTs/1jBkzxo8f39jYmG/ecMMNxXv4NddcU6gniqL999+/0G2n13WnPfzBBx8c\nM2bM4sWL883bb7+9+E1y4sSJxa/Ho48++q677srf/sc//rHbbrs9/PDDhdkr3sMfeeSR73//\n+4UHHnfccfvuu2+hOW7cuEsvvbR4aaG8Tu/h99xzz/bbb1946p988sniYU6cOPHcc88tNL/5\nzW8WmosXLx45cuQTTzxRmL2RI0cW9szp06efffbZhdf1VVddddxxxxX6eeSRRwqv3CiKzj//\n/Mcffzx/u6Wl5eabby68Ut54440xY8YUnuuXX375uuuuKzzwmmuuKX4Pv+OOOwr9RFH04IMP\nFl65n/tudvzxxxceeOqpp5544omF5tFHH/3LX/4yfzubzU6bNm3Ron/HiY6OjpkzZxZeyK2t\nrbNmzcrlcvnmCy+8cP/990drhlhh2OWUu/yoA5/rudOJR36zIb74kd9d9cCr6etuuaqh6lOx\n8u27zvzeTe9998RxW/bpuO/ayc/HvnLztSd2FTybm5sLL85yGDBgQGH/+Fyx2KemsVNzmXXq\n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\nSOJ/Kwg5RoNmnz4AAAAASUVORK5CYII="
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
    "heart.plot <- ggplot(df_numerical, aes(x=Sunshine, y=RainTomorrow)) +\n",
    "geom_point()\n",
    "\n",
    "heart.plot"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "83fa87cd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:22:34.600369Z",
     "iopub.status.busy": "2023-02-21T13:22:34.598570Z",
     "iopub.status.idle": "2023-02-21T13:23:15.050289Z",
     "shell.execute_reply": "2023-02-21T13:23:15.047893Z"
    },
    "papermill": {
     "duration": 40.499382,
     "end_time": "2023-02-21T13:23:15.075611",
     "exception": false,
     "start_time": "2023-02-21T13:22:34.576229",
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
      "“\u001b[1m\u001b[22mRemoved 69835 rows containing missing values (`geom_point()`).”\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzde5yUdaH48WcuO7MMLCywXoaLoKIgKEp6ungjSo9Zx07H8HLykngP6ajnVJr0\n816mmZmiaZSZ5vGSnrKbnTRTtDqVqKl5w/AWJBACC3vfmfn9MTquyK6zCzPLfnm///C1z8zD\n83y/352d/Ti3jRUKhQgAgIEv3t8DAABg0xB2AACBEHYAAIEQdgAAgRB2AACBEHYAAIEQdgAA\ngRB2AACBSPb3APqotbW1paWl0mfJZDI1NTUdHR3Nzc2VPtcWLp1OJxIJ61xp6XS6trY2n8+v\nXbu2v8cSuJqamtraWutcaTU1NZlMJoqixsZGn7dfUfF4vK6ubs2aNf09kMAV1zmKonXr1uVy\nue52Gz58eHdXDdSwKxQKPUx4E4rH47FYrDrn2sJZ5+qIx+NV+/HZkiWTSTfpKkgmk/F4PIqi\nXC4n7CotHo/n83nrXGnFm3Q+n+/bHYinYgEAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh\n7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAAC\nIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAAAiHsAAACIewAAAIh7AAA\nAlGlsGtvfP7ai886+oiZMz/16f+ce+lvX163ob3yD9w2779mH3/4MSede+n8xc2d1RlbDyZO\nnFhTUzN+/Pji5pQpU7LZ7LXXXlvc3G677UaNGlXaefTo0WPGjCltjho1aty4ccWvb7/99mw2\nu//++xc3zzzzzGw2e9111xU399xzz2w2W/qHY8eO7eGw2Wx2v/32K379zW9+M5vNnnLKKcXN\nD3/4w9ls9uabby5ujh8/vuthx4wZM3r06K7D22677Ypf33vvvdlsdtq0acXNE088MZvNnnji\nicXNXXfdNZvN3nXXXb2ddfGwJ5xwQnHzIx/5SDab/fznP1/c3HHHHbsOb+TIkUOGDOlh1ttv\nv33x6y9/+cvZbPbII48sbs6aNSubzf7qV7/q7axvvfXWbDY7YcKE4ubpp5+ezWZPP/304ua0\nadOy2exPfvKT3s76yiuvzGaze+yxR3Fzn332yWazp5566gZn/a7f69Ks58yZk81mp0+fXtx8\n3/vel81mv/Wtb/V21ldffXVNTc3IkSOLmwceeGA2mz3wwAOLmxMnTsxms9dcc01vZ128SU+e\nPLm4OXXq1Gw2e8ghh2zkrD/2sY9ls9mpU6cWNydPnpzNZk866aTeznrevHldv9eHHHJI1+FN\nmjQpm83efvvtvZ31cccd13XW++23XzabnT17dmk8tbW1fZj1xz/+8XfOeubMmRs567322iub\nze61117FzeL3et68eeXMOpvNlmY9c+bMd36vS7fM7bfffr3hdT3sqFGj1jvsjjvuWPx6+vTp\nPcx63LhxPcw6lUplMplyZj1hwoRezbp059/bWa/3TRk7dmzfZt11eO/6vZ44ceKmnfXXvva1\nbDY7ZcqU4uaUKVNqampKdxf9PutFixZ1/Ym77LLLstnsZZddVty84oordtlllxUrVhQ3p06d\n2vWwCxcufPLJJ0ubr732WnNzc/HrfD6/ZMmS9vb2aMCKFQqFyp+lcOWJ//7IkPeddsJHG+JN\nv7n96nueycz/76sbat6WlYvvOufMH7x89GlzJg/v/Pn11zwW2++W60/rLjxbWlqampoqN+Js\nNtvZWW5ZxmJvW8b1NvtsUx2nQoc168oddlMx6014nM1t1tUZ3pY5603FrDfhcSpx2Fgstt12\n273++utr166NxWK77LLL6NGjFyxY0NbWlkwm999//4suumjnnXfe+JP2SiKRGD58eBRFq1ev\n7qFDGhoauruqGmHXtub+w4658sybfzhjWDqKos7mpw898uyDrvvv00a99QhNVGifc8QRqZmX\nX3H4jlEUta1++LBjLzvsW7ceM3rwBo9Z0bDrVdUBAIGJx+OpVOrnP/956cHF6tj4sKvGU7Hx\nZMPxxx//vrrUG9uxZBRFmcTbTt22ZsErrbkDD3zjEdd0/b7ThqQWPvBaFYb3TqoOALZk+Xy+\nvb197ty5/T2QXktW4Rw1g6d+4hNToyha9fgfHv373x/99V1bTTnkmK0zXfdpb3oiiqLJmZrS\nJbtkkr98Yk101Bub+Xz+05/+dOnaAw888FOf+lQVBg8AbIHy+fwf/vCHeDw+dOjQqp00FosV\nv6irq+vuOdV8Pt/DEaoRdiXLHr7/ly8sefnllg8cOn69q/JtTVEUjUy+9TBeQ02ic11r132e\neeaZ0te77757MlmRwZ9//vmVOCwAMLAUCoXGxsYRI0ZU/9SJRKK7q3K5XA//sKphN2nOF78W\n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\ndnPPOPWwubfcfuEnKzAwAAB6p9x3xb74w6NmXnT71tOPv/3ePyxZvnLViqV/uv/OEz64zR0X\nzTzmf16q5AgBAChLuY/YXX7GT4aMPu7Z++Zn4rHiJXvN+OSe0w/Oj9v2js9+PTr06oqNEACA\nspT7iN1tK5p3Pvn0UtUVxeKZ0+dMbFlxawUGBgBA75QbdkPi8dZlre+8vHVZayzh/RMAAP2v\n3LA7Y6dhL9w0+5FVbV0vbF/z6JzvPD9swukVGBgAAL1T7mvsZt154XlTPrvP+N2PnzNrn6kT\naqOWvz75uxvn3fB8c+qqH86q6BABAChHuWFXP3H20/cmj559znVfOfu6Ny8cMXH/a665+dRJ\n9RUaHAAA5evF59iNmXHyA8+c9LdnF/7lr0vbovSoHSa/Z5ex5T6VCwBAhfXuL09EUWzMpL3G\nTKrIUAAA2Bi9CLuWvz/724VPr2zqeOdVRxxxxKYbEgAAfVFu2L101+f3/PcrXu/Ib/BaYQcA\n0O/KDbvPnnJNY2LsefMumTF5u2Ts3fcHAKDKyg27+1e37X7B3eefvHtFRwMAQJ+V+67WfYam\nareurehQAADYGOWG3TcuPOCRzx//yPKWio4GAIA+K/ep2ClzfnzSvK0+sN2EDx/8wbENmfWu\nnT9/fs//vNC56kfzr7/nd39e2RrPjt3p48ecetC0bd+xV/6B26796YJHX12bmLTre4/77Kwd\nMr39NBYAgC1XrFAolLPfw2fvvd+lv4+iKJmufeebJ1pa3uWRvP+98IRvPz30uJMPnzRq8BO/\nvvWmXz0/a973PzF2SNd9Ft91zpk/ePno0+ZMHt758+uveSy23y3Xn9bdI4otLS1NTU3ljLzP\ntt1223w+XygUYrFYPB4vvCkWiyWTyc7OziiKipuDBw9uamoqrmQsFstkMs3NzcWroigq7lzc\nLOrusKlUqr29vXSc4cOHr1q1qrSZTqfb2tpKx4nH47lcboPHSSQSxVMUN2tra1tbW0vHGTp0\naGNjY2mzpqamo6OjnOEN6FnX1dWtXbt2k8960KBBLS0t5cx6veH1POvStf016+KelZ51Q0PD\nP/7xj77NOpfLlYZXoVmvd5zNbdal8aw36+LwNtWsS2tbPGxxDNWc9Xo/gOvNunTL3Dxn3eef\n64rOuruflK6zXm94m3DWPQxvvVmXfqdscNbl/4pZb9br/QbsedapVKr0C2ibbbZZvnx56bBj\nx45duHBhKRjuv//+I488snjYZDK5aNGiIUPeVjjlSyQSw4cPj6Jo9erVxQXZoIaGhu6uKjfs\npg5JvTjiX+996Pr3jxvR21Hm2l6defic6V+58Ywpw6MoiqLCvE8f8cio/7zxkve/tVOhfc4R\nR6RmXn7F4TtGUdS2+uHDjr3ssG/deszowRs8ZqXDbuutty5zZQCALU0sFlu+fHkURTvssMPa\ntWvXu3bGjBl33HFHHw678WFX1mvsCvmmp5o733PJJX2ouiiKcq0vjdt++4/uMPTNC2LThqU7\nVq/ruk/bmgWvtOYOPHB0cTNdv++0IamFD7zWh9NtPFUHAPSgUChsu+22c+fOfWfVRVH0m9/8\nZt26de+8vArKehFbLJYcl06senxFdNSEPpwjNWy/K6/cr7TZse7ZG5auGzdrYtd92pueiKJo\ncqamdMkumeQvn1gTHfXGZqFQ+NOf/lS6dvjw4VtvvXUfBlMOVQcA9CyXy/XwHoOpU6e++uqr\nvT1mIpEofpFMJovPO/dWee9OiKV/dvUx02Z/7Mr9F5x+yK4b8/nELz/yi6u+eUPHDgfP/ciY\nrpfn25qiKBqZfOsRxIaaROe61tJmoVCYPXt2afPII4/83Oc+txED6db5559ficMCAIHp4ZGg\ndevWDRs2rM9H7uFVesWX23an3Lednvr9RaOTa8/8+G5n12+z1ZCa9a4tp0nbVz13w9VX3fPY\n69NnfubLn/pQ7ds7NJ4aFEXRqs78kDdbdWVHLlGfKnN4m9D5559/wQUXVP+8AAAbqdywa2ho\naDjoX/bo62nWvvzr//rcvMRuB182/9iJDRv4oOOawbtF0YLnWjrHpt8Iu0UtncP2rS/tEI/H\n77777rf2r6lZtWpVX4cDALCxYrFu34S67bbb9iFUEonE0KFDoyhqbGzs7pG5QqEwYkS373ko\nN+x+9KMf9XZwb40g3/zls65Nf/g/rjp1RndP49bWzxiVuu5/H15+wL+MjaKoo+nxP65tP/SA\nt33W3ejRo0tfV/RdsT18nwAAoiiqqamZN2/eKaecssFrn3jiiZ6fM+1ZPp/v2z/v3ScANy95\n/M6773168dLmXDK7w5R//sTMPce++ye1NC+/5enmjlm7ZRY+8shbJx40YY8p9Yvv/MGDzcNm\nHXtIFEt9buakz994/n3ZL0wZ3vGTa76eyX742DF9/BiYjbR8+XJvjAUAuirupzkAACAASURB\nVBOPx5cuXRpF0RVXXPHcc8+td+1ZZ53VH4OKovL/pFgURXede+SI7d7z6dO+cOnXr7z6ysvP\n+Y9Z/zS+4Yhz73rXf7j2hZeiKPrepV++sIvLr302iqIl99/zs188XNxtwhEXzz5k8m3fOHf2\nFy5eVL/3xVd0++nEVbB8+fLa2trSJx+m0+ni+1OKhg0blkgkSp9nOH369Hg83nWztGfxMdXS\nZk1NTTqdLm0OGjSo62Gz2WzXw5533nldDztu3Liuh81kMqXNVCpVU1NT2hw8eHDpOLFYbPLk\nyV2P0/WwiURiq622Ku2ZTCa3zFl3HV7Ps15veOvNesiQIV1nnUqlypz1ihUrepj1oEGDNsms\nR4wYUeasR4wYUaFZdz1OD7NOJpM9zHrIkCHVn/XkyZMrMetsNhvMrLsOb9y4cZWY9Xp3O9WZ\n9eDBgzd+1olEokKzHjZsWJmz3mqrrTbJrDOZTA+zXm94Pcw6nU53nfXQoUN7mHXXzZ5nXVtb\n2+dZd/3VUFNT8573vKe0eeyxx3Yd3te+9rVly5YVg+Hhhx9+8cUXS7+eRo8evWLFigq9v7Mc\n5T7n+OIPj9rh8P8eO+OEy885ed/dJ2RibS88+bvrL/7P79z/ytF3vXjzoeMrPM71VeEvT0RR\nVFdXl06n29vbGxsbK32uLVwmk0kmk9a50jKZTCaTyeVyXqJaael0OpPJWOdKS6fTdXV1URSt\nXLnS0ywVVfzgXOtcaRv/AcXlPhV7+Rk/GTL6uGfvm5+Jv/Eyub1mfHLP6Qfnx217x2e/Hh16\ndW+GDQDAplfus523rWje+eTTS1VXFItnTp8zsWXFrRUYGAAAvVNu2A2Jx1uXtb7z8tZlrbFE\n/7zFAQCArsoNuzN2GvbCTbMfWdXW9cL2NY/O+c7zwyacXoGBAQDQO+W+xm7WnReeN+Wz+4zf\n/fg5s/aZOqE2avnrk7+7cd4NzzenrvrhrIoOEQCAcvQUds8991y6ftz4bWqjKKqfOPvpe5NH\nzz7nuq+cfd2bO4yYuP8119x86qT6Hg4CAEB19BR2kyZN2uXU3z39rQ8UN8fMOPmBZ07627ML\n//LXpW1RetQOk9+zy9h+/Kg5AAC66t1fnoii2JhJe42ZVJGhAACwMTziBgAQCGEHABCId3kq\ndsl95/37v49816PceqvPKAYA6GfvEnaNL9x72wvvfhRhBwDQ794l7HY69mcPXbZXdYYCAMDG\neJewS2ZGbLPNNtUZCgAAG8ObJwAAAiHsAAAC0dNTsSeeeGJ237c9D/v63xavaOp4554TJ07c\nxOMCAKCXegq7+fPnl75u/cd9n9z3iF889/oG9ywUCpt4XAAA9FK5f1Ls2/96zD2L1v7LZ87+\nyNTxyVhFhwQAQF+UG3YX/2nFDkf8z0+v/XhFRwMAQJ+V9eaJQm7tio7cuCOmVno0AAD0WVlh\nF0sM+WB97eIbH6n0aAAA6LMyP+4kdtvPLmq/5+jjLvr+sqbOyo4IAIA+Kfc1djPPvnubbM33\nzz3upvNOGLHttoMSb3sDxauvvlqBsQEA0Avlhl1DQ0NDwwHj9qjoYAAA6Ltyw+5HP/pRRccB\nAMBG8ifFAAAC0dMjdtOmTYvF048u/L/i1z3s+dhjj23icQEA0Es9hd2QIUNi8XTx6/r6+qqM\nBwCAPuop7B566KHS17/5zW82uE8h37y2aROPCQCAPtjY19j97b5/G7nVLptkKAAAbIxy3xVb\nyK2bd8ZJ3//1Iytb3vYBxa+98nJs0OQKDAwAgN4p9xG7xy784H/Mu62xfvuds50vvfTSpKl7\n7D51UnLl0tiIGdfe/cuKDhEAgHKU+4jdOVf/ZeSuFz//u7mF3Lodhgzfd95Nc8fWtSx/cNft\nP7pu1OCKDhEAgHKU+4jdQ43t44/8lyiKYokhx2yduf/RlVEUDdp6+k3Hjb945vwKDhAAgPKU\nG3bDk7GOtR3Fr983ZvCSu5cUvx536JjVL3yjIkMDAKA3yg27E0fXvfC9r77alouiaOzHR//t\nF98uXv7ar5dVamgAAPRGuWF3yg0ntaz4nx0btnuxNbfjsSc2L7/5A7O+8LULz/yXrz81YspZ\nFR0iAADlKPfNE9nplz12V/aC638aj0WDs6fcesadR115+f8VCkN3POjOX55S0SECAFCOWKFQ\n6Nu/bHz1+RebaidP3K4mtmmHVJaWlpampor/yYu6urp0Ot3e3t7Y2Fjpc23hMplMMpm0zpWW\nyWQymUwul1u1alV/jyVw6XQ6k8lY50pLp9N1dXVRFK1cubLPv84oRyKRGD58uHWutOI6R1G0\nevXqzs7O7nZraGjo7qpyH7F7p6Fjd969z/8YAIBN7d1fY9f2+st/+r/f/vmZv+Y3dO3a1579\nylEHbfJhAQDQWz2GXb7lihMPrNtq+/d+YN89Jk/YatKHf/nKunz7388//pBJ248ePmxoJp0c\nmt1l7n//qlqjBQCgWz09Ffvk1w/+r+8+WDN4x49/bN9tBrctuOt/Zr7vmG+8//ELfvzS1jvv\nscdek2KFwuD6hh2nvL9qwwUAoDs9hd1XLv9TTWbSH199fI/h6SiKOr759O7b7nHyjzsOuOyB\nez8/vVojBACgLD09FXvP661b/9M3ilUXRVFN3eRvvG+bKIq+9dl9qjE0AAB6o6ewW9OZHzpx\nWNdL6ncbFkXRhNq+v5cWAIAKebd3xb79+li8Pz6zDgCAMpT7J8UAANjMCTsAgEC8y6vl/vHI\nDRdc8NbH1C35v+VRFF1wwQXr7Xbeeedt8pEBANArPf2t2Fis3FfUVf8vx/lbsYHxt2Krw9+K\nrRp/K7Y6/K3YqvG3Yqujsn8r9oEHHtiIsQEAUFU9hd306T6FGABgwPDmCQCAQAg7AIBACDsA\ngEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7\nAIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAIOwCAQAg7AIBACDsAgEAI\nOwCAQAg7AIBACDsAgEAk+3sAfRSPxwcPHlzpsySTySiKEolEFc61hUsmk9X5nm7hijdpS10F\niUTCOldBIpEofpHJZPp3JMGLxWKRda68ePyNR9wGDRqUz+c3uE93lxcN1LCLxWKlyVf0LFU7\n1xYuFotZ5yoo3qSjLvcdVEhxqa1zpblJV42bdHWUbtI9/E4s7bNBAzXscrlcU1NTpc9SV1eX\nTqc7OzvXrl1b6XNt4TKZTDKZtM6VVlznfD5vqSstnU5nMhnrXGnpdLqmpiaKonXr1hUKhf4e\nTsgSiUQqlbLOlVZc5yiKmpubOzs7u9uttra2u6ukNwBAIIQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQd\nAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCE\nHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAg\nhB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBA\nIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0AQCCEHQBAIIQdAEAghB0A\nQCCSVT7fjZ/5dO2F1x251aB3XrXs93NPuuTJrpcc/707PjGytlpDAwAY2KoZdoVFD333R0tX\nH1YobPDq1Y+vHjTykNNPmlK6ZFxdTbXGBgAw4FUp7Jb//sqzrn545br2nvZ5urF+8t577z2l\nh30AAOhOlV5jVz/lsLkXfvXyS8/qYZ/HG9uGT6vPtTS+tnz1hh/TAwCge1V6xC41dPSEoVGu\nvacXzD22rqPw8FWHX/1sR6GQHLzVQZ86/ZRDppauzefzBxxwQGnz0EMPPe200yo44iiKoigW\ni0VRlEqlRo4cWelzEYvFrHN1JBIJS10FbtLVNGLEiP4ewhbBOlfNsGHDursql8v18A+r/eaJ\n7uTal6xL1Ixv2PvSWy6sL6z9wy9u+Nr8L6V3uum4SfWlfRobG0tft7a2FqurOqp5ri2Zda4a\nS10d1rlqLHV1WOeq6WGpe/4ubC5hl0iNvuOOO97cSu93xBee/+XC+7/z1HGX71u8KBaLnXPO\nOaX9x40bt27dukqPqra2NplM5nK5lpaWSp9rC5dKpeLxeGtra38PJHCpVCqVSuXz+ebm5v4e\nS+CSyWQqlbLOlZZMJmtra6MoqsJvhC1cPB7PZDJNTU2Fbt4BySZRXOcoipqbm/P5/Ab3KRQK\ndXV13R1hcwm7d5q2zaD7Xl9R2ozFYoceemhps6WlpampqdJjqKmpKYad4Ki0eDyeTCatc6XF\n4/FUKlUoFCx1paXT6ZqaGutcael0uhh2bW1tgqOiEolEJpNpbW21zhVVXOcoitrb2zs7O7vb\nrYew21w+oHj189eccOJpr7WX4jT/4NLm+sk79+eYAAAGlH4Ou8V3/uB7N/00iqKhOxwxsnnZ\nWedf/6ennlv0l8dvu/ILC5rqTj5R2AEAlKufw27J/ff87BcPR1EUTzZcdM0FH6h79aqLv3TO\nV656bPWoL3zjm9OG+IBiAIByxQbok+XVeY1dXV1dOp1ub2/v+oZcKiGTySSTSetcaZlMJpPJ\n5HK5VatW9fdYApdOpzOZjHWutHQ6XXyx0cqVKwfor7OBIpFIDB8+3DpXWnGdoyhavXp1D6+x\na2ho6O6qzeU1dgAAbCRhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAI\nYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQ\nCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcA\nEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEH\nABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhh\nBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAI\nYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQ\nCGEHABAIYQcAEAhhBwAQCGEHABAIYQcAEAhhBwAQiGR/D6CPYrFYTU1Npc8Sj8eL/63CubZw\n8XjcOldB8SZdnR+fLVwikbDOVZBIJIpf1NTUFAqF/h1M2Ir3HsnkQM2GgaJ0k04mk7FYrA9H\niA3Qn4SOjo4q3LxKazpAV2lgicUG6q1xYCneqi11FbhJV4ebdNW4SVfHu96kc7lcDwk0UNO7\ns7NzzZo1lT5LXV1dOp1ub29vbGys9Lm2cJlMJplMWudKy2QymUwml8utWrWqv8cSuHQ6nclk\nrHOlpdPpurq6KIpef/11zVFRiURi+PDh1rnSiuscRdGaNWs6Ozu7262hoaG7q7zGDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAg\nEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4A\nIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIO\nACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDC\nDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQwg4AIBDCDgAgEMIOACAQ\nwg4AIBDCDgAgEMIOACAQwg4AIBDVDrsbP/Pp21a0dHNl/oHb5v3X7OMPP+akcy+dv7i5s6oj\n68b48eO7bu61117dbc6cOXPmzJnl7NmrzenTp8+bN2/jjzNv3rzp06dv8uFtwlnvvPPOpa+3\nnFlX/3td/k06CmjWGzO8Ps96xx137Dq8rtfutddem2TWM2fO3Nxmvd43pQqz7vNNOhrIs+6X\n73UPS73erPfee++ue663ud5h3/ve93bdPOaYY0pf33TTTTfddFNp80tf+lLXPbsubBRFP/7x\nj7tuPvfcc103v/3tb5e+Xrp0aUvLWynS2tradc/1NgecWKFQqNa5Cose+u7nLv/pYfNvPXrr\nzDuvXnzXOWf+4OWjT5szeXjnz6+/5rHYfrdcf1p34dnS0tLU1FS5sY4dO7aHb20s9rZ169Vm\nDzbVcSp0WLPur8OWbwuZ9eYwPLPehIcduMOr0GHNumqHTafThUKhvb09FouNHDmyoaHhhRde\n6OzsjMfj22+//Q033DB58uRyzrIJJRKJ4cOHR1G0evXqzs5uH+FqaGjo7qoqhd3y31951tUP\nr1zXHkXR4d+5bQNhV2ifc8QRqZmXX3H4jlEUta1++LBjLzvsW7ceM3rwBg9Y0bAbNWpUR0dH\nhQ4OAGz+YrHY7bffPmPGjGqedOPDrkpPxdZPOWzuhV+9/NKzutuhbc2CV1pzBx44uriZrt93\n2pDUwgdeq87w1qPqAGALVygUPvOZz/T3KHotWZ3TpIaOnjA0yrXXdrdDe9MTURRNztSULtkl\nk/zlE2uio97YLBQKX/ziF0vXvv/97z/44IMrNVwAYIu3cuXK1tbWrbbaqmpnjMVixS8ymUx3\nz6n2/FxrlcLuXeXbmqIoGpl86xHEhppE57q3XuVWKBTuu+++t65taEin05UYyfnnn1+JwwIA\nA85LL700ZsyY6p83lUp1d1Uul+vhH24uYRdPDYqiaFVnfkgiUbxkZUcuUf/WrGKx2AEHHFDa\n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\ngg=="
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
    "heart.plot <- ggplot(df_numerical_imputed, aes(x=Sunshine, y=RainTomorrow)) +\n",
    "geom_point()\n",
    "\n",
    "heart.plot"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "9f2a45b2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.121530Z",
     "iopub.status.busy": "2023-02-21T13:23:15.119814Z",
     "iopub.status.idle": "2023-02-21T13:23:15.143862Z",
     "shell.execute_reply": "2023-02-21T13:23:15.141427Z"
    },
    "papermill": {
     "duration": 0.051493,
     "end_time": "2023-02-21T13:23:15.147192",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.095699",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.4800976213392"
      ],
      "text/latex": [
       "0.4800976213392"
      ],
      "text/markdown": [
       "0.4800976213392"
      ],
      "text/plain": [
       "[1] 0.4800976"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Sunshine))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "85bc80ce",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.193285Z",
     "iopub.status.busy": "2023-02-21T13:23:15.191366Z",
     "iopub.status.idle": "2023-02-21T13:23:15.216794Z",
     "shell.execute_reply": "2023-02-21T13:23:15.214709Z"
    },
    "papermill": {
     "duration": 0.051387,
     "end_time": "2023-02-21T13:23:15.220048",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.168661",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.0800162702232"
      ],
      "text/latex": [
       "0.0800162702232"
      ],
      "text/markdown": [
       "0.0800162702232"
      ],
      "text/plain": [
       "[1] 0.08001627"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical_imputed$Sunshine))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "4f636c5a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.267715Z",
     "iopub.status.busy": "2023-02-21T13:23:15.265884Z",
     "iopub.status.idle": "2023-02-21T13:23:15.287105Z",
     "shell.execute_reply": "2023-02-21T13:23:15.284998Z"
    },
    "papermill": {
     "duration": 0.049058,
     "end_time": "2023-02-21T13:23:15.290203",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.241145",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.431665062560154"
      ],
      "text/latex": [
       "0.431665062560154"
      ],
      "text/markdown": [
       "0.431665062560154"
      ],
      "text/plain": [
       "[1] 0.4316651"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical$Evaporation))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "43acffd0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.339617Z",
     "iopub.status.busy": "2023-02-21T13:23:15.337489Z",
     "iopub.status.idle": "2023-02-21T13:23:15.364180Z",
     "shell.execute_reply": "2023-02-21T13:23:15.361614Z"
    },
    "papermill": {
     "duration": 0.055902,
     "end_time": "2023-02-21T13:23:15.368021",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.312119",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.071944177093359"
      ],
      "text/latex": [
       "0.071944177093359"
      ],
      "text/markdown": [
       "0.071944177093359"
      ],
      "text/plain": [
       "[1] 0.07194418"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_numerical_imputed$Evaporation))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "f17f63d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.415762Z",
     "iopub.status.busy": "2023-02-21T13:23:15.413441Z",
     "iopub.status.idle": "2023-02-21T13:23:15.438284Z",
     "shell.execute_reply": "2023-02-21T13:23:15.435605Z"
    },
    "papermill": {
     "duration": 0.052486,
     "end_time": "2023-02-21T13:23:15.441790",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.389304",
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
       "<ol class=list-inline><li>'Date'</li><li>'Location'</li><li>'MinTemp'</li><li>'MaxTemp'</li><li>'Rainfall'</li><li>'Evaporation'</li><li>'Sunshine'</li><li>'WindGustDir'</li><li>'WindGustSpeed'</li><li>'WindDir9am'</li><li>'WindDir3pm'</li><li>'WindSpeed9am'</li><li>'WindSpeed3pm'</li><li>'Humidity9am'</li><li>'Humidity3pm'</li><li>'Pressure9am'</li><li>'Pressure3pm'</li><li>'Cloud9am'</li><li>'Cloud3pm'</li><li>'Temp9am'</li><li>'Temp3pm'</li><li>'RainToday'</li><li>'RainTomorrow'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Date'\n",
       "\\item 'Location'\n",
       "\\item 'MinTemp'\n",
       "\\item 'MaxTemp'\n",
       "\\item 'Rainfall'\n",
       "\\item 'Evaporation'\n",
       "\\item 'Sunshine'\n",
       "\\item 'WindGustDir'\n",
       "\\item 'WindGustSpeed'\n",
       "\\item 'WindDir9am'\n",
       "\\item 'WindDir3pm'\n",
       "\\item 'WindSpeed9am'\n",
       "\\item 'WindSpeed3pm'\n",
       "\\item 'Humidity9am'\n",
       "\\item 'Humidity3pm'\n",
       "\\item 'Pressure9am'\n",
       "\\item 'Pressure3pm'\n",
       "\\item 'Cloud9am'\n",
       "\\item 'Cloud3pm'\n",
       "\\item 'Temp9am'\n",
       "\\item 'Temp3pm'\n",
       "\\item 'RainToday'\n",
       "\\item 'RainTomorrow'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Date'\n",
       "2. 'Location'\n",
       "3. 'MinTemp'\n",
       "4. 'MaxTemp'\n",
       "5. 'Rainfall'\n",
       "6. 'Evaporation'\n",
       "7. 'Sunshine'\n",
       "8. 'WindGustDir'\n",
       "9. 'WindGustSpeed'\n",
       "10. 'WindDir9am'\n",
       "11. 'WindDir3pm'\n",
       "12. 'WindSpeed9am'\n",
       "13. 'WindSpeed3pm'\n",
       "14. 'Humidity9am'\n",
       "15. 'Humidity3pm'\n",
       "16. 'Pressure9am'\n",
       "17. 'Pressure3pm'\n",
       "18. 'Cloud9am'\n",
       "19. 'Cloud3pm'\n",
       "20. 'Temp9am'\n",
       "21. 'Temp3pm'\n",
       "22. 'RainToday'\n",
       "23. 'RainTomorrow'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Date\"          \"Location\"      \"MinTemp\"       \"MaxTemp\"      \n",
       " [5] \"Rainfall\"      \"Evaporation\"   \"Sunshine\"      \"WindGustDir\"  \n",
       " [9] \"WindGustSpeed\" \"WindDir9am\"    \"WindDir3pm\"    \"WindSpeed9am\" \n",
       "[13] \"WindSpeed3pm\"  \"Humidity9am\"   \"Humidity3pm\"   \"Pressure9am\"  \n",
       "[17] \"Pressure3pm\"   \"Cloud9am\"      \"Cloud3pm\"      \"Temp9am\"      \n",
       "[21] \"Temp3pm\"       \"RainToday\"     \"RainTomorrow\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "9d0e5b4a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.558342Z",
     "iopub.status.busy": "2023-02-21T13:23:15.556456Z",
     "iopub.status.idle": "2023-02-21T13:23:15.579420Z",
     "shell.execute_reply": "2023-02-21T13:23:15.577355Z"
    },
    "papermill": {
     "duration": 0.118863,
     "end_time": "2023-02-21T13:23:15.582388",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.463525",
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
       "<ol class=list-inline><li>'.imp'</li><li>'.id'</li><li>'MinTemp'</li><li>'MaxTemp'</li><li>'Rainfall'</li><li>'Evaporation'</li><li>'Sunshine'</li><li>'WindGustSpeed'</li><li>'WindSpeed9am'</li><li>'WindSpeed3pm'</li><li>'Humidity9am'</li><li>'Humidity3pm'</li><li>'Pressure9am'</li><li>'Pressure3pm'</li><li>'Cloud9am'</li><li>'Cloud3pm'</li><li>'Temp9am'</li><li>'Temp3pm'</li><li>'RainTomorrow'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item '.imp'\n",
       "\\item '.id'\n",
       "\\item 'MinTemp'\n",
       "\\item 'MaxTemp'\n",
       "\\item 'Rainfall'\n",
       "\\item 'Evaporation'\n",
       "\\item 'Sunshine'\n",
       "\\item 'WindGustSpeed'\n",
       "\\item 'WindSpeed9am'\n",
       "\\item 'WindSpeed3pm'\n",
       "\\item 'Humidity9am'\n",
       "\\item 'Humidity3pm'\n",
       "\\item 'Pressure9am'\n",
       "\\item 'Pressure3pm'\n",
       "\\item 'Cloud9am'\n",
       "\\item 'Cloud3pm'\n",
       "\\item 'Temp9am'\n",
       "\\item 'Temp3pm'\n",
       "\\item 'RainTomorrow'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. '.imp'\n",
       "2. '.id'\n",
       "3. 'MinTemp'\n",
       "4. 'MaxTemp'\n",
       "5. 'Rainfall'\n",
       "6. 'Evaporation'\n",
       "7. 'Sunshine'\n",
       "8. 'WindGustSpeed'\n",
       "9. 'WindSpeed9am'\n",
       "10. 'WindSpeed3pm'\n",
       "11. 'Humidity9am'\n",
       "12. 'Humidity3pm'\n",
       "13. 'Pressure9am'\n",
       "14. 'Pressure3pm'\n",
       "15. 'Cloud9am'\n",
       "16. 'Cloud3pm'\n",
       "17. 'Temp9am'\n",
       "18. 'Temp3pm'\n",
       "19. 'RainTomorrow'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \".imp\"          \".id\"           \"MinTemp\"       \"MaxTemp\"      \n",
       " [5] \"Rainfall\"      \"Evaporation\"   \"Sunshine\"      \"WindGustSpeed\"\n",
       " [9] \"WindSpeed9am\"  \"WindSpeed3pm\"  \"Humidity9am\"   \"Humidity3pm\"  \n",
       "[13] \"Pressure9am\"   \"Pressure3pm\"   \"Cloud9am\"      \"Cloud3pm\"     \n",
       "[17] \"Temp9am\"       \"Temp3pm\"       \"RainTomorrow\" "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(df_numerical_imputed)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "6681fd35",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.629257Z",
     "iopub.status.busy": "2023-02-21T13:23:15.627474Z",
     "iopub.status.idle": "2023-02-21T13:23:15.672889Z",
     "shell.execute_reply": "2023-02-21T13:23:15.670713Z"
    },
    "papermill": {
     "duration": 0.072065,
     "end_time": "2023-02-21T13:23:15.675886",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.603821",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 23</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Date</th><th scope=col>Location</th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustDir</th><th scope=col>WindGustSpeed</th><th scope=col>WindDir9am</th><th scope=col>⋯</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainToday</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>⋯</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>12/1/2008</td><td>Albury</td><td>13.4</td><td>22.9</td><td>0.6</td><td>NA</td><td>NA</td><td>W  </td><td>44</td><td>W  </td><td>⋯</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td><td>No</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>12/2/2008</td><td>Albury</td><td> 7.4</td><td>25.1</td><td>0.0</td><td>NA</td><td>NA</td><td>WNW</td><td>44</td><td>NNW</td><td>⋯</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td><td>No</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>12/3/2008</td><td>Albury</td><td>12.9</td><td>25.7</td><td>0.0</td><td>NA</td><td>NA</td><td>WSW</td><td>46</td><td>W  </td><td>⋯</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td><td>No</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>12/4/2008</td><td>Albury</td><td> 9.2</td><td>28.0</td><td>0.0</td><td>NA</td><td>NA</td><td>NE </td><td>24</td><td>SE </td><td>⋯</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td><td>No</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>12/5/2008</td><td>Albury</td><td>17.5</td><td>32.3</td><td>1.0</td><td>NA</td><td>NA</td><td>W  </td><td>41</td><td>ENE</td><td>⋯</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td><td>No</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 23\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & Date & Location & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustDir & WindGustSpeed & WindDir9am & ⋯ & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainToday & RainTomorrow\\\\\n",
       "  & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <int> & <chr> & ⋯ & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 12/1/2008 & Albury & 13.4 & 22.9 & 0.6 & NA & NA & W   & 44 & W   & ⋯ & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8 & No & 2\\\\\n",
       "\t2 & 12/2/2008 & Albury &  7.4 & 25.1 & 0.0 & NA & NA & WNW & 44 & NNW & ⋯ & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3 & No & 2\\\\\n",
       "\t3 & 12/3/2008 & Albury & 12.9 & 25.7 & 0.0 & NA & NA & WSW & 46 & W   & ⋯ & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2 & No & 2\\\\\n",
       "\t4 & 12/4/2008 & Albury &  9.2 & 28.0 & 0.0 & NA & NA & NE  & 24 & SE  & ⋯ & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5 & No & 2\\\\\n",
       "\t5 & 12/5/2008 & Albury & 17.5 & 32.3 & 1.0 & NA & NA & W   & 41 & ENE & ⋯ & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7 & No & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 23\n",
       "\n",
       "| <!--/--> | Date &lt;chr&gt; | Location &lt;chr&gt; | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustDir &lt;chr&gt; | WindGustSpeed &lt;int&gt; | WindDir9am &lt;chr&gt; | ⋯ ⋯ | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainToday &lt;chr&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 12/1/2008 | Albury | 13.4 | 22.9 | 0.6 | NA | NA | W   | 44 | W   | ⋯ | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 | No | 2 |\n",
       "| 2 | 12/2/2008 | Albury |  7.4 | 25.1 | 0.0 | NA | NA | WNW | 44 | NNW | ⋯ | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 | No | 2 |\n",
       "| 3 | 12/3/2008 | Albury | 12.9 | 25.7 | 0.0 | NA | NA | WSW | 46 | W   | ⋯ | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 | No | 2 |\n",
       "| 4 | 12/4/2008 | Albury |  9.2 | 28.0 | 0.0 | NA | NA | NE  | 24 | SE  | ⋯ | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 | No | 2 |\n",
       "| 5 | 12/5/2008 | Albury | 17.5 | 32.3 | 1.0 | NA | NA | W   | 41 | ENE | ⋯ | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 | No | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  Date      Location MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustDir\n",
       "1 12/1/2008 Albury   13.4    22.9    0.6      NA          NA       W          \n",
       "2 12/2/2008 Albury    7.4    25.1    0.0      NA          NA       WNW        \n",
       "3 12/3/2008 Albury   12.9    25.7    0.0      NA          NA       WSW        \n",
       "4 12/4/2008 Albury    9.2    28.0    0.0      NA          NA       NE         \n",
       "5 12/5/2008 Albury   17.5    32.3    1.0      NA          NA       W          \n",
       "  WindGustSpeed WindDir9am ⋯ Humidity9am Humidity3pm Pressure9am Pressure3pm\n",
       "1 44            W          ⋯ 71          22          1007.7      1007.1     \n",
       "2 44            NNW        ⋯ 44          25          1010.6      1007.8     \n",
       "3 46            W          ⋯ 38          30          1007.6      1008.7     \n",
       "4 24            SE         ⋯ 45          16          1017.6      1012.8     \n",
       "5 41            ENE        ⋯ 82          33          1010.8      1006.0     \n",
       "  Cloud9am Cloud3pm Temp9am Temp3pm RainToday RainTomorrow\n",
       "1  8       NA       16.9    21.8    No        2           \n",
       "2 NA       NA       17.2    24.3    No        2           \n",
       "3 NA        2       21.0    23.2    No        2           \n",
       "4 NA       NA       18.1    26.5    No        2           \n",
       "5  7        8       17.8    29.7    No        2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df, 5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "e85b3f20",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.727064Z",
     "iopub.status.busy": "2023-02-21T13:23:15.725040Z",
     "iopub.status.idle": "2023-02-21T13:23:15.770024Z",
     "shell.execute_reply": "2023-02-21T13:23:15.767094Z"
    },
    "papermill": {
     "duration": 0.075,
     "end_time": "2023-02-21T13:23:15.774258",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.699258",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 19</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>.imp</th><th scope=col>.id</th><th scope=col>MinTemp</th><th scope=col>MaxTemp</th><th scope=col>Rainfall</th><th scope=col>Evaporation</th><th scope=col>Sunshine</th><th scope=col>WindGustSpeed</th><th scope=col>WindSpeed9am</th><th scope=col>WindSpeed3pm</th><th scope=col>Humidity9am</th><th scope=col>Humidity3pm</th><th scope=col>Pressure9am</th><th scope=col>Pressure3pm</th><th scope=col>Cloud9am</th><th scope=col>Cloud3pm</th><th scope=col>Temp9am</th><th scope=col>Temp3pm</th><th scope=col>RainTomorrow</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0</td><td>1</td><td>13.4</td><td>22.9</td><td>0.6</td><td>NA</td><td>NA</td><td>44</td><td>20</td><td>24</td><td>71</td><td>22</td><td>1007.7</td><td>1007.1</td><td> 8</td><td>NA</td><td>16.9</td><td>21.8</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>0</td><td>2</td><td> 7.4</td><td>25.1</td><td>0.0</td><td>NA</td><td>NA</td><td>44</td><td> 4</td><td>22</td><td>44</td><td>25</td><td>1010.6</td><td>1007.8</td><td>NA</td><td>NA</td><td>17.2</td><td>24.3</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>0</td><td>3</td><td>12.9</td><td>25.7</td><td>0.0</td><td>NA</td><td>NA</td><td>46</td><td>19</td><td>26</td><td>38</td><td>30</td><td>1007.6</td><td>1008.7</td><td>NA</td><td> 2</td><td>21.0</td><td>23.2</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>0</td><td>4</td><td> 9.2</td><td>28.0</td><td>0.0</td><td>NA</td><td>NA</td><td>24</td><td>11</td><td> 9</td><td>45</td><td>16</td><td>1017.6</td><td>1012.8</td><td>NA</td><td>NA</td><td>18.1</td><td>26.5</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>0</td><td>5</td><td>17.5</td><td>32.3</td><td>1.0</td><td>NA</td><td>NA</td><td>41</td><td> 7</td><td>20</td><td>82</td><td>33</td><td>1010.8</td><td>1006.0</td><td> 7</td><td> 8</td><td>17.8</td><td>29.7</td><td>2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 19\n",
       "\\begin{tabular}{r|lllllllllllllllllll}\n",
       "  & .imp & .id & MinTemp & MaxTemp & Rainfall & Evaporation & Sunshine & WindGustSpeed & WindSpeed9am & WindSpeed3pm & Humidity9am & Humidity3pm & Pressure9am & Pressure3pm & Cloud9am & Cloud3pm & Temp9am & Temp3pm & RainTomorrow\\\\\n",
       "  & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <int> & <int> & <dbl> & <dbl> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 0 & 1 & 13.4 & 22.9 & 0.6 & NA & NA & 44 & 20 & 24 & 71 & 22 & 1007.7 & 1007.1 &  8 & NA & 16.9 & 21.8 & 2\\\\\n",
       "\t2 & 0 & 2 &  7.4 & 25.1 & 0.0 & NA & NA & 44 &  4 & 22 & 44 & 25 & 1010.6 & 1007.8 & NA & NA & 17.2 & 24.3 & 2\\\\\n",
       "\t3 & 0 & 3 & 12.9 & 25.7 & 0.0 & NA & NA & 46 & 19 & 26 & 38 & 30 & 1007.6 & 1008.7 & NA &  2 & 21.0 & 23.2 & 2\\\\\n",
       "\t4 & 0 & 4 &  9.2 & 28.0 & 0.0 & NA & NA & 24 & 11 &  9 & 45 & 16 & 1017.6 & 1012.8 & NA & NA & 18.1 & 26.5 & 2\\\\\n",
       "\t5 & 0 & 5 & 17.5 & 32.3 & 1.0 & NA & NA & 41 &  7 & 20 & 82 & 33 & 1010.8 & 1006.0 &  7 &  8 & 17.8 & 29.7 & 2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 19\n",
       "\n",
       "| <!--/--> | .imp &lt;int&gt; | .id &lt;int&gt; | MinTemp &lt;dbl&gt; | MaxTemp &lt;dbl&gt; | Rainfall &lt;dbl&gt; | Evaporation &lt;dbl&gt; | Sunshine &lt;dbl&gt; | WindGustSpeed &lt;int&gt; | WindSpeed9am &lt;int&gt; | WindSpeed3pm &lt;int&gt; | Humidity9am &lt;int&gt; | Humidity3pm &lt;int&gt; | Pressure9am &lt;dbl&gt; | Pressure3pm &lt;dbl&gt; | Cloud9am &lt;int&gt; | Cloud3pm &lt;int&gt; | Temp9am &lt;dbl&gt; | Temp3pm &lt;dbl&gt; | RainTomorrow &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0 | 1 | 13.4 | 22.9 | 0.6 | NA | NA | 44 | 20 | 24 | 71 | 22 | 1007.7 | 1007.1 |  8 | NA | 16.9 | 21.8 | 2 |\n",
       "| 2 | 0 | 2 |  7.4 | 25.1 | 0.0 | NA | NA | 44 |  4 | 22 | 44 | 25 | 1010.6 | 1007.8 | NA | NA | 17.2 | 24.3 | 2 |\n",
       "| 3 | 0 | 3 | 12.9 | 25.7 | 0.0 | NA | NA | 46 | 19 | 26 | 38 | 30 | 1007.6 | 1008.7 | NA |  2 | 21.0 | 23.2 | 2 |\n",
       "| 4 | 0 | 4 |  9.2 | 28.0 | 0.0 | NA | NA | 24 | 11 |  9 | 45 | 16 | 1017.6 | 1012.8 | NA | NA | 18.1 | 26.5 | 2 |\n",
       "| 5 | 0 | 5 | 17.5 | 32.3 | 1.0 | NA | NA | 41 |  7 | 20 | 82 | 33 | 1010.8 | 1006.0 |  7 |  8 | 17.8 | 29.7 | 2 |\n",
       "\n"
      ],
      "text/plain": [
       "  .imp .id MinTemp MaxTemp Rainfall Evaporation Sunshine WindGustSpeed\n",
       "1 0    1   13.4    22.9    0.6      NA          NA       44           \n",
       "2 0    2    7.4    25.1    0.0      NA          NA       44           \n",
       "3 0    3   12.9    25.7    0.0      NA          NA       46           \n",
       "4 0    4    9.2    28.0    0.0      NA          NA       24           \n",
       "5 0    5   17.5    32.3    1.0      NA          NA       41           \n",
       "  WindSpeed9am WindSpeed3pm Humidity9am Humidity3pm Pressure9am Pressure3pm\n",
       "1 20           24           71          22          1007.7      1007.1     \n",
       "2  4           22           44          25          1010.6      1007.8     \n",
       "3 19           26           38          30          1007.6      1008.7     \n",
       "4 11            9           45          16          1017.6      1012.8     \n",
       "5  7           20           82          33          1010.8      1006.0     \n",
       "  Cloud9am Cloud3pm Temp9am Temp3pm RainTomorrow\n",
       "1  8       NA       16.9    21.8    2           \n",
       "2 NA       NA       17.2    24.3    2           \n",
       "3 NA        2       21.0    23.2    2           \n",
       "4 NA       NA       18.1    26.5    2           \n",
       "5  7        8       17.8    29.7    2           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(df_numerical_imputed, 5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "db495f65",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:15.826726Z",
     "iopub.status.busy": "2023-02-21T13:23:15.824806Z",
     "iopub.status.idle": "2023-02-21T13:23:23.431154Z",
     "shell.execute_reply": "2023-02-21T13:23:23.428782Z"
    },
    "papermill": {
     "duration": 7.636896,
     "end_time": "2023-02-21T13:23:23.434593",
     "exception": false,
     "start_time": "2023-02-21T13:23:15.797697",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "df_1 <- join(x =df, y=df_numerical_imputed, by = c('MinTemp',\n",
    "                                           'MaxTemp',\n",
    "                                           'Rainfall',\n",
    "                                           'Evaporation',\n",
    "                                           'Sunshine',\n",
    "                                           'WindGustSpeed',\n",
    "                                           'WindSpeed9am',\n",
    "                                           'WindSpeed3pm',\n",
    "                                           'Humidity9am',\n",
    "                                           'Humidity3pm',\n",
    "                                           'Pressure9am',\n",
    "                                           'Pressure3pm',\n",
    "                                           'Cloud9am',\n",
    "                                           'Cloud3pm',\n",
    "                                           'Temp9am',\n",
    "                                           'Temp3pm'))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "e0ac4125",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.484812Z",
     "iopub.status.busy": "2023-02-21T13:23:23.482583Z",
     "iopub.status.idle": "2023-02-21T13:23:23.507139Z",
     "shell.execute_reply": "2023-02-21T13:23:23.505002Z"
    },
    "papermill": {
     "duration": 0.052102,
     "end_time": "2023-02-21T13:23:23.509832",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.457730",
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
       "<ol class=list-inline><li>145460</li><li>23</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 145460\n",
       "\\item 23\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 145460\n",
       "2. 23\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 145460     23"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "023816c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.559587Z",
     "iopub.status.busy": "2023-02-21T13:23:23.557559Z",
     "iopub.status.idle": "2023-02-21T13:23:23.580557Z",
     "shell.execute_reply": "2023-02-21T13:23:23.578434Z"
    },
    "papermill": {
     "duration": 0.052019,
     "end_time": "2023-02-21T13:23:23.583618",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.531599",
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
       "<ol class=list-inline><li>473168</li><li>26</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 473168\n",
       "\\item 26\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 473168\n",
       "2. 26\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 473168     26"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(df_1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "c82555e7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.634272Z",
     "iopub.status.busy": "2023-02-21T13:23:23.632257Z",
     "iopub.status.idle": "2023-02-21T13:23:23.654654Z",
     "shell.execute_reply": "2023-02-21T13:23:23.652647Z"
    },
    "papermill": {
     "duration": 0.049806,
     "end_time": "2023-02-21T13:23:23.657339",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.607533",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.4800976213392"
      ],
      "text/latex": [
       "0.4800976213392"
      ],
      "text/markdown": [
       "0.4800976213392"
      ],
      "text/plain": [
       "[1] 0.4800976"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df$Sunshine))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "65d02fa1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.706270Z",
     "iopub.status.busy": "2023-02-21T13:23:23.704403Z",
     "iopub.status.idle": "2023-02-21T13:23:23.728836Z",
     "shell.execute_reply": "2023-02-21T13:23:23.726811Z"
    },
    "papermill": {
     "duration": 0.052007,
     "end_time": "2023-02-21T13:23:23.731991",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.679984",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.431665062560154"
      ],
      "text/latex": [
       "0.431665062560154"
      ],
      "text/markdown": [
       "0.431665062560154"
      ],
      "text/plain": [
       "[1] 0.4316651"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df$Evaporation))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "d0dae237",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.784091Z",
     "iopub.status.busy": "2023-02-21T13:23:23.781724Z",
     "iopub.status.idle": "2023-02-21T13:23:23.807384Z",
     "shell.execute_reply": "2023-02-21T13:23:23.805197Z"
    },
    "papermill": {
     "duration": 0.054294,
     "end_time": "2023-02-21T13:23:23.810580",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.756286",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.224784854428026"
      ],
      "text/latex": [
       "0.224784854428026"
      ],
      "text/markdown": [
       "0.224784854428026"
      ],
      "text/plain": [
       "[1] 0.2247849"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_1$Sunshine))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "id": "c8e1fd2b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.862802Z",
     "iopub.status.busy": "2023-02-21T13:23:23.860959Z",
     "iopub.status.idle": "2023-02-21T13:23:23.884439Z",
     "shell.execute_reply": "2023-02-21T13:23:23.882300Z"
    },
    "papermill": {
     "duration": 0.053525,
     "end_time": "2023-02-21T13:23:23.887821",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.834296",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.209895850945119"
      ],
      "text/latex": [
       "0.209895850945119"
      ],
      "text/markdown": [
       "0.209895850945119"
      ],
      "text/plain": [
       "[1] 0.2098959"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "mean(is.na(df_1$Evaporation))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "7c6bc7fe",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-02-21T13:23:23.940358Z",
     "iopub.status.busy": "2023-02-21T13:23:23.938427Z",
     "iopub.status.idle": "2023-02-21T13:23:47.381616Z",
     "shell.execute_reply": "2023-02-21T13:23:47.379237Z"
    },
    "papermill": {
     "duration": 23.47333,
     "end_time": "2023-02-21T13:23:47.385358",
     "exception": false,
     "start_time": "2023-02-21T13:23:23.912028",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "write_xlsx(df_1,'/kaggle/working/imputed_numerical.xlsx')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "7776adf7",
   "metadata": {
    "papermill": {
     "duration": 0.022721,
     "end_time": "2023-02-21T13:23:47.431864",
     "exception": false,
     "start_time": "2023-02-21T13:23:47.409143",
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
   "duration": 354.316011,
   "end_time": "2023-02-21T13:23:47.686119",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-02-21T13:17:53.370108",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
