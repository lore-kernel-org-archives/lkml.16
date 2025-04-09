Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C171DF25D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179386; cv=none; b=Uwe8EEKJJDC/vdjE+fLH2smHecrmsxRErCa5yZ6OPBOymF0BAPqTxW5I4+kjfOIg4HZhNZ/atEZzTtXoTAy+yVCcbArL6Po72NR0vMRKrsHoPdPCxb+mmLHpBtY/R5M+WTFQmMzvyytgbDMuaNsfEJ9lf4T29ygTkZTfbm8wb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179386; c=relaxed/simple;
	bh=zffTD6pryexLdEIyq1TeqSHWPUumlDfkr8ttmeubuS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYkdyC6Tzup3n/WUCOI8foeibWypc1MTOHX5961PJVZEUPaC7AeWOC8z8iOkTMcTU2a1DxR1DXeKFzEYaP5owNLqKrm9bVyD3QcICkIyaJySaYqg/gxoqEwOZNOQH27TH/EVcTrzEcH5fNYqgnaHLJ9e2nP0N0XF6BOj/xpnRrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W4BmPHay; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="W4BmPHay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744179382;
	bh=zffTD6pryexLdEIyq1TeqSHWPUumlDfkr8ttmeubuS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4BmPHaykzU0mjTQnBezD5evu7ykl4p8zEVaG88mvKBi9ejPbUc3htisZrkHLCcP/
	 8CGA++G7tvEHX0D9bYlo0H7FoBpuiGCzBd5IE1Y18JPqsaZNMgxm3JI4ucIYEsI5ol
	 GcnGci7A//9Vxs/oQhlnnvIq1dQHqr92eYUNcdxtcKwUqkMY8+q4wmhuwAM3XD6uHo
	 NcV/jEVvJLD10ozIW6GXmeudBw3oWlpDlnbYmnabo9RyDZOsdUpO9ZDRmTbE+6Ysvd
	 lxyi1sgkrN38ZTu2g2gTyIUeQu8JMxqfxeQzfn2pwH1mvhwrW8UaIEU2Abo3Gc8xIl
	 x8nCAPE/gLILg==
Received: from debian.. (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F31C17E101A;
	Wed,  9 Apr 2025 08:16:19 +0200 (CEST)
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
Subject: [PATCH v2 2/2] drm/ci: Add jobs to run KUnit tests
Date: Wed,  9 Apr 2025 11:45:39 +0530
Message-ID: <20250409061543.311184-3-vignesh.raman@collabora.com>
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

Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Run KUnit tests with LLVM.

---
 drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
 drivers/gpu/drm/ci/kunit.sh      | 11 +++++++++++
 drivers/gpu/drm/ci/kunit.yml     | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9e61b49e9960..90ae57ca86a1 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -109,6 +109,7 @@ include:
   - drivers/gpu/drm/ci/build.yml
   - drivers/gpu/drm/ci/test.yml
   - drivers/gpu/drm/ci/check-devicetrees.yml
+  - drivers/gpu/drm/ci/kunit.yml
   - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/lab-status.yml'
 
 
diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
new file mode 100755
index 000000000000..90b8713ce7a2
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -euxo pipefail
+
+: "${KERNEL_ARCH:?ERROR: KERNEL_ARCH must be set}"
+
+./tools/testing/kunit/kunit.py run \
+  --arch "${KERNEL_ARCH}" \
+  --make_option LLVM=1 \
+  --kunitconfig=drivers/gpu/drm/tests
diff --git a/drivers/gpu/drm/ci/kunit.yml b/drivers/gpu/drm/ci/kunit.yml
new file mode 100644
index 000000000000..405c8fc8239a
--- /dev/null
+++ b/drivers/gpu/drm/ci/kunit.yml
@@ -0,0 +1,32 @@
+.kunit-packages: &kunit-packages
+  - apt-get update -qq
+  - apt-get install -y --no-install-recommends clang lld llvm
+
+.kunit-base:
+  timeout: "30m"
+  script:
+    - drivers/gpu/drm/ci/kunit.sh
+
+kunit:arm32:
+  extends:
+    - .build:arm32
+    - .kunit-base
+  before_script:
+    - *kunit-packages
+    - apt-get install -y --no-install-recommends qemu-system-arm
+
+kunit:arm64:
+  extends:
+    - .build:arm64
+    - .kunit-base
+  before_script:
+    - *kunit-packages
+    - apt-get install -y --no-install-recommends qemu-system-aarch64
+
+kunit:x86_64:
+  extends:
+    - .build:x86_64
+    - .kunit-base
+  before_script:
+    - *kunit-packages
+    - apt-get install -y --no-install-recommends qemu-system-x86
-- 
2.47.2

