Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704C2D3EE0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024775; cv=none; b=adv3uFSKbq65F8+oo2ekLpdqgX7Up9vpdDkzeBuzC3CP14XUnjCrQLCKzTmOM8reMGJEL/ByjsBLv529ezE7JOc6IkcxVNN+p0Rj82GfgwVZZFf2UL+W5/wpJmA140ikPdqlDAcz0Lc1jYest1YzwP4zXXUHUGvwJ8GpAMUvYmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024775; c=relaxed/simple;
	bh=JdVJnpaEZtLd9FeCCX+vyHrDD6OuJkB7SDth8D47IME=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ud0taWCCNTMnY6LQeGD1qhswNlomwFanLCo4tIdPTp1emwe3TzrYpgFovwkc88PqTcsVYozA/cHf4TbcZFdWKn0yzS4Ce4UraPAqypCm3xKXuZgQWqhXySrY5++qbGGMLJz3sKqmi0VQAQdYSUXMTyO/EFgFIiypy7M55tOXUb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uV7Wi-0004N2-Gc; Fri, 27 Jun 2025 13:45:52 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/4] drm/bridge: samsung-dsim: Stop controlling vsync
 display FIFO flush in panels
Date: Fri, 27 Jun 2025 13:45:37 +0200
Message-Id: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGGEXmgC/3WNQQqDMBBFryKz7pQYYtWuvEdxYeNEB0qUjAZFv
 HtT912+B//9A4QCk8AzOyBQZOHJJ9C3DOzY+YGQ+8SglS5UoUvshTHK7i26zyojVq6yts67h1M
 G0moO5Hi7iq828ciyTGG/DmL+s/9bMUeF9dtQZ4qyKnXdzOSHdQmT5+3eE7TneX4BgS3PbbMAA
 AA=
X-Change-ID: 20250527-dsi-vsync-flush-8f8cc91a6f04
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

This series enables the vsync flush feature in the samsung-dsim driver
unconditionally and removes the MIPI_DSI_MODE_VSYNC_FLUSH flag.

Background: I've recently seen shifted display issues on two different
i.MX8MM boards (mxsfb + samsung-dsim) with different DSI panels.
The symptoms were horizonally shifted display contents, with a stable
offset, in about 0.1 to 0.6 percent of modesets.
Enabling the MIPI_DSI_MODE_VSYNC_FLUSH flag in the panels' mode_flags
fixed the issue in both cases.

The samsung-dsim driver is the only DSI bridge driver that uses this
flag: If the flag is absent, the driver sets the DSIM_MFLUSH_VS bit in
the DSIM_CONFIG_REG register, which disables the vsync flush feature.
The reset value of this bit is cleared (vsync flush is default-enabled).
According to the i.MX8MM reference manual,

    "It needs that Main display FIFO should be flushed for deleting
     garbage data."

This appears to match the comment in mxsfb_reset_block() in mxsfb_kms.c:

    /*
     * It seems, you can't re-program the controller if it is still
     * running. This may lead to shifted pictures (FIFO issue?), so
     * first stop the controller and drain its FIFOs.
     */

Now I wonder why the bit is controlled by a flag in the panel drivers.
Whether the display controller pushes up to a FIFO worth of garbage data
into the DSI bridge during initialization seems to be a property of the
display controller / DSI bridge integration (whether this is due to
hardware or driver bugs), not a specific requirement of the panel.
Surely no panel needs to receive a partial line of garbage data in front
of the first frame?

Instead of adding the flag to every panel connected to affected SoCs,
the vsync flush feature could just be enabled unconditionally.
Clearing an already-empty display FIFO should have no effect, unless
I'm missing something? With that, the MIPI_DSI_MODE_VSYNC_FLUSH flag
would not be used anymore and could be removed.

regards
Philipp

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- Collect Marek's Acked-by.
- Drop RFC tag.
- No further changes.
- Link to v1: https://lore.kernel.org/r/20250527-dsi-vsync-flush-v1-0-9b4ea4578729@pengutronix.de

---
Philipp Zabel (4):
      drm/bridge: samsung-dsim: Always flush display FIFO on vsync pulse
      drm/panel: samsung-s6d7aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      drm/panel: samsung-s6e8aa0: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag
      drm/mipi-dsi: Drop MIPI_DSI_MODE_VSYNC_FLUSH flag

 drivers/gpu/drm/bridge/samsung-dsim.c         | 2 --
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c | 2 +-
 include/drm/drm_mipi_dsi.h                    | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)
---
base-commit: b462b0ef4d788d56f0e575406e58450358dcbd96
change-id: 20250527-dsi-vsync-flush-8f8cc91a6f04

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>

