Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DBB289378
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670682; cv=none; b=p3KkzIDX/EwjDVegDz0QKVk+wFse6Iw5XjR/J4ssT7vmH+mhR4yLd5FMvodSX5v99i+KPAIj4G8PoCfaS/A+V2C82K51m7R4cYaO6ia5KIFJRPP1de/Qc63uO5SZAYq1Qb35jX8KKQ/G5hVmtJqDN6w4lhcet0IgKDQ6ZiEBlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670682; c=relaxed/simple;
	bh=1t2itLKQXuXpuVv+bXcRGGPtXoDQTt7txKlhPac8RJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBGN6I8HhIot37srMyD2pOgbi7lRHIuUjTCsvBhColm8dlnAgrJw/PQr2S9RHvmm2PvbB4pZo/3ADY5XZs0Oy+nzZjAue6qz/fqE1WLOzUAbIGFiz3t6Hq7pxvS6C0XOTaZXeVFsI07NjB1UvyjGxcvFkxj3ntQGNXrYidO7iQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fas75SXI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fas75SXI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JE2d5h007910
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T8XeVV5GQ+9UWi6NICehTKxB4+h+fDf2dgfO9fnf48I=; b=fas75SXIkxf294Rs
	mbmlSW91DMr/QzeH0y3Q3T+lpgZNnJ6oHZVgpfoxasnctRN8UXECvk5c7/lT5U8X
	a0h6Zsia3ynzyLOUWJXnjalhOuRm2+KQKQZzXer/dDP0Ef4KVVZ+3y2Qidulcss7
	gbFfijbFYgXapQj0uCHaWYSipTgFwcrlQiJgpU03CTbhyPGqlLvZThderJYtQ0qP
	uYJ12Y4o/IAzQEqT9DmIIWX/ozxb2zIujHFSpoY6XZ+14GXd0NktnFweM7bq5bn5
	G5p5xvqcWWNiz4J2fHVyQ9eRA0MIzCeh3kMDKsaoeERgRXNrHI5s+jIvAFO0N18J
	lcgjbQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhmws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:04:39 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-400b1222c6dso3888002b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670678; x=1748275478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8XeVV5GQ+9UWi6NICehTKxB4+h+fDf2dgfO9fnf48I=;
        b=uXKCfDFGby6WVeuMLcgYkPOYp9eDtBIc2JT384x2Vq+yQRlGTTvFfPQyC2EUEGjHFn
         P4E0RpltHs4UYpoQQCYfZaT6J1swJi8KUg6D3iIcD96ivdNE4SDp6cLIf/dTJDqxJgBJ
         Kcma/BgUqGJCaA/KJfLzCXV8YK5SHs/Ph9EXPpcW0GZ7ZTUl8nO5q82JP11zqy/Th+85
         Q462w/9HvdQP8Y4BZlWuAYhFMYQejqdUs2TlpoYl9zYbd1KSIEy8k27+ark8A/+9Y0Wt
         9iM4vEVDXmOUytRUcdw9iYWVUCt0yeDn9HNt8H3Phy61lvKrrnKJGkPCUGJGhK7+CD1s
         4lWA==
X-Forwarded-Encrypted: i=1; AJvYcCXbM5TGbBQbVY5AExkqFXamC9quOW2UXmUSW/B0bIhdWeoOXn46fihdgk0kRCxwHNcmRrzfZzVODDIKT+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaFwfPNH5tvhmD8/scGxDwQZh1RTVlkn/2KjnQydaIYkH7FGy
	1iUf5vym9AuSIki8LvLodpjaWFOT9hiquGdopie+z3P18FjRJu99JxVho5CGmi2wnrHMVqr3fG6
	gCkfXq6d38Mg7I+vEz+ndSI179hW7QroQU+/LKacoXMi+9qAlAGL9A6DMiBJqUgulJpQJUde43T
	8=
X-Gm-Gg: ASbGncsO2fH011xI5D0kjsEgHqpY0d0hnIRnke1vljWSC24Vdf2scN8n0Cv+AjccT27
	sc4TBRucCpwsdBvxT3EhEMs/diR44pd76vJlhPad0+GsrdQDvwdQ/oSlQJqxt5bQzZNAYouXnOj
	ZUHnEFwPrF1ZJn3zjZEOh9AtGRgP6oVd0TUeyRN4OL0VZ0qOisTLubD1svsq2m+TmHbQ3urTDfy
	cp5km4KrvURWkRY6BJFWwrg2Wxsh7xmXk3YPVIHQuZ9uJciJssDLTbo9uUZyxWZS82b3UzAKTXj
	MUoO36EiiOdBL+Wo3Y+hzT7zNvRd4bg0r4ToDFRehC+xzZddvWSGcXUXK4D90jN2SrTqPDRgUyZ
	dUu4ubfjxmWI/TBqdrRtUxfyJ
X-Received: by 2002:a05:6808:6a85:b0:403:2827:7649 with SMTP id 5614622812f47-404da6edaccmr7817446b6e.7.1747670677854;
        Mon, 19 May 2025 09:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI7Ov78PLJDTtZdtpmm96Z0u/2l3U+Pcq23PACD9bdNjJIxmjMzzD5MVI8S1LpGWBFatkxbQ==
X-Received: by 2002:a05:6808:6a85:b0:403:2827:7649 with SMTP id 5614622812f47-404da6edaccmr7817391b6e.7.1747670677421;
        Mon, 19 May 2025 09:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:14 +0300
Subject: [PATCH v4 12/30] drm/msm/dpu: get rid of DPU_CTL_VM_CFG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-12-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=15596;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=lhahahPjgRsNkbHl25L+eiuPqNfc8Myy/B+kPESi970=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z7HJzFszdyhdzn1TspIWHywF/rJqVh4M3jz
 tAm0k1AFlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWewAKCRCLPIo+Aiko
 1WAcB/92dF4ScnXNtHrsm34IMTBpymlvtQRKy/Io99/K7NUQ87+dHi+eOLjUWz6HcDyE1+z74vN
 EiQQsC6nzffHYE0KNGFmm5Pr33yewcJWqfsxuTt7uDGu+WZMuZVUUH/nWQWuDx7aR/V+s35jWa7
 I/FIiIRkgIqLW0UHuWBFGpLtMfad+RU6M4MgnALFMT21myRcgfXQjGAmnXAxcgj4Sdn9fGnN1al
 JNfOo7nXeQrgc4aR5i7WRRtauOJHlrlaP5BONPZ+2ERDcfd6bpgTZ6iFBFKDDyF1ogIJerUDCOx
 JeMnoeMBdPJRg05dcbMRcm0bjV3Yx5ass5fmb62jLn8h7s/z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: taU29QFXHP5B2yI3PF30SlGcI_81p9ET
X-Proofpoint-ORIG-GUID: taU29QFXHP5B2yI3PF30SlGcI_81p9ET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfXzalXRe3Z8jNP
 MNQjtYDiram77xFC+m/QqhXMeg8ULgEXZmoU3F0xGNlpDzzHXmecCeBMsEucgNyiGDXHqEBulrI
 jgnKBpgAlTCdl0XrGdyTWCL2f1Kb/hpNeA1uFS9bi57nd8ys1KDfMMftRM59ghjg1HA2AxaiuqO
 inCw8HsE8IRkNzEIyzo70kTI88R1O3ABTjsvmQnyBdu1msutwsQzPogXxm71OnKyNNUv3G3fNA4
 kEuCQeR1nDjbxQ1NCmkmh3VmeDVzu8A29CvrhzjD/oX1aJhX+6RiOkgxQwgSAf+MBBoDsljiv5d
 aN/d59o9wNqDIR7qNH1zRWQrgsgtFnHW4BofDFdPqAgToOC1NKqqnmhRPhPoC7BidgFg3BWo8ZY
 VUFOZbE4qFHNWp83TwHf98bRDejZjYZvVeUJP8VYxBGEj3CxCw0FQzmvMfEDKIq2efYI+NK0
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b5697 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HAIgJQPtztWyLQ5mXWkA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
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

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_VM_CFG feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               | 2 +-
 12 files changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 52ad7e2af0148c9ea81a2c95b270be7058fbaec1..bbdb7e1668fee33cb7d99a7cb8ab001e58f079be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -31,32 +31,26 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index bbef0e1c597299d24a923e1f0d977c99afedb8fb..3c6da0acdc3b81db65e2544f16d90322fe7e92a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 281826170da082fc90a05c641060901ece0fbed3..2ee29c56224596b3786104090290b88cecf7b223 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -32,22 +32,18 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1e8,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 1dd0a1aa222d65f03013d634a87371dc552b5bd8..2f20d0014a94e707a5f0548fc1c6bf0983b0cad0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 50142b14e24eb875e72e5cff3b28ff8aba89fc9c..314875e2dca96b3b5c40aae0d15fb80da8ebd42c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -40,32 +40,26 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 264cd6d3640be1bf321fda429748ecdafbeed214..36775f444af4b2654231cd9456ac4eea1f0f18e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sa8775p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x204,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 83f73c7cdcc3a280285fa32230796fac57167ed6..624f24c8a33a182634d49058014fc3175f5ac9d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -31,32 +31,26 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index b21aab274703ac1f38698bee82d5d28b0fb6a0d0..857dc8465bf5571cd08cf3115fb96002873c004b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -31,32 +31,26 @@ static const struct dpu_ctl_cfg sar2130p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index d7e5f4dd3bccab125b0a42f67eddf194359dc761..05b0962c2d937f077d0b42fa8af6e2da40c7dcae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -30,32 +30,26 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 19a859e2a1f80c2321789af4ec7c5e299f0fb873..5cd87b13e839e7ad60356cde162405fdfb6f9498 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -104,9 +104,6 @@
 #define PINGPONG_SM8150_MASK \
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
-#define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1e5fc1d5873975189a1759212b8a6c6078de22f9..3b6133e1bb581741fe87b049ad0c89bf30b76019 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -132,12 +132,10 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_VM_CFG,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index edb82c81b0a449b1a7273fc258961b9447be8d9d..fe4fdfb8774b176fb024d76dc0bd269d9736d226 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -575,7 +575,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	 * per VM. Explicitly disable it until VM support is
 	 * added in SW. Power on reset value is not disable.
 	 */
-	if ((test_bit(DPU_CTL_VM_CFG, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 7)
 		mode_sel = CTL_DEFAULT_GROUP_ID  << 28;
 
 	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)

-- 
2.39.5

