Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8969C2561A8;
	Wed, 25 Jun 2025 12:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855306; cv=none; b=s3v4a+ZFmkjfBVnTPaSUmtn9xzhI1HlP1/oCBH+pQuPrg3Z+M1CN00Ac17Syq0MKUby4rLfjTETu44IIYQCNF76ov1I8kRs9gZgXgWy+djyPLA3l/L9u3kYGpxEq3z0JDEG1U/OL3d7NU3ZX/2k51H5gzWcfCiWToUienFvDJRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855306; c=relaxed/simple;
	bh=k73QcSebOPGkqpr02iIqO4RpQPNEizVB/wnyJVCI8+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k3D+D8BfGztHZZ2RUaNAtYHWwokYa6yxCAnCQRVwYL1DBdtzxLmIn7MhBMn9lVkSq2kkhj9sZl8Opg1rQiMLr4vaxh/8ZnkSJLFNiewGfvx/dYqVjHTSyGhpiRdvmuAnVenvl0yyGMofn/LaJ1BnFam//3LaTRuVLOgURdmGjOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CqpfjIX0; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CqpfjIX0"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B4F8A2089E;
	Wed, 25 Jun 2025 14:41:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqmGC6kMmVPd; Wed, 25 Jun 2025 14:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750855299; bh=k73QcSebOPGkqpr02iIqO4RpQPNEizVB/wnyJVCI8+c=;
	h=From:Subject:Date:To:Cc;
	b=CqpfjIX0vrZfmuIw1JegjdIoz5/uQ7w2ruLjtrZX39ZtjjvgY8dbnV4PEiqlDPIki
	 +wOX+Owdkhr7Ppi6qrhgOtYhm4SWb2WCnHhkBfcX10Ua386UJIEF5w9tGSq608hNlq
	 9DpFt9/XiqavU1fcykszaPRxPdFDJh1L1x0X1nuf1AbhXLj7k0dwo361lZJHI8HvyO
	 fRS0pQsT8aSDa4nUZl8UAC5hu19K1ySU4AqqeBn6DJAg20GlBLx+P5cFRxZn0lLoeY
	 CA7DeprVcEBFEIxJRxfBmLK66b1E2pFS/yo9ILIe/V5VA01jdc2XHrqMrI4nmTYfZJ
	 H2nJ47Ilo5dog==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/2] Add driver for Samsung S6E8AA5X01 panel controller
Date: Wed, 25 Jun 2025 18:11:24 +0530
Message-Id: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHTuW2gC/33NQQ6CMBCF4auYrq1pB1rQlfcwLgY6QBOlpMUGQ
 7i7BTe60OX/kvlmZoG8pcBOu5l5ijZY16fI9jtWd9i3xK1JzUCAEgoyPmBPNx7wHh59y4OmElF
 NQnJCyI+asCGDLJ0Pnho7bfTlmrqzYXT+uX2Kcl3fqJbwG42SCy60qSsUhSTUZ2ODd248ON+yl
 Y3wQYH6Q0GiclMVUJUFKsy/qWVZXqlx6fENAQAA
X-Change-ID: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750855293; l=1632;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=k73QcSebOPGkqpr02iIqO4RpQPNEizVB/wnyJVCI8+c=;
 b=1nh652G8FvfSm8XUQZ/LSfWGtOT4OSDseTLvDBIZSZguu58pl3Noi+AmpdGnPj0+8Kpk+ZRSR
 eqgbJawYG6hA90oblpI0vuYMZz2lLvIcN4JWAlHroS+jou6rFxQdmpV
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

This patch series introduces a driver for Samsung S6E8AA5X01, which is
an AMOLED MIPI DSI panel controller. This panel is found in several
(mostly Samsung) phones, in at least two different sizes - 720x1280 and
720x1480.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- added brightness values for upto 500 nits.
- removed unused mutex object from panel code.
- Link to v2: https://lore.kernel.org/r/20250625-panel-samsung-s6e8aa5x01-v2-0-4db72b87a5a4@disroot.org

Changes in v2:
- fixed various dt_binding_check errors (conor)
- simplified panel enable sequencing (tzimmermann)
- did s/s6e8aa5x01_update_brightness/s6e8aa5x01_update_status (tzimmermann)
- added check for panel enable in s6e8aa5x01_update_status() (tzimmermann)
- used backlight_get_brightness() in appropriate places (tzimmermann)
- Link to v1: https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org

---
Kaustabh Chakraborty (2):
      dt-bindings: display: panel: document Samsung S6E8AA5X01 panel driver
      drm: panel: add support for Samsung S6E8AA5X01 panel controller

 .../bindings/display/panel/samsung,s6e8aa5x01.yaml |  78 ++
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa5x01.c   | 980 +++++++++++++++++++++
 4 files changed, 1070 insertions(+)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250523-panel-samsung-s6e8aa5x01-ea2496eafeda

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

