Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08F22D780
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487056; cv=none; b=fo2xABiKlhlUBLe5rVmF7vWTsS3w69uyQ0UxBqd0x0HT4yGUXwx8Vzi4QSpFnl9OgQea9E/WfTb+jaNZBtmz4CPBKZtJ3wXqQEZIwApj8IF+FOwsDlDwmIZssYHoCK8y0YhQlazbqLTGng1ltTUMaufdDXlEiiDSgtRX0Mfpy6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487056; c=relaxed/simple;
	bh=QLlgGZjuAgrO3Lrr+XY7lOHAAtK3ZPDDnutOZORXNm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ICCwFYEk7JR/Q641cu4VEqPeLr5B9pw+7C8Ch00CgQA5XrMvIS5Tho5amQy/Wv9xTmeOwBwCJhLNxnXz/Sr3Ro9WdSPnTBegJJizpOVCSTVCBDc1MeJNLV0GOFJrLPJnQ1UalaPjVTWHlsthnM4LA84nC8zD+mOtnbZYQjwyCCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khMrd9oB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khMrd9oB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9VW031001
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ffZOVjR3W6ynnIHHd9IljxUE9heAZOgJlW9d31dbFoc=; b=khMrd9oB79g3YR5r
	0e0Amby+Ck1zDWIG9pU42DPSOF1boUZb8TmImFP8aFgavRABRlInKofOJDAU8/vf
	sfIPpp4l5N9WCynx89GIlVVnzQ9iYQggkT5CuKh8d1leTruFc0DFlU3k2M9DQjmY
	/MmtNDSWequkn6j/mpUHaOOQy+y+kV8hTBj3tq9ZVkO/gf45AUkQdegkusjyOsfi
	NnlQ5UZLBShEQ1nZE9NW50MXTbNFILIghxjk9NPJOY72IBF7HUE+j8KJo2o22af0
	QRh8TyV82IXHsjrSak0aj/Hvzchvy0yFVY/VqYezDB9cZeSW8WH5Fq43r8qZSJIH
	k5bEaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cyyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so128957485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487052; x=1746091852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffZOVjR3W6ynnIHHd9IljxUE9heAZOgJlW9d31dbFoc=;
        b=f5dN1MBe61MSg0xnpBjjRKATfyfZvI8DNU5s5VymprLO8BIA9XX90UIjlvCCO57VwQ
         dP4jtzILkbU1g5pVgZPHaUrKDhGTLrQRjopjt67wjuragGqs0SFdLH6VKZCy/jh08MsD
         QUZx+Hxtw1fg6cg7aoHPzNer/Sp2uWfFDfdv1nvTm0YqcXZofUESxK8T5dlT7i3WrKKY
         k30QH7nsb9PuQNci8NnnIhbkyfNUiEVH/EG1XTLv/hbsdSHyU131EALFxlsuQ7Ny3sEs
         9v49sbBVBI4vV4LerU8Gkqb4rbCOUXZSqhrekKO5U+LktiT+FCKyJYIqRICcY+jT8d8f
         mGOg==
X-Forwarded-Encrypted: i=1; AJvYcCXZA+9OheIH43NnfJdnLu/Z/mhsy3J/arT2FK5P+xYrmmGT7EHhFUichfX0As+AUUyzSU3q97Z5orgtwU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9AxnndAahWJRPpf9YWelOPuczrDHwQVwNJIXak5rz5ZPvgoS
	VMfKaQZtV3CfolxFeByMN6dBu4WSm4XhFtpUycbQLbvo5+QUPMIUsmsv8kWKL/s9wmBqHGLOBCv
	K7p6hNZ0GlTuNyzTUQpKM9CmF1u/UJX7u8EcRKkYGHawEntKmqBTjmoyOS4BDnmM=
X-Gm-Gg: ASbGnctNyoWHf9581kvM43lO2qNm9kmQVfVlpCk7TSg1o8LFjWlJi4q3g9+INsB98aI
	U0hBz5PbOe4aMJqSM4wSWduSNlGBW8YL+/jGzkWifyA9gyHv9letRwF752dHafZnLkCF3+RaqCu
	Lx1/IYQIjfOsHC5q36e63o/+5m1v0q5xQJC1C4le6CM0iVJR1Zdj9zjtoyd4dnxxKIgM3D7NxZj
	NYsVt56Hm6FcRUuMHtaSpBsH5vrMw/wBloA8jFU7jqUsGg2rPvX4CZfAXn+hoo+/Ob9hKx4WbEz
	hQ0ATE5/QbjF5KwVBmGE0iZLYb2RdjlGIYQbtd2+8S9R0wOm2w9vyuajPyU2PO3BQjn+h+Mekc/
	qdtvCmKYb1JI4OQiG23qE1cy0
X-Received: by 2002:a05:620a:371d:b0:7c5:5859:1b81 with SMTP id af79cd13be357-7c956f44e77mr272137485a.57.1745487052473;
        Thu, 24 Apr 2025 02:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcWHf9Ny0IeovtF8ZvpzJBNbPhPozTKv/A8zYHNTd5Y1Te38q8EqdTPyCxrYKfDo87wxxgIA==
X-Received: by 2002:a05:620a:371d:b0:7c5:5859:1b81 with SMTP id af79cd13be357-7c956f44e77mr272132585a.57.1745487052014;
        Thu, 24 Apr 2025 02:30:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:20 +0300
Subject: [PATCH v3 16/33] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-16-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7378;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zZbpETW7aMiyCYpHLuzre/GCxsgOdCyoBUUKB/kjzjU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgStFXlbTHqq+sLgNh00isgD0oAiBCFwbz9Gx
 H6NbQQg2I+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErQAKCRCLPIo+Aiko
 1S3ECACMKZAVW+bLxLDpNw2SrOTD/i+MXKRnOtn+Ez//wa7Zef13Dq+Sv5IWB7GkWyPSkZv3+Zb
 sHLSpZxz4S3ZqYJtj3DK3DHOqn1CrA/Nf7f44i4hYN9waH+qGMNYcLatmy28iX0x44WvZBdrtZt
 GFCTVrezMiNngaEeDBp5uopRzR4uPYv79vTwPRPUDJUXAwJZ90OhL2WAVkDh+QXpKD45hvymdmT
 6sB7x3llcZsG28bDWtVK/NIhJk81hv0TepQAJeSI0ZzdUGlEDyr96/4/5gUcNltxU4t5CtTj5lm
 9mXqakol3o2wX6bqs/7/30M61KtBCqDfepfz8fEyPqwlMUvI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX2gj1luWnYu1T 2QWJ8/F2/q4DldPFwa1nNTvhBhtKjD0SZWxvFFFznZBM3XXHRJ7DZ/lVj7D0x9YAykG9w3G+Djn JU8dbr6lP4b+YeBsdot6cXlNtMjoXDxd02yPFzr7GCJNh0zp4CZw9Twl8ZxI9OOWvy/8dWHSoGA
 qPM82q0dKi+wvp1Ca69Ska2EmAkQRe9pCwmn/G9wq/PZpGIwPB2k0OIO2TkFJn1bm/swt+JFb0a lbbQuzgyNuKsSV/a8cN0Tq/ur8smpiH4t4OFhkgmGIRTKqmhzAP5bfDgWjviuECbtm0msM5TZuh iWnt7ZU3c8qYOU55hX4Kt/mTAycYPSbsLt06B9ZymobIXZNYaFFGnxljRRc+X9AeNibEy69JmSL
 OYCn+6zSJLOGkXAaFmkZfavhg0p0SqAtD/KevbsBAW8t3X0zU5HAoACXpLUnAeljT8FWqbVG
X-Proofpoint-GUID: uOpaAUtp6YvSSHRZzXzrU6njh10oIHgj
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04cd cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=TBtKe9T1WDpDz7RobDkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uOpaAUtp6YvSSHRZzXzrU6njh10oIHgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 10 ++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
 7 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 78ade3e977108fe98dc63ed93535ae3d947d871b..c0b4db94777c42efd941fdd52993b854ab54c694 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 63dd5afdb60b051f6d531257b2844920cc09ed80..d3e4c48be306a04b457cc002910eb018a3f13154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -93,7 +93,6 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 4f09d483fbde29c74e3fd9bd0ba7a1a9c2638183..c488b88332d0e69cfb23bcf4e41a2e4f4be6844d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 54477e300c273182172a78b81dd0274242689895..ac0d872ac06be7376b7b4111e1ac5f4057b5fb76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,26 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 5e0123557a44fda1d250130e09e4968535927088..5dd486dd9bc77184d5e9cf5ca2922bb3d1671ea2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,20 +95,14 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
-#define PINGPONG_MSM8996_TE2_MASK \
-	(PINGPONG_MSM8996_MASK | BIT(DPU_PINGPONG_TE2))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 33506e3bba9fc51f9e99446cb7df6aa51d81a3b1..3300897aebc9d6b38bcf4a0e0d51095bcbb6fa9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -119,7 +119,6 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
@@ -127,7 +126,6 @@ enum {
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-	DPU_PINGPONG_DSC,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	}
 
-	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+	if (mdss_rev->core_major_ver < 7) {
 		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

-- 
2.39.5

