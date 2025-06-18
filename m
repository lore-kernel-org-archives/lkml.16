Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8488B28640F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750240779; cv=none; b=MA6YOLaWVnoVimJ66xmN4gVYvnBV2IgqMsz9X5oqUGKUr0tgn4lyQyvvvefzYv8GaZ2RKNQv7ykRZHcARY0dCNUYmCYTxwbeXaX/RhR3NZheYX1tsS8+wx5l89sDyZ+1GglfKQO42g/iMqlpXcLxdvNkfxXyd/deS17RwyswFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750240779; c=relaxed/simple;
	bh=O+64+98CK/mpPNF+GEnXjzDTEUr4OHAhCpB8oN0WYvc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e0MMEfaQC+z0tymJY3Gk9vivkcPFbJdXck9DOPWqBbGCZMZ1KwUueqbLoehhlB+aRBlr/rwoZNNVqGUmW6WsJ73dAZFU+Crjo8AEQPSh+XwOLYAHrjd/5vWt1bDh3twtlVIITaRLdZtDEDslg7yhbJR1JDWpZe8Q9xG9Sh0mVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fhnDaZYk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fhnDaZYk"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39549F06;
	Wed, 18 Jun 2025 11:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750240759;
	bh=O+64+98CK/mpPNF+GEnXjzDTEUr4OHAhCpB8oN0WYvc=;
	h=From:Subject:Date:To:Cc:From;
	b=fhnDaZYkfMPhGNyk5HaohAfjVthtageKg1grn6N5LL4BDIBPgS72tPtHVlDIXqReU
	 orAfxs7QA5N6g896FviKYE4KABll35IEVjCpR3Yxb9wtBsNk/Jqtwf6lbVEKxlW9j6
	 D7hutKgurj0k+ScroDMYFtJYNLdirmqL5yO17KzY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 00/17] drm/bridge: cdns-dsi: Make it work a bit better
Date: Wed, 18 Jun 2025 12:59:03 +0300
Message-Id: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOmNUmgC/3XNQQ7CIBCF4asY1mJggFBdeQ/jgnamOguLgjYa0
 7tL66Im6vJ/yXzzFJkSUxabxVMk6jlz7ErY5UI0x9AdSDKWFqDAKQNKNthliZkln84pSoNVW6O
 vbIValKNzopbvE7jbvzvR5Vbc6zweOV9jekxPez2uf/1eSyU9OPC+ca019ZaRQo5dHUPCVRNPY
 hR7mBWr4EuBotig1oZCcAT+j2I+FG2/FDMq5MA5jbZVv5RhGF7V7lwnVAEAAA==
X-Change-ID: 20250320-cdns-dsi-impro-3d8fbd7848d1
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Parth Pancholi <parth.pancholi@toradex.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4536;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=O+64+98CK/mpPNF+GEnXjzDTEUr4OHAhCpB8oN0WYvc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoUo35wgz/CzFjE5sBtKmbQk+LBL4L4cUG3wUxf
 B7ly88ipcGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaFKN+QAKCRD6PaqMvJYe
 9aYSEACpygFmsKoDvt78cPmpvqSLXgIc1tSvCy0fc+6lIFUoH5Od89Kpa0v82qa/IRM8O9u7x7P
 KuGZNOFN27f6yX5TZalWbllDXaUezpMnU+9J/cDxRbDAbcHvcOGjGa7epFv9vpHolMWMRvHnsga
 cW5oxObVEkUJxih8QZvwd5AdDDF6YaWkqq68IhGPWB5nGMe6K7IPRkdScTng0bshtf7EDhoTM64
 lEl3/yMVxIhqGmK5YVQKhZD/KYavaARn2yWFPIq7LXwS5qJpziD26V67s48KSkdqxJE8WxiQ18o
 UDmLwXOm/+Qix9KcFrVCbnT3M2JR3oNRcKBcoKH8NixRHD0PKzUerdCt2IzIQ58FDcvptxdSfXc
 QpALzPcV+iWA8tipMvZtpl0ADK2StpnwFrglBse2GWsQLhp/GlSnYndyVy69ZySsICjoZu9SMBA
 nTiAEVWSXKUhkH2+dtse2Q52F0hAooO3WVUraci2FBAOKsggOLAU/FsciJ+24q2KY31d7sKyP+1
 nrdyRLewY2CjRsU7+i/qioq1qDkEC8g4JduV4aYOglneq8kJ7fSAj/mckue1jvpmisw/FXuQxPn
 pVDqSDyELwWOQaFXqQhVx9U0VEerRPNtmhceoETpg9TtTmTr+U4xsAtdCFrBPptJdDmY3B44jp4
 Y4upc99KisQwTzw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

While trying to get the cdns-dsi to work on Toradex's AM69 Aquila
platform, I hit multiple issues in the driver. Basicaly nothing worked
for with the board.

This series fixes those issues. While I itch to make much larger changes
to the cdns-dsi driver, I opted to keep this series relatively simple to
make the fixes more clear and possibly help with backporting.

The series also touches tidss, but those changes are not strictly
needed, and can be merged separately. And the series also touches
cdns-dphy, and those changes are needed.

This has been tested on Toradex AM69 Aquila (upstream) and AM62P Verdin
(Toradex's BSP), with:
- HDMI output using lontium lt8912b
- LVDS panel (sn65dsi84 + panel-lvds)

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v4:
- Rebased on top of drm-misc-next, which has most of the dependencies
  merged
- Moved one dependency, "drm/bridge: cdns-dsi: Fix the _atomic_check()"
  into this series
- Dropped "drm/tidss: Adjust the pclk based on the HW capabilities".
  This causes a regression with OLDI outputs, and is not strictly
  required. Fixing this needs restructuring tidss clock handling.
- Link to v3: https://lore.kernel.org/r/20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ideasonboard.com

Changes in v3:
- Add Aradhya's "drm/bridge: cdns-dsi: Fix the _atomic_check()" to the
  dependencies
- The above patch from Aradhya allowed adding "drm/bridge: cdns-dsi:
  Drop crtc_* code", which resulted in quite large changes in the
  commits, even if the end result doesn't really differ.
- Reordered commits to decrease back-and-forth (e.g. fixing something in
  a a code that will be removed in the next commits)
- The reordering caused quite big changes in the commits (even if the
  final end result is more or less the same), so I chose not to add
  tested-by tags.
- Rename 'cdns_get_dphy_pll_cfg' to 'cdns_dphy_get_pll_cfg'
- Use div_u64() instead of div64_u64()
- Drop "Fail if HS rate changed when validating PHY config". This was
  too strict, as clock rounding (especially with DRM's 1kHz
  resolution...) leads to clock rates that do not match exactly.
  However, the rate mismatch should be fine as the commits adjust the
  pixel clock, and the resulting differences should be so small that we
  can't even improve the timings match by adjusting the DSI HFP, as the
  adjustment rounds to 0.
- Link to v2: https://lore.kernel.org/r/20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com

Changes in v2:
- Change the tidss clock adjustment from mode_fixup() to atomic_check()
- Link to v1: https://lore.kernel.org/r/20250320-cdns-dsi-impro-v1-0-725277c5f43b@ideasonboard.com

---
Aradhya Bhatia (1):
      drm/bridge: cdns-dsi: Fix the _atomic_check()

Tomi Valkeinen (16):
      drm/tidss: Fix missing includes and struct decls
      drm/tidss: Use the crtc_* timings when programming the HW
      phy: cdns-dphy: Store hs_clk_rate and return it
      phy: cdns-dphy: Remove leftover code
      drm/bridge: cdns-dsi: Remove extra line at the end of the file
      drm/bridge: cdns-dsi: Drop crtc_* code
      drm/bridge: cdns-dsi: Remove broken fifo emptying check
      drm/bridge: cdns-dsi: Drop checks that shouldn't be in .mode_valid()
      drm/bridge: cdns-dsi: Update htotal in cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Drop cdns_dsi_adjust_phy_config()
      drm/bridge: cdns-dsi: Adjust mode to negative syncs
      drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
      drm/bridge: cdns-dsi: Use video mode and clean up cdns_dsi_mode2cfg()
      drm/bridge: cdns-dsi: Fix event mode
      drm/bridge: cdns-dsi: Tune adjusted_mode->clock according to dsi needs
      drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST

 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 211 +++++++++++--------------
 drivers/gpu/drm/tidss/tidss_crtc.c             |   2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c            |  16 +-
 drivers/gpu/drm/tidss/tidss_dispc.h            |   3 +
 drivers/gpu/drm/tidss/tidss_drv.h              |   2 +
 drivers/gpu/drm/tidss/tidss_plane.h            |   2 +
 drivers/gpu/drm/tidss/tidss_scale_coefs.h      |   2 +
 drivers/phy/cadence/cdns-dphy.c                |  24 ++-
 8 files changed, 115 insertions(+), 147 deletions(-)
---
base-commit: 261a603062a87bad0b54904c76dacb15fa126c74
change-id: 20250320-cdns-dsi-impro-3d8fbd7848d1

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

