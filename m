Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9421423C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681155; cv=none; b=bPW/NSAkaDtbo+QyP4gzu6ahRNwh3IA4oClKjXV6JYay0I/s1DjinDTxtDwQtU4qZDmpI9zinMpHNYtnHDpgkOEIssz0CNzl6EM2+gTjRhHbKHZy8PFOzpulQxlDTLT8JwHNc748u/dHrYZbAwpb+HDrAgrl6sa7TTXH6JpUibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681155; c=relaxed/simple;
	bh=CjbknWkLO9FJHKbmEf1EyUy4YFmhOLb2lsRfYnj48EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWIGRncFK4Us+T6Z9pnW7ScVMeAro6oKi2QFFZHDRnZljKM6NJxcwZDnlrTrXierKtyaQY4j45dJQ7lMT2aoBml23CacoHr/dw+JLxIMPf9+1wLqMUY7ZQ7LybAvgvsiq30El+9xq7iWY49DQ2hhgKN6uTYiyOv7Quot5/nnsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fiz0TsHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fiz0TsHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9911C4CEE2;
	Tue,  4 Feb 2025 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681155;
	bh=CjbknWkLO9FJHKbmEf1EyUy4YFmhOLb2lsRfYnj48EY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fiz0TsHfzJ9rM8V7NcpHH/Vk8ZjH55jN/ykoi2n17nP55/m8Ab8BwqDeJ+PZESaxP
	 adbEmOgE08CEo6YkOYfABCQOrn+m2B4jwz6ByscmOwdV6fyH0Qs5/33xxVPXKEqhIF
	 x3d5ghBJkZsT264258tHl4LHlSnCNq4EQhNJa1xQrpzIWkX3pciKybpfT5vCg9A91y
	 E6ZE9DjDbWjPpFjk6v8jhiUPeMkeZFruIgJEqjj9Z3JgJNbl2XACWUdmOmLpIT9L7j
	 OeHQuSt2YkVw2YMjP0kFyaUnk2z5x55BtUEh/FL41aL2hyMfFamB5KIgAzfKnN20VF
	 PE6ba0XS4PliQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:41 +0100
Subject: [PATCH v2 13/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_post_disable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-13-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2784; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CjbknWkLO9FJHKbmEf1EyUy4YFmhOLb2lsRfYnj48EY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN7pctz97zBhr9BWny/lweGlGV31x/eJJN2qSbD6q
 mij9FmuYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEykoZ2xYUV9/BoBBkevwgnH
 zH1eM+1Zw9aroFr03lPTP3bGvXZ3v0NfZ+W9WWr/5fejxgzWPUsFGRt2v1no+kX4iQ1rRcbnzQm
 +GsExr/UsdttHvDh6zeT5+xc/tganFOfJVXI9r3J8/X2Z1FYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_bridge_chain_post_disable() disables all bridges affected by
a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0a8c7176959d13937124d2a3bf7e69309898b947..ab166972b1b0df239ca014296be49846a857df6e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -577,23 +577,23 @@ void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_disable);
 
 static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
-						struct drm_atomic_state *old_state)
+						struct drm_atomic_state *state)
 {
 	if (old_state && bridge->funcs->atomic_post_disable)
-		bridge->funcs->atomic_post_disable(bridge, old_state);
+		bridge->funcs->atomic_post_disable(bridge, state);
 	else if (bridge->funcs->post_disable)
 		bridge->funcs->post_disable(bridge);
 }
 
 /**
  * drm_atomic_bridge_chain_post_disable - cleans up after disabling all bridges
  *					  in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_post_disable (falls back on
  * &drm_bridge_funcs.post_disable) op for all the bridges in the encoder chain,
  * starting from the first bridge to the last. These are called after completing
  * &drm_encoder_helper_funcs.atomic_disable
@@ -610,11 +610,11 @@ static void drm_atomic_bridge_call_post_disable(struct drm_bridge *bridge,
  * Bridge B, Bridge A, Bridge E, Bridge D, Bridge C.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
-					  struct drm_atomic_state *old_state)
+					  struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *next, *limit;
 
 	if (!bridge)
@@ -657,16 +657,16 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 								 chain_node) {
 					if (next == bridge)
 						break;
 
 					drm_atomic_bridge_call_post_disable(next,
-									    old_state);
+									    state);
 				}
 			}
 		}
 
-		drm_atomic_bridge_call_post_disable(bridge, old_state);
+		drm_atomic_bridge_call_post_disable(bridge, state);
 
 		if (limit)
 			/* Jump all bridges that we have already post_disabled */
 			bridge = limit;
 	}

-- 
2.48.0

