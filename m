Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA62BE7CF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442695; cv=none; b=syWd/TdNL8dOW2WGsDD42lD0xs91SlD4cZbolfmJcf3AFO61gg03sOiVbI/TvNwKPxYArL+dso8W3wT0UPuYWYwBF0NbiQq7Y5LJwNuL0UjC1HW//dMCS2wU2TDIq1vcVHYAqPFWVFK0qfvgwF/5+CYu5wcWn89dyi/6cxAQkyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442695; c=relaxed/simple;
	bh=mKgnrvf+4HP1McWw3RVstR7DVkzFg1KgGxErjVrXdfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7xwhtccdjFo2TMCR3r2Kd/GdV8BhVn1pjHRZvddb2o/fLFH/b3cmxFK4nq6IrmSMZOvbGqi0/y58AFJONbPK4IHHumjOfFdhNhPKmA9TcQ+NpZCJOWVl9zYDWKPHMkL8+178kUUIDDZHegtRPs+TULalF23BPhwHrNYU/WZjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO5dfwEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO5dfwEU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NKnGJB012365
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jgEvwNkXOjaXMod39QuXEIdmoOiJSEft3Q5NtapnQtM=; b=SO5dfwEU9/1eetet
	j1wJ9kpjfl0ZlQHEiZ5uAP/stc8EUwhhhOG4yf6KGkNZZOzSWhS4byHl4s8w0NTo
	6BNcCrrYouv+Yv17AzjhIM8F2kLHnH4pF/OPfG8zbtuklof99wEvD6ELCn34Wo7C
	MFnMimQSvIGxS1BMpkL6pIiPdIGaJOnXuwOqnP2rUKYY12hkdLkSm+8ZNZPbjhNF
	8m9KWwNO4rlNMDQLJPvNhvaG7TlmXaMPujPO9wTzEUeGYO26zFZOUKNCun8wFsGZ
	OQ/YIhr69kAmw2Dg2rkBAW5/qOvXtvl0fGeHmCJz44TJkTt96c3zvDAXBDayYsji
	yplIng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1kdr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so44501685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442691; x=1746047491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgEvwNkXOjaXMod39QuXEIdmoOiJSEft3Q5NtapnQtM=;
        b=tS4LtB7UkdYfTkvyNYecS78X75dpo/Vi+Nwmz2wYfSz90MmtydAYlOi5E/jVo6fnqM
         ixMRTwX0it5DIYcT4Ci3FaxlW9Q16sYMcESyJgPDKsRae8JyhT2ryC58I8Pebb5LXga/
         0vDGA/cROAzMzO94Y7trmoRjHJx3TRnBquhxoQe5hohWAesZ5gBwpYfKQx5XkzI2j9hd
         eY+KkoMbkRjFCeOxwoHJHXcvYzKRQu2qnQLhOI3fikz/edBQo8/o4/3HJxOZDg0pJemP
         fk3FYHlCzgjDqo6lN4FibXbOCb9fU3Eu4og51r9HOUVEC4/cJOkklwDd2nsqSnKdib6H
         mrxg==
X-Forwarded-Encrypted: i=1; AJvYcCVtNYtYQtnv05B7n1h/M+xz4Ea7Ra447emwtcWu5zrVWv6d3gXsq3kTtvCLiMrqf19Ybo3Xfue2n9BkJSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45XJDvdOZ7dQ6ZhmQLMyoC/L8bACyumSrsKradsf+jKgccimS
	5J6sUk5lrsic4WmHVS7IfvceWFI5KNThP83+oog04sMmOtWqFdw4vjP2gHFYzBOIfDaSALwb4ic
	O/c+p7nFSPANL40HQZqajoMyymSyTFyKPgCm3NxNlEcIOqQqF8O4gtujb9LbscVI=
X-Gm-Gg: ASbGncvV2M523vsBc30lDdeynnuXJH1Shm468T8qyGZrYtc1W6tU0nSet+nyZBKlOyv
	T3tAAKZLhhcOxTAARgIEZujdrAzDTf14oGXUxrdxTke8TwbYvUwU7tslkR3xnkrF03fniEahqAM
	H3tzzTyTy883pj7UyduuoAtubQycrO9NJod9wASWHxmmhBqO0NmS+tMz/8Y8XCn/ize989zpwJd
	XBaHFsDnJjB/vI0XyWrS7YEmAQoMAHPHv9cERjN7pkoC9ENL472zaMTvhmwxW/tYJgKipxDJpQF
	GDWGYEZly9yVtN004wARQahpQcAndg47J1klOeFJHHDKDBObj9ulGrnqUa7B8rTzarKdNlJPxok
	q28qr0H7sk9fijzWHVSZWxtr1
X-Received: by 2002:a05:620a:4542:b0:7c5:6ef2:275d with SMTP id af79cd13be357-7c956f3ffa4mr53962485a.52.1745442691007;
        Wed, 23 Apr 2025 14:11:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW2ePxZMKGcrIPEGEnfspG8OTRvWwwqz0nE2fFB6SPB+gZgxxA2lywd2kNj8KtEOCZ718yLw==
X-Received: by 2002:a05:620a:4542:b0:7c5:6ef2:275d with SMTP id af79cd13be357-7c956f3ffa4mr53958185a.52.1745442690462;
        Wed, 23 Apr 2025 14:11:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:27 +0300
Subject: [PATCH v2 31/33] drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-31-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9210;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=19/sQF6QrfTaWj5BCZQZWlAaWBLn1zVu4zT1/dnr23I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcvSVX3Fl1q19ysQzBAKNvkB0UpGJyQwd+RE
 CUDAJSvQBuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLwAKCRCLPIo+Aiko
 1XaiCACix2jsUApvtFxwkZJdFtUTSLX4Qf5+v2nGdUS2K/p0L9doTAknG+O9aZEqAdBG34RjmUA
 QjpGXoPpleSNIIire2g0SnjXewH9sQ86xaEFWHr66xpNoouEf8qLGzPIgogCsIKvDalumLjVDuS
 AvbnT2gc0K/dMlCCc4/PGaMXPBjAD7BeNADtTk7RmpEMbhD6aVlHMOVzHdDGEWfvf0r7t0Y0yhu
 Ezz8cYQEXBteJM8r1MJAOiF+YQoduYG8SWE7Ej1Z86RHqokpnlB2ecdHZxM5IGAEsVOJBHfL/k7
 kLfjRnfPTYiKkL24tygwj3RiHkbgovPjfQ5OeEm5J/uG+1jg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fxgDSk6MstnRVT7dkqfwucz05qudo9Za
X-Proofpoint-ORIG-GUID: fxgDSk6MstnRVT7dkqfwucz05qudo9Za
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX/dCA1+iFbWWJ aKuOH8YlrOGp2KtQU26GgqWDZ4dh2ITnVAe6JO43QQravNgBPPSPWmw0/gIjLuMX7Edlu2gwIjM 89PC03qOUrV78ll4MEwf1rfyEFM6PETMJ+Ktmedl4gq1dfw2TA4G/xts1voY4T8ozAwdXPJa/7g
 wAonRH5xQrgbI/W1cXDhRI6YLZt66EVFPtMRx9NubJVHXMNHmRov6BAbaoL8k9HHk9EOca2iG5c PaX7e+Jay8rap4up3b0g8Z2bM+xh/BwOUG159vCtwCCTLCzQ8Iare/1XerhOJheFftY/3IWJhJy FZIixu03E5P1phNE4/nsvl6hC7uz3h8SUd8ym+fYM/tzq+dywHai1MyO64nmUThJt1nrJ79hvGj
 kmytzqE3KkKbrpt891d1WObWuETKMjy9nqrPmDaNRu78I3p5xkkWFDyyLPyW+SebclzeiSLD
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68095785 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bDEOCHsu97kwrKHOfzcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue cleanup of the feature flags and replace the last remaining LM
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c           |  2 +-
 10 files changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 2007aedc0526854d3d8c4eface5b507dc5c62c58..b8cac2dbec3c963b1a15337c64810a23ac6afc9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -289,22 +289,22 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_0_1", .id = DSC_1,
 		.base = 0x80000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x6,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 2c59f0b77a75880df18900fa406f1ea7006927a1..26266d36520e7499feb26da0f3351405bbd2f87a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -274,12 +274,12 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index cbc7e9081288fb8125438ad1cc0016042bf70661..3881dc839db71dd798863067a8469cdf3045719c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
 	{
 		.name = "dce_0_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0238eb019d98ad5599cc301e47bda43de762b24d..f9c572be7fea9660d03284d815067a17ac4abe4a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -273,12 +273,12 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3b2d99de20621a5c47a31212d7fb236e0b784d0a..08d5273554500a00a55adbe144b50fb4f8296ce7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -287,12 +287,12 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 14a1781c19bd8060d338ea52684f756258526996..d4eaf89821722bfccefe930e834cbd83d52123e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -286,12 +286,12 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	}, {
 		.name = "dce_2_0", .id = DSC_4,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f6893c7ea13bc0ac84b46d50a132e18e1c575a3d..83dce1aef9d991afb7f30f75724a822854be3e78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -283,12 +283,12 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index f2a09026abf324a3c66c17264c8a5d8f2d75a580..2938ff15299ecc5002aa1bffd02292212fe51f03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -283,12 +283,12 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
 	}, {
 		.name = "dce_1_0", .id = DSC_2,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_0,
 	}, {
 		.name = "dce_1_1", .id = DSC_3,
 		.base = 0x81000, .len = 0x4,
-		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.have_native_42x = 1,
 		.sblk = &dsc_sblk_1,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 51b330f37c901b99c7db640a0b77149c7ac8cdd7..0f78958ac4476de414d07b727c08feec1c2e9f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -128,16 +128,6 @@ enum {
 	DPU_VBIF_MAX
 };
 
-/**
- * DSC sub-blocks/features
- * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
- * @DPU_DSC_MAX
- */
-enum {
-	DPU_DSC_NATIVE_42x_EN = 0x1,
-	DPU_DSC_MAX
-};
-
 /**
  * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
  * @name:              string name for debug purposes
@@ -474,10 +464,12 @@ struct dpu_merge_3d_cfg  {
  * @len:               length of hardware block
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              sub-blocks information
+ * @have_native_42x:	Supports NATIVE_422 and NATIVE_420 encoding
  */
 struct dpu_dsc_cfg {
 	DPU_HW_BLK_INFO;
 	const struct dpu_dsc_sub_blks *sblk;
+	unsigned long have_native_42x : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index b9c433567262a954b7f02233f6670ee6a8476846..42b4a5dbc2442ae0f2adab80a5a3df96b35e62b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -62,7 +62,7 @@ static int _dsc_calc_output_buf_max_addr(struct dpu_hw_dsc *hw_dsc, int num_soft
 {
 	int max_addr = 2400 / num_softslice;
 
-	if (hw_dsc->caps->features & BIT(DPU_DSC_NATIVE_42x_EN))
+	if (hw_dsc->caps->have_native_42x)
 		max_addr /= 2;
 
 	return max_addr - 1;

-- 
2.39.5

