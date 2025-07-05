Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80E2882CC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709772; cv=none; b=P83xdd/qgxeb1x9L5h++TaHYdtIj753OKmYTeH6tNTMLxXo8l5F5xiYBKDXKushxCZBfrQ7wkW9U572e+RHzYgHWUvkw8+tvk9QyAZqbT6CaC3a4cZ3jJ06Mc19X9wRrG9xBwgcpMNQscOPMudv1ysO5yKpvbDLAqJ1fMNASsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709772; c=relaxed/simple;
	bh=DzVL9H2k4LmoWJqL5HQzeipbdtWihS0FDl5ptM9m0fA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bsPEhNKz/bqTLyMd1wJ9t7hTWffrVw8G6DKjgzvztAoTQTEWFZYzywnAQWfS8vntQVI5RHGBK4aBUsleXOe3Zv1cMb5pigsi7rKwytwRmD0WCnawQBQOLIhFD3DloVYTaj3LjrVWeqUFPpv2CkF+I1KRdqaRlaho9d5Kp0X7JZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADsQiES7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADsQiES7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5653kx1b027443
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 10:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6k8iU63cYSyMGB/JNvgKJwcn6+pSi7yO4AZnChk8iiQ=; b=ADsQiES7wDkOX1Gi
	fIl5IzwqKf5WhWHX/LRqPvgBNWlTIgrsSOTiP0fnFhQ0GZJd8QDrS2XI7gLEbgV4
	jyPMDd/CAbbEOeig+k3zTZxloNbnHbN6EIEjqnBcHYROqYGtZKv10e6/IQEb+pYT
	0KK0OAvWeNzFpFphHGkwADF19PIqI+0jc+lN7MRcx/8R1uAnng+U/+VFCBsNJkCo
	xkfXknnWyG/DajimX8ijdhy8nSadbOl3cNLvrmZ3J020G17iFBRJQ6LDoW6mVY8e
	3TyPWXNPDqoGhsrzY37uubFvZoD3JHLDRZ3U5qo+jHmdMNN1cMpcVoT0QeIo4jCU
	NxiY9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveerhjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 10:02:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so412816485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 03:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709768; x=1752314568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k8iU63cYSyMGB/JNvgKJwcn6+pSi7yO4AZnChk8iiQ=;
        b=rbwZNIB16kT56uHBWm/D0QgyJkxbC2yxK5OGeu0QfCofTatHR5YTXE1QsgGEVEZP8J
         4QLfdRHQE0W7MHwugdwk4bpkev64OcjbzWzElDxYCUMSkB0nl9y371kJ9dgfyRVPHsjZ
         0PRLq59wsvBffSqVVLyCP12J9Qu7TdJUavMVvPCLqixt6PQRdM48YpoBMzOQBm8SnBVz
         +MKEpDJiUyngZMhXJ+Tc1FYx4Ttu1vdodKJA/3WSD1lfSqye/hGcmF5+0ay7t0HVXOVk
         R+KyQETxIf6U8yKBsLv7rtoIWUzaIb9oGf9uemGPTfKWEPgltIFcXsRUlmO2DXsUgp3N
         /2xg==
X-Forwarded-Encrypted: i=1; AJvYcCXPrj+PSHYhLGiTodqvvbWusnn8vk0+XA6o0+VsbNW7ZimwzpRvBR04MrcP4nAlDYGniso3MlBjJFyebEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDC42WYt683k3oXjAVImQehhPwgNV1AHPYSh+Rx/gFA7Bhvme
	HJIgy3UryMkpLnXIZZls1CdgYazYSUmNAL3BxLFzMYiTO3z95ncb2ibdRkaEW7j6S6tJYJEzTnJ
	Rne1sNU5yVrEmA4XS8Ceim0Eed+4Tco9Jde1iX0yJpTXAmY/fPk6/5oB2avmdqKGyp6WE1h1qo5
	+qjA==
X-Gm-Gg: ASbGnctMr/I6BphUbje470q3RnWHE9jVSkdP0afoewxY4q8Y3uHkKih8wUJ5SZwLH5n
	PS72JyF8Kmex1vfLkmTzNs9gBIqCpozcJDhkZYaKfz8MIkESZ+rNMozOfTHqBxSHhBIuSLj178+
	ynsana0+qzF2Zb6caeEf8lwDbfLjm2796G5jX7Un92xQ7VsJ61RTvKCSDLi5PlDOXa0riwdm07f
	HimmlmXp+3WBnrdaYd4cia/udeMYSjcmQIirBZDeYBzFDdQqHq/uB8Y0Xm53l6rwzDRVyCmJDvX
	X7ZUATeGMSFiWebrpt63qde0zvpbBtaiWXqByEhpi7dP1tMfWlSkDpbwyjZDfWKey108RHaQsvo
	7y/csu/UH50VCHfVcT8fr/hy2gaG8faoXFFA=
X-Received: by 2002:a05:620a:600a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d5dc659abfmr820319185a.9.1751709768032;
        Sat, 05 Jul 2025 03:02:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk61l0VJrsDu6svPWJlMvsrK47KKxeemJPKzbMi8xpLP+5oOgQ9ybMOlg61bSUHmHOvDKWiQ==
X-Received: by 2002:a05:620a:600a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7d5dc659abfmr820313785a.9.1751709767471;
        Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:34 +0300
Subject: [PATCH v4 09/10] drm/msm: rework binding of Imageon GPUs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-9-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8542;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DzVL9H2k4LmoWJqL5HQzeipbdtWihS0FDl5ptM9m0fA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0eMjLyvJMK+TxcHhy9pdiAsiUTlm6MifqZ
 c3uwA+QjZiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1YtSCACgGZ5QYELXU4AiIrnS/jr+LAdjV5d6L0QR1eduMI//qmyenSXFOtVLVd9g5sRA4p70Y2K
 SuS/xaPD/qyhdpiwrgHkj44Onl/7mPvOwR2GMRU/ZYYJ+ePZcGQTFrlUFVlSqte1x7lJnuW7jj7
 UW1WGphJnViSsFZEcUSiYycMDXcQ9Tzreo0xJkmkjqvFIEgUOnlZIqCn5DDyKq8vZ5nuPIkT6Wq
 n47SJ20oR3Rodm8Zo1m3Ceae8fgjUfEcvf4tn3cl/BecB5gFYTZ94+T12XKkw0Lh4zfnTWxd3Od
 lch8V3i2sR52g9PmGf5gfPP0A+mqtarYQylLOL9H16BWSiXa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXzah2C89PB6w1
 0h4OFoXgrszV76YbVdSsJ9mFjSJpnlkT4kRVNDIk7Oa7uBycDV5HN+ED0H2mBxYjsGvVn/QDBBZ
 8eFpdyIfdgf1elNvhKNYcv5Fi0Iqt/wyl7tYxYVc9HyN1T84xHLKhQp+fRlYbAJXzC5MRVTzxNT
 vyBbktkrF6tTc8JBYzA8U/GNbA0KS5bOjL0hPNsphbl0YzdccJY6uBpPd74ZxSKuB+3ZekWRt6M
 6RZc7lJ/kSfqMVpuEHtBr2KX7FV9nTiJefgIDl6XjJRxXmqOExzSdAiZfloSiuQaH6Jl/uP6W05
 NynBz0KpYAlkdz4MATr6a9Lf5EoMLeDjmw2mAt6VWHKrmXmTT/maNC8PYGUkSAJqp79XXC5z9tL
 3fCC8u4h3bSnCzvQte4g4s3UXngxore5wgKZlLxLuPZMHeRS3x7sPuwbVf3WVp47hBwpWzI8
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=6868f849 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gCUI2ls75JKrjeOk9oNqXnVsxJqHHRIf
X-Proofpoint-ORIG-GUID: gCUI2ls75JKrjeOk9oNqXnVsxJqHHRIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

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
index 27dbbb3020812f6fb7cff85a4e77c4ee471df470..99c8d2f4e4b49fda912fa49429399cf207eccead 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -260,42 +260,22 @@ static const struct component_ops a3xx_ops = {
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
index ce22d96033c8efe9210436eff8241f52d3c053bd..0ab005a7d5e99e46fe47c9e64514434416898d20 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -57,7 +57,7 @@ module_param(modeset, bool, 0600);
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-static int msm_drm_uninit(struct device *dev)
+static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
@@ -84,7 +84,10 @@ static int msm_drm_uninit(struct device *dev)
 	if (priv->kms)
 		msm_drm_kms_uninit(dev);
 
-	component_unbind_all(dev, ddev);
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -92,7 +95,8 @@ static int msm_drm_uninit(struct device *dev)
 	return 0;
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
+			const struct component_ops *gpu_ops)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
@@ -139,7 +143,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	if (gpu_ops)
+		ret = gpu_ops->bind(dev, dev, NULL);
+	else
+		ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_put_dev;
 
@@ -151,11 +158,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
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
@@ -172,7 +174,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, gpu_ops);
 
 	return ret;
 
@@ -834,6 +836,28 @@ static const struct drm_driver msm_driver = {
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
@@ -958,12 +982,12 @@ static int add_gpu_components(struct device *dev,
 
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
@@ -1012,29 +1036,34 @@ int msm_drv_probe(struct device *master_dev,
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
@@ -1049,13 +1078,13 @@ static int __init msm_drm_register(void)
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
index 5b276a4540753aa25d46e50f0957790ed39474ae..e3dfaa156307dcd8bb675f865985a0888be8fb87 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -543,6 +543,10 @@ extern const struct component_master_ops msm_drm_ops;
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

