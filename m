Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159EF2C17B1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940688; cv=none; b=UZtK5rqM08NTCw/pRk+PkaWWd2LtHY48wvYHrIFQFaNttsQ8wh3j2o8OUoSkzTSZ+McTFe3cFXA4Deu9+lW4AfVrJZdCL4MAAgyjZ3SKsLGT60jrDpAk+90FbmcfXD/MyGKncCeRGhYajNKIulc1JOYXyR4DCAjXFx2eF4+hGjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940688; c=relaxed/simple;
	bh=JtnwSzCWHzwna/uyn/h/bOlbUw6XPXd/lQWqYDReZGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iLpydRD2Waw/xYYLIx1rROzCSK0qWEMTmk6YGQ71/5Co6pBcLw8fs6113EKSjFzwzDoZz/SZ98du2ZJufvtsXm/rg2Mo9R6Cx5ROvwjVu9vSrvpKuMjDeir7hGI/i4T/MX7vL+9sq2rseuc+ovYwniSL/2dIuGSquMgnBv5tJBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELqIjsQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELqIjsQO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9jsuV021071
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpN/CnUlP7ExEMFJ6Lj0n+5sEZlYXBRWKrZN9ll5aNo=; b=ELqIjsQOOeXzd/d5
	9zO+E71GAEOLoYz1waVrrz/xjI0EZUK8IQ3kRR0A17d7I/jPK9IDd+pkIWPhhlh3
	/zak7vQjGChhQ+hV4YuDPVSYOUzTgWoCYaR5y1xmEK3QIk1phSY0AycizMcBiVDe
	NEkK1AJ9MB7x4DXMNlr8dGXgksUPBJVSXBidP9hyUy/PJeBbH2seOAG0pHw84CHI
	EZW9oSr6kb8PRRT4KJMNvK86U8nudxCzDcWeLW2UsMmnSVhFsWxQ8UtwVw/FdiaH
	NaAi/xMFpk3CTOnBQdAbEHxUHC3rQNK8Gqe/C5eN1Mo4M0UMxDdXaQaCR/QnIgSp
	7tkV1w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yfde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:41 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-400a20ffed7so140683b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940680; x=1748545480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpN/CnUlP7ExEMFJ6Lj0n+5sEZlYXBRWKrZN9ll5aNo=;
        b=A2g8PplZX7kJzNydIGDOkPuIw8bFfPl89D7MWfFUsU+rTfW20wlTSSq4Le98fb7img
         53Ag2hWrW2yJw2YidaLjHWVgD99ROTyUVinPbsTjBgoYmFEiO7Ki304nNIntQBQfeWdh
         sQejGuZimS1UofDzcZwmgnMhsjYA4NijXf7HX4tZhDnIPb5VWv1HMM/mtS0H4Pqcupdi
         ew3zNXE+bzxQyaidaLJnMIqwTzJKX0A/J58huHHGw/XXDFf1JtanhFqagP2MESPTYZSf
         bJb6X3Ylq5fxvreupmUPYjKjvvG8OHtTJQ3lH26OYNOE/dVelS+WehHZdg9QKXVyBSoC
         qOCw==
X-Forwarded-Encrypted: i=1; AJvYcCUnpnrqKrYzMGSRWj/ihqXZkFK9a2w8wf6e8BsMKH9YXvauiCIn1sZP3PcFNsfkPM3d96jD352jQNyf/QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTAy+WCyulCnqaRWdRp2zq4ZuEgJkz7w6Kf1tQXRYMxKNMb8r
	geZS7NWMF77mxw/udt5d0rfda7WUJ0lTrNJpDC5JG/UuZJXh6aonBHpskWx68VopPaOhV3EUE3G
	tCvVPuDMoSjmHjeTz+94L0+BjU5kM+DtrYGrYv0ioeHCvFz0nWVUzZyKhw3Vf1G7p26841MrVVM
	k=
X-Gm-Gg: ASbGncs1WzVVERoOVh0rvJW/eqO17lJTuY/hVw1rH0TvWFQLQYa9LXpGHnxsRdutKrS
	F8cOZTqU85iUed6i5AOV5/uPHVGi8KBuWfMTFDoe/7nIljtg26Mthrp1LIYujhcJB8uh+GjvRDu
	GF9rptcFfrM8UeVSmB/IAZFp1l39e1mCKmTP2TlguUm5v/2sUMTzOFR73uSHOMokYfCwDN+YeVJ
	5/BCz8yDnRJxS0gX1TSxqzA/tPFxRT/BPx5hhBK9/1ChioQSG0HTV+BZNx4eFvD6pxL4VIyeb3j
	EqwglxQemND/85mJj+uTcu8bfiv/Z2/91LkGtku9EFF7UObB5Hoo7gvdhPh+STf1rrE1b9uhFBO
	IZqDJhQ4+wKP/vwUYTaAQXjYq
X-Received: by 2002:a05:6808:6f94:b0:3f6:7091:d297 with SMTP id 5614622812f47-4063d081a12mr556355b6e.18.1747940680325;
        Thu, 22 May 2025 12:04:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENtqBQt+1WYZNwKjioV78TnS+WxdyA8WhQwdOWtpOws+o5tY8072/kvApkSjMAxq5ma6aYew==
X-Received: by 2002:a05:620a:6290:b0:7c0:a1c8:1db3 with SMTP id af79cd13be357-7cee2264493mr125658885a.11.1747940669485;
        Thu, 22 May 2025 12:04:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:38 +0300
Subject: [PATCH v5 19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-19-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8072;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qi0NNNo/ojFGNk6vS+7/bJMwBSgR2imtHjPMD1duIkM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+wySmWg7YfVngh+Td4RycmAZl5rljsGgEs
 WySFuwl+AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1U9eB/40od/EbrZgTV/Hf/dOGbu59uGgoLNGpP4xxBPkpiO9O+8bmNGuL2Fmc4TiqhlFuE+/vyO
 UhsB8MbbmVa+m+QQK9QLJpUIMfQ/HmD8sSy3PrzAiriXHEDc0+6Sd4xvFKxV2XtB8GF0Ae340iw
 6r+z0y6ICPKDxEtRVKhhtdQOOcyiVdVNQWNzlsxktgS8BwE/aAy76d0sKvrLnMoBmoyyAuIk1s5
 m2W1IM8eHy/gB9ITjbAZnTG4/ryojO1VOCwCDD9bf99V8BUxBeYf3l9TBz45zQbx6mj3aAUl0RV
 pp0hgJYzX10FaJtk4GRx0rU4wS9U9y+2Q922L89I3gzNjm/f
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f7549 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mpK4J0can4W2gMZkP7IA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 47oY0Y06PypzC-RSWHSeGpPWeOroe2u1
X-Proofpoint-GUID: 47oY0Y06PypzC-RSWHSeGpPWeOroe2u1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXwk7KEf+/JbOo
 Uc0ci69XY7XSfV+opCXSYf/TXtfBNDU9R0BbfH7GNjSbDqa1oJyQKaHBk6j4Z6hHoeN+bvlP4o9
 iZG1RGBd5VyNS0Nolnu5CnDHEpkDm5WuAxkGuzUO6SvKivBrmrTk836CFfGYr9Y9QGRBIm7ubWb
 Z9GnGpE4wZL1fxP+jxdhFEAMlpWarrid+bJUBWifm4B4uyy6M2zic6JgTumjFlTTa1AIKznu6cd
 rY6eqRBUo33vl0NCfhtRiYRes9s+4NT4wQs9qv5OkSicd3HTK15osKOKT1PtPPxd4oXZBYyT9dJ
 BlsUNzsijioSTKzxgbG4L0CkuiZ32ny3gPQUw6aSaF5PQsF2MI+cRg8GeeU1iBeZ8w9HHw9MsK7
 bdeeIQxMZQMM8WObRwZS/6/rb2ehdV7zVB6XVMFGVsTDJ1Wmz0xqbdKBrwIgjPJdzu0+yNvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 10 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 37c88b393c12d8a04395b6e5dffb67211d2db9cd..ae66c338250664f9306a7d431cfa18ca07a916a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
 static const struct dpu_mdp_cfg sm8650_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 785ca2b2e60f073b0a2db0c0c4ed3b2722de033c..85778071bc1347008dbe4522aeb9ca4fd21aa097 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1401a84e0da5754fd2a3661d1421bb9b998271ca..f9676f804f9132296467bc751e11036696afa942 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9..7462cfc4cf8de4a10326c83d3341dbee76e437e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
 static const struct dpu_mdp_cfg sa8775p_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index cc4413432cfdc636e38a56011d39f18d7e94c23a..695ae7581a88b36fa1f28aa3cd0c9166090e940c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 32f88533154584dc98a515b1ddef27ab2005fecd..9a25113df5aec527baa514aaa61f2b47c2443d27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sar2130p_dpu_caps = {
 static const struct dpu_mdp_cfg sar2130p_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index e053324d76a2e5020e6a7477ddadc9f7d94fe57e..54815c613f087454aa7b4befc84462265d8dfc23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
 static const struct dpu_mdp_cfg x1e80100_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44..d3a7f46488a21e81a24a9af5071a9a7f5f48cdac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,8 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
- *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -41,7 +39,6 @@ enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
-	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
+	else if (mdss_rev->core_major_ver < 8)
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1022,7 +1022,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 				dpu_kms->mmio + cat->wb[i].base, "%s",
 				cat->wb[i].name);
 
-	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
 				dpu_kms->mmio + cat->mdp[0].base, "top");
 		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,

-- 
2.39.5

