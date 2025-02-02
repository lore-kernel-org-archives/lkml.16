Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0220C003
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533557; cv=none; b=tmMOLfyPCetPhHvltSOLiPxAVzZ5znhBnDt9RTYM+twjM2uzuGP8vwLesdff2ZBocCVtUzuStGK42ArUruVjG4f0oFBUjRCOQOiabtewKOTzdf06tFdTQi4wwB9bl401LT3Mz15NMA7DGEmdjzxuKiFja2J/iI3RuO9r0/9vWlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533557; c=relaxed/simple;
	bh=UDWy+aUqMYo23NL3hwiKtwJ4RASTiwEQ8rR7BF/F/m8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dw3/xvOVSLvmOSBXIkbSJDhYd03TwYvXvX28dEk+WzW/BknBKK+WRX/H3F7dNDOwF8aalJ/P+Z0e19xF7nLhSl/EEBP8BLNL4xB+nWGtrRykOe2MxrV7j2pdSw+9zzYXM8l4GLzCtEpeFb8fybe7kU4ItiVQwHG2cVg6oGOxJls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Qgc2sU6O; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Qgc2sU6O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0wnGofrGCJWqPYkWdZEZOB5+zOxrDqvG6IEsWkcHyLk=; b=Qgc2sU6OnOFo7+rq
	ubGsiT9nGrC2tFZOXMiCrsxp3B7jOeY/TR+2Vx+kGzvovwU23nAkeYe9gNEdUa2ka5tuEw/dA2c3G
	E2VpWhjgSk/9PjHYXs5OCphFfSHwlRnOZg8qQpXk2IFc8E4l4HIPN5a2sehBr3LE7O6+H9a0WYIva
	CVwjP6DYpLryyWUTP+NLekDp8+kk0mfRYknqUz9IylS8k9aZ5M0bBzP2YzzxXCXRvU8UQabzOYadK
	ZDbr6DFSD+AgeE725rPaZD6fLzHB+5+10dyJ11Hi72gaGFeQehGE6tALcQ0hi0sQyzjEVfqzjAIgx
	1Ysk19B/Uxpjk116uQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehzY-00D9GV-2q;
	Sun, 02 Feb 2025 21:59:00 +0000
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
Subject: [PATCH 5/7] drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
Date: Sun,  2 Feb 2025 21:58:54 +0000
Message-ID: <20250202215856.252439-6-linux@treblig.org>
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

hubbub1_toggle_watermark_change_req() last use was removed in 2017 by
commit b8fce2c9d773 ("drm/amd/display: Optimize programming front end")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../amd/display/dc/hubbub/dcn10/dcn10_hubbub.c | 18 ------------------
 .../amd/display/dc/hubbub/dcn10/dcn10_hubbub.h |  3 ---
 2 files changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
index d738a36f2132..7847c1c4927b 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
@@ -679,24 +679,6 @@ void hubbub1_update_dchub(
 	dh_data->dchub_info_valid = false;
 }
 
-void hubbub1_toggle_watermark_change_req(struct hubbub *hubbub)
-{
-	struct dcn10_hubbub *hubbub1 = TO_DCN10_HUBBUB(hubbub);
-
-	uint32_t watermark_change_req;
-
-	REG_GET(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL,
-			DCHUBBUB_ARB_WATERMARK_CHANGE_REQUEST, &watermark_change_req);
-
-	if (watermark_change_req)
-		watermark_change_req = 0;
-	else
-		watermark_change_req = 1;
-
-	REG_UPDATE(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL,
-			DCHUBBUB_ARB_WATERMARK_CHANGE_REQUEST, watermark_change_req);
-}
-
 void hubbub1_soft_reset(struct hubbub *hubbub, bool reset)
 {
 	struct dcn10_hubbub *hubbub1 = TO_DCN10_HUBBUB(hubbub);
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h
index 9fbd45c7dfef..fa5c4c18ed59 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.h
@@ -489,9 +489,6 @@ void hubbub1_allow_self_refresh_control(struct hubbub *hubbub, bool allow);
 
 bool hubbub1_is_allow_self_refresh_enabled(struct hubbub *hubub);
 
-void hubbub1_toggle_watermark_change_req(
-		struct hubbub *hubbub);
-
 void hubbub1_wm_read_state(struct hubbub *hubbub,
 		struct dcn_hubbub_wm *wm);
 
-- 
2.48.1

