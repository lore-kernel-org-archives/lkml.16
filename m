Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198451D61A5;
	Fri, 28 Mar 2025 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195236; cv=none; b=s+e5k4wzGRLw5/cYkyJXQJOuYcpODojDfg/K1IZJA1Zm4rxyQHtFlSO1NXzVwwjWV3GF8RxDK25pAiFvhtKiaTtxjvp8RtsEF5tdhK7coH5Xh1d1uMcrFNC0MJ/IR0UiJLhcR3n2a9Uja0YDqTdYz1EZiktVLSnYx026zGQI/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195236; c=relaxed/simple;
	bh=m+dg5ab3avXN4/v2wtrUSTMvjyou0+nxiFpcYR/kZYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cR1Yv6sYRxQPnRS6rCBN84t4ZV+BK01ihYPqJG9X5KXYLe5VlHe4N+TM5h64+KYbNj64jBbCJjr6sPPtPKzTHwDJHvAG2LWfTEe7oi8fcBAvYrLzw/20Z5O8q/wfYFFfaQzSayapOOaTCYBPTVFNx8Gn7Cjqk1md98oEtwW0W1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9qtjaW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9qtjaW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A9C4CEE4;
	Fri, 28 Mar 2025 20:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743195235;
	bh=m+dg5ab3avXN4/v2wtrUSTMvjyou0+nxiFpcYR/kZYY=;
	h=From:To:Cc:Subject:Date:From;
	b=c9qtjaW8SvUkILv9CBLouZxoLH+FZHEfKbiBvSSN6VwIgK/Ws1x+LqnnsH+dxeSGC
	 eXNzlE4OHUXhIre+xlCd6YAx0OJJJpfczBEZOt5CAz0pmDxHyIm4sEcrNea4B3jHU4
	 gvMPfgI3Yzn6RwP8kldlwdHPJqnEfB8EswXdYehp+CCo0TKrqaQ7XLJ74fqjq7ZUoA
	 9UAIaw+9esdUjrKErNRZ3F69yRJsSpwMcFBmPyEZjAaOutNlz5OAnV5XUfvi1k1n1N
	 uBIda9BOQvDJuHG9L1In4+NuWlrrdhWgAqSPpQ3vyrQjcZ8u2QT7E41Vg/p+euQxd6
	 2i9xQiyfHuUMg==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Fri, 28 Mar 2025 13:53:53 -0700
Message-ID: <20250328205354.2342175-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e0c0a97bc308f71b0934e3637ac545ce65195df0:

  dt-bindings: clock: Document clock and reset unit of RK3528 (2025-02-26 18:04:00 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to e988adcb5dee697a046f0270747c9409c41e8e2a:

  Merge branches 'clk-allwinner', 'clk-amlogic' and 'clk-qcom' into clk-next (2025-03-26 11:26:36 -0700)

----------------------------------------------------------------
Here's the pile of clk driver patches. The usual suspects^Wsilicon
vendors are all here, adding new SoC support and fixing existing code.
There are a few patches to the clk framework here as well. They've been
baking in linux-next for weeks so I'm hoping we don't have to revert
them. The disable OF node patch is probably the scariest one although it
seems unlikely that a system would be relying on a driver _not_ probing
because the clk never appeared, but you never know. Nothing looks out of
the ordinary on the driver side but that's because it's mostly a bunch
of data.

Core:
 - Use dev_err_probe() in the clk registration path (Peering into the
   crystal ball shows many patches that remove printks)
 - Check for disabled OF nodes in of_clk_get_hw_from_clkspec()

New Drivers:
 - Allwinner A523/T527 clk driver
 - Qualcomm IPQ9574 NSS clk driver
 - Qualcomm QCS8300 GPU and video clk drivers
 - Qualcomm SDM429 RPM clks
 - Qualcomm QCM6490 LPASS (low power audio) resets
 - Samsung Exynos2200: driver for several clock controllers (Alive,
   CMGP, HSI, PERIC/PERIS, TOP, UFS and VFS)
 - Samsung Exynos7870: Driver for several clock controllers (Alive, MIF,
   DISP AUD, FSYS, G3D, ISP, MFC and PERI)
 - Rockchip rk3528 and rk3562 clk driver

Updates:
 - Various fixes to SoC clk drivers for incorrect data, avoid touching
   protected registers, etc.
 - Additions for some missing clks in existing SoC clk drivers
 - DT schema conversions from text to YAML
 - Kconfig cleanups to allow drivers to be compiled on moar
   architectures

----------------------------------------------------------------
Ahmad Fatoum (2):
      dt-bindings: clock: imx8m: document nominal/overdrive properties
      clk: imx8mp: inform CCF of maximum frequency of clocks

Ajit Pandey (1):
      clk: qcom: clk-branch: Fix invert halt status bit check for votable clocks

Alexey Minnekhanov (3):
      dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
      dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
      clk: qcom: gcc-sdm660: Add missing SDCC block resets

Andre Przywara (14):
      clk: sunxi-ng: mp: introduce dual-divider clock
      clk: sunxi-ng: mp: provide wrappers for setting feature flags
      clk: sunxi-ng: Add support for update bit
      dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs
      clk: sunxi-ng: Add support for the A523/T527 CCU PLLs
      clk: sunxi-ng: a523: Add support for bus clocks
      clk: sunxi-ng: a523: add video mod clocks
      clk: sunxi-ng: a523: add system mod clocks
      clk: sunxi-ng: a523: add interface mod clocks
      clk: sunxi-ng: a523: add USB mod clocks
      clk: sunxi-ng: a523: remaining mod clocks
      clk: sunxi-ng: a523: add bus clock gates
      clk: sunxi-ng: a523: add reset lines
      clk: sunxi-ng: add support for the A523/T527 PRCM CCU

Andreas Kemnade (1):
      dt-bindings: clock: ti: Convert ti-clkctrl.txt to json-schema

Andrew Davis (1):
      clk: keystone: syscon-clk: Do not use syscon helper to build regmap

AngeloGioacchino Del Regno (2):
      dt-bindings: clock: mediatek,mt8188: Add VDO1_DPI1_HDMI clock
      clk: mediatek: mt8188-vdo1: Add VDO1_DPI1_HDMI clock for hdmitx

Barnabás Czémán (1):
      clk: qcom: mmcc-sdm660: fix stuck video_subcore0 clock

Bartosz Golaszewski (1):
      clk: davinci: remove support for da830

Biju Das (5):
      clk: renesas: r9a09g047: Add WDT clocks and resets
      clk: renesas: r9a09g047: Add SDHI clocks/resets
      clk: renesas: r9a09g047: Add ICU clock/reset
      clk: renesas: r9a09g047: Add CANFD clocks and resets
      clk: renesas: rzv2h: Adjust for CPG_BUS_m_MSTOP starting from m = 1

Bjorn Andersson (4):
      Merge branch '20250212-sdm429-rpm-v1-1-0a24ac19a478@mainlining.org' into clk-for-6.15
      Merge branch '20250203063427.358327-2-alexeymin@postmarketos.org' into clk-for-6.15
      Merge branch '20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com' into clk-for-6.15
      Merge branch '20250313110359.242491-1-quic_mmanikan@quicinc.com' into clk-for-6.15

Bryan O'Donoghue (4):
      clk: qcom: gdsc: Release pm subdomains in reverse add order
      clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      clk: qcom: common: Add support for power-domain attachment
      clk: qcom: Support attaching GDSCs to multiple parents

Charles Han (1):
      clk: mmp: Fix NULL vs IS_ERR() check

Chris Morgan (2):
      dt-bindings: clock: sun50i-h616-ccu: Add LCD TCON clk and reset
      clk: sunxi-ng: h616: Add clock/reset for LCD TCON

Chuan Liu (1):
      clk: Correct the data types of the variables in clk_calc_new_rates

Claudiu Beznea (2):
      clk: renesas: r9a08g045: Add clocks, resets and power domain support for the TSU IP
      clk: renesas: r8a08g045: Check the source of the CPU PLL settings

Colin Ian King (1):
      clk: samsung: Fix spelling mistake "stablization" -> "stabilization"

Daniil Titov (2):
      dt-bindings: clock: qcom,rpmcc: Add SDM429
      clk: qcom: smd-rpm: Add clocks for SDM429

Dario Binacchi (1):
      clk: stm32f4: fix an uninitialized variable

Devi Priya (4):
      dt-bindings: clock: gcc-ipq9574: Add definition for GPLL0_OUT_AUX
      dt-bindings: clock: Add ipq9574 NSSCC clock and reset definitions
      clk: qcom: gcc-ipq9574: Add support for gpll0_out_aux clock
      clk: qcom: Add NSS clock Controller driver for IPQ9574

Fabrizio Castro (1):
      clk: renesas: r9a09g057: Add entries for the DMACs

Finley Xiao (1):
      clk: rockchip: Add clock controller for the RK3562

Friday Yang (2):
      dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
      clk: mediatek: Add SMI LARBs reset for MT8188

Geert Uytterhoeven (3):
      clk: renesas: cpg-mssr: Remove obsolete nullify check
      clk: renesas: rzg2l: Remove unneeded nullify checks
      clk: renesas: r7s9210: Distinguish clocks by clock type

Heiko Stuebner (4):
      Merge branch 'v6.15-shared/clkids' into v6.15-clk/next
      clk: check for disabled clock-provider in of_clk_get_hw_from_clkspec()
      Merge branch 'v6.15-shared/clkids' into v6.15-clk/next
      dt-bindings: reset: fix double id on rk3562-cru reset ids

Igor Belwon (1):
      clk: samsung: exynos990: Add CMU_PERIS block

Imran Shaik (5):
      dt-bindings: clock: qcom: Add GPU clocks for QCS8300
      dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
      dt-bindings: clock: qcom: Add QCS8300 video clock controller
      clk: qcom: Add support for GPU Clock Controller on QCS8300
      clk: qcom: Add support for Video Clock Controller on QCS8300

Ivaylo Ivanov (3):
      dt-bindings: clock: add Exynos2200 SoC
      clk: samsung: clk-pll: add support for pll_4311
      clk: samsung: introduce Exynos2200 clock driver

Jerome Brunet (4):
      clk: amlogic: g12a: fix mmc A peripheral clock
      clk: amlogic: g12b: fix cluster A parent data
      clk: amlogic: gxbb: drop incorrect flag on 32k clock
      clk: amlogic: gxbb: drop non existing 32k clock parent

Jian Hu (1):
      clk: amlogic: a1: fix a typo

John Madieu (1):
      clk: renesas: r9a09g047: Add clock and reset signals for the TSU IP

Jonas Karlman (1):
      clk: rockchip: rk3528: Add reset lookup table

Jordan Crouse (1):
      clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs

Karl Chan (1):
      clk: qcom: ipq5018: allow it to be bulid on arm32

Kaustabh Chakraborty (2):
      dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

Kever Yang (1):
      dt-bindings: clock: Add RK3562 cru

Konrad Dybcio (1):
      clk: qcom: gcc-x1e80100: Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK

Krzysztof Kozlowski (11):
      clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
      clk: qcom: Drop unused header includes
      clk: qcom: Add missing header includes
      clk: qcom: dispcc-sm8750: Allow dumping regmap
      Merge branch 'for-v6.15/samsung-clk-dt-bindings' into next/clk
      clk: qcom: camcc: Constify 'struct qcom_cc_desc'
      clk: qcom: dispcc: Constify 'struct qcom_cc_desc'
      clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
      clk: qcom: videocc: Constify 'struct qcom_cc_desc'
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

Lad Prabhakar (5):
      clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
      clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
      clk: renesas: r9a07g043: Fix HP clock source for RZ/Five
      clk: renesas: rzg2l: Update error message
      clk: renesas: rzv2h: Update error message

Laurentiu Mihalcea (2):
      dt-bindings: clock: imx8mp: add axi clock
      clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents

Manikanta Mylavarapu (2):
      clk: qcom: ipq5424: fix software and hardware flow control error of UART
      drivers: clk: qcom: ipq5424: fix the freq table of sdcc1_apps clock

Michael Riesch (1):
      clk: rockchip: rk3568: mark hclk_vi as critical

Neil Armstrong (1):
      clk: qcom: gcc-sm8650: Do not turn off USB GDSCs during gdsc_disable()

Niklas Söderlund (6):
      clk: renesas: r8a779a0: Add FCPVX clocks
      clk: renesas: r8a779a0: Add ISP core clocks
      clk: renesas: r8a779g0: Add ISP core clocks
      clk: renesas: r8a779h0: Add ISP core clocks
      clk: renesas: r8a779h0: Add FCPVX clock
      clk: renesas: r8a779h0: Add VSPX clock

Onkarnath (1):
      clk: imgtec: use %pe for better readability of errors while printing

Peter Geis (1):
      clk: rockchip: rk3328: fix wrong clk_ref_usb3otg parent

Philippe Simons (1):
      clk: sunxi-ng: h616: Reparent GPU clock during frequency changes

Stephen Boyd (12):
      Merge tag 'renesas-clk-for-v6.15-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      clk: Print an error when clk registration fails
      Merge tag 'renesas-clk-for-v6.15-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'v6.15-rockchip-clk1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'samsung-clk-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'clk-imx-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux into clk-imx
      Merge tag 'sunxi-clk-for-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-allwinner
      Merge tag 'clk-meson-v6.15-1' of https://github.com/BayLibre/clk-meson into clk-amlogic
      Merge tag 'qcom-clk-for-6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge branches 'clk-parent', 'clk-renesas', 'clk-mediatek' and 'clk-cleanup' into clk-next
      Merge branches 'clk-rockchip', 'clk-samsung' and 'clk-imx' into clk-next
      Merge branches 'clk-allwinner', 'clk-amlogic' and 'clk-qcom' into clk-next

Taniya Das (4):
      clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
      clk: qcom: gdsc: Update the status poll timeout for GDSC
      dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490

Tommaso Merciai (1):
      clk: renesas: r9a09g047: Add CRU0 clocks and resets

Val Packett (2):
      dt-bindings: clock: rk3188-common: add PCLK_CIF0/PCLK_CIF1
      clk: rockchip: rk3188: use PCLK_CIF0/1 clock IDs on RK3066

Vladimir Lypak (1):
      clk: qcom: gcc-msm8953: fix stuck venus0_core0 clock

Vladimir Zapolskiy (2):
      dt-bindings: clock: qcom: sm8450-camcc: Remove qcom,x1e80100-camcc leftover
      dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps

Will McVicker (1):
      clk: samsung: Fix UBSAN panic in samsung_clk_init()

Wolfram Sang (1):
      dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles

Yao Zi (2):
      clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
      clk: rockchip: Add clock controller driver for RK3528 SoC

 .../bindings/clock/allwinner,sun55i-a523-ccu.yaml  |  103 +
 .../bindings/clock/atmel,at91rm9200-pmc.yaml       |    4 +
 .../devicetree/bindings/clock/imx8m-clock.yaml     |    8 +
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml |   10 +-
 .../bindings/clock/mediatek,mt8188-clock.yaml      |   21 +
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |    3 +
 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   98 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml      |    2 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |    6 +-
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |    1 +
 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |    5 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    1 -
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    9 +-
 .../bindings/clock/rockchip,rk3562-cru.yaml        |   55 +
 .../bindings/clock/samsung,exynos2200-cmu.yaml     |  247 ++
 .../bindings/clock/samsung,exynos7870-cmu.yaml     |  227 ++
 .../bindings/clock/samsung,exynos990-clock.yaml    |   19 +
 .../devicetree/bindings/clock/ti,clkctrl.yaml      |   65 +
 .../devicetree/bindings/clock/ti-clkctrl.txt       |   63 -
 drivers/clk/clk-stm32f4.c                          |    4 +-
 drivers/clk/clk.c                                  |   13 +-
 drivers/clk/davinci/Makefile                       |    2 -
 drivers/clk/davinci/pll-da830.c                    |   71 -
 drivers/clk/davinci/pll.c                          |    9 -
 drivers/clk/davinci/psc-da830.c                    |  118 -
 drivers/clk/davinci/psc.c                          |    8 -
 drivers/clk/davinci/psc.h                          |    7 +-
 drivers/clk/imgtec/clk-boston.c                    |    6 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c              |    6 +-
 drivers/clk/imx/clk-imx8mp.c                       |  151 +
 drivers/clk/keystone/syscon-clk.c                  |   13 +-
 drivers/clk/mediatek/clk-mt8188-cam.c              |   17 +
 drivers/clk/mediatek/clk-mt8188-img.c              |   18 +
 drivers/clk/mediatek/clk-mt8188-ipe.c              |   14 +
 drivers/clk/mediatek/clk-mt8188-vdo1.c             |   11 +
 drivers/clk/meson/a1-pll.c                         |    2 +-
 drivers/clk/meson/g12a.c                           |   38 +-
 drivers/clk/meson/gxbb.c                           |   14 +-
 drivers/clk/mmp/clk-pxa1908-apmu.c                 |    4 +-
 drivers/clk/qcom/Kconfig                           |    9 +-
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-sa8775p.c                   |    3 +-
 drivers/clk/qcom/camcc-sc7180.c                    |    2 +-
 drivers/clk/qcom/camcc-sc7280.c                    |    2 +-
 drivers/clk/qcom/camcc-sc8280xp.c                  |    2 +-
 drivers/clk/qcom/camcc-sdm845.c                    |    1 +
 drivers/clk/qcom/camcc-sm4450.c                    |    3 +-
 drivers/clk/qcom/camcc-sm6350.c                    |    1 +
 drivers/clk/qcom/camcc-sm7150.c                    |    1 -
 drivers/clk/qcom/camcc-sm8150.c                    |    4 +-
 drivers/clk/qcom/camcc-sm8250.c                    |   58 +-
 drivers/clk/qcom/camcc-sm8550.c                    |    2 +-
 drivers/clk/qcom/camcc-sm8650.c                    |    2 +-
 drivers/clk/qcom/clk-alpha-pll.c                   |   52 +-
 drivers/clk/qcom/clk-branch.c                      |    4 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   32 +
 drivers/clk/qcom/common.c                          |    6 +
 drivers/clk/qcom/dispcc-qcm2290.c                  |    3 +-
 drivers/clk/qcom/dispcc-sc7180.c                   |    1 +
 drivers/clk/qcom/dispcc-sc7280.c                   |    1 +
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    7 +-
 drivers/clk/qcom/dispcc-sdm845.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm4450.c                   |    3 +-
 drivers/clk/qcom/dispcc-sm6115.c                   |    3 +-
 drivers/clk/qcom/dispcc-sm6125.c                   |    1 +
 drivers/clk/qcom/dispcc-sm6350.c                   |    1 +
 drivers/clk/qcom/dispcc-sm6375.c                   |    1 +
 drivers/clk/qcom/dispcc-sm7150.c                   |    1 -
 drivers/clk/qcom/dispcc-sm8250.c                   |    2 +-
 drivers/clk/qcom/dispcc-sm8450.c                   |    5 +-
 drivers/clk/qcom/dispcc-sm8550.c                   |    5 +-
 drivers/clk/qcom/dispcc-sm8750.c                   |    4 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                 |    3 +-
 drivers/clk/qcom/dispcc1-sa8775p.c                 |    3 +-
 drivers/clk/qcom/gcc-ipq5424.c                     |   24 +-
 drivers/clk/qcom/gcc-ipq9574.c                     |   15 +
 drivers/clk/qcom/gcc-msm8953.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8960.c                     |    1 -
 drivers/clk/qcom/gcc-msm8974.c                     |    1 -
 drivers/clk/qcom/gcc-sdm660.c                      |    2 +
 drivers/clk/qcom/gcc-sm8650.c                      |    4 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |   30 -
 drivers/clk/qcom/gdsc.c                            |   98 +-
 drivers/clk/qcom/gdsc.h                            |    1 +
 drivers/clk/qcom/gpucc-msm8998.c                   |    3 +-
 drivers/clk/qcom/gpucc-sa8775p.c                   |   49 +-
 drivers/clk/qcom/gpucc-sar2130p.c                  |    1 +
 drivers/clk/qcom/gpucc-sc7180.c                    |    1 +
 drivers/clk/qcom/gpucc-sc7280.c                    |    1 +
 drivers/clk/qcom/gpucc-sc8280xp.c                  |    3 +-
 drivers/clk/qcom/gpucc-sdm660.c                    |    5 +-
 drivers/clk/qcom/gpucc-sdm845.c                    |    1 +
 drivers/clk/qcom/gpucc-sm4450.c                    |    1 -
 drivers/clk/qcom/gpucc-sm6350.c                    |    1 +
 drivers/clk/qcom/gpucc-sm8150.c                    |    1 +
 drivers/clk/qcom/gpucc-sm8250.c                    |    1 +
 drivers/clk/qcom/gpucc-sm8350.c                    |    2 +-
 drivers/clk/qcom/gpucc-x1p42100.c                  |    2 +-
 drivers/clk/qcom/kpss-xcc.c                        |    1 -
 drivers/clk/qcom/krait-cc.c                        |    1 -
 drivers/clk/qcom/lpassaudiocc-sc7280.c             |   23 +-
 drivers/clk/qcom/lpasscc-sdm845.c                  |    1 -
 drivers/clk/qcom/lpasscorecc-sc7180.c              |    1 -
 drivers/clk/qcom/lpasscorecc-sc7280.c              |    1 -
 drivers/clk/qcom/mmcc-apq8084.c                    |    2 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |    4 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |    2 +-
 drivers/clk/qcom/mmcc-msm8994.c                    |    3 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |    4 +-
 drivers/clk/qcom/mmcc-msm8998.c                    |    3 +-
 drivers/clk/qcom/mmcc-sdm660.c                     |    8 +-
 drivers/clk/qcom/nsscc-ipq9574.c                   | 3110 ++++++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |   10 +-
 drivers/clk/qcom/videocc-sm8350.c                  |    2 +-
 drivers/clk/qcom/videocc-sm8450.c                  |    2 +-
 drivers/clk/qcom/videocc-sm8550.c                  |    2 +-
 drivers/clk/renesas/r7s9210-cpg-mssr.c             |   10 +-
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            |    8 +
 drivers/clk/renesas/r8a779g0-cpg-mssr.c            |    2 +
 drivers/clk/renesas/r8a779h0-cpg-mssr.c            |    3 +
 drivers/clk/renesas/r9a07g043-cpg.c                |    7 +
 drivers/clk/renesas/r9a07g044-cpg.c                |   55 +-
 drivers/clk/renesas/r9a08g045-cpg.c                |    9 +-
 drivers/clk/renesas/r9a09g047-cpg.c                |   86 +
 drivers/clk/renesas/r9a09g057-cpg.c                |   24 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |    5 -
 drivers/clk/renesas/rzg2l-cpg.c                    |  133 +-
 drivers/clk/renesas/rzg2l-cpg.h                    |   12 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |   16 +-
 drivers/clk/renesas/rzv2h-cpg.h                    |    2 +
 drivers/clk/rockchip/Kconfig                       |   14 +
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-pll.c                     |   10 +-
 drivers/clk/rockchip/clk-rk3188.c                  |    4 +-
 drivers/clk/rockchip/clk-rk3328.c                  |    2 +-
 drivers/clk/rockchip/clk-rk3528.c                  | 1116 ++++++
 drivers/clk/rockchip/clk-rk3562.c                  | 1101 ++++++
 drivers/clk/rockchip/clk-rk3568.c                  |    1 +
 drivers/clk/rockchip/clk.h                         |   63 +
 drivers/clk/rockchip/rst-rk3528.c                  |  306 ++
 drivers/clk/rockchip/rst-rk3562.c                  |  429 +++
 drivers/clk/samsung/Makefile                       |    2 +
 drivers/clk/samsung/clk-cpu.c                      |    2 +-
 drivers/clk/samsung/clk-exynos-audss.c             |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    1 +
 drivers/clk/samsung/clk-exynos2200.c               | 3928 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynos3250.c               |    4 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c           |    1 +
 drivers/clk/samsung/clk-exynos5250.c               |    1 +
 drivers/clk/samsung/clk-exynos5260.c               |    3 -
 drivers/clk/samsung/clk-exynos5410.c               |    2 -
 drivers/clk/samsung/clk-exynos5420.c               |    1 +
 drivers/clk/samsung/clk-exynos5433.c               |    4 +-
 drivers/clk/samsung/clk-exynos7.c                  |    1 -
 drivers/clk/samsung/clk-exynos7870.c               | 1829 +++++++++
 drivers/clk/samsung/clk-exynos7885.c               |    2 +-
 drivers/clk/samsung/clk-exynos850.c                |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               |    2 +-
 drivers/clk/samsung/clk-exynos990.c                |  182 +-
 drivers/clk/samsung/clk-exynosautov9.c             |    2 +-
 drivers/clk/samsung/clk-exynosautov920.c           |    2 +-
 drivers/clk/samsung/clk-fsd.c                      |    2 +-
 drivers/clk/samsung/clk-gs101.c                    |    2 +-
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    1 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |    1 +
 drivers/clk/samsung/clk-s5pv210.c                  |    1 -
 drivers/clk/samsung/clk.c                          |    4 +-
 drivers/clk/samsung/clk.h                          |    1 +
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c             |   60 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h             |    2 +-
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c           |  248 ++
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h           |   14 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c             | 1685 +++++++++
 drivers/clk/sunxi-ng/ccu-sun55i-a523.h             |   14 +
 drivers/clk/sunxi-ng/ccu_common.h                  |    5 +
 drivers/clk/sunxi-ng/ccu_div.c                     |    2 +
 drivers/clk/sunxi-ng/ccu_gate.c                    |    4 +
 drivers/clk/sunxi-ng/ccu_mp.c                      |   51 +-
 drivers/clk/sunxi-ng/ccu_mp.h                      |   58 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     |    2 +
 include/dt-bindings/clock/mediatek,mt8188-clk.h    |    2 +-
 include/dt-bindings/clock/qcom,gcc-sdm660.h        |    2 +
 include/dt-bindings/clock/qcom,ipq9574-gcc.h       |    1 +
 include/dt-bindings/clock/qcom,ipq9574-nsscc.h     |  152 +
 include/dt-bindings/clock/qcom,qcs8300-camcc.h     |   16 +
 include/dt-bindings/clock/qcom,qcs8300-gpucc.h     |   17 +
 include/dt-bindings/clock/qcom,rpmcc.h             |    4 +
 include/dt-bindings/clock/rk3188-cru-common.h      |    2 +
 include/dt-bindings/clock/rockchip,rk3562-cru.h    |  379 ++
 include/dt-bindings/clock/samsung,exynos2200-cmu.h |  431 +++
 include/dt-bindings/clock/samsung,exynos7870-cmu.h |  324 ++
 include/dt-bindings/clock/samsung,exynos990.h      |   21 +
 include/dt-bindings/clock/sun50i-h616-ccu.h        |    4 +
 include/dt-bindings/clock/sun55i-a523-ccu.h        |  189 +
 include/dt-bindings/clock/sun55i-a523-r-ccu.h      |   37 +
 include/dt-bindings/reset/qcom,ipq9574-nsscc.h     |  134 +
 include/dt-bindings/reset/rockchip,rk3562-cru.h    |  358 ++
 include/dt-bindings/reset/sun50i-h616-ccu.h        |    2 +
 include/dt-bindings/reset/sun55i-a523-ccu.h        |   88 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h      |   25 +
 include/linux/clk/davinci.h                        |    6 -
 207 files changed, 18236 insertions(+), 661 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/ti,clkctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ti-clkctrl.txt
 delete mode 100644 drivers/clk/davinci/pll-da830.c
 delete mode 100644 drivers/clk/davinci/psc-da830.c
 create mode 100644 drivers/clk/qcom/nsscc-ipq9574.c
 create mode 100644 drivers/clk/rockchip/clk-rk3528.c
 create mode 100644 drivers/clk/rockchip/clk-rk3562.c
 create mode 100644 drivers/clk/rockchip/rst-rk3528.c
 create mode 100644 drivers/clk/rockchip/rst-rk3562.c
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 drivers/clk/samsung/clk-exynos7870.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs8300-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs8300-gpucc.h
 create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos7870-cmu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/clock/sun55i-a523-r-ccu.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
 create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-r-ccu.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
