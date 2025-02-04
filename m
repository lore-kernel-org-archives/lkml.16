Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F528399
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681138; cv=none; b=Fi44M9UPSR6/SI62dln1xROlBLX6LU5ZObm4lHTOA6VYl2IgvGhpMBWh5F9Uo6GHCk+aZAo75oEuOq2YE/jIqeBumqz+zFsFSBIbasm5KhtH065+4FoJYDuQI+Ugd7OtLA/pZkVOg87x8LBTHbqGMHRTIQDn1T4k7HXMvH7oF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681138; c=relaxed/simple;
	bh=u0tZwRYBi8FRt8hfCImUBhbGvy1Wpg7z7MXlXT4YEzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ilcc7yXTOlvYP4+d7VQ0yJDOFwdPP8PBx2NMS6D9conmSd56xSGHmAejekd4UxW2kXwc0zLcrSfInvXYHvum1U5i09GgMM6LWh/YTEKqgMSjjbYF8y23I9KjfYrJtGAHK3H1IrImZjOEVx7XUKqSLJR2lODZv8kCykBKBMpI7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBi8o8qy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBi8o8qy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35CFC4CEE2;
	Tue,  4 Feb 2025 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681138;
	bh=u0tZwRYBi8FRt8hfCImUBhbGvy1Wpg7z7MXlXT4YEzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QBi8o8qy6Luz4OVyRXDFu90gh0UG5ifweuQZcUkUBp1lNwUPIoGg8YuWG1942ITiX
	 pofLK0KdSmnHt/qNu9mlc0fBMe4rHAnMqn7tHvlQb8qzqeN6EQoNm+pzNaMbP0zg5l
	 5B8CGCpmEXY9txjnjnzVY+azXUZcnW32uz8HzEL5t7ANHsdzc97uReQewvjZd4EmLX
	 bSdg3tqHqW0UzPD9xWs2Q/utXbhW/nT9lqNt/0Me7s7gFKIj8pzulPxO5MfyQiFdL7
	 99rJxI9zmMNOPFzSf+36l3ULc2haRy3e11kbskYwWEqsbu4sgf6aEBHbAlpo1ibDRP
	 EW2Sdxcxfntrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:36 +0100
Subject: [PATCH v2 08/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-8-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2624; i=mripard@kernel.org;
 h=from:subject:message-id; bh=u0tZwRYBi8FRt8hfCImUBhbGvy1Wpg7z7MXlXT4YEzs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN6EG79ufiNhtN3lc9dUC/aNmwwnGP1fYuGY9Ktxw
 aXD/rlqHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiB2YzVrMmTqidP/drxvyY
 WS89/ydtjap13LryZ38A+35z4dv9bcJHNMo+C63+pL/nq/ZnjR2SKxirmP5/flnh0yRe2tPFJf5
 +xouCwy8UvqfZcq25lLsifMHCY90bmIO/bw6/m5wxR5A7WmQaAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_commit_tail() is the final part of an atomic commit,
and is given a parameter with the drm_atomic_state being committed.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 48dc4f18e757549b67940cc5ca4d76812ef13985..c80d2ee0247a5316dd103d6178c7fa96eb366c9a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1756,38 +1756,38 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 
 /**
  * drm_atomic_helper_commit_tail - commit atomic update to hardware
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This is the default implementation for the
  * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
  * that do not support runtime_pm or do not need the CRTC to be
  * enabled to perform a commit. Otherwise, see
  * drm_atomic_helper_commit_tail_rpm().
  *
  * Note that the default ordering of how the various stages are called is to
  * match the legacy modeset helper library closest.
  */
-void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_modeset_disables(dev, state);
 
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
+	drm_atomic_helper_commit_planes(dev, state, 0);
 
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables(dev, state);
 
-	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_fake_vblank(state);
 
-	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_commit_hw_done(state);
 
-	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+	drm_atomic_helper_wait_for_vblanks(dev, state);
 
-	drm_atomic_helper_cleanup_planes(dev, old_state);
+	drm_atomic_helper_cleanup_planes(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 
 /**
  * drm_atomic_helper_commit_tail_rpm - commit atomic update to hardware

-- 
2.48.0

