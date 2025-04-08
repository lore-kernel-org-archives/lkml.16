Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F29264A6D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097678; cv=none; b=LJldu2BPQ1kBmAne07Ya0KlFN7yVrcAdLd+1MuKAueJM1VZfKb3+urYH10T2z4wNpK2cFDuEBmtNV9od2vAhcBL4D041ppXNC1Drr6JhdFo9G9mOH74Er4veZ2dwuBjuutUNVwpM6XW/xmV/RM+6Us8y4BV0V8fqjHEGm1F5haU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097678; c=relaxed/simple;
	bh=/Wbv6r/x71/9TjKPjY3ITwX7nItTXEXLOZ+jDR5+yns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wkt0HK8pdmPEFOdXBxrzqvExd5Oh7QjtsBy2cQ11EhOMSJa0QkaKXtPs10on5OBy51+TO0XTq9nXpZ50XLqjA8bpO7Y8c7Z3rP1X5cyyV8t5g/KZsgja5vXK3xCU+x2sZC6YU9z/M17ZrZm5KTKwluFhOQYq0gKKR2a70LnKaHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5+G5drY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5+G5drY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3980C4CEEA;
	Tue,  8 Apr 2025 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097678;
	bh=/Wbv6r/x71/9TjKPjY3ITwX7nItTXEXLOZ+jDR5+yns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o5+G5drYWrGfZe6gBC97ttkONB4VkJaP87qX5ZoAxAEWIeeBwBku5h96sMrNfd9LN
	 4c1lGHccW5NSfsGkXx7HI/OfDqNx2tSUPSyN6LWt6AY57Ia4gXnq5lmQ0kQB2WtqO9
	 VY0UPpeKQ83TER4FwkP0EsfhaqelxafAq9ExQIzlUSEGSQBzxFaBe8oPVQzwNJp+ZC
	 Xrcn7Ft0P7cqmY9N9DE4XHBVw9i6WS4yWiHDtnu+9nactdhfsDObcT/MU4uCNA8zP1
	 BxcxHFxlrP8mZLeDpQSoi5MHtF0c5onYTDGWaDcVAjN37LxjCeidjeZPHl5j/jobQS
	 JOn5WT/sXbbtQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:12 +0200
Subject: [PATCH 6/7] drm/tests: modes: Fix drm_display_mode memory leak
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-6-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=mripard@kernel.org;
 h=from:subject:message-id; bh=/Wbv6r/x71/9TjKPjY3ITwX7nItTXEXLOZ+jDR5+yns=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLlauiZ539Z4mHztL1ncFv5h3OwNDKi+sdg/T/27+N
 ODQkXCmjlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAExEWo7hn96N+OJi3t1FOdt3
 zRMovNZsZV8Q/v230KnPC3Ry7y4L/srIcPbwlcSo0k8ntn7T3HGgvbnp3Wl9WcsCtgb2olUa369
 E8wEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_analog_tv_mode() and its variants return a drm_display_mode that
needs to be destroyed later one. The
drm_test_modes_analog_tv_mono_576i() test never does however, which
leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: e31538489908 ("drm/tests: Add tests for the new Monochrome value of tv_mode")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_modes_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
index 7ba646d87856f52f99b0f9bcfed0c31d848c798d..f5b20f92df8be73ad9ef46aedae8b855e637e4dd 100644
--- a/drivers/gpu/drm/tests/drm_modes_test.c
+++ b/drivers/gpu/drm/tests/drm_modes_test.c
@@ -154,17 +154,21 @@ static void drm_test_modes_analog_tv_pal_576i_inlined(struct kunit *test)
 
 static void drm_test_modes_analog_tv_mono_576i(struct kunit *test)
 {
 	struct drm_test_modes_priv *priv = test->priv;
 	struct drm_display_mode *mode;
+	int ret;
 
 	mode = drm_analog_tv_mode(priv->drm,
 				  DRM_MODE_TV_MODE_MONOCHROME,
 				  13500 * HZ_PER_KHZ, 720, 576,
 				  true);
 	KUNIT_ASSERT_NOT_NULL(test, mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
 	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
 
 	/* BT.601 defines hsync_start at 732 for 576i */
 	KUNIT_EXPECT_EQ(test, mode->hsync_start, 732);

-- 
2.49.0

