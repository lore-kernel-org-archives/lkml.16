Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611220ADF8;
	Wed,  2 Apr 2025 07:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577642; cv=none; b=sD+ZcUgBRoIyR49IuB8TsNvNTxrB0+IT9QOj1GQfVDt2yuO5DQsJHXhgmjGivN0B/j1EYWvGMoUJLIpU2MoOfCEMpZzMnqw927KaFpHxtM9qQ2qRqkhZp16Sw0X3PJID/sFA+7hNbdlPu1W+PLLViSQNBx7TzTGizxZcrTRORkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577642; c=relaxed/simple;
	bh=rtFp1kePr/uyknJSoRibqfpoN8jn1mXq+RKJ+wCBEh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nabcxiC80wDeFzVc/NpZHaskpipEvCJ9B6GitrtID9h4XjxqeA1dqq1ISmLl7SFThENfu4UxZ6SRWDWPVXSudQNuYoh+PhCguxEMssb6KF/9izEk3KSnoPVMURK3maEDDgvyfHBdAZbhLlcNMWlK66NQJCimOjB/Nlj4Rlf1juo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M91EAaGT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M91EAaGT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E191DC4CEDD;
	Wed,  2 Apr 2025 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743577642;
	bh=rtFp1kePr/uyknJSoRibqfpoN8jn1mXq+RKJ+wCBEh4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=M91EAaGTuqf6GQrNraGhYhXvBzTcHdZm6sR8AnX4VzWBnKqYo1xkMbf6iPzfwl8Os
	 fyi98a/smXX41QskDa1dw9FEqSaST1+OTQjhPVQ+p4b2F7TgO6eqXqgLQTc9RZibhQ
	 +NqTqLT/oeq8Ap9xZwj0AfN7N+5t6CRS5+E+kzSxp9+smodzjhUBaWTnnCd4+SSJ2y
	 AZTy9RNsMgy+4PQtwybJNB3Itrkm1aV1NJq30tb/N5z1IUNW2/gvo0hLzS7OIURFmn
	 gksDP+ksu40UG0xtEnJU4NSKkel8602vNnq0xYvRyD2a859uVa+KNYY/wgXeFFsPYE
	 hc/DQUMoVadkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF39EC28B20;
	Wed,  2 Apr 2025 07:07:21 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v4 0/9] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Wed, 02 Apr 2025 09:07:03 +0200
Message-Id: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfi7GcC/3XN0QqCMBTG8VeJXbfYznRaV71HRMx5pgfMxSZSi
 O/e9KbAuvx/cH5nYhEDYWSn3cQCjhTJ9ymy/Y7Z1vQNcqpTMxCQC4CMU08Dme5WU3x05sWdKQF
 kiUJjztLVI6Cj5yperqlbioMPr/XBKJf1vzVKLnhubVU5LVWeqXPjre+H4LvuYP2dLeAI34jeI
 pAQUM44I5UoZfETUR9EQbFFVEIyLI9opC60qTbIPM9v6nIJFj0BAAA=
X-Change-ID: 20250224-initial_display-fa82218e06e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743577640; l=2992;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=rtFp1kePr/uyknJSoRibqfpoN8jn1mXq+RKJ+wCBEh4=;
 b=biq/XdGYu+FB/CE29/Q9jV5LelpAd8IQGS/O/UdSfIAEXkmpygdD3XPVYkW2zdebjOw61Yz0E
 6Dfszm/WBStD4cKyjgb2oflgaw7OtQX4HGghBB9mzww2KEWs527sxH6
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

Add inital support for 2 variants of the Moduline Display controller.
This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
features an imx8mp SoC.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
Changes in v4:
- Add imx mailing list to ka-ro tx8p maintainer entry
- Fix several small indentation and ordering issues in devicetrees
- Change the two display adapter boards to overlays
- Add the missing patch for the Makefile to actually be able to build
  the new devicetrees
- Link to v3: https://lore.kernel.org/r/20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com

Changes in v3:
- Set regulator-boot-on and always-on on LDO5 of the pmic, after 20 ish
  seconds it auto disabled this LDO causing weird behaviour like
  ethernet droping out, wifi not working anymore. This LDO can control
  the IO voltage level of certain pins, just let it keep the u-boot
  value.
- Fix the comment style in imx8mp-pinfunc.h
- Rebase on newest next tag
- Link to v2: https://lore.kernel.org/r/20250226-initial_display-v2-0-23fafa130817@gocontroll.com

Changes in v2:
- Dropped the trivial-devices patch
- Added a patch with bindings for the gocontroll,moduline-module-slot
- Added a patch to spidev.c to enable the spidev driver for the module
  slot
- Added a missing usb-c connector in the av101hdt-a10 variant dts
- Switched to the new bindings for the module slots in the base dts
- Fixed some commit typos
- Link to v1: https://lore.kernel.org/r/20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com

---
Maud Spierings (9):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      arm64: dts: imx8mp: Add pinctrl config definitions
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
      arm64: dts: Add Moduline Display boards to Makefile

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 MAINTAINERS                                        |  13 +
 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso | 102 ++++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 ++++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 525 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++++++
 8 files changed, 1367 insertions(+)
---
base-commit: 5a8989cc1b2d2b181d72ea291c82267ce51f517d
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


