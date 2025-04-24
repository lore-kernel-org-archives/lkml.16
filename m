Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28CD207A2B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487034; cv=none; b=ZKPj0xqdpxZ+qqEn9Utw6KsmjvWrsejjkDDdhT+Xo9rQ4fUqkoeiTdlhhTWpQX7qdib6gxhNzrXFmyborEuozVm2zYawW7xADcCUHAyZc7T6CKspRPC9+KbUxEIToRKjGATnB5HXb4bJ6qPM/UkQldygUXSBJhS0TwNJlGkDVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487034; c=relaxed/simple;
	bh=F7g9BzAAbozmHaA6qYlbtrmbTeJi2EDpYk1ZIzA3gYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHPhAnpM+tMCfJobKlZ0JTSugL9x6vWNdNt7gGrUkhQyZ7SVLSFGGkO5zo7jS/+8fJk9zuQnGdDshFF3EqB6I3OSY4GUfVQflmZyWuBTXFcOKCUCeutm6VRYsK/+9KOIMLVxzM4uKKJFQEu0VsrVB+9SLg/J7P0af45V+Ew1lYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbROGqVF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbROGqVF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8DZ010276
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyPCpdExNHYyCfka5wJ1DgOakGmSWlxEKnN0dB+rNyA=; b=WbROGqVFtURaoPkN
	ygMGXjhv6pg9g7Synyob1P3lBLQWdMdvpapaV9zrO8NAQR7Zj3T7jkiYIFAHKn4I
	whM5KuXGXa2nLI88y+spPYIczCTQSsmIbAMfSa5bzCEA0CIcm+NwBsDmk5izQ5g1
	huMROmEUqlsHpxl8wszj4t5Fq9PSfMm0D9bxkr58RyPAGsMjL0hT/7DdMZPxNDFv
	5ZLV8Cl68OoFqZm8JVvrTNRDgWJHl5vKUGeJBUpA7BCrnq0YozvAUe4i1mnM3GyA
	woGzxE2TK2ns7xTGp8KO5orjLkUgMFghbbCq4rPJ+Ehx8mVA81RS6y2ynj5g52Ir
	hOAuZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mym2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so128915085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487031; x=1746091831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyPCpdExNHYyCfka5wJ1DgOakGmSWlxEKnN0dB+rNyA=;
        b=eKtgx+j1ghwyZvOgZytmF9hkxKumeaRurYYDHPKYa5UfC/4Hq7KAYPmGmqC8WKjM1v
         1vbWne7j8Y4j3d1bNrwiMS3ZPSts6AUSkh0vcQf+Y9VZBTLt2sGbShwyHHWfsTCewMSc
         ijKG6SX5CsW2jJK2EbLu1HScEwInXoFKhn0xmeCLL8JoktK9YnIj+w8HRF4mcl5CRT+O
         t0ZwQpwQuc6a86mZ88Gq0GMien3gzCI4Lvo/Yqcm8aSfxP6DkN1v1XJtkMIcIX9A3pOC
         w0rOLZ1LpPvi274LOEGuBjs5rFKoTvCcCtNNkU6jdfkbC4jHBV4SLqAxqWEDGNC4j0L8
         7fng==
X-Forwarded-Encrypted: i=1; AJvYcCWd74AuHn4y34Gkkn/ffj2sWUjse6YN88+ujfctwPd9O+iD8KwvvbW2SDU7hBMm0LG3A8MVQhFlcc0AVes=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFumO+cNsYXOs15t0XixSVnqk5/Mofa5HGruy7OxgtwPz6nIR
	y3OhDnanQO942C6O4nZDbDCuQwnYINBTLAyiimANccqNnzjkxl2FKnbffEeJNWmXRwl0I5XGKlv
	XsVj+zAe7QzMj3l+mGa4vAlPlB29vf5JIzSM3cowUs5E4gySKvcSo8bLVD+wddCs=
X-Gm-Gg: ASbGnctuY3YczvHM+DzxkTFlAaMlGOKupBmOLU69Ic6wbnoAEVZfYc2kc96iM4l5jyJ
	eHZwADwLmc1BRgB9xvesLYxyTW9K8W9soLMi6bl2ZZSG8Er80EKsT+bVRJ7S3qz5A0IiEleu9/L
	bs5XBkYaTXIP4xUs0ObFB7VoDXxgpe8tKe1GPmwdcdzsFA4GIrQgSgwIuNKRJYUrGt72ziWUMDG
	wUWeOyLExYtExPrupWBvnkkbOdkx3jEwCxo0aFP0nR84Q5FUf4ZB+uW2UYyKTF+ZV1rHKSOMGPM
	G/hoxwQIwp2ef3Fz2gx59BIJPK1JaAvvr0ABoDb5tfm6/KB0V/jCoVz/HC6178EzTajf4jwyrZt
	KxC4U03aqvNHFNpSDnH9HqYWE
X-Received: by 2002:a05:620a:240c:b0:7c8:b141:29a with SMTP id af79cd13be357-7c956f434e9mr295633185a.53.1745487030631;
        Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9uaadwaX8bJYGxUDegggO2ScWj1v+mzcXVJ3LgUY++bid1Lg/SAxfptX6bTexPiMslZnTA==
X-Received: by 2002:a05:620a:240c:b0:7c8:b141:29a with SMTP id af79cd13be357-7c956f434e9mr295629685a.53.1745487030283;
        Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:07 +0300
Subject: [PATCH v3 03/33] drm/msm/dpu: inline _setup_ctl_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-3-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5798;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nM57vgHQs62/wjwRtInuGG9vKrODBr++a+KVt2bcP8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqaDbO1cyuYOI8GY2KGOace+EMYeHMZnN4M
 8YTpevhqVKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1ZzKCACc/Fqq3vdDRKnSwfbFcgQLxFyD9c/N04fCkEkisVRf1/kEa4lDji6r27tOe0LWjEAj7eG
 P+VqwUVMg9mNZmvpeWfRfnYcX60FxVk6WyiAocC3uh+WQco8rtSBtHALHqz4g/w1UKYsu+QLtXE
 LxQbEPx+5PJ+MOTz9XrcX7S1lp7PvafCYFDWW7DxJNl9hOxwehH3/0fVR+BLbrBb2g3dRAVHHAJ
 w+Uk5G9fN/NtZATLDFOzJ3+4HxVD15GSqCY1YmhXeEx5feUZSUKYF+GKYHA1r0aLKrTBtzaDYU7
 SMzVcqzF+eX7lrmMR6Flji9l2BH4LBken36gXJqA0pd3aonX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _sIIIepx7x3myGTssBVPiNlXPBW0G4TA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX/eceCr9gEacg AbeGYy2Qn5K8oWrSAOe5r7AIOCaj0DwqEmZIOdI7j+9gFb9fG+SKVQoFyUSrnPE7gQTueglsbry 4hoTimcAcPcwg/DKi5Wm/6KLCpYJ3PhE/XF9Y/gWJi7+u4PIAPzubyeW4y9RG5rKJj7zTcptKSq
 sXjJn87E1OIp2JG7RP4OT+txkUlDmOXfA9jmpDGCt1kflJNhTMT+ZNv9h5sFZvK+vsK/w302aMh SoAsv7Vxlb2HqqepesXC/OH7niS/4G6xjpjs00Dff2o/00UVQa8YtEnptl5zMSNTuewuw5x9mkL +J01I/rmVV48legj5QQNcdE6xWinwUryQRB3ef00R1l7yn6jRdmdeVzN/iz+4u0KzAgEmw9Da0s
 lSLCMwPDvYYYt42EnCtaZ0YiUVFxAwX52AdnWuFqrnule++SAc4WVv2xnpPgvwBFffRgSQKq
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04b7 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=RpF703knbOfOEe3tTfUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _sIIIepx7x3myGTssBVPiNlXPBW0G4TA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_ctl_ops() function, it makes it easier to handle
different conditions involving CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 98 ++++++++++++++----------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 411a7cf088eb72f856940c09b0af9e108ccade4b..466bfee3db52d980877a5cdc4eeb739cae250afc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -714,56 +714,6 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
-static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
-		unsigned long cap)
-{
-	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
-		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf_v1;
-
-		ops->update_pending_flush_periph =
-			dpu_hw_ctl_update_pending_flush_periph_v1;
-
-		ops->update_pending_flush_merge_3d =
-			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
-		ops->update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
-		ops->update_pending_flush_dsc =
-			dpu_hw_ctl_update_pending_flush_dsc_v1;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
-	} else {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
-	}
-	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
-	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
-	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
-	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
-	ops->trigger_start = dpu_hw_ctl_trigger_start;
-	ops->is_started = dpu_hw_ctl_is_started;
-	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
-	ops->reset = dpu_hw_ctl_reset_control;
-	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
-	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
-	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
-	else
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
-
-	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
-		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
-};
-
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -789,7 +739,53 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
-	_setup_ctl_ops(&c->ops, c->caps->features);
+
+	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		c->ops.update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph_v1;
+
+		c->ops.update_pending_flush_merge_3d =
+			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		c->ops.update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
+		c->ops.update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
+	} else {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
+	}
+	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
+	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
+	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
+	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
+	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
+	c->ops.is_started = dpu_hw_ctl_is_started;
+	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
+	c->ops.reset = dpu_hw_ctl_reset_control;
+	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
+	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
+	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
+	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
+	else
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
+	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
 	c->mixer_hw_caps = mixer;

-- 
2.39.5

