#!/bin/bash

# SPDX-FileCopyrightText: 2021 SAP SE or an SAP affiliate company and Gardener contributors
#
# SPDX-License-Identifier: Apache-2.0

if command -v setup-envtest &> /dev/null
then
    setup-envtest cleanup
fi
