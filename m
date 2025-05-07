Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE83290D80
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626083; cv=none; b=Axst6CRJPjY2bXbGAYtyonLmiylVUkVlVJ9FjxJNU18YPdPjKpYp/xpfk4wjxLPPYLOYvVqMPFSLRScXKlgeXyOD12fcX+pyZxbGoYGXO37jCDnko54OjkPVK48nu+VHxO4ZJ12lbVyme8aLRsrWD49FpCoiMiMkPT3J7E/uhEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626083; c=relaxed/simple;
	bh=dqfyGBkgVcKt2KJMbjQNkQOr+DyqZSfUQL2BBua9awA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCgeGrb28Hr3les2Jja8cUtvGxnpZhNXcgzNITnoxJzGDibAmY/hvWwhuzp1EMvvheHfFqNwAac/JMQU/eB4rJ39H15fTN5oiFUeQH/NFXHLZY2nK1iQBtYmjiZCpipMgZqWrBHM1lTonEeComXvZxZrbKpvZ4lOFc5nLxO3fS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j16QeABr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j16QeABr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed827cso12690885e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626080; x=1747230880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=revvLaJxQIsk5Gmv9SK/V5e8fpLQQcfcA31+6NgbB0U=;
        b=j16QeABrPUxRB8qxXd8sk+BBl9TLlJxVMTb82lVDWPeBmwTUkq2IxbrKo4uzpM5VSt
         QZD6KqjpHgHKsnuic+OisxgSgSt0nPgGrKJfMp9I84bLkjc2seii7+kkKKADjKYgB1aJ
         jm07iHR9CjAnCHGztDsq++h5Y3SpENTJuZsZTYRuZ6rk7UQ/KgNGVZXLYIkqSm4h/6UA
         LKkTiyVyQfYNqhzkIP0S5+gu16p5TAbkP4Xb1skaNv6ED/T8+zfBM6BM7PZoSEhEtIVd
         EY+OpytxjbJlqFU4lipepVfI21S/V7ki8IpY4mduijblYDlJyJKvE4GD69BVZZxD3QvJ
         UEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626080; x=1747230880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=revvLaJxQIsk5Gmv9SK/V5e8fpLQQcfcA31+6NgbB0U=;
        b=JPUONfEB3gSIc/me6CXXfp7X+yMhXj2JEsd65IZ8o6FcAV5ZyAzS4wkMGoW1JMHzVn
         e7PXI+5MMTbBFflLv2PvaYZbV2x06D2CLtvUID5C12wonEPNE7ba7mjpUVtMaSy8/aag
         L7uWMalI2T8Yrh3EJTSV487tih+/Mu4p23v0qbMGfY/CQYt4cIjzfp09uKZrQU4YnUri
         OvKO2ixmycVzmi7LIJMKN4ksDPkGER8z1HI80v5kV0mJpcJKgRw2HEApuzbETWyOu3Sr
         LhPu08MvxGqIcx1TcKCH0D7R/kFYfT23WfObuvOmNArB9PERH71xP5L8HP4kldOTaR8s
         uqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUq1gAohqu4o7tDJ+mee5NaG+jbHieXOYNfsN5okvWglfqV3YMWCChVRg6MPBo6nXLc8tmqueojUgH28=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ+i9WfaeaLRRbhTXGUOKN7YuGcWgG0o8eZi1InHv5yWULZzvW
	K9r63lEYCs1sXCrZrQMNSQb2BtWqHBK0/EJO+yA4zHs/RX/jIu4M
X-Gm-Gg: ASbGncsOHiziU9mrLSsYrUhcYOBkQDKJlioQRG0uTi9rrnsQSOkUSVgJfTJOcwk5v4K
	OcaI10F7ZKA2zDauDYyS0N5wDO7eYxalwfC7OsPpCaGEjLoV1ko17B6+7VziJhUvN20VmJIu3Or
	0N395KDz0XIDkhi5TKoSnR0kA/+KBFCG7pIrNbPSbtroydXtPdnWQ+HiGJ0wHv4ALrFke/+H1Ua
	N/oltCC9nWfnpj1KBw7p/bu4tWCxtsPNnZtJYgcjxsTIYiQsXI54t2JIg99ba7Yq7QT7ym+zutx
	ac8tZdnKHd217TQI5lD7jgEtKEqaPHinGpcD1XgVZ2fQjJ70688f
X-Google-Smtp-Source: AGHT+IFM2cUAeZfIFBOSxl3VH6utrOqI2LAEVzXdvefWHLgUAnUSzvYO0BzOjfZP721jAF09vl6/OQ==
X-Received: by 2002:a05:600c:3845:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-441d44ddba7mr29173265e9.20.1746626079620;
        Wed, 07 May 2025 06:54:39 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:38 -0700 (PDT)
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
Subject: [PATCH v5 04/16] drm/vkms: Allow to configure the plane type via configfs
Date: Wed,  7 May 2025 15:54:19 +0200
Message-ID: <20250507135431.53907-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 46 ++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index bf23d0da33fe..a87e0925bebb 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -84,6 +84,11 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
+Planes have 1 configurable attribute:
+
+- type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
+  exposed by the "type" property of a plane)
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a7c705e00e4c..398755127759 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -55,6 +55,51 @@ struct vkms_configfs_plane {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+static ssize_t plane_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		type = vkms_config_plane_get_type(plane->config);
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t plane_type_store(struct config_item *item, const char *page,
+				size_t count)
+{
+	struct vkms_configfs_plane *plane;
+	enum drm_plane_type type;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	if (kstrtouint(page, 10, &type))
+		return -EINVAL;
+
+	if (type != DRM_PLANE_TYPE_OVERLAY && type != DRM_PLANE_TYPE_PRIMARY &&
+	    type != DRM_PLANE_TYPE_CURSOR)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_type(plane->config, type);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(plane_, type);
+
+static struct configfs_attribute *plane_item_attrs[] = {
+	&plane_attr_type,
+	NULL,
+};
+
 static void plane_release(struct config_item *item)
 {
 	struct vkms_configfs_plane *plane;
@@ -74,6 +119,7 @@ static struct configfs_item_operations plane_item_operations = {
 };
 
 static const struct config_item_type plane_item_type = {
+	.ct_attrs	= plane_item_attrs,
 	.ct_item_ops	= &plane_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.49.0

