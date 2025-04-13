Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D61E8346
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744561991; cv=none; b=V6oAoyKPaljLlwNOWiwnUKVqvkSUMlHp563LZ3o+sE/WqIvy/P9C/R1uVDzRVSfUdMFQY1H8mmkagVXhvnJIVYBVF+d1+25KEW1HSKAiFCmUmOr1nPoIBF4D8Nd9ZdXa0Tkn2eWA728eGhCqIYcJ2etom3ziBza7XZXanZV45XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744561991; c=relaxed/simple;
	bh=OXKR8Bekin1jml/eRU8BDlgsy1eZQ5R/fWSgssRh70w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9olJvS5jGRAb45wizxXReWEHMZUWrosahLUWNje7gFNtPbVvtH6FG/qTBKHkO94lCvWsSXj1oRkH3oGsOaXbvua5vdacbL9Bl+ZsCEpNvQIL59Kts1dXv+D0sE6ikizk3edpPhDAFqRa5eEvDF/0rcRYoSMnmY0s+QHeRiBeSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gk5nmMT0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gk5nmMT0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DEU2eD027089
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOWXlqW2H1X69rbgrXv1oCon4lNL/6HLaxB38aViTLE=; b=Gk5nmMT0KFwOM/HV
	NH+rUzdU2YJ/bYywWdcFHSgokhC8yTvTMWm9RJTKL8M1Um60+x8zCmYUaAFikyb7
	Dmws9gYo+qA6bsJy1NpVTsL3pKQcegB5ONjRL3MHBUho6geDkMbxWvYgqwO+T4vv
	Hj8l7WVTd15fc7dZDEvqntMXZZxv41w3wXt3KbEDCsgShZhjofjqXRd6+Dg82GUj
	uCoVModH/qRjSYt/m6yJTsePuscCQ7Dfeh9E56PuJdz1C8sfRd/K3tgwcwg8aMNY
	uATP9NITvcALNgHGoM0iHgr5cXGh0I2hZq2+DbRAF6jnPBwWeZnh2pk+v+glgRXx
	TsqSOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs12e5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:33:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ed0526b507so63408586d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 09:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744561982; x=1745166782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOWXlqW2H1X69rbgrXv1oCon4lNL/6HLaxB38aViTLE=;
        b=ffM2rMkcKTYzJ9AGurP7BoGVUzLfz/qYkhm0NrX0ks+T3OWYh/xhW9udxfbQolcyrG
         jp+a/aiL7SzjmWK8GGjkkDLwwjw56xJp/5XMzXAOK6XDQ2XI6kSou+A5qw7lp+cQOdEf
         s0KX4tfQoVH0Llui8G8uzj2kaeN6H5cwxODQIf7Dw3kv01dJYyypbrhPIp364duo4xij
         CXr/CIpQEX58LD+8dpHzwk/CvVyMgPDUquiJz1Tf6+g9HWEr95NgjGmA1Ey0T1f2LIxf
         K8L+9Lopan/3spOrU75z3Shechk3WG59nDV1M03F6X5S51n0MLW6BSww9QiKbVRmNHz8
         ykcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbOfbiqj9YL/uap52oszDI66Rq2JfMcyNdjbWFTWo9wN+d5FAOdemIRnPgH894rGKbSfblUNzVc4ma8s8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytcKaDMFZg7/fNopktdq5moyrfOMHDS3V6oMQGITbnZQ4uVtaD
	/792CuR85FCiyQSftYioZ2wWgZ8F+h7EF9GfaxtNf9Jp/w4OTn9LBqMd+NuOVliHzwdRxSyQ/7c
	ZJIHpDQy7ymWFVCgC5Gv45JDm38E4fUkPgEM24RF0Ke3m0R4PWuviELVAsIsKhjQ=
X-Gm-Gg: ASbGncuZaakKjCLp4WYWaQIKNb081TNrX2+fvXnCoLcx6+uUvvdk0v/FWTmm3j+aotY
	FQLhzdp2wQVwKG8n3QJSBZ9qO3JD2+p5EcqdG3OoQX2mPDKbb8/f+DZ4DZ6K+smHwuPg5HZZqp5
	w5+H+7P8ihrqH9TB7/fOTnmfUdA4Y85RdD26QjvR6/4dN97jOa52kWsYf8QZyUdvARFo3pSjc9+
	dvXcsQdX88pt0TtVMMcNb7pjeM+MENgwo6br1SIOj6j462K0PIYXdylUvhGaI62ocDBmUXCGlU4
	27P38GZwuLMYGwShvbzAp3HMlnW2XeQ+yq154PkKBIXY9+knLlTVNex1nZhfwBMxm1t7e2Z8Deb
	e4AxpSWqojvYINZpyMS1wbB8A
X-Received: by 2002:a05:6214:2387:b0:6e6:61a5:aa57 with SMTP id 6a1803df08f44-6f230cf8f72mr137524616d6.14.1744561982136;
        Sun, 13 Apr 2025 09:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYlIetlwLWD8fWLuwPElP336tSus44Q9FzUT8/6hvSsG59ryTL0vVnyXP15pLCLjXU2KHuEw==
X-Received: by 2002:a05:6214:2387:b0:6e6:61a5:aa57 with SMTP id 6a1803df08f44-6f230cf8f72mr137524226d6.14.1744561981505;
        Sun, 13 Apr 2025 09:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464e9812sm13345431fa.49.2025.04.13.09.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:32:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 13 Apr 2025 19:32:55 +0300
Subject: [PATCH 1/7] drm/msm: move wq handling to KMS code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3644;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OXKR8Bekin1jml/eRU8BDlgsy1eZQ5R/fWSgssRh70w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn++c539kpkZcgiwYj8YBtJ6U0W2bhkdYpBMw/v
 o5tB6Y2aWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/vnOQAKCRCLPIo+Aiko
 1aPsB/9fRlpj+FblmlkY+PCOG4ByEVp4sWFeaROnjT2dfgoK3+QwyU/Llyo9oHzj8HactL4XoYq
 miaDayv3LVoxjcYvJeamoUAKf1zbIHcvs7Ld6nQuDU26dpaaH0iAD2sC5e1FWMGoCTI7x1w3z4I
 CpocIXGNsIPQAzcJkfd/wJYYJWk/+rw9VpGIQ50fA1BZ+j72jON015Hhl8xMcSgF8Wz9zVp3VBv
 c/jp9L/WphXV+pIhSouvXlFsarXX8HWMv1aCXHOPjpNtKjsUKo04/gF5InsNOvxRAu82hfqgi+e
 PVHtnO3PPWtW0u9oWzJXef04tRenRJLyUwpNS11wASpwI2S9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fbe73f cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4zMMb90fMlmLdFOEXiAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 9UBwCE_fPcraqdSumvVyeduQL33xbcvN
X-Proofpoint-ORIG-GUID: 9UBwCE_fPcraqdSumvVyeduQL33xbcvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-13_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504130127

The global workqueue is only used for vblanks inside KMS code. Move
allocation / flushing / deallcation of it to msm_kms.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
 drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d07a6d82ae21c965e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
 			drm_atomic_helper_shutdown(ddev);
 	}
 
-	/* We must cancel and cleanup any pending vblank enable/disable
-	 * work before msm_irq_uninstall() to avoid work re-enabling an
-	 * irq after uninstall has disabled it.
-	 */
-
-	flush_workqueue(priv->wq);
-
 	msm_gem_shrinker_cleanup(ddev);
 
 	msm_perf_debugfs_cleanup(priv);
@@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
-	destroy_workqueue(priv->wq);
-
 	return 0;
 }
 
@@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
-	priv->wq = alloc_ordered_workqueue("msm", 0);
-	if (!priv->wq) {
-		ret = -ENOMEM;
-		goto err_put_dev;
-	}
-
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
 
@@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (priv->kms_init) {
 		ret = drmm_mode_config_init(ddev);
 		if (ret)
-			goto err_destroy_wq;
+			goto err_put_dev;
 	}
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_destroy_wq;
+		goto err_put_dev;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_destroy_wq:
-	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfae04639ceb770353 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	/* We must cancel and cleanup any pending vblank enable/disable
+	 * work before msm_irq_uninstall() to avoid work re-enabling an
+	 * irq after uninstall has disabled it.
+	 */
+
+	flush_workqueue(priv->wq);
+
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
 		if (priv->event_thread[i].worker)
@@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
+
+	destroy_workqueue(priv->wq);
 }
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
@@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		return ret;
 
+	priv->wq = alloc_ordered_workqueue("msm", 0);
+	if (!priv->wq)
+		return -ENOMEM;
+
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		return ret;
+		goto err_msm_uninit;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
+	destroy_workqueue(priv->wq);
 	return ret;
 }
 

-- 
2.39.5

