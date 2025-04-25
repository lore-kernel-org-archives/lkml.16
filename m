Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958BA217737
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610557; cv=none; b=aYMEPXJczKuFX8PCYPxThWU/iMTVsWmadXuKXb1URsr0ePud3xsTfG7IulZ+sVzwqLdP3OTjBRmACSzjBRTtN60sadmxOao7EfJYAB2KRvXPEcH1WuQbwnRLX0/c/11M7jIL61ipKO6pnkIVjXlVkKm0xLmE9ra+sWsi7bpnXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610557; c=relaxed/simple;
	bh=xEqo+EivkXzxOzoaQDh4iS1g3dZuWredikvOGuMfVEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhQgUFSs7JJ65ljpphZOaJtbxJtJXHLkAv7xWT48yXUGPbNlEDXK/SoI0BTuqeQoNzONpYLvOfMzpC89VIMle5atXMmraO29zRMFptpD9VY1RHrsLAX2pZtjkYpD0dD61a+qtIJwGSrUkdJkIiw+z2m9qYw9XnyQzK/fD5Tjv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/xbVFMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/xbVFMr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJxNY032119
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s27H/MGZip346GLJXyEl0+hPEUbbSGTNw9RexNbP/zQ=; b=Y/xbVFMrbGwRmCF7
	wsmRYa+s8c1mZEndO+IXcEW51fj4TW23Nh77+FlDnY0WnRAnaDKqSqoDT1QLOnWx
	njc6Ve/1kObt1zogdkRLg1JUHrX5iOpiIdSfpcqzxfe3AC5gtw+qyOKl/KS/fB3E
	/wVMeAijvzxVND5UUPO3p2QHE4VDnWDdiWmT6Ia+/XbH+9izxxdy+0RSL/oPRR6D
	sANFfxbljs5konwVHd5kOSPX6T4U8+oUxm99t0MGfZOrOeAnxVcHGE0eDQpwN/tj
	TPCiu5wpItqNY5wpLK9TIjudY+nu9WtvhEN01Kvp0Fy8QHfFJ8RLMojURHBk6BF8
	x8ciEQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1a0uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso41604096d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610554; x=1746215354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s27H/MGZip346GLJXyEl0+hPEUbbSGTNw9RexNbP/zQ=;
        b=Kx72WP9On12WXlPAep05AJ6C2QoCsYtZta3iTrnpAhtRfdQcj2lCVtAEO28s7DqbSy
         wY01j9ZJIpCt0XQfVY9YpAvom63Cc01MM5feohoVPdVoDqEek63tJyZJX2vJDi0IWBFV
         dAv3Rp2GYVGjpBd2epsiHICVwRs4yRno/DUkNXnoiJp7bFP4YTEQyExgxuCCB7VYa7ea
         eSAv4cth3b8k+7Sx0qFT5b+5qoBGhUPgMURrVM/hnP6nSWoIgFydJrAYpfg8tgwO/5g6
         L4YareFsI/E3g6yXFs6sAZwJEd8JGo477dbyw58wp8VD4f8IkDpYW3jbbm9w9LRCzwdw
         MoEA==
X-Forwarded-Encrypted: i=1; AJvYcCXPoNtCmtxSEGCaMGPMRcbOLTnhLFy6Tj1NY5jFKkyw+wMNzQRKnhjMs5i3K2IsHRfYIOFZi7OTioihhik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MXbEzRTBATJK8phLMaNde9EK1Zh6M+/wpj8m2+Y62lyl/CN+
	OxALYoPPP/P6gQmuZ2SWcU3/dMrHGK9ql4WDPa4gPm4AB6RD70DIDTPyB9mG8g+qL7Z6Lg2R+R8
	U1gr/3x3bH0SKUFQOEQfgGN6tGw3gw+F+3NL0mTy63avK/1KeR99fZWZ0oKaCdKY=
X-Gm-Gg: ASbGncsZcmnDf9CwdnxhPwVfr2C8QQQPFatlCkCJ6TCEjJCBWZypVNkU3y9NCmkab4k
	2Frl3T6b+1mHxgxViIJcxF4oD10NhH3Z7DC1ZIbcwY1u2mmVOpdQojV4kmeIzepYLEWN1xSILRp
	++cn2foUYy3J5OqjanCiTIGvcYHYGrpkNB1RtTjYRGyMq4L+wTMagp9YCTZsn/03R+7Eks9yF9v
	Ox5+1V2eqrp1COIxKCz5v9md1m325Iv8jD10zATKMpM6T9f3F4Uq96ncTSLVd3Fq7jGvDlNRXZf
	ZECOFxjtLKzSnQs9jcaN20yO2LXGkQLMc86rcRar4iwKd9N8U+fEZGXv+7Y/n1M7qOFMFt8PR3/
	srNG8MGjA4UhfwBqeUckh0cNu
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f4cb9d675bmr56063726d6.17.1745610553743;
        Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIlmd7nFIFgnLBspjDQVkgY90tTtUd8k3ohF7W9+HxepEi1M8QeYnlT7judZ4HqN7C5lnMEA==
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f4cb9d675bmr56063336d6.17.1745610553327;
        Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:08 +0300
Subject: [PATCH v2 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-1-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C2f4NUqFP0JePGsYgv6HQ3zhP0uNZ8tppCfOQ3zdVxY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwb3c9NvmqV2SRvN49/qMkazLRa+zVF7ntcxJDJ/5WKzP
 xWO5053MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAitxM5GJpSzmcHRb/7GFMZ
 qjXzgy57tthxk5yaun0bOf7n+CqYTHrK1c1kfWLRkcbFyiv1tt9gW/2HYXmokWiEbOOSS/xdx+6
 xBJ7mkHyWya+3a4rxytZyyUybc7OTL+7+L7OfzUjPYs3+3+9s7ET2vvqbaMeUVz7P+uQ177m2sp
 X8mW2hJh0fvHh/iIUV+VpeSFyjO13G7+CD18USfPpLnjP93mvHULZVNHLyXUmR/qJJ/hayJ93Wb
 N8U/OqEHf+uzZu8ddP1V8p3CxqfNWVSrtnLeLVySu4k/9r6Qw1yE9Tkru3t4pVNvuR4qd+u7Hr7
 d/Os/99/xn6qEZeJmSuXbVNi1+r1RP5+2RGPImOb3K8A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -R-hGdyKwNczba74ZV77VermHsPb2w3I
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680be73a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=1PPYqbpFttJoYAmrjxEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -R-hGdyKwNczba74ZV77VermHsPb2w3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX6nzdDS21zR9d 4biUD+1uywxN2DVSavgPhlKaY5/ZRrk+6hAnnwIPb0coriFFCyEQRMrlcd6wHc4wUb9YcU8FRGr olcjC93V1K1X+2+GK46gRoypgNkDZ7AEcxfBQPeNqUEixVVOUKwFtJz/2wJVgUE/Iu2Jx06xA23
 XV/IdS3WgqMcGWCy+qB7RnYHr80JOf5KGKGZUrhdeTkVHXI3zyhzZjEsG7WFuGGF5MX1IsLspV0 Rc3tXYGLvphU69HxSQxC91/g77s1eHc0d2TK/MlR8Y5gr+ZnfcolDpCIPQSxO05KkhNT+lFEE3B 5hme0J6aiawpCQnk1wE1sn80uA3KgUPinv389gy4uFcDyp4JNmP1fI3kiDbTOAyj8CJQEfV30ml
 T+nSUrYbFFPZabuEKX/qZs6Qzk/zHADH7Y/fW0+S5defa3X4CK7z9RS7I8tEq0mFWKvtpI1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=899 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 979527d98fbcb19c33ccb45b5ba4716031949985..8e23dbfeef35432348c86544e825aefa54d476aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5

