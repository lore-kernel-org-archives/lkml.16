Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0A29B77B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442663; cv=none; b=CfxTIB2WxLRLfwH03BKYtE6QMwJ/h5oelp+16pPKi2bwCl0Vkcw/11xEMjs6URqBI21ZharCU9Bprz4Msmsd7cI8woqT39lH5aODvRXU+lLOIu3bCPDiagfWm4qrTzIGtwOMzw1PLKK3upmk3E9HdMlq5lnW76+IVmZSWMM5n6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442663; c=relaxed/simple;
	bh=+oBSBoPhXa+SI/fUdQS1BJUFNFFLkQ3btwtr0n2jg2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7dgQke0QO8S22d9p6BRY1sEwTAjGdU+ymsQ6r4F9TeXSC3X0qIdkgY0HtJF2rG3kDwlfmHOPrVbuE1aJIOAtGORdyTqs3z3z2gRnOYtWt18hupR00/kO4jRqWDrTB6UynzgVvk/mU+yBSI+I9cz0EJJDsmISS1ooKwoLz8V6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnQfSZxg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnQfSZxg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbjXZ016256
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=; b=lnQfSZxgM/HXigxB
	xK9OuqSy4rU8tOJacd4Y7x8se/CPTsIkQoJ26PEaIr+UYvy9fgB4/hdkWclnNL/U
	ghsKS6KRascJcojTvJ+lOqZDfwacWVPfZz07yo0j8N+Cb8XxtRcx6sOb5e/OSQyh
	CKKp+2FZ6UsZsyHbN4Vf+BZL5+NqoOW1ndSflB0tz6InZZWNUReiTrLDnkc8UMcs
	GlBgGYdANvzBNqQiefnI+pnMkVURvrvdzqLLizvAgT16/2pGShwz+FiJThw9yULq
	+5pYYcMAedPR9nwlvaUKCxhUsrSXy5VChWztdQsO/RilBrHeRQQ9yX/D/OGuqpa+
	VXHM/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kdct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09f73873fso36870685a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442659; x=1746047459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv9zz9wb6xipfS434Z7bT9JzA0CQ+j/JLYzVfFk2DN4=;
        b=Kmfobky2cKfGQ25LOEj/FZjB+89xDKOERKXPXAcBPujE7eQCHr/OpfgnRhuldPvX7q
         nOQl0+LmZDT0Ncb3/fzKvwm9ZxuWxd2raDO1ROmup86Uv7K2mA8zgCMng6N4pDRV59bG
         VMTpUeT/HElasZzpufP6qXcHvupD4wyJZqeqAIqEwPl1k4W+swhCwBMxnYKPVkgC0hXX
         HaVaYQGAAGLiHAMNvllrv1OhQChEhcsnO8SNlJQ/8PlOC4tRro6lHU7QFVRTjV3FhBC0
         +cjz/yqC1mV9xPtEk3PXxxgiQxaQquJg9/uNaHQXSL3wTBl/+mGZcIHxboKW2DeZqW6i
         /ICQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoj1XfexN/f6/p3Nn10SbyP0mXEPeAkGqOm1EgpYCxRjQsKco3vCdlvO1676U9KpTqdAGpOeUmRnSZdc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyNN1DFAKXA9guU5BnVlRyHCM83nlrX7LBb+lRB6t4atpOigg1
	0gQjZsjgyoZdlSpRVVjQs8nPBnfEGlEeHxNIRMwNtA48DIxm0d1N71YmLTc9LXDwFN/xOMVM5YM
	xLjGgwwZUfnwZ88EmMvseQloH+Y/Uc+5zsQv/r1HMy/ob9DzzWvg8aBc9ucYg4Mc=
X-Gm-Gg: ASbGncszqhiEgsaw90KTYYpfR7Y8XGfbbINxkW7+1kwaeFGpngTg+1vZEYcGJ4+/VPh
	E30XA4g7aHiiirEnXIhxfPITJun9KCrp+RdFy1MMyIVyp8IAg/QFojHCQr0qxnm/TcUotxKoftI
	/1sZBwYTBvKsL/bjoXI9YkYOTPt+eoEs/miO4QV7/IdUN7PBiNAjFAzJ5gc2j4aDcQMVziAiy99
	QruOogLDOPpJNbibKPpzmluD4gfXOIU1472Zi49DtO/j5CjrPO00FxJtRYoHuv2gO99x1rr5WW+
	MUIxaGh5iHPNDju/re/EO0Op57o+KH5tGZ905z1qa5yKRT2Cou/HB9dXbJh/ur1Y7kvjkb8Xo0X
	W2mit5xZ6FORPwSLMvWFlEAwx
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id af79cd13be357-7c956f33756mr50591085a.35.1745442659342;
        Wed, 23 Apr 2025 14:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj6ywVyzz7LTrJkvHpxsr9G9arHXs/wv9WiLaahFB+vwKNB4aqPf3qOvnuTxPjxtgHKakUVw==
X-Received: by 2002:a05:620a:bc3:b0:7c7:739d:5cea with SMTP id af79cd13be357-7c956f33756mr50588685a.35.1745442658998;
        Wed, 23 Apr 2025 14:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:16 +0300
Subject: [PATCH v2 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-20-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVctv7pebZX8R6HIgsPPMTWV8ZnTuEFol68ym
 Gt9euCIW86JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1QXYB/4g/IoeKLNQZJl+v4Uyd8xxAlDD+c+En9zi8L7yWLn0PTQJJxH9hbTxO5r9p5mn1eeeBHl
 hFPs6rM1ieQUr6qai6xrm/oQwPzIbcmG14ux2tH/E3V1L5R4Gz8GGDXfPQK9GmqlcBjqrLCtbLX
 OaiAHFoW5ZeelSZi80nsPKml+r2rmR0bO/dSm7ImeGNB0pvTbvPzUL39xBYLPl/MDz2zSWsYPCm
 dbBE5PY26a1q87tmtrrVfNk7/cDDwxXK8VaM1kmDlJ3KUqYfILg8HopWs0z66msUrLKCOzHriHa
 b7WbrevaWJ2RPORPz/5nPCheDPEJTDhvk9feainFErzV8xRJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: f6kGMwvGAi5Qoq4TfuCuHMhuxgx_61wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX1/Fs1Dls7JHH 6TDIdj8punJVj4ehg0RVRlD0glQX08IvRvWt2D19Xj3FXiPhC7x8yavzLbVVyq1Jw/6JgO/eIFr LShVKQHqYHKm3xbGi/Au3qTxBaCEt5op0TfdrzuXUkJZLTJ2hlwAths14z+PX3o3Ad6zb8U79n1
 6xqwOGoCMdX76J+Oz8U+XZcU8fAA5t7VJ+yg7yYu7RDRTxVNPOzDOYmQ38zQEplACM7/IMa/+Tl rdHE4fKjvjJJywv2eRYk54ce13/gtB1VQXEEcBzWDoMKB1zZWeKCxCfsgoEPpEzQAvfNBjoXoGb ZNd/Q+t1MMLsQYbW3b5/hjYv8zKI2T4TYDkR7SNmCf7dwCcLKRsDZB5WIdW8fg+9ysWkZNyL6JZ
 viBN6NOA02CouZTloJjZcbG9CGyzeY9u+p2Bgec8lFj74Tdp+IrKbKsRpLUMm6KPZGY+4sYp
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68095764 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: f6kGMwvGAi5Qoq4TfuCuHMhuxgx_61wx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index 9f04c7cd5539c012a9490556a5736d09aa0a10c1..21264184566493ab4e356a4e0c032ee7780cabff 100644
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
index c93213682a5781bbd8ad137152c9be8bb1e6efbe..634b7dc452839f994c948601fe9a09581cb42a42 100644
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
index 5da17c288f66f4b7b5fef1550fcc9793f524115e..59e280edcd508c14ee297857a19e9974970566de 100644
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
index e388900623f0de4a1af10d22a6b9bdf4842e1f40..af0d789c47917e9b712282a542c3d0886313c049 100644
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
index 0f8c24ad346568464206eaaeeb199955788ed505..a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5 100644
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

