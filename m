Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B762248A4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499496; cv=pass; b=LQiwBfLduJXyJum2o419W2rOUbhAuzMFMS6ggQD0HPUta+k1XfjORK4CMbVo9UV+Pp2gfY5gVTbDKqgi8g4YRdFiV40o96/7FqUt7dJv7IOiDmSrXHISRIqsQSX/rRPuThuLEhqi2SMdIiKflWes7ecmMBYH5ytqfKTJf7JQrO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499496; c=relaxed/simple;
	bh=jgZFgX8f1lmIrMc9XkXVrobKxZOqQe3AE+a8f3uEcYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAGy2vsUaREfjy9K7lsD++pJadm4CIcm6mWyEcelDX3wGI1YZDiybZaxiR2QAWrY2LUbP9O65CF40bYdYJfyH0hpf2B6+kYXPCczbKh8pFZ/9fnRqkWRmfMkDrEyVK3dmQsSiDDcA4FhTXkBg0N0mFLy82totlbkpZ1I2HuUSlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b=MCCm6iAF; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="MCCm6iAF"
ARC-Seal: i=1; a=rsa-sha256; t=1751499479; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AeKM6aCiQgdc2a6iNLJlN0EdTJ6cfZRP1kCKaeL4FmwWJZGnSM7WfKlp04jvlsCfYNlHUQJ4Rj77VS6dt8B/caqOzJgxlA/IYATqjsKlOre5qvoxFawa4LlMFdaPJy5dzkAiZ9YtGCB0gdoBTbJSaEDiQki+M0SaCEK6kcD3aKE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751499479; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7DDVsSWw3fZUzYJcPL1jaXMTYcK5fhrSoNz2/Lj/3NI=; 
	b=ClinfhvlS0kRtIMDxIffv+OBG3i+mMtSqvrKgnHHNoObDob5GOOIgWy6VVR5+fCmwPNFwzwSK1Hv3ZPFE4XR5jVd00m49dvMjLq5q6Kejo09m8GudmrxkUybJWHe6hMkc88xDD1Nb29yI9/c7yvW/7ZHlSMtihkPINDaPPAkDEQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
	dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751499478;
	s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7DDVsSWw3fZUzYJcPL1jaXMTYcK5fhrSoNz2/Lj/3NI=;
	b=MCCm6iAFshoSHg0NlgxB8+Jdn5aSVGaEGJvPOfcS2vpT+7DDgGoY6mjiFNgP62NY
	TLFBopha2CBsHCXHWVr6OMVtsEtjJhYI34PZc60scGVFtI7yRD2zbBJXbsmJxcJI1bA
	rES/+md9fY2E3HEAJz87/xlXrOEhZWOYd8NAZnCo=
Received: by mx.zohomail.com with SMTPS id 1751499476564323.6875734465376;
	Wed, 2 Jul 2025 16:37:56 -0700 (PDT)
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
Date: Wed,  2 Jul 2025 23:36:06 +0000
Message-ID: <20250702233621.12990-5-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250702233621.12990-1-caterina.shablia@collabora.com>
References: <20250702233621.12990-1-caterina.shablia@collabora.com>
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

