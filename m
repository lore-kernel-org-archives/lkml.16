Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8028B7C9;
	Wed,  7 May 2025 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632521; cv=none; b=mG3SW4GraCAw15Jm8erAtjED/ah6w8ilaOB9eSdombMPBkXcJWATmvyndPVk+XOYo4XIjwxIU11mJDEFqulDlYRoXl1W5f6+AK8X6RPQQ18x3nAuRP5OYaC2yhv0DEKDQWI64N270gf197XCwYHi34IVDEJ7DvaIxXH4RxyA6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632521; c=relaxed/simple;
	bh=NCun+NhTWH48hbEa1EuIT6DCqQ2vujaGUcGfgfPDYNY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EPQG9N3do1cInBgmeEkJlr1mjegTpJGvgDFTX/wxErDj5GBMMlUjcbj9yFmNJ2VhmzdYV8MMDxxrLRMntqgARA5jNJezMMQNfJsdNW+gmWuO4XjhxEB/bpe1UapDDHj8wh8tIm/bbsyJbocGgdrFsopA67+tCDW4k8hpesMPA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayKxudTy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayKxudTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF742C4CEE2;
	Wed,  7 May 2025 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632521;
	bh=NCun+NhTWH48hbEa1EuIT6DCqQ2vujaGUcGfgfPDYNY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ayKxudTyJcemB7oHNmsFytdZuHFwII5dxe9hw71MFdX6RFZfnqI7hoW/oeJZ/+s6k
	 y2r1mzFoeZ7y+wVeQgCiXzAHinHNjme4Fv85kDtClkWiR+PBulywwOzGUTwno9IsCh
	 wyZx7ffJtIwiDDNxTMlc5zAzoxCmdGdBcB13tXlh6eB4Qy4ezREtGFTbkpzv7Orv7p
	 1+jxID5G7BYRYp+bg8GTlYqUPp2Gqjk7acNRtI+QeJB9lHl2JkKYe1pmdXhnyJCJfL
	 CdymfmqRxNZO2fU8s9/5PQdBhjgVKM2LTRB5c8/ANA4ycRpc5MLEJcgqYVG6oPQ/aC
	 ZTWONnpz2AElQ==
Date: Wed, 07 May 2025 10:41:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, w.egorov@phytec.de, 
 linux-arm-kernel@lists.infradead.org, kristo@kernel.org, 
 devicetree@vger.kernel.org, upstream@lists.phytec.de, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250507070008.1231611-1-d.schultz@phytec.de>
References: <20250507070008.1231611-1-d.schultz@phytec.de>
Message-Id: <174663232992.1557549.10416633655094198343.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv
 device nodes


On Wed, 07 May 2025 00:00:04 -0700, Daniel Schultz wrote:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 
> Changes in v2:
>   * Rebased to latest master branch.
> 
> Changes in v3:
>   * Added Reviewed-by
>   * Merged mboxes items for c7x and wkup+mcu rf5 nodes.
> 
> Daniel Schultz (4):
>   arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
>   arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
>   arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
>   arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP
> 
>  .../boot/dts/ti/k3-am62-phycore-som.dtsi      |  35 +++++-
>  .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 106 +++++++++++++++++-
>  2 files changed, 129 insertions(+), 12 deletions(-)
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
 Base: tags/v6.15-rc1-35-gd16e7d34352c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250507070008.1231611-1-d.schultz@phytec.de:

Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:203.1-7 Label or path c7x_0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:392.1-12 Label or path mcu_r5fss0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:396.1-18 Label or path mcu_r5fss0_core0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:431.1-13 Label or path wkup_r5fss0 not found
Error: arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi:435.1-19 Label or path wkup_r5fss0_core0 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 2
Error: arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:403.1-13 Label or path wkup_r5fss0 not found
Error: arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi:407.1-19 Label or path wkup_r5fss0_core0 not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am625-phyboard-lyra-rdk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am625-phyboard-lyra-rdk.dtb] Error 2
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'ti/k3-am625-verdin-wifi-ivy.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-dahlia.dtb' not remade because of errors.
make: Target 'ti/k3-j721e-common-proc-board.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-dev.dtb' not remade because of errors.
make: Target 'ti/k3-am642-evm.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-mallow.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-dahlia.dtb' not remade because of errors.
make: Target 'ti/k3-j742s2-evm.dtb' not remade because of errors.
make: Target 'ti/k3-am642-hummingboard-t.dtb' not remade because of errors.
make: Target 'ti/k3-am625-beagleplay.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-yavia.dtb' not remade because of errors.
make: Target 'ti/k3-am6528-iot2050-basic-pg2.dtb' not remade because of errors.
make: Target 'ti/k3-am68-sk-base-board.dtb' not remade because of errors.
make: Target 'ti/k3-am62p5-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am6528-iot2050-basic.dtb' not remade because of errors.
make: Target 'ti/k3-am62-pocketbeagle2.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced-m2.dtb' not remade because of errors.
make: Target 'ti/k3-am654-base-board.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced.dtb' not remade because of errors.
make: Target 'ti/k3-am62a7-phyboard-lyra-rdk.dtb' not remade because of errors.
make: Target 'ti/k3-am62a7-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-dev.dtb' not remade because of errors.
make: Target 'ti/k3-j722s-evm.dtb' not remade because of errors.
make: Target 'ti/k3-j721e-beagleboneai64.dtb' not remade because of errors.
make: Target 'ti/k3-am642-phyboard-electra-rdk.dtb' not remade because of errors.
make: Target 'ti/k3-am69-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced-pg2.dtb' not remade because of errors.
make: Target 'ti/k3-am68-phyboard-izar.dtb' not remade because of errors.
make: Target 'ti/k3-am642-hummingboard-t-pcie.dtb' not remade because of errors.
make: Target 'ti/k3-j7200-common-proc-board.dtb' not remade because of errors.
make: Target 'ti/k3-am62-lp-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-wifi-yavia.dtb' not remade because of errors.
make: Target 'ti/k3-j721s2-common-proc-board.dtb' not remade because of errors.
make: Target 'ti/k3-am642-tqma64xxl-mbax4xxl.dtb' not remade because of errors.
make: Target 'ti/k3-am67a-beagley-ai.dtb' not remade because of errors.
make: Target 'ti/k3-am642-hummingboard-t-usb3.dtb' not remade because of errors.
make: Target 'ti/k3-am642-sk.dtb' not remade because of errors.
make: Target 'ti/k3-am6548-iot2050-advanced-sm.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-mallow.dtb' not remade because of errors.
make: Target 'ti/k3-am625-phyboard-lyra-rdk.dtb' not remade because of errors.
make: Target 'ti/k3-am625-verdin-nonwifi-ivy.dtb' not remade because of errors.
make: Target 'ti/k3-j784s4-evm.dtb' not remade because of errors.
make: Target 'ti/k3-am625-sk.dtb' not remade because of errors.
make: Target 'ti/k3-j721e-sk.dtb' not remade because of errors.





