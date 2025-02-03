Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CED42080F0;
	Mon,  3 Feb 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594720; cv=none; b=obRRV7hI14Ra4O0YWmsd7SZzHlvtNeAz3TNZNWm4c975pKwAFBgygtZU9wVZmwqnrMfW+lgOs/Ql80fwiz+YPziSM7gI6rd+xLnfQIJAwqXlBwsNVu+B69eGpU3fG1j6VFztgQwK/gWOCPL93C1v1AFpTagICDtbf4ZLccFU+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594720; c=relaxed/simple;
	bh=8FfcjAUkNIlEaQpniPv0flaKynus+5ot2KxXilabft4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eqJbR1tw0mPSUF/+aqegKVjHEqZ910HIMzYx0cWk8LZYvFBPz72FsMR0ON+fCgOfRaGc+ILrnTE99tYIe90zLJcjTLkTslV5YpbS6oV/hAfJXzqlVoEmDje1YX22uL6pUrJiH1L7LKFEpjYhHeuorO9k3SXBpzDIGa37v9WH2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nJSEHFZn; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nJSEHFZn"
Received: by mail.gandi.net (Postfix) with ESMTPA id CAD1E43396;
	Mon,  3 Feb 2025 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738594711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IcNL3kWLWPBscOUAjJ3bIyEiP0E267EDYYmnfJEELaQ=;
	b=nJSEHFZn/z4brCQ/RLs4at33/8KH6k87ell/C6irEeRYFjhGM9zVAX6xqhhARhf8ogZxIr
	xZHpQ8h2vb9jxgEhIoFIU9RUByP88ZuH5uzySE2Vi4zN6YCvvPJi1OgZ21QDYfvu/2MeV0
	zoPDhYrcBNG14aGomXMqP4DUNIXB7tERSzSUq2OPhkegM/d7//DuiKnkYHqx8O6Cj4N48a
	HPgsJQS2vg/cLf62YsWyjjmL+azW6rVZJHY3oquJYplMRmgUsDxy5rDZcYYFb+0ZHl+GDx
	X3gr7s6eo/YHYImzu4vvTxm/+IctDRvCf7H9jpVNdiEDcYDGBSi1B9nLeGKkYA==
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
Subject: [PATCH v4 0/4] Add support for errors recovery in the TI SN65DSI83 bridge driver
Date: Mon,  3 Feb 2025 15:58:19 +0100
Message-ID: <20250203145824.155869-1-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleetudffledtvddtffegudfgjeffgeegkeehjeeigffgieevhfekffehheehieeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi,

Usually the TI SN65DSI83 recovers from error by itself but during ESD
tests, we have some cases where the TI SN65DSI83 didn't recover.

In order to handle those cases, this series adds support for a recovery
mechanism.

Compare to the previous iteration, this v4 series:
  - rebase on top of v6.14-rc1
  - disable/re-enable irq in the failure detection and reset process
  - Split the patch moving reset_pipe() from VC4 to a new helper
  - Rename the new helper to drm_atomic_helper_reset_crtc()
  - Remove state duplication and use bridge.encoder->crtc

Best regards,
Hervé Codina

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

