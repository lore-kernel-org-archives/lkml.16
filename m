Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733261BD9C6
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739103401; cv=none; b=PmOWCXGktyVQKvaXcYpzWR22Rc+GG6Pe7rTXwsnNGChN0y1IUYDyEVfwqosSUbL6MRA3/lkgQMLGc7abMswOWy13+8kzUjms708wsOFlgc71uW6JLGUDQ0QbS2uCI7X8uVIhtop3G+cfPqbFAz4UjwqZCE950fKKUVAcIpK23Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739103401; c=relaxed/simple;
	bh=p+7IQNwXV4ZSlFmrv47AtfY1vGtIrLOEgTJt6sTerkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2Eq+cprlMEW9qciZkqNuxYAugy72tII1iaf08adGhy3O0vx0EvB1mXNIAWF7YFQaSgNww0v5+HrrwWijoSqJYnzc30Ok485YLMIm+uBjXrFULcpvQJt1g65NHbJMBm3J5T3R5fYuniJRLFdLwC5cJuCxquOZ5BTRo7bkgHqoZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KlR4x7I1; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KlR4x7I1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739103397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oj7rsci7cFKOMYKswsxQpkKHx2xks5Y2rWv9lCZ/rJM=;
	b=KlR4x7I1GWALbjheGrwUvR6uPIJ8zLRqn8ftDCLwq3VYrAjafC8KiyAsLBVAY8nXPR8z9N
	L1FP1UVU0OXlh8BWirKCiNQZugcfWgBUinanySasx+eL/6FJySh1FSWyrNLgvIex1bUJHt
	TFLP2RyyRUi6Q/t6uncRvEkgDAg8yio=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v9 10/13] drm/atomic-helper: Refactor crtc & encoder-bridge op loops into separate functions
Date: Sun,  9 Feb 2025 17:46:18 +0530
Message-Id: <20250209121621.34677-3-aradhya.bhatia@linux.dev>
In-Reply-To: <20250209121621.34677-1-aradhya.bhatia@linux.dev>
References: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
 <20250209121621.34677-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Aradhya Bhatia <a-bhatia1@ti.com>

The way any singular display pipeline, in need of a modeset, gets
enabled is as follows -

	crtc enable
	(all) bridge pre-enable
	encoder enable
	(all) bridge enable

- and the disable sequence is exactly the reverse of this.

The crtc operations occur by looping over the old and new crtc states,
while the encoder and bridge operations occur together, by looping over
the connector states of the display pipelines.

Refactor these operations - crtc enable/disable, and encoder & bridge
(pre/post) enable/disable - into separate functions each, to make way
for the re-ordering of the enable/disable sequences.

This patch doesn't alter the sequence of crtc/encoder/bridge operations
in any way, but helps to cleanly pave the way for the next two patches,
by maintaining logical bisectability.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 69 ++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5186d2114a50..e805fd0a54c5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1122,11 +1122,10 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
-	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
@@ -1189,6 +1188,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		drm_atomic_bridge_chain_post_disable(bridge, old_state);
 	}
+}
+
+static void
+crtc_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
@@ -1236,6 +1243,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 	}
 }
 
+static void
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	encoder_bridge_disable(dev, old_state);
+
+	crtc_disable(dev, old_state);
+}
+
 /**
  * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
  * @dev: DRM device
@@ -1445,28 +1460,12 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
-/**
- * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
- * @dev: DRM device
- * @old_state: atomic state object with old state structures
- *
- * This function enables all the outputs with the new configuration which had to
- * be turned off for the update.
- *
- * For compatibility with legacy CRTC helpers this should be called after
- * drm_atomic_helper_commit_planes(), which is what the default commit function
- * does. But drivers with different needs can group the modeset commits together
- * and do the plane commits at the end. This is useful for drivers doing runtime
- * PM since planes updates then only happen when the CRTC is actually enabled.
- */
-void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
-					      struct drm_atomic_state *old_state)
+static void
+crtc_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
 	int i;
 
 	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1490,6 +1489,14 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 				funcs->commit(crtc);
 		}
 	}
+}
+
+static void
+encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
 
 	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
@@ -1527,6 +1534,28 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 
 		drm_atomic_bridge_chain_enable(bridge, old_state);
 	}
+}
+
+/**
+ * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
+ * @dev: DRM device
+ * @old_state: atomic state object with old state structures
+ *
+ * This function enables all the outputs with the new configuration which had to
+ * be turned off for the update.
+ *
+ * For compatibility with legacy CRTC helpers this should be called after
+ * drm_atomic_helper_commit_planes(), which is what the default commit function
+ * does. But drivers with different needs can group the modeset commits together
+ * and do the plane commits at the end. This is useful for drivers doing runtime
+ * PM since planes updates then only happen when the CRTC is actually enabled.
+ */
+void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
+					      struct drm_atomic_state *old_state)
+{
+	crtc_enable(dev, old_state);
+
+	encoder_bridge_enable(dev, old_state);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
 }
-- 
2.34.1

