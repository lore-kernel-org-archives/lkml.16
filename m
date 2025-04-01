Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9E1E2312
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743484329; cv=none; b=EO+XkkAhNjJskqwHQcJm3IIUkQBYokgk7qPdHD5QvFtZqa3+TGxIt2gvQvoUTJ12j1VAG5Hs/o90TJTwKGm06D2kw+1XBDtnHlCLrENwTWOsCHLa0NWlCv1cNvpMd3MZhN2bDfKw0RUqy3l9p2AdD8KuCPGmgkdjD12HfBzF5uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743484329; c=relaxed/simple;
	bh=MlFndke6G/BiAttpO7gjjEBObPGtgF0yacJKuJFSOi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5wETS9UMvLYihkkk1G9rksGJ9xJ7bJvs1/Tfi5Hb1W/PmHoGHN8LvDHAGHk4LPtYOZOETsddU+me0/p+rhy1Yb+8wXG1tVQbp05N1cXckgojfASywNfMB13WaJ+vMYzommF7rn1vUKFTFVxNhEOOWoktXFcv6gWBpMJ0qlQlnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwJh+sYM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwJh+sYM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKCt94019810
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 05:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0UCfqpWUdUcNvimGZ1R1IpBbubClaHeqHcxpWdaScnE=; b=jwJh+sYMtDYECFOC
	GDaeEH5NXWRKXhM6QRPdmkX2HTCptptJwQQZHu/EL/MDFiWhXCNno9yhamXzGlrp
	YfS4eMJIQT44YJ1rqPKVRjBONr0LDXZ97LB6bb9Zf1ldaOefLijq3IBjT/v7FnXy
	TKi9lQqoobD+7eXvheydE5MYxQFbhKGfqYw9m7F7aIeX4b1AKjYBxQ4bDL3bq1qm
	hGujtoilQUyKBb9oiUJIfAcMTsQHMC29sQ+uG6zaIWALU9Lf/piSiEdqj/EJ9aRp
	e8MXXozoAXHD4JZ7R7+EgRxa2VnFWmWy8c2Z4XfyUMBd3uaqeImnA75lulQ5KLng
	iUHvkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1vn90hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:12:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so951334385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743484326; x=1744089126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UCfqpWUdUcNvimGZ1R1IpBbubClaHeqHcxpWdaScnE=;
        b=ZEujTNfFZgZtBwSUFGRpY57jX52HalsWvd2cznQR+sxWAGhdN8Qkz85QLJlBglqkqH
         k3o4M4UtJNbAj6Bk+vvnfochUSEV7p2EfPz5yvJtRclxIaPMErlPGdH6tKGlqOLQdl/l
         6V4il7c/3Are1r/fDllDVEw491R6gJgMgmQIqT14R1pjPBp7Tf/z3yvWOA8UR/pE2vW4
         Qf3WdRP2DuOt5crhx8S3Uo2LOH3kNMVO0RatPlMq0SrgZFZdF4LOZZWiy6riOGtg6yPn
         LWEQgtXYnEwUcUFYZPBr/WEfsaQja+abYvzwoMIPBj9EtdH+5Rc7xBmnwaoqxGrRiu4J
         7DgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/1qCTAY73+xYxlDpZp0wQG3eBoQAFLEpt/gCMFtKQ/7kepD+0nX76xrf2Psq8QpeigxZq7JvBFDBgoC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+51eNycCI6aBmmxP5vKbPEzr/k1JuZ/M3QRZgMfy2VONPMrDr
	lbNfN5QZO3KRHd9oJAX4vc2sO9jdeOu7dvharCVaaJqWNjNB9wDRmp87pD8wdvHYbj5p/q18FGb
	LsK0x4IDqFDDSxcxQ50GqOECMZvh3dbpxt+xrM2aCKZhCmaqGEMwWyExPFFr4phQ=
X-Gm-Gg: ASbGncs2po25YzHgK5GZ3aXp3hldQGm7XFZnsKlbnL6nn6ttJi4+h0Hm58iYlkOef+d
	GA2zYs+u+DnzYvUuWqJTrbemTXtKCvVVpnYGCjf//38ay+CVjEGzo+TncpSeH9A7a5oDYNUbiyw
	V+GfXU7kwW2AAeLSEm7q2tA5uQ671wzG6B4MroBhDhLmStA+bZ+3sDTf0LXDevoJd8Tt7N23IVO
	K+GdtcGBFDA7pZZAPMfM9pUpRFqcs4sFoNmbXx6sLDfppmxK/n2oClm0EgVqo3Jm6Ur6M2ZWwPw
	lDrUIG78fBAeAydtnF/tHnvC5jUAjcFPVzPuJBcR6FPotQwhTsvBPV4HoyFq3ZNVxROuP39yAL3
	DAg6ar44sVULBV5FF3bGRQPN8pKS2
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c6908757d6mr1708208285a.35.1743484325692;
        Mon, 31 Mar 2025 22:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1zNjxGnB5My+rC0jxfqxqMFbTxnTup9jnK/AiA2lDXPM6z0hy3tkrX7AvXWBzpu54TzEAfQ==
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c6908757d6mr1708206585a.35.1743484325402;
        Mon, 31 Mar 2025 22:12:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:12:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:37 +0300
Subject: [PATCH 5/7] drm/bridge: analogix_dp: inline
 analogix_dp_prepare_panel()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MlFndke6G/BiAttpO7gjjEBObPGtgF0yacJKuJFSOi4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WRhHYAe1OS/1/tk3Sz9qb4KIliPm2jbNOgb
 RtAp4hv+7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kQAKCRCLPIo+Aiko
 1SeJB/99DcUiEZ0lm8NGUnz3EMICHzz708VEx8dlGlQCVd6oQueDlCPIK1fl2K/lFHHmcvMg65q
 0ijG7EnkVwUj8ILoNZO0VtHSfjZTpfVMWecoSy7cNZJ9HZItlcPZ1ZHui3+bPVz47zMj1geQmGP
 Rf2VwMzBc4pkhXs51AstB9xkwZj78rjLlQfLzfXpBpryZh4bp/iqRTdWCVppitXBPP6yrTVgeTB
 fYt0/O7VpAE0+brLpUMLZPY/Bhj/N/6MeJ0BaXi01lXq98yioQWO2xXi/UmdZyVo1jnBcaXIfAF
 Nmck8Q7RhoU7aCLN4HdVAeqdQEfK5BQ+v07+UFMsGOKylkLb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UL3dHDfy c=1 sm=1 tr=0 ts=67eb75a6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=06SpEF9E26xvXwvOrpsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: z1y9w7-1KCrLRiv8_Q7IA9ZX3bGj-5I4
X-Proofpoint-GUID: z1y9w7-1KCrLRiv8_Q7IA9ZX3bGj-5I4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033

The analogix_dp_prepare_panel() is now only calling a corresponding
drm_panel function. Inline it to simplify the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 43 +++++-----------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978..f60068011008482f7b7b2edfcab5fb1b3e9e130f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -955,33 +955,6 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
 }
 
-/*
- * This function is a bit of a catch-all for panel preparation, hopefully
- * simplifying the logic of functions that need to prepare/unprepare the panel
- * below.
- *
- * If @prepare is true, this function will prepare the panel. Conversely, if it
- * is false, the panel will be unprepared.
- *
- * The function will disregard the current state
- * of the panel and either prepare/unprepare the panel based on @prepare.
- */
-static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
-				     bool prepare)
-{
-	int ret = 0;
-
-	if (!dp->plat_data->panel)
-		return 0;
-
-	if (prepare)
-		ret = drm_panel_prepare(dp->plat_data->panel);
-	else
-		ret = drm_panel_unprepare(dp->plat_data->panel);
-
-	return ret;
-}
-
 static int analogix_dp_get_modes(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
@@ -1174,9 +1147,11 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	ret = analogix_dp_prepare_panel(dp, true);
-	if (ret)
-		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	if (dp->plat_data->panel) {
+		ret = drm_panel_prepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
+	}
 }
 
 static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
@@ -1274,9 +1249,11 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
-	ret = analogix_dp_prepare_panel(dp, false);
-	if (ret)
-		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
+	if (dp->plat_data->panel) {
+		ret = drm_panel_unprepare(dp->plat_data->panel);
+		if (ret)
+			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
+	}
 
 	dp->fast_train_enable = false;
 	dp->psr_supported = false;

-- 
2.39.5

