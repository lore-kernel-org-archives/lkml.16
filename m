Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD8527AC3A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869141; cv=none; b=Ix80ZCuXRTVnmQvZd/5XGT3go6uaUdEhWTunY8Cda+/Qumw0I20qrka6cXbaCzj+iDnQU06LSgRmWQDHGbOyvu5Levzr+dO3URrkg8UZ7d6cnCUVHnpDQAfI+9fBjx/6ve13YydBuXZ2hhHFkboVtEKNZq4FsscRWY0upGDrvD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869141; c=relaxed/simple;
	bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vATw33+7Tw/KMT/Wp0lr196rgv5RQN3ygWroHwVufsCTZKH5XoXL7m/qT2gZwZODZTb6En5rLkuKES668EweNg8lsUvhZ5b9iTLUYvYN/y44hVlyVFg0desEFNFPwUyubNUeQv7+JrO63M6JVSV/ux1jZiDm5plubU5rzEWfXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hXEuPcLu; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXEuPcLu"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7490cb9a892so1539850b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869139; x=1752473939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=hXEuPcLu2HBrfOWluoM5OeLAsX8UX++mAEOv3izWEEFwWJg6KzNrIIWK9zyk316UUZ
         /cxxh7u/Lb21mnFoOomgxN1I1Shlue0Z5x9tS0atNK1XA2d/wbGkCp7ALc4fjwTvkMec
         KOo1z8CNG2PNwVyiXVOyzbPq7PxUSvKwP5RzG63gT+mPXlLNqa/z3kjwn73+gC9BPMKt
         3F1spUEfoxbY2Sk3dax0vt22DG9CbTQELZc44NNuTvfWrUl7sKAVz2lLUCTPjVecKNr9
         ZNSasrn6W/wjEYxoCa8VrwkRm9eSWtf4HZcLq9CjUbuGDiPPfPohzc9kH90MCMvhvCqu
         mL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869139; x=1752473939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
        b=nGfeyU/GRa6NmyEhUEgQEheUNSPJvTC5vOHmiIKr5aDVqCojGv/h86uzVCQO7GNstT
         Dxd3On4viYtzGK5elWk3i0oyPXmL6G+Zjn9ZL9SIP7e+yY18BbLb+AWOcG+jeldzYzT/
         oMBNbqPEZhZsmK4C1bUVzNgX+/hmPgVAoLhHR+YQ/nS1eC9fUSwVxnQXHJsdFdkBevHG
         Ix67vvkSuWI8i3zaNIl4mMcIBUjrrzQptGANzAcS8NkojGad3aTNIVh6M2R6LW1bWGW6
         gCZhDB3GKrvys6h3u9NHXq5jDq2dm4jyVN9/QtwbqfSzOXQZkg72bF/bCKoy8884zuDM
         VZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWZqubI6zOVlw3WQzXMMNxNOH8TDF/whF41CtExB/JyH9yPeq4jTQsNIJkihdCa8Ne1e68pbNBcIzMXQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi1VNRik3a/nW+ALa9WZEaXheupLlDrGpY61ZIgjWe/LtXXzTf
	+/yp0YPxeUXSn7cAMxEXd5qwpoRdLh7YwNmeFGgsf6j1rpMh+w88juch+4BQAAbArdo=
X-Gm-Gg: ASbGncsIP9kC88TsRm51uIn2+GIS5K3UkjZG/EujBBPte0axj1R2WUO5v0wKbEcXKlT
	ULInmgH6YdI5b8WX3Q0YKgyDcdm3eFUcgUt/6JW6OtCGLPsQ3WHalb6iW4oJXrOyT4QxcveiTu5
	sR3nef6GZY7dDxc8zYhxMQHi5yLtWCx+Je4+31d7ejgYmZcLFuUoEsaFx803b2lyWDEaZDylC66
	z30HtslzslgP03klF4kjdrBnuFUz9fqQdvk14RTQdYm1FM1JvTA4w+D1O9/DNRqU+SvTd3NZIBg
	jqU1LlhrH0IqL9jvoF8nUQJ72x8vPIK6GvoC1Awyik2ZM5X7gF1U/6FGLww=
X-Google-Smtp-Source: AGHT+IGHeMWJ3CU7o8u2I3jtTuKviAnMMK1jk68uIZizqYV/+1lVKm5gab4fF2qM/al4kHop9FptTg==
X-Received: by 2002:a05:6a20:7f99:b0:220:7b2e:5b3f with SMTP id adf61e73a8af0-227213b0f9dmr11250088637.19.1751869139526;
        Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:03 +0800
Subject: [PATCH v12 08/12] drm/msm/dpu: Use dedicated WB number definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-8-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=nFHB3VxCXhLEoI/KGV5opIO0xVlYrUN+hcLsZnNkOIelu+Vnn0r3HYqoOcRs+4m8mQ7Gt9lwE
 BgWUi8fort7AuSXXlYlKt/MQ7A0V0fejxbdR5aBcTw5rYTUIzzX9JJY
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
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
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

