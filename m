Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BC028C86B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940694; cv=none; b=Ezp9+yJ09+DIQoULf1jArDCfG5wd77xQLlF5UfJOzKnQT3TBq2qbsPm4a5wWjDjEtTvcKHLdQGqQlaIjyYYU5SAcABR8aO3MXqIdLBv04F8chdhTzlynWSeXe0FhvvoqMzSkm99keMmSRnhnXWjKfE+CFlQC/E1rXEHPxTorCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940694; c=relaxed/simple;
	bh=O9ji8OBh4vlhTZ6pq5b+6U/pO0rDo3oBnZXFBMBlu5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S6hshd7yVyS9REBwpbrAb414DCeHvsfiCOCl8Ox+F4qoITFwi35kb2BURCJYbUuHP3fXjvk8bHDa1mb62yDl6ld5CbHL07VXrGgWifiyBgNPKyVUdVsQPKCdUIvZXralFjQ6LU/qUSZl3fWLoRY0xqraW8rq4v18ATIRJy2UihI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyEoVaIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyEoVaIh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFvHlf021413
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nE5tprrwe42jTVhGYtQxPcrcgIHbX+PMNuGmqg0B1qY=; b=QyEoVaIhuvRvU3j/
	Itei7IHdJGkKg3Scy62+ehhTh17RIMBgCvO4oTbG0eFOXjDuhj6JoyY99/OmCykX
	+Y8i81hInD86xFTea0DmLDpszMQWYOWqSPR5IGKAfochP2BF1mLoaDEFBhKEVQID
	hq7Nm0N1eTysKGM/B2ShrjwPPmawoPh/pdkTz03PTfvB3/FFRw9VE+oaWhwPKZ5Z
	YOCYkS+id/5v2MiNXyl3npSgRsD8nIcVtZPhTfKdxVz62VunqL5Jjr6YqPYw4uyD
	2BYfCOkSVqLVdgNnTTxkC3GWneqTngdiVQ9Oul0FNSz6RtEiDpm3/Z34EB8psd4z
	viI0hQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07nyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990715so2260256685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940688; x=1748545488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nE5tprrwe42jTVhGYtQxPcrcgIHbX+PMNuGmqg0B1qY=;
        b=siUjewF0FlbHGX7xPaJN1bX1RLFKbcYVMNtcepPLIlODbn0mwcMAUM+b3iQTY2RsNL
         0zoO0kkpwaWbbh3p0DUS4D9BCyDl5PQUAnTUbEvLipOTbswxQqcRnshdvC3IP6JEk59e
         MEWQw7ZQMEygrXk/BMgSbcq1OGQti1uqUOMQvoeJDn57gpbkztOv7zl+4s0HDIliMqLQ
         pdsLgiaT+jlgBr0V1uaPt1Pvvce9eT4wQdMzytv3VfIADEyoLY9Mreb9yzFhAm3Ofidv
         7jyI6UNdhGeZuedKbsKnArzU7K1JkSufp5VYCxwCwO/K8hxq1arvhQ6MeHEF5+OdTL1O
         2l6w==
X-Forwarded-Encrypted: i=1; AJvYcCVZCO3XQSK2txjVTjc5euYRt5CNX63onE/upD27/rxC1XiBF9UhrzgyYsxcNOj2zI3odbE+iTlrV6IdwVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxikKk1jEJl7FFgnxhEj5cxnMAa67Cpa56p61iny8xLQt0nUvPw
	mVfp362gAkjPKlFQ10vm1WlNrTpX2ojC06fQcs7BzeJfn6I/86YBCMY+qS3WBWuvYLOK12jo4Ul
	6G+8n5jEc+JKVxeuoRzoeuxxUArnvc9g4zl7d3IAeS79k9K/GQnHeBoN/YG3Cnm+kAF0=
X-Gm-Gg: ASbGncujlg/Pd/Jv6hdu3RDWWPhJkPgAJqlCpH9xPVcj9hcnV51C2sf/OZ6fnAYCCA+
	JaL6AnIX1cYHphhhCNjfWS3SaULdW8fyXj9dTiqjEi3KojnIHFLh2AvJQK5WOgp/0c9nIMkd/bq
	Ufp1Eq3WCcMmA1mPyJAgFYkUTs/kyhd0c3pKtCJbpVhWh7o7hC9XrG6K8HaqDecTDaSW0CbmH40
	nZc7fptZu4bcwvQbimL40Tc5ZHaaYc0soKk4SWu6H9B55QgYkbBquCM8UTbmpgcsDTlReTba6C3
	G56OeL/0TNV/v+S9u2tPuLWktFzC0n49K5Rj3ersP9ClLCD1uNnh/AXf/shDPuu5QsB2ovqDi5u
	K2+AKtQsMo9OpkD5uHE2wajOC
X-Received: by 2002:a05:620a:1921:b0:7c5:588a:5c1e with SMTP id af79cd13be357-7cee31bb78amr10258185a.30.1747940688508;
        Thu, 22 May 2025 12:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkQf4iYOb+R7gZkuxnEEAFbAY9pkxcEXxvh6KgjMPAunK1Wl091Ux8xgk6avNXsw0IdSEwhw==
X-Received: by 2002:a05:620a:1921:b0:7c5:588a:5c1e with SMTP id af79cd13be357-7cee31bb78amr10255385a.30.1747940688112;
        Thu, 22 May 2025 12:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:45 +0300
Subject: [PATCH v5 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-26-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4092;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7M/iNn8Ew4gxIUAAXQyq3p4514IfgJwZSifVWuJ64Es=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/ltEETAjjBBBfUagRxTpTHI0tUcNcahXfZ
 MqaHz2NJgaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1TZgB/9iGw+xNjh+CkkKPHpQuXxKnjnNTGVmcvXJoW5SnupSoYZuyMKdnY2UwfQnu+LcX2hRLMh
 O0f5woQIGva/LbgbGJHOr4hTw1NX/t9QZwgKJ641Pvtas99rJJXjp0GuQEmIHKhiA3b2SiGrwHx
 ib150tZBk8rSS//Dt767F6RLDBwJrvzQDpa4/7urHXIew1asEKMThkaxGQLfmsMskHEDQjC85BU
 SrZ4kX61Cn+FJP1G7BAZowppSLTqrRDfqTnuthLBy0hSmW6ZjgdAWFicYmuIHe35LFC7so8Teut
 ZW74cv6xlxMMQbyAKec64kZkotTDWgcTzXRSa1WYIe3WbUP8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FaU4ZBJqTJAmfJRXG0D4zm0UmBcHpAGa
X-Proofpoint-ORIG-GUID: FaU4ZBJqTJAmfJRXG0D4zm0UmBcHpAGa
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f7551 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J_vUdAVH12ZdhNMp4K8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX3ByCHS46LyJ1
 JyPjMkrngc/84g1XxVdHUIgwlTgXXbJKv/cT4K+S/bJKVCVU8VAXSGiZbr6KHZvWaBefsETpv4W
 9v14d1lPeBIejATbj4t3zYJpIJEoFZxhZItyPyZm5nnKXiuPtGrPTxlj0jByLgx84JlqHbcELwL
 FzgBHwQUu+VS7hP43hTRntCpLuOYukvQWVuazIf8KseLTEYa+tIz7CPO3Ej+oFzOnC5cv/dGmvG
 SCvSMN6e8mNZdJLoS2BFOOfBmWgYvUMpFr/ABhJohyXolRvWS/EjTYVLikC7JLtdCrb7JGGD/Jo
 epAsnwCHJvVhYs/KE0+QsdawMyVJpBb0WLliykzJ31nLpW/8IChEyo115duq0PjV+oxmkEclr2/
 0uI9EX3GLtKY5r6YGOEP4A3pHUHjvDpA0P4vfgnPo21kybxyqSBjrKUhNQHZ6Rk01ny7fgJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

