Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4DF21773F
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681225; cv=none; b=P0PI04zxtSURQHEVZsIS8p411E0adljuh5umAaqXHpFaLRnMGMedS51VH5WgQ2moQdErvks7lm+/LB6C5C2lfpb0mgh3cWjHKUMr3WvRpfttY9MIaugqjoe9i5qcT4Y1RFqlBvlwfleh8FZ72ij+N3wzhv/98HnAmuZYzyclrV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681225; c=relaxed/simple;
	bh=LUUfe0/tQUBKcJgTX1kVgZh5mbxlmWonqQxU5/h2CSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kz0Uc/nt00z8BCGEp+T+Xpmg4ml9ecmiy7Nxyu1Iblkkjm5TDxypxRNhwXj9uksF+KXdMF5KT0YPeEHeZ0FlsQ/DzJG2l5qwVI5C491z9KNTYLzAFSbKFkHDa9B/XoLi+lokSgcejeKhBBWnECT4GfblhHjXSl2FqdW3K6+v3Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDOKuFkK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDOKuFkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E57EC4CEDF;
	Tue,  4 Feb 2025 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681225;
	bh=LUUfe0/tQUBKcJgTX1kVgZh5mbxlmWonqQxU5/h2CSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pDOKuFkK1JbW36QWH+9O7NvkVqTKLL4XpUsf/8AloHy5Wj1i8InQz2txfgOEdEmwK
	 Tpeh95mcL1EyHiZoWPGSH9vfzz8Ty/BrauPBsbnDMawpcufH+cDYi318zQ7QKqAOx1
	 LvYbDikbxU2S7+q+eZj1Pwz+60d978AcuOFRQQVilhLTKCDtuef1aMzpe/FnajZe20
	 6XcLCtXJPzaUvr2nfyoVUMDpxxtQRSQ0SwndXMaKuzo7sYeWEslFizh0GqmFHhAgEi
	 n3r/fkIrKIhobuCfzyDiTUYeiZOKV4IdrUWYHb+0HjVcyQiEpdd8x1AAg6nfckIzaa
	 Z3+gdYBbbRffQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:54 +0100
Subject: [PATCH v2 26/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_flip_done()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-26-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LUUfe0/tQUBKcJgTX1kVgZh5mbxlmWonqQxU5/h2CSE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL7kuG73vD/jy4yPn2caS6z4aXhqTpmg4KO5pzbKW
 s+8mtGyt2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5OMvxjrTeZKNMpE/p1/c
 bLqt6K0Z33QPrlUsz5pTHB7+7Zk845PjTNONZ5gy7LczTV1+oNYzUJyx4cm3wFzduNJdU5lXrTX
 y2l11pXr/kmlrpzy8LdhlsvjF+kCFZqYbl85M4Wb7sLlN1ioqEQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_wait_for_flip_done() will wait for pages flips on all
CRTCs affected by a given commit. It takes the drm_atomic_state being
committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index baa32b10c4a08252b736927fedd36c3fccbe6020..cb24e590a39f80c0cc5feb8b6a9a4fd41a651211 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1716,11 +1716,11 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
 
 /**
  * drm_atomic_helper_wait_for_flip_done - wait for all page flips to be done
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * Helper to, after atomic commit, wait for page flips on all affected
  * crtcs (ie. before cleaning up old framebuffers using
  * drm_atomic_helper_cleanup_planes()). Compared to
  * drm_atomic_helper_wait_for_vblanks() this waits for the completion on all
@@ -1729,32 +1729,32 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_vblanks);
  *
  * This requires that drivers use the nonblocking commit tracking support
  * initialized using drm_atomic_helper_setup_commit().
  */
 void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
-					  struct drm_atomic_state *old_state)
+					  struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	int i;
 
 	for (i = 0; i < dev->mode_config.num_crtc; i++) {
-		struct drm_crtc_commit *commit = old_state->crtcs[i].commit;
+		struct drm_crtc_commit *commit = state->crtcs[i].commit;
 		int ret;
 
-		crtc = old_state->crtcs[i].ptr;
+		crtc = state->crtcs[i].ptr;
 
 		if (!crtc || !commit)
 			continue;
 
 		ret = wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
 		if (ret == 0)
 			drm_err(dev, "[CRTC:%d:%s] flip_done timed out\n",
 				crtc->base.id, crtc->name);
 	}
 
-	if (old_state->fake_commit)
-		complete_all(&old_state->fake_commit->flip_done);
+	if (state->fake_commit)
+		complete_all(&state->fake_commit->flip_done);
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 
 /**
  * drm_atomic_helper_commit_tail - commit atomic update to hardware

-- 
2.48.0

