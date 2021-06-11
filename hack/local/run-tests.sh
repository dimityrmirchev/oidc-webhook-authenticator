#!/bin/bash

# SPDX-FileCopyrightText: 2021 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0

if ! command -v go &> /dev/null
then
    echo "Go is not installed."
    exit
fi

if ! command -v kubebuilder &> /dev/null
then
    curl -L -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
    chmod +x kubebuilder && sudo mv kubebuilder /usr/local/bin/
fi

if ! command -v setup-envtest &> /dev/null
then
    go install sigs.k8s.io/controller-runtime/tools/setup-envtest@latest
fi

test_env_dir=$(setup-envtest use -p path)
KUBEBUILDER_ASSETS="$test_env_dir" go test ./... -v count=1
