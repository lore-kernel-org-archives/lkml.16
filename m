Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005C1278153
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143759; cv=none; b=sNC9AiLhpLTiuRZf9L4XUKEHE5ozZcIqlingPHp2FscxQ1oNwlD9fkhicpxF0Nsi4yzLaVPyFyUaTfe104mt6+xA7oW+Vyn+rBkJPyal4C1oDuHLaY1TvxAboWt+h1NUPwnRV03xFyqqa3Y148SSkcmmgA0rbLe7wsxMKZJLoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143759; c=relaxed/simple;
	bh=7AU2DpTMKPRxa5aj1whluARpJstGea8LAmvDZ4DS9Es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=chlSQXFiLytuG7UP9opbYIvOUoJOSh87NtHtoTkk2SfwbYEGbtRVfWj8i+QiwgdxVD4cs2ybDULeYujpbP7qIWNKiBj19TFCMtSjwDVavbxlUTbh4tnZrKAgzj7CG+Z2HIFQYLxoGeOiIS7Khg1a/tK3VOJSJpbLC1uB/jX4yHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ksgcCf3l; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ksgcCf3l"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749143753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSsoSA/a0rn2E8TexkvkkgZ5Jp5q4Qs8pTgbtALLktQ=;
	b=ksgcCf3lfy7wnb3bPpDEfXJwoU1VXRbZyJXiIOLvVwaPgS56ixWRzlLC8t1JnheozRmAw1
	+3GMG5JrrHHzENUsRB1SzQFReokOPhlHbCSWmFu3mQ79a1ZrwgUFXGGBCFczroc8hmKFUf
	7F1HWuUkiCmUvAoAxccwvFmLj1GJyjg=
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
Subject: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
Date: Thu,  5 Jun 2025 22:45:23 +0530
Message-Id: <20250605171524.27222-4-aradhya.bhatia@linux.dev>
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

Move the bridge pre_enable call before crtc enable, and the bridge
post_disable call after the crtc disable.

The sequence of enable after this patch will look like:

	bridge[n]_pre_enable
	...
	bridge[1]_pre_enable

	crtc_enable
	encoder_enable

	bridge[1]_enable
	...
	bridge[n]_enable

And, the disable sequence for the display pipeline will look like:

	bridge[n]_disable
	...
	bridge[1]_disable

	encoder_disable
	crtc_disable

	bridge[1]_post_disable
	...
	bridge[n]_post_disable

The definition of bridge pre_enable hook says that,
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Since CRTC is also a source feeding the bridge, it should not be enabled
before the bridges in the pipeline are pre_enabled. Fix that by
re-ordering the sequence of bridge pre_enable and bridge post_disable.

While at it, update the drm bridge API documentation as well.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c |   8 +-
 include/drm/drm_bridge.h            | 249 ++++++++++++++++++++--------
 2 files changed, 187 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 539b7f072c72..2fe6c91910a1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1336,9 +1336,9 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	encoder_bridge_disable(dev, state);
 
-	encoder_bridge_post_disable(dev, state);
-
 	crtc_disable(dev, state);
+
+	encoder_bridge_post_disable(dev, state);
 }
 
 /**
@@ -1674,10 +1674,10 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					      struct drm_atomic_state *state)
 {
-	crtc_enable(dev, state);
-
 	encoder_bridge_pre_enable(dev, state);
 
+	crtc_enable(dev, state);
+
 	encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0af5db244db8..ecdeb90e5586 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -165,17 +165,33 @@ struct drm_bridge_funcs {
 	/**
 	 * @disable:
 	 *
-	 * This callback should disable the bridge. It is called right before
-	 * the preceding element in the display pipe is disabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @disable vfunc. If the preceding element is a &drm_encoder
-	 * it's called right before the &drm_encoder_helper_funcs.disable,
-	 * &drm_encoder_helper_funcs.prepare or &drm_encoder_helper_funcs.dpms
-	 * hook.
+	 * The @disable callback should disable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
+	 *
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is disabled via one of:
+	 *
+	 * - &drm_bridge_funcs.disable
+	 * - &drm_bridge_funcs.atomic_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms.
+	 *
 	 * The @disable callback is optional.
 	 *
 	 * NOTE:
@@ -188,17 +204,34 @@ struct drm_bridge_funcs {
 	/**
 	 * @post_disable:
 	 *
-	 * This callback should disable the bridge. It is called right after the
-	 * preceding element in the display pipe is disabled. If the preceding
-	 * element is a bridge this means it's called after that bridge's
-	 * @post_disable function. If the preceding element is a &drm_encoder
-	 * it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.disable, &drm_encoder_helper_funcs.prepare
-	 * or &drm_encoder_helper_funcs.dpms hook.
-	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * signals) feeding it is no longer running when this callback is
-	 * called.
+	 * signals) feeding this bridge is no longer running when the
+	 * @post_disable is called.
+	 *
+	 * This callback should perform all the actions required by the hardware
+	 * after it has stopped receiving signals from the preceding element.
+	 *
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is post-disabled (unless marked otherwise by the
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.post_disable
+	 * - &drm_bridge_funcs.atomic_post_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms
 	 *
 	 * The @post_disable callback is optional.
 	 *
@@ -241,18 +274,30 @@ struct drm_bridge_funcs {
 	/**
 	 * @pre_enable:
 	 *
-	 * This callback should enable the bridge. It is called right before
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @pre_enable function. If the preceding element is a
-	 * &drm_encoder it's called right before the encoder's
-	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
-	 * &drm_encoder_helper_funcs.dpms hook.
-	 *
 	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
-	 * will not yet be running when this callback is called. The bridge must
-	 * not enable the display link feeding the next bridge in the chain (if
-	 * there is one) when this callback is called.
+	 * will not yet be running when the @pre_enable is called.
+	 *
+	 * This callback should perform all the necessary actions to prepare the
+	 * bridge to accept signals from the preceding element.
+	 *
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is pre-enabled (unless marked otherwise by
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.pre_enable
+	 * - &drm_bridge_funcs.atomic_pre_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - &drm_encoder_helper_funcs.commit
 	 *
 	 * The @pre_enable callback is optional.
 	 *
@@ -266,19 +311,31 @@ struct drm_bridge_funcs {
 	/**
 	 * @enable:
 	 *
-	 * This callback should enable the bridge. It is called right after
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called after that
-	 * bridge's @enable function. If the preceding element is a
-	 * &drm_encoder it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
-	 * &drm_encoder_helper_funcs.dpms hook.
+	 * The @enable callback should enable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is enabled via one of:
+	 *
+	 * - &drm_bridge_funcs.enable
+	 * - &drm_bridge_funcs.atomic_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - drm_encoder_helper_funcs.commit
+	 *
 	 * The @enable callback is optional.
 	 *
 	 * NOTE:
@@ -291,17 +348,30 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_pre_enable:
 	 *
-	 * This callback should enable the bridge. It is called right before
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
-	 * element is a &drm_encoder it's called right before the encoder's
-	 * &drm_encoder_helper_funcs.atomic_enable hook.
-	 *
 	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
-	 * will not yet be running when this callback is called. The bridge must
-	 * not enable the display link feeding the next bridge in the chain (if
-	 * there is one) when this callback is called.
+	 * will not yet be running when the @atomic_pre_enable is called.
+	 *
+	 * This callback should perform all the necessary actions to prepare the
+	 * bridge to accept signals from the preceding element.
+	 *
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is pre-enabled (unless marked otherwise by
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.pre_enable
+	 * - &drm_bridge_funcs.atomic_pre_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - &drm_encoder_helper_funcs.commit
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
@@ -311,18 +381,31 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_enable:
 	 *
-	 * This callback should enable the bridge. It is called right after
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called after that
-	 * bridge's @atomic_enable or @enable function. If the preceding element
-	 * is a &drm_encoder it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.atomic_enable hook.
+	 * The @atomic_enable callback should enable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is enabled via one of:
+	 *
+	 * - &drm_bridge_funcs.enable
+	 * - &drm_bridge_funcs.atomic_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - drm_encoder_helper_funcs.commit
+	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -330,16 +413,32 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_disable:
 	 *
-	 * This callback should disable the bridge. It is called right before
-	 * the preceding element in the display pipe is disabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
-	 * is a &drm_encoder it's called right before the
-	 * &drm_encoder_helper_funcs.atomic_disable hook.
+	 * The @atomic_disable callback should disable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is disabled via one of:
+	 *
+	 * - &drm_bridge_funcs.disable
+	 * - &drm_bridge_funcs.atomic_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms.
+	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -348,16 +447,34 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_post_disable:
 	 *
-	 * This callback should disable the bridge. It is called right after the
-	 * preceding element in the display pipe is disabled. If the preceding
-	 * element is a bridge this means it's called after that bridge's
-	 * @atomic_post_disable or @post_disable function. If the preceding
-	 * element is a &drm_encoder it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.atomic_disable hook.
-	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * signals) feeding it is no longer running when this callback is
-	 * called.
+	 * signals) feeding this bridge is no longer running when the
+	 * @atomic_post_disable is called.
+	 *
+	 * This callback should perform all the actions required by the hardware
+	 * after it has stopped receiving signals from the preceding element.
+	 *
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is post-disabled (unless marked otherwise by the
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.post_disable
+	 * - &drm_bridge_funcs.atomic_post_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
-- 
2.34.1

