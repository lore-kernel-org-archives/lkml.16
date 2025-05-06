Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971D286410
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546548; cv=none; b=SRr0zlOhTV8vyd3izqyqiZNIBk7RmnlnDNmrY7VO/0a2VHvRF4KnBDyzLZ+KQXcg8vzKqEKP3rogsmwo1GGmNia2s3vkIZGrAwHsVLV46yfsMN+P/66QunAzEE8Y9j20gjqTa62sDgKBuRoLFVB+fpJ8WUNGiqHx2e86m4bMeuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546548; c=relaxed/simple;
	bh=Yfa8LfJUqX0nGl+TeNHAer8ejcrj24FyRlRcXtmXu8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOHMyNa/b91SaLKm2CKDAlyc3RJ5YzwkasrWAOiVwnbw2kyp/JzdGXIE+K4XliMK7h9Le80sjpaoDwIW8MkzazS+zePeeu40z7jk840hN23BAGdkIEpG+iYBAmCKpG6QkBY5GqPsMASv0JbWe35mX+N2jMFTAf/AhgD236fAEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HrClG6n2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HrClG6n2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5275618a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546545; x=1747151345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlujadKcoeKmC/n1ImzL34cvC3TJH9wSs5Ab3nngFQk=;
        b=HrClG6n24LVUvEOlVFMPK7Dl6tgOD//XhZ/pvIjy9vyDkZeCLk+uzYvevexaC6bqya
         LCypHlHm8tWXlAXq3JgJylzMH6dqjr2042+tUpcyDU5oQc6BDmkAQO2+E7cjVprSrpim
         l8jfsygUeczvUmdXM96FJ8exwNyeHgPkL2J+JuzzJOkdti6hQB1BIVJNflZMEQJJRtFH
         7Qz+TYUoG9vOv+8fw8psdi/IvFYWws3WXl7qD3sXtjCy9l5Qzu4KJLsxG6QxNcjRJoiF
         DxOqAnTEh54zSqUBMdK/z1a2ARTeeIAf/Ogv6T6W+TIT/ZGU4L5/tLdqmBFJOib2abSH
         sUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546545; x=1747151345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlujadKcoeKmC/n1ImzL34cvC3TJH9wSs5Ab3nngFQk=;
        b=OGyWQcEeNM5FnfpAMbpB2bmBDb72vDpY31MrpxU7LlWYEuD85YMSX7mCvB8U/3gk8Z
         oF2HbHXbH6tB8c1rh7bGaN4gs/e0sw2RDDoIYeD4wARyHn1ACmrQj/n0a6Eg+XM8GXlU
         CKZZrEF3L/t6MWgtZ7EFcxP7hQgz5wDpNgZNOw1oPGWqDVqjQG1ugGaedGAj6XrkA44P
         DF2xOzXRz1lLHs/7El8JaNCLWdR8EH9ac3+Ee4pgjuqjOb881wkhjjVYtSmcfgJvHBHz
         rBGJonOpcHRqS+rZgsrNVXwoaj27zC/s1fw6ri+sg2bIbDa9X5wCpO/QOnlL91/PEi2a
         oAMw==
X-Forwarded-Encrypted: i=1; AJvYcCWzO5bBIIrJ9H7nrlXmPVWPOp0cwomFIRkPwE7BoSmqJ8yK3RcdGRW33Ldj+g9yV+cSVHVFN9/7LfbcInc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuO+PpuK20Wbc5vDKzzcCMdojdYFIuQM2Mp33tmJhgWi3deQ9r
	mZNSTeI6x86IgD57StZM03IQ6fZrTCUQodWoZ6Wh10+V+vMKoRku3B+hygW236Y=
X-Gm-Gg: ASbGncuRfkNZdlC0ylrCKWb+XJQ3jNxvPNqnqs77BXI0ElZyGaVTlou74fS34b4wFxs
	O+jWQlxMNyTWUSagNvvz9ucLRyco12nOYalewp7Y1kEGGdSx4mgqB+qhLmIpglXI/buV4ee1/Zo
	Ph+0PT2Z1eK8MvMeQJpLTcZvSxNEh28rqkfCi+ovpg2cuCX1ru2BZOEIHV9JXj8urnZxLDD1Fde
	jnSOp2q0S0p0A6TEtoVec4z4EJaLV6nXczVqS7dUQkE9Z5RV0Ypctz9ugYQagCA0ofu45MUjD5G
	AZo3ua3XyswhtLZ6My7Qa4hDbltsbMx4d22lYg==
X-Google-Smtp-Source: AGHT+IFS6FZoJuDcTCvjasKd96JWhWXD/99BvVru50V8guYaaSYjpZZUDkxGXVJl5z1Bx8ea/lqMTQ==
X-Received: by 2002:a17:90b:3909:b0:309:eb54:9ea2 with SMTP id 98e67ed59e1d1-30a7e1af162mr4218720a91.20.1746546545635;
        Tue, 06 May 2025 08:49:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:49:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:40 +0800
Subject: [PATCH v9 10/14] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-10-f7b273a8cc80@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1599;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Yfa8LfJUqX0nGl+TeNHAer8ejcrj24FyRlRcXtmXu8E=;
 b=68OG/s/ha4iwdzGf/813VdpaYg/VDV1Y7XAOiTDn9rs/YFaOBSRRGyeV7PRqMDvSaSTWjbIOC
 mZADjlPu+Q+DcWqr1m/ArwQt4pYpEZKx8Idi4hVzDMNBARl6PXUIDEo
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3e4ff345bd6d9c0e2a08274874fac40690409cf0..a125a477404fdafee6495f6d3778160f14a01a96 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2372,7 +2373,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

