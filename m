Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49DF2C3778
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940697; cv=none; b=H+HIiF82pHe068eS+82Yf4mrWqNnk4+CblCHT76fHSRqnyff6P1S4xKRW/RTKidl9GFunvg7DPytKSDCucMjTNfWXSS9PNkUprObUyuOI341M4iHd1c2dV0MzwNYOowykBiEaETH4L0OLUJ5MC0RfDmOwNBDBXqbPl71XWSStH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940697; c=relaxed/simple;
	bh=NNCVFmfEoIQ/1ZOAg0obsQPIEq+KdQZQAG/48UpyygA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVxlVCsf6qmyqRyn93gsEm4FLOzRkjt1v7FvqwgcYducY4qoMr4yYDGyyq6Ot+p3IZ/zuzD9O7JoBS3nuIzheKQLd5ivugz7c5qb5YAEAZstIFcUXmpODvXAblatH0VOEckxqe0bI8c7n47H+BhxDaQMH2Le9swbnN9hvC89D6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnZgKkb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnZgKkb1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MI4tZA014544
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=; b=XnZgKkb1y5kCdNSE
	DDCpHhfHzDETU7Fc+uWpW1f2BnDyapKJhLGf4bAqOi3nxv36LfFth/LyXViovxpI
	Vay9jtGoq5Wmuwbyzeiw3Fb96oJafy4H33mXEKn0C3A0TJGxR3j2U7HEUkXO6gPs
	XfO5RhlvEyeTfw2iz9phucwQ5KcR+M4I4rn9WEsg+1Sqirrqx1aNofM9Y0VuZCAn
	7p3dHDUzr2SOeESpyUsGljkO/ydL1qc0g77ITCovFp5XsRQATDnyYg7gVFDSpgfT
	YRfy700/cMXK4WjSBfrCCNAKlwyebbnuDU5KsDc5Ga10sFOECJFgaIzoN5wPXJpY
	sVw4IQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c264h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so1330367885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940694; x=1748545494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=;
        b=FBDs8xq29ITPE2GhiiNGbIFvK2qXPYUtxCIuJAzDVcEziVi4UJJL3jikICHbfRY6DV
         tUT3L6drKVqoSIqGsR70pvbab/y2aFPe1S4wTCHep5EciJod6+kya73vmY7i0wE+ZnYZ
         ckA23ZCtar6ESn3wgIY0MJFeo9FWs+dwnL8ZU7uKi1bIKwQt/X0CidEIEcq0wV1SC8FK
         h0mlFtDjSiBw93uiH5lB78b1l8RtrsCB2WOv2cxmTo0FXoXsMBY+HdEmPhqNKE2hsAKG
         wCdKib2/nbHtGknK6SwW8oGmSy2oHs6I5xJi6M2zdydZMqkLonLlEK8+uSQXatFIkA0F
         Qljg==
X-Forwarded-Encrypted: i=1; AJvYcCWtF5PB2WXNREKUc0HloKhzfCZyKGptIgka4S3HWMb7qFaQnGR0KWEB8jE2avs7OvqEyu9aKQbaW0CIw8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUbmGUQsgE0TqWpBPsYOXNsoJhjw7Vvm8TndWPASJATckqWbF
	hKXmpPdHRfwua2zRiSyTnzPC0F3Q1G6vFNY7QZq74k4TG8VFqFgnu6VmhqtxniYf7DZg7Xg0VAI
	1F9CS3rOrCftLKyjKdnZykJEb31hd9XWmA2yWjZzREkWdOSCDy3GOd2i/j5ZHhsZHBs4=
X-Gm-Gg: ASbGnctrNtCISZQAJhCTQhhObRCK9g4O9EQChP6erUhcoAiZo3LJCTHzSMBZ4SgaF67
	ClfMq2dygH/nUBI/LeYN3d0gxJV+O15WwZxhPdksM6KClN4/ooDFcsI4gM/66hl3VZUToxAq1Tc
	2fUKhvUCStskWYdIFgCvAkQ1+GhNEChAIITpGM4YJvVIRsrzbzQ/hC3+a1glfwrO/ZylfKC3UNM
	t3rPFgZPQGM7FbdKFDmAQcx2RLyENZZ5Ilx62p6xfdemMuiiimdwdfKiNG/4gXxSmHH1gA6JXOn
	K1AITKx2ibyOZt8LUcr9hBHzd+n+yNsWlLQHh4s7mbeRn+Nk5XNeJx5bV1ewFLzFHsbJZlxmkzi
	dIrTLmDlEeiOQ5uU4LE10pWUL
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd4677d294mr4167212085a.44.1747940693796;
        Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcLc2sPE5Sg0jgDhOzm+gjAvrwhMlfl9yw4J/cxGCECts0yRwpyzhheSdHFWbTSgZfN+8qw==
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7cd4677d294mr4167207085a.44.1747940693346;
        Thu, 22 May 2025 12:04:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:48 +0300
Subject: [PATCH v5 29/30] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-29-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxAdYTmaogRQHBMvHaDa09r4i4VRhS75YE1TSgSsEq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3UAMR8c8v1LH0Q5G+F+m4l8MrzYG4LWw1Z+u
 LhhMQ4xUX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC91AAAKCRCLPIo+Aiko
 1eScB/43JoU+oCxhxPw8J8RbiyMcraZ8IT3l2HsG6AYvn7TMPCqdkAlbM47zI0Hir17zhVefYZz
 yKxNPG4vh9+fnzoLUr5h+TFrwVUIAz31mzA4TE0+t9libr48MWMAmWbDC8YXTeu2guOOg14LeJs
 2eRmxS3Qs0Txcd77G55RudXbmZhbgd9enJ+tRiT0+Osjoj5xBMYPK4IGa2B96qtX4ZW821QuRmb
 VuOLOywiyra8uqmdVYtQSXV64wDBndYCC7ttalKBGTvUO5vQYB2GgQlw/pftMqFHMw5ZEZNjcXK
 gfI++5ls+vfXoZ5U7Nhq9NwmxAKqzrMnCIWsTLRZb2GQal91
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX/TEOC0tIwUZj
 P8U8Y4HZ7Fduo3urJhm2AEBNvIgNA3oqZsN40mtxT5Tea5jaOFD9rFj2zsdGcVUF1nZe/tclSoc
 uLfAk6GHGop5ZID/5z3zUSkV9Spjzg0GT8o9jy9Oxg3zs+HY2RtwmUehZMxWDJ9j+68eYhVAeOH
 3cO6/mFS3LR5MDEScctV0SrpmD2a8v+7J3VTpF+yBxaMRHhSHaGM4jjrOXfMP2kXxeT5eF5gntH
 dR0QWxuB+IZ7ZSLCkKKsrmbm9MFH8D5a7j+wX9AxBtE7JuLGy+1dki7AigscrFelvuhA0uE27ID
 ENQ2l6aPCRHhAgBdcc71Omz0riuIJxjKeMO4Z4pw0dPo/uCT+Bx/GPz0yQb0jLuY1PR6RQzJbYT
 CssSAfBAnBjmg1Lmir/ScXYYoNysgrnw3ozQf+U7znxipLHy5qQ2ne8oWIv0/RhWULODTd43
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f7557 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dupNGVquEBLn7jqxqAdnaUVbI_-SpkLd
X-Proofpoint-GUID: dupNGVquEBLn7jqxqAdnaUVbI_-SpkLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=982 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

