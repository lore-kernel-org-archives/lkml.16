Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232E2EE96B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556696; cv=none; b=Q/UCC66hPcUAK4eVEWeqcgIradjv1V35tMRso/fTHDJdr0kcn/dwRvEXcqwKDGqeojvW7khdFXLNowxf07Fmq2flqGlx1zRYU3KppcdUwXlipnjL1bK1V0iNJRbN3u91GVozYopxYcS8j3g3M/jSc8tHGiU1WvUAi/YiA3ngezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556696; c=relaxed/simple;
	bh=jgZFgX8f1lmIrMc9XkXVrobKxZOqQe3AE+a8f3uEcYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZqqipQpZkppallus5A5aQpImmZb5v+qP3t52zIZSKaA7DyFqwQAY3Ah0Blc4eHiPWKJvnPG00UdjFZy46rvZufCCOyv7FZHnh4xvyD1dlhkboaX4BKYt9Ne2J2EeXbndSY4mr6T7Za6cVR1+tLQSwK1ft4OiT5jKnYZRCNEAZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EMyyij1b; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EMyyij1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751556693;
	bh=jgZFgX8f1lmIrMc9XkXVrobKxZOqQe3AE+a8f3uEcYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMyyij1bWsxEvUMBeKfc9eOYwpG2WIHU7PBods5UiMSGJN2OyL/SLDDw2dtErkITj
	 3oq4I7EAF3zpXGIIZ57cucq2lkCivXlcsuXMbGND76jggNPtXIvH4d6y6GaUT0KTKo
	 KHyVZVDXq58P23ODO8YAil8hbXEBslKWjcW8PJdTYYzhoz0pjROAWMOHWIWIwbbJ8C
	 DvrjKXhNRIFsieKjaxaCPnLS/AfToUol7uxb2p1Q+h6JexahdhjIQ5zWAi7aA7oFYW
	 qktmh7BxFbxEj3h7XqQNHUo7sUVu4mp62wH2TXU0xvIjYSyYc2q+u/sbLVbPUose2m
	 5nAef8Na4wfvg==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nanokatze)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7858B17E09C6;
	Thu,  3 Jul 2025 17:31:32 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
	Caterina Shablia <caterina.shablia@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] drm/gpuvm: Add a helper to check if two VA can be merged
Date: Thu,  3 Jul 2025 15:28:57 +0000
Message-ID: <20250703152908.16702-6-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703152908.16702-2-caterina.shablia@collabora.com>
References: <20250703152908.16702-2-caterina.shablia@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boris Brezillon <boris.brezillon@collabora.com>

We are going to add flags/properties that will impact the VA merging
ability. Instead of sprinkling tests all over the place in
__drm_gpuvm_sm_map(), let's add a helper aggregating all these checks
can call it for every existing VA we walk through in the
__drm_gpuvm_sm_map() loop.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 47 +++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index ae201d45e6b8..2df04dfcb6ef 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2098,12 +2098,48 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
 	return fn->sm_step_unmap(&op, priv);
 }
 
+static bool can_merge(struct drm_gpuvm *gpuvm, const struct drm_gpuva *a,
+		      const struct drm_gpuva *b)
+{
+	/* Only GEM-based mappings can be merged, and they must point to
+	 * the same GEM object.
+	 */
+	if (a->gem.obj != b->gem.obj || !a->gem.obj)
+		return false;
+
+	/* Let's keep things simple for now and force all flags to match. */
+	if (a->flags != b->flags)
+		return false;
+
+	/* Order VAs for the rest of the checks. */
+	if (a->va.addr > b->va.addr)
+		swap(a, b);
+
+	/* We assume the caller already checked that VAs overlap or are
+	 * contiguous.
+	 */
+	if (drm_WARN_ON(gpuvm->drm, b->va.addr > a->va.addr + a->va.range))
+		return false;
+
+	/* We intentionally ignore u64 underflows because all we care about
+	 * here is whether the VA diff matches the GEM offset diff.
+	 */
+	return b->va.addr - a->va.addr == b->gem.offset - a->gem.offset;
+}
+
 static int
 __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		   const struct drm_gpuvm_ops *ops, void *priv,
 		   const struct drm_gpuvm_map_req *req)
 {
 	struct drm_gpuva *va, *next;
+	struct drm_gpuva reqva = {
+		.va.addr = req->va.addr,
+		.va.range = req->va.range,
+		.gem.offset = req->gem.offset,
+		.gem.obj = req->gem.obj,
+		.flags = req->flags,
+	};
 	u64 req_end = req->va.addr + req->va.range;
 	int ret;
 
@@ -2116,12 +2152,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 		u64 addr = va->va.addr;
 		u64 range = va->va.range;
 		u64 end = addr + range;
-		bool merge = !!va->gem.obj;
+		bool merge = can_merge(gpuvm, va, &reqva);
 
 		if (addr == req->va.addr) {
-			merge &= obj == req->gem.obj &&
-				 offset == req->gem.offset;
-
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
@@ -2163,8 +2196,6 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 			};
 			struct drm_gpuva_op_unmap u = { .va = va };
 
-			merge &= obj == req->gem.obj &&
-				 offset + ls_range == req->gem.offset;
 			u.keep = merge;
 
 			if (end == req_end) {
@@ -2196,10 +2227,6 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				break;
 			}
 		} else if (addr > req->va.addr) {
-			merge &= obj == req->gem.obj &&
-				 offset == req->gem.offset +
-					   (addr - req->va.addr);
-
 			if (end == req_end) {
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
-- 
2.47.2

