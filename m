Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC62221F1E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610561; cv=none; b=TkFmiJP1oxAq/5M4b8YjOY7iwNqhjHTvZzu8WPQJvDSmDETWOOOePzyBP1IYVgzuZCb2nRuc2V4dschQkuSPPKd0uBcasfh/2W3AxifJlH/NxyXCJiDU92DJoK/boRi/cOHBwkaxajjmbCh73BTM3pelTwy0yKpSOsecuGbAFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610561; c=relaxed/simple;
	bh=CUaIe3YjEScKzRmab1Pl5aHETuKQ1a9T+G7YnxZyaYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYc2LWtxHNLHN3YllCyrI/ey0YJOp2dz0LarIHipWzRBgbLvyb49clIgv90XrBuV/mTKQgI5hGzGm56JDaY8kB1t5AKOA34P/EQ6ODRqSXHV2GJMVNRWKAsFn5E7qSxOpQfvVC0rhIDiK7uRUrPETFMCW9QHe4/2NpwRwzPKhXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNjV2Yg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNjV2Yg6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJv4w024841
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=; b=iNjV2Yg65YPih9MY
	NHbRpmoFU78rmRnk+K+o9vaum4aFohzqowSEbaZccjKfyzN+5H9DMFNux1W7W3M9
	j6+/3dtIcSh1Ucm0CvVxIUjcphFnQpkmFiTL+iF4p9VXk8T/eEL5rAHMWdnWEdm9
	CC1M/akHf+P34ayA3xpHoKdXYiHWC1zY8gH7iRSskYo87dXBJATif+I+aWij8uUJ
	mENwPIBmB6jm7HisrVkBgb2Ot76KEoPLpCZ3HIZCO2fgvFyrBVwYk4a/plIVmCdy
	JdmOCRdY8wkDh8vwFUFV5ZswXS5z7IK+uqYi+yuF3NdvmLmLlpF8ECr4Nnww6YSb
	jsAimA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t0x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91d8a7165so46859386d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610557; x=1746215357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=;
        b=FhimzjPGJeB4gtjw+rit0wmuMtpAnONGy3iKGrDS/Lcqkrwy61SaDESq7CYIygAm9d
         khoZTLxaCsdwB1ZSxXE4/Y23e5ysTUZHLG2d5hPFdL+VlYA2ntt5aNU47/t4uD6yZWo4
         uvB2zDCVOq3EgRHnxZ7OjaryprLCU/x5SY9FU5KfRtB6uCNZD3fz+or314UTqd0W3nn+
         8HdW0rfWcZYwRtFhkZFmJ2cDUpIByKkqtjqjTxNT6oJ8w0MzT9WxvaHML3xiw5AvnWUv
         4ifn0RKxFVvw+nc7CmEKCAiSpAJlS00m3PVcsAW88Z+iZnYdgdvwLQ+4QI6t9P/VWNM8
         VnBw==
X-Forwarded-Encrypted: i=1; AJvYcCVGaGpjs2H+R/UWrR6+RQlXYHE75j8mFOXHCpVAHrRUQV7Wn6OoZEgLaoD9zq6gPvrGUxLtx65XkZ9XWBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5Gcx+VdXJCY8d5EhFMRrYw1rbl0/A+FnchGhaS5l+S4Pmrqc
	i2YHuLxBQwGlcoC6vOW6gF4at45p/JjffTgGqXZd0y1YglR2Ntc1Be0157oTodOdI/6pKnJsm6a
	SVyOozWTO7U8FeOaUWixYDFhRrkN5mR7M+kYlPl0feMJKy5rJaMiAHpfUjE5SrzI=
X-Gm-Gg: ASbGncuosV5JJqG8tqVIJ5dK02KWZVwdJzXAjZUqvx9WEeOoUGn3IHiX0eSamSyOj77
	kF211Z98g8kHrvnEB2KEZKDqsIEzyEBhPrpkeGSqc2TcFBI4SlRTCuAT/d/ZctjCwZIneSjTv4a
	WvSufpmBv3LeFSj2G2KZXZxAKQU4Lq3qDzYZEN9yNifQxBVV96wm8886dEpySQTWcrk+fawuKq/
	WD4h/BHLKjD9Xa+1E4NJRdTTloSiT+33WQzh+K81F1qEexN+Fiu7L0CNtoJTiKiSSCtoDyxa4WX
	34BsuRqucnWEe/xuYBcUnmZE+3RovN6PSo/zXqFK8aWDEh8wxWmkqKGwtZpDLv3LYuBfQXtGvpQ
	BJITANU7iT69gAGHB+Pj9zZO3
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id 6a1803df08f44-6f4cb9b917dmr61105516d6.3.1745610557411;
        Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWxy8OZVy+1G4435jkDv7x9KFSTI/TlWQyS1nZQqm5LJzAOkiG4ti14J6fup+ZqQ6Lmqkrsg==
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id 6a1803df08f44-6f4cb9b917dmr61105196d6.3.1745610557116;
        Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:10 +0300
Subject: [PATCH v2 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-3-c71900687d08@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUaIe3YjEScKzRmab1Pl5aHETuKQ1a9T+G7YnxZyaYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2fBKFWyeuvlxVupBYlHsabn1JoqhaF56EP
 A1a5Yl2OECJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1VujB/0RH8hLC2/n5KPQjXGWQdbQPf/GoiGnrLDEdFtg/55BGzkZSIzNqJJMdmP+7vsHv9MPIcG
 YcyjarvTthBVQ2gwHC8m24VeVjCeGha5APWZv38Zq8g7jZZRW0IxctLvGgswDWh348JqBMuBmUi
 pHi0183XYOLlOK5LMrCk7RjngYk5XLViEtYyM8gy382OtyZ8/gn2L8/ThiJ1yJFI18mvBsqRT5P
 old7nzpGyj4oziK/5oe8fC+TM0PUDgvkrZ2M6wcRHK33oBvuIkwlAPIkvcJIoqL9qbP60RLvoSb
 1yRl43nTtcbz9GZQhJghSKXMIh8csXpawBcumJtujOHTnnf4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IlZexs6e5jVhFa_0VYp4R0Zvd1dDIwwA
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680be73e cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fm35gGnZT3d3QFCnA_UA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IlZexs6e5jVhFa_0VYp4R0Zvd1dDIwwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX10i2d1O2EFOW 9QFIpocfv4iWc1LAHT4UjmbJaz6LCFQv7DxiZeXjkOVMFDc6K70cpfhGknIM8PKEu+7JIXE1bHo hMxrNfDOGZMbowCTVIWwW/Nt2+r7ER66o70p1Yhzpz8M71UKdmn5QoBWwrbMyJMLwiPCIW/s4KR
 FLpLs3C30o6bF3ktlroBphGYFo8whdMGeQn0CnjxjphEP17x+VE3elK69mJv1vyud+2RAbCEjzp kY9TQReKpAFrIumCTM7o8pUPAtWt8dnmGO4qeVDPWoLymtsW0Cv+/hnz/wXTYDYrBG9YWMpyS4Y ZzePHB+1ggmh1DriuhQtBAKC7N8ykm8HWPCoKDM2/MTcL1fcRXyZxcK1CPHGg0Mm1HnGX33mgyk
 u6+QKM0TwENAZUzx6jNhZniEreosxCdBnh0xvrft0z/6MkgUNB3vlzxCMqz/+Xf2+z9LQvcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=741 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

In order to support more versatile configuration of the display pipes on
SC8280XP, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

