Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56E628B7E0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670718; cv=none; b=CRTCADcS7BCHVdgv+WG+a1RhCirHeTKMgpEDHiXKw8SRxr5pZwXhCKSffO2JYbMEW0TlxbBmWM6v8wdUVEnCS59tcGVaMGxo1u1YdGror02kjtlTbO/JxsekPEzTuF3zcb/ESr7OB8OhAqksbgvY9sZwj3Ps3nh10xa/KpcFw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670718; c=relaxed/simple;
	bh=0jeV0cB1ciNiHJqLAxEmWL4T47S6GJvwMbYLSQ52Txg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/iaXRbE7Ht4XCAfZg0Yz69A3S9SPdaJ+HBJp+mjWWv48eqgH6xc+SXJQy6bzLrkSfTEWJ+77LjaQabYlAkL/7/EzEZXhvQ8TwyMtSRejOJJIBxRzyKQ/sjsdXrZRyV1Dr1gA+xj0zn6RKB35iQCTmwTjxYIYNg1vCIZFIwSLfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ht3E7QG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ht3E7QG/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Xo3i032634
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2neXdOhnJTjuU17ok+uwBfbRcitQtwF8akxouMK3jPU=; b=Ht3E7QG/4eKq+y9j
	Af5/ivP8j1nUOnjR+B86fPt3/0FmPnY8NpAQhH8QrdXo/M8ReOhDwEeAVDZq55SS
	zGw8wMJV8KSY8xe4S35vkeyzNAPnPmLrKUnTe8sPXVIH7g065Ucc94wDTp81RSEj
	69bUkUQNYuC7KrDKPsFhLMqC6VLUHY5c7ThnbLkyDrnbXb0jh3s7s0SwaVbkAceJ
	Aw7jINweLkhNwLum4bCa2ZtOLOeYkj6L2j4cxxSMkeIIl18ZwRbicZ6MHxHh1R6M
	0x09L6xU4AjP1JYekEMFy9QuIsVodHmtM1RYqYhSVoDYMoT/vAbSQW5wAmZj1Qb9
	L8sLjQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:15 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-731e2cf219eso1586985a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670714; x=1748275514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2neXdOhnJTjuU17ok+uwBfbRcitQtwF8akxouMK3jPU=;
        b=LvhahZN5qXNBFu5m4JBITDnwHkgpBdoQepyx9O4KkE2fq8BVA16pVs7htgI7+LDNIW
         KsV25CHc8kcnf75l1QGE9pOMz8tC02IJ0gcNtDXu6pW2ARlytCwAhh2EvYhxUBGlylhD
         HJBmWwqw74Ydnyb/49ZO06b3qGIeq3VstIUfrN6Kd4Uq17sw4re6+e6zQyptBdSIFcao
         C7SywcmVipxf7sqxRqbHdaM+8ad2hDtfYrbGEDDOObzvsIyFt7CCmGFARMBKFlGfFC2w
         9ERIOw4ov5/xPQ/ZGgnYqa8VEXH7ts1bYQ94ApBMQ1vq4+HpmYbjKRrEksdwa9AJu+cd
         Vf8w==
X-Forwarded-Encrypted: i=1; AJvYcCWMLxyf/O6dRvy1LkMuIlRMWdB+2W3k8cwT4bbWoZfEbCJGsdRuExDH+T9p3LM82UPx8ahMfrdphC860aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoOgxDH/ubFzuzMYakI1I6exHDoJjwpIko4SiyrHTx//7AeC2
	+Goo1IV1UBZhJlrjHV6WchzEcb2oGruYwQc5+EAXe0t7aR7DUqtOyumWG0nKmDqWc6xBYnjX9Dy
	DdKte5yn3amVJkbhP+ru0L1MijX75VGJrYAbCjOo6B5ffB6wYZk2UOKj6eP34M//S+K60lzo6lB
	w=
X-Gm-Gg: ASbGnctFKsnBKE/c9oBmwbcqzl6l0mRplnjHOQMZ3UHlakeU2dN7nyN2SeYFsrni9GY
	yBU7YZXJ2TZCNQA/OUTrrm6KXq38C1uMMOq9zWX/EfqNg7ieKvpp0yMxbx8cPKkakFxe17bAxcI
	9eW9/bnT/DLmbES41Wa07UGr0vwyJfsnrVSbamN7NuaA4bVmKbPU0/R+a6kIQYv0lCHdbXjm5or
	qvFqT68/EbpyS2dgCUclkxWTm0BERxZvh8kwy6J+ZqHQhjd0x+asNWjLI0/tKpQyvBl2OkPmU/A
	N1dyDdBtc+nbpkbSEnUz55WmqmBKN8VJwYdlFGGlT3/IV+tebh26HxxgcRxPc3VArR4hHGTaanv
	mkNUoQyBPOh5z8NdDlVhRPCRh
X-Received: by 2002:a05:6808:3a0f:b0:402:b0f:4ccc with SMTP id 5614622812f47-404da767684mr6654814b6e.16.1747670714433;
        Mon, 19 May 2025 09:05:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUbV3ew6oubfUnWxt1aUvELzaHK0OJtSZQcmN+b2tu6H7JVXztI0DPcE351TF1eCUf+mbv1A==
X-Received: by 2002:a05:6808:3a0f:b0:402:b0f:4ccc with SMTP id 5614622812f47-404da767684mr6654761b6e.16.1747670713990;
        Mon, 19 May 2025 09:05:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:28 +0300
Subject: [PATCH v4 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4035;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L7mJTI5rsgbVWMUZu2GxZgWbaMQSjJd7VgKp6IzcT1Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9Th6fbTLW609TJZpxgvCPsfDseBOvrb6DS
 VP0FRT1Xo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1du7B/0ecWkTu3CSsdMWL26axm8CMUPNeM/eFtG0F7Dvu4Uri3nA7ZdQwSAhw+p8ECqDwz+v/dn
 iPd00IBfeLw/0WKbjPhgkCFIpj0wECf0+o8IbrHck9PTgrmiJ4uMnvCoP5ttZpk/y+Q0R3XD6ij
 r7VB2orTwhcWzP50dKSizx3Qi+U16WB4izsrCnvWO2Q2QWtf4bHX0ja6180jtrKfV4PIczMVkAI
 catNlf2O01tr9eGP3348o6ICm93XFKbYI/CeerjKPNNUQfM4oFajbBfRNa60kVkcnlbR2PraulS
 oxloSi9sqg96NEuv9AgUuedAk9CGDlWn+ZaiQgyT/jS3HUAh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b56bb cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8GrYFQBjgVhM5uvzyoMA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fNqJpsCJ5D-ZkaSaABQXz1QbxIxlE3XK
X-Proofpoint-GUID: fNqJpsCJ5D-ZkaSaABQXz1QbxIxlE3XK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX7Z8fdCYEMC/c
 XhuYjnrmhTkK/87aBRzb6wsqpZJVC4/rfDnNLq7YgOxiOmJvwlPL3fANe9SU+oqZVyNQpz0NGnZ
 418WuWccWrncmk2h9dgSDaqtpq6UbCPfdw8vAUMr3w5FvoUmadPxErmlRWYLfD83S/yliCZaZAX
 mynERgBJkGYWNuEClYi3sP2lNp2Zc7xcNgRKwxQw/aTQN4vCYpPn23B3IvBajyctn2+XBXLrea9
 gqwzeONbXNkF5hTxxBuRGOW7vxE0xgABwZpB7iwcoCamSqdTgR8CVXUA3mUY3mEUX79+ZKigydK
 50j3dAZjRPVoK0lySAlnq8n09vgRCabEldT+OJGKQAsJGv1820Azhd1qj/AUgHLpsEfLBa3f9BV
 15WaiSTdeZaXpc+x/n3ZPLAEVl5ptkSCeTUIPAhEJEUaAjqFPa0OLzs/4FvjySk6qs+outUl
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
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6d7be74bafe326a1998a69ed9b3495c5acf6350f..a276a1beaf95d183f6119452e5516fa8ee60cef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -35,12 +35,12 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_NO_SDMA \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
+	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
 	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK)
 
 #define DMA_MSM8953_MASK \
 	(BIT(DPU_SSPP_QOS))
@@ -60,7 +60,7 @@
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_SDM845_MASK_NO_SDMA \
-	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
+	(BIT(DPU_SSPP_QOS) | \
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8c394e7d6496ca2d120c81c7776b4b979368be23..c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -50,7 +50,6 @@ enum {
  * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
  * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
  * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
- * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
  * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
  * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
  * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
@@ -68,7 +67,6 @@ enum {
 	DPU_SSPP_CSC_10BIT,
 	DPU_SSPP_CURSOR,
 	DPU_SSPP_QOS,
-	DPU_SSPP_QOS_8LVL,
 	DPU_SSPP_EXCL_RECT,
 	DPU_SSPP_SMART_DMA_V1,
 	DPU_SSPP_SMART_DMA_V2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
 		return;
 
 	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
-			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
+			      ctx->mdss_ver->core_major_ver >= 4,
 			      cfg);
 }
 
@@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
+
+	hw_pipe->mdss_ver = mdss_rev;
+
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -314,6 +314,8 @@ struct dpu_hw_sspp {
 	enum dpu_sspp idx;
 	const struct dpu_sspp_cfg *cap;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* Ops */
 	struct dpu_hw_sspp_ops ops;
 };

-- 
2.39.5

