Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2178F1F4198
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251774; cv=none; b=E/l/5KIZfeOdjT7ZzZycBwlwZHUywjn8rVGudTvbsSRXSbeYOth+brTR63JCBp2wrJbzPKisrYyDeJD5/SlaMbT7opcu5jU880mIcT1RVrSprEtzRa0BO5J+2XgB5ccL6eEZq1JAkgdvvDrTGRIPIiyhV634GPK4Y5fPVnprG2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251774; c=relaxed/simple;
	bh=Z+hYtg2N54oWb31O//Qk5cgPs6uNy0350+rWTK60htc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/Fd2rgshcdto5zUZ185hupgIFg1QPxlZmorkyqyIZQBz2q8IPq7T/CoMoOHKmLuuZBvOhxu3vjC0ian73uPC/uS9lbkFO5fMrIva6sEg88D/MkzeKUCBIbf+Zd8oWAkvecGIQJvUs2qzyo0BXEO9hLltPsSu3tKETt4g/Ao/uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SON+RjG0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SON+RjG0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73972a54919so1469286b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251772; x=1748856572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6aNf77dZMqvgD4x/cyfNBUYMjpneTGPfqs/YVhGEJc=;
        b=SON+RjG0XYvkAfw/jG51HlkoLI5g41a2DoAI4vLfv8rdK3L0qbVfYSbPJqQBMYUEbX
         J8rAJodIFlwNqLrTZZl/TglpDPbvGqNPf32xqEAhH0bnLh3pwuMlApXd5QkA2kOvWSFj
         umcYZmUFvKkybjWLPQsM6LOtp+fl5nhF4L/zqZ2YOsctrN2qC9iHdwk23MDjQS6DK186
         IoPqr+Z5rDmOqacpDA3iglCWVvcVIysi3rp/jsuLYAN2gf/PZmP0ipkDX1Y0JLaT/vao
         l8laFhJogt3by0eGR5Ox6Vzwwxob41oLZRAbs+5ktw1pg0Xwt388WCX738Ilf6gmXH6c
         9b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251772; x=1748856572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6aNf77dZMqvgD4x/cyfNBUYMjpneTGPfqs/YVhGEJc=;
        b=KQE6reAKir2p+6pKZf7P6R4D0hbjAr6a/4F77UxFInsn4qKUDtnzMfSl5Y35NIc3mT
         zFsJBkDDHRSUJdiqqvqyEAuao0TvTRV3ClcP6FVDaUnkazPszMfOnAiMPgfGTfQdzvpS
         8T6xpy7Es9DbY83SrwHWnQCzGmz15V4PKMyYTzJ4Yf5pfXUwsicNO7TMiHHua1zhPB2W
         wtpKC2HxalB5cuxkxrJ2LGHQ1ieJMjyPqZIRjwg+IuhIpsbIZfjSYQs62OFWGUO9/lL7
         wyyBRsqlm1Ck7UmgGusO1We8XC5FcEbFX3HNs/v814FMna/WYZNtGXDZBZKiyioVQI1E
         34tA==
X-Forwarded-Encrypted: i=1; AJvYcCVVpxVmRj6krPfql2+l6dCvBIIFEJAlWrUbi73r26nGDTJ2mlIDtoQShheBEfKgorRVulLJP/b2uW45zxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbTqa1y/SyRWzLYQTozsDbF3rwNFXrgpg+vzMSBI23ahtXMFTI
	P0nmOJZb5xQbgIIauU6I3+0Wvcci+m5QNMDQGjiSRuIf/B/QsfeeJMSy/b1NwQEbicw=
X-Gm-Gg: ASbGncuk71gotQ97Yht7dl76IP7r2nBpHuCHK1YBjDr9bNcpKSRG8C7kfcOlW3Fubf7
	QybN9uANAtfjefFtatw1vJpNeJEBOS8sNnJVL4TpMcdvGYQrZyFui4gomIP4BtscqBeRFpAgNJF
	iFwsp709yJXhz7qXP/6X5cxy6HwW+8aXfLoRHfd9EAfN1eXdNuHlxOL8HXbfjdc+hnDWd+6YHjP
	IPK1TjFxafJ8hGa5a8oumS0GYh/L6MFMZ8jPgDJoiccdTWFc3Ov/aNub2l+xplN2+Zh66XCduBb
	H2/Dn/gkPHerAvL2rTBkXIg19cgC+YamYHOfapSfZ/FmHAKq1w==
X-Google-Smtp-Source: AGHT+IE7kn3FHZ/apvKGU9XaDEKTLsiY5A/yM9xR30w9VSJoAZ/PD49cJrGnxTztICPli6+rk8J+dQ==
X-Received: by 2002:a05:6a00:1381:b0:736:339b:8296 with SMTP id d2e1a72fcca58-745fe035fb2mr14213707b3a.18.1748251772463;
        Mon, 26 May 2025 02:29:32 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:29:31 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:27 +0800
Subject: [PATCH v10 09/12] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-9-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=5256;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Z+hYtg2N54oWb31O//Qk5cgPs6uNy0350+rWTK60htc=;
 b=6XFKw97UDC36wcA2CzOIpTP20+Pu6l9OU9emHjZkWf29fJT3/SXGjCajrd0PuuRvNiZ1hIk6K
 iixFzjkwRvaCV8vZ+kyoWjt47klmSqFNq4+XaJgfwSg9kykGHBipYSz
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array
size STAGES_PER_PLANE and blend pipes per mixer pair with configuration in
the stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  3 +-
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e7f1b5816511b33b106f292541f8f5c966c87118..85f585206218f4578e18b00452762dbada060e9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -392,7 +392,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct drm_plane *plane,
 				       struct dpu_crtc_mixer *mixer,
-				       u32 num_mixers,
+				       u32 lms_in_pair,
 				       enum dpu_stage stage,
 				       const struct msm_format *format,
 				       uint64_t modifier,
@@ -426,7 +426,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	for (lm_idx = 0; lm_idx < lms_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage, lms_in_pair;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 
@@ -463,15 +463,24 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				lms_in_pair = min(cstate->num_mixers - (stage * PIPES_PER_STAGE),
+						  PIPES_PER_STAGE);
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, active_fetch);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   lms_in_pair,
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +512,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -518,9 +527,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -537,8 +546,12 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * stage data is shared between PIPES_PER_STAGE pipes.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 9f75b497aa0c939296207d58dde32028d0a76a6d..e4875a1f638db6f1983d9c51cb399319d27675e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,8 +34,9 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_PLANE			2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
+#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1

