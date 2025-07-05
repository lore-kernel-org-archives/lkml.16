Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5417828AAE0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709762; cv=none; b=cwEq1y4JIOVRxLDB7vmEf1m1L4d18EVqQl76ejSKP2ckOl29/QkHgCfe3UbUZ3osM9sIWH83dxBY77TsVZUGWnG4vFww0aSiQNYsfJj6jRyxHZeq9MbhUFTv+pkXzHlxZKhvsPYPOdccTtM+OOxXPZMXeFim8QUypswSOcA9KsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709762; c=relaxed/simple;
	bh=TG9Y97y24HNtxbyFJsoKUMYBT/41NYtNamoIMKjs3K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2xHLrNyXSSj3u5s3UP8snlku0/HxJHZkrGEeBjvl1IZKOZHSG5ZG2oYDv2ssTdHO01sqF6ob3Ezv8dwVveiUXabRU+iiGFVabsUQEmKWY85Xfbo1k0BGALFK02jKA3/yq6NgBvPcKOigwh4WLD1mFbAvSsYoceB7OKcmYW5Ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKfI1Qkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKfI1Qkk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5653kx1Y027443
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 10:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/1nhlqlwpSE5F84bbMtq9GEBT3B7Hx0giikeSnmNeY=; b=MKfI1QkkFRL6fSCy
	zeOdYCzOi92HVULTqnk4laMKgHcDqDRbAQmzj0sfB9+StFUfirvgF51qMhiAX/wm
	UAvEKdArHr7UPLmQzR4egnyp/wdYst3Iyj4O7ploY4LL2DZBrxnQsmTbTM/UpA2j
	UzlIWguAEDOXIoBBJkXCd3ENYdRWrld27004YbE7eGYuGzTtoBlQwOQ2dYFN7yNM
	IDraD/Bv1EWEwRvYuy3+zKppJ8rvieAi/1V0GlrkzStekg9/Wgd+phZaLUgSbhso
	LNASMpMXo3qSUd/sXkGxt4NCUQ8lzFqutocAQGtELmiaPINw3/mFU6lWR411dLFD
	3CfBhQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pveerhj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 10:02:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so120474785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 03:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709757; x=1752314557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/1nhlqlwpSE5F84bbMtq9GEBT3B7Hx0giikeSnmNeY=;
        b=L6d9ulXXf4dsg21ZM4ZiZBgfBk8hb1ThsC0Wk5agfziPOoEnVlU+NZIZtGXCnZqBys
         qehBAKS9iSaewlRuW0EjAhyJifZOa3MSHVE8kP8JO8QaKHAOIWVxysM3cnhrl/njnw55
         RlggVPy10SS6QrzLVyeLaeijykf1QMGaY5mIMDxrLYapSeGAHtKfiL3m3Nb6oFIJPzOj
         1TnCHu3qdPmP0ChYjRYzk9tH3Ios4dRrsT6W0i7tCDeRr1GHfiJjPLry+VEQJDIAUFNI
         Qaz8SYhUOfUJNxDBX7yo+TARXBeZG7iYjsRURzxauM1tsr3cTSDvrQN0vg37wSyyHOfj
         hylA==
X-Forwarded-Encrypted: i=1; AJvYcCUhnSPix94Ug3U00flLV3Wqj4KV2ctVoNVfoe1QHOqmj9ILBsLgVwRv6iq34Cpi2ErgmgiKWVwbXTS5A6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2GxgZ/E8PuZvI7uCD7ec6EvvTmvPLnlaSJ710fE44ZH7JUtnN
	VOWZwgdSRiJMAGRnAFySd0dynvvwaqNkAhLsPNYUAnRu3083M+6Nm4qPASgoHxc7iutNwYjRG2u
	Y1EsijiK8f/9bJ/hlJm4j2ePBCruCh7nbY4WiEJV45+EcqMAXnvjaukXXEmqCclzH2z0=
X-Gm-Gg: ASbGncujMiWbJpggg2/I0CRsHfOwhmrdI1GVHKd1vb2MSLv+thlm+cDRKqlNiSAOnht
	38sE8Bb6bHeO1HxaXns6QCT7P9obpORw/+yuengLBKe/5w/tbhDa/wIaBrjWaukdujiRdKNL3ZU
	gd/SUikIaoBsRPIQXPRsU5faMATn/EitLQ5BsRxpQc4P3Z5eC+DMW0W7wVESD+LpDoiTy8U5GR0
	agtuBOjWuTW6O+BvHjU51jkx7i4xcIBKoZuk3cVn3JC3zybhbr6zpF6OjQWAFnG5QJ2VsKKBizs
	7T+C7IgSDc9qVUahctwX3B/KmXD1DFKmL/1J7p+i8k3acxhgVi2c7uVFjzLrgDD13M/TTL3NkwC
	0q1ohRT5COow8ejjdpeVFt5cvFEYFj7AgEww=
X-Received: by 2002:a05:620a:410e:b0:7d4:3b3b:20f5 with SMTP id af79cd13be357-7d5df180268mr729963385a.48.1751709756820;
        Sat, 05 Jul 2025 03:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnwkDUFYmSv6w9LvplPIPGz2sg8KpSYgqXGg0Jgcp8qXdWOYs4owyRO2ecIbVxnhMp5dKn6Q==
X-Received: by 2002:a05:620a:410e:b0:7d4:3b3b:20f5 with SMTP id af79cd13be357-7d5df180268mr729957085a.48.1751709756147;
        Sat, 05 Jul 2025 03:02:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:27 +0300
Subject: [PATCH v4 02/10] drm/msm: move helper calls to msm_kms.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-2-fb470c481131@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3498;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TG9Y97y24HNtxbyFJsoKUMYBT/41NYtNamoIMKjs3K8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bGD+NpfuVMXE8qXWfIlP5WzkqwFZsXN2PHmgTpH/N4+
 pxi40Q6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRH+4cDGsOvWpX+PVAsze+
 zNje906pj+PVZaer58Y0e/7heqm3Kmj2lzzf19yTe1ZsKko+7OJs2P/H3MKBL6xWL+FeidlXFla
 zsys1dS9knpm++CCn2qQtb6zDN9u5FfwJP5GY5pkmwBfJL5hUKXii2F1wssmMC+aBwmum/ma3ji
 1jMiyJMjulqnfKmS/Hqs044d2pYMb3BtKvP83/JHLvpa6ab63tprZfPM1f0/8yzA5QOrdxYWp+X
 WJKymV2r2Mv1m5Vc+RQmnFiD5e9TJVgf/NVEXEph2Im0aN5yjGuLel/A8TLA79M1V5/6fa3k09n
 hS7WkVxxpin/h7uSuNnnsr76ecc+CHJHurNYZf3TNwIA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX4jerevORQXow
 GaQYD/mIEMd4VUMtJjKJ8pviElp46UqXH28HB6lYYt+fRKoEWYOP/a+YAFISa8Lb2Ht+mO6cyuc
 Aw7XM6Y531wnYdnvDWcRIbyVCjw/9V4OPcx4TD/1UEhNXsJpHdpiP7vDYQ1Er2SJ1lIo5/hVlq9
 qfZRFy2Oq6c8J/KylJk66vlfTjgeMYJ8OmGCqgXs6ebi1IXH35VE+/V0SerQ4X8yioR0mCub0u/
 DW5tShtKvn0QGj7YTjBDOG+76OktM7Mw3d7UbfNF2kYrjUPwa3GmUgOoHsodT760XLeQg6eabDx
 WZbA9nXQ2OjqD0W6y1wmH4is29RkKMeTwzsoq23zKBo7kF/xf07pcw8zmPLm5jdoXelSuOiR7pR
 giP0PQmyx3DFVlaTzsy4HDChsz4bQQdQTemOPqqzsA769q+Vtl6begw03YuW3EYmdEAIhrMI
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=6868f83d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kxEXLjUGMYjhOJEgAFxzsCQJ-w8tfGuz
X-Proofpoint-ORIG-GUID: kxEXLjUGMYjhOJEgAFxzsCQJ-w8tfGuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

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
index 8f79f5b9a61eb39dbd63b4ff225b96e63ee9a5dd..ce22d96033c8efe9210436eff8241f52d3c053bd 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,7 +11,6 @@
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-#include <drm/clients/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -74,7 +73,7 @@ static int msm_drm_uninit(struct device *dev)
 	if (ddev->registered) {
 		drm_dev_unregister(ddev);
 		if (priv->kms)
-			drm_atomic_helper_shutdown(ddev);
+			msm_drm_kms_unregister(dev);
 	}
 
 	msm_gem_shrinker_cleanup(ddev);
@@ -167,10 +166,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
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
index c6c4d3a89ba829e161b060b52c91f5323cb5a806..9541dd7f56c9ea0f1d63c77b8ad8e7bc8cb46508 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_vblank.h>
+#include <drm/clients/drm_client_setup.h>
 
 #include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
@@ -217,6 +218,15 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 	return vm;
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
index e48529c0a1554e8b9bf477dd71f59286b388de73..7ecf420d0f16cd68f8f7fd99c52e994fe604851f 100644
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

