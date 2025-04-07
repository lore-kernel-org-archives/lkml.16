Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED222ACD6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013689; cv=none; b=QbQI0TbTGnt/NSrjPVEoIZnnpkP3PHSaUXM39tHWqn9n5CEKP7iFdpGgNptPfON6HWDxU2IckptJi1NSyFVnIZeNrY0y8x7jHnJfqalBuIdhJC0V5wpbo/28QrkQyrVWOx6bPXx1rVWWFaOTy5w116Cm1zCw05wLUnuL5aXXhWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013689; c=relaxed/simple;
	bh=/TDL05ebUIGcUgDxDTG1+pOuGY3vkFH0iYlDyZ7GUKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLYN9HNeYG1+FikYvWjkDj7mYTQLXzCsei6Gfvk3LIngYjRTq2DeH06mZrekXaEADRVKMNHBP83v/t2wLaPHMexTtM9bW3GXtVnvk0egbWCGufgTazM2gQn3Rg2ei8f1MJRnyCZUfIQAdZTYb5gT9+aRG7+UNNYCBF/lCms5peQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4xnLW3l; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4xnLW3l"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c2688619bso2374767f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013685; x=1744618485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbNm5NirpaXtPMC8pxSKafBM99wUQJj6c+K5yh8PTzk=;
        b=W4xnLW3lF2vKzKr4D3KerGCPZ9cMbPS6wF2cJeNxSoSIHyHSO0n+3rGQbwPQdnVZqA
         Gwx+14PQXxX04H855nIlFc3FVW83RioX7F8g2+INAORZkj75IjFE/lZMWarVsZGqd2ho
         hzsaRr0avIkUovqDR5H53ezZ0oiU7vsUtxvUbPQjDWQTyIutcs+2L6Ljhqc7Gt+rdAt6
         5/Rt/49iw7PEdvDPSA/1xZIH+Xv3SXp5dDtPc/+MBsA4blwLO3bLhmJcCPooUjLyB3ak
         CCvo6962VSTZSQKfyUl70CXV8sNDkLTHw4lHtWYXtsG2g2+XPVKYMWmFniVB1KnR7nvI
         k1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013685; x=1744618485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbNm5NirpaXtPMC8pxSKafBM99wUQJj6c+K5yh8PTzk=;
        b=PXjHo26jxGLPxvlcZJPddBOtjn8aCtn6eG3Z2f6/75FfsHGq3GAT2/q7Janxgg/6gi
         Gc5Wi0jkcvc0w6MMf7EdkNGkgOhvWPVL5UmbK10ZeEpxVPzaMGCqiJ17WO4fwoG8MvZc
         4qF0Zm05IlzOrLmEkYdLix3jp6M9KmOyPI/8ZSNiX7pqceuo1ql3pgpKoA+GgM+asZ2E
         cm3emaEqzI8t3ccLXCpwcOUo7pEWJ0LGBE/61lFzCyTv+OHnoEDr52W3QTMZtlMLUKui
         m6JBG2YCJB0i1onrqVDgWJLDqsUBgh4dSZRednnALZuYO9vodeKKzks73MzDuItvvRgS
         9wyA==
X-Forwarded-Encrypted: i=1; AJvYcCWskONauo8XmeanO6wT+us0H5Ft8uhjcZwhBS7jSPJnPPXJQVNpR+sncs72dkHeN+eAc17qF2ySXiTBAwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyioNLkeLa9KNZr6ZffdDGDYQ4UeqikVrI8HXhWaI+0WnNCzg/g
	75EAqekuOmPUQBloV8tCOGe2IJ7cOZkAptnlHzHUo/vbeUKC1O3+
X-Gm-Gg: ASbGnctlwNG/0+zZnxJOZMcpVaIDEvh63YH03WoMJ+24/Ai7StI9F47MCIxxUN675wv
	j1LxQ+thKp19g/RQJ54j17Ht7+1Sgs8M0sdCWpYUT1O3Mz/WFAM/kmAK5q6PpyOSe6tpH2uL7AA
	UaoKmx2KGuGWr2nZL32C5E7u7svkShujEKVBsUK1D42y5a5ScoOgki/FOOjCquZNNyMtPICdGPd
	/4HNEpZ1SBZUG1m6tu8zz/CJcI5T3OYareyzyxsI+1Ik/5XChkw7vZLMFyqz8ULdGd69ra1qjBG
	RecbczW0a/rxPEEGctj4NYYuEvHoaUgMQyhYE5Xp0s+u
X-Google-Smtp-Source: AGHT+IEC9VkxZ2lAYUjC/Wj2JcXi3P3B+60UymRWG0A/oc0tTiBdLqPC0fRWUtAc90hdES/NQO4ZWw==
X-Received: by 2002:a05:6000:228a:b0:39c:266c:421 with SMTP id ffacd0b85a97d-39cadc70f65mr9760811f8f.0.1744013684940;
        Mon, 07 Apr 2025 01:14:44 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:44 -0700 (PDT)
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
Subject: [PATCH v4 10/16] drm/vkms: Allow to configure multiple connectors via configfs
Date: Mon,  7 Apr 2025 10:14:19 +0200
Message-ID: <20250407081425.6420-11-jose.exposito89@gmail.com>
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
/config/vkms/connectors to allow to create as many connectors as
required.

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
2.48.1

