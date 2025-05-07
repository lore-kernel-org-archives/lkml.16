Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D1F289825
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626091; cv=none; b=idoEm+tXU2Ieg8Bp3g7fIvprTJBz+O4e0BLgb2laAVi5+Rf3VcMFBycxNdgLK0RBHYNmSn5wKMsYzY4kJxUM2oPlH0IjHkxWY+FnT4HyHh5l7S83CJmOmxsd/fL2OZJHYFC5QH0aC0c+ggPImIqOuu6ImlGkpBjS57z2/EX1TeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626091; c=relaxed/simple;
	bh=7lM3QmoZUuZ5ewVujk3bgBmjYspphoHUhqx1IzXpuXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/ROIZ5E85EXisdmPUCRYvH1ljw8GTamPQVgQEmwtXijffjYgWgVQaadMgBzaAviuop5Uvi8bTZX7ewk6+ckDKKk5NcA2iPvwJCWKoVjxU5y0rc1E9fNn8c1d5v/5oA/gl9Flv+fWgnbclmov/bIIpJbvSgOMSVRqVhiVJVX8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6gfUrMA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6gfUrMA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so40035745e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626087; x=1747230887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1HnhUZAybJPAQkyvVttO/Ryt+bqlvccIOuWEXiEsjA=;
        b=e6gfUrMA3YF+2n8XMCAapv3AOrX6jSPhQ5PGopOyspMJPqjoMszkwhXfxHmk63vQfa
         MTPLvvO8FkdYYlbw2N5czZorBXBSBRLuTVvpdC1ek7KxgoMhyceMJzXK3VTOlvBHbkTX
         XVC9vPGxOeVrXAK4gJwA/MNj9iT16POkSgfhS5csog/HkhFFAq1HcVBxiH6An1vzJPFx
         qw1n4DT9vPBeHOg8YYAgU1qm73fVZeA++Fn9nxLEFGyg1W+hB/iC3AeaowULrQkC6ZuQ
         UU/3vjG+JTFuysb5Au73Me31fXWCNtvDaxeYfhzsNa1PA8S1q+wwnPzbpLNeB7zdg+3C
         n5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626087; x=1747230887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1HnhUZAybJPAQkyvVttO/Ryt+bqlvccIOuWEXiEsjA=;
        b=OPOjnM1dzPIuI9sG7XWE+cK0AkxAgDJG17UysOEsrAwvxjoCEwTWpGXaGaGr/cdfNA
         CqeGNjxWhfk4BtxMCkF1/c/UpGW9gA9XVxPdRDy4YsAx9MWmfO/rPOoII5ETABq5GD0y
         KnbR8OwplAIlnHBtEzP8zea2oRxNQLqdnjGfBoGvQLv44h2a3AQKA8Pv5SN2FUnNscNT
         Zkk3vtrZEfP72HJvBsvml+ger5QXIacRR4K7EarSZZ35wgHG3Xdbe/Pm4Bred+VPWQAN
         VKlaFJRVTTeM/nIXIoSSrJ30c/cGhZU8oPVtP7e20wpB5jpAracYHWW9mtX/zGJFciQh
         zA2g==
X-Forwarded-Encrypted: i=1; AJvYcCXI4YjZcBjXq5DbwoWdozxEH3n0HZZRVSr5ZU8F/9qPNzrFBLoRnQuS01AgRpgOivGeEuBNxM7CTRTOG5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpfRTjK7WtYhdRmkRKl0Pf0Nx4Wx+qJacgkzgh/9j4E3fqPpLQ
	6YQW4cHVlrMj0QR93jgNL/AYDObUZ98zTmg2Io9WzcUchv75TgvC
X-Gm-Gg: ASbGnctu/WA858mikdYMbxpW7cu4TDu541XKlZnE3tlxfUvO1xrOjP4XhzV59N8D3s1
	eOuHOCiYqzJiUwTD7xr0EWibbH8lcPD6iPXTMnA36m65wvElXhgRWCUqJhxEJ1ntQwfAU9fDiNp
	wxd6gFKspSYEwoQhBTh0LxAJYePHUGzNEA6tNFNQ/Qo/epvHd7igw1CzhWzv0RnIWBUL57v1hDd
	kgS87lCKbElxTobeozR1vf/0x6h1G7jCbnJH2gs4KzRR7WBet9jR7xOCinVsh3DzNukO0qgEQtA
	FEsoQtk/Ze8mHxmEw+IfFAyfwFyPKnyfw4cO6qlUnRhigJ7VCaZy
X-Google-Smtp-Source: AGHT+IEMo7mCdJC9O1HWBsIpmLiYAYtIuisIXhb76yHVW3vTbyfdJIaD/rrQNRTa3itJJqwvV8nMog==
X-Received: by 2002:a05:600c:a47:b0:43c:e2dd:98ea with SMTP id 5b1f17b1804b1-441d44dc067mr26555685e9.22.1746626087155;
        Wed, 07 May 2025 06:54:47 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:46 -0700 (PDT)
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
Subject: [PATCH v5 10/16] drm/vkms: Allow to configure multiple connectors via configfs
Date: Wed,  7 May 2025 15:54:25 +0200
Message-ID: <20250507135431.53907-11-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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
/config/vkms/connectors to allow to create as many connectors as
required.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 650dbfa76f59..744e2355db23 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── connectors
   ├── crtcs
   ├── enabled
   ├── encoders
@@ -103,6 +104,10 @@ Next, create one or more encoders::
 
   sudo mkdir /config/vkms/my-vkms/encoders/encoder0
 
+Last but not least, create one or more connectors::
+
+  sudo mkdir /config/vkms/my-vkms/connectors/connector0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -127,6 +132,7 @@ And removing the top level directory and its subdirectories::
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
+  sudo rmdir /config/vkms/my-vkms/connectors/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7de601e39d2b..692e1b708012 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -19,6 +19,7 @@ static bool is_configfs_registered;
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
+ * @connectors_group: Default subgroup of @group at "/config/vkms/connectors"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -29,6 +30,7 @@ struct vkms_configfs_device {
 	struct config_group planes_group;
 	struct config_group crtcs_group;
 	struct config_group encoders_group;
+	struct config_group connectors_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -81,6 +83,20 @@ struct vkms_configfs_encoder {
 	struct vkms_config_encoder *config;
 };
 
+/**
+ * struct vkms_configfs_connector - Configfs representation of a connector
+ *
+ * @group: Top level configuration group that represents a connector.
+ * Initialized when a new directory is created under "/config/vkms/connectors"
+ * @dev: The vkms_configfs_device this connector belongs to
+ * @config: Configuration of the VKMS connector
+ */
+struct vkms_configfs_connector {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_connector *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -106,6 +122,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     possible_crtcs_group)
 
+#define connector_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -485,6 +505,69 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void connector_release(struct config_item *item)
+{
+	struct vkms_configfs_connector *connector;
+	struct mutex *lock;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	lock = &connector->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_connector(connector->config);
+		kfree(connector);
+	}
+}
+
+static struct configfs_item_operations connector_item_operations = {
+	.release	= &connector_release,
+};
+
+static const struct config_item_type connector_item_type = {
+	.ct_item_ops	= &connector_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_connector_group(struct config_group *group,
+						 const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_connector *connector;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
+		if (!connector)
+			return ERR_PTR(-ENOMEM);
+
+		connector->dev = dev;
+
+		connector->config = vkms_config_create_connector(dev->config);
+		if (IS_ERR(connector->config)) {
+			kfree(connector);
+			return ERR_CAST(connector->config);
+		}
+
+		config_group_init_type_name(&connector->group, name,
+					    &connector_item_type);
+	}
+
+	return &connector->group;
+}
+
+static struct configfs_group_operations connectors_group_operations = {
+	.make_group	= &make_connector_group,
+};
+
+static const struct config_item_type connector_group_type = {
+	.ct_group_ops	= &connectors_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -592,6 +675,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &encoder_group_type);
 	configfs_add_default_group(&dev->encoders_group, &dev->group);
 
+	config_group_init_type_name(&dev->connectors_group, "connectors",
+				    &connector_group_type);
+	configfs_add_default_group(&dev->connectors_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.49.0

