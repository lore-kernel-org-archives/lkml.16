Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16676213236
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437828; cv=none; b=kRgLrZ5gv6+WhGjKJ9lLoXdunwhQSD3I8HMYBCNaIQNKJnZpfKEXuiL3USus4AGsqNxHcD0NLqjuui5LAeUJxK+BUYgPkzLaQ7vVjJbydw7yL01NlsUH4fvcg/jQdDJFduJRzF+hKCR0IBlyE/MB6wVZa0qdrU8wUzdnqdUsdg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437828; c=relaxed/simple;
	bh=QM4iAmDIhurPmjM7YRlhOnrKKefrpRcYPjipT7rVs7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7Z4BchK5iBOIliuuqNZfw3JPr8R9KGLHshlfufxwUkEbKi2+c9sXFutRguHg6viy8JNCrH0CJ5cy20k5fpc5a1tr7ZGUjKeyLdw+58TdAZiqkYOmDur76+/xgyAcSrgbLoWiPnFDSbCvKYY0Oxwf8NvTaboUYRT/23TBoK650M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y/Eg7z/q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y/Eg7z/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743437825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfSVdAOWlV4aJ+zq8+1n6bx9TILsqQtAD2XqEIHNteo=;
	b=Y/Eg7z/q7unqjWCYiwKFCBuXWuxMd7DQ0FhF9WylM13jj2DXy5XrlhRUVfZ80cEJKdWE+0
	zQWIv1Yy7XkZUintI+2pNt3Zc2EXb09+MgQ/Q0qd89l1Re0A5pbEqnqz6OKfFKkhfg5nFp
	9Fc+yrQ6K2Wla1b6N6WwvIJFztbPQoU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-QsNJ_JmbMm6xy1crUlQkXw-1; Mon,
 31 Mar 2025 12:17:01 -0400
X-MC-Unique: QsNJ_JmbMm6xy1crUlQkXw-1
X-Mimecast-MFC-AGG-ID: QsNJ_JmbMm6xy1crUlQkXw_1743437820
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF5881955D82;
	Mon, 31 Mar 2025 16:16:59 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5871E19541A5;
	Mon, 31 Mar 2025 16:16:57 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 31 Mar 2025 11:15:26 -0400
Subject: [PATCH v4 2/4] drm/panel: Add refcount support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-b4-panel-refcounting-v4-2-dad50c60c6c9@redhat.com>
References: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
In-Reply-To: <20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743434129; l=5083;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=QM4iAmDIhurPmjM7YRlhOnrKKefrpRcYPjipT7rVs7w=;
 b=OLb2iv4ClD0a5eueKA8xUwVdeNaViZ/nTYL8r+F2k+ZBET0++T6epaHC48PV12IpPMG7azjOX
 GJuK37VkImsChWhQrRv0e926VV0FxSJHZJMmUebo9qGROjyL5jEVcuF
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Allocate panel via reference counting. Add _get() and _put() helper
functions to ensure panel allocations are refcounted. Avoid use after
free by ensuring panel pointer is valid and can be usable till the last
reference is put.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

---
v4: Add refcounting documentation in this patch (Maxime)

v3: Add include in this patch (Luca)

v2: Export drm_panel_put/get() (Maxime)
- Change commit log with better workding (Luca, Maxime)
- Change drm_panel_put() to return void (Luca)
- Code Cleanups - add return in documentation, replace bridge to
panel (Luca)
---
 drivers/gpu/drm/drm_panel.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     | 19 ++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index bdeab5710ee324dc1742fbc77582250960556308..7b17531d85a4dc3031709919564d2e4d8332f748 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -355,24 +355,86 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_find_panel);
 
+static void __drm_panel_free(struct kref *kref)
+{
+	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
+
+	kfree(panel->container);
+}
+
+/**
+ * drm_panel_get - Acquire a panel reference
+ * @panel: DRM panel
+ *
+ * This function increments the panel's refcount.
+ * Returns:
+ * Pointer to @panel
+ */
+struct drm_panel *drm_panel_get(struct drm_panel *panel)
+{
+	if (!panel)
+		return panel;
+
+	kref_get(&panel->refcount);
+
+	return panel;
+}
+EXPORT_SYMBOL(drm_panel_get);
+
+/**
+ * drm_panel_put - Release a panel reference
+ * @panel: DRM panel
+ *
+ * This function decrements the panel's reference count and frees the
+ * object if the reference count drops to zero.
+ */
+void drm_panel_put(struct drm_panel *panel)
+{
+	if (panel)
+		kref_put(&panel->refcount, __drm_panel_free);
+}
+EXPORT_SYMBOL(drm_panel_put);
+
+/**
+ * drm_panel_put_void - wrapper to drm_panel_put() taking a void pointer
+ *
+ * @data: pointer to @struct drm_panel, cast to a void pointer
+ *
+ * Wrapper of drm_panel_put() to be used when a function taking a void
+ * pointer is needed, for example as a devm action.
+ */
+static void drm_panel_put_void(void *data)
+{
+	struct drm_panel *panel = (struct drm_panel *)data;
+
+	drm_panel_put(panel);
+}
+
 void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
 			     const struct drm_panel_funcs *funcs,
 			     int connector_type)
 {
 	void *container;
 	struct drm_panel *panel;
+	int err;
 
 	if (!funcs) {
 		dev_warn(dev, "Missing funcs pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	container = devm_kzalloc(dev, size, GFP_KERNEL);
+	container = kzalloc(size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
 
 	panel = container + offset;
+	panel->container = container;
 	panel->funcs = funcs;
+	kref_init(&panel->refcount);
+
+	err = devm_add_action_or_reset(dev, drm_panel_put_void, panel);
+	if (err)
+		return ERR_PTR(err);
 
 	drm_panel_init(panel, dev, funcs, connector_type);
 
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 415e85e8b76a15679f59c944ea152367dc3e0488..31d84f901c514c93ab6cbc09f445853ef897bc95 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -28,6 +28,7 @@
 #include <linux/errno.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/kref.h>
 
 struct backlight_device;
 struct dentry;
@@ -266,6 +267,17 @@ struct drm_panel {
 	 * If true then the panel has been enabled.
 	 */
 	bool enabled;
+
+	/**
+	 * @container: Pointer to the private driver struct embedding this
+	 * @struct drm_panel.
+	 */
+	void *container;
+
+	/**
+	 * @refcount: reference count of users referencing this panel.
+	 */
+	struct kref refcount;
 };
 
 void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
@@ -282,6 +294,10 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
  * @connector_type: the connector type (DRM_MODE_CONNECTOR_*) corresponding to
  * the panel interface
  *
+ * The reference count of the returned panel is initialized to 1. This
+ * reference will be automatically dropped via devm (by calling
+ * drm_panel_put()) when @dev is removed.
+ *
  * Returns:
  * Pointer to container structure embedding the panel, ERR_PTR on failure.
  */
@@ -294,6 +310,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);
 
+struct drm_panel *drm_panel_get(struct drm_panel *panel);
+void drm_panel_put(struct drm_panel *panel);
+
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 

-- 
2.48.1

