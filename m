Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B06A218AC3
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565744; cv=none; b=ZoR8lqygQwZRVmEi8MEL8scNfetX7c+tbtGykbvxREZcBJlv65N0R9MLFca3JBn7dIxnHHACjklOdyHIgKtmHSgiR2skkuN5tzy92LZRdPnZDhjSE7JmjRhCUb77ZbUUc3GNmta3dAKO24eIh4QDkrB+NeMB7SOBdiM3AKEJQl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565744; c=relaxed/simple;
	bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqz7/l+rMNxgv6876fOQEDGBA8yTglCED6OW95QKVRo5/hv2wducTRrJc9tLDRAfSLZaJDr/5j7bH7tBHZi4eKcnY5D9+msuaJhF8LQGKeQyqPiNydZ4WyY3g5nTt6ea1pQA7KhV0/iS+zIigzmdSeX73y83fZ3mQSFTYpWBO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwIE9sUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwIE9sUb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7w3Lm005507
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=GwIE9sUbD6PCS+UP
	WvZNYcKd+uxUaPQsBsvy9qSGyyUjx4jdlF2UFfO0y5hT3jaUmHSFJWLmanF8rJ85
	6fDw+wG1z3aObMkR6k93rF/t/swJcGcdZnPCm20gEuX76ho9ajGThVRWHOvNR7rY
	e2aPmRikdXGzdwIzHK+gTnSGcey14VcmrWc3hNWZink/98c+fcEGf0qrp7b15zog
	Rygz4NxZSajiD+bgZfJ7XwlnYDhfHqUra63TanTUU1u9pc/HEla/uPLyyNGheJ/f
	nf1JrbfRUfPmaLdOOzMlEKJbtkEjH6qBxZUXO2hULhy/GkHGE+Y20d8OgeEsSzkT
	GA4u1Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjssv5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8b2d2fef5so39143496d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565741; x=1748170541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
        b=a1W5bslSONUfbGaHZms2FZdWTABX5QKV+aFGAp9B5FzxIGjZktwc6Y1pmff8qYcATM
         X4qJqHrcJp0dq9CeaYvkMElspITYd4VlEXRD5qSHvXQuUsUWv2qCC5nlzXVM8hQF+KOy
         GA24PJHvLvJrQskXhRBtvLVlZObL1Si/371ew8Yy5cmeClnIUU+PeF0H3gaaBUSXlWcS
         ZRqeM70jiFcAzzVCHWxkyMlK5PxKN6jXAY25ZkkStityd79Di9NTZpKy6dMQX+dTxyCh
         MYaea0mfKae3BODZq0V+/mH644Ycxo22bucYzVsyZ3N4XDsxfmP7gDQPO+yohWDT4tQn
         OrGg==
X-Forwarded-Encrypted: i=1; AJvYcCWR7T+L6/u/6mzjMw2V2cO52jQ5p899stsIc0Qs3CBmwX1tR8Tswj4PDH0KdLZJn1PYNyNpFkkPWkyu72I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybg2J1Vpphesqp4rCHQ6hZ4xPb413NHSSUGaylVLR+8StCzB7+
	ZPIB8o+fyZBzOwqqsLCovDgA5OdbTOnjuPR2h4hyosoLiAq23JEPjsbhBfAB0ncuuCyeYmu0mdK
	WxlNLAyRZUmwIXQcPQTIFL57p4lozOhbyFNBc6wOmfF51EJ/g5a1sDjJYiLLpxHpKD7o=
X-Gm-Gg: ASbGncuiKCcRMVJmX9qdEWRV9AJ0gaPKAQXJWDD76NB66PZssLAU8dHneuKRYM37EUH
	2Tkk+Xq5Ui6g3vQu3LNAkdH8yq+zSzKIQAjTx+XfKr/Lae7StmpbjdjZdGWXT2SyuqtYdjMqwin
	n9XHhz0w00+KXrTCD/TqTM+MFlkDdc6E3/y4c0XmUc5zqEGM7yo8spMybBNrW0/kuiG/u4MmeZP
	W4LT7T76534gRVNUy1NtSVdOSrrvPjaERGcQHtJDsQEfKbB59loSmY1RqJ1MWt7UAL8K9NLMVOe
	PvOHzyoY0FgUgtVWJdmwYncs0nRRyTlI2zldNR8yMj+d5w/o+CgX1zxyUwkxPoOzaznbAmAa682
	NotKVcxS5TwQngf53zjBlptp5
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id 6a1803df08f44-6f8b0870f8dmr165088006d6.19.1747565741033;
        Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXPRsgkQ5tj9rTK0IrAjGcywRW1fhh0muvVsDDNPPD2vIhT22UIKWmH4LZ5iw0W13ESp3Geg==
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id 6a1803df08f44-6f8b0870f8dmr165087866d6.19.1747565740747;
        Sun, 18 May 2025 03:55:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:26 +0300
Subject: [PATCH v3 08/11] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-8-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyay+Pq88fpo0dRqmFzoV26PlTC9TQnpNLYR
 5PDNYGJeNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1c58CACfs88NPVsFXzwZNkPLlFX15tdciASdOlLfSQwLHX1zdi9ZhkvLBdU+c7rG27ZPuO9lECA
 WT6uVv5MwGc5jWMOzItU+Irm3L1GXyUuq/XQnE9LV8StycXsG4rbeAlo8K1vJeIHXUOW/XQ7LGs
 +oQr0E6l4R+YERDUKKVjG4s0Q2lDg0syUEyFtFy2Bn+EB/w9KbGRde5v4byWRQRMWtwCwNuZ+dv
 Ahg8Wp9DDrpAkKOnd6yiNp+REb8OAVr8PJOx4bD4cIEIIyqg4FoGhfq9S8J0j/zCfHqkLoZKSqQ
 mFKlUDz3sQLIphcnyldS5gEUvOcQ9eSaKVidN1XfYcOwig5I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gFDhCY3xWIK38aE_t3NUpyq37BdHpL_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX4YZTSSZqkx2P
 DtIULGXlrARxNWKyIk/rhhoQJ2ihz4ItVB0Q+DruB6BxaU5FvwOzkW39kkxoglFxfSQynqrYi7j
 xK45rXJD+Nk1MLstr4RMjIX1O2m7SLi7RuvL0o0olD3UqPYrsbbK/KpjX+P4+fxa/o0SU7tvcnE
 0QOH6gy4S9zhjIRYXkiwjZF5DBEl8NjjG8PlX4X1L4yD6TxZMVHfHO6rse5WgO2fwZQvdBE0NG3
 TByeMy+pt1/+F7uRhREYeWbhrMBnljno4ixoY4eqkMQXZWoLFLzE3qkWeANOa2q4+7vY3beBaDH
 77QDCmj7SrIa1PmTmLpghe4kuve7QLj6zsj4itB0ult0APdKLpXCOytj/YQkpZxYNyLIbQPjoY0
 6yJYusifC7FrC4PrAr6SsxahbQr9s67gWBtpgW6zD/CaFi6a11jotsoZzxuV9Hz3CRJVUeTn
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829bcad cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gFDhCY3xWIK38aE_t3NUpyq37BdHpL_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index cada5832db3e894c9bae4c6b0c6d935dbf5d933f..f6360931ae55a2923264f0e6cc33c6af0d50c706 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -118,6 +116,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

