Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBAD1A314B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747447201; cv=none; b=kEtazCANs2y/HJAiwKHlZkVu5ffjHJODG9pEwwx6DMYtrJx93mP9wgAOFu3rlyO7CIkUuOBj/uAEHMlM+lfVzc/dMAxf+XEnoweg4ydYRybnQ8/bdfi9gAcQiL+QomVbc11n06fzzd+ZLdVGhe48ruDBYqK326aggCpvmjz5sxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747447201; c=relaxed/simple;
	bh=LMfOqZbcmDFI+UGpgbtzZXyktFHpBBqyKOs2nIEEJWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APtsPQ5IkdWFGI9QzxIq/J39aE330vxgUXJ/r6yeWBF7AF+8k40M0XNG7UNqUCI+ShkZ9xIuWAoQ6RlngkL5NtkhzDhBn01K+PtFMySlGHtlikYmu0qVFdJOpNCpVsVRAbAWernTutLYf7TBwDZwAioqbNK7HtySp1CKeSHJq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbKCV9ZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbKCV9ZY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GC1sjb019533
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzoCVGuuCG8OuzWqLizoElhfY931yJkLZD9sIcqllt0=; b=bbKCV9ZY1DqEjhMV
	zBbB2ZDNjeKDDGH26bF2uHBPFK0XixAd78ElXqCNsfikzibdfJaD7dEqFPK/BNkz
	r8ujn5DrY54ulanf2jEYQxoyPMSRoW6quVA/C03kdpWf/hPrXvbb88HfZPBsuku9
	A/zAImEXeyBLjIrYRdKXqjTRngoOoxb0X1FF6h0/JwAcYQpvOGyqYO2ulW9IVzSA
	XMSzVsJmGwCAB3QpOFfX5dhHZ7Z48HQxcy6XOvTwVww/B9qzHxyTpz0invcwyQ1b
	Ti9taHVBDxlbyMeMEp/UXip8dTPtybSDh3x0Lwh/v9Zz3BpZwOkms/+IGixX/8FZ
	3hSD6A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuguv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 01:59:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f6f2c41eddso58200516d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747447197; x=1748051997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzoCVGuuCG8OuzWqLizoElhfY931yJkLZD9sIcqllt0=;
        b=Hl8pNf2fTS9wtbqzEXtm8JDDS1w5MhkzCOJFbUjA+o5q8n29jZBU2Gj1UE3vKl5rBw
         FaGUjPYbKsyiOs2DUn84Al5Red4+uNCPkRfMu63o1ghx+0IKiW5lKpXbuSSC5lMkBWNL
         IxvSFVLUKNblojfaYXDlxAd6mxVWNiPX5AJU6mFFnhSwaaPPqS/Lel/xNzbVs7c+nb2E
         Sb8Nogah5BSJcHOsRcss2SfrKPQlJT98/ugzozbjvygi6wO6ZRwGQZx9hm/AkCdLXpCO
         zfUsSDNjVUmw7icwdSjsxl737LztXFr2uVybq7NJyUhw3qLQ3hsz0KYrTDVCn8gBX9Cc
         y2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWPOecMvI2ssZ4UgPmHikYSt8NmNfeFQC1ysNnUlOHTHqurZpdLpTqBQcE94xUYwPuIRRV/TP83i9Grx5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01u1543P5zE9ADijX9f4tjK4tKLQbKP0xfQZ3WGCMh36R/sUX
	HPDwQem0teU7/BzOmkVVRyuonY7KsN5ITdJmnqpU2t72+rtep6biiwLxuBSu7x2Y65p4tjqlhQ9
	vc5rZApAdHLHeCZd/oaK5pi24NSEbGXyppBLvtLNICB6Uh72Tp0UC6G8mdtUuKh3HKwtzzWrUg/
	I=
X-Gm-Gg: ASbGncvRAP8g2UFotAI58EcWIT+a16BG916sKG9xDjXs9CfKQ4sv+16tX3ZDGR95WPf
	L7QyNffvBqb0Ut+FPIVU9ymqdoQv1VC0RmwgRRQvYE9p13FYZ8XeLPU5jqOKoDn3E3M0MLpY3zl
	QjusxuadUHCV8vueCKG+3wd2DksGTQvYPQU2GnWfMNYhbHcDJC7gKwra7y8CDW/zvRqldbvuTiA
	4ZbeVEOyHIT3JuDYWz18kE3BgN1I4R3SAy5PUraQUBlSQdikATUgrLdMEzwUUslTO6qaWeGKrpf
	JAUlFGOYPUcy8+X3I1IJgB2N9a3KdGee00H55s/QffoJifDhYkTJdxaz7cB3oZWF1xzrgu0jJyD
	7ffqLd44CQ8vnDcyzVCcSG60Y
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr89882726d6.10.1747447197302;
        Fri, 16 May 2025 18:59:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa6ZwlC44UP8jsEQ22lvWdm6wcoZvnONq7h1t9qxDd3KoV8uXhs6K7zmRDjNk8uSamqIJjsg==
X-Received: by 2002:a05:6214:cc2:b0:6f8:a6fe:24ed with SMTP id 6a1803df08f44-6f8b082861fmr89882496d6.10.1747447196940;
        Fri, 16 May 2025 18:59:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:59:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:44 +0300
Subject: [PATCH v6 08/10] drm/display: bridge-connector: hook in CEC
 notifier support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-8-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LMfOqZbcmDFI+UGpgbtzZXyktFHpBBqyKOs2nIEEJWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LwoerEyNYi7ihJJAMmqPFArPVA3VlmHCN3
 IiEZ71MP8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1RYxB/4j1PzOGgcvMIrL6Y/yAmjXrjoiaIyQtPY7SBGeyzLFYpBbOWFsy9l2v/ad2VZdYpJb90S
 Z3+NqKQa290lV+bJjeOOyY65rfHMKGoe/lMsGzpBVqltcf+R048HtdasvXYhPckf6FqgYxKnTVg
 zhE7IDPNx/t1WgX/3D5c+KdaWubqyWyAIkUxZCgIMrTC6kN7ZlRaiKatLdAzNeMsAgSFpFBD4V+
 upFmVqaL1dINpqiMr0z041KN9TeizUX0Fnslv6ksZIyizbkidwVMpgoL+RODcRQXSUTup4vaGJh
 ZezI+qMf/8pRN5Mzoz5ELiSmEv+KUFETUaVmspYQKr/cdP8F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BHNmPzlR69Molo6CKwdyELSUkxfhaDaF
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6827ed9e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wPpwn6IxAmBijdVEDHIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BHNmPzlR69Molo6CKwdyELSUkxfhaDaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfXxLicyHXGViQX
 n7MnOE1oGgNTjFUEAi34LsKTy7HMuS3cervzw4yX3xn+M+r5L07bqG0Ocezxw8EgR5ra2qnoqc6
 ukQMgQefkKjMViC5SkXcfdFlAJ70+Rj0xXXzBl2UIjslS48AJaeDuWVAWNv26D2nVszv0DX0r1c
 MfFBNT9AscF18sY9QaJdLgB8XfEOeu13IEQdxiQcHGhOzT53W+CfpjW0MVJme7XS/XOSWKTt1RY
 XyPC97BJND3yqDJHMm8ZXjJWbRDvRYVglk2CwxDjyP74MGq2gR4FfEt+WuCJD4jLdYZ3h9hzZJE
 070sbdVcZOHbGEcQE4HgPlHhYyigntpYER2nUJRCx3ZhNSBxk/aIlWbpucpkX20xs1X37Oxs4Iz
 tHxepSGoYLxfnwDYWFEGKJl+pipuJEemE3psrlbkmvLwln6zphmyRS8s4fB3npj/KtPYFuLM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=791 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017

Allow HDMI DRM bridges to create CEC notifier. Physical address is
handled automatically by drm_atomic_helper_connector_hdmi_hotplug()
being called from .detect() path.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
 include/drm/drm_bridge.h                       | 11 +++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 381a0f9d4259bf9f72d3a292b7dcc82e45c61bae..0377dcd691a871643710d667248b05f8eb9e84d6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -113,6 +114,13 @@ struct drm_bridge_connector {
 	 * &DRM_BRIDGE_OP_DP_AUDIO).
 	 */
 	struct drm_bridge *bridge_dp_audio;
+	/**
+	 * @bridge_hdmi_cec:
+	 *
+	 * The bridge in the chain that implements CEC support, if any (see
+	 * DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER).
+	 */
+	struct drm_bridge *bridge_hdmi_cec;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -662,6 +670,13 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_dp_audio = bridge;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+			if (bridge_connector->bridge_hdmi_cec)
+				return ERR_PTR(-EBUSY);
+
+			bridge_connector->bridge_hdmi_cec = bridge;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -724,6 +739,15 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
+	if (bridge_connector->bridge_hdmi_cec &&
+	    bridge_connector->bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER) {
+		ret = drmm_connector_hdmi_cec_notifier_register(connector,
+								NULL,
+								bridge->hdmi_cec_dev);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index db0d374d863b0b1f774d395743f1e29bb84e8937..0e5f6a007d536215bd50e11846433290c2060b9c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -907,6 +907,11 @@ enum drm_bridge_ops {
 	 * flag.
 	 */
 	DRM_BRIDGE_OP_DP_AUDIO = BIT(6),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER: The bridge requires CEC notifier
+	 * to be present.
+	 */
+	DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER = BIT(7),
 };
 
 /**
@@ -1003,6 +1008,12 @@ struct drm_bridge {
 	 */
 	unsigned int max_bpc;
 
+	/**
+	 * @hdmi_cec_dev: device to be used as a containing device for CEC
+	 * functions.
+	 */
+	struct device *hdmi_cec_dev;
+
 	/**
 	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
 	 * either of @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO is set.

-- 
2.39.5

