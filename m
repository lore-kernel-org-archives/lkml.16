Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072A155312;
	Thu, 27 Mar 2025 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090759; cv=none; b=HAdcDF85lhqymDV64txMWqmZyvHxNI+UzaSNZlk5LrQaPnLAiQN5h0AoptTk7nP1vo+lQWnXbmrNYGRyOPCcU5ifi3THZ0YMCYk3NEDuPCQE71MSTMpkoa9uAQA27+gWuMyBAq7VxQm6HtYYhGtHK/iEA9rVtrc3Plvq6RKpUmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090759; c=relaxed/simple;
	bh=I5laCEMQQhC0jxJBzqkC6My5Y526yISp6HHNhnXyuoI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=epYC+nigpWD32W5ktxlXLaYq/vRJgYs2ZGCYEIKJBafP3lJIXC9lQtmoVJF8eDLBgPA/IBAoKgkrm0q5PO1PxsXHwjnQ5sQJ5yIPiuhxsT17ZcwkqrCq+P31Dh0VrmTh9HureTxnZN2ngfFMn4DDq8ktw3CJ8e8eH8LoS4H4XHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMcGsJxR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMcGsJxR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8F78C4CEDD;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090758;
	bh=I5laCEMQQhC0jxJBzqkC6My5Y526yISp6HHNhnXyuoI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hMcGsJxReA55sa/aPAywO6bcuZMTKolLAdnYiUMSjugG5pFpduJp7Bc9sG4gt416C
	 KmiJBEjMetOx3s1eyHB3RC8LnlK9VXNhOgfwE1ZpmxJcW/vjfNy72P/oZe2pakKT6S
	 EOnWb0cNIq++3lYu3CNIXCl6G6HHNDACnVNrRMowYOT9T2MvSbnEoBfbpWaOHAeuwI
	 7HD7jBHTLm+pEfQE0wLGunZTu59WqK9BMIbO1rjgYBYTX8cECyOim8h+yVhQN/iKD9
	 T/LMP6jS3mRvobHKLpxNHffDNUgTkUxE4KZkgxRrW4R44BYn+wRYNWnrs7DsykfCcS
	 tg7g+yW2X144Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF91FC3600B;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Subject: [PATCH v3 0/8] arm64: dts: freescale: Add support for the
 GOcontroll Moduline Display
Date: Thu, 27 Mar 2025 16:52:35 +0100
Message-Id: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEN05WcC/3XN0QqDIBTG8VcZXs+hx2yxq73HGMNM64DT0JBF9
 O6zrgaxy/8H53cWkkxEk8jttJBoMiYMvoQ4n4gelO8Nxa40AQaSAVQUPU6o3KvDNDo1U6saAN4
 YVhtJytUYjcXPLj6epQdMU4jz/iDzbf1vZU4ZlVq3ra25kJW490EHP8Xg3EWHN9nADL9IfUSgI
 CCssooL1vDrAVnX9QsP+up8+AAAAA==
X-Change-ID: 20250224-initial_display-fa82218e06e5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=2483;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=I5laCEMQQhC0jxJBzqkC6My5Y526yISp6HHNhnXyuoI=;
 b=7DfLoLe9EHr2CxFXvsX6B+b2N2FuAwbJ+o+BEYbd6wpwbYIid1+B5/IKTuFBwhZVf4HHD+v0f
 2MfEWUPAeUXCwNe5Vq4ivu3U5n2JEq25qg4sHgEjtUnRwov9iX1+Z6C
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
Maud Spierings (8):
      dt-bindings: arm: fsl: Add GOcontroll Moduline Display
      arm64: dts: imx8mp: Add pinctrl config definitions
      MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81 COM module
      MAINTAINERS: add maintainer for the GOcontroll Moduline controllers
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 MAINTAINERS                                        |  12 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  27 +
 ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 ++++
 ...tx8p-ml81-moduline-display-106-av123z7m-n17.dts | 133 +++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dtsi     | 535 ++++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 549 +++++++++++++++++++++
 7 files changed, 1357 insertions(+)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20250224-initial_display-fa82218e06e5

Best regards,
-- 
Maud Spierings <maudspierings@gocontroll.com>


