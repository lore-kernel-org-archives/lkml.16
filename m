Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2C20D4F7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673333; cv=none; b=eN9NY9hUKTIrSY+EkXTrwSQn1Y9zsOOQ2c88Lz7RAICMjty6f+s8plAmr2bZjr75HD6+yO7vMZPqFNDxdrxbBWK761lhkXSwyYLXsPjk5QVW55bmudqRc7YAVUtg3DrO8URqBToX5qSL8mAxrjrwE1VDXB+SW0fWgUAd94BJlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673333; c=relaxed/simple;
	bh=j+XCIO7cJ0poGayUASQ3i/DaaSTSNBh1QDclmA1BNDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxsleeVEGFcSVNvjgkJ1EhK18mBAWwEa0AS6D6vB9HmMuSBJWHL9+IDvzTEC3kxXO68LNQFbhugBlGXkIuigi5lv2wVUKx99eRgNKdIlkuqvVbIC+uuG+riRsmKm6v9iCQcS5rETHpd1xTLJ0yxmpN9ddLtLXvbHk89Eggly26A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 6/8] drm/xe/gsc: Use guard helper for xe_gsc_print_info.
Date: Tue,  4 Feb 2025 13:49:07 +0100
Message-ID: <20250204124909.158315-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204124909.158315-1-dev@lankhorst.se>
References: <20250204124909.158315-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As an example on how it works.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_gsc.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 1eb791ddc375c..aee9f58b1c3c6 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -600,7 +600,6 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_mmio *mmio = &gt->mmio;
-	unsigned int fw_ref;
 
 	xe_uc_fw_print(&gsc->fw, p);
 
@@ -609,17 +608,12 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_printer *p)
 	if (!xe_uc_fw_is_enabled(&gsc->fw))
 		return;
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
-	if (!fw_ref)
-		return;
-
-	drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
-			xe_mmio_read32(mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
-			xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
-
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	scoped_guard(xe_force_wake_get, gt_to_fw(gt), XE_FW_GSC)
+		drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x\n",
+				xe_mmio_read32(mmio, HECI_FWSTS1(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS2(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS3(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BASE)),
+				xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BASE)));
 }
-- 
2.47.1

