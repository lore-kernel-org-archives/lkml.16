Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0603225390
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610563; cv=none; b=n4x/SLOyJ6MKhkuDulbkuAMUILBpkp46X0lSu6paHkQXVUqVR7CLmN8IPFeOdrrXvppeNA14yKlmggEziaAwYXpE9yfBx1cJ1IdRTEBJdreKsEguc6mxet/ORcbPvDz9wJVWEdYrTq/vQVNEKTcnD2LWUPT62ubBGiFGB1eV56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610563; c=relaxed/simple;
	bh=FNmRnyT3eow0gzV4hp6sl5gj/DZ/zTj42D8dGvvjRGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkgqiSLpXG7xNug/7j4o/lhUMCkCwLf8v6riRceIne2BWP3N/3JL+UDwbE91PPn+UnQX6jttdcsLt6sMz3LLP279oW73Jih6SUaFy4045mYLBl+xZzgU6Xn3wKS/Ex5VSDQ5+fVGVpvrY4MjJ5s/P316LSDZK8lFhw/ex+WOksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6HDHb//; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6HDHb//"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqbH031939
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a9pjFcwbQ6d4uQNGXNPU6ossuRXldL+ieO315jgWQ6M=; b=p6HDHb//EDvbSBVq
	I/hqYpHGoi4XV16zcHF0dkOf8oBmrCR8aY4cuFu2lLzAxlTEwhR6JxKDmafxmyuU
	EhamlzLPBOxGa6/jVkUL3bTFUtL33R9CeeaEHF+jvw/uHLh2xkLoUEZiukONUNtx
	Vh4LOyPtY7mVIYaKCUZ2wEliV++DrgKRqcM10EJOAmdNvLtm20S57x4YtePIFAcq
	e9+/FzOhPMRuHZoSqvImQIgRo27qf7mMqTlDkoG5rrYes0X7AFv553+Ll/FqeGN5
	2rCLWjoe4UZ15QDsFKMy20Q16cFjAlw2+f/iMwQE3916qHWTMSgCAGkTcWLPtPgZ
	WSS6RA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya4gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso41604766d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610559; x=1746215359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9pjFcwbQ6d4uQNGXNPU6ossuRXldL+ieO315jgWQ6M=;
        b=S91TFyDavPJqiqAQb3+XQrBE91Yua3ryasAOBCwWeV/e/IH8nJL6kSHdv97c4MAR9b
         Nvv8aj2m9t18ytRls6RWOm/rhwNmoOC1/rbsDuCi+N0pJzQrM5q04nFi6ZOTJmB1q6e+
         QwlCkE7N3uXlItRcLnlg2gUkZrWwC9+ZUCFYuk4myqINboFkFzN0m67R94qihazh3rKr
         f93Qud5UH0KTGt2FB8geIkO9ZNOyB1QrKrPwPI2tJVL9hAXVR2U63Atj4JbZ9XihiH0k
         nCEBBcXsN+u17UU55UJF9GR43XZvFa5eQlIMMZlUG96XMf8VzCgMOM+HzKoWOD7V80ST
         lhpw==
X-Forwarded-Encrypted: i=1; AJvYcCWlbW/gTeOrwoVAPs6XJCV3vEkbJh4ucPsHK5glF1ECr1bgA6LMdLQlcHrakeAdGAoe0Ie0gmNeolJrxPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycgxSeyIL93dVEIDJ/NVAchQIfTe5io5FOCFWhyrmr9AbnoB8g
	nrG+jNej6/aIBlQRul8l7NKi2yS/fftZqZt9XTEUU5zt59YuzA0ugQ+RGfPGBuC4Z0Icvml+CDE
	M2nZFZNSZBSq42XViLue5N2PyGI65poI6vpumCv2pBbkyKt4WOPhrZXJj+hwzY2bdJAywYCk=
X-Gm-Gg: ASbGncsaxUS8w3WdNaG6Qa0pzPRgSwYBrCMy4Xc0mx10PiBL1B1/WeHyeFTwt3oZvhu
	78GNUrZihYncz7vwM1HU7O3cl1zplPANViE6bJJvsIIEXSCrVx+mUACJZNpgmdyvjbXCiYyji5s
	BfIFi7YUIix2tYRGYtnJ6yrUYQuYasKyMxz28eU69QxFXXk5UZaic71dsk2oNTIi8LMZp7KkuAX
	erqsrkD5ePkumBvZSTskMRz895kAWqv8ObkcIRh1JkFdtG34/RYteJiI3WOXrbcaGH6oqgRyp0+
	cAOJAoV9LwRRLhjYGVy8wU10PLNOQOUiLcvCQP0xlZhtfVTPUYeoVhToVJfBPGHO8c0gG4RPBLn
	RD5iatpwUf4ktclsdE3oxREcq
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id 6a1803df08f44-6f4cba51be4mr69387706d6.35.1745610559118;
        Fri, 25 Apr 2025 12:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqo8lIulG0dOvKsgER6OtZ+TgO9vrJCPId0DQSeGksp2OqiP+WfRkkD63nepXAm0dyxJWWzQ==
X-Received: by 2002:a05:6214:29ca:b0:6f0:e2e1:50b4 with SMTP id 6a1803df08f44-6f4cba51be4mr69387276d6.35.1745610558751;
        Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:11 +0300
Subject: [PATCH v2 4/5] drm/msm/dpu: enable SmartDMA on SM8550
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-4-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNmRnyT3eow0gzV4hp6sl5gj/DZ/zTj42D8dGvvjRGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2Hv1ovnVDqdxrC5BedSPh5Ro8hHW5+EDoF
 6IEpQ/48xqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1fJLB/9hTRaveuHQ+zTcJi8Ao6BwDCfle6A5QscWvAbkGLF/ddC9p3z0TCVyo6Y0IebU3Arkw5Y
 r+nBzqOPYjEsUzy4k17EESJhUKzSzv/cIStLZbD7NYtR8K/DJJ6DmMWql+aFY4mx6UWGtAYNHik
 rjojGqOrdI047199IGbvXrUBTwO8/jYq5+Nzk+f3rYcTD5S8mM7OojGoL7H1gDjBKY28/yZD7XH
 D7pf7G9/KyALtVxQ9uCNAiNlW5yJ7eJbR167DseFYlYuu+mzZFeYjiegdLRgqq8Xzd/s9GA0r1J
 u7EU7QPzjbch3uZocnb94uXstPIiWfhvs9h6hg6Aj1OCfETp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX44P7NNikWGPn ZuO+mAgs2ncdTEZsc8GDxZc35AW30c7G6DkuHvukFthxrv08ic+JdnE9LOab3ur4aqOR56KsaeR 7RIifRQbeMy7oRXfGfjilWdkdPr6cYylZ6Vm5DUbC19Z57+dO3u+5HlzcpKwlXmjp7Ftg82NnQm
 o8ftN6xqMKiCreRpkbGfQYJ7sl9ELGHGdnFlEBAcDpVf2WWIHbO76kInpMHDVGG4ibsJqmDsQua 5uwLfcagBRpGqgdaKhQ8Vwam3XzosvGJh0OiOjCnFaUVM7kzZs+IpRpLeLUEyLIsW0u3aQ/eTmN Tz0bVgTAlTeNrQRNL+zWsxhvx0A+N+2SgYoc2q/hj0fgMg+ZLISIMYHRq19h7L+y5sH+Mx9UEPW
 3yH3Rhk8ahmkMXJb6qK1u7twW63zV2uL4qfazcOwu1mrcGZcy58B1W8Q5KtzcpsdOnPopSrl
X-Proofpoint-GUID: -73FfwMuB_eDJHHjZsUJyZQOoSqI4rxg
X-Proofpoint-ORIG-GUID: -73FfwMuB_eDJHHjZsUJyZQOoSqI4rxg
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680be740 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kVj8X6nmCGut3nRlWRwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=819 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

In order to support more versatile configuration of the display pipes on
SM8550, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 24f988465bf6ba8e3d3d2691534f0981f222fa27..1a156d2b714ffa6c16b2ae331704c1274dc0bbfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -66,70 +66,70 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x344,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_2,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x344,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_12", .id = SSPP_DMA4,
 		.base = 0x2c000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 14,
 		.type = SSPP_TYPE_DMA,
 	}, {
 		.name = "sspp_13", .id = SSPP_DMA5,
 		.base = 0x2e000, .len = 0x344,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 15,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

