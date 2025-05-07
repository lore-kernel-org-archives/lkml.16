Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C17B28B4EF;
	Wed,  7 May 2025 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632519; cv=none; b=mrtcFKe+zCCA7OBVMtjVWfSmLh+uZ91RxgMeKyuDTL1+nA+pOjmhyXFoMf4mxvt1B/p5IpZ0uzd8V9H7PYwrePtDqzLPKBgKpAS0pEs1bbPOZwHyiXI+xBlaqEPFqI7+87IbNhFcTrAej6QmYbuG3v7nY0mhz4uGD4wN0dHPG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632519; c=relaxed/simple;
	bh=V499VMv+rPex1wvscWee8vau59a5tTXRvhSZFocwZ3E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lBuQR7Kyrm/+vFivDUGPoADWuYI4JhJ4IZUBerITualpVR02qLSa/+iY75zVRdPBssWJvfXQEXIgzlV/+3U+ElXL0nlchILrARoZh2K6HPngxCShQAToMBVjqJZipL+V4WyfpkPTG27JgqV8vhJ23Vf5vc0Y2hDPRwG1JO/SbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTV07ZyL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTV07ZyL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A014C4CEE2;
	Wed,  7 May 2025 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746632519;
	bh=V499VMv+rPex1wvscWee8vau59a5tTXRvhSZFocwZ3E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eTV07ZyLYysTTRFH5wy8M0Lo9JSlivRghPHy5tjGP8qJSAZJm7GP6MKpMuW54FCbV
	 PjHS+VFoQOAbVhrqtrFVIy3LSPw78UCySupjxCMTfVafeGD1DiammW+4IKZogrUYB3
	 h34qbfMbIp5yNhyeR1+Woc7wfhHd9VP36wM9lHfXYIbiXB5wizPwTIdr4fgtLUOsqb
	 ln2Zc5Anun9B6RDd0KeiDxOfJCt4bSg4aywKioxwhLSlaf16szGuGkP48EuzjPKh60
	 08F9O82Aa2tVq8Mhssf4EwsRAX2U+u8UiibCv7Wg/a0WZ40zjmae3sUjxGIEUbSboq
	 7j2mV9ltnvqSA==
Date: Wed, 07 May 2025 10:41:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de, 
 devicetree@vger.kernel.org, robertcnelson@gmail.com, kristo@kernel.org, 
 vigneshr@ti.com, w.egorov@phytec.de, nm@ti.com, 
 francesco.dolcini@toradex.com, linux-kernel@vger.kernel.org
To: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250507050847.912756-1-d.schultz@phytec.de>
References: <20250507050847.912756-1-d.schultz@phytec.de>
Message-Id: <174663232933.1557435.12503360883036162870.robh@kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-thermal: Add Files for
 each Temp. Grade


On Tue, 06 May 2025 22:08:44 -0700, Daniel Schultz wrote:
> The AM62x SoC supports three temperature ranges:
> * A: -40 to 105C - Extended Industrial
> * H:   0 to  95C - Commercial
> * I: -40 to 125C - Automotive
> 
> Add device tree include files to adjust the alert and critical trip
> points in k3-am62-thermal based on the temperature grade.
> 
> Passive trip points are always set 10C below critical.
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  .../dts/ti/k3-am62-thermal-automotive.dtsi    | 20 +++++++++++++++++++
>  .../dts/ti/k3-am62-thermal-commercial.dtsi    | 20 +++++++++++++++++++
>  .../dts/ti/k3-am62-thermal-industrial.dtsi    | 20 +++++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-automotive.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-commercial.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62-thermal-industrial.dtsi
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
 Base: tags/v6.15-rc1-6-gf1aff4bc199c (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/ti/' for 20250507050847.912756-1-d.schultz@phytec.de:

Error: arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi:6.1-13 Label or path main0_alert not found
Error: arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi:14.1-13 Label or path main1_alert not found
Error: arch/arm64/boot/dts/ti/k3-am62a-thermal-industrial.dtsi:22.1-13 Label or path main2_alert not found
FATAL ERROR: Syntax error parsing input tree
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am62a7-phyboard-lyra-rdk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am62a7-phyboard-lyra-rdk.dtb] Error 2
arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:14:10: fatal error: k3-am62a-thermal-automative.dtsi: No such file or directory
   14 | #include "k3-am62a-thermal-automative.dtsi"
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.dtbs:131: arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb] Error 1
make[2]: *** [scripts/Makefile.build:461: arch/arm64/boot/dts/ti] Error 2
make[2]: Target 'arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1475: ti/k3-am62a7-sk.dtb] Error 2
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





