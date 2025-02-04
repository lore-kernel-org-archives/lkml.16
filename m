Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025EA2144B1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681122; cv=none; b=nSZO/iAxOflbBKuw7rd9e31xpA27wV24yxXeL3XvgCec7IztqVlv+Ts3yD1vM0T6oiNS2a4ubIS+uMAg8znAI2LCjGCC2dyt3zMlMgr8bM8uTk7O/rLA61eZnI7V+0VL0YYOyeeb6vxocLFJ3sLKNWGSaqcw8w+pgxY9qQyCwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681122; c=relaxed/simple;
	bh=bxLbHr5DLfkiQAaqRYdpFNHcQLyeBrrYDmdbJoZzuDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q8A3Jfs6GYcCLV3xJWyyu+x1k+XOB1PQUe1YHBXtZsUYKaKA0sVO2Jts52WsiLXHmKwrUQ8cUI7/a4yFpw7wqw2kyv869b5AVK1H2LjL6gcgwxfxB712GYedbeYixmV6q4ZI9OZWUg3slVmNJJ9idBiwanTGPTmgMWoWyYQROKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkUUJSG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkUUJSG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D5AC4CEDF;
	Tue,  4 Feb 2025 14:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681121;
	bh=bxLbHr5DLfkiQAaqRYdpFNHcQLyeBrrYDmdbJoZzuDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gkUUJSG+yl2psM9tMdg7EACTNDvRdiXzyZKBBZiY7mKdM7BUiUz2DDP35iB/sKYc5
	 0f01SvaIMrhX8G2qqc9prAvdbgnd1V4RqkpWAHJTaAUauY+cJTqnLVYwHorx+ubWpV
	 m1MvTMapwumN8/V57fg4PYK3oO/xfzcbyelxInKKKabx6UA6O2rslCNopJwcW+I1jF
	 2DFae2smVNVFC+V6+GuMvIQ8M0Pck0zOLsdVM2sdVtsV5v0NMt7oIcdiYeRSXTOQMW
	 KDgPjEIUES5IubXG9auS32R6ughZR0kGqQnReRSG7nxZawo8kmC6b/KPiGu4OO21ht
	 x/4dOXYDFsFgQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:34 +0100
Subject: [PATCH v2 06/35] drm/atomic-helper: Fix commit_tail state variable
 name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-6-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3025; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bxLbHr5DLfkiQAaqRYdpFNHcQLyeBrrYDmdbJoZzuDE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtF5/nmIy25vNtWWWOtfyrgNbs9z/2akmr0jR/Cbra
 Nntani3YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk8T3GhlexN/9NTL5/sLGr
 zv85/71zre2zE1MFWpm+H13TJr/u/IHneQvP1z6Iy/+s5KU2ffuOI4wNE8U//O5ZXVBXfvqyVb7
 kDXkphbX9rNuVTxvu/3LUf+X/WI9b1sba+6avsV37rGnRzL0LAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Even though the commit_tail () drm_atomic_state parameter is called
old_state, it's actually the state being committed which is confusing.

It's even more confusing since the atomic_commit_tail hook being called
by commit_tail() parameter is called state.

Let's rename the variable from old_state to state to make it less
confusing.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 40e4e1b6c9110677c1c4981eeb15dc93966f4cf6..913d94d664d885323ad7e41a6424633c28c787e1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1818,13 +1818,13 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
-static void commit_tail(struct drm_atomic_state *old_state)
+static void commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 	const struct drm_mode_config_helper_funcs *funcs;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_crtc *crtc;
 	ktime_t start;
 	s64 commit_time_ms;
@@ -1842,37 +1842,37 @@ static void commit_tail(struct drm_atomic_state *old_state)
 	 * These times will be averaged out in the self refresh helpers to avoid
 	 * overreacting over one outlier frame
 	 */
 	start = ktime_get();
 
-	drm_atomic_helper_wait_for_fences(dev, old_state, false);
+	drm_atomic_helper_wait_for_fences(dev, state, false);
 
-	drm_atomic_helper_wait_for_dependencies(old_state);
+	drm_atomic_helper_wait_for_dependencies(state);
 
 	/*
 	 * We cannot safely access new_crtc_state after
 	 * drm_atomic_helper_commit_hw_done() so figure out which crtc's have
 	 * self-refresh active beforehand:
 	 */
-	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i)
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
 		if (new_crtc_state->self_refresh_active)
 			new_self_refresh_mask |= BIT(i);
 
 	if (funcs && funcs->atomic_commit_tail)
-		funcs->atomic_commit_tail(old_state);
+		funcs->atomic_commit_tail(state);
 	else
-		drm_atomic_helper_commit_tail(old_state);
+		drm_atomic_helper_commit_tail(state);
 
 	commit_time_ms = ktime_ms_delta(ktime_get(), start);
 	if (commit_time_ms > 0)
-		drm_self_refresh_helper_update_avg_times(old_state,
+		drm_self_refresh_helper_update_avg_times(state,
 						 (unsigned long)commit_time_ms,
 						 new_self_refresh_mask);
 
-	drm_atomic_helper_commit_cleanup_done(old_state);
+	drm_atomic_helper_commit_cleanup_done(state);
 
-	drm_atomic_state_put(old_state);
+	drm_atomic_state_put(state);
 }
 
 static void commit_work(struct work_struct *work)
 {
 	struct drm_atomic_state *state = container_of(work,

-- 
2.48.0

