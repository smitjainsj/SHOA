#!/bin/bash

function deployJob() {
	SERVER_IP=$1
	REPOSITORY=$2
	ARTIFACT_VERSION=$3

	ssh -o StrictHostKeyChecking=no root@$SERVER_IP "source /root/scripts/DeployApp.sh; fetchAndDeployArtifact ${REPOSITORY} ${ARTIFACT_VERSION}"
	

}
