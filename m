Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2ED2BDC25
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940642; cv=none; b=palVvrzyzB83/MhkhuEcSiY7u6LqY41zHy6N71w0dSgI+yhZg7LyMmJfsX9isnjJYco18mKrhSeQb3JAhAWtYbm9oR6CwBPYO7r3SCrFV0kxjVeEhSHpdZef9sADmgj0GALdqQjcGtLUyLQWBAPLQQBQTlk1bQhymozCY76oaK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940642; c=relaxed/simple;
	bh=at1HIcx7xG+5Y+V3sblTVBn+/viLWBMIj/QqChtxbLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WYioMY7vURI7Bj0R7hgqPgE+rEe7UIrRBkRrET/MwVwzqvRiUCz28aucHXsZSfTNUbp9FCSAK8xYN4c66pjJewLAdyzpE2aB86mG59elj4p5Vufk8+vq7P3YFeiY6PFnA+wqOpmOlulqFQjtoJSfvmyYKL1mofZK1cZw92+4SJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWOvhPtA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWOvhPtA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGvTnc011326
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAP6WeQKgosrVjQ6OCVmuByHou+VXdgsSFyWdC8YkMM=; b=IWOvhPtAjanZjQ5I
	qEhCD7YBxf3QJhphuMOjXQ9MqC9xPlzxOYhBp6Et/4ntsdxhsfjK+YxEil4exF5Z
	Anj1SlYNdRMyhxwGnIuLYQYqnzu8xohArsRBmu2dnW+7TDQFBT8hzd16fu4gN5MR
	Brpmk0q7x4nKtYokz/orgmzHm4xHe/4YiXLWu4jdV0p3PpJl/+BcuZJqXeGGZnko
	rneNOra1YFbwK9xml3Qos53NHQAvTXCzmZb2pkyrKuv1GGh4bOvbK+ye0fU6d1nQ
	mOZzoHpc4R/VuI4OJJ5KSSrLOV2kmsXspPqaLY/G4Eub9Qkk8ranqYzIhGTFTo0j
	xtVXMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb7b4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so255861785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940636; x=1748545436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAP6WeQKgosrVjQ6OCVmuByHou+VXdgsSFyWdC8YkMM=;
        b=fWlVj/J66L4UIWgVt1HdZ+uDh4RgBfJGbPc0GgTWi1b92590dWCb6oEf9dkjnNoF+1
         Mftgk672qnj6TS20i4Msr5ZincAzMGyLoQcmVF79xZgreTVQvFZXVtH/wfViCm51C6v2
         lXvXmjO6z3Ui5HYMjnSbbXH+14U65kN7G0bkQaVthSkbp1+zwPdeAnUXTDyLY3Y3CQyV
         HLgTwzSi+taDt0vaTc2ysSLdvg6Xue2CuxZKIuY9jkIh0Lwcje6r+RUMPmrTORibc/VK
         M3t6ANpM7bLmFcaTSYXrDOaoT4Dr+jdNUGWqCVuSiHi7YfyJ+asAZesN+qXX1GfkgTTd
         FuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7VAIc2OlziURt/cZiU7jx0J6yF8ujIgnYHqBrPYs1J37YbKUwuxiYiy8E/B4CdsfsJCbmpglX03bYluk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTn+qNE/ucfxyqIXf3vFE3EwxEHMf629r3R1NvnwEPfZOC594/
	JR9ZkbzGkTv8cV9EJk4zkrERc43r7AiaTVZHjcctyyP2eU3q5PR05OyLKG+KpknMUAzy/j1EdR+
	Uh+uy382/SAIAVnECK1tDzCMCbEQ+4uXWa/wlNF/TLEe3WQgCUpJEizbyLPG2NqGnlTE=
X-Gm-Gg: ASbGncu5HUOgfnnzc1pGzntFXiM+6iB9zqmZ/4I0EjB69Ts/UVoK4ZZMD+0Ux4i4A99
	qDFUB9fe2ddfrutHEraEwdvS9WMRoqN4mXDZoSXDmTDfeMldznPiwa5YxsIYzHEdEtadta0fLvj
	ErqFeCeemRh997lETPa/NfnTkUUriUd2ZTDRDODNdzzOjCVD0l0pbeI+7kWAg3Op/a+7HVRJ2Ur
	W3Kgs+uoppzIfsrm1KkRTQin4GRitaUROFqxvERni+uCq/e6GSV+tD9FMjI+vyrIOT/KdxR2XGI
	tSVPbDid/Kd1bS1V0H6Bry5Ge/2IiV7ss3WnuhkZMV/yQxPo5cHCgP/vIDp+di779dp9qad1te3
	o158iFGRh8dAUHMc/14pyxhC7
X-Received: by 2002:a05:620a:31a5:b0:7c5:9993:ba7e with SMTP id af79cd13be357-7cd47fd8e86mr3505559485a.50.1747940635573;
        Thu, 22 May 2025 12:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIu9SmIDr556eJ+RcKcx70FrdyG6fKbS2tziw0f1+fNmd8WfIgEAKGKonrjL9nyY6dna+JvA==
X-Received: by 2002:a05:620a:31a5:b0:7c5:9993:ba7e with SMTP id af79cd13be357-7cd47fd8e86mr3505554585a.50.1747940635110;
        Thu, 22 May 2025 12:03:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:28 +0300
Subject: [PATCH v5 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-9-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19282;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=frwFHLWaApr4qEvZ986JnCHMnqO/l4KeolCxEQSYEGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8Xx04ta//KKoV5gcFr/8/9SnxeoJI+QN5g
 6FO8q19ScuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1dBGB/wIUhc3RegDi1dXUBqqlcdzuUgi+ggCiyhNbjZAD9UumsUPI8wl79nY3jziBCzoWL4poB+
 Mm6ArtGhCyDo18JP+LL4FJbX+wQL7E1R/5W0+gJWPHCgycaPSEseBvxDT0QNg/gqoWpzTy+zARW
 YEvEvx12M1GPYZYdfONAEmJH1MJyWHMaLgysYZlR2xjtH5W9jaHdPjgxHsMqDy4RYkBB/kNqUOn
 uBVxRzHHpROYj7wW8M3ANG5o4vcpmn1rI8ESHcme5p5oiJtxsDCqvggd+gC8Ea4Td+FSJVJO7kb
 m83e/K1DIrvWyLz9dbBH+O7pCPgzhGvSYHA5CUPZeRAgO+de
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: xJ2jBz1wc61ZgBJXqjD08OfxCDEKjzTm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX8y7F7xEksSHZ
 PPpuJER1odqDmCPs5OaIyMrlS22PBgOJyJwzednOfZWfSbq30JSzS1Vtx+oS0q8Lo64T3QVEiXC
 jMgKESexP3A9Vl9+wvi/RCGFdi1VEegPZ8PtcZRe/eDY+rzTuS+Ydbx7tHCAQdGf4Y0OS5UJxPj
 ptmRPSakTQ668ARMax6qRNFQ+HNp5CrgewRwLsw05agMJtHeCsrOxUWLQtaYPswBwEW5YW9zV/P
 DWarQlLuc84itKjDS0PAqz7Csu/RNhrQbD4vb+iBFDDsvJ9F4lR8qEE6HeDKzO2UPyJx4INjx+M
 hAA5Nv97TT4nm1j/J+pfKacXWNsJYUvmcFoylMLTBu+qqunJv6hgZ9ErYb6IpQwWuFcyYNxyI8/
 tgs+9OEczbehGj/Sk7m3FZaXTWbAQNFMidy/5KNugbqH89kRnlWUaFp9Eh6cqNDw6pnBI0c2
X-Proofpoint-GUID: xJ2jBz1wc61ZgBJXqjD08OfxCDEKjzTm
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f751e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QkM7UoOa6lEXaYzOGzoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
 17 files changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index b2ee5ee01870507d9f01020443c30dc573414c72..6c8ef23099a8212f33780d27a76991e9955a9bc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -41,32 +41,26 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 6db04c668a87a9f7baea01a9ea2a0f1bbb1212bf..37d18803af4b850c40ab855b1f13db96f3ee96ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -41,32 +41,26 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 6f61ce85c536e36b65b98ba4740711cb495a7c9a..41b43fb258508f1a5f285c88a3c1dc2f5f271cd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -38,32 +38,26 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index dc6d8fd05c2e3afbe5182b1ae8dd9fea8b6543e5..d44db988a6e2f443803a422846f817779d382b2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -35,32 +35,26 @@ static const struct dpu_ctl_cfg sm6150_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 192e90b570dbf8f5c3c24f572443e111f6cf3db2..6e571480c4a44b4f4663574c31270657b9a06a7a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -35,32 +35,26 @@ static const struct dpu_ctl_cfg sm6125_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index bdd92b5a61eabc6a1d5e0bfe740ed6d9f1e8e94f..6f9dc261e667fca3e94ec24e00d45f9af46e401e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x1800, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a00, .len = 0x1e0,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index ce2ec6af5f53e2177009ca8826ca510fa08c03c7..373c7d605a04a1fc72f45e993ec176e8f5e015fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -32,17 +32,14 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 986179b53f8b59200d10f5159cac630732dc7196..1cf9f99d0542cf7037d2a9672d51ca7c437c364e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -29,7 +29,6 @@ static const struct dpu_ctl_cfg sm6115_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index c2321a4a7d3894d85062d083b45402950122007b..a3db71676f468526ea129c4b8465fb2c47885162 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -35,22 +35,18 @@ static const struct dpu_ctl_cfg sm6350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x1200, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x1400, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x1600, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index c3dd2383bd5f32926b50d98c937da25ed59d7cb3..719cfaa98ab9e735d9255d9a5f1a4275739b4b1d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -29,7 +29,6 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index abeaa2b8e06fdf6ce5cec2c1a4fd025a342f5a2f..04cdda85e6828a83e99d146ee9d9f809f1acc007 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -30,7 +30,6 @@ static const struct dpu_ctl_cfg sm6375_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x1000, .len = 0x1dc,
-		.features = BIT(DPU_CTL_ACTIVE_CFG),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a0ba55ab3c894c200225fe48ec6214ae4135d059..0ec6d67c7c70b15f0af5685d783d49a3c7ea8cfd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -69,7 +69,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
 
 	/* setup which pp blk will connect to this intf */
-	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5 &&
+	    phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
 				phys_enc->hw_pp->idx);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d35d15b60260037c5c0c369cb061e7759243b6fd..e12bca8a26ec98565a96919b1c43f7fa2ea8a0df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -373,7 +373,7 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+	return !(phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5) &&
 		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 849fea580a4ca55fc4a742c6b6dee7dfcdd788e4..c8f3516ae4faa709e3eda4c0efb050ca18b675e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -218,7 +218,6 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
 static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
-	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_cdm *hw_cdm;
 
 	if (!phys_enc) {
@@ -227,10 +226,9 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 	}
 
 	hw_wb = phys_enc->hw_wb;
-	ctl = phys_enc->hw_ctl;
 	hw_cdm = phys_enc->hw_cdm;
 
-	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5 &&
 		(phys_enc->hw_ctl &&
 		 phys_enc->hw_ctl->ops.setup_intf_cfg)) {
 		struct dpu_hw_intf_cfg intf_cfg = {0};
@@ -534,7 +532,6 @@ static void dpu_encoder_phys_wb_enable(struct dpu_encoder_phys *phys_enc)
 static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
-	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
 
 	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
 
@@ -556,7 +553,7 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
 	 * WB support is added to those targets will need to add
 	 * the legacy teardown sequence as well.
 	 */
-	if (hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG))
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		dpu_encoder_helper_phys_cleanup(phys_enc);
 
 	phys_enc->enable_state = DPU_ENC_DISABLED;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a162c4f9ebd79d3ba16b50117ee7462afdbbf3d4..0863e5cfb3283ed32f61ddd4483220742df8633d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_ACTIVE_CFG) | \
-	 BIT(DPU_CTL_FETCH_ACTIVE) | \
+	(BIT(DPU_CTL_FETCH_ACTIVE) | \
 	 BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3d6c2db395b65b89845cb7281195ca5ca16c22e6..9981d090b689b46bbc378d1965b0efd1df0efa8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -139,7 +139,6 @@ enum {
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 58bdd4d33b37d83f30931f09fdf80bef41e1f0fe..2dfb7db371a3915f663cf134e4dd62f92224185b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -766,7 +766,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->caps = cfg;
 	c->mdss_ver = mdss_ver;
 
-	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+	if (mdss_ver->core_major_ver >= 5) {
 		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
 		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
 		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;

-- 
2.39.5

