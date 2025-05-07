Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DC290DA7
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626085; cv=none; b=mmMGmj3PWqHe9Tpr95XdM/TPj4ZRSCPErURvGZtuG55RDVzcyBjrKyCrYphvuxar2zsdvJBVq0qcZKUIR8/3nc6VKf1MsnZo/QSEqcHopLRHLumHzfC2NHCIvUuzOzd6GGpV6Fp9zXB2+elmSUUmd5QLJDjX8eWu4IAjltQBfvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626085; c=relaxed/simple;
	bh=J2bONp6XxRVDkBM39GFGPezE6fwTOnMDHx5wVcfalGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exXSWfVHnBWYstxoaRY3w8HIMIJSjiKD17N1FirLKm1rt89La4ZRgHhdX2YaTeiAi/vlweWGMrleqVONqyGARDc3XKkromS3ygg7wVx1kq0A9Dqg2/v4+EIPJQcRQagNQy0Ow9WHd9yRTOSUiN2wcLJgvFKHj4EvjeHwMzdYRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DR//+psw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DR//+psw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so7693605e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626082; x=1747230882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZVbUU6uiGO6s2LXLXBEvhGBzCUPUBEIPxhrrxcfbfE=;
        b=DR//+pswk6rugjwPxlTTIZgBKYqoLzHbfH9QHYxjbMs5wWNQZHnMTWIDTkB0P/a2Wa
         51hF4wU+zQSADKoFlfzyLTVmEa99WOTbyU84fpnpdKqYl5taN2KDxlhN9PxdCPolh6fA
         RwC08V0wYHQuDamCUITOJtj+/1OSTWpVqu/fZBLUXxw4RRltfaLmv9aretVMxWO8NFO5
         kv/uQIzSuvSjoSCycClkZOtKZh4eNYvNQpFqTD+FK4sc760bSc+SL66+fRLXb6R2FiTj
         QnfcI/9qxv3ZUsj75oLbKI2naynUsOTxsDp/Wrq/qm7tV4jk1TMK+zXuE9JdSTdUDxFn
         p8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626082; x=1747230882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZVbUU6uiGO6s2LXLXBEvhGBzCUPUBEIPxhrrxcfbfE=;
        b=azAjlIUPrG+J960GYPixoPh7GWpZw3gkxEkEmWsjlTGeyIWG/S0/QD5xuJ7Cljn0h8
         ESYK5BZxwXqGXVQIbEAn4a1wds8avSjj9nX6gCOJQjw4SNG3+dJCJJEBzlETB/7Xl2kb
         ObfanbYocajcgYdTCoeebpxSLZVgVyi3gSZPfkVzBnPZ1Q4+Vg4JXw/7ns7mgqFva5WA
         UUvcVY/86plzhiPgAcJIxMtCEWRzhrAwscQwSHrQ/amF3+o1/kJuB69eJe6M0vyhsVOz
         eddfZ2uy+WMQHXjjVg53u/py1C4WCh3bJzm/hYa2K5ljCx7TgM4XhLBXNF/TQw7fxO+q
         kkHA==
X-Forwarded-Encrypted: i=1; AJvYcCWrSt34vDeRGrZxNyaSJP7IPk4ACE6Kf0+diTL6ZioW/Enr3Dj7OQEQymXjtO/Hx+jap5GHKSuw3jVx1ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sDPN70BKo9QgTsUBlSw1er0cfUDJVeMWLb2vAYid63HsPt0f
	yWtYBQhtuRp27t1CxdCGyEmnvftyDrIAyq/H2oO654uZXL2DkD+5
X-Gm-Gg: ASbGncs3GGOQLnFoAVWiI6YwdLjHj0LN5wX7Fiidae7bTU/dOT1zMU6zr1N6iobzTDB
	dHb9cDMkYvxTDFPBVPHHU0R/sM2ZQQ4XFm2bbV3NMDUtWZBJZ0K0zUjsP3kB2go6eP0NrT9Eory
	EitRi9VLp27loPMdutaCXOWMC0f7vtrYBtE3rQ1iChGQ3iUcEld3XSVU3Ms6Y0n60PIOZdJPa3+
	mY3eoggFwR1IIojXi5R8gzpQkTWgUUUelcI/vh5pUtczBof7N3WWqof9zDO9x1WPuJ1suOwCeJs
	YjU9LUQkxR85PQ2YN5BP8P38y4aKn8sjdJF53fpsUbsK08DnqWPu
X-Google-Smtp-Source: AGHT+IE/HFFpPTOpfEpzIl30PLpsQqyo0q3tUVthULF3nTYwPJolDFr0WO8qqWwNpwyOwDFQWo0bJQ==
X-Received: by 2002:a05:600c:3f0b:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-441d446ea6amr36686905e9.3.1746626081537;
        Wed, 07 May 2025 06:54:41 -0700 (PDT)
Received: from fedora.. ([94.73.35.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:41 -0700 (PDT)
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
Subject: [PATCH v5 06/16] drm/vkms: Allow to configure CRTC writeback support via configfs
Date: Wed,  7 May 2025 15:54:21 +0200
Message-ID: <20250507135431.53907-7-jose.exposito89@gmail.com>
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

When a CRTC is created, add a `writeback` file to allow to enable or
disable writeback connector support

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  4 +++
 drivers/gpu/drm/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index e0699603ef53..abe7a0f5a4ab 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -94,6 +94,10 @@ Continue by creating one or more CRTCs::
 
   sudo mkdir /config/vkms/my-vkms/crtcs/crtc0
 
+CRTCs have 1 configurable attribute:
+
+- writeback: Enable or disable writeback connector support by writing 1 or 0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 62a82366791d..e9f445043268 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -74,6 +74,47 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+static ssize_t crtc_writeback_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	scoped_guard(mutex, &crtc->dev->lock)
+		writeback = vkms_config_crtc_get_writeback(crtc->config);
+
+	return sprintf(page, "%d\n", writeback);
+}
+
+static ssize_t crtc_writeback_store(struct config_item *item, const char *page,
+				    size_t count)
+{
+	struct vkms_configfs_crtc *crtc;
+	bool writeback;
+
+	crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	if (kstrtobool(page, &writeback))
+		return -EINVAL;
+
+	scoped_guard(mutex, &crtc->dev->lock) {
+		if (crtc->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_crtc_set_writeback(crtc->config, writeback);
+	}
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(crtc_, writeback);
+
+static struct configfs_attribute *crtc_item_attrs[] = {
+	&crtc_attr_writeback,
+	NULL,
+};
+
 static void crtc_release(struct config_item *item)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -93,6 +134,7 @@ static struct configfs_item_operations crtc_item_operations = {
 };
 
 static const struct config_item_type crtc_item_type = {
+	.ct_attrs	= crtc_item_attrs,
 	.ct_item_ops	= &crtc_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
-- 
2.49.0

