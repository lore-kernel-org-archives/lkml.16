Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69691F4629
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251782; cv=none; b=rCpnJrtpKvA6CPpEvvIL0RTyDHE6iGFuATK2zVN5qeLu0M062SGuekpbTUzkYghOnWLQM5DG6Q+wpmu+aRd1YK8KcT7S4n3mXhblc7gKGhPxhGN7aDq6NOeP8BJiLseo81k0q7685EfyC7Ls7HCHyGMmXWKpIV8LRMCTficTqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251782; c=relaxed/simple;
	bh=8Zl+NL5K7TzgNNpnjlyYIeVHBwJv8LNZuXY9qIqoXIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYgivv2M9B4bsLnG4MWH3dSdDfZIFlFoeUvFoA5RQPvVuIy/cxqD8pBRNOO2vJbw9Cv+V5FJFg/DKKSjTzWie7WGE8i1cbRV3ZuR1Ui0kv2xvHf+4fOuwvBFgTaDTvQhHCKfrD12YxzOon0i7xeiCT0/2McD4qtv4gUVqLvkU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnbOVNz8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HnbOVNz8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1382788b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251780; x=1748856580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxiJHc0I93PcRJQ9RbYPuxNVFGqDMtJLWv5z7mElW80=;
        b=HnbOVNz8wuE8t/4GE1ydHNSoxOOIdSuisUIy+bETuKyoDZRVHkP/wSdOCFWblAVQFD
         fBpnEWBcZoaIQl3ybIaK+6+YL8elb3Zr5sdsnaDV911nRfUYxPt3a+ljMQEUn9+ZZKmG
         6qt3z6CcZYhWpkQJPr1n5neEi3+PE30vMt/P4Ol5Oh0FDuwRBN5OSn05wTV3W3ez96Uc
         yrC5OFjcHZG5KoSAmtgGC/SEviJoMJvTVRQvF7pzJ5DUHwcldqmI3TuoMBrmT5plmeuD
         sktQj5JuCI0TX5NVzPAgox3XDABGI4VXaNFrcd9SyjZXD45qbiPcctQVniiNRH38F0vV
         B1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251780; x=1748856580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxiJHc0I93PcRJQ9RbYPuxNVFGqDMtJLWv5z7mElW80=;
        b=Zm/NqKQQvbp3SsR/qFd7wBjSiKXu2ap81jEoWNk1sr8OaLoRdTpgmVlfDPmCTcebXJ
         SbOp5/Mr2S1mxrYkfSxyXHEwozCGv0pudROVsD7270NQFcS161R76eT0YbPAWdmyhtLr
         rHrUEinUYsx2g0VVr3dB5O+6DUOx3vrTHtsG5cwGogawWXpwKiM2tCvBTJ8pxgNJku0v
         3vvOGi9Ye8qXzuKXyJImRQb82PtRxxKR0RGm6VkWMcoaBo5j6HtgOcqlPVYLxzNrGT5L
         El9pD+8oaGN7P67f7TTURKy6z/CAvGj5Wbn3KkWCBN5dVPCGggDKEhutNQPLsaRlvkbP
         belQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFlD3JrDuDiXXnNg/SajMml4ZnHPePGLB0ocgRUMvkb445hF6g8hbE6JhDeyOQPvRREYxzsrQrl3++xyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu07qn3XdGsLd0RSfnEVSUiM8mt93QV45plSZKyRLR2cFoQBeg
	9dJ5AYrFCUyNeFnVvEinpnaZVkECxeJ0GdJKTECIx7UKlb3dkUowVoSwfFijx8hp7/A=
X-Gm-Gg: ASbGncuS/QJT1dtxgmbSDfhV0Lno8I9yP8BauRGAp5JmUEawWuPslN+09DskWo7F+ti
	Id8eNDhVIc+nWjR//BUuAV8Hu+mf6KxS1QDjOOlk4YLN/DC7f98PE4gegKkxTg1Sego2T1Z4OkU
	cF48DL67TrF7sPSgdaE8nkQ7zr1/HXnfkkWIB238nnzfzKtUwyNDMyXFiWM8/BQI/Z6Rl66UOv9
	Oq9yugjVbWEzZkcsQFWzGzxe7pDP79zbygKgKkCinfLcdK4xtdXbIU4YQeTH/45pHJWYK2k2dT6
	4Jf53HcsZzNrVWx8+JeN55g22ZSWJ/w+/ZicVtpST+jlJ5+n7A==
X-Google-Smtp-Source: AGHT+IG4s4lub18hvTZR/olJPPXDFj8juc8FEBCk/fAf+7cS+u0/H1jTsmuRIZ9Oaffrh/aARjLBVg==
X-Received: by 2002:a05:6a00:a06:b0:742:a77b:8bc with SMTP id d2e1a72fcca58-745fdf7710fmr12201521b3a.2.1748251780015;
        Mon, 26 May 2025 02:29:40 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:29:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:28 +0800
Subject: [PATCH v10 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=9227;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=8Zl+NL5K7TzgNNpnjlyYIeVHBwJv8LNZuXY9qIqoXIE=;
 b=0mSRYSr5/nfePeIctQXE6jTeN466JhLIgO+KateeoR4MysagnPYjMbXVml4StbD0MB3UogY4Z
 Vgp4iSC44R6BICd+fwNXaQUBS1cvLKKtrCoB6butHWWvQz6Cp86aPH5
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 126 ++++++++++++++++++------------
 3 files changed, 88 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 85f585206218f4578e18b00452762dbada060e9c..47ab43dfec76acc058fb275d1928603e8e8e7fc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1562,6 +1562,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+/**
+ * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
+ * @state: Pointer to drm crtc state object
+ */
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 0bb153a71353ca9eaca138ebbee4cd699414771d..f721dc504bbbe3a49986239adee113bfb6790f70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
 		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
 }
 
+static bool dpu_plane_check_single_pipe(struct dpu_plane_state *pstate,
+					struct dpu_sw_pipe **single_pipe,
+					struct dpu_sw_pipe_cfg **single_pipe_cfg,
+					bool config_pipe)
+{
+	int i, valid_pipe = 0;
+	struct dpu_sw_pipe *pipe;
+
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
+		if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
+			valid_pipe++;
+			if (valid_pipe > 1)
+				return false;
+			*single_pipe = &pstate->pipe[i];
+			*single_pipe_cfg = &pstate->pipe_cfg[i];
+		} else {
+			if (!config_pipe)
+				continue;
+			pipe = &pstate->pipe[i];
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			pipe->sspp = NULL;
+		}
+	}
+
+	return true;
+}
 
 static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 				       struct drm_atomic_state *state,
@@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 					  const struct msm_format *fmt,
 					  uint32_t max_linewidth)
 {
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
-	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
+	struct dpu_sw_pipe *pipe, *prev_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
 	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
 	u16 max_tile_height = 1;
 
-	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
+	if (!dpu_plane_check_single_pipe(pstate, &pipe, &pipe_cfg, true))
+		return false;
+
+	if (!dpu_plane_check_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
 	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
 		return false;
 
@@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 	if (MSM_FORMAT_IS_UBWC(prev_fmt))
 		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
 
-	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-	r_pipe->sspp = NULL;
-
 	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
 	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
 	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
@@ -1194,12 +1216,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
-	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_sw_pipe *pipe, *r_pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg, *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1209,11 +1230,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	prev_adjacent_pstate = prev_adjacent_plane_state ?
 		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1227,44 +1243,52 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
-		if (!prev_adjacent_pstate ||
-		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
-						    dpu_kms->catalog->caps->max_linewidth)) {
-			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!pipe->sspp)
-				return -ENODEV;
+	if (prev_adjacent_pstate &&
+	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
+					    dpu_kms->catalog->caps->max_linewidth)) {
+		goto assigned;
+	}
 
-			r_pipe->sspp = NULL;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
 
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
 
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-		}
-	} else {
-		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!pipe->sspp)
-			return -ENODEV;
-
-		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-						      pipe->sspp,
-						      msm_framebuffer_format(plane_state->fb),
-						      dpu_kms->catalog->caps->max_linewidth)) {
-			/* multirect is not possible, use two SSPP blocks */
-			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-			if (!r_pipe->sspp)
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
 				return -ENODEV;
 
-			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
 		}
 	}
 
+assigned:
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 

-- 
2.34.1

