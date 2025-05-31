Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE29460
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748682436; cv=none; b=gdWU6eHsdp/Cc91pl5r2W6xv/ySEm1lLvmrSEvIY/OdWE+pa0BHqzJ58KTn6jn3YAWP4gDPtWZvZEZmqtv87NBrDs9WXUSMcQKWP5Hz0DTc+dhz2ku1NBSLAkiYPMbcQRf7F5CWgw3MFtUWNAPjTcqEhzIeyuoaSadmiLo+ZzZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748682436; c=relaxed/simple;
	bh=4ZYLc8Zn1rfuN+c6iNApSM4/MwUITsXqpTrziZBVtf8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=D3lweVLWZErWbvKOOT19EM/dJuTswW0nYDerP5ywukmYx2xMXuklaiAeta6l0u1tCQWU7UbJwPa+qgxi3h9SRtvXHbZIL5P0m94ThlKC1AMhbIuCnO2n3eGqE/1OxuPeMxfVkVQfsmY8YgkFeaAk2E0TVazj92gGZ0QdMjskZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MOWwqF/L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Oq9qFGg8; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MOWwqF/L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Oq9qFGg8"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 78AF41140138;
	Sat, 31 May 2025 05:07:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 05:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748682428;
	 x=1748768828; bh=WYZpE+1VdJaKRvjRDJJJu1Eh9gtXks9fzcVGHujkPsI=; b=
	MOWwqF/Lh7jgy+pJpvFI66RgtTMtkVJ4g7T56vheaquc4gCw/fuHiN8AS11OK8oQ
	RGzLTC3iXNtWcTuh8PP/VAo+EkLe886nvJ4x/TmdMgABk9KNPTlV8txCUw4W+J1r
	lNzCqooKpuNgHB1Ho7LXC3CVpkzG1hZNTHAULJwK8nEPMAalFtgTbdPyXzo20YEv
	1YhRGlkUO55jZE3WvBBCbpzgWQd2S6zChe0u0qcsFWYEzTSuOnecyuuAlrJdMYBl
	ASv652UWmMhYDV7BaSHxWA754nusp16uOPvx+81o7ihlSJrV3CEoYHXUf8Vq9jsF
	D+Kt25Gsy8RHT1R1cSXm6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748682428; x=
	1748768828; bh=WYZpE+1VdJaKRvjRDJJJu1Eh9gtXks9fzcVGHujkPsI=; b=O
	q9qFGg8doLUZRZKtA1mB1z8CSZG1csyBkuYoBfQZTFHU19wvb4scK6tVAa0VgFz0
	57o9CgaAqiwMf167bghb6Q8ZytXPewgDfMdaGIK44q1fvMcUzHekQ/LTKDCe5Op/
	qz40A3NvpM5JsM8kuTNAtWuXpDBmzw1pI9aA3qghrcXdAzWXu/6qjkp08ntoiq1K
	PM+HFwdLRF62EK3WJNCGJhonAxH6Fy5lc2rBVO6Aa2aZZ4Iec7jyVFxZ4s9loiys
	HZQyZ1tzXt4WmtBbignrCpP3uEuwAKj2CBxGsOqNHWuVvBw4etB5FPjPd0aXDTwj
	jz0WEu8onSttHcWN3bSBQ==
X-ME-Sender: <xms:vMY6aPCAZuPqEqzLQhWicTrAoftUWno-iJmh921PuvpvCB1GNeJDKw>
    <xme:vMY6aFiisi_YFacr5i6uvfM5ZekjPBpDiAs71alkuV-kZpP0_ibquQTzbUZsTpBzp
    6nyfSk9yWevsaO_V_0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudehtdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeefueegkeffveeu
    geehieehiedukeegfefhffeutdettdffteeluefhheetkeekvdenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprh
    gtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvhgrlhgu
    sheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:vMY6aKmHar0NSNIl9VwiKzAiRb8Ct2c9AIcJBlNXMGIqlALBSdaZkA>
    <xmx:vMY6aBwF7T7ZYkVz9dpoaAFf-CY0PAI4lZzfSZwjRrSdIAagdG79Qg>
    <xmx:vMY6aEQZlvcoObktoFgJt87FyQkraxQUHBQVzL2tGqlqHUSZMsXJyg>
    <xmx:vMY6aEZ2MgnfTVPiHV37sQrEgmZLFrC4cdmEPRWC_190o8qu1VbyJw>
    <xmx:vMY6aLaRIL6NrxAlzuvt7FNdEELyJVdEtwDBVPQMlasquP5JW8kQklGE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 27CCC700060; Sat, 31 May 2025 05:07:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T97262eb0f1793ba4
Date: Sat, 31 May 2025 11:06:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
In-Reply-To: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 4/5] soc: devicetree updates for 6.16
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e2=
59b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-d=
t-6.16

for you to fetch changes up to 3f07353e2fd3e154921e539044b26e85ca910dbe:

  Merge tag 'renesas-dts-for-v6.16-tag5' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/geert/renesas-devel into soc/dt (2025-05-30 09:10:42=
 +0200)

----------------------------------------------------------------
soc: devicetree updates for 6.16

There are 11 newly supported SoCs, but these are all either new
variants of existing designs, or straig reuses of the existing
chip in a new package:

 - RK3562 is a new chip based on the old Cortex-A53 core, apparently
   a low-cost version of the Cortex-A55 based RK3568/RK3566.

 - NXP i.MX94 is a minor variation of i.MX93/i.MX95 with a different
   set of on-chip peripherals.

 - Renesas RZ/V2N (R9A09G056) is a new member of the larger RZ/V2 family

 - Amlogic S6/S7/S7D

 - Samsung Exynos7870 is an older chip similar to Exynos7885

 - WonderMedia wm8950 is a minor variation on the wm8850 chip
 - Amlogic s805y is almost idential to s805x

 - Allwinner A523 is similar to A527 and T527

 - Qualcomm MSM8926 is a variant of MSM8226

 - Qualcomm Snapdragon X1P42100 is related to R1E80100

There are also 65 boards, including reference designs for the chips
above, this includes

 - 12 new boards based on TI K3 series chips, most of them from
   Toradex

 - 10 devices using Rockchips RK35xx and PX30 chips

 - 2 phones and 2 laptops based on Qualcomm Snapdragon designs

 - 10 NXP i.MX8/i.MX9 boards, mostly for embedded/industrial uses

 - 3 Samsung Galaxy phones based on Exynos7870

 - 5 Allwinner based boards using a variety of ARMv8 chips

 - 9 32-bit machines, each based on a different SoC family

Aside from the new hardware, there is the usual set of cleanups and
newly added hardware support on existing machines, for a total of 965
devicetree changesets.

----------------------------------------------------------------
Aaron Kling (12):
      arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
      arm64: tegra: Enable PWM fan on the Jetson TX2 Devkit
      arm64: tegra: Drop remaining serial clock-names and reset-names
      arm64: tegra: Add DMA properties for Tegra186 and Tegra194 UARTs
      arm64: tegra: p3310: Explicitly enable GPU
      arm64: tegra: p2180: Explicitly enable GPU
      arm64: tegra: Bump #address-cells and #size-cells on Tegra186
      arm64: tegra: Add uartd serial alias for Jetson TX1 module
      media: dt-bindings: Document Tegra186 and Tegra194 cec
      arm64: tegra: Add fallback CEC compatibles
      arm64: tegra: Add CEC controller on Tegra210
      arm64: tegra: Wire up CEC to devkits

Abel Vesa (12):
      arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
      arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retime=
rs
      arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort suppo=
rt
      dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD an=
d OLED
      arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight su=
pport
      arm64: dts: qcom: x1e78100-t14s: Add OLED variant
      arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pi=
n configs
      arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer=
 vregs
      arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI size
      arm64: dts: qcom: x1e80100-*: Drop useless DP3 compatible override
      arm64: dts: qcom: x1e001de-devkit: Enable support for both Type-A =
USB ports

Abhinaba Rakshit (2):
      arm64: dts: qcom: qcs615: add TRNG node
      arm64: dts: qcom: qcs615: add QCrypto nodes

Adam Ford (10):
      arm64: dts: imx8mm-beacon: Fix RTC capacitive load
      arm64: dts: imx8mn-beacon: Fix RTC capacitive load
      arm64: dts: imx8mp-beacon: Fix RTC capacitive load
      arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for H=
DMI audio
      arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for H=
DMI audio
      arm64: dts: imx8mm-beacon: Configure Ethernet PHY reset and GPIO I=
RQ
      arm64: dts: imx8mn-beacon: Configure Ethernet PHY reset and GPIO I=
RQ
      arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
      arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
      arm64: dts: imx8mp-beacon: Enable RTC interrupt and wakeup-source

Ajit Pandey (1):
      arm64: dts: qcom: sm4450: Add RPMh power domains support

Akhil R (1):
      arm64: tegra: Add I2C aliases for Tegra234

Aleksandrs Vinarskis (6):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable external DP sup=
port
      arm64: dts: qcom: x1e001de-devkit: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-hp-x14: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: enable MICs LDO
      dt-bindings: arm: qcom: Add Asus Zenbook A14

Alexander Stein (11):
      ARM: dts: ls1021a-tqmals1021a: Fix license
      ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
      ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
      ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JV=
GH33
      ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB dis=
play
      ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB dis=
play
      ARM: dts: ls1021a-tqmals1021a: change sound card model name
      arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camer=
a V2 overlay
      arm64: dts: freescale: add initial device tree for TQMa8XxS
      arm64: dt: imx95: Add TQMa95xxSA
      dt: bindings: arm: add bindings for TQMa95xxSA

Alexey Charkov (4):
      dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      ARM: dts: vt8500: Add VIA APC Rock/Paper board
      ARM: dts: vt8500: add DT nodes for the system config ID register
      ARM: dts: vt8500: list all four timer interrupts

Alexey Klimov (1):
      arm64: dts: qcom: qrb5165-rb5: add compressed playback support

Alexey Minnekhanov (5):
      arm64: dts: qcom: sdm630: Add missing resets to mmc blocks
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card dete=
ct GPIO
      arm64: dts: qcom: sdm630: Add modem metadata mem
      arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
      arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning

Alok Tiwari (1):
      arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node

Andre Przywara (14):
      arm64: dts: allwinner: Add Allwinner A523 .dtsi file
      dt-bindings: vendor-prefixes: Add YuzukiHD name
      dt-bindings: arm: sunxi: Add new board names for A523 generation
      arm64: dts: allwinner: a523: add Avaota-A1 router support
      arm64: dts: allwinner: a523: add X96Q-Pro+ support
      arm64: dts: allwinner: a523: add Radxa A5E support
      dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
      arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
      arm64: dts: allwinner: h616: Add Mali GPU node
      arm64: dts: allwinner: h616: enable Mali GPU for all boards
      arm64: dts: allwinner: a100: set maximum MMC frequency
      dt-bindings: vendor-prefixes: Add Liontron name
      dt-bindings: arm: sunxi: Add Liontron H-A133L board name
      arm64: dts: allwinner: a100: add Liontron H-A133L board support

Andreas Kemnade (2):
      ARM: dts: omap4: panda: fix resources needed for Wifi
      ARM: dts: omap4: panda: cleanup bluetooth

Andrej Picej (1):
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

Andrew Davis (7):
      dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl pr=
operty
      arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
      arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
      arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
      arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region
      dt-bindings: mfd: ti,j721e-system-controller: Add compatible strin=
g for AM654
      arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101=
 panel

Andy Yan (9):
      arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
      ARM: dts: rockchip: Add aliases for rk3036-kylin MMC devices
      arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5=
 EVB
      arm64: dts: rockchip: Enable HDMI1 on Cool Pi CM5 EVB
      arm64: dts: rockchip: Enable HDMI audio outputs for Cool Pi CM5 EVB
      arm64: dts: rockchip: Add eDP1 dt node for rk3588
      arm64: dts: rockchip: Enable eDP display for Cool Pi GenBook
      ARM: dts: rockchip: Add ref clk for hdmi
      Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"

AngeloGioacchino Del Regno (8):
      arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power dom=
ains
      dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
      dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
      arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
      arm64: dts: mediatek: Add MT6893 pinmux macro header file
      arm64: dts: mediatek: mt8390-genio-common: Add Display on DSI0
      arm64: dts: mediatek: mt8188: Address binding warnings for MDP3 no=
des
      Revert "arm64: dts: mediatek: mt8390-genio-common: Add firmware-na=
me for scp0"

Arnd Bergmann (43):
      Merge tag 'socfpga_dts_updates_for_v6.15' of https://git.kernel.or=
g/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt
      Merge tag 'renesas-dt-bindings-for-v6.16-tag1' of https://git.kern=
el.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'renesas-dts-for-v6.16-tag1' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'renesas-dts-for-v6.16-tag2' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'arm-soc/for-6.16/devicetree' of https://github.com/Broa=
dcom/stblinux into soc/dt
      Merge tag 'arm-soc/for-6.16/devicetree-arm64' of https://github.co=
m/Broadcom/stblinux into soc/dt
      Merge tag 'asahi-soc-dt-6.16' of https://github.com/AsahiLinux/lin=
ux into soc/dt
      Merge tag 'v6.16-rockchip-dts64-1' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v6.16-rockchip-dts32-1' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'tegra-for-6.16-dt-bindings' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-6.16-arm64-dt' of https://git.kernel.org/pub/=
scm/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'tegra-for-6.16-arm-dt' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/tegra/linux into soc/dt
      Merge tag 'omap-for-v6.16/dt-signed' of https://git.kernel.org/pub=
/scm/linux/kernel/git/khilman/linux-omap into soc/dt
      Merge tag 'imx-bindings-6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/shawnguo/linux into soc/dt
      Merge tag 'imx-dt-6.16' of https://git.kernel.org/pub/scm/linux/ke=
rnel/git/shawnguo/linux into soc/dt
      Merge tag 'imx-dt64-6.16' of https://git.kernel.org/pub/scm/linux/=
kernel/git/shawnguo/linux into soc/dt
      Merge tag 'thead-dt-for-v6.16' of https://github.com/pdp7/linux in=
to soc/dt
      Merge tag 'ti-k3-dt-for-v6.16' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/ti/linux into soc/dt
      Merge tag 'samsung-dt64-6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux into soc/dt
      Merge tag 'amlogic-arm-dt-for-v6.16' of https://git.kernel.org/pub=
/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'amlogic-arm64-dt-for-v6.16' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/amlogic/linux into soc/dt
      Merge tag 'dt64-cleanup-6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'nuvoton-arm-6.16-devicetree' of https://git.kernel.org/=
pub/scm/linux/kernel/git/joel/bmc into soc/dt
      Merge tag 'qcom-arm64-for-6.16' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'dt-vt8500-6.16' of https://git.kernel.org/pub/scm/linux=
/kernel/git/krzk/linux-dt into soc/dt
      Merge tag 'qcom-arm32-for-6.16' of https://git.kernel.org/pub/scm/=
linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'spacemit-dt-for-6.16-1' of https://github.com/spacemit-=
com/linux into soc/dt
      Merge tag 'stm32-dt-for-v6.16-1' of https://git.kernel.org/pub/scm=
/linux/kernel/git/atorgue/stm32 into soc/dt
      Merge tag 'sunxi-dt-for-6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sunxi/linux into soc/dt
      Merge tag 'at91-dt-6.16' of https://git.kernel.org/pub/scm/linux/k=
ernel/git/at91/linux into soc/dt
      Merge tag 'microchip-dt64-6.16' of https://git.kernel.org/pub/scm/=
linux/kernel/git/at91/linux into soc/dt
      Merge tag 'riscv-dt-for-v6.16' of https://git.kernel.org/pub/scm/l=
inux/kernel/git/conor/linux into soc/dt
      Merge tag 'renesas-dts-for-v6.16-tag3' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'renesas-dts-for-v6.16-tag4' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt
      Merge tag 'mvebu-dt64-6.16-1' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/gclement/mvebu into soc/dt
      Merge tag 'v6.16-rockchip-dts64-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v6.16-rockchip-dts64-3' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'v6.16-rockchip-dts32-2' of https://git.kernel.org/pub/s=
cm/linux/kernel/git/mmind/linux-rockchip into soc/dt
      Merge tag 'mtk-dts64-for-v6.16-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/mediatek/linux into soc/dt
      Merge tag 'qcom-arm32-for-6.16-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'qcom-arm64-for-6.16-2' of https://git.kernel.org/pub/sc=
m/linux/kernel/git/qcom/linux into soc/dt
      Merge tag 'juno-updates-6.16' of https://git.kernel.org/pub/scm/li=
nux/kernel/git/sudeep.holla/linux into soc/dt
      Merge tag 'renesas-dts-for-v6.16-tag5' of https://git.kernel.org/p=
ub/scm/linux/kernel/git/geert/renesas-devel into soc/dt

Artur Weber (3):
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI
      ARM: dts: Drop DTS for BCM59056 PMU

Axe Yang (1):
      arm64: dts: mediatek: mt8186-corsola: make SDIO card removable

Barnab=C3=A1s Cz=C3=A9m=C3=A1n (1):
      arm64: dts: qcom: msm8917-xiaomi-riva: Add display backlight

Ben Wolsieffer (1):
      ARM: dts: stm32: add low power timer on STM32F746

Biju Das (13):
      arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
      arm64: dts: renesas: r9a09g057: Add support for enabling SDHI inte=
rnal regulator
      arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
      arm64: dts: renesas: rzg3e-smarc-som: Add support to enable SD on =
SDHI0
      arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
      arm64: dts: renesas: r9a09g047: Add ICU node
      arm64: dts: renesas: Remove undocumented compatible micron,mt25qu5=
12a
      arm64: dts: renesas: r9a09g047: Add CANFD node
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CAN Transceiver
      arm64: dts: renesas: r9a07g044: Add GPT support
      arm64: dts: renesas: r9a07g054: Add GPT support
      arm64: dts: renesas: rzg2l-smarc: Enable GPT on carrier board

Bjorn Andersson (5):
      Merge branch '20250203063427.358327-2-alexeymin@postmarketos.org' =
into arm64-for-6.15
      Merge branch '20250313110359.242491-1-quic_mmanikan@quicinc.com' i=
nto arm64-for-6.15
      Merge branch 'arm64-for-6.15' into arm64-for-6.16
      Merge branch 'arm32-for-6.15' into arm64-for-6.16
      Merge branch 'arm32-for-6.15' into arm32-for-6.16

Cathy Xu (1):
      arm64: dts: mediatek: mt8196: Add pinmux macro header file

Chaoyi Chen (4):
      dt-bindings: arm: rockchip: Add rk3588 evb2 board
      arm64: dts: rockchip: Add rk3588 evb2 board
      dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
      arm64: dts: rockchip: Add rk3399-evb-ind board

Charan Pedumuru (2):
      ARM: tegra: Rename the apbdma nodename to match with common dma-co=
ntroller binding
      dt-bindings: dma: nvidia,tegra20-apbdma: convert text based bindin=
g to json schema

Chen-Yu Tsai (1):
      arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0

Cheng Jiang (1):
      arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

Chris Morgan (2):
      arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
      arm64: dts: rockchip: Enable HDMI0 audio output for Indiedroid Nova

Christian Hewitt (1):
      arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible

Chuan Liu (2):
      arm64: dts: amlogic: C3: Add clk-measure controller node
      arm64: dts: amlogic: S4: Add clk-measure controller node

Chukun Pan (13):
      arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
      arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
      arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
      arm64: dts: qcom: ipq6018: rename labels of mp5496 regulator
      arm64: dts: qcom: ipq6018: add LDOA2 regulator
      arm64: dts: rockchip: Add missing uart3 interrupt for RK3528
      arm64: dts: rockchip: Add DMA controller for RK3528
      arm64: dts: rockchip: Add UART DMA support for RK3528
      arm64: dts: rockchip: Move SHMEM memory to reserved memory on rk35=
88
      arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
      arm64: dts: rockchip: Add pwm nodes for RK3528
      arm64: dts: rockchip: Enable regulators for Radxa E20C
      arm64: dts: rockchip: Move rk3568 PCIe3 MSI to use GIC ITS

Ciprian Marian Costea (1):
      arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module over I2C0

Cl=C3=A9ment L=C3=A9ger (1):
      ARM: dts: renesas: Add r9a06g032-rzn1d400-eb board device-tree

Conor Dooley (1):
      riscv: dts: renesas: Add specific RZ/Five cache compatible

Da Xue (1):
      arm64: dts: amlogic: gxl: set i2c bias to pull-up

Damon Ding (2):
      arm64: dts: rockchip: Add eDP0 node for RK3588
      arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

Daniel Baluta (5):
      arm64: dts: imx8mp: Use resets property
      arm64: dts: imx8mp: Add mu2 root clock
      arm64: dts: imx8mp: Configure dsp node for rproc usage
      arm64: dts: imx8mp: Add DSP clocks
      arm64: dts: imx8mp-evk: Enable DSP node for remoteproc usage

Daniel Schultz (6):
      arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal al=
ert
      arm64: dts: ti: k3-am62x-phyboard-lyra-gpio-fan: Update cooling ma=
ps
      arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
      arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
      arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
      arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x =
DSP

Daniil Titov (1):
      arm64: dts: qcom: pm8937: Add LPG PWM driver

Danila Tikhonov (3):
      arm64: dts: qcom: sm7325-nothing-spacewar: Add CAM fixed-regulators
      arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs
      dt-bindings: arm: qcom: Add SM7150 Google Pixel 4a

Dario Binacchi (9):
      ARM: dts: mxs: use padconfig macros
      ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
      dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
      ARM: stm32: add a new SoC - STM32H747
      dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
      ARM: dts: stm32: add uart8 node for stm32h743 MCU
      ARM: dts: stm32: add pin map for UART8 controller on stm32h743
      ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
      ARM: dts: stm32: support STM32h747i-disco board

David Heidelberg (2):
      ARM: dts: nokia n900: remove useless io-channel-cells property
      ARM: dts: qcom: apq8064-lg-nexus4-mako: Enable WiFi

Devarsh Thakkar (3):
      arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
      arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
      arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors

Devi Priya (1):
      arm64: dts: qcom: ipq9574: Add nsscc node

Diederik de Haas (8):
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3328-rock64
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpr=
o64
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-pineta=
b2
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b
      arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz=
64-b
      arm64: dts: rockchip: Improve LED config for NanoPi R5S
      arm64: dts: rockchip: Drop assigned-clock* from cpu nodes on rk3588

Dikshita Agarwal (1):
      arm64: dts: qcom: sm8550: add iris DT node

Dmitry Baryshkov (36):
      arm64: dts: qcom: sdm845-db845c: enable sensors DSP
      arm64: dts: qcom: qrb5165-rb5: enable sensors DSP
      arm64: dts: qcom: sar2130p: add PCIe EP device nodes
      arm64: dts: qcom: sm8450: add PCIe EP device nodes
      arm64: dts: qcom: sc7280: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sa8775p: mark MDP interconnects as ALWAYS on
      arm64: dts: qcom: msm8998: use correct size for VBIF regions
      arm64: dts: qcom: qcm2290: use correct size for VBIF regions
      arm64: dts: qcom: sa8775p: use correct size for VBIF regions
      arm64: dts: qcom: sc7180: use correct size for VBIF regions
      arm64: dts: qcom: sc7280: use correct size for VBIF regions
      arm64: dts: qcom: sc8180x: use correct size for VBIF regions
      arm64: dts: qcom: sc8280xp: use correct size for VBIF regions
      arm64: dts: qcom: sdm670: use correct size for VBIF regions
      arm64: dts: qcom: sdm845: use correct size for VBIF regions
      arm64: dts: qcom: sm6115: use correct size for VBIF regions
      arm64: dts: qcom: sm6125: use correct size for VBIF regions
      arm64: dts: qcom: sm6350: use correct size for VBIF regions
      arm64: dts: qcom: sm8150: use correct size for VBIF regions
      arm64: dts: qcom: sm8250: use correct size for VBIF regions
      arm64: dts: qcom: sm8350: use correct size for VBIF regions
      arm64: dts: qcom: sm8450: use correct size for VBIF regions
      arm64: dts: qcom: sm8550: use correct size for VBIF regions
      arm64: dts: qcom: sm8650: use correct size for VBIF regions
      ARM: dts: qcom: apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding sysc=
on device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node
      arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
      ARM: dts: qcom: apq8064: link LVDS clocks
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
      arm64: dts: qcom: sar2130p: add display nodes

Dominik Haller (2):
      dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
      arm64: dts: ti: Add basic support for phyBOARD-Izar-AM68x

Dzmitry Sankouski (12):
      arm64: dts: qcom: sdm845: enable gmu
      arm64: dts: qcom: sdm845-starqltechn: remove wifi
      arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
      arm64: dts: qcom: sdm845-starqltechn: refactor node order
      arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
      arm64: dts: qcom: sdm845-starqltechn: add gpio keys
      arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
      arm64: dts: qcom: sdm845-starqltechn: add display PMIC
      arm64: dts: qcom: sdm845-starqltechn: add touchscreen support
      arm64: dts: qcom: sdm845-starqltechn: add initial sound support
      arm64: dts: qcom: sdm845-starqltechn: add graphics support
      arm64: dts: qcom: sdm845-starqltechn: add modem support

E Shattow (4):
      riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks =
to syscrg
      riscv: dts: starfive: jh7110-common: qspi flash setting read-delay=
 2 cycles max 100MHz
      riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
      riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed=
 by boot loader

Efe Can =C4=B0=C3=A7=C3=B6z (1):
      ARM: dts: imx7d: update opp-table voltages

Emanuele Ghidoli (2):
      arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controll=
er
      arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander

Eugene Lepshy (1):
      arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and GPU

FUKAUMI Naoki (1):
      dt-bindings: arm: rockchip: Add Radxa ROCK 5B+

Fabio Estevam (3):
      ARM: dts: imx31/imx6: Use flash as the NOR node name
      ARM: dts: imx: Fix the iim compatible string
      ARM: dts: imx51-digi-connectcore-som: Fix MMA7455 compatible

Fabrice Gasnier (3):
      arm64: defconfig: enable STM32 LP timer clockevent driver
      arm64: dts: st: add low-power timer nodes on stm32mp251
      arm64: dts: st: use lptimer3 as tick broadcast source on stm32mp25=
7f-ev1

Faraz Ata (1):
      arm64: dts: exynos: Add DT node for all UART ports

Felix Kaechele (1):
      arm64: dts: qcom: msm8953: Add uart_5

Ferass El Hafidi (2):
      dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
      arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

Finley Xiao (2):
      arm64: dts: rockchip: add core dtsi for RK3562 SoC
      arm64: dts: rockchip: Add RK3562 evb2 devicetree

Francesco Dolcini (13):
      arm64: dts: ti: k3-am625-verdin: Add EEPROM compatible fallback
      arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallba=
ck
      arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallba=
ck
      ARM: dts: imx6q-apalis: remove pcie-switch node
      dt-bindings: arm: ti: Add Toradex Verdin AM62P
      arm64: dts: ti: Add Toradex Verdin AM62P
      arm64: dts: ti: am62p-verdin: Add dahlia
      arm64: dts: ti: am62p-verdin: Add mallow
      arm64: dts: ti: am62p-verdin: Add yavia
      arm64: dts: ti: am62p-verdin: Add ivy
      ARM: tegra: apalis-eval: Remove pcie-switch node
      arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configura=
tion
      arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node=
 name

Frank Li (9):
      arm64: dts: imx8qm-mek: consolidate reserved-memory
      arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all =
chips
      arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
      arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 l=
abel
      arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep fu=
nction
      arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dt=
b files
      arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overl=
ay file
      arm64: dts: imx8mq: add pcie0-ep node
      arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes

Frank Wunderlich (9):
      dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
      arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants of bpi-r4
      arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
      arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
      arm64: dts: mediatek: mt7988: add spi controllers
      arm64: dts: mediatek: mt7988: move uart0 and spi1 pins to soc dtsi
      arm64: dts: mediatek: mt7988: add phy calibration efuse subnodes
      arm64: dts: mediatek: mt7988a-bpi-r4: Add fan and coolingmaps
      arm64: dts: mediatek: mt7988a-bpi-r4: configure spi-nodes

Gabor Juhos (1):
      arm64: dts: ipq6018: drop standalone 'smem' node

Gabriel Gonzales (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
      arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo

Gaurav Kashyap (3):
      arm64: dts: qcom: sm8750: Add QCrypto nodes
      arm64: dts: qcom: sm8750: Add TRNG nodes
      arm64: dts: qcom: sm8750: Add ICE nodes

Geert Uytterhoeven (4):
      arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
      Merge tag 'renesas-r9a09g056-dt-binding-defs-tag1' into renesas-dt=
s-for-v6.16
      arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN descr=
iption
      arm64: dts: renesas: sparrow-hawk: Disable dtc spi_bus_bridge check

George Moussalem (1):
      arm64: dts: qcom: ipq5018: enable the download mode support

Goran Ra=C4=91enovi=C4=87 (4):
      dt-bindings: vendor-prefixes: Add Ultratronik
      dt-bindings: arm: stm32: Document Ultratronik's Fly board DT bindi=
ng
      MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT
      ARM: dts: stm32: add initial support for stm32mp157-ultra-fly-sbc =
board

Hao Zhang (2):
      ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
      ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages

Hari Nagalla (6):
      arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
      arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
      arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote process=
ors
      arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
      arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
      arm64: dts: ti: k3-am64: Reserve timers used by MCU FW

Haylen Chu (3):
      dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      dt-bindings: clock: spacemit: Add spacemit,k1-pll
      riscv: dts: spacemit: Add clock tree for SpacemiT K1

Hector Martin (1):
      arm64: dts: apple: Add PMIC NVMEM

Heiko Stuebner (23):
      arm64: dts: rockchip: change rng reset id back to its constant val=
ue
      arm64: dts: rockchip: add mipi dcphy nodes to rk3588
      arm64: dts: rockchip: add dsi controller nodes on rk3588
      arm64: dts: rockchip: add overlay for tiger-haikou video-demo adap=
ter
      arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
      ARM: dts: rockchip: enable hdmi on rk3066 marsboard
      ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard
      Merge branch 'v6.16-shared/clkids' into v6.16-armsoc/dts64
      arm64: dts: rockchip: drop wrong spdif clock from edp1 on rk3588
      arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
      ARM: dts: rockchip: add rk3036 usb2phy nodes and enable them on ky=
lin
      arm64: dts: rockchip: add basic mdio node to px30
      arm64: dts: rockchip: move reset to dedicated eth-phy node on ring=
neck
      dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma S=
ystems
      arm64: dts: rockchip: add px30-cobra base dtsi and board variants
      dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma =
Systems
      arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants
      arm64: dts: rockchip: fix rk3576 pcie unit addresses
      arm64: dts: rockchip: move rk3576 pinctrl node outside the soc node
      arm64: dts: rockchip: remove a double-empty line from rk3576 core =
dtsi
      arm64: dts: rockchip: move rk3528 pinctrl node outside the soc node
      arm64: dts: rockchip: fix rk3562 pcie unit addresses
      arm64: dts: rockchip: move rk3562 pinctrl node outside the soc node

Icenowy Zheng (1):
      riscv: dts: starfive: jh7110-common: use macros for MMC0 pins

Imran Shaik (1):
      arm64: dts: qcom: qcs8300: Add cpufreq scaling node

Ivan Belokobylskiy (1):
      ARM: dts: qcom: Initial dts for LG Nexus 4

Ivaylo Ivanov (1):
      arm64: dts: exynos: update all samsung,mode constants

J. Neusch=C3=A4fer (4):
      dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators

Jacky Bai (3):
      dt-bindings: arm: fsl: add i.MX943 EVK board
      arm64: dts: freescale: Add basic dtsi for imx943
      arm64: dts: freescale: Add minimal dts support for imx943 evk

Jacobe Zang (3):
      arm64: dts: rockchip: Add bluetooth support to Khadas Edge2
      arm64: dts: rockchip: Add HDMI & VOP2 to Khadas Edge2
      arm64: dts: rockchip: enable HDMI out audio on Khadas Edge2

Jagadeesh Kona (1):
      arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node

Jai Luthra (1):
      arm64: dts: ti: k3-am62a-main: Add C7xv device node

Jan Kiszka (1):
      arm64: dts: ti: k3-am65-main: Add system controller compatible

Janaki Ramaiah Thota (1):
      arm64: dts: qcom: qcs6490-rb3gen2: add and enable BT node

Jayesh Choudhary (1):
      arm64: dts: ti: k3-j721e-common-proc-board-infotainment: Update to=
 comply with device tree schema

Jens Glathe (1):
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add retimers, dp al=
tmode support

Jianeng Ceng (2):
      dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
      arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

Jianfeng Liu (1):
      arm64: dts: rockchip: Enable HDMI ports on ArmSoM W3

Jie Gan (1):
      arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes

Jimmy Hon (1):
      arm64: dts: rockchip: Enable bluetooth of AP6611s on OrangePI5 Max=
/Ultra

Joel Selvaraj (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen =
related nodes
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchs=
creen support
      arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscr=
een support

Johan Hovold (16):
      arm64: dts: qcom: x1e80100-crd: add support for volume-up key
      arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch
      arm64: dts: qcom: sc8280xp-crd: add support for volume-up key
      arm64: dts: qcom: x1e80100-crd: mark l12b and l15b always-on
      arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
      arm64: dts: qcom: x1e001de-devkit: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b alw=
ays-on
      arm64: dts: qcom: x1e80100-hp-x14: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-=
on
      arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
      arm64: dts: qcom: x1e78100-t14s: fix missing HID supplies
      arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
      arm64: dts: qcom: x1e80100: enable rtc
      arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity
      arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
      arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer

John Clark (1):
      arm64: dts: rockchip: fix usb-c port functionality on rk3588-nanop=
c-t6

John Madieu (3):
      arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
      arm64: dts: renesas: rzg3e-smarc-som: Add RAA215300 pmic support
      arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency

Jonas Karlman (2):
      arm64: dts: rockchip: Add GMAC nodes for RK3528
      arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C

Judith Mendez (11):
      arm64: dts: ti: k3-am62p5-sk: Enable PWM
      arm64: dts: ti: k3-am62a7-sk: Enable PWM
      arm64: dts: ti: k3-am625-sk: Enable PWM
      arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
      arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
      arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
      arm64: dts: ti: k3-am62-main: Set eMMC clock parent to default
      arm64: dts: ti: k3-am62a-main: Set eMMC clock parent to default
      arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parent =
to default
      arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
      arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges

Juerg Haefliger (5):
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Remove invalid bt-en-s=
leep node
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Enable SMB2360 0 and 1
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: add sound label
      dt-bindings: arm: qcom: Document HP EliteBook Ultra G1q
      arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP Elite=
Book Ultra G1q

Julien Massot (6):
      arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
      arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound c=
ard
      arm64: dts: mt6359: Add missing 'compatible' property to regulator=
s node
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      arm64: dts: mt6359: Rename RTC node to match binding expectations

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: sm8750: Correct clocks property for uart14 node

Karthik Sanagavarapu (1):
      arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10

Kaushal Kumar (3):
      arm64: dts: qcom: sdx75: Add QPIC BAM support
      arm64: dts: qcom: sdx75: Add QPIC NAND support
      arm64: dts: qcom: sdx75-idp: Enable QPIC BAM & QPIC NAND support

Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

Kever Yang (4):
      arm64: dts: rockchip: Add rk3576 pcie nodes
      dt-bindings: rockchip: pmu: Add rk3562 compatible
      dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
      dt-bindings: arm: rockchip: Add rk3562 evb2 board

Kishon Vijay Abraham I (1):
      arm64: dts: ti: k3-am62-main: Add PRUSS-M node

Konrad Dybcio (28):
      arm64: dts: qcom: x1e80100: Set CPU interconnect paths as ACTIVE_O=
NLY
      arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
      arm64: dts: qcom: Commonize X1 CRD DTSI
      arm64: dts: qcom: Add X1P42100 SoC and CRD
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU
      arm64: dts: qcom: x1e80100-romulus: Keep L12B and L15B always on
      arm64: dts: qcom: sdx75: Fix up the USB interrupt description
      arm64: dts: qcom: sdx75: Rename AOSS_QMP to power-management
      arm64: dts: qcom: qcs615: Rename AOSS_QMP to power-management
      arm64: dts: qcom: sc8180x: Rename AOSS_QMP to power-management
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop clock-names from =
PS8830
      arm64: dts: qcom: x1e80100-romulus: Drop clock-names from PS8830
      arm64: dts: qcom: x1e001de-devkit: Drop clock-names from PS8830
      arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
      arm64: dts: qcom: sc8280xp: Fix node order
      arm64: dts: qcom: sc8280xp: Add SLPI
      arm64: dts: qcom: sc8280xp-crd: Enable SLPI
      arm64: dts: qcom: sc7180: Add specific APPS RSC compatible
      arm64: dts: qcom: sdm845: Add specific APPS RSC compatible
      arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy phandle argument
      arm64: dts: qcom: qcs615: Remove disallowed property from AOSS_QMP=
 node
      arm64: dts: qcom: msm8998-fxtec: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-mtp: Add QUSB2PHY VDD supply
      arm64: dts: qcom: msm8998-yoshino: Add QUSB2PHY VDD supply
      arm64: dts: qcom: sm6350-pdx213: Wire up USB regulators
      arm64: dts: qcom: msm8996-oneplus: Add SLPI VDD_PX
      arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
      arm64: dts: qcom: qcs615: Fix up UFS clocks

Krishna Chaitanya Chundru (1):
      arm64: dts: qcom: x1e80100: Add PCIe lane equalization preset prop=
erties

Krishna Kurapati (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add orientation gpio

Krzysztof Kozlowski (65):
      arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8=
775p: add QCrypto nodes"
      arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs=
8300: add QCrypto nodes"
      arm64: dts: qcom: x1e80100-slim7x: Drop incorrect qcom,ath12k-cali=
bration-variant
      ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-v=
ariant
      arm64: dts: qcom: msm8998: Switch to undeprecated qcom,calibration=
-variant
      arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated qcom,calibra=
tion-variant
      arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated qcom,calibra=
tion-variant
      arm64: dts: qcom: sc7180: Switch to undeprecated qcom,calibration-=
variant
      arm64: dts: qcom: sdm845: Switch to undeprecated qcom,calibration-=
variant
      arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated qcom,cali=
bration-variant
      arm64: dts: qcom: sm6115: Switch to undeprecated qcom,calibration-=
variant
      arm64: dts: qcom: sm8150-hdk: Switch to undeprecated qcom,calibrat=
ion-variant
      arm64: dts: qcom: qcm6490: Switch to undeprecated qcom,calibration=
-variant
      arm64: dts: qcom: sa8775p-ride: Switch to undeprecated qcom,calibr=
ation-variant
      arm64: dts: qcom: sc8280xp: Switch to undeprecated qcom,calibratio=
n-variant
      arm64: dts: qcom: sm8250-elish: Switch to undeprecated qcom,calibr=
ation-variant
      arm64: dts: qcom: sm8750: Change labels to lower-case
      arm64: dts: qcom: Correct white-space style
      arm64: dts: qcom: Use recommended MBN firmware path
      arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and ADSP
      arm64: dts: qcom: sm8750: Add LPASS macro codecs and pinctrl
      arm64: dts: qcom: sm8750-mtp: Enable ADSP
      arm64: dts: qcom: sm8750-qrd: Enable ADSP
      arm64: dts: qcom: sm8750: Add CDSP
      arm64: dts: qcom: sm8750-mtp: Enable CDSP
      arm64: dts: qcom: sm8750-qrd: Enable CDSP
      ARM: dts: nuvoton: Align GPIO hog name with bindings
      ARM: dts: qcom: msm8226: Use the header with DSI phy clock IDs
      ARM: dts: qcom: msm8974: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8916: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8917: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8939: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8953: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8976: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8996: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8998: Use the header with DSI phy clock IDs
      arm64: dts: qcom: qcm2290: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sc7180: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sc8180x: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm630: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm670: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm845: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6115: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6125: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6350: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8150: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8250: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8350: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8450: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8550: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8650: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8750: Add Modem / MPSS
      arm64: dts: qcom: sm8750-mtp: Enable modem
      arm64: dts: qcom: sm8750-qrd: Enable modem
      arm64: dts: mediatek: mt7622: Align GPIO hog name with bindings
      ARM: dts: nxp: Align NAND controller node name with bindings
      arm64: dts: allwinner: Align wifi node name with bindings
      ARM: dts: allwinner: Align wifi node name with bindings
      arm64: dts: rockchip: Switch to undeprecated qcom,calibration-vari=
ant on RK3399
      arm64: tegra: tegra210-p2894: Align GPIO hog node name with prefer=
red style
      arm64: dts: renesas: beacon-renesom: Align wifi node name with bin=
dings
      arm64: dts: imx: Align wifi node name with bindings
      ARM: dts: nxp: Align wifi node name with bindings
      ARM: dts: st: stm32: Align wifi node name with bindings
      ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindin=
gs

Kuninori Morimoto (1):
      arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support

Lad Prabhakar (7):
      arm64: dts: qcom: Drop `tx-sched-sp` property
      dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants an=
d EVK
      dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
      dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
      dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
      arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
      arm64: dts: renesas: Add initial device tree for RZ/V2N EVK

Laurentiu Mihalcea (1):
      arm64: dts: imx: add imx95 dts for sof

Leo Yan (1):
      arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model

Lijuan Gao (1):
      arm64: dts: qcom: qcs615: Add Command DB support

Ling Xu (1):
      arm64: dts: qcom: sa8775p: Remove extra entries from the iommus pr=
operty

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Add crypto engine

Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add gpio-ranges property for gpio cont=
roller
      arm64: dts: airoha: en7581: Add PCIe nodes to EN7581 SoC evaluatio=
n board

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_c=
heck error
      arm64: dts: mediatek: mt8395-genio-1200-evk: Add display on DSI0
      arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual=
 role mode to host
      arm64: dts: mt8365-evk: Add goodix touchscreen support

Luca Weiss (30):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display
      arm64: dts: qcom: sdm632-fairphone-fp3: Move status properties last
      arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines between regul=
ator nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add firmware-name for adsp=
 & wcnss
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
      arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen node
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
      ARM: dts: qcom: msm8926-htc-memul: Enable modem
      arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
      arm64: dts: qcom: Remove unnecessary MM_[UD]L audio routes
      arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for va-macro
      arm64: dts: qcom: sm6350: Align reg properties with latest style
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over =
USB-C
      arm64: dts: qcom: apq8096-db820c: Use q6asm defines for reg
      arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm defines for reg
      arm64: dts: qcom: msm8953: Use q6asm defines for reg
      arm64: dts: qcom: msm8996*: Use q6asm defines for reg
      arm64: dts: qcom: qrb5165-rb5: Use q6asm defines for reg
      arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm defines for reg
      arm64: dts: qcom: sc7280: Use q6asm defines for reg
      arm64: dts: qcom: sdm845*: Use q6asm defines for reg
      arm64: dts: qcom: sdm850*: Use q6asm defines for reg
      arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm defines for r=
eg
      arm64: dts: qcom: sm8350: Use q6asm defines for reg
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add DisplayPort sound sup=
port

Lukasz Czechowski (2):
      dt-bindings: usb: cypress,hx3: Add support for all variants
      arm64: dts: rockchip: fix internal USB hub instability on RK3399 P=
uma

Macpaul Lin (1):
      arm64: dts: mediatek: mt8195: Add power domain for dp_intf0

Mahesh Rao (2):
      dt-bindings: fpga: stratix10: Convert to json-schema
      dt-bindings: firmware: stratix10: Convert to json-schema

Manikanta Mylavarapu (7):
      arm64: dts: qcom: ipq5424: Add tsens node
      arm64: dts: qcom: ipq5424: Add thermal zone nodes
      arm64: dts: qcom: ipq9574: fix the msi interrupt numbers of pcie3
      arm64: dts: qcom: ipq5424: add reserved memory region for bootload=
er
      arm64: dts: qcom: ipq5424: enable GPIO based LEDs and Buttons
      arm64: dts: qcom: ipq5424: Add PCIe PHYs and controller nodes
      arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers

Manish Nagar (1):
      arm64: dts: qcom: qcs8300-ride: Enable second USB controller on QC=
S8300 Ride

Marcin Juszkiewicz (2):
      arm64: dts: rockchip: enable HDMI1 on FriendlyElec NanoPC-T6
      arm64: dts: rockchip: enable HDMI sound on FriendlyElec NanoPC-T6

Marek Vasut (3):
      dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
      dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Haw=
k board support
      arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk=
 board support

Mark Kettenis (1):
      arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent

Markus Niebel (6):
      dt-bindings: arm: add MBa91xxCA Mainboard for TQMa93xxCA/LA SOM
      arm64: add initial device tree for TQMa93xx/MBa91xxCA
      Revert "arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain fo=
r MDIO"
      Revert "arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain fo=
r MDIO"
      dt-bindings: arm: add TQMa8XxS boards
      arm64: dts: imx93-tqma9352-mba91xxca: disable Open Drain for MDIO

Markus Reichl (1):
      arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc

Martin Blumenstingl (7):
      ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
      ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by defau=
lt
      arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
      arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
      arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
      arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
      arm64: dts: amlogic: a1: enable UART RX and TX pull up by default

Martin Schmiedel (1):
      arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add LVDS device tree o=
verlay

Martyn Welch (2):
      dt-bindings: arm: fsl: Add Boundary Device Nitrogen8M Plus ENC Car=
rier Board
      arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus ENC Carrie=
r Board

Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

Matthew Gerlach (2):
      arm64: dts: intel: socfpga_agilex: add frequencies to internal osc=
illators
      dt-bindings: clock: socfpga: convert to yaml

Matti Lehtim=C3=A4ki (3):
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card read=
er
      arm64: dts: qcom: x1e80100-vivobook-s15: Add bluetooth

Maulik Shah (3):
      arm64: dts: qcom: sm8750: Add RPMh sleep stats
      arm64: dts: qcom: sm8750: Fix cluster hierarchy for idle states
      arm64: dts: qcom: qcs8300: Add RPMh sleep stats

Max Krummenacher (2):
      arm64: dts: imx8-apalis: Add PCIe and SATA support
      arm64: dts: imx8-colibri: Add PCIe support

Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574: Add SPI nand support
      arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
      arm64: dts: qcom: ipq9574: Remove eMMC node

Melody Olvera (1):
      arm64: dts: qcom: sm8750: Add LLCC node

Michael Klein (1):
      ARM: dts: bananapi: add support for PHY LEDs

Michael Walle (1):
      arm64: dts: ti: k3-am62p-j722s: Add rng node

Michal Wilczynski (3):
      riscv: dts: thead: Introduce power domain nodes with aon firmware
      riscv: dts: thead: Introduce reset controller node
      riscv: dts: thead: Add device tree VO clock controller

Mihai Sain (1):
      ARM: dts: microchip: sama7g54_curiosity: Add fixed-partitions for =
spi-nor flash

Neil Armstrong (23):
      arm64: dts: qcom: sm8650: add OSM L3 node
      arm64: dts: qcom: sm8650: add cpu interconnect nodes
      arm64: dts: qcom: sm8650: add cpu OPP table with DDR, LLCC & L3 ba=
ndwidths
      arm64: dts: qcom: sm8650: drop cpu thermal passive trip points
      arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatur=
es
      arm64: dts: qcom: sm8650: harmonize all unregulated thermal trip p=
oints
      arm64: dts: qcom: sm8650: drop remaining polling-delay-passive pro=
perties
      arm64: dts: qcom: sm8550: use ICC tag for all interconnect phandles
      arm64: dts: qcom: sm8550: set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: sm8550: add OPP table support to PCIe
      arm64: dts: qcom: sm8550: add QUP serial engines OPP tables
      arm64: dts: qcom: sm8650: use ICC tag for IPA interconnect phandles
      arm64: dts: qcom: sm8650: set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: sm8650: add USB interconnect paths
      arm64: dts: qcom: sm8650: add OPP table support to PCIe
      arm64: dts: qcom: sm8650: add QUP serial engines OPP tables
      arm64: dts: qcom: sm8650: add UFS OPP table instead of freq-table-=
hz property
      arm64: dts: qcom: sm8550: add missing cpu-cfg interconnect path in=
 the mdss node
      arm64: dts: qcom: sm8650: add missing cpu-cfg interconnect path in=
 the mdss node
      arm64: dts: qcom: sm8650: add all 8 coresight ETE nodes
      arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI p=
artitions
      arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM=
 PMUs
      arm64: dts: qcom: sc7280: add UFS operating points

Nick Chan (9):
      arm64: dts: apple: s5l8960x: Add CPU caches
      arm64: dts: apple: t7000: Add CPU caches
      arm64: dts: apple: t7001: Add CPU caches
      arm64: dts: apple: s800-0-3: Add CPU caches
      arm64: dts: apple: s8001: Add CPU caches
      arm64: dts: apple: t8010: Add CPU caches
      arm64: dts: apple: t8011: Add CPU caches
      arm64: dts: apple: t8012: Add CPU caches
      arm64: dts: apple: t8015: Add CPU caches

Nicolas Frattaroli (8):
      arm64: dts: rockchip: enable pcie on Sige5
      arm64: dts: rockchip: add SATA nodes to RK3576
      arm64: dts: rockchip: add RK3576 RNG node
      dt-bindings: clock: rk3576: add IOC gated clocks
      arm64: dts: rockchip: Add RK3576 SAI nodes
      arm64: dts: rockchip: Add RK3576 HDMI audio
      arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      arm64: dts: rockchip: Enable HDMI audio on Sige5

Nikita Travkin (7):
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Drop CMA heap
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Drop CMA heap
      arm64: dts: qcom: sc7180: Add EL2 overlay for WoA devices
      arm64: dts: qcom: sc8280xp: Add PCIe IOMMU
      arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
      arm64: dts: qcom: x1e80100: Add PCIe IOMMU
      arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA devices

Niklas S=C3=B6derlund (3):
      arm64: dts: renesas: r8a779a0: Add ISP core function block
      arm64: dts: renesas: r8a779g0: Add ISP core function block
      arm64: dts: renesas: r8a779h0: Add ISP core function block

Nikolaos Pasaloukos (1):
      arm64: dts: blaize-blzp1600: Enable GPIO support

Niravkumar L Rabara (6):
      dt-bindings: intel: document Agilex5 NAND daughter board
      arm64: dts: socfpga: agilex5: add NAND daughter board
      arm64: dts: socfpga: agilex5: fix gpio0 address
      arm64: dts: socfpga: agilex5: add qspi flash node
      arm64: dts: socfpga: agilex5: add led and memory nodes
      arm64: dts: socfpga: agilex: Add dma channel id for spi

Nirmesh Kumar Singh (1):
      arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3=
gen2

Nishanth Menon (1):
      arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1

Nitheesh Sekar (2):
      arm64: dts: qcom: ipq5018: Add PCIe related nodes
      arm64: dts: qcom: ipq5018: Enable PCIe

N=C3=ADcolas F. R. A. Prado (4):
      arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two c=
ores
      arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for s=
cp0
      arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
      arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backli=
ght

Olivier Moysan (2):
      ARM: dts: stm32: add vrefint calibration on stm32mp13
      ARM: dts: stm32: add vrefint support to adc on stm32mp13

Patrice Chotard (3):
      arm64: dts: st: Add OMM node on stm32mp251
      arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp25-pinctr=
l.dtsi
      arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board

Pengyu Luo (4):
      arm64: dts: qcom: sc8280xp-pmics: Fix slave ID in interrupts confi=
guration
      arm64: dts: qcom: sc8280xp-pmics: Add more temp-alarm devices
      arm64: dts: qcom: sc8280xp: Fix clock for spi0 to spi7
      arm64: dts: qcom: sm8650: add the missing l2 cache node

Peter Griffin (1):
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node

Peter Robinson (4):
      arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
      arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
      arm64: dts: rockchip: Update eMMC for NanoPi R5 series

Pin-yen Lin (1):
      arm64: dts: mt8183: Add port node to mt8183.dtsi

Prasanth Babu Mantena (1):
      arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E

Prashanth K (3):
      arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
      arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
      arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk

Pratham Pratap (2):
      arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
      arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk

Pratyush Brahma (2):
      arm64: dts: qcom: qcs8300: Add device node for gfx_smmu
      arm64: dts: qcom: qcs8300: add the pcie smmu node

Praveenkumar I (4):
      arm64: dts: qcom: ipq5332: Add tsens node
      arm64: dts: qcom: ipq5332: Add thermal zone nodes
      arm64: dts: qcom: ipq5332: Add PCIe related nodes
      arm64: dts: qcom: ipq5332-rdp441: Enable PCIe phys and controllers

Primoz Fiser (17):
      arm64: dts: freescale: imx93-phycore-som: Add PMIC support
      arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
      arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
      arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
      arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by def=
ault
      arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v fl=
ag
      arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write=
-protect
      arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
      arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit=
 to fix ERR052021
      arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
      arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
      arm64: dts: freescale: imx93-phyboard-segin: Add USB support
      arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
      arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
      arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetic=
ally
      bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93 board
      arm64: dts: freescale: Add PHYTEC phyBOARD-Nash-i.MX93 support

Quentin Schulz (4):
      arm64: dts: rockchip: Enable HDMI audio output for RK3588 Jaguar
      arm64: dts: rockchip: Enable HDMI audio output for RK3588 Tiger Ha=
ikou
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on =
RK3399 Puma
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on =
RK3399 Puma with Haikou

Rajendra Nayak (1):
      arm64: dts: qcom: x1e80100: Add the watchdog device

Rakesh Kota (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add vadc and adc-tm channels

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add camss and cci

Richard Zhu (1):
      arm64: dts: imx8mq: Add linux,pci-domain into pcie-ep node

Rishikesh Donadkar (6):
      arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
      arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
      arm64: dts: ti: k3-am62x: Add required voltage supplies for OV5640
      arm64: dts: ti: k3-am62x: Add required voltage supplies for TEVI-O=
V5640
      arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies=
 for OV5640
      arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies=
 for TEVI-OV5640

Rob Herring (Arm) (16):
      arm64: dts: microchip: sparx5: Fix CPU node "enable-method" proper=
ty dependencies
      arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node na=
mes
      arm64: dts: marvell: Drop unused "pinctrl-names"
      arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
      arm64: dts: qcom: msm8939: Fix CPU node "enable-method" property d=
ependencies
      arm64: dts: qcom: msm8992-lg-h815: Fix CPU node "enable-method" pr=
operty dependencies
      ARM: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
      arm64: dts: amlogic: Drop redundant CPU "clock-latency"
      arm64: dts: imx: Drop redundant CPU "clock-latency"
      ARM: dts: imx: Drop redundant CPU "clock-latency"
      ARM: dts: rockchip: Drop redundant CPU "clock-latency"
      arm/arm64: dts: allwinner: Use preferred node names for cooling ma=
ps
      arm64: dts: allwinner: h5/h6: Drop spurious 'clock-latency-ns' pro=
perties
      arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,=
bt-sco
      ARM: dts: qcom: ipq4019: Drop redundant CPU "clock-latency"
      dt-bindings: interrupt-controller: Convert nvidia,tegra20-ictlr to=
 DT schema

Robert Nelson (2):
      dt-bindings: arm: ti: Add PocketBeagle2
      arm64: dts: ti: Add k3-am62-pocketbeagle2

Rudraksha Gupta (3):
      ARM: dts: qcom: msm8960: Add BAM
      ARM: dts: qcom: msm8960: Add thermal sensor (tsens)
      ARM: dts: qcom-msm8960: add missing clocks to the timer node

Russell King (Oracle) (1):
      arm64: dts: qcom: remove max-speed =3D 1G for RGMII for ethernet

Ryan Wanner (8):
      ARM: dts: microchip: sama7d65: Add gmac interfaces for sama7d65 SoC
      ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC
      ARM: dts: microchip: sama7d65: Enable GMAC interface
      ARM: dts: microchip: sama7d65: Add MCP16502 to sama7d65 curiosity
      ARM: dts: microchip: sama7d65_curiosity: add EEPROM
      ARM: dts: microchip: sama7d65: Add SRAM and DRAM components support
      ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d=
65 SoC
      ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board

Sandie Cao (1):
      riscv: dts: starfive: fml13v01: enable USB 3.0 port

Sanjay Chitroda (1):
      ARM: dts: qcom: Fix indentation errors

Sasha Finkelstein (1):
      arm64: dts: apple: Add SPMI controller nodes

Sebastian Reichel (3):
      arm64: dts: rockchip: move rock 5b to include file
      arm64: dts: rockchip: add Rock 5B+
      arm64: dts: rockchip: Add missing SFC power-domains to rk3576

Shawn Lin (3):
      arm64: dts: rockchip: Enable ufshc on rk3576 evb1 board
      arm64: dts: rockchip: Rename vcc3v3_pcie0 to vcc3v3_pcie1 for rk35=
76-evb1-v10
      arm64: dts: rockchip: Add pcie1 slot for rk3576 evb1 board

Shin Son (2):
      arm64: dts: exynosautov920: add cpucl0 clock DT nodes
      arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

Sibi Sankar (2):
      arm64: dts: qcom: x1e80100: Add cpucp mailbox and sram nodes
      arm64: dts: qcom: x1e80100: Enable cpufreq

Siddharth Vadapalli (16):
      arm64: dts: ti: k3-j784s4-evm-usxgmii-exp1-exp2: drop pinctrl-names
      arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz=
1"
      arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_w=
iz1"
      arm64: dts: ti: k3-j722s-main: Don't disable serdes0 and serdes1
      arm64: dts: ti: k3-j722s-evm: Drop redundant status within serdes0=
/serdes1
      arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 T=
ype-A
      arm64: dts: ti: k3-j784s4-j742s2-main-common: Fix length of serdes=
_ln_ctrl
      arm64: dts: ti: k3-am64-main: Switch to 64-bit address space for P=
CIe0
      arm64: dts: ti: k3-j7200-main: Switch to 64-bit address space for =
PCIe1
      arm64: dts: ti: k3-j721e: Add ranges for PCIe0 DAT1 and PCIe1 DAT1
      arm64: dts: ti: k3-j721e-main: Switch to 64-bit address space for =
PCIe0 and PCIe1
      arm64: dts: ti: k3-j721s2-main: Switch to 64-bit address space for=
 PCIe1
      arm64: dts: ti: k3-j722s-main: Switch to 64-bit address space for =
PCIe0
      arm64: dts: ti: k3-j784s4-j742s2-main-common: Switch to 64-bit add=
ress space for PCIe0 and PCIe1
      arm64: dts: ti: k3-j784s4-j742s2-main-common: Add ACSPCIE0 node
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable ACSPCIE0 outpu=
t for PCIe1

Srinivas Kandagatla (1):
      arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

Stanimir Varbanov (2):
      arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
      arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes

Stanislav Jakubek (4):
      ARM: dts: qcom: msm8226-motorola-falcon: add clocks, power-domain =
to simpleFB
      ARM: dts: qcom: msm8226-motorola-falcon: add I2C clock frequencies
      ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132 to 5.4V
      ARM: dts: qcom: msm8226-motorola-falcon: specify vddio_disp output=
 voltage

Stefan Wahren (3):
      dt-bindings: arm: bcm2835: Add Raspberry Pi 2 (2nd rev)
      ARM: dts: bcm: Add support for Raspberry Pi 2 (2nd rev)
      arm64: dts: bcm: Add reference to RPi 2 (2nd rev)

Stephan Gerhold (24):
      arm64: dts: qcom: x1e80100: Fix video thermal zone
      arm64: dts: qcom: x1e80100: Apply consistent critical thermal shut=
down
      arm64: dts: qcom: x1e80100: Add GPU cooling
      arm64: dts: qcom: x1e80100: Drop unused passive thermal trip point=
s for CPU
      arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
      arm64: dts: qcom: sm8450: Add missing properties for cryptobam
      arm64: dts: qcom: sm8550: Add missing properties for cryptobam
      arm64: dts: qcom: sm8650: Add missing properties for cryptobam
      arm64: dts: qcom: sa8775p: Add missing properties for cryptobam
      arm64: dts: qcom: ipq9574: Add missing properties for cryptobam
      arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC supplies
      arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies
      arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 vol=
tage
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 volta=
ge
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 vo=
ltage
      arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: msm8916/39: Move UART pinctrl to board files
      arm64: dts: qcom: msm8916/39: Introduce new UART console pinctrl
      arm64: dts: qcom: msm8919/39: Use UART2 console pinctrl where appr=
opriate
      arm64: dts: qcom: msm8916-motorola: Use UART1 console pinctrl
      arm64: dts: qcom: msm8916: Drop generic UART pinctrl templates
      arm64: dts: qcom: msm8939: Drop generic UART pinctrl templates

Sudeep Holla (4):
      arm64: dts: fvp: Add system timer for broadcast during CPU idle
      arm64: dts: fvp: Add CPU idle states for Rev C model
      arm64: dts: fvp: Reserve 64MB for the FF-A firmware in memory map
      arm64: dts: arm: Drop the clock-frequency property from timer nodes

Sukrut Bellary (1):
      ARM: dts: am335x: Set wakeup-source for UART0

Sven Peter (1):
      MAINTAINERS, mailmap: update Sven Peter's email address

Svyatoslav Ryhel (3):
      dt-bindings: arm: tegra: Group Tegra30 based ASUS Transformers
      dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
      ARM: tegra: Add device-tree for ASUS Transformer Pad LTE TF300TL

Swathi K S (2):
      arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
      arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

Taniya Das (3):
      arm64: dts: qcom: qcm6490-idp: Update protected clocks list
      arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

Thierry Bultel (1):
      dt-bindings: soc: renesas: Add Renesas RZ/T2H (R9A09G077) SoC

Thuan Nguyen (1):
      arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups

Tingguo Cheng (3):
      arm64: dts: qcom: qcs8300: Adds SPMI support
      arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals
      arm64: dts: qcom: qcs615: remove disallowed property in spmi bus n=
ode

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
      arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52

Uwe Kleine-K=C3=B6nig (4):
      dt-bindings: altera: Add compatible for Terasic's DE10-nano
      ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
      arm64: dts: rockchip: Correct gmac phy address on QNAP TS433
      arm64: dts: rockchip: Add gmac phy reset GPIO to QNAP TS433

Vaishnav Achath (2):
      arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
      arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

Varadarajan Narayanan (3):
      arm64: dts: qcom: ipq5424: Enable MMC
      arm64: dts: qcom: ipq9574: Fix USB vdd info
      arm64: dts: qcom: ipq9574: Add MHI to pcie nodes

Vikash Garodia (1):
      arm64: dts: qcom: sc7280: drop video decoder and encoder nodes

Viken Dadhaniya (2):
      arm64: dts: qcom: qcs8300: Add QUPv3 configuration
      arm64: dts: qcom: sa8775p: Add default pin configurations for QUP =
SEs

Vikram Sharma (2):
      arm64: dts: qcom: sc7280: Add support for camss
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mez=
zanine

Vishwaroop A (1):
      arm64: tegra: Configure QSPI clocks and add DMA

Vitor Soares (2):
      dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
      arm64: dts: freescale: add Toradex SMARC iMX8MP

Vladimir Lypak (1):
      arm64: dts: qcom: msm8953: Add interconnects

William A. Kennington III (5):
      ARM: dts: nuvoton: Add EDAC node
      ARM: dts: nuvoton: Add UDC nodes
      ARM: dts: nuvoton: Add OHCI node
      ARM: dts: nuvoton: Add MMC Nodes
      arm64: dts: nuvoton: Add pinctrl

Wojciech Slenska (1):
      arm64: dts: qcom: qcm2290: Add uart3 node

Wolfram Sang (23):
      ARM: dts: at91: usb_a9g20: add SPI EEPROM
      ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
      ARM: dts: at91: calao_usb: simplify memory node
      ARM: dts: at91: usb_a9260: use 'stdout-path'
      ARM: dts: at91: calao_usb: simplify chosen node
      ARM: dts: at91: usb_a9g20: move wrong RTC node
      ARM: dts: at91: at91sam9263: fix NAND chip selects
      ARM: dts: renesas: r9a06g032: Describe I2C controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe I2C bus
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Describe I2C bus
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe keys
      ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Add GMAC1 port
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Describe 9-pin D-sub ser=
ial port
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Enable USB device port
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Add pinmux for the CPLD
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port
      ARM: dts: marvell: use correct ohci/ehci node names
      ARM: dts: nxp: lpc: use correct ohci/ehci node names
      ARM: dts: st: use correct ohci/ehci node names
      ARM: dts: ti: omap: use correct ohci/ehci node names
      ARM: dts: vt8500: use correct ohci/ehci node names

Xianwei Zhao (7):
      arm64: dts: amlogic: a4: add pinctrl node
      dt-bindings: arm: amlogic: add S6 support
      dt-bindings: arm: amlogic: add S7 support
      dt-bindings: arm: amlogic: add S7D support
      arm64: dts: add support for S6 based Amlogic BL209
      arm64: dts: add support for S7 based Amlogic BP201
      arm64: dts: add support for S7D based Amlogic BM202

Xilin Wu (2):
      arm64: dts: qcom: sm8250: Fix CPU7 opp table
      arm64: dts: qcom: sc7280: Mark FastRPC context banks as dma-cohere=
nt

Xu Yang (3):
      arm64: dts: imx95: add USB2.0 nodes
      arm64: dts: imx95-19x19-evk: enable USB2.0 node
      arm64: dts: imx95-15x15-evk: enable USB2.0 node

Yannic Moog (3):
      dt-bindings: arm: add imx8mp-libra-rdk-fpsc
      arm64: dts: add imx8mp-libra-rdk-fpsc board
      arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay

Yao Zi (5):
      arm64: dts: rockchip: Add I2C controllers for RK3528
      arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C
      dt-bindings: clock: Add GRF clock definition for RK3528
      arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
      arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

Yemike Abhilash Chandra (9):
      arm64: dts: ti: k3-j721e-sk: Add DT nodes for power regulators
      arm64: dts: ti: k3-am68-sk: Fix regulator hierarchy
      arm64: dts: ti: k3-j721e-sk: Remove clock-names property from IMX2=
19 overlay
      arm64: dts: ti: k3-j721e-sk: Add requiried voltage supplies for IM=
X219
      arm64: dts: ti: k3-am62x: Remove clock-names property from IMX219 =
overlay
      arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219 o=
verlay
      arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640 o=
verlay
      arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
      arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX

Yixun Lan (9):
      dt-bindings: sram: sunxi-sram: Add A523 compatible
      arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
      arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
      arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board
      Merge tag 'spacemit-clk-binding-for-6.16' of https://github.com/sp=
acemit-com/linux into spacemit-dt-for-6.16
      riscv: dts: spacemit: Acquire clocks for pinctrl
      riscv: dts: spacemit: Acquire clocks for UART
      riscv: dts: spacemit: add gpio support for K1 SoC
      riscv: dts: spacemit: add gpio LED for system heartbeat

Zelong Dong (2):
      arm64: dts: amlogic: Add A4 Reset Controller
      arm64: dts: amlogic: Add A5 Reset Controller

=C5=81ukasz Majczak (1):
      arm64: dts: mediatek: mt8186: starmie: Fix external display

 .mailmap                                           |    1 +
 Documentation/devicetree/bindings/arm/altera.yaml  |    1 +
 .../bindings/arm/altera/socfpga-clk-manager.yaml   |  102 +-
 Documentation/devicetree/bindings/arm/amlogic.yaml |   26 +
 .../devicetree/bindings/arm/bcm/bcm2835.yaml       |    1 +
 Documentation/devicetree/bindings/arm/fsl.yaml     |   61 +-
 .../devicetree/bindings/arm/intel,socfpga.yaml     |    1 +
 .../devicetree/bindings/arm/mediatek.yaml          |   11 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   14 +-
 .../devicetree/bindings/arm/rockchip.yaml          |   37 +-
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |    2 +
 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 .../devicetree/bindings/arm/stm32/stm32.yaml       |    9 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |   25 +
 Documentation/devicetree/bindings/arm/tegra.yaml   |   19 +-
 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   32 +
 Documentation/devicetree/bindings/arm/vt8500.yaml  |   10 +-
 .../devicetree/bindings/clock/altr_socfpga.txt     |   30 -
 .../bindings/clock/renesas,rzv2h-cpg.yaml          |    5 +-
 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   50 +
 .../bindings/display/mediatek/mediatek,aal.yaml    |    4 +
 .../bindings/display/mediatek/mediatek,color.yaml  |    4 +
 .../bindings/display/mediatek/mediatek,merge.yaml  |    4 +
 .../display/mediatek/mediatek,padding.yaml         |   10 +-
 .../bindings/dma/nvidia,tegra20-apbdma.txt         |   44 -
 .../bindings/dma/nvidia,tegra20-apbdma.yaml        |   90 +
 .../bindings/firmware/intel,stratix10-svc.txt      |   57 -
 .../bindings/firmware/intel,stratix10-svc.yaml     |   93 +
 .../fpga/intel,stratix10-soc-fpga-mgr.yaml         |   36 +
 .../bindings/fpga/intel-stratix10-soc-fpga-mgr.txt |   18 -
 .../interrupt-controller/nvidia,tegra20-ictlr.txt  |   41 -
 .../interrupt-controller/nvidia,tegra20-ictlr.yaml |   82 +
 .../bindings/media/cec/nvidia,tegra114-cec.yaml    |   14 +-
 .../bindings/media/mediatek,mdp3-fg.yaml           |    8 +-
 .../bindings/media/mediatek,mdp3-hdr.yaml          |    8 +-
 .../bindings/media/mediatek,mdp3-rsz.yaml          |    1 +
 .../bindings/media/mediatek,mdp3-stitch.yaml       |    8 +-
 .../bindings/media/mediatek,mdp3-tcc.yaml          |    8 +-
 .../bindings/media/mediatek,mdp3-tdshp.yaml        |    8 +-
 .../bindings/media/mediatek,mdp3-wrot.yaml         |    1 +
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    2 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml         |    1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   32 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    7 +
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   80 +
 .../soc/ti/ti,j721e-system-controller.yaml         |   23 +
 .../sram/allwinner,sun4i-a10-system-control.yaml   |    1 +
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   19 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   10 +
 MAINTAINERS                                        |    9 +-
 arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts |   27 +
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        |    4 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts |    2 +-
 arch/arm/boot/dts/allwinner/sun8i-h3.dtsi          |    2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi         |    2 +-
 arch/arm/boot/dts/amlogic/Makefile                 |    1 +
 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts   |  306 ++
 arch/arm/boot/dts/amlogic/meson8.dtsi              |   22 +-
 arch/arm/boot/dts/amlogic/meson8b.dtsi             |    4 +-
 arch/arm/boot/dts/broadcom/Makefile                |    2 +
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |    7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   |  297 ++
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts     |  130 +
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 -
 arch/arm/boot/dts/intel/socfpga/Makefile           |    1 +
 .../intel/socfpga/socfpga_cyclone5_de10nano.dts    |   95 +
 arch/arm/boot/dts/marvell/kirkwood-db.dtsi         |    2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts      |    2 +-
 .../boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts  |    2 +-
 arch/arm/boot/dts/marvell/kirkwood.dtsi            |    2 +-
 arch/arm/boot/dts/marvell/orion5x.dtsi             |    4 +-
 arch/arm/boot/dts/mediatek/mt2701-evb.dts          |    1 +
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts |  209 +
 .../boot/dts/microchip/at91-sama7g54_curiosity.dts |   32 +
 arch/arm/boot/dts/microchip/at91sam9263ek.dts      |    2 +-
 arch/arm/boot/dts/microchip/sama7d65.dtsi          |  346 ++
 arch/arm/boot/dts/microchip/tny_a9263.dts          |    2 +-
 arch/arm/boot/dts/microchip/usb_a9260.dts          |    8 -
 arch/arm/boot/dts/microchip/usb_a9260_common.dtsi  |    9 +
 arch/arm/boot/dts/microchip/usb_a9263.dts          |    4 +-
 arch/arm/boot/dts/microchip/usb_a9g20.dts          |   17 +-
 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi  |   27 -
 arch/arm/boot/dts/microchip/usb_a9g20_lpw.dts      |   10 +-
 .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |  108 +
 arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |   12 +-
 .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts |  120 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi     |   65 +
 arch/arm/boot/dts/nvidia/Makefile                  |    1 +
 arch/arm/boot/dts/nvidia/tegra124-apalis-eval.dts  |    5 -
 .../boot/dts/nvidia/tegra124-apalis-v1.2-eval.dts  |    5 -
 arch/arm/boot/dts/nvidia/tegra20.dtsi              |    2 +-
 arch/arm/boot/dts/nvidia/tegra30-apalis-eval.dts   |    5 -
 .../boot/dts/nvidia/tegra30-apalis-v1.1-eval.dts   |    5 -
 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts  |  857 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi              |    2 +-
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |    2 +-
 arch/arm/boot/dts/nxp/imx/imx31-lite.dts           |    2 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |    2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |    2 +-
 .../dts/nxp/imx/imx51-digi-connectcore-som.dtsi    |    2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |    4 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |    4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts    |    9 -
 arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |    2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts        |    2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts    |    2 +-
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi               |    6 +-
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |    1 -
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi             |    2 +-
 arch/arm/boot/dts/nxp/ls/Makefile                  |    9 +
 .../nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso  |   32 +
 ...021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso |   47 +
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso |   55 +
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso |   55 +
 .../dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts    |    5 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |    3 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts          |    6 +-
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts           |   12 +-
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi          |    2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |    6 +-
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts |   22 +-
 arch/arm/boot/dts/qcom/msm8926.dtsi                |   11 +
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |    1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |    2 +
 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts    |    1 -
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  |  359 ++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  104 +-
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |    4 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |    2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |    4 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |    2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |    6 +-
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |    6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |    1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |    1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |    1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |   19 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |  164 +-
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |   14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |    1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |    1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |    2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |    5 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  101 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |    2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |    2 +-
 arch/arm/boot/dts/renesas/Makefile                 |    1 +
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  124 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  244 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   46 +
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |   18 +
 arch/arm/boot/dts/rockchip/rk3036.dtsi             |   40 +-
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts   |   37 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi             |    8 +-
 arch/arm/boot/dts/rockchip/rk3188.dtsi             |    1 -
 arch/arm/boot/dts/rockchip/rk322x.dtsi             |    1 -
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |    5 +-
 arch/arm/boot/dts/rockchip/rv1108.dtsi             |    1 -
 .../arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi |   14 +-
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi       |    2 +-
 arch/arm/boot/dts/st/Makefile                      |    4 +-
 arch/arm/boot/dts/st/spear1310-evb.dts             |    8 +-
 arch/arm/boot/dts/st/spear1340-evb.dts             |    8 +-
 arch/arm/boot/dts/st/spear13xx.dtsi                |    8 +-
 arch/arm/boot/dts/st/spear300-evb.dts              |    6 +-
 arch/arm/boot/dts/st/spear310-evb.dts              |    6 +-
 arch/arm/boot/dts/st/spear320-evb.dts              |    6 +-
 arch/arm/boot/dts/st/spear320-hmi.dts              |    6 +-
 arch/arm/boot/dts/st/spear3xx.dtsi                 |    6 +-
 arch/arm/boot/dts/st/spear600.dtsi                 |    8 +-
 arch/arm/boot/dts/st/stm32f746.dtsi                |   34 +
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi          |   34 +-
 arch/arm/boot/dts/st/stm32h743.dtsi                |    8 +
 arch/arm/boot/dts/st/stm32h743i-disco.dts          |    2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts           |    2 +-
 arch/arm/boot/dts/st/stm32h747i-disco.dts          |  136 +
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts         |    8 +-
 arch/arm/boot/dts/st/stm32mp131.dtsi               |    5 +
 arch/arm/boot/dts/st/stm32mp133.dtsi               |    2 +
 arch/arm/boot/dts/st/stm32mp135f-dk.dts            |    2 +-
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi    |    2 +-
 arch/arm/boot/dts/st/stm32mp157a-iot-box.dts       |    2 +-
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts           |    2 +-
 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts | 1152 +++++
 .../boot/dts/st/stm32mp15xx-dhcor-avenger96.dtsi   |    2 +-
 arch/arm/boot/dts/ti/omap/am335x-evm.dts           |    2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts           |    2 -
 arch/arm/boot/dts/ti/omap/omap3.dtsi               |    4 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi            |    4 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi  |   39 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts       |   32 -
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi            |    4 +-
 arch/arm/boot/dts/vt8500/Makefile                  |    3 +-
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |    9 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |    9 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |    9 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |    9 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |    9 +-
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       |   21 +
 arch/arm/boot/dts/vt8500/wm8950.dtsi               |   11 +
 arch/arm/mach-stm32/board-dt.c                     |    1 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts          |   30 +
 arch/arm64/boot/dts/airoha/en7581.dtsi             |  105 +
 arch/arm64/boot/dts/allwinner/Makefile             |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |    3 +
 .../dts/allwinner/sun50i-a133-liontron-h-a133l.dts |  211 +
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |   12 +
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |   19 +
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |    6 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |    2 +-
 .../dts/allwinner/sun50i-h6-orangepi-lite2.dts     |    2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |    4 -
 .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi |    5 +
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |    4 +
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   |    4 +
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   21 +
 .../allwinner/sun50i-h618-longan-module-3h.dtsi    |    5 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |    5 +
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |    4 +
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    |    5 +
 .../allwinner/sun50i-h618-yuzukihd-chameleon.dts   |  222 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |   10 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  639 +++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |  318 ++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts    |  287 ++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |  327 ++
 arch/arm64/boot/dts/amlogic/Makefile               |    4 +
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     |   93 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  133 +
 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     |   95 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |    8 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |    5 +
 .../boot/dts/amlogic/amlogic-s6-s905x5-bl209.dts   |   42 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   97 +
 .../boot/dts/amlogic/amlogic-s7-s805x3-bp201.dts   |   41 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   99 +
 .../boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dts |   41 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   99 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |    1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   12 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |   10 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |    4 -
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |    4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |    4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |    4 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |    4 -
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi        |    1 +
 .../dts/amlogic/meson-g12b-a311d-libretech-cc.dts  |    6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |    2 +
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |    6 -
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |    6 -
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |    6 -
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |    6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi |    6 -
 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |    6 -
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  |    2 +
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi   |    6 -
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |   10 +-
 .../dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts |  262 ++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi   |   10 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   22 +-
 .../boot/dts/amlogic/meson-gxlx-s905l-p271.dts     |    4 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |    5 +
 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi   |    4 -
 .../arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi |    4 -
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |    4 -
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |    4 -
 .../dts/amlogic/meson-sm1-s905d3-libretech-cc.dts  |    4 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |    4 -
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |    1 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi            |   13 +
 arch/arm64/boot/dts/apple/s800-0-3.dtsi            |   13 +
 arch/arm64/boot/dts/apple/s8001.dtsi               |   13 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |    1 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |    1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   57 +
 arch/arm64/boot/dts/apple/t7000.dtsi               |   13 +
 arch/arm64/boot/dts/apple/t7001.dtsi               |   16 +
 arch/arm64/boot/dts/apple/t8010.dtsi               |   13 +
 arch/arm64/boot/dts/apple/t8011.dtsi               |   16 +
 arch/arm64/boot/dts/apple/t8012.dtsi               |   13 +
 arch/arm64/boot/dts/apple/t8015.dtsi               |   32 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |   58 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   57 +
 arch/arm64/boot/dts/arm/corstone1000.dtsi          |    1 -
 arch/arm64/boot/dts/arm/foundation-v8.dtsi         |    1 -
 arch/arm64/boot/dts/arm/fvp-base-revc.dts          |  101 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi             |    1 -
 arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts         |    1 -
 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts |   36 +
 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi    |   12 +
 arch/arm64/boot/dts/broadcom/Makefile              |    1 +
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts   |    8 +
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  155 +-
 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts   |    2 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 +++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  613 +++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  662 +++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1021 ++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  712 +++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   14 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   48 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  536 ++-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |    4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    8 +-
 arch/arm64/boot/dts/freescale/Makefile             |   40 +-
 .../{imx8mp-evk-pcie-ep.dtso =3D> imx-pcie0-ep.dtso} |    6 +-
 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso    |   15 +
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |   10 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |   10 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |   10 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   70 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   12 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |   25 +-
 .../dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts |   16 +
 .../boot/dts/freescale/imx8dxp-tqma8xdps.dtsi      |   24 +
 .../arm64/boot/dts/freescale/imx8mm-beacon-kit.dts |    1 +
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   18 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   13 +
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |    2 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |    6 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    4 -
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts |    1 +
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   18 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    4 -
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |   12 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   22 +-
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |   44 +
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   |  290 ++
 .../imx8mp-nitrogen-enc-carrier-board.dts          |  452 ++
 .../boot/dts/freescale/imx8mp-nitrogen-som.dtsi    |  409 ++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    |  796 ++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |  304 ++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 1314 ++++++
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso     |  107 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |    6 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   30 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   20 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   40 +-
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |   10 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |    6 +-
 .../boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso    |   22 -
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   45 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi |    6 +
 .../dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts |   16 +
 .../boot/dts/freescale/imx8qxp-tqma8xqps.dtsi      |   14 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |   29 +-
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |  317 ++
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |  243 +-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |  165 +-
 .../dts/freescale/imx93-tqma9352-mba91xxca.dts     |  749 +++
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    8 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    8 +-
 arch/arm64/boot/dts/freescale/imx94-clock.h        |  193 +
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h      | 1570 +++++++
 arch/arm64/boot/dts/freescale/imx94-power.h        |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 1148 +++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  195 +
 arch/arm64/boot/dts/freescale/imx943.dtsi          |  148 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   23 +
 .../boot/dts/freescale/imx95-19x19-evk-sof.dts     |   84 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   30 +
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts  |  324 ++
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |  698 +++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   30 +
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |    5 +
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    |  194 +
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi        |  768 +++
 arch/arm64/boot/dts/intel/Makefile                 |    1 +
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi      |    6 +
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     |    4 +-
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |   51 +
 .../boot/dts/intel/socfpga_agilex5_socdk_nand.dts  |   89 +
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |    1 -
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |    2 -
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         |    1 -
 arch/arm64/boot/dts/mediatek/Makefile              |    4 +
 arch/arm64/boot/dts/mediatek/mt6357.dtsi           |   10 -
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |    4 +-
 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h      | 1356 ++++++
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts  |    2 +-
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts   |   11 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  400 +-
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi |  450 ++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi          |  115 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |   11 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    4 +
 .../dts/mediatek/mt8186-corsola-ponyta-sku0.dts    |   18 +
 .../dts/mediatek/mt8186-corsola-ponyta-sku1.dts    |   22 +
 .../boot/dts/mediatek/mt8186-corsola-ponyta.dtsi   |   49 +
 .../boot/dts/mediatek/mt8186-corsola-starmie.dtsi  |   45 -
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi   |    1 -
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts        |    6 +-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |  345 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   51 +-
 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h      | 1574 +++++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |   40 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  169 +-
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    |  127 +-
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |   59 +-
 .../boot/dts/microchip/sparx5_pcb_common.dtsi      |    2 +
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |   65 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  115 +
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |    6 +
 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  |    8 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  162 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |    6 +
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |    6 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   30 +-
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |    2 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |    6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   75 +
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |    6 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |    9 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   22 +
 arch/arm64/boot/dts/qcom/Makefile                  |   61 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   21 +
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     |   41 +-
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |   28 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |   11 +-
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   40 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  246 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts        |   76 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  387 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   91 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  733 ++-
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi       |   44 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   37 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   55 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |   12 -
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  146 +-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |    3 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |    3 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |    3 +
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |    3 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |    3 +
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts        |    3 +
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts       |    3 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |    3 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    3 +
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi  |    8 +-
 .../boot/dts/qcom/msm8916-motorola-common.dtsi     |   11 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |    3 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |    3 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |    3 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |    3 +
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |    3 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |    3 +
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |    3 +
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    |    3 +
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |    3 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   64 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |   27 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |   11 +-
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts   |    3 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |    3 +
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |    3 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    |    3 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   75 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  158 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |   17 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |    6 +
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |   11 +-
 arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts      |    2 +
 arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts     |    2 +
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |   11 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   21 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |    6 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts    |    6 +-
 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts    |    1 +
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    8 +-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts           |    1 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |    1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   23 +-
 arch/arm64/boot/dts/qcom/pm8937.dtsi               |    8 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |   75 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  250 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   28 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |   72 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |   21 +
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso |   89 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  287 +-
 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi        |   51 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   37 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 4919 +++++++++++++=
+------
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    9 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   85 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    4 +-
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dtso     |   11 -
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   31 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    5 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    4 -
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  138 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 1179 ++++-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  455 ++
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    8 +-
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso           |   22 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |    2 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   15 +-
 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |    1 +
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |    3 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    2 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  285 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   30 +-
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso         |   44 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   22 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |    2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   58 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  745 +--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |    4 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   46 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    3 +
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  215 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    4 -
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |   11 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   29 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    9 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   16 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |  600 ++-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    4 -
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    4 -
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   43 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts |   23 +
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    |   23 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   10 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   27 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   17 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   11 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |   18 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   49 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |   68 +
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |  295 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   10 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |    7 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  212 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |  210 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    5 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    8 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   21 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    5 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   25 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   34 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   88 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |   12 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  704 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 2885 ++++++++----
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   22 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   21 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  728 ++-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 1749 +++++++
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |   52 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |  148 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts    |   12 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 1126 +----
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 1576 +++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  314 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +----
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   22 +-
 .../dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts   |   30 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |  173 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  492 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   23 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    5 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  154 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 1084 ++---
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   17 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   81 +
 arch/arm64/boot/dts/renesas/Makefile               |    7 +
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |    2 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   60 +-
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi          |   17 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   30 +-
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso |   43 +
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |  772 +++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   21 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  115 +
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |    7 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  115 +
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |    7 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  259 ++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  102 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  282 ++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  114 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   21 +
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   47 +
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |    5 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |    2 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |    8 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |    2 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  215 +
 .../dts/renesas/white-hawk-ard-audio-da7212.dtso   |    2 +-
 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi |    8 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   15 +
 .../dts/rockchip/px30-cobra-ltk050h3146w-a2.dts    |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3146w.dts  |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3148w.dts  |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk500hd1829.dts  |   73 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |  566 +++
 .../dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts   |   39 +
 .../boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts |   39 +
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |  602 +++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   22 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi             |    6 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts    |  494 ++
 .../boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts  |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    8 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   48 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |    1 +
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  149 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  519 ++-
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |  456 ++
 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi   | 2352 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi           | 1185 +++++
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts   |    6 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  |    1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |    1 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |    1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |   19 +-
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |    5 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |   15 +-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    8 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   87 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   17 +-
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |   47 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  502 +-
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |  101 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  150 +-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |   62 +-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |   47 +
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   |  931 ++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |   28 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |    8 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   75 +-
 .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    |   36 +
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  113 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  952 +---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   |  945 ++++
 .../rockchip/rk3588-tiger-haikou-video-demo.dtso   |  153 +
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    8 +
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   55 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |    8 +
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |   77 +-
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi      |   51 +
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  231 +
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |   40 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   20 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  112 +
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   50 +
 arch/arm64/boot/dts/ti/Makefile                    |   28 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |   12 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   96 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |   36 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts   |  521 +++
 arch/arm64/boot/dts/ti/k3-am62-verdin-dahlia.dtsi  |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-yavia.dtsi   |    2 +-
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi         |   25 +
 arch/arm64/boot/dts/ti/k3-am62.dtsi                |    8 +-
 .../dts/ti/k3-am625-beagleplay-csi2-ov5640.dtso    |   31 +
 .../ti/k3-am625-beagleplay-csi2-tevi-ov5640.dtso   |   31 +
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |    2 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |   14 +-
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi           |   25 +
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   |  107 +-
 arch/arm64/boot/dts/ti/k3-am62a-thermal.dtsi       |   57 +-
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi        |   25 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |  149 +-
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi              |    4 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   11 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi |  228 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi    |  245 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi    |  629 +++
 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi |  213 +
 .../arm64/boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi |   15 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-wifi.dtsi   |   31 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi  |  219 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 1404 ++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |  128 +-
 .../dts/ti/k3-am62p5-verdin-nonwifi-dahlia.dts     |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dts   |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts   |   22 +
 .../dts/ti/k3-am62p5-verdin-nonwifi-mallow.dts     |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts   |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts      |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts      |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts   |   22 +
 .../boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts    |   22 +
 .../dts/ti/k3-am62x-phyboard-lyra-gpio-fan.dtso    |   14 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |   76 +-
 .../arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso |   34 +-
 .../arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso |   34 +-
 .../boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso  |   34 +-
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |   13 +-
 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso  |    2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            |   21 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             |   20 +
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi           |    4 +-
 .../k3-am654-base-board-rocktech-rk101-panel.dtso  |   12 +
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |    1 -
 .../dts/ti/k3-am6548-iot2050-advanced-common.dtsi  |    1 -
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |    1 +
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts   |  575 +++
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi    |  601 +++
 .../dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso     |    2 +-
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts   |   13 +-
 arch/arm64/boot/dts/ti/k3-am69-sk.dts              |    1 -
 arch/arm64/boot/dts/ti/k3-j7200-evm-pcie1-ep.dtso  |    2 +-
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi          |   13 +-
 .../k3-j721e-common-proc-board-infotainment.dtso   |   57 +-
 .../boot/dts/ti/k3-j721e-common-proc-board.dts     |    7 +-
 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie0-ep.dtso  |    2 +-
 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso  |    2 +-
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          |   40 +-
 .../boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso  |   35 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts             |   31 +
 arch/arm64/boot/dts/ti/k3-j721e.dtsi               |    2 +
 arch/arm64/boot/dts/ti/k3-j721s2-evm-pcie1-ep.dtso |    2 +-
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |   27 +-
 .../ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso  |  329 ++
 .../dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso |  323 ++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |   46 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   14 +-
 .../dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso    |    1 -
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |    6 +
 .../dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso   |   29 +
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  |   19 +-
 arch/arm64/configs/defconfig                       |    2 +
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        |    3 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   11 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |    3 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  132 +-
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi    |   52 +-
 .../dts/starfive/jh7110-deepcomputing-fml13v01.dts |   19 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |   21 +
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |   24 +
 include/dt-bindings/clock/rockchip,rk3528-cru.h    |    6 +
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |   10 +
 include/dt-bindings/clock/spacemit,k1-syscon.h     |  247 +
 include/dt-bindings/clock/stm32h7-clks.h           |    4 +-
 774 files changed, 70391 insertions(+), 10084 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/altr_socfpga=
.txt
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-=
pll.yaml
 delete mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20=
-apbdma.txt
 create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20=
-apbdma.yaml
 delete mode 100644 Documentation/devicetree/bindings/firmware/intel,str=
atix10-svc.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/intel,str=
atix10-svc.yaml
 create mode 100644 Documentation/devicetree/bindings/fpga/intel,stratix=
10-soc-fpga-mgr.yaml
 delete mode 100644 Documentation/devicetree/bindings/fpga/intel-stratix=
10-soc-fpga-mgr.txt
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controll=
er/nvidia,tegra20-ictlr.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controll=
er/nvidia,tegra20-ictlr.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/space=
mit,k1-syscon.yaml
 create mode 100644 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/broadcom/bcm2837-rpi-2-b.dts
 delete mode 100644 arch/arm/boot/dts/broadcom/bcm59056.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de1=
0nano.dts
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20_common.dtsi
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf300tl.dts
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021=
a-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021=
a-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021=
a-rgb-cdtech-dc44.dtso
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021=
a-rgb-cdtech-fc21.dtso
 create mode 100644 arch/arm/boot/dts/qcom/msm8926.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.d=
ts
 create mode 100644 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts
 create mode 100644 arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
 create mode 100644 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
 create mode 100644 arch/arm/boot/dts/vt8500/wm8950.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h=
-a133l.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-c=
hameleon.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.=
dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.d=
ts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.=
dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s6-s905x5-bl209.=
dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7-s805x3-bp201.=
dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm20=
2.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-a=
quaman.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2837-rpi-2-b.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870.dtsi
 rename arch/arm64/boot/dts/freescale/{imx8mp-evk-pcie-ep.dtso =3D> imx-=
pcie0-ep.dtso} (64%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-s=
marc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-=
lvds-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.=
dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-ca=
rrier-board.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dt=
si
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dt=
si
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-d=
ev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.d=
tsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8m=
p-ras314-imx219.dtso
 delete mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dt=
so
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-s=
marc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xx=
ca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-sm=
arc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dt=
si
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand=
.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6893-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
-2g5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=
.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-s=
ku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-s=
ku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.d=
tsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-=
mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezz=
anine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-crd.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t1=
4s-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t1=
4s.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra=
-g1q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fa=
n-pwm.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w=
-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w=
.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w=
.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829=
.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146=
w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148=
w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-vid=
eo-demo.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahl=
ia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mall=
ow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavi=
a.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.d=
ts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-ca=
m-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-o=
v5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-typ=
e-a.dtso
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h
