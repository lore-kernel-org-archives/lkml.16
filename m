Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DDC22D4C0;
	Tue,  8 Apr 2025 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134689; cv=none; b=Dair+vheJ1ehB29UabdrSVMFaVQxvc5BnUzRrdwHCOv+ugtjI6SMCBkMooZ9NmcFDuV1LUzuuSlD4cJl1a4f+RlmTBXvq5c55cuhjRl+gRqJpfmzyp8eumt/v46bqZFWyWAXv8Y61yNijDiJDRuZtgeAGdDU5rM6lUlaYS5t9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134689; c=relaxed/simple;
	bh=YJcCFBlWegUtNSWytIrTHoO8XOROx/f/2uidCc2O6hg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HqYH6LP1p0pjOnZ6NjVC5TvZyU2YP/hFNSKmV3Qg39NurozM/mcThcusBHBJRtF1jgRRnr6uggFJ5hfAjul9jZKFMk1FqhsqEIQmOnfsbpEUfDhS3UUnOam042nroAJ/rq/e3HJtCNusIXa4yjS9XzqHdit2EYZ3Qbq6o2MnhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/KVKiFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/KVKiFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46800C4CEE5;
	Tue,  8 Apr 2025 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744134689;
	bh=YJcCFBlWegUtNSWytIrTHoO8XOROx/f/2uidCc2O6hg=;
	h=From:To:Cc:Subject:Date:From;
	b=B/KVKiFtzQASAkPFeJUpxNAxfGXTsURausjF6DqDuQlKBRulDHYL2oMLKekwib22i
	 xrB97gQ0qTDukkUti/Fe3otw9qbP5rEx8U6mCZlX49BBMsvS9mfGatOUpLlldr3vre
	 fEEHG34JCeB6EB56HYIcQpOC/Q51cIonYI9PizyE9xiW7ffl+RYhffMBvYx4x1k0IC
	 NdZRAl4eQxV0FonN5WXkamv5Y9zayR6uityBoB27+1KDOcDaAUqTYAUvbSw4K4FRbV
	 FS23BqHhSuNON0DZT4RhIK5IFV2qRiljUs0jKo8Qkqsjzlj1ty4hkH4MwZxduNhZhb
	 ONukmH8aYEfjw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/bridge/synopsys: avoid field overflow warning
Date: Tue,  8 Apr 2025 19:51:06 +0200
Message-Id: <20250408175116.1770876-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-16 and earlier complain about what it thinks might be an out of
range number:

drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c:348:8: error: call to __compiletime_assert_579 declared with 'error' attribute: FIELD_PREP: value too large for the field
                     PHY_SYS_RATIO(tmp));
                     ^
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c:90:27: note: expanded from macro 'PHY_SYS_RATIO'
 #define PHY_SYS_RATIO(x)                FIELD_PREP(GENMASK(16, 0), x)

I could not figure out if that overflow is actually possible or not,
but truncating the range to the maximum value avoids the warning and
probably can't hurt.

Fixes: 0d6d86253fef ("drm/bridge/synopsys: Add MIPI DSI2 host controller bridge")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 5fd7a459efdd..440b9a71012f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -342,7 +342,7 @@ static void dw_mipi_dsi2_phy_ratio_cfg(struct dw_mipi_dsi2 *dsi2)
 	/*
 	 * SYS_RATIO_MAN_CFG = MIPI_DCPHY_HSCLK_Freq / MIPI_DCPHY_HSCLK_Freq
 	 */
-	tmp = DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, sys_clk);
+	tmp = min(DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, sys_clk), GENMASK(16, 0));
 	regmap_write(dsi2->regmap, DSI2_PHY_SYS_RATIO_MAN_CFG,
 		     PHY_SYS_RATIO(tmp));
 }
-- 
2.39.5

