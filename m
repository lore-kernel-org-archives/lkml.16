Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49195276052
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143750; cv=none; b=MsWloPbnjuXufuAosqWFXMoMENtWzE1S31zHwY5HMKO6eysWlOMrpHx8NVF+D8QvylCQUK/+Os7bBWXzI/N46t9WvzWycVv7jRoQuVus8tdhXtRvBCC7CrwEd8sWpibBhC7I+TUrGCa3Kal+jwSGXN492ZcNjLhWE9yXV/tcJF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143750; c=relaxed/simple;
	bh=Lmif4NFDCSu1EvRLZfSV2REMCV0xoUU/SUlegqmnfuw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bfarBe8MAT2vJikRtV+NLCKYSwdKEYcmxbxuWsKdH9QJCMuhsWjdui6It4VnbC+3mRgj1ldYnppu43Z7B1IoVIGqNQN2ddiFLFCL+enS0mx/cS9joCBNz1Aj9ITAbiUFAP1RWLuPgU0avLtTSMRj1exbRjvZOHa+nSH8x6++t7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GA+m20Rc; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GA+m20Rc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749143744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkQLXsIMtWJzKMLpD3iULaJ1aOfCE4JOXHQInL7DKXU=;
	b=GA+m20RcD6EbyWaeXA3BXy2JqliLtMYybtBn2uel5sEAKJA8jlAoQkLaBpFQ6tXK0Gstci
	FzsfiAapyFYnDeA1u1849z39pICZk/4NSDL61C6Ed0u86zfruB3Te3hrNBBWpL+0T2wiun
	jjO5/KQWKoNheyNLfjIt6hnqxtU8Phc=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH v13 1/4] drm/atomic-helper: Refactor crtc & encoder-bridge op loops into separate functions
Date: Thu,  5 Jun 2025 22:45:21 +0530
Message-Id: <20250605171524.27222-2-aradhya.bhatia@linux.dev>
In-Reply-To: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 69 ++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ee64ca1b1bec..d185486071c5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1160,11 +1160,10 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
+encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
-	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
@@ -1227,6 +1226,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 
 		drm_atomic_bridge_chain_post_disable(bridge, state);
 	}
+}
+
+static void
+crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
@@ -1274,6 +1281,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 	}
 }
 
+static void
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	encoder_bridge_disable(dev, state);
+
+	crtc_disable(dev, state);
+}
+
 /**
  * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
  * @dev: DRM device
@@ -1483,28 +1498,12 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
-/**
- * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
- * @dev: DRM device
- * @state: atomic state object being committed
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
-					      struct drm_atomic_state *state)
+static void
+crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
 	int i;
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -1528,6 +1527,14 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 				funcs->commit(crtc);
 		}
 	}
+}
+
+static void
+encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
 
 	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
@@ -1565,6 +1572,28 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 
 		drm_atomic_bridge_chain_enable(bridge, state);
 	}
+}
+
+/**
+ * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
+ * @dev: DRM device
+ * @state: atomic state object being committed
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
+					      struct drm_atomic_state *state)
+{
+	crtc_enable(dev, state);
+
+	encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
 }
-- 
2.34.1

