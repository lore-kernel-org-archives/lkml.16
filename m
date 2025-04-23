Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96727FD71
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426669; cv=none; b=Nyg23ve1C2HL8kulqyw9XgaMbkjCgc3vMcH/B0/MZck6tNx6SmVS2ISqw3W/htvmE+RWbyWmuliGwC4dhBl4UtebHfUn1LtUEUWmEMVyboKzbe91qjc9H6Ewe7yjb9I4vflNQsaeO1SN+E/5XhhsI1jXcSJxRMbU0KrHttV8NuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426669; c=relaxed/simple;
	bh=FX/Vo6MgthKdRTi+CWkqnrzMpTD/YHg19LlWfAknldU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gfuLhRQPUQT0dQApOc7Cr4so8dZSrMGbf/dwp8f8LGMpBDgofitw8rhRwdzq1HdIyuLihmvxGFHoQEgbnv4oTmOUwlQ5yYEdrwZsEWjX4WpjTMYYSGSVImhZUjHGU3uldlwO0IMKG7XczPiCra3cP6xnX31xqCOLXBroi5tUrz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLIO7yB9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLIO7yB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E43FC4CEE2;
	Wed, 23 Apr 2025 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745426669;
	bh=FX/Vo6MgthKdRTi+CWkqnrzMpTD/YHg19LlWfAknldU=;
	h=From:To:Cc:Subject:Date:From;
	b=TLIO7yB9lKAb3xtqbawTI9uuH7U0buTQA287nqui8dXH5EcJZs9zQXzSUbb8PzWsy
	 RNWcexpB7kcsIemNT+mZa97uo1GZoNa2eSlZ2NWj7v4fwrY36cwTuRpIT4Sjj1X3wP
	 3HReIrVK6ck+ajc+V5gaae3eGR3NaAvgowNSm+upyMYOAyBfr2bchU8L3G9JXwFXZ6
	 bK/Sq1HnGegVngE9Vt7g9vVxQpKsyBo3Uv/3hLahw2M1asmtUDdHtP35QZf1rglrQb
	 5Qr9PrQSF/fZz87dmlYQwcYyUv1Wl/6vHDHO7nAzbLQfgLQ1X7HwSmx0r6AQyj/0p+
	 LBc9aJbWay+Gw==
From: Arnd Bergmann <arnd@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: add CONFIG_OF dependency
Date: Wed, 23 Apr 2025 18:44:16 +0200
Message-Id: <20250423164422.2793634-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

DRM_DISPLAY_DP_AUX_BUS cannot be selected when CONFIG_OF is disabled:

WARNING: unmet direct dependencies detected for DRM_DISPLAY_DP_AUX_BUS
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && OF [=n]
  Selected by [y]:
  - DRM_ROCKCHIP [=y] && HAS_IOMEM [=y] && DRM [=y] && ROCKCHIP_IOMMU [=y] && ROCKCHIP_ANALOGIX_DP [=y]

Rockchip platforms all depend on OF anyway, so add the dependency here
for compile testing.

Fixes: d7b4936b2bc0 ("drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index caa251f91dd8..6b9f43c05148 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -2,6 +2,7 @@
 config DRM_ROCKCHIP
 	tristate "DRM Support for Rockchip"
 	depends on DRM && ROCKCHIP_IOMMU
+	depends on OF
 	select DRM_CLIENT_SELECTION
 	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
-- 
2.39.5

