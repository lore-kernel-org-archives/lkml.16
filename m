Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E2D22A4F8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013687; cv=none; b=jJPuaBsFBB9UL2AJdGtXprWm2gI9Psht3ZKTqSDwMbA6A4BGtaCltn+kKvbB5Tc6PFrIfNYkmwLcDlH9ekqyhLjVYLtncIDMgxVDysH8WvSg5fwJqkyBouM58rs73NWHPBSYieYcOHvMrKKr4Hz23rgnig+8v1RaSmvQl+mCxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013687; c=relaxed/simple;
	bh=O0w8ZQss3MjaJTVH9OCQXnjasdNh6xzuj9r1mCBS+K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SljcIyJXV4m9CjuTvL7mb1I5cZd+zMY1xjlWdbtLgzMOYIF76zUAWhxtq4TRWCEFJImm0gMPqLtnU3l4wJgTYqooJWB14sqv3wsoeBwLACFSTXkIoTSo9yvNVtnBRxQ40QGLH8iXzD7vmlaOxxKibAYTlJt08asmq0Fp1W+/+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwQLejnp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwQLejnp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so23268485e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013684; x=1744618484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM/Fi/DDU9FwBSZywjo1FgF2AvwYFEClN7Cv+XzGCRQ=;
        b=iwQLejnp0YclbIw4p2Vqs+E/6OVV0+4mWWYe420OblC8Nc9j7kZPzzBxsTtghbxBVu
         f1A7ElBjzhvzzSB3aSBBd4ax8948S+gFDW6tKHUIB2WT+ktTjqwoNcbDdo1R2MEZr9Pj
         FqrFTEZjD+lrXrfSzKO9XD/wuQjyzLzNkmCZ0gCGIaY5Ax0+sy5LKoJ/UFj8lyypsi6a
         cOkpl11UjmAwaP1lIT6QrbydIdZeIBRaRR5Pxgf880q60QnKYoF11uzQF2kiicz83ZYf
         a2Ho10/5bgI+bfo7OcHL7Rf4Rh6pAsGsGZj95hYEompnADUUG5/dZXRaPQ80miXKl6aV
         R+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013684; x=1744618484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM/Fi/DDU9FwBSZywjo1FgF2AvwYFEClN7Cv+XzGCRQ=;
        b=D6yBrLidIxnyi+97J7Z1cCCkb27dKLa3Zh17rljSHuRIYKWIyueTct/w18J9ibkujR
         Ho8PfwuoW58ySSGsfeGEQjINqYmcjVDBG7FrQ1zqyfzHEeVZLNIiqPnV/Ae/qm2fcEd2
         NicPzK21Ms3nG4+6yn1GfmnynpETdEQOkdONRQYdTQen6Yn8vPcZW/uvY3oEuWNGUsCj
         +rkpCFxrkibL2qlKPSpeBaUP2d6h0I8JqIywHOWdaasQDFtoFj13b39Evbpw0F5z4sP8
         NaFKkSFXdI4ftlq5KY18fX8k2nlZg9fSoJwTH2Q/z+5qqESeeieLZ52R8ig9ENygMNy5
         Z3aw==
X-Forwarded-Encrypted: i=1; AJvYcCXLZv/2Ib57lPRxyFP0Y/X5UZQ/Af6GEs4GDX0uoX10IQxQcGirrlS28zlOAX689fFPADnDaw7SmqUhN6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj+HMzzhErIypYXx4+6F/aizweQ+O5ngilgj7VPZZHyZ4H3Nls
	A/jyKhaGlEZF5RZ8g5GsD4Nqbb/4z0JC/Kww/o02VaFwC5UyrAET
X-Gm-Gg: ASbGnctcns/mKFoVTbrodIaNZD++iUVP1C2pxeIVR4CIXNbTZW+n6qNSQcTL8BFbPwY
	mLFzvOEsHVF6kTRGM0OfsJB9bB73DOUnR+dm24MMcOuwIZXni7D+ixznI4LuL05uVFXod9t7jIp
	u2SNBweDTpIsHHGJXXrj2Vp25YHzrqFT+DAeaOO6RszJpw9zNXXUjUGQKN3i8oawcvCljwbzeEh
	8CLq9SWzREvk53F1/3AnQIwgwrbZnMz3+yhSX0b8J5u/FCA5STkyKOnADV5PQmGbE4F+FOc4ABj
	zsHl4vBSLCJmLZk7Dyw3cJvjkcakbKSONenWpQD2saxQ
X-Google-Smtp-Source: AGHT+IEqDaM4S78b8UTDQYDDTn9k2Pc7xmCPXPXr8Ca/VQfBfIMtDZuyf5gdnsmRTVyBe5Ehu1j0+A==
X-Received: by 2002:a05:600c:510d:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-43ee0789b05mr60393725e9.33.1744013683916;
        Mon, 07 Apr 2025 01:14:43 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:43 -0700 (PDT)
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
Subject: [PATCH v4 09/16] drm/vkms: Allow to attach encoders and CRTCs via configfs
Date: Mon,  7 Apr 2025 10:14:18 +0200
Message-ID: <20250407081425.6420-10-jose.exposito89@gmail.com>
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
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

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
2.48.1

