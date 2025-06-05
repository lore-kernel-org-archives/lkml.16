Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0495E221F38;
	Thu,  5 Jun 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127774; cv=none; b=eu50wPr3eAWPnRcMQ2EkNX2rMjdYdSoh41tnlJc0BVdDGLfywedLZVC61dFOZf+SD5OjKYCtWJ87O+sBtGDFuA3Q63bBYTmhmI6Ndt3LfSDkYBXTAVsKUycTFQWh+95KlLEe9jPSIyinmyDiqOYzySjGGKH+jaIVg7LJ2zTQmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127774; c=relaxed/simple;
	bh=wOyBq9EpZecYJyv7wq3MR1rHkJcXHOvYjUqxSvokmTs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Xhm/ERbKbdI5I8W2xHWNvjFjXT5SD9oofyAn5crubAuGvNnvrDLipbnDb8YBIyKlMqYFjwgk6ds30GAycm6eae6VtkVNUPVDddGuRQ91aWXcy0BuRW6qEyGW06KcozkO5GHJUxI3AB+hTIV/qhRBfN64l0dgsir7I4QFSV/4w20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfKV+Pmr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfKV+Pmr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E53C4CEE7;
	Thu,  5 Jun 2025 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749127773;
	bh=wOyBq9EpZecYJyv7wq3MR1rHkJcXHOvYjUqxSvokmTs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=TfKV+Pmr4EFYF/h1fgPP3YxemfqOZpw0nMbXRgxITIFZqso5TKk+Hx5jlEPHLyuxt
	 3mc62gPFkfv23qGaYPR+uvCLsKbTCFGzaAEgdShaPBslHe76A95rzyd3wjsOu+Wrls
	 zbghj0o+6XGS2r4+wSocF3xWXtaow9AkfCk0x2J9IMFLPCZoscSohWBmJX1AC0X3Yo
	 VVU8OWdUUUI/PgCUkNtG9PInP4pjTJ2lkql8HaUqm98hk9jGPiosrXKo+RGbT8jW5T
	 jUut+9pTd8famE37mdM/khYhJdXvmnBxz98WJKPCCG39In05ee+3moUlePAaz2gdVK
	 I4sKpERPkZ/og==
Date: Thu, 05 Jun 2025 07:49:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Ray Chang <ray.chang@technexion.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
To: Richard Hu <richard.hu@technexion.com>
In-Reply-To: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
References: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
Message-Id: <174912725086.2341088.4909342714758146412.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and
 WB-EDM-G carrier board support


On Thu, 05 Jun 2025 15:09:40 +0800, Richard Hu wrote:
> Add initial support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
> carrier board.
> 
> Change in V2:
> - Ensured accurate `To:` and `Cc:` addresses by utilizing
>   `b4 prep --auto-to-cc`. (Thanks to Krzysztof Kozlowski for the
>   tip on this command and helpful suggestion from Rob Herring)
> 
> in patch 1/2:
>         - Add Acked-by tag
> 
> in patch 2/2:
>         - Generic Node Naming: Refactored device tree node names for I2C
>           GPIO expanders, the USB Type-C controller, and the PMIC to adhere
>           to generic naming conventions (e.g., `gpio@21`, `usb-typec@67`,
>           `pmic@25`).
> 
>         - Removed Unused SPI Node: Eliminated the `spidev1` node due to an
>           incorrect and non-existent compatible string (`rohm,dh2228fv`).
> 
>         - Minor formatting improvements (e.g., whitespace, indentation).
> 
> Signed-off-by: Richard Hu <richard.hu@technexion.com>
> ---
> Ray Chang (1):
>       dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board
> 
> Richard Hu (1):
>       arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml    |   7 +
>  arch/arm64/boot/dts/freescale/Makefile            |   1 +
>  arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 403 +++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi   | 839 ++++++++++++++++++++++
>  4 files changed, 1250 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250604-add-technexion-edm-g-imx8m-plus-som-79adf0b397eb
> 
> Best regards,
> --
> Richard Hu <richard.hu@technexion.com>
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
 Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com:

arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: i2c-gpio-brd-conf (i2c-gpio): $nodename:0: 'i2c-gpio-brd-conf' does not match '^i2c(@.+|-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dtb: i2c-gpio-brd-conf (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#





