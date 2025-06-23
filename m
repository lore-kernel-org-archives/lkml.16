Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1E23816B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668674; cv=none; b=heIO1q0dRtNQlLY0wxwx5VLGMx3rMDw7HZuLd/3eyh6pGpnj6Syu7ootYXynYIhEPLuJzE/KL8/RqH8dKXO/xNCe81NtO3hmfzcO8yI8pb+2sSeowcZttKfezV6BJbsSOVGnamhwDXow3DwT0A0NELRWBZhPFEKxCZy7NT2A1nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668674; c=relaxed/simple;
	bh=MDvTxgLyP59RZb21/bXS1GWS6AmXiKBoTP5yEyyFkZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cW5ezu/5DYfFon+XURec8M8/FCLUIcdUfz81NKwz88hq4M6hD/FJpH62kLINc7y1ySaEOffv2EWu3619hmZvgN0mquf9g6bap32v0iWSE9+b6bnDrI20oAVVwDd58Im4ktS9Q2i5IapuFfU14C+nd2irLOiMIY9+oI0n5PK3Mq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mYEmUHYY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mYEmUHYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750668671;
	bh=MDvTxgLyP59RZb21/bXS1GWS6AmXiKBoTP5yEyyFkZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mYEmUHYYJ39w8bsF7IGGq9d1zLYfFwfCVAo5+wcjNY/H8RguDkvtvQfQVHmYtI7yi
	 WxXLIflev8qwNwRRY6ZXh9JzxnaWEAjAJ3OIrMLm8ofudtB9f/cq1QsJ9ly4kKLF6L
	 +MvpN3URQUC2vJ15CC8pqQC+qOrR+fL9+7lrzNj4RCEawFKUqVbe1Z56Ela4nWFj2I
	 RJkKex/vs7uXhEYgb6i1Sh7eeMdwMyqxRUU2XkIsk8XJVGmRa0YpDlrdPISoeyzqfv
	 hh53WWdrms4OIcBkHPneqOMScN1RBHa9Uc0+0Sat3WrBZu6WbKqyhaHuNAIKKX0TzF
	 PyWkDAUJRJuZQ==
Received: from debian.. (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E64A417E10D5;
	Mon, 23 Jun 2025 10:51:07 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/ci: Add jobs to validate devicetrees
Date: Mon, 23 Jun 2025 14:20:27 +0530
Message-ID: <20250623085033.39680-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623085033.39680-1-vignesh.raman@collabora.com>
References: <20250623085033.39680-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
exit with a non-zero error code while configuring them as warning in
the GitLab CI pipeline.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
Acked-by: Helen Koike <helen.fornazier@gmail.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

v4:
  - The minimum supported version of LLVM for building x86 kernels is 15.0.0
    (See https://lore.kernel.org/all/20250220-x86-bump-min-llvm-for-stackp-v1-1-ecb3c906e790@kernel.org/).
    Use the mesa-ci containers, where LLVM_VERSION is defined at the container
    level and is currently set to 19. Use this llvm version for compilation.
    Use a Python virtual environment to avoid the warning: “Running pip as the 'root'
    user can result in broken permissions and conflicting behavior with the system package manager.”
    Also check gpu bindings.
    
v3:
  - Add dt-binding-check and dtbs-check jobs to the static-checks stage.

v2:
  - Use LLVM/Clang instead of GCC to avoid architecture-specific
    toolchains for cross-compiling.

---
 drivers/gpu/drm/ci/check-devicetrees.yml | 50 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 19 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 22 +++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  2 +
 drivers/gpu/drm/ci/setup-llvm-links.sh   | 13 ++++++
 5 files changed, 106 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/setup-llvm-links.sh

diff --git a/drivers/gpu/drm/ci/check-devicetrees.yml b/drivers/gpu/drm/ci/check-devicetrees.yml
new file mode 100644
index 000000000000..727bd56018b8
--- /dev/null
+++ b/drivers/gpu/drm/ci/check-devicetrees.yml
@@ -0,0 +1,50 @@
+.dt-check-base:
+  stage: static-checks
+  timeout: "30m"
+  variables:
+    GIT_DEPTH: 1
+    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
+    SCHEMA: "display:gpu"
+    VENV_PATH: "/tmp/dtcheck-venv"
+  before_script:
+    - apt-get update -qq
+    # Minimum supported version of LLVM for building x86 kernels is 15.0.0.
+    # In mesa-ci containers, LLVM_VERSION is defined as a container-level property and is currently set to 19.
+    - apt-get install -y --no-install-recommends clang-${LLVM_VERSION} lld-${LLVM_VERSION} llvm-${LLVM_VERSION} python3-dev python3-venv python3-pip yamllint
+    - python3 -m venv "${VENV_PATH}"
+    - source "${VENV_PATH}/bin/activate"
+    - pip3 install dtschema
+  script:
+    - drivers/gpu/drm/ci/${SCRIPT_NAME}
+  artifacts:
+    when: on_failure
+    paths:
+      - ${ARTIFACT_FILE}
+  allow_failure:
+    exit_codes:
+      - 102
+
+dtbs-check:arm32:
+  extends:
+    - .build:arm32
+    - .dt-check-base
+  variables:
+    SCRIPT_NAME: "dtbs-check.sh"
+    ARTIFACT_FILE: "dtbs-check.log"
+
+dtbs-check:arm64:
+  extends:
+    - .build:arm64
+    - .dt-check-base
+  variables:
+    SCRIPT_NAME: "dtbs-check.sh"
+    ARTIFACT_FILE: "dtbs-check.log"
+
+dt-binding-check:
+  extends:
+    - .build
+    - .use-debian/x86_64_build
+    - .dt-check-base
+  variables:
+    SCRIPT_NAME: "dt-binding-check.sh"
+    ARTIFACT_FILE: "dt-binding-check.log"
diff --git a/drivers/gpu/drm/ci/dt-binding-check.sh b/drivers/gpu/drm/ci/dt-binding-check.sh
new file mode 100755
index 000000000000..99e1c0df84b7
--- /dev/null
+++ b/drivers/gpu/drm/ci/dt-binding-check.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+VENV_PATH="${VENV_PATH:-/tmp/dtschema-venv}"
+source "${VENV_PATH}/bin/activate"
+
+if ! make -j"${FDO_CI_CONCURRENT:-4}" dt_binding_check \
+        DT_SCHEMA_FILES="${SCHEMA:-}" 2>dt-binding-check.log; then
+    echo "ERROR: 'make dt_binding_check' failed. Please check dt-binding-check.log for details."
+    exit 1
+fi
+
+if [[ -s dt-binding-check.log ]]; then
+    echo "WARNING: dt_binding_check reported warnings. Please check dt-binding-check.log" \
+         "for details."
+    exit 102
+fi
diff --git a/drivers/gpu/drm/ci/dtbs-check.sh b/drivers/gpu/drm/ci/dtbs-check.sh
new file mode 100755
index 000000000000..57842c452439
--- /dev/null
+++ b/drivers/gpu/drm/ci/dtbs-check.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
+: "${LLVM_VERSION:?ERROR: LLVM_VERSION must be set}"
+
+./drivers/gpu/drm/ci/setup-llvm-links.sh
+
+make LLVM=1 ARCH="${KERNEL_ARCH}" defconfig
+
+if ! make -j"${FDO_CI_CONCURRENT:-4}" ARCH="${KERNEL_ARCH}" LLVM=1 dtbs_check \
+        DT_SCHEMA_FILES="${SCHEMA:-}" 2>dtbs-check.log; then
+    echo "ERROR: 'make dtbs_check' failed. Please check dtbs-check.log for details."
+    exit 1
+fi
+
+if [[ -s dtbs-check.log ]]; then
+    echo "WARNING: dtbs_check reported warnings. Please check dtbs-check.log for details."
+    exit 102
+fi
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index d9e1042fc140..1dddda3d24c8 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -110,6 +110,7 @@ include:
   - drivers/gpu/drm/ci/static-checks.yml
   - drivers/gpu/drm/ci/build.yml
   - drivers/gpu/drm/ci/test.yml
+  - drivers/gpu/drm/ci/check-devicetrees.yml
   - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
 
 
@@ -120,6 +121,7 @@ stages:
   - git-archive
   - build-for-tests
   - build-only
+  - static-checks
   - code-validation
   - amdgpu
   - i915
diff --git a/drivers/gpu/drm/ci/setup-llvm-links.sh b/drivers/gpu/drm/ci/setup-llvm-links.sh
new file mode 100755
index 000000000000..ace33af82a3f
--- /dev/null
+++ b/drivers/gpu/drm/ci/setup-llvm-links.sh
@@ -0,0 +1,13 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: MIT
+set -euo pipefail
+
+ln -svf "$(which clang++-${LLVM_VERSION})"      /usr/bin/clang++
+ln -svf "$(which clang-${LLVM_VERSION})"        /usr/bin/clang
+ln -svf "$(which ld.lld-${LLVM_VERSION})"       /usr/bin/ld.lld
+ln -svf "$(which lld-${LLVM_VERSION})"          /usr/bin/lld
+ln -svf "$(which llvm-ar-${LLVM_VERSION})"      /usr/bin/llvm-ar
+ln -svf "$(which llvm-nm-${LLVM_VERSION})"      /usr/bin/llvm-nm
+ln -svf "$(which llvm-objcopy-${LLVM_VERSION})" /usr/bin/llvm-objcopy
+ln -svf "$(which llvm-readelf-${LLVM_VERSION})" /usr/bin/llvm-readelf
+ln -svf "$(which llvm-strip-${LLVM_VERSION})"   /usr/bin/llvm-strip
-- 
2.47.2

