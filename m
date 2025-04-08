Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4361D54FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120477; cv=none; b=ku8DfzApkVa4wbcKOEBJb+GDmhZezAkRuY3fbMMFHMwzUxT5ecV8adl5wP2X+lofKFtI8FOFGGTBo1E7YUUxo4hzC3CY+fur34pZODbD1Qke92/p1aW2BN9axYT7cLZ+U/IaDHNlBBNsFA5oSz5J+GiC1jx5ZN43TX2L061jOGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120477; c=relaxed/simple;
	bh=m7dH730YTdioUF5BVViTo6J7jKQSmTmURsxOFoLc+Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+fuFl2WQ7qOXCbq6ty0598KYSGqyZWqR32QqFjWlAG3ZGA/BR2u4+l2k7qRFI449Irk2obgBsoX1SNTxxx0BeEBS7Ls49sBMQwv8gs/8Z9VDGfy7LIEs318T9A7qO3RLwLde/tmdwGKUa0CTAobiWprRU0J0oljmeHF4UK9vtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnFwscvg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnFwscvg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BCxi2014460
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 13:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoddT4WTJIJT0yNhT4FC4b/bYXrodo9njax9aVNsabE=; b=RnFwscvgRGaY79kn
	CufrIekzoCXLRuK4GT6Br4LqUZ/MXzkW16QwRiGW94WlUpnHdZy5ZautnWgy9Psc
	6xWLFuSZRpua+C2ky1MIoiZOlT7D2CujIvLgdWBwz3TYLPYGZ4JOZubi6yljjAvf
	JRAKbKwUKl/dBQHt90//P8HYlU/EDekO2TJESAAYxc9Xz1qoLU1Wm8GKiR658qmK
	3Elg9YIcVfUQH5VIkyDwqTabJeW23B0wVFQSbuIxFIMilfEXYhYru2vTPUmGGb28
	pmBK1FiwuaekPL6PhF31u5BFdOzBNL8D8b43Ysjp5QPdSY9zIekIV1oojEMY6ese
	91eQRQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm7wq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:54:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91d8a7165so94871976d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120472; x=1744725272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoddT4WTJIJT0yNhT4FC4b/bYXrodo9njax9aVNsabE=;
        b=CwNUhcjbLstycyNOBTJKjMHKovvSwbYztf1EqCZgS1s94kbHQMUxQG928sqSBkyXBU
         fuLUj6jibq36My3wBuJlrQPc1vbOTnRX/KdzvSI0YYoW6kUoDQR23THymDd/+TRwmWfJ
         muiYhRZbx2CJ47hzqNg7jX0R5ychygX2IdAzS5BK46tu1Ef9zsUdcuXRfxYmVylUl8AC
         7snfpezeWdOi//AJd257W1S+qDQVkFqnBdhM8sinUh2UAj9lO0KlgGpiwO5ltKG1XJrY
         Xk1mdWrXZgzRNeH7oeXqgrJXiBwl5/m2XrH6hXcDv855y/xgOclnL9Ae/VowRmui6OXt
         1/jg==
X-Forwarded-Encrypted: i=1; AJvYcCVFGQK6xcaMZIICGiQe4M8Z3VhWGfqMIzjZO/wIKlsXf+97eqh1yFhy97qyQtPafKXgpsZqAziAr6zUkOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGiJRzr4/O19GOzt7oB4p1mg9jzFH93AA93VNuML0NOpG1yjq
	oqXeGm8pnzO9laTS9wJ1a5wCr140C7CxAd9cc4wJWb54gq1w+fFc+x2fz61bjBnLjQBoqfjdem6
	gw5VL3pFU7MhBQvbx7LC9aM1QkmYAv8dBCfJ5jASW3u0eMnVH9mPK5nogLovmhEc=
X-Gm-Gg: ASbGncsJERKFU1fCiRdkJh5iqg8vY4YrGp7R9BoSte6v3r5vHcm91+k52VyIslmYXUY
	QFDEpFrLB/t3UjNeJOmlOjvfKrPn41XK6fz0gmG+T87JcXy78ydupHOoqCBUF9YGRkCXo8AZ8kw
	2EVEXUsTTVWzhkPiz9RtxcmxhaVSVAGu8xc4ghsbyZBT9lLwP0gjnfPomw5GXNX8xgEmk1Ea5ag
	i6HTrqwhD+zwBEzUr8sPQe4Lg+2jaF3lU+CqgPDC6+al/qZslV1U1F7SFzy0wajbGCopKLQP/1B
	dN7iNVehSrBxBlsv+0TwiMl8SxnxB0oegh6ReqVZps+Z1Q3X0b0Qz/SjKJNcCbWA/yysRp4YoT1
	wFBuzzuaZTtT5knDL0LleFkna41Ec
X-Received: by 2002:ad4:5d6f:0:b0:6e8:f945:ec5 with SMTP id 6a1803df08f44-6f0b74a2698mr150976986d6.24.1744120472376;
        Tue, 08 Apr 2025 06:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHo5PtguWrlPQkg7PzNT6JSePd3gmBOQfxAcQUB3c3JU0H5P9uXM23N437IMVVcobqB10EG3g==
X-Received: by 2002:ad4:5d6f:0:b0:6e8:f945:ec5 with SMTP id 6a1803df08f44-6f0b74a2698mr150976406d6.24.1744120471980;
        Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672306sm1515306e87.237.2025.04.08.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:54:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:54:27 +0300
Subject: [PATCH v2 3/3] drm/msm/hdmi: use new helper for ACR tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-hdmi-acr-v2-3-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6543;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m7dH730YTdioUF5BVViTo6J7jKQSmTmURsxOFoLc+Wo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9SqRUveFfRw04aerqV4P1mxeRUVXtv2YfHPig
 cIqw6Sz6R+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UqkQAKCRCLPIo+Aiko
 1cPYCACXyHEU5d593vgc9iDjQqplYCWxJZ93UbGcZfD1ZH0Xfqdy1Qtquvs1tTi+yEuDsXtp578
 EUJZJws/+kRBMjcM95QDIJiWifHuirYizSbSpj6d/qi8qfGh54EK9TEG1azNWdwgwqYjG/VMWDv
 vt5tJivF4ADAa2D0YzINUtR4WE4/+fuMZsrOchgAecygGGIxEKcQdmgZeZNKIP4pYrKLRw/PluH
 gVr+B3LM3NMq+VO8GGBsi+F43msoMbFC/t7vUdjdKPMtVm9EcKoTHqyhfeoE0iBVZdOY4zOYagj
 HzhkW/3QEMqUTUN5r1BmzIglWJ2TUxYe4gtA/qlbCy8TBkaE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: l6F5lMMPu3LlrJXVM55gwSB3Vk_D3hyB
X-Proofpoint-ORIG-GUID: l6F5lMMPu3LlrJXVM55gwSB3Vk_D3hyB
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f52a9a cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=qxPvP1J6ODAoBo1RHxQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080098

Use new drm_hdmi_acr_get_n_cts() helper instead of hand-coding the
tables. Instead of storing the rate 'index', store the audio sample rate
in hdmi->audio.rate, removing the need for even more defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c | 107 +++-------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 8bb975e82c17c1d77217128e9ddbd6a0575bb33d..b9ec14ef2c20ebfa03c30994eb2395f21b9502bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 #include <linux/hdmi.h>
@@ -12,71 +13,9 @@
 
 #include "hdmi.h"
 
-/* Supported HDMI Audio sample rates */
-#define MSM_HDMI_SAMPLE_RATE_32KHZ		0
-#define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
-#define MSM_HDMI_SAMPLE_RATE_48KHZ		2
-#define MSM_HDMI_SAMPLE_RATE_88_2KHZ		3
-#define MSM_HDMI_SAMPLE_RATE_96KHZ		4
-#define MSM_HDMI_SAMPLE_RATE_176_4KHZ		5
-#define MSM_HDMI_SAMPLE_RATE_192KHZ		6
-#define MSM_HDMI_SAMPLE_RATE_MAX		7
-
-
-struct hdmi_msm_audio_acr {
-	uint32_t n;	/* N parameter for clock regeneration */
-	uint32_t cts;	/* CTS parameter for clock regeneration */
-};
-
-struct hdmi_msm_audio_arcs {
-	unsigned long int pixclock;
-	struct hdmi_msm_audio_acr lut[MSM_HDMI_SAMPLE_RATE_MAX];
-};
-
-#define HDMI_MSM_AUDIO_ARCS(pclk, ...) { (1000 * (pclk)), __VA_ARGS__ }
-
-/* Audio constants lookup table for hdmi_msm_audio_acr_setup */
-/* Valid Pixel-Clock rates: 25.2MHz, 27MHz, 27.03MHz, 74.25MHz, 148.5MHz */
-static const struct hdmi_msm_audio_arcs acr_lut[] = {
-	/*  25.200MHz  */
-	HDMI_MSM_AUDIO_ARCS(25200, {
-		{4096, 25200}, {6272, 28000}, {6144, 25200}, {12544, 28000},
-		{12288, 25200}, {25088, 28000}, {24576, 25200} }),
-	/*  27.000MHz  */
-	HDMI_MSM_AUDIO_ARCS(27000, {
-		{4096, 27000}, {6272, 30000}, {6144, 27000}, {12544, 30000},
-		{12288, 27000}, {25088, 30000}, {24576, 27000} }),
-	/*  27.027MHz */
-	HDMI_MSM_AUDIO_ARCS(27030, {
-		{4096, 27027}, {6272, 30030}, {6144, 27027}, {12544, 30030},
-		{12288, 27027}, {25088, 30030}, {24576, 27027} }),
-	/*  74.250MHz */
-	HDMI_MSM_AUDIO_ARCS(74250, {
-		{4096, 74250}, {6272, 82500}, {6144, 74250}, {12544, 82500},
-		{12288, 74250}, {25088, 82500}, {24576, 74250} }),
-	/* 148.500MHz */
-	HDMI_MSM_AUDIO_ARCS(148500, {
-		{4096, 148500}, {6272, 165000}, {6144, 148500}, {12544, 165000},
-		{12288, 148500}, {25088, 165000}, {24576, 148500} }),
-};
-
-static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(acr_lut); i++) {
-		const struct hdmi_msm_audio_arcs *arcs = &acr_lut[i];
-		if (arcs->pixclock == pixclock)
-			return arcs;
-	}
-
-	return NULL;
-}
-
 int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
-	const struct hdmi_msm_audio_arcs *arcs = NULL;
 	bool enabled = audio->enabled;
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
 	uint32_t audio_config;
@@ -94,15 +33,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		enabled = false;
 	}
 
-	if (enabled) {
-		arcs = get_arcs(hdmi->pixclock);
-		if (!arcs) {
-			DBG("disabling audio: unsupported pixclock: %lu",
-					hdmi->pixclock);
-			enabled = false;
-		}
-	}
-
 	/* Read first before writing */
 	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
 	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
@@ -116,15 +46,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		uint32_t n, cts, multiplier;
 		enum hdmi_acr_cts select;
 
-		n   = arcs->lut[audio->rate].n;
-		cts = arcs->lut[audio->rate].cts;
+		drm_hdmi_acr_get_n_cts(hdmi->pixclock, audio->rate, &n, &cts);
 
-		if ((MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate)) {
+		if (audio->rate == 192000 || audio->rate == 176400) {
 			multiplier = 4;
 			n >>= 2; /* divide N by 4 and use multiplier */
-		} else if ((MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate)) {
+		} else if (audio->rate == 96000 || audio->rate == 88200) {
 			multiplier = 2;
 			n >>= 1; /* divide N by 2 and use multiplier */
 		} else {
@@ -137,13 +64,11 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_AUDIO_PRIORITY;
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_N_MULTIPLIER(multiplier);
 
-		if ((MSM_HDMI_SAMPLE_RATE_48KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate))
+		if (audio->rate == 48000 || audio->rate == 96000 ||
+		    audio->rate == 192000)
 			select = ACR_48;
-		else if ((MSM_HDMI_SAMPLE_RATE_44_1KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate))
+		else if (audio->rate == 44100 || audio->rate == 88200 ||
+			 audio->rate == 176400)
 			select = ACR_44;
 		else /* default to 32k */
 			select = ACR_32;
@@ -204,7 +129,6 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	unsigned int rate;
 	int ret;
 
 	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
@@ -214,25 +138,12 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 
 	switch (params->sample_rate) {
 	case 32000:
-		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
-		break;
 	case 44100:
-		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
 	case 48000:
-		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
-		break;
 	case 88200:
-		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
 	case 96000:
-		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
-		break;
 	case 176400:
-		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
 	case 192000:
-		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
 		break;
 	default:
 		drm_err(bridge->dev, "rate[%d] not supported!\n",
@@ -245,7 +156,7 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	hdmi->audio.rate = rate;
+	hdmi->audio.rate = params->sample_rate;
 	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 

-- 
2.39.5

