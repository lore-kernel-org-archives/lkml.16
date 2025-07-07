Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E002586EA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869116; cv=none; b=PthGzXLZXN/mtIMbXyiIkfY9I8tA/XtBDl5OkmOy3eV58VWnMPN5FV7HwY/ou+MVxysTLhQ0jsr36jKWDaEL4jejRONsDmQXZX/bRiEXS10PCd94zbIoXnqbNtkrWTeSo/2rpFJoHN11L1/PFzLs66YXcBNsgs2VemmQmqCsP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869116; c=relaxed/simple;
	bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DCdgbqoQQIap4hRvBE021vOsGhU1IZ5bshZW2B1P58CvtcrdwA25+kYN3UW78oaCuIlnZ+3iuVO4MbbuiivXTvDgtjlpirZQBTtAsgbukKTq8pP6pyqVDQUY5T8dDUsKaQQoIdMkfcjBA9J5sbCWIjyNniOPXbagPDVdAVBbk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A+3LvjYp; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+3LvjYp"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b321bd36a41so2214496a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869114; x=1752473914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
        b=A+3LvjYpn0ZeHEsrliihf6vnYWXd7bBuqa8HG0BTpVBsKbn4QMOPaoXkf5nddNxRSu
         Oxl6DkmCEvkS9PnHNgAVM1kKNZoreoeyUT2YutiHpcXG3CFeRQVAR0OB4JVwWoBL6yYq
         EOwGUVoG9t10o52DEWlxonu7nmku2pULl6UBLUpag/mP6ZEynOQWtvGndhckC+9cJEu6
         Vp7Znnivt9P9i0uaIFAYV2me32CANffEeekDZF3dEGl6+taByidH3iKFbsQgOZi/z3GN
         xVsNbtsITuay7FuRf9p1zUQw5ufW1LBrywHnr6R6jtnWYbY9B9cIOvUR+nmH9FO6oJ1l
         arwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869114; x=1752473914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
        b=Jg1NxwtfopJRWxKQOuyNY+a1yOkunCt7ckhP2RaW0lSrHYZSmEEtrizGuwiyfyweDf
         2HSrZwvwFS5bJPR+YqKJgsrWEKdWW8mV6Uksq1Dxba5mPueS2V6LkPLfIpDgFP1N4KHs
         trBT/kv0erTAeOOLGyb22kbncrSOnA+rcy2rjp5aQ48U6hZZEuIFmXjSMid6MeHxtVuK
         ++12zY/lXvjrLTZJLBOIWdRoc53hxvUe9CKfm+CVz7Kc8A2UA8uCBy/JXAcVxdxnokZE
         NejGRQkl7DWZf5qFlvARLm5EKJ5eG8Fm6gzPLoFRQ+prlEiYYTNOOPiuInEXNvbev3z1
         ExKw==
X-Forwarded-Encrypted: i=1; AJvYcCVgwSUoBJSoZtwDI0qcoqFSz+PouP6lxVqkRUmuZR1TBrJKNiZtKkqpvhRdRpsOiOMKY88DavQYFXd/33c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZoBu2aTextsf5MYRcpnm1xFBDBx2sNcsoL31NkbZ+/OATDaJl
	ZmumDtyeAKODqtV/mBbsqaPE39XQRxmHGSNtLbnbiuRtawIWPVQEwvRnuHDa7xxUkkY=
X-Gm-Gg: ASbGnctSAXaArb7YcwfgVBkQef6gnbhWxa2r8OMetoAF7AgWA8cfhTXrbczgTvZWoWS
	2EbN+F0v5tGsDln6AuWK/7sDVCq1sHVzG/ezjmHOhUWCQg8myFZZWnH17HdKJFEojxdCSEqQQHI
	zO3i0E8tAwFFRdMxIvqeOJVL8IHCW7sJtkthCKQmBKx4mXhCynLudFHgKSWEH7tTgThO29/YUjm
	Kn05HtChjipJ+11wB2O8r5+MbXPb2SxbWJcYergUXvPvKMSH8mF+7xMqRVyL6yffFwjkwzYpZdH
	rhOVRcK/6QIMgswL0r2St+YAxSYV3ueg5U9k3ohrBayRtq4egaVPr1/bW5o=
X-Google-Smtp-Source: AGHT+IEhrv3fmXBC2zf/SakWM0z47cC7OpSvTf+Ugbc9/YCKMZxghEVPFjk+9Rao57znNMbR7C25Og==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id adf61e73a8af0-22608fb3070mr13270461637.7.1751869114109;
        Sun, 06 Jul 2025 23:18:34 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:33 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:59 +0800
Subject: [PATCH v12 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-4-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=8J0scBIavzi43Hc18EtLQ0upqpSsevKQ8nja/mECnzE4bufiDHQr1EC6aLVX4rEF26cw5m/f9
 1POTKLa7ev5BqipWab+rOy402M4esn20vuhkdBAEbl/rKZAxXTIcGSH
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
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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

