Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8319F43A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091303; cv=none; b=sw56wR8a/bP9lgpLjYVEYQR+Dw3cpmUOT9wyVx3XkwOC1z6XwRF25RCo1T/ykiCnT9Zmz4ZGSXr86ErVKeNlUlmo0RWuWPuRva5cEVc7OD2a8Iq2QBZISl70PXl+m9vtoSEJY+CBVeeZySIgKgB+9cIHnHtkKa9yp0bmIfrMvyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091303; c=relaxed/simple;
	bh=opg5Ltx/REdrSDtxS6oOkjSizqw/KOz8jqku8DiOxDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fS6MytgS/aYZ+tOw7uaJ6uIClHD9I+ThMDZUCKfRG7tWxG/84Hd5/Ya9N2OW2s7pcqpHtwnh/Th3o4zpmvI46BMBC+3t9/OiEQO0aQRxTCWOFX6C0qFqaxjq8+ke6bfM4Aivke+8DrYL3YfiXqEYxEipZwJw39tQd/8nG7+5HD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bts6Xpb7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bts6Xpb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743091299;
	bh=opg5Ltx/REdrSDtxS6oOkjSizqw/KOz8jqku8DiOxDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bts6Xpb75whfdW9hrRzdrKfUOACPAijJGP1lpsga3viaLMA1hWMhwl/R6A4JVGd9s
	 +AMpwTwtZ5Itipst0IScRsGVD/1PDW2Lhj/QABXJW+dGZ34f5erBQr1HoBWiKl5kpS
	 KkZTLvEEFVcY8UoVyekwYUCb22wdHseolS7qBhQuVNJaORxhhRLlTa8Tn5N3zwhe7Y
	 1MDzIOfEErD7fD/375rnWSZNTCw8HmeoCvyTe+gW/NrwefjfYiZsX7KXnY10jfMvih
	 RcfyQP0rtQIHy48UELVbJ1JTyByFX5WmEWbajFNlsfQX5mcY9HHzjBxHlCTFjH1aKJ
	 BNPIN8b6B0L4A==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5205E17E09D6;
	Thu, 27 Mar 2025 17:01:36 +0100 (CET)
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
Subject: [PATCH v1 1/3] drm/ci: force use of BFD linker
Date: Thu, 27 Mar 2025 21:31:10 +0530
Message-ID: <20250327160117.945165-2-vignesh.raman@collabora.com>
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

When using a toolchain with gold as the default linker in Debian, the
kernel build fails:

x86_64-linux-gnu-ld: unknown linker
scripts/Kconfig.include:56: Sorry, this linker is not supported.

So force the use of the BFD linker. This was already part of the build
script but has now been moved to a separate script so that other jobs
(dtbs check, kunit) can use it.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/build.sh                | 14 ++------------
 drivers/gpu/drm/ci/override-ld-with-bfd.sh | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 12 deletions(-)
 create mode 100755 drivers/gpu/drm/ci/override-ld-with-bfd.sh

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 284873e94d8d..3857b732cf16 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -8,6 +8,8 @@ rm -rf .git/rebase-apply
 
 . .gitlab-ci/container/container_pre_build.sh
 
+. drivers/gpu/drm/ci/override-ld-with-bfd.sh
+
 # libssl-dev was uninstalled because it was considered an ephemeral package
 apt-get update
 apt-get install -y libssl-dev
@@ -47,18 +49,6 @@ fi
 export ARCH=${KERNEL_ARCH}
 export CROSS_COMPILE="${GCC_ARCH}-"
 
-# The kernel doesn't like the gold linker (or the old lld in our debians).
-# Sneak in some override symlinks during kernel build until we can update
-# debian.
-mkdir -p ld-links
-for i in /usr/bin/*-ld /usr/bin/ld; do
-    i=$(basename $i)
-    ln -sf /usr/bin/$i.bfd ld-links/$i
-done
-
-NEWPATH=$(pwd)/ld-links
-export PATH=$NEWPATH:$PATH
-
 git config --global user.email "fdo@example.com"
 git config --global user.name "freedesktop.org CI"
 git config --global pull.rebase true
diff --git a/drivers/gpu/drm/ci/override-ld-with-bfd.sh b/drivers/gpu/drm/ci/override-ld-with-bfd.sh
new file mode 100755
index 000000000000..9728dc39cb19
--- /dev/null
+++ b/drivers/gpu/drm/ci/override-ld-with-bfd.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+# SPDX-License-Identifier: MIT
+
+set -ex
+
+# The kernel doesn't like the gold linker (or the old lld in our debians).
+# Sneak in some override symlinks during kernel build until we can update
+# debian.
+mkdir -p ld-links
+for i in /usr/bin/*-ld /usr/bin/ld; do
+    i=$(basename $i)
+    ln -sf /usr/bin/$i.bfd ld-links/$i
+done
+
+NEWPATH=$(pwd)/ld-links
+export PATH=$NEWPATH:$PATH
-- 
2.47.2

