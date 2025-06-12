Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B482D8DA4;
	Thu, 12 Jun 2025 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759145; cv=none; b=WCb+R3/CS88J7SX6KQpqURxDf/O3VOFobc+t0yEPjOFh50tv1RlFpMl8LjWpbgOQ40XKJtgp4ZXWLkkiPX7wV0movrzGEhG1/9gC+1iqxTS9JpqsAvigBzHPz8OgQYvqIirBjnY1S0hw3qmB1P3rNe5+OEsWLT7T2z45LyOc9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759145; c=relaxed/simple;
	bh=+48g9boYrfhqh6oqAlx4hdDyZbb4+UXU4X2BzsEPKTQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CY/8xa3/sh90mGnEmsKamSwjhaWDDhq3CW56M4DQDadRtwNFimuXJlRdujo/sUQ3TXjo5QacpbZ+LZpd1KdAIvwasEFAfEjuiBZLazkT08RZg3Z5uZUwbBJMF5/pw+qNLEsQYwQ0pWF4fol291JgE6rPbMaZtUoEd31x4AQzXxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFSifGw/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFSifGw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0913C4CEF1;
	Thu, 12 Jun 2025 20:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759145;
	bh=+48g9boYrfhqh6oqAlx4hdDyZbb4+UXU4X2BzsEPKTQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KFSifGw/qMZ5yRxKIXmq+GhYB6lh8UKqjLSfyCCuMh4zDI+V1KBVBQwuXJYZFz9jW
	 FOTGRxLTY8uvJNbAKNfhBkNeyYrFGl1AkiXRVMg+K2UGP9Lqg5IgO+Kl5jqrl0RoRT
	 fF9dlKjBTGiyYUWmoXbZPatVajnHIeYgr1vy9L8bluO/YTaovLygxV61aStDrWVAwZ
	 /WkviVMZWpWeDaqT3xrWLzsT4w7Iyuu8UKHHTFdc8SlTjyxFIKsXhkDhNBZRY4v3FC
	 V/61ynrIBUs08wFaBeQg33GD+fKtqpxnIz/h1NPyD0L4M/P9rOEIxDjSrEG8KzLKEG
	 Gk6U95RG8Uqqw==
Date: Thu, 12 Jun 2025 15:12:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Yashwanth Varakala <y.varakala@phytec.de>, Shawn Guo <shawnguo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Teresa Remmet <t.remmet@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>, 
 Jan Remmet <j.remmet@phytec.de>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 upstream@lists.phytec.de, Fabio Estevam <festevam@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev
To: Yannic Moog <y.moog@phytec.de>
In-Reply-To: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
References: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
Message-Id: <174975871561.2915543.9713933816111618183.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add new imx imx95-libra-rdk-fpsc SBC


On Wed, 11 Jun 2025 15:05:29 +0200, Yannic Moog wrote:
> The Libra i.MX 95 is a SBC that consists of the Libra base board
> and the phyCORE i.MX 95 FPSC SoM.
> This series adds its binding and device trees.
> 
> ---
> Changes in v3:
> - fix more style issues
> - remove the rs232/485 gpio hog -> switch on the board is used instead
> - remove erroneously added build artefacts
> - Link to v2: https://lore.kernel.org/r/20250509-wip-y-moog-phytec-de-imx95-libra-v2-2-b241a915f2be@phytec.de
> 
> Changes in v2:
> - fix indentation error in bindings
> - align alias naming with FPSC enumeration
> - Link to v1: https://lore.kernel.org/r/20250507-wip-y-moog-phytec-de-imx95-libra-v1-0-4b73843ad4cd@phytec.de
> 
> ---
> Yannic Moog (2):
>       dt-bindings: add imx95-libra-rdk-fpsc
>       arm64: dts: add imx95-libra-rdk-fpsc board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ++++++++++
>  .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
>  4 files changed, 982 insertions(+)
> ---
> base-commit: 68087d05675e3ac0ed632bc7b175abf06617c584
> change-id: 20250415-wip-y-moog-phytec-de-imx95-libra-27c9ce555b91
> 
> Best regards,
> --
> Yannic Moog <y.moog@phytec.de>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 68087d05675e3ac0ed632bc7b175abf06617c584

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de:

arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usb@4c200000 (fsl,imx95-usb): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb'] is too long
	'fsl,imx95-usb' is not one of ['fsl,imx27-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx23-usb', 'fsl,imx25-usb', 'fsl,imx28-usb', 'fsl,imx35-usb', 'fsl,imx50-usb', 'fsl,imx51-usb', 'fsl,imx53-usb', 'fsl,imx6q-usb', 'fsl,imx6sl-usb', 'fsl,imx6sx-usb', 'fsl,imx6ul-usb', 'fsl,imx7d-usb', 'fsl,vf610-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8dxl-usb', 'fsl,imx8ulp-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx8mm-usb', 'fsl,imx8mn-usb', 'fsl,imx93-usb']
	'fsl,imx95-usb' is not one of ['fsl,imx6sll-usb', 'fsl,imx7ulp-usb']
	'fsl,imx27-usb' was expected
	'fsl,imx7ulp-usb' was expected
	'fsl,imx6ul-usb' was expected
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usb@4c200000 (fsl,imx95-usb): interrupts: [[0, 176, 4], [0, 174, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/usb@4c200000: failed to match any schema with compatible: ['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb']
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc'] is too long
	'fsl,imx95-usbmisc' is not one of ['fsl,imx25-usbmisc', 'fsl,imx27-usbmisc', 'fsl,imx35-usbmisc', 'fsl,imx51-usbmisc', 'fsl,imx53-usbmisc', 'fsl,imx6q-usbmisc', 'fsl,vf610-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx6ul-usbmisc', 'fsl,imx6sl-usbmisc', 'fsl,imx6sx-usbmisc', 'fsl,imx7d-usbmisc']
	'fsl,imx95-usbmisc' is not one of ['fsl,imx7ulp-usbmisc', 'fsl,imx8mm-usbmisc', 'fsl,imx8mn-usbmisc', 'fsl,imx8ulp-usbmisc']
	'fsl,imx6sll-usbmisc' was expected
	'fsl,imx6q-usbmisc' was expected
	'fsl,imx6ul-usbmisc' was expected
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): reg: [[0, 1277166080, 0, 512], [0, 1275133972, 0, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dtb: /soc/usbmisc@4c200200: failed to match any schema with compatible: ['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc']





