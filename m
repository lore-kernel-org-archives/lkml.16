Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E94268C65
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934642; cv=none; b=kRRk+6IPHh/cArsS4thaqQw32WORDHQHng23C5YUk2U3EzRAPRtIAEyZTzpuqwMJZpJR4Odn14ZdyZaAdTVa1Rdp9fs42Rx2oVbIzUBTC/GH77BUJCISfWDhJO6Uzd0UBNQMy0xMM2ua4rPGCZTj04JLQlydHy3ZPzAP4NKGImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934642; c=relaxed/simple;
	bh=S7+JCdaVrPN/DIMlTCVGutgCbXcGk68o1VHEmTYxOSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIlUeKrGmnMHpvytA/HCu+oy6q7SUS1OP+j5cn4z6HsTL+LLACVtf9mZLokDHYXFJ04+rO90jI9cxuifshRkku6B0FAs+HnByifwHVili6IzlViVqXfeTcrWoU4awbAsdE2AKa1TBebBU+aAyJXbttvhA8OaDhM9ij+E72Fby+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddYF7zZs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddYF7zZs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4319982b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934640; x=1749539440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
        b=ddYF7zZsVYfN8j2SNgVWb2+XLqfqcqQy8GEAUR4UFOQlViqu0fNS+XoPsXixlLZyJ/
         mU1ich8qQmW+msIXe76ZzQkhHD5309Y3QxB+BWlkHhd5G0Mxs42qA0Rhlf+EDuVgBL0N
         1hioTnwPucErluIrP0LfBWjSzDxWDNnkp9tZCXl/r5faZRooo+7rwgNg1lekme5bdrRo
         g9BiPPXEcf3NEMZNQpTA/Fxq6B3Gl2zmD/1BSQwutPYR9hs7ozkIZbzmt0LPC1Yp3XBn
         PuhiIfvynRbJ8scwNox4x27iS6LcY73SNVhqZZWH+dlpd892KLaj8EALW/AR794asNuT
         bDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934640; x=1749539440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
        b=wISwPo36KxbfTPkjYfOHKSx8ODrOw84huolu2RMSM0r+OnPtscFM/eObUBMaHrHdlH
         7Au97BTD+A+q0DIeJgoLDx8CBS4PZiEhhAuUPcBTA35YfOwdepv9i1VDWuQKth7Rox9d
         Lp0bjJV7iWs63wymxz7/dt7wIqemgvmK65En7b0BuRYm9Q0MmyU0AILTvgD4dZrVY53y
         T37Jrcdi2xKsaCOeLg/Nq68FOFt47LEiUA7Qk7Lm/MgeIINoLM0I5F5rtBBfQQPTqKhd
         5cjNishPGK3TIbQ2eg+uKEugdgh1Can0c4CURp62POtqRUhjAEWwUIaHoR5sxPGeOS5U
         tVyg==
X-Forwarded-Encrypted: i=1; AJvYcCXM2RM4O3nLfewRinA4tmGI3Re891kSephSfryQEvkqKkEzXTXQVX7GUP5Cyd5o0spd+k23BD721MgfDq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaM5gbLFWXbmK3ySDaOmhOy0FFHQjFZADzD2iaW50TYl4Q56Th
	8OmhjvTyW6YV8q5EiGyEdANEa8VJh5YybqEGE5IiFImdZeJjt8VmySuxNNsUxEgaxbA=
X-Gm-Gg: ASbGncsnz+rkNqXS3rxHur+1jNIgJIRigGuBek2b/TG27tiuJK+Koz6TetmphAkg4Ot
	AxGs2BRLXohyoPCUZTjznLkG3NUBUGnoHlfTcO/JyVLa9EPNeF8IpRfs3HTfd4irZUhadfNNdQY
	vaGSiODoM8mzUhZ3q/r/gtxjXKECm/zlSlHxV1NQxV2hgP3kMhzCX44Eyy5Bd3q4qUYYr4CLhS6
	3Vmrrx++oGrTPLZfpYIIEiNr8ndv6GbMFrqvTFERowMHWiktTPPIkFyvacnMHchpciS8d0eHq6I
	fCzL2eFAJsBA6KrfhK46Z4rRp1os3hhRvBEN2e1smU8IHhHxskKloWSdfh+1
X-Google-Smtp-Source: AGHT+IGzhRm7yCbJkZmMOYNmqhqg7WjLaJzDcNMkuQQ9cKNvZstXE3/8OZNtphp+Z/UVx8De5OFWBw==
X-Received: by 2002:a05:6a00:1749:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-747c1bcb1demr19677936b3a.11.1748934640332;
        Tue, 03 Jun 2025 00:10:40 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:10:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:01 +0800
Subject: [PATCH v11 02/12] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-2-c3af7190613d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=S7+JCdaVrPN/DIMlTCVGutgCbXcGk68o1VHEmTYxOSE=;
 b=SjZQ7raLn0cs26/PX0rJbOfm9udILhDAvPUe6OQ7Ops/duf02VCDnvY7zWww3qoXOsuGJc2d+
 p9aBR8zoVKzB65IOiLNXkNu9DsFizXrUaOo95xyRjU4bvq4Poszgi0E
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only one pair of mixers is supported, so a non-zero counter
value is sufficient to identify the correct mixer within that pair.
However, future implementations may involve multiple mixer pairs. With
the current implementation, all mixers within the second pair would be
incorrectly selected as right mixer. To correctly select the mixer
within a pair, test the least significant bit of the counter. If the
least significant bit is not set, select the mixer as left one;
otherwise, select the mixer as right one for all pairs.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90941ff4104f620d1f4f18ec260418ee59dc16b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
-	int lm_idx, lm_horiz_position;
+	int lm_idx;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
 
-	lm_horiz_position = 0;
 	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
 		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
 		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
@@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
 
 		cfg.out_width = drm_rect_width(lm_roi);
 		cfg.out_height = drm_rect_height(lm_roi);
-		cfg.right_mixer = lm_horiz_position++;
+		cfg.right_mixer = lm_idx & 0x1;
 		cfg.flags = 0;
 		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
 	}

-- 
2.34.1

