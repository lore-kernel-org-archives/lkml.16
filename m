Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60EB221266
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610556; cv=none; b=SS2gEauIxYo4JgFWMfvn08NdppSs3iFOOXTTsDOdKqyiQZNu7cqw4H+pe1qvOBSMnoaosuH+RYm02Mp2KBc9gUct28umhvMUrDtkheDrvX/6WCEe/GcXrK+6Fxve78W/TyuTFwApIwn62LeI4wxRwszBYeuu7s4OhQIRgQFjlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610556; c=relaxed/simple;
	bh=xiXYEHCnpydgNxOjmQEiL855gJzsxvVYn2BH/KS7CTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PPQ2J4CQR2+Y3gXOrG8x+gUKA1T5tyqKrWLYzxMpO0osj7THBcDiZqHcw2VLQh9lqbXFKFuTnek7XXGXfeb3MH6/LmzHH8Dp8xI4cdAN4oI9cYfK5759p2jsPYSMIt/aYZW/Knj3kmj251fqtmXtGO2JbOFnVpLPe6UN63aR1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZvvYB8i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZvvYB8i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtdO001325
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QVF8qBKl2B8UgSSWNGQxTY
	skqSEtcYIfpjzN6wFXrIk=; b=SZvvYB8iEz3In35Ka6cSz6aCwXIGmYgn/avNAw
	9nINTBGkTIT38+rOhBV5VJ+Eb0W+B3Zk9HtH7WSDyCckfs6BOWRhJSZzi2jxVAR3
	H44LaTmGwtq0Jf6IoV+LIK/rZKvbjQkOvdfJX+hp+BNyRSg0EE0qTBx/aZqz1+eA
	bFIQxn4glIU8y+r4ocjDtBzmGC4hkegsPbUvsKymXpx/u0hMKMV1oAHuHNVt+16U
	4FKqOWR6rLN72cSUTQvrKvUVAin5TROHsZK8hIAb9I1H5DakjrkYMnu4yb6kzKdK
	f+aB/vMJZ6/X/2OvPXElqA3B3JFOZ9QPPPUtcq/V7V8uX43g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j5s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:49:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae87b5182so46085531cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610552; x=1746215352;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVF8qBKl2B8UgSSWNGQxTYskqSEtcYIfpjzN6wFXrIk=;
        b=D/jwS3qMueiStGTYoLPmuOoUjTIKZ4YHYc7SVvBKfkwoN3zwD5qorGvB8VzFdP+z5F
         GFEpi0vyC0JewmsLkzSk8TvRubXJzRl6ho++PcznPKHPdxygevUgzsyUo8sakV2EhyU/
         e3Bjqpsi+Rv8LZH5T7SzgcjJpmE8iFAqaIZgpEV3EkjDyJws5Kv05yGsbYG8tJqYFcUN
         mPZiI1X3IS/FmZ+BAvx4YrjRGUc9AcUKsYAlfkfQe0uNNaWdI5FB3rwAu2g+uYEet2Vz
         ZxNthUYthASeEAM4pYhonEwO1tADrm+h7gMusouiP1TN7eh4LHp3isY7qRBLlLYWwBuK
         7kuA==
X-Forwarded-Encrypted: i=1; AJvYcCVbXQhnTlr533Y2sDVP6+asQpU7rqoHJzoqTodYH6vX3LEb58BlDsid1ZGDbUWPJvYR6qrOhcfYmaIy1uI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DcaK5LRZ9Lgezhd5WOR3Bw9yVYdYIaLxPGIR63OZg25JcqsO
	ABVulEEp5YH+QHCtCCvMGVp7+Rzerbm5DKOsDdxXC8PuFhGnp+JOjiftt8nz6jsSZ9KnA7r8ys1
	Hf/EmI/B7vzeJoI6l8Ou3S70+Ly3f3tBDslw//FsD2gPIqDhNMnv37myhAu4Y9PAefGVmrVU=
X-Gm-Gg: ASbGnct02THWDJotCYIpJx5e1TQ5ftp7T9HlfXd3jUKbmAL5xRsC+BlCeCBJwAKCgjV
	sp6xkbPGO1e73I2pqJ7W6GRf1eSmmfszSrDBqGCBC9PMD9iswfpsqFMDdedaCFjFPX0W5EOrXW8
	lENn1DcTzfv7tqqp31KwZp1t2GFQEY0fuJdIdkTlUr1dIIOPS/f5YDyFe+eWPLANibmrI4n0fTp
	3BI25F7Yd3mPDVM8fy2kHfE9I1+aIABdtSmMCIolhGahRB6AzAWhOJdUdXEoaBQ9mlMYVW9oHeb
	adqzi/sCUVKc76LMGbgx+IeLlhnuVljMlKNebRUpmDHDMt15JpwMC1SRa7itvtAaGKfg1/1xfmh
	+ZJXLdnpJU/njhZAuZezPNnwT
X-Received: by 2002:a05:622a:1886:b0:477:1161:2361 with SMTP id d75a77b69052e-4801ca7cde2mr53690861cf.16.1745610552049;
        Fri, 25 Apr 2025 12:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGe12+bSLXzF7eqw872nV8cM5KVYfx4GqOPCVUm/H+/NHn2EpcmQOmblco4sM1BMKL0eK7+Q==
X-Received: by 2002:a05:622a:1886:b0:477:1161:2361 with SMTP id d75a77b69052e-4801ca7cde2mr53690541cf.16.1745610551638;
        Fri, 25 Apr 2025 12:49:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Fri, 25 Apr 2025 22:49:07 +0300
Message-Id: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADPnC2gC/32OQQ6CMBBFr0Jm7WgLkhhW3sOwKDDFCUJxWhBDu
 LsV9y7f5M/7fwVPwuShSFYQmtmzGyKkhwTquxlaQm4iQ6rSXGXqgs04odDLSYczt9gb33msG7L
 Knm1WUQ3xdRSyvOzaW/ljoecU7eF3hMp4wtr1PYciGWgJp2gKJPCN39kHJ+991Kz3/P/+WaNCq
 6u80UobUtX1wYMRd3TSQrlt2we5zp1n6AAAAA==
X-Change-ID: 20250308-dpu-rework-vig-masks-cdef0f4f3bec
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2018;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xiXYEHCnpydgNxOjmQEiL855gJzsxvVYn2BH/KS7CTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c17deoKA0iAJh/+DZAGse+ko22l2hMwtKUq
 xGp25hijyKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNQAKCRCLPIo+Aiko
 1UybB/4pmAg7PHT7ety/HAwm+pTqqAj6iNMngLsn/aKcZ6g8ABF6CUMcSWWV3FqQIqKNhoK6w/a
 NUg+RnoDADw9qYjLZL9srANPWDU1PbB44qt7gWXaAT36ZQ2WZg02RreScinr8EzwscjEGg3pO42
 yWCg3MFuVF7dDxE2HfSpiBoUS1TXmw3S8x7+DQdyzTbGPUg5yPtpNvBXJT9UPOl08ClHReHtFcR
 S2LvFKKpxQqYMnrR/pbrgV3PTYGYaXBkd1/8DSd1hwWtoeEGeCHGLLgplLCkmbaNuDR7WTVY8Gj
 MUBD0WOWKWPdRGO503yxxM9P2bxiMH00obD0KuPwZmvluGuG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX95oe5dZ5X3ae kCUVVJqqsKOuGevqwGFSsxQi5tf9a7ZWy+akdqgVBK2AaEkU9qxg2tpivKzMCukfjVrQ3OF8FtP 7taGTBE/MPcO7FFDAd81C/oomBZbitSyCa7IQ2dtBtMwm37SA06IzMIBdIHiKfo67aZinMFWKFM
 VpFNZtItc+EVja1TKOpfpzgCkCcv9RxLbaVDT/uatKg9PAJJ1pvhBz2ps+xPsUBDiVeqjXl/5yq 8zYFP+UNjod2GenmsPh57t78sJsRtyY2zMwN8tMs6MzYsBbhj70ARRpcRe096YPwW6xdRcgHV3Y e7dTbmYLbxrAJe4LHVgVIedQCYeJ6DvCIEKflyD084BDuZGFJLQJLD71jhK9/oSF2IVmcMpwHRC
 ouoI/2xMcjp/AMSgdTMckOfDg2DVPTBsyBEMtxVrWfpFjYnPNfSG9w8xGvoLgsy3UzrVu5Rk
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680be73a cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uRdDJePGNZSGe7RuJwkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xOg8RN-9F0BwI1494G8iy4xSue5cY7w8
X-Proofpoint-GUID: xOg8RN-9F0BwI1494G8iy4xSue5cY7w8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=888 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage).

Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
SSPP feature masks to make it more explicit that using non-SmartDMA
masks should not be an exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Reset Abhinav's authorshiop onto patches 3,4 (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: enable SmartDMA on SM8150
      drm/msm/dpu: enable SmartDMA on SC8180X
      drm/msm/dpu: enable SmartDMA on SC8280XP
      drm/msm/dpu: enable SmartDMA on SM8550
      drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 10 +++++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  6 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  8 ++++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 16 ++++++++--------
 12 files changed, 63 insertions(+), 63 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250308-dpu-rework-vig-masks-cdef0f4f3bec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

