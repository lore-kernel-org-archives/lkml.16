Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC38D1F09BD
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251727; cv=none; b=XUylgQ/TZYuQ7cnpCBi8Gx6GdvCUJd+HOY7OsxQfBohXD6OKdow7ryueugRaZHNIARqaBcZsTLAJHRQWzF4Fr6unRiFn2/ZxHzaUhqphTMWWEork4oAFgIbPctkZgZZYDqFRc5yvnMkUBmqGzZH96d6ozFShhRKxaFZZ1t4jKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251727; c=relaxed/simple;
	bh=S7+JCdaVrPN/DIMlTCVGutgCbXcGk68o1VHEmTYxOSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnL6jHDsWR0heesEFZVqZVAvM4igoDuTz/4meUOAVRs2qT5UmQHkPQ8wJobnd/qJjZ5NkSDBf9V6GgieLpkzHu0pvyFRIYfJtkdZph2lDSG3UDSQTG95R0pZWxnZqzo8eDOQIQ+kdmK78nSEiDwEqV/B6k3DElKHN4YeQ7bYDos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KC1w2A7X; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KC1w2A7X"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742b0840d98so1292891b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251725; x=1748856525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
        b=KC1w2A7Xez4VwSo6H4RVYZ8p4d5Gtm1MAickXRdhxCi09ONeC43I78kMS7CoxJ1rTK
         8Waom8H0CH/eb24bK8BFWdHmiYNKD2wo1CtAp1Rsj2Af3pgq64c8KcGUkbmHbjKtjHFE
         +ZEacl8YwdeHGKp3amcYY0hXqYaXroYANiyD3NHHr2oKu0zHmon1gEnX6ISymBj3CtZi
         0hKsemZU5gsXxSxb62J+RQsSWdZRsGQymGug1C1dwUENqBZf5JTK/dFKr67kQnWyFsaF
         wdV0GtGhVix3APvBcoN4DXPeCsg5Tx9Agu6F6XYtQx/wZl2eioTZPRIw2yI+zier8A/4
         FjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251725; x=1748856525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09EQIdwbqPWaqIZsSaoyN953CphfLgGdEAZpUMvdFt0=;
        b=uWrczz0+fcbqqiA1rLXmuDpGw2b80Z4FokCJZHCJ2bG+lNMwKi9RLZtxWPhrk6SOjE
         /njXoZtmFQlu6D752MrQNuUl2+XFc3TVI0ACWExQokWyY/DaRJyhx9beSV8wpEWubQUo
         esdWn/e1JAl+iuZhtHUO5yriPBKTU2agPoCwMmy+Y2VQiQe4aUNJXuVVfhqQCHIq4esR
         +GotRyHPZySqIblCvr7M2CwsN2ZTT9O05an5YWBdMo2m1ijHix2nbX63H6YwL+b9PIGA
         Ct32DlesIG2SuiTwubShSGdaOhHHO4Q2nFnHyq8OyowlHgIKJbXwv7HqfY/YEUKM/ljq
         9m/g==
X-Forwarded-Encrypted: i=1; AJvYcCX3POEKDvRxWwAkUHqZS+c5Ofh5i/csaBcdMePEa1ydIpbYJtvJDWnKEhmqh/fZ7btizEuZbQTWZ/oScZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObJ1int2BNYnDbIx4gG9sLpCBX6hxG4KEJUMifiFBtBzJtCAP
	oq0T6z6tuC5H3b1vkKRhXdYEWq7rhjkPGXbpzq6TD6rvfS0K/LkBq65RaTlTp/ZIKVrKuoFds78
	+HIo4
X-Gm-Gg: ASbGnctIA2fFf16ksqmpccciIFLtZuVh5FzmI88KpCIOXAZg1YVx9MKJqp9+WGXJcoT
	OIHpsvNOGMF2UUopqf/KIlm7qWkuBBu+xmN3cwIY0WHh4FG68JelSm2zegWpav24jURFR6eGUkK
	xpypdoy6qc/VqLB7OclphbV4io0iIufbfh/dqkoeIBjcfI7AJGrXc1n2vkXyujkLbtKhjgf1oml
	x7ZqkwPWjap5TegrrC6N0IUu2VSHKc/8MdfrF+LOR8k+JRljSoDh4UpnMmQGI5DX5MJxf5JKVxI
	JAh6+oBo8cnkjw9dW7mK0wykxwdhaqoPwKt0Ig2TvZUQ1SCfPA==
X-Google-Smtp-Source: AGHT+IEK7rjKy/mvMPI79Z4WD0PENogcKdMFyBxYzHit7/FRHxn6LqQKn7YKX9/af44617gled9kLw==
X-Received: by 2002:a05:6a21:458a:b0:215:f723:81b2 with SMTP id adf61e73a8af0-2188c291d4emr13919461637.21.1748251724931;
        Mon, 26 May 2025 02:28:44 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:28:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:20 +0800
Subject: [PATCH v10 02/12] drm/msm/dpu: decide right side per last bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-2-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1985;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=S7+JCdaVrPN/DIMlTCVGutgCbXcGk68o1VHEmTYxOSE=;
 b=DUdNxB0sCyTbGte5jKBqLS0uSxmc5nRMsJ9oKNzhyZSluKBN55Nfb6dKhKiY0NmrXktj394Os
 mj7wbw2RxNBCsqV0SEhfqN3JC/bKmjSSKSEeYgBXEQ7BNuasTvCvYJr
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

