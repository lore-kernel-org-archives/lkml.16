Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7912153C0
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681141; cv=none; b=oe0N066lraGWJlDEVI/nAkHu7wicTHND17L/iDVoHPpPSd+PDsDp5uGR3J+AulycoMKScg2QdC6HepGVR6rB4i1TKQyjKIQqCMxSVEmOPO8oA1w0Cqj3fMVpUBE9ijwHlQO8gaQhH9uPhDzV6fvaaC1/O/nPd0joy71Ooc/tdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681141; c=relaxed/simple;
	bh=Ycz8KszU5PhE6Y06PY1gRYTNUqmaJHlgy7DhraBLhtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUHBR3zBYOGnNaG/MXvxbf/E2qkfPC7vJRNNNqcGFBzqZjvNh819teGY4Xa3asz59uKV93IFwbtxHwd7FJ+Oclw6fWWmQAn5LeuNOlMnZgobmHsNszrpxmWSHHg/+M9hgqd5BLmKE+OL36SvtR/5BKDoz113qlZGzIEKGHx77Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mA2oNx9R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mA2oNx9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFF1C4CEDF;
	Tue,  4 Feb 2025 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681141;
	bh=Ycz8KszU5PhE6Y06PY1gRYTNUqmaJHlgy7DhraBLhtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mA2oNx9RnZhykWrDK3Scgh0mBKlkWA7Wqc7o5e5ytvJdXmCmpV1NV14Xpf+WTO2Xd
	 z/51t56tPXnAomZi4s2KKcfWBnOhAu1dT+j4aCtm+M2D9LIfCqQhFG7Y+VtmDX8/+9
	 Pfum0xO4fZQLNMAIMdq6tpsIX9FvuWSvKP87EOlr9nP58AWcuGUHXf/Ym+fMozWxTF
	 9I9flEwjeW+O6B20thXRT/sajlBfqPOecpP5JZSZ8mxd74g8N40QpcppyHfgPrwibk
	 aSXxIvR+6rDUN1YWh4jyCyAEWCAcZ8q2uuXfliZVxnOvwFY5Y8YoLPhqH1x0L49poY
	 pUfesxXhcsH2g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:37 +0100
Subject: [PATCH v2 09/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail_rpm()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-9-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ycz8KszU5PhE6Y06PY1gRYTNUqmaJHlgy7DhraBLhtk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN5s3fGfY6fPoy/ss61PJ56K95tu5u4kHn6mIM0xu
 v5MUsmFjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR5qeM9d59MRe5uj5J6KhV
 WVcWrdHz5zjvl62hsO9pWm3l7Lbmgi/lcQmxVoe8i0/PU7He+FeQseHyv0nOzLsfcWmeXF9w4Zg
 OF3Nv23O7Q+anxbqFi4sfZFkbNXfkscydWXRZ4De/uJW6PgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_commit_tail_rpm() is the final part of an atomic
commit, and is given the state being committed as a parameter.

However, that parameter is named old_state, but documented as the "new
modeset state" which is all super confusing.

Let's rename that parameter to state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c80d2ee0247a5316dd103d6178c7fa96eb366c9a..cb08fda752c65d6d0c4388bb4bf7054e74a053a8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1789,36 +1789,36 @@ void drm_atomic_helper_commit_tail(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 
 /**
  * drm_atomic_helper_commit_tail_rpm - commit atomic update to hardware
- * @old_state: new modeset state to be committed
+ * @state: new modeset state to be committed
  *
  * This is an alternative implementation for the
  * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
  * that support runtime_pm or need the CRTC to be enabled to perform a
  * commit. Otherwise, one should use the default implementation
  * drm_atomic_helper_commit_tail().
  */
-void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_modeset_disables(dev, state);
 
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables(dev, state);
 
-	drm_atomic_helper_commit_planes(dev, old_state,
+	drm_atomic_helper_commit_planes(dev, state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 
-	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_fake_vblank(state);
 
-	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_commit_hw_done(state);
 
-	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+	drm_atomic_helper_wait_for_vblanks(dev, state);
 
-	drm_atomic_helper_cleanup_planes(dev, old_state);
+	drm_atomic_helper_cleanup_planes(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
 static void commit_tail(struct drm_atomic_state *state)
 {

-- 
2.48.0

