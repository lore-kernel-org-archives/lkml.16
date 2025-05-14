Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0A22A4EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266772; cv=none; b=TA1jjPZfMwCE0Ow0zqqELZMkHjlardBcJWO3afrjQMo+SOXdOdRUiC5LBYIKqz3uK2y1xr9mKCWSwo3YsiNhPmFQCkUUl/isrTlIoqYxX1h0qgN/PwQNJwL0OvzP5I1gEvDqr/xpqOtW6DI/8f2x3uJcbZUNiqHoas6n8mDmEOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266772; c=relaxed/simple;
	bh=nCSq6OlfZwTps329MQg7IWBHTHk/iD+YRAV1hNfF7T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hu/2pZxn8x8zMnfGL1AVibj+boeXHteDJVYbE+tk5RygVi84aPO4qIM7Lf/lDfjaPLEJwyXT8MUmT5FtMFsv30VX2vITx7uQFiXRtFrAjLhg6AxJHAvSUerbB58HGbjmQKLBr7UD8w60eOULdWrogOe9e9YijM3QGqnJnArQk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxQjIzSR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxQjIzSR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ELKFwf015135
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QfSpLV4uLPn2Uvfn/ksjNsnHeDxyMMKqQXaN8IP8v/0=; b=fxQjIzSR2q8+y5by
	ym1LLMCx3s2zXLUMYyas/A9hlixKXpqX5vndBBixNxzKQJtLchPJ8y1cgzuTKctI
	xsmgGO+PgapWFTNX67Tv8+04j5vAXE/BfVVF+6iw/1RN5XMPXv9HTWJjhAnzDnax
	Q1P4nHOVF68zgotKHgW3dmIAiiNJkyY79irk6cGxP6R/uXIuQvp/oL0vYnW5JUvF
	3rGkHrmxumABd0wO4ussJiVvqLTX7lIWic9xe8pvFG8DXeYv+ILW1TQlom1LoC0G
	5h5RnHHM4285oU9ueeRTgM0+YzLFm/PF94XpLRg0q5pbsQ4DAxyC0//v0r8TLcTo
	LglN7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr499n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e7e0a86a0so3179595ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266766; x=1747871566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfSpLV4uLPn2Uvfn/ksjNsnHeDxyMMKqQXaN8IP8v/0=;
        b=mznjDETBNMUcEWSjpSBlsU79u9Nzzc9s+P0zKmUVIR/OPaxhr4AVVYqNWPFnk1w9TJ
         avoav4WzGN6zw2ugVpLhwPZIVVbpKzLbvlOFI3XUaO8UzVzRcvXWjrN3xA95gSAAWDSz
         CYIicn/PebpIRkWF1g1WYxb6qv4/bh4nJz+PRZXnbvyT0/pbcRDsjMkTH9l2e+Q469ex
         hjLqHXQ+vk9LNC2GjlrhGrVEioqeQCWT83ZrmkYzSIbjft3GUv9xFp3Og9FyVNqpH2kW
         IKLtCz/JZjVJnp0fvxoS41KgT4nmBkEFlz/gwpkzIb4PMVItz49WdV5y6wHdeqX4Brpn
         O6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjFQO7hY6xwhixGkIIo+ObJw6XOK5xyFBpnc+pFGfRpcQ1p2peIJpMS+gDYax2fEc2MITAuMzcrBM9RDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwWIwpAZ8lDZ4NzoGlDB5Q5sqWuaUbH6+DVBRKCx7wslmKZry
	3fS4r5ekySw3itX+SHxXBywkeMv8zgaLFFSAXaBhcJD93IIr9YENvoDcqpctKxsTw7yUd5xVEH+
	W8ga8PXA5pQ3SGgjvPvJRN29YI3HaQ2DBJXPMy+tbpModr35Rv+mkgdPVUhqHUKihuIaFn90=
X-Gm-Gg: ASbGncuA24uo3GuTpCi4UpdOrh5wUrFYKtfehfeSfvs0NUiljAmeYqH0QsAhaQuWiel
	+ps/pNLD19Xp2q6lxm0IK7LBv5vDQyJ0twE7pwDBFPW0d7eAvYjywM+LvfOWT5tKTso4yFiMNmr
	qkK+ncWxvvBQjCePBmfSa5SaM1Gx0DDoPVUFwrFNru/BOgurEKnVOoFM+/dphe1HdDjOYQswqui
	/Uq2gKH3JqRZUNpf3ne3ccizqJUXa2GhqYnVwmAgthy45v6Nxs2Dt6dOgd2JPCtI3/3z+KU0qUT
	UG8GbCMiGwhG47aySVXbp0M1xLlzw1DdFqIOcWzWKi62ii8h5wam1AvIE09L0O46MVjf9myB
X-Received: by 2002:a17:903:22d0:b0:22e:5389:67fb with SMTP id d9443c01a7336-231980c7727mr70530725ad.7.1747266765065;
        Wed, 14 May 2025 16:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbQOZDXREyZcVfY88PTcvMDxeRBQjaHGKMXiK6MsEQwJYd4dIQTiqlP8q/7IDTjIDWf5kFrg==
X-Received: by 2002:a17:903:22d0:b0:22e:5389:67fb with SMTP id d9443c01a7336-231980c7727mr70529795ad.7.1747266763839;
        Wed, 14 May 2025 16:52:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:30 -0700
Subject: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=49595;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=nCSq6OlfZwTps329MQg7IWBHTHk/iD+YRAV1hNfF7T0=;
 b=r67/tiNCtWdcSsgEoIpDTfV8oLr8hNLocI6SMTLtSVwiLHOGmxrt4/8cb9YuiLfmI05ewMdMF
 3ZuQ9wWGuSyAaqfjH/6A7/YrJRAE6AwOZ/tMvMogGhmrLx2aFHVNBTl
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: GAfRLRoy0mjS0tANhItMPqjxC3jnsydW
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68252ccf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=iw1z9ScEdSCrm4yMxkEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: GAfRLRoy0mjS0tANhItMPqjxC3jnsydW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX8wctjQxUjk4y
 cjbjNVHkF+AgqMn054W1fNzqXJsqo/meZnPHWHIHnayUcXuTZqJOTaq6Rdjj4WYNRI2qk9BFTvb
 aDk53WNcqisxZ1G7MMtANIBWpIccWeq7cnb9BHbjXWJlviPTw3hSwhWeuAPNREbjeXOQzkNoMk/
 Pvgd4DRlKze/tBRqRcSlhGCMcQXrDTdJoafYEQth03QMh49xORskPHzeBo/ojOgSuhOMvdhU0/s
 eWhQH8zUtPbXidCnsMuG75HVTLmqWQqL5b+ageTlPwX77FydNgvBxT4V3tr4BxHWPxViOfUhXaX
 /MYKauW0oyuBbXoXiGF2zJRsSNbwaC6R64E1jlsQ02hKUBZ5ovRheqyWhopCnKVItWHBTuXbpKv
 gfR0fQAXF6aKvW2Yl2vEKZe92sqxhePJx56avVBbmax5L/U/3cgW4dPZs3zwZo5A2LKKyANX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222

Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
dpu_pingpong_cfg for all chipsets within the HW catalog.

Note: The max supported PINGPONG width was 4096 but increased to 5120
after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
of PINGPONG_0 specifically to 8960.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++
 28 files changed, 133 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 6ac97c378056..9db31591e27e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8650_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -214,6 +215,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -221,6 +223,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -228,6 +231,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -235,6 +239,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -242,6 +247,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -249,6 +255,7 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -256,24 +263,28 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
 		.base = 0x7e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	}, {
 		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
 		.base = 0x7e400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 1f32807bb5e5..4ac89cadf328 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -101,6 +101,7 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
@@ -108,6 +109,7 @@ static const struct dpu_pingpong_cfg msm8937_pp[] = {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 42131959ff22..dbd4129439a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -94,6 +94,7 @@ static const struct dpu_pingpong_cfg msm8917_pp[] = {
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 2b4723a5c676..a93976f6167c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -101,6 +101,7 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
@@ -108,6 +109,7 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
 		.features = PINGPONG_MSM8996_MASK,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 5cf19de71f06..e2e99504c715 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,6 +181,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_TE2_MASK,
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -188,6 +189,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_TE2_MASK,
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -195,6 +197,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -202,6 +205,7 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 746474679ef5..1bdffe168fb1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -170,6 +170,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -177,6 +178,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -184,6 +186,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -191,6 +194,7 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 4f2f68b07f20..03f46a652449 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -141,6 +141,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -148,6 +149,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -155,6 +157,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -162,6 +165,7 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index c70bef025ac4..011e98e6e7db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,6 +115,7 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -122,6 +123,7 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ab7b4822ca63..152fa5ea12dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -194,6 +194,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -201,6 +202,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_TE2_MASK,
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
@@ -208,6 +210,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
@@ -215,6 +218,7 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 979527d98fbc..7f0754e47c2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -218,6 +218,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -225,6 +226,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -232,6 +234,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -239,6 +242,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -246,6 +250,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -253,6 +258,7 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d76b8992a6c1..1a904b68950a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -217,6 +217,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -224,6 +225,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -231,6 +233,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -238,6 +241,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -245,6 +249,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -252,6 +257,7 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 83db11339b29..7c65f77a2c43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -164,6 +164,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -171,6 +172,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -178,6 +180,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -185,6 +188,7 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index da11830d4407..f0539dd11dc8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -145,18 +145,21 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d3d3a34d0b45..a357567ad597 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -126,6 +126,7 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
@@ -133,6 +134,7 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_1_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 47e01c3c242f..c0bf1eba1eab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -216,6 +216,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +224,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +232,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +240,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +248,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +256,7 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 040c94c0bb66..d004e7ee71fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -115,6 +115,7 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
@@ -122,6 +123,7 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a..b0659b55542f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -78,6 +78,7 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 397278ba999b..ae0196372f35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -124,6 +124,7 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
@@ -131,6 +132,7 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba2..d9bb18f11a49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -78,6 +78,7 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7..8893b39e2ca3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -80,6 +80,7 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 0c860e804cab..6ded8b0309d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -216,6 +217,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +225,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +233,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +241,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +249,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +257,7 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e9625c48c567..e1512ff5945c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -126,6 +127,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -133,6 +135,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -140,6 +143,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -147,6 +151,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f8..2a084ee071b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 11,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -216,6 +217,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +225,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +233,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +241,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +249,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +257,7 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 19b2ee8bbd5f..2cb3966ee51f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -217,6 +218,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -224,6 +226,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -231,6 +234,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -238,6 +242,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -245,6 +250,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -252,6 +258,7 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -259,12 +266,14 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4d96ce71746f..1135918e0a86 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -8,6 +8,7 @@
 
 static const struct dpu_caps sa8775p_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -216,6 +217,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -223,6 +225,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -230,6 +233,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -237,6 +241,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -244,6 +249,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -251,6 +257,7 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -258,12 +265,14 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6..0516e75a3a16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -9,6 +9,7 @@
 
 static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -213,6 +214,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -220,6 +222,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -227,6 +230,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -234,6 +238,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -241,6 +246,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -248,6 +254,7 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -255,12 +262,14 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 6417baa84f82..23d044e10c75 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -8,6 +8,7 @@
 
 static const struct dpu_caps x1e80100_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_dsc_encoder_width = DEFAULT_DSC_ENCODER_MAX_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -213,6 +214,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
+		.max_linewidth = DPU_8_x_MAX_PINGPONG_0_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -220,6 +222,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
@@ -227,6 +230,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -234,6 +238,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
@@ -241,6 +246,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -248,6 +254,7 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
@@ -255,12 +262,14 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
+		.max_linewidth = DPU_6_x_MAX_PINGPONG_WIDTH,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5f1f3eae0f6f..194780905d29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,6 +24,12 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
+#define DPU_1_x_MAX_PINGPONG_WIDTH	4096
+#define DPU_6_x_MAX_PINGPONG_WIDTH	5120
+#define DPU_8_x_MAX_PINGPONG_0_WIDTH	8960
+
+#define DEFAULT_DSC_ENCODER_MAX_WIDTH	2560
+
 #define CRTC_DUAL_MIXERS	2
 
 #define MAX_XIN_COUNT 16
@@ -336,6 +342,7 @@ struct dpu_rotation_cfg {
 /**
  * struct dpu_caps - define DPU capabilities
  * @max_mixer_width    max layer mixer line width support.
+ * @max_dsc_encoder_width    max dsc encoder line width support
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @has_src_split      source split feature status
@@ -349,6 +356,7 @@ struct dpu_rotation_cfg {
  */
 struct dpu_caps {
 	u32 max_mixer_width;
+	u32 max_dsc_encoder_width;
 	u32 max_mixer_blendstages;
 	bool has_src_split;
 	bool has_dim_layer;
@@ -530,6 +538,7 @@ struct dpu_dspp_cfg  {
  * @id                 enum identifying this block
  * @base               register offset of this block
  * @features           bit mask identifying sub-blocks/features
+ * @max_linewidth      max linewidth for PINGPONG
  * @intr_done:         index for PINGPONG done interrupt
  * @intr_rdptr:        index for PINGPONG readpointer done interrupt
  * @sblk               sub-blocks information
@@ -537,6 +546,7 @@ struct dpu_dspp_cfg  {
 struct dpu_pingpong_cfg  {
 	DPU_HW_BLK_INFO;
 	u32 merge_3d;
+	u32 max_linewidth;
 	unsigned int intr_done;
 	unsigned int intr_rdptr;
 	const struct dpu_pingpong_sub_blks *sblk;

-- 
2.49.0

