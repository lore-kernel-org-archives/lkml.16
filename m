Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601B2C190
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681223; cv=none; b=MiitCJmgSlpS3r1I5UEnHPwzWPQJC50KR1APF1ehEq5CRBw0slnitYXilaggB+x/lmlswoILvfkvhxqJIqGG3E5ObxChSO+0HOiQhVR3cxW/pEPx3LTkiwFfEWPRpGd8RnunyxquxlSvJU57Ct6MjDdpgxjenINNoPKF2t89kKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681223; c=relaxed/simple;
	bh=wxVd7lUoXb1oyitPcmQJ0FDC/MvQ+LB6wONJbQIr0L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCHUbG+ZGjc5xduKLghfBSvztzD6thSlHR29BErzeddIhbue2w4jXF581Yp37Vkqx7jIO8OyzqKXzeLJMdfpr64K2q0Fd1F+bsnY+zbrFK9qhrNb7LV/gOqkZvsuXHH08Ry3M4I7AlI12xzpetX8AIazAw9R6H4vbuJhodHXXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tzwh4Yrb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tzwh4Yrb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245A8C4CEDF;
	Tue,  4 Feb 2025 15:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681222;
	bh=wxVd7lUoXb1oyitPcmQJ0FDC/MvQ+LB6wONJbQIr0L0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tzwh4Yrb1fdLH/8AvatYQadNTgaIQ/JgZJTSvIkSf5trO03CZ7wtlJ5ZC16Hq57KU
	 kXAzw4nkpjVqC5dryG9oYa4d4HvbRe6RgPuaFSXKJ/+BSgNds2Wc5/yfFJF5WFnDlu
	 bT8v+AtnGIOw27pfx7snb/XXDDhVEFOAN6/1ItC8HeMNiBcPKK2K2wc1dpLPxw4C1H
	 N1U9qZgcglUkW4tQjrGGtg/OGqX23PksQz7iIhCITCT9rfn+OvMfccbkdkn7CL0W2H
	 4HT3U7o+fTt4G8P8MtwlKo/b9VvFGqgYoG56ZfOEyYuKWFibH7854PfJUwh2rwzT8c
	 BUknX2vB1Z6QA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:53 +0100
Subject: [PATCH v2 25/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_cleanup_done()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-25-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2632; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wxVd7lUoXb1oyitPcmQJ0FDC/MvQ+LB6wONJbQIr0L0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL5MPVz87vrdGVdfW2TFnjxdqmb8coqniLfj9YyuY
 K7ryY4pHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiZsqM9Yk9xxcY/FVO/sw0
 u+1Jf0hmkGTfM+1rnM/iHNJTLjfFJxaby7aX9vw8Mf3oxLsXvof9Z2z48ur0/TX3ph08v5/lQG/
 9Iq3lAjKHBX9wfo29/Xvvw2tvuxJl5j9czrs0vvrKvr7ppmLhAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_wait_for_dependencies() is the final part of a commit
and signals it completion. It takes the drm_atomic_state being committed
as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 3e6c5992fed09f5962e74844d360193c53915c88..baa32b10c4a08252b736927fedd36c3fccbe6020 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2550,27 +2550,27 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_hw_done);
 
 /**
  * drm_atomic_helper_commit_cleanup_done - signal completion of commit
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
- * This signals completion of the atomic update @old_state, including any
+ * This signals completion of the atomic update @state, including any
  * cleanup work. If used, it must be called right before calling
  * drm_atomic_state_put().
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_crtc_commit *commit;
 	int i;
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		commit = old_crtc_state->commit;
 		if (WARN_ON(!commit))
 			continue;
 
 		complete_all(&commit->cleanup_done);
@@ -2579,13 +2579,13 @@ void drm_atomic_helper_commit_cleanup_done(struct drm_atomic_state *old_state)
 		spin_lock(&crtc->commit_lock);
 		list_del(&commit->commit_entry);
 		spin_unlock(&crtc->commit_lock);
 	}
 
-	if (old_state->fake_commit) {
-		complete_all(&old_state->fake_commit->cleanup_done);
-		WARN_ON(!try_wait_for_completion(&old_state->fake_commit->hw_done));
+	if (state->fake_commit) {
+		complete_all(&state->fake_commit->cleanup_done);
+		WARN_ON(!try_wait_for_completion(&state->fake_commit->hw_done));
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_cleanup_done);
 
 /**

-- 
2.48.0

