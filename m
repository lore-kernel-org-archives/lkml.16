Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EAE221552
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487043; cv=none; b=hBrqz8gR4v5aC2NeNGv3MOq8bMZawfunRJexWdKhO479NlReOTY05t25o3ZTIVEbdHxiKp7ecRpSXUiWew+qU6H97AROQbzybwcBdKHmnqXaH7vc8BH28xFVfILirF3qPtUQ0YX6rcrx5MrzdCKMNPKiqQ8IhnlXfnjEs+ZFx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487043; c=relaxed/simple;
	bh=H22xBWnfXZ6Aj4WLHuFbpSsw2wrEBfKKWdLmWP0e9rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BoOo9dEukZA8QqHM7NHtBWhdDhUJBh5Ni9Ig+eO4z1cgxHrQB63Z6ztRG0xz1yVVMtEefhtYDaLnssT80j4Hze4dV7qtWduXRmGeoNOQGaGgrFT5wKVule9+6eI1eUVBTQvwv4Zw8wm6aXNxFM6DI2pbCF9ZA664ieMMhd4NqR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGFXOq5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGFXOq5O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9VS031001
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=; b=pGFXOq5Or5ttyZJ2
	+4b2x6Zaq3MnjPshfANAVMk3Fu0aPE1ZmlIA4ACYjleyo2vLig+lRYhONHBXcfCk
	i/PTDBej41EBDfkz9/NpwxGnip4LHf2FcSTC56bwIrqNLqRSlrgvFhxRBgIY2izd
	Ve2K5SfZCj+ex3fFcOrXba3DbM9/L7M7moZ9vOETSW2waBMqOF3vAUc7ueWixhtD
	a9WBzN/wort1Sc6ccbOs3U/Y/Nc86cYBWV3UKYw4KMGWw2tWHDp+YZc1gTZZ7mBX
	voxFnxdb/3q/rqfoGnDIofKXyXTKWqLNq0x+ibrthwD0zIraWrUCIoF227pWw7/J
	YyGbsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cywc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so134624985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487032; x=1746091832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=;
        b=Q8Rqfzvkl59WOuGoSOrqnU6Aa+1yz8jHnHdPI+gsVrutqUg6TRbWcLJiRiQ0HnodkT
         fZOTOdhvkZ/8KzOy+zoH3t58IqaCTpWniJHDSdX4yt/f4Bs9luN9Xl5xfxqQfz75UocK
         XeG4OTfg49/q8JEKsY+IE4TsI2y0OHzWutaTErZL0kUBW7vpoLPrQOmUXqX3I3BpEwLH
         6jZif6AIfCbGUrOPnt9udImqEVOm/CRZVBwvYJZwxShuzPjKhuwWSEFuC6oUqSsNfLNE
         rbq/DaTfguXVggqpnXLTYrAns2Ghi4xPuMiuaN3xhpvvd7BnODmBmalhkr1ebMT7NgyU
         A5eg==
X-Forwarded-Encrypted: i=1; AJvYcCVH4oNckmVlomMu3onEcYlDK2H3CEujbQ5sBaZbvC4Bd6Kj0Fy7AvrVM81IiBUTRvumA8OgwURiZrI1OIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFx6HYHXvc4GBOynBPVaYPl20aVficVoWtc84g9KAFfDIPu0Tw
	VWbGEESktjyBjvnWu1pwgetJDT3aHkQX5NGghzOx5jsxdHEMJ8puS5LRwZa4UP280+KXoOnqJUp
	HH+9X5sqE8bOIyRtYxaLw0+aC2b59PNe5KeHqw7ufcnrlHkoF/2gDeJJg+og9OTY=
X-Gm-Gg: ASbGnctJrDybU9DpElonrxjZJcwmDx8Qx9g0k6hUTzZPWd8QGptC80XPx1R4eDA1dye
	C8L4koxIeEA3CnVgLHP0vu/HEZTWIgcGC3mgWQoKCCqzxQvVGe2Lk28rP3+uUJ+zTAhPsgd29LY
	C27J/AFKt+0ZZGsV+JYuUGCZHn8w74RNlbE62aUQo5h+hnn0Ny6Aiv2OwXTKDkDA7P3vh5GP9jO
	SyssAiRW6popbQ6uOmV6LsmMvQAB/D5cvyAHFssnXOUYvkgDktOWYy2yLbkFB6HXw+5tYjignhN
	UmoosZ18EwVLzeVcoNPUeZFrF1Ab8Mfwu5xbISlSoB8tI1Iny7aPgS+NX4BagRTG4Ya6CilkaKn
	fxCCnISOALOttuy99XYr/6Iod
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c956f334e9mr319894685a.40.1745487032139;
        Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWUHHejoPAWrPi677FUC/LXOAzZqmXm+Nu8bw/i4Gd23G4xaODXoIn0yKuicCcUyxeizcG3w==
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c956f334e9mr319888385a.40.1745487031797;
        Thu, 24 Apr 2025 02:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:08 +0300
Subject: [PATCH v3 04/33] drm/msm/dpu: inline _setup_dsc_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-4-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqhsEhQWFa8FUQJirnBAfp4FL5UyiZYwL2j
 KSWqcA0JxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1RT7B/4lgGUG++hlUG/YtsFmd7Qoh4doQsDs+oVgtZvTumibpfEr+jSMdAVQEEydNd4LTj9r/3e
 7XJmv/FoQpLM9UXzNq565hGC+f5P34GP481Q8iXLcbBHhtJCX+SjeNxfP6fJRh6pC6NWhbV44lG
 iUmCXwzAYZUnr5hM4AQ0FBBlCGDZ0L2g7nW0WYbi3SQrWUK3ZY94wxeldCbk6nttodBiErfRMee
 Spk6Jv401RlstzoR3jfpNXozBO4tDoiBBEO4UavQHnldyWVXJ5LQDA59mar1bu8eKyn2sbxmreF
 lZmJtj2JU3tSoto4IKzJQ9w0z+jjPbxlB26AG1+jQp4dQxKv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX2sZr7QGB+E73 XnevtkLQ3rJNVxUyrlz45n23nu4ZO6letxFTdIuXHxXWq+posJ0JFdeERmAvGLil0cIp3aX4uSO Bd/V6gp0XVpPeD6xJiOHFJJqh+JqYfxE2Vbpwkmbxn75L0p2jL9E6O7ZfKHC3y2junPebuo/c+F
 QcjRNWQIAurXnJVkHoLrivTRX8jxyu4kk062ziSSqK/y+kEHVKmozA6S4QBov59d2iETQs0l45p hSa1bo1sUlu1CgftqjHRBv9SkL7R6t4/r6zPKA4JSXMOi4WlyFTsDEcy0QwL3VtlP3l8smNwa9W BM0KYXqg+HIPHcaCc2PZIcXg8FpcSqGiDp/Pme+kA1MV3QOnd4YTE9Wk/5hjaDxS0DIVUH9y6NP
 dgdh+jcAugjbZcZHqq6XEHTbO4cW9hyevGki8PVVSQNR1qUjzANSWlbEj7USnooirvOluAIy
X-Proofpoint-GUID: ZYAh3-QbeUIC3VpJlVo4pl-Wu8SJTNc5
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04c0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZYAh3-QbeUIC3VpJlVo4pl-Wu8SJTNc5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

