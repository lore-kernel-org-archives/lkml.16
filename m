Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E190B1F2C58
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251740; cv=none; b=KdGUVN6pz2Hm5NbtA5xfPnlr9ot6kGHfE/tUZDZB7GRrhjBlGdYZb1MTgptR2KW1aymC9Y4JG5jr+8nPVFxddUAp51R48kRA7CE+4rThRlibDx/JLGzOeE6IemaHIDznJby9uIYAadSgjlXLANWsj4YzLxvbqj4vbDzu6gosepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251740; c=relaxed/simple;
	bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxoJ7nU750s40iK+BJmFRZJXXLOCkGvbJY4yO75KbPZJ9ZjGLj+7ag0gZUuYnUiy81owC/oa4eHrcBCvOZ2+xWAF/tjac/X79Gah6+jO7d0b5edoXgR6LrHz3DlH6qoePW/zGJdJ3i5+lwQx4k3Ou5tPIfAnJkA8ktul5k3/guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nXA4j5ef; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXA4j5ef"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1686550a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251738; x=1748856538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
        b=nXA4j5efiwrHnwlCuIIE8M9zxB9KteLxcidG//nA8WAgJZBW463bO+944CoFNt+aA2
         PTb1ljfg5WHO4jzWL92K3dxHaWbHpuRh/7VCqtWZGR3uxH3JnjMSmj4tKOeDZkuCEfxm
         WdzeM4MGLXNklHZslhu6eE2PTI0J+J3EK/O68lZ7Zqo3y7/d8Kb5XAiI+3cessNzV06N
         b9kXXkiyiKlnnHrML6WfKHflJFUWb40V/2jK7bw/Srdrn3jrXOjNP6eZ+5PsIZfC7KW/
         5emw9xiii085syGKUIR9DRuO955hTWGyjsMTFkGqe7HJ2kIbhJtCt8zqTKJfBmnqPy6d
         SvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251738; x=1748856538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
        b=ADfayPO0fnBBKgp4D5DvfvzFvo+bNwcDd0OTKB/OBHlzUlyo7okUFk8ABflfX+lhQP
         9zXTX+rfrmEIlQmUNL3qyYf4dtoXxWfaeKUCQhhq/opaYaM8lsMGJLeHbbimYbi1Ogy5
         pbn1n/pDFtG5XIoyEATVAbvIoq5Op/FzdZ7lnarUeAp26ZfQgpDjvoc+Lf6J/CU3jxgM
         UwXemhte/XltOCQNrVpPfm+xDG03bkRiBQyxYkI0uyeaRp257o1jAJqWoIF8wcb6SKhK
         jU2fS6kTddWGh0llg1GeDG1flITErLj8wrdv8jE/SQh+GPoj0PLd7rMkG63uTWQufoNU
         wqbw==
X-Forwarded-Encrypted: i=1; AJvYcCXCOxsZiHNpCUdYuD7V80obRQAKHCyZaRXfADN+pIVM1Asv8gPcVULWk6dbO3IROEa9IUDl0mG7NyWZDNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9ejRJreeCsZ1qzayDNpe3oDpONK6UEvT1LeAjZYDFkFTQoXd
	rke2DVBLiHd1trfOo1w5d6Gxg3gi/ipPcexN/gdBppJbG3sAHMWrDwbei31RUY0QkqU=
X-Gm-Gg: ASbGncvfDRtgplv/KHqzlxpne2DeqI8QpJ3MMwZy4q0n9/m89eGamBzANX4CUILMlEG
	rqibhJQt6eIxCdoEwTxQLvgbiA2HqoWan1jUkHSpMA1tlYllDEUlF5inR16fNn3xFjspR4W2QUI
	YB0OWY+I5qiwQXAjF2umEbB7uyf8PoLq4PO9X9PVvER0X/goSp7ZCfO/mtsqBdLNoovmBDp0Qr1
	q6wBG0oVjx1al/exyfrHywXlXdZJB41PreDH9R0nYnYy/rAM9jCGwFxiJoj1+2KNepUiELLymtz
	40p69XT/tPKF2de66M/AT4SVJ1H0h7rAxovt2az5l3mDgCd8JQ==
X-Google-Smtp-Source: AGHT+IHg731yrBi3amdlRqRR8fJoqCAqCFFXApSAmT3tMnMtzw9du/a77ZBzV8cgtRweVYwDLfUSMw==
X-Received: by 2002:a05:6a21:6f12:b0:215:ee8f:9930 with SMTP id adf61e73a8af0-2188c37400bmr13100446637.33.1748251738197;
        Mon, 26 May 2025 02:28:58 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:28:57 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:22 +0800
Subject: [PATCH v10 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-4-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
 b=mLvib70zbFHGz2cJgp25wrBgI33CfCNwmyWLywg1zVcvHZpswrxfEMFZ+zHOGXd5FPM9dVBiY
 r6eiZ77IfCqAKJLC3X81da4kjM0dw5FvCZfbwjjla1aUKFNhpJTfNgW
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7020098360e474ee149824a488d912a7ad8ed06a..be8102691b99d3b381476ff844ddfd28fe17dc7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1157,7 +1157,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1236,10 +1236,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

