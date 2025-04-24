Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893924A07C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487090; cv=none; b=n9qmMheX67nswt+5gX4LH2/V6BH9kIgUhT2IpARArvRgHYV9wtF5r24aCquHWJjcq6u03wUPv6pJB9WfB4MmBkYehmGQ+mKlAij/72cqUK+IBvYBTA866R2m5NzJhVr1AptLNi/GLt2VbcJRaWIDDz49pGBUL4ON2Tji2UXgRfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487090; c=relaxed/simple;
	bh=3dNs9Ag6k3c7jwYRG2w0d/lQvSjt1TVp/ua+lqoPeoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8M9+zLxbKy6UFNptYvMGrnqE++EWYJ3K4YcMxh6Nb1FVl/uR7quc8cVg7t6B1EYQF88Avch3VeB8moy0nf/JU5w7Cblpa00rRT5QOaeXa5dvdzMI5mx3MZEukbQ8wATe/xJrZPCDgkoyG6ZguJN2hGfndYBclJU1RuHNNwFOYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8gPPTU4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8gPPTU4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6AZ028361
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7PNBZtXubLCDCToxeC3+n/OuOG7mhkAiKUlm570YsJM=; b=f8gPPTU4A58ZU46U
	Y9y4hsY93cdF+W9rb8kHqrcUJL4RSA5gn9PinQTMMQGoSTNeM2Wi9VNXIB/OqHuw
	aqoA5TTX90SmckGSBqdPS6aRUihUobeDzvrzoLlDQQw1rNAQqPnln7LWHphnqBvD
	WSL+teuKWqPmqkq7LHOAoaIp1JXKECw3lNVponZnC1gCsBYovKWOH1lYGv9G8yPR
	YE4iVxNyL2aNKJRxY0AMij6EqYRXjJ95twyQegIxlFNuUEB58bF3GhoBOG37KfVQ
	SVr5RXd8Q4hGSVgxOmbrvaNhKtZB4tNgD6dQHWyqKf57Eds6uGAvfc0wudQ1D4yR
	wJ2tiw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy5041-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so142287185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487086; x=1746091886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PNBZtXubLCDCToxeC3+n/OuOG7mhkAiKUlm570YsJM=;
        b=a7PkAA6biqK9lMJPdsjRVTdT4DRIydYK+Xuca02GtxKYct1HlvbASfplQ13YPyzlhL
         0tLGJpljC57xB1Ue6Y96OX8rICxRtbOWsnXbhIByRtfrvNXvLZ8x9a5kxGSUVHaLCLKH
         YpHBLXxpfOWpqonVPEv8gcGZHWMqdJ8VHbn4ugfK9hLQYi+5Y+V0iaiv7hC0ao2PyYsF
         ullFuEenivLY1Xp5cAR/q3qlIh2OqU2p5op/X1YvCD0PEFPDeIAQPPvEdv3boEK2HqRx
         qCyQ7noG6FG8YNwGEY+uDUZRA6CzpTMEgK8CnundBVdqZgAY+Jn6cICVNuYDy74A/ExV
         6HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDvLA5rNk2wZnQq+vmbpNyVPg9/cIKZEyAdOJZ/Hpg46dAfXqBRPXy3P+dDL52sYIxIOF8hOc0bx/6jUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8s3O8nNIlR8UJY1DC9PTAiEbPIpIQY1qsfsrimWk8z/UJamLP
	HKNg9PZr8laoFKbXcxudda5so9VMCOi1H4PqCyFFBe0h7CDAOx2b/71+dk0i4q2CajyyBF+FdVu
	SnpcZm7IwJSRfanhGpAJjdcRv+feKnu6931RNmr1wVmSoOxq2duIHfq3E3trNrrk=
X-Gm-Gg: ASbGncvOmvVsxJYsG472usaU5jGkDydMIkS29SqvPEvHCjqz+ya/4TYA3rYVSW7Rpct
	Sw9wmlNP6RdZXoUT5ttLtJTpKry6wXAEKSG2ouFyq6z3dsOonYw9OI2UoJVRlXiqbdmrAmfpsAT
	6CpkkDdattG9cKim9aE/dnVfmB2BKgA+p7aWGsY4WmdG1lILaXaiupXWpBl1w8vjo82qugY1lmV
	4G9kOcTJ4wFtR0U7CNe3XgcRqczmUTId1wAavKLG8KfwNCNNpAmIRGkZnV1kxryl2JSpH4crbCp
	2yTCeFT3nm0M+87cascHia57xr8RjI1oRUFY0EWLK9SPCXCx2JZK8YYV0c/tWMC97jQtRVtPhcY
	hfHBcyUVa9udbOXhiUMs94YMa
X-Received: by 2002:a05:620a:4248:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7c956dd8d70mr264199285a.0.1745487085683;
        Thu, 24 Apr 2025 02:31:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRgqWHFAo1O8CyyUzKScKs4yqG/U35Gg1gF/3mzZokEAhgjTKyDllbtIcMWUBO7Xgoaxe20A==
X-Received: by 2002:a05:620a:4248:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7c956dd8d70mr264195685a.0.1745487085187;
        Thu, 24 Apr 2025 02:31:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:36 +0300
Subject: [PATCH v3 32/33] drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-32-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19053;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuzeyYdgiGBBde5Be5d/SQvYU4hkMOTM2wddPYh6vlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSx0vo/F5SF9DiHV1VOr0U7ekULYjZess+4i
 3FxyxsT1jSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsQAKCRCLPIo+Aiko
 1ciDB/9SkUi+Q45zIEPjhBcLYmG9E9nz0KRVq52GhZtyLp/Lr1TyBn0sdEtluGm9DPXoPEylx+I
 naefdtZKwacljx5Prcsp3n1/fwYysy4Schus4cx3H0e0XIe3DZ1Xpjui02sMf9wNP7tXYJm7ARA
 ofINox8PuSEomk8xQb4SQ1B3uL1sV3wAT9NXYtHPKwnuDrDpeiT72uz4tnBmVw/9nQ+UiPyInxW
 zxhHn5J7Rk3EsXScXy4TnBCDm6Hj/j4dyCTWjbZdlh7EtuxuK4wqW4WsZiQd9K2lUOaOG8XixJV
 mKwijrm4xLf6QvVGK1SO62ziNgT7w1M+Lw8v3bcxpY0nTTgW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXzE3pbMpaD0ZT ivWUVNbiZYUpALZ5tBUnUA5J9jJacH0zXwz7pOjc0F03bvXGb+PvgyOfuckix445a/+vSC7UaB7 yR0rA02Jf0MkIJG82XTzHB7COrI/Q5tAoswHSj+tuKzuZrs3QO6LwDPg1XZjeV5A7ugtFYFvzay
 d0X4KJhq2sFix4TA23J7V8s38hlZwu3Z+aY7THSDIMYv6yiOulh9n7Pf7d3+pIKBntNUQIJMJl7 N6z8CARXfmQ8FSXBwxAMt2LuexI+mKCvNkpwKM35vtbXrLdtWsjHI/RszBQqphG5aRhVp5+pevN BuL/QLyhkOgePsugzVbF4j/QTVHO3lC1FZnTQ24gLSizfV+GdldMvTYmh2H6w/MMDVx+fc+DGCp
 mRrLDYT7QwXlCGZDUYQnINM96Om3V3/uCCOEGBfRhf8XHxYOLXHqDUaJP2xlnmopmZvU4xP6
X-Proofpoint-GUID: LimLYnOVmOfUypFmkY2C4LGsKA6Bq0Pt
X-Proofpoint-ORIG-GUID: LimLYnOVmOfUypFmkY2C4LGsKA6Bq0Pt
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a04ef cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=0OrUzzk_IYoRGeAKyEIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue cleanup of the feature flags and replace the last remaining CTL
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  9 +++------
 17 files changed, 44 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index b8cac2dbec3c963b1a15337c64810a23ac6afc9e..f1adbf0db64716bba09bf88e59c516418c57214d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8650_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 1f119f79545eb1f4c6d27fe9fcb2a22d038cc571..9a4040921db78e13c04199d0c533be47c9d77f30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -41,7 +41,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -50,7 +50,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index c8008db5772498d3bb85596518a3a21395fc9491..04301d2ba34f3275deee2b0e89105ff4616a7c2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -36,7 +36,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -45,7 +45,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 70d7751831b738d40ab7e736ddb442c4d44e982e..35d2feea79e8c8673fafd1be83d554efdf21b32a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -35,7 +35,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -44,7 +44,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 1218a3585cbc8664194692cdd2639af1c7888c39..2f3564c6672ae86203629194981e911f7ebf8bef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -39,12 +39,12 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 520f5cd122dd331ca1a1d9cc1ebd7654264f3e52..63ff6e9549b6289534cd41efc9891c5a1cb2672e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -36,17 +36,17 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c1827c80e7efef9c57757e0b53535d9fbba30c05..47c2757e47a0a18350f13c57fab401dd5439bf08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -40,12 +40,12 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index d4c7c59e1ba845e087bcbc3394fc972a9058943d..9a7b0de857db2d13b7a4415e3452c1ad4140df36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -37,12 +37,12 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 50eea89a885ecf0d4ff4f478e6d356d86285bb3e..cbf8e1f7314ee15b6f78917e2a36006f6e9d9245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 26266d36520e7499feb26da0f3351405bbd2f87a..774fe5e1c513e0cb8cb3ff4dad95b03311350c61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index f9c572be7fea9660d03284d815067a17ac4abe4a..443500970f669ea6f38dd11d4d0c90fe92bdb455 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 08d5273554500a00a55adbe144b50fb4f8296ce7..82df68fd01dc64fcb95cbb0bd70991b428829479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index d4eaf89821722bfccefe930e834cbd83d52123e0..f3fe68587dee21f059b68c1cecfe3f68c2bf48a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sa8775p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 83dce1aef9d991afb7f30f75724a822854be3e78..97c4e3b74c5bcefd0d9535b9356bc2010841597b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 2938ff15299ecc5002aa1bffd02292212fe51f03..18773f318131265aadc6cca9b17a73ebf2f091b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -25,17 +25,17 @@ static const struct dpu_mdp_cfg x1e80100_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0f78958ac4476de414d07b727c08feec1c2e9f44..ffc54f77fe5c8883e926e0c63825c9424904cf2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -73,16 +73,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_MAX
- */
-enum {
-	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_MAX
-};
-
 /**
   * WB sub-blocks and features
   * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
@@ -371,10 +361,12 @@ struct dpu_mdp_cfg {
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
  * @intr_start:        interrupt index for CTL_START
+ * @has_split_display:	CTL supports video mode split display
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
 	unsigned int intr_start;
+	unsigned long has_split_display : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f118c6caa1b9007eb03fa9b39efa87dfb46583ba..1698c5a4447c22c57c3ce9327b9c81559a6fd921 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -451,8 +451,6 @@ static int _dpu_rm_reserve_ctls(
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
-		unsigned long features;
-		bool has_split_display;
 
 		if (!rm->ctl_blks[j])
 			continue;
@@ -460,12 +458,11 @@ static int _dpu_rm_reserve_ctls(
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
-		features = ctl->caps->features;
-		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("ctl %d split_display %d\n", j + CTL_0,
+			  ctl->caps->has_split_display);
 
-		if (needs_split_display != has_split_display)
+		if (needs_split_display != ctl->caps->has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5

