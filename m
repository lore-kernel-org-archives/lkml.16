Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C91D288CB6
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670678; cv=none; b=Mbi9zQWYg2PxlWzqM3gVeSeXjI1uidwi2rWPTHKJOtCT+DlYtxuYqo6eX8CDmpepo17GYbNotJYm+JBpMrY30qV7roQ5HmXxwF0wPukVo+2dNirKpD51SYnlUr8ArRNE8V67NVjmqyXmrM9et2f1v3BJJaC+H6flH36ga6ko4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670678; c=relaxed/simple;
	bh=WNgc4xPaUHAvPxtEH4T+Z9aLA1Qirozxni9sok/zPIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ow/rtcUluLdfpS4Kt0DGP0J4fsoYtELkj34Hkzc5k1RHjY7bjTaFlIXJjAJInkLr5WqkLHwhDwLXrQM+yk16VcM20ZEVDkQ04LICx+y/gFUloIZ+Z5B2locY5rMZL1QzTOBsaH1bG2U4ZHMaELTm00SURTu+fsSKDkOVQ0OY7Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aADo4WDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aADo4WDy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9PftV007110
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ynPSdK/V5vuBuCDckGMsf5MJ26e7Qgj1FWRsGRLvduc=; b=aADo4WDybW2O3GvL
	UtpG6j8bcrMNM4vipcGM09NiQ+CcunScTQHxS5NNfi0QmeTpWlbYvO4kzI7L6ZwN
	suM4oGQvCzy+JbmVZRNyLG1KsYjoodWoWgmRko6kVRSoiPqH98g9xCo2jIYa2aDv
	rUTrOg207GacWdsbEZO6MVgoUaVZqNnYWZoW5oDLI3hBphBoeOiIBVVYpNbJqQGD
	d7ZUoP/d4KLrg/5T1i+0QfdoUjSJZVG8zKshrUVHKYUntqbWVNxAxRFga/tW5I6c
	uTI8eUKk013WkGlGcikDkkuMqMEC6F8U75asY0LYtgGk/yKGLoqWp1GGDId0XiWu
	JrtjYA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:36 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3f7ade514c8so1849025b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670675; x=1748275475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynPSdK/V5vuBuCDckGMsf5MJ26e7Qgj1FWRsGRLvduc=;
        b=pjrrNhJGoCfVnWmTKLYfqM1gMddKDPf2apZmonZNOJtDHTgFdxo8lTDajW749tdD6J
         fp1ijJQQM07F+Mb+sZ8rTqgDeQdHcUgoYL3qydykHvugQy6N8PTjCBjysJVnNdOlkA3c
         udQNFdN5twpHATynYXQSGwO6ACF32gXA/YDlPuP+dv91BYXXs+S9HBoRJZTeKIN92Vqx
         7hKqzOxTWTD6kLlVSXnXgKbjCaWfX0DfayuoNCCwzfOGxu7Y5AbZ33RZd1uU7QApvfLh
         ClwOXQzXBQnyx/7qgn/8dsqYwTdSO6FCUhuUPJcBuHAEqoeA55R0QaT1WEHGiKjH1wZ7
         daJw==
X-Forwarded-Encrypted: i=1; AJvYcCVpgLuQVZMXiL/jOnpqBLRAduHBSnEKFmP4lMvYijEEcgDkgGQZDAdoCz041fuyivgafQqUzvsn/FBPU7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGLaWeaPVKHDkAX+suXsZDFgzZuKIU3mJl3fEZd0VebSpzUAU
	Q3IGFa5r37JwbEuKewLly2IzeuXFmCSMMMHyBMJLyoKph7dP9HVliIgzuOS+2Uc4pci4SdmWVLl
	kvxA/nQzpPXkVcX3lohU6WINOobH55I3DzEMRJFCcoTtFbFjQ0PQ4PBuWiXCQIQo9aEo/Z5l0FL
	k=
X-Gm-Gg: ASbGncuAiacBLBxwcpSmDasfjI9tGSpHM3ahSPtA0NG1J1/6s+Uvnsr4z+vxYQZVNjx
	bbdDeqNZL9NpUf1U4Y2SMObNBtDEimBsucD1wamdA4K5HeeXCr6FBtE71XnBwJ0Sx55XzPUY9St
	0Rzo47055PEYkqQLRUMkbz0i5kR24GdmYb9wNoo/LYU2fVTtge2OHeDJZOT+NHomZyMyJ3XzWmx
	/8gqMfVg1BVkL48feIWyArEwEgHkF3R+WafsEFmgfk9jr8hgJdo5BDKRwa4m8CD6HecFliwES+c
	ovjGiqrRP+4BN7CvGPFea1D/OxDKTzHBOyMipWLD8qRsZ1vBiS9qroCp5VzL4tnnact+XBhaT14
	wydUwBqqpuafHNjmQvpGTRDQS
X-Received: by 2002:a05:6808:3192:b0:401:e61b:5f73 with SMTP id 5614622812f47-404da7297d5mr7267575b6e.11.1747670675288;
        Mon, 19 May 2025 09:04:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyZyTToIU/Tm0w29XMmODH4Q7PLSjPrUHu1JEr6U43DaJPPhGHJwdfk+R/oWRT6oWZU8XAdw==
X-Received: by 2002:a05:6808:3192:b0:401:e61b:5f73 with SMTP id 5614622812f47-404da7297d5mr7267536b6e.11.1747670674851;
        Mon, 19 May 2025 09:04:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:13 +0300
Subject: [PATCH v4 11/30] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-11-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2iSXogYj98Z0EmWLJeT/h5TcIKm1RtdrNrUcq+04pEc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7nh+1P86WtU/CstGK/0Rz8dk6nK9EzSHhT
 JRudh/xG+6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1XlLB/9MCpa9QwflqabW92gpf3LwFi+pewmOWsaany1ahhAkYV7v8mNVr6E2L8ndGQ+f3zoxZcn
 nIxR52XGe6ivVvKN/tuPnohrsj3Pqs2MocM8Gzdobb8PyUfk6nGSXPS96w9ruIZ9lozlta7nAJH
 4nYsFzTYJtw1c55JyedGvkm1/VJ+lGLH4t7+XowIizV7u6xtDxQokMwM1y2y7syb2hAaYT7F9/s
 FXA0V50M17AVEsbyxW/EWSCFdg52zYortLy9SZO9ZAzdfqRYylzZSBD4mBorj3opEWeX0P+Jlxq
 BB2qSzyOKE6xR6us8O1l1By9idqMWmuWCI7sRgdWwMp66iBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b5694 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mhMpPt3WdcsTiPRgRE4mRZxbaEaav-0U
X-Proofpoint-GUID: mhMpPt3WdcsTiPRgRE4mRZxbaEaav-0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX9HP0zGuDKsbN
 eFa5og7Yf2aMzL2VtF8ExNfoDQWUCCwvo3VfueuGdZBG0Pmx8m+tUOffW1B133dUa5+skyFsEpu
 R9BUTW4q3LTovbnb6e6MV50GP7ZqRmifhMKCOYC5WNM/2uZRqHOgLy7dGo9k2AUIECZhrWdlh40
 vP/uaxXmF/HpncfxfOhFpFZJFhFa97q0wkyVIwTZLxdY6EnYnv6n2Dc7k1E+dTZOhzZdrha9CV3
 YF5KlGsB3Ai4iyKEChLQuVSi8ojrINoys49exk1TzZfUH40hDjnqMWHCQXwIM2gI+HIcjfTLAZP
 lsEgGjcjQXSP81gfHbGZIplbrnGwphLAAUl/W+KeI27eCnFpNitNCqSYwA1jFhEQ7udRHaX3wgE
 l7a1lKackc94CsK1O1QZTBDgaJxr5MY1uzvAVBA7DKUz61K7G6v9E5KC3sT5kPnIOvme5oAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

