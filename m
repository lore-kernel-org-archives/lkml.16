Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81061216E02
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681176; cv=none; b=s6wiYU4ppLQRdxF8e2EaqPuxVaCix+CLS/5ySXSp8kOwrMDrdm+OTIXkTqTLrC/dXmDCF8g4cs6VlmC92uQkZTkJQjuavF1CP6rx9w9JRiIjDvckssZQkNMkVEs+r55dDbVUjVGQjocBVekOtzUkoD7+WjDWHejQoWnGYjPtvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681176; c=relaxed/simple;
	bh=uemZSQBVexvbiw/5NK9pIq88uzqBpLnQsVM0zcTZNz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEcomY9JJnB9XmpVCTYU20MUKPQcIEaOcoSG3M8ye2gaGQEeeJaxg+z3/04ap6b2EjkMKJUNDycS5Ve5bQaukzpWWbmcX17Wt4/3F4GUN8Bgg8b07ePrtJyBu9Kvdz7IW+NPGCqQHQmsDqCFx3jhZEtRkGIBMPHgnOF/s0NPPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe9vFPEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe9vFPEx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B9AC4CEDF;
	Tue,  4 Feb 2025 14:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681176;
	bh=uemZSQBVexvbiw/5NK9pIq88uzqBpLnQsVM0zcTZNz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oe9vFPExGWnpflA1103jGqS21v8eO1q5yVnZxPELmUUVblk9EtSrlEEQx66NqhHvp
	 oyXGiJ8lJTBeFYqK+HJ/E3kfUiiQaBvywn212aNZ7nAe/5qV6F+tnCT5KBj1XnHPYD
	 hkoGz84Pu+Eq2wg8nImiRA1odNC85tm9LmGhfVBM/meKLLuDYYWLsfwJYIfPXg0pi3
	 ow3B6LNXiwG66zS2dxEwfOQiiwxBk8q5VGTz1TKAZCWtYJXjsDdrOne4QjCvZaVC7h
	 lnHZLbV+DvN1J6TabcQAXRwEi044AzoqWovWIEQIcpjK7bDNdWTKd3CzVM12LUzlJv
	 qinyhfh8tR8hw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:46 +0100
Subject: [PATCH v2 18/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_pre_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-18-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uemZSQBVexvbiw/5NK9pIq88uzqBpLnQsVM0zcTZNz8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD6sPlhi03qqyTj46S59Vsen128/jDD+eSRqUsbj5
 3pcaZwnOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEvGsZG5qU+AoDJl2JeVhw
 6v46netnGqobJ+v/n6O81XP9Nam/FW+EC4PWazB66vGsX5i6oNwghbFh7r+IG7/6zs48vWjzqp5
 nVq/LVp5YH1F68HDvL5mc3RH7QoIO86w8sZN3LQ/X4rhH0cGeAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_bridge_chain_pre_enable() enables all bridges affected by
a new commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ab166972b1b0df239ca014296be49846a857df6e..02ddfe962b99bed4316b2a7b0c72112e127afa8b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -672,23 +672,23 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 	}
 }
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
 static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
-					      struct drm_atomic_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	if (old_state && bridge->funcs->atomic_pre_enable)
-		bridge->funcs->atomic_pre_enable(bridge, old_state);
+		bridge->funcs->atomic_pre_enable(bridge, state);
 	else if (bridge->funcs->pre_enable)
 		bridge->funcs->pre_enable(bridge);
 }
 
 /**
  * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
  *					the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_pre_enable (falls back on
  * &drm_bridge_funcs.pre_enable) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_enable
@@ -704,11 +704,11 @@ static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
  * Bridge C, Bridge D, Bridge E, Bridge A, Bridge B.
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
-					struct drm_atomic_state *old_state)
+					struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter, *next, *limit;
 
 	if (!bridge)
@@ -743,15 +743,15 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					/* At the first bridge to request prev
 					 * bridges called first.
 					 */
 					break;
 
-				drm_atomic_bridge_call_pre_enable(next, old_state);
+				drm_atomic_bridge_call_pre_enable(next, state);
 			}
 		}
 
-		drm_atomic_bridge_call_pre_enable(iter, old_state);
+		drm_atomic_bridge_call_pre_enable(iter, state);
 
 		if (iter->pre_enable_prev_first)
 			/* Jump all bridges that we have already pre_enabled */
 			iter = limit;
 

-- 
2.48.0

