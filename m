Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24696230BFD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487061; cv=none; b=fDmDMJ7VJGDbkbHH11wy6wn7PoGUiZpEVoIj4pbEqNZZBUAcCmTaU++Vg6++nlGTzchFs6/gk/ifvv7g2r3Hf3btS3Zf3XozWaU29EP2W0oamQBT6A1Y+Xoo0Ohh+NcedBh4z4HNblq3supSAZfzewntyQFXYmFALnXpuma3YuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487061; c=relaxed/simple;
	bh=ae7CdbyFk93QlhPpKlxCGQ4xEXgjUDbq+zL9XeOfraE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qrNNWYEGpKwQUEmaE81e0Sz9KUUn9X9FXXLruNeYKqq6knEHFx15fuEAB7kXFN4stu4se39GQTm1fNDIm6KRyc5qJ4RMu+nj0pakcr7aSDDI+KQTbAcdGqYrtxEFMaVLW7QlWwx2k9fGSd7UEKpX1eqWL0dwirUyRLyb1HpsM+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k6r9JyJ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k6r9JyJ0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0GlJN019260
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RaiLXmSFyRRrX3ufrwuFBRGXKu/EKdvWcLLrhUCzJA8=; b=k6r9JyJ0vseAm7xo
	5tPC+SKKZRqIrxgh06W7J/Xgr9rdG/0NaOEz5CcgxtyBh+8AsS3+2XsmAdIffJ5J
	4IJOgMeA02pg4nJmB0bonSKQ+TOWkY/lemyBI+48ezW0YNYNU8yI2O8ZRyhkqX8K
	dOM8OHK4SqotiWdGnA9cjZweIq5jHh9//O/6n6UJKNkvLrIF63/vKQkcmFK5lRhG
	9vrSj7oeFr+CZzYjMnPkyD9puOodY8QBqAUAku2mIlYYDoctPA+30hX+My7BZOBq
	Are+SuNcy+z4UncdABfxQzC4KKFpP8wQeE/s6b9NxfCGFA4wd6FEozu6UGtD0Anp
	TCzxIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh14y4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso142232685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487057; x=1746091857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaiLXmSFyRRrX3ufrwuFBRGXKu/EKdvWcLLrhUCzJA8=;
        b=S2baY5keLRA70NSTQUSRl0zoEPDPMImcsb/OscAHcyW3HxS7CmdOCWTxqP541btTib
         bdpca1o72gLN9oKlz4EjdtbLvnMoXv1AzxTNgXuGWGPpy+CFRuDLr+HSgiIthvvSY5Ks
         HcwuzJTxiwketIbVgFZGPqPRGVBqFEncVAwMY24NZdHK5a91YlEHtKAznDrpGZ6qW+42
         R4mKREDExdcUw2RAwxUF+IfdjAerSY1T87HwTXXmZ3XLfGD/KKx1SHDhdnEbsPoAHCTc
         n3Ccvp9UFjNPK0zxN/gTgmX4KjPxWThIfVdlVdj2NC6W/OmuLRQi+IP1jwFLM6pZv7cV
         Mbpg==
X-Forwarded-Encrypted: i=1; AJvYcCWUkRwPRYCRgH0lZFBaC/cKvEe57Ca87NZgAar60gfSmzLtySL8ZdrjtFfgVx/JBt267oy10CEGZ+Cwrug=@vger.kernel.org
X-Gm-Message-State: AOJu0YylnJcOw9iynaSOUAPMSZMuxNNNyiQ7BhVARRXfJIUdEIQftekm
	DV8+1eMVrVr9cqvrF2a7IpnzHfq+983LOLD0v6DNG57qY54PRwUuU/zLIgUGqgDjhZ8cFdgmoaY
	ubvlu+jliBsVaYB7TdC0L9vdTXOCfXHQL6DM8OYtG5ocxWgtaF20oPPtLpKwR+y4=
X-Gm-Gg: ASbGncve083gXjaostmb9iHuyUX03SnSH3sIcKmp12vU9q0hGjR4sXEP5bM1w+aTu5q
	KdY9cxh0Qu9jaL0gU8/48NKSmO2wiQq2hG4Ush6tgZtYXH1hMPQiW+v1qaXWRvwpD/w2VwGPR6e
	Ma2Qeq1Xpo+NQGHxae10ckQW0U4msOqVXySZJZ7SRYuFHzxb5IAXVppTCK7QuM7TpnelHdImZen
	392BDYTLoGv0y39QZMJGnJSlmsQjrPvhq3JDZRgSIUEBAJ09x91ML8DPQOaQrWQ/fTeW2mLTA0W
	ZaCmEH+91Vs8xVSbxAKBpqT+jyZgaS0bEOXpVK2P7GOe1dagiGNiJChjVuZBwAtcECbNbnCmSby
	1T6CuumWh/eAB0kjgjZ5r4Q99
X-Received: by 2002:a05:620a:25d2:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c956f88647mr351773885a.48.1745487056712;
        Thu, 24 Apr 2025 02:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhTIv72wVA/57mwaw1hcPs6/v32cw7AVJI/SfbbyrB4/tZ68WXBKkDxGD38ASVFqXkc8/EwQ==
X-Received: by 2002:a05:620a:25d2:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c956f88647mr351770285a.48.1745487056368;
        Thu, 24 Apr 2025 02:30:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:22 +0300
Subject: [PATCH v3 18/33] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-18-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8032;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aitBeEK1lAlbuZORfcr1XUSiZGXBb4ytUSBho231JhA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwYXy7obB8ysJ/X9absq7FhXbM4sX7W4e7s203GW2ttdr
 KoT2dk6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARFU0OhgliV8UOnPr6WpPB
 YcvHe65s3txBHT6rO0N3ZAfYb3Q8mvogkG3pj40rxJY4971ikbxVu8k86I2oWn785K+7NwUdmNB
 zhnGKwFtzqYe3T/l6nuJwFm/3YXweYp8QL2d67LjjuuUfZuws/Vr59ODuA0ERc4tDwyp5r+8Ikz
 3EGXB55f5HvbMtZv2plglm11fuT9P9EHSLrY1JdFeUpLBGQ3ffjLubShQeMX0JTC3uvThFQLrsy
 0njl6K3Jy394nbsQtpFgfIcx9diTVXPVZ5b7vP+dfho1TmGn3JhvgUXfzCmZtqmFzhF+11p3LNV
 KsB+lSWT2SbpQ/sNeNvT3rJKPd/pztv3OPtVtqOE34NHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vGaxVbOWnEaDtCN_qHHbp1m5qVwEPMTS
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a04d1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ul0-cYutqJjMKJRySm4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vGaxVbOWnEaDtCN_qHHbp1m5qVwEPMTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX0EcgXnSleBDN AUjesH4+cTQL972EbAfint6P0MqSUWOFPqS6wFAbfuEUxnhEWMKJK75Zsp1+C60+KHymSDFTOKk o/q5D5kf3VW+ZIYQ+878q7u6vpbnoBtpnuYbMQ+BfjinRFdkt7YTJs0+8v9/+kEyJjkuSY4Ky20
 j+/72gXQzR5qTBKOlp6SfiYj6dxmwYLK/+mK1vZhJI7XGpvHItz8AuBgBd9URk3ZPRQvwnerjQ1 AP6CG/4kEdhgvOHJnDx8LHzGz/jtLtLDGmk50J0t3s6lDL7RkzpsalTvVRcWsLNCiTnlBx9Bk9+ Tvq4hUipqzOHHGZEHwHQa+SSubRka9VTSW1GSUb1YmVEnnkHCmeaUaDC9UpnYIsLVutPhEOvX/+
 eX/xB2HonhdaMiI+yqwOcgSFXVw0nQb6gsbU0GZSXs+aDzT4c4aO96yGTFVcsbpmXF1Fp0nH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=810 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_VSYNC_SEL feature bit with the core_major_ver < 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 10 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index c0b4db94777c42efd941fdd52993b854ab54c694..29e0eba91930f96fb94c97c33b4490771c3a7c17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8937_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index d3e4c48be306a04b457cc002910eb018a3f13154..cb1ee4b63f9fe8f0b069ad4a75b121d40e988d2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8917_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index c488b88332d0e69cfb23bcf4e41a2e4f4be6844d..b44d02b48418f7bca50b04119540122fb861b971 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8953_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index ac0d872ac06be7376b7b4111e1ac5f4057b5fb76..436fa56e2ba2d867b58b59ec6b02d1d0f396c23b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -22,7 +22,6 @@ static const struct dpu_mdp_cfg msm8996_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b171e26165f11185645ac5e6d22c499a949d8271..38cdea019bf2b1391c242953e4c67d9dc4c2274c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -23,7 +23,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_mdp_cfg msm8998_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 6308dece88db70932d55d1e2d4e8af713996d9e0..176640bff1214e89606286ce572f74300f6f343f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sdm660_dpu_caps = {
 static const struct dpu_mdp_cfg sdm660_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 25954ae17cec5b141637e7c2eba29a1bc826b1fe..e6eb95173cfef2a52f5dc606ca41a2f1f5650c2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sdm630_dpu_caps = {
 static const struct dpu_mdp_cfg sdm630_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 283e709065be31131f6bc51580296e836b8487ae..9f04c7cd5539c012a9490556a5736d09aa0a10c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 530eb74b0548b0a257abc89c3e12ab990addd550..3a0de200cc5c9751adebe681f80679e0d527ab1c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -34,8 +34,6 @@
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
  * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
  *			   in a failure
- * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
- *                         (moved into INTF block since DPU 5.0.0)
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -44,7 +42,6 @@ enum {
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_PERIPH_0_REMOVED,
-	DPU_MDP_VSYNC_SEL,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd..cebe7ce7b258fc178a687770906f7c4c20aa0d4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -270,7 +270,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
 	ops->get_danger_status = dpu_hw_get_danger_status;
 
-	if (cap & BIT(DPU_MDP_VSYNC_SEL))
+	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
 	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;

-- 
2.39.5

