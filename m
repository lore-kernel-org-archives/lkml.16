Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045AA3074AE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827405; cv=none; b=DUJZIuelZXt/DRRrC0JEeqwiFcIOzgRlTmLf4Evsw4VOQfwFfgPZE71eh48hVp2pJEg9mJ/sQWRU8IGXKOgEyOLt460a+kk6DWfEw6a/i6y07X3EYk3SrDrug8clKkpm4f14x6m6oE/uh0WOHdlktKjUnUu2wAi4eqWscKKqPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827405; c=relaxed/simple;
	bh=6dOUqUTuyRASvj5897YXpzkg1jCDbmOY7e9W81q6TbE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=IMBdjmYrb7x1KvD1oJNc8gWJgJ6d5AgmX+OM+UxoQsMkxK1x13elLJ4j8BplASR4E/vPHDBNqbSxr5WjBhdixettUCeE7fFkZrmLzvxijQLnvIzElm4W+3xGV0IIZglOBJPvOz4qEVMIeRXLgU4wJyie7wvzUzVG+UXIH5bHg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Yms0J38O; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Yms0J38O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750827403; x=1782363403;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=6dOUqUTuyRASvj5897YXpzkg1jCDbmOY7e9W81q6TbE=;
  b=Yms0J38OKMcdNCaVh3eQ2qzD+hi9Wy1yioYN3DQ+5ut27VH72t9vTiY7
   nYMagbrXRhxL/F6ZfHZ8LsdWkK8hO+/nHP9Z1Cw6lxeEPjWIYUjjLaV+u
   y8baYZwW4JRzzKXLJ54H963u0Qd/RDsQ5GItSFvgsEIxb0CSAYl1LhCKw
   ZrTZQJxMU6M3D4WS/djjrp5a9TlhZVxvw7C7n9LBn4v1vUDkMwnw/BPB+
   7DUGvldXlguDRnEy9mekLSIN5084bl9+/53ETyZXHAJCOkY6oTRGNzf6O
   Ngkx+ysDXj/0rNuoDK18o9RNU9rtDp8Tgdmk9Xa2pZm/uWXMSx+sG1F37
   Q==;
X-CSE-ConnectionGUID: AhZgIOJERfil50n8LIfntw==
X-CSE-MsgGUID: lAnqXKGeTei1fnuPZQu9VQ==
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="42713908"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 21:56:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 21:56:19 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 21:56:12 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v5 0/4] drm/bridge: microchip-lvds: clean up and fix bus
 formats
Date: Wed, 25 Jun 2025 10:26:08 +0530
Message-ID: <20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGiBW2gC/33MTQrCMBAF4KtI1kby39aV9xAX6WS0AbUlkaCU3
 t20Cym2yjCL95j5ehIxeIxkv+lJwOSjb+856O2GQGPvF6Te5UwEE5oZXtKbh9BC4zt6TS7SuuC
 au8qwSlmSn7qAZ/+cwOMp58bHRxtek5/42P6kEqd50KK24ApbisPnYAftjYxcEjNCyAUhMlEi1
 LYGk1etEXJOqAUhMwESzJmjYpqbNUL9JxRltJKFU8IqwbD6JoZheAPIjMhHeQEAAA==
To: Manikandan Muralidharan <manikandan.m@microchip.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Sandeep Sheriker M
	<sandeep.sheriker@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750827371; l=1805;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=6dOUqUTuyRASvj5897YXpzkg1jCDbmOY7e9W81q6TbE=;
 b=7bp9Zi1Ph4kmuHQpGXeTjdQq3BfJpu9j5tMLH1lOxG9wyJak0uz/bU+AgJ3/C27fyaUjin0F5
 929vib88ERmCXDpgPoPcxf1rab6z+yh5unw6r44qphSdxhEiLOitxaK
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

This patch series drops the unsed panel field, switches to atomic variants
and adds support to select between the two supported formats (JEIDA and
VESA) by the LVDSC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v5:
- Drop the redundant port node lookup.
- Split the commits adding atomic bridge ops into 2.
- Update commit messages accordingly.
- Link to v4: https://lore.kernel.org/r/20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com

Changes in v4:
- Split the commits into 3.
- Drop <drm/drm_panel.h>
- Link to v3: https://lore.kernel.org/r/20250624-microchip-lvds-v3-1-c3c6f1e40516@microchip.com

Changes in v3:
- Use BIT(0) instead of 1.
- Drop the panel field of the mchp_lvds structure.
- Drop the inner parentheses in write in serialiser_on().
- Link to v2: https://lore.kernel.org/r/20250623-microchip-lvds-v2-1-8ecbabc6abc4@microchip.com

Changes in v2:
- Switch to atomic bridge functions
- Drop custom connector creation
- Use drm_atomic_get_new_connector_for_encoder()
- Link to v1: https://lore.kernel.org/r/20250618-microchip-lvds-v1-1-1eae5acd7a82@microchip.com

---
Dharma Balasubiramani (4):
      drm/bridge: microchip-lvds: Remove unused drm_panel and redundant port node lookup
      drm/bridge: microchip-lvds: migrate to atomic bridge ops
      drm/bridge: microchip-lvds: add atomic pre_enable() and post_disable()
      drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

 drivers/gpu/drm/bridge/microchip-lvds.c | 80 ++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 26 deletions(-)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

