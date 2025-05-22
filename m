Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1228C875
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940694; cv=none; b=lnL85dW07YVwkA9T691eSgj+8pzfvzBRCW0PVDry+qMlgAYZxE+gLthm5NqG0HA5fgOMFmLDNtm40uGH9K4vOCMn0ztZHniJ2isldPQjyd9yDYFIlSNelQkP2Cuyibqa2toCbnu6FxBo8fy4qNL1OMiOabKb2LxgSTYOgQMbNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940694; c=relaxed/simple;
	bh=mG5V+769NARywzQDqSO98sMatrgNsrI0dLaZUKofTIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaLGGGvtOliPf806XrKSQ7fWlqE9VPwea2jYhHZL9NW0TF1AYkzLAFa7Mrutt7mvIQEn24PQuel5IQtmX9NgLJCKvdtj4hpvVyzYMbS76sPHDrQRIepTA7CLsq1K5zwaNZDUsFhCed/MQ0AnVllubZzSW11niy2hYV2PwKtM/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2O6AG4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2O6AG4B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHDbxX027524
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=; b=o2O6AG4BqR36OSah
	Os5j/CKCuMjniY/YOCXrzXhTb9pWpQUm6kHw1ib4a+mT/5oeAIOcaqm9BV9M09xC
	W0eJmNNFFSZG+PhcbUumFQCuY089KwXlQScmzw1P7kr3qFit25MaKSFGIy1cT5b6
	FRjDIiiDLpzNBFHDIop7Y1yy6QZ60KD8cwUbsLdIPVLGS0tFvdiaOwUVeuSyxTuK
	sp1GRjtT4owvk0b5+hb9gYU4oAAGQZGEqHSWQREM2l0lBGKkpbhmKMOCLQyW+IS0
	o5zgRlCjhLIklqtPTVWpT5Og2NYqz8jzNoTFn/TdUJ5rW9Pj+IAtDDVXfjlqWvbn
	aE76AQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c264gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c82c6d72so1469776185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940691; x=1748545491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=;
        b=vbH4Q8EsybRWABiG3t9LKqSLuCGOY3A2GwAVi8BLyegSlE/XXTBnJieNq6TXZrDCZf
         YZJHCu9V8g1VSR0rYiBbm3MfY8SI2yUwUAPdvBNykcp7DY9xr+1SIXKzPd1RdF/pxYgi
         bNCAANxvPzgGeIKfGS58NcOB6LtehwhaL2oLDnIv6g2esaDtDESyeHmRWiJvx2eFdwI2
         Nl+JJ7CHjW6GtrcmQbW/5b17FLb52j4PpuMrt1cRCCtiHzwdQjQw6ecdX2CfO6lGj92H
         wMQMJIFbeyKpx9ZNxvf5IH5Lx045cF8MjzMEz6lDwWQzu69QGx5F+pcyATJsIWeLDmVB
         d0vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6FTAkbmFzWBoEAPZUAn3cf5FkWlVH1APM6eI+DwkoP4wZncL4dxhsnitqSbonceZnRRSMgHKVCMoyBic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tAiFefoRZv/CN/a7tuNPUQcsQyZvK4IXwxHvpZHTk+UM/EWY
	/MyyY75SfgItphHwzQIW33tn/rKN4s02Q3qgVjKh5PEORQ4BF1W3e8SlfOsGbX3nKZJ8uW0dh+j
	oqq0t/GoV/LDpvAXJKccadnA0n48sEsHk4loVLPHCuILAQ3mwJQHe8tgbs5Sv/Kx9nbk=
X-Gm-Gg: ASbGncu6nJrC8BiDlqnreCgUwjGMWRMghmtlwn9LnKvkier5tuSsqiNa0jd06rMuX0k
	ZG4vMhGfUuli7qVugBcVd4s9EV6YePQKmxG6HEKi/1p4BSU7O5v8184scdVQxq2m+euQuGgQNeq
	PonflCdIK9lsq+gweb9hp/Yz3TYW400zY8i+3Hp+IgmnyMDjPFL6pynvEHzXp5dbrdlgoFU91Sy
	5+7onTJHe18UV4Hf5RzdeSGcO+GFRnizTZM7bIygyv0EgrJlBQYKvVE+WdZiGDcZyRNSJY6tt/S
	t3gb7ACkNU6U8nr9eHqp7sx+EK6+8miTD+EPyYiHMGmyOQZJhjpIeBjqs3R3u7/+ry32BXMJMCK
	95+X46mjBaARyEerM0IWV5gkk
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7cee31e2c20mr8933985a.7.1747940690944;
        Thu, 22 May 2025 12:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWeyT8YuS206JhKQP1qx3xAjKuJP2j0TQhVWUYqJTT2hjs7OvTMzPQ9H3knJ10UZblpdlMPA==
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7cee31e2c20mr8930485a.7.1747940690601;
        Thu, 22 May 2025 12:04:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:46 +0300
Subject: [PATCH v5 27/30] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-27-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9X7zCyPLMB9JgfInfLiu//0xvw9FvJ2BmQNEpS7pFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/AMM2dpp5tL4YM4Flz6AU5HNexuGwt28tU
 dtIqZZI6YaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1Y8IB/49tAdM/XYV37ASC3Z3O1NA6waaBgF47TaEVpZcrlm3Z1HhAkvOMKlsx46o0ipm6Kvh9ms
 L33cBcEyAuP0UT7NOGdDaXOLI5KoOdliuw/DFVwDqEeWcynPbmrc4KdL08GvzisqwMNM00i47PQ
 O8UtxIttLYX/SUdFzOLmTFBYsb1wIzIYYVT5na7RkcB/aIxYiH+AjIYx907zHuL40NRKRma7X+X
 RlBGn52T+7fP11hDCaSrHg5n7O+/8jTHJA5pddr0Q1tdkcdSpX8dDXQjpQI3O3joZchVP8beuNs
 l1b+HQ1BB7dZrefz8PjvzLk2Lfc8tY+ZSgx2ZrVGz3YnbqTf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfXxNTVa0N09MqR
 BOTx5lZtq3Ep9H/n4xwQFilMGoPGELVK/yTZhwA4mJon+C8U4XS27/m8Pj5X5eTQnnJH83Nepob
 U1QHeOuw2umLWQKoou2tv/8eUuVtAKamtI1LprYRAIK1XTheBL8+1Bsb4yi2Ow0Vj5c0cm1iFhQ
 JK14SowAoKkn0xDpJZSmGrpz0+cXU0zLG5MGZznVD1NxjCcjPIeArFhf9EY/3TSH2rB/g2codT1
 guNgzObfCYp40r+1g6kMQFNIzsZuwGKCXNVE8yod44xCe13qj91QR7MH1RhS3F1SeKIsUydKrfK
 BLKLbfCwdGIJqQcAHTzomM24zz38hBxys1ecTyA6nQnd8bsqVFZUvCYtbXbZ7d2LGIFegbn8kLf
 DlgX4JmRdr0Bj4Y13EFC280Bm8Pf4JkGOBPwGyeqh8qwzsstST0l7Cl2L7jfhZKRe9AEg+kS
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f7554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AmuoDWadC_OlFxKFeLT7r23UmYxJC6T5
X-Proofpoint-GUID: AmuoDWadC_OlFxKFeLT7r23UmYxJC6T5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=804 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

