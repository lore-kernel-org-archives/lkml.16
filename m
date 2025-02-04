Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5511F214A60
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681125; cv=none; b=slyYdPboxQFHEBiw6A2P/QQHm3wEbUjVvINrWqv7ahd30iAsGro50cJO/0PBl/4Y7DwrNP5Cp1tHdgZTSZVE5Vy1QP480f/oClCS+EBpWS7ZHQkq8tdrTWr47XFt5iTT3daFRpCBqoxIpl987xGX38ITmuW7j3I98yygNqGMRaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681125; c=relaxed/simple;
	bh=MeUBQEY53V3JEkFy9fuJOULftLLdFPVUgFUElxlS6tA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZSE0+wXr33wJ8AsEJy9ejwIs9MAQs+VJ29Orbj1iCuK1oI26u/QN+e51XMfoT0vzLAarg/ujcX/T3V2kQgwJSunFVQEeazHrKiiuu2essrAe5PM77YYlVuF3mZliv9wQBv3jyW4xkH/0L6gJjw8nOSPANSBFVMDDTjkCr0cy/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBKq90S3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBKq90S3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F2EC4CEDF;
	Tue,  4 Feb 2025 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681124;
	bh=MeUBQEY53V3JEkFy9fuJOULftLLdFPVUgFUElxlS6tA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gBKq90S3mEN50MCjqPEQyu0zWSrcHVIFmyg9W1ru247GWDqDS6tRbX6Hkj1IoE1nj
	 5mzEZq0SjY7towv6408mJYZZOpoziIW+KmVOp9vbjzzUdN0Gr4bgUhV0bk1kGZPO6I
	 NM3GVfdhPeVVBfPKJLUCAC1TbbBI7pUy9inpKWMWHssPS8iMSK/Ai6B8FjrocDf/j1
	 nV9NqxV1CErecaaAHxCn5WXYqdXMk9ni8/Lgtu2n+z0WHaUz5PN0o/+gWHyJ/NBdzl
	 YLpOSN7XNYqaezLcPWEF9e7+zJh5QArHl/zflRo9QYh0JivdpSU4eppu6pxmHte0xN
	 ghtm8nrx0lm8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:35 +0100
Subject: [PATCH v2 07/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_dependencies()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-7-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MeUBQEY53V3JEkFy9fuJOULftLLdFPVUgFUElxlS6tA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtF7LZr661fdcqvdtY6bqpBXq23/9r7SLyfL5s4v/d
 tG91PmSHVNYGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiE04xVuxXa5p65ZRP/d0u
 p4vLLFuV/DUX3+j5XO99M2L3+faD25bcFOnR5V+bdiFh64O+VXezGBveOX64pniw5+StJQ7XGq0
 VVuf8+GXkIdO3MnG5epNrplvmIoWgrj92ItwK1fyau99dbgEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_wait_for_dependencies() waits for all the dependencies
a commit has before going forward with it. It takes the drm_atomic_state
being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 913d94d664d885323ad7e41a6424633c28c787e1..48dc4f18e757549b67940cc5ca4d76812ef13985 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2411,48 +2411,48 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
 
 /**
  * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function waits for all preceding commits that touch the same CRTC as
- * @old_state to both be committed to the hardware (as signalled by
+ * @state to both be committed to the hardware (as signalled by
  * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
  * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
+void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *old_conn_state;
 	int i;
 	long ret;
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		ret = drm_crtc_commit_wait(old_crtc_state->commit);
 		if (ret)
 			drm_err(crtc->dev,
 				"[CRTC:%d:%s] commit wait timed out\n",
 				crtc->base.id, crtc->name);
 	}
 
-	for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
+	for_each_old_connector_in_state(state, conn, old_conn_state, i) {
 		ret = drm_crtc_commit_wait(old_conn_state->commit);
 		if (ret)
 			drm_err(conn->dev,
 				"[CONNECTOR:%d:%s] commit wait timed out\n",
 				conn->base.id, conn->name);
 	}
 
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		ret = drm_crtc_commit_wait(old_plane_state->commit);
 		if (ret)
 			drm_err(plane->dev,
 				"[PLANE:%d:%s] commit wait timed out\n",
 				plane->base.id, plane->name);

-- 
2.48.0

