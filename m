Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B71DE885
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739103405; cv=none; b=g97zXrd5C2bSvEzZnFdUMYa4vqW3KBEm/Nv9HIG8Nm15+BSIjohcmy7loDSXSIhO8s0YjsnY2Sxc0UVMU5ml9TKubkZNfmRyZsXA8ejBa+GgcUmoiHA86uQRAEDgwWhHWbRgcS2Tll947pL9luZp9l2rLXfjnPguKoeeqqmkTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739103405; c=relaxed/simple;
	bh=Av1Ofdg1vOOrAFis8NLM95E86NtMpIKvh06ZxEGezuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LK0Sh09ZHpf+iD6FJd1Ah93CX6iBg4+hiaCBftamAFFGDPbESkzWUNHq42XB7OMpcE99BJaaGkPnluQOZA6ny1tlnyz9hvGr04ppFrbA3Cp/IDZm13Tsk2ndC1xVQmh5pfC2mwNOB4jXm2bcnYL6Ur7FOGJi77JU2+FAWTR5Hlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VGJwzcZA; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VGJwzcZA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739103401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiA69S57neLqPcjY1aULPjpHWkYs6ec9/LxCurdqrds=;
	b=VGJwzcZAtkC/OOCj5mj3twtchJCtkF3yXHihPAyDhPQAEHeYYwJY3yX+8qhGziFwcxfc80
	Ke9viytZlTZ32clMubiOnjKHx0+wMq2QfxGaq/46CBeljSCeqf4fNynOGmSsuYOL4u6pIY
	w3l+dxLYyWYJN1Ooj9XGwLJ9MkF4bU8=
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
Subject: [PATCH v9 11/13] drm/atomic-helper: Separate out bridge pre_enable/post_disable from enable/disable
Date: Sun,  9 Feb 2025 17:46:19 +0530
Message-Id: <20250209121621.34677-4-aradhya.bhatia@linux.dev>
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

The encoder-bridge ops occur by looping over the new connector states of
the display pipelines. The enable sequence runs as follows -

	- pre_enable(bridge),
	- enable(encoder),
	- enable(bridge),

while the disable sequnce runs as follows -

	- disable(bridge),
	- disable(encoder),
	- post_disable(bridge).

Separate out the pre_enable(bridge), and the post_disable(bridge)
operations into separate functions each.

This patch keeps the sequence same for any singular disaplay pipe, but
changes the sequence across multiple display pipelines.

This patch is meant to be an interim patch, to cleanly pave the way for
the sequence re-ordering patch, and maintain bisectability in the
process.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jayesh Choudhary <j-choudhary@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
Note on checkpatch warnings:
This patch caueses the checkpatch to flare up for 1 warning, and 1 check -

WARNING: line length of 101 exceeds 100 columns
#63: FILE: drivers/gpu/drm/drm_atomic_helper.c:1252:

CHECK: Lines should not end with a '('
#77: FILE: drivers/gpu/drm/drm_atomic_helper.c:1266:

This patch is largely duplicating the original code, with minor changes to
perform different bridge operations. Both these lines of code pre-exist in the
file and have simply been duplicated. I have decided to keep them as is to
maintain the uniformity and the originaly intended readability. Should perhaps a
fix be required, this patch/series is not the right place, and another patch can
be created to fix this across the whole file.

---
 drivers/gpu/drm/drm_atomic_helper.c | 91 ++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e805fd0a54c5..c9ffca796f32 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1185,8 +1185,6 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *old_stat
 			else if (funcs->dpms)
 				funcs->dpms(encoder, DRM_MODE_DPMS_OFF);
 		}
-
-		drm_atomic_bridge_chain_post_disable(bridge, old_state);
 	}
 }
 
@@ -1243,11 +1241,65 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
 	}
 }
 
+static void
+encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *old_conn_state, *new_conn_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	int i;
+
+	for_each_oldnew_connector_in_state(old_state, connector, old_conn_state, new_conn_state, i) {
+		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
+
+		/*
+		 * Shut down everything that's in the changeset and currently
+		 * still on. So need to check the old, saved state.
+		 */
+		if (!old_conn_state->crtc)
+			continue;
+
+		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
+
+		if (new_conn_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(
+						old_state,
+						new_conn_state->crtc);
+		else
+			new_crtc_state = NULL;
+
+		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
+		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
+			continue;
+
+		encoder = old_conn_state->best_encoder;
+
+		/* We shouldn't get this far if we didn't previously have
+		 * an encoder.. but WARN_ON() rather than explode.
+		 */
+		if (WARN_ON(!encoder))
+			continue;
+
+		drm_dbg_atomic(dev, "post-disabling bridges [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call disable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_post_disable(bridge, old_state);
+	}
+}
+
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	encoder_bridge_disable(dev, old_state);
 
+	encoder_bridge_post_disable(dev, old_state);
+
 	crtc_disable(dev, old_state);
 }
 
@@ -1460,6 +1512,38 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 	}
 }
 
+static void
+encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
+{
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
+
+	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+		struct drm_encoder *encoder;
+		struct drm_bridge *bridge;
+
+		if (!new_conn_state->best_encoder)
+			continue;
+
+		if (!new_conn_state->crtc->state->active ||
+		    !drm_atomic_crtc_needs_modeset(new_conn_state->crtc->state))
+			continue;
+
+		encoder = new_conn_state->best_encoder;
+
+		drm_dbg_atomic(dev, "pre-enabling bridges [ENCODER:%d:%s]\n",
+			       encoder->base.id, encoder->name);
+
+		/*
+		 * Each encoder has at most one connector (since we always steal
+		 * it away), so we won't call enable hooks twice.
+		 */
+		bridge = drm_bridge_chain_get_first_bridge(encoder);
+		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
+	}
+}
+
 static void
 crtc_enable(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
@@ -1521,7 +1605,6 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *old_state
 		 * it away), so we won't call enable hooks twice.
 		 */
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		drm_atomic_bridge_chain_pre_enable(bridge, old_state);
 
 		if (funcs) {
 			if (funcs->atomic_enable)
@@ -1555,6 +1638,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 {
 	crtc_enable(dev, old_state);
 
+	encoder_bridge_pre_enable(dev, old_state);
+
 	encoder_bridge_enable(dev, old_state);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
-- 
2.34.1

