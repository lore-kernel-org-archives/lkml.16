Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F6A2C324C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934680; cv=none; b=TUpwpnJlMj40KyTQYDKBlKnRBhJXkkQfjnPwsOMQiq0khyCNWloWKvL0lznNsovYb/uiOj+QYKlDh+dqsYNBAtRYPc1bCUyez0EMMDMtQ5zTvMQtDUeia1MjzPJ2pvqe0V9PRof2mnwyaxz+BKJy9zikR9QGMa9JxOLdUxBWdk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934680; c=relaxed/simple;
	bh=i9jqTYWgdUcfVxledyCdB1fwWCOzjmcgPZJqlQ4gFuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eO6i3KaCVcji19Qo4T6kJir5JPPj0mqhkMda9pqKgdbSUAcAUupaJhIrx3UX97b0YP0lQsh1m05FzhDi+SwtsfAj8Ny7ZlC4bxx3j1lT6ORWwNhNUUj3YVk0CLj6SA6a2l/mGzQe5KccbD6e/4ZpmY+1DBxtRfIOhKeNwtLqTG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mTs8XGiS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mTs8XGiS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6079969b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934674; x=1749539474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jN7yZv9TsqhtqEO6BVaXQG7IQnYIAamV5YS7V/dpnA=;
        b=mTs8XGiSo+ZuHwzpik3n9ePnWBW7CQ5Ks6gSTTh5dQvEjzZmyliKIbUFYraefGHKau
         ReIsawibWR5kZhiqWa/ubpzgs4dOxvxuHZzTREWSovgR/SXy+nE7abwF7p3i4HIZ6QKw
         eEBGGaLG2SB7SZeqN2OcsUEHN960F9rv7oFMbhXip9qOfAvp1AgcCpRe4JNhocmloqXz
         fABrs9e8X6FTCzdb0CqImnKtlfl4HGCfuhV4epm5yVOZK2ktrlqCwnNjS/xb1SvcCIDZ
         XFuIHHzQ5EDuiX9nC7TbfM3YufH4yS0YuD4AFCWPdUV6ZIyZZzbhV80RwDnbFRybNmMW
         hJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934674; x=1749539474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jN7yZv9TsqhtqEO6BVaXQG7IQnYIAamV5YS7V/dpnA=;
        b=AxYFaSSCGbN4i10hG276no8dfVFzGDkB/ANFfMvjCv+UCsLFE4javL+aXCTzNWvlNi
         lqr3NUDv0hQ/mD5rUiMATvdZ3GX8wLTf5ThwsrCybq0tNJBzVttB3xG+vCoEnnDW8R/P
         g5wY1UvSIyIiuMPXIB/kIaZKuQ+X3ykQgCGk4GhQDwDCw7w4XV2HycgYRQmPwxaWUp32
         pIM8+IMWXPWWedKq6xHQeq5p6HhazTOkvli/BMeiLvIFlFsW1uSzI5TVnvd6af4MGOZN
         smPOsQ8gxqWo0vlnJSqSytobTIJp7bII2TLmeNYd3fEZiZwf84dvhvloNbO0cbVTUJqa
         sFTA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEyqkAqHB52fDq6olZtBPIVj3SCFc+gfwxlXj52ZyLDcG4el/gPctPRrA9gZRCwWno560EmtmZOl9c3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzRaxCQJs2piFi6hhjrQjTPtjyFtneuYkyT46rHbsrsOcdLpy
	DaTP/TBfc6+HUed6R0VqWO8gWflInHeey5gjWipRxEbn0x44IeL1K9SBZx5+lzPDJS8=
X-Gm-Gg: ASbGncsW/FSaRYIh8EUoae40zUHFMPA66tTwtzwYam9oo4Co4ZUFntWT9JUgTtgEryM
	0YXosl47PVsUljwopZuBKx4loh99vyTXIiFRFZa72y/F49upS5o0lrNub5XSv9v5emIisBQgbqd
	8WH/1btDEJT2sCBD6W4WQgfuscD9zBNG8FuzXjjiqvJPswGuEwrx3DrwPdxufZ8BE9BY6RW8zt+
	VO+Mls60PA/5Fr2dRk102V1ULOHcCDQeqIk1/dE1xt48f/p76wxBdV/FnpO5N0qY5PijghV9x0T
	hQxP6bwOmK8IiJqm75432ofuoxWRctee+Vm0rKrazZYNwF468Q==
X-Google-Smtp-Source: AGHT+IHNRp/pxqAr97mhS3hLnDjt40W4ov2FMH5GWFdVtHIsSWjMSoo10xFdHk7uT4lIY9bzg5DJkA==
X-Received: by 2002:a05:6a00:3cc5:b0:740:595a:f9bf with SMTP id d2e1a72fcca58-747bd9510fbmr24262396b3a.3.1748934674417;
        Tue, 03 Jun 2025 00:11:14 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:11:13 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:06 +0800
Subject: [PATCH v11 07/12] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-7-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=6424;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=i9jqTYWgdUcfVxledyCdB1fwWCOzjmcgPZJqlQ4gFuE=;
 b=RZmrXQjZu1p8w0/VpHCjl6zc1qTfrh/T9x69at8mXb0isNMzDekUhD09lzLE04EX/LtJW03Yu
 WRo0jBpH1WzDYeiS6817rQlQsvX9A2t4xB96GK1da+Z8E7TShXuXfAq
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 8cda5ba7f4042492d7c8a7e65960aeee51565615..e7f1b5816511b33b106f292541f8f5c966c87118 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -463,7 +463,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
@@ -1274,7 +1274,7 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	return ret;
 }
 
-#define MAX_CHANNELS_PER_CRTC 2
+#define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
 #define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
@@ -1632,7 +1632,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			seq_printf(s, "\tsspp[%d]:%s\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 175639c8bfbb9bbd02ed35f1780bcbd869f08c36..9f75b497aa0c939296207d58dde32028d0a76a6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7efee42943866e4999b0ca04ecdc67380a1b1d08..0bb153a71353ca9eaca138ebbee4cd699414771d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -633,7 +633,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
@@ -1160,7 +1160,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1214,7 +1214,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1347,7 +1347,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1470,7 +1470,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
 	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1484,7 +1484,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1503,7 +1503,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1625,7 +1625,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1682,7 +1682,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 052fd046e8463855b16b30389c2efc67c0c15281..18ff5ec2603ed63ce45f530ced3407d3b70c737b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -33,8 +33,8 @@
 struct dpu_plane_state {
 	struct drm_plane_state base;
 	struct msm_gem_address_space *aspace;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1

