Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991A215F53
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120592; cv=none; b=leKbV2nj6PxqIDfgXzqyhppqDJf8nQvcGXGcwpdOk7LMOvs5+mV6Q8FTEBPdQu9G7JgSIi2X20OM5N1k26R2geg1ADLhmdL7qtO7ldpam0VF030sfxocetucc5yjcZ67oR815/AzzyW6Ui2i0S7SIV39rToaOJZth42OhYOjdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120592; c=relaxed/simple;
	bh=pd0DP6kng5GcWSShQyiaIvgUBhaEPLWmfJ4sGXeKgy4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d1gEkEU2dlYZjpYmLccU3Y55qGrhiurPBNh0mgYClS3aP5O9junbpenI6OWasU2iiDcYTzYx5Bco94ZHyukiBZiNpDUN1UagkTogvWIkwSqa5wJhT3y9ejaYgSBQsNkY0YKXt5ODBd/Cwey0+I534F+OGxlPbSNZUeJb/rV2GEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/FEMnV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/FEMnV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8313C4CEEA;
	Sat, 28 Jun 2025 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751120591;
	bh=pd0DP6kng5GcWSShQyiaIvgUBhaEPLWmfJ4sGXeKgy4=;
	h=From:To:Cc:Subject:Date:From;
	b=j/FEMnV8Mm5qqD3TwTTmuK9Hd2diNS8HWnAtBPW4sj54dV6lf9EnsxZvWt6I2hR6r
	 I875Lc9jDR+DnJJqgYm1GwJEXWRe9wfLrJT9ynH1iRTmVcOLvGqEao2byS5H5fZ4bW
	 xevpV3F3xT36n1tT3Uti4uXV38eDQ9dUODGDGjZx5u7uuvn7JOk1Ox5fg5sjGriXvR
	 /L6uGDCeYQ1+rUIvOk0pxLFqAspbbjQP2Cz+jHj2NDUyHXDvh6YYTeF484gH8kiSA8
	 f0blT+I/wz0mPB9M1l8d7BIeG5M5iiUhbhBEJi9qP3MZqFAGT3EkZzyoqKRHnwf89y
	 2WqqrPvQjxBow==
From: Sasha Levin <sashal@kernel.org>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] drm/tests: Initialize framebuffer's filp_head in drm_test_framebuffer_free()
Date: Sat, 28 Jun 2025 10:23:08 -0400
Message-Id: <20250628142308.903037-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_test_framebuffer_free() test creates a framebuffer on the stack
without properly initializing the filp_head list, causing the following
warning when drm_framebuffer_free() checks it:

[  144.996969] drm-kunit-mock-device drm_test_framebuffer_free.drm-kunit-mock-device: [drm] drm_WARN_ON(\!list_empty(&fb->filp_head))
[  144.997097] WARNING: CPU: 0 PID: 2546 at drivers/gpu/drm/drm_framebuffer.c:832 drm_framebuffer_free+0x13f/0x1c0

The test intentionally creates a partially initialized framebuffer
to test an edge case in drm_framebuffer_free(), but it needs to
initialize the filp_head list to avoid triggering the warning on
uninitialized list data.

Initialize the filp_head list in the test to match the behavior of
drm_framebuffer_init().

Fixes: d21942560499 ("drm/tests: Add test for drm_framebuffer_free()")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index 6ea04cc8f3241..81a7f2cfb8ed6 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -677,6 +677,7 @@ static void drm_test_framebuffer_free(struct kunit *test)
 	};
 	int id, ret;
 
+	INIT_LIST_HEAD(&fb.filp_head);
 	priv->buffer_freed = false;
 
 	/*
-- 
2.39.5

