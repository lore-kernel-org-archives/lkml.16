Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412B28B4E7
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670717; cv=none; b=ZSYQwzaw5x9NaWaOWbR2dxRSiBv1ydc9pXWaCA/MjBBqyTb8LkL/hNAX9a8ZhVaPkDTIkPjkW35WuHlNS2dMiBDrRcJ509W8pDdaLpIWA1beq4czNRS4uQL3wWe+ISjn9TrbobjtfEzMijS9HcjC/bzkAqiYp5cc22cgWeRZ45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670717; c=relaxed/simple;
	bh=yu1RKR86AYBwaBYKeeSq/9Wt7HB5D8dF3OMfjsg+j/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CV7L/07qbukEz5ivzhXV6CqVm7PV7ZyAQ3ZKXmm7d3vCb26R/TDk/u0cuzXvwxwxca1Vyk8sylIRoSpO6MfpkMaDyrRMeAJzT5PHtMceZmX8NLV2aChT/cz6KueWjsuPzWUIRdwEFPsI11swSKlvG987xK8stG6h2+VMmWkQgsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l330/fRJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l330/fRJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9sx23006521
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ea6wr1i8bD7Empy2CwNO/ECmmeCFCrn1wDLpqx7ULEE=; b=l330/fRJkRFGnzdS
	Mh1PBgU9E64l0siabdmCfGv25XT6FPFEq6OYOt+fH1A4ITP9dqzNpCqRqIVvJ9dS
	AizIDtAoldl7KZxymWSzeMMXDDXB9GLL0Pwkm0WDSo9vA/TPIx80PtVEByKNNFyz
	NnzST/G/KqMrQl7ILp09IWrz/Dm6r/aXMw5R1VJ4FXSHpVzljHbo+/AWfVTam6XE
	MSEfjB4IWhiJDebWitaX9LOr8oc9461XdTJP6oXb0DZksZ8kOGjCvgG339cKyeQE
	nyXkg7Of7Ew5IcnMolZzxz6LAmHqg1KIc1QYpWgR0V6rXD1aibL0uCRZOjwJUQQG
	jkDEbA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsvus0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:12 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3fe28659299so4681166b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670711; x=1748275511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea6wr1i8bD7Empy2CwNO/ECmmeCFCrn1wDLpqx7ULEE=;
        b=Gz64Wd/wbwPgBuBhQRdAvRC3J7/OcbImCLQH+uAccfEzGvYk5XbQZSgAo1ZzxuLtMM
         TKAftRWlZ69lc5noBKSbiFto2Y8wUQlFbSvptEgGLT0nHRRlcPWwkhhOIcvcapkKZZFF
         SUJMxdmBfMbxFiRqANICWtjEygmDBJ5FHAVwfHJiWiVxXpIjvHoBSTGDlGBzX4u9M23H
         F8I0Z77+5lOEL5OS5KBxiaardHmDs4pmDvcL3s5UuXING5xA/spTkLVHBB07P0HIgsQD
         HiJjVkezovpTHyTZrIoTTPW9Qijdow/2AbCQSfKqYM2pXusHZG/FhmcMq0/RQ4UALpE0
         YEvw==
X-Forwarded-Encrypted: i=1; AJvYcCXLSrsjQQ9IR9E4+/5ASUUUKfkzm67ta2tEdywr3BXTdrJC0PZpilTLG3ANEdzEcO3qrtwEAsf0ktMH/ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSpZtj4TNXXUJTslDzbkoLaWw7xXJDImcyL5UxDSMGedmqSjh2
	BnL4qTRlCn5ocrQ9Gz73bzJZDq8eAC7zw2UpaL/bBOqhfYISyiHXMkbw1jM+jwuDCZaCxDz5FPj
	r/9QPDyAbDY9tiy0HUJQZTpVV2IOQAaXslDhIyxe1yA91LIVgeMMFxUA19R1hQr43clpTZVZRi2
	A=
X-Gm-Gg: ASbGnctQXU1qTTUHDD0YFf0jIjNoxywFcYnZy+axeRSice1ENN5hG5yw4HQDRV0HfvJ
	KrLYGtFYUKGXWGhxSmn7Ma3xhjUXoWZCSLJZp1Zj35Er9yHFs554ZAjOs1kNncLW+aj/FwGS1Nj
	lPFKxBq9M0VQ7/uATS2DrlfDsIChyNY9/yZsLp5kab1EdLNQnZvnA+1FwGyx63nrCAvW0ToZu7c
	1NluO6AKOlII+g6Pr4QARRB7UDfkQfOVO+w+Vl/H6i1nwu8V/+r1i40iuI/if2GYN6St8sw/J00
	sDHVoylAIVGAeOYbiwoER8V216WyYzpNPU23P9ocdtglkFEOxvijMyDDoYBRhSj46+95DPKjxz2
	KNF+dD0cWksM3Cf5j5GimV+jl
X-Received: by 2002:a05:6808:6b8d:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-404d88dd6b0mr7617034b6e.33.1747670710948;
        Mon, 19 May 2025 09:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEohu2HTpezrZKjYZzab40lnugimadF330qDKDeroQaoJwaPnUM5h62Ck57ATIfwpVwkh2mgg==
X-Received: by 2002:a05:6808:6b8d:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-404d88dd6b0mr7616985b6e.33.1747670710450;
        Mon, 19 May 2025 09:05:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:27 +0300
Subject: [PATCH v4 25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-25-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14567;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yu1RKR86AYBwaBYKeeSq/9Wt7HB5D8dF3OMfjsg+j/A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9QSaPbv4oWIi8YEqjg4w0aHm3syVW4pnlR
 9a9iJ11we2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1TwUB/9jrtkqZHILUK+VKMLLVoM2dP4+44OwUSKu54jrkEllBCajvROTBMSyXLeBtc2+1fKZAeM
 wITeXKB42AjmZhdIMG5FQMkfHc615un6mLz2pRuci9q1CCTaoCLuL5PbyzqfZdQwVEMsxkc8DS2
 UAotZZ1hVlKEjHpsNj4eKoD/wiKzt2LZPFyTaEsF3EetGSRn7EMtyyPT/QAk38Rp2WwJajWBoAE
 sqPu/zG4nxRuVn/bt2xXqtrV30fJw3DcmGHMQK0CZESgN24mOXKGePJn33eD2NmVwiwC5A0ZcbL
 PbobujIvNXswNSkuwejXjyN5euHSk57GSNw3jMpybIkhvavM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MCmi-5YcqbEP9YlUqEsk8orx4b1ihdzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX8YgFOoGJV8dk
 QYqTreo6qbB0+yyQgOKLKSuiZlEwHZcGdANks+GH6PHN/BIFCjFVFROJg5CDEEGcHO1hJGixdSj
 m5S01ThRvLfN4EHrf1OY++/qWzG7bL7BwSIXJe868UcdzLIr8zmZPPOkPadZdZmUvY3lVEib4HC
 5HICxBvsp+ZCh656z9U8G2VjjM9E2k1MOi2Mr5kn8HBCyxf7XXRZQrtJrrnLr358uOfHjVmnDLc
 0qZRMLNAxEMubgCIQOgsJWvKV346dMEqGmtlofykD3BrFMYbvOh00HdwihmgqC8Cr8eX75YYUvQ
 iOEoHRSpTkkrBaiv2Q1meNme1w/bWZhp9pWEjwE9IBMvU2eVirDgXfO6+nO+uzAo5dzCJUYTafl
 TXr+Hyjv1czfqNBlcED4n3aKfU7jKtp0U05zEmyi1w57R3/WmedHkFATdOSf7w6cYugYzo12
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b56b8 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qMlBm1ryi7ijQuv_G2cA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MCmi-5YcqbEP9YlUqEsk8orx4b1ihdzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

Continue migration to the MDSS-revision based checks and replace
DPU_WB_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c                | 2 +-
 19 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 013314b2e716a6d939393b77b0edc87170dba27b..56d3c38c87781edb438b277c77382848b679198f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -318,7 +318,7 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5d3b864d28a86fb86fc4576210c9418604afd844..ae1b2ed96e9f10a6e7a710fc8bb4e40dec665cf9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -275,7 +275,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a6e9dfc583f283d752545b3f700c3d509e2a2965..fc80406759cd52f0d633927c8ba876feaff48e07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -281,7 +281,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca..a56c288ac10cd3dfe8d49a6e476b9fff062f8003 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -241,7 +241,7 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 8fb926bff36d32fb4ce1036cb69513599dc7b6b7..a065f102ce592311376f1186add7a47dca7fd84f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -154,7 +154,7 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 5c2c8c5f812347970c534769d72f9699e6e7049a..2950245e7b3f5e38f3f501a7314bb97c66d05982 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -133,7 +133,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 9ceff398fd6f554085440f509b6f8398b4fbf304..7b8b7a1c2d767eafca7e7440098bb28e2e108902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -312,7 +312,7 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index f6a0f1a39dcc3c9e82c07889d71905434274cdf9..c990ba3b5db02d65934179d5ad42bd740f6944b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,7 +148,7 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a..093d16bdc450af348da1775ff017d982236b11b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -142,7 +142,7 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b..85aae40c210f3aa1b29bf0b5ea81ee1f551a6ef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -285,7 +285,7 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5d88f0261d8320a78f8d64c9bb68b938f83160a0..8f978b9c345202d3ea1a7781e4ef2763b46c6f6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -159,7 +159,7 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3c0728a4b37ea6af25ab64315cfe63ba6f8d2774..b09a6af4c474aa9301c0ef6bc0ce71ba42cce3a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -298,7 +298,7 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index b8a1646395916fde04b9750cf548edca5729d9c2..0f7b4a224e4c971f482c3778c92e8c170b44223f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -305,7 +305,7 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c..465b6460f8754df18bbcf4baac2f8a3ebdea3324 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 2e7d4403835353927bc85a5acd3e6c5967cac455..6caa7d40f368802793c8690544c1c82b49a617cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sar2130p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6..7243eebb85f36f2a8ae848f2c95d21b0bc3bebef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ad0460aa5b5ce5a373dab18c89e4159855da4d2b..6d7be74bafe326a1998a69ed9b3495c5acf6350f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -98,9 +98,6 @@
 			 BIT(DPU_WB_QOS_8LVL) | \
 			 BIT(DPU_WB_CDP))
 
-#define WB_SM8250_MASK (WB_SDM845_MASK | \
-			 BIT(DPU_WB_INPUT_CTRL))
-
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 41906dadff5a8ef39b2e90f3e80bb699a5cf59b7..8c394e7d6496ca2d120c81c7776b4b979368be23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -140,8 +140,6 @@ enum {
   * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
   * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
   * @DPU_WB_CDP              Writeback supports client driven prefetch
-  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
-  *                          data arrives.
   * @DPU_WB_CROP             CWB supports cropping
   * @DPU_WB_MAX              maximum value
   */
@@ -155,7 +153,6 @@ enum {
 	DPU_WB_QOS,
 	DPU_WB_QOS_8LVL,
 	DPU_WB_CDP,
-	DPU_WB_INPUT_CTRL,
 	DPU_WB_CROP,
 	DPU_WB_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4853e516c48733231de240b9c32ad51d4cf18f0d..478a091aeccfc7cf298798e1c119df56737e3dc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -208,7 +208,7 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
 
-	if (test_bit(DPU_WB_INPUT_CTRL, &features))
+	if (mdss_rev->core_major_ver >= 5)
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 
 	if (mdss_rev->core_major_ver >= 9)

-- 
2.39.5

