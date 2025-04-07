Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51485227E9E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013682; cv=none; b=FyskZ95lmar4Y28Qo7V9jB+zChyDpj9r+qdtkejQ4g3VesKMg5iNDDk1o7TeBUJ0OYruWRDU1LZ7bitF5J63bZ70piPMy9bxy7YO7guFixePB9WRDgGQVlvnCuvYXVIW/Hr86lZasKKjJF4v5Inf4Wz9eeTaCqjQtxeHRk8pVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013682; c=relaxed/simple;
	bh=kQj22Xp+Ha6gqWOMW/U6z++HMc+8PJcEGJdOBpR3odI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jxtSE9n8K3oOnA1IZPYLtDC8yfj/qnycyJ+pWBmw6jw3nMSsmLMpd0dzk8XOyP7HHXJ17Iv6u8HmSAV3LpUYmfDsIj3JdaAE18koe24+K0LKS3Qoji3RDpQyAyOY3Q8smyp79i9VNJ9F1GF2NZjjDEIE+pCOPj9han5TSSK5LzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhkCZLwf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhkCZLwf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so23268175e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744013678; x=1744618478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YVCYzfxx8qviL1pZU6Jrz6KDb/rO6bc8XZpUckpDZE=;
        b=AhkCZLwfWzWzFkizO4cwqLR6GtveDCuvX0AXi7ZZ3N4u8A5lRE7M74Xpkw8hp3Px0a
         4hi+stXc237zdboCGq2tpxmqUrkjyUFeoY/EArx2E3Cs4iqU07HuCnMWhusK0/G0lqvZ
         Gds5LaXNRG9R7htQ3zPwz0vlsubNM8CcLeMRas974SpH5fYyShB0x7L8+6YHm+yTftoB
         aF5l1DoTru+L+Ia3yfWiRj/1VVj7B7kuO6RlLjugMZg3fjX3T2NNd06lfwJnr8IOHURu
         pqnXGLNsOTE6kVzDgmaZYY2BpVmb+VZhIMBTcWN2ynkAH1k41/Bc1IadFlQR5ZDjR4x6
         9hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013678; x=1744618478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3YVCYzfxx8qviL1pZU6Jrz6KDb/rO6bc8XZpUckpDZE=;
        b=CYQzgTqowjMVABdGOlA8n8TEffZFIjwQCTyea7klXAhqPMeuUKV1ig4Gthi8n12Fhq
         Je48FDiyDxssYhC/eDkZ39yPyU4qrmM/aNv9i1LB6Su+h24gGyfwQVFuOoRaytoeqBvO
         aC/67h1431GvJH5OB/HOAfs3lH0LS0STCCB+eZjgbsgWpyqMZLaU3SdXaRqiRnX1vR2J
         jw2+4Y00aXBRBMr1B2sB/RCb1NPDQ9RmOcgl4SIjAkmi7f0AEHUglm/A23GOB7XJZ8yu
         fws7ktjt7PimIsiuvHhYFneJBTikbDGy5GfWZ2hT0/ogdBQisEE00974yjjvEMGZa1gN
         K1cg==
X-Forwarded-Encrypted: i=1; AJvYcCV7as7YjYxpxRZYCpE4tzJykZ9ze40KmcG83kgucgXR2GQVBWm9w8UbLV+KoCcMKshLGv1NgDkPgAenmbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvHUlOtRhic2R//Rh1rEq+5W8p8KyClTFfI/A0QTAaOLYh9Dv
	uGsj4znrYInpttnaWHUt/us0wTuiAdwsEpZEYuEdseHcx+iKE8jq
X-Gm-Gg: ASbGncv/xffla6ln/B15x0BSttcie2agm8csZvXmMQmKiIcjEPaLr8ND+yZUL4hpXnl
	jUOFbLILXqg9GMMav/lAY/mjbCtMyDblz0ReB4tyF2pnfFxUD47IxnBN7pC0H3RZudDUcOpLToy
	ThpxZjSf0aZR333BLS6r2VUYABAol+TD16SX72u4N1KPgFM4b9uBqt6x94e6E3kJUe/zrlKlWO7
	bhUmB5mftxH4MY2T5qmDku0MZ+2iNVEsvUsw0CtwSbQ9OZkxKizfkLhWxOYBLfRm9stdFMztwY1
	es2DLRJ3oNMli3GFmY0axTmnz82U2mFeNcKVzYSzXTYf
X-Google-Smtp-Source: AGHT+IElBQGStyE2bMCP5d5QJjkdipCeXPcuZYwURkEiVB3dfTK496XhZrH7wiMK1+7MUwB5IZBupQ==
X-Received: by 2002:a05:600c:5785:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43ee0783d96mr69770095e9.30.1744013678526;
        Mon, 07 Apr 2025 01:14:38 -0700 (PDT)
Received: from fedora.. ([94.73.34.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:14:38 -0700 (PDT)
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
Subject: [PATCH v4 04/16] drm/vkms: Allow to configure the plane type via configfs
Date: Mon,  7 Apr 2025 10:14:13 +0200
Message-ID: <20250407081425.6420-5-jose.exposito89@gmail.com>
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

When a plane is created, add a `type` file to allow to set the type:

 - 0 overlay
 - 1 primary
 - 2 cursor

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
2.48.1

