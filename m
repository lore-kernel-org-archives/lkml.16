Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF5217671
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681191; cv=none; b=MfqMktSspm90eZv6jiFbbJRRIe+DB9kEI31BZPJ6cINlibdtOI8oqsLoNvwC9DKmuToJiSy2J4sC/rdES9MpS8LtuX6rEpfzjcQ1aXYTZFxvXWWIyFNL2wNRbJEn4zk0jhdZ8hMmTbHHvHffnw91l7N++SINbOXLgI/okBIW1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681191; c=relaxed/simple;
	bh=81LDedNj3nQakln3lCAqCLzPw6wbO6U1S1Y/G78LC7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRaefbuA+q3wsrgpfcaY+qTtaqQLF5Ww3NUB9kFDkQXkWWX4djwJMD+FHG828u0qSpK6J+piXYrr0I7iinLN06UNqTI6tAy5g66BRyfjPnjqw7XIPYKzgzi7kOalvB93MgN0SJXDSCPzZYcNKtowqOYjYHCuH2ULyg10WqFr4bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yhex3XTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yhex3XTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5847EC4CEDF;
	Tue,  4 Feb 2025 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681191;
	bh=81LDedNj3nQakln3lCAqCLzPw6wbO6U1S1Y/G78LC7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yhex3XTszdQHhFejyvMRVj0udCAQSxM0b7AiB2aVaRhPiOPTXCHtgfHaE5ilOjArO
	 U4LoRnU8XWScOUCEs6/7vx1CnRoYtlghkOovW0s/YA/p8ZHjkRaOnCxfSAFXdiqhsT
	 kFRcq7PCrHAggI6QoXVOg92HZN40LuZtSDAdQtbnwKIswg1Kh073S3reUl0xhFagDz
	 Av4z0X595kkWQsGEIsB7mHG8IVor6tzn7M5X90d7Es+mg8tCx0JSYqNTrCYl6GVusp
	 1DdSyatNS3pDV47CsVq0PcrdTdyuRm4c4WNW6TkWW9Do8HGhyM4PA2l0mm8Bh/qd3r
	 DFs/QM53sF54Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:50 +0100
Subject: [PATCH v2 22/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_hw_done()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-22-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711; i=mripard@kernel.org;
 h=from:subject:message-id; bh=81LDedNj3nQakln3lCAqCLzPw6wbO6U1S1Y/G78LC7Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD5dVE1Z6rFyltpUpZ8Wj+qPbvQR8FIv+qgm9Pkkm
 7rsxV6FjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRKeyMdQonQv4ou/kq6y9v
 mvh64sS3N1Nm3WAvNE34L7rmlrSJQ/ihB5E7TAVPJSxkCpIM+m7Mythw9p+ZVt7jvY2LTn5snVg
 kGFe4YFX+udbfvCXqUf/0tmiaOj7hvR6cw9m26XU0t/yC5MsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_atomic_helper_commit_hw_done() signals hardware completion of a
given commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 78bc540158b7c64129eb728d8f8d67a6797bd0b3..8541faf6a86c51074cd5d36996814e899382ae11 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2501,11 +2501,11 @@ void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
 
 /**
  * drm_atomic_helper_commit_hw_done - setup possible nonblocking commit
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function is used to signal completion of the hardware commit step. After
  * this step the driver is not allowed to read or change any permanent software
  * or hardware modeset state. The only exception is state protected by other
  * means than &drm_modeset_lock locks.
@@ -2514,18 +2514,18 @@ EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
  * this function is called.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc_commit *commit;
 	int i;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		commit = new_crtc_state->commit;
 		if (!commit)
 			continue;
 
 		/*
@@ -2541,13 +2541,13 @@ void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *old_state)
 		/* backend must have consumed any event by now */
 		WARN_ON(new_crtc_state->event);
 		complete_all(&commit->hw_done);
 	}
 
-	if (old_state->fake_commit) {
-		complete_all(&old_state->fake_commit->hw_done);
-		complete_all(&old_state->fake_commit->flip_done);
+	if (state->fake_commit) {
+		complete_all(&state->fake_commit->hw_done);
+		complete_all(&state->fake_commit->flip_done);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_hw_done);
 
 /**

-- 
2.48.0

