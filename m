Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E517A2EE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743170984; cv=none; b=pQx6Jydz2V0JHdzxv8JTBYQkp4FOOxGgayZDpO4IwBOoNthtVmzkXcTz6WF55IF5ghAceiMBEM6zilyEYd7sInYxAKkefCot72je7hxFNaYD88AfpJgTAnPe3sxnQrtPRQOAp6/eTi+gPWNRFaWC+RIRqqH2BkHxHfz9bOya0Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743170984; c=relaxed/simple;
	bh=eiDoFa9jIGXP/ujFM85IxpiZdP0vpmnosAiuEPBIGqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5mDJm4cadB+sC+BUiT8XpPk9o+OzJzFgvYgxYI/+8ZYoyIWOfMrfSfRyQXKhzrua0m+dJPpKMPBZGIf4QzPjVso/jZvIEpmKAccRtqyM0JUCTTNBtDKR2GT58FxOMH5YvgMBjlkWSRbY31rp0PA9cBbVu6OauClkRRDGoAqYQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avM+QGso; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avM+QGso"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A0EC4CEE4;
	Fri, 28 Mar 2025 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743170983;
	bh=eiDoFa9jIGXP/ujFM85IxpiZdP0vpmnosAiuEPBIGqI=;
	h=Date:From:To:Cc:Subject:From;
	b=avM+QGsox9PWYkDQ/HDW51OZuF+9a63re2tZrlP+GFgXYGaGbOnlVgnGUtW46rDJd
	 f71LHj/mgPLxCx5b7uBHeZ4TEjq5yK96CUYtQDmtAfj9PzROvBtZ8VU0aXv0mf68zW
	 1Q5U4OWtervfyjmYemYaIz7GWtCFOnxvBlPG+PoxxAN+wmgDdAbqkg7s+NkmqLNCjy
	 e0zdhK2LkqFECKnqeHhkM0+hHnFAsTuXKAzFF5p6p28QHYmfB6MqdEJa4bgNqRUJbX
	 ZZcEvt8713hsty78cNGXE2t4ErW1ldDuuwHNuxgfI07Pv4n6NTjjHk/jJXRmWqHqmW
	 bwulY8ufwlgog==
Date: Fri, 28 Mar 2025 14:09:37 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MFD for v6.15
Message-ID: <20250328140937.GA7190@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Good afternoon Linus,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-next-6.15

for you to fetch changes up to a8d1376568619d5b7fb867929b01eeaa59bb9097:

  mfd: cgbc-core: Add support for conga-SA8 (2025-03-21 11:34:08 +0000)

----------------------------------------------------------------
  * Maxim MAX77705:
    * Added core MFD driver.
    * Added charger driver.
    * Added devicetree bindings for the charger and MFD core.
    * Added Haptic controller support via the input subsystem.
    * Added LED support.
    * Added support to simple-mfd-i2c for fuel gauge and hwmon.
  * Samsung S2MPU05 (Exynos7870 PMIC):
    * Added core MFD support.
    * Added Regulator support for 21 LDOs and 5 BUCKs.
    * Added devicetree bindings for regulators and the PMIC core.
  * TI TPS65215 & TPS65214:
    * Added support to the existing TPS65219 driver.
    * Added devicetree bindings.
  * STMicroelectronics STM32MP25:
    * Added support to the stm32-timers MFD driver.
    * Added devicetree bindings.
  * Congatec Board Controller (CGBC):
    * Added HWMON support for internal sensors.
    * Added support for the conga-SA8 module.
  * Microchip LAN969X:
    * Enabled the at91-usart MFD driver for this architecture.
  * MediaTek MT6359:
    * Added mfd_cell for mt6359-accdet to allow its driver to probe.

  * AXP20X (AXP717): Added AXP717_TS_PIN_CFG register to writeable
    regs for temperature sensor configuration.
  * SM501: Switched to using BIT() macro to mitigate potential
    integer overflows in GPIO functions.
  * ENE KB3930: Added a NULL pointer check for off_gpios during
    probe to prevent potential dereference.
  * SYSCON: Added a check for invalid resource size to prevent
    issues from DT misconfiguration.
  * CGBC: Corrected signedness issues in cgbc_session_request.

  * intel_soc_pmic_chtdc_ti / intel_soc_pmic_crc: Removed unneeded
    explicit assignment to REGCACHE_NONE.
  * ipaq-micro / tps65010: Switched to using str_enable_disable()
    helpers for clarity and potential size reduction.
  * upboard-fpga: Removed unnecessary ACPI_PTR() annotation.
  * max8997: Removed unused max8997_irq_exit() function, using
    devm_* helpers instead.
  * lp3943: Dropped unused #include <linux/pwm.h> from the header
    file.
  * db8500-prcmu: Removed needless return statements in void APIs.
  * qnap-mcu: Replaced commas with semicolons between expressions
    for correctness.

  * STA2X11: Removed the core MFD driver as the underlying
    platform support was removed.
  * EZX-PCAP: Removed the unused pcap_adc_sync function.
  * PCF50633 (OpenMoko PMIC): Removed the entire driver (core, adc,
    gpio, irq) as the underlying s3c24xx platform support was removed.

  * Converted fsl,mcu-mpc8349emitx binding to YAML.
  * Added qcom,msm8937-tcsr compatible.
  * Added microchip,sama7d65-flexcom compatible.
  * Added rockchip,rk3528-qos syscon compatible.
  * Added airoha,en7581-pbus-csr syscon compatible.
  * Added microchip,sama7d65-ddr3phy syscon compatible.
  * Added microchip,sama7d65-sfrbu syscon compatible.

----------------------------------------------------------------
Aaron Kling (1):
      mfd: max77620: Allow building as a module

Andrew Perepech (1):
      mfd: mt6397-core: Add mfd_cell for mt6359-accdet

Andy Shevchenko (3):
      mfd: intel_soc_pmic_chtdc_ti: Drop unneeded assignment for cache_type
      mfd: intel_soc_pmic_crc: Drop unneeded assignment for cache_type
      mfd: upboard-fpga: Remove ACPI_PTR() annotation

Barnabás Czémán (1):
      dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8937

Chen Ni (1):
      mfd: qnap-mcu: Convert commas to semicolons in qnap_mcu_exec()

Chenyuan Yang (1):
      mfd: ene-kb3930: Fix a potential NULL pointer dereference

Chris Morgan (1):
      mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable regs

Chukun Pan (1):
      dt-bindings: mfd: syscon: Add rk3528 QoS register compatible

Dan Carpenter (1):
      mfd: cgbc-core: Cleanup signedness in cgbc_session_request()

Dharma Balasubiramani (1):
      dt-bindings: mfd: atmel,sama5d2-flexcom: Add microchip,sama7d65-flexcom

Dr. David Alan Gilbert (5):
      mfd: ezx-pcap: Remove unused pcap_adc_sync
      mfd: pcf50633-adc: Remove unused driver
      mfd: pcF50633-gpio: Remove unused driver
      mfd: pcf50633: Remove unused platform IRQ code
      mfd: pcf50633: Remove remaining PCF50633 support

Dzmitry Sankouski (7):
      dt-bindings: power: supply: add maxim,max77705 charger
      dt-bindings: mfd: Add maxim,max77705
      power: supply: max77705: Add charger driver for Maxim 77705
      mfd: simple-mfd-i2c: Add MAX77705 support
      mfd: Add new driver for MAX77705 PMIC
      Input: max77693 - add max77705 haptic support
      leds: max77705: Add LEDs support

Eder Zulian (1):
      mfd: syscon: Add check for invalid resource size

Fabrice Gasnier (2):
      dt-bindings: mfd: stm32-timers: Add support for stm32mp25
      mfd: stm32-timers: Add support for stm32mp25

J. Neuschäfer (1):
      dt-bindings: mfd: Convert fsl,mcu-mpc8349emitx binding to YAML

Kaustabh Chakraborty (4):
      regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
      mfd: sec: Add support for S2MPU05 PMIC
      regulator: s2mps11: Add support for S2MPU05 regulators
      dt-bindings: mfd: samsung,s2mps11: Add compatible for s2mpu05-pmic

Krzysztof Kozlowski (1):
      mfd: ipaq-micro/tps65010: Use str_enable_disable-like helpers

Lee Jones (2):
      Merge branches 'ib-mfd-input-leds-power-6.15', 'ib-mfd-power-6.15' and 'ib-mfd-regulator-6.15' into ibs-for-mfd-merged
      mfd: max8997: Remove unused function max8997_irq_exit()

Lorenzo Bianconi (1):
      dt-bindings: mfd: syscon: Add the pbus-csr node for Airoha EN7581 SoC

Lukas Bulwahn (1):
      mfd: Remove STA2x11 core driver

Nikita Zhandarovich (1):
      mfd: sm501: Switch to BIT() to mitigate integer overflows

Robert Marko (1):
      mfd: at91-usart: Make it selectable for ARCH_LAN969X

Ryan Wanner (2):
      dt-bindings: mfd: syscon: Add microchip,sama7d65-ddr3phy
      dt-bindings: mfd: syscon: Add microchip,sama7d65-sfrbu

Shree Ramamoorthy (5):
      dt-bindings: regulator: Add TI TPS65215 PMIC bindings
      dt-bindings: regulator: Add TI TPS65214 PMIC bindings
      mfd: tps65219: Remove TPS65219_REG_TI_DEV_ID check
      mfd: tps65219: Add support for TI TPS65215 PMIC
      mfd: tps65219: Add support for TI TPS65214 PMIC

Thomas Richard (2):
      mfd: cgbc: Add support for HWMON
      mfd: cgbc-core: Add support for conga-SA8

Uwe Kleine-König (1):
      mfd: lp3943: Drop #include <linux/pwm.h> from header

Zijun Hu (1):
      mfd: db8500-prcmu: Remove needless return in three void APIs

 .../bindings/mfd/atmel,sama5d2-flexcom.yaml        |   9 +-
 .../bindings/mfd/fsl,mcu-mpc8349emitx.yaml         |  53 ++
 .../devicetree/bindings/mfd/maxim,max77705.yaml    | 158 +++++
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |   1 +
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  13 +
 .../devicetree/bindings/mfd/st,stm32-timers.yaml   |  18 +-
 Documentation/devicetree/bindings/mfd/syscon.yaml  |   8 +
 .../bindings/power/supply/maxim,max77705.yaml      |  50 ++
 .../bindings/powerpc/fsl/mcu-mpc8349emitx.txt      |  17 -
 .../bindings/regulator/samsung,s2mpu05.yaml        |  47 ++
 .../devicetree/bindings/regulator/ti,tps65219.yaml |  27 +-
 MAINTAINERS                                        |   4 +
 arch/mips/configs/ip27_defconfig                   |   3 -
 drivers/input/misc/Kconfig                         |   6 +-
 drivers/input/misc/max77693-haptic.c               |  13 +-
 drivers/leds/Kconfig                               |   8 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-max77705.c                       | 275 +++++++++
 drivers/mfd/Kconfig                                |  47 +-
 drivers/mfd/Makefile                               |   6 +-
 drivers/mfd/axp20x.c                               |   1 +
 drivers/mfd/cgbc-core.c                            |  10 +-
 drivers/mfd/ene-kb3930.c                           |   2 +-
 drivers/mfd/ezx-pcap.c                             |  33 --
 drivers/mfd/intel_soc_pmic_chtdc_ti.c              |   1 -
 drivers/mfd/intel_soc_pmic_crc.c                   |   1 -
 drivers/mfd/ipaq-micro.c                           |   3 +-
 drivers/mfd/max77620.c                             |   5 +
 drivers/mfd/max77705.c                             | 182 ++++++
 drivers/mfd/max8997-irq.c                          |  15 +-
 drivers/mfd/mt6397-core.c                          |  12 +
 drivers/mfd/pcf50633-adc.c                         | 255 --------
 drivers/mfd/pcf50633-core.c                        | 304 ----------
 drivers/mfd/pcf50633-gpio.c                        |  92 ---
 drivers/mfd/pcf50633-irq.c                         | 312 ----------
 drivers/mfd/qnap-mcu.c                             |   6 +-
 drivers/mfd/sec-core.c                             |  12 +
 drivers/mfd/sec-irq.c                              |  34 ++
 drivers/mfd/simple-mfd-i2c.c                       |  11 +
 drivers/mfd/sm501.c                                |   6 +-
 drivers/mfd/sta2x11-mfd.c                          | 645 ---------------------
 drivers/mfd/stm32-timers.c                         |  31 +-
 drivers/mfd/syscon.c                               |   9 +-
 drivers/mfd/tps65010.c                             |  13 +-
 drivers/mfd/tps65219.c                             | 279 ++++++++-
 drivers/mfd/upboard-fpga.c                         |   3 +-
 drivers/power/supply/Kconfig                       |   6 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77705_charger.c            | 581 +++++++++++++++++++
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/s2mps11.c                        |  92 ++-
 include/linux/mfd/axp20x.h                         |   1 +
 include/linux/mfd/dbx500-prcmu.h                   |   6 +-
 include/linux/mfd/ezx-pcap.h                       |   1 -
 include/linux/mfd/lp3943.h                         |   1 -
 include/linux/mfd/max77693-common.h                |   4 +-
 include/linux/mfd/max77705-private.h               | 195 +++++++
 include/linux/mfd/max8997-private.h                |   1 -
 include/linux/mfd/pcf50633/adc.h                   |  69 ---
 include/linux/mfd/pcf50633/gpio.h                  |  48 --
 include/linux/mfd/pcf50633/mbc.h                   | 130 -----
 include/linux/mfd/pcf50633/pmic.h                  |  68 ---
 include/linux/mfd/samsung/core.h                   |   1 +
 include/linux/mfd/samsung/irq.h                    |  44 ++
 include/linux/mfd/samsung/s2mpu05.h                | 183 ++++++
 include/linux/mfd/sta2x11-mfd.h                    | 506 ----------------
 include/linux/mfd/stm32-timers.h                   |   9 +
 include/linux/mfd/tps65219.h                       | 136 ++++-
 include/linux/power/max77705_charger.h             | 195 +++++++
 69 files changed, 2724 insertions(+), 2599 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mcu-mpc8349emitx.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77705.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/maxim,max77705.yaml
 delete mode 100644 Documentation/devicetree/bindings/powerpc/fsl/mcu-mpc8349emitx.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu05.yaml
 create mode 100644 drivers/leds/leds-max77705.c
 create mode 100644 drivers/mfd/max77705.c
 delete mode 100644 drivers/mfd/pcf50633-adc.c
 delete mode 100644 drivers/mfd/pcf50633-core.c
 delete mode 100644 drivers/mfd/pcf50633-gpio.c
 delete mode 100644 drivers/mfd/pcf50633-irq.c
 delete mode 100644 drivers/mfd/sta2x11-mfd.c
 create mode 100644 drivers/power/supply/max77705_charger.c
 create mode 100644 include/linux/mfd/max77705-private.h
 delete mode 100644 include/linux/mfd/pcf50633/adc.h
 delete mode 100644 include/linux/mfd/pcf50633/gpio.h
 delete mode 100644 include/linux/mfd/pcf50633/mbc.h
 delete mode 100644 include/linux/mfd/pcf50633/pmic.h
 create mode 100644 include/linux/mfd/samsung/s2mpu05.h
 delete mode 100644 include/linux/mfd/sta2x11-mfd.h
 create mode 100644 include/linux/power/max77705_charger.h

-- 
Lee Jones [李琼斯]
