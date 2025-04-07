Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806B4229B0E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013684; cv=none; b=A2E12innxqRQAIkAcBQFyLW/X3gyDmCYBExS1z7xPd/QKpM4lgijOZAhzv6fX9UG8yfosOAi2w7Mxw3G0pQt4feZ42vM6+H4B1seNqr3E49XpDaWd2/Bt1X858T33bfTRAWPVO+1x2Ucv/TDCDk+0UTY5M/aXWHqQIY9AB+uMoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013684; c=relaxed/simple;
	bh=NtlP73y2QLHtTY2hQomX6whjhghjIfJHWmEBp2Sp+eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vo7WORnzLvXgIGXC8kidshqJN5+3pWyE/gP4qJsjZWSSQvpvQCe64mL2IB/RuUax5XRcRhuAcqgac7bqQ7+UEaTkL2EPT6/3K1zi8YsHLEKKGMQfwKIERNKgD+9aK+AZHz54mShiY5Enq/cejqUkCJhoByXfBEA12EJPPaskDqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFTyh3y5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFTyh3y5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0782d787so27844875e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013680; x=1744618480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stsFD64ii1jnZLgpjtErPKPFyA0QMQaSclvsTtujv5k=;
        b=kFTyh3y5R/uSyUC+jnmP8NGmap7WmsZ7OM7o9aKbMXoEBQAQnk4WRDfXYQFxP1sdU9
         POnXTPzuRGUbttg+NTaNSetZBbdtnQv2nwP84QIY4KPPJjDvRIpK0DRkQuGBw+Vd38V0
         5IIjAqsfEZhbK5+i2grIujFm1bpwJX/HOV3NnSYMHyUWQAPaO7opoc4qrldYvBqzosmg
         ucmvFm77tDqoWkBCS8mfFkAF52Kv8RXvmuFo97aEgYzyi+bLGQMH8eZgpDQFEisxToJI
         Ml5DWQPtKaRkkJph1Jy2KydoLv+5dg4RLFnQk7iex9GQgRQAlJXCHm/cN0dvDAc3AbWr
         MkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013680; x=1744618480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stsFD64ii1jnZLgpjtErPKPFyA0QMQaSclvsTtujv5k=;
        b=s0nJcOEQ1ZzWSZj4qmsU7/Be3+V/R4+3GzUUnm0u0YgbxYa2g4KQ3RbaxLcd3K02/S
         sYrIE1d1PxitgVXcgFfhalaVm1qgPFDGObazYjgxUfhsuLnVomhhJU+Gk7datSYGfdcW
         WItGu7PWQJtrwJl1aag3kZB2MuF1uPWqP2pRe1En+SNT0UEr7Tj8q7GBVRqOmued+xux
         llggXN24f9gLmbCOd4T6Vna4i9/rkTfvux3o+6KSaMfRUvv3Thclw+cvZbowNwKj+1Jf
         CIDBzDDGttD+BjZLnYOdQXkiCFEBTr30sxiV06tqQcXrtpb18Xo88U/MWyJDr/LqKm6B
         4wcg==
X-Forwarded-Encrypted: i=1; AJvYcCVLCVSHrxsxPn2btyDnn195xsKPPKJQ6aauJU3+9MSpNr+q9ZR1eCjMZJ2d5knOPrDxciLe/f0yLrfdOO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdpXHCKwjGqeT/aY/eTe27D3pxp5waRfUibKLvkCxJZt6KEq6/
	5+Y9CQ+qXoHxXoTChG/PKSxL4mTpvSNNv6ZFA6EQq/Dk5AsDi7Rl
X-Gm-Gg: ASbGncvQGSTDydEOCqFJ9S2fI18Wt7d6QBh+aVNdq9jwhaxwFKT5Y0mjab3idyy+ule
	RBuIQBqoSr5XX0HDocXKhP2aRCG9SqK1V81mDbgQIriSgrEqTU2GrbgLpOoLXAoC8OWvSpNFlu9
	ozbbG5YeHHer+fok9h5nHLZnwPwaaySPKT/9zN/xJPCOJxcxKKxxr2QGEOpF/OIDL9Cv1g+gRZD
	Yzvbp2U+yqgTJ9e8/xgRq1HvEt9euRNpBz++k6OcnVrvCm4VqH6GW18wnxlDVALjMyezm78INps
	u6axxnHG+IwVgAp1XcRI8q3dZ98L4flmFcvF6U9mVEIG
X-Google-Smtp-Source: AGHT+IGWmc0qnmfw5ElLS8GVANgd5HNvybgkrzUJOpJp0hC5PBZchMlEi/qnTwrKl0W4fJBN/wWkuQ==
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43ed0bf6aeemr105262585e9.11.1744013679533;
        Mon, 07 Apr 2025 01:14:39 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:39 -0700 (PDT)
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
Subject: [PATCH v4 05/16] drm/vkms: Allow to configure multiple CRTCs via configfs
Date: Mon,  7 Apr 2025 10:14:14 +0200
Message-ID: <20250407081425.6420-6-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/crtcs to allow to create as
many CRTCs as required.

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
2.48.1

