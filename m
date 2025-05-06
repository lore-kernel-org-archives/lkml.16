Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4A6283FF5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546524; cv=none; b=IdTewnfNIwe+kyXLez8OdYm6J66Y6VipXcSA/pcchHj/1M3N1qxenXMCXSS3HjjAsFsdYoZndw/tP+xrRrAus4ybYsCGSpN1R4PMq3u+EmBNWyCY0K9DUHpdgDSori7h7psw9vHzZYKvPAbJ8+SsQUpfAGzkB/zVjd0EuSbBKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546524; c=relaxed/simple;
	bh=dkXtXCEO5Q6Tv9ZAERidu+cw1iHRZ7TImSor0/VGmi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNSnsaKim9Yb5h5CuaB/+F1os7LRIWH/qrDN1D3+bVB4HZAKyU86+UmSL3J5y+HQ4LA3MG26CmvzgXWOj6hJSp0Zf4UGQBxuZ9veV7dDcOFf7cefiVh/ydEw/qAln4iSfk0qRVTsWDconjxRpIQR7YmZsFXAPH99j/mg3m8m4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLemBsMG; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLemBsMG"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30a8c9906e5so1139566a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546522; x=1747151322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxbvSQZyP7zd+OjKdls9ttnVESv8uUgxFxtkpvZdxt0=;
        b=HLemBsMGnlPrfgbqqm3Tr7hWWl8gIbOi1kDX2BP6i88q9n7RLRC2ODKCh0xFbc4/WD
         4lJW7F6ZAe0YkWqcjnm2JNkBPFn11os3NMBvkTspnTH/GGsnf9q79Z4vs7kJlzPqoIGd
         ptcMmqIjzVbG/7Bi/v6e4pXXx0s/6vzsFJlWuI6K4xX/d9XV7AvsY5iZ+LN2QUHhkpjp
         4vHc8+zRzfjJ8I+NVjbTZZokBRpXabxn+u+SDAfS2sL1lsoqThwYcJp07qepMfYb4Zt4
         Yprah4He1HvhZDkbcg3CdzRI4U3CkbCEEY+GnEjnqiwClTkK1R7AJmSOEWtVxTCXUp/K
         w4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546522; x=1747151322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxbvSQZyP7zd+OjKdls9ttnVESv8uUgxFxtkpvZdxt0=;
        b=pETe75w7k+CPQ2p3ng4PCvS8zi+pgoQVwz8zfW3DpPEyQxhZq/GECPcCAwgAMr36fC
         jTzlLust/xFcUbej0zt/Ly7Vbu/+H4Hao8xR2Y9zCmT7sKzeBZxcoiTJyg8Yu2AgVtMc
         sQ0db+IIEx5ZdfoZSdi5PrGQKTF1ygGHwiCgi6MuGnSQwe+3tqk56/71UMYf1lN7xhkM
         p6IkvAmsmj6a+V8PM5g22Xi/+/02fIM8Of/mi/lKj/YKhVVFN+EtloPuG8nnIQsFkK35
         nEl8mt8JyP7o5IMQ7cTvHixaa+EsNtDWjxv4wO547ZqCBrVTK7qoYlvJLWj2ie93pIcm
         YuvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXijyFhIqrOORm/vC+cPN8aSVngDtbGch0Y901ibWFZrTYko2J1CcNupovg3be8WQ/v4wKkBNxTTdp9lXA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymiNZI9J9V9hGhsBZK9cglE4jOJmROyf+6/3j9AuW7O+6nGic/
	MnSOxfmD48WajDEckt2YuiDjR/bwCDtJ6LYcnS7mRGvEtzefYK44y+fo/US2A9g=
X-Gm-Gg: ASbGncsYqePSoWn86Mg/HSJpGphwMDM+FuEURHbh1x0dCROvrAvbL3H40j8j8CTkTse
	IPXk/1ahhQnRVnZZQSUL4sXPgGnzJ/+39Wfq7M1A3F3qJGCLwpZK0Z+P+IbZBH7JOLumtwAfGOa
	QqJv7cfPF6GPk3cqwfj7cfL4vEKrNpxpVMfQFndylrW5/LuRgzgm2ciCof8fs0WqV8mQocSEHrg
	lA6HCksWEg1dAd34N6fPrHhtuJTc24M3rT5xl1pvZsCUyM8QT3YV8fb1XKaWM910ixyE+kTAme2
	m4qdq/fGMD91ppWyi11CJW+Xz7labU2vqRPTHQ==
X-Google-Smtp-Source: AGHT+IHZeHCrOeq3H2L0fpBwZ7urndRGJ7zRpySXR+v3K7pTWa7b25ypy5G7H4CUfrtFq9IkZEngMg==
X-Received: by 2002:a17:90b:1f82:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-30a61a700b9mr19620258a91.33.1746546521786;
        Tue, 06 May 2025 08:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:48:41 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:37 +0800
Subject: [PATCH v9 07/14] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-7-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=dkXtXCEO5Q6Tv9ZAERidu+cw1iHRZ7TImSor0/VGmi4=;
 b=8ncQSdz+52Re3aTAnYi/3vBqAnu4RWjDskM6ZCECqqjaeCZnnsYHX+Ty4mCnhabGRwiRUktHE
 c5AvJsbIS1bC/cLbKchKTaZRRJMCSSvoRYz56sLLIKzxYscyo+Ucduw
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b0ee89ed7053f940d01bb55a8ea8de8ec5bc3462..095497d80e8a4168ed6b7b0a1b0f535bb9099d7d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->pixel_format,
+				   format->pixel_format, pipe,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 5307cbc2007c5044c5b897c53b44a8e356f1ad0f..cb24ad2a6d8d386bbc97b173854c410220725a0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
 		 uint32_t stage_idx, uint32_t pixel_format,
-		 uint64_t modifier),
+		 struct dpu_sw_pipe *pipe, uint64_t modifier),
 	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
-		pixel_format, modifier),
+		pixel_format, pipe, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
 		__field(	uint32_t,		plane_id	)
@@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = pstate->pipe.sspp->idx;
-		__entry->multirect_idx = pstate->pipe.multirect_index;
-		__entry->multirect_mode = pstate->pipe.multirect_mode;
+		__entry->sspp = pipe->sspp->idx;
+		__entry->multirect_idx = pipe->multirect_index;
+		__entry->multirect_mode = pipe->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),

-- 
2.34.1

