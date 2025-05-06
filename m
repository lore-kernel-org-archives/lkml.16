Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD53284677
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546482; cv=none; b=njegPtxFYJEPRoQebJKss2DB7giK4phN96PZ+4xmt/Qx7n6OFDD4GVMm46DSCdKdla7YSYFXdE+zzySpw+zXblUaC0SMwCcHXxZ7/dywkLSUyaSihQXoVOvyPitjYTAA/aOa/Qu176BiwBdvCsMR4kY6iKtkam1gJWwsGgw/EKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546482; c=relaxed/simple;
	bh=p/aL3lRyLhuiXRZaetD8VgLDL3qdvShcJvN5F//fxjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPrDG9xmk4xHy840YJeg+0trWHuCOIfr6Ie6Z62hEYsj6f8PNL2Gsf85sfWIxRHSFrUaNUT15JezCjSHpNLS3/taT8oEKjLMWRAju6kT7sEsfKVcxncugyyMvACIAMCY3YjJDcU7tlgnJBwsUsuBe6SMgAFbHzp2yAGllT31dWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLLcYfEl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLLcYfEl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso605067a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546480; x=1747151280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxt4igjGW7kIkwK3pM9gIy1N3ytZL+6O3l4DQKM/gJw=;
        b=bLLcYfElT5EDQXhZ3m9a0QdqYPth4oUtDD/tC9LqtA8L90Je3K0/vQyTBet3k16PmM
         WNUgTQm8uSU1avYe3jexsvzP4v8aUeST5wGHeQZXPU7MnI/WsvNDb0p/3WqgZwW3uy87
         wCMmh9MoEMESEaUri15CFptxoLi/dKUvBVZZ9FnzaFuDpqzjGJ/pO2u3L+jiAoWWRpJN
         bVM2Xjtw2cpk2Uzpu2JNgwLPjguEGio1kqTFaC4iUIsBjEoKLC6qe/rjSoZm2au+DarV
         fPTBgoOqWil+RRPDJQGZcwt3P3Xvr7l3ux2lXgOAq9kZ0cyGerxpQdjjMSX9TV170aNM
         c/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546480; x=1747151280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxt4igjGW7kIkwK3pM9gIy1N3ytZL+6O3l4DQKM/gJw=;
        b=Jwl1WvjNFw4cu8d0RPWny5skwOw7etBRdcg7RMR81oNkELW2IlSiWh5wL/3DDm/yEM
         SKHDI47N8MbYmujFGNYa2Z/ECuPMT3nMLtnjJWCL7SWNxmWPpbd5UEABhDz9yR+06dt1
         4AzoiPwzvKcH70o135uTGXykjkieHhZUGpOQ1QAuRTohkFjh/ZqJWNVNwrKfFWLyTudx
         rhAy9yBvW8Qw11ve+DYfTDc/zVvb5g1xTakZlXFfAFbeLAlBU9q4H5E0y1TouTXBK0cs
         2gUiq9oVDM0GmlWGXtD6qjSWwvqYBiWsol3/Dn8b4o+8AZsxWWDW12Ac2hucnkvH8VE2
         gY4w==
X-Forwarded-Encrypted: i=1; AJvYcCXmu59q6tgSd7OwtTTynQL+fjNx2gTsr0fhlD58Siuc3ERBor6Kiz/ujxC8Vab0plSOG36wvxhzwuwubTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgeLAjdPTD9bitMyop11d6MJ5dHCqPgl0r9K7A9/Iw9YP5kMwL
	AHXFB39O4g6vI69CxxMlaEWMAgg9H1QfwPcglUL6FXUQrvpIpdCxbBJvdFelkkc=
X-Gm-Gg: ASbGncvyBBDAEn1qVC35St0/tOYky2KBp/pQYBmCYHqkpUQwztt1A1DJtNU09TyrZfx
	HTPmjiMrt64dNd+PpH6Q843FuIiZEKNdNIFdtFd3lHcqVQsecHQx5ITbSpACvaZ3i6WzAsMNW+T
	53hKabgtp+Ubbz8uwV9KmOEAX2T7L9m0xQs4YevGCNna3odovIaPPpEe1xQ6Uq8m7Mt6H/9ijLm
	epqSK2bsOQ4VQJQHi+6OJLm1sNZWsQbrcMHv+RrjVPbw4UuvmFsdDUP9BhTm8g5QCMLhMHTNazw
	Ukj6jhOXB1gpJ9ZY1564I1Zov5lrRidFcQ2OtQ==
X-Google-Smtp-Source: AGHT+IGb9+FnWo9267p0fx9BjNEIUzoXBumtQrk1tj78WuYav0rpIxj/FofGZuV9inH/1ziOSB8zHw==
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30a6198dbf4mr18334411a91.14.1746546480278;
        Tue, 06 May 2025 08:48:00 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:47:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:32 +0800
Subject: [PATCH v9 02/14] drm/msm/dpu: check every pipe per capability
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-2-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=4444;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=p/aL3lRyLhuiXRZaetD8VgLDL3qdvShcJvN5F//fxjo=;
 b=Eu02LrLr8B5tRbqz0tapuLHeVERr3KGsTPNNfTOCcvbI4dFAlxSJJiul1hzEsT4Uk/acHRoPe
 qL/UUJrq7RDBHQEHEyKnsXHUTKXLIq/A+4kVnxZBQHfMoqEBBWwmY9X
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The capability stored in sblk and pipe_hw_caps is checked only for
SSPP of the first pipe in the pair with current implementation. That
of the 2nd pipe, r_pipe, is not checked and may violate hardware
capability. Move requirement check to dpu_plane_atomic_check_pipe()
for the check of every pipe.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c303eb5212524e877129359b5ca98c..aeb90c287245d6aaa18b9f280d1e628ee6ed74f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct msm_format *fmt,
-		const struct drm_display_mode *mode)
+		const struct drm_display_mode *mode,
+		struct drm_plane_state *new_plane_state)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
+	const struct msm_format *fmt;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
 	int ret = 0;
 
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	/*
-	 * We already have verified scaling against platform limitations.
-	 * Now check if the SSPP supports scaling at all.
-	 */
-	if (!sblk->scaler_blk.len &&
-	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
-	      drm_rect_width(&new_plane_state->dst)) ||
-	     (drm_rect_height(&new_plane_state->src) >> 16 !=
-	      drm_rect_height(&new_plane_state->dst))))
-		return -ERANGE;
-
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
-						   supported_rotations);
-	r_pipe_cfg->rotation = pipe_cfg->rotation;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
-					  &crtc_state->adjusted_mode);
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+					  &crtc_state->adjusted_mode,
+					  new_plane_state);
 	if (ret)
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1

