Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA019E826
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447200; cv=none; b=B1YKcCy/TOTdwF6jFsyhaj+YrfK4L71zhAqAtKQO0YINmHkMnp1depwDlnGJPBWE5EZG0EVtxLs55s7obphTZubb8gq6R6j+6VNOFQgldZCmafdOenE9I/jteVcg8V9Jjd70iTMQY+6auAjiu4rA4OoA5ARAq8eaFMibXhT7w3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447200; c=relaxed/simple;
	bh=ZzlersvTLL0IktdHslk0q+4YuV1RN4dfEFDTbtz5HF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RCqg+VuSESi2vyD6/5InTXQzAKBASJMs8UMFx2pPwCHTqIoaCtVahcLM7jmQ7tJiUUbo/xTCNEomCegKi8esIQocYYJFtSf/STLN58F9EEIp50gHs6Ebh3/qJTxzS5G4x0ls3RNSTSoeN3j1imtI6Xe+xSYNk5gWriFZjWFRP5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbMnBILF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbMnBILF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GG5fis027678
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XSqrZKktfGYlTzMTKcLEHsjU48SVzia5cP1WdcYB1I=; b=JbMnBILFq0l5EEVo
	ii0mFGnx82xzEBN1Zt2/199lPsQipWukZo9AIWhuwbzgDEQE2P6cYo8P0FuAxZ27
	+miV/D6GeYlOwpflarmF+CX4GxoN023ypMu9RnQTT+xjuiNhdZg1ZfGxUZuaUsw6
	pC+qH2cBwaImnvC6/AQwdMbXD/2c6t3GBXAYHEvvKAFv4voh//cXXEZYydQdnjXo
	xvsEMm8AH2vdbMmkIMzHFASdvUbgY5uB4MVV/xuNh3PsjXEeDbjK2H+BIlK32Biz
	ILoy9KvMpe50xZP7XhypiSWdCDK109SlecJObl3CrEnt7XzB45noEScpPxlvG9Hj
	PwEU1Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46p01n2m86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8ae3c3d80so38468376d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447196; x=1748051996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XSqrZKktfGYlTzMTKcLEHsjU48SVzia5cP1WdcYB1I=;
        b=kMtPgJCynp5ynqVt9ZhBn+tuxj4h2pavc7Q9kvysmHKgoWH2hQmeckGHicUMqe6JmQ
         JaVJ74orzKWABR6Y1ZyGVVOKltbbHYsyxcOtNTp+Vf1gq6BA9R+s6Bw6ClsGjIKYqJ1j
         M4B4eY+3jbuJV3RuUlH3jbPZ/dpnm/B6imx4NDYZ0X2RlRoSx0hgpWO/18SL8YmnBSfQ
         gYiFAsqKUjEH+TynUBksYjf8SW+7LCekRfu3HIyDTktMoBFlzcdeLAowvdho4FFimFIL
         58B2FzU2g6jlb1n+2/sL0zcq/qUNqCIV/5tX2Ny7g9TGZglXg5Hr4ZXhvwWOtn5Ozrx1
         t0xg==
X-Forwarded-Encrypted: i=1; AJvYcCWAAItY3JfxmRRJYypgqwaseotqNHhzLlKiHXATcf3SUTMkmW2vlWUnhryX8KLK9XY4mrjUF8XeRsurdNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPa0uMrzKp/1olLycOKzkYbvYwfoQAJ3EMtU6s/VXHclqf5bx
	LUrtBWmx2ggVBfB4zwKuFwV9ZjioWnb8wgs5i2xAL87aAn74kmpsV0ncbK2s1sP6CAfVbMQD6Qh
	LGkiJadhc1j98zn7AJptn60afGlvF8uPOL303SvL5y7mOwoXohu+z2aQHgxDsp7A2lGnIvUAb+1
	E=
X-Gm-Gg: ASbGnctDObGnPF6KyjyPbRQaSLX5dvQXRMjP1BtVTw5Nky3tzqv0KZjpVztgBaoLlJx
	a+49GLeoZmvWDCu6qBNx66uUZ0tx++b8s5Qxr6o23RsI4B9obB+nWXFc9dGbWlirdG7Da31pPtU
	dFsU2GV+1dTjIP0YtJl7cn4l/BcVotkrDk2WnxjenCcxA6fRvnwJIS5mA0ecydTpvv0OeorKsJo
	UQhoguauHczl6jF+Gpq2rdTA/Mw/W5Li87IqnFoi1RMYTZGs2zxyBKSYFjZeT2J5jBXQ97tigOt
	biY5tsOxP4SigF3uJdQUSd2ehugHXWCvlhIi0k98UKJWyeokWVdWexsxmdoRBWXKg5hgBDX73uN
	098v0YBD8ynrOvbZLzBY23ygf
X-Received: by 2002:a05:6214:2305:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6f8b0874269mr92587596d6.38.1747447195892;
        Fri, 16 May 2025 18:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ3Od+DNBvMmQ2uQcf4ei7YmmJ8S8iHuw8ZnPu1Q95oM9nKpIu74cA+QdiKV4h8E3Y6m8JzQ==
X-Received: by 2002:a05:6214:2305:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6f8b0874269mr92587376d6.38.1747447195452;
        Fri, 16 May 2025 18:59:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:43 +0300
Subject: [PATCH v6 07/10] drm/vc4: hdmi: switch to generic CEC helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-7-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10627;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZzlersvTLL0IktdHslk0q+4YuV1RN4dfEFDTbtz5HF0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LKuk5lmQupJIkLBk7bJldGXyHjs78yNkP1
 w3Vs/Y3F6aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1TCHB/0bN5Gcan0M1UWVMlTk4lVkU3QefdnJc0FB7/KnhWC9fDfunBk5UIVZjVgQvkIo9q8alO8
 Sp6dDIcYYpSJ1y1bJ+iQxhw5Wcbohrs1Nqa1PGxeWo1yqNfNxR0qT4DSAmLH1/0drb54ov+WVgf
 oVVDlaPrupK4/sdk1w3Li3UBOSA/cU/9rLx3qYVt//2qhzIah23uxAtxL+ae9nFSu57gm27vr/5
 ++EJCzScvCNIoBZXOxoqOQYQqT0AiOd5nPP6BUSw72qUKK/WXBNlBTFZ/5HPn7IOy3OGKf+oxK7
 3uCT8DV25K2dkVQ7uNZzj/ej43ChWk3MIFBYFQvT3VF40BEy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=M4lNKzws c=1 sm=1 tr=0 ts=6827ed9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=a9hgYIhf75voWPlnlJQA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX55gshMDYDYHH
 7yv6zQS8H7DcwYOoN4R2NbA3wh9KENvrJ69MSQQj3go1VA0PxGXfmVZu7ljsLHpp7mFRzwOuk64
 N4U5ZgOiH0HlafMpwvNumSJt6iDXRA/64i/Qq1cS2WWYfRpI9J4xP7pr+DBDQ7yQaP29h0mCkr6
 lnmcoPC+AHbGhcN9ekmXTzoaMNhkE8cPpg0+B8IepkkrSwYe+0f8/Usd40bUy+dB+mDWUttfDEn
 GINt+MtQcL9GrRIUxeLy7oLdwTuf1N1KXyWO4pxUIjeTQ/dw5a8mPVdHJVKHO69ZKR4FoaGLvJe
 neW2fQm2nHlGGnlb0FKslEFivz+3Dkcsg7lRUoOw0rvSCxXCfYbkQwrozVuuSBaAhbVH2da5Vck
 slrZK904KeSmelu+BHORZ7b+R9KqsPuhemVwKHPbSiGi4fSTg1M/hCYVmcPiTYZ9tPbAlxBB
X-Proofpoint-ORIG-GUID: dk43HmgTwZt-wXHzJ7jB7jnH5VKHAuLE
X-Proofpoint-GUID: dk43HmgTwZt-wXHzJ7jB7jnH5VKHAuLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017

Switch VC4 driver to using CEC helpers code, simplifying hotplug and
registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/vc4/Kconfig    |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 137 ++++++++++++++++-------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |   1 -
 3 files changed, 55 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 123ab0ce178157c3b39466f87c7ac39c8470f329..bb8c40be325033632d3e94db87a16b03554ad3af 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -35,6 +35,7 @@ config DRM_VC4_HDMI_CEC
 	bool "Broadcom VC4 HDMI CEC Support"
 	depends on DRM_VC4
 	select CEC_CORE
+	select DRM_DISPLAY_HDMI_CEC_HELPER
 	help
 	  Choose this option if you have a Broadcom VC4 GPU
 	  and want to use CEC.
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4797ed1c21f47992fe4d497d904ee31c824cd449..194a73fb821ae5082f308c81293c22fed0dbda80 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -32,6 +32,7 @@
  */
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/display/drm_scdc_helper.h>
@@ -375,14 +376,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 
 	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	if (status == connector_status_disconnected) {
-		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
-		return;
-	}
-
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-
 	if (status != connector_status_connected)
 		return;
 
@@ -2378,8 +2371,8 @@ static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_rx_msg.len)
-		cec_received_msg(vc4_hdmi->cec_adap,
-				 &vc4_hdmi->cec_rx_msg);
+		drm_connector_hdmi_cec_received_msg(&vc4_hdmi->connector,
+						    &vc4_hdmi->cec_rx_msg);
 
 	return IRQ_HANDLED;
 }
@@ -2389,15 +2382,17 @@ static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
 	struct vc4_hdmi *vc4_hdmi = priv;
 
 	if (vc4_hdmi->cec_tx_ok) {
-		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
-				  0, 0, 0, 0);
+		drm_connector_hdmi_cec_transmit_done(&vc4_hdmi->connector,
+						     CEC_TX_STATUS_OK,
+						     0, 0, 0, 0);
 	} else {
 		/*
 		 * This CEC implementation makes 1 retry, so if we
 		 * get a NACK, then that means it made 2 attempts.
 		 */
-		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_NACK,
-				  0, 2, 0, 0);
+		drm_connector_hdmi_cec_transmit_done(&vc4_hdmi->connector,
+						     CEC_TX_STATUS_NACK,
+						     0, 2, 0, 0);
 	}
 	return IRQ_HANDLED;
 }
@@ -2554,9 +2549,9 @@ static irqreturn_t vc4_cec_irq_handler(int irq, void *priv)
 	return ret;
 }
 
-static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
+static int vc4_hdmi_cec_enable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	/* clock period in microseconds */
 	const u32 usecs = 1000000 / CEC_CLOCK_FREQ;
@@ -2621,9 +2616,9 @@ static int vc4_hdmi_cec_enable(struct cec_adapter *adap)
 	return 0;
 }
 
-static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
+static int vc4_hdmi_cec_disable(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2657,17 +2652,17 @@ static int vc4_hdmi_cec_disable(struct cec_adapter *adap)
 	return 0;
 }
 
-static int vc4_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+static int vc4_hdmi_cec_adap_enable(struct drm_connector *connector, bool enable)
 {
 	if (enable)
-		return vc4_hdmi_cec_enable(adap);
+		return vc4_hdmi_cec_enable(connector);
 	else
-		return vc4_hdmi_cec_disable(adap);
+		return vc4_hdmi_cec_disable(connector);
 }
 
-static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
+static int vc4_hdmi_cec_adap_log_addr(struct drm_connector *connector, u8 log_addr)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2693,10 +2688,10 @@ static int vc4_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	return 0;
 }
 
-static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+static int vc4_hdmi_cec_adap_transmit(struct drm_connector *connector, u8 attempts,
 				      u32 signal_free_time, struct cec_msg *msg)
 {
-	struct vc4_hdmi *vc4_hdmi = cec_get_drvdata(adap);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *dev = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	u32 val;
@@ -2739,84 +2734,65 @@ static int vc4_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return 0;
 }
 
-static const struct cec_adap_ops vc4_hdmi_cec_adap_ops = {
-	.adap_enable = vc4_hdmi_cec_adap_enable,
-	.adap_log_addr = vc4_hdmi_cec_adap_log_addr,
-	.adap_transmit = vc4_hdmi_cec_adap_transmit,
-};
-
-static void vc4_hdmi_cec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	cec_unregister_adapter(vc4_hdmi->cec_adap);
-	vc4_hdmi->cec_adap = NULL;
-}
-
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_init(struct drm_connector *connector)
 {
-	struct cec_connector_info conn_info;
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (!of_property_present(dev->of_node, "interrupts")) {
-		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
-		return 0;
-	}
-
-	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
-						  vc4_hdmi,
-						  vc4_hdmi->variant->card_name,
-						  CEC_CAP_DEFAULTS |
-						  CEC_CAP_CONNECTOR_INFO, 1);
-	ret = PTR_ERR_OR_ZERO(vc4_hdmi->cec_adap);
-	if (ret < 0)
-		return ret;
-
-	cec_fill_conn_info_from_drm(&conn_info, &vc4_hdmi->connector);
-	cec_s_conn_info(vc4_hdmi->cec_adap, &conn_info);
-
 	if (vc4_hdmi->variant->external_irq_controller) {
 		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-rx"),
 						vc4_cec_irq_handler_rx_bare,
 						vc4_cec_irq_handler_rx_thread, 0,
 						"vc4 hdmi cec rx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 
 		ret = devm_request_threaded_irq(dev, platform_get_irq_byname(pdev, "cec-tx"),
 						vc4_cec_irq_handler_tx_bare,
 						vc4_cec_irq_handler_tx_thread, 0,
 						"vc4 hdmi cec tx", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 	} else {
 		ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0),
 						vc4_cec_irq_handler,
 						vc4_cec_irq_handler_thread, 0,
 						"vc4 hdmi cec", vc4_hdmi);
 		if (ret)
-			goto err_delete_cec_adap;
+			return ret;
 	}
 
-	ret = cec_register_adapter(vc4_hdmi->cec_adap, &pdev->dev);
-	if (ret < 0)
-		goto err_delete_cec_adap;
+	return 0;
+}
+
+static const struct drm_connector_hdmi_cec_funcs vc4_hdmi_cec_funcs = {
+	.init = vc4_hdmi_cec_init,
+	.enable = vc4_hdmi_cec_adap_enable,
+	.log_addr = vc4_hdmi_cec_adap_log_addr,
+	.transmit = vc4_hdmi_cec_adap_transmit,
+};
+
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
+{
+	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
+
+	if (!of_property_present(dev->of_node, "interrupts")) {
+		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
+		return 0;
+	}
 
 	/*
-	 * NOTE: Strictly speaking, we should probably use a DRM-managed
-	 * registration there to avoid removing the CEC adapter by the
-	 * time the DRM driver doesn't have any user anymore.
+	 * NOTE: the CEC adapter will be unregistered by drmm cleanup from
+	 * drm_managed_release(), which is called from drm_dev_release()
+	 * during device unbind.
 	 *
 	 * However, the CEC framework already cleans up the CEC adapter
 	 * only when the last user has closed its file descriptor, so we
 	 * don't need to handle it in DRM.
 	 *
-	 * By the time the device-managed hook is executed, we will give
-	 * up our reference to the CEC adapter and therefore don't
-	 * really care when it's actually freed.
-	 *
 	 * There's still a problematic sequence: if we unregister our
 	 * CEC adapter, but the userspace keeps a handle on the CEC
 	 * adapter but not the DRM device for some reason. In such a
@@ -2827,19 +2803,14 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 	 * the CEC framework already handles this too, by calling
 	 * cec_is_registered() in cec_ioctl() and cec_poll().
 	 */
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_cec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
-	return 0;
-
-err_delete_cec_adap:
-	cec_delete_adapter(vc4_hdmi->cec_adap);
-
-	return ret;
+	return drmm_connector_hdmi_cec_register(&vc4_hdmi->connector,
+						&vc4_hdmi_cec_funcs,
+						vc4_hdmi->variant->card_name,
+						1,
+						&pdev->dev);
 }
 #else
-static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
+static int vc4_hdmi_cec_register(struct vc4_hdmi *vc4_hdmi)
 {
 	return 0;
 }
@@ -3244,7 +3215,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		goto err_put_runtime_pm;
 
-	ret = vc4_hdmi_cec_init(vc4_hdmi);
+	ret = vc4_hdmi_cec_register(vc4_hdmi);
 	if (ret)
 		goto err_put_runtime_pm;
 
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index a31157c99bee6b33527c4b558fc72fff65d2a278..8d069718df00d9afc13aadbb12648e2bb75a1721 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -147,7 +147,6 @@ struct vc4_hdmi {
 	 */
 	bool disable_wifi_frequencies;
 
-	struct cec_adapter *cec_adap;
 	struct cec_msg cec_rx_msg;
 	bool cec_tx_ok;
 	bool cec_irq_was_rx;

-- 
2.39.5

