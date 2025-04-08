Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D315B263C91
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097664; cv=none; b=LwKNYfEUkjIZdGFC78/Zud/CAvCazuJVMlZ17UBRGUoQk3HIpZYV1RhHhHQN1f6LAJkIz7BiMaUD0gBnfcUK/PfmqjgX52QV4rNNelr64IaP5+eXf9kaGdZSHCNgAARtf6TlxRhBrFFy/g8T+DxIrbTH0c+KU9q+KCIulPWkSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097664; c=relaxed/simple;
	bh=T2L/jwqbXEm6QSAc1uHVXlkQ9aAbFLh15AGe7Va8SrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCh5PiLJDuBWOF5ozSVMB0hUup+c3sCaA6KN/SalRI2gGamUU1p5MBPz1RrNQx6MiDWqAWEBCqWHOKndg7kz8bT+PELsrEGFCGzPwG2wEYEALOic0T99QjwPOKzksHoQhin8AKQ+JnYCK/1iLNb6muqE8Fv39pnZBRwZfWrwuPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqzQPCux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqzQPCux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07653C4CEEA;
	Tue,  8 Apr 2025 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097664;
	bh=T2L/jwqbXEm6QSAc1uHVXlkQ9aAbFLh15AGe7Va8SrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uqzQPCuxq31Yt1QiPsUo+LApWRsH9N/OiAYMjWyBAKzl2luEjZe+FiIaU5B85Q6V2
	 2NBBHwtofgdQFsbISAEHX1+77SGVNAjcz59EaOP5jkTDO3dlYfKdjw8fievtV/wHY7
	 lmJIzq7VpeL/TNycn7MOt0A+mkN1YAwHGTU9FChxFpxDBgiJxkDyr2x2RF5G/wAwGI
	 m50pCValPKfftHTdWSkJxrUdXk1IFIpiqJCPyA16Jjq4/lCMzfhggzmYugYtw+Xpa+
	 vn4sZh3xVhQdwGMhun7PpF2HiMM2LEw4f/a9prpQ0lt4C4oQe2NB3EuPfJBcz8eIEo
	 l+UXQVHgDgCSA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:07 +0200
Subject: [PATCH 1/7] drm/tests: helpers: Create kunit helper to destroy a
 drm_display_mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-1-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698; i=mripard@kernel.org;
 h=from:subject:message-id; bh=T2L/jwqbXEm6QSAc1uHVXlkQ9aAbFLh15AGe7Va8SrU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLpapHjI9eae2yneqavzNE3xrjHcdnnj47PEjanOXm
 kxV9Tlv2VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJKDAx/HfRC8riOXvwdmnb
 FC2Zq8/XxV95kpCXsPHGxQ07Yg56bnVjZJje9cujadbukFtNzK3H+73CZ663y+J2KkrwWfqoW+5
 lNicA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A number of test suites call functions that expect the returned
drm_display_mode to be destroyed eventually.

However, none of the tests called drm_mode_destroy, which results in a
memory leak.

Since drm_mode_destroy takes two pointers as argument, we can't use a
kunit wrapper. Let's just create a helper every test suite can use.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 23 +++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h           |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index a4eb68f0decca15988105b9d58266e3871934a8b..7f540f9e4d98cc507e51b486edb99177a23011d1 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -276,10 +276,33 @@ static void kunit_action_drm_mode_destroy(void *ptr)
 	struct drm_display_mode *mode = ptr;
 
 	drm_mode_destroy(NULL, mode);
 }
 
+/**
+ * drm_kunit_add_mode_destroy_action() - Add a drm_destroy_mode kunit action
+ * @test: The test context object
+ * @mode: The drm_display_mode to destroy eventually
+ *
+ * Registers a kunit action that will destroy the drm_display_mode at
+ * the end of the test.
+ *
+ * If an error occurs, the drm_display_mode will be destroyed.
+ *
+ * Returns:
+ * 0 on success, an error code otherwise.
+ */
+int drm_kunit_add_mode_destroy_action(struct kunit *test,
+				      struct drm_display_mode *mode)
+{
+
+	return kunit_add_action_or_reset(test,
+					 kunit_action_drm_mode_destroy,
+					 mode);
+}
+EXPORT_SYMBOL_GPL(drm_kunit_add_mode_destroy_action);
+
 /**
  * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC for a KUnit test
  * @test: The test context object
  * @dev: DRM device
  * @video_code: CEA VIC of the mode
diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 11d59ce0bac0bbec07ae5f07ed9710cf01d73f09..1c62d1d4458cae3a6883a0daaf42b8431c4a213a 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -116,10 +116,13 @@ drm_kunit_helper_create_crtc(struct kunit *test,
 			     struct drm_plane *primary,
 			     struct drm_plane *cursor,
 			     const struct drm_crtc_funcs *funcs,
 			     const struct drm_crtc_helper_funcs *helper_funcs);
 
+int drm_kunit_add_mode_destroy_action(struct kunit *test,
+				      struct drm_display_mode *mode);
+
 struct drm_display_mode *
 drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device *dev,
 				    u8 video_code);
 
 #endif // DRM_KUNIT_HELPERS_H_

-- 
2.49.0

