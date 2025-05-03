Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FD1A76DA
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256633; cv=none; b=bWQKOSJotxcjm5nwlrSeim+zwLqOQSbjq87Sx/9qoGBGnysaiQtsvFLSSpwkNEFPm3dLF1fGAOuewVA5DULD+D6lkKEMbSZosxUFAYQt2rbvAteF9YNy5675KtK4O7SR4rThJFtAm8Fihd5nQhk+3BUuNKi+j4FHeS4RtF2VyKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256633; c=relaxed/simple;
	bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dFPRtTzCuBWACozpIqIaxAtDJbhmM1f9iuFOHyDGouZ5GOw3ATXgdowpJ7XDJKwfi9bRXOdNnjIZel75HkwG1Ar5u1fPOkGHK9EEHsYIMcakY1govQn1jC1WLpzLTqNFSv9NFnNybGc/sZkj9VuV/hdDeHFbzizwm7GpWPdaYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLdV+a9l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLdV+a9l"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5435ukFk031093
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 07:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=; b=nLdV+a9lAEhrHXPe
	Q9nhSZ4GwJdEzH0xbmoOqR+VsmGlYeUJQw3e95TpAfMkUwVukHBeyPqzgK+6Hep6
	DVkHpV1u5YOlFOyWlxEsqyYcNyuSlwbLnJCQBiykrf99R0pXlKPs7EhKhNA8kquF
	Eokmwikl5lM3TNoNmZdNgGakNQE/3Ha2ie0hZzMBiBE+9xA9XwnbNNDucSS4/cg3
	5ScIFT4iykt7w99qGk5L5VDdLlW2LfBFy+IE6tNdqykOJW7HRrAMgMLXWtua0P4g
	1nRwvXr0uC4pHsFpud0mNWcwTrPUJKGXA0zOIkirO02OMqhkdkE38Q8Gi7zCgdmn
	aV7qzg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkrbwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:17:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476900d10caso68964381cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256630; x=1746861430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XRxC+rcd4lvez8neQ9jCV1W0aJMb78tI+WpAHrRAYk=;
        b=OPluZXV+kUBdQ+Zu3q3RIy5jvIETvxGgXZV5SoQI0FTiOx0uSVFspfF18jQX0R2yZF
         pv2mcyPGMcAIbCXk6iaYQXB8fg7yz+Ifi6j1T4kuzNtB0ETWwZTKvPHtUpcX+/mFeUi2
         qLieus3ZX26FDMXzHzVLZLy5lXL7324bTCa3WYAV5tudxZZcXW3+H6RFBIep8SkR/Ou2
         VPPzT0RH16acPzskB5wQUrVHKRwNaL4U3pByq8De0tNig9xW/MIhcIjazyWL9ixuAM8V
         6ZQ3+3YPOfa5Ix6WJTAwAYHmS+DmQ6rU7wPgWBHkiwJlzaX4ORV4y0EbLh/IJKap7txx
         5jcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbtTj5igaTF9Au9fEDtcqxucjH+hT7wQIMzrPrjIpOYD4v57ZiSR/DQSpYOwnuIcvd2FcGjRzcsGmiAAU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02tZSI35Dd9/yX2K+wodH+jMtNhdvaXVaPwwDOIpPm8kRHtFP
	I0Z7ie++2BcICvYP9hSicO1C3uGe5nAP9KtemqPjWMuPoFsr43OmRLJcl+zfSJqBBKy3MsbSfvJ
	o9HIgGTExn8I1DB//x6KAd9MwUq7oW/wo4Bmua1yJXUL732LufSfIl4V3gFTIY6I=
X-Gm-Gg: ASbGncs8nqpFWQE0cuDlLZ02oSYnyPJUlTqnVeXdvMtTtZyL5UXmc6UEccssdzoRTbP
	j8Wnv14nkyQKLk8oea2VPHy1lZjcRQDhr8V1z84XRPDa/W9ApE0OjuKUmGw6hJ2sOOlnfboX4e+
	nPaSoiyLQ7DtNT8fa0R2GvZwAbIiYbB9Ro1YoTZzUmV76Jfz1JQ5zLiLQubmX+VJjQbz83HuC2g
	2ctPRyPemank46Lip9qu+c5Ol5qnmnbmgTq5yXNZXL+RBRBv4MD3PwN4Ie/mNKI8EyOs4U8bRMy
	r+r2rOgNtw3uvBXl7bP86GK+2qf1TRyeicI11dS1gpTl5ccqSlQRDZa8+7tOFl5o2y5LwOCatvX
	wnM2Y+myMfjDLO4Zf7/sqRqPQ
X-Received: by 2002:a05:622a:1b21:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-48e00f621cdmr1472161cf.34.1746256629801;
        Sat, 03 May 2025 00:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm0jFYRk4k9eoPqumXYa2PPwJCKZO+0EXUpA1YyKCnSe4V9HXyQYhK9M9D3KaH0j278whFHA==
X-Received: by 2002:a05:622a:1b21:b0:472:1aed:c8b4 with SMTP id d75a77b69052e-48e00f621cdmr1471971cf.34.1746256629495;
        Sat, 03 May 2025 00:17:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:01 +0300
Subject: [PATCH v2 02/11] drm/msm: move helper calls to msm_kms.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-2-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AdrdjdzHPQQcBxZ5qmg59kaGK1b5+B2F6XfHvaKYS9k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtYTbd5OzodcUJUnhRC27sbJGt58qYgYGzq
 PktPPGoqoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1WTaCACkFesjPuDPmfjrkI3mXxI7MJlsZxMTfbupVgyVn8kuECSUdTvpyb2lvKN0QMPPqaQTGMI
 tYW8W+qJLW900BgRbT6SAxk8uzwHKoGgpygtcxF1zFzPLk8cmdBm9PTZOIqY+iRESHItwlJdc65
 06Pjaj64nLPcgspOxq/5Yy1kRBoq8P5x0fqA1VctfLyCpPTlFCDiuXGr2+LlsX0JJxQVW88FTP1
 jhcsCdBYXgpn7+SXLT4C2S8s4WA8nQujmklB+iMx/TllElINZEKtFXQfcNrgb+YflWqBe9gURn6
 Y0Eu9ReRVjJgW+0VJpej2ThHEp2O+oloMspMttM4k+lbcMYc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX22V96o9n9gMc
 6ECj8FDmK5m7AK2CnF6xCzG/u9KjttTU87D9PhGbw5+sfb/oAgckeHh2jlhJv35pywD8zuqfwoS
 2l3tKk043GLXGWPs09sNEXhya/hCLVTrYhb4onnPXaBJ0mS6t0VX/IdqEQDX+ejfdRTdkKMMF0w
 c1fUbM9lcEsmACnl061mmiQrRFo/93zrE97Lac5ULmn9Hn2uzStnKX2/q0gKXi+II1iwuXri7pE
 P4X9v0DoMBSUq1TnMU3Ww3UnJZCPIBWLQ5Cao9WWO7qAubMurE/LNHD/0khLKSh8TrB1P0eyIh4
 bFqekYOk5KDuYx6ZmJPuNRRJ6QNei4q3vljgcXMMjIte7KPmGD47MtnC9rzY2O8C8N3tb000Dt0
 bExzt+AmHmfOir07WOMMlGlqS+iF+6kgp7SukEZi741zGH9zd3pHj+C+roHj3MU+qmohAil6
X-Proofpoint-GUID: 63pIcfPce2fGUuCbsdKMB3Sv5FNzHq_A
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6815c2f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5yuRF9vT8A_X6ws8YtoA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 63pIcfPce2fGUuCbsdKMB3Sv5FNzHq_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

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

