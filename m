Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD5C22EF5;
	Mon,  5 May 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746456246; cv=none; b=OmS+XL6YoYuBWEhj15NjgL7rkw9HyWco4OxLeClKL0yAyZmPRCYqVPTIxzV2WV2cm581TGjouHpwrxLsnTNioa9bHji+yZzeho7TWcXuEveSNhfPJkMiJ/2VO/jmz4DsL9PXaxPwQku66MsWYVxNiDZB0FtogfHnYszwR+2dd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746456246; c=relaxed/simple;
	bh=XsyivJj8/un8VajWm2cVmFTi84AikoNwIsIU5NgM5So=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=U8G2i2zs3hjX+3plda6Fi0dDXczMh7xxS5UAJcxZMrA7ZzcRM4f9ekBDrsXVCj4lkbjinfWkOvVoMVrHO3eeSLyTF6Yss4wP1FGLfDv2JCoSX2CY/x9he2n+NJV0MKpBbTEmIcFlDLQ8uu2/vGB2TXh3AUSLTffjK4XlYnSF0Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXF5Q6Sz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXF5Q6Sz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640C8C4CEE4;
	Mon,  5 May 2025 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746456245;
	bh=XsyivJj8/un8VajWm2cVmFTi84AikoNwIsIU5NgM5So=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YXF5Q6SzRH9qrIY5ncAnSzsiL62jyn0YxgTdye0LjCXXI1mmJgMJwdUL8OlWxBPWu
	 3/rPuQkd0Q4IqficksX/VSMcaxxcq9Q+i7nerRKCFSD7ciQ0EE8mrX84ZokGjkCB1O
	 4Bn2SFkAVD4TkxRTZNGJuqzu+xsh+68RvtUc0MwF3gwXYlhL64EGGqOTZSAN+6jGIu
	 x5KrhQuYdT5YXjY6y3fmNIwuLZr2gKA7KdT+hkkBtGID+VYAChgu8yULSx1dxbsnIE
	 UawoMF82T+c6uEEHxKhUgd15sI1DRAfycMiYPh0BDi2OnMlTrcO3Onwn0pHeT0TKnq
	 anlTXuBKiHM0g==
Date: Mon, 05 May 2025 09:44:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org
To: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
Message-Id: <174645593877.1245991.13955388800540703785.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles


On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
> regulator-fixed, even though they don't serve any purpose: all those
> regulators are handled as a whole by the mt6357-regulator driver. In
> fact this is the only dtsi in this family of chips where this is the
> case: mt6359 and mt6358 don't have any such compatibles.
> 
> A side-effect caused by this is that the DT kselftest, which is supposed
> to identify nodes with compatibles that can be probed, but haven't,
> shows these nodes as failures.
> 
> Remove the useless compatibles to move the dtsi in line with the others
> in its family and fix the DT kselftest failures.
> 
> Fixes: 55749bb478f8 ("arm64: dts: mediatek: add mt6357 device-tree")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6357.dtsi | 10 ----------
>  1 file changed, 10 deletions(-)
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
 Base: using specified base-commit 37ff6e9a2ce321b7932d3987701757fb4d87b0e6

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com:

arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'required-opps' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#





