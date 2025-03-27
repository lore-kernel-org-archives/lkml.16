Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206762185AB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087358; cv=none; b=cZWbyZ82PMJa47mxXwLztM6OnhVb92BIBWSj1/PEG74KWMZicvbQe55N3do/NXJebQxs6bkjQXXQBc6bY5mmasOs/tG/irMnDFel1HCVwGp+8uwIzOCkJkF6lB5ho2OJ83vi669nZCIWmc6B69YPOswgv3a5z01ip/Wqxqz5f6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087358; c=relaxed/simple;
	bh=C9ZVKVj8BJ8HCZ7TThUN+biNcgvCqbE69hUNOeyr+QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/z6jiMk8t9MoJeCqUaWWcxOraJ0yHAv2yK100awQxKV6xKQJirG4JlCFQ+Q1Ned5cGw9Sp+QDLM4OwpP/RzEfAkVZNUpEeXTgYPbfZCcIr0u5WqFWj5BT7AQdBn6LHj0xxHqAn5c9+iDGwHtB7l4sfB8Ht1LxrwuJchLp2sWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CWmR60wo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CWmR60wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743087355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RbeQeU7H02nj924RcSWV+5mz8cMqy8mef33chj6M5xo=;
	b=CWmR60woUVazNm2+HBvx8jxdwUob77leopv4zcnfg/vkQv3JWWbypibBaG0Wcwaarrdf+B
	z6+i+Uq4A31H0ML9FhSUt+074Vlv6rCqM9BoVXAR4W4LKB196TtHAASRFTbWyDs/nMlycQ
	TyzyvnAAJuaqQ1+eEUIIYCdtNE7MhqY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-fEudDy3bMIygTf0MA_4A2g-1; Thu,
 27 Mar 2025 10:55:53 -0400
X-MC-Unique: fEudDy3bMIygTf0MA_4A2g-1
X-Mimecast-MFC-AGG-ID: fEudDy3bMIygTf0MA_4A2g_1743087352
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F07081800349;
	Thu, 27 Mar 2025 14:55:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4134180A803;
	Thu, 27 Mar 2025 14:55:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 27 Mar 2025 10:55:40 -0400
Subject: [PATCH v2 2/4] drm/panel: Add refcount support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-b4-panel-refcounting-v2-2-b5f5ca551f95@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743087343; l=4202;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=C9ZVKVj8BJ8HCZ7TThUN+biNcgvCqbE69hUNOeyr+QM=;
 b=0MTamHhaOufQXxagw1dSm3sFiooVIvo9iC6BJg9XI5bbkLrBqsQ3m83RMJvvjtxz5n2zm2jf9
 qKNRLqhZbFKDQj16T/yqGLclygT0hfddoDY0n4on0mcjb4EPLn6MEdh
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Allocate panel via reference counting. Add _get() and _put() helper
functions to ensure panel allocations are refcounted. Avoid use after
free by ensuring panel pointer is valid and can be usable till the last
reference is put.

v2: Export drm_panel_put/get() (Maxime)
- Change commit log with better workding (Luca, Maxime)
- Change drm_panel_put() to return void (Luca)
- Code Cleanups - add return in documentation, replace bridge to
panel (Luca)

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
 include/drm/drm_panel.h     | 14 ++++++++++
 2 files changed, 77 insertions(+), 1 deletion(-)

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
index 53251c6b11d78149ede3dad41ffa6a88f3c3c58b..5f8ae1be0532b0f861c33bb4d522b349cd469e9a 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -267,6 +267,17 @@ struct drm_panel {
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
@@ -295,6 +306,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 		    const struct drm_panel_funcs *funcs,
 		    int connector_type);
 
+struct drm_panel *drm_panel_get(struct drm_panel *panel);
+void drm_panel_put(struct drm_panel *panel);
+
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 

-- 
2.48.1

