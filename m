Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503E28751A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670704; cv=none; b=cIZEJqq/H/hC2mJyZDRZuVgAOEbpmYneUQf709n3PD5Vv9nNE1hMPuSZYhXL5TtZbnol5yUZ7Hcg5gpPIZSC0ik2HJA5cGlh9KvVSNbaUgv1ioAUgdggy0sIglblGgvXBJNVTqrr2DizeZ0geIw0Mknt8xdMs/D77SrVfOPKy+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670704; c=relaxed/simple;
	bh=14v85dIThTPtbuPmwrXTTaE8w99iVl3YRryi1ZqbAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQtmbWsk/dnMXxiEHjTxco91vPmPcCfbgubF5DXI06UbIefbsEtk9qRexjbRSU5XsrCsPcREharEnK1Q+NMbwnGkqG57o2I2M5VDZUo+ATDBgZlNcherntfPB7vUCJazHS60GkXbMqIrGqopiuWG2Yu/Y7pBuWm8wh55fFNPrac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMUY1qn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMUY1qn3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dsU1003036
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcC/gYHWoR+iu7KJJ2uXlU81DDxyQoGxWssx2fzUbdw=; b=IMUY1qn3awswp/IF
	OmB0H/BYTlsH7TBnYhohJCpnDa0QfMgpdUmNcYkpFCzUJ5j6CKb4eBioBEMpoXfu
	YjiOcF4Xjw0DiuWPu098C86szSruaQd5sSsitj8q2TnIEBCpm+RHjZUCcnXVOk1X
	cUg6GGyccLv2GXRAcjrS5wJFsNZQHoxji7Si2jaCbuAXEBr01glCI58YN4ytWRpl
	N+/IFNdVcEY0g1uERZWPmJ62hPZX5z+5IEN48OVEzk3jFy0N8nDdOUkcpyht45Tx
	z3QeGlDuSbYXyv2+Ig6R6fdElIBcmR70aJvnVSLDAfqqUW2LxudRCYU/4NfAHEi9
	sUv0mA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1ath873-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:01 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3feb24cea56so3912831b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670700; x=1748275500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcC/gYHWoR+iu7KJJ2uXlU81DDxyQoGxWssx2fzUbdw=;
        b=HxF/0gyWzmwKBjjVDzPM5dYmOMFGPjHNQ5yPpyR5XReBvi4UI0k62fZlNdIwRSSggD
         Wi+UlQiPU+UaSo7g+XP8cq+WycLSrR35At+gyShar86tfszZC/L8bkRpEceDqOgsybIB
         H+POaDlC8hhrlVpVVqBCOETDAxv3pqKuD5V2Z4Hx8b7nn+Y17JzWsY8yDwF9zL3sorRg
         K0Balvri7l7Yv6aPMZkA5nb51nq4+dkiUWOfLXQtYh07WEa1mSIkmU+N3Ka9shYeT3WD
         BWo4J/Bg05suhsHxSuFb+Nfxesg/MuchZGvn+qgxcjMoUX0sUn67DVtsRwljVOSiROXv
         96Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWBEm+z23lGwoKpxGty6Wp6lWy18mqmOtXF/FMnWDqHCrrjtUpKg8HQtAVo0hVGB5q5ZtznHwb38qzqmJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxWW1ulZdak/wGM/7IPxfdbbE7n8YKNV+BCxOTkVHlGvR1wI9
	9k5kdbbS9iwu5sLMUSf/XBpI1pJ9buP+6MM/Vn1wZdfqq4E7Uy1qadc45lksN4/D7H3JoqrQ7c2
	AFH8m8EWU5BAqfn8UilLRy5kJaU0fIY+/8iDCLCGk+dapXUaioVnwKrTHF7mDZA1aQ2m16zf0ma
	Q=
X-Gm-Gg: ASbGncsdKFKiRCkCYU8ZCjOpP0v0rf0y1gGVnxwi0irLxu8Rryo8UyTdR1j2iZIRW4/
	O6QnomXdjIjKfwMvxU8UBDCVo9/MpO87OyUR/TRDWB76MfhymFAekehVq8bOYmhjzr4+KQuCOET
	yzNgjsM8EnopEeHYqhhWcsHAWoLKLq8LNJQ8IK+OzVoSvEkxe6mtUEXhctZBfn5cQUAtxKL4tRe
	Hf1qUDF14EO5F0BHqRGG5YsrQepPAiMRLtRwgqe7BMD6ejVhYD+ixA9v2tNLU/3UBKxX0n1H8If
	ZjCAZslg6c1BH/O13fdoz9KTi2X+k0f0Y5/a+rnbjpiHdAWSVsDVJDFSl7fl3fPFjASS3i3Klm/
	a60TzmTHJQA/oaODjN28DBrU2
X-Received: by 2002:a05:6808:1649:b0:3fb:46cc:e08 with SMTP id 5614622812f47-404d88068fdmr8771223b6e.28.1747670700380;
        Mon, 19 May 2025 09:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyzcW01pX71dS1sAOYRiLBWX0d/KLCmHb1i4QId1HV/+zFOfyPK66kJTMlnD6NrzfYSkV6jw==
X-Received: by 2002:a05:6808:1649:b0:3fb:46cc:e08 with SMTP id 5614622812f47-404d88068fdmr8771140b6e.28.1747670699576;
        Mon, 19 May 2025 09:04:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:22 +0300
Subject: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HAI8Ve+Cj2eUNr5mYSEgP72ltCdvLNDcdsj28COl2yk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8BmXJXf2u8JXfW1972eXfGG/4AEqY8ZPT/
 5He7tJ+Xn6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1XpxCACGoDLLweKclOAJ4QyMyeZPo/7qE7AVlXTgbgg9yI9wyXpIxzC6BwY1D88meLjpxlkkRVz
 NJ7dj0im+gGkFmLODBaYNCMgjPcAG1bFm351k5EjLGHnMBgzMpJEbo6H4YC6hGM6/Gm029g+yHm
 I7vLpMIR52D3egf8p4BO807z5K1PJb3w35WwbSMeFQ0LnZ2YEuldoSuzAW0FAZEkYtP78nODjEc
 3ucO5EH5CNMbrciHEkUTf0iZTwW8/Bscir+Jwg/3UHrhTOgEYo2xerrLgcSbwHYMWB3VPsKwsNQ
 LqV1Ga5nVNkqyqR1XbeF2Rx1V1lRsplCksa71Bw94/KRjv79
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b56ad cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ekR5evN-G_1rhagqY7KvYgKcoIJQdEVN
X-Proofpoint-GUID: ekR5evN-G_1rhagqY7KvYgKcoIJQdEVN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX6QAd5hpKnUrI
 178QqVSs73kkFoo+ZQ3tLKF6WojO82AMzb8wyPFnQlfjvhnSvF7+8woqnd2tbpUOR/S6xmcWO3p
 oQDgpRmK0qpEKXJeP3r2YktSjzbs+gawrhDk+Ca61A8wdxRpkPWzqerMZtAcldnfXFbJR+Mg4LY
 w3wmRIXwQmm8SbTe0h6r4olIyP+lPUtxEziLKd0IT1zwF5mEz4zQhoj3Qo3mr30KrUHKUGRs2rR
 J2KR7omI7BrwCHXcNBfc7BzOpxgY/H18qO440juWC4FeDDG2v1Q3tyKogGDZMgJ4ZBJYreyyyrJ
 k7chKfvZURx63ctEp8D85I6HuX21dgMicgbtMnyjrO5dUvTGQFp8NMogA8zcZVs8bkmakiWtQuY
 0PI5H05knH/rcrl/+S3mYjC8herw09WYVn2pJrOmDgksA2/JHgMexSvmtJ2llZWShAKrkQVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5

