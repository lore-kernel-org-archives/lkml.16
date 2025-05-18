Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272B1218596
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565732; cv=none; b=VGo4kOm5Glu/vJxqM4BGkuRIvrpcXmegTKVE0yk+jECUiV4KhnqruDViKYZ/d9nMSjp+LnSM9oORCwHJRIdccJwzLq0kwk1Itv0aFKkTWFdvB7rvGOk7zHjZw2+gh97eZm15kJ0osL8wiVnb/wqT3HF2LrUEmVLKDWu4wDm0ldc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565732; c=relaxed/simple;
	bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnzsD7jNPNNPrQVproF9aEBnK2KjgzBiAbF7GhuoY5zuW/52OQlJbcLSa4TwZ+ahG2oZy1dAZxb5w6bKvIuF0PCWSYIVX0E22d2EbHn/oO9Pl09Z6dimoBgggBVq2PxvmgfFNg4FJUKeiWt1afsmFjyeI6HejPBQl4OJIf7nzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nahe8YxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahe8YxR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7RTgv012110
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nahe8YxRHW5xg9PY
	dXbIVB/TrD8zdCizJb8GHcupO550BKaGOv8QR3LQzTXbmj5omcdhp4FHBySECvkF
	lzkFQIK3B1YnxBW2v0kuFheHrpmH4/3G0OtTNl6+8LVxnuA2VB7uxifRjEJ/EUPn
	m9XuvYzU2O5XCfwArnxbCodmFsbBnuCkSxUq/EOhOrcmlWTUg1aFTx4h8adrBLZX
	JZycjE7CamaZurPG2gGMsdyociQjb77zX3LArgiQyvzgo7BxjeDizFkos4IWJBAs
	ZdnpDz6AfmYf9wwdaybR+FX413ik3Z5ye+s21yQ7esJjFq2ptA0EKVgBbHMZLS92
	/gDnXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcsvva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47b36edcdb1so135847141cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565728; x=1748170528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
        b=adOrZKo/LJMSnj5fiakUC6Of+hH2fsfBK8KylBbRb1ynfcJRWE6LN/TMK/8M4IQEpN
         0ry5Ej+xuXOCXWh66mHYy2TaS7xmjnUBLf8HH9NNLfsLcsUQAh2GOOEwizx0+lczDqrD
         X+BqtItxQuJsAey1BQlNa9DPfuG1JolmHydqLe5T9RcRYDokJU5d0W59c8E3AzVpwjvY
         pyRAghrkV+YILehCV44LorOjw7J4V7ypvieccGk3VXp/j8OjdZV5K9GAA5ZfQ8toL1y+
         d/71edkO3qGeIV/f4cbU+k8fLfHR0hZn3cEpPolG9/79u9fqPwZ3wuGnn8H9PdlarCWj
         FvDg==
X-Forwarded-Encrypted: i=1; AJvYcCU46nlhs8DqHyyaowgzB5UW1ehpkTL462+urLrEyDU2WV09L1Pksr1jSEytE6NMQYeCA3BrT6Ezz4u7WzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Un21hyaTVTiJtfjoRVeZuUstq5nOhVhGvRtRJJ01Xl4NTXuB
	qt3XvYkhtCpeXhi2xKTiHoW/LpnT47Ob2xgf/PmmOdADNoIsc1FWumpp3fBwJAQG2NT3EuWujiM
	ToYtUL6MFCRDJHsU1muvtNigDs3Gci/S61xAWi2I5mtWfL8MEPboHN3/2BGEshP3QXsI=
X-Gm-Gg: ASbGncs+821bozACOlJguBq2Z0ESK9OZuY8ZvEQ5kYj4f1f8Fgt2TGeFwdjX5hlC4ZC
	qS99MIwfiaHr6yQDDYcfZSD7NWA+JDvbi7gvmkmJCPj3+aVTLuKM/wLeZN2rl2cxkeOhs4P7HNh
	Ms9hlegL//epELsiInUoJVcD/Sn+JP0UjQXt8aiVaOBrY8RFbqwPnSeZ09g1X8DN6W2f5gHdNdf
	QzuPo7QAuzM870sj0zTQjEoZedac1cG1ued5kUaDjdSzecFk6D3CY5rEYi/V0JHIgnfCUpdKzAj
	ERHmAP/nerrb8IdgE/yX9pqrr+mVjEbAgEjZXB1OeZYLXvOQ7PLZyFG7V25ixp5j3klkCoWxf/g
	Qav4yEcrH+R3Wy/s37nd9znP3
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f8b2c95b78mr153800186d6.23.1747565728056;
        Sun, 18 May 2025 03:55:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwzLMkmBkdbwjFViOIMLrKHJUrUiuLpJ8M0qtJYTrZeZHRoKtHam4c0qJtlboNh/7FpPSgA==
X-Received: by 2002:a05:6214:260e:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f8b2c95b78mr153799976d6.23.1747565727641;
        Sun, 18 May 2025 03:55:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:20 +0300
Subject: [PATCH v3 02/11] drm/msm: move helper calls to msm_kms.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-2-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZDa8XSHH8mycqheTvtaIQ9DTALExlx1ErQ
 VrWxLqtNBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1bufB/9xNZEFnQ3iUAr5/qfQECmudD+538OkFFnwxzChSUqhOVDUvBNMhKH9eMIKYqXiLTyXbnr
 NXQh5FdSYae51nMVEfLiy/HVdJJ9kUtpxF3iB2aV3dhMYiGvIppuxe3QrXX77Cd+d2ovZNCtf6E
 O9qjdbopuZWbMr/1dE2f7aNOJPsTb6Ofl6L6pNnLTRIiHSQ9mpVLM5q9qumb21edQiWxtqKlWwc
 C/TuIQ5Uk1moxvvnCTasRV44BeM5UGg4oIz+NJHjU6iUTSKi0pKXvp/sw9SS9AHQ+owMLqmNsOa
 spGY/zt8ns9QKuPTUuDuYflG4mXrcFZgMMKdfreD94+z+NXL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: J5HyRu6YXtvPnZYOXyjoY_rgXBvFzOM3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX8pRczJp1iYwM
 s8BcIlsTlPQGK35JOCJHx+jke8/Yc+BmHl2bTHtbbi3RZ/rVp2VHV2VFU4LYVWZgVYRO6IejWOl
 gzKULWepG/2Ij2Wbkt8KUBNUaffT3+hclKErch/rzl9G5wQ9ohP/cRAv3PxZTIVRw2ivCljgjIy
 6e42mo2QikiLXOVIimuTQQrRM2eX4L5Pj6eM666Lbiaro5DwkLu+M9oKO8+k4ZcPxDj115m6eED
 A+uH3bihvTMShiNUbhNbAZt/0hcy0/F0e9Qips+qRnWJBatdBTMnHXw3gTyqF/lN7HmwIgB9dHV
 E7a/4eXJNsJpMDpPiiQ3dTfM55TkDjOOs4Ash/nVmJTQUM/wxQ+OwvEQCDhCyCwBqt/0pBAxTQT
 9yRaCF7q3iotBtHNAjYXpyQKTERrP4acGsjYZ7z2dt0hhdxL+UI8YqyzBUDbtCHyXmTagl1B
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829bca0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J5HyRu6YXtvPnZYOXyjoY_rgXBvFzOM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

Extract two more KMS-related codepieces to msm_kms.c, removing last
pieces of KMS code from msm_drv.c.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c |  9 +++------
 drivers/gpu/drm/msm/msm_kms.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_kms.h |  2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 78cea9d4999488648b4131a2da425fb349d1b664..2c6997c85fbbc3767315ca3a166a99b322f1218a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -79,7 +78,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -275,10 +274,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (priv->kms_init) {
-		drm_kms_helper_poll_init(ddev);
-		drm_client_setup(ddev, NULL);
-	}
+	if (priv->kms_init)
+		msm_drm_kms_post_init(dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 184a4503fef0deff7234a3ce332e0bf564fbce46..49a56873100b2fdcded3eb6adcc7032bf404212c 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	return aspace;
 }
 
+void msm_drm_kms_unregister(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_atomic_helper_shutdown(ddev);
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -366,3 +376,13 @@ void msm_kms_shutdown(struct platform_device *pdev)
 	if (drm && drm->registered && priv->kms)
 		drm_atomic_helper_shutdown(drm);
 }
+
+void msm_drm_kms_post_init(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+	struct drm_device *ddev = priv->dev;
+
+	drm_kms_helper_poll_init(ddev);
+	drm_client_setup(ddev, NULL);
+}
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b..26cbb662e7533fdfd55fb7f200b99c79c3fd3211 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -200,6 +200,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
 
 int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv);
+void msm_drm_kms_post_init(struct device *dev);
+void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5

