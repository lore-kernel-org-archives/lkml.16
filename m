Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E397251780
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687229; cv=none; b=YfpXyA6C5KDFlNl8GECaWFrBS35x7skiuaFdn8nvCm9323Uk6V2+MzRX7ZNXBAsJ49HWwdaFJfVPTcHk3sNd3lSayrxJq9kmnMXYdtCSzWbQNJlHuDScnC3PMP40DCqrwuHJq6CCUxwzVLqhpoPpkSTcp3+aB1H+x7bnCoIempE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687229; c=relaxed/simple;
	bh=bUeXH/Wwdj4sAGXZMnX8uO5zLm5ZlWDOVT0q62t00aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vp8uIACDb9Uk+3jgKqv+DIVzEfr/Ylr6nRrVLgQrO94xWE7+xexJ11sc/ogUTQ3UKS0T9tKWfVsiVsAZ2koYlDb4rl0DjUKg48pjUw1hreHEr8r+lCxomCeg0Krpb8pWKhFuobF18xyvuUOFzkrIWw5Iya6LmcuSaMuj0rQd4v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2Jg+8bL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2Jg+8bL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38033C4CEE5;
	Thu,  3 Apr 2025 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743687228;
	bh=bUeXH/Wwdj4sAGXZMnX8uO5zLm5ZlWDOVT0q62t00aY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W2Jg+8bLEje7Ib31DEYv5NlcbQ4c29t9zWQ16iXiBvn0k2FbAhJX9SwUBDzxblhz9
	 qDDtuCshshgxbQK719bD5GVjVROMaBwyGk8u2kJzDY8uGmPFOBFhiNjVSAhJ+xzPXw
	 45QfQkrg/CamteDliPtJgBXZGfGig/hiAvubojWOEFuadMT+GIh8chI7hHs2ADtuhE
	 i6YgZXt25gfbWLMgutO/cMHfc6HxcgzOxhTC068nUaXpHwKOoVysTO0p4An3hMBSVT
	 1dmtvbTGb3OmwmTkrUkU3dWjbHga7JcyL1sk/VIAtjLVakGY64Fbl/u7PEAPriNpim
	 qQ2gfeBpBgWZw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 03 Apr 2025 15:33:31 +0200
Subject: [PATCH v2 2/4] drm/vc4: tests: Document output handling functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-drm-vc4-kunit-failures-v2-2-e09195cc8840@kernel.org>
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2286; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bUeXH/Wwdj4sAGXZMnX8uO5zLm5ZlWDOVT0q62t00aY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+gz/HhUKeDzXV2aDuMFiTWXmuq1HHBILhba7a8kUb
 hdt2GDeUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlEBjL80zftCknMs5BYP9n3
 +N79gZuFd2vxRhnHls+x2RYrnMzXzsjwRZzz5ZHUtalzXk4M3PnUhaM6Jat71seM4Ctrjy760bm
 WHQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() are public
but aren't documented. Let's provide the documentation.

In particular, special care should be taken to deal with EDEADLK.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
index f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1..577d9a9563696791632aec614c381a214886bf27 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
@@ -59,10 +59,23 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
 
 static const struct drm_display_mode default_mode = {
 	DRM_SIMPLE_MODE(640, 480, 64, 48)
 };
 
+/**
+ * vc4_mock_atomic_add_output() - Enables an output in a state
+ * @test: The test context object
+ * @state: Atomic state to enable the output in.
+ * @type: Type of the output encoder
+ *
+ * Adds an output CRTC and connector to a state, and enables them.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure. If the error is
+ * EDEADLK, the entire atomic sequence must be restarted. All other
+ * errors are fatal.
+ */
 int vc4_mock_atomic_add_output(struct kunit *test,
 			       struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
 	struct drm_device *drm = state->dev;
@@ -103,10 +116,23 @@ int vc4_mock_atomic_add_output(struct kunit *test,
 	crtc_state->active = true;
 
 	return 0;
 }
 
+/**
+ * vc4_mock_atomic_del_output() - Disables an output in a state
+ * @test: The test context object
+ * @state: Atomic state to disable the output in.
+ * @type: Type of the output encoder
+ *
+ * Adds an output CRTC and connector to a state, and disables them.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure. If the error is
+ * EDEADLK, the entire atomic sequence must be restarted. All other
+ * errors are fatal.
+ */
 int vc4_mock_atomic_del_output(struct kunit *test,
 			       struct drm_atomic_state *state,
 			       enum vc4_encoder_type type)
 {
 	struct drm_device *drm = state->dev;

-- 
2.49.0

