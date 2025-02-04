Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F78521423C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681151; cv=none; b=sQuGaBw1/6sMLRD4YxMqiq4wHsDI3C0o0aiP8kmeyCBoTIDPSdtp5ox11MEK4y9LdwkWU7DsuxfsmQwrlc1JNFXvDefw+xTy6rboUa3VkHCZ+d/j+zpLI56xrcb6eXO63VZDcu/cUU7DnJLqy6X+gZssGa/E5bI8HlkfD/VvpH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681151; c=relaxed/simple;
	bh=DdFUs7GoT5F6H/bRqu1Y9DyfNSOWPSFnCV9ils/unqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kc9iPZEPWM6/TNYqG9WVKh6Z9QQlE7WCoe/chKN6v3/3J9rQfLXdgpu36flgKLacETZfyv140zblm7+MHDMLExxjDo3g+9wVL0QPPFOukeR54C5ymCOZWcts/7G2gSf7oIVGP9ZHEviBodDd5COxOR7MFyfSuQRvsX7uHegwltE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooWiGzjz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooWiGzjz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D14C4CEDF;
	Tue,  4 Feb 2025 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681149;
	bh=DdFUs7GoT5F6H/bRqu1Y9DyfNSOWPSFnCV9ils/unqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ooWiGzjzULK/WPEVjJ2stUwzKzLs+kGXXnNjOdS4M0TViPgfwq+Wtj41eIHRjzzfr
	 +pVpJYP2IaulUhQ/YOCao7EcGre/C1EOiVWBugUESXNjxjFp6V9mlOmVoSJPXAHmxX
	 tfY0O6ly00sUA9+UyHwQqQk533qoN1NbbrbOn8LzsVqxwqP7DwJ77jVC3N6835sXAQ
	 yxyK4vvZGpsN4vmuO/PMPVniIj5zRUZRuKAzfXsALfxfVeX65B0QkViWPbPqlTJRk6
	 RkTvT7HM+Alrh1jvo3IMSYqZ+MeU8VHs9GB2skOf0F21pWunAcOici4ZWb8ZYky1to
	 TGSnI+PQ08i6w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:40 +0100
Subject: [PATCH v2 12/35] drm/bridge: Change parameter name of
 drm_atomic_bridge_chain_disable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-12-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=mripard@kernel.org;
 h=from:subject:message-id; bh=DdFUs7GoT5F6H/bRqu1Y9DyfNSOWPSFnCV9ils/unqI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN552p/+uolv54s/J5ebrfWZoKOjtlFEuq1D6fuKB
 o31yRO2d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJxFxnbHg2a16xQu7m+aXv
 5qVu0yzof/vppkGgcteBpFlqNs2iFtaxvW3rjkVt2bXvTuWCTe8rqhkbZlX2T5iaUPqhSXJOrO+
 UZtujdmZ3W2SXBYbkPA5TuzK79pn8qpTeGvGErfoFD+d8XlwEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_bridge_chain_disable() disables all bridges affected by a new
commit. It takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index a5d60d908251b6381f452c10ddfd7469fa01902f..0a8c7176959d13937124d2a3bf7e69309898b947 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -544,32 +544,32 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
- * @old_state: old atomic state
+ * @state: atomic state being committed
  *
  * Calls &drm_bridge_funcs.atomic_disable (falls back on
  * &drm_bridge_funcs.disable) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_disable
  *
  * Note: the bridge passed should be the one closest to the encoder
  */
 void drm_atomic_bridge_chain_disable(struct drm_bridge *bridge,
-				     struct drm_atomic_state *old_state)
+				     struct drm_atomic_state *state)
 {
 	struct drm_encoder *encoder;
 	struct drm_bridge *iter;
 
 	if (!bridge)
 		return;
 
 	encoder = bridge->encoder;
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->atomic_disable) {
-			iter->funcs->atomic_disable(iter, old_state);
+			iter->funcs->atomic_disable(iter, state);
 		} else if (iter->funcs->disable) {
 			iter->funcs->disable(iter);
 		}
 
 		if (iter == bridge)

-- 
2.48.0

