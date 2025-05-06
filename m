Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C00283FF3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546497; cv=none; b=QVCiotmpuqOEQmVyJI2b9yDjmH/0i18jIVapNJnphRyBoiWOLdleDfLcBhXAP7u2rbU7oYmQqaRZU7zyEX+JN1I9SYqaFJDiTXL4lvxfSItCV2b0RdjwnBwtLDNw030xfgvNs6480GN2t0yQYtUWr+y5buLF78+MsOoocWtXEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546497; c=relaxed/simple;
	bh=ElZgntW6cVR9qnlks4TCWMj4wphRN+VzmR8acR2dHO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=At2zve0WVkNoTa+Mq/FedbY6afOmJhpLtSMk+55o+VQNGzK5Cc0r6z6gm7XGTLIFIkHLGuamKf8VqtXb7GQYFJPmPbzYawCANsVTkFbz1M9s+azpGIQfQlp6PaK/4SIiyJHa7aNZWt3QbhF+YzfGGMIVs/ASUBwxHTF0G1NaVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6+dxfiI; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6+dxfiI"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so3752065a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546495; x=1747151295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCs6mQa6d6Sysv16lrw4i0rJKFis740t82vRQM3M2ps=;
        b=o6+dxfiIEXgwKea/tTcdTCGfmQJXKhsOfj4AsWfnd+IMWCO5FOC/5PWPf1TNBbt3Kh
         LF1Q9WcL4zC/sdc/SodSFMFh+cc5d+2JR6spjKa6h6SSl11orYWeK/aIZAslwR3wXYpq
         gWLoEcsvbhc7FCY+EKuXCeZOhHfpWudTVCm0CXSothudQBFzbBm3iJ8LHaZvJoc/lpJV
         IlhoQIPE8+ZN4uck4V8whX08N3HfzG6FYNZPRsPLWA3DLKQd/BFD2YW6Wl/SdAItaVYb
         RMppRR+nhVkmduTLFiuq6VcsAi3GIkfRW9zP6EAFhAUWf2MWQ9AkrDgcZ09a+mJ1jype
         otTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546495; x=1747151295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCs6mQa6d6Sysv16lrw4i0rJKFis740t82vRQM3M2ps=;
        b=evkBmq/0CwZKeHqK4KrwZpuV2b6Hqjk/a5dgisCSDOc5YMf6Su+ADEPgbV8eOgvFED
         u/l4/KOHpHhEfIgrEWISwPBXan8SkP/8vSavKXvQeGhSiRJ7KoOFTuGNUbTVuwxxIPVW
         F0Ki3q3hxNaethT16y6cysG3Hl1rGaON6qzcFl0bfVMmEk5iX95sdDo7yALt4SEtZhFF
         /fy82k/uYRfl9Wvjr0ojaZ76m1+It5d9FxWdBLfpvgmPDgM4a2IvofeavbuKDmpoSPLb
         z90d2bXKNH9rMcJ+XlSsMYxyqY5MkjgfNYFrq8pXvJRCHF2ar1iF0VyTJrL2DcYvcDfV
         Io0A==
X-Forwarded-Encrypted: i=1; AJvYcCWno68vbOWRBoGNxyJJDk/k6oRvuAiket/f0R3eI5xMxcDHj1kO1yTDpeaLyeMmWuSk32j3Qw+yBcXX9ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPAlwweNPAQX3DNAW9w0rqXN6o+8n+z4XQ98woaQDM5qddYm9
	eQpkpiDhMCiHqcMotf5R6kjpK76RLEUnd3efjI1m6pJ+YA4c6dsvE5luMz+3LMo=
X-Gm-Gg: ASbGncvIS1VWLLGuvwVlj66ZGoGdVUHmCiAj3j5hhAqGiYJCCcsPrSu0cr58fR8+Dsh
	8GWSkKIIatmte/5H33pFuND8+dvkhb+Lt6uEXl6McoS5XI2iAkAMPvzb8LNLZdJnLRo1DAnXWdk
	mUgGEW2sho2lrq7t2zLPqmNSIMhvCrSp3esZwK2NeG0Av7anP7tzVyNmaqM8yOSVwDoc6UkFSf7
	zNB/d10avzYUYtGwf+gLKj6/fVIDhXqyl/0FRrVGXyWIe8AzwWDg05XmrclVXNkpc464bUro/uH
	Jj2klfQ+/nTFvZno1ny7saQ16xPMwPIZfZ8dgw==
X-Google-Smtp-Source: AGHT+IHaKwKEvXzLTqTr/1A7MQN4Me4XT0ed1TOsVVnu7pipcnmoLBioOA2O7sPAGBJ8Yn6aH3f1zw==
X-Received: by 2002:a17:90b:2741:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-30a7feb391dmr4817890a91.35.1746546495150;
        Tue, 06 May 2025 08:48:15 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:48:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:34 +0800
Subject: [PATCH v9 04/14] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-4-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ElZgntW6cVR9qnlks4TCWMj4wphRN+VzmR8acR2dHO0=;
 b=WurUww9qTP5NJzjw7DKmnANRtQuR6CmdKjbio9SjuZbzLSg6ZoBF98Mu+izvbv8VkWc+uLJRw
 /pltqUhwsF2CUO7V4/FlORBn3izCrvO6BXXtDHddEqkSkLhjfyvokQZ
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
index 0714936d883523e5c53bfb42f932234db76c58db..b0ee89ed7053f940d01bb55a8ea8de8ec5bc3462 100644
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

