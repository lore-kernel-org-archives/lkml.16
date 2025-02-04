Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3445C2153CE
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738675321; cv=none; b=BNZ/1WwtMkHykJPQVK8XtiU0lGlWhDxVRmmUt/9h1bi+FNmm/ysLRv+W/GA8NxEFp1UVyg2daEk5c6LqKxKtcwOHpocCUvQJAc7+LDM+hVN/HKfYhpVLcXhnYPOIxzdAEiKmcj/izog6wJFskvhYnrcHIBYI7BYKYPxJIe8ZdX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738675321; c=relaxed/simple;
	bh=iaKvwzWeohgGTdP9GWucyZOGaw0klOuNmFlmDbHojpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezRRqkCDUp0HTR+JGrGH/i2K9XaQIZLCyL/vxLl+iGkWRgSneY0XToKvF7+V6BqosxQb9zGaUl1ubNTQByBncFa1nemf7gYUd/XpMXNms4wQlToMfWUqsAr2YoV6FS6OvzuJC/63TnPOVagSjev/oIFHPmIzL7/sAvRuQBifImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 7/8] drm/xe/vram: Use xe_force_wake guard helper
Date: Tue,  4 Feb 2025 14:22:36 +0100
Message-ID: <20250204132238.162608-8-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
References: <20250204132238.162608-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_vram.c | 45 ++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b1f81dca610dc..9180bb4d29971 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -220,7 +220,6 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *gt = tile->primary_gt;
-	unsigned int fw_ref;
 	u64 offset;
 	u32 reg;
 
@@ -240,33 +239,29 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		return 0;
 	}
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return -ETIMEDOUT;
-
-	/* actual size */
-	if (unlikely(xe->info.platform == XE_DG1)) {
-		*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
-		*tile_offset = 0;
-	} else {
-		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
-		*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
-		*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
-	}
-
-	/* minus device usage */
-	if (xe->info.has_flat_ccs) {
-		offset = get_flat_ccs_offset(gt, *tile_size);
-	} else {
-		offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
-	}
+	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, gt_to_fw(gt), XE_FW_GT) {
+		/* actual size */
+		if (unlikely(xe->info.platform == XE_DG1)) {
+			*tile_size = pci_resource_len(to_pci_dev(xe->drm.dev), LMEM_BAR);
+			*tile_offset = 0;
+		} else {
+			reg = xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt->info.id));
+			*tile_size = (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;
+			*tile_offset = (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;
+		}
 
-	/* remove the tile offset so we have just the available size */
-	*vram_size = offset - *tile_offset;
+		/* minus device usage */
+		if (xe->info.has_flat_ccs) {
+			offset = get_flat_ccs_offset(gt, *tile_size);
+		} else {
+			offset = xe_mmio_read64_2x32(&tile->mmio, GSMBASE);
+		}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+		/* remove the tile offset so we have just the available size */
+		*vram_size = offset - *tile_offset;
 
-	return 0;
+		return 0;
+	}
 }
 
 static void vram_fini(void *arg)
-- 
2.47.1

