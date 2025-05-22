Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B428C00A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940646; cv=none; b=QA8jqVEWxP82EeO/XLZ9Wxf55nBvLw1m1F9ZhRIBsVNVPRtAiyGjQVFyR6vdmQfDEHCvM5ahOby1m+jvO614ykwefMwFBMP6oPUw9m4Ynl4kMTgZdkACxCq0VvO4dSJ6J6DsrweZ+EQWXMI7RA9AuKWHJwEXVnhx/JWQrp4NTbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940646; c=relaxed/simple;
	bh=BWvuJG5du6uXeVO2i4s5QVwpOOM2vebWTzYrE63jd94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgSMnek1pftkwOKOPH/64lcyR5zrNuCwminfpNyZHHrXg8LeUJPQvem4eWNWZl/N3/LS+U6sdX1gfwXFB2lDjmPyrlAXMSDOlLlr5RpwT56/TU82+LuGhGNnFg25yFsaedRAYALaZPP2pjmME+BmdvdybjQo+RWuvGV+aEPRLUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhpLG+sq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhpLG+sq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIMSaw029233
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=; b=KhpLG+sqWiXdcRLC
	BWyw2duimxDxkvLngJpTkpPY/00G1Wg9QUTYOT4JgSn8PuRUl8i0VwbnBVX0Abeu
	95MCov5VQ2xoH997/J/6O4Y+ZK+X27769+ZYtwFZ3SRA2IAQgAtz38TIwFRLfIMK
	pcfKyxThBe/cpR6h8vGrE88eAyYNhVQuBaYm5IJmMCEYT3fJMiF3uZ2Zyjj0/0K9
	4eMPckThdV0Nbc/l1o4tLlkY/Fa34+ci7Uc8dM2gZBJHwVO6nYp8DYO/tBdTwMIa
	K3zP3LnByqwPNpN9nJytwAbZesjgGc/B5CS9JeMsALr0ftkQToaxNIPlFzxIPV7U
	TRAPCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb7b55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so849416985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940643; x=1748545443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=;
        b=oWz8+zowGUAO7O9Q9Ba3pV9k1P7kLZIFe7120mjXMBVL1c7icv4Cb3pITbfZR2o9YC
         TqrYKY7E8RwXcepMm6b5lUtZEn/YiHdMipJhl9eVlhnyBZ28/qLggPDbCuN7FKEnjh47
         ips7Dyoq8c6JI/GRoZR02X3BVHaS9RuOb4OKZf823xdui2jq+OKc9ZUo2Cov9H/QQSbb
         GNWB3/aMBoxe+eo4IP13pLa1GRXfbT+siiFZ4vKL7f30WXnygt6dDXr1Epthg8IIe5Li
         v8c4dWlco7tsCysduKkAZiqbqiShTcsdrfm/V5U/94gfqWlE/BZ0Zd47po7L6apaBVwN
         yr0w==
X-Forwarded-Encrypted: i=1; AJvYcCV2kinqSgoAcIyjIKz0wJKz1coue3/RYf2aJuRqdKk+Z84Eh3BuBJZNgIHXR0SlSiPT8sxbU/1LZUeWDUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9R/RKOH0maqUvQIxh6u62fVcG3P9OD+8pHt4k1Jh4f6C8t/j
	iMWYQCZjxIOGCEp/fK2Ymv+oNoT9kuSMT4gCzL7BjMyP+cfQPBnlaFOb2+8LchcpBDpUJVKIMEH
	e62q4V8sF++oXyF7YgMu61jlO6Dww3p88lUSt1VG7s5Iyby2I89BUa5A5LUcFdL6D5v8=
X-Gm-Gg: ASbGncsA5qnY+s8m4hHpPCWifzAhKjpPykTorpjgFSR9aCY/PB3Km2381tUPnpZosOp
	jU8sAn7W0stYUEPZtn5olfrFKfjDi3/WaF4egBFrB8T8xNNcFM3t41mfTKaaR0OemUtJvPUaRid
	tiC1B42eWA65Yoyc+dldEq8ATvpRiDEQPum2JpiX8NIB9fUxJ5sHnYhWb6+YMTgPyCYDRSNMVM2
	t57TSuM8nt0sDUrdHCic1B4lhKRg+Px/sDeLT+uFE+jl+ne5k16hzkMvZtHIGiHMfn8VLg5YUzK
	I/vPTkcAnwRpTSFMrUxeXOw+VGct1JZcLrBk5ZEhgA6uUEKfRU3bcDKJKjdkHBHaSwTBRiRHHkY
	kjf6WET9zra8zX+ZTRIx4McZB
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cee326c929mr6911185a.45.1747940642873;
        Thu, 22 May 2025 12:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzxquIY8HhNhqWCNPDmBe+j5FWdsACOdAapT72f/I0iKVGXenxbZCexTv1LjK3ndZUkz5kFw==
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id af79cd13be357-7cee326c929mr6906585a.45.1747940642445;
        Thu, 22 May 2025 12:04:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:30 +0300
Subject: [PATCH v5 11/30] drm/msm/dpu: get rid of
 DPU_CTL_DSPP_SUB_BLOCK_FLUSH
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-11-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R2pfqwbiufRy26Qr61RXns309s3JHy9UAH0Tqdyv7QE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T95UgV39T4ep2h1SCm0PcapDyxtsT11KWVj
 05MDktyaQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/QAKCRCLPIo+Aiko
 1cgdCACccb8v+ZZmGPkgp6/u9+Y0q/lteJhu/gtu0N1swCzsf6TSIejBwxhN3hXB0QniQYc01ii
 olrJpEPhQMDysiBdkPLX4+xicK3NOFy5Fgw+HGLgxKfN4/4dYS6/OWqYcfBC5d0N/fGZ9mtqlBF
 CztSUKRQLC3wh7bkEjiPAcQwPn6N5Pcne2BobCrW7haNU4Fm3I2UMyoJ6l+N3gmED/NcyvjDQxj
 +mTdZnPle9yLLA9OII/QQGYyQ+rFKIZtNRxjs82zYbw0xFY5Yvkahq/OHH4M8ILYzdWcMMd6GTI
 zSCNJoTeh3AGRv5yiP/Q5A6tuXgQahGdG6LbOsOoAjpugz3O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: oIjqU4tUQmpoInw6oHG1IhBl8enKqlpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX909vnBnFCfH8
 f4jlrQJ9KL68deHLf2hq1WY/eV2+dS9nqTV3qGFQWnJ2T1EqyCelIoOnHaat1LXxT47nncRf3z7
 BlIgYKZhQ63pLBvj++AHw4OE8/GbQx+HMD1/j9Tyerb/ERNlb4lAn84Q9OR89fs5uvcaTNhyK58
 vps7JojEyr5Y/xLugHXH/bm5IzsCw+8CZJhuPbNFOGao9AvJLP4VC6ChYCLaQk40FtOf/vwt2db
 YhnIzB1EfMRhtW+tIE+OGrH1lplnAx++5da30Q70bTk3asIP+Y79IyPMMnhPxEQ8K7b5eJNvpxX
 KCNbov+SnlaTFWnecFN10gr6InKfm1rch7ouMRg3PBx9v0cT52vxub/7pQW3AubcuhPMWSnL/ch
 g7GS65S6K3BF38RCduvUV/IplLcNvhRdOgVXwQ64ugnzvD3t1mXDhd1GUM097cZ/GC9+SQZF
X-Proofpoint-GUID: oIjqU4tUQmpoInw6oHG1IhBl8enKqlpO
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f7523 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

