Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ADC286D64
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670663; cv=none; b=cSUQeQ7eena/CRNSHKpZGLRGzZPNVI/elHwpvBv48scSci8OuWg1DWEjKJhw4GVTsGl3Yqo9VFlhFfh0gtkgYlO4/TSKfX+ARWa5QVBExg0FgdGX316wko4CUhTb1HdcHagYcJxhjuUKfn7p4OmXjBRLcRMnK0E8oggoIGEvWxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670663; c=relaxed/simple;
	bh=ZJw7qG5WRsF/6O1dcCrVTRqJXMgP6JzM9Pg8XLgMQSM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6o/BKE0a5Byr2gpbSuQB+3ohNx+7pb0It6MQ1Tyz3q2NCOVbyC/M47s9LIQvlqOcoHopqmKV9kPbt3lwdSz/Gj7lD4WMYslu4tCeDxyj8MSFGnfJ9a7AcMnGVbePkYXq7lrkHnNSvOp1RPrdUt6+f6P2PKMlhdMzyKWLkZaunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu4Opzzm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu4Opzzm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J91FLn021887
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qcr85CicE+cO+piF+cNk0hAEVQxv+ZHV4m7cUgeZRdI=; b=eu4OpzzmeZtM60Z3
	eSkfoEtDevob2TIVKqdLBMQ5ymjEOk7a3FojWMVqngR9boVeo5nD7EaucHWgqKvh
	TMY42Aw8wUT46aorB6JIMDwkdz1PoumsUitmXYdm7+85mw5x0e7omjM+yDhMs0C8
	tCDo8YlotvsiMF833QF91rYFanstB9p1PIeXB+NK4vZTxBTOVhrTcQmIUWITZesK
	SQ+55BnGz3fDoFg88UpQ30uyM5IQ9M9LLs2PVNKooHpAoOcnKguilhIrOtmM8GN2
	2kPY1HnYOJ1Lxf+BI3AlSQsmmyB823qsc/3YIvfG6GuRIV3pGxuh0DerMkIT8fu9
	xVZ++w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn13f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742951722b3so3777147b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670660; x=1748275460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcr85CicE+cO+piF+cNk0hAEVQxv+ZHV4m7cUgeZRdI=;
        b=SRIVoO37m22+CCcRVFuNjxkMbRfHwAC1BOSLw5gi9GTRwzgSeBhreCuIBexkHO8oSd
         9845jORbz4uJdyXFvYF7GGIY0qZfGZJ2tI9SqeqYouXklHgxc7frj8ZCZaMc9XkLu5jR
         IPqPeyTUbjjtNg63dhq2ociRmT08tcP6bw2aWHYKznBtDjCGPX2Cyw5Om63jUCiCDPf8
         TCCVtG4qUFxEP6juy9udaKOM7OzRhyfUmzNV3ENrFERQwzF8FUQCXsQUN5hehE6yvmRY
         M4MsER9/LJ4YXSlCFf0cjxPcHAbGV4ij9UgkcO1X49F6q+Kcm9PdPPBh4aF2AAqworLt
         DVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXXMa+3/RDs1raGEbH5VaB3phikTYgH2T1mcfuac8kwuD8N2xIybY0vmYuFgpH51vUIKxSAXiiwh/fbZBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuPD6P16L0zu/Pmr3NcKcWaTsNQSqOwtktniwUmPqkpSKQAPGa
	e//IB6Y+MY6gdaXy0JaPQ4PbzTvdp+RgNmKvQbB4HHlLAPyqoan8AxN31urzG4YBLADL8di0X5p
	1lrOjTrNus4X2KKWVOjKpQl12WPcTzbj8+XcKo6pVAIQ4fP7x0iYnId+qh1AKfaf1lFk8h+awV0
	c=
X-Gm-Gg: ASbGncvOZuzDXwetRdP3JnlAr351IaVkwj2kPVDMU7VADRWnVs/liR8bxpz/gyPBVcT
	J+O0fmpjVJ219oHgAhtCPYT3cVbUab0pMKBjHeemrO/pg4fIPbdAGClKk+j6HpKRBYNj+VdD7AW
	MxEXUp4XraLVGz8NwSBGnQQo0OMlNvZZ0miLVWQJDJR5K7eIvH4urbKWloJiEkvvpHYN5Znrsji
	xbUhUChdTWYlztspQZO6sqDNddhq+Sb6iOczdIv1nqzKxNhdkKOXzpLpAjrEo+yNHlutC2PjtPC
	vsZRlNfMu37IW/y9NCUnwdpyr+w9tFTgu9AvpY7WQGJAnclrdJxpZgEp19z/uwBFbaLts2BKkt6
	Kt9tuie/txBcXMppkH1OBb4kH
X-Received: by 2002:a05:6300:2189:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-2170ce3a4f2mr19827829637.38.1747670659370;
        Mon, 19 May 2025 09:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE97v+qvo6ZVTRUgC4bF4JIi+hG604mrplI/UmuJxIfaCP8vUk27OhUYIGmb2Td/0c8iIYd3w==
X-Received: by 2002:a05:6300:2189:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-2170ce3a4f2mr19827767637.38.1747670658745;
        Mon, 19 May 2025 09:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:04 +0300
Subject: [PATCH v4 02/30] drm/msm/dpu: drop INTF_SC7280_MASK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-2-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=20890;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4lOReniyl5hQmf7R+K3ps3iGqGzEzVVioPHVCuaJzLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z5ELfnRMMtsdLFVaS8ANdQ/R74wpqauA5DQ
 bNklNlxM6eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1WPjB/98IwSKDqEAPEoVzNlSqEbt4sYgmVZY/e3Bv953IK4Ux5BENVH7Yvcfwf0Lr7dR4ZSNrLy
 DGaSyUFRudbkxwNpph6b2f/89uxxaRvmm1CC6fitjP28W5N/2AZHnM6tgoiwfFX4KJGGsr4Cj5e
 KHjsYAZT0YhbOTQmdGjJ7H5njBEVGUedyblLHtV7m2IbQoHPYb7X7PsQQSMLayQ6XshvC+Suf7n
 xAnwmgD0Lt8TL/UHP8KMgzwhs3z0RC66VBLsLVZV4Mq7gz9QYFsM6deLU3bWYlfWcC/tg50cZnv
 Ybg9WAitnTK9Y2ipUpKwS9Gk7+YXQwMxJK1WaWqIp5HF5vCG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: LQtjxLpUnfncMrMimaEY4RuaPdtLRM5Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX4QmatkCEZ+JA
 1qT/IwNS4WuM9qrBOjZgHPwkziWyMnzWoxOZkHr5ypEiFGBMBUzuEYyvjdcpx3tfvk+MhuDlRqh
 32yDv3AbYOqBWDiz/TkYSn+u1JUXEtuYSQ0m7fBMvXpJQ65nUlb2xd+9d11hC6mfXDKF/p7kt8F
 qceQRMJDsby5SfNqx5aNK1ULsZCyYS5YGbbygTjLZMjajjbZrNViCWulxmTYF+qlIP58Ih8Zmqd
 zKVjJ9J8xz82j866FbxCRA0O8Xlmf5VHWky2fa9nkHLYsIhe58fCAi3R6eEK7TM4CmctfeTpGgJ
 IlcVeBIHok3W6fVkWPHoooZUM8YehkYBiMEafEWEl1Y0WYO9ZFDZLufx7/8H7qGWC3wCyos82iO
 LaUAOSeRue5hBVjejG0XgZmolOWa/PoNjIQ2WwOsh8IKX8dI9fIIWevZOtv9ma2DCUUxj1PU
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b5684 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LdkPZyY3_TlY3W2BU1QA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LQtjxLpUnfncMrMimaEY4RuaPdtLRM5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The INTF_SC7280_MASK is equal to the INTF_SC7180_MASK. Stop defining a
separate symbol and use the INTF_SC7180_MASK instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 16 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 --
 10 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index ffc4d4257ae52553bada7a7a270ab02f566359f5..61420821a5f2dd5e56b8336c898290a2552c77fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -374,7 +374,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -383,7 +383,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -393,7 +393,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -403,7 +403,7 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 90e86063a37277c0e15c6ba5b41c29fa769e25d8..e887e78059a81569fac8a4246ad63856dc48cfcb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -318,7 +318,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -327,7 +327,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -337,7 +337,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -347,7 +347,7 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index e9625c48c5677ef221b8fc80e7f9df8957b847e2..1edec0644b078ac1fff129354d4d02eec015a331 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -183,7 +183,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -192,7 +192,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x2c4,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -202,7 +202,7 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 139f11321fea8cf96d6315abf1a8d2f9b9663c02..9d60208745138bf29a7bdbd14ef28a2102f36f9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -314,7 +314,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -323,7 +323,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -333,7 +333,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -343,7 +343,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -352,7 +352,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -361,7 +361,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -370,7 +370,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3a000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -379,7 +379,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -388,7 +388,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 461294143a9004ac2d18afbd57c2dc235e676fea..631154059c31e8ce1b9e3631552ce49aa589d4cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -334,7 +334,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -343,7 +343,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -353,7 +353,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -363,7 +363,7 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index c248b3b55c410d8e374b8b659eeddbb657bbe854..3547fdfb28cae6cd8d1909b268b88676afad0be7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -344,7 +344,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -353,7 +353,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -363,7 +363,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -373,7 +373,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -382,7 +382,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -391,7 +391,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -400,7 +400,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -409,7 +409,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 59c7fdf28e890f0c4c15e869e549488003fcd087..e16e47a6f426359548434569ad632aa68f32908d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -329,7 +329,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +338,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -348,7 +348,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -358,7 +358,7 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 5667d055fbd1d8125c3231302daa3e05de5944c9..f85d5d7ae51d64203647a8bcec91f524c6e33528 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -329,7 +329,7 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -338,7 +338,7 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -348,7 +348,7 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -358,7 +358,7 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 52cc10aec1f9f539a1ca26339704a053d5c38a82..0d6511f90975508b36b0fa00a92349a82eff4d52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -330,7 +330,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x34000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -339,7 +339,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x35000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -349,7 +349,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x36000, .len = 0x300,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -368,7 +368,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_4", .id = INTF_4,
 		.base = 0x38000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -377,7 +377,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_5", .id = INTF_5,
 		.base = 0x39000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_3,
 		.prog_fetch_lines_worst_case = 24,
@@ -386,7 +386,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
@@ -395,7 +395,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
@@ -404,7 +404,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.features = INTF_SC7280_MASK,
+		.features = INTF_SC7180_MASK,
 		.type = INTF_NONE,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c878fe196aeb6c6b19fc3173fb8615f184ccf2d1..d383368c743b202d7256f6759deecaf9d756bb02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -120,8 +120,6 @@
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
-#define INTF_SC7280_MASK (INTF_SC7180_MASK)
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \

-- 
2.39.5

