Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3DC1D8DFD
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738498050; cv=none; b=QTbdFPdgChsm6jQEdVMtkqJD95nGpNCm4Hz1l5S8HOPgSH8AjOGaVG6Zkx/AqT/LWvAXZ7jEbyxhNG0zF4QUG4J76oPtDpr25DGEOCHKU5g8kpvuBhSdjlba8kIdjM82+8cdPQIjHujNO8JlCCXVHfz7zAFYeBkUdLbvZS2vugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738498050; c=relaxed/simple;
	bh=nldCClR8uvkSTfDxfd+h/QjnqO0ZS/iFq9gYjpUVHS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=da/Tuig3hjk3RssO8AugP1rfeOI7eejs2HoZg3AdufkwMUbr7wGS5FhPWK/zFnMDEDIPLm71JLhe+RIAQCxOvsjWa0UODACOK4WwH1qWVceYXESGiVnlOeBQvrUrQjDEOA5P+rJmPVvb0vLVaw6tuNI34UKtGLFB5cqQ2db0Crw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZIsv4qlN; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZIsv4qlN"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30219437e63so46648001fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738498046; x=1739102846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5UTqDywGwGqwaCDORrx7GXvq6f9LFKArl+vZrtSpSjA=;
        b=ZIsv4qlN84SZHYSYmUQf1TBZOUCg9azq8HpTooImXDQZH25DSr5LhA5Juj7IdZD90+
         KJr3jUnf8KLeN1LgXaPj9SlwlwfDogMvIIHl7jNUJvwNhBckC6GvAHJXBLsQWS5rPQH4
         3KT0tXqBNkOhZ+jDoxZQErIb9a1FbmnVJJUjYmoNtBLUkcai4QNvG65AptADugVhtill
         WGJV9HLJVlz/jVgBrhFVNI8zr9CLbJ9l8L9FvewATOkAkZlyyll2vdHY+Zu0VXCRt8Nm
         0MdoGe4buCaJIthgVQ5z2iwT689fJ2pZR8PHNL4gYMTm+pLtQvXFEoCIrW12CzO3GaWI
         71zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738498046; x=1739102846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5UTqDywGwGqwaCDORrx7GXvq6f9LFKArl+vZrtSpSjA=;
        b=Boaf2ZEO+lqVlVWBu2AGR4sUdcWrF5eklv51TBTjvbzsaAPPeJ1+evQkdVnhfPvEDk
         zIs4++AxXCacjpRTfyOZgFyyjNr8DQJfhaExPl/oZxcnA8b9bYv74HoS8T8jM5+kMvPU
         dIb+U/8U8vfCXGmNgUjAAff2obpJxf7f0y1d+rzBMVFsbk7Vd0sylBWqXuvQxr3JleH7
         RQi0P9JdtAaBc0Di1FUnasZDGtNYqrIw1Jh0sNcIQhzYaVz/sUE3rhhcqeatc6+ufWVv
         hCOtDeD2qrf3CVU9bwivahB2m2DPxV7l96oBZk3cE5+cBQN5doLRdio1t1/JjulCc+RW
         W+dw==
X-Forwarded-Encrypted: i=1; AJvYcCXpqTI8gdubZ7zI7HXficrAjlVqsh8jk76FDXIgsC2uOaQ5knxsejFfhLxI9ibFQ4qTNnBm/5kPhMLgUW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdASuYGFvPUfa7pT8PX0L0wngDdI7sg5wiLGi5X/7KOhWANGq7
	psZMvqYRC7y4GXKKHdU4E/cqxaZhsFx6TP3if860kj1WKxLjjaGDGNrUxu9A8B4=
X-Gm-Gg: ASbGnctrTJkMRPXG/HdKwL0WWKex07dBjLkMDKGKzPYTu1sd1c23TnPotQzlTmM1hjH
	uKWkaGpNSkSghnye56a9Q4eMh6MSqTNCvf6/Y0UlaD5vTxTncYgGVtZVzFq8ZXyFXEnrxIxe/F8
	zbqFHwxSKSlwb2PNEsMYbCpoVgaVim4P3aPlY/FsKF6CLdgvs5BpNOpEH1gzHeim8zGOvISsxP0
	dlzXFHfdutYo9cEpWuSsLZuBKmidlYrHGurF7PLv3Yn5+4JrDe8cbG+ADkJrbsc4mTH6qknZ/FB
	i8O7SzxlfkszbflgwQqTmuw=
X-Google-Smtp-Source: AGHT+IEv10/REWPc98BQHgdtPQ1KyOKFNyfQw6Dwajs3E1u+MMHDY0oB96++rKgrDov5//LdbeuRmA==
X-Received: by 2002:a05:6512:2809:b0:542:8ca5:8248 with SMTP id 2adb3069b0e04-543ea3c8993mr4316169e87.8.1738498045654;
        Sun, 02 Feb 2025 04:07:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe10678sm960695e87.101.2025.02.02.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:07:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Feb 2025 14:07:11 +0200
Subject: [PATCH v4 04/12] drm/display: add CEC helpers code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-drm-hdmi-connector-cec-v4-4-a71620a54d50@linaro.org>
References: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
In-Reply-To: <20250202-drm-hdmi-connector-cec-v4-0-a71620a54d50@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11954;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nldCClR8uvkSTfDxfd+h/QjnqO0ZS/iFq9gYjpUVHS4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnn1/vt8ffZJlcyg6wBTsoFYfvslYUUSsElayef
 a394aDm4+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ59f7wAKCRCLPIo+Aiko
 1d7/CACc1JAdFGKKYXvWGXmjft+vUPHMgJwoFZ/KL7oyN43+RPiJEOf1p2icB5ipOROI2EXAmRX
 BRwQe6UPbz9UVZJ4/hvbMNibj31gHoPobOx+NXFcPvayIidHDidH18AzPrmexYPQwGnnJW1pcbW
 JnX3nMLV4NaJ2/x6I8bu4f9SKXnLqiNcVyWpWfIHh6lL5xePtpEXSNKt3bXaNdyskxAEYjQFISA
 8lVp18W/PtuxL5fksBhcrJNMwwlr5XuORgUP89NLiraym0C8NH48HLY/OHAeonNsQIvMV8JLeaH
 g7CizrKW3TLet6qotgzX8NyYbbTIan4JO77F7jweYc55nWWZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add generic CEC helpers to be used by HDMI drivers. Both notifier and
and adapter are supported for registration. Once registered, the driver
can call common set of functions to update physical address, to
invalidate it or to unregister CEC data. Unlike drm_connector_cec_funcs
(which provides interface common to all implementations, including, but
not limited to the CEC adapter, CEC notifier, CEC pin-based adapter,
etc) the struct drm_connector_hdmi_cec_adapter_ops provides callbacks
specific to the CEC adapter implementations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig               |   8 +-
 drivers/gpu/drm/display/Makefile              |   2 +
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 209 ++++++++++++++++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h     |  86 +++++++++++
 4 files changed, 304 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 3666e791d6d6eba58f095d7fb691de1fd0b95ed3..3b8fc8f99a3d89741d863749c52167beaf7be2e6 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
-	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC || DRM_DISPLAY_HDMI_CEC_HELPER
 	help
 	  DRM helpers for display adapters.
 
@@ -82,6 +82,12 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
 	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
 	  implementation).
 
+config DRM_DISPLAY_HDMI_CEC_HELPER
+	bool
+	select CEC_NOTIFIER
+	help
+	  DRM display helpers for HDMI CEC implementation.
+
 config DRM_DISPLAY_HDMI_HELPER
 	bool
 	help
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c4187b444bcb8a50e51 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
 	drm_hdmi_audio_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
+	drm_hdmi_cec_helper.o
 drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_hdmi_helper.o \
 	drm_scdc_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
new file mode 100644
index 0000000000000000000000000000000000000000..a6ed5f0fc3835b013a83308f5285ea0819c5702c
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
@@ -0,0 +1,209 @@
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
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
+{
+	cec_unregister_adapter(connector->cec.adapter);
+	connector->cec.adapter = NULL;
+
+	cec_notifier_conn_unregister(connector->cec.notifier);
+	connector->cec.notifier = NULL;
+
+	connector->cec.funcs = NULL;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
+
+static const struct drm_connector_cec_funcs drm_connector_hdmi_cec_funcs = {
+	.unregister = drm_connector_hdmi_cec_unregister,
+};
+
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_notifier *notifier;
+	int ret;
+
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+
+	notifier = cec_notifier_conn_register(dev, port_name, &conn_info);
+	if (!notifier) {
+		ret = -ENOMEM;
+		goto err_unlock;
+	}
+
+	connector->cec.notifier = notifier;
+	connector->cec.funcs = &drm_connector_hdmi_cec_funcs;
+
+	mutex_unlock(&connector->cec.mutex);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&connector->cec.mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
+
+#define to_hdmi_cec_adapter_ops(ops) \
+	container_of(ops, struct drm_connector_hdmi_cec_adapter_ops, base)
+
+static int drm_connector_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_adapter_ops *ops =
+		to_hdmi_cec_adapter_ops(connector->cec.funcs);
+
+	return ops->enable(connector, enable);
+}
+
+static int drm_connector_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_adapter_ops *ops =
+		to_hdmi_cec_adapter_ops(connector->cec.funcs);
+
+	return ops->log_addr(connector, logical_addr);
+}
+
+static int drm_connector_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
+						u32 signal_free_time, struct cec_msg *msg)
+{
+	struct drm_connector *connector = cec_get_drvdata(adap);
+	struct drm_connector_hdmi_cec_adapter_ops *ops =
+		to_hdmi_cec_adapter_ops(connector->cec.funcs);
+
+	return ops->transmit(connector, attempts, signal_free_time, msg);
+}
+
+static const struct cec_adap_ops drm_connector_hdmi_cec_adap_ops = {
+	.adap_enable = drm_connector_hdmi_cec_adap_enable,
+	.adap_log_addr = drm_connector_hdmi_cec_adap_log_addr,
+	.adap_transmit = drm_connector_hdmi_cec_adap_transmit,
+};
+
+int drm_connector_hdmi_cec_register(struct drm_connector *connector,
+				    const struct drm_connector_hdmi_cec_adapter_ops *ops,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev)
+{
+	struct cec_connector_info conn_info;
+	struct cec_adapter *cec_adap;
+	int ret;
+
+	if (!ops->base.unregister ||
+	    !ops->init || !ops->enable || !ops->log_addr || !ops->transmit)
+		return -EINVAL;
+
+	mutex_lock(&connector->cec.mutex);
+
+	if (connector->cec.funcs) {
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
+					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
+					available_las ? : CEC_MAX_LOG_ADDRS);
+	ret = PTR_ERR_OR_ZERO(cec_adap);
+	if (ret < 0)
+		goto err_unlock;
+
+	cec_fill_conn_info_from_drm(&conn_info, connector);
+	cec_s_conn_info(cec_adap, &conn_info);
+
+	connector->cec.adapter = cec_adap;
+	connector->cec.funcs = &ops->base;
+
+	ret = ops->init(connector);
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
+	connector->cec.adapter = NULL;
+
+err_unlock:
+	mutex_unlock(&connector->cec.mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
+
+void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
+					 struct cec_msg *msg)
+{
+	cec_received_msg(connector->cec.adapter, msg);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_received_msg);
+
+void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
+						  u8 status)
+{
+	cec_transmit_attempt_done(connector->cec.adapter, status);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_attempt_done);
+
+void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
+					  u8 status,
+					  u8 arb_lost_cnt, u8 nack_cnt,
+					  u8 low_drive_cnt, u8 error_cnt)
+{
+	cec_transmit_done(connector->cec.adapter, status,
+			  arb_lost_cnt, nack_cnt, low_drive_cnt, error_cnt);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_done);
+
+void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	cec_phys_addr_invalidate(connector->cec.adapter);
+	cec_notifier_phys_addr_invalidate(connector->cec.notifier);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_invalidate);
+
+void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
+{
+	mutex_lock(&connector->cec.mutex);
+
+	cec_s_phys_addr(connector->cec.adapter,
+			connector->display_info.source_physical_address, false);
+	cec_notifier_set_phys_addr(connector->cec.notifier,
+				   connector->display_info.source_physical_address);
+
+	mutex_unlock(&connector->cec.mutex);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
new file mode 100644
index 0000000000000000000000000000000000000000..a9d38835c69a2939ca21a4fc921136a2a022248c
--- /dev/null
+++ b/include/drm/display/drm_hdmi_cec_helper.h
@@ -0,0 +1,86 @@
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
+/**
+ * struct drm_connector_hdmi_cec_adapter_ops - DRM Connector CEC Adapter callbacks
+ */
+struct drm_connector_hdmi_cec_adapter_ops {
+	/**
+	 * @base: base callbacks, providing generic DRM Connector CEC interface.
+	 */
+	struct drm_connector_cec_funcs base;
+
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
+				    const struct drm_connector_hdmi_cec_adapter_ops *ops,
+				    const char *name,
+				    u8 available_las,
+				    struct device *dev);
+
+int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
+					     const char *port_name,
+					     struct device *dev);
+
+void drm_connector_hdmi_cec_unregister(struct drm_connector *connector);
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
+/*
+ * These functions are used by the state helper, so we end up linking to the
+ * same module. Define stubs to simplify the code.
+ */
+#ifdef CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER
+void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector);
+void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector);
+#else
+static inline void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector) {}
+static inline void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector) {}
+#endif
+
+#endif

-- 
2.39.5

