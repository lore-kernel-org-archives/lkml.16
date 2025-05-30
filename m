Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E99C184;
	Fri, 30 May 2025 00:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748564101; cv=none; b=rgm8twn14fQmpUufpeUzkQLHYkYq6tkrQGMlI1qvyhRDwbL8RUwPdBx9G+Vpjw0xDQlS881lLWR2A4Fl7zXGkXSLgLJa5jkvtTXSWW8RF70J7h9vg1MzkXMauXwsrnzOWkEIgItW/iAT6I4Aajte3KDhd8+RNxuQn0UZatolBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748564101; c=relaxed/simple;
	bh=J674bSYGWdtYIG1U7sWkWR3MGlCF6JV5oWnCN+kqKk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QpHHdrkTRuZ2EYHH/bs6DvSTLKOEwGaRYjkPfZcY3URyx/+ETNabLqhcDHr3XQ1JpbQYn3DfY/1JXiGUBrqucyRD/c28nfKwdVYRCxApu9v7QkjTNu+F74WzvkdV2YCSspqBXarhpTb9jCQEQr6d9UCo/ZIFo+PbX5QrffrmznU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bO8r2se9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bO8r2se9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608A5C4CEE7;
	Fri, 30 May 2025 00:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748564100;
	bh=J674bSYGWdtYIG1U7sWkWR3MGlCF6JV5oWnCN+kqKk8=;
	h=From:To:Cc:Subject:Date:From;
	b=bO8r2se9IHpoCxWc61066L7mbFE0PF7L1EmP2yTEgjIvV/4rNDQfuF5KOhil60UGQ
	 zVtLnZrhYozkx1vN1vXKzZtmiSlPTcZz4z3bUszTRV+J5zMEJ4nNoUAnVp0OGpVBMf
	 07FVhtmUrX9MC0E8YFFsJhgsyn2bIL80SJ9zQUYsVJ1DKddpDn+FaH24X2Uexp7qru
	 adKgoXmiJ/BJi/e0uWy5okZop4hltjCTbGYlewKguieHMSyM30rLdsHZ0RFt/IGaUA
	 Lurn+4iJJbv46K8nwbCdUUvRz8yGYLz8ddFN4zL78etuQoFzKQDNjTESO/lI3qNtsc
	 U/cRWcBkhc7yg==
From: Stephen Boyd <sboyd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for the merge window
Date: Thu, 29 May 2025 17:14:55 -0700
Message-ID: <20250530001457.205397-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 63bfd78aae9a90210b0d369bb2836cca90402a95:

  Merge branches 'clk-amlogic', 'clk-allwinner', 'clk-rockchip' and 'clk-qcom' into clk-next (2025-05-29 00:30:39 -0700)

----------------------------------------------------------------
I've recently moved computers (among other things) so I'm sending this from a
new machine. The migration process took longer than expected and disrupted my
workflow, but I think I'm ready to go and things should speed up from here.

Luckily, this has been a semi-quiet cycle. The core framework remains unchanged
this time around. In terms of shiny new code though, we have support for the
SpacemiT K1 SoC, Sophgo SG2044, and T-HEAD TH1520 VO clk drivers joining the
usual silicon players like Qualcomm, Samsung, Allwinner, and Renesas.
Surprisingly, the Qualcomm pile was smaller than usual but that is likely
because they put one SoC support inside a driver for a different SoC that is
very similar. Other than all those new clk drivers there are the usual clk data
updates to fix parents, frequency tables, and add missing clks along with some
Kconfig changes to make compile testing simpler and even more DT binding
conversions to boot. The exciting part is still the new SoC support like
SpacemiT and Sophgo support though, which really dominate the diffstat because
they introduce a whole new silicon vendor clk driver.

New Drivers:
 - Camera clock controller driver for Qualcomm QCS8300
 - DE (display engine) 3.3 clocks on Allwinner H616
 - Samsung ExynosAutov920 CPU cluster CL0, CL1 and CL2 clock controllers
 - Video Output (VO) subsystem clk controller in the T-HEAD TH1520 SoC
 - Clock driver for Sophgo SG2044
 - Clock driver for SpacemiT K1 SoC
 - Renesas RZ/V2N (R9A09G056) SoC clk driver

Updates:
 - Correct data in various SoC clk drivers
 - Allow clkaN to be optional in the Qualcomm RPMh clock controller
   driver if command db doesn't define it
 - Change Kconfig options to not enable by default during compile testing
 - Add missing clks in various SoC clk drivers
 - Remove some duplicate clk DT bindings and convert some more to YAML

----------------------------------------------------------------
Alexander Shiyan (1):
      clk: rockchip: rk3588: Add PLL rate for 1500 MHz

Biju Das (6):
      clk: renesas: rzv2h: Fix a typo
      clk: renesas: rzv2h: Support static dividers without RMW
      clk: davinci: Use of_get_available_child_by_name()
      dt-bindings: clock: renesas,r9a09g047-cpg: Add XSPI and GBETH PTP core clocks
      clk: renesas: r9a09g047: Add support for xspi mux and divider
      clk: renesas: r9a09g047: Add XSPI clock/reset

Bjorn Andersson (1):
      Merge branch '20250324-sm6350-videocc-v2-2-cc22386433f4@fairphone.com' into clk-for-6.16

Chris Morgan (2):
      dt-bindings: clock: sun50i-h616-ccu: Add LVDS reset
      clk: sunxi-ng: h616: Add LVDS reset for LCD TCON

Da Xue (1):
      clk: meson-g12a: add missing fclk_div2 to spicc

Dr. David Alan Gilbert (1):
      clk: bcm: kona: Remove unused scaled_div_build

Frank Li (1):
      dt-bindings: clock: convert vf610-clock.txt to yaml format

Geert Uytterhoeven (4):
      Merge tag 'renesas-r9a09g056-dt-binding-defs-tag1' into renesas-clk-for-v6.16
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag3' into renesas-clk-for-v6.16
      clk: renesas: Use str_on_off() helper
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag3' into renesas-clk-for-v6.16

Haylen Chu (4):
      dt-bindings: soc: spacemit: Add spacemit,k1-syscon
      dt-bindings: clock: spacemit: Add spacemit,k1-pll
      clk: spacemit: Add clock support for SpacemiT K1 SoC
      clk: spacemit: k1: Add TWSI8 bus and function clocks

Heiko Stuebner (9):
      Merge branch 'v6.16-shared/clkids' into v6.16-clk/next
      Merge branch 'v6.16-shared/clkids' into v6.16-clk/next
      dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
      clk: rockchip: rk3036: fix implementation of usb480m clock mux
      clk: rockchip: rk3036: mark ddrphy as critical
      clk: rockchip: rename branch_muxgrf to branch_grf_mux
      clk: rockchip: rename gate-grf clk file
      clk: rockchip: rk3576: add missing slab.h include
      clk: rockchip: rk3528: add slab.h header include

Henry Martin (1):
      clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()

Imran Shaik (1):
      clk: qcom: Add support for Camera Clock Controller on QCS8300

Inochi Amaoto (6):
      dt-bindings: clock: sophgo: Use precise compatible for CV1800 series SoC
      clk: sophgo: Add support for newly added precise compatible
      dt-bindings: soc: sophgo: Add SG2044 top syscon device
      dt-bindings: clock: sophgo: add clock controller for SG2044
      clk: sophgo: Add PLL clock controller support for SG2044 SoC
      clk: sophgo: Add clock controller support for SG2044 SoC

Konrad Dybcio (1):
      dt-bindings: clock: add SM6350 QCOM video clock bindings

Krzysztof Kozlowski (5):
      clk: sunxi-ng: Do not enable by default during compile testing
      clk: sunxi: Do not enable by default during compile testing
      Merge branch 'for-v6.16/dt-bindings-clk-samsung' into next/clk
      Merge branch 'for-v6.16/dt-bindings-clk-samsung' into next/clk
      clk: meson: Do not enable by default during compile testing

Lad Prabhakar (17):
      clk: renesas: rzv2h: Refactor PLL configuration handling
      clk: renesas: rzv2h: Remove unused `type` field from `struct pll_clk`
      clk: renesas: rzv2h: Add support for enabling PLLs
      clk: renesas: rzv2h: Rename PLL field macros for consistency
      clk: renesas: r9a09g057: Add clock and reset entries for GE3D
      dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
      dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
      dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
      dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
      clk: renesas: rzv2h: Sort compatible list based on SoC part number
      clk: renesas: rzv2h: Add support for RZ/V2N SoC
      clk: renesas: rzv2h: Add support for static mux clocks
      clk: renesas: rzv2h: Add macro for defining static dividers
      clk: renesas: rzv2h: Use str_on_off() helper in rzv2h_mod_clock_endisable()
      clk: renesas: rzv2h: Use both CLK_ON and CLK_MON bits for clock state validation
      dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2 PHY and GBETH PTP core clocks
      clk: renesas: r9a09g057: Add clock and reset entries for USB2

Luca Weiss (4):
      clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs

Michal Wilczynski (2):
      dt-bindings: clock: thead: Add TH1520 VO clock controller
      clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC

Nicolas Frattaroli (4):
      dt-bindings: clock: rk3576: add IOC gated clocks
      clk: rockchip: introduce auxiliary GRFs
      clk: rockchip: introduce GRF gates
      clk: rockchip: add GATE_GRFs for SAI MCLKOUT to rk3576

Pengyu Luo (1):
      clk: qcom: rpmh: make clkaN optional

Pritam Manohar Sutar (1):
      clk: samsung: correct clock summary for hsi1 block

Richard Fitzgerald (1):
      clk: test: Forward-declare struct of_phandle_args in kunit/clk.h

Rob Herring (Arm) (2):
      dt-bindings: clock: Drop maxim,max77686.txt
      dt-bindings: clock: Drop st,stm32h7-rcc.txt

Ryan Walklin (2):
      dt-bindings: allwinner: add H616 DE33 clock binding
      clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support

Shin Son (5):
      dt-bindings: clock: exynosautov920: add cpucl0 clock definitions
      clk: samsung: exynosautov920: add cpucl0 clock support
      dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
      clk: samsung: exynosautov920: add cpucl1/2 clock support
      clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition

Stefan Wahren (2):
      dt-bindings: clock: convert bcm2835-aux-clock to yaml
      clk: bcm: rpi: Drop module alias

Stephen Boyd (14):
      Merge tag 'renesas-clk-for-v6.16-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'spacemit-clk-for-6.16-1' of https://github.com/spacemit-com/linux into clk-spacemit
      Merge tag 'socfpga_clk_updates_for_6.16_v2' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into clk-socfpga
      Merge tag 'riscv-sophgo-clk-for-v6.16' of https://github.com/sophgo/linux into clk-sophgo
      Merge tag 'thead-clk-for-v6.16' of https://github.com/pdp7/linux into clk-thead
      Merge tag 'renesas-clk-for-v6.16-tag2' of git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers into clk-renesas
      Merge tag 'samsung-clk-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into clk-samsung
      Merge tag 'clk-meson-v6.16-1' of https://github.com/BayLibre/clk-meson into clk-amlogic
      Merge tag 'sunxi-clk-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-allwinner
      Merge tag 'v6.16-rockchip-clk1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-rockchip
      Merge tag 'qcom-clk-for-6.16' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into clk-qcom
      Merge branches 'clk-bindings', 'clk-renesas', 'clk-spacemit' and 'clk-cleanup' into clk-next
      Merge branches 'clk-socfpga', 'clk-sophgo', 'clk-thead' and 'clk-samsung' into clk-next
      Merge branches 'clk-amlogic', 'clk-allwinner', 'clk-rockchip' and 'clk-qcom' into clk-next

Taniya Das (2):
      clk: qcom: gcc: Set FORCE_MEM_CORE_ON for gcc_ufs_axi_clk for 8650/8750
      clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks

Thorsten Blum (2):
      clk: socfpga: clk-pll: Optimize local variables
      clk: socfpga: stratix10: Optimize local variables

Tommaso Merciai (3):
      clk: renesas: rzv2h: Improve rzv2h_ddiv_set_rate()
      clk: renesas: rzv2h: Simplify rzv2h_cpg_assert()/rzv2h_cpg_deassert()
      clk: renesas: r9a09g047: Add clock and reset entries for GE3D

Varada Pavani (1):
      clk: samsung: Use samsung CCF common function

Vasily Khoruzhick (1):
      clk: rockchip: rk3568: Add PLL rate for 33.3MHz

Vincent Knecht (1):
      clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz

Wentao Liang (1):
      clk: qcom: Fix missing error check for dev_pm_domain_attach()

Yao Zi (5):
      clk: rockchip: Drop empty init callback for rk3588 PLL type
      dt-bindings: clock: Add GRF clock definition for RK3528
      clk: rockchip: Support MMC clocks in GRF region
      clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
      clk: rockchip: Pass NULL as reg pointer when registering GRF MMC clocks

 .../clock/allwinner,sun8i-a83t-de2-clk.yaml        |    1 +
 .../bindings/clock/brcm,bcm2835-aux-clock.txt      |   31 -
 .../bindings/clock/brcm,bcm2835-aux-clock.yaml     |   47 +
 .../devicetree/bindings/clock/fsl,vf610-ccm.yaml   |   58 +
 .../devicetree/bindings/clock/maxim,max77686.txt   |  114 --
 .../devicetree/bindings/clock/qcom,videocc.yaml    |   20 +
 .../bindings/clock/renesas,rzv2h-cpg.yaml          |    5 +-
 .../clock/samsung,exynosautov920-clock.yaml        |   69 +
 .../bindings/clock/sophgo,cv1800-clk.yaml          |   16 +-
 .../bindings/clock/sophgo,sg2044-clk.yaml          |   99 ++
 .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   50 +
 .../devicetree/bindings/clock/st,stm32h7-rcc.txt   |   71 -
 .../bindings/clock/thead,th1520-clk-ap.yaml        |   17 +-
 .../devicetree/bindings/clock/vf610-clock.txt      |   41 -
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |    2 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml         |    1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   15 +
 .../soc/sophgo/sophgo,sg2044-top-syscon.yaml       |   49 +
 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |   80 +
 MAINTAINERS                                        |    1 -
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/bcm/clk-kona.c                         |   18 -
 drivers/clk/bcm/clk-kona.h                         |    2 -
 drivers/clk/bcm/clk-raspberrypi.c                  |    3 +-
 drivers/clk/davinci/pll.c                          |   26 +-
 drivers/clk/meson/Kconfig                          |   16 +-
 drivers/clk/meson/g12a.c                           |    1 +
 drivers/clk/qcom/apcs-sdx55.c                      |    6 +-
 drivers/clk/qcom/camcc-sa8775p.c                   |  103 +-
 drivers/clk/qcom/camcc-sm6350.c                    |   18 +
 drivers/clk/qcom/clk-rpmh.c                        |   11 +
 drivers/clk/qcom/dispcc-sm6350.c                   |    3 +
 drivers/clk/qcom/gcc-msm8939.c                     |    4 +-
 drivers/clk/qcom/gcc-sm6350.c                      |    6 +
 drivers/clk/qcom/gcc-sm8650.c                      |    2 +
 drivers/clk/qcom/gcc-sm8750.c                      |    3 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |    4 +
 drivers/clk/qcom/gpucc-sm6350.c                    |    6 +
 drivers/clk/renesas/Kconfig                        |    5 +
 drivers/clk/renesas/Makefile                       |    1 +
 drivers/clk/renesas/r9a09g047-cpg.c                |   52 +-
 drivers/clk/renesas/r9a09g056-cpg.c                |  152 ++
 drivers/clk/renesas/r9a09g057-cpg.c                |   36 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |    3 +-
 drivers/clk/renesas/rzg2l-cpg.c                    |    3 +-
 drivers/clk/renesas/rzv2h-cpg.c                    |  186 +-
 drivers/clk/renesas/rzv2h-cpg.h                    |   94 +-
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-gate-grf.c                |  105 ++
 drivers/clk/rockchip/clk-mmc-phase.c               |   24 +-
 drivers/clk/rockchip/clk-pll.c                     |   11 -
 drivers/clk/rockchip/clk-rk3036.c                  |   11 +-
 drivers/clk/rockchip/clk-rk3288.c                  |    2 +-
 drivers/clk/rockchip/clk-rk3328.c                  |    6 +-
 drivers/clk/rockchip/clk-rk3528.c                  |   83 +-
 drivers/clk/rockchip/clk-rk3568.c                  |    3 +-
 drivers/clk/rockchip/clk-rk3576.c                  |   60 +-
 drivers/clk/rockchip/clk-rk3588.c                  |    1 +
 drivers/clk/rockchip/clk-rv1126.c                  |    2 +-
 drivers/clk/rockchip/clk.c                         |   38 +-
 drivers/clk/rockchip/clk.h                         |   75 +-
 drivers/clk/samsung/clk-exynos4.c                  |   74 +-
 drivers/clk/samsung/clk-exynosautov920.c           |  338 +++-
 drivers/clk/socfpga/clk-pll-s10.c                  |    6 +-
 drivers/clk/socfpga/clk-pll.c                      |    4 +-
 drivers/clk/sophgo/Kconfig                         |   19 +
 drivers/clk/sophgo/Makefile                        |    2 +
 drivers/clk/sophgo/clk-cv1800.c                    |    2 +
 drivers/clk/sophgo/clk-sg2044-pll.c                |  628 +++++++
 drivers/clk/sophgo/clk-sg2044.c                    | 1812 ++++++++++++++++++++
 drivers/clk/spacemit/Kconfig                       |   18 +
 drivers/clk/spacemit/Makefile                      |    5 +
 drivers/clk/spacemit/ccu-k1.c                      | 1164 +++++++++++++
 drivers/clk/spacemit/ccu_common.h                  |   48 +
 drivers/clk/spacemit/ccu_ddn.c                     |   83 +
 drivers/clk/spacemit/ccu_ddn.h                     |   48 +
 drivers/clk/spacemit/ccu_mix.c                     |  268 +++
 drivers/clk/spacemit/ccu_mix.h                     |  218 +++
 drivers/clk/spacemit/ccu_pll.c                     |  157 ++
 drivers/clk/spacemit/ccu_pll.h                     |   86 +
 drivers/clk/sunxi-ng/Kconfig                       |   48 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c             |    1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               |   25 +
 drivers/clk/sunxi/Kconfig                          |   10 +-
 drivers/clk/thead/clk-th1520-ap.c                  |  196 ++-
 include/dt-bindings/clock/qcom,sm6350-videocc.h    |   27 +
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |    3 +
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |   24 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |    4 +
 include/dt-bindings/clock/rk3036-cru.h             |    1 +
 include/dt-bindings/clock/rockchip,rk3528-cru.h    |    6 +
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |   10 +
 include/dt-bindings/clock/samsung,exynosautov920.h |   51 +
 include/dt-bindings/clock/sophgo,sg2044-clk.h      |  153 ++
 include/dt-bindings/clock/sophgo,sg2044-pll.h      |   27 +
 include/dt-bindings/clock/spacemit,k1-syscon.h     |  247 +++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   34 +
 include/dt-bindings/reset/sun50i-h616-ccu.h        |    1 +
 include/kunit/clk.h                                |    1 +
 100 files changed, 7298 insertions(+), 526 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-aux-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,vf610-ccm.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/vf610-clock.txt
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2044-top-syscon.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/renesas/r9a09g056-cpg.c
 create mode 100644 drivers/clk/rockchip/clk-gate-grf.c
 create mode 100644 drivers/clk/sophgo/clk-sg2044-pll.c
 create mode 100644 drivers/clk/sophgo/clk-sg2044.c
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/qcom,sm6350-videocc.h
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
 create mode 100644 include/dt-bindings/clock/sophgo,sg2044-pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-syscon.h

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
