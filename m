Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47220E32B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747726887; cv=none; b=gZjb7v87HplE9cA7MiGkiVXqRiMhOYthv7LhuuKghpdTegEFPU8+Cy66VXy05VDu1ZCif2mVumIn8N3uaIwC9vEkaNknEVhKph1HjMj7fAkZ/+Vlb46OMCB1QmEx6PCvbjH0Xk8FTcP1hrgRTisdU2KRTk/gk9QYAlQuPdX7aHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747726887; c=relaxed/simple;
	bh=r4jX8Azs8v5DrAXiFmtO9nabjgP5A44o2RnL8fPrWS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ff5IdrbTzgKL8pN+KImb1RlBavAG3fGPTcZSMgF62YJRkdHbrsrCXM18myQnlvW0RBzySdQpb+szR1SUkscgj8m65aTesbxCGjQH0rNukTT5gNLJQZFbe1/2mo3lJApb+l5Mn4IJD178AAfG6+36O5zyZzrv1APZ1ArQFYJDgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VN3W+A/z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VN3W+A/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E563C4CEE9;
	Tue, 20 May 2025 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747726887;
	bh=r4jX8Azs8v5DrAXiFmtO9nabjgP5A44o2RnL8fPrWS0=;
	h=From:To:Cc:Subject:Date:From;
	b=VN3W+A/zNLw3hbn2mYfVm8M2mhK4jjRrbg1rD16Y+KOcsugzsq81QflRKhkRXK8YY
	 GJznMwZZ4h8U8C6z0mEmRn6i/PWXZ3LYzWO76PiDl9XN4SnEacBXlKIdjVyVtVnum1
	 VvWQVotMJn7KAD9EXxY0br9afo9BZ+lbhbPaYfAUO1tirIBor5IhyW7BujYtpia7hS
	 fLUvVkGb0FFvSDMWCgzLyvPQgG+onRkHBntwf/HImijHJus40H6QEfoGGfIhW+ijRH
	 VQS1KBiu4cbl8TMczJz5rEtNqFAlsKFVNz/OpekFapfjv32pGhgqnRnbXfXeeNEMLC
	 aF1Rl0KLq+z9Q==
From: Michael Walle <mwalle@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] drm/panel-simple: fix the warnings for the Evervision VGG644804
Date: Tue, 20 May 2025 09:41:10 +0200
Message-Id: <20250520074110.655114-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The panel lacked the connector type which causes a warning. Adding the
connector type reveals wrong bus_flags and bits per pixel. Fix all of
it.

Fixes: 1319f2178bdf ("drm/panel-simple: add Evervision VGG644804 panel entry")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 82ee2f12b8d2..0a3b26bb4d73 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2198,13 +2198,14 @@ static const struct display_timing evervision_vgg644804_timing = {
 static const struct panel_desc evervision_vgg644804 = {
 	.timings = &evervision_vgg644804_timing,
 	.num_timings = 1,
-	.bpc = 8,
+	.bpc = 6,
 	.size = {
 		.width = 115,
 		.height = 86,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct display_timing evervision_vgg804821_timing = {
-- 
2.39.5

