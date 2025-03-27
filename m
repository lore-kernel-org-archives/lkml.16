Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D12185BD
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087359; cv=none; b=nqffw+ixF5Tgi2hCUkXp9nQ5kgPQlZ/ruelfZWYTnhqOeftVP0PgCc7/hDs1wwyWgK/GpkpMmQay2Rpkb2PU0SYDepAIsFssIt/G36ev7TNYjfv4enld6sP0cGKrj1BoldGFaDcKUxvddDc+mwdbqQ6i9obksKGxgZz+XfOdy5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087359; c=relaxed/simple;
	bh=ds8p7Xpskcj6tbk4jXxNoyDLBihQCie6nP2hBUBR/dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntlXUsSErTR6AwsgGMbPKBiMNrGwUzP/MNfSKvyMhEXfIHvwkNXJDravmujBHFUTDTQ9CJpJygGshzm9hKHDl7HnJco7MgUaQwuYsZLIGhCNkNvX6d7Eg8k2FstaLm9UpOxPwpSEBqNJ769IMaOqX4yhDft1aw8b6Bl9EKlcG0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsviPNb0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsviPNb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743087355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TEV3a3D3OFIVrRK2gVh7n7z6vZBLhXgRE6LO66dEdwY=;
	b=bsviPNb0s3a12j75LOBIqh1/H9JRcLTXrkVW+cFLBZQRaMo7DtGH7QD4tD82r4Nlhnnfk5
	ogcdiU3gjb96IfuIILha/YWD2Z+nCMAPPn+1mgfQqhCKCk6FkfOvCOCGgccAVZjiJ0O6PH
	QBD/OSOIVz9TrI7x/QdapPGFO26ZCQc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-4LC7MFbePdC5t7J5Hjm3pg-1; Thu,
 27 Mar 2025 10:55:51 -0400
X-MC-Unique: 4LC7MFbePdC5t7J5Hjm3pg-1
X-Mimecast-MFC-AGG-ID: 4LC7MFbePdC5t7J5Hjm3pg_1743087349
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7058D1809CA5;
	Thu, 27 Mar 2025 14:55:49 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 627B41828A83;
	Thu, 27 Mar 2025 14:55:47 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 27 Mar 2025 10:55:39 -0400
Subject: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
In-Reply-To: <20250327-b4-panel-refcounting-v2-0-b5f5ca551f95@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743087343; l=3397;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ds8p7Xpskcj6tbk4jXxNoyDLBihQCie6nP2hBUBR/dQ=;
 b=R1LWlTg5VxVrFIAIK26mB6UBEytNoEuuK7dftCfmy1JB/5WGR4uDOL0asII2B+TTNC/iw6WJ1
 vrGhxni5j9WAEBOdcU8HNiw+Tsj//TwzX8KbZHGia6eQCHUBggL3lZc
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Introduce reference counted allocations for panels to avoid
use-after-free. The patch adds the macro devm_drm_bridge_alloc()
to allocate a new refcounted panel. Followed the documentation for
drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
implementations for this purpose.

v2: Better documentation for connector_type field - follow drm_panel_init
documentation. (Luca)
- Clarify the refcount initialisation in comments.(Maxime)
- Correct the documentation of the return type (Maxime)

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
 include/drm/drm_panel.h     | 23 +++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c627e42a7ce70459f50eb5095fffc806ca45dabf..bdeab5710ee324dc1742fbc77582250960556308 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -355,6 +355,31 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_find_panel);
 
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs,
+			     int connector_type)
+{
+	void *container;
+	struct drm_panel *panel;
+
+	if (!funcs) {
+		dev_warn(dev, "Missing funcs pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!container)
+		return ERR_PTR(-ENOMEM);
+
+	panel = container + offset;
+	panel->funcs = funcs;
+
+	drm_panel_init(panel, dev, funcs, connector_type);
+
+	return container;
+}
+EXPORT_SYMBOL(__devm_drm_panel_alloc);
+
 /**
  * of_drm_get_panel_orientation - look up the orientation of the panel through
  * the "rotation" binding from a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index a9c042c8dea1a82ef979c7a68204e0b55483fc28..53251c6b11d78149ede3dad41ffa6a88f3c3c58b 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/kref.h>
 
 struct backlight_device;
 struct dentry;
@@ -268,6 +269,28 @@ struct drm_panel {
 	bool enabled;
 };
 
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs,
+			     int connector_type);
+
+/**
+ * devm_drm_panel_alloc - Allocate and initialize an refcounted panel
+ * @dev: struct device of the panel device
+ * @type: the type of the struct which contains struct &drm_panel
+ * @member: the name of the &drm_panel within @type
+ * @funcs: callbacks for this panel
+ * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
+ * the panel interface
+ * Returns:
+ * Pointer to container structure embedding the panel, ERR_PTR on failure.
+ * The reference count is initialised to 1 and is automatically  given back
+ * by devm action.
+ */
+#define devm_drm_panel_alloc(dev, type, member, funcs, connector_type) \
+	((type *)__devm_drm_panel_alloc(dev, sizeof(type), \
+					offsetof(type, member), funcs, \
+					connector_type))
+
 void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);

-- 
2.48.1

