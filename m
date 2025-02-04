Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F8216E30
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681187; cv=none; b=FAWlgEOwVdhJV59YDTAh83p11bYu55fiQLQZaV7jzHDFxlrVrOojHPAnzCG/iJ0zbkG+BYF7R/xSa2hSsx71Y6hOMTVU0IBtalthDbMGlDqy7OdD5hnMuIEYFetsgcX8lg0su6VB3KNmFEsMiu3s+d4TKalvFD8VXTmvE8p5LfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681187; c=relaxed/simple;
	bh=2xkSeODDPTO3IomK7BQyA5QO/6PFVWsZ+gQV8yCEt3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ac+ckRvMokZlU859iPMOWOfpmkVNmTHOlr9nz1jLDPuw7YzMpqAooOFmwNqI463tvK3xrcri8fZ3yl2Rruz+FvC+hVX9vmUwXtuP1ZdSeS3V/6DpQMIlTI40Jm2OCQJmaf3x8Acjn5FSvlJlJXTYti2N61WAlGD9lSJR+8eYF7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=soE0zf+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="soE0zf+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB24C4CEE2;
	Tue,  4 Feb 2025 14:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681186;
	bh=2xkSeODDPTO3IomK7BQyA5QO/6PFVWsZ+gQV8yCEt3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=soE0zf+7iajLNhwdklG5HGx4l8RvGjf7yS+hiWDEPl9w5whOgRLhBXN/pv1iUn8pg
	 2DI8+hP7MJRju+kHO3LjsYHl3aVjQgxQlKvO4c6UjcKIOYs8z1ga/l3tqdAerSHWwb
	 3pA+B1BN4z+3pBSxI1MtewxujBrB4w7dVpUBQfaWTce2YoAo/ggEf5t+FP7BdU9EP5
	 BQUNfjveCf+cf/3Bvc7jFsyzpow7capYU+8iAFkA9G0xlXdX/jg1xGrGy3zt3bYAiW
	 nQzklbffAaGcMPbvGwfrK9054vOc6Angnh1OrJYl3WHULyPNqng3X2SV0wz1QPD+OJ
	 JHhlYTqoV/CTQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:48 +0100
Subject: [PATCH v2 20/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_writebacks()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-20-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2xkSeODDPTO3IomK7BQyA5QO/6PFVWsZ+gQV8yCEt3I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD7OuM3hNInZIH3BJbOvlpydqtZ8uzbWe7BOWLvr0
 qMHAvMOdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJVHMz1ke7/n3+0Ujz89HF
 e/06i4p+3fwqYayZs+VR2Ax1PvtrBvWuieobJ1+IC968zTlY4oGXBWN97N7PIfIfdthF9R9QrHp
 7stbLNL/moO48y7U8VrsVOEV/Fa2w+8g0T+D1hSKjSfzmgW0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_commit_writebacks() updates all writeback connectors
affected by a new commit. It takes the drm_atomic_state being committed
as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index b95e30dee1b4e2ba8991affd1e280a7a36171afd..cf859fa0110ad1154021e970dc262387cf3eb0c8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1451,26 +1451,26 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 	crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
 static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
-						struct drm_atomic_state *old_state)
+						struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_connector_helper_funcs *funcs;
 
 		funcs = connector->helper_private;
 		if (!funcs->atomic_commit)
 			continue;
 
 		if (new_conn_state->writeback_job && new_conn_state->writeback_job->fb) {
 			WARN_ON(connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK);
-			funcs->atomic_commit(connector, old_state);
+			funcs->atomic_commit(connector, state);
 		}
 	}
 }
 
 /**

-- 
2.48.0

