Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C61213E97
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681253; cv=none; b=F+wktS4LuPhBFzQa85v/pftSnB9UDhegsLzfCxKvzlSWWFcJXEHx63VjdkwRR3udqSc9E+IUMXDFJGVdbHv2Jz3Rf7XZII2reli2l2Ejcg42VmzHOHH8VuIjztwGLm8sKp9ncmbNQcdnKwLRS9cPHOa2meQwJ6/VPa8wQqwkVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681253; c=relaxed/simple;
	bh=n/1Y+rGpdCI9fCQFL15rH+D9O2fm8ABxL6EYMwh5oxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLrxtqteDiHXz1HvnuPt8jPvfD/tttAOnLpEkEcU+/TUQykgRjDOO/EuU/HtytkMBiCpd4RI+1aTtDMgim6A9YYXf4r0I4Ybm3khAwETuq2Bhl8diQzBVD/mt0KgRHJ/rCBYrd8skY9HAjJ/+qaLDKHZ+bSC35G/OZ0eoZbbeEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhGgPgoK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhGgPgoK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C494CC4CEDF;
	Tue,  4 Feb 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681253;
	bh=n/1Y+rGpdCI9fCQFL15rH+D9O2fm8ABxL6EYMwh5oxQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LhGgPgoKPR3calcrUhEEBrReXWlufPXUGorgdQAH++xYYsyMhwvTvAjMNdfJjgfXB
	 ZV4gDee12QxWwmFCCMRfNXvaRmSyggnD1UuO57cay/6j2rv1kEjdw12jgKaBln7bvt
	 UfLEcYRHMlo4vdgutAl1VT9EfRj7z/+2cdy6wV2teOT+CCZV86Qmu5fYAuR61yCDsm
	 pSwqvPHxfGwmVut32GZuo9fjLzZ1j1jQp0PtQnLB20kB/s8YZn8Urz266J/o0oPMza
	 5X3nvzozXK/9UEh2lsKOFogttpTYH8g2uSagxoWRo+QOeUi+2PIKi+u42IE7pqzSQ/
	 BtBjeQiwfM8zg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:58 +0100
Subject: [PATCH v2 30/35] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-30-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3321; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n/1Y+rGpdCI9fCQFL15rH+D9O2fm8ABxL6EYMwh5oxQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL7ZRjwWkXxwV9O1zv/LKQsZpuPLerwKfrimG3Jtv
 Jl4/PPHjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCROW6MDR9VlCZuMtReW9a0
 cMX19bmTxFgvFcZttLOY4CLA8cP4wLZNRctm2XDrKN1v4l2eM9FzCWPDgyNiXMF9y5eFH6ucn55
 w+tGrG54P1ZLzRH/f+6H++d/zG18W95zlvBydI5Ry5fVMnTV7AQ==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that connectors are no longer necessarily created by the bridges
drivers themselves but might be created by drm_bridge_connector, it's
pretty hard for bridge drivers to retrieve pointers to the connector and
CRTC they are attached to.

Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
encoder field, and then the drm_encoder crtc field, both of them being
deprecated.

And for the connector, since we can have multiple connectors attached to
a CRTC, we don't really have a reliable way to get it.

Let's provide both pointers in the drm_bridge_state structure so we
don't have to follow deprecated, non-atomic, pointers, and be more
consistent with the other KMS entities.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
 drivers/gpu/drm/drm_bridge.c              |  5 +++++
 include/drm/drm_atomic.h                  | 14 ++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
  * that don't subclass the bridge state.
  */
 void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
 					    struct drm_bridge_state *state)
 {
+	if (state->connector) {
+		drm_connector_put(state->connector);
+		state->connector = NULL;
+	}
+
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
 
 /**
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ad91a0ac375a9c8cf82834354ec7f654a59a7292..fcff08c7d609477b7cadabc109f0b543a6b9b506 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -803,10 +803,15 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 							       bridge);
 		if (WARN_ON(!bridge_state))
 			return -EINVAL;
 
+		bridge_state->crtc = crtc_state->crtc;
+
+		drm_connector_get(conn_state->connector);
+		bridge_state->connector = conn_state->connector;
+
 		if (bridge->funcs->atomic_check) {
 			ret = bridge->funcs->atomic_check(bridge, bridge_state,
 							  crtc_state, conn_state);
 			if (ret)
 				return ret;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 7af43062e5ca8c30b3fd600a34543e79137ab3ea..12f3676b85454e81de74c6b5eec700a355d42836 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1197,10 +1197,24 @@ struct drm_bridge_state {
 	/**
 	 * @bridge: the bridge this state refers to
 	 */
 	struct drm_bridge *bridge;
 
+	/**
+	 * @crtc: CRTC the bridge is connected to, NULL if disabled.
+	 *
+	 * Do not change this directly.
+	 */
+	struct drm_crtc *crtc;
+
+	/**
+	 * @connector: The connector the bridge is connected to, NULL if disabled.
+	 *
+	 * Do not change this directly.
+	 */
+	struct drm_connector *connector;
+
 	/**
 	 * @input_bus_cfg: input bus configuration
 	 */
 	struct drm_bus_cfg input_bus_cfg;
 

-- 
2.48.0

