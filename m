Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947FA23372C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487065; cv=none; b=SebrYDsWeneekWzMDnglXdiUiXKotAU6VMqH2cQ52v7nx2iRvS/J2j7Gg4+S4/e4WTZ+Yt5gVGmqS5cV1lODlCfr47CM8jP88MvRDygcuOh2XwfUw6SekYVyY9KH4C60nRQJUxLkiLIbEvbvRZXcZCiL43n9VgNxM8JpEtHp2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487065; c=relaxed/simple;
	bh=1eXpnQfANX9Y99ZcxD7BNPiJ9pknxP7SyHraRqFo/Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWJC6nwkt+BRiroR+wRTL71AU24cPJrfz1Kgiz/G9cxdIQ6MCkmFqbLee9vhromJH4X42cFQtA/arSxjS/uPZp0N+FekWJxR45TwtC51nT0+HpAWFlvdQO69RE/cNobOPIeaPdYKpkKkOoqaJ8jfZ1Vju3plTNo03a7KVWcB3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jkP0XL78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jkP0XL78"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9Yg031004
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4PZNJwwm0ndQw9RdwVRs0rxLCkA5yAG3VPXYAhSa1Zo=; b=jkP0XL78qW+T1P0m
	a1vbXlpYUptfsZ1gdNUlCcsujiA5n7RmBTVpgykKbHlPg/ir8jCN6FrkMrtLzqo4
	zWRwLA0Bxv3ocvD0Q4IXHGzol3lAum1kOaudRnWlKYYspNCnKHwQ9yzydaQzuzln
	P0d/czLv341NSGflwHA1wqq0BtXO77QARWeeHABQZNjI3SxUWHXp0H9s2DSQ6Pqk
	5N2Ybob6H2E17kieXq4Kxh6X1+chPQd0OofINd3iwerBvO1KQ0O3IwgE3zZWB4dL
	19L76DReeMjNvpOpRQiWenLiyDW4fUUsLMLBkEq7wXw3B8ZbmaQRGEvRFOdP8ELI
	7ZkNPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d018-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so133911785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487059; x=1746091859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PZNJwwm0ndQw9RdwVRs0rxLCkA5yAG3VPXYAhSa1Zo=;
        b=jgqSJ0einlW8YsKF/e8c2YXeBMtdKRKvq+hfNzqSkNO+IzlXZ2dW/WexazHk2sOp9W
         3xA1kF0HBT5ucNNWfi5zRbncC+b/R/iiU+Qz9ohkAM8TgIMc883bLpM+JOPT3a4FD3ZU
         6fAfCqsWTAHW3VFVyRgJoZEH3CYm3zyIbt+GTxtsDOxtFOK4vHzYdH68zWO5UukHiTrj
         /gcSBV2shNBgOe1sEz9ngxFcE+HUoBcGEtGH+cMY9T3YHYMdZeWXpqtlNMIq6E2IFyLX
         p8vdYaECDSsDpVqPDNMS6QhNcME8apuoRdX/iSq/0VEpB3fmvl99XgRtIMB22H3D56Ji
         qKag==
X-Forwarded-Encrypted: i=1; AJvYcCXI2L+GkbN3rTmcPWFKFrqHa4DFaRUJo2CHwP1tWnYCzqnlSzwzQ14seMqe0OBsAPqmRBQfWyOgxVmRZVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1hNo3YsfJ0RYXca0EoVU2YNygUycnldCwPjR85w+dpFbvDNYp
	mPcjmImtPM9lkf5KtjzedsqrhDUYgnxKtZ2aSQ5n+9eFU+mEeCyAFqKhoXqz5q+YqbFrk/w4AEs
	qUKoJKKoRwuabXitKO3rZ87raxdP7enNXKRzHAPhZtN0j5eVv4Bv2V3LmK01zqOg=
X-Gm-Gg: ASbGncs0aQW2CCrUx1Az2H1KrNCE1wrXnRhM5MMJE1I0H75fqspaAp+Pc4YBZbbi8sP
	+suNg3xgzUwRcdTJIroLSVG2CyyVx+yKYasfQoCc0BEs5XxJSdN86LYf8rfVtfumj7uNDC58Z64
	jlLIjVZZWXi68xMFa+7EL3ZrBM65G5FbSv87oVBsU0cRnA/3C1zwNv8+UrOLupRbLcTS8H7XZt5
	0KRfcjgCvtJFsSON3RyeKmkHo8cav2ZTy+Y5uYCe58s+aLjct/1p4tRVX2KiZanii64T1xCGk7N
	fJA8irl00paHA7piRmugUolIktRspam3wiXQ2lX+mwl9Lpu08lkyqM9Uc9rOXIgsuBqCjGNeyHU
	gxmJxrxpzKvDKAEMo440GtBW/
X-Received: by 2002:a05:620a:394b:b0:7c7:97d7:f776 with SMTP id af79cd13be357-7c956eb34d3mr292968585a.10.1745487059307;
        Thu, 24 Apr 2025 02:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+7xCg6YWOVbhCABq5kWNTCYBPieR4pZj9CTpaeNDPUL89mNgzgdp5we/BXH/AqGFCeKr8xQ==
X-Received: by 2002:a05:620a:394b:b0:7c7:97d7:f776 with SMTP id af79cd13be357-7c956eb34d3mr292964985a.10.1745487058877;
        Thu, 24 Apr 2025 02:30:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:23 +0300
Subject: [PATCH v3 19/33] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-19-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7220;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qbAqux1dNcQt1qGmHQYeMqCZv03w8t4uvcu6nMew/Ic=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSug5II481cqkzqQ4DQMbykLOwbg79W0SLrr
 7qT4mEM4dSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErgAKCRCLPIo+Aiko
 1axBB/4vlGiIwN3dBGhCiyvB+cTj30dLH0V6OLHtwYrbt81n3whCujpz/fHygrzf7jIWyDMGQJB
 Sa4aJLc9JJgdRlYvPLcmNa7JRGH404MsWNfa0K4yNakLOaVcWCe2o+PYPxRxSu3MWwN+Ugiy5M8
 McQU+Eljnq+Bi1X/+Pxu4pkEzanUixnR2w9d5WGf5QM3MAQimZtmOnv0Vc7Bj3imS//i4JBzgNY
 D/lqYU0TsXjRCm2EomDKdEtGBHHESE3kuiVOi+xtyBnvTcHAFvQENHEJpjxeUbN0ENBQI0oSex6
 J1CvD1L/oEhTewz59QIAdELH5ZGnkmZTMMqYs7X5ItY1EJkY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX/ZIwdPMhuGKe xBzbavB4CkF/xppK4xRzzNw+nffzEFcx6rtZtSMR2XAtaUO45pYacJqL9ohvY9kho8YQFC5RfMz IDWDR30UuaIdkGsc0ohcCol8kM3GsGUqGBdLdrCiDmIFM26GVwIWl6gQ5x8/PoQ5H5oblz0BJDH
 Qm2OKn/J6FO9mjAagpZcnm6LIsd+L5bH/T6spmRL+Ygq3B+kwThF+mOpQ2UJiCYl7BQU/+G7iTb Oh3zJ9CYbtj/3LbGqOtLwnjKDTUcYvJcRmwUUN0p122NDMf51iPuVy6DJtPjZ/eZGS6KMioY9fn bQ5VX7obPNq9wlhpjkfyncV/kbX5ymLcW4JI2siHi8Rr+KHV6htHtJc4wSKCcbMtjkjZIJ6bCEx
 OIzglOx5TZd//d8nm4OoFJ+k6P7pKizGnRrCZjORkAmqHC7HFG66fOSQ63s0AUmEP01w8eF6
X-Proofpoint-GUID: P0uq-ol9rfX9jWAoMofDsEvWVuYu5Tof
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04d5 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aymVMRhB4c0mkscYco0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: P0uq-ol9rfX9jWAoMofDsEvWVuYu5Tof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=998
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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

