Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD022153EC
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681147; cv=none; b=BI68n7T2MUYj7dYwM1N467FR0A4KqQDIovNxdnrHGBREwUT8le21IyzoblBa5H+tA8uxQ8iAeYa4ztxdW3cC/D2FmbmBCs+dSkb2WShSBPxduPecrKkwo8SaX7HPE14RhprPu6Ufv074tAbjHotcA2r8rMuKv3tNK6wmqkJc3E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681147; c=relaxed/simple;
	bh=uxBDuIzE3MeUz79jWnci/f2RLclYZxQteOTg5o3Y3QY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTNK4EvWHq3d9Chiby1AZ8iZ8ce5ENcwDBSwiOK2CXC9ZcchEo77KS/6yRLh9EpoFK6HE6pE6TbOEQZy66DdBVtWWOPvwC8jxlK4WR17KfS+f2CMJSE0KelhXTn68ww3JGlXj/B6ybPCSrNsk8ThPkT1vhmhQiI0JEuS5InqZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1bzbena; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1bzbena"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36BAC4CEDF;
	Tue,  4 Feb 2025 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681147;
	bh=uxBDuIzE3MeUz79jWnci/f2RLclYZxQteOTg5o3Y3QY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i1bzbenaLATFNJMaRMsc3i1WsBxXWMHJbZkZjb2NRRteqmd5aSZiba0AfZkIOMeRw
	 1sSAhXTRrKrsjMYBcKn0vcrK3rRFHajLL6VSzWl/RjZiCYs4s97LRjiR+17z5YDeV5
	 STiI2Gj42H0KBOPASNhX/sVoJZWgg2NXv7fHaBnUX1RBnspBwHYuzlh6KsybQDwEgM
	 y1yP+C8odZjFLn3GG4WcUIwUnCYTUDu7arSpuPtYkTW5ruVIo+2xpIWGXkXY/yB0sL
	 DklzAUS10YPx0DB1kQidTBh52L92ezVWUpAKvogeftAzI3ZnEWQt/xtV7ZgIcVKIPe
	 c6WKlZKTImKPw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:39 +0100
Subject: [PATCH v2 11/35] drm/atomic-helper: Change parameter name of
 disable_outputs()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-11-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4016; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uxBDuIzE3MeUz79jWnci/f2RLclYZxQteOTg5o3Y3QY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN6e+tx8/NX5Z2sWJJRGLlh7fEtew+W2l2zSTWdPt
 /UsuPfFpWMqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBMpEaJsYo5ecG15kKr856n
 QtfsPyZlGbJxU++blztm756g8HhJ2ZPvb/nnVwoEnFbiqrn6ZlvBsw+MDR+Ke5li3uaIpudyL5j
 UIGOmZ2y/Qb3ZSV/jQqcdl7fEz+SfVZfMppjs+VSc8zHF7r0eAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

disable_outputs() disables all connectors and CRTCs affected by a
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called as old_state, which is pretty
confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5129de2278d5f62c136f8b6c831f903d9e53927..0d561b5c249a79a723e047f061d4103ef7742e87 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1148,19 +1148,19 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	       (old_state->self_refresh_active && !new_state->active) ||
 	       new_state->self_refresh_active;
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int i;
 
-	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
 		/*
@@ -1168,15 +1168,15 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		 * still on. So need to check the old, saved state.
 		 */
 		if (!old_conn_state->crtc)
 			continue;
 
-		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
+		old_crtc_state = drm_atomic_get_old_crtc_state(state, old_conn_state->crtc);
 
 		if (new_conn_state->crtc)
 			new_crtc_state = drm_atomic_get_new_crtc_state(
-						old_state,
+						state,
 						new_conn_state->crtc);
 		else
 			new_crtc_state = NULL;
 
 		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
@@ -1199,28 +1199,28 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		/*
 		 * Each encoder has at most one connector (since we always steal
 		 * it away), so we won't call disable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_disable(bridge, old_state);
+		drm_atomic_bridge_chain_disable(bridge, state);
 
 		/* Right function depends upon target state. */
 		if (funcs) {
 			if (funcs->atomic_disable)
-				funcs->atomic_disable(encoder, old_state);
+				funcs->atomic_disable(encoder, state);
 			else if (new_conn_state->crtc && funcs->prepare)
 				funcs->prepare(encoder);
 			else if (funcs->disable)
 				funcs->disable(encoder);
 			else if (funcs->dpms)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
 
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+		drm_atomic_bridge_chain_post_disable(bridge, state);
 	}
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
 		int ret;
 
 		/* Shut down everything that needs a full modeset. */
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
@@ -1237,11 +1237,11 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		/* Right function depends upon target state. */
 		if (new_crtc_state->enable && funcs->prepare)
 			funcs->prepare(crtc);
 		else if (funcs->atomic_disable)
-			funcs->atomic_disable(crtc, old_state);
+			funcs->atomic_disable(crtc, state);
 		else if (funcs->disable)
 			funcs->disable(crtc);
 		else if (funcs->dpms)
 			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
 

-- 
2.48.0

