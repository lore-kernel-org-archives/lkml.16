Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA6289819
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626088; cv=none; b=Q99p7VtfRiPuQ3w5TunidZezW/tbfqeXyV3rFhsKANbeNx8hqTlXKrbXoik1ZCGcvdeco4cXPVGqceHGfMHA0SkxJIZBVnzO9ur/8T5TAJa8jv9nNYO9UXqmnZFc3zcyGSp5RcECgeT8mflP2TtleSoz9dPVo70OG1hLw0QNf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626088; c=relaxed/simple;
	bh=gHTRudx0oIyMANlGReIqmUJ6xeR71GN7y2rEMrIES8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMfppkX4GMn2fS3d0ElVGQJ4Hg3NrGny8t2kPke3e1bK5gk/xznKdrb+FE8CFcprCteJV7TywI6fJB//hlL0BvMJd38tvzP8z9FyCydvDd4xXkUGvlV4uZcgeR0WXc8E9ZkZlRflQu/Jn6GP4M0xIgMC4JZMFXe4QmmTLcdNglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4ZTrihi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4ZTrihi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so46346505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626084; x=1747230884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szIFBV8YPPxNmpLCZTyiXEFnFZhMw8GcFkarwfqTbxI=;
        b=A4ZTrihiEWbhxpgvZL8QKMTIdzPLLTyAXRMvyNv+PoJemaDesOZ6aoQn/WqOLlvX6s
         9tXmsNHfHELJgP9enwZfJmLQSYxxRe7QlMfk0POK51r4qsELOjOkOrBI8XtHIMVRHhh9
         0nBxh77jU9aIUeXw4hno8HaWYgQzvxiLWTd5/Pl7c1jpTaG2w57uDzQ7yW+diPjvHV2O
         nQeBpWtf2XG2lBckTEr5Cuay8YpKXH8GfbfedXfUNT+q4SfzAUrcs/R8aPoVZgLSm5jn
         eRg5oZwWabDvBTxNxefSS9cNpjx0q/VCoOGvLD+oRTrxI9rTFtujtvfT++flldzTtS7J
         BwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626084; x=1747230884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szIFBV8YPPxNmpLCZTyiXEFnFZhMw8GcFkarwfqTbxI=;
        b=DV+iObERuJs4+PQ8cmR0zP3AT025si9bdvuLpDm9z4QoNe5MkT8hGVBk6QcQ5iKfRv
         wFH4+b2OempOwIeDWf0PKEVq1mDGR/nkF1ad6LinrMzk2p4uTG9QqHz5n59MwVzejwY3
         28eWtuiTUBKeY+mUQpCc3Yv3QT9bbfW3SLx8MG7vz56L2ulQW4rvyeapsND//kS1gLz+
         zXvc8Tbh2TN61VhN25RTUU4X0XOHYrSNrO328/XUVHchfGRSzqrjCVvb9aROZI8HV2uv
         x6+i54NkGwSc+81YmpgMgaINPaFW8ETuRduxSQD/Nny4orFymLakBvEw6mX4C//JKDSy
         PieQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG7x/7eDf7u6t6p9qOKuHiDn6LVl9VFE1GGw00yJxIwAqMNM3PeqCqgXm7bzVZz+OJoA9Pe5GKhx4gunY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvqPQFUK+rD+LKEAFzf9E3PmPuUMvXIJ0b/cvFGOdqKqJqtUBv
	U0Ced3UPqPPTry3gXwsaERmhLw4Ns9mXTSqYwOo3lfbWsA2rSrMY
X-Gm-Gg: ASbGnctKXnJNzDajBEUUSSBkRJ3fxbzPBmBeee0P4KJdW6JOSfwex/gHX2K2Ok1Gxts
	JOi0sSfduVqkx8SBr0mkHK2zlP0hGXrcPzl740LNRsGVYY81i98vddprzXazC2l6gIBe5vXttJC
	NqUSJz38OS1tIzmozv+QkYYjkzxjKi2ietaFtlS6M1wU7c5ug4UXp0B80603Ei6fR6jeJt67IZC
	zAsg2sZU0HFRJVhdxZtzHIkvN0fCTTjFjjJP2/RnbgQflaifHoaTw4/euh00oYR1JM7jy5qkJK5
	MJ4A6t+77ixYG8+DNXDbfN2LSIZ/nFR5kgbtCpyQIA==
X-Google-Smtp-Source: AGHT+IH0VKnNabCRFspNm5ngDD4GOKEeZjWbA3IUZ+uiBLyha1JXLGWaq7yTWyB8q20kVAk9xNIfzQ==
X-Received: by 2002:a05:600c:5295:b0:441:b076:fcdf with SMTP id 5b1f17b1804b1-441d44b5e6emr29760855e9.8.1746626084138;
        Wed, 07 May 2025 06:54:44 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:43 -0700 (PDT)
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
Subject: [PATCH v5 08/16] drm/vkms: Allow to configure multiple encoders via configfs
Date: Wed,  7 May 2025 15:54:23 +0200
Message-ID: <20250507135431.53907-9-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.49.0

