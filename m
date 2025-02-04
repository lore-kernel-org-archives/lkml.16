Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2386F2144DD
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681145; cv=none; b=XltlWirFbX60rGD29i7j4MF9bv3yUGHsmI24WuxCYKjTlVDZkUJ2aMUpT/31aA5zvLapVbdVqb6iiIgdiaUZjIGo/b0Zza2losJ+h7VKDNenbvFA8Ytel6FB3daaR5GnJdNIiAqZEe5SZm1lmLwQMq5hp2HkbPUNk/u8XRm6TpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681145; c=relaxed/simple;
	bh=0bs8qf/laRg76YhWY0Fs2aPiQ4qdVBKMLc+T2D/sbXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=piqmd/mDPTPMzVCp1+j+sh82ZqP8zaFzglBOTXBVvDjd9IouknQgsgCHSzWGlfxplVw+5Au1E37j0FOr+lC75R4Qwun6HcD71WCnS4ZHqnrDJT3SciOGM/FkneEOzY10X83UFbFG1thA+z+yzgXzrRzRiClqgqFPvyySu+IHv0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvGH7Je9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvGH7Je9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD2BC4CEE6;
	Tue,  4 Feb 2025 14:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681144;
	bh=0bs8qf/laRg76YhWY0Fs2aPiQ4qdVBKMLc+T2D/sbXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TvGH7Je9afU/AyW5V4DVCbgNcokDFeVmxy4pz0FuJ8niU2A9/xHouJJRR/Y4wZbWi
	 ifumOstjDpby8IddBBm8Qgp/d4OAGZt+7FCbCum1OJPImc0eo8HMQTdOMqPcXAxz8L
	 GxHECq5IVLXLOmJgkaUJB+zMEVGY/opFmXx6E83L/NFKgId9a7oEHh6GpRZ42E65VL
	 RZUg8woGiRD0qcip3rTXMoCdyvTrGNri9H3v9XZBYUpabebf8t0qvCsU8SyRFLkO0P
	 mG5L5jrpglLr8NQOi//5dQ/zBiG9OiekYGvvoZIvdY7IF4ZntAHw1T5wocn7UY2bJ5
	 qhwAQ1QqRFIyg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:38 +0100
Subject: [PATCH v2 10/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_modeset_disables()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-10-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0bs8qf/laRg76YhWY0Fs2aPiQ4qdVBKMLc+T2D/sbXA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN5K3Z2avPrNNPum/y9u/vqhcellvr54ulHRxWciK
 3k09vcs7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT8TFnbHg+t6r5qeKCbdwN
 IsZlP99r/D7NOmfSxmKtqb/D6jeJXMtw/jblUGB8zuYLCxj+TQ6T/MpYzfJHau6SC98vxr1k65T
 8xitZymdoceZn+Ca76j+zY55/ymGZ65/CNqX21XWv7ZP639xdAwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_modeset_disables() disables all the outputs affected
by a commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cb08fda752c65d6d0c4388bb4bf7054e74a053a8..d5129de2278d5f62c136f8b6c831f903d9e53927 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1427,11 +1427,11 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 }
 
 /**
  * drm_atomic_helper_commit_modeset_disables - modeset commit to disable outputs
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function shuts down all the outputs that need to be shut down and
  * prepares them (if required) with the new mode.
  *
  * For compatibility with legacy CRTC helpers this should be called before
@@ -1439,18 +1439,18 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
  * does. But drivers with different needs can group the modeset commits together
  * and do the plane commits at the end. This is useful for drivers doing runtime
  * PM since planes updates then only happen when the CRTC is actually enabled.
  */
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
-					       struct drm_atomic_state *old_state)
+					       struct drm_atomic_state *state)
 {
-	disable_outputs(dev, old_state);
+	disable_outputs(dev, state);
 
-	drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
-	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
 
-	crtc_set_mode(dev, old_state);
+	crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
 static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 						struct drm_atomic_state *old_state)

-- 
2.48.0

