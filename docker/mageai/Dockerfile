FROM mageai/mageai:latest

ENV PROJECT_NAME=BIX-MAGE-PIPELINES

ARG USER_CODE_PATH=.
# ARG USER_CODE_PATH=../${PROJECT_NAME}

# Note: this overwrites the requirements.txt file in your new project on first run. 
# You can delete this line for the second run :) 
COPY requirements.txt ${USER_CODE_PATH}/requirements.txt 

RUN pip3 install -r ${USER_CODE_PATH}/requirements.txt