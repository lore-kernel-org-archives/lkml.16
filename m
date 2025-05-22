Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984552C1795
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940683; cv=none; b=guZ9ZwX6XsuwLHrdA6oQFsI6tfqKtzFZZppLQ+G+W4ezbM0jEJO4jUp44XvBl9jSC/w3mLt2PUJpGvja5QCBbA63nHkbg0r5OO33PW3m88KTptX3iBUUI2VF4LG3KG39azyGQVqTLKMlZlJ0wVH8dyJAAlcJYNspg5bWz8bhRT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940683; c=relaxed/simple;
	bh=GKphq/hvUyrdOVLtC7+WfOmreoz6AeHVTUfRZjhwhXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKyBzidESq4F33t9PCjfwertWMmEz0dWu/FsNrktuypahUFHwH12wk02bh4TphqTPMYElhfXDfFatDwSF5jaY1YqqLbHiZypa9aFhDq2nSC/tjDl/nCPT9PlI64AiwgFL/MFxV01emI4wXYyW+Pt3ufF8lmEa/0E16AnciTNx4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1LnX3SH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1LnX3SH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHK7Un028791
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1mI765wfM1dVKKFlWK3vO++jnmcSm6tm3TXel+1Ajg=; b=S1LnX3SHOGCcat1o
	Q7dpZqJmKMoXE6aaLO38jWpxCTg6cRJg6S+e4Y2FUKsFDBv3eISLPzlnTjMzXD+F
	cMzWjOOKSBG6C00qwijamg2UwVE/bljchSDMWkMtzo/At3WJ6XAy8xPeX1C/JxFX
	yOYEdkjW5ovklp77sjL6+O1LTIZHbt8lJ9WOd68uGys6h0Kq8FEhvdO44bQftpMx
	p9mqjIKVYAQInbme2kU9ggkECQTRJykCswye7nHuRSdz3NYrSc2UYuKeHHSyg2Le
	X0bOFxoKmE7Ujd6Ysz40dQKZrswoZEiXW35Gpw8QMi78MduPvdeJMyJ13rMexcCB
	w1IJCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0qku7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:04:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so1020462685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940676; x=1748545476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1mI765wfM1dVKKFlWK3vO++jnmcSm6tm3TXel+1Ajg=;
        b=a5dladqlPZ3oCZ7SbNki+nX+AR8O8+qNqBmkZ//b30iNGK6q68Riyx2jRH9EhD7jjw
         Gy+XQQ41CDoNsAD6vL2DC84miyQx4X3LP+B0sFK8o5kYxJX+0RXQw4U8AA5CzX7zqab2
         MggpCo8fv7VoXHcMXBL0Ah6u1IkzmUhC08Z9UK+t7bp5F2RAEjfTnHbepl7AvnLESQMM
         LS2sOQepufIBwk7AkNSVyitF++kdAXwNvR/S6ET4aX0eOTXm5zxGIQuiG8FWWVYuz+YI
         TEVP4ghxMSMKcyf1fLmO3Z25DszBryMQyfBYWEs56ZGRuIjXWgCJeaPQmk+uM+YEO6JM
         A2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhBoUSfO0NmFFTyLRe1tArbIMraYj8pwfsrNnTDdtObV6vbPfRZUawlwMHSu+stJzYAr6nGa32ZtN1OKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiF7hLm2lH1DFSRcGD1eFEDIVb2jqFjvCh097QBAMoJ2St1MWq
	SPBjYZBZVyhehrN+1OOJOQN45W1VSkZYiWY6iIZjAvvYvtPZFz88Xq6q7nbbXFwhZp/bS1+ZOVD
	9+STld2Sy8WW46rGexs+4uq8OBh5xhE0nYsDhSJRBtiDYOQRiNcOnsZIAUAZNWZq3v8E=
X-Gm-Gg: ASbGnct9MdYVmNk5Erzyc7istGWaXwj3UNA13xJoRpIHCX7ZAYq79bYPGnvwQHyIfnp
	7gToB3fekIlU/z2tp439r99Rbkls82AHygA3h4etJP1nJ+RxtWgAcCxu5oIhhE06bwsL4/xcQI1
	6TflUy4wvHXbIRs0pMmWZhiM6QTrFJTpdUTSuzl9ErFoowGs6hH36InXykTIvlH6c9Iv0l14sJz
	pSB+oWJut9jI4evvvWasoHiPoFx9Cy7AUj174JpjRlPE1hedkXf2gvJFNQ1UYuj5IoNddxejm6+
	XeqKlYeczIQCFsZtjBvKpzHUZ4vBuytrNGUklBJtlXugci44mQvQePpcgg1zUb0sU6azIi9wTR6
	cZnon+jZfVKqMo3Z6yuciNwJM
X-Received: by 2002:a05:620a:438f:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7cee3102bd5mr12928385a.0.1747940676145;
        Thu, 22 May 2025 12:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUJlIq7h8+d8sS9PYlCoIdU3VLgrTqhW1w6JVHLMfpH7+4OrYVZNw7MdG7bp0BeY4eES0rpA==
X-Received: by 2002:a05:620a:438f:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7cee3102bd5mr12924285a.0.1747940675765;
        Thu, 22 May 2025 12:04:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:40 +0300
Subject: [PATCH v5 21/30] drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-21-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4766;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jtOXyXHDRmJWuIKMWGXi30J4+hk/a7h1wLTjHZpcPuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+y5kjxRNbxIhNrWLBFU+i1oFwbN1TKgsSj
 f9qGz2PzyuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1VnlB/9PxzfrKitYjj+T2er3MjgHyDxc5v4xFSGIP8KSQkq+TlyMj46b/e5vHGbXPq/lA7EhxCV
 tZfZX2ibTnqgk8/lJqkLKX0Dvgm1lPbvII+qcHhWp40LHRRO0aT4iw8c+ZAIct3eMiEfDeXeh8J
 pEcMiTJyrnmvjCIpzMdASITJzSw+N+nKkKDZEw0Arsah2hDu77J7V1mMg2ZZQ0fduPL7YZydDxl
 mJCKMISW1FGorGhmK1CudgY4nPIsD5nEy6LEKGxN818KXqB6KGMDCOuzFiThaqcbAOj3YuUObMZ
 81XB89WmtAEX9mCIHDyWQppe24JTrzJGqfivIvN8PpMCUD+V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: x6-eQtEdZCyqcwA3oPan2nwijlfguTaY
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f7545 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=xxl3IjUXEjn2PN8_a8EA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: x6-eQtEdZCyqcwA3oPan2nwijlfguTaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX4BKke4RpVivD
 lnZSF0lnutueqx55uDnic8n4XM9OgAGxdIb/OYy9B0jbEFnwN8dGFwSRRMqJeBBqRZIe3MzBki6
 jOADYO2cu0mY2f9KblNvZ66+TkgEMKu4GDB6NZ7kw8tHRzk+fNPtkZkYjPcXAdfsFuBIUF7uqWs
 hHRR6QKo1pfAFr8r2j7+7YsTEl+XXiHJfaQHxU8Nglhg6NSQUdpgPpGzylZUgvMKCxHw4o8Dt2k
 dxIEibecqr5c6OdlxQ7r7Y6HeULVy5PkAthuK1JicJiPMp2FRxfblvNvvf1vNCndsoC6Ii9Bevb
 KhA7AZQHn1N0uq8V0i5IP0oQ8mIeTjcM/uiS0wUTjQ1kBmLsQDFf0NYdFdOpKSZo5B2g/LJhNJr
 iuZNIy9RoAYBADACbYpZk0Euq5g4D+mfLLo3pYDQf7J8WH/lEzU/mxCO7Jotpe+mm1xVVlcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MIXER_COMBINED_ALPHA feature bit with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c      | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h      | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         | 2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4777a4a852da0d65e20cebc31fd05647e0b4c4b2..d64ebc729bfb589bf90af89c094181f879d5b1ef 100644
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
index 9ba9e273f81ab1966db1865b4ce28f8c18f750b8..5e4608d10c6d4fee387c9a599a73b15661148430 100644
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
index d728e275ac427f7849dad4f4a055c56840ca2d23..7bcb1e057b143a5512aafbd640199c8f3b436527 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -60,7 +60,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		hw = dpu_hw_lm_init(dev, lm, mmio);
+		hw = dpu_hw_lm_init(dev, lm, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);

-- 
2.39.5

