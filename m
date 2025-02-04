Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC8421423C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681158; cv=none; b=dZYWKEHcfFl2AaH0R47yXTGsE47E/FoBmmi6Gj8vN/oC3UM9x11A8SWcRjiqSRzogvfN8GdXOI+Ub0vn1IL3eIWtyxojnuNv1hcL2KUCY1LaeVr3FPAyZVrXBRZNpjjIkgpahnwqYr7SpS7qf/6A+/khJhgGDDkfpN6X6ZBEPA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681158; c=relaxed/simple;
	bh=GPycQhOuy0Ne8F+Ox0EmG/eWvlGSLqT1lGqrAsRW7Ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIV2vSLnwP+ST2Jiwm7u4w0qg27GBDu7VFIlG+t5pH3r5ixHqFV9wtwf6KQopK2gF6E7Ze7iw6F85Em0lTQ1VRUAb++9ZRaPSDjunlZ72d5TS/uy4Fa4xj/cOjES2h5pm+x/1v4tfssGI6alCz3Du+kPOsznQigO6jhrVwjyBBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir1jBHSl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ir1jBHSl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF94C4CEDF;
	Tue,  4 Feb 2025 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681158;
	bh=GPycQhOuy0Ne8F+Ox0EmG/eWvlGSLqT1lGqrAsRW7Ac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ir1jBHSlYV7veIytsPL1ZAXMHisigkLWg0o6SjO+86ClbJfyzFsB199LjRkPU5+DN
	 6+6dGB5KfzmTnTHxJXoVvxe894GAF8yU11/PC+huK5pSLkUPZbnMtBMuDYEbKkUOmF
	 Uu8NM2d64fLw/iSzRU7UZ2Wh1uGZ7c7KcdK1pX10yNfkG0qPmf1W40rQxufjWnV5mb
	 H2E/o44+nVA2mrjQ+veEYahGAdc9Vct0JNrbNFHVs86O3qhjR9SbdIdisMLkZ6enik
	 L6lk593C/Dq9ET+V0/TiG7cvcWrmj3ejhbE71MienQJSO6BguZvKjk4eoOleBDc0u+
	 S+g8581omaOqw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:42 +0100
Subject: [PATCH v2 14/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_update_legacy_modeset_state()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-14-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3609; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GPycQhOuy0Ne8F+Ox0EmG/eWvlGSLqT1lGqrAsRW7Ac=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN4n8DlPaZ+Q3KXKZs6tZe7JVfRNbNa6sw8v/ekOk
 eB+OX9ux1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIVUvGhk0uUc0K4hpnGPs9
 LvLdTP3VJ8X0hs31Y8pL20y2uVJrQi9IulSLCW8w9Lp1913id7E7jHVm0SVlQt0a55h6CtbP7Sz
 l/KAVEZ1gKxhX7vl81e7lV4/FSK7/+ae8ikexbsn3OTJvDwEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_update_legacy_modeset_state() updates all the legacy
modeset pointers a connector, encoder or CRTC might have with the ones
being setup by a given commit. It takes the drm_atomic_state being
committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0d561b5c249a79a723e047f061d4103ef7742e87..50b3fdb033eaae8e852a4fd298d2e958be1201f3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1265,11 +1265,11 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 }
 
 /**
  * drm_atomic_helper_update_legacy_modeset_state - update legacy modeset state
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function updates all the various legacy modeset state pointers in
  * connectors, encoders and CRTCs.
  *
  * Drivers can use this for building their own atomic commit if they don't have
@@ -1281,20 +1281,20 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
  * the legacy state pointers are only really useful for transitioning an
  * existing driver to the atomic world.
  */
 void
 drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int i;
 
 	/* clear out existing links and update dpms */
-	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+	for_each_oldnew_connector_in_state(state, connector, old_conn_state, new_conn_state, i) {
 		if (connector->encoder) {
 			WARN_ON(!connector->encoder->crtc);
 
 			connector->encoder->crtc = NULL;
 			connector->encoder = NULL;
@@ -1311,11 +1311,11 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 			connector->dpms = mode;
 		}
 	}
 
 	/* set new links */
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		if (!new_conn_state->crtc)
 			continue;
 
 		if (WARN_ON(!new_conn_state->best_encoder))
 			continue;
@@ -1323,19 +1323,19 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 		connector->encoder = new_conn_state->best_encoder;
 		connector->encoder->crtc = new_conn_state->crtc;
 	}
 
 	/* set legacy state in the crtc structure */
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		struct drm_plane *primary = crtc->primary;
 		struct drm_plane_state *new_plane_state;
 
 		crtc->mode = new_crtc_state->mode;
 		crtc->enabled = new_crtc_state->enable;
 
 		new_plane_state =
-			drm_atomic_get_new_plane_state(old_state, primary);
+			drm_atomic_get_new_plane_state(state, primary);
 
 		if (new_plane_state && new_plane_state->crtc == crtc) {
 			crtc->x = new_plane_state->src_x >> 16;
 			crtc->y = new_plane_state->src_y >> 16;
 		}

-- 
2.48.0

