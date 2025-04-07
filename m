Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0691CAA8D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038670; cv=none; b=kBY88Lm5ZwnWCNv5FjoHxRgaktq85H/L+WBlY7mM/Gixto4wCWAxC5j0N+Ay5+mJQT5cJ+JjWvmwPgR4Y8p3pjcJMrWNkgrkeSVEB1e4Tr75FNSftWRG1HXQDxCJAY6juAUEElKu71aV7Y+giGrj7sl6Ol5wnpzC2NcMrUh+VfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038670; c=relaxed/simple;
	bh=jWdmXnk5KQZ7QqiqS4ntkIepKln6k4Qq9yyz2/39Hbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJgNrUC7Stzj+WGgZS4T/ep77CCTAZ2X69Y7WKEKulgyLS9gyLsoDLDUyRVzYnB2ss5WAQSEGjxQQVvHA5hScErLlVLK546aG7Nl43yajGxACIJ6pYXDnppMZs+kAAzczcPJH4YQUxRxt0bgFUO/2YLQgLS1YDrxaYlUkcTu4v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkr8oBMW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkr8oBMW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dmbd001376
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 15:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCTTLYELgEB4afW0sXqvdFWgp95Hv4OasYO1O5ZEWH8=; b=fkr8oBMWhgPwN0nv
	9krg5bNsDo+xMLfWxw4fahCSJ3BSifYd5w1XHRWTopISL4O2+owZ8jYTNHAVKcql
	FY8yDpxUZvCXspQV8MCU6f+jjEyDY1EgaIyKILaenJtFf3ELq/gczgJFss/SJQL7
	FisHq+UrDmovcec9Po8m61b4RLGIRhj2QrmqsYDRZcxNKYcbHVyuBv2E7ItclHq9
	fzMSCS2/HSD909/NspQFcezh/+O/KvaNK2ABRaLExRpcg9fjvDF/N16KFghzJpYw
	LVLng60pioW+q2eWpt4k8sbDw7aIJK3p/KQWAqsvNqadmZWVkBHIB8IbKN8z8s0V
	dnXYYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtavn9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 15:11:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c09f73873fso732736685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038666; x=1744643466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCTTLYELgEB4afW0sXqvdFWgp95Hv4OasYO1O5ZEWH8=;
        b=NQsZjc7Fx/4OxonO9NaUvZ22p3jLaUNMrAn0QLCE/NJIFBXIN++tNIsZ8QEkHVv2z/
         wqxtll8KyUoT5vp99sVYaIJcLektJilw7LWg4CkoVqnKfqd7PGiMH/2m491eII5lb10M
         8F8YHFGAkIson/nzbgYWW/2i9L5kO9QKjCjFsi9KrMrrc3+kz/5LKVG2rJK3fOpZ+xOA
         ZMPhCN2WqW64mCqusuUqWU+o2mWFgFceGCcz8/bfnzyXotJPpee+hvdB/oZN9c7CcF8H
         KfekweTfKEdNFgQs9uxJipokk9MdhtfYmeulPOXguJw0n4TCHRwlxc1MNWiztfviRXKO
         S/nw==
X-Forwarded-Encrypted: i=1; AJvYcCXd/ewUYb8hgwK+iyr0u3tIQyN71aiupnyfVqarxdT+aSs0EWp+CqcPjOPtW1moY8CtEbVl3b/keGU7O14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvHE30O0YZQuVoa71tnBt5hQoVQZCTiSgrb5EqMn4LHhAfqK9g
	uKTnA9B9okNk2mn9hY8j6gZM8+OH7e4U6pUq34iGHKlhezA49IDBztD6BVC6+M+aqWidmu+TeM5
	bc3e4o+DsujGH06uKOXkEGPHv0E1Tj9QqfaIHqOSldnsHCU09jQ59uZhDTVaWzUI=
X-Gm-Gg: ASbGnctrUdLlnQTMnEA3bj5VTj4WfJrClLXCmoMpqtOmsw5Eu4E8CzwMomcrUi9LhAg
	1u6pHF5l9eJ8llvOAVMmvbHLkeaRYRcWvimyf4J8VwFjOYusFAbJkEjZcoTUd4o1mSD1QjKemS2
	36qeGvS3GEOFxvb8g1G4VHO6IhT2GGZKkvbh4MWOz0T1y9jQIO52rQpRhE+MirZywki1zvWFmeS
	1IDABHl7myBw1ZoYvxb6mRDIonptEUTuGr0mF7Tya5A1p+xC5dwLWIDX7Y3s3WK3qdL65siIoBa
	ExwjZGbx8t6CITS0vIltvZUDsWGynz2vTqeRy4N6ifZrEdyZpDwxEvTSwsxm65beTJddENI3M2e
	9D3TeiSgGkqC40E97TyFbVZyBSDDR
X-Received: by 2002:a05:620a:248e:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7c774e4a03amr2423587485a.49.1744038666393;
        Mon, 07 Apr 2025 08:11:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaG9hk4ftjaorAgQ/sNiXD77uVKuHzcnv87RLk+fL00AZq4boIwdlRJCSjXKSXcbSck+lxeQ==
X-Received: by 2002:a05:620a:248e:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7c774e4a03amr2423582085a.49.1744038665941;
        Mon, 07 Apr 2025 08:11:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:10:59 +0300
Subject: [PATCH v5 02/11] drm/bridge: allow limiting I2S formats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-2-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jWdmXnk5KQZ7QqiqS4ntkIepKln6k4Qq9yyz2/39Hbs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sDgL9+FzBgNDstWAD0wnkAjUwbcRkIdXmG+
 EE/lELJAaKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1Z4hB/wIreM6AGD73pyKCqLVHHRbeqyQ1cQj88+B0i2B3xOahvfEmcdGDuPWzoJdPfise95KJ5e
 MeVJbJ69pctJc1xnJTJRpJy61KfTX/7p33TgatNXObQkDijeHCh9KS46NBRi0QeLfT0E7bHgNN+
 FPNikJGbUAV4kD4tAQECm/SRtBBQNWjSIuI5v9hgi5R/46mmm8Ju4zNr/i348OU7XoprQaVx4IV
 aHClzqlWZcjEC0VTBJt9kNxyPj1QnvC96s8ED+grqbq+x1rFM5zzlqGOKW617l6/CuLxQqJhLm8
 bPgBesqADqv27Z6pGV32VJj+ktgxfwNxrlUZhrp/NKgnZJ3l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: raPwO2qaFqAyKPT2OT8zHK1mzXLrZjgS
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f3eb0c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JbrL1DnuwQtsaYKQthAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: raPwO2qaFqAyKPT2OT8zHK1mzXLrZjgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070105

By default HDMI codec registers all formats supported on the I2S bus.
Allow bridges (and connectors) to limit the list of the PCM formats
supported by the HDMI codec.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c  | 1 +
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 3 +++
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
 include/drm/display/drm_hdmi_audio_helper.h     | 1 +
 include/drm/drm_bridge.h                        | 8 ++++++++
 5 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7d2e499ea5dec2f710c1c67323bf9e6b177d3c9e..381a0f9d4259bf9f72d3a292b7dcc82e45c61bae 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -717,6 +717,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
 						    bridge->hdmi_audio_max_i2s_playback_channels,
+						    bridge->hdmi_audio_i2s_formats,
 						    bridge->hdmi_audio_spdif_playback,
 						    bridge->hdmi_audio_dai_port);
 		if (ret)
diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f..21c93bdd8648cf70e691dbf0c92fae5823fd1828 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -142,6 +142,7 @@ static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
  * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
  * @funcs: callbacks for this HDMI Codec
  * @max_i2s_playback_channels: maximum number of playback I2S channels
+ * @i2s_formats: set of I2S formats (use 0 for a bus-specific set)
  * @spdif_playback: set if HDMI codec has S/PDIF playback port
  * @dai_port: sound DAI port, -1 if it is not enabled
  *
@@ -154,6 +155,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int dai_port)
 {
@@ -161,6 +163,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 		.ops = &drm_connector_hdmi_audio_ops,
 		.max_i2s_channels = max_i2s_playback_channels,
 		.i2s = !!max_i2s_playback_channels,
+		.i2s_formats = i2s_formats,
 		.spdif = spdif_playback,
 		.no_i2s_capture = true,
 		.no_spdif_capture = true,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a29a6ef266f9a5952af53030a9a2d313e2ecdfce..4797ed1c21f47992fe4d497d904ee31c824cd449 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -562,7 +562,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
 					    &vc4_hdmi_audio_funcs,
-					    8, false, -1);
+					    8, 0, false, -1);
 	if (ret)
 		return ret;
 
diff --git a/include/drm/display/drm_hdmi_audio_helper.h b/include/drm/display/drm_hdmi_audio_helper.h
index c9a6faef4109f20ba79b610a9d5e8d5980efe2d1..44d910bdc72dd2fdbbe7ada65b67080d4a41e88b 100644
--- a/include/drm/display/drm_hdmi_audio_helper.h
+++ b/include/drm/display/drm_hdmi_audio_helper.h
@@ -14,6 +14,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 				  struct device *hdmi_codec_dev,
 				  const struct drm_connector_hdmi_audio_funcs *funcs,
 				  unsigned int max_i2s_playback_channels,
+				  u64 i2s_formats,
 				  bool spdif_playback,
 				  int sound_dai_port);
 void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 286f6fb3fe2b80f237db85dc8459430dc82337e2..db0d374d863b0b1f774d395743f1e29bb84e8937 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1016,6 +1016,14 @@ struct drm_bridge {
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
+	/**
+	 * @hdmi_audio_i2s_formats: supported I2S formats, optional. The
+	 * default is to allow all formats supported by the corresponding I2S
+	 * bus driver. This is only used for bridges setting
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.
+	 */
+	u64 hdmi_audio_i2s_formats;
+
 	/**
 	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
 	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.

-- 
2.39.5

