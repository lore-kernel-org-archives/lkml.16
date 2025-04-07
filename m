Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E64022B8AD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013693; cv=none; b=XulsdM+UC6peDDuYf6jP61zZvnJftnRNKCqh5iSlz7ZeeVKn1bGXf0QNpizLCfHOADN80uBsRp97fouPSQSpyNutjmnhR/3Ay3VoLKVHTDTyheT9TCu2gt4XZ6rz1lkG0DLyxEn1u1BJ0co7fneypzs35ng7dMUpOkiFNBeA7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013693; c=relaxed/simple;
	bh=/ItqekCx0ii3dBLNjzbyU9huWDpEytIDpvuIVGMSb7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJwJcaTStnxxxDgcIaROaw8IKGOQ9f7HvnLp6f4u/0TEg/NJ2SGQFUfjYPCieP85+WuIZjT+R5EaXEhWFqy/VyLRwoml6cW7kBJPy/+EAHEqKccWa5Pyp/P4TYvtp9PrO1gr1ny59mFmSsUIMH4nM7pVHmNFVM1e91fIHc+Xj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnYkWKPD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnYkWKPD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso20458265e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013689; x=1744618489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDAURXwAx1KsBXr4riUk4MzDkYMXGUuztgEFx9hlcRg=;
        b=LnYkWKPD4DkoemeSBOAkhDewA/n2JAH5LADM00S6SmgEDEy4cP1buvaFP6z+Oas1ro
         TBE2F8no0c6qx7cWTDFH8yfukfhY7lZkKM4npI+8VD6G1e4Dbi5Sv8eDz6dQLC8L6uA0
         EY5GqPX7mtD/4FJLCapbdrFQfDTakoW8yl+CQXORqlZTlR3AgyNOumpeWNPGVvRunAYb
         /rssqKtNvXk9vLylNCf9vr+gG1bCx4NK/YHxC4PKscgwmj6ia4VlIKubluYs1CPpx8vI
         octYEvUv4umA1yvkUrNMktkP9mRsDDYHXN01BOlF406yeR1SWwCXjZJZhcsVpPr7p0vm
         iJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013689; x=1744618489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDAURXwAx1KsBXr4riUk4MzDkYMXGUuztgEFx9hlcRg=;
        b=lonowdhAJBnSrQu1WCEYIQAFVP6qhaX97vArK5ldzo2EFNd19ivtC/evhuVk+19E8a
         jKXAhC8TGHQ3UMJHcqq0aT58rE0VhN4Rz35jjB2N1xHBzuEfgFN9ci0a+cgqDZrSE9cQ
         VZz4jvuQnlteeVwbflmA8fI4zkbA/K+mMLi0rgrSVJ28lWPEW3DGmStDOwjpR1bCuDs8
         83K1KhJ9qKsXv8JWQM+MuoIocIyE9qsZuTk5ciVTNJYtTaiUx4SONYyB2givGlkFgpxH
         JGw9O+pDpCoLqhvkMvs5cbrFSr9QHYONX/q6mlqch2kVy5e1/9/laS34TWNqG0umAJ3T
         3FOg==
X-Forwarded-Encrypted: i=1; AJvYcCWC2h1OdukI8RHkRrXUEclz+ODL7C4hWcCMbQGqeK9+xwN3m96IAuvlCk1WSGMUrPW9KHIgYb8zlbeRHkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycST3+oyHG8as1KkjycLgMjaIu/3l24IqQY8K8Vs7TJPOrrAUW
	hWwwUri2zQFpyBnCqDNXu3dRIPYWn7vfoGXGA5dlTn4TY73pi4FA
X-Gm-Gg: ASbGnct9jZDlwrR7GxMJZfo0n/djlr5QixNdFF0bpYzJkWyf00B8EUf8URCjGcFVPT9
	rRrVHWUqOKjEYfHZClgjj98GfsjqQb/vhkWLWXcFUZ/SNsdar471NpJqAIwtcfnidn3XZqgfYYx
	GKffIhQ9Ns4Zsqy5vrox3JvnXFpW3rauwGTe7Kd1Bw/LFWBMGfJAgJleoeBv4UDK0I27VFJkVGe
	qGZgtNSwq286XVcqHdYKE1NJwiaK+2HbHNQXqlVQsaQXUiWDlPXEaeTFcDdL2CYrS/W4JX6iPB8
	niOZ3E9XojX73WLlFrWOHA2w4czam+gLX4bHAczhEuzI
X-Google-Smtp-Source: AGHT+IE6f6M1KHra/q4Is21z/AjbgrdNm1sf0V7pCHxLyOu0BmuTArVc0H+2ckarFreLsYNWXyZx+g==
X-Received: by 2002:a05:600c:1c02:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-43ecf9c3318mr89313545e9.26.1744013689269;
        Mon, 07 Apr 2025 01:14:49 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 14/16] drm/vkms: Allow to configure connector status
Date: Mon,  7 Apr 2025 10:14:23 +0200
Message-ID: <20250407081425.6420-15-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow to store the connector status in vkms_config_connector and add a
getter and a setter functions as well a KUnit test.

This change only adds the configuration, the connector status is not
used yet.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 24 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            |  8 ++++--
 drivers/gpu/drm/vkms/vkms_config.h            | 26 +++++++++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index ff4566cf9925..3574a829a6ed 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -916,6 +916,29 @@ static void vkms_config_test_connector_get_possible_encoders(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_connector_status(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_connector *connector_cfg;
+	enum drm_connector_status status;
+
+	config = vkms_config_create("test");
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	connector_cfg = vkms_config_create_connector(config);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, connector_cfg);
+
+	status = vkms_config_connector_get_status(connector_cfg);
+	KUNIT_EXPECT_EQ(test, status, connector_status_connected);
+
+	vkms_config_connector_set_status(connector_cfg,
+					 connector_status_disconnected);
+	status = vkms_config_connector_get_status(connector_cfg);
+	KUNIT_EXPECT_EQ(test, status, connector_status_disconnected);
+
+	vkms_config_destroy(config);
+}
+
 static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_empty_config),
 	KUNIT_CASE_PARAM(vkms_config_test_default_config,
@@ -937,6 +960,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_plane_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_encoder_get_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_connector_get_possible_encoders),
+	KUNIT_CASE(vkms_config_test_connector_status),
 	{}
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index a1df5659b0fb..f8394a063ecf 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -361,8 +361,11 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	vkms_config_for_each_encoder(vkmsdev->config, encoder_cfg)
 		seq_puts(m, "encoder\n");
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg)
-		seq_puts(m, "connector\n");
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		seq_puts(m, "connector:\n");
+		seq_printf(m, "\tstatus=%d\n",
+			   vkms_config_connector_get_status(connector_cfg));
+	}
 
 	return 0;
 }
@@ -588,6 +591,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 		return ERR_PTR(-ENOMEM);
 
 	connector_cfg->config = config;
+	connector_cfg->status = connector_status_connected;
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 0118e3f99706..e202b5a84ddd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -7,6 +7,8 @@
 #include <linux/types.h>
 #include <linux/xarray.h>
 
+#include <drm/drm_connector.h>
+
 #include "vkms_drv.h"
 
 /**
@@ -99,6 +101,7 @@ struct vkms_config_encoder {
  *
  * @link: Link to the others connector in vkms_config
  * @config: The vkms_config this connector belongs to
+ * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
@@ -109,6 +112,7 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	enum drm_connector_status status;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -434,4 +438,26 @@ int __must_check vkms_config_connector_attach_encoder(struct vkms_config_connect
 void vkms_config_connector_detach_encoder(struct vkms_config_connector *connector_cfg,
 					  struct vkms_config_encoder *encoder_cfg);
 
+/**
+ * vkms_config_connector_get_status() - Return the status of the connector
+ * @connector_cfg: Connector to get the status from
+ */
+static inline enum drm_connector_status
+vkms_config_connector_get_status(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->status;
+}
+
+/**
+ * vkms_config_crtc_set_writeback() - If a writeback connector will be created
+ * @crtc_cfg: Target CRTC
+ * @writeback: Enable or disable the writeback connector
+ */
+static inline void
+vkms_config_connector_set_status(struct vkms_config_connector *connector_cfg,
+				 enum drm_connector_status status)
+{
+	connector_cfg->status = status;
+}
+
 #endif /* _VKMS_CONFIG_H_ */
-- 
2.48.1

