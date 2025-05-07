Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E25B2918F1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626093; cv=none; b=UJRfKcgK74DSRqU9YAQziN0KDWDqLBxh4R1ta6WtnaRwV9oX4cJjxx1wfjCFdaU0BmipzMxXccjgzuFRzz31dZHzcIJq0LLRN59jdoNQ3vvhuO63cGhun0AhWUgYbNY+6TbkaX7X7lVpd/iEVIkgKNhJrn2/jPMW/H35ijsDWfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626093; c=relaxed/simple;
	bh=C85asPB7AVLKECfLgA35sIT/buGH4OxmZkGQVpwtlq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnED4RexBksDU1ABt5qTsoVMnj9fy34ZMx2nlJw3Q6R1D/3fPT3Zqrfaf64wsqblYcvwwopOrL2u8ZtzC4DUBESTzJaCrBducZlfoHqGCv9oREN+kSi70GuhOoswm4z0kMMgRFXzxjTgxQMed7pA98ExhzS1NIsbX60PFsN4Q+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzrkouD2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzrkouD2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso67141345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626089; x=1747230889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3uzv8jS+uSjYAUFvNNOH03DRX+MgvgGsMjkekl49eM=;
        b=UzrkouD2KRO2I07FiMJEwThz3EMSnQqYWhuMg/TilahUxOzNciimCvQWw26CKxnB9v
         T7NnRBiqSU0hUjYLniL4jOBO7uzcXuZZ9OgOwmrggUrGWepBB69fSgdXRSwQwQ2yB1+8
         JGF2XfmB609e1ByKRDgdKZ69UGkxNOe5v3spGaft3ytn9eQj2ISd8xI2DwpEL6ieFfm4
         7D11T0oC1ml6/1ffeBV5FOP5sdlRyiGVZoc2zghyrfmlnWMxPpvXDGWPkGWOiDAHYxM4
         dJvMPZCDvE/HS8u2/FE9Mvce++4SfZ+iKYg4xqRKb1OKQaoHCbx/kQfPu5vF0bIw48Hl
         l0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626089; x=1747230889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3uzv8jS+uSjYAUFvNNOH03DRX+MgvgGsMjkekl49eM=;
        b=krBTx25arRPKG5dnJ/LBAPHH+7gDz7jvhP3sWQy7HJmEToc/hgEnINs4q8JZRMQaYn
         0gEsBlLET8Dw0HG0oRiSUVj13bsQGCeSxqTWLOo/Sc+yLNi5ugJJn51RK/jPxsirmXPQ
         tbhAJeXBuMs6koxjWsK6tt+8w6Nk0gLXnJo3TWEAGD6ru/4DUqpP09nTRzTuAtULN472
         wuq6HLpPNRUK003bRZcswC3N3QeZC1SkuSGIcW4bPHFtFlk5CvIW0dplYCFl2Uf8nfMl
         cxcHrYtCRbgl8WNlMb7F4tXkSDqUwFoSucuClfbROqUlunu6Sib4dZAfCUoK+9QtLE5y
         Irqg==
X-Forwarded-Encrypted: i=1; AJvYcCWLJY0Vgb63Uw1cCK1DfgTOaMIqMhr60ADTyCY/ubJbcou0VIbdv30XNk5VkVBjOzuxoobWiq6SZuWtJ/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzTGhZDv09BR56C4Z3kV057vknl6lyQWhPsZvzPH1vf29w3xjn
	QNCtBBTdytZe8EJgY5k3Z5xVl8Bq0XBZb0+hOdOyb0Nklq84+zRR
X-Gm-Gg: ASbGncsvIPjqJrp7HL6+BkPoly0ewOnem6aXuaZ9r5HqB3sOiiUXElEv2cC4d69gqNn
	YkzCe0oOBt6WGqEanJHzJV2ikq8XKB6sgy0aYD0YVxnHfyohDsy2JpKUOcebVuPqMn4h/KpLNDV
	uPSw6n6bSpy3dGKhTypUPc1zPfas1w9QkDXH01TrWhl9DQJXWsisZXsmCZ189+3dIr7O6eU6tis
	Z6lXafK5yZ+PqCRgtv1i2T1LtDF1p+5tzeKAQIAvNlYSGE5aMo6ChLo87qiN1ERQoxSkWOuC0iL
	0kLEIs6SHLlL/Wi3oOFdWm1nfl7ncq8xL9u7zUbzVQ==
X-Google-Smtp-Source: AGHT+IFhyGvbpgkCU5AP3HdDVlcdPRh5RZxhB17iCeWUo+nHhayzPhUu6soRosDlT9+Jqt85AM07wg==
X-Received: by 2002:a05:600c:1e1d:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-441d44c2821mr28333185e9.8.1746626089109;
        Wed, 07 May 2025 06:54:49 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:48 -0700 (PDT)
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
Subject: [PATCH v5 11/16] drm/vkms: Allow to attach connectors and encoders via configfs
Date: Wed,  7 May 2025 15:54:26 +0200
Message-ID: <20250507135431.53907-12-jose.exposito89@gmail.com>
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
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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
2.49.0

