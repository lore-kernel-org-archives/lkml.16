Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21EE236453
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487067; cv=none; b=tmY3nQmFET4wM2T0vg9//ZPHCuQ/Vsz7hDJx4YjMbpkgRPpnv8Eqkyj/bJs/+IUjrUsnpWu9c7FnFkZmJzwZCavhlbtlDCBPmSq7JTt9LPfb/Lybjh/Kb40jSYutE/3ljeE1ZfVxbCFexY5jRcM10fMqV+hj+tiU2W/AMS7wDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487067; c=relaxed/simple;
	bh=FxB+CA1pAHMQ58/QY5AJKV5ZEY88tJNa8wr7RUKfjKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpjjGsPndA3befYZVY5WPgp3nNuucfnbOgcKOSyLcd8d/Ixn8BBmDzdzIi8NxL/xduu6CkMfCRsb9c1KvDFB9rWGXbDzN9lxJhPtII1oPSoWAtcPJJVp0wsPW9QZ8F3SknQ6H3BxDLusn4vb5LltGKLtrSbtkPL7pb9ILbl9UII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWVJygIc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWVJygIc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9Rl031013
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTk0UnQH3xDorjJpebyNAcKqHxIR/o9PBKmisagINwA=; b=SWVJygIcknDY+HV/
	t4z9kWI1uJ7ua2CM7r+tcMVjfch0V9FHbyivqZPzHk46IzV5VxDTB/9lwO06Pkhh
	aYoAPiHN1kv28Lno2wUg74P2xGLPJTWIoAX4O9DjGtkZBmyaokNMqC5OLzZqQIA4
	nkwm/F3hzasW8CFdfIH8aTqUpINwnVJl8gTYqhkRoOdIcJ4fCmxtiTBaf9kI3LgD
	hwn03uP67umboBCeI/6p96zD0lKoJacZHx9WlE0LbqedB9tGnHDRUPVKMjwb37kR
	hkbvy4flYhE8PqzH/6rVyzE8sj9klaql/dnoFJd3hTQ1v4D8QUTU45c9T1J5n9L6
	YyxqhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d01t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so151438485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487064; x=1746091864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTk0UnQH3xDorjJpebyNAcKqHxIR/o9PBKmisagINwA=;
        b=VZP3g6wfWeQyn157P4iMGZvkoKYubEaCyfM+pBwiV1Yw5coxifFdHfPv2r9xf4W9vg
         I2KGsoSkdwdz5Ph+McznGCWW+JP9si5jVjg/3DmxIVlgAQMx4LypEGow0/A/1wb7fRSg
         83Zefvjj+lNh8tPPEYIgdT76wjcQjB2vDhgs5sjx6JVyALDZjMVRfdCrP0O2kglwGUnF
         v3OXGamdDDyYpfazlEo9Q0Ux+hfaUmwVeemJMaX02zqzPUBv8H8EMPK2HLGSPHvm8qN6
         xmCQfjTHw4Lgsf+kRaXMoXhIn3O4I2vpSQwZX1FfwI+akGYql/187jN/mZ8FdgmsDjmO
         Ov2w==
X-Forwarded-Encrypted: i=1; AJvYcCXJVVyTnf+rfUHF9lkfIdtwMxepV+LRMxPmBbpoYSddfnV7WU2UvH2qTNnHzqcSOksGda0yl9Srbx1k2Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwtr9ztqlyqQHbxZpmYw8nyzDnyEodh2aNPbvrjy5B31L+VQp9
	21K+1hhFMWzdiY87wIR/F+d+bGr9DKyuol3+xsulLvIVa0+95KE5hL2lx0dPADgX1QmPbvsHhb+
	AtOXDxAcGmZjNejOS3EA9XAAge9FMBqkQDcxXpM8OaTk1l3urirKTQxEUHADjfk8=
X-Gm-Gg: ASbGncuZn6zWC8PEgQlqjzm/7Lz+2ZC13pDpoC9Y6I6vuXonVjmVcHhI8nwkhRw4AsA
	8oZGK6XE9mYsA7Ck5IQIgMn4BLu5W1srUpUU0RlcWYwoYuGTxpFOHjF/hyAp79kKzmtZsy/CtGd
	IdzKjoFIJ+RTDpWRWPZplyHhNg1TdayfpbP6xoy6Wogue4WanA94+jpT4YbJW+Bas0ratD1zmO+
	nBWYGi4bV8j+rtSPp5Z72cRaL+Xtw3SRDewTbP1wYspJ5mXK3crySWENDj1RNHxdYwIKxpKkpxd
	jJxnWBlWe/I6cpzaK3gHYanxcPh1AZccH7UA0UkktOppnTCla5t+wTn0/IC6MlmuhUAIRskxTwV
	MiGM7MIqe4OCJThBNX0jtHCjp
X-Received: by 2002:a05:620a:24c3:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c95863dedcmr204324885a.21.1745487064063;
        Thu, 24 Apr 2025 02:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTPVFMhjZTjsvgv1tiFzDAqp2yVisyrGxoW2goZLlIgUKXnOxpnGEHjvPO8PzRIpVvho4Syw==
X-Received: by 2002:a05:620a:24c3:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7c95863dedcmr204322785a.21.1745487063708;
        Thu, 24 Apr 2025 02:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:25 +0300
Subject: [PATCH v3 21/33] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-21-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4640;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qx+tWXrswqotBVXqga7C6jCwYmZehbjfGnHTcmUatQs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSuvOjXOKZz85LXtpy3hCiTey8BYOEKUq36R
 6U/lorabWuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErgAKCRCLPIo+Aiko
 1UraB/0XQswNUOxaIf5ad/EjxLk26DQuGjk1en0FBcVTNLd0eqa4sLwMWaXwcVSDzwpqoIHGUjP
 j7q4+Hk98WfhZC/bPMXYY6XHN2Yw7C2yaoH3a5yEcY0JL6545RwywTLmg7oMcwM8y0UcpbaDTEx
 tLWg6yAiTaxRbsZhNUUl2unGAV+h3BCUPjs/nMP6s+P2/VJ3N+Fr8i4EmRfAHsepTFg2IXFlET5
 BxBQ/4UNol5O69p52pNV7dgzRHbm10fQ/2qFdZxv/MSrfKkYP3AcXAa5qhkED2Tz92qO8sqIc2k
 ME0RUyLZTiyl+veOPo22B402OfTrDQtPXxJO03WgA+8exlCC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8Yh8FK69v0zU dhKa9uNUuySh5A09Ly83zmxCSrHFo/OABFbI4ZtT05LCQMlnqVcpHOlrABURwuomfbiNkpF9PG1 dQlgHWf+fJ9i1j8A9Wz6sgm6dbJm77eJEMQKcJROfe1jqnD2qD7ha1X6QfQCksDwIv0KuNVOJH4
 ERb84e8Fd+iR7z+chlwx3ywzDPaGuNd5MbLV8Rldbx0ZcsSFh6U1EZ4VYmTRBXdX2KwOFtQ1TMf i8gEfikKhwzy3ACYYOCCq1K3X46JegAeCmh/+CQVWZcpV+AsIpqaS8l3Pl6+DNFURFcEXEMLTKS 43Y0nvFWmKx659CYKEf/GSEYve0ITR3MD9QC6Jr+wvuUwCPe5VMV62dGJONeuM5Q8ts0kS2W2ui
 27hw003WjbL3uNgjSjIlX0aHBPQ/21GdokCtSfiPYb7z6J15QrWuPn26HD1MbqQs6g51WFIV
X-Proofpoint-GUID: btazcjcM0gdXApWNKhVBeWkEACrgKLN1
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04d8 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=TQSGqBnpyQA7SagL8QUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: btazcjcM0gdXApWNKhVBeWkEACrgKLN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index f205e2c967ddf5f437ac335585d43d75a0623e32..e22ad69e451bb5ed38f056e95b0944fb5c21ec7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,10 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
 
 #define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
+	(BIT(DPU_DIM_LAYER))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5..e1fc6fdd8864b017bec35e448ef15420530e018b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -85,7 +85,6 @@ enum {
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
  * @DPU_DIM_LAYER             Layer mixer supports dim layer
- * @DPU_MIXER_COMBINED_ALPHA  Layer mixer has combined alpha register
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
@@ -93,7 +92,6 @@ enum {
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
 	DPU_DIM_LAYER,
-	DPU_MIXER_COMBINED_ALPHA,
 	DPU_MIXER_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 4f57cfca89bd3962e7e512952809db0300cb9baf..3bfb61cb83672dca4236bdbbbfb1e442223576d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -150,10 +150,12 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: DPU core's major and minor versions
  */
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr)
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_mixer *c;
 
@@ -173,7 +175,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	c->idx = cfg->id;
 	c->cap = cfg;
 	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+	if (mdss_ver->core_major_ver >= 4)
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
 	else
 		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 6f60fa9b3cd78160699a97dc7a86a5ec0b599281..fff1156add683fec8ce6785e7fe1d769d0de3fe0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -95,6 +95,7 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 
 struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 				    const struct dpu_lm_cfg *cfg,
-				    void __iomem *addr);
+				    void __iomem *addr,
+				    const struct dpu_mdss_version *mdss_ver);
 
 #endif /*_DPU_HW_LM_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 1ed458aed2bc2c54f6e02acce43d88927100b99c..5d55b246b32f0757281d8743ae2d1a23cc6e333d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -58,7 +58,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(dev, lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);

-- 
2.39.5

