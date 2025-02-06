Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C5227581;
	Thu,  6 Feb 2025 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838421; cv=none; b=lZbDETUnYDTOecheFDQuB0a2yGVYh9Tv9aOXGeMkiw9mvoWQrz2fGlVulFJMCzDlYT7k8iOWz4uFwW5+9uFXqdY5x+97lBTLVEK9J0Rix6V+HZ675T3husv2PQzeDFkqDKkphWF5KYrxV+ioXSFWIsIKGwMqXleOBxhy49+LGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838421; c=relaxed/simple;
	bh=gPeWkhbcGBtBfTnD6brVIrLrhXkuhVZd0eeXSC+jsF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iQqv801odti+PRyilYmhwQwzrzXmmT+A5GJMyYsIsPbqTT54/zctZHRyrDPNoj1tL59uuhROtY56Iq+PNZgPiDjYRy1XPy+KxcIkTP49KCJBnupTgTPOka5Sm5ybpXPxsTAt6yGcwryXpVreHoo1E3h2V3rJgBmSzmJpzEX55WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ELGIaRJf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ELGIaRJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738838417;
	bh=gPeWkhbcGBtBfTnD6brVIrLrhXkuhVZd0eeXSC+jsF0=;
	h=From:Subject:Date:To:Cc:From;
	b=ELGIaRJfKatH5cZWPjuGgD0PRYtuMBQJQNy3R7tVD3nL9szN3i2ga5EokKLpJVZNc
	 j0P4l3tD+6n/wHLy4sj56SEin6o9MfnDtDtvzCtH5RPvUEA7aonbWOA8hu12HjrcUi
	 mCJ7mdYST0pcHYIdURognZKhB1Vn8LrMtLlcQ2cefo3WXLvFA9SuaLW/SzPcJ1r2Ei
	 E5MDGl4PqNf3+wCu8ZxkPt+G1IgQK5YSceYdzQDULjf8bGABlovvxHaJvPgATWA08G
	 qIXMp+uI/7+zwE0v2WKI1PR3xwBaq+i9aiUxWF0UaoJA7CzHbheaL1R9zl49R40Eb1
	 hqr9qwsoT3iHg==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E549B17E0FC3;
	Thu,  6 Feb 2025 11:40:16 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH v3 0/4] Add support for Mediatek Genio 510 EVK board
Date: Thu, 06 Feb 2025 11:38:07 +0100
Message-Id: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+RpGcC/3XQ20oDMRAG4FcpuTYy2Rzrle9RRDLJpA10N5qki
 1L67qYtgohe/hnyzeHMGtVMjT1tzqzSmlsuywjyYcPCwS974jmOzCaYNAgheeztde5OWuB7WnL
 hWgCX2gA6EIB+y8bXt0opf9zY3cvIh9x6qZ+3Lqu4vn6D6m9wFRy408ISQYpI7jmU49Fjqf4xl
 Jld0XX6Cel/oGlAKWwRRATnpPoNXe7jVno/jeX7fWaGvhEf9Tn3cQwrpMGkg/QmGTTORKuSEqO
 VNwoMUjBoMQzs8gUqIKmIUQEAAA==
X-Change-ID: 20250113-dts_mt8370-genio-510-3560b8010ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738838416; l=3025;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=gPeWkhbcGBtBfTnD6brVIrLrhXkuhVZd0eeXSC+jsF0=;
 b=tQzwd7PO2jXwURQnGBpIXl85HHlgp40J0D5x9X5OchIvcm8Mj++0qhy8t6fL3VygS3/DbEzPZ
 HlVvRBaWWnHACELWale/bEnlDxpUmoCsl78feJe9glaOxmhD/sBp1BC
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

This patchset adds the basic support of the Mediatek Genio 510 EVK
board, based on the Mediatek MT8370 SoC.

It adds a device-tree file for the board (mt8370-genio-510-evk.dtb)
and an include file for the SoC (mt8370.dtsi), in order to be able to
boot. As the board is very close to the Genio 700 EVK board, an include file
(mt8390-genio-common.dtsi) is also created to factorize the common
definitions.

The Genio 510 EVK has following features:
- MT8370 SoC
- MT6365 PMIC
- MT6319 Buck IC
- 4GB LPDDR4X
- 64GB eMMC 5.1
- 12V DC Jack
- Micro SD card slot
- Push Button x 4 (Power, Reset, Download and Home Key)
- LED x 4 (Power, Reset, System on and Charging Status)
- USB Device Port x 1 (Micro USB Connector)
- USB Host Port x 1 (Type-C USB Connector)
- 3.5mm Earphone Jack x 1 (with Microphone Input)
- 3.5mm Line Out Audio Jack x 1
- Analog Microphone x 1
- Digital Microphone x 2
- Gigabit Ethernet with RJ45 connector
- HDMI 2.0 TX port with Type A HDMI connector
- eDP port
- 3x UART with serial-to-usb converters and micro USB connectors
- M.2 Slot x 2
- I2C Capacitive Touch Pad
- 4-Lane DSI x 2
- 4-Data Lane CSI x 2
- I2S Pin header
- 40-Pin 2.54mm Pin Header x 1

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Changes in v3:
- Reword commit messages to use imperative mood
- Add missing code-review trailers in commit messages 
- Link to v2: https://lore.kernel.org/r/20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com

Changes in v2:
- Reword "dt-bindings: arm: mediatek: add mt8370-evk board" commit
  message to add details on MT8370 SoC and links to MT8188 and MT8390
- Add note about gpu support in "arm64: dts: mediatek: add support for
  MT8370 SoC" commit message
- Split "arm64: dts: mediatek: add device-tree for Genio 510 EVK board"
  commit in two, as requested by AngeloGioacchino Del Regno
- Link to v1: https://lore.kernel.org/r/20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com

---
Louis-Alexis Eyraud (4):
      dt-bindings: arm: mediatek: add mt8370-evk board
      arm64: dts: mediatek: add support for MT8370 SoC
      arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
      arm64: dts: mediatek: add device-tree for Genio 510 EVK board

 .../devicetree/bindings/arm/mediatek.yaml          |    5 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    8 +-
 .../boot/dts/mediatek/mt8370-genio-510-evk.dts     |   19 +
 arch/arm64/boot/dts/mediatek/mt8370.dtsi           |   64 ++
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 1033 +------------------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 1040 ++++++++++++++++++++
 7 files changed, 1134 insertions(+), 1036 deletions(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250113-dts_mt8370-genio-510-3560b8010ba9

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

