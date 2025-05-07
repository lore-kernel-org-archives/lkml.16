Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42429188B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626089; cv=none; b=ZYDuqutYTibEELWPxxU6DpS+a3E0Z7rVy0ioikaJBccXzg/5Y1+cGSKsWgsKNMtjXvlVmxHxDc14eY6yLDlVoEbBzeK/UBV2oNPJk7qZqTeqnCRYJq/tfcvv8necTPB16XH6GlrxFdtGW6TFiVsm9LcYtROMT1nLZ9g3md/ZXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626089; c=relaxed/simple;
	bh=QQTQWICRTwCdXwQjBuZDg28yfx+0BiKvpXr3GPcYM/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEUAXYsMCSVSfFS08r4z26/sanMrjoJ63wCTiWgezic6EC5O0JTqW/3fD1iPqXVsyPJmoMtlDpcJqUD3bPPSo4MsVkwn7DSDrvzbQJSa/r/6+3UD04xgp9TUsY20nWizAtpy4y6M6zIAFHw6xqS099yvjW//vIK3RcCxAQOOVkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypl2K/8b; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypl2K/8b"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso32872625e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626086; x=1747230886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf29a068uSV+gOxXOAqPS64BgHiJ9rQElLGH+oW5Azk=;
        b=Ypl2K/8b7PDFPzhs3fvLtFE1LLbAQ8fwq6YCrsKYdtqvje6MVffQ4vHNcPpLhrTyS/
         kIIlVCWZE5jPsqI+kLHvtHl4fIrOmqgMEnGQlvJSom4pI/JSVg0l6X1DmMePTwcX6f62
         QeJdDzYmlUxL4eJ136qls88DNQ4mbx+ncrpCz328UX0/bfDqDxHhuKGuPs4P1ZD3HAuP
         fKAjOmz7J75V/65t87Bk8CgFC1lPCE8p7gi0Md9vmdTzfXrEjS1qOm7BNvW3hDC7XWRe
         PRLT+UqNNOB/0R5nwooT6PNE3OzZOfURM1+uU+PheDmPVpA9lAmfkNoZElh6c9D/x5G4
         fhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626086; x=1747230886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hf29a068uSV+gOxXOAqPS64BgHiJ9rQElLGH+oW5Azk=;
        b=suTUhA2ubn4lS3ydpEJEZPct03RGGKyNPCqhXFnYc5Lzgu+eTmZqCL34HcHcIZCQ3p
         jnBAMT7NXbJeMf1RsGPmq9FAXYMMHrw/6sttQnicmE9vHz/v5QdFma82afxY5VqwSycz
         +WPlSPEo39aB6fQKCFo54dDTRkNZftb53ViqeYUQGtmelG4IPhpmuLxNDbH5liNWwcaz
         JFIaCZjbcByLKoSt49QNFn1IvsF+LQe9Gc/8xxDOmWXOLu8QWpCIPeIMfVNPh8+HeoAj
         asG3AetpRayvS57SsONQhYNRhHxtDlUxdyivn4tvW1O8p6R9TnaTHSPdgedn6YymrAfy
         3rcw==
X-Forwarded-Encrypted: i=1; AJvYcCXo4GYI1PEFFfb3cVt+AnLYpq61DiY6yiGuPyfCowEpuXFzYg3zwxeeCkhEnE4Krn+twdnVfgkxHOFSPaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1NwuWjQG0wVZZAiH4UN+2ztyrpvNlXK2QOMlYDBusejr7uZuJ
	uDiw3AZIv14gVmiH8tTYawOBLNlehF3yABIP5D/dfj6axJlkFxiM
X-Gm-Gg: ASbGncvT6u4DE/CKjvRUFwOPTiySiP/pE7oc/1u7hfb2KCP9gZCWF1CCj7RCJ6iUI1/
	Fzm+RSoSXDrwlw7bjEoYFlixTO+OhHdwpxxHxnmRf51JQULiKm43vy05fC96Bz9Xfj52vpF8cDU
	TU5byHIKcI9NIw/FdznC6tNnObo0vlS7YhJgOo3t1MPHa7sO5tQvBZJCHWyGzNFU22f/RwjTEqD
	Uijr8QMNaGTn2ZmJs5+gNzsPZxN3R76f+4PdXB/hTpwsr4bRvpXcQbzOgFdVd1brYJ8hYTHoCcH
	XP6NQQjoOkQoqdpkAipiuXnt9GDJiBGOGiav7uvW/w==
X-Google-Smtp-Source: AGHT+IG3McCwf4+c/FvGUTkfhJOwvL0zCzL2qFhyOb7erSoPR0UGcnOTeNf80Nd1APHPk40TSnUX5Q==
X-Received: by 2002:a05:600c:4eca:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-441d44dd21cmr21102965e9.21.1746626085635;
        Wed, 07 May 2025 06:54:45 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:44 -0700 (PDT)
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
Subject: [PATCH v5 09/16] drm/vkms: Allow to attach encoders and CRTCs via configfs
Date: Wed,  7 May 2025 15:54:24 +0200
Message-ID: <20250507135431.53907-10-jose.exposito89@gmail.com>
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
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e24767448775..650dbfa76f59 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -106,6 +106,7 @@ Next, create one or more encoders::
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -122,6 +123,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 0df86e63570a..7de601e39d2b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -70,11 +70,13 @@ struct vkms_configfs_crtc {
  *
  * @group: Top level configuration group that represents a encoder.
  * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @possible_crtcs_group: Default subgroup of @group at "encoder/possible_crtcs"
  * @dev: The vkms_configfs_device this encoder belongs to
  * @config: Configuration of the VKMS encoder
  */
 struct vkms_configfs_encoder {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_encoder *config;
 };
@@ -100,6 +102,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     group)
 
+#define encoder_possible_crtcs_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     possible_crtcs_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -364,6 +370,52 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &encoder->dev->lock) {
+		if (encoder->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
+	}
+
+	return ret;
+}
+
+static void encoder_possible_crtcs_drop_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &encoder->dev->lock)
+		vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
+}
+
+static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
+	.allow_link	= encoder_possible_crtcs_allow_link,
+	.drop_link	= encoder_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type encoder_possible_crtcs_group_type = {
+	.ct_item_ops	= &encoder_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static void encoder_release(struct config_item *item)
 {
 	struct vkms_configfs_encoder *encoder;
@@ -413,6 +465,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 		config_group_init_type_name(&encoder->group, name,
 					    &encoder_item_type);
+
+		config_group_init_type_name(&encoder->possible_crtcs_group,
+					    "possible_crtcs",
+					    &encoder_possible_crtcs_group_type);
+		configfs_add_default_group(&encoder->possible_crtcs_group,
+					   &encoder->group);
 	}
 
 	return &encoder->group;
-- 
2.49.0

