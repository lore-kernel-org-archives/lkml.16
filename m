Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8281EE03B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561996; cv=none; b=B7gIMBtvJOo3tmZ7FHNC/YqyYMrk7U93/1fQGJx+sNS+lQIEXj6v9IR6maDm69xAYnbGBIsHZ6G3E/7+vnvMFE8p8a+/b0CcGd27tyHgxxflfU/LwcWDBJWTd8TnlS0sMTM0SQg8RU0fyXYrG6eed1+DeiZ3Ra+Hzo/EV/BmS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561996; c=relaxed/simple;
	bh=+tAM3ooqqZtm9ZI3U6kdny9KzfBxJCRS3qxH3rotCDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0o7wJ66nrTtrB0vWDFRvyLF8Hpa9mkgHwDDW1GVoFNxT2xWvanaXz8ORLgD+BhBQtqfMdOoJ+Q+bHINNDXg1JFYGUURBN1CSm6uzRv9PhdyiVU0d0xN/DpUnQo8pmVcuWis0ViRR9C6eSugBIQjZJqkMl5Jrdqh6OXCDlpCz2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIxh/vVL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIxh/vVL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DFUeXx008961
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUvgjetOZIy1d55buA7UNKEIB7bCknSCwDOLq0J6+eY=; b=nIxh/vVLTYHdVOrL
	oO82jM1h0o1hfYZC7BGPUs84C3S/bD2IZ2uiRUWhv6JembnM24srSI1mOWrSRl4Y
	2BwFPJJCvMT9O0pFCaEqtDedhFdTynGIeR5kK3Tmz9uZcIOOX4bGnoKTrVosKnB/
	PE9cMXJUBQTyKVQxcSLQG6cN92a77yozd3s+092pC/PctO9yV2nvuFQVtA5zsiJa
	6lsW3wINcZYj5YMRi/rSZ4PWZzh+QGCia/NUp/uw/ajChr2trHCygmRxO5vVeEI2
	mJ+rGGH0a4RCOwZFI8rt9uPh2gO2zBfr2LpDIemGMK5YcibFuMsPvP/k+fJZ72Qz
	DwOi8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpj8u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so328732585a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561992; x=1745166792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUvgjetOZIy1d55buA7UNKEIB7bCknSCwDOLq0J6+eY=;
        b=d2lfoCCOt5VidSgOnOef/dL6iRqx2DR6yb0G4Ra/el09r8/RErHdOeCLQEtXMVNBfQ
         TPj7x58aM8oDlLmWjrQIfMMCo+GeXrhzJDIw2ahEC4y1lyh2jz3TAFoWoy6UExZmoAuu
         lus651lb24DgRqbvkQlpNcCzEqlqdXiCR4sx4BctAyaSH61WhnoRFy+xn8CnPmX0xKFy
         8QoXj2GXoPNQ/cxuBA4LKjsEU5guyAzYB0yr3jnlCyI96cktgnWkWgaJ2/nO5vpL17wB
         Cisw/hnRaHBHhh7/XY25BkQFSDu13ZyuuOgsYc74VJOXjvQqs4LJvUTpPjDQs48XZdbb
         1dpA==
X-Forwarded-Encrypted: i=1; AJvYcCVfssa8N8Gk6fIiU0f8fxwuler7Q4FLsjbAfqTClBjnP+Bsb1CnSW0E4uZuvIN7BLmpxPVBspM5veiusaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWsQ00eo28EJlRoJjNp8GkRqg9vVw0c6wJXKifxlN1AVT3o/Wh
	m+CkTwYOsWbMFeDCTl/BS6yrrLFonkuGZ397pieHVED3D1WFoqS+ehsSodGxXn8be8zKtRCVwvN
	7Icm0YB43PXSlaqur57TbCGgFDQp/OGXn9ip2AkAyIg+Unpfn9yYkInhkHH8FsM8=
X-Gm-Gg: ASbGncujfVBkI256tI4cnd+0x1s3E581zDqhuRLFmbVkDmjDjhfr540clvyXXcoRxA1
	GfIvaYdUYNGMVn/n+N8CW4AxXQQOm3I7dq8JJFxAbS9GZFJ3kdbTGMZfW6GpMI2znhw5N3Dbws6
	GMLCZOm9Xwxcd9DH67OX9WyTkE9GVqKRCcEkqxf+eTrD0x5DL762v3iE3MbIS/aALlrzXQR2N7E
	qfTUAni+c0zr1VsIxV4Fl5XUl9yN1+pPEOPvMR46TI7C+mnxx+9l8QWvT5DWe25qOB+F5+aRldS
	ltj7d/HSTPIRz/cml4sWqi3FZFbHTTBJZD0eSJDYZhBW4tGFK7kRjgUC8sIkFriTI5ObHBwMjij
	HBJR2X/bySEki0k0ifrJe3whc
X-Received: by 2002:a05:620a:240f:b0:7c5:592c:c27 with SMTP id af79cd13be357-7c7af0ca5f0mr1298392985a.21.1744561991717;
        Sun, 13 Apr 2025 09:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw/+tIUxG195eAdrmhPCzt8HJLFQ/PNT0JqG/rVYNJdkOMOqTVHlN0BN8bB2Hk5QjMx13/5A==
X-Received: by 2002:a05:620a:240f:b0:7c5:592c:c27 with SMTP id af79cd13be357-7c7af0ca5f0mr1298388385a.21.1744561991170;
        Sun, 13 Apr 2025 09:33:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:33:00 +0300
Subject: [PATCH 6/7] drm/msm: rework binding of Imageon GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-6-1132f4b616c7@oss.qualcomm.com>
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
In-Reply-To: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
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
 bh=+tAM3ooqqZtm9ZI3U6kdny9KzfBxJCRS3qxH3rotCDc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c5WI9aJByr2x0wZXmTIQHI+6HgSgjLo1LPo
 +v0k8uLJ5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1SEvB/41Ps0VCv+pXy4GHLVVnv0eq20PQjNvgk2BdO4K5rx8gBZWIWtB+xBRUO4R0gqa6iQ/Cr5
 fhX0AvSFBGXViJgffs4iD56vDdciux9Lob7lb0teBdlzTtqdVVGpHBkr5MXGEbReXrdK81HX3yy
 TBCIKtmFpWAcnw/cnZ7/N/wh4W6/D9GUYWbEozTC2OHOCY8qfhMec7bM1hrjuCjQWamcgZxzNXN
 kq+UAspNA0qNpRFGNEbXdfQi199devMdTSFR5dPaWS/tU068IoDauSfNDg1c1rXACvZoSQQcjlw
 Nb08ocWEKnTkCa3XrJMHc3uDYbkXBQOLrBOpwT2I1njRkaET
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: l5E6UUMskCexi9n2rAxP6gMweUlZf0UV
X-Proofpoint-GUID: l5E6UUMskCexi9n2rAxP6gMweUlZf0UV
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fbe749 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

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
index b296d1315aa249638e073d08d43e8d41a4354f3b..e5c1124d45fa146c91caaad39a39fb9d21e5f5f3 100644
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
index 5f4d3f050c1fde71c405a1ebf516f4f5a396cfc4..78c4f0ca689cc93b8dba3fae061a92923e3115a5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -558,6 +558,10 @@ extern const struct component_master_ops msm_drm_ops;
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

