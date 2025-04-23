Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1527B4F1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442689; cv=none; b=Ol37fJAesv3Ge8WCVppTeDeargmkfXDQmXL/H4vvBvFbVpGg1InGN6M//7bqlMbrECFSiBQuGd66gaUh2KDxZkU3rJ4jTwri3nqzSUORlYDQyuN2uY4uove+Wi9gTqAQODiadGsAqSAyXMIG5eR2+1B5D+A0wZ/WO3mfxzuZ034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442689; c=relaxed/simple;
	bh=+r9MMbxZ3ekxD/2ICqlcudFe68TBHlQKa7rixk0bnbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjHAm9lsifhoSwyyHt+UJUPBd9VtdZhLFRP2FK6DpyijYkCg/38CJOHihlFJSQmtxZcpDmC43/niVFJe2GxOvM50EYFOnazHGS/hI+eb9iFacKPdlB5H+rEpGvebVIQ3nN/3OkuRvckKzRoVeOWyB4fI2oHFc7ExDDdq/BkxBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1nudbFI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1nudbFI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB5F0o014200
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=; b=i1nudbFITywtFoJT
	pjqWvw17B4rb3NJb9k8YkMX35vF66nelsxDIPIaKlrhG364AkA94ieT1ShEGqBZZ
	Ze1KeEFN/2VoQBLtj+jS3SS3MXHAWR/C6VHGyLyqBaokfhkMhFns/OEMj1rAHZdh
	g2Szjm8S+ESi6IDRzeWcXRze3lLNnsVh28/J32jqD19xfVk/toqCdC5ZCzwRdXdj
	T/53rmywi8E53sHN1xb4auVNffhtSUr92ZyyB6ket3nF8uCvvyZFY3TL4R+B9Tb7
	xOG9WP+dbHYa+bc8QM2vy3Q2Qc4n5zn4cvNhNF60efjos8x8bBYDa5YH3FTaPhZr
	dG5Ekw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bd21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 21:11:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so43104385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442686; x=1746047486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7juAG/GkF3du8/wYABYn1XxvOib8H+R8fcCmEsp2kaM=;
        b=TDg+uGNHMRNR/b+Hsri2PhtuMgOZXVyl02o8Dm5hErCPIK8GLoE8u1/LduDCcFOGCL
         U6mXTLU388EpvniGqpqLH8SM1AFpKXHP/FoHLy3oZTwPAEaiUyoQGAEhb+4UAxJ3efhu
         malJP18GwUQuvKas4yI2RcnoZtEJ/2JQz2THPwnCsl9cOmZ0soVUiXcG143ogAdvhBEa
         /Z6t2rekldD2NBubQ1F64Uom4ev2tbLQAb9WJMaDm0lgM1IgjeFh/FVtoI+ExOfvCYgy
         416GC816g3+mtyoWsW/SQhAzsDufoU7Jj/2iH7RQqWFgfuzdKL8evzURKgcc74TJxTzQ
         quHw==
X-Forwarded-Encrypted: i=1; AJvYcCU/DvR0YUOf10gLgqLiC1MWb78nvOmrkwS95VQw7duKs+W6CgRG7NYY7cM/hQoDDBU4ODKeDELUS7iKbd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbaWu13muV6eptf4M1JHW/n+DuItdX28D0LGeuKGNknroFo4o9
	rcrW/vEo/ltrWXKsDII/WuPbbJiggo+3128cbgx7vqut2kbXheCEdRjeVSJhKP6m/pnV1SSC+Sh
	VIlGNNfQ2VJFkobSrdOUUMh9oeYUqTQN5D7xpkvj+3SXoaxXLkItZWphu9Omuo06UNGLsOTQ=
X-Gm-Gg: ASbGncs1hGQIkDrA3h9kDIk4dD1bsAiSYU/S0DbdmfALp0XwVj9RgGxKBBA0rrfuzhU
	UuZZCzj+Z0uXrmoeuYEuZMUqjEqc/h4ex3mvX1h5Jx+inoAlmRWojO9SzEymyzyKWr41a71UOHM
	49Vnr02TzlOo9VaN6BGzJAfFufwd0wkQXO30/q9t+Rk1dHvsXOpEp07lQZWgki7jj3PUFJzO8eJ
	QvhbiGcQOIGWgVOwQmtHn6dvRqDJG+vMqD5e83ZCEgqCcTrU7Rai8gLpTg5m5WneXZsN/TRsRjq
	cOMYs/mU3NnA/ux22GNd/xjj3r2e5OAXP2nHRG4JQ0eWLsmKyh6QrR0k+HN4i64iWnI0V0a9WJ8
	E9qjH1+6ZP3SnkiUzbwIau77L
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c956ea98b4mr47852685a.1.1745442685993;
        Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBiCLzMjle0UO/afRLR2+FdbfmRTBHY4/qAev7T6DsOdXSopPHAINyFixXVJzXLX325cROSg==
X-Received: by 2002:a05:620a:3181:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c956ea98b4mr47850385a.1.1745442685607;
        Wed, 23 Apr 2025 14:11:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:25 +0300
Subject: [PATCH v2 29/33] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-29-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcurOQwmw4mipyLk4xtDigIfZZRv3wsszemX
 9hk31N/tM2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1ataCACp7q5C2z1OKTIZTteRTOMWwwrni7zhoxTCOn6yAO8b5EEyhXosAsxOTWTVc30mVVcdep/
 2vIpet/BP0REXC+2ZMtja6f+BagsNXHyjhCR7hkTZDti+d+ME2kprZUzJkEB0O8Wc1ZvVDPpXlT
 nOGKpWe25Zm0CSa1pLNT3R3tr3CEn6TA5r+1/KbeQMOyN+7BHEOcPl59Knnw6J79hU8H1/myYS2
 X8MaQQzNhWqbewDxhXC8MK1AoY1qUmbY7CsDOzD5aCgvEP9e9ahwcwrb9b0Q75Rq7WKvQ/HOxkZ
 uZIH5aQdmH3Am7P9XclOpul6PuwPWz3R4Bz9L/c3sqXgVyZE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX3AHP80DpH/ZP Lx2DeYfUbeH79v0MG8mrox2dbPH1S7VlkabQNZpU8YRmqJkwue1qYp8muqpBzYZf2VJnhDiqrDt bMzQNFsqI1aLj9D4ckbeG6iThJxLegi/kKVYiuqVK+K6LqaUjGrUZCYSJI3UE3SQgI1xwK1e3pL
 9YXXovuEKMGoWuv2XsxumzXbONTcsnlO4Ov8YWQmhPPfy/gcjwLkrMRs4u/v3e3Z4QdOtPliczn SI6piKerVYyWuRoLTIOc5IEA2u1SzARqocVAXpZABnJAAApvL9rppaTq46JrgUFDVnTaVXqK97W 7F3f4hzNhABFbC3T7vs9iyYM2wQ8OOdRB5oUpX2y9K5T1r3ulo6NuENmBnlYRzhsqLxzommzzbn
 WzttN4SL30fbrxh/BS6EyWqgCwc+UGqUlK7eUyzyHnPQ6HrHsSOHB1cjG5xBJ0BAJSXsH1+F
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6809577f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _7xHSmUrIC2Vdx2hhKTOuyltA_AYaAsB
X-Proofpoint-GUID: _7xHSmUrIC2Vdx2hhKTOuyltA_AYaAsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=914 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
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

