Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6F14A60F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391555; cv=none; b=eoOHDsWNrccRk1PSs5pgGQ3a1upvwe5FAF91gEmw0srh0NxlQBXKuZ79gpjWMlK2iSCssK5PxdYHxpRsucgJD9xc7jFxOCfbd/FE60cZ65AAwyAoz8QTqy7FdhD/4x48GZ+lJAnFamqgFVX2SfE0PqP0FD+XyN1BjUtrFUfsgrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391555; c=relaxed/simple;
	bh=ztdkY1ss/9PtHD6IzZCu1QbinWII/RS9hI8sz/8L6pM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVDoW0Vn9rCoK61U5leXPtPJyEpfwOIdXxFJnc7GiUURIBt+tj106vYDwPVRAYBiVaW3N3GRZGqXybI1ilbdkET/yyhT5njMp7YpK5yGl1z9lCCORxmtr0mVFRGZEGyYYxuaSJS/pI0Qq8RGgDwQ03L+ETyf7FRo6n+jLIT6eTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TBN0G/2M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TBN0G/2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743391552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o27B54Im+dw43JYOHAsgw1pUKwXO0ARViylQUoAlBYg=;
	b=TBN0G/2MiYhLGEX2L/eLO5uTMUF4kWPS4axrZOF2+rHMC/fk08U3mFharRSSH0OMLQFfNq
	GfNcar6BMMEGA8q3uiNHpk4L+E5twu1zpFMtT0rntkPI8sHCykq89d8HUiSIDtOO3Pd3I/
	BiUu+8LODHkqPfWdyo0nGwiQaKvLSK8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-149-3-We4BRZPDSn-IlR196uGA-1; Sun,
 30 Mar 2025 23:25:45 -0400
X-MC-Unique: 3-We4BRZPDSn-IlR196uGA-1
X-Mimecast-MFC-AGG-ID: 3-We4BRZPDSn-IlR196uGA_1743391544
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E945B18007E1;
	Mon, 31 Mar 2025 03:25:43 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9E33C180176A;
	Mon, 31 Mar 2025 03:25:41 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Sun, 30 Mar 2025 22:24:12 -0400
Subject: [PATCH v3 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-b4-panel-refcounting-v3-1-0e0d4e4641eb@redhat.com>
References: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
In-Reply-To: <20250330-b4-panel-refcounting-v3-0-0e0d4e4641eb@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743387855; l=3433;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ztdkY1ss/9PtHD6IzZCu1QbinWII/RS9hI8sz/8L6pM=;
 b=quVFYg6YD9mAWAODi7cFoEzm6BSHnkWFrpAr1TFJNsQ6UXVuc/HoRxm9uAGvP+ObO6fyeIghc
 NsIl8tCm7pNCykbm4QhpGx+6Tb81XXnXHljABpVwZwp+XbZOazI0wzS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Introduce reference counted allocations for panels to avoid
use-after-free. The patch adds the macro devm_drm_bridge_alloc()
to allocate a new refcounted panel. Followed the documentation for
drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
implementations for this purpose.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
v3: Remove include. Fix typos. Code style corrections (Luca)
- Move the documentation to the main helper instead of in returns
  (Maxime)

v2: Better documentation for connector_type field - follow drm_panel_init
documentation. (Luca)
- Clarify the refcount initialisation in comments.(Maxime)
- Correct the documentation of the return type (Maxime)
---
 drivers/gpu/drm/drm_panel.c | 25 +++++++++++++++++++++++++
 include/drm/drm_panel.h     | 24 ++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

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
index a9c042c8dea1a82ef979c7a68204e0b55483fc28..97a5457b64fbbe9c91c6a4f41b8e1fbfe4fa604e 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -268,6 +268,30 @@ struct drm_panel {
 	bool enabled;
 };
 
+void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
+			     const struct drm_panel_funcs *funcs,
+			     int connector_type);
+
+/**
+ * devm_drm_panel_alloc - Allocate and initialize a refcounted panel.
+ * The reference count is initialised to 1 and is automatically  given back
+ * by devm action.
+ *
+ * @dev: struct device of the panel device
+ * @type: the type of the struct which contains struct &drm_panel
+ * @member: the name of the &drm_panel within @type
+ * @funcs: callbacks for this panel
+ * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
+ * the panel interface
+ *
+ * Returns:
+ * Pointer to container structure embedding the panel, ERR_PTR on failure.
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

