Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AEC22A4D3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013687; cv=none; b=YRGAXVZSSrA9bycjoftIHZdFmjG5ryP9wtoe499R8JPHhaFbHbqegThV1MTk3k9ZnSKgaSlMQwtcWLWxXMntXhKVIAmADiU71ZPd+xEpNINUamDSyUMbbgECsS/xTjqUOB39x+rh4sIbGaoWExkVSUK9s3M6TysU53DS8AG2QxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013687; c=relaxed/simple;
	bh=Wi7ykHMtyPx1L0V++pfgxps2pB8dKAlH8vyEeYIBhdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9W8L55bVfto+pV+VhJ7k944tr/j8lWNNojhEw7qwOSwwDq7kG4Hlg5/kMjMElY2u3hFcYz7bFN5kQfPGuiMTOCKIC+xXLrQZX8aP8AksYpKxOL6BdhdtfHCyf4baJTvoDlS15HarexwA1vbc1EB/ndQVFSIZg23bNbEE2KUnI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay0U8lD+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay0U8lD+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso20457885e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013683; x=1744618483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0WRLpCb7W4S/OASemBlBhF+MVaGI+eJr0lijF+1c3c=;
        b=Ay0U8lD+34h+pNsgZBd3OO5O1hS1a5g07m09KYD1UnvcEH3jStRxFTuVoCRklMdzfW
         WXGLrX8Kl+B6o4vbNtm9ktGUSTjSotgojQ0FSqqEM5SEZ4cdoOVYSBjW3EQmSg0pamNb
         9IYTIKYJLTgTHkKrZozdblCoEwAVD/SSuHmLpStfzBdPPcXXbbOaWHAj1jXuUY44H4E9
         uCVM1slLPX+ah5028HULOPfY8+mbc6qTE0mTVEpMxjjLQxF+pVzksyo24nvYwYQhFAyd
         W50HTai0YZqY+0V9ftprYxRErnylcxiIfsgIniaimb9hVYSI1YXax0ScxnKwVWWNcbBE
         PNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013683; x=1744618483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0WRLpCb7W4S/OASemBlBhF+MVaGI+eJr0lijF+1c3c=;
        b=G4CdUkF9qCaVXferGC4EvLEb5vWe5j9CGdbVhRi2Xktff3a11PppK+/oOnueEw1/XW
         J+Xmf5rmk6zIpdtIzcIUUA3XBSv084uH9S16Gc4+B7P38m2/1v5uyoHIqH/9qUqfQ114
         tRP8n2kX3vkTobWpPpE6+n3L5nlmpWeU48HHd0VXWDs8FTK/gI3OFiM6iya/iBQdoqyw
         +ma7Vg64lJX7MnTRfEtV27WQespxrb6twpHqU3bA3rzZNq7ckAgl/DD/0V8wJ7Q/32mx
         VtpnaYUXVfRPqCNYRIl05IlfGrYmWqhE7bb98OhF1VggrhP08982BwIeoHSF8gJIO5q1
         Ao6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdn28ytcLBzQQNlxBW5Od1QGt4bpX3cmSeDNGJsEmyMUT21cFQ1nLnudKuZXOXN9XkV8pfFTIMBokB2kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfduME/J1mYBJFr8wu/SLH1V0cEwrTVketZlgx+wTXQ4HIupKi
	bviuR9zeymrq49w0sCzJhSSvkcwXmG7Ixq0+oApu6hDJdthYLe+2
X-Gm-Gg: ASbGncsdIjv+HSnZuokbH1TWzzDlEFyncwWmJL4TlS4BI6pnPXrcVNUE4hGdP/MANq7
	yY4gsumu2Xxz9VuZGb29hmUJPFHxTLKxtEqfCNwOxJOwtu6p30NfjVVO0LWub0ENIkVXpxGGWxN
	2oGv7QV7w3COIDBB6zeDljMnmPtl3x7Ahm+qQabz2vOwfe/Eet4FEePQawGHFpDk2CC1QXYQrk5
	XFYt6UgNoHgWrnN9LMtEiymB648B6e/aGDLVsd2dKQfFhzMvxitjEaFG/r/fejpM9g8VDDrWLrW
	rECJ+5IFKVeTCBqn/JiGPTxS+l7bZUM5T9bsEg1jYsOn
X-Google-Smtp-Source: AGHT+IG/88e0b60/Y0C5GKyTtSCd9DooMjlQuLLois99UoJNmC+RM6Kq5lX/7f0WXIwo/PqsRyl+Rw==
X-Received: by 2002:a05:600c:b95:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43ecf81c336mr101643585e9.2.1744013682759;
        Mon, 07 Apr 2025 01:14:42 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:42 -0700 (PDT)
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
Subject: [PATCH v4 08/16] drm/vkms: Allow to configure multiple encoders via configfs
Date: Mon,  7 Apr 2025 10:14:17 +0200
Message-ID: <20250407081425.6420-9-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 13b96837a266..e24767448775 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -76,6 +76,7 @@ And directories are created for each configurable item of the display pipeline::
   tree /config/vkms/my-vkms
   ├── crtcs
   ├── enabled
+  ├── encoders
   └── planes
 
 To add items to the display pipeline, create one or more directories under the
@@ -98,6 +99,10 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support by writing 1 or 0
 
+Next, create one or more encoders::
+
+  sudo mkdir /config/vkms/my-vkms/encoders/encoder0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -119,6 +124,7 @@ And removing the top level directory and its subdirectories::
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
+  sudo rmdir /config/vkms/my-vkms/encoders/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 2cf97c2b6203..0df86e63570a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -18,6 +18,7 @@ static bool is_configfs_registered;
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
+ * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -27,6 +28,7 @@ struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
 	struct config_group crtcs_group;
+	struct config_group encoders_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -63,6 +65,20 @@ struct vkms_configfs_crtc {
 	struct vkms_config_crtc *config;
 };
 
+/**
+ * struct vkms_configfs_encoder - Configfs representation of a encoder
+ *
+ * @group: Top level configuration group that represents a encoder.
+ * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @dev: The vkms_configfs_device this encoder belongs to
+ * @config: Configuration of the VKMS encoder
+ */
+struct vkms_configfs_encoder {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_encoder *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -80,6 +96,10 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+#define encoder_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -344,6 +364,69 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void encoder_release(struct config_item *item)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct mutex *lock;
+
+	encoder = encoder_item_to_vkms_configfs_encoder(item);
+	lock = &encoder->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_encoder(encoder->dev->config, encoder->config);
+		kfree(encoder);
+	}
+}
+
+static struct configfs_item_operations encoder_item_operations = {
+	.release	= &encoder_release,
+};
+
+static const struct config_item_type encoder_item_type = {
+	.ct_item_ops	= &encoder_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_encoder_group(struct config_group *group,
+					       const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_encoder *encoder;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+		if (!encoder)
+			return ERR_PTR(-ENOMEM);
+
+		encoder->dev = dev;
+
+		encoder->config = vkms_config_create_encoder(dev->config);
+		if (IS_ERR(encoder->config)) {
+			kfree(encoder);
+			return ERR_CAST(encoder->config);
+		}
+
+		config_group_init_type_name(&encoder->group, name,
+					    &encoder_item_type);
+	}
+
+	return &encoder->group;
+}
+
+static struct configfs_group_operations encoders_group_operations = {
+	.make_group	= &make_encoder_group,
+};
+
+static const struct config_item_type encoder_group_type = {
+	.ct_group_ops	= &encoders_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -447,6 +530,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &crtc_group_type);
 	configfs_add_default_group(&dev->crtcs_group, &dev->group);
 
+	config_group_init_type_name(&dev->encoders_group, "encoders",
+				    &encoder_group_type);
+	configfs_add_default_group(&dev->encoders_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.48.1

