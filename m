Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7CA22ACF2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013689; cv=none; b=YJMDPcv1jhtInv2oG+IjMSmhBiLMka23tr1/bCF13BdDMD9xIoFF4xhd9OTjTjLwujpFj8QyF7E4X0NiZZVYmSaoNavJj4n9okHNmHsQCOAjaNwp5ZUubTW29xWyrwR+HEADIA8pMbwRQ4zWAQ3vsTIQoEOXEiR2tH4fGTbuALw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013689; c=relaxed/simple;
	bh=xlyc9xz7v7izQS5cxRl9uo+uAbZM1fvtbJc/RpAdlRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gq789XcccJZ5SPkeaIyP3z56u0Q0sgpK2AaSMhKID3A01ctsOQvF2Y5J+P6m2W/uIOFr7UF9r7eNALIXZEtC6Q4vjSUX/Lc2kiQXnitT/q7HVTHLVzgl7ovkKBgPH99PCtvN/pXxg7M10rKQG6v5AV0uJyuEbQ87THBOzADSG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp2/uag0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp2/uag0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso20275975e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013686; x=1744618486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30g7j8THiH5G3j4prRnrzSzWMrdBeS/8zYzHDTqKqNo=;
        b=dp2/uag05dwXjnUkBMcDm9t0czReVYgX3pgaFpfrXlSACT2vQ62+FKIE2pL9kkoXDt
         ZtMADav5ispXJQb77KfYnODkgBtiCVfq3zinZvnle1uQvN2CyM0662LO+zou1FDOaaNH
         aqJ6+K2YuYMZFbh5jSDg5i3pBsclXDN9Kwe7qyxpNSmvD/IqGSUu8h8EvdE3k99QqI5H
         lIeZ3yKE3UgyddfFkPKLxscVBGk5jtA9F2aJLz4gIjMV3kdU3XrxGgA+2O4Kixp+XHJB
         rmwBkUpLZvJwaOMTY5BlSbI7LdQjuA74ffZwDYJ4wsCE9lsoO3Uf8VrP9hcEZa1NqPbA
         3DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013686; x=1744618486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30g7j8THiH5G3j4prRnrzSzWMrdBeS/8zYzHDTqKqNo=;
        b=dKztWTbWxCWuBQpAmbBesy/s1bm6WE5Dx+hXIfwcW38cEKoVR/x4Sy/Ck6ikEZP8+7
         2TQOBurkPN3SG27oIsRd2NOY5sWU73C6P9L5hovsLrZf8x3Te+NcSHEUO2wXEQZZYOXg
         +W3qOTCkfxz8+MKtJXvIjyUt1jYuuOEIRn6RXHp0lEvECOSLVyoC4qhCQ/n1SM4oePeP
         zQwf1SxK1dqerxCRnb3DScDMQlEZYIBExHtSde1TpvaTWgV9hnHoM62aygML36pSznvC
         Zn2kyS0mPYBXdXl0MXhAjkYuHNBqteUu8Z8Jd5VbtZmF2hLSVIkU/730uEgPyVJgQ1Mu
         pTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0g9xyrJK6XFsOXkSZxotVhw1JeulEF1X3o5jr7vXpBsJKPkyrJoU1zcOar14ikTYN3roR9rGuGuxoHPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTngXRwJMwDsZ1im2uRuPx6+yt13jHr8ukhHLszeh96hLG6XAa
	odTiZzzA/z1FirpAnqimuqEVRD2SLwYbg7BlkWMPWy51ISReUotW
X-Gm-Gg: ASbGnctuZTB6xuLB5sOXCIQe39DpaESnu3t+OrP3CjPDGDz3HA4hqxzgHKgJbDHYaIA
	8AbLF12yvVDLO46SxpaCSrELb6JkLruWkv7wLTivuaelJBXunyaaflGUOHWjnp8BMVOSxZ5k1N0
	VLkqng7vWcTQlpM+1GMRLZzUeAoanAGOrM3I8OnsmMzyZ2p5wyOUzbj564Mz+noWTnXWP8nwDdG
	TzXWk3nQHgSSQ1rRTyoGiW3w4q11Laj59lfAmn/F0qGpXrzG2t5/RY67k8J22RH5UTIT+7BtauE
	kJbq47bMY4ezY+iMCWXqRW3wjw+jyBvucnT/BcTITEetZNzWvqTQ1q0=
X-Google-Smtp-Source: AGHT+IHfD6WX+Bf3OS6nFCMzxsgLn+PXcybie2ZXiokzoVzxIvqAtscNt4JuusKeP7/Vs5fEVsEjNw==
X-Received: by 2002:a05:6000:2907:b0:39c:1404:42df with SMTP id ffacd0b85a97d-39d0de3a383mr9421132f8f.30.1744013685893;
        Mon, 07 Apr 2025 01:14:45 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:45 -0700 (PDT)
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
Subject: [PATCH v4 11/16] drm/vkms: Allow to attach connectors and encoders via configfs
Date: Mon,  7 Apr 2025 10:14:20 +0200
Message-ID: <20250407081425.6420-12-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Create a default subgroup at
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 62 ++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 744e2355db23..74126d2e32e4 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -112,6 +112,7 @@ To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/encoders/encoder0 /config/vkms/my-vkms/connectors/connector0/possible_encoders
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -129,6 +130,7 @@ And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/connectors/*/possible_encoders/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 692e1b708012..8e90acbebd6a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -88,11 +88,14 @@ struct vkms_configfs_encoder {
  *
  * @group: Top level configuration group that represents a connector.
  * Initialized when a new directory is created under "/config/vkms/connectors"
+ * @possible_encoders_group: Default subgroup of @group at
+ * "connector/possible_encoders"
  * @dev: The vkms_configfs_device this connector belongs to
  * @config: Configuration of the VKMS connector
  */
 struct vkms_configfs_connector {
 	struct config_group group;
+	struct config_group possible_encoders_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_connector *config;
 };
@@ -126,6 +129,10 @@ struct vkms_configfs_connector {
 	container_of(to_config_group((item)), struct vkms_configfs_connector, \
 		     group)
 
+#define connector_possible_encoders_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     possible_encoders_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -528,6 +535,55 @@ static const struct config_item_type connector_item_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int connector_possible_encoders_allow_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+	int ret;
+
+	if (target->ci_type != &encoder_item_type)
+		return -EINVAL;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_connector_attach_encoder(connector->config,
+							   encoder->config);
+	}
+
+	return ret;
+}
+
+static void connector_possible_encoders_drop_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		vkms_config_connector_detach_encoder(connector->config,
+						     encoder->config);
+	}
+}
+
+static struct configfs_item_operations connector_possible_encoders_item_operations = {
+	.allow_link	= connector_possible_encoders_allow_link,
+	.drop_link	= connector_possible_encoders_drop_link,
+};
+
+static const struct config_item_type connector_possible_encoders_group_type = {
+	.ct_item_ops	= &connector_possible_encoders_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static struct config_group *make_connector_group(struct config_group *group,
 						 const char *name)
 {
@@ -554,6 +610,12 @@ static struct config_group *make_connector_group(struct config_group *group,
 
 		config_group_init_type_name(&connector->group, name,
 					    &connector_item_type);
+
+		config_group_init_type_name(&connector->possible_encoders_group,
+					    "possible_encoders",
+					    &connector_possible_encoders_group_type);
+		configfs_add_default_group(&connector->possible_encoders_group,
+					   &connector->group);
 	}
 
 	return &connector->group;
-- 
2.48.1

