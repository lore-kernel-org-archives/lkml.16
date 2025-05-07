Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574328936D
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626082; cv=none; b=i4WJjvVoZPLWhX7r+NH6YNI3bOYtWYWcZhbifoxxyb4Hi7FZynGDbI4Y2Hc0JRPlmzauqAUvbEZ6Cj6Bhu0+CBh/67mhHRLFbs7lGHr5Sy2lMYPTpAi21sBlOUQ6TKDOKFA6hNnNc1lLZt56yIvxrnPuspl6xZzezhyWEpsov9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626082; c=relaxed/simple;
	bh=glrCLgnBY+H43Q++O7hbiW4bABtRSgZfeZ6U3zwr6Tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHOYu7o/GUQnUAmt9OwdUuNHGf7NNJ0Jx92ZRY3qEpyDrI7+e4W6u1CSns61jykGmdPxsJKeYgtXrWCcVQLM2OVfMfJuCK8VBK32hC5dEIpTOHQE5UybADkqrF8vIRjuexJ70u9BjT4INxFna8cvppNqWF4Bw2iH33UvqxXRK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRCWLZ6a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRCWLZ6a"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so28915385e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626079; x=1747230879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MkRDDVrUtc0KB2is6UusZZfxeTr1FdTVUC/swDQDIw=;
        b=ZRCWLZ6aVeYGoKr5mkkLEkbYbqwFAn8qK8VEHoxMzRqngS8Xf5lustcBY1QETZZW95
         eBzYUWgM+l426vTynU0XTVolV8rsXfy73EFW/u8LCs+6Z+iXoYioGEtj0PclR03b3B/6
         yZM+7yrxqNiBqoXLzc7SCE8iL/2kjnNLQl3Oyti33ndRXCnyTxb7S65WQSXwS4UBRETr
         8ADpohlDSNIJFTKrhJahW/aR+BP7Jn+TNnxgqubOCryDNAn1cHGzNdJp2wAT/h8OxCCL
         hrY9LtuIFtz7KdJJqMsmY22k54ykWLeJil6QpFIVycpQYgapWQ8Xf/RTOnlXkwr6GnVK
         uSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626079; x=1747230879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MkRDDVrUtc0KB2is6UusZZfxeTr1FdTVUC/swDQDIw=;
        b=V7gpybBU2BWGJGICZZQZ9WQNFaHMH57azz/ZpkPcGMPaCod+wKZRUd04m8oOll67Mo
         vxTom8XUXwPT8rPZB4gDn6pzKPdiCwUizFH58yga0wl93ifZjnVUMP2yCibWhTMOknWL
         dCOvkBVhruFqbY6JbATnHObcwLTVyv5GPcjtHNr7ck6Wn+0y1dn82Jk9V4ZUakoo5L3S
         wnVhwm6dC/ke4JbHXDgqw3523+t+hX0iJwjHUb/U8/jpsj3SmviT+qpTz0dtOji8GQZV
         Sy7pQ1q+0LHTXLP0MdmK/lUc+SWNv17kZBvG5tJpYtzmJLr2Q2axJMJgYyFECD+iq4bj
         +TYw==
X-Forwarded-Encrypted: i=1; AJvYcCWNvx1KBIwYxQooLPRRg/6tDlSxPLM7w/5wiLJyAyAxL3e16nqWlku/2610D4qRWyp7ShT8BsfTsV9taSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMd3q/cS/dur2me92lNa6EPFwLwxPSdJj9tyTfcrm0MxBI9JuQ
	rzoRwoU2m5s2W+hG7y8aE788D+El3rWpNEaROc2hsi7gcUMEMYIE
X-Gm-Gg: ASbGnctjPdtLRI2pCXepuxqq/W7M4qksewuX+A4Si/9YvnddapnaParhdPIAxTSnmjE
	BtmoV/QxPRWCbiyACGCTdK4OpDQuY3FpNruCShiCvj+8aY5LgNHKtJn7nya1sRAxmiS53MddDVk
	SVpF/oecHJTvvdXLhLuZlQBx8/D6hvO19kicls5yzZqo5Jc/A5NVt8wg4Sv9Z8/zBkPjruFC9/J
	G0lub8aL70qtgpVpL1iDpW/FW2ZYx++YKJgmBNDZZi4Zl9Gn6pY4hwX+MujLUw0P0NTbj5ISNLX
	uQ4PuhWjbRsjPef7SbVL5Z3DF9YYOqHQ7G39TaaSgA==
X-Google-Smtp-Source: AGHT+IEX+qrYo9ITH8mXMYtldqCBqVZL/Ke5qyt7rws1ge4wMJ5oq1GeQ0TjMBONGIsGpHvOqOSlpQ==
X-Received: by 2002:a05:600c:4eca:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-441d44dcd83mr24889185e9.21.1746626078427;
        Wed, 07 May 2025 06:54:38 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:38 -0700 (PDT)
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
Subject: [PATCH v5 03/16] drm/vkms: Allow to configure multiple planes via configfs
Date: Wed,  7 May 2025 15:54:18 +0200
Message-ID: <20250507135431.53907-4-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes to allow to create as
many planes as required.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           | 16 ++++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 88 ++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 423bdf86b5b1..bf23d0da33fe 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -71,6 +71,19 @@ By default, the instance is disabled::
   cat /config/vkms/my-vkms/enabled
   0
 
+And directories are created for each configurable item of the display pipeline::
+
+  tree /config/vkms/my-vkms
+  ├── enabled
+  └── planes
+
+To add items to the display pipeline, create one or more directories under the
+available paths.
+
+Start by creating one or more planes::
+
+  sudo mkdir /config/vkms/my-vkms/planes/plane0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -79,8 +92,9 @@ Finally, you can remove the VKMS instance disabling it::
 
   echo "0" | sudo tee /config/vkms/my-vkms/enabled
 
-And removing the top level directory::
+And removing the top level directory and its subdirectories::
 
+  sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index ee186952971b..a7c705e00e4c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -16,6 +16,7 @@ static bool is_configfs_registered;
  *
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
+ * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -23,16 +24,99 @@ static bool is_configfs_registered;
  */
 struct vkms_configfs_device {
 	struct config_group group;
+	struct config_group planes_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
 	bool enabled;
 };
 
+/**
+ * struct vkms_configfs_plane - Configfs representation of a plane
+ *
+ * @group: Top level configuration group that represents a plane.
+ * Initialized when a new directory is created under "/config/vkms/planes"
+ * @dev: The vkms_configfs_device this plane belongs to
+ * @config: Configuration of the VKMS plane
+ */
+struct vkms_configfs_plane {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_plane *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
 
+#define child_group_to_vkms_configfs_device(group) \
+	device_item_to_vkms_configfs_device((&(group)->cg_item)->ci_parent)
+
+#define plane_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
+
+static void plane_release(struct config_item *item)
+{
+	struct vkms_configfs_plane *plane;
+	struct mutex *lock;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+	lock = &plane->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_plane(plane->config);
+		kfree(plane);
+	}
+}
+
+static struct configfs_item_operations plane_item_operations = {
+	.release	= &plane_release,
+};
+
+static const struct config_item_type plane_item_type = {
+	.ct_item_ops	= &plane_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_plane_group(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_plane *plane;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+		if (!plane)
+			return ERR_PTR(-ENOMEM);
+
+		plane->dev = dev;
+
+		plane->config = vkms_config_create_plane(dev->config);
+		if (IS_ERR(plane->config)) {
+			kfree(plane);
+			return ERR_CAST(plane->config);
+		}
+
+		config_group_init_type_name(&plane->group, name, &plane_item_type);
+	}
+
+	return &plane->group;
+}
+
+static struct configfs_group_operations planes_group_operations = {
+	.make_group	= &make_plane_group,
+};
+
+static const struct config_item_type plane_group_type = {
+	.ct_group_ops	= &planes_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -128,6 +212,10 @@ static struct config_group *make_device_group(struct config_group *group,
 	config_group_init_type_name(&dev->group, name, &device_item_type);
 	mutex_init(&dev->lock);
 
+	config_group_init_type_name(&dev->planes_group, "planes",
+				    &plane_group_type);
+	configfs_add_default_group(&dev->planes_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.49.0

