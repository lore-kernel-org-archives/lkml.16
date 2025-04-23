Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21EC29B23A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442663; cv=none; b=m0Yvkx7kfANQ5F+dBAu8gHwNjIy6p5inTMnvjYlJtOYkx7brIQqXlmeZNXTUQ5MLXCDhFu/SEeG5/jIJC+hzmHARWF73DNoafLbVIW/oyeB6y0ZdvXv7xIZ1H9sFgl1wWj7xjNNA5RwizAUIvuHlgrhG65rbn1HbitcyyahKgF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442663; c=relaxed/simple;
	bh=oNrYQnr1KiSoo7VWDsZY8Dj78eBMnMa6kH/T6VLJkn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPhXKPs//bm8CTXHTxyZsk+6Ui1W0TP8+jRh5E2CE6PvkCjMNOPQ7DQpKgc/Y/RdjZ9seOcRZoZR5aQbS2xJj41keiDAKM50PVA2x1RQYCPojpZudL09x1fp9Us2yuca7RVA8c6hN5AjispMoeUyDAG+bMWOysu38mXabtb2skw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQr22wc+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQr22wc+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAkC9Z022002
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEsuroTWszN2wj13HS3Cwvyjj5S8svV/2Gf/nALxW50=; b=gQr22wc+MqAFqgyn
	nlwv4+cqVuDU3TH/pYM1+H+Izw/nSQ90K0AaDJBdyYly7nwExHli5QCEwTSV0pr/
	Yd9byWaImoe1NvD35VDoaa9CfD6OyC+/1ViJBsce9b/Q5K/ChPHHg6gD4O1h0C58
	suNHlnaHNPyoEGN4LAs7sxWnF2v2gUiNjSVF1sdua0v3x8lNeQ1pdcwXdq4bDUvS
	FfAQbNKkpSYXrwuPuZYpjQTnAhqsOwDwoVm4yt1kwPg0g6MhZc+r5S7E/VEYkm9M
	L3rOFRKH+4pkag9jpcI/lqaykzO+ZHjkxOPIujmhwrzhFHyTRwpgGeP1fcqaifNA
	KFmMHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13chq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so49176785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442656; x=1746047456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEsuroTWszN2wj13HS3Cwvyjj5S8svV/2Gf/nALxW50=;
        b=rzsxNhE/1Az677HvkWumVix6LyfFWB9MQSHh+s2KfvBpXdgJmJSPuNl7ltlYbUrPDd
         tnmRIiMdEqztsDt00Wdy8CAsIFmT+Lyo0v0n3VXLbqm18YrcsiHVCcKtqG1wziPvm9j7
         q8Vgl0pod37CQ/HjS+f88mCeHERswk7XLWHoQj23AzW5w3BLjLCutxM21ng/K/AefYz4
         Ch7FZaEh3gAbqxYVZswlo0F1n3ywM4vq3IQp0IDeGHHnbRZlgDpB7pdTu2m5dzq6ilIn
         iLANWRgehb18CqMtu1wA2Sx1K1eOT2fq2iCeTCmhKdWd33JKclAm4S+wuKaENn/CaZv3
         ZvOw==
X-Forwarded-Encrypted: i=1; AJvYcCVLOhCQS7g/636gLk74qgbdsetILBdgVAendCjGmoHPWiK/X8KO8IrDvgvEPJ4/7A5kIfx/S/bH2APzolg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4AYIX7+vZUENeHGFQ/nlc/AJ+TEZREiymHLZ68QUZEqQcnXSe
	fAwff1EJqUXNQcU1fAwvYL43dXK6cVhqVZLkzR7gKEmKCDNKhwNCtn6cYea5jNtUh4HsDOBnEo4
	GdGIng876zfSZX6DHbrwvhmS8tP/+xzVUTo2DERsMgRbh5gM7FQDlK3vZrsdRTV4=
X-Gm-Gg: ASbGncseahki3DaO7C4BgCdc+wDufdAL3qHpSUlJdXst3/Xqu3IzbsxpqOyWC9MtYyU
	RSeXn2NK2kJWqSsxxIZSLike3Ab2vDgZyuUa7maX1RNg12zWiWjU0HxLnkARf/7Gac4v7zoL4Hs
	nKYF3WwTuMBjY6YbapM4Y3tuqUCuRvCV6KC7nx2Y38UaG21+OqVwMlTmiIUipDy0a3faQ2mzSuE
	U1ugLofIcu2SoW8nqr24ri+Hn4gfTTQfIlhCSFp4o2jTjjMq08vuA3KfvadZQJr2GIIQjii91IO
	WTo7RCH/7ja8HfOmxFWAHV9KE73MJPmzq45nCvO265zP+8fzT8jOdLraD+I8+9zkIknCOSQYzOz
	/M2K6bKXHkPlMZw3y1qEUr7jG
X-Received: by 2002:a05:620a:172b:b0:7c9:230f:904a with SMTP id af79cd13be357-7c957852ac2mr12346785a.14.1745442656212;
        Wed, 23 Apr 2025 14:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzE6aMjIkL4DPCcVQFSEs2GIlRLgaZNwRREDy5KUAX+YaRA6Dy/3Z/S/Md2OzrSCtXnbDwA==
X-Received: by 2002:a05:620a:172b:b0:7c9:230f:904a with SMTP id af79cd13be357-7c957852ac2mr12343585a.14.1745442655733;
        Wed, 23 Apr 2025 14:10:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:15 +0300
Subject: [PATCH v2 19/33] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-19-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7220;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qbAqux1dNcQt1qGmHQYeMqCZv03w8t4uvcu6nMew/Ic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctN2VJoEZ6XeoArJuMgx7tFuyrk25dkQuk7
 Gkf3d7G24eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1cwMCACzsJ2Z6bhdpOMTXn+jBYiT3wVURkObXES/6eTLTUNibdCPtNk12Fsx4ooTv1ePOjzfpEL
 ykgzIzM+7Z/fkWQ7cwM71mVd3bHvFQGODyjujZGlcuLku6nBpD5RZwFY9xQ/Oy8DBkSN/nIHolp
 YkMhQ8gI/DRFY+J1cFXScJD+tqiHkgFvF2bthgwVODjxVDIE8IS4/4KdgbYGLJHNo7rkiP2K7sk
 PhkILV/YPe1aOZY0JKHtx9q4BMIrnh5Xwd3UmFKL2BYtuyu/6KWEtne3Kob2XUSLnkqACEmyML7
 0TFLKgw1XwIYpGco5tzujP/mzEH9onMDY7dqbE2t20GooRn2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sUXHHdUaOEXHsIMyPOosmxfKYz2fynri
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68095762 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=aymVMRhB4c0mkscYco0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sUXHHdUaOEXHsIMyPOosmxfKYz2fynri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX6lJoYMFmhUZ8 cHgrDyBFGI7PvB3+L+TKXI0FpA1oyIPNdIOdxL/tV0oz5GNlAyygLmOT09BIM6E4xQ0WrD/gNNX ZFGQ/fsXs7kyD1MzCCc1KYg5GtgxUJ5KWFbGWeknujNK8vCOeSMvIjXoCeyV7MUtpk7eFgn0Zu5
 98huUyplZwH3SpWmfEPMJMZpLxeDyGOJDUhWlSLH38ewkKKAxiyDvC7BkgnLUsGj2Ln2r/SNmI+ XjzV6n2bPOsb9N6pWWEjf27WwarAY+VB+M51j57LnDlFPgIF2cyo4RsYKYiahur2YiaI/XrF1U4 r3ZUNG92i2LIT/3FFoezWi7mbsf8TQjPLeEi3Or8vtlo1wfTe6ruWn83yEB/cl0t4libwPTJ+Aa
 Q4nnAVw/NkLAbflLo3CMbcpjSDupwASCK5B9iEmR3rVwbMRaYKTIv4NPHWpw8RYmBeFp4By+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=993 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 9 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index bc013fb6705d0e5b8e1f5304ebe9318227450cae..d64366f608ea673422bbf4e5b6ae7f4ad8570784 100644
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
index e16fa6d8a431f55643c9ed9c8b3845a790a7e268..43916752cfd5836718a3770df4c8767635f77ee9 100644
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
index 3059b9f88567c6f667ac456fa49de73f3f212ad5..d58d5b7ce79b8c069d111c3c2aa3e9cdb2c1a435 100644
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
index 786071b35b7b66e202899849b0e06762c8d1c57d..064546d4fd4538cd5a6b56fca3ee12d482a7dbb6 100644
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
index fb31699cf5bf11036315984ab95240a312703afc..959f3e9dbc5455fe53c1bb240b5db57212f2d4eb 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 67fc0098836f72b6b67da68a6c41c18f334afd94..174cfdfcfdf9860ea86c983c6b6591ba98da5400 100644
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
index 3a0de200cc5c9751adebe681f80679e0d527ab1c..0f8c24ad346568464206eaaeeb199955788ed505 100644
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
index 3305ad0623ca41882db0172e65a9beb7ebe00b6c..f3f84c8c302fb1bfe6e6d70e4110d0b89259e55c 100644
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

