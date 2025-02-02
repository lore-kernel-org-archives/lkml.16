Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216E214A83
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533560; cv=none; b=k2Zwm8kP70sRaC4D3BiIclPLSI91wxtQbkxSDf/QP87PsbHEK9RkGkBq/vL+WBdUEXYUdFulspmderOiEk9kjZ7e3eDw3xjfoXg/0Imqtw1x/2B1SpLNxDCrYxzvexApScQomnOAdi3+Or1BOUcr1c1QuIVChfu1VSnAeNQqPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533560; c=relaxed/simple;
	bh=QDyGkZJkShmBgultuA+qkCF4GueVge4RiwkeLKCTazg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a98FbCdRkbow8U58WACazZKCakBXjHX0iy3pALeqoSo2S5UE3+dVFYKEE+plmB6KhGOycDKFn7JsPXLN/7uEansFTFc3wgEAO8XQ/sSm0o6WT+xNWSYy3IASxN9SMtxTd+313v1lGtP2Y5ivX680elMT4rbgwDkh7BGVoKBDXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LWuRQReN; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LWuRQReN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=9VUI0A8kIxcq0iFYz3iAEwKzXwQz0sXnUaNYUsIpnFg=; b=LWuRQReNSVobiflE
	vU9eB582mmc/dTtnK1DPBTDXtF/2ZEwzBf0ArfvLjIt4Xbd7IunLSPZidmOaJaz7cQhMhZKgHqVYO
	MmZZAnkJJZNLlRecuuR4rjWx2X1wF5TRc8awU6FGk5BP5WXTQh7HEXJDrqQvBdUQSVypXEoOkJKCa
	LMYCKU27Cj01gxt37Vvh/aDebDokgIx6kFyfCdj9edV65GnjE3ugo9VSyDfB26IygbkpWJg1OQ/Cs
	rKR23GXPEs7QUYCgJpflt8jBlqVSfGXtC/lpzieYXnHeWUD+3vfHKWNXp76lkY+qCXe+FJEWDp9tP
	H18iyaVlaNzo/4k4KQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehzW-00D9GV-0c;
	Sun, 02 Feb 2025 21:58:58 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/7] drm/amd/display: Remove unused mpc1_is_mpcc_idle
Date: Sun,  2 Feb 2025 21:58:50 +0000
Message-ID: <20250202215856.252439-2-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mpc1_is_mpcc_idle() was added in 2017 by
commit feb4a3cd8eb0 ("drm/amd/display: Integrating MPC pseudocode")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c | 16 ----------------
 .../gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h |  4 ----
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
index f2f55565e98a..b23c64004dd5 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
@@ -142,22 +142,6 @@ struct mpcc *mpc1_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 	return NULL;
 }
 
-bool mpc1_is_mpcc_idle(struct mpc *mpc, int mpcc_id)
-{
-	struct dcn10_mpc *mpc10 = TO_DCN10_MPC(mpc);
-	unsigned int top_sel;
-	unsigned int opp_id;
-	unsigned int idle;
-
-	REG_GET(MPCC_TOP_SEL[mpcc_id], MPCC_TOP_SEL, &top_sel);
-	REG_GET(MPCC_OPP_ID[mpcc_id],  MPCC_OPP_ID, &opp_id);
-	REG_GET(MPCC_STATUS[mpcc_id],  MPCC_IDLE,   &idle);
-	if (top_sel == 0xf && opp_id == 0xf && idle)
-		return true;
-	else
-		return false;
-}
-
 void mpc1_assert_mpcc_idle_before_connect(struct mpc *mpc, int mpcc_id)
 {
 	struct dcn10_mpc *mpc10 = TO_DCN10_MPC(mpc);
diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h
index dbfffc6383dc..874e36e39e1b 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h
@@ -173,10 +173,6 @@ void mpc1_update_stereo_mix(
 	struct mpcc_sm_cfg *sm_cfg,
 	int mpcc_id);
 
-bool mpc1_is_mpcc_idle(
-	struct mpc *mpc,
-	int mpcc_id);
-
 void mpc1_assert_mpcc_idle_before_connect(
 	struct mpc *mpc,
 	int mpcc_id);
-- 
2.48.1

