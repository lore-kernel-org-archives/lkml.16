Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C691C5D7D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406503; cv=none; b=eeO1HjP9Junu67khZE0LUNEAZsF0I7L86kAWCfIGxz+HKB+bOAvuXJYrY8HQhi6EL5fR3Ha+FKXiriHwa/ABl5Znolek3r9lizXvgzdBiftekHwn4WweB8z8Qucc4xM/NLKv5RVZ7yr0Z7f1zTdPJnytD1+6IG1NEXLaMLe+XDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406503; c=relaxed/simple;
	bh=k1KD7uYgP6v/eWw13kSy0aMEP4dZE57AZOV9fYgWk2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kH0Wn9fve8zCVRPKoF7/ntOLUkr/YxGq7r6V9IvuBTPfaLQOVCO5F8F2cGW6FWppEZ5i+UoyA4MO9U1l/xvV5eA149ZuuHyTxc7632GKDfHOBZJtSp1NhBxENZnnlIs+123+2W9zHYJnxDc2IIdSqdVQBXCyP71cePH1A+wvqUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfSNnJVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfSNnJVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50973C4CEE3;
	Mon, 31 Mar 2025 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743406502;
	bh=k1KD7uYgP6v/eWw13kSy0aMEP4dZE57AZOV9fYgWk2s=;
	h=Date:From:To:Cc:Subject:From;
	b=sfSNnJVe6ntHM0uAm1DcrlB+fcDPGtPCEquWKfRLLgAPJU6iuqp9xwIoH+1yfn1mp
	 rOz6Ch2iEhSkwvIyyYa9xOwvFAUnMUcPfrnJYThsjjbYUVw2LCQf8UfcyzLe0Wm93S
	 Ox18FV6EpOmFW8GYGRD8leE0qYYx5U6L/xCGgsedIg+mNEYPEzmAFR4fFOJ5Qmsin2
	 aOmOUNVpMKKXfRB/Fj8x3CS/M+ebgCbZc3wb3SS/RoK0Tt5MrN7poYRKnKIQIEoL8O
	 cid7841xfM+LDxS0JidehjTpwPzUknkBsLYxmJW5dPMkMHIOqkV+cqT4/iAWxVG4Wv
	 u/aONi7cHjjTw==
Date: Mon, 31 Mar 2025 13:04:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy subsystem updates for 6.15
Message-ID: <Z+pFou7KOQZJ1iy4@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PVYDHQEWI5B+UeJS"
Content-Disposition: inline


--PVYDHQEWI5B+UeJS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive fairly moderate sized request for generic phy
subsystem with bunch of new device and driver support along with updates
on bunch of driver with Samsung and Qualcomm ones being major ones.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
for-6.15

for you to fetch changes up to f13bff25161b8a0a9d716764ebe57334d496c6d9:

  phy: rockchip-naneng-combo: Support rk3562 (2025-03-16 22:32:23 +0530)

----------------------------------------------------------------
phy-for-6.15

- New Support
  - Qualcomm X1P42100 PCIe Gen4x4, QCS615 qmp usbc,  PCIe UNIPHY 28LP
    driver, SM8750 QMP UFS PHY
  - Rockchip rk3576 hdptx, rk3562 naneng-combo support
  - Samsung MIPI D-/C-PHY driver, ExynosAutov920 ufs phy driver

- Updates
  - Samsung USB3 Type-C lane orientation detection and configuration for
    Google gs101
  - Qualcomm support for dual lane PHY support for QCS8300 SoC

----------------------------------------------------------------
Andre Przywara (1):
      dt-bindings: phy: document Allwinner A523 USB-2.0 PHY

Andr=E9 Draszik (7):
      dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT pr=
operties
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C propert=
ies
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

Andy Yan (3):
      dt-bindings: phy: Add rk3576 hdptx phy
      phy: rockchip: usbdp: Only verify link rates/lanes/voltage when the c=
orresponding set flags are set
      phy: rockchip: usbdp: Avoid call hpd_event_trigger in dp_phy_init

Arnd Bergmann (1):
      phy: qcom: uniphy-28lp: add COMMON_CLK dependency

Damon Ding (4):
      phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF an=
d ROPLL_REF
      phy: phy-rockchip-samsung-hdptx: Supplement some register names with =
their full version
      phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all regist=
ers
      phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588

Dmitry Baryshkov (1):
      phy: core: don't require set_mode() callback for phy_get_mode() to wo=
rk

Dr. David Alan Gilbert (1):
      phy: core: Remove unused phy_pm_runtime_(allow|forbid)

Geert Uytterhoeven (1):
      phy: PHY_LAN966X_SERDES should depend on SOC_LAN966 || MCHP_LAN966X_P=
CI

Heiko Stuebner (4):
      phy: phy-rockchip-samsung-hdptx: annotate regmap register-callback
      phy: phy-rockchip-samsung-hdptx: Don't use dt aliases to determine ph=
y-id
      dt-bindings: phy: Add Rockchip MIPI C-/D-PHY schema
      phy: rockchip: Add Samsung MIPI D-/C-PHY driver

Jon Lin (1):
      phy: rockchip-naneng-combo: Support rk3562

Kever Yang (1):
      dt-bindings: phy: rockchip: Add rk3562 naneng-combophy compatible

Konrad Dybcio (3):
      dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY
      dt-bindings: phy: qcom,qmp-pcie: Drop reset number constraints
      phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY

Krishna Kurapati (1):
      phy: qcom: qmp-usbc: Add qmp configuration for QCS615

Krzysztof Kozlowski (2):
      phy: stih407-usb: Use syscon_regmap_lookup_by_phandle_args
      phy: exynos5-usbdrd: Do not depend on Type-C

Nicolas Frattaroli (1):
      phy: phy-rockchip-samsung-hdptx: Add support for RK3576

Nitheesh Sekar (2):
      dt-bindings: phy: qcom,uniphy-pcie: Document PCIe uniphy
      phy: qcom: Introduce PCIe UNIPHY 28LP driver

Nitin Rawat (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the SM8750 QMP =
UFS PHY
      phy: qcom-qmp-ufs: Add PHY Configuration support for sm8750

Pei Xiao (1):
      phy: freescale: fsl-samsung-hdmi: Use helper function devm_clk_get_en=
abled()

Rob Herring (Arm) (2):
      phy: can-transceiver: Drop unnecessary "mux-states" property presence=
 check
      phy: Use (of|device)_property_present() for non-boolean properties

Sowon Na (2):
      dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
      phy: samsung-ufs: support ExynosAutov920 ufs phy driver

Stefan Eichenberger (2):
      phy: freescale: imx8m-pcie: cleanup reset logic
      phy: freescale: imx8m-pcie: assert phy reset and perst in power off

Thorsten Blum (1):
      phy: rockchip: usbdp: Remove unnecessary bool conversion

Xu Yang (1):
      phy: fsl-imx8mq-usb: add tca function driver for imx95

Ziyue Zhang (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS8300 QM=
P PCIe PHY Gen4 x2
      phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300

 .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml |    4 +-
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml  |    1 +
 .../bindings/phy/qcom,ipq5332-uniphy-pcie-phy.yaml |   76 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   11 +-
 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |    2 +
 .../bindings/phy/rockchip,rk3588-hdptx-phy.yaml    |   62 +-
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   |   87 +
 .../devicetree/bindings/phy/samsung,ufs-phy.yaml   |    1 +
 .../bindings/phy/samsung,usb3-drd-phy.yaml         |   21 +-
 Documentation/driver-api/phy/phy.rst               |    3 +-
 drivers/phy/freescale/Kconfig                      |    1 +
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c         |   23 +-
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c         |  240 +++
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c       |   10 +-
 drivers/phy/mediatek/phy-mtk-tphy.c                |    4 +-
 drivers/phy/microchip/Kconfig                      |    1 +
 drivers/phy/phy-can-transceiver.c                  |   13 +-
 drivers/phy/phy-core.c                             |   31 +-
 drivers/phy/qualcomm/Kconfig                       |   13 +
 drivers/phy/qualcomm/Makefile                      |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |  107 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |    7 +
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h    |   67 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            |  180 +-
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           |    3 +
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c   |  286 ++++
 drivers/phy/rockchip/Kconfig                       |   12 +
 drivers/phy/rockchip/Makefile                      |    1 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      |    4 +-
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  152 ++
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  | 1719 ++++++++++++++++=
++++
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c  | 1046 +++++++++++-
 drivers/phy/rockchip/phy-rockchip-usbdp.c          |  108 +-
 drivers/phy/samsung/Kconfig                        |    1 +
 drivers/phy/samsung/Makefile                       |    1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           |  202 ++-
 drivers/phy/samsung/phy-exynosautov920-ufs.c       |  168 ++
 drivers/phy/samsung/phy-samsung-ufs.c              |    9 +-
 drivers/phy/samsung/phy-samsung-ufs.h              |    4 +
 drivers/phy/st/phy-stih407-usb.c                   |   24 +-
 include/linux/phy/phy.h                            |   12 -
 41 files changed, 4439 insertions(+), 279 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,ipq5332-unip=
hy-pcie-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-m=
ipi-dcphy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
 create mode 100644 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
 create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c

--=20
~Vinod

--PVYDHQEWI5B+UeJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmfqRaIACgkQfBQHDyUj
g0dwZg//cxzWXN/ANE7f4HaJt4Nwk/2ZORYgITUPuzwYjR9pnfa/5hAzf9v1d7HX
PayQswNCSI7SEWcAMbhCKNOHtHZiXYrc9Z5d7hLy+FA7XW+JXIoNiojooQZPfZeA
LuAxkPfbjCQoR+sMop8JIfk9Xvvl3yKMBSavkrFmIvnqDxUgaDm/JcZLPe3w6zvs
FmspktayjE3oeBiNp1OViDwBVcH5mxhXniSu9Z8SMTRRybsy6q94GMUJQemtwVLo
zRIQGcvYsXjsyob45/sRrRNMBUD4w2ukrUD7bVTeOth3RHc7YJ52YHJchuXuji3p
HQz+R42PXFXbq8VdbbcvdnhlvYpJvZjkOZxtHW57qTislcXkbe+M15R5K89aNsbi
dstjn1SO9G4QjnLwDA5kE723849CjSkyLIeYJzFsPBdu05I5e0pUkx5TFG3bPUgE
u5ibK3pWfXS65GWZ2UgXj111HhbklkGZVel/ejmKg4InRdcMASAG1v+5wOtU5xgY
oTmf5CEI8DkyEQeNoz7az+8JF68IU0876JI7nxiCQZMGjEzR84gTWAcOba3EO1gK
umf+Kauoau9Gk80BIB3nIgndK6d550I2CA17NsozMvkpDT4IZFE6GjcO9D2ZpbtW
uKr+FIRhEx87qnT2Pj6W4S5zW+9j0WOIh7Vv0Zmz0xeE60nOs6Q=
=gpvu
-----END PGP SIGNATURE-----

--PVYDHQEWI5B+UeJS--
