Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5ED22A1E6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013685; cv=none; b=M41cp/xtBRueFOIdpYcZ8khlC65pTHlPfFFqwJjduKOYWQKDJ3iZ00scMGUj7Z045E6oZrVoGKgVMvwDGBcvj5CnNaoLYYKPWatyfcda62SnImdEEhpD39bxPFH7bm2VqUXewMEMG2O4H0mqfmyP+w86G5cczXTW1ycdnTNl3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013685; c=relaxed/simple;
	bh=0L5O2xKCq57wM0jy0jSFudtqYmZe43mQO098xDB4ng0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+RZjy3iSgKkpQcWMkGEjLZ404J9OT6VOXIqKQvFnl/8EHKQoZ8uctc090Tm1vJZkgMvxSyfhR5Z6an3Ymz3lE+MH5sr+YQ/e1eZxld213n7dH73jx93tVqMtM2Fa5pbrvH4xu37Io4HjXFG9ZuHkbjUaEggXipHfVW5zhkjnHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrSlwKFY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrSlwKFY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso27278045e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013682; x=1744618482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDtCC6WPPqEmxKPhos4FDITpDjg13+QxXsw1Dug2hLM=;
        b=KrSlwKFYticCequfEhsek63AuYTaaMy8UP9Mx6fFVVTFcn+fP8Doz0xGoP/0IFJBQw
         NB4W4Ojz+tTFqpd44x3TC5+yzK1iD2PULoYSLFu70MwBU0mA5UHkATkJ1OC7hRMPNany
         RkJNoYdhXPxjNFn8wcdbmCR9LNxbxygUnk+Eva+XbxFPNIXTArTsEbvbSzgVSYi7IxGR
         PfEqvfJWJxlPQllJJK50Em5uu/t9hsTFk5AbDPetwZCHE0OP0h1UQ4/U4QGIXnybzjph
         7cijqvhzhGCXcrZbWM3fVdTly+qyHpAyJ7/+RHfA6KwxECmNNAxtuhs6mSHcdo8xz0+7
         ED+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013682; x=1744618482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDtCC6WPPqEmxKPhos4FDITpDjg13+QxXsw1Dug2hLM=;
        b=WT+DdyzEFnIAY31w6IsmmqYBGUdXe+8/NABedw1c/G8jozuxPmIuhoyZ4jUm9pAQU8
         pu05skacANZ7fpOcXEiQ6IvjemG37uJR52xD4YQwGNIzXoLqGIrcBBXqfHTjFRaCqte4
         4kcTe6ckhrVwGE6dwTsB022vANi+9ErAwuruGJNcd/n0F2IPypI+n0vXgYjNq0+xkr7Z
         SOshPAojDHcuXDFYDE4HLfxCSBh8OH0H+W+6XgwUj4LWtUoa9YTROVlIzFllnQtbLymx
         SrW8JAPq0Pmlw2pFwfKyaAk8gqskV1QVFqb55PcSsUGelqWyxsYmvkv/hWKqK3XLy61v
         DlKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAVFT7bjoK6hsWlzgUVBWfSnHaQq/yFDBqb5fgTYKksI9EnB8BeiT2tjXpxkDBF3sgWZP4prt7SxQyGWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8n025156EVf9RxQGTQuWwlF/iUmZVTPp5aRJcf6i0mif73/ek
	Tw9iS2rCai56Eb82zRTAv6N4q2kbViBQVuNln2OaVumtWrLNk7qw
X-Gm-Gg: ASbGncvtSPTWeNZTR2dOgsJsoh8qRQfCmAJx2Rde7GCyynU8tIZUq8RPk4Nf1DTW1oH
	NYlnINZsgEmOkGrhATiF4IerTni0aS55Ro5h+YEd7IlY5DVZSaCSptbiRpvBghQrEdr+uYPnwDE
	N7OrX4R98wrSaLQdcRv0RobKpTdsZVTpRX/DhDaKsTGMEwsDMSHWAajqCXUkYiwQoKXxVaqogdg
	bR+nCDOR/CRuCpXz0JJ7xVGmBmZZ7NW24BNk+YfpKNtWaD37FYJFufXXGcYX4aoWFlFhGMkQo/8
	OMIyMP//QH4UD6YxkDZtFnPHBPd7++WIaFPQxjd3zeGe
X-Google-Smtp-Source: AGHT+IFv3N5CjA50DYh7NKzdUNFZe5+gAyJ96Kzu1deHkeTcpi2IBmRpXiK4xLtLmHZsZonXiPdJfg==
X-Received: by 2002:a05:600c:4713:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-43ecfa35e5dmr81341465e9.28.1744013681951;
        Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
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
Subject: [PATCH v4 07/16] drm/vkms: Allow to attach planes and CRTCs via configfs
Date: Mon,  7 Apr 2025 10:14:16 +0200
Message-ID: <20250407081425.6420-8-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  9 +++++
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index abe7a0f5a4ab..13b96837a266 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -98,6 +98,14 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support by writing 1 or 0
 
+To finish the configuration, link the different pipeline items::
+
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+
+Since at least one primary plane is required, make sure to set the right type::
+
+  echo "1" | sudo tee /config/vkms/my-vkms/planes/plane0/type
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -108,6 +116,7 @@ Finally, you can remove the VKMS instance disabling it::
 
 And removing the top level directory and its subdirectories::
 
+  sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index e9f445043268..2cf97c2b6203 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -38,11 +38,13 @@ struct vkms_configfs_device {
  *
  * @group: Top level configuration group that represents a plane.
  * Initialized when a new directory is created under "/config/vkms/planes"
+ * @possible_crtcs_group: Default subgroup of @group at "plane/possible_crtcs"
  * @dev: The vkms_configfs_device this plane belongs to
  * @config: Configuration of the VKMS plane
  */
 struct vkms_configfs_plane {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_plane *config;
 };
@@ -71,6 +73,10 @@ struct vkms_configfs_crtc {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define plane_possible_crtcs_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, \
+		     possible_crtcs_group)
+
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
@@ -178,6 +184,52 @@ static const struct config_item_type crtc_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int plane_possible_crtcs_allow_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_plane_attach_crtc(plane->config, crtc->config);
+	}
+
+	return ret;
+}
+
+static void plane_possible_crtcs_drop_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		vkms_config_plane_detach_crtc(plane->config, crtc->config);
+}
+
+static struct configfs_item_operations plane_possible_crtcs_item_operations = {
+	.allow_link	= plane_possible_crtcs_allow_link,
+	.drop_link	= plane_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type plane_possible_crtcs_group_type = {
+	.ct_item_ops	= &plane_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t plane_type_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -272,6 +324,12 @@ static struct config_group *make_plane_group(struct config_group *group,
 		}
 
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
+
+		config_group_init_type_name(&plane->possible_crtcs_group,
+					    "possible_crtcs",
+					    &plane_possible_crtcs_group_type);
+		configfs_add_default_group(&plane->possible_crtcs_group,
+					   &plane->group);
 	}
 
 	return &plane->group;
-- 
2.48.1

