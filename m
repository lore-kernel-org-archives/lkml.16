Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36272BF3D9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940657; cv=none; b=caFGPpaNVd03P7+mMXEPLx3LrZp80FEJXLmjBhv2cJZtI6JCj14rB6LP3pgVuV30F9vleD3isU9A6Pg4uOaUbiP5+GrJ23SqD8IrE9Lcjg+ww4wml6/eRBUuVzQmysbA+4xCewGVUGdwqFl1FM2L34C6HyNVWWRN9ShtnHXRliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940657; c=relaxed/simple;
	bh=Yt3mSGf+0WKdOXnoSWbgdfjz97ORzWCa9DQMuZ1UL+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iEUFJj82G4OLzMxBmS0y2zK1kv30cAAKGwazrk9nAU07GOUdKdiQxlNTRpuy7bhy9+DBKS2SReCofbgmzuFMub2lW5ZcV3QKLiUswjp2v29tUYNPTf5keckCuomYskgYmzcyjGwLLltJyZs9mM4+VgYi+/bKmobbwBY6oxoPHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=My/lwRct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="My/lwRct"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH9e3p016524
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meSvyd78U1CHNUSu1sjX6MVvdc93GQx+HAJc+T3ka+M=; b=My/lwRcteVTKz3B5
	lyMfSYmXpea+e8fBktUmgG1OfNTLd/1xDDUQyF+5b10vMyErxH2hhs8fjPwP2eA4
	6JD6/WeS0OAT8ZGtzFpfQUwjpachftX8VVJhAc0fWKDEJmxgFsxbNMypo/roImmP
	8O538JZXkzFXuMrhqT/zXVPPxv5CPzzvXJHlYm10xhr3Kn6yKOu3TRhNVPInKcas
	Hya+d2+Df8tGCPDY79VkDgCMOUqUi9I7t7jH6Rexyxttydd9FMKF37x48pCuRQKZ
	6VWGQGQRkbrCK9lpUk6yQEeeKcTFl/jlwWE29PARImClkNV5aRzDemkNFi56k6eV
	aaqFBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yfan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c955be751aso1483855785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940654; x=1748545454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meSvyd78U1CHNUSu1sjX6MVvdc93GQx+HAJc+T3ka+M=;
        b=NN4Rb6XL4KpwCq9UvmWBTh2Y7FkTSqJYLn6PfVTLM9+/C+LR5mD918DMIZDNQuaitT
         qiFEBEy7bExgUvhsdqc647iJLxnBOV0tQz/Y0JS4CtktqYcdtpVORGeI5xLrewcDTd+1
         kLYzfTi4l+7XiMIFO0xsvsnIcN3PMkzq82krdoEh4uUrETbdSFUtlUaEwcQJ0L2NEbuX
         rp3djbbk+FcVr4jEdpyoFIMoaAs18u/q1KdvIZTLhJzpoRvwKh4ZYcHBR2K6uYoBO+BP
         byCeEf8Ofy1Gu5/FS//3ppTBON4HWqaVJeL5n+gQyO2KgNGFXaCfBIGhZyZpWd+A2/Bz
         B/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2PJ6xS+s+mlag6wOW6l8cjBKv2Vqf7KrxxXmgMlPBpNzv1qmQ/7SxZnvr6NzW/U/Cs/F6hfWAzfPbSIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9KVg46ivpmrxcF1I7e2c9GGl0rMwA25dB91dPRiZ6o/52YBRl
	jAcsIv7if/L24hRCZcQ4ZJ0Fi31AWjHf9oL79TVLNP3RdcHo6FI8hpDC61SdqrbWdFjt+tcLEzF
	Mn/q87e0rDE3P02IhvWFSxXNREL7+SQOdCWRP6lmds/N/7GvLUumjp6dTOy0AzfGPpPA=
X-Gm-Gg: ASbGncve7B/6HgM6yY8qXG+Q6jTBKcQELWESoVcWcFkXBwRudkfqnL7LAZhwyKFYu+X
	QUhPWR6qMf7ooL87uv32X6m/e2zlA2hHRToAcFSlzJPXW16iQBfKyZp5h5XM8mytGc37LG3YQtD
	mo8bioki0AwKBr7ElyqU1qozRBGEawdzLEtd2kcyRur4x4SkdM25UdnBdYNfxmhYw+9QXOK8aHq
	wENbxPDG9rECqc+9x2VAtPThfOC61Ffl51/zTeTDbXM6OFMJVZlCxbNEpK1k4UmehQyykNNvNYK
	WmkTYQwkAi4Bg28PCq5b2f1oaIHJvb2jqaks5MB4NguaUJJHt74Ss1Zzr67dEhBMLHySwgTDgw7
	i68isacHlpni2PK1By3kh9abG
X-Received: by 2002:a05:620a:269a:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7cd46707ca2mr3516548385a.2.1747940653717;
        Thu, 22 May 2025 12:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEoBlcr8uJlH7OZ06CowCuAOkcwitzCRot/aYYoXoCrZstqB6iXIlg4LXR2UGY+FiR+3ACNQ==
X-Received: by 2002:a05:620a:269a:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7cd46707ca2mr3516544885a.2.1747940653362;
        Thu, 22 May 2025 12:04:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:33 +0300
Subject: [PATCH v5 14/30] drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-14-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aJLcwGKHuUuyJyLVdSDXU6TlIm9ioIVYSavHMvjyGfs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+yd8mTk2bq+c+3TmX5ynanBR5/773oyf8stvcI+eqP
 5xp8ra/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATuRTHwbBc9W6r95vWw+vO
 fEo33H74bI/AE3GlkzUmPAceJlx7W6nltuSGa/Cfnu9PgpfZ8dQ5y2d4WaU8/cZoa53SWLSzhXH
 axj0qGb67lFL1Cu4GN/Z1NzzNDGRqeF5/ZL2Ng/qpIzOebbr7bRpf8LJivVq25Nec3SeMQzJbeh
 iqt/zjqxS9Nfv+5t8Wa5sz/Pivp8h0MDoYn7Ew+/5rsrqPzOlGreCOWhcjsfu3jbxaan77z9B49
 ZdP1v3L+rzV6mJZm2t3OWxqVZVaEh/HzXzAo0bXgemC+/3WegtTnRB1c9/6wDVXt0lJ3f/Gu0aZ
 m3cjr/1ZFr2+vrTST6amdU827Co+kc5yOMKYYf/j57MA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f752e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=z6iiZyybfqEMMI01lysA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DJsoLK6fDh1k3a2C_n1aidRCW5zo7WVj
X-Proofpoint-GUID: DJsoLK6fDh1k3a2C_n1aidRCW5zo7WVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX+y7QfX3LxfzC
 MDg/vm2gy0zlfXH7gDpaI9f/yK3vnpsNjjUooM4isKTQwPmG7Uwk1JoBKfhhzzAfbZVVBVB+2UN
 wRMKbY9fKO3K1Rny2YKqxlpEOWQc/3xbTZnM/rPzzT7ZV/Ty8SljA4ygew3eoPb/wUpFhn5/G1k
 5+isFTLiy7svI2CsZOcbjYMtKVRa+gSa7FrTwnB/b/wtThSb04MiDspHS4FUaOyi9PktOOLg0BB
 kvWB9GpY19bLaoqMaDL43TWowxDDG5bLTOS8KdZtNEQ3i6+8pdvESotWcfQ246CIMXMj+oyRVD1
 gv/1MzJkCjeaBjcFP08HK/GFGld/2yw/B7CqBTcKNHr5hgRVP471qVNBTZOaDyb+Juau2iLZV9S
 X4QBpFEStmqsCsgZoTR8ABV5EOVyoVvo2/ZplmecYuT6qu1Eq89l4znDhUG4vWzFZw1/t3aE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_INTF_STATUS_SUPPORTED feature bit with the core_major_ver >= 5
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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

