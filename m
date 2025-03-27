Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6382A1A2622
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091307; cv=none; b=QcYFFzuH7JZWJB9hyzaAFdrfb3iyhzCikNNZx8sgaymMQvmVLGIXoj+YwV8/7V9D/A9UG63p4UZbcUAPnLL7gDsyU8EMvyq19gboUeQFHlhKooVSMcrjXLQ27kYUzW0OFSGJ3rXHNELhpRQA4wOxRcsw+mSyFVMcyFraCqdzI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091307; c=relaxed/simple;
	bh=7Qk2WD3HGqrUJbtVGplfJG8We98IqG6UMJa28Cvw1Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhYJsHzNCrS2gmauRSmoCEmkB49xzsqedslH2GxB57Ei3NKq/CCjoO3i0oAPMIsjgo1QCvcnFdcivFShvWXUlGnMFx+vEa3RCQX1JiJkjFEMW+KfZULiKqe+XOlQktg6m2D6AYXUYH1l1MDGxTN/BxYOZtjfgTOku0+Cu9UQ0ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CFmtlTR3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CFmtlTR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743091304;
	bh=7Qk2WD3HGqrUJbtVGplfJG8We98IqG6UMJa28Cvw1Zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CFmtlTR3gtVI+lTDEOGcw60CY0xcsn6/CczUPBjEFGKdJICLVZ2qj1hc5bgy59W9d
	 CGtked7fQCGfwaVzTWhGc//zJz1Tj2SQjV8WAUNKVjUfl9VcsXbPLax7kqnDAKX7Qm
	 SJA2Gdal7EnowXxmviBnVNbSgpxlM1kJ6lbIfGKUBzuHRHKmr+GNuqtvkKT1rCvBw1
	 MHe3k9jfh4cxVUscrdwZMze/YSQbDqS/HfbID3x4t2OlvUN7aY2LLDvmqIqM+qyCtl
	 dTc3O5CMKisQwuXcRtvSkmB3FS1v/TbroJ8I5cjwjT+FBZta9j2C2A2Q6jU/eNGkKf
	 yn4ZJQ2jIb+3Q==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 697FA17E0FDB;
	Thu, 27 Mar 2025 17:01:40 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
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
Subject: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
Date: Thu, 27 Mar 2025 21:31:11 +0530
Message-ID: <20250327160117.945165-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250327160117.945165-1-vignesh.raman@collabora.com>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
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
 drivers/gpu/drm/ci/check-devicetrees.yml | 38 ++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 18 +++++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 41 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  1 +
 4 files changed, 98 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh

diff --git a/drivers/gpu/drm/ci/check-devicetrees.yml b/drivers/gpu/drm/ci/check-devicetrees.yml
new file mode 100644
index 000000000000..5f0c477f7578
--- /dev/null
+++ b/drivers/gpu/drm/ci/check-devicetrees.yml
@@ -0,0 +1,38 @@
+.dt-check-base:
+  timeout: "1h"
+  variables:
+    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
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
index 000000000000..2a72bb89c013
--- /dev/null
+++ b/drivers/gpu/drm/ci/dt-binding-check.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+apt-get update -qq
+apt install -y --no-install-recommends yamllint
+pip3 install dtschema
+
+if ! make -j${FDO_CI_CONCURRENT:-4} dt_binding_check >/dev/null 2>dt-binding-check.log; then
+    echo "ERROR: 'make dt_binding_check' failed. Please check dt-binding-check.log for details."
+    exit 1
+fi
+
+if [[ -s dt-binding-check.log ]]; then
+    echo "WARNING: dt_binding_check reported warnings. Please check dt-binding-check.log for details."
+    exit 102
+fi
diff --git a/drivers/gpu/drm/ci/dtbs-check.sh b/drivers/gpu/drm/ci/dtbs-check.sh
new file mode 100755
index 000000000000..a0129d5a53b0
--- /dev/null
+++ b/drivers/gpu/drm/ci/dtbs-check.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+. drivers/gpu/drm/ci/override-ld-with-bfd.sh
+
+apt-get update -qq
+pip3 install dtschema
+
+case "${KERNEL_ARCH}" in
+    "arm")
+        GCC_ARCH="arm-linux-gnueabihf"
+        ;;
+    "arm64")
+        GCC_ARCH="aarch64-linux-gnu"
+        ;;
+    "x86_64")
+        GCC_ARCH="x86_64-linux-gnu"
+        ;;
+    *)
+        echo "Unsupported architecture: ${KERNEL_ARCH}"
+        exit 1
+        ;;
+esac
+
+export ARCH="${KERNEL_ARCH}"
+export CROSS_COMPILE="${GCC_ARCH}-"
+
+make `basename ${DEFCONFIG}`
+make -j${FDO_CI_CONCURRENT:-4} dtbs
+
+if ! make -j${FDO_CI_CONCURRENT:-4} dtbs_check >/dev/null 2>dtbs-check.log; then
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

