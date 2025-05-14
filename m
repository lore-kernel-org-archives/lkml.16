Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E332222A0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266766; cv=none; b=UKsUuhIKP52vJWB9cAvdpr0VeRe/hZFc7fnjs70Ovay0rDhxwm2En8/FrLcXOy8tAeX29Bc1rWyxgZY2ZLAiJ1zzVdsd008D0dm8brp/o2r7QHjbMO/XIJVR1/3m2WktDCdyoZy7Mibk8qs8QKmBIBHVv20Fm2fQH0oA9ZcW3io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266766; c=relaxed/simple;
	bh=BsgyS5TVX9bNk5OPlLRIxhQvZxWCd+vRbBAP94yBF6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QU3ZokFwrwDDaY27Y65x2TU09w1r6OAyCtTwMpNTwIAsDBSRTFowybENEOU5CILMl1MJvwbn8aMdboAO2e6VMMFbwWQ8gUzyvtBHtws4/gJ616Bpc6+hGsClHlfnhKZkEIrrhgo4hUZHZ4+RRlNaK5eBApkXgl5aVtqiqNQXfPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvP18TXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvP18TXu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKvKDU030349
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuBzJCBuNWzefLz6iW0PPRQ/pOOPIkBFXN2o8I++3E0=; b=UvP18TXuamuHvsm7
	rMy5HDcseGPiLDpmYlQORzLqSuBjYh/ixymmiEMpZYocBMDldUbTgurBpviWIb7i
	+3kZyYkDPzhgLR5qKGwS+wc7P0YRNfrUaa3dtHeFbky4ngVMrPbkalE5Qv+yBeeV
	bSabPoqRCNdXtrOLyuARlgOAecdAAFDIyHcG8eBYopRwfSqkRqd4/LRhF2jSQKVM
	64fvYe8iXnzFexbfp9EIFB84i49QkXiXC1Rwmt999zQxyXZzaZ30bPlAvUfcX6Gu
	QV+efMPOvt+mh9sCeuBpn9yF3uz9CiXnGVVPYc6KD/W2aZ4Q9qhLNQI3HDeDHWio
	VZ1rsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnvctn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:52:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e816139b8so2648395ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266763; x=1747871563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuBzJCBuNWzefLz6iW0PPRQ/pOOPIkBFXN2o8I++3E0=;
        b=VssEOT6sKSauaBoheoFl9ktdTenQ8WGve6VI53+pcGl1m/CAC4RqdUXh1XGtcoYnTO
         kYwLbusgbobQoD7SGhIp2mXfHhKELCo5adPbCui7BqEvZK69umdLhSDAQtuWXrIIDtXR
         ux/HfviFvJ1vNjFoFIrybqr72H1wYGm7SpwKpZGi7dOJnPXfrbwa47ZHmNoQg8cDHXFa
         6OekK2Y0G1DD61oCHsYHPLwNglHQDZWMsTXnE7uLIjwky18DnMJNy7e6vb/DVcIFo1Np
         hhviOO07m68tYkiZmQ8V5r1V2SLZcQPzP6Yvhxx/+DnN4mRL4g2RLZgzAvoV7mCr2C6i
         3GEg==
X-Forwarded-Encrypted: i=1; AJvYcCW+N8YCa48QMe2u3Y+HwWsfuhuu5G7/7LKMg/c7Q2Izov9mHftdLZxko2REgbEhtck/4ZCfxnh/YnszQxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7JagmE7mzMSNJ3QtUxvGCNXQz8KWVnoqEL20tVlYVuMi8xtQP
	ugePIWjbB2Kl+QILcINkX067fgNly8IP/h5ggUOe6sD2FGVOM7QneD8CeRgKkdwQmJZ1Q+ssYXj
	z+PH4EMd3OH2wKO8cmIey1F5KnAY/yjAuhKuyl8oXSoww+ihP5Pq5+3M+30xbfPNRqGIykmc=
X-Gm-Gg: ASbGnctjClCmh/qlF4+9KF+st3paZ6gfGwQ2HH26O2O15toyilc8QljjDQpTW8aLjNO
	KEUOfpmkXxTWWmudyZbcsZpecpevB6WrpV0KU/MFtI6pWGS12csfL5jqna+JPaJWl8Bly/wdl36
	bbirzpwJ1XjTYr90DrM8AB2EAQXLJI1RLs3Eq5NGqyeluvjvZcLhry0A3zp120TAnzfSSg2iyVT
	6WQgebzYEP7C/JwGbHe/mcPZfRjHfaluY+boN3K0IN6Z0Sc9IzI7z5Dos8xgPUffmFgjYnT1tkI
	KpftswoMNPa62M05rNBQawpo4puJZxLne8xB5T5A5uTYHX98ns+xgX3OaJFeYxlDzrjxeZDF
X-Received: by 2002:a17:903:2443:b0:223:2630:6b82 with SMTP id d9443c01a7336-231981058d0mr88360295ad.10.1747266762973;
        Wed, 14 May 2025 16:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhWKAog4NA4K76orc9FFW6gSJW+dnOTRSdWtcPrFRPKjWtNX9etR1Q3S0r4hzqbzyGJBHhvA==
X-Received: by 2002:a17:903:2443:b0:223:2630:6b82 with SMTP id d9443c01a7336-231981058d0mr88359935ad.10.1747266762585;
        Wed, 14 May 2025 16:52:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:42 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:29 -0700
Subject: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2434;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=BsgyS5TVX9bNk5OPlLRIxhQvZxWCd+vRbBAP94yBF6U=;
 b=+Hs/R20Lqd8VjpMZfSaRGzJzzDWiDQddM0F7j5Y2CU07J0IGS2UuXDWrTeLdD0J1T9Z0Tx08T
 cDWAJOqXSD/DQSjH7PLwlw1YvoAZkYmlZNsB+9v5lyJ1pArXfo4dLz/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: i4fQwX9FP9DM3i23EcK2QuM-vaVTdE6N
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68252ccb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s8xGxOBDnglVIm_wuFwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX21L23/07wO0N
 +H3j+RCxmJ2lH1a2LZVdfbekD6ABafm0pJ5lL+6nTdORjVljNJuaqh6ogWJXSKkk5FUQZNDS/zT
 v4YLmsdoV3u+LxZoB89rf3oRBEq/ft5lLekuWT6zZalQL6jcgc4HEl/1MJhCHEVWbP41wVzvjUs
 qtp+o/8pWE7mKQKa9ZGyxuFpw8BUAK5dupCwB8vi3BRhnnBRuSytwxNUy4Hc3q6B6kvj+0M977c
 SksQKShm4qFTjC9loXlJqFwsMPDEdNBoN4Ex6fDI8LLFgWjBGjWZ6HymY3VMmbEyZGz0e5RrlKn
 cOEtSV2qBQyKZ+TaR8Ch+6YxxSoZL6i5D2obREYv5Pd6fW7Kwm8C/rIR0rTlFps77sVaGb5iYKH
 kKQ7G8tNtD1m6K1ATjNwASeQ3++R4cESfivxWbZVhhwc5STN0vegUrD0x99OY6EhOmlYDbop
X-Proofpoint-GUID: i4fQwX9FP9DM3i23EcK2QuM-vaVTdE6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=978 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140222

Drop the unused maxwidth field from the dpu_lm_sub_blks struct

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a..65f3ebd86270 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -379,7 +379,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 /* MSM8998 */
 
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x50, 0x80, 0xb0, 0x230,
@@ -390,7 +389,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 /* SDM845 */
 
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68, 0x80, 0x98,
@@ -401,7 +399,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 /* SC7180 */
 
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68, 0x80, 0x98, 0xb0
@@ -411,7 +408,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a203..5f1f3eae0f6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -390,7 +390,6 @@ struct dpu_sspp_sub_blks {
  * @blendstage_base:        Blend-stage register base offset
  */
 struct dpu_lm_sub_blks {
-	u32 maxwidth;
 	u32 maxblendstages;
 	u32 blendstage_base[MAX_BLOCKS];
 };

-- 
2.49.0

