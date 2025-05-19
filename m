Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51A289E07
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670688; cv=none; b=hLkptA0DrA43gf4voISUcCeOBv0Qfxiis67RZ5iqfvwS7JjprcQ1UFCr1ir6iKkg1kfcKEr1f19yeadCf4zRSG3SDxL3cqPsk20mOxEPR20YjSWfE4yFP+HlA5yXHYLB3zp3BHgBbdgyBvUC5QqmiT1kQaep3BI/EgAiKHJ3MWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670688; c=relaxed/simple;
	bh=LuuDGI9zKbFWm2nzJ6vDJ2HTvMxLeJP/RtVcyJId5rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbTyQ8j2YzTOq0sIBDUcUMZ53PKGO9/kGJcfBzC74OLNAlmC5xVa5Uiw0NlqSE24wfs28xGfTWTqKten/FS+bYF6pkDWmzM1icZK1Z8xOgK9beh2uSJT/pEOSVOLWWYEN+ggYr63gs51c491/LtsIV/GZOvufctpMLCoTmOpwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZojKrje; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZojKrje"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9SPST022937
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gi+iisDpzgKdEiK0rcVeayKCWIAFmEEhg75ZFqke7ck=; b=OZojKrjeCW6QdIBP
	t5TUT3fb0ATF+YrvpL6nZYqzhKc4daO/HWvLMTHgeCVxz3xDEXqQQYwha/JTdrRV
	Y+uJcWMLngNk3ExavYhlRh5mQl4e9MIzYLHC4ETlHMBkh401fHbc8mT+HzD0nNPH
	p19UovV87jcHWl3ASKCmVae71NGF2I0QAJaQJowueUnJP8U4aOuT7xzSWVmOt0OL
	XB89CmqjOSjDs7tM3YQB/F9/RfK3YSFfmR8nPC8hhvqOM3M1Ld8GSQtnUR5XV2Fl
	gcaUvotS+WPwTZ+dIiATfmTFwRTD2yiIhcvqJANGTwujynW9355AIQjmu8f7JYGE
	xCQ0nA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cvtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1fa2cad5c9so2739313a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670684; x=1748275484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi+iisDpzgKdEiK0rcVeayKCWIAFmEEhg75ZFqke7ck=;
        b=AyA0rnSWB8ajFHjKofkKr65eMnbYSQC9kPVqOxeWar8SqhFI+TWTcl/hZlMBeXk82q
         fAFMNkPzg945X5rjghIbDXkD2fPe2GttJ0y/SpsNEdnbQyEvb77EowZmkSTgU9IYTsF8
         Bu/Kn4BRehqU9vFGlwtjlTIeDxIMmwPsbTkkTNJfVeDBhE6DZ2MA7FRX4uGpdXZsSXox
         m61+/W2qI+6co9etXi3NugrHmp5yKlOZwxkfWRwIqiJTWM/iRdPHljpnjWRUngFLO4bF
         mDNqwlYpo9wrSvpl/6eLbCPAkoOCplQ9vjIHuSw/jFOjpqgUhBGULOLPZP5v3MWidaKg
         krnw==
X-Forwarded-Encrypted: i=1; AJvYcCWf/IV1ltkFlk+QI80XsT5Cp7jdQGXo2sASu6WFXA4xS/JUL4klRoEChHLxqrMnDC/mjUSYI1Et6nwbjgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW9KsVZnoCfB4eqNVTGyMU8ERS0sAEKmz4dkqS5D989VB+sw8o
	2k/Q1efRk4JBUzyBJKg51ILSHY3EMjxVAcnsRTid61hTU0fOQ00WQ9P5q8hyzrevH3KGttS1fVX
	Z/rrOipcq10gkwsCTtwmx0YN/zkGTeuI9fSQtln+A9sDBvCALcReadf9RV2Bl9R0pPpUm/HnVfk
	s=
X-Gm-Gg: ASbGnctos/LiKmyp1sPr8mm66OpV/RcLe5kCTCY+8doY0o+HKJVdVpP4C2x/eAc15R4
	ev8KEVCtEJN1kz29Zbgf8e/LrKBkbCKu4lUtguuFcGaI1hB0j0ZLR54N97kd0hXpIM+LRBy3Qtr
	4RFBU+xqSPIhpgFiRz9mCIjOCg1/N26DTxWEO/79HsyA5CNPXVajk/ga1tKFAnQPGIsmfLv3D22
	AqWb3NoXChwI3zjoM6YV/zKv1/kpg3r3psKTWT3vbt9wN5C1cglEsafv8hYAwz9fBjzS/1eJ5+x
	+4Vglqw9hCBAk8EKgqx1jjGq25j1vRw/xDeyHFYHaVRuVMgTXJGAe60qI6BlDwbKrOGMDafY6z/
	JiAHtNRZXRJDCErnHS+uZxC2x
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2170ccaf4e4mr17466874637.19.1747670684377;
        Mon, 19 May 2025 09:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgNDYZ32Sjzzk2gJJMfu5Ie78pJwNA3N3D0CKRForF+eN6xgFTl7z1ALHWpDNFHkhlcSwM3A==
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2170ccaf4e4mr17466829637.19.1747670683896;
        Mon, 19 May 2025 09:04:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:16 +0300
Subject: [PATCH v4 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-14-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/oHhBsr0/SzduUBt+SEifBVkpkZbpX33SiSBjgxdPbQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z2WPX8vjhP754nU05dyRDPmccUXLRp5UrjKNM7k3QeR
 ZZLFKt2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiT3Q4GHo9H95gDl+vpvfQ
 rv37M2e53mcn9Vi/5c8/8VK31vpsiqVjlrFYc+Pk5c3b7/auajaeKj/T+PKcpI97v87nWnrTTm+
 qPIvzuWajtmbRdIZbSayLr/aKvVbW/h+mP0XBS/deWOsNH+E5dZd1/0/69ftl0Mc5aYIBwoscjE
 9V7+Q5F5Oa8EjFob+3vKtkw90DpdasM51V4qYqPg12k3qWNv3k/uRSVsZp3idrplw59sYyNDXnT
 t3OpZ2bY695au1OKo/n476aXcM5Zf8JzUl856zjnYIUHjj5VNcefhUSzf5szjvVKqfDv7ccbvga
 87L55t2gmTfc5VKjFZKKLvHWZTjptYpLSXvke9/3iIwGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b569e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JmOFBrInhh3f1uwnfxKi7S4Tulu6BlSu
X-Proofpoint-GUID: JmOFBrInhh3f1uwnfxKi7S4Tulu6BlSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/dhGVhQbQhnw
 54ea9B9eWasMUhS9cdW5J9lByy/7z6af16tz4bRdcGCLLrGDUpKEhIbp2w+R4O3dEjppdqYv24q
 RpyuIq+EgdFPytiYl48aGSypvaGimtou7OFE9/byE89ymxlWA5tgelx+O2H6OWnSZrZ9VXkW+Ya
 khBuBsYIBdSO/NgyYUUZx/mromSxk5x5GgFHZFa4k9QtIzVQ/Y9Vmdpvm/RuXxcS3DUz8+w7hy4
 NqHwCN27n6zQgTcjzvQr/B7y02Y+hVjQNTicP6+fHWJyLQJaVgH5WQhkMssrdumjarqx9AL2x1k
 vAAxh58NhwJXcwJxQ6HZN2vGdngeIlqek+rrlbKO8vlRl3MRfF97JXpP4/sOqluHszEAF3U669/
 cqY8cOlcC3aZe86O/tKeJnS4wCMgQvITcZ2D0zuyMDe3uuXvOkCwE2RBAr9c/vgDxF8B6BUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 +--
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1244dd59648d11123c507a1369f28f952d047fd5..4482f2fe6f04e58408b55994d885ea1c717c6a07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define INTF_SC7180_MASK \
-	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED))
+	(BIT(DPU_INTF_INPUT_CTRL))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf6b2392efb47fa8c3e3c5d17f1a72341872e18b..e1c6df3a3b72ffb5a816bd18266a35abe723fbd9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -143,12 +143,10 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8f9733aad2dec3a9b5464d55b00f350348842911..54c2e984ef0ce604e3eda49595d2816ea41bd7fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -308,9 +308,8 @@ static void dpu_hw_intf_get_status(
 		struct dpu_hw_intf_status *s)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
-	unsigned long cap = intf->cap->features;
 
-	if (cap & BIT(DPU_INTF_STATUS_SUPPORTED))
+	if (intf->mdss_ver->core_major_ver >= 5)
 		s->is_en = DPU_REG_READ(c, INTF_STATUS) & BIT(0);
 	else
 		s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);

-- 
2.39.5

