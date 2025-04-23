Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8443B2BEC23
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442700; cv=none; b=HQDQqaaaSPdHNEA7CHvvxnHJSFg7+kAdis1kkkhtgDGb9WxXba3D/9S3aJifi4L1HVfsUH2wa1ITkcahjs3x6vwl94SrNn1oJA9vwWpUlOTIVHNRolXGzaGpLBUpMUHuQkFyx2CYYlhSGjURU3dfD+e8Q6rc91joefh2x+wtM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442700; c=relaxed/simple;
	bh=Y+7d1NcvAUws3dkaV/1kbONey6Ot8Ez+t1inZsh+D/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+7xt89qv1bHa/EkvDWuL5gJzVbnfvO2stqWspJh/N927mzA2fSS/SnztWcZrZeQ+Vq4OAFi6LBXRODSvi2FjDO9ke2llIsSbMtxY9m5TVDJq8WGFz7JAN51Fk7DHHj+aNS1Kg9aBKhVmnbQyJAk+ci2PB5iPfzrKQbJdvTF1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j6CjteXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j6CjteXT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAlWdB014042
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g4dfsuCDXSD++gna0mtYuKSS9J7+8mzqzNjw3V9ysyc=; b=j6CjteXTnagQXNfl
	MCM3e7EDW5i4eMtmKRIFMyZyOebpT2YQgsuvDLKIx7T1GrsAbhpUdsNz6KBmnTr0
	Ikt4EOg6ROECRXWHqRFGgvqxdDdalkmadetLYFQFMQqcHfynxS3gjjc9DQCbyImz
	nzOVNNmz2FKejqGQDkoI5t1eT7dHtOpgLgU1kSvBlEuCGhaP8IZdef/t75d3nnC0
	4QZTwb2GZtWCf/dmhJJsyLqqHmmu5sfsPpQrq8OwnY2btemCMZoYZhu4ye8Gq1fm
	MiltYNoG5ILYD1QnDvkQecgK7UnYhtsLJmwLX7WNRaCsbIelP+6usWnd8WFQPPqV
	32da2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bd2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so45169885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442695; x=1746047495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4dfsuCDXSD++gna0mtYuKSS9J7+8mzqzNjw3V9ysyc=;
        b=Gy0Xgjv3gIlPTgtUMLA1N6hA81iXvQoV+9zx57IHbdXazZvY1RQQeagLCiMzyCMyug
         1DTcD4Yoy3Fhu52XYjoSSf32p2rZvPHS9LChR/ancIz+OmvsTtKm+j57Ll1qCqFoF1vO
         TaP+M0CsgdeXGZ/CT8i2wc2HbCnZIZi1myuYKXhQTfigpQ0aILBNE48lIeXSuy30b1Zg
         bk99c1B5s8JwgDCT93GZIHcUEOwV47blZ4oF8RPj0XMYWbeR247q3jOkGXGsg+VgDPd7
         KL0t3QQuBdiYRKUkf+aC83A2DsBZIzd9w+icUhMlQIz8HU+rH5ldc2EjIkzp7TOhaekT
         k2ig==
X-Forwarded-Encrypted: i=1; AJvYcCWH3oZvpTXM+F/bySsXigLOCX9cBrD5CPz11RRkj9x3c8RXjYPygGJYN7c57wMhO3+3HDYhvrpiuHPT2fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhovWdqlRLsST1ntkcA7IBnFF/5fZXVTc9tgmjCvxevFAflPq2
	2OupYd3emBhQpgZra4ZMv4Fyjlk9lW9q2OPpX9tap0/RabchDEHraGjYqwILMgAHhDv8RnO3qt7
	gdugyPaWdha0qEqiV/LjtHCSFCALLVe1PSsDr0B0IbL3cEj8NzzymoLPA2pniOh7eSPV+tgY=
X-Gm-Gg: ASbGncumQ5uIRPGL948hlzN1h1hxmi6fUZoSVIgM2voD9hsPxYYWpago4gNZP4ixtd4
	pe44A5wdhS0B15mgUVnfXMk7xtvcst6cjGtRnBPOgF54gzBByiMxASteIPO7TasXH0y2rofEjuL
	U8xVvx9CMsXe9jdqg14sjdJxevubwSrRVWmtWnpblI21nRqgf6qZRomCySE46My73ITZvO72esZ
	j7WLfpay0NPDCPGpvi4rO9WtiFditMm2NQJESvUNK0MlGAHgeNqg6vrgfACNWvgBiHDutLboJSg
	wUJW3z/mscXhWMZgd+QUUK6qCyyMpfmMRjrx/sqws4SWZZMaWYRCE18K9FVHTRDodAVM8ejShff
	MJUc72rA+VhdST4n1NIH1RJ2Q
X-Received: by 2002:a05:620a:2901:b0:7c7:a5cd:5bd3 with SMTP id af79cd13be357-7c956ef6056mr56115385a.28.1745442694754;
        Wed, 23 Apr 2025 14:11:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETLqCAQSe4Tu+zND9uh7u8XVXS01aO6uF2U7Fdc9Cj5LXhxMy1Rh4va/ErWklZRonXK2JY5A==
X-Received: by 2002:a05:620a:2901:b0:7c7:a5cd:5bd3 with SMTP id af79cd13be357-7c956ef6056mr56110685a.28.1745442694278;
        Wed, 23 Apr 2025 14:11:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:28 +0300
Subject: [PATCH v2 32/33] drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-32-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19053;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuzeyYdgiGBBde5Be5d/SQvYU4hkMOTM2wddPYh6vlw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcv6qnrMwzJElMDAJUc1IRqqxv2DutMIqx/N
 AGt3zf62QqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLwAKCRCLPIo+Aiko
 1Wl3B/989HYoZzzHEtmylLS2fnEZuRNrHVhB0ckcpwn0kDkMNtzSabCFC7hiAWbdGLuNWI81o2Z
 dmArPo7l2yOfKfEp8zZeag9jwb7b9MMpRHmM/gCqimo9/D1jJeFVgxvYJ8srRk0x6JkqYqQMqkQ
 6fKp8M7dcAd4LMtq0XHvhBoxjxNa/E+EgIa6DTT4q8C576cAzN4XF8cF6ktAQab81y91coR6f6U
 gD0lMF2yqZWLt/ZEaN0uPnIfa6GqM9uO2n/M99gv7jQ9vhQU0g1a6tANu75rosQwzXdq9rK5sop
 O9YQiEZBBrFyk2EgzkO/F2pxFwwfqxxH/JWeNrQ2oEy5qmO/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX3UzFcA5v6ASu Jt7XocGJ7HEXsMV7JFX81MNFoxAk/UK5ZI1mDJGZerfoe9CzDGFPfJyH5aWNZUztt0OzRm7Xg1y A9ngHJG1YGy2nFKpFkYKRYeHZw/us+xVCg/AMRU1GYQnqMmb6a5d+CwOc3o5QJXKlkTSDl5zHGi
 5fMKjBoy2aCEQTwz0QKnyxsR4wPFXs2CB19cYQ6ZXaHEfOCAGVR3owQu7viutfuQMkNW5P0HyK+ lRUxYcA25cJJ1H1R6uMWaEEXABE2HCoJQ8L58/n+XRRbuwKmR7n44heeqgpICUv5j4/D1aOZaup u5RXy02NRglnbiVdC2GZ2Md2xP2i/MN4N+CfmvESbBGuTsTO/G/5DJ61D3VK8w4IjuuzEyMWJUv
 iFQ7tmJIDQqY47y7hSNtr481D/tr/Rv7So/VEBcKL6E4ibgykKfwZqNuIlaeF/57YZ5mPJrL
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68095789 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=0OrUzzk_IYoRGeAKyEIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i_qcyAjJSGPMAetkYXh56AYMC3FpnseS
X-Proofpoint-GUID: i_qcyAjJSGPMAetkYXh56AYMC3FpnseS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue cleanup of the feature flags and replace the last remaining CTL
feature with a bitfield flag, simplifying corresponding data structures
and access.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 12 ++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  9 +++------
 17 files changed, 44 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index b8cac2dbec3c963b1a15337c64810a23ac6afc9e..f1adbf0db64716bba09bf88e59c516418c57214d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8650_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 1f119f79545eb1f4c6d27fe9fcb2a22d038cc571..9a4040921db78e13c04199d0c533be47c9d77f30 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -41,7 +41,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -50,7 +50,7 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index c8008db5772498d3bb85596518a3a21395fc9491..04301d2ba34f3275deee2b0e89105ff4616a7c2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -36,7 +36,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -45,7 +45,7 @@ static const struct dpu_ctl_cfg sdm660_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 70d7751831b738d40ab7e736ddb442c4d44e982e..35d2feea79e8c8673fafd1be83d554efdf21b32a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -35,7 +35,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
@@ -44,7 +44,7 @@ static const struct dpu_ctl_cfg sdm630_ctl[] = {
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x94,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 1218a3585cbc8664194692cdd2639af1c7888c39..2f3564c6672ae86203629194981e911f7ebf8bef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -39,12 +39,12 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0xe4,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 520f5cd122dd331ca1a1d9cc1ebd7654264f3e52..63ff6e9549b6289534cd41efc9891c5a1cb2672e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -36,17 +36,17 @@ static const struct dpu_mdp_cfg sm8150_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c1827c80e7efef9c57757e0b53535d9fbba30c05..47c2757e47a0a18350f13c57fab401dd5439bf08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -40,12 +40,12 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index d4c7c59e1ba845e087bcbc3394fc972a9058943d..9a7b0de857db2d13b7a4415e3452c1ad4140df36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -37,12 +37,12 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 50eea89a885ecf0d4ff4f478e6d356d86285bb3e..cbf8e1f7314ee15b6f78917e2a36006f6e9d9245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8250_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 26266d36520e7499feb26da0f3351405bbd2f87a..774fe5e1c513e0cb8cb3ff4dad95b03311350c61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8350_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index f9c572be7fea9660d03284d815067a17ac4abe4a..443500970f669ea6f38dd11d4d0c90fe92bdb455 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 08d5273554500a00a55adbe144b50fb4f8296ce7..82df68fd01dc64fcb95cbb0bd70991b428829479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -35,17 +35,17 @@ static const struct dpu_mdp_cfg sm8450_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index d4eaf89821722bfccefe930e834cbd83d52123e0..f3fe68587dee21f059b68c1cecfe3f68c2bf48a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -34,17 +34,17 @@ static const struct dpu_mdp_cfg sa8775p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 83dce1aef9d991afb7f30f75724a822854be3e78..97c4e3b74c5bcefd0d9535b9356bc2010841597b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -26,17 +26,17 @@ static const struct dpu_mdp_cfg sm8550_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 2938ff15299ecc5002aa1bffd02292212fe51f03..18773f318131265aadc6cca9b17a73ebf2f091b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -25,17 +25,17 @@ static const struct dpu_mdp_cfg x1e80100_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
+/* FIXME: get rid of .has_split_display in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = BIT(DPU_CTL_SPLIT_DISPLAY),
+		.has_split_display = 1,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 0f78958ac4476de414d07b727c08feec1c2e9f44..ffc54f77fe5c8883e926e0c63825c9424904cf2d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -73,16 +73,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * CTL sub-blocks
- * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_MAX
- */
-enum {
-	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_MAX
-};
-
 /**
   * WB sub-blocks and features
   * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
@@ -371,10 +361,12 @@ struct dpu_mdp_cfg {
  * @base:              register base offset to mdss
  * @features           bit mask identifying sub-blocks/features
  * @intr_start:        interrupt index for CTL_START
+ * @has_split_display:	CTL supports video mode split display
  */
 struct dpu_ctl_cfg {
 	DPU_HW_BLK_INFO;
 	unsigned int intr_start;
+	unsigned long has_split_display : 1;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f118c6caa1b9007eb03fa9b39efa87dfb46583ba..1698c5a4447c22c57c3ce9327b9c81559a6fd921 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -451,8 +451,6 @@ static int _dpu_rm_reserve_ctls(
 
 	for (j = 0; j < ARRAY_SIZE(rm->ctl_blks); j++) {
 		const struct dpu_hw_ctl *ctl;
-		unsigned long features;
-		bool has_split_display;
 
 		if (!rm->ctl_blks[j])
 			continue;
@@ -460,12 +458,11 @@ static int _dpu_rm_reserve_ctls(
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
-		features = ctl->caps->features;
-		has_split_display = BIT(DPU_CTL_SPLIT_DISPLAY) & features;
 
-		DPU_DEBUG("ctl %d caps 0x%lX\n", j + CTL_0, features);
+		DPU_DEBUG("ctl %d split_display %d\n", j + CTL_0,
+			  ctl->caps->has_split_display);
 
-		if (needs_split_display != has_split_display)
+		if (needs_split_display != ctl->caps->has_split_display)
 			continue;
 
 		ctl_idx[i] = j;

-- 
2.39.5

