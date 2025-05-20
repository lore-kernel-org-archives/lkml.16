Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9233925F991
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781108; cv=none; b=FC7+g9qAZvEBLfz/q496Z5QrQuGONq0Fz4NlqbgI4OJlfMP5/Vr72UPKqKpOLlHqbVH8F7cQJEb9KMoOjQ8CFLwO13hl68sm6qG634Gc5FQWiVtv2yUHz+LOcTnSfhNlHEjcXXBSvsDS6gPduY/garYhp/w3jHSW5QArP7gvKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781108; c=relaxed/simple;
	bh=VAb/INTFSxykyKoP2iB/oVu33aLfKYTg1TFIdnlkWLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XcMF/p1Bvn9HPEt3WtSxjKiVytrlokLsnL93gPxgU3u9Fk2v6Ok57f6re8TgReh8EtOU9/byVFefXkus1IJxkH3TZao5K4c25MSwg82tf56JnCyJkwMWfA4Xhcv+Zj+LOMgv7m7fPxQjKm2Gb/yEFZbS8aA7DAGAsBK7iOG4G4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3Tn23O8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3Tn23O8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdr8Y000529
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=++zDW0mhWqa7l0gISmXxCH
	WJOayo8D+h/SSCEoSJ5uA=; b=h3Tn23O8j5FYgPF3qyb4uh4+7Ys4qei57teQnz
	7VsZy6O/j1BEP0hX4+c05m8q0LqjY94u3FTmhKNnNTu1IuB7oilOAymYYB3Fc8qm
	l93JTpFP047s0qXodlmKQFl1fmwoo3TauDULQLImVIMU9iLElc7wDDCj5Xk2Tc2G
	iBpCj3oEFQwfYS2/sCFXYj35pEA7R6wWVVPPgufiS+wJc0AbMpLg5aXAmUQhv1zb
	R95erKvwZgj/0Fmj13WilcQSFR1wGsc7FqtFTV7HjqHuC2RWVKVx5shcd2s6gm1P
	vIKTCfrbr3QPg7tQiKsHE3avPyeIvR+Mr/LmRbMQOpeotPvg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf18u5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:45:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8ae0417b6so109235816d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781099; x=1748385899;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++zDW0mhWqa7l0gISmXxCHWJOayo8D+h/SSCEoSJ5uA=;
        b=EABW5LXTnf1B72QZerxhVa+YWD6oAO9ig3KhEIN0O8F0ChiqbotCCE2d9InzGJVS4Z
         +LuIdUl8Dg7RWV7qSu5IWx7pcgrl197tVJmAY4Th+aDNM/o9Siz5+129lpcKjC9aWdAn
         C94SOQ5oMqOxbvMYoT3P+p8GOwvyrsmtkqXfszT2D9RHCRxEmREL77vob5pPiNfRHFHz
         zhQZ7XcZYJu5S8DjnismajRPGnI5AH770JGV28wp0bNHLRyBxtucJWHET2/fiMnHQ8H5
         63DkNF7Fn2/winTFs0vcSagp3f9SmvlqhLZG/8x4cV8BKoAflMUWhwxurcWFOo3kdCOV
         1qKw==
X-Forwarded-Encrypted: i=1; AJvYcCWe3zKMqA28jCPLDmxXxBf8FLS8Aiv3pB5Q3mHaob78DGi8j2j9pGMID1BbLXNWAiCCemqAVe6rs/GsQus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDpWeHE1IZXyU3zWEI60HxeqVGVVix/EZZIn60QjgVfAD6CeOg
	8E25lpw+j1d7pAsVHESL1npvMbhFYYRiKL2GiTM7M8HMTHh5HQB7500hEd+rTQAt3oJOT6xn78q
	iwRnoKhC6LKrcmnILhdshCSzSjo5LhdXsffye/Rur529BsaZcbZobz0ll8uCURvYZWhc=
X-Gm-Gg: ASbGncvbZmdkQGXDQiNNyaCsiSgc4PkMRsBw8kWp/wc3wkjSvSzUW/XhJLDjEOdApck
	1wgMfyStDGdFjo95UeWBGa5ZB0vyeqWI0aIKeNS/XXZR5E/jZ24a1KuDooR35V2oXxbu00IWNHo
	ZDmcmfP1LUtNCSjYf27BEJtuumL/cJJqqA+h40m2LHCYEUT/WBzhCR0C/pZ1iawsnYmeoX4vNxT
	B/9sgJuZQ+dqJZaaXxp6HEzBU+8EMeUSs41qxxGaKf/TsMoAYMulbH2PTIj2mgVcfjqzd6vOuci
	vCr5KSjRAKHPqHt47k8FpFPL0EY1ZwR7pk5aJTvBQfwgM7p4n05RpPYRf59yPHfI8Yg6S+EA7kO
	LBLJLcnO1beZbilpNNy5IcQVu
X-Received: by 2002:a05:6214:1c09:b0:6f8:a978:d46 with SMTP id 6a1803df08f44-6f8b080b5c3mr340078516d6.19.1747781098828;
        Tue, 20 May 2025 15:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFutvVXuYLOQZT9bw6SI0UUfS3clNxEoFUq9Fa5LJ9zEtAhDTK3N2NMMZ1tj9WzAdv0q5YXmw==
X-Received: by 2002:a05:6214:1c09:b0:6f8:a978:d46 with SMTP id 6a1803df08f44-6f8b080b5c3mr340078146d6.19.1747781098393;
        Tue, 20 May 2025 15:44:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cf9fsm2536460e87.190.2025.05.20.15.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:44:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 21 May 2025 01:44:55 +0300
Subject: [PATCH v7] drm/vc4: hdmi: switch to generic CEC helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-drm-hdmi-connector-cec-v7-1-a1ea1724785c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOYFLWgC/3XRy27CMBAF0F9BXtfp+J2w4j+qLvwKWCJJsUNEh
 fj3TkIRlWg2I4+le3wlX0mJOcVCtpsryXFKJQ09LuZtQ/zB9vtIU8CdcOCScS5oyB09hC5RP/R
 99OOQqY+eCtkA97GWxhmC4a8c23RZ4I/P+57j6Yz+eL8kzpaISNelcbuZ1S4V//440D5eRjInD
 6ngI99Lw4kt0d8yaq3MxChQV4OowWvDOdsdU2/zUA15v5gTfzgKGINVh6PTgDa+boXUWrw44o/
 D9aoj0FFOOR5ko3SwL458OjhWHYmONUxzsEoGBS+OejoSzKqj0AFZQ+MYBA56N5RSnc72OP9Hh
 eOu6aem2LqmURNKKxacblnj/tFut9sPHi2u4GsCAAA=
X-Change-ID: 20241223-drm-hdmi-connector-cec-34902ce847b7
To: Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13646;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VAb/INTFSxykyKoP2iB/oVu33aLfKYTg1TFIdnlkWLE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLQXnyvHFbcEDlFdpu6sE0UKcdHmdxS7hUzyTr
 KHYqVCMxF2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC0F5wAKCRCLPIo+Aiko
 1QGoB/0SViyoHLYG2EQDjpNmXGYYGsE2dHFXu/KwEZ+zu8nt7vMR1D3a4xcvDvqMSjBgDGbDAae
 r+AyJ3reQixqaJuahNGEFTpJEZGN63Lb7RQopqw6oRdahEYBc5W+a3qP7DCnOnfO1ZeaC3Zp4Jk
 +8HcsxQ9yMAIHgfdUDCmfvPVwd3ErYKfv8/YlXZ6dHyoapXcmp3KKHM3HrvxVNd3rZ3N4PcKqlt
 iG7LJNsc9ZemKUxq5G5H8tzrmV/c9CKhZ5+KIfVXSy70m8Ta61LU6p5cCpEhTZphQ2rWj71cc13
 HiQ8JclNwahmGKMUxVYHD2sWUcvwocRtQeake28TmDae3E9f
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Bjn9gJ4EMYk1YqEFzBH2o0FyoVhom2p3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE4NCBTYWx0ZWRfX9SC7rn8FJJ9Q
 azwRqEampewd+om03EvsUoGGv1ZCzDpV2NHP8dytO6QTAsW2FMvZ9+nvhQswb0m5DZKxAOOOQ3Q
 sthpp5cm37p80VapYoGvYFd9Mynti5qfjLqsqUKp89YKepFhE3wDQv1yPDxWKk2Dj7YR/WGTleh
 H0v0sorEBDGwQcyyIMEzHWr8gBlL3qAvxtP7H4DQfsHwlHkp4HYkICH0IkWwWPdB8uHuFOj9E75
 F0Cs2BcMIBTSszJOL2uCAfg55uF228+jQv5aazPblH7NotXHO6pGHrJP4tRH1csGVi6EDjfmUOX
 bAXdNPQZWLgW6pY5wY7TPaWU96WO39vleoE2uikIHFV+SZogDRkyDHoWysWKjsVrQP98mJOlL+h
 ldqAnzTXoKFhXHw9qjgcym6/olSYdK6wplBj3ds2/SBialflch+AjaN3Veg85RMGkfc03gUI
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682d05ec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=OObKh_pN1NuGipoYyuwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Bjn9gJ4EMYk1YqEFzBH2o0FyoVhom2p3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200184

Switch VC4 driver to using CEC helpers code, simplifying hotplug and
registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
This is a part of the HDMI CEC rework, posting separately to let it be
tested by the maintainers.
---
Changes in v7:
- Dropped all applied patches, keeping just VC4
- Link to v6: https://lore.kernel.org/r/20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com

Changes in v6:
- Fixed vc4 to build with changed API (Maxime)
- Reworked helpers to use drmm to unregister CEC implementations
  (Maxime)
- Expanded commit message to explain void *data design (Maxime)
- Dropped extra include of drm_connector.h from drm_hdmi_cec_helper.h
  (Jani)
- Link to v5: https://lore.kernel.org/r/20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com

Changes in v5:
- Fixed the check in adv7511_bridge_hdmi_tmds_char_rate_valid().
- Major rework of HDMI CEC to follow 'helpers' design. Implemented
  generic data structures that can be used for both CEC notifiers and
  CEC adapters (Maxime).
- Link to v4: https://lore.kernel.org/r/20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org

Changes in v4:
- Rebased on top of drm-misc-next + commit 78a5acf5433d ("drm/display:
  hdmi: Do not read EDID on disconnected connectors")
- Moved 'select DRM_DISPLAY_HDMI_CEC_HELPER' under the
  DRM_I2C_ADV7511_CEC symbol
- Fixed documentation for @hdmi_audio_i2s_formats to describe default
  behaviour.
- Split drm_connector_cleanup() patch from the patch adding CEC-related
  data structures (Maxime).
- Documented that CEC mutex protects all data fields in struct
  drm_connector_cec (Maxime).
- Improved drm_connector_cec_funcs.unregister() documentation.
- Documented struct drm_connector_hdmi_cec_adapter_ops fields. Added a
  note to the commit message on the difference between it and struct
  drm_connector_cec_funcs (Maxime).
- Fixed Kconfig dependencies.
- Link to v3: https://lore.kernel.org/r/20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org

Changes in v3:
- Moved default available_las setting to
  drm_connector_hdmi_cec_register(), allowing drivers to pass 0 instead
  of CEC_MAX_LOG_ADDRS.
- Reworked drm_bridge interface to store opaque pointer and interpret it
  as drm_connector in CEC helpers code.
- Fixed EINVAL checks in drm_connector_hdmi_cec_register().
- Added the adv7511 patch, demonstrating CEC helpers for the DRM
  bridges.
- Link to v2: https://lore.kernel.org/r/20250110-drm-hdmi-connector-cec-v2-0-9067c8f34663@linaro.org

Changes in v2:
- Refactored CEC funcs, adding more wrappers to provide more consistent
  interface (Maxime)
- Removed export of drm_connector_cec_unregister() (Maxime)
- Restored and rephrased comment in vc4_hdmi (Maxime)
- Squashed vc4 patches
- Link to v1: https://lore.kernel.org/r/20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org
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

---
base-commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
change-id: 20241223-drm-hdmi-connector-cec-34902ce847b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

