Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DAB288C18
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670673; cv=none; b=as90iGvXSKfBV+lVLg5eOnhL6miMqEKU3+6rfPa//gflHHCvEgiiNERPoy7w9IQ9IbSqRvor1+A2IGn6PEnwm4OQEmy90Xd3Nga3VGFodWCUUUWIs48z6FrnUTRS+2MNWpW8pI5e8mr8HOXv60bYLgMPt54Q0TLsDEu2ucS5Jjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670673; c=relaxed/simple;
	bh=mR/xCpughRs57SqWOgcmdoipOn8yvmDJJZ1LELWrJHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GDzBCXYkyhL0FsXgNY2SackFGj5hSQllzQLIBJcRl55ARUpKqUHJn+RJ2E4Mhz687f6xme4kw1tn0AIZb7t4GHnsNMFf5Vh4kF2nAxMAhLtfxNv5vovVygTA2hjuAtBD1s+bEjB5aB4y3RGkIV2v5FFx6jpJ3TZxat80zF0p5s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNzyN2eB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNzyN2eB"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JE2d5e007910
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gj/YSAqL/pKIdtzmg4qXTj6XWQdBvdmYgp6oiMOenQg=; b=SNzyN2eB3pUGyanl
	PHuTAv4Lyv7BHD0b6zjOgN871LTjQcy1q0TeU+Xm8hA7v+oq3jIRuAaQkyZAoPCR
	oX7247geZR7KOJHohbsafJ5dCg2reY6Upi8nUf6iy9mY7ANk2cvE41SduedILLra
	jPqtLv3bvI2O1BMw/L9q5Z+8GwiBpMau01j6OC5RyShKk1NbB+r8wZiR0hFlKFTP
	de1ZWy2c46lL9IBcbqr/hUxr2e3njwWWplUuxfdq0Xw7Nbxq33dEn2u3wTp64s6L
	wQUxcMHU3txeqEacRB3mgznTfhQ/uKH64tJMIYU/+m7iVnseHlgCct0S7ecL8T8v
	XYMqig==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhmvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:30 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-400b3984779so4861310b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670669; x=1748275469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gj/YSAqL/pKIdtzmg4qXTj6XWQdBvdmYgp6oiMOenQg=;
        b=VaeDvwjZ4OyyYqtJ72A4xTDEX4+apnT+FaFWRhU2NMe1irP3w1ZoRyfgosKVw1FNYq
         ujitathIdGjYH2KSTe2x+nUssVf8butXB2/DcLws0ghMIYWwD6vb1wHmSKPYyV4+/GJP
         kIlG4NplFUous+wmvaD3y7d9Rcz+iTVsPRfeExlf1Ee6YlzgclaijqcwMjUzkhb56qc4
         iCEz5aIJL9NBOQTNvq8GlfGiJRPM07vE9oOgFTuMz7r2fgv7DLF+Pr1QcJBWSsP8dxuY
         mYw/ByqJI+pnT1pXfF04kx3hUO1FNmSngmWeU20qVbD8BBYyRWAXyUSYknHGjPTD+BN9
         DS/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqCqSK3UtxA07tAi1I2vzxWk7+Ui7jhZcNs3L+JQXbvFcFum/AZXpSAj4oq29cGKrpNDEGXilJea/6GUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww4B7QfjPK6pq9Tyw9RcEqZ2aZG/BPqEcOv1ZtGqw4Wjqp2BfJ
	vCWN3bdzzv+4M9GQC0ZGyRC9aUpKBP4nmMxYROtvyxjxGmsExBstc64LvRlhbLgE5hgyu/Ru2yQ
	RhhR1TczqBb58RudVRLEYfe67Zi0V8nZM4MWaFxu2EM1WGGXUAo77QZHNuDHEQCaZGb4jFT5jRb
	g=
X-Gm-Gg: ASbGncs5/PLX7PYyEb+kCaBMo+XdjRQYJNO6DFf7o5va98PeppuBBP6flu4K6+s3YQA
	8QmyJVtyJ/y6CGJ283yrpciKv4YXdqNWuvO1ElhPziy5Egwamcv4197zxcAYXmFqaWcN94ewTtb
	q6teaGsg1XeeCQcL+DruSx+y126itjtdgNHZzS4a1kTGmcC+uz/3Dl1XLNZQcuILTDI8wdFh9Ni
	H08crnUloWtZVxlsHykIffF74IgsOsA5o+A3cQIq+WUI6VK5p6ubX4KTEHIYRlocLk1uDIDgeMO
	TOciMMNucLZB0A0PbAD62a1WkHLGZVmAUBBhTcUyGMtCAfo1+Jg0TEtqYmTyAitLK9kmDvVyCc/
	zu1JYnqjNkf0zf5P633SYnZB2
X-Received: by 2002:a05:6808:320b:b0:402:11c4:bceb with SMTP id 5614622812f47-404d86e6407mr8364572b6e.19.1747670668314;
        Mon, 19 May 2025 09:04:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQTuF1wSSR1eawrBZbjoIn1NnWRiyP331gwAjAkcwKl2oqkVuYUpwg0aRaIIGqZdf4Goy5Kg==
X-Received: by 2002:a05:6808:320b:b0:402:11c4:bceb with SMTP id 5614622812f47-404d86e6407mr8364509b6e.19.1747670667746;
        Mon, 19 May 2025 09:04:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:09 +0300
Subject: [PATCH v4 07/30] drm/msm/dpu: remove DSPP_SC7180_MASK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-7-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=M4s3D/m7YZ+QFjGDtlD0CgMMGchB/w4GEub9GVsjyDc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z2WNXrlYyPlfQ9W7bOZ/R1OnP3ha+RWrHfTaaoNS/n3
 GsMZPjVyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJfF7B/lfwo7CBDK8Ze2bv
 ghUnBQ3YReRaq34ejPsry+p1fvvvDXFRNTPuH/EV3ltxSfvHp4/ie71fbuvaszRp6vquxyopJ0x
 6uA5//pW+UZN97ZNrKv+N1zf9e1dQtSr25XsDTd0nF5qKFKPZAvI+rK+MviPNbqz57V9qlL5m5X
 OVJvEMw0zTSUsiX12Q/JbI9LroQOrH/PerZJLsYpf5mp+Yznb9j6j++yk7RPi8T/zrZrVi4j19V
 7z4rVqnQIEB6+nXfGYtsoxNRUouXIbeKmw/vPpXbq2V53LlP9/AFJu+a7IUV8LZfqu3rroHGzrm
 /6s5sITbNcDyamyh1HJ30c9Rr5UV/m6dHfWlpHmWoXofAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: IcqhLN1HqEmV1XvDWfzFYDJm6EYJPQu5
X-Proofpoint-ORIG-GUID: IcqhLN1HqEmV1XvDWfzFYDJm6EYJPQu5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXzt+4do/Gq9gm
 NY+pdSLAJeTVdE6w8ySWzcTwI4kUy15a4RXEw00ZiWb+YJzmLGVQMkqT+WSvN40mJ8Xc5Gssa7V
 R5x6uWRqC5XWtysH7v3jKtFcOBZ4+wazqXZRlvnbhUiwUbjPJ63RIB+YCJb5DJf+bdrM6I2Y2kW
 q4dfVFO4zMBOGI5oYUDmd95PGLpIv8OVxvg7oI+qWBWjtEhTHIocl7h692rRA0sbUhNkyrr0eiR
 QUVe7yopyPatXdtonZkNnz98OrrQYP/tIiFPouCt6jntOC7iT5R4LFGUis18uTZiaZqPM0liyBM
 rf8JoPC0P/i1mxsrAnQl2dSiikbHrOXojCdsD8GGrZKzftGE2K8iLNH2AOOwvRZ0+1cUQ6kbhii
 imvAifIXAu51DQ+s120lHt2R8T3lLMGY8oKE9MYPvG4ZqWSfoMfwowJFARuMJtEBB/IEi5+5
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b568e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mYGjOyR_Ic6jQ6k2fpMA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
presence of the PCC sblk to check whether PCC is present in the hardware
or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
 31 files changed, 1 insertion(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 61420821a5f2dd5e56b8336c898290a2552c77fa..b14d0d6886f019c8fa06047baf734e38696f14ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sm8650_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 39027a21c6feecfba2d164799d9d982fc282d06b..c0b4db94777c42efd941fdd52993b854ab54c694 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -116,7 +116,6 @@ static const struct dpu_dspp_cfg msm8937_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 8d1b43ea1663cfbf35bed7b913d5d0bd16757162..d3e4c48be306a04b457cc002910eb018a3f13154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -103,7 +103,6 @@ static const struct dpu_dspp_cfg msm8917_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 16c12499b24bb4cb4a7f126dd6580d9d366142d8..c488b88332d0e69cfb23bcf4e41a2e4f4be6844d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -116,7 +116,6 @@ static const struct dpu_dspp_cfg msm8953_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 91f514d28ac62deeafa843b5fbd0c8eb856fa49e..8fe07a5683f734a058e7e7250f0811e3b7b7cf07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -223,12 +223,10 @@ static const struct dpu_dspp_cfg msm8996_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 413cd59dc0c4270973b34fc3a19405feff5b47e3..91285519c540025abce5c51f2f28442ed9d479b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -212,12 +212,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index b2eb7ca699e3ddacee441216be647784c9bbfcb5..50e0e3aec23c02acc1ce2d2a8a5658d6d49a62ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -183,12 +183,10 @@ static const struct dpu_dspp_cfg sdm660_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 85e121ad84a0f35fe2ba45cb76856ad83effdf44..1c299491e61f0465a164be74b7a754435f347cb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -133,7 +133,6 @@ static const struct dpu_dspp_cfg sdm630_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 49363d7d5b9384dd66ed02ee9ada05b24355f1bf..50e40405a5271ea6b12caa7a931ff7fe3f2478a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -170,22 +170,18 @@ static const struct dpu_dspp_cfg sdm845_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index c2fde980fb521d9259a9f1e3bf88cc81f46fdfe8..3a60432a758a942eb1541f143018bd466b2bdf20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -103,12 +103,10 @@ static const struct dpu_dspp_cfg sdm670_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 08d38e1d420c1ceb9cc527b260c08edcddb139f4..b2ee5ee01870507d9f01020443c30dc573414c72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d6f8b1030c68a428a144428b422b63b960c2fdba..6db04c668a87a9f7baea01a9ea2a0f1bbb1212bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 71ba48b0565648a02044d444d0242fe04cb34478..6f61ce85c536e36b65b98ba4740711cb495a7c9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -150,12 +150,10 @@ static const struct dpu_dspp_cfg sm7150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index da11830d44072666e47b0505e2edc3ae7717eb23..dc6d8fd05c2e3afbe5182b1ae8dd9fea8b6543e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -136,7 +136,6 @@ static const struct dpu_dspp_cfg sm6150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index fcfb3774f7a18d8e01546a3ac72aa29f7b750443..192e90b570dbf8f5c3c24f572443e111f6cf3db2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sm6125_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a86fdb33ebddc7f2a9914ef04899397e3271b79e..bdd92b5a61eabc6a1d5e0bfe740ed6d9f1e8e94f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 842fcc5887fef15789fbc686fe2156b6b509b45c..ce2ec6af5f53e2177009ca8826ca510fa08c03c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -106,7 +106,6 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index c5fd89dd7c89046bdbf1b1bf223aac2e3c4c0b26..986179b53f8b59200d10f5159cac630732dc7196 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a234bb289d247d065b336564faea8dc35b00def9..c2321a4a7d3894d85062d083b45402950122007b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -115,7 +115,6 @@ static const struct dpu_dspp_cfg sm6350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 53f3be28f6f61bb7e3f519b0efa4cb2f68d38810..c3dd2383bd5f32926b50d98c937da25ed59d7cb3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 3a3bc8e429be0ba86185741b6b27d8a62489779f..abeaa2b8e06fdf6ce5cec2c1a4fd025a342f5a2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,6 @@ static const struct dpu_dspp_cfg sm6375_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e887e78059a81569fac8a4246ad63856dc48cfcb..bbef0e1c597299d24a923e1f0d977c99afedb8fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 1edec0644b078ac1fff129354d4d02eec015a331..281826170da082fc90a05c641060901ece0fbed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9d60208745138bf29a7bdbd14ef28a2102f36f9f..1dd0a1aa222d65f03013d634a87371dc552b5bd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 631154059c31e8ce1b9e3631552ce49aa589d4cf..50142b14e24eb875e72e5cff3b28ff8aba89fc9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 3547fdfb28cae6cd8d1909b268b88676afad0be7..264cd6d3640be1bf321fda429748ecdafbeed214 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sa8775p_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e16e47a6f426359548434569ad632aa68f32908d..4c5785332b5240109af36a1256d4ea29c348bced 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index f85d5d7ae51d64203647a8bcec91f524c6e33528..960c68f33074e0cec0f33aa7d4f8f3b4cc69bac5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sar2130p_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 0d6511f90975508b36b0fa00a92349a82eff4d52..85dcf577b844995fe11322ec506885bc4a85e33c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -188,22 +188,18 @@ static const struct dpu_dspp_cfg x1e80100_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d383368c743b202d7256f6759deecaf9d756bb02..00e6f3e56ed1f9af581bad9845971fad315ef83c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -113,8 +113,6 @@
 #define CTL_SM8550_MASK \
 	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+	if (c->cap->sblk->pcc.base)
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;

-- 
2.39.5

