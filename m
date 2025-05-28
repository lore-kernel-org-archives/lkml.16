Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AF2868AC;
	Wed, 28 May 2025 12:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435846; cv=none; b=TIt0jPAIdepA37FSCzxVQtGbjNkVfO16Id8/+4Fx5dLS56QjLUl6tC27kJ3EPoeUvt3bPHeneA/C1Uq/Wl/5azoKeC14ZqeB2hTetJXNNuxDWWVaDlO3muQgWSJGm0KtpqA62TJsnOn1Q6IsINZUeQ+3mfaSOUXQuHLNzmUwhTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435846; c=relaxed/simple;
	bh=lg8sZyhu+VcyjBMvGtdunsncF5V4pCoYU4qY7RIgnBE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=O1DaG/zCO9DTpwPboZQDat4uvZ7sJdP0ItpEDdB86xbI+ScMnORGid9tjNT9QBpNnADSVw/xB2CRLkRV6BOb8Wvazo5QMyGTN5tVMqzu3wBSkb5+4dDDdZpnEozqFg02nu4JLJzCix39SBYPEMszYdNRNgvdO61gmYtaoFlwOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ar1XT32k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ar1XT32k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FCDC4CEEF;
	Wed, 28 May 2025 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748435846;
	bh=lg8sZyhu+VcyjBMvGtdunsncF5V4pCoYU4qY7RIgnBE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ar1XT32kc6nKc9+yO0O4pmoQ+wXsKgf/itLWOesD9PbDFfKiCntexhnaw8jQPVJ6Z
	 bcy1+/TLY0zyD7KICkp+zchf4N2FlYDFJFPx7u/MncCD8JzjHY0zHBWv7poSPhKa19
	 aUEnrEiUtamygs5sLEOGllRgm+MaPKB/et6ivXfIIJ8EoSVaHtnmQ7UKZAAUq6PCe9
	 2idRs6QXrGYtyWufMqjDFK/QzttDmFw4fE9HjWUxGMfDf7ebbAEvQdHqMmNRaTZIfy
	 iDT6LOx0P4ecijsp9LW44EvtJeoWuL+g+0R7ceaGSNIr3AfxQui5GPfWaQcAvtlpHy
	 oo8SPeQgL/C2A==
Date: Wed, 28 May 2025 07:37:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, shawnguo@kernel.org, 
 linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 meng.li@windriver.com
To: Meng Li <Meng.Li@windriver.com>
In-Reply-To: <20250528111751.3505224-1-Meng.Li@windriver.com>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
Message-Id: <174843567469.3636722.5654586098186872724.robh@kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node


On Wed, 28 May 2025 19:17:51 +0800, Meng Li wrote:
> When verifying watchdog feature on NXP ls1046ardb board,
> it doesn't work. Because the big-endian is deleted by accident,
> add it back.
> 
> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250528111751.3505224-1-Meng.Li@windriver.com:

arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
arch/arm64/boot/dts/freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#





