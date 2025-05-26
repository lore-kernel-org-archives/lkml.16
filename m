Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B951F4C96
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251762; cv=none; b=p1bqR8l9uzBq7oDR3mQ/OB1muigPTyk0mOT3rUgLz3ALfap+FYUN0J1LYqDILoV85emmWuoZNy5pccj1HiqTS1hxgeL2822f6A6re6X0/lyMKGYJuQWjG3WyDiO/lZczQT/Omth2sKpN4ui3X3rI2+dQnFJARr1opV9SJgFvbG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251762; c=relaxed/simple;
	bh=i9jqTYWgdUcfVxledyCdB1fwWCOzjmcgPZJqlQ4gFuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebozdHqrHLsCoBmAYeq+MiCPYrmW4+GqoYfJkhK/Vbt4dUMxtSRsKopqdOqbvCBNVKQ7lkrSFXL4ff2KDaxCK9vzs7fKptGzXpfQZNz1GQZ0RzsDoFyEchl5/1YcpQr0OERE97Z11NBl+Gv3IWjtLK7Teuw4XRQJOfG01La6VPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhildfbD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhildfbD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1961361b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251759; x=1748856559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jN7yZv9TsqhtqEO6BVaXQG7IQnYIAamV5YS7V/dpnA=;
        b=GhildfbDjyc1c2YavaiWfEN7R3M3XfdWD3h244lKsGTP/dRejImB97UWMnretxU96L
         um7oL5rF7CCrVjKDsDLbVK8dHhtN9DkW4i+hk8AULVhg3mpOiMmDZIz2sOMsdLccJ83b
         GWn+OPYGTM+fBBpWZupMjSh5krPLpvMZKoSM3Irvs5M2ekD32iV+ASMI4E4YpEx2Iz57
         bz3/vr/1rtrDsm8iL9ed/e3g/5YE9hYn5aK86N/DAml+3Ly0pN69VrRsKNaLCojK6EVU
         85WUlGIivdRGUe2wu+DD4e0v+5vtfHPIdlf4ImBdb0sZ0onSeeiPP9C9/WYVpsrJe5+Y
         h1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251759; x=1748856559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jN7yZv9TsqhtqEO6BVaXQG7IQnYIAamV5YS7V/dpnA=;
        b=TBUeeurlqF0cA+xuc2dNDykMsBDQvALzaBq9/WPWJc+gMXN3vhYmaNR0ElgAQU2WT1
         pNCLatMEk54YMwXbtsIGZH89x5O3L1/I0j/d8y9nMLFp2FkrncVkCbwpt9W5PdyDyqWi
         6Pgk0hFGihggSI/+ayey0fFmEazVpXmeZSUdBG7RX+q3ivwmVwW4QVmGVphFbyhGnEUY
         BA+bYX7oNq86sWpLapugAijupjeZvgoYElJjZDgHnUpZfhLy4umTbA1emi+n+rvkq658
         kIlFdSwYoP9LnyE6xnO9Wk155bTfkHpn5yZvUvwS8WRBgIfkASdNQFGioGNceSFqVJsk
         hbrg==
X-Forwarded-Encrypted: i=1; AJvYcCWiyv8g+8LZ/7+kVKfQUsTDgaWn1pa+QKNa5BBibBRq/9XyC5RqI9XRZ65yiQeNx7Qu/X2sv57/o20Oob0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSVEj6iwSwfrpHPmLggmhOYJy84H94xqPCFN3TFIhQA9hERby9
	VzP5JtBmM1spcoiCRbtPoUWqsmnLDboPvQ6x/0PardeyNEVlY1056kt20C2NrBvUwEf1CKxfUCp
	o6t/s
X-Gm-Gg: ASbGncu5zi+4WQDWRXrPbW9OSnG+cDfkAXec3pgWSxrbzLyRcQdwI7nGnRxXz7X0J/L
	mHCRfVq5nSXf1QRDrrSXRBdqua19Z1UlwupPLxyR9HfXHknU6splBkOkJY+TS3HJOhZpqWKFuLu
	SB1vkmPWJlsN4e5mwElA2ZkfYX3Q1OZFwhOmRTJyrOqs0KRv4dEb8GFDXpOxx31e64lKLS6a6CF
	8H6P7d8nwbpCp71v9esJFNTrldE27Yg41Zr6LKGwwTwlWoJtghni0ERuzB6rnblKiieYvCEniGM
	grDO4kK+GY+AvD87R4ORwbPqhc4RtGfuo+BN7llWBiDYrN9bVA==
X-Google-Smtp-Source: AGHT+IFDf/uJHX1F4k2DUJw2vrl0Qtn40RHap2sFuWwuVSHWe9EJL3pzA1E/hw3wNZG2kGha73S28Q==
X-Received: by 2002:a05:6a20:3d8c:b0:1f5:8cc8:9cc5 with SMTP id adf61e73a8af0-2188c37d595mr16009508637.34.1748251759637;
        Mon, 26 May 2025 02:29:19 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:29:19 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:25 +0800
Subject: [PATCH v10 07/12] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-7-5fed4f8897c4@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=6424;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=i9jqTYWgdUcfVxledyCdB1fwWCOzjmcgPZJqlQ4gFuE=;
 b=kLI+R2uvCNn1nFSQk7uP5jHEp4bUe1eHUuwvikOdNpzsp+nTkAwFw90544L+z7U3/P3jmYG9d
 pUKd0D9el/4AZWkpk+CLzG7jnfv5e/5OwF6xx+SeBNxZUencE+/W34L
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

