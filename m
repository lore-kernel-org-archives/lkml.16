Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C841DE3A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179383; cv=none; b=Q2bLAnFVJH1cKC6iVr71ckUZDzNVBIB25QXwJWI9Cv+yGNuC9VpaMptOSh5qPhR1wc16RCVPA/ii0s3BfirXgW4H6Wp+m1hleLHEF1+x3DUekF2v+XEeglDeT//QKpepbCPbg2wg4u9R49tYCAd/5KhbVWh4F6wUJwjqFS+7uYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179383; c=relaxed/simple;
	bh=Q0+RWqDbidHJOmaI/ZLEyzMSqLrglHu+NjLRyV8KpXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhyD051WCFpSKf3ws7WnkuKycHPfTFoT2GqXVCrMOllXv83anEb2zQ++S4wuTwyOadWGLw6ZokspuNBupigCMfXRbXoPUT7HCaQDMzOu4K+ICpcHYHUfs2vWz0rUBU8hnXHWfQh3l10mMP1TE4IuqmjWH40j5Y0D/fEPE2NZ2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dcen1gNf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dcen1gNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744179379;
	bh=Q0+RWqDbidHJOmaI/ZLEyzMSqLrglHu+NjLRyV8KpXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dcen1gNfbHEmpyA+3xL+kTAoozgoPvr8qosAGWRKs+Hj6F2yNhHAKXPxH3RNeXfPC
	 Y2GTMlK1ryLTHncoM8aJZRn6aR2Tj7fThvsrwwyGw+8pmyNswo7i4RTDBQJIQwM6XR
	 1v6qC9ZUCV8hbaMDNsELMBKw2QZqxcz/Grt3Ym0wkuvm7yA1fv/7Vva7YRm7vq/vgR
	 sCi3ISRtzbwti9+xuYbGiWiZUhxH94aDcqbFCADKg52QBHA0qJCt3DP9+n72nQB6vt
	 Tn7OM8H8Y01Ktv3uPGoDL2x9FLIMVXafZ1vJDEMgbi23TNfcKlt+oaIGrnvn2UmMVs
	 fKJocfVcc1oyg==
Received: from debian.. (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F114E17E0FC1;
	Wed,  9 Apr 2025 08:16:15 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
Date: Wed,  9 Apr 2025 11:45:38 +0530
Message-ID: <20250409061543.311184-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409061543.311184-1-vignesh.raman@collabora.com>
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
exit with a non-zero error code while configuring them as warning in
the GitLab CI pipeline.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Use LLVM to build.

---
 drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  1 +
 4 files changed, 79 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh

diff --git a/drivers/gpu/drm/ci/check-devicetrees.yml b/drivers/gpu/drm/ci/check-devicetrees.yml
new file mode 100644
index 000000000000..bc96061abe5b
--- /dev/null
+++ b/drivers/gpu/drm/ci/check-devicetrees.yml
@@ -0,0 +1,43 @@
+.dt-check-base:
+  timeout: "30m"
+  variables:
+    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
+    SCHEMA: "display"
+  before_script:
+    - apt-get update -qq
+    - apt-get install -y --no-install-recommends clang lld llvm python3-pip yamllint
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
index 000000000000..5e9a439c48a4
--- /dev/null
+++ b/drivers/gpu/drm/ci/dt-binding-check.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
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
index 000000000000..91212f19fb98
--- /dev/null
+++ b/drivers/gpu/drm/ci/dtbs-check.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
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
index 65adcd97e06b..9e61b49e9960 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -108,6 +108,7 @@ include:
   - drivers/gpu/drm/ci/static-checks.yml
   - drivers/gpu/drm/ci/build.yml
   - drivers/gpu/drm/ci/test.yml
+  - drivers/gpu/drm/ci/check-devicetrees.yml
   - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
 
 
-- 
2.47.2

