Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D942620F1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097662; cv=none; b=rPITJHmrBvgy1lCzFOQ/hEmgP4lqGzYFRu185v+Vga+PuD0RTmEk+8c1P3kEzyKfRRAtwRJzKzWKGDS0arZtM9yNC/If3pvG+2sKp2+/DkuF550+WveZwF6eX9EcUu7d340POieh6QV61wwgk4fXl6ble3RJOOKvDwnw4Dh45AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097662; c=relaxed/simple;
	bh=Zl3LPcELDG4OvrmoqTxX2SKQlTw564P2q2lDBK8RW8g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KjV9vCYwOtZoNhSgGfRuEr1JJgwV/f+gKUVGL7r4IF9K11EzP4+qNLhSfnAjX1OmPMcMk7xGAeJeLiZxswLYXU8gRNC+/Gg81r+OevhaGoJ29fBlPganJ0y2HLbOETiJt+IgHvl5FLv4iUCjqmkSXe8U0mfqCKH5TrrAd9NeyDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l32bkCa5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l32bkCa5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A4CC4CEE5;
	Tue,  8 Apr 2025 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097661;
	bh=Zl3LPcELDG4OvrmoqTxX2SKQlTw564P2q2lDBK8RW8g=;
	h=From:Subject:Date:To:Cc:From;
	b=l32bkCa5TKp1zZpVmNzD1mn6Lm9n7ZosdIf/cj4bUa6i9uaZEzd+fzLvgBgrQpGZu
	 WQoy4vKnzFUrp4jab8EC/cb+9uQj8Xcr+ry8g9HZR/L2isCBwBdtPUILVa8QBtyFbw
	 lNeescCzjDDWxg4TfdtU3qB29rXF7oeuAw9fgDRMFPqSBQWFAe4lbi5IwRGGEoGVEd
	 WolnpNuSLG/7+8lnS1daVoVCRY+QUkWAN3zM8OcftoPGqCzdvrvD2DhBWlDZ2mkl5w
	 oi0x60FCWVA8tY6dFbn+dx06q+ktQj/LDFY9sZNv0ccGlZEgGP3CSHYNDCHlBEo+Lk
	 feW2pxZUH7Q7w==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/7] drm/tests: Fix drm_display_mode memory leaks
Date: Tue, 08 Apr 2025 09:34:06 +0200
Message-Id: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7R9GcC/x2NwQqDMBAFf0X23IWoUWx/pfQQ3FddNFGStijiv
 zd4m7nMHJQQFYkexUERP026hCzlraB+dGEAq2SnylSNsaZjiZ6nb9DPRaJpnd3OfhGwh5/hJrZ
 3MU1d275sQTm0Rrx1uybP13n+AZi0/Nl0AAAA
X-Change-ID: 20250408-drm-kunit-drm-display-mode-memleak-49d05334c16e
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Philipp Stanner <phasta@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Zl3LPcELDG4OvrmoqTxX2SKQlTw564P2q2lDBK8RW8g=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlfLpaez3DceSxnymWu1d+73+37m/XtdeGrCarNc8JMT
 8g/NFNz6ihlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEghwY/orkG8QWmfNoMUib
 ezDz5ugo3DzUoDDxhMqiok+9b+bKbmT4H3fkbffljewPJlpyLMnu8Jt0c9GZkq6+VT5XbJcsla0
 uYQYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

Here's a series that fixes some memory leaks in our kunit tests that
eventually show up in kmemleak.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (7):
      drm/tests: helpers: Create kunit helper to destroy a drm_display_mode
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: modeset: Fix drm_display_mode memory leak
      drm/tests: cmdline: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: modes: Fix drm_display_mode memory leak
      drm/tests: probe-helper: Fix drm_display_mode memory leak

 drivers/gpu/drm/tests/drm_client_modeset_test.c |  9 ++++++++-
 drivers/gpu/drm/tests/drm_cmdline_parser_test.c | 10 +++++++++-
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 23 ++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_modes_test.c          | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |  8 +++++++-
 include/drm/drm_kunit_helpers.h                 |  3 +++
 6 files changed, 76 insertions(+), 3 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250408-drm-kunit-drm-display-mode-memleak-49d05334c16e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

