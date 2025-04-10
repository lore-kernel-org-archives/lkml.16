Received: from mail.crpt.ru (mail.crpt.ru [91.236.205.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD127468
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.236.205.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255024; cv=none; b=AV8QUv0eMBtUISmmmB5BEKqe8JSDu1VAV2uSSiU3i8HUH0JPMyKgEFs+r0P0pCk1S0thkei75srlzi0DIrZ5miXpOCa4DP2HlHBkme+BcPKbNkOp8+vq1OOX5CHQq1xEooc8nSi7QUx7sMI7BrRkDG2bLR5gR0+6V9sScZmddbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255024; c=relaxed/simple;
	bh=N7JSajSZaHRzxfryUI2eAu/pVUJRXkAMGYEJy5kZUqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EdlK9Oi7APXyjTsvyLutDncw74NLj+bYAUNspG7Jq27IviGwO3rTg3E1LfSiT50wElXW8QtVByRSPZ05ezis/kJEiPw+djUq4QZKCXkqC7q7m1LpsWrHuW+b5s959kEqHsGu0PUFqxP8lgtzZxvDytmi/kdK6HYQ+SJGIum8/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru; spf=pass smtp.mailfrom=crpt.ru; dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b=QxOAjVvY; arc=none smtp.client-ip=91.236.205.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crpt.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crpt.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crpt.ru header.i=@crpt.ru header.b="QxOAjVvY"
Received: from ssp-soft.crpt.local ([10.200.60.21])
	(user=ssp.nesin@crpt.ru mech=LOGIN bits=0)
	by mail.crpt.ru  with ESMTP id 53A30vLN031928-53A30vLQ031928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 10 Apr 2025 06:01:07 +0300
From: Rostislav Nesin <ssp.nesin@crpt.ru>
To: Austin Zheng <austin.zheng@amd.com>
Cc: Rostislav Nesin <ssp.nesin@crpt.ru>,
	Jun Lei <jun.lei@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] drm/amd/display: drop unimplemented mode_422 code
Date: Thu, 10 Apr 2025 09:56:15 +0700
Message-Id: <20250410025615.466691-1-ssp.nesin@crpt.ru>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-Auth-User: ssp.nesin@crpt.ru
X-FEAS-Client-IP: 10.200.60.21
X-FE-Envelope-From: ssp.nesin@crpt.ru
X-FE-Policy-ID: 0:9:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=aJnlOc2MZbnzRaxt4YVojmTOsBIq3iMeqYiPZsFM6rI=;
 b=QxOAjVvYXCP4EwwFJEwlXGacWmrAlGiE17vYCMlETksgsSWS5sada96M6CplShrTRBahw0nX3Wv1
	Y++Q3+nkofowN2tk4+KcmLIhNBDDpqgcPNStv0v45Ey7yyM4CW7AeGLB0v6ahDdKmGn1XiRMzCEN
	aFtFUIVUp3DuHwIVUl0gpIPQMT39EDmEPFdQhXGnBAd9Q1yKNsD3jMqDBQVmH+q8mzqAGzjcGexj
	dpy2jUdX+pLcVGJj1xkV3H2YOXBCwlys33DBDTkzctHJi9Uj4Eu+TmstZ6s0vzXp23as7PuCha6W
	bitrHTnrgpIz8J3lU/pU+BbgiHQEYUJ9+xrsaA==

The variable mode_422 is initialized to zero, making if (mode_422)
always false.

Removing this unimplemented code and the redundant check simplifies
the code without affecting functionality.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rostislav Nesin <ssp.nesin@crpt.ru>
---
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
index 88dc2b97e7bf..0cfd931a3e6f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
@@ -1027,7 +1027,6 @@ void dml1_rq_dlg_get_dlg_params(
 	unsigned int dlg_vblank_start;
 	bool dcc_en;
 	bool dual_plane;
-	bool mode_422;
 	unsigned int access_dir;
 	unsigned int bytes_per_element_l;
 	unsigned int bytes_per_element_c;
@@ -1199,7 +1198,6 @@ void dml1_rq_dlg_get_dlg_params(
 	dcc_en = e2e_pipe_param->pipe.src.dcc;
 	dual_plane = is_dual_plane(
 			(enum source_format_class) e2e_pipe_param->pipe.src.source_format);
-	mode_422 = 0; /* TODO */
 	access_dir = (e2e_pipe_param->pipe.src.source_scan == dm_vert); /* vp access direction: horizontal or vertical accessed */
 	bytes_per_element_l = get_bytes_per_element(
 			(enum source_format_class) e2e_pipe_param->pipe.src.source_format,
@@ -1548,8 +1546,8 @@ void dml1_rq_dlg_get_dlg_params(
 	req_per_swath_ub_l = rq_dlg_param->rq_l.req_per_swath_ub;
 	req_per_swath_ub_c = rq_dlg_param->rq_c.req_per_swath_ub;
 	meta_row_height_l = rq_dlg_param->rq_l.meta_row_height;
-	swath_width_pixels_ub_l = 0;
-	swath_width_pixels_ub_c = 0;
+	swath_width_pixels_ub_l = swath_width_ub_l;
+	swath_width_pixels_ub_c = swath_width_ub_c;
 	scaler_rec_in_width_l = 0;
 	scaler_rec_in_width_c = 0;
 	dpte_row_height_l = rq_dlg_param->rq_l.dpte_row_height;
@@ -1587,14 +1585,6 @@ void dml1_rq_dlg_get_dlg_params(
 	if (disp_dlg_regs->refcyc_per_meta_chunk_nom_l >= (unsigned int) dml_pow(2, 23))
 		disp_dlg_regs->refcyc_per_meta_chunk_nom_l = dml_pow(2, 23) - 1;
 
-	if (mode_422) {
-		swath_width_pixels_ub_l = swath_width_ub_l * 2; /* *2 for 2 pixel per element */
-		swath_width_pixels_ub_c = swath_width_ub_c * 2;
-	} else {
-		swath_width_pixels_ub_l = swath_width_ub_l * 1;
-		swath_width_pixels_ub_c = swath_width_ub_c * 1;
-	}
-
 	if (htaps_l <= 1)
 		min_hratio_fact_l = 2.0;
 	else if (htaps_l <= 6) {
-- 
2.34.1

