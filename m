Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B21F208A7;
	Mon,  3 Feb 2025 16:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738599375; cv=none; b=LOnJmKjGfgS5y0dkMoaJOEXJFMfiZ3i0MdC2pkUShXXkxUYB84PRrZDSHPTdMxtJYM44DL0JPsy54Vkm1fopTYE+FRpJKacvVH8Gw0ZHpRyYx7A4sT1jE2jAUb1tZ1nBpgsOvQgBe8bRNlWEslOPhc1Zlq7AWDJW/7s4/0mJ3j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738599375; c=relaxed/simple;
	bh=aubV9fAiDPlMlQcQh9qVDTT2zn1G4X+jo7TZDmBP9wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HebFtzAVhtzXvD8Zy/lK/G+Fqyo3HulVB6F7cel2RtjOhGzFMInjfXcKoZ3UWbtLJLe5c4YzDZJ1xvGGxP0nD74kY3vZ845AOXr+Jpi5ursQrIstZ2fXkhlkW1jpk2u3ABZ5Ct/hBAU+4HbpgIQQq116+TPCNKE4qCLY0cF9FHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DYRhhiSd; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DYRhhiSd"
Received: by mail.gandi.net (Postfix) with ESMTPA id 08FF24429E;
	Mon,  3 Feb 2025 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738599371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nzSYXGtjhazy1f4IqKxNqCqYk7NJaq4pu6AwjqCjoIk=;
	b=DYRhhiSdrwFxqpw02vOdAbvWAuz17MTbhSJVWgo9KRHQ+FcdL5/MLU3gHSWGL1yBp+ZrJM
	bJ8pxMSxBptGflsRUOosqVyYn2hC46S17vPiX8QYZ2CBf7ojv2WozKOhyi+dLFbNuevt3L
	y4nR3Y6QGbAC2mhRxEVyo8MndrRZNpVNxcIFZdnLJgYdC0FI1Ls2AAQli/Hu3ZLa3KcRho
	OBc/uSihc1TRLnPvORZPsm7alCwyG2QbYqiRU3wyOpC1VriwsYkzu1pQ6PB6BSQ+GupfIZ
	cdMVqQU5RfEW7i/kBWaHC0gc/JxZHTQEJ3ifQsEuA7yDBYt1m5iRAqkSXWCDBA==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v5 0/4] Add support for errors recovery in the TI SN65DSI83 bridge driver
Date: Mon,  3 Feb 2025 17:16:02 +0100
Message-ID: <20250203161607.223731-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleetudffledtvddtffegudfgjeffgeegkeehjeeigffgieevhfekffehheehieeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi,

Usually the TI SN65DSI83 recovers from error by itself but during ESD
tests, we have some cases where the TI SN65DSI83 didn't recover.

In order to handle those cases, this series adds support for a recovery
mechanism.

Compare to the previous iteration, this v5 series fixes the v4 series
because the v4 series fails to apply on top of v6.14-rc1.

The modification are still the same as for the v4 series (v4 series
should be simply ignored):
  - rebase on top of v6.14-rc1
  - disable/re-enable irq in the failure detection and reset process
  - Split the patch moving reset_pipe() from VC4 to a new helper
  - Rename the new helper to drm_atomic_helper_reset_crtc()
  - Remove state duplication and use bridge.encoder->crtc

Best regards,
Hervé Codina

Changes v4 -> v5
  v4: https://lore.kernel.org/lkml/20250203145824.155869-1-herve.codina@bootlin.com/

  Exact same changes as the v4. The v4 series doesn't apply on top of
  v6.14-rc1 and should be simply ignore.
  This v5 series is the v4 fixed to apply on top of v6.14-rc1.

Changes v3 -> v4
  v3: https://lore.kernel.org/lkml/20250108101907.410456-1-herve.codina@bootlin.com/

  - Patch 1:
    No changes

  - Patch 2 and 3 (patch 2 in v3):
    Rename the helper to drm_atomic_helper_reset_crtc()
    Split the patch available in v3 in two patches.

  - Patch 4 (patch 3 in v3):
    Take into account commit d2b8c6d549570 ("drm/bridge: ti-sn65dsi83:
    Add ti,lvds-vod-swing optional properties"), available in v6.14-rc1.
    Disable irq when a fault is detected and re-enable it after the pipe
    reset.
    Remove state duplication and use bridge.encoder->crtc directly

Changes v2 -> v3
  v2: https://lore.kernel.org/lkml/20241217143216.658461-1-herve.codina@bootlin.com/

  - Patch 1:
    No changes

  - Patch 2 (new in v3)
    Move reset_pipe() from VC4 HDMI driver to a new atomic helper

  - Patch 3
    Use the new drm_atomic_helper_reset_pipe()

  Patch removed in v3
    - Patch 2 in v2
      No more needed

Changes v1 -> v2
  v1: https://lore.kernel.org/lkml/20241024095539.1637280-1-herve.codina@bootlin.com/

  - Patch 1:
    Add 'Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>'
    Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'

  - Patch 2 (new patch in v2)
    Introduce drm_atomic_helper_disable_connector()

  - Patch 3 (patch 2 in v1)
    Reset the output path instead of the full pipeline.
    Update and add more information related to the bridge in commit log.

Herve Codina (4):
  dt-bindings: display: bridge: sn65dsi83: Add interrupt
  drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()
  drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
  drm: bridge: ti-sn65dsi83: Add error recovery mechanism

 .../bindings/display/bridge/ti,sn65dsi83.yaml |   3 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 131 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  41 ++++++
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  30 +---
 include/drm/drm_atomic_helper.h               |   2 +
 5 files changed, 178 insertions(+), 29 deletions(-)

-- 
2.47.1

