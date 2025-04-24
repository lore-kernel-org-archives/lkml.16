Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA011C8639
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487039; cv=none; b=I5zBXLMoorbT5pEvdQ9iYERNQ2PLDqVxLxBjtp/z1eaTDoKSkw2x7fp2Dp46eDXwVq5Em6RxzgapmU3zIUt7QdfzJ2tSKT0e6GaZN2twYusgTn+uCpdU4DFgsg1PfTVVqJp0QuM1s5i9Dxp+Eht4bF0IkaSsjRKXIEPusYbHlE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487039; c=relaxed/simple;
	bh=JxFfxzAgO590taIYVsdC3ww1ICf9N0VyO1B86wmG0ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhQvw/673/gzxtroz79nN4HXweYcRCc8PGAVqtAO1UgoyHGUkAnBjfchTJXj+yz4FMtKGAec32O9YiRaH2Pf7k3iO/B/MbjqLDcr81gBjwBoUhlgLgicuF0B9zCwtkGTbogRWqZ6rBj4KyEt5GLTvy28YXeS/fF1u2KWR5owxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDz3cGJC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDz3cGJC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7gw010071
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2W9+B0ZnfjCFViTwk/uQhdvUhFo4znCgY6BQw1Faug=; b=ZDz3cGJC4SU2atd9
	vr2Vys2AfbDJ8Wu3xqMDIjMfhfWIpejh/B5deVLJSBemUivPZuSS32jgTz4jzFRA
	fuHaOfn85E7c1LU8+AX/pU0QDKG4mQ2kgWWDLFjNt13gAokLLb9FBLXf0cG4JHNw
	C3DulBIV+JGn+FitBe22LRp4mBQMRI9OhScKkwFA7P9RdKA+wE7r7HaYRoLxYCIC
	MS+tnMfS4IXL3u3Ffpw5xrOUveuBzJWYSlKaU+v6nUWXmq/ojPXeBToLlJHbmVZl
	M3dTEKwl958C+Fct037tjGxxV47Mzz632jLwrSg2fiZHqkGmyNacfcOKfRNZ2lEj
	Nloe2g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0d1ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e90b13f5c3so18519626d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487035; x=1746091835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2W9+B0ZnfjCFViTwk/uQhdvUhFo4znCgY6BQw1Faug=;
        b=TYyxiIwmlseWRYvQMVQpeV27sD33Y4Y9mo1KQMJOgn5qQRGRIU+AniOoDE2c34ah9q
         CqpgHON1uiUP7SwQo6R2X8y8DjrS7b3L37+26yh51fl8jaS3esQzbDk9JhZ6iRZDTcn4
         gu4Hvj5siZmZtDv54vEBj/uktomhKgltvtkZCwT3OnmQs8ZsjHbUnMEME8zukY5Vuuif
         LTojzRo4cC8Ag5YiVmSa/+z07eieVbS9E71f5+cxAb04Sfl2zNpJzCj4a/Q0squCL4vU
         BQAqR4zQguMRLCsX+gQrusun+cHB2VoKcNLpirPJwUgp3u2wFA4Ub2edp7NPEkDxPbQb
         7Z6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa2WR6rRX7ESX2mJ92TWDW6OnXDJ4wbNmgmPGk6h1nhvT2GlF9yeopldvA/mBQjHD4l2z9s9B3NqhjK6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9FDKnP7FVYiaEG05Ef0F1Px5ncl6dPCfbh2BTHBK+p+qyHdG
	iVw979dDqne1v+TQpvcwgXlMsyIrMBpXgAHwW4q3/LJFJ6W49xY3s0+j9iS5CjamlklKj/znpbt
	gAh/Zt/LKvHoj5d5/UjwsvQRTOPUedOVCqg//8FBQvKdqBXNRZpgLps5aUM1MpUI=
X-Gm-Gg: ASbGncsyaZxIUCD2tjgIApGm2Yx0PStI0HPNaFf+Dwu9W4NkqfoPka4rIltq5/WTHl3
	UbH5mqjaLbeC6LVaNTlgsDmEuriQlvB9C15lCcrz1RqgSjNk/TbAQxYTnbd/q4KzRQsoFBKFWby
	MyEgVWy6VXOr6YqQcJrE7SjVivg6Q149+apt7XytVylJbdTZuySm2dzj1PZLtX++7PpbbvhnWc8
	Plz23pGTlVWuQfPLqYYZS6goUUpAEMNDG1R1EOse46y1iRnwwKqTRtQv8GHnNCLJNJhwvqahXja
	f2HLtfzmqsmcdubh+JkKu0/Oh9cN+ZSlGYHt2DiALygr2JUcZJcXpNSHWTrgUGml/qFIlFGW4Xz
	gE4tyThAlVTyfLkhwrivTxWfY
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id 6a1803df08f44-6f4c21bd1e7mr13179286d6.29.1745487035134;
        Thu, 24 Apr 2025 02:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxCZuAnggMj3l1bp3VhBBdZn7SikDu72aqo9cVDnc9ZZvE7kzgKSO3dAMP++P4RQGtn7Gcdg==
X-Received: by 2002:ad4:5882:0:b0:6f4:c21b:cd9d with SMTP id 6a1803df08f44-6f4c21bd1e7mr13178936d6.29.1745487034802;
        Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:10 +0300
Subject: [PATCH v3 06/33] drm/msm/dpu: inline _setup_mixer_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-6-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2099;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7p9Y0N9fe5J+FNtNErF+g9/bY2UcR9C9Ev4Hmj1Hodk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqFUrxRR+NGyuOJa9iZPcU0YKALTABfDjex
 qvwvQQi4leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1f9cB/9gxIKyI+sJgil0eeT2ElX+Lg5NIqskYAtVXvqVFJrBFsxc7bM2fNfy/yAca75ktCpEQGT
 izFMD4d0TVSymz2DVDCTr8jEmFsNT6kTr4sYeHW64rvRuROHHxVtFhxii8TzzdWMx0eFFTFIYcy
 Z1cl0mNA9N7Uca5rf08k5HCjBPcRDi0eMV+eFzutkJPuXowU4tFGV6laG7uZKX60fFtqJATjwvZ
 XvUWYDl/7slG3eyAl8tquvIeK7yxE99hvbOiq+GS4jfB02o3qE16b0EpAajL3RsQwUl8320zhd6
 qBL2Emz3OpptOvvBoq8gQ1TAeI4jGBD271WmlGZsFuESOJgQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fMgxTCalgpOmAb7IfmvJawnc05LNYr0n
X-Proofpoint-ORIG-GUID: fMgxTCalgpOmAb7IfmvJawnc05LNYr0n
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a04bc cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX7WhUwdmjimzU VHSYU3R9zyeOUGOsJ73rUjs6UMv4cAEeIwqQpvtVKBfYviuSVRQTHlKxtjZSuDVLBsJgo1VPjRW JHP2r63rBj855aK/ELMZSYb8thcV/Oouq/eEW1KJZXqVT3xixIGRTHGeTq9NJ7pwbFPKfDiDlYl
 oWCmlLFlFnjHsP1UvKvOWS6p5rVHXTROPHzm+aqMUFmwyzXasWEF1De1LO39/bYmyYNfr7+BQ1P h8S/Q8H0FiWSowb+lU6a2JVsmAPgd9l85l6bmGLiYC++iLH1H10q7FO2mMvwvHpBx8AxrpJVEYg UmIb7A1PzNBJKOtreRcHEe8MG23xsYcR47X8UrIIY/tW2DtKPVk0FK7SRRHyHeULdwACF8vXaAZ
 6ZpY960qUuo0iZwkNNa0YDqcvfifSv0e44QkrexCLjQ5wqkRN0VBmcIMCAfUEF2p8twwhWy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

