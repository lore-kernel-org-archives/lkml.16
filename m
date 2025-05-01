Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE607D515;
	Thu,  1 May 2025 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746072930; cv=none; b=E2/1r+in7+ayXs4tTYpPwy/JHhiIPKfIcI6OHcEbwU9OA6Z/HUcOEzFqLTQeGn/BCtr6YQWt5fey0PFDaqgy+r3S6zqOH/TONyx8iUZnvnQC91sCDHAnbS7XJSSEl31bRDQOqItbdqFhl9/wWeHhuKwuFpkSoltklZf5YQR/oDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746072930; c=relaxed/simple;
	bh=buPxZBousmKo9OStYdQccta50qsdElaO21GDRbmAvRM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=j8f3NlNzGpfi9THWM5lG2jtumWN4DaHdyeVd2D7oWjsjym0g9hMQT3a1dqpDvTg1EzsEiCrvojzrvCq2gnv1sZVXICXUrWrFA4hoJuAfLHk8ec0ERFqXeeiVnP7OJ34UveNUEXzProcrU83VtLaFVmwo8KsnT1XSNFymUMAfW30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBZCO0Ep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBZCO0Ep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B70EC4CEE3;
	Thu,  1 May 2025 04:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746072930;
	bh=buPxZBousmKo9OStYdQccta50qsdElaO21GDRbmAvRM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JBZCO0Epyf9CUJvXNT6QWXd3n4pi9p3rcEMdewXPrnqGzzklEUGcnDXzZRV7L1HeL
	 8FIDuSgNsvI6QpztWAGvRmuBXo2TWuHKRSlbkmQ3ku4rvvH+Sl8Ufx2kK7enAyt5CR
	 7RzyuMg0UnjjggKqkFVr6oXALWcz6OKu199mtGEf5GimXR6WWvpkkG7sOaL1TwHHWx
	 J8K4RIWfE7siz/n3gZv8zlV4qPLjFKKKvl8X3p5WzaauD73TOaULb6vMGJNMqjBt2Q
	 qGms6AITyQmABxeHM4tH/KEEm+praYVNqavldOYi0EOSdqDwwZMiPrQPiOpzVFskvc
	 LnPVTKF0Df0iQ==
Date: Wed, 30 Apr 2025 23:15:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Message-Id: <174607289976.949416.5265834490992116431.robh@kernel.org>
Subject: Re: [PATCH 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support


On Wed, 30 Apr 2025 18:36:28 +0300, Ioana Ciornei wrote:
> The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
> worked in mainline. The DT files were submitted initially as-is, and
> there is a downstream driver for the QIXIS CPLD device:
> https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> 
> Since the HW works with the already existing
> driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
> strings to also cover these 3 new boards, instead of trying to upstream
> a duplicate driver.
> 
> This patch set also adapts the DT nodes for each of the affected boards
> so that we match on the new compatible strings.
> 
> The last patch describes the two on-board RGMII PHYs found on the
> LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
> driven MDIO mux.
> 
> Ioana Ciornei (5):
>   dt-bindings: mfd: add bindings for QIXIS CPLD
>   mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
>   arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
>     driver
>   arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
>     driver
>   arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
> 
> Vladimir Oltean (1):
>   arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
>     driver
> 
>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
>  .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
>  .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
>  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
>  drivers/mfd/simple-mfd-i2c.c                  |  3 +
>  5 files changed, 103 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> 
> --
> 2.25.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250429 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250430153634.2971736-1-ioana.ciornei@nxp.com:

arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: fpga@66 (fsl,lx2160a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: fpga@66 (fsl,ls1028a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#
arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: fpga@66 (fsl,lx2162a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml#





