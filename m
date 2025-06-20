Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF4021A425
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419484; cv=none; b=Fc8GwRku92vyz2QM/+U71aMJz+U6/V6XyIvU3LNEMwnz+zev8+DfqkddKhAfBTeOnpfHDYD69AQNwI5WlsNombfJ142JBrolYrm/hbgFlyM8w9wPPfPV1tzgN+Mp1OWkUE7AenS/6inoB4o98onh10o6a5wRlyfnyVy9GGW+5VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419484; c=relaxed/simple;
	bh=3syysiG5s6jCHwZHZvtiKPm1XEK5bb9XJyW3jNZETN8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WDU7ZxRVgfSV9B5p4R71o02bBMrySIs2OHmIzxRuoyiNQmG/lWDbVwfntwVH93KitTOSbEMikB5oBrAiHJWWjQqgcjhGL2zFKa9KKVuYfn6WeCfp81bksRKyHYHbJ2+rzQnA1LwJsnMeflIXNWd7oBuWpPFfNMKD/PyyBrXUw4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syI9jqfz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syI9jqfz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5412DC4CEE3;
	Fri, 20 Jun 2025 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750419484;
	bh=3syysiG5s6jCHwZHZvtiKPm1XEK5bb9XJyW3jNZETN8=;
	h=From:To:Cc:Subject:Date:From;
	b=syI9jqfzlBs1dCm60qmMir/8boGOv4AN1bV1APsBMoUsSprQG07z4c/TdjcdlYqeW
	 5a2ZfVR+1tO44jMf5vbTAfkAW0nts6uAexr1A7+tPAQwergVnJgeON/ItNVxhZ/JzU
	 NgW9gEoUIiF1E7vA/PXyo8EfChrvBE1uUiqcWAp6DRzlX0hUnHwlrfeWQdNU/RDAG/
	 p37kg/2FvfBC8ybzw17Hmzg3FoFbIrIT8vm9unKvlmLm3zreeTUOr6XXaNwviBtd8g
	 fPewplJtLVVQh0xEWf4ni+zdT8/V/V9tzs+ZhoCHMENxn0ANGWAXCARq3JGqWezYDw
	 Q3DDAmeAkOyoA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Vinod Govindapillai <vinod.govindapillai@intel.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
	Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/wm: reduce stack usage in skl_print_wm_changes()
Date: Fri, 20 Jun 2025 13:37:45 +0200
Message-Id: <20250620113748.3869160-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When KMSAN is enabled, this function causes has a rather excessive stack usage:

drivers/gpu/drm/i915/display/skl_watermark.c:2977:1: error: stack frame size (1432) exceeds limit (1408) in 'skl_compute_wm' [-Werror,-Wframe-larger-than]

This is apparently all caused by the varargs calls to drm_dbg_kms(). Inlining
this into skl_compute_wm() means that any function called by skl_compute_wm()
has its own stack on top of that.

Move the worst bit into a separate function marked as noinline_for_stack to
limit that to the one code path that actually needs it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/display/skl_watermark.c | 176 ++++++++++---------
 1 file changed, 92 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_watermark.c b/drivers/gpu/drm/i915/display/skl_watermark.c
index 2c2371574d6f..b7c92c718c8f 100644
--- a/drivers/gpu/drm/i915/display/skl_watermark.c
+++ b/drivers/gpu/drm/i915/display/skl_watermark.c
@@ -2680,6 +2680,97 @@ static char enast(bool enable)
 	return enable ? '*' : ' ';
 }
 
+static noinline_for_stack void
+skl_print_plane_changes(struct intel_display *display,
+			struct intel_plane *plane,
+			const struct skl_plane_wm *old_wm,
+			const struct skl_plane_wm *new_wm)
+{
+	drm_dbg_kms(display->drm,
+		    "[PLANE:%d:%s]   level %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm"
+		    " -> %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm\n",
+		    plane->base.base.id, plane->base.name,
+		    enast(old_wm->wm[0].enable), enast(old_wm->wm[1].enable),
+		    enast(old_wm->wm[2].enable), enast(old_wm->wm[3].enable),
+		    enast(old_wm->wm[4].enable), enast(old_wm->wm[5].enable),
+		    enast(old_wm->wm[6].enable), enast(old_wm->wm[7].enable),
+		    enast(old_wm->trans_wm.enable),
+		    enast(old_wm->sagv.wm0.enable),
+		    enast(old_wm->sagv.trans_wm.enable),
+		    enast(new_wm->wm[0].enable), enast(new_wm->wm[1].enable),
+		    enast(new_wm->wm[2].enable), enast(new_wm->wm[3].enable),
+		    enast(new_wm->wm[4].enable), enast(new_wm->wm[5].enable),
+		    enast(new_wm->wm[6].enable), enast(new_wm->wm[7].enable),
+		    enast(new_wm->trans_wm.enable),
+		    enast(new_wm->sagv.wm0.enable),
+		    enast(new_wm->sagv.trans_wm.enable));
+
+	drm_dbg_kms(display->drm,
+		    "[PLANE:%d:%s]   lines %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d"
+		      " -> %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d\n",
+		    plane->base.base.id, plane->base.name,
+		    enast(old_wm->wm[0].ignore_lines), old_wm->wm[0].lines,
+		    enast(old_wm->wm[1].ignore_lines), old_wm->wm[1].lines,
+		    enast(old_wm->wm[2].ignore_lines), old_wm->wm[2].lines,
+		    enast(old_wm->wm[3].ignore_lines), old_wm->wm[3].lines,
+		    enast(old_wm->wm[4].ignore_lines), old_wm->wm[4].lines,
+		    enast(old_wm->wm[5].ignore_lines), old_wm->wm[5].lines,
+		    enast(old_wm->wm[6].ignore_lines), old_wm->wm[6].lines,
+		    enast(old_wm->wm[7].ignore_lines), old_wm->wm[7].lines,
+		    enast(old_wm->trans_wm.ignore_lines), old_wm->trans_wm.lines,
+		    enast(old_wm->sagv.wm0.ignore_lines), old_wm->sagv.wm0.lines,
+		    enast(old_wm->sagv.trans_wm.ignore_lines), old_wm->sagv.trans_wm.lines,
+		    enast(new_wm->wm[0].ignore_lines), new_wm->wm[0].lines,
+		    enast(new_wm->wm[1].ignore_lines), new_wm->wm[1].lines,
+		    enast(new_wm->wm[2].ignore_lines), new_wm->wm[2].lines,
+		    enast(new_wm->wm[3].ignore_lines), new_wm->wm[3].lines,
+		    enast(new_wm->wm[4].ignore_lines), new_wm->wm[4].lines,
+		    enast(new_wm->wm[5].ignore_lines), new_wm->wm[5].lines,
+		    enast(new_wm->wm[6].ignore_lines), new_wm->wm[6].lines,
+		    enast(new_wm->wm[7].ignore_lines), new_wm->wm[7].lines,
+		    enast(new_wm->trans_wm.ignore_lines), new_wm->trans_wm.lines,
+		    enast(new_wm->sagv.wm0.ignore_lines), new_wm->sagv.wm0.lines,
+		    enast(new_wm->sagv.trans_wm.ignore_lines), new_wm->sagv.trans_wm.lines);
+
+	drm_dbg_kms(display->drm,
+		    "[PLANE:%d:%s]  blocks %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
+		    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
+		    plane->base.base.id, plane->base.name,
+		    old_wm->wm[0].blocks, old_wm->wm[1].blocks,
+		    old_wm->wm[2].blocks, old_wm->wm[3].blocks,
+		    old_wm->wm[4].blocks, old_wm->wm[5].blocks,
+		    old_wm->wm[6].blocks, old_wm->wm[7].blocks,
+		    old_wm->trans_wm.blocks,
+		    old_wm->sagv.wm0.blocks,
+		    old_wm->sagv.trans_wm.blocks,
+		    new_wm->wm[0].blocks, new_wm->wm[1].blocks,
+		    new_wm->wm[2].blocks, new_wm->wm[3].blocks,
+		    new_wm->wm[4].blocks, new_wm->wm[5].blocks,
+		    new_wm->wm[6].blocks, new_wm->wm[7].blocks,
+		    new_wm->trans_wm.blocks,
+		    new_wm->sagv.wm0.blocks,
+		    new_wm->sagv.trans_wm.blocks);
+
+	drm_dbg_kms(display->drm,
+		    "[PLANE:%d:%s] min_ddb %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
+		    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
+		    plane->base.base.id, plane->base.name,
+		    old_wm->wm[0].min_ddb_alloc, old_wm->wm[1].min_ddb_alloc,
+		    old_wm->wm[2].min_ddb_alloc, old_wm->wm[3].min_ddb_alloc,
+		    old_wm->wm[4].min_ddb_alloc, old_wm->wm[5].min_ddb_alloc,
+		    old_wm->wm[6].min_ddb_alloc, old_wm->wm[7].min_ddb_alloc,
+		    old_wm->trans_wm.min_ddb_alloc,
+		    old_wm->sagv.wm0.min_ddb_alloc,
+		    old_wm->sagv.trans_wm.min_ddb_alloc,
+		    new_wm->wm[0].min_ddb_alloc, new_wm->wm[1].min_ddb_alloc,
+		    new_wm->wm[2].min_ddb_alloc, new_wm->wm[3].min_ddb_alloc,
+		    new_wm->wm[4].min_ddb_alloc, new_wm->wm[5].min_ddb_alloc,
+		    new_wm->wm[6].min_ddb_alloc, new_wm->wm[7].min_ddb_alloc,
+		    new_wm->trans_wm.min_ddb_alloc,
+		    new_wm->sagv.wm0.min_ddb_alloc,
+		    new_wm->sagv.trans_wm.min_ddb_alloc);
+}
+
 static void
 skl_print_wm_changes(struct intel_atomic_state *state)
 {
@@ -2709,7 +2800,6 @@ skl_print_wm_changes(struct intel_atomic_state *state)
 
 			if (skl_ddb_entry_equal(old, new))
 				continue;
-
 			drm_dbg_kms(display->drm,
 				    "[PLANE:%d:%s] ddb (%4d - %4d) -> (%4d - %4d), size %4d -> %4d\n",
 				    plane->base.base.id, plane->base.name,
@@ -2727,89 +2817,7 @@ skl_print_wm_changes(struct intel_atomic_state *state)
 			if (skl_plane_wm_equals(display, old_wm, new_wm))
 				continue;
 
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s]   level %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm"
-				    " -> %cwm0,%cwm1,%cwm2,%cwm3,%cwm4,%cwm5,%cwm6,%cwm7,%ctwm,%cswm,%cstwm\n",
-				    plane->base.base.id, plane->base.name,
-				    enast(old_wm->wm[0].enable), enast(old_wm->wm[1].enable),
-				    enast(old_wm->wm[2].enable), enast(old_wm->wm[3].enable),
-				    enast(old_wm->wm[4].enable), enast(old_wm->wm[5].enable),
-				    enast(old_wm->wm[6].enable), enast(old_wm->wm[7].enable),
-				    enast(old_wm->trans_wm.enable),
-				    enast(old_wm->sagv.wm0.enable),
-				    enast(old_wm->sagv.trans_wm.enable),
-				    enast(new_wm->wm[0].enable), enast(new_wm->wm[1].enable),
-				    enast(new_wm->wm[2].enable), enast(new_wm->wm[3].enable),
-				    enast(new_wm->wm[4].enable), enast(new_wm->wm[5].enable),
-				    enast(new_wm->wm[6].enable), enast(new_wm->wm[7].enable),
-				    enast(new_wm->trans_wm.enable),
-				    enast(new_wm->sagv.wm0.enable),
-				    enast(new_wm->sagv.trans_wm.enable));
-
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s]   lines %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d"
-				      " -> %c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%3d,%c%4d\n",
-				    plane->base.base.id, plane->base.name,
-				    enast(old_wm->wm[0].ignore_lines), old_wm->wm[0].lines,
-				    enast(old_wm->wm[1].ignore_lines), old_wm->wm[1].lines,
-				    enast(old_wm->wm[2].ignore_lines), old_wm->wm[2].lines,
-				    enast(old_wm->wm[3].ignore_lines), old_wm->wm[3].lines,
-				    enast(old_wm->wm[4].ignore_lines), old_wm->wm[4].lines,
-				    enast(old_wm->wm[5].ignore_lines), old_wm->wm[5].lines,
-				    enast(old_wm->wm[6].ignore_lines), old_wm->wm[6].lines,
-				    enast(old_wm->wm[7].ignore_lines), old_wm->wm[7].lines,
-				    enast(old_wm->trans_wm.ignore_lines), old_wm->trans_wm.lines,
-				    enast(old_wm->sagv.wm0.ignore_lines), old_wm->sagv.wm0.lines,
-				    enast(old_wm->sagv.trans_wm.ignore_lines), old_wm->sagv.trans_wm.lines,
-				    enast(new_wm->wm[0].ignore_lines), new_wm->wm[0].lines,
-				    enast(new_wm->wm[1].ignore_lines), new_wm->wm[1].lines,
-				    enast(new_wm->wm[2].ignore_lines), new_wm->wm[2].lines,
-				    enast(new_wm->wm[3].ignore_lines), new_wm->wm[3].lines,
-				    enast(new_wm->wm[4].ignore_lines), new_wm->wm[4].lines,
-				    enast(new_wm->wm[5].ignore_lines), new_wm->wm[5].lines,
-				    enast(new_wm->wm[6].ignore_lines), new_wm->wm[6].lines,
-				    enast(new_wm->wm[7].ignore_lines), new_wm->wm[7].lines,
-				    enast(new_wm->trans_wm.ignore_lines), new_wm->trans_wm.lines,
-				    enast(new_wm->sagv.wm0.ignore_lines), new_wm->sagv.wm0.lines,
-				    enast(new_wm->sagv.trans_wm.ignore_lines), new_wm->sagv.trans_wm.lines);
-
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s]  blocks %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
-				    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
-				    plane->base.base.id, plane->base.name,
-				    old_wm->wm[0].blocks, old_wm->wm[1].blocks,
-				    old_wm->wm[2].blocks, old_wm->wm[3].blocks,
-				    old_wm->wm[4].blocks, old_wm->wm[5].blocks,
-				    old_wm->wm[6].blocks, old_wm->wm[7].blocks,
-				    old_wm->trans_wm.blocks,
-				    old_wm->sagv.wm0.blocks,
-				    old_wm->sagv.trans_wm.blocks,
-				    new_wm->wm[0].blocks, new_wm->wm[1].blocks,
-				    new_wm->wm[2].blocks, new_wm->wm[3].blocks,
-				    new_wm->wm[4].blocks, new_wm->wm[5].blocks,
-				    new_wm->wm[6].blocks, new_wm->wm[7].blocks,
-				    new_wm->trans_wm.blocks,
-				    new_wm->sagv.wm0.blocks,
-				    new_wm->sagv.trans_wm.blocks);
-
-			drm_dbg_kms(display->drm,
-				    "[PLANE:%d:%s] min_ddb %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d"
-				    " -> %4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%4d,%5d\n",
-				    plane->base.base.id, plane->base.name,
-				    old_wm->wm[0].min_ddb_alloc, old_wm->wm[1].min_ddb_alloc,
-				    old_wm->wm[2].min_ddb_alloc, old_wm->wm[3].min_ddb_alloc,
-				    old_wm->wm[4].min_ddb_alloc, old_wm->wm[5].min_ddb_alloc,
-				    old_wm->wm[6].min_ddb_alloc, old_wm->wm[7].min_ddb_alloc,
-				    old_wm->trans_wm.min_ddb_alloc,
-				    old_wm->sagv.wm0.min_ddb_alloc,
-				    old_wm->sagv.trans_wm.min_ddb_alloc,
-				    new_wm->wm[0].min_ddb_alloc, new_wm->wm[1].min_ddb_alloc,
-				    new_wm->wm[2].min_ddb_alloc, new_wm->wm[3].min_ddb_alloc,
-				    new_wm->wm[4].min_ddb_alloc, new_wm->wm[5].min_ddb_alloc,
-				    new_wm->wm[6].min_ddb_alloc, new_wm->wm[7].min_ddb_alloc,
-				    new_wm->trans_wm.min_ddb_alloc,
-				    new_wm->sagv.wm0.min_ddb_alloc,
-				    new_wm->sagv.trans_wm.min_ddb_alloc);
+			skl_print_plane_changes(display, plane, old_wm, new_wm);
 		}
 	}
 }
-- 
2.39.5

