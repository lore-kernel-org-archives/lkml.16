Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51473227B88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013681; cv=none; b=sRyaOVSwttJQhc+oOrrZa3g0a6ma1wLCDFK3usVrF3GK/tXHaAE9dpT+TpjiSxiC+6z8wZp3RAmvcLCALngJAWt7u08GXpHD4SPKpxPIYCUTLR5MBdtpOskjPaDhTwbMk7jPvTPyErqxL1jSkmXVU+dNOhWfiJ7HJjzOnaFDlkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013681; c=relaxed/simple;
	bh=Tgt0Uo67U1aFY7DF/ChWQEn7GbH5WCKbG+n4bTjuaYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1zbM+0t5ViHF0RklrFelODVJMU+jJHhU/Vf14d5wZncFzm1tTEwIozEkjcYHcHy7z+5ubLSCou4QAJOAavChOK+w4k+ASqBV3Jc8V6yXsgHTP7eteJJvdkMUSAHhjUTdwajfgVIS7USHX/VaOIUDjwbiSTdo3sxj2JvpOz1wd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7hK7EG2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7hK7EG2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso20878625e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013677; x=1744618477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUua635QmFw+1KGcz2nLsMIEoZ9qsls24PS1/h9+cyA=;
        b=K7hK7EG2BvMQfT9mQgCbpoc0rujBYbkA8AoQ3vJ/rBs7Um7lowzkwGdaOiISyKl60y
         zQGulGAWr0rJA8Qa2PVZpqR5FXCT/1NV6aU4fW5Ezd5xELcISiZlNSejrqb1ofULZqRs
         ke4iKvU/NOcbioth+C9ekaF2jDolPT7SFAtZ7y1LFigxLIfmzWejToTvtFelRZi7J1Dp
         Tsu+HyjdWaKi0PPfgcpVNFVGGbBwoi8hkGU0KWF5E/HNB12NpTjcL+HxknyueZmEwqmd
         i8FohjO2gmeUCyW0LWQBL+LGxH0uMz5cVia0NlhbaXOyqrEaDeNJNUSt2b36VTTGaFEb
         ks7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013677; x=1744618477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUua635QmFw+1KGcz2nLsMIEoZ9qsls24PS1/h9+cyA=;
        b=r1FNxiKAKmShqD4ZxexTw94BEASwOkfCL6X3x+uaIAOOL7aLHLq+uP0G+a2GzZVTfd
         oCa2zKyg3NYvujQVtt9Rvnqps+9dFW8Ql5dCt+Xzx5jJzBid8zIt9OvOlZmMWU7jdSyI
         hNOf5g35mLOttPgLge6rHoXc1s9G+i4dtBnUydxLAJZ9j3VtQvBIspohxxlaVt5ggrxP
         hMRxMVWSzFfusfS/Li4Ud1Y1CXOc99nEyV31Hkn0g51hMTiELdMDovWJhlHaLocK3M3Y
         xyssyE1Ny5W9oMt1TJ6CgZIZFmVdrxJQuZTm8q/1MXMEfdM3RPo8KZ3NKQ/txIP6qUIk
         UEzA==
X-Forwarded-Encrypted: i=1; AJvYcCWrVWJUZgiliPHzS7G6RF0IbbUCiTlEBpj+AE8/W4xrwSYLH0Lf5wWVJeNY5PVqP9F0HMR/wf+/q61y5Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUD7AVVPglRQ8pN9/vCnmsLxEe8vj0Yqq/Wroi5vYam1TtGwFh
	UOzcarFi61q96EBBvIqO8W0mKezoO7E8OGSovVOT4kJKL3vTA+Mf
X-Gm-Gg: ASbGncvHzseHxsdN04x8/tpq6mmkuZtZ8ZphVSVnmuvHahILn7yZS0vr1DfQUJh/O0G
	ER9rR5tZNeq1CQ99E6budLNF5yWddaKTfrPdC4+H+kjPGB4r9MBYvXH+dpQdsl5qUUgvs2YnAJB
	4KQ23XbSNQ7duQRbtu01NzhRgKnQ2cBVfbGAwa3CYC9gBnyNoU8326SSuoiiUUuHZJoiwtpaXjz
	NDm2aknt2MLbnNKWeDFiPXMFqBfc2Zw8CM/Y5PpZ8dHh6Yl1fcg+JQg83HAORH+ee2SGKRdmbto
	xqozFzL6ufHq9tG1boVKuIcFPVdBirAOguYczzszMbyd
X-Google-Smtp-Source: AGHT+IFI6ekk9Xs9/JQib7ERN8AX1pdeGzlpPQRVexeoG6RA4salMBX7SV3QcoiGa54zbZIQ1Bao2g==
X-Received: by 2002:a05:600c:1989:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43ee0660a3cmr78042835e9.10.1744013677442;
        Mon, 07 Apr 2025 01:14:37 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:36 -0700 (PDT)
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
Subject: [PATCH v4 03/16] drm/vkms: Allow to configure multiple planes via configfs
Date: Mon,  7 Apr 2025 10:14:12 +0200
Message-ID: <20250407081425.6420-4-jose.exposito89@gmail.com>
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
2.48.1

