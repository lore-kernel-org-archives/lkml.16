Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8082874FC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670666; cv=none; b=ut8q1K2+GKxSbaV0yuuTxSc8jC5aD5aankEFCYKqQ6NnEfaeNiRxdP40PdiNFZlGfQgE5QVRxqAy+F+Q0Ln1HYkmYfV0qkmAZ15xskdzEKoyS14zN0C6V7yArKy4NPY7uMsqirqjsPrUAiOhFTwo6xcYTogUsscWtt6IbLemv+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670666; c=relaxed/simple;
	bh=X/cARphzPaTN7J6hUG+1p5ww0kDbsqYfp78lcUIgVS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uV2wFk6Fee/M00/Wm9fqzxjbOCP3ytr/hqABPIBjWnkQ+RuCdewWhJNAuEx6/mh/X1e6BC0gOo6WoISUblycPw3wDeoixdbmQweUA0l8JCIqwzn7U0jQ761DP+1toVD+7NUsqkswjeyf2i1r6u+cK/HriFJyrNGDxerpdu/UYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zd6WgIJo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zd6WgIJo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9fmWY026084
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=; b=Zd6WgIJoIshTVbxG
	c6M8aAfAVobAr/YyiW4EB0VDkaib4wzD8JlZzECQZ0wbJ+9Sw9kFF40FsEnlE2Vo
	UZeOH0Am2qGkb4qydNoULdRgGMyViRf5rT/TAnewoEW1RU4htgRoLYaQGSTSBM3s
	jdh40FyDv18IXi0U1IdkZPdpGxbRehr9GMq0g6VIiqpGSUYkJCJRxBP933X/ujm5
	KxQPxxdTzmxeWWi3+ybIfCd22YvUE2FyE6QxuqKFs93MvzYYgConjqjM5wiTS/qG
	aQVSoKYZixjXJDNWpHoHfTn7u3hl7mBBX8CC5O077kWd+/ii85zkXcOq0eTXgpQY
	lTIzkw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsvum9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:23 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72b87bd96a9so2302562a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670662; x=1748275462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=;
        b=Vn+Br2IWPFEn7wE62fahfPFT/s5XxXMx3doNey2URUbCEn3j7ZzR/Qo+R3jhwXylgE
         LjCGTGW9ARR+8lwhBacJFmA9hdtytG6QN+QTFrjrV2lYw2tkFSyvs68rRd32zRlRR3hy
         OTVWextTTXJhm5X6zhddnLwuWge02AGgiHZBjL9RnBDhYgNpFHzEr53wgbpyUT4aoYvy
         cKVintIliYMCawOgiFPRiL15ouZlRfK7/Tvw+qcbkJ3fOBqFOhFiHbkJbwBSxutWoSvT
         L7dcnlCJOg5veQdTEreEwSwjog54Cb1K6ebAxFRPkWmmNhiklDzWL+ZcQRTWb3Fa+YeE
         9w8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoGJ13CHLQXHq950BcaQFYyIyw3MDURY1pH4cURCmf+w4BnN5JfcAxPWMKx8EXyayqkTm0EFdS3HAYYNE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiod/mjkUPbZT1OMJpz7EvBWZt8Twfp7tQ+7OPZyKYiCcke47N
	SOmvuQ81AZ1c6+mjzYt91tBgO2oQBm8RVw3IUeN9rwBY1lFnYb1S54ffOpkJItdjLi2pwrvLyvp
	pendHUQqdTW6IxyywNB9PCKQutX9x7mXtybiYzY1CM3dmyQ6uru8ZnErLptCqgHesOveMBEdTbB
	g=
X-Gm-Gg: ASbGncu23C+IrWbDlZy6WzzxAtzMMwFGqruJqeLT3RCzgqRF8n150FP4qG0BW9itRGr
	RPSAPk/aTTu0nSdQlOHXpR4fTPKJ6dlEcgqFi8atrT5VdtBkjLFDBzY6WPqz6xr9CQkePZ/hjdi
	HLb6AkmOn9kSpxVAmxGnbbklApXI4IsS31a9s3tRsZu4UxPdx++RZmVz2fYTtD5U79EQQsAthBA
	mKQYzN/tg+cfctsa4wdaCLJFGXnl5vdbZsKcDMN+hCkmVRjTRWpZ3uNLN7iEaIKnqyYo3XEyq8s
	sDrHL5BmxR4lIWzvM7zpF5FOyXfxs3R0xi6A656ohHA+2TIcjDzCf5ABWLKvq9xYyhpe/HzmPRX
	h15rBV9LM78lbDdBSTIntetWX
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id 5614622812f47-404e102fb3dmr8677812b6e.22.1747670661817;
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjcPOULuCPi9Gz8PeN8WglsKOijdjLwIixJjwa7hlcPWR5Yzy4Y9hE8EuoKimVAyoiC66ylg==
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id 5614622812f47-404e102fb3dmr8677760b6e.22.1747670661484;
        Mon, 19 May 2025 09:04:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:06 +0300
Subject: [PATCH v4 04/30] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MEgX/3vGs0UXxx+RirFKOH324DnVyoFKiMBN/zZL6fQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z56tKPsAsQdY/+ZTk79GYuzcy/HLPDbC+oY
 kuiPoh0z5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1R1eB/9VKwfYCQtW1Ktf1qUs2WDo2JIaaBUIheGmLUyxbRm0ENNs1WPoiGkCfxQ5fcVuZDOKdQN
 DqRlBzIcfB5Rh8tGzHuFGAzKQ1kGQcRS/cUC0J5tQzTB3LyFlB8SDg3ieMpkRU5EywhW5jdv+jf
 z9j0+eZ6yDs9TdguOSwZkTSoiYjaZzEOCpghQoYsbuYv4COqWGtTihhCBw2cdQ/Z3c5nJ0yFKfz
 gkJLmpyPdiTojZN+T2mnvOHr/HhGTbysK4AH5cybBTnp+hgASYbMnYFewxyNmf7NZAzx/o37jzT
 ZGB5K6zOh7AoGRTq5aZ4ZkkxkY8sjFyn5i1u1t6iCsCcCnmb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HbExhJGsyXRguT9Vt97TEO600QPRXaSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX5WK4lP60GFns
 mVtYL14Q/OCvWQD6pF1sAU1zLkYKv2pM05tLJD9dGGfFkskKlUgBThJA9X0JesoQ+FN7cuI41qg
 EPuwNry8YbJF1+cuBwY40OAhZUtpfjLsSRWFF41Kzlc4iddED7Vi/5K5oeznGFSRLt1AFu6hdbP
 VI3JbqZsn2jTAu5S6LKVlWHirdWBDnKjGaD/t1V8N5vLPLDxSdCwBA7Bu495/xdajqFPWWngdon
 R6UQrv/5F+Y7io+uoe1FebhuYTcmmL6M8qKSjB0nlDoJ0OeNWZpfl7cvjyhzq8VP2YoHKvcYlJH
 36u/KY/vPqe6ujnBIXZ699dEMOxenUsuLorde7BM7B6Rf1+3uMASWy1Ar0GiH07pWg9GKJaN/Py
 nQfWz6lWcgbvzJtgLamm24GNIjWXqwyJs1jtpD3tkC8GW5ZLgkmBahXs/hnkzfY7SZKFmBt9
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b5687 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HbExhJGsyXRguT9Vt97TEO600QPRXaSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

