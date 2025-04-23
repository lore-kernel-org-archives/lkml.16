Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CFC28A1D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442651; cv=none; b=Kzz29/BOP3lBOZVUZggHVLaOX+SWvZTFKcwOchni42RurBsPLWCQIHur7S8wZs+mKBpZjpL4RS+744CIczb1NeBvsbttw/sStiFZrJj6Z0bhpULE5zE8xon2fQSdDthEL07J3MTI+WOrJ+2x/29726FtnQ1DHqz3v43do8LNDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442651; c=relaxed/simple;
	bh=Qq5XvcA0YGKdKNPxzqWS5imRPhbtp8uyGYUSCRslsRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHx4bedHm+NwSZV/Zy+EeUY3lHHjDjzKXkQ6qo/4Q8oha/1IDeT4V71H7Qajj+POJUIr/PzRk5FlxBPboGtrxduKGQJP2eRCCjgMrly1lgmdg/1UwMsggxSUoWQ36axp6EEMqeWbybgou33XtNscgTxOG1xMTVqJy5CpFGvuMI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfYqH4wF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfYqH4wF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NANUJh023265
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zG9tzSmSs7vELgPwRjqJOaR0OarGdGoWbRrRUzki/oc=; b=cfYqH4wF7EXHHt7B
	FTYAKjigkrBOKB2A9++jxLJP+FAiKW59Cn1ibC20qctTjYdhZXSQTIC34boEaaVn
	0cXkSlrp3eYvQ6U6Oj4cFfLWL3gtFZIcLAzXK6uuLEK99T1V5P5CwjClQmyfBBVx
	nfIvhZLdk2MpUwZxA9hL73nqtFiNaiPfQ13DTZwtvPy90GHH2hfTbGoOwxr2c7mL
	1GtClxIhIby5Zu5X3TK2fgFxUXVZux806oVGAn0JQ8fzq1JiHkqXWBmxZLUwPdtT
	uVEcy+rMYwwdNpsmj9NPWStiBSV3qzg6QcZe5R0fAZGsxJEinahZYjjNBTu/5Tvq
	HQRJjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh13cgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ecfbdaaee3so5455906d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442641; x=1746047441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG9tzSmSs7vELgPwRjqJOaR0OarGdGoWbRrRUzki/oc=;
        b=d+hZ95YBIj0jMJKse+79ZmZmmTQbFqL9FgzMcphScBpA9ygFP61iC2Ef5x9sKXGmJD
         FfMDWTGiLGlXsRtwv6RqxwI1Ckn4P7EK4lTxzWXRxNFj96gZQwPXEKNXEB1t9niIgJ1M
         uy1OipBGNKdfnpaXk/xNfEOf/bXDkUkoG47N9hairMIgMqeN9yyNKq6SMapqIuNMqbcZ
         qM1ZOOD6lnQQRquqwXwml4OBuGIk4RvSMT2c8DAB+nos2La9F4Ciy6oJWTa3vb4OaZAa
         LZD/quCt8FBleFoKFTwN0TQeVd6r+ySRzbfwMbrEDgFEFefHOIIYZFL3BElDmUmmocfB
         A8rA==
X-Forwarded-Encrypted: i=1; AJvYcCWoI4zHtlnuTYamc8M5GUcRRFyWMCV+1dUntWVg6Z0XyXsaOn11R0UbHSG29aEx1/ve1HCA1WKNpxd3A4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpPaxtiTq4PYX8nLILCNsaYhjv4ewpmiCiAbcKROzZYhCsDODH
	BfzbXyeeZpJ91lmGhhMEgYOXNBAN0BVHwqn/U7K06qvDJMr0aNW1Xcr61OnElXqUT5TZkx3aU/H
	wOb/AY2az9P9V6r/8mgJg7LILbBiHE0A65+AJ+JuYoR2nGZSf1+UZb3zApXFcihI=
X-Gm-Gg: ASbGncsB/kDVHuQIFnEfFaWwvqd6iJtLvlGYE5Mhufy/fCQ3BsRL4HUyFHMVwBuFFPi
	zf2aEkvP0CDflPWmWyubFDUobEWy2Wds2N21cRH1PgbXkE6GxZJvAWJ4RTEcUAIrZx+hZAwlxyE
	gMguvm2SP/1hXkYlflqajpO2fiO0XxO7jPUMRvaghHzoPHT0ZlA63TElM6VHrRbr0++GXfYCz8F
	JkNclGIeIX2IOWpGdkSvPkOjJti7ZeDNpOdLo2T4JF1s6wMZeSeWD/8Ii5FCzS0/7nHgLfwNhQW
	zPCH5P32+qppMkkOrTeq8za7IdbKkXEDoZp65+Ml6sAif5e4IvKn9NzMlq8egrmoRx0FoOztyDr
	WpbHdLf/LM9/IBf+d6Ye2xKvi
X-Received: by 2002:a05:620a:4694:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c956f66bfbmr45973885a.42.1745442640830;
        Wed, 23 Apr 2025 14:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPy+46hZonIHO68S6GxeHeSfyUZSb+0MN0t5zKg7gumhop9jxpqvEslKjNNwpYiIz14V5+Q==
X-Received: by 2002:a05:620a:4694:b0:7c5:4b91:6a41 with SMTP id af79cd13be357-7c956f66bfbmr45970485a.42.1745442640448;
        Wed, 23 Apr 2025 14:10:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:09 +0300
Subject: [PATCH v2 13/33] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-13-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMvwZw2IoUGRGV6OIhReHxHfhgm4YrJasKj5L020giI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcsgHXSRWQsQpb7cjMEJ4q8XMjB7P0NtBHbO
 UmFK5Vs7QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLAAKCRCLPIo+Aiko
 1TjcB/wIbmuUwTeNRUvW4dGyL85rL8ac8oHysgu2g9gKUuC9oYDQaeqt2enNDmjDMIBWEo1SsZi
 EW61+QeJSzm8t3YnJJHb/fid0qGpMRxeYrAXqP0x9r0bVAiglh3Ye96Yi+VAxggdGX6mNdTqvTo
 kJ2Ra6ZC8wB02tPdfpdskdxRiB8Idwy6b6bE7UILMANizhDQkY1kiuY903XwbSHeArpVTgNNSfq
 E3S68/AKz0I770W25Q6hNohRbaOSfQ6t+Ke+WTxt8RpHpPcrfjTiYkRFLexY/AiFz9V0HJGsOYq
 iZatFbp2AcQTe9swXeDmyoBfg2Mopct6BJPfJvFlkJpqyNf2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: rjHHzWn5MM99SmWkw2X2YE11j3mxhs5n
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68095758 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rjHHzWn5MM99SmWkw2X2YE11j3mxhs5n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXw7TY/2D3eFW3 nbB6G8vted0ldAxphYPMnk1Bx2RtSmCuw4qGNt2sbzUK8jXcV7zi7+KcZEl6z2Bo/IW7HHJMfcM eyb2/kFS5VdkTcYoyOHFkLxanp9DxvAZ2tWnGmaFNL45U7jwadpHjS+1m/5KbTy14J45I3jG80I
 VpRGiUo/JSCT14CkMxQX8QpslfcPXwQYcz2FWSgPsnV7OypKuRI/tv3U+CELQrwVMG3qbJr7OaG zQMxJm0omSrlrqCQY2WlwhRRmr518GdYJNU0VfOcZkHyHprQ3YpDVtMJ4NmQ2RgjbRRLxx7Ib7I 6HDjKeSbM23h6enVVmToiIbgQCs7KgA7CYSqsUYguA6GYhpo7oc2tEo4fap2Weu5WAwIXjDu8uZ
 jVOqumUHGfLfo1LpwDqFN7QVYULOcZZoVJkW4mvE+30hcfmBab2bsMZNanrogiKAPTUbA7Cj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ca093419059600f0ad7e1e7a0a4e443b977860..20f4700ef9969003cfa4728049b9737cb9eb6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 27422a5a340b90ee02f36a87cf1bab9d97504c76..36100e21135fba09fcafdd5d36ac919cd17f63c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5

