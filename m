Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4681B0421
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256668; cv=none; b=aDVEe8VYLdYaa8g+R56lstlpTtEeFIKPYt2uMMr7Z9VR8HaWar2BVFS1mGiM/x/N58flyxoFKSR46thIuDzsnsLujZ7Zahyax6UyKNQMR8jysBhRr8p1zldyDtFIducTdh4qKR727xF0MWBAgaXL9RX4CTsW8j1RlN8EtY+vOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256668; c=relaxed/simple;
	bh=LygQOxLEQsPD0oOqeYPZ0TpNniR5HQkElGX4sNXvTkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y21uH30AT8/+YtmVHdwWCyAnNG5/B0Za/3G5v6wBfjNdw9JmzOc6F61PD5nLlHYje/ehnTzefh1Oux6iyTPdWHF2rsSQF/ar/AvM4VVJnB1yEi3e8J5ewVTvmXHx6zcj8INzs86nE/qzL9HNh+vuIuQcYS7IjZNjv+fCjxs8x5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALe8Dcqd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALe8Dcqd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436S7FI020152
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 07:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=; b=ALe8Dcqd+LnzAGCv
	JX43vDb6czVQIJrkOpOJBK+y4xuMCRWJB/Lm8R3wB1H/ilV19gaTcdrtcuwyrw7R
	/JSWkW7GaCOKgymc+tooo7JrNXUnJPaKhvBC6Eg7gn0wydQtAQE5/f3UXCMvh7hf
	vGGlrMgSY9Rzo+rYFH1FxtpY3aNqiZ7i0DBgYGpNk8unpaVwFAhODvfMCCnXljCt
	7RyxxO4nnEliDL2HflNnakmogIgvnhorcCLMWW8AgfC4zQShRrfVIy0AxVoell2u
	DoYRZsXbqcTBjIedBYzgvSkQugktzSHSySOc8FFX9eljfEEA6VV+8wn922Pna7Ko
	HCWxRw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfg6cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:17:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766afee192so15760421cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256650; x=1746861450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=;
        b=nn0NEdkUFAOfalf4F9F+gYvaGMBo0kp5KGVwi/cDJOP3mcDraqbzwui6y4ER52Bt6k
         mLr/S7cpwMHCbI5fdDvl1LMBaYLXpP4XPVeEeQ6jvksrCEmxZPwiDyYrmslsb70Xej7/
         dClEq3TIvtAilzG4R64NrspapH4+te/6DKMeHudWur+KUQkEwM/BLG3FFnvZAWPx1PUm
         8yViUPfMsjDXKlUbjDuUjcQ/Mr5hnYeoCGAFjPY5XwYzksI11uoEw6h5bZyr9KMsFwNr
         +t5msMU6Q+Y4JbJDMagtqTJXy1pUZ1+DptUEpw5jHD/bcEHuaSBS9gg1fj7MmdeeQKOO
         DZuw==
X-Forwarded-Encrypted: i=1; AJvYcCXTtVH+niQth3JVHY1zikCP4eTZ0EaGp6uz/7HLRNVDHezgithXhmkZ57EOy67dzQZpHAAy0v/OclFItiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbsvZfBo/ymRDvGP3DW5qvS2wyVwd2NXBnf2YwNUAbJWNp8aTi
	DI9DTdmquRHI7RMKMwRokAUE0znXo7uZ0IynJFzTGgPuF18e9FBOVpUBad+GQV2ACDfB/wrLtm4
	B2OGK+iqclnjy7FZYreunlO/qIt0q9NO7sgGfAKH1ClSblni88/ZCAb2UjBM1nXw=
X-Gm-Gg: ASbGncu2mhERFsbmf0TgVEiaSUW8qB/lLiMbA1Ag74Boj67qjv3ufbNfq0s2BiGDd3m
	erbmSiHhdNKej6LBP/YQgs11ZoM5ZzHQA9mkcSF2+k8g3OKdrJHHKf6x5oSbaYTg6/jE9SGbrBk
	iQFwPhs638p5yVScQ4n1Pc+tzV4NJS8PYQbitcTitpV3ULwWECBLAYnTOBb1Tw/JzrvCv5mdJsc
	2N/fVOZEU0GbtiKQ+7yvm8jowCC4ce7ozmTO2ynkBI+30myXJAzEYN30uI5raxJ5iVZhkiH0zdZ
	A3SsmreJqKmZxjzXkUpJsxxbtVYkBxQTymuJHFMEtq406z2XGvrZ6IhGb99T1o3ZAle/ujVHMx0
	bG6sdfL0rFbW3NhJ2a7TQgP5M
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id d75a77b69052e-48dff4de974mr1620481cf.14.1746256649913;
        Sat, 03 May 2025 00:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1bzAAdQlXhBzA5PTRId/zIWytzDLkPwsjKAlBtMNTIcrcDvoywr254sWtwJFp/iqar13fZg==
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id d75a77b69052e-48dff4de974mr1620231cf.14.1746256649610;
        Sat, 03 May 2025 00:17:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:08 +0300
Subject: [PATCH v2 09/11] drm/msm: rework binding of Imageon GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-9-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LygQOxLEQsPD0oOqeYPZ0TpNniR5HQkElGX4sNXvTkw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4booXccTgyqU9uqPO7yxuZXOEpuavKdezmDO/35IpcZW
 suz9vZ1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAirbrs/2vbHMPmpH88qxut
 yDf50ppFZzLMlVo2dfxyXVb+tt7Fe3/t4Zqd0v12R5u26324+P3mv+vyHpcbv8wokxGsK4rQ3PF
 F0+ZVitsErb9/dwvP6nixPebNj6w3bV7JJRWVibW5F9k1S98/ZpolWiF8uKvkxZGpL/aLvW8xfr
 0iurfStH/ZpLDsZ835ce8zslnTv76/0NqkLHZjjcyyBtUDz1dFO+1dly39LuejzcrVW7rOd7cyJ
 tf5urFJdFxbEJsXUtBV+Oqh2lPnBzJezjKvGF5xuhQskxP/fp/NSe6yLHf944azVeouasp9rz14
 yl5rJf26nudqkF3RcOqghOFjn0Lu9wYKEv6bNJ72nygBAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JiyvaENi_7ofEZ-f6vmlF0zjdhWF5Umo
X-Proofpoint-GUID: JiyvaENi_7ofEZ-f6vmlF0zjdhWF5Umo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfX9WT0ZiYv13kp
 ePOEp6VbdpeUoNlyWnAlGbliuqH6/RqN6jSVMIckqZmYNKey6O3GWBAw8Mu5rebtYcD4KxtkMJl
 jrETUI7fvFmfoUhc16ZGzGWPxDVR/psNu8CxIVe3lIh1yEU3aHJhw11sOJoaISEcRqWfinMHvlA
 eVZKsgN9izZnU8EtACHew9N1pwgh4PsvzYroob1PgMWRU5zrVDn8s6qO7LDHIdyNUJ1BTR7xgIt
 yP1QQ8jKTqDQ/52ANh1afxFZEE5DCWU69XCMaqGl38kZPljvFxkKO3rI/JdcUPLOoAMXZEnEy03
 gSKXf1l4d3hmKk+U0aGkdqb6mu2YwnwQvfrDyQsg68tuYvEVqbeFSrYpvYax1CiZjzydlbOJtfN
 tlKV8IydCT25A94qAWwpAcgid/XuzW81gr+eo1qlcA47I1Klp7KzbsQNTBVyr08HLTq5YBS1
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6815c319 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030062

Currently the msm driver creates an extra interim platform device for
Imageon GPUs. This is not ideal, as the device doesn't have
corresponding OF node. If the headless mode is used for newer GPUs, then
the msm_use_mmu() function can not detect corresponding IOMMU devices.
Also the DRM device (although it's headless) is created with modesetting
flags being set.

To solve all these issues, rework the way the Imageon devices are bound.
Remove the interim device, don't register a component and instead use a
cut-down version of the normal functions to probe or remove the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 36 +++---------
 drivers/gpu/drm/msm/msm_drv.c              | 91 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  4 ++
 3 files changed, 72 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 236b25c094cd5d462f4b6653de7b7910985cccb6..325cb710ea08ac8e5c3d9c80c8d8e18e1946e994 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -241,42 +241,22 @@ static const struct component_ops a3xx_ops = {
 	.unbind = adreno_unbind,
 };
 
-static void adreno_device_register_headless(void)
-{
-	/* on imx5, we don't have a top-level mdp/dpu node
-	 * this creates a dummy node for the driver for that case
-	 */
-	struct platform_device_info dummy_info = {
-		.parent = NULL,
-		.name = "msm",
-		.id = -1,
-		.res = NULL,
-		.num_res = 0,
-		.data = NULL,
-		.size_data = 0,
-		.dma_mask = ~0,
-	};
-	platform_device_register_full(&dummy_info);
-}
-
 static int adreno_probe(struct platform_device *pdev)
 {
-
-	int ret;
-
-	ret = component_add(&pdev->dev, &a3xx_ops);
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
-		adreno_device_register_headless();
+		return msm_gpu_probe(pdev, &a3xx_ops);
 
-	return 0;
+	return component_add(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &a3xx_ops);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+
+	if (priv->kms_init)
+		component_del(&pdev->dev, &a3xx_ops);
+	else
+		msm_gpu_remove(pdev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2c6997c85fbbc3767315ca3a166a99b322f1218a..804b594ba1e7df9d9aec53a9be1451f1167fc77a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -62,7 +62,7 @@ module_param(modeset, bool, 0600);
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-static int msm_drm_uninit(struct device *dev)
+static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
@@ -91,7 +91,10 @@ static int msm_drm_uninit(struct device *dev)
 
 	msm_deinit_vram(ddev);
 
-	component_unbind_all(dev, ddev);
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -200,7 +203,8 @@ static void msm_deinit_vram(struct drm_device *ddev)
 			attrs);
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
+			const struct component_ops *gpu_ops)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
@@ -247,7 +251,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	if (gpu_ops)
+		ret = gpu_ops->bind(dev, dev, NULL);
+	else
+		ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_deinit_vram;
 
@@ -259,11 +266,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
 			goto err_msm_uninit;
-	} else {
-		/* valid only for the dummy headless case, where of_node=NULL */
-		WARN_ON(dev->of_node);
-		ddev->driver_features &= ~DRIVER_MODESET;
-		ddev->driver_features &= ~DRIVER_ATOMIC;
 	}
 
 	ret = drm_dev_register(ddev, 0);
@@ -280,7 +282,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, gpu_ops);
 
 	return ret;
 
@@ -896,6 +898,28 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_gpu_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_RENDER |
+				DRIVER_SYNCOBJ_TIMELINE |
+				DRIVER_SYNCOBJ,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 /*
  * Componentized driver support:
  */
@@ -1020,12 +1044,12 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(dev, &msm_driver, NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, NULL);
 }
 
 const struct component_master_ops msm_drm_ops = {
@@ -1074,29 +1098,34 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-/*
- * Platform driver:
- * Used only for headlesss GPU instances
- */
-
-static int msm_pdev_probe(struct platform_device *pdev)
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops)
 {
-	return msm_drv_probe(&pdev->dev, NULL, NULL);
+	struct msm_drm_private *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	/* on all devices that I am aware of, iommu's which can map
+	 * any address the cpu can see are used:
+	 */
+	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	if (ret)
+		return ret;
+
+	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
 }
 
-static void msm_pdev_remove(struct platform_device *pdev)
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops)
 {
-	component_master_del(&pdev->dev, &msm_drm_ops);
+	msm_drm_uninit(&pdev->dev, ops);
 }
 
-static struct platform_driver msm_platform_driver = {
-	.probe      = msm_pdev_probe,
-	.remove     = msm_pdev_remove,
-	.driver     = {
-		.name   = "msm",
-	},
-};
-
 static int __init msm_drm_register(void)
 {
 	if (!modeset)
@@ -1111,13 +1140,13 @@ static int __init msm_drm_register(void)
 	adreno_register();
 	msm_mdp4_register();
 	msm_mdss_register();
-	return platform_driver_register(&msm_platform_driver);
+
+	return 0;
 }
 
 static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
-	platform_driver_unregister(&msm_platform_driver);
 	msm_mdss_unregister();
 	msm_mdp4_unregister();
 	msm_dp_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f6b4c5e1dc3a18516e0e40703b24d3ae37b7c35d..e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -532,6 +532,10 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);
 
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops);
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);

-- 
2.39.5

