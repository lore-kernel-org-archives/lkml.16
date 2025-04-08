Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7552641F5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097667; cv=none; b=Ex9MIp+ZtVVsswbQ9D3yaSIA8oyX8WbcOn1IqkCZgxrRWUaWedRjHBfxBy387FrrO8kyTx12RIRlvLjZrsbRVQXsYkpVtLM1ZewdhO9akjVQQjAXtRxKxAhzcyOocsfA08bD9myCCIxNsiBaLAamBzJqwmDl5gweNcpT+OD4RDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097667; c=relaxed/simple;
	bh=dWe7Fz+nhJsB3QR1kEnLv2yiss8BTbIes6Bs4jDjbNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFsg8GEBfkxTSgbDZPGy66gPVB+XnFMKmcXnNnPioRKKgqSlW/T0tfMo/ZDUl1WIgT1a+EAL061DAylUNGnwl5oAvh/N3KyrEETHzW/+WIDwFOL9hi5nFoW1MG0fkLaflAOnrA6ee9fijVrp2I040LDwLFvUgSumGF/5YbgawSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UoOAfjsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UoOAfjsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3D4C4CEEA;
	Tue,  8 Apr 2025 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097667;
	bh=dWe7Fz+nhJsB3QR1kEnLv2yiss8BTbIes6Bs4jDjbNI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UoOAfjsdM2w0CH240aPIYDb3rS5O76eBW44xynngk7QUfgt4oRHDbGiCO3P9Homru
	 cRV/6z7Nd8oMBgAZ6/7baE6cRCVzbY3OBj5tk2yZXWvFZourDIbQfG1n0d8RC9+1Lk
	 /TaFNSaT78zp6oB/5SYG2nvF/S0sMP7ZakviAhRwCKfdK72qua2OSC/6ni88LUaUKp
	 iF47AQV1LecNHc9TfWsrYnhpn107F7WAjGMNl8L17QjF/ek5QHYgOMz5GuZjBqXc4k
	 VfAf08HrHC+6EDQ7VTlsKnEPoBEYnue40t+p8RmP9ZtfnTKFv+PGY4oqAAXxW+C1Fz
	 S0+g+sU8jwsXA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 08 Apr 2025 09:34:08 +0200
Subject: [PATCH 2/7] drm/tests: modeset: Fix drm_display_mode memory leak
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-2-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dWe7Fz+nhJsB3QR1kEnLv2yiss8BTbIes6Bs4jDjbNI=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLpZfe8822fVS1VGWR4x5pg73OHoT1N+fM5teq3A+/
 ubsznleHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZhI1TuGf9qh/94UTIxT3VTt
 7viVZ31MZEHu9dmrPPtSv5TvS+GcLsrIcNuPnWVZwNr4BoFDR78mzWXO/bC33N131pmC/TNcZmj
 s4QIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_find_dmt() returns a drm_display_mode that needs to be
destroyed later one. The drm_test_pick_cmdline_res_1920_1080_60() test
never does however, which leads to a memory leak.

Let's make sure it's freed.

Closes: https://lore.kernel.org/dri-devel/a7655158a6367ac46194d57f4b7433ef0772a73e.camel@mailbox.org/
Fixes: 8fc0380f6ba7 ("drm/client: Add some tests for drm_connector_pick_cmdline_mode()")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_client_modeset_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_client_modeset_test.c b/drivers/gpu/drm/tests/drm_client_modeset_test.c
index 7516f6cb36e4e3a1ed3a655de6f6a4479a0efade..3e9518d7b8b7eb92f1be3ce376d850cbab638d10 100644
--- a/drivers/gpu/drm/tests/drm_client_modeset_test.c
+++ b/drivers/gpu/drm/tests/drm_client_modeset_test.c
@@ -93,10 +93,13 @@ static void drm_test_pick_cmdline_res_1920_1080_60(struct kunit *test)
 	int ret;
 
 	expected_mode = drm_mode_find_dmt(priv->drm, 1920, 1080, 60, false);
 	KUNIT_ASSERT_NOT_NULL(test, expected_mode);
 
+	ret = drm_kunit_add_mode_destroy_action(test, expected_mode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	KUNIT_ASSERT_TRUE(test,
 			  drm_mode_parse_command_line_for_connector(cmdline,
 								    connector,
 								    cmdline_mode));
 

-- 
2.49.0

