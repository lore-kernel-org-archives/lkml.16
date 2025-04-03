Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF74824EA8F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687222; cv=none; b=EcnTwtrPVB3TNjzx1k7X487W/nfRVwetlU+58frX/HEW0z6gON94t8sXyUhSmDKPnK9aYB04SwiHjy6vaSpk3jLPqo+1ELtggWDnc+N5BL58C4Tj7wXsyWI1gCiTKmwkkPWZ1c6wGpJeaa9xO2mbqaPspMflx1qOim6msFFefp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687222; c=relaxed/simple;
	bh=rl01/FdFtTK1ESwz6xo4DRwQE6TYQX0rQmwJ/UODmaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sdv/I8eQScL6NNAumXn7/z1fLBWJJVUJFe6DTfuoVp9g99Nv3UG46bK+Z+dfrz5ptsb3y06X/pBr5AA5GMllJkpPa4XcpFg7vDS0/hyoD3ui4u4yIzzhDsTu8Dst711jEH5vOaSBVX/mlupWiLsEoFDcLajSR1oN+DBlnhKY36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eghYFj7m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eghYFj7m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AA1C4CEEB;
	Thu,  3 Apr 2025 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743687222;
	bh=rl01/FdFtTK1ESwz6xo4DRwQE6TYQX0rQmwJ/UODmaM=;
	h=From:Subject:Date:To:Cc:From;
	b=eghYFj7m1Ar1NSkqJGxsJJdqsFzr66HttynSzabWV/sRjxIe6KMH2Zs7QCTvEPU1g
	 pBuL/a4fIGafl3FLWZ/5dfSZ3yORSZfzH7jQqGJWP1GHUdG7QlMV6ob6xU02d200EY
	 CnQLigRfhAHY9zmWpprNCwjda5T7O6L2gK0mJkJy3Ld2XKFSZfGqFkP04ZyUe6t8WX
	 qP7XffRLaMsY8r+sUWCqJJ/YAgj+EkkSDYoGSOma0XH4pu2FQ0krSsjyQpjYnAaSwC
	 DZmEtew5XJFcKfgyppWlHFQJGZWsdvk2OaF4paZn044CovJeR9RUBMXzVQLwrlEEPo
	 kIl2Y32lZCeDQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/4] drm/vc4: tests: Fix locking failures
Date: Thu, 03 Apr 2025 15:33:29 +0200
Message-Id: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACmO7mcC/4WNTQ6CMBBGr0Jm7RhKiwVX3sOw4GeACVjMFBoN4
 e5WL+DyveR73w6ehMnDNdlBKLDnxUXITgm0Y+0GQu4iQ5ZmeapVgZ08MLQGp83xin3N8ybkUSv
 dGGvz1ugC4vgp1PPrF75XkUf26yLv309QX/s3GRSmaG1ZXExX1o22t4nE0XxeZIDqOI4Pf/+T+
 r0AAAA=
X-Change-ID: 20250318-drm-vc4-kunit-failures-313b4775c438
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=mripard@kernel.org;
 h=from:subject:message-id; bh=rl01/FdFtTK1ESwz6xo4DRwQE6TYQX0rQmwJ/UODmaM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnv+vRvTnm0d8eEkzyff9lzVl2ak7c/pkpc3EVQWGPW4
 i/SQbYhHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIeCgjQ8dN7b935afoffNQ
 XfheI/9phkJTzcuktXa/5/1fM0HCg43hn05cTtv+x9lHArYWGOz+IXJps3vkPOupW3gvnY5YPt2
 5khcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

This series deals with (lack of) EDEADLK handling in vc4 PV muxing
tests.

This was leading to failures with CONFIG_DEBUG_WW_MUTEX_SLOWPATH
enabled.

Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Fix typo in commit log.
- Enhance the backoff code 
- Link to v1: https://lore.kernel.org/r/20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org

---
Maxime Ripard (4):
      drm/vc4: tests: Use return instead of assert
      drm/vc4: tests: Document output handling functions
      drm/vc4: tests: Stop allocating the state in test init
      drm/vc4: tests: Retry pv-muxing tests when EDEADLK

 drivers/gpu/drm/vc4/tests/vc4_mock_output.c    |  62 ++++++++--
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 154 ++++++++++++++++++++++---
 2 files changed, 189 insertions(+), 27 deletions(-)
---
base-commit: c0988d693eb10e115d95747f8a0cccc83babb3fc
change-id: 20250318-drm-vc4-kunit-failures-313b4775c438

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

