Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A8268FCC
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934663; cv=none; b=YyciQVMcyA5MPMs0sgMJnUjZ/WLYZKZe0rl6BRXAxWitT1T+78bUgJNJsOrXxiKon4hf4oh/Pin96MdkOqF+Qi4wmsyOMqj77gBh7M3EjFQlclvaEIrEnR+FRayZZWT/Ox9bNfXYX8IGJ4o2xI4QW1RSBsr+z6yiQaLDA585+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934663; c=relaxed/simple;
	bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVyL8LcI6SuCWGzSLjHTttZ43XzZRDG0G+TodaboEuXi3XvEf+GrXp9zWfkdaR2MPq30xi0RwMPoVSqa0pjtyO7B26At82aaGBj1+ItWJY42lp27KkH18KApFgkL5lQ2ZIjFRhNfP8rbCZ8Szp122vxZ6Fp7Xb+7hJioy98xFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cs/IBO+R; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cs/IBO+R"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3925182b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934661; x=1749539461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
        b=cs/IBO+RX39svLZRUr+fAh0lyGvWvMYPUP6dQa077YjxCWwEh6bKDuP7mm2l+UCxVX
         FoOmv5krcSBh6AJPyVq2VXFJHL5Bug3o8A23d7ofTN3A50YQIYkeVlq1cDtlfrdC0B/6
         8lFuJFF/QuMnAir4TD4WDoWumi5YEYjIMXfCenUEng+dXMirNRsEdRJssTpsQY9sx58w
         hLQ6g0d8U0Y1MljM8/yx1pz+6q+AnGejEMyeNiC6j3GlJQtiPmXGgfiqdUqPzg+MPwVN
         MPeHWrmZaeD7kQ8KtUharX7ZxRBMNjwJz/KiapciUfi8ws617XwhwdSbDw3LokpQzV7c
         XfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934661; x=1749539461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
        b=sIcDKJZppufHnhOda6AKgf+bBE40Us7gEu4LenDfspuTW0EYYXm0rVskGsqEMVcEAP
         XRMzOvR3kDKP279b8nLAnphRsuSOzXI8noknnxCVapdvJDHzKfLF1G0qLdlYCMg6BpIc
         Ph00MOuNT7k9JfP+lqnCrB14ELm3oIwbWni+Hd2GtClpVAEKCCd0AeyovWpohm+JrPAC
         asjX0OxrRwDWfutWhMA/LENB8IoGW+lvGhMelTa938SJkcifjmDCnYXY/0woJK5/fVFY
         raANODP7mhDOox3/LeSPZ8S4xM0R1slaevVjt8BGfSewBVH/xKjHChSXzOlbXmyhMbfc
         UxhA==
X-Forwarded-Encrypted: i=1; AJvYcCWwTsLa05VuG5zF9aFc0eFf/JNCCA9o+hB9SgZH5ylT9HBiFsWlkNSXZvUXLPfnF8ReHE4J3YO24kZmjN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dxw21bY/jmwNnBCwlgrF6cK/Ew95XWHmXIyML/gbcGsznsDj
	ZgNlus48YLu34TprD2lwrJHMpuMIJz+4Bcn5zfoE3zJJrd+n6dQ1jsUINtwmCMXiJUk=
X-Gm-Gg: ASbGnct7rdb8LDlL/OImZaYfoxaHPqcTZ25TYaHuJ5BnBQ5Kq5RSOPIbSB5RJrw3wvk
	0CVCZoas5bzZaY4MvWt7FYOsHESRhcHY5bNPl4A8WmoVTyKK5yWe7qemq+2lJ9WiOwM4J/+AYIU
	KctK3LKevSkwk+bLMEAjXDW1Pfj2PTfrrc0RbSUUT6+UDoES8skClzPmTmY8wYYbMI5BMuqa9L8
	i+1HVoaZR6Nk1Uuwves3ceOBgchexjtf4kpNiBAlpgFi+ll4SEPRXPgUvHsBuX5PTW7vOWC5lHg
	no2txzINZui+MlThFOqXTRFFR0w4zrtkjs2bSwObxVIhfiO3NA==
X-Google-Smtp-Source: AGHT+IFjWCARHruptuJVLmM8AfVvbtePqSODkl82sJOlhsf4UkzXWJqbDaCd4kbMemrBH6D23IqzDg==
X-Received: by 2002:a05:6a00:2e12:b0:742:aecc:c47c with SMTP id d2e1a72fcca58-747bd970f56mr20943760b3a.7.1748934661240;
        Tue, 03 Jun 2025 00:11:01 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:11:00 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:04 +0800
Subject: [PATCH v11 05/12] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-5-c3af7190613d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
 b=lCfGlNgdftpf9pXQpFuf+RZ4PCJy6x3Jo848+yn3e5YXK0pb/mRGUH2c14Z4J9uMc0sEVgDlH
 WCpCkjTvOWYBUB9AiL/tTqrn88WQn0PQQixCWWYArolB+ivrgzrD8yV
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
index 90941ff4104f620d1f4f18ec260418ee59dc16b2..3a7e030e1241a5115460a1e9d552341f8dff7d85 100644
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

