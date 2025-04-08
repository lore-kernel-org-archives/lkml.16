Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4126461E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097673; cv=none; b=N+06YAP+DnVbHCr5dUE4ErL03OmplmC0f6hb4ZVkulzpput0raxKFpdCQnjI2D9OkDinlfQno2oLTWeywqOlS2Btta/JEXEJ5LhSh+0mlIYOoKzMrRrk5t0/LPHfhwPejehwQ3CS0xcclTxeKNBNJzO6SDGJ3OSLjZGY9lJQb8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097673; c=relaxed/simple;
	bh=F3ezxU5SGoiD8ddVs6HKsPqrpZe4wJCeXDRAqLCrgfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4n6kKpydwPrW+eKITVaUk1yW8W4qNFrXa0p98gyWnyVs6/zefStLPXQGRit//DXEVwqr7aMa/M9yUD7tcwjmO7LoVkyF0rCSI/OkdwZxe1cQrakU9yE7Rp1ByNoDPh5M7n0ZUc8+2CojxH3DBRnIIErVTvoVhbwoN5q3TKGmQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy0vGJzC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy0vGJzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58274C4CEEA;
	Tue,  8 Apr 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097672;
	bh=F3ezxU5SGoiD8ddVs6HKsPqrpZe4wJCeXDRAqLCrgfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gy0vGJzC/pEAbHi72fmc/r6c6bIAohnAiPm+1QhM8tia49diFhfTHdkiweferQA99
	 lPhNmf1xAMHtcoJ+9LZIQot38+uuf9yC89Tv2hbli2PlkEcUoNHTHf55SgxgKVm8Y+
	 ZHokJjpdeWbwX0KTXvFxRBJ9nt6QP78z0U0Qp3jBVKu/oQISiIoaQekER0BklOeVFO
	 /TZbTNQkAYXMxxNVPISMBP8+utPAZCvqHn8RlE2oTFv2KHw9Oneh+KxEBxAgZU5tQv
	 Tuy/U/bjJyA01AW3EH4a4WsAp1SoK9pMZdA4AsK+16QNFGU0LKAc4AGHVfh1DinN31
	 7oZhsQtfTIdrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:10 +0200
Subject: [PATCH 4/7] drm/tests: cmdline: Fix drm_display_mode memory leak
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-4-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=mripard@kernel.org;
 h=from:subject:message-id; bh=F3ezxU5SGoiD8ddVs6HKsPqrpZe4wJCeXDRAqLCrgfE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLlaI/Io94ij+L+3p8qlxSfMiVZb8Ocm/8nj9Br6wy
 TdvMaeGdJSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAifhGMDK9THM2LM8+auAq+
 qd7altqqzxO084wxT+NL7zkOcr8V9jEy3Eq6eZ+xMc9w/tEbs7MP1HBE7avI+Nd+7HtAyLSdomt
 TGQE=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_analog_tv_mode() and its variants return a drm_display_mode that
needs to be destroyed later one. The drm_test_cmdline_tv_options() test
never does however, which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: e691c9992ae1 ("drm/modes: Introduce the tv_mode property as a command-line option")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
index 59c8408c453c2ef8f18c7c887b0405418e9e1f99..1cfcb597b088b4d159a5fb10a309338cb73abbe9 100644
--- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
+++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
@@ -5,10 +5,11 @@
  */
 
 #include <kunit/test.h>
 
 #include <drm/drm_connector.h>
+#include <drm/drm_kunit_helpers.h>
 #include <drm/drm_modes.h>
 
 static const struct drm_connector no_connector = {};
 
 static void drm_test_cmdline_force_e_only(struct kunit *test)
@@ -953,12 +954,19 @@ struct drm_cmdline_tv_option_test {
 };
 
 static void drm_test_cmdline_tv_options(struct kunit *test)
 {
 	const struct drm_cmdline_tv_option_test *params = test->param_value;
-	const struct drm_display_mode *expected_mode = params->mode_fn(NULL);
+	struct drm_display_mode *expected_mode;
 	struct drm_cmdline_mode mode = { };
+	int ret;
+
+	expected_mode = params->mode_fn(NULL);
+	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
+
+	ret = drm_kunit_add_mode_destroy_action(test, expected_mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_TRUE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
 									  &no_connector, &mode));
 	KUNIT_EXPECT_TRUE(test, mode.specified);
 	KUNIT_EXPECT_EQ(test, mode.xres, expected_mode->hdisplay);

-- 
2.49.0

