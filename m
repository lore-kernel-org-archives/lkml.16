Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4BF22A7F8;
	Mon, 12 May 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061297; cv=none; b=jLA+h5TDw+0AW51ghg3cfn5FthUtu9+SjjCD10HoczXJSV+7KSTh5fIY4df0Dc5Kl71jjg83I6EksQ9QGDhSyAlUVkQHnKuSjBt/vlTJ5y29R1MphZ+WzrVDj4UalBbB7LIqiPwVmnpgp1EEjz8+bmr3IF9E31I/nXkvu0lqw5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061297; c=relaxed/simple;
	bh=WiqhKAM7UjsMIX7HmujWDPPo4vY4tdGPQZZNtz751mY=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZDZFTBtA1bhZfkntYCIP+jsHB/WXkta0QGYgOzpPmpZSZO99Kh92gnv55+ZJAx2osikRyJYjZ1NfjvAL8Zi0FwQdb6JLueAz0uv/awPeKwzg1Dlp507Cw+zsa2IN/8WB63hl0d+wS2vCGm9UIoDG2p7CDiHKxxIWP1d6yLVQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KKIUftop; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KKIUftop"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CEm7oc2039866
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 09:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747061287;
	bh=mBAPoRnu79Kki7ZV6VFllJxIv4+SrHJ+sjXGWIyDWqc=;
	h=Date:From:To:CC:Subject;
	b=KKIUftop43zQv9e6yVFSaVg9FJHJEXe4zwCkx2rATj6nHFeYnnIwxX/AwUwrMyoYN
	 y1qq+2Af2ql9msdgXCGiaRQbXWrEeYEa1r8gtViVRMy/PjA+GR65eXbVtve/wvsJM5
	 PBzGDuZ29oUQUhEhqQSvvXD3gzwILpvbPhFlW6lM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CEm7C1077865
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 09:48:07 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 09:48:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 09:48:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CEm7Xi015641;
	Mon, 12 May 2025 09:48:07 -0500
Date: Mon, 12 May 2025 09:48:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, SoC list <soc@lists.linux.dev>
CC: SoC <soc@kernel.org>, <arm@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tero
 Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth
 Menon <nm@ti.com>
Subject: [GIT PULL 3/3] arm64: dts: ti: K3 devicetree updates for v6.16
Message-ID: <20250512144807.yn64klchtmjjl6ac@protrude>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugjf7cm6tlk43njq"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

--ugjf7cm6tlk43njq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This PR has the usual 75 char warnings around pinctrl usage and couple
of other places which I have chosen to ignore in favor of readability,
couple of places where regex related eeprom compatible lookup failed
(but dtbs_check passes).

More importantly, J721S2 GPU commits are based off drm-next tree
commit 2c01d9099859 which has been in the queue for a few weeks
now - so this warns for commit 2c01d9099859 not being present and
compatibles img,img-axe-1-16m, img,img-bxs-4-64, ti,j721s2-gpu,
img,img-rogue not being present. I chose to pick them up considering
the benefit our community has with the driver support now being
enabled in upstream.

This PR also has fixes that finally makes the ti dts tree almost clear
of all dtbs_check warnings (pending one fixup in the serdes binding
which is pending to be picked up).

Please let me know if there are concerns, else:

Please pull:
The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-for-v6.16

for you to fetch changes up to 6a9d340b1f9910f0f88e0819c464938b91610765:

  arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640 (2025-05-09 06:=
21:57 -0500)

----------------------------------------------------------------
TI K3 device tree updates for v6.16

Generic Fixups/Cleanups:
* am62*: emmc - drop disable-wp, Add bootphase tags to support MMC boot

SoC Specific features and Fixes:
AM62Ax:
* C7x and R5F support added
* Bug fix for emmc clock to point to default
* CPUFreq thermal throttling on thermal alert

AM62P5:
* Add RNG Node (common to J722s)
* Bug fix for emmc clock to point to default (common to J722S)

AM625:
* Wakeup R5 node
* Bug fix for emmc clock to point to default
* PRUSS-M support
* New GPU bindings

AM64:
* Switch to 64-bit address space for PCIe0
* Add PCIe control nodes for main_conf region
* Reserve timer nodes used by MCU F/w.

AM65:
* MMC: Add missing delay timing values for SDR and legacy modes
* Add compatible for AM65x syscon and PCIe control properties
  (dtbs_check fixes)

J7200:
* PCIe control node to scm_conf, switch to 64-bit address space for PCIe1.

J721E:
* PCIe control node to scm_conf, switch to 64-bit address space for PCIe0,1.

J721S2:
* GPU node for Imagination Tech Rouge BXS GPU.
* PCIe control node to scm_conf, switch to 64-bit address space for PCIe1.

J722s/AM67A:
* Switch serdes status to be enabled by board file than at SoC level.
* Switch to 64-bit address space for PCIe0.

J784S4/J742S2/AM69:
* Add ASPCIE0 and enable output for PCIe1
* Fix length of serdes_ln_ctrl.
* Switch to 64-bit address space for PCIe0,1.

Board Specific:
AM62Ax:
* SK: co-processors C7x, R5, PWM support added
* phycore-som: co-processors C7x, R5

AM62P5:
* Add Toradex Verdin AM62P boards with Dahlia, Ivy, Mallow and Yavia suppor=
t.
* SK: Add remote processor support, PWM

AM625:
* Add BeagleBoard.org PocketBeagle-2 support
* phycore-som: Enable R5F support
* Verdin: Add eeprom compatible fallback
* SK: Enable PWM, voltage supplies, clock, i2cmux rename for camera overlays
  (dtbs_check fixes)
* BeaglePlay: Add voltage supplies for camera overlays (dtbs_check fixes)
* phyboard-lyra: Add cooling maps for fan
* emmc bug fixes: add non-removable flag for eMMC.

AM65:
* EVM: Add missing power supply description ofr Rocktech panel
  (dtbs_check fixes)

J721E:
* EVM: Enable OSPI1
* EVM/SK: Dt nodes description for mandatory power suplpies for panel and
  sensors (dtbs_check fixes)

J721S2/AM68:
* Add phyBOARD-Izar-AM68x
* am68-SK: Fix regulator hierarchy

J722s/AM67A:
* EVM: Add mux controls for CSI2, power regulator nodes and add overlays for
  quad IMX219 and TEVI OV5640.
* BeagleY-AI: Add bootph for main_gpio1

J784S4/J742S2/AM69:
* usxgmii expansion board: Drop un-necessary pinctrl-names
* evm: Add overlay for USB0 Type-A option

----------------------------------------------------------------
Andrew Davis (7):
      dt-bindings: soc: ti: ti,j721e-system-controller: Add PCIe ctrl prope=
rty
      arm64: dts: ti: k3-j721e: Add PCIe ctrl node to scm_conf region
      arm64: dts: ti: k3-j7200: Add PCIe ctrl node to scm_conf region
      arm64: dts: ti: k3-j721s2: Add PCIe ctrl node to scm_conf region
      arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region
      dt-bindings: mfd: ti,j721e-system-controller: Add compatible string f=
or AM654
      arm64: dts: ti: am65x: Add missing power-supply for Rocktech-rk101 pa=
nel

Daniel Schultz (6):
      arm64: dts: ti: k3-am62a: Enable CPU freq throttling on thermal alert
      arm64: dts: ti: k3-am62x-phyboard-lyra-gpio-fan: Update cooling maps
      arm64: dts: ti: k3-am62-phycore-som: Enable Co-processors
      arm64: dts: ti: k3-am62a-phycore-som: Enable Co-processors
      arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
      arm64: dts: ti: k3-am62a-phycore-som: Reserve main_timer2 for C7x DSP

Devarsh Thakkar (3):
      arm64: dts: ti: k3-am62a-wakeup: Add R5F device node
      arm64: dts: ti: k3-am62a7-sk: Enable IPC with remote processors
      arm64: dts: ti: k3-am62p5-sk: Enable IPC with remote processors

Dominik Haller (2):
      dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
      arm64: dts: ti: Add basic support for phyBOARD-Izar-AM68x

Francesco Dolcini (7):
      arm64: dts: ti: k3-am625-verdin: Add EEPROM compatible fallback
      dt-bindings: arm: ti: Add Toradex Verdin AM62P
      arm64: dts: ti: Add Toradex Verdin AM62P
      arm64: dts: ti: am62p-verdin: Add dahlia
      arm64: dts: ti: am62p-verdin: Add mallow
      arm64: dts: ti: am62p-verdin: Add yavia
      arm64: dts: ti: am62p-verdin: Add ivy

Hari Nagalla (6):
      arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F node
      arm64: dts: ti: k3-am62a-mcu: Add R5F remote proc node
      arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
      arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
      arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
      arm64: dts: ti: k3-am64: Reserve timers used by MCU FW

Jai Luthra (1):
      arm64: dts: ti: k3-am62a-main: Add C7xv device node

Jan Kiszka (1):
      arm64: dts: ti: k3-am65-main: Add system controller compatible

Jayesh Choudhary (1):
      arm64: dts: ti: k3-j721e-common-proc-board-infotainment: Update to co=
mply with device tree schema

Judith Mendez (11):
      arm64: dts: ti: k3-am62p5-sk: Enable PWM
      arm64: dts: ti: k3-am62a7-sk: Enable PWM
      arm64: dts: ti: k3-am625-sk: Enable PWM
      arm64: dts: ti: k3-am6*: Add boot phase flag to support MMC boot
      arm64: dts: ti: k3-am62*: Add non-removable flag for eMMC
      arm64: dts: ti: k3-am6*: Remove disable-wp for eMMC
      arm64: dts: ti: k3-am62-main: Set eMMC clock parent to default
      arm64: dts: ti: k3-am62a-main: Set eMMC clock parent to default
      arm64: dts: ti: k3-am62p-j722s-common-main: Set eMMC clock parent to =
default
      arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
      arm64: dts: ti: k3-am62: Add ATCM and BTCM cbass ranges

Kishon Vijay Abraham I (1):
      arm64: dts: ti: k3-am62-main: Add PRUSS-M node

Matt Coster (2):
      arm64: dts: ti: k3-am62: New GPU binding details
      arm64: dts: ti: k3-j721s2: Add GPU node

Michael Walle (1):
      arm64: dts: ti: k3-am62p-j722s: Add rng node

Nishanth Menon (1):
      arm64: dts: ti: k3-am67a-beagley-ai: Add bootph for main_gpio1

Prasanth Babu Mantena (1):
      arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E

Rishikesh Donadkar (6):
      arm64: dts: ti: k3-am62p5-sk: Add regulator nodes for AM62P
      arm64: dts: ti: k3-am62x: Add required voltage supplies for IMX219
      arm64: dts: ti: k3-am62x: Add required voltage supplies for OV5640
      arm64: dts: ti: k3-am62x: Add required voltage supplies for TEVI-OV56=
40
      arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies fo=
r OV5640
      arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies fo=
r TEVI-OV5640

Robert Nelson (2):
      dt-bindings: arm: ti: Add PocketBeagle2
      arm64: dts: ti: Add k3-am62-pocketbeagle2

Siddharth Vadapalli (16):
      arm64: dts: ti: k3-j784s4-evm-usxgmii-exp1-exp2: drop pinctrl-names
      arm64: dts: ti: k3-j722s-evm: Enable "serdes_wiz0" and "serdes_wiz1"
      arm64: dts: ti: k3-j722s-main: Disable "serdes_wiz0" and "serdes_wiz1"
      arm64: dts: ti: k3-j722s-main: Don't disable serdes0 and serdes1
      arm64: dts: ti: k3-j722s-evm: Drop redundant status within serdes0/se=
rdes1
      arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 Type=
-A
      arm64: dts: ti: k3-j784s4-j742s2-main-common: Fix length of serdes_ln=
_ctrl
      arm64: dts: ti: k3-am64-main: Switch to 64-bit address space for PCIe0
      arm64: dts: ti: k3-j7200-main: Switch to 64-bit address space for PCI=
e1
      arm64: dts: ti: k3-j721e: Add ranges for PCIe0 DAT1 and PCIe1 DAT1
      arm64: dts: ti: k3-j721e-main: Switch to 64-bit address space for PCI=
e0 and PCIe1
      arm64: dts: ti: k3-j721s2-main: Switch to 64-bit address space for PC=
Ie1
      arm64: dts: ti: k3-j722s-main: Switch to 64-bit address space for PCI=
e0
      arm64: dts: ti: k3-j784s4-j742s2-main-common: Switch to 64-bit addres=
s space for PCIe0 and PCIe1
      arm64: dts: ti: k3-j784s4-j742s2-main-common: Add ACSPCIE0 node
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable ACSPCIE0 output f=
or PCIe1

Vaishnav Achath (2):
      arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
      arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640

Yemike Abhilash Chandra (9):
      arm64: dts: ti: k3-j721e-sk: Add DT nodes for power regulators
      arm64: dts: ti: k3-am68-sk: Fix regulator hierarchy
      arm64: dts: ti: k3-j721e-sk: Remove clock-names property from IMX219 =
overlay
      arm64: dts: ti: k3-j721e-sk: Add requiried voltage supplies for IMX219
      arm64: dts: ti: k3-am62x: Remove clock-names property from IMX219 ove=
rlay
      arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in IMX219 over=
lay
      arm64: dts: ti: k3-am62x: Rename I2C switch to I2C mux in OV5640 over=
lay
      arm64: dts: ti: j722s-evm: Add DT nodes for power regulators
      arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX

 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   32 +
 .../soc/ti/ti,j721e-system-controller.yaml         |   23 +
 arch/arm64/boot/dts/ti/Makefile                    |   28 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |   12 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |   96 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |   36 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts   |  521 ++++++++
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |  149 ++-
 arch/arm64/boot/dts/ti/k3-am62a7.dtsi              |    4 +
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |   11 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi |  228 ++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi    |  245 ++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi    |  629 +++++++++
 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi |  213 +++
 .../arm64/boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi |   15 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-wifi.dtsi   |   31 +
 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi  |  219 +++
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 1404 ++++++++++++++++=
++++
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
 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts   |  575 ++++++++
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi    |  601 +++++++++
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
 .../ti/k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtso  |  329 +++++
 .../dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso |  323 +++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |   46 +-
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi          |   14 +-
 .../dts/ti/k3-j784s4-evm-usxgmii-exp1-exp2.dtso    |    1 -
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |    6 +
 .../dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso   |   29 +
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi  |   19 +-
 80 files changed, 6886 insertions(+), 133 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dahlia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-dev.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-mallow.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-nonwifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-wifi.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dahlia.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-mallow.=
dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.d=
ts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dahlia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-dev.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-mallow.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-rpi-cam-i=
mx219.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov56=
40.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a=
=2Edtso
--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--ugjf7cm6tlk43njq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmgiCh4ACgkQ3bWEnRc2
JJ3gEBAArMScgAhCl89T6Mcu3xbWoXkA7edgjKpKGaSz+ZlAtsp7xUVZUNU/rIQZ
a4bFOkcevkILRTn+DmunusUfa4vTwXXCcq5MXyIzhthOl0zY6rSw1QqnM5Oqs4Y0
TvDR7CQRb54nEh3X2qg/Kr7/XXMutfRnxVYB4jnjr95VEy3ZKryGkjK4eA67LIRV
SqkkSXhK6HTCOkXK+EGbI1edTdc/Xqnew2aTQUXgx9m9f1lsqM/68TjFvddXDy+C
E6AaILXUofWS3ZXMHtio0JGcwQcrwC99MhlGo40+SNWHNZH2Qi0cF0fQiOzFCf69
yjCwXkSBx56ZURO5CoZEbFOWAEmsnD/lBB3toV6oCZf3ipit85Upj0Xhec1AKlTb
3NmQW1CsGgWpam5fdZdatSwG/19oXKmvkVsL7d/zimDRfDAo3bId6pEY2XXZQvUP
xCvLgXM7r7spk6lsZiRRyeohBi9qMt26w8BiN6uipf4IaZucS5wGfkdNb1MiTsQP
hCkwEA1J4awZRkjnzP86JJko04jMiFCOHWTbrlR81cdOHwq/b4EQ19SflTMOm2wD
5/CCH+9Y1HIJCKEW0AFJ4Ho3piCUQTTKHcbiiugmDfykWgdZk3f6a476nWNI789E
uj2pMN0aLPMGp6uZbfuyfzIT7G2VUMei37N2ZKPYKlEebMWMS/k=
=UPnO
-----END PGP SIGNATURE-----

--ugjf7cm6tlk43njq--
