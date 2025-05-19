Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682A28A1E5
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670693; cv=none; b=TseXkkl7r8GL1mN0P8fw7dyg0MZ7p6WiwavH23typtR0Vt0yynRUzCT3W2+CHExHo768UvW7kLLWmcXz2onIVuTSvGD2yFjwqhZE1u17+NiIgFmO5dDWv/U7OibdKkMSWUxB+nZ2MvRYmdW7Ps94qtdbYzb4eTHbhgXM0XUoX2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670693; c=relaxed/simple;
	bh=dHd62gkSwDMNOuwI45ocqjitriHdW6nW7hFBJ1JNjkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umFkGmPSWOeG3gEIljD2mWrXL5z1S/pz+TBiEj1esiufBfwb1COZ8jy+euPAX6+OYvUYHEkq1hmB6snpgEnJ0FJCH4xG2EKmA/Jucb/SoiguMpNwkWaeSdFjA0KABleJr8XwHxBkmEHKl1GgHpfYNryb6Biq2pXmPqN6k9gTbOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EV0VutXM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EV0VutXM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDhRI4030210
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDEwQaolpmNDN1vw7HWGQSOEW1C8PW6OjHwovFhU0Ys=; b=EV0VutXM2TIWDcn+
	3dYzTiGtcph3YMerf0qDurijAG0iW+1Y4tF9HBcZ3ExhKFb1+ELgoVN78JnHJgft
	emRLQd4bvRpDZnwmhLPX1Rlm7mOnozrohmaHaNqVtCo8/typrfZ8rnrbrzdcHyfM
	953QLHYMZ7UqWB1vOJSZzrwiuX7oGtooG2Oi5uCZ1i8UACS2mgtVuyFUXPNyU5zx
	RzQjfpOg1A7we13ZMAU1iyKQhlsJ0J9UWwMas2sDapnO+gd7TxALGeWyiWgh2n3e
	3vtSRs+qPjKefDioR+IY7+qFOEXFtPjTRtWU8C1RC9eh7DAA4ym994Fd51uDOj1+
	vRAXOw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymxsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:50 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-400b3984779so4861783b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670688; x=1748275488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDEwQaolpmNDN1vw7HWGQSOEW1C8PW6OjHwovFhU0Ys=;
        b=ecEmlt9oI+jiixvIqUf9PcX8zlaKryzRv7aR8Ly3YN6jqRL9Vj+BmnTek2LoYtuCT3
         9IUP6veCZAThJIiYHszMYP8iNLI00WoPFjc1QTHa/RnltncXQaz5KSfgcY98GCQLWhT/
         RgIFsI+K02ziw1Hvs14iMGy2CAkZXK+OuiBt2pSdF9TFNxQXl980cGstEru+AUzc+oFO
         hL14IvlNXmfNrWhrgefbesAXmyq5QsbIVlORi10xAJklhHZEy9txR7sazpURWRoH+0jC
         UONuIQS5EaYZcEjQk8RPqngBMP9PaXVUNRs1/LQyHACIjh+ZGdOQmFZfeLC/D62HAwe0
         PN5g==
X-Forwarded-Encrypted: i=1; AJvYcCW67rQGIzfphqNFYHV/8ntSI23XudU/vYgwBxQj+0PVV14daZCHW+IclwFvmuqQJCcdNGolQTbOFHdz9xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8j/VXZPqsZXDmyuuck7KIK7uOwhLpQzO8NX3hYd0UtK9o8X0N
	0kAJGutGUm8DsMvMXW/fBUrYsXeyeUxS03jLRQQ21ihifFvxHhU4uxKtIdIi4SePp2w2SbHSsLN
	MOPxXOlc8il34sr5DygK81z5rVYGtMrnlBkMCKzE/TBIvByFJYAwzJVZGN7yIRSN4iZAbWeGbnC
	k=
X-Gm-Gg: ASbGncv4XGeA9Yp5i7xDO0G1uf9CgNbao9qygOIiohl8mBCCUOSCb1aYm9QDcvVuvnt
	y8i9ifv97XXcXGlmgl74SsCUUys1W2Z6BqTT4UVlvmiljo54Npq+jzp2E2QUpgLLWO3f4vrciPD
	ZvKs+uY7CTS2DsmTTcCRGw3Hs+6uMXrlvzboB+5v6fyAfsZl5ZwyH+fzPQvP2L8Oy3QQBRkE0aS
	j3g4JBK2foRctD1tTJvUHE4gbdS2pxbHQPK8t2GPM87ag4i976f03rT/Yvv0kJ8lMEGzpuPF8ht
	EK4GE4iWCFfk0wTM6rTovgP/OT1zbHnnwfP8kQ6UJxcdUbON1OifxyrEWoApCltRznR9vfd0KQS
	7uJ8aZs42FVJBF2EzmDmXNNy2
X-Received: by 2002:a05:6808:22a3:b0:3f3:d802:14f1 with SMTP id 5614622812f47-404d869bc4cmr8882607b6e.12.1747670688109;
        Mon, 19 May 2025 09:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYRQiHjpvqGnKRqMhWPo90IIfdAfJ2SjaNPhsDfJ+gnqb36sTx820FeEdk90+H5dOSIZPUvw==
X-Received: by 2002:a05:6808:22a3:b0:3f3:d802:14f1 with SMTP id 5614622812f47-404d869bc4cmr8882567b6e.12.1747670687694;
        Mon, 19 May 2025 09:04:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:18 +0300
Subject: [PATCH v4 16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-16-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4342;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eRuA97C9Vfk0R8xZrVIizze1aEZWx+2Hni5ZcoPqVKY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7YUl2hhkCR1qcBgpVqnpTVFO1GmcAs+RaT
 58qlL37jtKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1Qo7B/9I0N7xkr0Rpw2in8ncTee38qGb3pCtc0bdCJRvI7n4o82QWjOJ58Rv8UNpsWgFDw9n8ee
 vXce23HoQTMCYw4vrviAVtP/8cF/PvzHFnCsrijTHEMHz8F1tEpWLgFwS6A5/erV62mICXJIG0+
 I/zCycpKQyHAOC4k8BU9rD12rNhuhv4hN7lhtfjaUTqmTy2xV+VZZk7bXXJ9RJGUvbwOXNwXjza
 IjDrieHhX/OQi6aFP7b7om4s4Xgb825WSG8x8YObcvq/Wk/EY3jGnybvoB+h0b2XgvX3uS8uO9f
 RGT3Imw/pgHne0AgbevvYwZWtwThCpahV8vO/dVJIk1dujK5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXxXNnx7beeK8N
 MA7jJoIupMLb/0u9m+O5dbY0lyJ8NQTYiGhpG1/LkdgLCof0y50WOC62n7P2NNLvn8fOj7TyntA
 Czu9/NyYxPH9aZbQUhB4O8XEI6oax9n5LK3Ooj+5/mrEbuS+FNVgDqqudeo8nrVskK8WItbQ+tI
 IigHy6uug2ROvmT9jfx4Sv+b1ZpcfW83zyNfoowREbWKYimlAxlfyjZtrHMytMhCB4bszMyD8Bk
 eBiOdUV8AyBW4AMSpp3aRYN55nKYSEOCBdwIDoSeIKB2cwjFsw0ApUFBX+LVvuFE+IRSlc8Slk4
 ueluapVpJy0mEKNplXVeGjRDxJeJz1v+aP+PbueXOTchqDu74qkpYDh1vxp7pTRKj25Zlgrr3z5
 tr2mSdwn+SohosHdwRedEgsp94JNci+J3u+nK5Tz9CgfoevUNBmYSj98q68s69UZQhdayqg5
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b56a2 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=K8QCOMLVtaD6p7eYglIA:9
 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: spc4SznAZX485jY7nkellpvzkRj0BVhW
X-Proofpoint-ORIG-GUID: spc4SznAZX485jY7nkellpvzkRj0BVhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c         | 2 +-
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8fe07a5683f734a058e7e7250f0811e3b7b7cf07..0e8e71775f2c1c38af018353c85ffeb6ccddb42f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -181,28 +181,24 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
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
index df1eeb9082f74ab734c235f0cd0baf8c0eda14b5..75b679cd2bd27dd25971489a2d3a6f516b248235 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,14 +95,11 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_MSM8996_MASK \
-	(BIT(DPU_PINGPONG_DSC))
-
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bc71ec9a5bc8b6e15d7af13c42ba5d4197729822..ac63f753b43615f7c34d2da51fce919fd77142bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -118,14 +118,12 @@ enum {
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
  * @DPU_PINGPONG_DITHER     Dither blocks
- * @DPU_PINGPONG_DSC        PP block supports DSC
  * @DPU_PINGPONG_MAX
  */
 enum {
 	DPU_PINGPONG_SPLIT = 0x1,
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

