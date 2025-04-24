Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A73E221F00
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487046; cv=none; b=sAP0pwuDP5WsB/jOagd87z2KrR/tI8SK5iF0pXWG83hoo/aM+WxeOHCf9y7+AAYJMD/yZTJV9vrX81D+PT8Zbs6vgQoXEqJpXM+YJhfqsgKrB7EzveBvUYQXuvkDj0Zrt77U/7YQg6PJmGKF/nJanGkVyjJbNroZ/RHd7QjnSHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487046; c=relaxed/simple;
	bh=NOFMD1nYVEYJjjfMb34qEI79sZOjl0v7XF7HN3hOgww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iuiab1iqFLvLPHmAnc6ejsSSMTjeVGK7TWcdlE8964jxD4CBCUpWir04zXEH+fH2GMHyTYdXmLDqUbJcR70rNgF/xzp2yP5gtEN6PoaxPAxe/bvcECjtZfdHWjIgzUJ3tc419jOqG8ITOCKb1UYciR1NP9JuIeMITYm9Us/hPRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUU67ApW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUU67ApW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FD66031157
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY8Yo5pYvT9Z4+o3bkCAq7zmpRUaxk4DK2Ff/7M+6kI=; b=DUU67ApWdav6G6YN
	WSn9hzjcyQpko/leMcfLmBQHGOuFdmU58cgfwWEfPpiOxNgKDePVC0IE4ucyQcr+
	QZ0StuljrOnKQjkzAJX1uK66u+G3djk4RwUliwcbqTzvhYryXkK/PdEobHTZQ6lP
	SxTsICXP7K6ehLMHMkFsTfaowddULEaIG3aFm2Ddv8qD56CINo1bC++Y/q/kqW+2
	dd5QsBW2nVcDwr0BIvGWBLkw4HuYnp6EmZ80iWC7VBndX2w6oHTTigkwkb/pOqYc
	uDlJewCRAOk0OCXSaWVVLXAtuGDzc5KjaGbSc2t+xCASuaVVJ9tCtgNJsqvbtrB1
	NdR3OA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5cyxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c9305d29abso142188685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487042; x=1746091842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY8Yo5pYvT9Z4+o3bkCAq7zmpRUaxk4DK2Ff/7M+6kI=;
        b=jepJURWcQXWQbHwsyI04XYadm06oqzulmmM66bTsnouHooSHtMX7Zx6v3V4R0tbXCS
         6yf0+9XQSQ4a8ThK5hjArI9lHlJdoGOGFld6poySJwHfdY2A6nLBURoWdjxEMobPLVKT
         6loA9Kxv62ZhIxz1H5/BHWyTrIqIY1lKnwI5TMGFrRYvsTYiNiFTQYzxYqZnkS1+5tUz
         b5GKJikDKTN6Lw+CLM9J1ys0PLKWiXzvsxdwY9/w8sEfKzsZ0VwUy5leCdLrQw6cFsoQ
         WVM26LEddNjV3C9eyDK8MbGC8Z1iQPDPUhvlB8Kcs0yBKEkXAR9Ja+11G7OJ/tP/YzTn
         4X4g==
X-Forwarded-Encrypted: i=1; AJvYcCXJLVCXE38cRsN+v6bz1nYHzfvmCzFmHiJLWK5hmgg37CPhDb/bC0nf6EdRd6Es0AXH8t3PuQ16Kbhn6mE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWn+5gl9ydffQ3aHRZ1i4SRT1+CkxoNPtJnqr8xBsg1G2Fusf
	XFE5F8ym0L7xHq5gK1nMs7hix7kytLh0uKQyymRpOZoPRCUHNlymaNY94mIp1ZC+JJX3V4HZAcw
	x066H/wXkhf8r7IHnmouLuqT9uQ3b0LG1lr6B9Amu3mMQDop8ht1wAhCDjRujjfU=
X-Gm-Gg: ASbGncvznHKM4uLouKeFGJDIJZVtI+SfmqieR5BcxyGLS8rJnHfDMMpl2cqqf+VstmP
	EdjFIiSkAvWn2NVlniEtodDK14kYISujW4Kndr4b6JaTAwI2vReCpQmGn1Y07kZHCNUfeBHw94M
	SskxFqeL5fbTxeNto2TyGi6RnqHQwWHU6Y9ZSoK89LgNp+uP3ZlcIkwtHk+ST1gQ0vXxmwmZHXw
	FT6yid1ZKhIuNXsMEdxPoEyZpIObsXglEnHRb64nO+QYU10DpExrDWNaRfxjRT3sNvf1dENgVDZ
	ZxvjGKWaAMOmnuW/Hkv8txyVofB/uvbhwBEko/TOsc1tuSAqoWtYtrkM59hhITMZqqNUhPMXtp8
	79S/ou/kqYAVuxZuUGJxKLCkG
X-Received: by 2002:a05:620a:6106:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7c956f88f47mr243298985a.51.1745487042459;
        Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUa/6yCoT6mZ5aizKzpe4+iNnRS2svRyasrbIHuoR01W3sgsHGigRTnWpApWKWi3FaFl+b0w==
X-Received: by 2002:a05:620a:6106:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7c956f88f47mr243295385a.51.1745487042042;
        Thu, 24 Apr 2025 02:30:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:14 +0300
Subject: [PATCH v3 10/33] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-10-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsDYyaEtmcEU0Q3DXm3LKbekIuXiOgkLRrmoNbxq0Rs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwYXyxqGhQ1r1BdqhZq2OsZ/T4t6t3pvffUUrueP03ZrH
 H+Tmbeqk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKbwsUpABO5fov9n5GQ2W9pP7PSvoiz
 i/UFnTh1vuTFP/xinsR6V/B88tyDvTb8mzlcz12cWtlw+En2kl9f5AWrVkTMm/2/mvFISfKSisJ
 Usxz7d9Lf8p64ldbc4985uz9Pj/v3prkbJ5vZlFcJF53fPruY1SXvp72YvdssMc7ewxGfvtalbw
 04+fG3bmTd3c2bpTUzqoJ2vDi/XOuzjPR/6dT0aYujlm0sdTmzaoPOy+cPjTTEY6rymnWnLet+W
 LSye1qs7Q/P9JPFJ60WBmkJF6+ScBD74KXV21HzQzfF1bEmuHZ7S/zd0yFWjSs72t5+1Oh5Xtvu
 JHOP70OWyrswR9eloncWfjblu+q97qCllry2UHDWBiUA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX2nj+SqG90QfA bg/3ga+F1naq+So0lUbm0sedkZ6ba9O7sv7lZWCfvbCjXTJsdDM/Rjn4ZotJR6bj1MZTxXp9QB8 ms/S3o37m364u3mgJnCFNh8LiIEUDx3aFLJIIL/scYGBGArMLBw16w7XGYFuVMsC++nRY30tItU
 vEs6tohz1Wjbf+dBq5tbfSN7UjPZ1kpLfE3wT5snv3dUWMISKHfZ0vHWflrs87yOf27lEYNdpcp vy/QpCdksRiUfcKLzRf7KTO6Js3ygto1MwKrn3jvGPNJ14dD7RXYmXF5V6t9ItnAdjjU+Ekk97G zwP82SrzibdU96wAj7LUrJxYz6W9UOLRfElpmqStOHRxf0PuDHjIipXFZpGOJWV+2/RhrPb2hJA
 91otTxRwK3UAXMU+SOTB300WseJXa+zjhJUBzXHMfs1ZERbya9JIOrMP0paIj7VrqpsyTS0C
X-Proofpoint-GUID: je5ACE6LOX8jPWNKDIpHcZxNTFEOSUxf
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04c3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=k2A94KsD3O5M_qN9siwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: je5ACE6LOX8jPWNKDIpHcZxNTFEOSUxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=904
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0fcc9fb975c0955f459ba4264b6a114a4b17af52..3431b3c956486aee99664ea9b7c2e00f5c130b7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b6c45ed4fa3d18ed21c2a2547b0d5af4debd974e..ae168e73026d8ebbe605397c6bbd95552193498c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,14 +134,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index c63a6cbd07d94acae04b6edf534b1a7f5d4119b1..593da532d40042ca31fb452679d3de04c3b0d1a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -786,7 +786,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 
 	c->idx = cfg->id;

-- 
2.39.5

