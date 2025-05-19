Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F9928750D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670697; cv=none; b=hRaSKu12gAF2vK5OUBkEycVnbVUdt8fDZUNsQg3+XpcwR89APJsLqMk5anvSgsqYxwg6/ggFju+6qCLjh3g1TOoR2ENeJgO7CoF7qXAuTsqKsoQqb/f6/+n2AD+8pIFLbPjFdPg8nVze3pkoAUZVv7rvMhoImu5vuL8UWU6vGUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670697; c=relaxed/simple;
	bh=XQfaOP1IPiDSmPC7sFD7FV2u8a3Iyd86s4TLbpCQ9Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXfQ7f5a3s9Yo6FhL0p2EES8HkgVqWqT2Ad8NIiT0PJupSBf2YfC2oxIBg0hvvKZaETU+EyWOIkuIn9dS2X4mCGnXQuaRYb355MXViaMeMgWql+Q75f6pEZcNv65URlr0mTs4tvR97Uy15IcDg1orPKfK3D70jc6VM1imjt1QhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8EPzxrl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8EPzxrl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ivsP022840
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWHURV7xnWc78bmjPxSTui8bdTF/FHl0xK+ODN+y4y0=; b=N8EPzxrlR0cF4fAk
	HS+mKgvB5uQQ8XB2n/yQjxCsYwJKLyyPAVuLADHCTl1DDS4OsYZAdXEUzuuQuFCG
	gkrIDBnqd3renayggBTEL2yrLEwR3jqJI66oJHEE+nv7X8cXY1fmvcTCtRpYq/u/
	Kp4jSiHDn6OBdyvMhAtI4aVzRgepRGx5i3KP7Nvio2Fw2+iMVDMZhTbTNTY5Qa/T
	Xs11kzRbOO8wBqqj+bYYt0fv2h5833jQY6HcgQmMgtmlovIG/sC26zy8vC+F1Bo6
	nnUgVxpysqN0pSB82PwC1HftmZg3Q/eRUKVqcnyzsR/HXtAoVTJdY9cMijJhysp2
	FzF0Pg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d11s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:54 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-403290c1620so5167678b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670693; x=1748275493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWHURV7xnWc78bmjPxSTui8bdTF/FHl0xK+ODN+y4y0=;
        b=PXSI4w9yfYwpaNQLMSd8WOGHOEBR2WQtycp5Tb+M5w5XeiJWHKfaCSRPiw0bTFLOAL
         WuRgk+0BSYRzxUl2pE1qvkhbMC0EsJ79pBI9zVZgGHma263zGOo318mmM0qsHxXYbQXW
         adHByHSy3fhaqbfJiLM6i4OJbTfb/u2umW4wVjhq/sblEQzVwkZU+LQkz4BGlBm0w2r/
         MhEkQjjbficcbooidtIMZx86mo1tGMTr+OTn8GLJfROttUDMXtETeT1zbKeIHsDNSq5o
         TpvhtFLghyM5uG3fDYMDRHFkw+o8JfChqtuwqXso+by7fD3lzdZYZxGw6Q6felxJe4zq
         Vasw==
X-Forwarded-Encrypted: i=1; AJvYcCUwAZQ0pxorelgQWCOytV/xxTlBjPT9WNz+xwMqguDIiiZ7Tlw8JF5f4kpdu6H2inY4UPqoJRIxPjJJ0XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyucyrTsCUir6tbVbjuMkUqxMFpgNXECOe5EdWxC0JmoOn0v/WY
	LB+cgzLfaLNqZxVXWUxF8ZGXrS/egZ8S6ZoON2tazHHhlIZ6FJAKFiT9PDbrM/gCr4AklbCNlAH
	kEKtTCVlSiZgVaTDG51Kqqb7dcVWPba/kabsIvGWyZwfaP+hTnkvORKTiertWmpXQ/p4tTYXJ4S
	k=
X-Gm-Gg: ASbGncs2fclhyCG+LICo7orP3wiurBoTGN4x7etnbMEcPoCJR5dFSM2C6HhjzRbq0Td
	hxlG/wYHH0317s1qf58bZMc4vsBnSK6mCMfI/bDPB4DLbiwHWNyaBvOd3MS8hcIGoiM0NY6Wl7B
	fdRFbh6Jll8jLnP/74Z5Oe4p6tHY+fdCMAgN9PEwQV/qYv/XAd8O/1dQvBl47foRNg6oOWfy6zM
	tUK7rM4bxlaIV+Pw9VRTJ2ipP//F/flYQEdnNYyYlfUCaZNr4HtZneOTsBWkR3aYpIWiE1mHqqE
	d292oST3vBJQ76hw5G6iz5IrEMnQll9c87RHjJVHn53ymwqyoHvc+U7lwAlpnvZsNvybMc/NwRy
	OdgxZK1l6Zu7cZBG+dYwH7P9Y
X-Received: by 2002:a05:6808:810e:b0:403:31f8:4498 with SMTP id 5614622812f47-404d8649e5fmr8347082b6e.8.1747670692564;
        Mon, 19 May 2025 09:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjo2HgeFTYBjWlt7AwL3At6rptkXP2gYzVA7bxbGmxCW16Seayrb3hOUBptsd7Sl08DFcZNw==
X-Received: by 2002:a05:6808:810e:b0:403:31f8:4498 with SMTP id 5614622812f47-404d8649e5fmr8346986b6e.8.1747670691663;
        Mon, 19 May 2025 09:04:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:19 +0300
Subject: [PATCH v4 17/30] drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-17-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=40729;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XyM5qMjTjF8QAyo+G0XqWaa4X/hbTJNcUkjV0atwx8Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8s1o1vFvcG9SjEL2R9E7pONBEYtY42bKvg
 foakyYFoPSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1XueB/0SEzrdvu8zTNAibglr/UjpY842xEtYgnQtofy/Ao5ce1gUerZBAXoBmQUAbYnyvdjVyDQ
 ChVg87O6yfTuuwUymAn7Ugz+YYT3AU4XmTgPB3jlzY1N0h2CI3P0NQlpzNfFp1JQAxbZazaA7KH
 XLk+1ESk82SKfsnMAkMyK4Y7EUiNL0swdpz7kYTqZFxtSPhYn71/EwaWSohkzD+AxJFRIelW9rm
 Xi07u6fLTVkQZ38Cf5FSBjpgzGS05ryQJp7lVGsyPw/16f/kW3+zsp1Cxpnzv6K7lKheqexqQSH
 tKuikzpVZfBhS0K1/4+a6C+r+UW8UYwL6vi9887Vl8IBMH1X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX/TBKv5xAhrnr
 GfoF3f0xJlr9y64pj3yj5060ga4HrzfXSfY9AmhHYDRNJ8l4LX04nLFkETfi7ImzdwdXZyKfWzK
 czBW/SD2VH1po3sDZyjJ1d7JGthq5lswZ42e9ngvBgrtqhBgtp3YP8P2/uR1R1wt7lsxwny4lBl
 ekKQZPUbKhqlb9H30C1QQtrfWxHsMfXRgXpjTlhPvJdblEt6ceI/34Yj6xXO/95x6e1/cz5p4aR
 EITZH4nMM/xDIgHGqkrhKTzLPryMlvMCBwP3w4MzKBWsLX8/etsDTigo2OHTet/xUszaAD/Ccne
 TwnHGNwm5QKHpjU82y1ZzDkDgCN//zgowWmftvuGKmIJgyvbZ1EsnasQlk0ZyXb+0l8xVFkfvXD
 KxZD4Ge+wQj9x4NobvXaJbZXsJoa7mzD/W3IkAy/oz1KwR7QACh/0KskvGkcM5d5cY7UZztD
X-Proofpoint-GUID: Zd30-impZGIay8tukYQJ_mhGiawPqhC_
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b56a6 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jSculV4HJkadHmGop6oA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Zd30-impZGIay8tukYQJ_mhGiawPqhC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_PINGPONG_DITHER feature bit with the core_major_ver >= 3 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
 27 files changed, 1 insertion(+), 123 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 88582fc257dea342f05b93dae6afe986eb7f32d0..37c88b393c12d8a04395b6e5dffb67211d2db9cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -203,67 +203,57 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
 		.base = 0x7e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	}, {
 		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
 		.base = 0x7e400, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 91285519c540025abce5c51f2f28442ed9d479b0..f2ec30837f9ccbff1041f0465d0123382a00355a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -170,28 +170,24 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 50e0e3aec23c02acc1ce2d2a8a5658d6d49a62ac..26f39acd82e07c71cbeaaa72c14d9b7e14d2dcc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -141,28 +141,24 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 1c299491e61f0465a164be74b7a754435f347cb6..657f733c9ffff73f9eb5051ba55ed2e4e7bb496d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,14 +115,12 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 50e40405a5271ea6b12caa7a931ff7fe3f2478a8..15da5ded19267711e6df8605d576539475fe634c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -190,28 +190,24 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index bcab869aafbe1e23e0267bbad377fc10d8c6256d..e07c2cc4188bb12e2253068ca8666ce9364c69c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -207,42 +207,36 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 4b61bc7eb79f00a184c95b2319b737fcee6c4cbb..b350dba28caed77e542d6a41ceac191a93e165a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -207,42 +207,36 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 2e7ae68f7e922e9b71d79627806042f645cb4ad2..27c71a8a1f31921e5e1f4b6b15e0efc25fb63537 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -156,28 +156,24 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index a99c99ca37703cc3a7d4403d3f026f234b693319..e2306d314ef8f8b59078a8ca8c529f2e56385c98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -138,19 +138,16 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 72f1328deda87ccc0b97f3f03d5840a77426b2b7..62136811a530a6072accbd1ab3e02e7e24220ccb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -119,14 +119,12 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.merge_3d = 0,
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index aee4adb3b73d2efb074abc58dff7d213a73207d9..34f11fb084c02cf994c272196299bb9f7bced4f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -205,42 +205,36 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x71800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x72000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x72800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 05c0f81b263c4a9aab8adbfa487f6cd20ce94079..135b4f8171360493e58a1945105f8722d513d720 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -111,14 +111,12 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index b729a01e8ff8443721bf993726ae9ebe21e89440..1189a5ecb3b7b50430eb275280c2309ee9d90b63 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -76,7 +76,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 25f56c55f373ef5e57082448bc1a1d1d17968b06..13ff6bdcc517fd566e7701f7a7cefe5ff19c5421 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -119,14 +119,12 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 20b12a68fb9dfe0291486ca827c6ca25a1711014..d4c2d2da91aac0bce46c4d65079f01484a769ae3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -76,7 +76,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 6935ff7da3162dd7b86f3786b0f604d113e51649..9135853a0225fa60acb80d17f627153d25c612e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -78,7 +78,6 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SM8150_MASK,
 		.sblk = &sdm845_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b6b1a4383efa72fc0bc8a6feac1c3adb7773ba42..6503f11f65c11806c5b9558a0f9fd05b228340be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -205,42 +205,36 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index d1dd895acbf666ceab39f9c38ae11bda100b5953..202de6f9b0c65c6f2caa9e9d5232f5b92d8bdf01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -121,28 +121,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 481d36b80c4eddda53d2f9963392d9499f966792..785ca2b2e60f073b0a2db0c0c4ed3b2722de033c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -205,42 +205,36 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 32649f25fdcbc1fe45d7028352dfd4c0daa11d84..1401a84e0da5754fd2a3661d1421bb9b998271ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -206,55 +206,47 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 4679b7e47d50e21d5b6df69fd0479b804ac69979..fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -205,55 +205,47 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
 		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index def7c161d787d9cecd219b4db0482158d3e5bc12..cc4413432cfdc636e38a56011d39f18d7e94c23a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -202,55 +202,47 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 979a674517d8b270309a4ce92534face0f2ba855..32f88533154584dc98a515b1ddef27ab2005fecd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -202,55 +202,47 @@ static const struct dpu_pingpong_cfg sar2130p_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ffee0740ddb5c13dbbd2ca0d70855cba27f73ca6..e053324d76a2e5020e6a7477ddadc9f7d94fe57e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -202,55 +202,47 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x69000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x6a000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_0,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x6b000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
 		.base = 0x6c000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_1,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
 	}, {
 		.name = "pingpong_4", .id = PINGPONG_4,
 		.base = 0x6d000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
 	}, {
 		.name = "pingpong_5", .id = PINGPONG_5,
 		.base = 0x6e000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
 		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
 		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
-		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 75b679cd2bd27dd25971489a2d3a6f516b248235..4777a4a852da0d65e20cebc31fd05647e0b4c4b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,12 +95,6 @@
 #define MIXER_QCM2290_MASK \
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
-#define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER))
-
-#define PINGPONG_SM8150_MASK \
-	(BIT(DPU_PINGPONG_DITHER))
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ac63f753b43615f7c34d2da51fce919fd77142bf..d48c26a7cb6b69961cebc19576e3f7fc3b8dd2c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -117,13 +117,11 @@ enum {
  * PINGPONG sub-blocks
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_DITHER     Dither blocks
  * @DPU_PINGPONG_MAX
  */
 enum {
 	DPU_PINGPONG_SPLIT = 0x1,
 	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_DITHER,
 	DPU_PINGPONG_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 49e03ecee9e8b567a3f809b977deb83731006ac0..138071be56496da9fdcaff902f68ebb09a212e2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -325,7 +325,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
 		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
 	}
 
-	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
+	if (mdss_rev->core_major_ver >= 3)
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 
 	return c;

-- 
2.39.5

