Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BAA1B0412
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256637; cv=none; b=k6xA5VYN17mtE9wiRUl7zCpNmPzUXY3tAPNUylyB/155+lhGrYjV0puSdfPf5/ezo/EptJ8EKZTB0tX/RYcvl366HAehplkA11mc3siz1XPEyoz2s+RtAq1m/HY+k1iwUlvL+0D0YhvCSOcaGaKho2vaUCFKlR+aGidYPL2yMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256637; c=relaxed/simple;
	bh=x7cM2Rqp4n6JjfWiK8DuKNRjLhu0g1Po0+oqCeMtWC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkzjpIhvfqjI4wSthh93iEW7vLW0o+yD9e6c6Pkj/a5n0KcPPQa6L2KX8kaDwoXMQQovuFVSpYjm9daG/qh+f/MivN6mG2ak37955tO2+iyyxsqdfb0ixsThP9jFL1ZQcIkADrqNC1IwrR2HLnAnuDvNftd4hyi6Q3KgdUlcT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPD1/afz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPD1/afz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436xLUk010953
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 07:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xqg908SIWMwTmLhHkCP5zPeST6KmZTagNBLZ1+txW/k=; b=TPD1/afz/z7kAcLI
	8a0wVa0c9dfu9j3G+2j24xRHWcerpI2FquUGWjX1RzC2Ka2USnl45NHjbawTOsCY
	9njjjZ76FRKIGWaGbPCVKJ607+TnvO3u7jbwuZ+G5vwL3AAGmtSlh4Xp/p/LLlcJ
	K23g2IQ/+y6IRzUH+67+RX10OdSMZfkNgM7R4An3BSiRRipQ/zVmkb9WV7VO8aSm
	SqQM2CiC896g7EDxP6LPZjxRHWVfbg2RPADlAVcC8JafqmtRxqnZcV0EJULsYiIF
	0ymbVaSrPdbPOtc2T+6U6vTlf9TqQX4Sx3wqqdyXkolnlnMyCvX2mxwKpde3ntII
	GVSFoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfg6bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:17:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so329873785a.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256633; x=1746861433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqg908SIWMwTmLhHkCP5zPeST6KmZTagNBLZ1+txW/k=;
        b=d5ku+2bCg4rnlnkDWIo7etuCKRunxAJ9sb54umLwNxEkk9RP0vXcOXraDlvgq3Sq8o
         3//4R5irV0ZpX/YkK95XxP8jT3lUcQz+nsJT8ilBcTK0YY63+RVExO/9+0ruqoGKN68n
         ZLZTlwm9Ffup4S90ap2MujgGeYTDH6+FiOLb5SyuIFMz/R40sgBnWepUZYMUMPXs4SkY
         2HxD50KEGDhJT8cOOO2HJn1NlU/yCELwoca2SFFjWslhNhNXwUv7pKTQ7AFQ1gc5J1DT
         hkj4mdZmu0CSTAkyj1+cSFi5Ybaj0BLcmZWwE2xWyGBahQkeDgIdL1HhxqOwopd0+pLb
         E2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVjP0ccnG/kjkWPVx01Gj8CFWYVViJ4voa51k7MyxWhXiElEyhNgsM0EBvpgCUMe9+ipn/Ve7THfrdqo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsnXGTYLLP/GLHONtFib6it94j6lP+JR1eZ/MIgfZl+RqC3Q1n
	lTDq2L5gpM41t5oPRvshyRPaSm42kYPx9f+Gbp15qdLjnqcv9hJ+suaXbZquYctZjZptwp2rqCQ
	Iohuq+2/89EEixhMXy9XVoiJnOtwn03cr7gYfpjSsldmk5Sd3eKyvKJ+dlFcZjlA=
X-Gm-Gg: ASbGncv+qqeRNiyuvRTx7FtbTP7wP98A489aFXBZSkxQTcQEm5M+3SmM0ad71aD3fR7
	QeT4wrId1gV2mJBQr2DuBUU92gxul/+MoLmitj2COjEVVI1omcSEbl+zs+GMe+9POJqWmEeY0y2
	0v6kRhBizYvGsOOXnMfvkDtzOzLvIRWDJGlhJhnYwmQXsPF6LDS7VlfBTKBQp3JD7LnSz13ue04
	qtzxYbqll/eFRRm5UBLi0W7IsfGWdQL70bdhsRKyuzZbh8sVZjhNTNOtPJaK0IgnVNXjJ5Df1n+
	0OTACm04l9bYJvGzHmGBKHadvdyoVrg4RFmJ4FycwYYSh8MtdnYx0YI6woNx60uaXNYSDhZ+v/4
	7Z1S0L4CtXp6QlhTdot8loTkz
X-Received: by 2002:a05:620a:244e:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cae3ab122dmr23768385a.25.1746256632980;
        Sat, 03 May 2025 00:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECXGB0CIIu2ecyT7u8vAg1eMWNirPhcQIEsdIkfsQk1htP9MauQoWor1Y/MMWU2yvQYWnINQ==
X-Received: by 2002:a05:620a:244e:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cae3ab122dmr23766285a.25.1746256632659;
        Sat, 03 May 2025 00:17:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:03 +0300
Subject: [PATCH v2 04/11] drm/msm: get rid of msm_drm_private::num_crtcs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-4-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4461;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x7cM2Rqp4n6JjfWiK8DuKNRjLhu0g1Po0+oqCeMtWC4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLtsFdPNQ6IzgKP6qzeOKCEUKP02mF14ahhK
 ziLZswcrGqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7QAKCRCLPIo+Aiko
 1VhdB/9Z1IZhwrnbkT3rTR6XRW8OhCkiZ/IgYH9M+tii1GEjLj+lS20+G51k89ahrVECY351rb1
 WF8KubJolcytW8ClZk0X9pLNGR6P1fPlujsUC5Av8oT+nUqbp1srnY3vQQ5+RrQn6AHV8ZaAVy9
 ZrLF2rBQLEoLe5FDGHNL3Rmf9/WH+brZIB8y9bynoSnDss6/7kEC4VYHcVZ0UdeqcgbF0MgccI9
 AT+wXdkrVduzswBnROLVxCgRhvpPA7YlQKimT7RvEvrx9mo3sMU8RE7XprGmTKJ1Fad2UJusqkH
 1bJhIbuZrREqLUepMGTb8SSirEzQAU866zsZ5nJfvH5GMDf/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: HTlbpvfLt8IOApdrR2H5_JZ6I86dMiGm
X-Proofpoint-GUID: HTlbpvfLt8IOApdrR2H5_JZ6I86dMiGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX5yhA2Stad0A/
 y7UVpi0MyD8xLGwEZ8R4xCe9OAubz3P/0IJN3Q7v6+yE4DybKZ6nXTEl33GH075Tk42kZ/QsD9R
 fzLmVH64DO6+hgVLwaY34SC7M6iPk4R78txK0fZu3x0uN4wim11eVvx06NCgVe4q1C6/m8JZ62L
 YppB5QE2cklj0gOgfyWNjJ1w2xvMN327t9zieJUjKH88hsATHsflrK4JT/voL+J6P3kLSo/KCKw
 CDXcLu2JjvlLWdWmtX9ALwdKcSyuV6zOe7JInRYx44eHTTWjwn4/zMeQj18zEUiGQzR2+4TCFSj
 TWdp1LBDEFH6yC8AseKlhilCDvCGS5yUrFN/3pZ3h3bho1jT5w5DZ2+OJlsQA4UWmGGkJE9OvOD
 dXD39WGsUcUaIqv6O9gwVcyImnBnEseOaNDpj0kme5Jqcg4VlxCzQ1A/JBkTIDcFR5vVF0LW
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6815c2fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=F-HcN3iq_yGV61sY1bgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

Drop superfluous msm_drm_private::num_crtcs in favour of using
drm_mode_config::num_crtc or MAX_CRCS as appropriate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 3 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 +---
 drivers/gpu/drm/msm/msm_drv.h            | 2 --
 drivers/gpu/drm/msm/msm_kms.c            | 4 ++--
 5 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..4b95fbbda8e120c1eb86a23e5397db30145d505a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -874,12 +874,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			ret = PTR_ERR(crtc);
 			return ret;
 		}
-		priv->num_crtcs++;
 	}
 
 	/* All CRTCs are compatible with all encoders */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 00920bd44f6f73099ff2c293473e427caa49b873..99ca1d6c54b2c24cde39de44bb55151576dbe188 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -296,7 +296,6 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 static int modeset_init(struct mdp4_kms *mdp4_kms)
 {
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_plane *plane;
 	struct drm_crtc *crtc;
 	int i, ret;
@@ -346,8 +345,6 @@ static int modeset_init(struct mdp4_kms *mdp4_kms)
 			ret = PTR_ERR(crtc);
 			goto fail;
 		}
-
-		priv->num_crtcs++;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3fcca7a3d82e7aaa74379b19763c22eb43c953dd..5a706be17e2e5af2148366eacdddb378b2f69dbd 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -374,7 +374,6 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 static int modeset_init(struct mdp5_kms *mdp5_kms)
 {
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	unsigned int num_crtcs;
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
@@ -442,7 +441,6 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 			DRM_DEV_ERROR(dev->dev, "failed to construct crtc %d (%d)\n", i, ret);
 			goto fail;
 		}
-		priv->num_crtcs++;
 	}
 
 	/*
@@ -450,7 +448,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * crtcs for the encoders
 	 */
 	drm_for_each_encoder(encoder, dev)
-		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
+		encoder->possible_crtcs = (1 << dev->mode_config.num_crtc) - 1;
 
 	return 0;
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index cc603bd4729e909e9381a3c277db262b13361de6..09d5f57e9343cce404d4f8a3a6d8a285f662f60f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -177,8 +177,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	unsigned int num_crtcs;
-
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
 	/* VRAM carveout, used when no IOMMU: */
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 49a56873100b2fdcded3eb6adcc7032bf404212c..9dfe0fb4755ddd11277f524234297ccd5ea96001 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -245,7 +245,7 @@ void msm_drm_kms_uninit(struct device *dev)
 	flush_workqueue(kms->wq);
 
 	/* clean up event worker threads */
-	for (i = 0; i < priv->num_crtcs; i++) {
+	for (i = 0; i < MAX_CRTCS; i++) {
 		if (priv->event_thread[i].worker)
 			kthread_destroy_worker(priv->event_thread[i].worker);
 	}
@@ -313,7 +313,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		sched_set_fifo(ev_thread->worker->task);
 	}
 
-	ret = drm_vblank_init(ddev, priv->num_crtcs);
+	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
 		goto err_msm_uninit;

-- 
2.39.5

