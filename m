Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAD1F9416
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038677; cv=none; b=bhyGM/W8ZZkrEssXqfcLKgHVqVVI5pdESENOiUv/Aip2IB24UIMkyU0XbemeC62OemVL+cFwj315daOo1yEXw74GXBbk+Z6MkC+lPzi6sGQNu697RIJyJdiuFF/9X6MvUtLGXVhz8FS5BI4FJAgVr+irqgkFO8RLw9EWk4kFjyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038677; c=relaxed/simple;
	bh=tm6E5CHrh0UyzbZn5BXrCuvQKoq/VVqScuXPiEFZX8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uW77c3e6CHXmmpvubRiDJMUFI7dNHCEscgFeTgWibmokmnAmOQlBIPJ3dWjtulXEa9Ni3y7MBewVigZFT+0Lvx6oF5SY9KGiF6rtDVhLo1Qf4Df5cpF+EcfeCX4k/9L7DrRlbzdAlDEbvGA/zGocNusGOV311XzXBpQBE7UOeHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfIgt8U3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfIgt8U3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dr3S016217
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 15:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbfUPVMpc6tBMMQBxeazrtQKlq+1In9JkEZNZNxoxHQ=; b=TfIgt8U3ZlNjXvkP
	uO2j/JhPIy1a2P8whxsMLmakI4EGLg+jm46t7VGQkk7jNNjCX7Zp95TevuZmrMEz
	ESQ2YCRiqdiSeTdFvwaVZYZR4UTNoLYF0caLOtAs/CPgduPeJqsDoNfwz3nAWIlO
	s+5nuhpiWvgGEtY0RAUJLCKKeKOcGjaI/DcDWOHOC36Q1UK3mn7T3nVBvl45sk9E
	Lcq11XWqxoFuo1mCm3Pje7D7V+dIFcLXJYm3SA38NpjvzC7pLOSJQWnH8Fl+qjA5
	j0IXOgHEYaEJBu2vNzVjklT+SgPxU8W02qVQF17xyHnxPAnjA0j45Nr0hnxcrjeT
	bhtFLA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgcnt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 15:11:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff78so1338861085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038673; x=1744643473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbfUPVMpc6tBMMQBxeazrtQKlq+1In9JkEZNZNxoxHQ=;
        b=qqyVPaucr7kqNdSUbfQrZBFCxoCTgei+dpp3RKqU3BadUCImWFIgjl/SdlMUMj6FGV
         l/nQKSeD400c5TPFYDORsBYJQuuoNzZNCpG5M9LcpUkLm1YTtkSe1sAakrQpWNVd6YVF
         2lX4TqrncV+cXHh8E/EbUzbKSRT8s2Bf0uYm24XusjmAhgLBOeX/nYYWNwlwIskgBkpv
         UVYGCavm598ETtNLP9jDYtXda4ErXrSLlR7X/TZd0fJ6hHPwR5y70OWnyCTB72CLqM6+
         7VeMrWjE2d7kV+1dcgx+8Mot8Ys93hj5hD1QbqF9k/acuk7T/HogZXkbVzo9Zk8LJH7j
         0jsg==
X-Forwarded-Encrypted: i=1; AJvYcCV3iACPbnzbeezeTcVzBbVl42xD9Ojy+YKtLntztwlRui3kMcuLG7YvqAIbFmZ2doV6Y6iX+C8QB8VG08s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdnO1BVsztPrDwwnNVlET31yZX2yCpORc4FiFXJlgfhZ4NvNDR
	cBodxAyvjzVUmKPuB6EZTX0yeccyX8flB7p0IoK/CXHnrcmUKi/ZR0BCsU7h9qwlBUW9ItZWr4M
	L7JlBPIhZh/Eq7KtGUzZPBLJ3EEDMuZZv6t8tURHD2XYAXFLTZwLteHNluI72NLY=
X-Gm-Gg: ASbGncvyaQTF14CUvTHEyegqrHhpmPjjLQbkjtS6sc6C8PusoW+V7/vXLHFwQCnbXlb
	L4gcppZR4ZKvBl/Up1w7cYFXM793VV1DW0sxHN6+hnr244vozUytkc2lbmjPcI1Cyf/TmSFkXnw
	Shb7JxyPQ3BzNR+a2qYI3L6BTz0TWo/bEI30TkwhQ/l0Ky5jpuzuZFgMTMJ/ZHLq7RcKwHgoGgC
	RY+szWIdyaHZqnH00SG/a7zosk58bNLyuu0gG6sVid9KO/1P25gzHzI9JUgDt8wixc6B7zIoFaf
	fe8w/g4puU7Ds36j8tfUSxqztQpvYVH3WXKbbahcLSHd99Ooo61nfcTEqvqpTVLcLU9jEB797g8
	QXTJxGYObO+fFe2iyWvt2Pwo3gkya
X-Received: by 2002:a05:620a:1a06:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c774d60c84mr2034077785a.30.1744038673067;
        Mon, 07 Apr 2025 08:11:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG11reqVLTJP78XmGuhv2NYMgO7EkFlI+haHAO+cGC11R12/arMAXs5CVYiK0YDtnrz0cQ5iA==
X-Received: by 2002:a05:620a:1a06:b0:7c5:5339:48cf with SMTP id af79cd13be357-7c774d60c84mr2034071385a.30.1744038672567;
        Mon, 07 Apr 2025 08:11:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:11:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:03 +0300
Subject: [PATCH v5 06/11] drm/display: add CEC helpers code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-6-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12984;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tm6E5CHrh0UyzbZn5BXrCuvQKoq/VVqScuXPiEFZX8o=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rn1yz3uk++FmXe3qulvy3yjtmTNddqJ/GU1/hH+Sexi
 LEumnirk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATsZvBwTB5a+HJ1+38/jOm
 Pj5249rl+GmZ26vPKFp1z8i7cPge9/09TCI7sv+9iL//+8QLlszfDCZa3lEzVgqI7qtLvX1R3Sq
 Pq0nc8GBh7jGrRfqa/SFvT3JtEt7eL28rKy9znHFa9DXFSjajHYvDfi3oKhSvmTh1quStmsvLJj
 mzhCuKtzDL7lVI3s7AVuiUGqRV8vhvQOOki066f3rZMmbpt4ZM6fsbop/Q2b3R8m5UTuPMmOnWI
 hIM0lyOOW8ZE5KPbNibG+V2N8rw4ParawKdpzgVmyeu8stnFpibkhV+PDPxgtKy3csNUi0EnNs0
 7PJOmzkfEXCM12qXv7bm0E2Bd1cuFU8UcJjvru+269NSAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f3eb12 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=s8T53sbBIMaaZ8HinFgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UXpLqujIoTAyOJBZ06dqHfejP73wsPSE
X-Proofpoint-GUID: UXpLqujIoTAyOJBZ06dqHfejP73wsPSE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106

Add generic CEC helpers to be used by HDMI drivers. Both notifier and
and adapter are supported for registration. Once registered, the driver
can call common set of functions to update physical address, to
invalidate it or to unregister CEC data. Unlike drm_connector_cec_funcs
(which provides interface common to all implementations, including, but
not limited to the CEC adapter, CEC notifier, CEC pin-based adapter,
etc) the struct drm_connector_hdmi_cec_adapter_ops provides callbacks
specific to the CEC adapter implementations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig                    |  12 +-
 drivers/gpu/drm/display/Makefile                   |   4 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      | 175 +++++++++++++++++++++
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  60 +++++++
 include/drm/display/drm_hdmi_cec_helper.h          |  74 +++++++++
 5 files changed, 324 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 3666e791d6d6eba58f095d7fb691de1fd0b95ed3..6376ea01ec3093a72de25064e31223d2c9868ed7 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
-	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC || DRM_DISPLAY_HDMI_CEC_HELPER || CEC_NOTIFIER
 	help
 	  DRM helpers for display adapters.
 
@@ -82,6 +82,16 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
 	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
 	  implementation).
 
+config DRM_DISPLAY_HDMI_CEC_HELPER
+	bool
+	help
+	  DRM display helpers for HDMI CEC implementation.
+
+config DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER
+	def_bool CEC_NOTIFIER
+	help
+	  DRM display helpers for HDMI CEC notifiers implementation.
+
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index b17879b957d5401721396e247fa346387cf6c48a..0ff4a1ad0222078bf495175915007f1b1f903296 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -16,6 +16,10 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
 	drm_hdmi_audio_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
+	drm_hdmi_cec_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER) += \
+	drm_hdmi_cec_notifier_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..85076ea92d95ad95fb7b2d6c9db69c290e09a8cf
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
+
+#include <linux/mutex.h>
+
+#include <media/cec.h>
+
+struct drm_connector_hdmi_cec_data {
+	struct cec_adapter *adapter;
+	const struct drm_connector_hdmi_cec_funcs *funcs;
+};
+
+static int drm_connector_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	return data->funcs->enable(connector, enable);
+}
+
+static int drm_connector_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	return data->funcs->log_addr(connector, logical_addr);
+}
+
+static int drm_connector_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+						u32 signal_free_time, struct cec_msg *msg)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	return data->funcs->transmit(connector, attempts, signal_free_time, msg);
+}
+
+static const struct cec_adap_ops drm_connector_hdmi_cec_adap_ops = {
+	.adap_enable = drm_connector_hdmi_cec_adap_enable,
+	.adap_log_addr = drm_connector_hdmi_cec_adap_log_addr,
+	.adap_transmit = drm_connector_hdmi_cec_adap_transmit,
+};
+
+static void drm_connector_hdmi_cec_adapter_phys_addr_invalidate(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_phys_addr_invalidate(data->adapter);
+}
+
+static void drm_connector_hdmi_cec_adapter_phys_addr_set(struct drm_connector *connector,
+							 u16 addr)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_s_phys_addr(data->adapter, addr, false);
+}
+
+static void drm_connector_hdmi_cec_adapter_unregister(struct drm_connector *connector)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_delete_adapter(data->adapter);
+
+	if (data->funcs->uninit)
+		data->funcs->uninit(connector);
+
+	kfree(data);
+	connector->cec.data = NULL;
+}
+
+static struct drm_connector_cec_funcs drm_connector_hdmi_cec_adapter_funcs = {
+	.phys_addr_invalidate = drm_connector_hdmi_cec_adapter_phys_addr_invalidate,
+	.phys_addr_set = drm_connector_hdmi_cec_adapter_phys_addr_set,
+	.unregister = drm_connector_hdmi_cec_adapter_unregister,
+};
+
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev)
+{
+	struct drm_connector_hdmi_cec_data *data;
+	struct cec_connector_info conn_info;
+	struct cec_adapter *cec_adap;
+	int ret;
+
+	if (!funcs->init || !funcs->enable || !funcs->log_addr || !funcs->transmit)
+		return -EINVAL;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->funcs = funcs;
+
+	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
+					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
+					available_las ? : CEC_MAX_LOG_ADDRS);
+	ret = PTR_ERR_OR_ZERO(cec_adap);
+	if (ret < 0)
+		goto err_free;
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+	cec_s_conn_info(cec_adap, &conn_info);
+
+	data->adapter = cec_adap;
+
+	mutex_lock(&connector->cec.mutex);
+
+	connector->cec.data = data;
+	connector->cec.funcs = &drm_connector_hdmi_cec_adapter_funcs;
+
+	ret = funcs->init(connector);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	ret = cec_register_adapter(cec_adap, dev);
+	if (ret < 0)
+		goto err_delete_adapter;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return 0;
+
+err_delete_adapter:
+	cec_delete_adapter(cec_adap);
+
+	connector->cec.data = NULL;
+
+	mutex_unlock(&connector->cec.mutex);
+
+err_free:
+	kfree(data);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_received_msg(data->adapter, msg);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_received_msg);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_transmit_attempt_done(data->adapter, status);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_attempt_done);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt)
+{
+	struct drm_connector_hdmi_cec_data *data = connector->cec.data;
+
+	cec_transmit_done(data->adapter, status,
+			  arb_lost_cnt, nack_cnt, low_drive_cnt, error_cnt);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_done);
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..d87d30ec3fbb09d25eeb8ea382a77564f1071734
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
+
+#include <linux/mutex.h>
+
+#include <media/cec.h>
+#include <media/cec-notifier.h>
+
+static void drm_connector_hdmi_cec_notifier_phys_addr_invalidate(struct drm_connector *connector)
+{
+	cec_notifier_phys_addr_invalidate(connector->cec.data);
+}
+
+static void drm_connector_hdmi_cec_notifier_phys_addr_set(struct drm_connector *connector,
+							  u16 addr)
+{
+	cec_notifier_set_phys_addr(connector->cec.data, addr);
+}
+
+static void drm_connector_hdmi_cec_notifier_unregister(struct drm_connector *connector)
+{
+	cec_notifier_conn_unregister(connector->cec.data);
+	connector->cec.data = NULL;
+}
+
+static const struct drm_connector_cec_funcs drm_connector_cec_notifier_funcs = {
+	.phys_addr_invalidate = drm_connector_hdmi_cec_notifier_phys_addr_invalidate,
+	.phys_addr_set = drm_connector_hdmi_cec_notifier_phys_addr_set,
+	.unregister = drm_connector_hdmi_cec_notifier_unregister,
+};
+
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(dev, port_name, &conn_info);
+	if (!notifier)
+		return -ENOMEM;
+
+	mutex_lock(&connector->cec.mutex);
+
+	connector->cec.data = notifier;
+	connector->cec.funcs = &drm_connector_cec_notifier_funcs;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..39bb6d12acb35f539a4a6cd1b61ce97bf4e063ab
--- /dev/null
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
+#define DRM_DISPLAY_HDMI_CEC_HELPER
+
+#include <drm/drm_connector.h>
+
+#include <linux/types.h>
+
+struct drm_connector;
+
+struct cec_msg;
+struct device;
+
+struct drm_connector_hdmi_cec_funcs {
+	/**
+	 * @init: perform hardware-specific initialization before registering the CEC adapter
+	 */
+	int (*init)(struct drm_connector *connector);
+
+	/**
+	 * @uninit: perform hardware-specific teardown for the CEC adapter
+	 */
+	void (*uninit)(struct drm_connector *connector);
+
+	/**
+	 * @enable: enable or disable CEC adapter
+	 */
+	int (*enable)(struct drm_connector *connector, bool enable);
+
+	/**
+	 * @log_addr: set adapter's logical address, can be called multiple
+	 * times if adapter supports several LAs
+	 */
+	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
+
+	/**
+	 * @transmit: start transmission of the specified CEC message
+	 */
+	int (*transmit)(struct drm_connector *connector, u8 attempts,
+			u32 signal_free_time, struct cec_msg *msg);
+};
+
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_funcs *funcs,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status);
+
+#if IS_ENABLED(CONFIG_DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER)
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev);
+#else
+static inline int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+							   const char *port_name,
+							   struct device *dev)
+{
+	return 0;
+}
+#endif
+
+#endif

-- 
2.39.5

