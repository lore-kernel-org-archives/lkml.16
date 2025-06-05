Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AE754723
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106164; cv=none; b=tJ5pUmKrcuVJ5hMZbP99+DdnUVog29ksxBWOz1smD8O3P1TvIs6k2Qi09UEHgeeYVrSezb1t/YV8t2SiqNzq2Gkm/ciQXX1ml3BqLqNhg6QDZnjEU3RgcZuDsToPHDR6S205w0T0Qg+VUtPZs9B294CiGRaomqeeUsg5Z94fhpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106164; c=relaxed/simple;
	bh=0flKWdU5WcZcp5IYJPEq42tGtbhhbKKKw7f9XGBgskQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RDPOyTvyzkxQUtEMfV1weGYwmadZQ/8PB2V1umyI/tjdP3aNAhAb5KIMncqJd6x+7L3PfwbJXhDHefOmvfehdLjNR+awEdfWzzts66zEz4+Gp2BiUoXHXV4f5ID1C0jvhbwRM3ITEQZYYAdnIHpgNTJC8uK24uDoIQBgjcly5ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oz+o/pj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oz+o/pj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CE6C4CEE7;
	Thu,  5 Jun 2025 06:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749106163;
	bh=0flKWdU5WcZcp5IYJPEq42tGtbhhbKKKw7f9XGBgskQ=;
	h=Date:From:To:Cc:Subject:From;
	b=oz+o/pj2jf5jI/GShc+/riX9HTbeJbpMQk6t3v2u/j43Jtq21aoB/l4iFso+fu9ck
	 ZdTFlNFusfd/tfKMY3FPVPY56SheXHMmpFFU4YdWlA2bIdLpGW1P7XlTcNTX4/1dwg
	 z7N9WhM0WwOWPkP4k0hbSklTNzJmECBnyAz5KoqkCcIOh5ony4dJNI0fDHM8YuryW9
	 xJw9WwfTECc+9sak15GmajCM9IaEsT86Xz7HVxbgtNjnIKefh5WNCF/HQ5xTXyTr5a
	 oQVkVyIn4JF9Ps+wjVEdB4ih7NhaA6GuNDcBLR0x5dyMHJdu5KWTrYwvZRWFq43ShU
	 41hIBV5Mwr3Xg==
Date: Thu, 5 Jun 2025 12:19:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy updates for v6.16
Message-ID: <aEE98PP0Mpz4a0v+@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBi6uhclkiTWubx2"
Content-Disposition: inline


--YBi6uhclkiTWubx2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive generic phy updates as usual featuring couple of
new driver and bunch of new device support and some driver changes to
Freescale, rockchip driver along with couple of yaml binding
conversions.

This might create conflict while merging and am sure it would be
resolved. linux-next has resolutions as well

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
for-6.16

for you to fetch changes up to 0c22287319741b4e7c7beaedac1f14fbe01a03b9:

  phy: tegra: p2u: Broaden architecture dependency (2025-05-14 12:28:04 +01=
00)

----------------------------------------------------------------
phy-for-6.16

- New Support
  - Qualcomm IPQ5424 qusb2 support, IPQ5018 uniphy-pcie driver
  - Rockchip usb2 support for RK3562, RK3036 usb2 phy support
  - Samsung exynos2200 eusb2 phy support and driver refactoring for this
    support, exynos7870 USBDRD support
  - Mediatek MT7988 xs-phy support
  - Broadcom BCM74110 usb phy support
  - Renesas RZ/V2H(P) usb2 phy support

- Updates
  - Freescale phy rate claculation updates, i.MX95 tuning support
  - Better error handling for amlogic pcie phy
  - Rockchip color depth configuration and management support
  - Yaml binding conversion for RK3399 Type-C and PCIe Phy

----------------------------------------------------------------
Adam Ford (3):
      phy: freescale: fsl-samsung-hdmi: Rename phy_clk_round_rate
      phy: freescale: fsl-samsung-hdmi: Refactor finding PHY settings
      phy: freescale: fsl-samsung-hdmi: Improve LUT search for best clock

Alexander Stein (1):
      phy: freescale: imx8m-pcie: Simplify with dev_err_probe()

Anand Moon (6):
      phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with dev_er=
r_probe()
      phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with dev_e=
rr_probe()
      phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling=
 with dev_err_probe()
      phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with d=
ev_err_probe()
      phy: amlogic: phy-meson-axg-pcie: Simplify error handling with dev_er=
r_probe()
      phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie =
probe

Andr=E9 Draszik (2):
      phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on exynos7870
      phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP where appropriate

AngeloGioacchino Del Regno (2):
      dt-bindings: phy: mediatek,dsi-phy: Add support for MT6893
      dt-bindings: phy: mediatek,tphy: Add support for MT6893

Chen Ni (1):
      phy: rockchip: samsung-hdptx: Remove unneeded semicolon

Chenyuan Yang (1):
      phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug

Cristian Ciocaltea (13):
      phy: hdmi: Add color depth configuration
      phy: rockchip: samsung-hdptx: Fix clock ratio setup
      phy: rockchip: samsung-hdptx: Do no set rk_hdptx_phy->rate in case of=
 errors
      phy: rockchip: samsung-hdptx: Drop unused struct lcpll_config
      phy: rockchip: samsung-hdptx: Drop unused phy_cfg driver data
      phy: rockchip: samsung-hdptx: Drop superfluous cfgs driver data
      phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead
      phy: rockchip: samsung-hdptx: Setup TMDS char rate via phy_configure_=
opts_hdmi
      phy: rockchip: samsung-hdptx: Provide config params validation support
      phy: rockchip: samsung-hdptx: Restrict altering TMDS char rate via CCF
      phy: rockchip: samsung-hdptx: Rename ambiguous rk_hdptx_phy->rate
      phy: rockchip: samsung-hdptx: Optimize internal rate handling
      phy: rockchip: samsung-hdptx: Add high color depth management

Daniel Golle (1):
      phy: mediatek: xsphy: support type switch by pericfg

Frank Wang (1):
      phy: rockchip: inno-usb2: Add usb2 phy support for rk3562

Frank Wunderlich (2):
      dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
      dt-bindings: phy: mtk-xs-phy: support type switch by pericfg

Heiko Stuebner (2):
      dt-bindings: phy: rockchip,inno-usb2phy: add rk3036 compatible
      phy: rockchip: inno-usb2: add phy definition for rk3036

Ivaylo Ivanov (10):
      dt-bindings: phy: add exynos2200 eusb2 phy support
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
      phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
      phy: phy-snps-eusb2: refactor constructs names
      phy: phy-snps-eusb2: split phy init code
      phy: phy-snps-eusb2: make repeater optional
      phy: phy-snps-eusb2: make reset control optional
      phy: phy-snps-eusb2: refactor reference clock init
      phy: phy-snps-eusb2: add support for exynos2200
      phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller

Johan Hovold (1):
      phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply

Justin Chen (2):
      dt-bindings: phy: brcmstb-usb-phy: Add support for bcm74110
      phy: usb: add support for bcm74110

Kathiravan Thirumoorthy (2):
      Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
      phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424

Kaustabh Chakraborty (3):
      phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY regis=
ters
      dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy com=
patible
      phy: exynos5-usbdrd: add exynos7870 USBDRD support

Kever Yang (1):
      dt-bindings: phy: rockchip,inno-usb2phy: add rk3562

Konrad Dybcio (1):
      phy: qcom: pcie: Determine has_nocsr_reset dynamically

Krzysztof Kozlowski (2):
      phy: marvell: Do not enable by default during compile testing
      phy: samsung: Do not enable PHY_EXYNOS5_USBDRD by default during comp=
ile testing

Lad Prabhakar (4):
      dt-bindings: phy: renesas,usb2-phy: Add clock constraint for RZ/G2L f=
amily
      dt-bindings: phy: renesas,usb2-phy: Document RZ/V2H(P) SoC
      phy: renesas: phy-rcar-gen3-usb2: Sort compatible entries by SoC part=
 number
      phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/V2H(P)

Martin Blumenstingl (2):
      phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
      phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers

Mike Looijmans (1):
      phy-zynqmp: Postpone getting clock rate until actually needed

Nitheesh Sekar (2):
      dt-bindings: phy: qcom: uniphy-pcie: Add ipq5018 compatible
      phy: qualcomm: qcom-uniphy-pcie 28LP add support for IPQ5018

Qiang Yu (1):
      phy: qcom: qmp-pcie: Add PHY register retention support

Rob Herring (Arm) (3):
      dt-bindings: phy: rockchip: Add missing "phy-supply" property
      dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY to schema
      dt-bindings: phy: rockchip: Convert RK3399 PCIe PHY to schema

Sandor Yu (1):
      phy: Add HDMI configuration options

Siddharth Vadapalli (1):
      dt-bindings: phy: cadence-torrent: enable PHY_TYPE_USXGMII

Vidya Sagar (1):
      phy: tegra: p2u: Broaden architecture dependency

Xu Yang (4):
      dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt p=
roperty
      dt-bindings: phy: imx8mq-usb: add imx95 tuning support
      phy: fsl-imx8mq-usb: fix phy_tx_vboost_level_from_property()
      phy: fsl-imx8mq-usb: add i.MX95 tuning support

 .../bindings/phy/brcm,brcmstb-usb-phy.yaml         |   5 +-
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  37 +-
 .../devicetree/bindings/phy/mediatek,dsi-phy.yaml  |   1 +
 .../devicetree/bindings/phy/mediatek,tphy.yaml     |   1 +
 .../devicetree/bindings/phy/mediatek,xsphy.yaml    |  16 +
 .../bindings/phy/phy-cadence-torrent.yaml          |   3 +-
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml  |   3 +
 .../devicetree/bindings/phy/phy-rockchip-typec.txt |  84 ---
 .../bindings/phy/phy-rockchip-usbdp.yaml           |   3 +
 .../bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml |  49 +-
 .../devicetree/bindings/phy/renesas,usb2-phy.yaml  |   8 +-
 .../bindings/phy/rockchip,inno-usb2phy.yaml        |   4 +
 .../bindings/phy/rockchip,pcie3-phy.yaml           |   3 +
 .../bindings/phy/rockchip,rk3399-pcie-phy.yaml     |  45 ++
 .../bindings/phy/rockchip,rk3399-typec-phy.yaml    | 116 ++++
 .../devicetree/bindings/phy/rockchip-pcie-phy.txt  |  36 --
 .../bindings/phy/samsung,exynos2200-eusb2-phy.yaml |  80 +++
 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  40 +-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  13 +-
 .../devicetree/bindings/usb/rockchip,dwc3.yaml     |   2 +-
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c      |  10 +-
 .../phy/amlogic/phy-meson-axg-mipi-pcie-analog.c   |  10 +-
 drivers/phy/amlogic/phy-meson-axg-pcie.c           |  14 +-
 drivers/phy/amlogic/phy-meson-g12a-usb2.c          |  10 +-
 drivers/phy/amlogic/phy-meson-gxl-usb2.c           |  11 +-
 drivers/phy/amlogic/phy-meson8b-usb2.c             |  35 +-
 drivers/phy/broadcom/phy-brcm-usb-init-synopsys.c  |  61 ++
 drivers/phy/broadcom/phy-brcm-usb-init.h           |   1 +
 drivers/phy/broadcom/phy-brcm-usb.c                |  14 +
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c         |  21 +-
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c         |  84 ++-
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c       | 119 ++--
 drivers/phy/marvell/Kconfig                        |   4 +-
 drivers/phy/mediatek/phy-mtk-xsphy.c               |  85 ++-
 drivers/phy/phy-snps-eusb2.c                       | 627 +++++++++++++++++=
++++
 drivers/phy/qualcomm/Kconfig                       |   9 -
 drivers/phy/qualcomm/Makefile                      |   1 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  90 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |   6 +-
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  27 +-
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c         | 442 ---------------
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c   |  45 ++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  38 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      |  81 +++
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c  | 292 ++++++----
 drivers/phy/samsung/Kconfig                        |   2 +-
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 617 +++++++++++++++++=
---
 drivers/phy/tegra/Kconfig                          |   2 +-
 drivers/phy/xilinx/phy-zynqmp.c                    |  70 +--
 include/linux/phy/phy-hdmi.h                       |  21 +
 include/linux/phy/phy.h                            |   7 +-
 include/linux/soc/samsung/exynos-regs-pmu.h        |   5 +
 54 files changed, 2386 insertions(+), 1033 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-type=
c.txt
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-p=
cie-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3399-t=
ypec-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos220=
0-eusb2-phy.yaml
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
 create mode 100644 include/linux/phy/phy-hdmi.h

--=20
~Vinod

--YBi6uhclkiTWubx2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmhBPfAACgkQfBQHDyUj
g0f/Bw/+LhX81YT3b8Z7Ymx5CulWDBE7e74bs8iD8H/IfHEb0vSTdBxhQ7/qM1/V
UFlEtiCJeEd0GJzAW0jqg9iZN0SBJpvayt7kgLEsx6+EwRencWvKjAoKEcXn44Ty
bWTO3sT2NIX60km05hRtnwl69t5/Db0FZAxfD5mubtzqiPPJf3rxaBmmrvSA2LGq
UI/WPMZmQzQRMdzZ/pJ/9kuKQSf58Tbo1IyVxmUn+z1J/IVycrfMAKwaHMt0Swia
5Ip99R1Qja+Mq64NuV6GeQcmswloN9Ob6linOLmQYUzgfWYpUVhYd4+x473w3V4i
5Kxv+5n/4yb5LBuqhqS0H6phip6zr7wFqB5//mkhCqSx0oGVYmlwBl3IbvibJBtl
oT9ZNxwYAUWoHGOly0TJsQA1t87IreQPDQaNAQExiLCU3UjgGDqtO1sTfLB7Wot9
l6UmcMg8+H0v9UtJey5rKOY9oeYkJwqUx7kbegmP9dgSW4/n3URmw/8gQxGApFDd
qeb2tBVn+T/kxXs+JZitNDvtAKpnaILWboW4cYSD6ZEw4xl2BXXdDsvys8viGtxi
0JRSp/YpfbsGmRo8jinMbsxKll495L8Nmcb87E4MpoyMUqBaUxo7tMoVptGTgptb
bvS5Jzvqzni4MoM7rFtfWx1cSVThSX+vdPqVI5O7lMAzc9OuBPY=
=jidL
-----END PGP SIGNATURE-----

--YBi6uhclkiTWubx2--
