Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1A23D2B7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487074; cv=none; b=bL9hcywJPTRqnJcuTiI15tgDqEi7uKm8wF6UJ+1HoeoZwLdy2u2tln+bHXIbdSdsUG6EThBdE0/EC54V54I3Vxe6sHwTpYFq4wtXDcKf59KAak+9UurMsiLn7yfqL49Z7+o+Ar2kJbn8kQxjkSkS3qxR2X/H71ERiAit+zk/7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487074; c=relaxed/simple;
	bh=Urh6j0LSqE54C08BmFdbEO+NZBZ70PEd4SfFu524gDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml2/QcQlwQRIhyFp4gTuy+xN8ldITer4KWhkLd2BSzfA9BzfxyyhjtbDwyTqBtUFssG4y1hBIUDAl6EY2SbW8gdaytJy0dABz0+GxogPgo8Gi/Z7zsXkT43s2ji8PnkIP8bZ3Erljjq6LENJGz35+JKNCxYqfPrY/ejtz88LNYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ob7I5X7/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ob7I5X7/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FB3d010239
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWOXTZcF0bL7VGfgRmCavQFcox9xVMfgnodJM+CDno8=; b=Ob7I5X7/bzbIuYIA
	4T7XevZH4tZXv//yKrLyKpJrU0bbUcPkaAy5hI0lmJiF9nDADSemhDqVBwssGSi0
	V7/MlZQvw4Z37oVYMqUGGBjziIwt9Ol7TRqznEg5tQuX6njEVXNJj+Ckac4TYtwN
	s9EPuEBK2Fn6yX2PwcikFdMaD5C3d8zb0bWC+Hix0kls3nhF7ayZh6KZ/CGG5DXz
	84F0xI0cEH06aiABvfFNMl10bQb20vSdmZWNNmdLI/29gdQMUbNIpyAHW++jKYn6
	Jkl2xfCeHfC/q+BilffGTbccWrOQ1qulWIQDvZHNtnLUoPeggfHI+SkYJo4BVhU5
	vi8R+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0d1hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so10508396d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487070; x=1746091870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWOXTZcF0bL7VGfgRmCavQFcox9xVMfgnodJM+CDno8=;
        b=FDdZ3ImXDZRvDebdA+FvQq5z6S8g8z4wfgRHboOrjKaIkBrCxKCU4gbrGPpN2vcY3j
         x0GbYEPidRcxWrA7QG+gS6vJ900keF9QjpByN7L0qZ33HwBxKmE7oAK3x0omWzZhtpS0
         6Wf40InFt7Y5fA65FLaUH/XxTh5bx8ZpmPmT/S00vxJyOFKpoaZvZZvoaqc5QA8qlAv4
         9e1ttLk1GBg4d3qoeNSnxU21+j1GGXG71yaEFfySKa0voc0XS2ekg0aY+Ly+5qrtOTNp
         bbBuOXiQiatAWF+fOOQ2s1b18wHfk+JEurVt8Yv1aQD8l9J/sRj7cecUNWq+BBNphxhL
         wpkw==
X-Forwarded-Encrypted: i=1; AJvYcCVR7gt9pIu4dsND07d/RnPXLWntxrGf9jAvdkE44Ei7BmkJMHqSiJr0sJthjx32pi1+nLyRxZtcQTs8ilM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHUPPX//IXjQR40BPQbxC7/jytF4Liv55hhajNxe0iZyUa6ya9
	728JEGVr0eTkS7D2iilJFSlceKTm0lneIgUmjn8QoezaOCtIjG6hyb3napSooNpPJpDI8xCPGgr
	xEP6ssAuDgwLMdYF0gjLJ21MA0sHs11Yqzp12uvtkIGSjY5sdb9XhVoWM1fp41f0=
X-Gm-Gg: ASbGncvg3VkYfYDBMxH0wq6QdNbeDWC5OCfrhUhHOnmCTjJWA5IN3uKNsT9WM9PNN17
	c8fr4ofe0AOUVVSVVaBeU5vtBaahnyPzw9g5QIYffYbY4nJffUHg85FUly/vsGP82wYFszv5gBB
	GExBu94vCSx8WScw+L5byrhZSfHe5vqY6/k6ha8jjRu/g4kirtEpnZxGSaB/N8rdGia2SEQ/Hug
	bd5rDNusu0AWKczXq4uDrlZX477IExEa1GZO99mFUbHbNUYaFt9JCksbx0LUGuD7ssmGoCEbZ5E
	u+fV7xITUbAgVCkM509DMtrBHwLkkC3wGjXU9JgGMeVpiby++XevkjsGbyqlhJTuuXWuMwTwW7C
	vtAJ6kuqhqh9xjL0MixgWWKzt
X-Received: by 2002:a05:6214:2305:b0:6f4:5dbd:276e with SMTP id 6a1803df08f44-6f4bfbb2307mr30139326d6.6.1745487069881;
        Thu, 24 Apr 2025 02:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuLWelc9lNTVRH0Jj2i516G3cgyKr62QEB1AThhgaOwIqKDKdIyx66racPUaRhbjAglcpNAg==
X-Received: by 2002:a05:6214:2305:b0:6f4:5dbd:276e with SMTP id 6a1803df08f44-6f4bfbb2307mr30139036d6.6.1745487069436;
        Thu, 24 Apr 2025 02:31:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:28 +0300
Subject: [PATCH v3 24/33] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-24-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8937;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HOkBs/6zBYjscOwL9t+s9f3+kkK5I+SwIYI8RcLTw34=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSvt8TvUn3IpdTbEShE0t9uQFQyIfft7O4/O
 a4LV+a9tzqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErwAKCRCLPIo+Aiko
 1ZtRB/4w7mYGDq9A6U27YaNQug+5Dap57zQs8PGkxZl2LITLCA2khXRtwcuACXNENRSphRswYgl
 esiA5Dc2E0PSL/OWoIMlBvGKAjXNN6CIxhzcYupvH+HJmspb6+XR3ysobM86uXuMv8PRU0xH07W
 9uwbvKHD2hBT/XkN4cI4Kqwi7n68anlHaVoSpKSrlE4LTWkB9NySzkmRL8RGQ5VM3iOi40W4U8x
 wY45al7JyVp9AGT9ZbcYDShGrqW+rcQFr9JB4y+gWwW6lFTgBxs50hdnj5nHM15ELpMnfV5dvYL
 sHRzJPfHYAv75MV71JJ55sipq2KtSQxeNQKZ/sY+C5tW3mlE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5Msl3IZK5dpt-bXHmCZFczUBRxTMOqpn
X-Proofpoint-ORIG-GUID: 5Msl3IZK5dpt-bXHmCZFczUBRxTMOqpn
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a04df cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=s0E_TIProlikEKm38KMA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX0YzF0i/giYie li2qkDIUh/fJzp3dWTLkySLjCRmvaiyU95Vo/q3cfBdtUG3CBVOSJe/maetQyr0K5plKfGbfAeX vADMOkJ3dOcwYzy+QTqZbc4pMRwFs8wGKBMqZOVvPliVU2kCJ+lVhuSnLZQlOim0jLQZ0y2CweQ
 XpLAWY6OezrkVS87ymllFxR0K3w4JgthrUp0vztE+5Ofp0wgDPrxS2h+1IVzoKNHXtHQO4VcTTD uvUUtxFSgrNYrNC37a1gI6Z/ZQunHqZqWmg6XO2sSGskN67Jsi6LxUkZCFHLWFJ+HqLm9+X8nCp AjTI7mV7/lfnSWKdRI3W1pmDoJ/tEeL4yJYEuI0oTVp+4C/g87XEv5wIEDtC/OiajJZuh3GiZz8
 d3FI3KvN3uauEzV+FMqrmWMMc8dv6tf7PRTmFNkyu7HBnzmliXsfqlM8zF6/rZ5gbbhY1qgM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 10 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 634b7dc452839f994c948601fe9a09581cb42a42..c5d964e915cdde1f8a83c2793b0020d7cecde672 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -262,19 +262,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 59e280edcd508c14ee297857a19e9974970566de..dc21c5c232a7ce7d8c21d3a3f30a5c1bc352ddd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -261,27 +261,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_4", .id = DSC_4,
 		.base = 0x81000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_5", .id = DSC_5,
 		.base = 0x81400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index af0d789c47917e9b712282a542c3d0886313c049..c1e620ae9596f400655b64b47e6b51a8d25e1428 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -195,11 +195,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 4da7445aa8019894b35b12ace18c0bd6209b9148..81af11630202943b910cd5896f07a32e53a23c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -261,19 +261,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 6563296190bb27b6cab1b03921af6cff34037cd2..8cdd601a5350e80a5324db42c23bdeb474a59b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f..c08d8bae3293d00ef7ff28942699ae2a52e2cea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ee8dd66a68f421161961495dd68d39dd4622ecf6..981d259c33631d31f0216f5cfae948b828d03592 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -176,14 +176,11 @@ enum {
 
 /**
  * DSC sub-blocks/features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
-	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_NATIVE_42x_EN,
+	DPU_DSC_NATIVE_42x_EN = 0x1,
 	DPU_DSC_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index c7db917afd27e3daf1e8aad2ad671246bf6c8fbf..3a149caa7ff4f20dc7a902033cf29a168268839e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -186,11 +186,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
  * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr)
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_dsc *c;
 
@@ -207,7 +209,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 	c->ops.dsc_disable = dpu_hw_dsc_disable;
 	c->ops.dsc_config = dpu_hw_dsc_config;
 	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+	if (mdss_ver->core_major_ver >= 5)
 		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,8 @@ struct dpu_hw_dsc {
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr);
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver);
 
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f917ffb85d2f1b1a0ee826f125d02980b7a79052..f118c6caa1b9007eb03fa9b39efa87dfb46583ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -169,7 +169,7 @@ int dpu_rm_init(struct drm_device *dev,
 		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dev, dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);

-- 
2.39.5

