Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CF1E0DB0
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175882; cv=none; b=XsBx/5L6hXcZaPnuCviMcdu3+L4I+GmApYmELvEDHhu/QNeLUTlXZuodlmp0n37yjxIzmwYD0+IkNLCvu9dOQM6Rf87lOcEbw0l60SXt+4L/uOCAgMTaVzA5eQNSvqWslkdzKO0afxOxZsPSnyGUf7KheIKWSNMxZEI/FL6oIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175882; c=relaxed/simple;
	bh=CgEi4KKMt/S6Fyrvx73NHZHFZoi64uI/37X+geb0Hbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DfoF0UabdOri6Q5/mC1KwqOEDdewCcJ/QxDpuu60Yh5ZUFOM9UlfESRGGo7xIbF1Z59ISuHlJ20zhzpkPf7222MeQlAe8EtoV/LFB3dnb/Oofptp1F9r8AygfcGKI5rKCXbbgDdWL6HyuqdOpfMwSpbaSjEZS9TzfIChhkcdke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/hRk+o9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/hRk+o9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E00C4CED1;
	Wed, 29 Jan 2025 18:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738175882;
	bh=CgEi4KKMt/S6Fyrvx73NHZHFZoi64uI/37X+geb0Hbc=;
	h=Date:From:To:Cc:Subject:From;
	b=S/hRk+o9EsL3zcg7HQXu87Afdu041f5M8VfIkrwXpd3WWB7jjDD9CSxkx5hi7LeQe
	 /GIOy7YOa/WZIRvbd7zaVaccxkm9EJKkmbxG84QPQQKlwE8uR0/GjKvOe+k1xEq0ht
	 qtUhdDdIqxtrlJEe8xrloQuS153pqTED3RbTkZvEdehy0y08zqQLz+c3g/o11R1Rou
	 Jwqs0ykSCKBY93/pikRnIDWg1fGUR3M/O882gA+zQmEYeHItrC8Cyyi7jMg4EB4cId
	 5dQVNMy8qDSQ7gxuVylWLxcguwLTVGm/9xEm3/cESg4sOEfgmo5xyRLTaqiHGT5CV1
	 rBs/bFdfsNlYg==
Date: Thu, 30 Jan 2025 00:07:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: Generic phy updates for v6.14
Message-ID: <Z5p1hicGLpzHpPJi@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZP54gzmjKNm3iYhN"
Content-Disposition: inline


--ZP54gzmjKNm3iYhN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive updates for Generic phy subsystem. Lots of
Qualcomm and Rockchip device support.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tags/phy-=
for-6.14

for you to fetch changes up to af1bc0ebe743d4c72f05a95efcc1c66043332be0:

  dt-bindings: phy: qcom,qmp-pcie: document the SM8350 two lanes PCIe PHY (=
2024-12-25 01:17:33 +0530)

----------------------------------------------------------------
phy-for-6.14

- New Support
  - Qualcomm SAR2130P qmp usb, SAR2130P qmp pcie, QCS615 qusb2 and PCIe,
    IPQ5424 qmp pcie, IPQ5424 QUSB2 and USB3 PHY
  - Rockchip rk3576 combo phy support

- Updates
  - Drop Shengyang for JH7110 maintainer
  - Freescale hdmi register calculation optimization
  - Rockchip pcie phy mutex and regmap updates

----------------------------------------------------------------
Adam Ford (3):
      phy: freescale: fsl-samsung-hdmi: Expand Integer divider range
      phy: freescale: fsl-samsung-hdmi: Stop searching when exact match is =
found
      phy: freescale: fsl-samsung-hdmi: Clean up fld_tg_code calculation

Advait Dhamorikar (1):
      phy: marvell: Fix spelling mistake "exlicitly" -> "explicitly"

Anand Moon (6):
      phy: rockchip-pcie: Simplify error handling with dev_err_probe()
      phy: rockchip-pcie: Use devm_clk_get_enabled() helper
      phy: rockchip-pcie: Use regmap_read_poll_timeout() for PCIe reference=
 clk PLL status
      phy: rockchip-pcie: Refactor mutex handling in rockchip_pcie_phy_powe=
r_off()
      phy: rockchip-pcie: Refactor mutex handling in rockchip_pcie_phy_powe=
r_on()
      phy: rockchip-pcie: Use guard notation when acquiring mutex

Andy Shevchenko (2):
      phy: HiSilicon: Don't use "proxy" headers
      phy: sun4i-usb: Remove unused of_gpio.h

Andy Yan (1):
      phy: rockchip: phy-rockchip-typec: Fix Copyright description

AngeloGioacchino Del Regno (1):
      phy: mediatek: phy-mtk-hdmi: Register PHY provided regulator

Dmitry Baryshkov (6):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add SAR2130P compatible
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add SAR2130P compatible
      phy: qualcomm: qmp-combo: add support for SAR2130P
      phy: qualcomm: qmp-pcie: split PCS_LANE1 region
      phy: qualcomm: qmp-pcie: define several new registers
      phy: qualcomm: qmp-pcie: add support for SAR2130P

Frank Wang (1):
      dt-bindings: phy: rockchip: add rk3576 compatible

Kever Yang (1):
      phy: rockchip-naneng-combo: add rk3576 support

Krishna Kurapati (2):
      dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings
      phy: qcom-qusb2: Add support for QCS615

Krishna chaitanya chundru (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the QCS615 QMP=
 PCIe PHY Gen3 x1
      phy: qcom: qmp: Add phy register and clk setting for QCS615 PCIe

Lars-Peter Clausen (1):
      phy: tegra194: p2u: Allow to enable driver on Tegra234

Manikanta Mylavarapu (1):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the IPQ5424 QMP PCI=
e PHYs

Neil Armstrong (1):
      dt-bindings: phy: qcom,qmp-pcie: document the SM8350 two lanes PCIe P=
HY

Peter Griffin (1):
      phy: samsung-ufs: switch back to syscon_regmap_lookup_by_phandle()

Varadarajan Narayanan (4):
      dt-bindings: phy: qcom,qusb2: Document IPQ5424 compatible
      phy: qcom-qusb2: add QUSB2 support for IPQ5424
      dt-bindings: phy: qcom,qmp-usb: Add IPQ5424 USB3 PHY
      phy: qcom: qmp: Enable IPQ5424 support

Xu Yang (1):
      dt-bindings: phy: imx8mq-usb: correct reference to usb-switch.yaml

Zijun Hu (1):
      phy: core: Simplify API of_phy_simple_xlate() implementation

keith zhao (1):
      MAINTAINERS: Remove Shengyang as JH7110 DPHY maintainer

 .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |   7 +-
 .../bindings/phy/phy-rockchip-naneng-combphy.yaml  |   1 +
 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |  21 +-
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    |   1 +
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 MAINTAINERS                                        |   1 -
 drivers/phy/allwinner/phy-sun4i-usb.c              |   1 -
 drivers/phy/freescale/phy-fsl-samsung-hdmi.c       |  47 ++--
 drivers/phy/hisilicon/phy-hi3670-pcie.c            |  11 +-
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c       |   2 +-
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         |  44 ++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         |   3 +
 drivers/phy/mediatek/phy-mtk-hdmi.c                |  28 +++
 drivers/phy/mediatek/phy-mtk-hdmi.h                |   4 +
 drivers/phy/phy-core.c                             |  23 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 100 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 278 +++++++++++++++++=
++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v4_20.h |   5 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |   5 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h    |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v2.h         |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h         |   2 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h    |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            |   3 +
 drivers/phy/qualcomm/phy-qcom-qusb2.c              |  55 ++++
 drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 279 +++++++++++++++++=
++++
 drivers/phy/rockchip/phy-rockchip-pcie.c           | 146 ++++-------
 drivers/phy/rockchip/phy-rockchip-typec.c          |   2 +-
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-samsung-ufs.c              |   6 +-
 drivers/phy/tegra/Kconfig                          |   5 +-
 34 files changed, 925 insertions(+), 174 deletions(-)

--=20
~Vinod

--ZP54gzmjKNm3iYhN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmeadYYACgkQfBQHDyUj
g0evpw//fH477KE3rukhZZLzUxA6tzqiGOZIRoXzjSgL5nKLlpgN7v/Ze0T4dgCV
Qh/HmHKWFnLTDCeywmVlRLuS5dC15zi1u11qBEierVQJAzT3x9HdEjzL81quJDJX
iMFgVMxGSa+KI2qRMBe4Tq4qrrru51SskRRXcGB4UvWU5C8XEm2TO/G9RMAvFFUG
yNIP1PHWuY1LcjTq96AbvLb3/fSRp5UXYwuGg6/jvAeg2Iql+rSHZ52gDO8fdEG2
cySwHvGxzkow9ATfJ4eQFaPmR9ckclqhts0P/z4Hb1vc1VXIcX3Bs8z/Lth8y07P
VBALd/qwAI0rovb3wycYdg7pbLvaGYuNFf8SB93M5i3MRctWg+r11dER8Ja+MP6D
jak08njQCnyKQgQIp8SY2y6ZoZgkrUChSZ4ZHRdx2rNPh1mcg9OF98s16Qj6Lwjl
ukcMf06hsvmvP7FNBoD/WJETb/G8GeAkfMd8dieUAKOrBio1NmyLiE3SnWeeUhrV
S6uk9wJz/gL/JT8qxoYxUG0fRdZcXuxfIGuCBxFsoYfZkPBnOKQjpWf14RsMz94w
QAP6gGPL543b6SdvSherXGM6w+vQrJzxviWhwO/wegMhI5YZHLBa9RT/Pmppkxbj
ltNsR6nmKLp0RMW88naBNvWX7re0IwXkuQ6TwbQ5VnXI0HjwQ1c=
=tN7V
-----END PGP SIGNATURE-----

--ZP54gzmjKNm3iYhN--
