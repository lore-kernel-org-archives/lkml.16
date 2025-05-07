Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6303D290D93
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626084; cv=none; b=hYA1xMYgcJvmio3vthsterkFeu3Pt8bcqT2/X4lBcpyBvkUWeS07wOHKZ8wy1cdxLx9XDrsbGNf0XY04Ci0IohhkHi/V1rpc7sYS8HbhG0GP7Gd5YbftEtPo7SAkBj6Uq69lO2pQ53lG0ZAaE++Dzy0ZV+KZ2WjQCVDIrCH3NP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626084; c=relaxed/simple;
	bh=9gwUJ3Bx23AfGUE8y7+UdN9N90xvwVJeCvLsw52W0bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iC5uA0PDr3GFuD47VwJfIB9JHvP2U2ghhJ+LOHMrmk0j0nqEQNgTtzX/JlL1DFM0ZVAo7qXCbmivq0fj46ZTujG1+zCY4Jg2VpxdTtnjUEsyaiWGGxFsHrIRXNmlSdjGHBTfXg+LmsVFfgfNUFRkZ2exyPzMdkkCTVlhiR0z4KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnChswVB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnChswVB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so59173045e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626080; x=1747230880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=befvdevFeXc25ATqM3Piha0M+YRSypaSrPTIWix3LrA=;
        b=YnChswVB5ImgNHpBvDI4b2cPQykBujar5SkobXPjTixHmhs2MH7RyspJX2LxvAFcRp
         TurEiBMBRyOmDbj3Dl9/LzfmKH9DVHaTA/rlCXtVXYC+Q+WrU8vfjS5F33T7WjZOCTsP
         L1m3wdTDiKFG8dBwy+Nbv1Ktj+fvvnTAf5wdSNElDGknc7Ihj7SBu8sURP7IoEW/wTPr
         bQoAiky26sPI7pfymma7rkIQZAgjYQkMSmR0VDk/Y9RYEox7vbzGnqWg/ULg6uHQqLrX
         hThao4+Einh+FtJjx/ZGD2bYfN0eRg/kY6xXnIaK7Ej+fp/nbxa27Ke1ANCUnw9pUlSX
         esng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626080; x=1747230880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=befvdevFeXc25ATqM3Piha0M+YRSypaSrPTIWix3LrA=;
        b=VE1MoMD9VQmanA1hUnN1IV6eP4zi6eVcROD/mXZRboo0FFai5HRwMjtFXYbZfFbAsH
         U8AHMp4vwFDaRWrBMyfOtkL7TmXu1IW6L2sVzVcEQ0NrFhoSF8xsWe4HPWFOO3b5Px3V
         XdCKQu2R12zlNz1wvFIHtL3AAfzoKqhMgHDmH4S6OgzvScpQm+S6rinxJq6fEPAn+2hB
         kpta4wz6I1q3ikMVj+P1sDJViVdLZ2r7RYOL2g0oNmmflR1Ax8Rw9wJTn1FZaXeQRQbX
         DpUVcKo3OAlH+4t3ahVWuX4Zs96V7cawAaeBsO4zPnPjnQOYVOaCTQfjm1tzNAYk4tlS
         x6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV1lNo2cqYJJBUtnbbg3qVZJlQ1CuigfoZAMfEXbyMiKCGOF6ujcZTb89D1lpIQsi+FaWCS8uBjrqkObk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/6dx4tOa9ck2Q7Oq7StfUFU6B6Xt59hrMhbSMPBuzL/J+lRK
	Gkz+5Tf0j2oFtutVj9+Rkvt2+m0wY5c6CKyHO54t+Eg1x112P/cv
X-Gm-Gg: ASbGnctzOl0xctIFww1A2pqMjdwUtJqLYxtSssWh0AygRMsAtpKLCV1b/+q0tGgSynk
	KpkifHnfeW2Tg//cOYRP36eAnpgF13XIKTVAaz1Qa1zu5D3xgnyXyQDuu3aNuR6r+Ty+I7TpLpl
	tHU1L0uP4CRviLN2M7YnvuYeAUFWwzaUsWNFJ6VFoUwbAbC5gcDSDKu9ckbzlLZtuk/Hvf4j+Om
	jwMzGO3Z9XnLrOk4BGr2UHeGlP5K1WA/nVpDbrV7RgkZEn4QTB1KBU5stoD03Nq/A/cVLt8wkEp
	nGtduOl9EUkMc4DuPMg8tvQau+o3fqVYp7QIS2wrrw==
X-Google-Smtp-Source: AGHT+IF0QkzntyMYLHNhT1rlotJ3+1XcNWnNPYQahrQz8tjBzlda7oH8L5x4VP+uyzZfhzSskB7Q9w==
X-Received: by 2002:a05:600c:4eca:b0:441:a715:664a with SMTP id 5b1f17b1804b1-441d44dd0c6mr22329055e9.20.1746626080448;
        Wed, 07 May 2025 06:54:40 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:40 -0700 (PDT)
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
Subject: [PATCH v5 05/16] drm/vkms: Allow to configure multiple CRTCs via configfs
Date: Wed,  7 May 2025 15:54:20 +0200
Message-ID: <20250507135431.53907-6-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/crtcs to allow to create as
many CRTCs as required.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 85 ++++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index a87e0925bebb..e0699603ef53 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── crtcs
   ├── enabled
   └── planes
 
@@ -89,6 +90,10 @@ Planes have 1 configurable attribute:
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
 
+Continue by creating one or more CRTCs::
+
+  sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -100,6 +105,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rmdir /config/vkms/my-vkms/planes/*
+  sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 398755127759..62a82366791d 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -17,6 +17,7 @@ static bool is_configfs_registered;
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
+ * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -25,6 +26,7 @@ static bool is_configfs_registered;
 struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
+	struct config_group crtcs_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -45,6 +47,20 @@ struct vkms_configfs_plane {
 	struct vkms_config_plane *config;
 };
 
+/**
+ * struct vkms_configfs_crtc - Configfs representation of a CRTC
+ *
+ * @group: Top level configuration group that represents a CRTC.
+ * Initialized when a new directory is created under "/config/vkms/crtcs"
+ * @dev: The vkms_configfs_device this CRTC belongs to
+ * @config: Configuration of the VKMS CRTC
+ */
+struct vkms_configfs_crtc {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_crtc *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -55,6 +71,71 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define crtc_item_to_vkms_configfs_crtc(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
+
+static void crtc_release(struct config_item *item)
+{
+	struct vkms_configfs_crtc *crtc;
+	struct mutex *lock;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+	lock = &crtc->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_crtc(crtc->dev->config, crtc->config);
+		kfree(crtc);
+	}
+}
+
+static struct configfs_item_operations crtc_item_operations = {
+	.release	= &crtc_release,
+};
+
+static const struct config_item_type crtc_item_type = {
+	.ct_item_ops	= &crtc_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_crtc_group(struct config_group *group,
+					    const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_crtc *crtc;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
+		if (!crtc)
+			return ERR_PTR(-ENOMEM);
+
+		crtc->dev = dev;
+
+		crtc->config = vkms_config_create_crtc(dev->config);
+		if (IS_ERR(crtc->config)) {
+			kfree(crtc);
+			return ERR_CAST(crtc->config);
+		}
+
+		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
+	}
+
+	return &crtc->group;
+}
+
+static struct configfs_group_operations crtcs_group_operations = {
+	.make_group	= &make_crtc_group,
+};
+
+static const struct config_item_type crtc_group_type = {
+	.ct_group_ops	= &crtcs_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t plane_type_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -262,6 +343,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &plane_group_type);
 	configfs_add_default_group(&dev->planes_group, &dev->group);
 
+	config_group_init_type_name(&dev->crtcs_group, "crtcs",
+				    &crtc_group_type);
+	configfs_add_default_group(&dev->crtcs_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.49.0

