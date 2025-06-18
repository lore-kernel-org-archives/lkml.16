Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E528460
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238218; cv=none; b=SP0+m4+4dZGoAFulWTLlwml+ysZnfLQCQa5NZcUaKOeSh8C3xyRUZk11SB+9RdW2JyKXjqZ7OwI/3vGDd5GObaVfnw2hP6WIFdEOMzVAuwfRIqSMMc2rL2QfVeK+SBsOKKUBy8kEMkCzfAVYBCR9Rt76cE9hHvTXyJqkyoQSMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238218; c=relaxed/simple;
	bh=scqNSPpx3z7YBCYk6+nXgnKd0xXO1U9lqJGKX/t6xr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=px2g5wW5Gnauvgs+nlOWhTmnQilpGbr424TZFra6Vr/4tJp14zz89oxaOe+5fy0oIoLnkYeyUk2ch5hNwQXLnKEMNK+fwA0etcQwWp26EkGseIJc7ojwrfg8bjHhe3+u2iyDvxRP0blkhnkww4ExdZOTvjjEfGsHDDE2P6vPt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jOqwmT1l; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jOqwmT1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Op
	H9BXnzwdTWSNc6lJhMNwj9RTlEl2OWQCGz1eG4Q9s=; b=jOqwmT1lCsnTmcPi7A
	glt+qpkrHFsj0JgDZ+Dpj3/ENiWDyZhs1cccP9qazEV1D6EuvOnXyO2rzaWmODgt
	HrAl05rq4qwrpuA9AZBeoe5qm4TBoleFXi4Am3u3WLWf0vm1Bg8K1OZKNb6MIwcF
	tnPYizT/BAPLb4XfMMzUyMS6w=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wC3WPaug1JovVLXAA--.9072S2;
	Wed, 18 Jun 2025 17:15:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/panel: raydium-rm67200: Move initialization from enable() to prepare stage
Date: Wed, 18 Jun 2025 17:15:20 +0800
Message-ID: <20250618091520.691590-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3WPaug1JovVLXAA--.9072S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1DZry3Cw4DAr1kCryxuFg_yoW5Xr45pF
	47WaySyrWkXa98uFZ7Aa1kZFy5Xrs7tryfJF1DKasxXr1jyw1UW3W7CrW5uasIqrW8AF45
	Xrn3Jr17JaySkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmAp5UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gdwXmhSguEczwAAsx

From: Andy Yan <andy.yan@rock-chips.com>

The DSI host has different modes in prepare() and enable() functions,
prepare() is in LP command mode and enable() is in HS video mode.

From our experience, generally the initialization sequence needs to be
sent in the LP command mode.

Move the setup init function from enable() to prepare() to fix a display
shift on rk3568 evb.

Tested on rk3568/rk3576/rk3588 EVB.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index df6c1727237b5..459381d53847f 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -320,6 +320,7 @@ static void w552793baa_setup(struct mipi_dsi_multi_context *ctx)
 static int raydium_rm67200_prepare(struct drm_panel *panel)
 {
 	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
+	struct mipi_dsi_multi_context mctx = { .dsi = ctx->dsi };
 	int ret;
 
 	ret = regulator_bulk_enable(ctx->num_supplies, ctx->supplies);
@@ -330,6 +331,12 @@ static int raydium_rm67200_prepare(struct drm_panel *panel)
 
 	msleep(60);
 
+	ctx->panel_info->panel_setup(&mctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&mctx);
+	mipi_dsi_msleep(&mctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&mctx);
+	mipi_dsi_msleep(&mctx, 30);
+
 	return 0;
 }
 
@@ -345,20 +352,6 @@ static int raydium_rm67200_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int raydium_rm67200_enable(struct drm_panel *panel)
-{
-	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
-	struct mipi_dsi_multi_context ctx = { .dsi = rm67200->dsi };
-
-	rm67200->panel_info->panel_setup(&ctx);
-	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
-	mipi_dsi_msleep(&ctx, 120);
-	mipi_dsi_dcs_set_display_on_multi(&ctx);
-	mipi_dsi_msleep(&ctx, 30);
-
-	return ctx.accum_err;
-}
-
 static int raydium_rm67200_disable(struct drm_panel *panel)
 {
 	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
@@ -383,7 +376,6 @@ static const struct drm_panel_funcs raydium_rm67200_funcs = {
 	.prepare = raydium_rm67200_prepare,
 	.unprepare = raydium_rm67200_unprepare,
 	.get_modes = raydium_rm67200_get_modes,
-	.enable = raydium_rm67200_enable,
 	.disable = raydium_rm67200_disable,
 };
 
-- 
2.43.0

base-commit: 082174f76c95dd503de64f182537c89b49771491
branch: rk356x_rk3588_rk3576_dsi

