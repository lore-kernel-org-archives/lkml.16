Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2724BBFB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487092; cv=none; b=n7IbN/cDMk+YEpnP1T/NYCUhZD6cFqdpFVLSeoZDE+7sRwr5f49YZ69e5mfQaQj2EoyipLDksJzKYxTA1NxIh305UcbS8Y0r70rz4eteaGDaqgvFV4qHMIoB+BjmnUzU9ZvQ1MTyCFzdZQH0H8L4CPad9xXiQ9NN/yueP8F5+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487092; c=relaxed/simple;
	bh=AjcvQllrIh4quDsFspgBgzLS6C+y1YZ2zRiCyO8balc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLNOblScKtIZhBC78SONMSQbKpeEEF2yi8+p6o/9maakr7oPI5VhkU6RnZ9GUKMRovOXJYUhwTFJMxbaL0HtautKUfSBEUu1WM7c8M2j/aB1yddGQKU8Y4OQciHUyQqb8S77XDajg/j6liiDSF1JoKei4BudY6D5S9+xoj8YMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AScjUmbi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AScjUmbi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAr3011396
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3QdS/mgfbkHzv27vUQzt/gfZz34xx6kcnCGBXLlcq8=; b=AScjUmbin9KJQQDc
	1KQAoptXaFj3JyzeVI08B83pzvov3m1qqdJVi8RnVB1XRU+PGKbwEsHCFfEmTJRz
	jP5MtUWinW/GIMGX0wxswsOjNs5nekpEf+smoRNF3mLzfuPJFkCNvOsEjviCYTtB
	Kbphn3ly+97bNYytqlHaV2HcjBDCdN2bVRbJ2bO1Mh9TB+h3/xlbs0nHJ7u3axqw
	sjMKSjH270rzLo8iWkQzHJy1HWkoGn6L1UFsCZQju6pNNGMaVGizKY3hC9o4DNFC
	mI9NX0NCDRATFZCqrFRvM+XduKJQNwr7rMaS+O53Y4AN3CbPLZluVHgN3hYHSfZZ
	JR2W0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh250jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0b0cf53f3so116383785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487088; x=1746091888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3QdS/mgfbkHzv27vUQzt/gfZz34xx6kcnCGBXLlcq8=;
        b=as6QsDsxpFst93R+EMAxWpECk8Ga7vnHaRZQ31Pcl1z81r6i3kL4b8H3NEHq9hTTzB
         HmfxQqVv+JvWSk/3xRKwfqz/E8IPBWzTeLYDsuz5ycvYbtObV0t/i2Jl1n2RFLfKezWi
         I1ne3W0kCI4jKcoeuSaZomhiwL5JjTv0gqn3X5xC4mQt0vCv4gl8MIFI4cLt1dRypx50
         VHbyTdVwpI0/4jTVtdTB1VhlZlYSOBGaq9sRairgB+amfDCrGleBv4HECSHjHoZOFeSp
         BLrFTFzCOsRZ23fVnasJgcqTLFvRdFi/NKUigBJ1kaiLZ5a9uMmoT5vd/61VQgXZG5Ds
         xIgw==
X-Forwarded-Encrypted: i=1; AJvYcCWfe89uVlvCsbCdCQPgGud9Er4/Vhqx2hPBpSpUrNoYMLpWWvns1gHTDxFnKHheZRE2iHJPuAwx1kOGMJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAFEN6UGyK0gLgICMMgbqIgKRSV6RU46L6CKLU829UDWl445r
	FZxEO4BWGaRMwC4SloB2waD67YXFCQ2V0D7Mpd9leJbqHKnPjHA7q8iD8BLgOCbzotiTELY+m+c
	tcu71KC+uTri6kaUjW3lWgmv31tl5GXB7z1t9A+ENrW99QfGT3/yZnBzeoljUgG8=
X-Gm-Gg: ASbGnct0MQwbcjWjjhYGAdAi8qGtl3LzErOK2ogBm15Kyio5p+V16A3Du+M4b2UjI+R
	j+bzyMSl4wuDqm4I5jt9vF5u2hAxxpGZKwao30CNELyyvuPTE7TR996Ond2xVR3/mDt7fUADk/6
	mzDZ/g19jn8HcIqMI2br6wmAu0Vmno5KT3QvwnDjoVN/2/JxhPASetE7kP3PgnHzw5xzPO0cO/f
	jjJmg98p9ZAx+MUosUulKNpRC0RTeQPG3/naAcwmzcgl64Gfyq1dBmLt8Ztc3+wCEiH0Cq6zf1a
	8eDmD1vWxANXJySOJO4OX2JtVJobk0FNUf8OM7NYuHRT7MCSVM71b0FOCM6WdNzSXyjq5KvEX47
	w3sMDrEkdnXZ046VX77SnjdD4
X-Received: by 2002:a05:620a:4455:b0:7c5:43c2:a8f4 with SMTP id af79cd13be357-7c956e7bcb0mr273118285a.12.1745487088407;
        Thu, 24 Apr 2025 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfuf4FFckbyK0jjA6wEHiIn51l5ZbmFFhKBBP6oaOf88hXR85UcIIw+FLmcHn9+XNlZwAObA==
X-Received: by 2002:a05:620a:4455:b0:7c5:43c2:a8f4 with SMTP id af79cd13be357-7c956e7bcb0mr273115685a.12.1745487088047;
        Thu, 24 Apr 2025 02:31:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:37 +0300
Subject: [PATCH v3 33/33] drm/msm/dpu: move features out of the
 DPU_HW_BLK_INFO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-33-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8tb1+qRLI7JpcBUvNssngnuycT2/Ign7Y6I5ypwrc4k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSxxJHeC0gbaX0jMUzUxmcs0JidF+LOKmHLq
 lpx9JT6TY+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsQAKCRCLPIo+Aiko
 1TOHB/9UgvUFqig1fgEqOHhS5Hl70Eyp+Meb0RDrRiiNM3Is7O7DyDPoMJd/A/P2C9Ct8vUrgYb
 hQd3qrXICxYvUKdU7Wc1pjOSi7h0PXoCYy4ykfPWIdzZUJd9X718yYv3lBrRxiYGISVGAnHif8k
 tdUA1sh3OFGioW1X15bxH+XkvrQ6RezqU7SnyNxupwjMcgw9jR8K+9tH67UP52tVAGWW3gui9Dd
 LkyLLH7TiNrrvpxRWY3/rGsFZ64tGS7qjGnviaXfPO9p6PimFHdjYOw691qqD2cYbq6YlkFUoX/
 fEBG0ssMkrt6hrSQdb0A+1GLdXmVbrMy5AXP8DcTaM195jTU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680a04f1 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cFriiCX7-o5b7acnli0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: nP7xBNaNmKNJ-JdLrL-aL-9cXzEzwzoB
X-Proofpoint-ORIG-GUID: nP7xBNaNmKNJ-JdLrL-aL-9cXzEzwzoB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX1e3ABlCjx2JM ubK47f9v7IWQI/90kepsuEoLOIP6Pfq/8NDPNf+kyYfZXcx0wjw5NNt1yIbfmFqtbRTAomSPtPg nu4nJTsYfv+Oewd5lL561C2Dpr93sP9k//c3Ds5e1Ai57W+HkVFnZgdXAhNagLkVcCfprPflr8k
 LTtfy99aTWT7KTXEvTzcq9+fqndDkRwiTbtr4O8Ks9sjGJM/r2tbhs3WumxPymr1yD8SRd24ufO 9JNddedfxDWQKZKQ+lbp/hCWzkBDlDnUHv4EsmamUgiEKURwau127hWpMnWpppvGW0I810dkQjW fLI9SZc9dqK6E9PkR8YIFTAJIVrElAfKb6e8rPTYId43EVny/p8zfMvUnpben7w+CpJT9vfy98i
 FDqCdjEJLqsdvoNg7BiSCgjnQ6uOLjQ7Ja7aMvfrbBUhNHZ2HaExoaj+TTWnf0SVQXGLXUBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Only SSPP, WB and VBIF still have feature bits remaining, all other
hardware blocks don't have feature bits anymore. Remove the 'features'
from the DPU_HW_BLK_INFO so that it doesn't get included into hw info
structures by default and only include it when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h         | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c         |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c             |  4 ++--
 6 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index a065f102ce592311376f1186add7a47dca7fd84f..26883f6b66b3e506d14eeb1c0bd64f556d19fef8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sm6150_dpu_caps = {
 static const struct dpu_mdp_cfg sm6150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 8c909c41b48a18fdc54753c68bc2ad19001cd3b4..1884371736bfcf78a99661baedadc0450bb4376e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sm6125_dpu_caps = {
 static const struct dpu_mdp_cfg sm6125_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = 0,
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ffc54f77fe5c8883e926e0c63825c9424904cf2d..f5ce35cd966459f0edf2dbdd2dbc2693779fac73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -124,14 +124,12 @@ enum {
  * @id:                enum identifying this block
  * @base:              register base offset to mdss
  * @len:               length of hardware block
- * @features           bit mask identifying sub-blocks/features
  */
 #define DPU_HW_BLK_INFO \
 	char name[DPU_HW_BLK_NAME_LEN]; \
 	u32 id; \
 	u32 base; \
-	u32 len; \
-	unsigned long features
+	u32 len
 
 /**
  * struct dpu_scaler_blk: Scaler information
@@ -348,7 +346,6 @@ struct dpu_clk_ctrl_reg {
 /* struct dpu_mdp_cfg : MDP TOP-BLK instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
- * @features           bit mask identifying sub-blocks/features
  * @clk_ctrls          clock control register definition
  */
 struct dpu_mdp_cfg {
@@ -359,7 +356,6 @@ struct dpu_mdp_cfg {
 /* struct dpu_ctl_cfg : MDP CTL instance info
  * @id:                index identifying this block
  * @base:              register base offset to mdss
- * @features           bit mask identifying sub-blocks/features
  * @intr_start:        interrupt index for CTL_START
  * @has_split_display:	CTL supports video mode split display
  */
@@ -381,6 +377,7 @@ struct dpu_ctl_cfg {
  */
 struct dpu_sspp_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	const struct dpu_sspp_sub_blks *sblk;
 	u32 xin_id;
 	enum dpu_clk_ctrl_type clk_ctrl;
@@ -391,7 +388,6 @@ struct dpu_sspp_cfg {
  * struct dpu_lm_cfg - information of layer mixer blocks
  * @id:                index identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @sblk:              LM Sub-blocks information
  * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
  * @lm_pair:           ID of LM that can be controlled by same CTL
@@ -410,7 +406,6 @@ struct dpu_lm_cfg {
  * struct dpu_dspp_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  *                     supported by this block
  * @sblk               sub-blocks information
  */
@@ -423,7 +418,6 @@ struct dpu_dspp_cfg  {
  * struct dpu_pingpong_cfg - information of PING-PONG blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @intr_done:         index for PINGPONG done interrupt
  * @intr_rdptr:        index for PINGPONG readpointer done interrupt
  * @sblk               sub-blocks information
@@ -440,8 +434,6 @@ struct dpu_pingpong_cfg  {
  * struct dpu_merge_3d_cfg - information of DSPP blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
- *                     supported by this block
  * @sblk               sub-blocks information
  */
 struct dpu_merge_3d_cfg  {
@@ -454,7 +446,6 @@ struct dpu_merge_3d_cfg  {
  * @id                 enum identifying this block
  * @base               register offset of this block
  * @len:               length of hardware block
- * @features           bit mask identifying sub-blocks/features
  * @sblk:              sub-blocks information
  * @have_native_42x:	Supports NATIVE_422 and NATIVE_420 encoding
  */
@@ -468,7 +459,6 @@ struct dpu_dsc_cfg {
  * struct dpu_intf_cfg - information of timing engine blocks
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  * @type:              Interface type(DSI, DP, HDMI)
  * @controller_id:     Controller Instance ID in case of multiple of intf type
  * @prog_fetch_lines_worst_case	Worst case latency num lines needed to prefetch
@@ -499,6 +489,7 @@ struct dpu_intf_cfg  {
  */
 struct dpu_wb_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u8 vbif_idx;
 	u32 maxlinewidth;
 	u32 xin_id;
@@ -567,6 +558,7 @@ struct dpu_vbif_qos_tbl {
  */
 struct dpu_vbif_cfg {
 	DPU_HW_BLK_INFO;
+	unsigned long features;
 	u32 default_ot_rd_limit;
 	u32 default_ot_wr_limit;
 	u32 xin_halt_timeout;
@@ -584,7 +576,6 @@ struct dpu_vbif_cfg {
  * @name               string name for debug purposes
  * @id                 enum identifying this block
  * @base               register offset of this block
- * @features           bit mask identifying sub-blocks/features
  */
 struct dpu_cdm_cfg {
 	DPU_HW_BLK_INFO;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
index 42b4a5dbc2442ae0f2adab80a5a3df96b35e62b0..df6e43672422f1d796e38c32256582900f58523e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
@@ -360,8 +360,7 @@ static void dpu_hw_dsc_bind_pingpong_blk_1_2(struct dpu_hw_dsc *hw_dsc,
 	DPU_REG_WRITE(hw, sblk->ctl.base + DSC_CTL, mux_cfg);
 }
 
-static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops,
-			       const unsigned long features)
+static void _setup_dcs_ops_1_2(struct dpu_hw_dsc_ops *ops)
 {
 	ops->dsc_disable = dpu_hw_dsc_disable_1_2;
 	ops->dsc_config = dpu_hw_dsc_config_1_2;
@@ -391,7 +390,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dcs_ops_1_2(&c->ops, c->caps->features);
+	_setup_dcs_ops_1_2(&c->ops);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 0b3325f9c8705999e1003e5c88872562e880229b..83b1dbecddd2b30402f47155fa2f9a148ead02c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -33,8 +33,7 @@ static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 	}
 }
 
-static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
-				unsigned long features)
+static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c)
 {
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
@@ -62,7 +61,7 @@ struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_merge_3d_ops(c, c->caps->features);
+	_setup_merge_3d_ops(c);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 5c811f0142d5e2a012d7e9b3a918818f22ec11cf..96dc10589bee6cf144eabaecf9f8ec5777431ac3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -264,7 +264,7 @@ static void dpu_hw_dp_phy_intf_sel(struct dpu_hw_mdp *mdp,
 }
 
 static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
+			   const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
@@ -313,7 +313,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
 	 * Assign ops
 	 */
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features, mdss_rev);
+	_setup_mdp_ops(&mdp->ops, mdss_rev);
 
 	return mdp;
 }

-- 
2.39.5

