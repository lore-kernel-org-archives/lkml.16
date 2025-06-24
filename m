Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E881BC9E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750757095; cv=none; b=HZOjF4YXPddnONybmg6rkF6/5N0ICKqlI5lPv49zqdePfCI6mC8lvrecdBTlhUKh6QNJbMmwkhOHEbFHUMWV7Mn4U4JhPD9FsvK2WsUDYFt6umiUeaN99SchHGcc83hi7LCfI1BKG8z0Kb2IentkJ1cm7XvJb5XCKDj/iIXlNfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750757095; c=relaxed/simple;
	bh=OA1BhEclyD3cxhcgakDc2CPEw7A1ytSUj3LETMJQ82E=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tlzoOU1lgOgg9Rc/2MOXrG8pvodJ3/dZJhyoqHt0RiBGNy1d6gMzhrhMrgruGxIonhtYP7aJsnANUwsZoQaD2ks2esFATnBeYfko7HY2AYjkiWEkcOm6NSJnskEbryYivDEdp9OSkLXQ8jGBUs2u4kC4SWwsZaaRJ2cQQyh/ny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=eJ6YKXFz; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="eJ6YKXFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750757093; x=1782293093;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=OA1BhEclyD3cxhcgakDc2CPEw7A1ytSUj3LETMJQ82E=;
  b=eJ6YKXFzI0I+WtBp+R8N2XEPA+qsm9MDba5ev5sepst2OTAm9CBDc27w
   kUEiBfrDK8gxIkUiCg8kJ9BMgY/2Y9Oi5DHresfo26YOXCn5GDs5Ovd+T
   5A98+CV3vwvsKpyA7I2FNlvvUvasaZGOtcsNkOiwWHrvqqEKlp0oYLG99
   hnoyjC1vrcqPgzST0R8gL3a362Jg7r2gnjepjjGc0nvI88tjpixA4GR6y
   ISDFx4fZx3aVutmDRQWWhrUKtydP/a09i8UYL/g+cj0WypyaSra+5iyQm
   1UIqDRHY/zyTJJycM7bVxtjFSa/LrHvEwLvTK4/IusgpHPyuYuAD2iHxF
   A==;
X-CSE-ConnectionGUID: kAMBk0q5SXCuhoUD0ewa8g==
X-CSE-MsgGUID: YHIEH+SeTDOHPwIIrtz4fA==
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="42674594"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Jun 2025 02:24:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 02:24:22 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 24 Jun 2025 02:24:16 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v4 0/3] drm/bridge: microchip-lvds: clean up and fix bus
 formats
Date: Tue, 24 Jun 2025 14:54:13 +0530
Message-ID: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1uWmgC/3XMQQ6CMBAF0KuQrq1pS1vAlfcwLsowSBOhpDWNh
 nB3CwtDRDOZxf+ZeRMJ6C0Gcsom4jHaYN2QgjxkBDoz3JDaJmUimFBM85L2FryDzo70HptA64I
 r3lSaVdKQ9DR6bO1zBS/XlDsbHs6/Vj/ypf1LRU7ToEFloClMKc6fgyO4nixcFBtC5DtCJKJEq
 E0NOq38ReRbQu6IPBGQg245Sqa4/ibmeX4DPeDrfDYBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750757054; l=1447;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=OA1BhEclyD3cxhcgakDc2CPEw7A1ytSUj3LETMJQ82E=;
 b=ln2ThX2OMPa4FXL63lhDtkNyMUggWXK1b9l3Kd2BCDlIEol/WdAh5rjbyU1caYHsaSAiLnPw5
 KjQ49VUKpWfAMKl5TIAbnj6rr+33i7+4fPCihAZKmj+ffMHVDrOrLpK
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

This patch series drops the unsed panel field, switches to atomic variants
and adds support to select between the two supported formats (JEIDA and
VESA) by the LVDSC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
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
Dharma Balasubiramani (3):
      drm/bridge: microchip-lvds: drop unused drm_panel
      drm/bridge: microchip-lvds: switch to use atomic variants
      drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

 drivers/gpu/drm/bridge/microchip-lvds.c | 71 +++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 17 deletions(-)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

