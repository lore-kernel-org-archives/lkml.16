Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A7204592
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750840964; cv=none; b=uGUcHV+00roTJrC8ONLDsMDILOcTpGdzUEnDP5zwJu1Qap0oq494qXo0kkW4wwLLy4dbMWNH++LlAWX13ksKir23cViTJ+3gG4qKtbhmR9ce/wFJdXGl7/dI9HASRt/Qp90crJBVN9Yzlozfm166+9iAvnuJomqSyuLV9JHZ4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750840964; c=relaxed/simple;
	bh=AgfmR+lhxzq9qE/cCzTj3NsR+LtMrBgmhkOkNgkRvbE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hm6Vaa/rYow92jugay28ObRmbxzGCqsAWxTebHA7bGHw7WJsOYnRpRlpnnWyREqhlJK1BDk7XuG+HQYaYsixhMnn3q2esdQxU8lf17t2cbFQKM8BBYceUG0sy1pJ8JzMWffCbR7dQ+tmCTX4ErBJz89W8jYWT+Z4eV/qceSF+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=DOlnJhau; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="DOlnJhau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750840963; x=1782376963;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=AgfmR+lhxzq9qE/cCzTj3NsR+LtMrBgmhkOkNgkRvbE=;
  b=DOlnJhauu3jiBZwP9H3yrjlzTcdHnWOsz7xRO2toXVIR2I4aow+PMd6G
   eggJnuGE3feLoEyEwKScPqbOGtDu/S70l3SfvXON49sCbkE4xmrQukO1+
   XR13mx4yXncteKGFQByT7oOTfSgi1/xtheHicRUEP5ozhHP64lo/cmYlT
   2O7FcyN9IvqiGAs7reApbitxEqXt3vqaVPs0lMctCsXf3AH9i0+ixYF/V
   Dvi7MRJI3uceR6nVHugyzUrQ5aFdgre2bflf5bBUXfRxCPJZBD6irWbOF
   11XtHyKbxdJbtGJuLVbMdnD5QKLPSMlraljfG/EuRl1l/AwhmJ3tRVf5E
   Q==;
X-CSE-ConnectionGUID: cBHfqEUaQkGtLTAUKVdw1g==
X-CSE-MsgGUID: hNePXEIxQ/yCocbJ+jqyTA==
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="274587524"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2025 01:42:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 25 Jun 2025 01:42:03 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 25 Jun 2025 01:41:58 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v6 0/3] drm/bridge: microchip-lvds: clean up and fix bus
 formats
Date: Wed, 25 Jun 2025 14:11:52 +0530
Message-ID: <20250625-microchip-lvds-v6-0-7ce91f89d35a@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFC2W2gC/33Mz2rDMAwG8FcpPs/Flv8k2WnvMXZwZGUxrE2xh
 2kpefepPZTQpEPo8H1Iv6solBMV8b67ikw1lTQdOfi3ncAxHL9JpshZgAKnvG7lIWGecEwn+VN
 jkX2jnY6dV50Ngp9OmYZ0voOfX5zHVH6nfLn7Vd/al1TVkocCuYCxCS18PA72OB3EjauwIMCsC
 GCiJexDj57XbhFmSdgVYZhAg37QZJXTfouw/xNWKtmZJloIFhR1W4RbEm5FOCaYxqGBHrzTz8Q
 8z38I6IkLvAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750840915; l=1937;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=AgfmR+lhxzq9qE/cCzTj3NsR+LtMrBgmhkOkNgkRvbE=;
 b=Mf8wv5D25BHqDvCaMeHbWd1cSaimpkQ9U8fYdudOyAM/Zx2T0hOHPbRvqHiiH7s9H809/7lZP
 oR6jYa5dyhUCrmOsAUDG0zMiChN6EPCed0hqI6a1apUUPHLFhNiPNpt
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=

This patch series drops the unsed panel field, switches to atomic variants
and adds support to select between the two supported formats (JEIDA and
VESA) by the LVDSC.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v6:
- Drop pre and post hooks as they are not neccessary now.
- Drop turning off the serialiser.
- Link to v5: https://lore.kernel.org/r/20250625-microchip-lvds-v5-0-624cf72b2651@microchip.com

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
Dharma Balasubiramani (3):
      drm/bridge: microchip-lvds: Remove unused drm_panel and redundant port node lookup
      drm/bridge: microchip-lvds: migrate to atomic bridge ops
      drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

 drivers/gpu/drm/bridge/microchip-lvds.c | 63 +++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 26 deletions(-)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250618-microchip-lvds-b7151d96094a

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>

