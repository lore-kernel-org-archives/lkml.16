Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD70DDAB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944820; cv=none; b=hVxXZ6vA9mG1e7WAQE2Z0w1JhpFubY+RbdxSyobOlSjaIp1VzWFQW+olGv+PqrG69exmhbaRRJ34WYKHVSJmrNGZWU6ksTbcMmTF2r2vDEiztO0vivfmecGWHAOSE6zKY9pR5zlvmVu2i98o18KH0U+WgabftXrkmWug6WC0s80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944820; c=relaxed/simple;
	bh=z8i1+obZcDr+5n5xKhnYxOKZLgfrGH7QlWp+potiZoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/An4GqgndGXx16elNesG6YZSInqQ7V2s8R7DR6OP+brR41dHI9lklNHgnq4ZNfltNXF95sOlVuniPdWmmU+QN+BvXJY1Azf+u2AeTmCv3MNPXdA16ksed2plJSjMXmxzal9jSQEju26Q4TBIuauW26KjcXnbhttDY2hkqpYhqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om/o3BDj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om/o3BDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23648C4CEED;
	Tue,  3 Jun 2025 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748944818;
	bh=z8i1+obZcDr+5n5xKhnYxOKZLgfrGH7QlWp+potiZoI=;
	h=Date:From:To:Cc:Subject:From;
	b=om/o3BDjIVFqa4YDK3J5+9sj1zvz2hdFpk7mkyNGYws6JsYeVkDlrYmIVpsG5MRus
	 Kaz0q70Adm0UXGkkM20btTE4aq1STsQHE2vqwOwWEDPF6gOuKJwQ8Q7d3CYn9igHic
	 +xOXvJ3mgJXR8mMFEvNqmGxAvYWyX7+tqVAuutZXhjK6dceb3fgfVjYpLXCMsnlyGh
	 UnmwzQ2dfzHU8OA+SaHBoihy6u8H0d3aPsn8+QWn7mJpoPl28pC7jPgX7GhKOe95aZ
	 g94i7upSOVRaYSK4wtF2htlRuhIwN2Pa7+V4pOxOiQYXSs4UYPNYFPlxORzBKjaKkQ
	 Vlfq00dOgGKwA==
Date: Tue, 3 Jun 2025 11:00:15 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MFD for v6.16
Message-ID: <20250603100015.GC7758@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Good morning Linus,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git mfd-next-6.16

for you to fetch changes up to ffb006aa433e8109ec79320c344fb69947997ba1:

  mfd: maxim: Correct Samsung "Electronics" spelling in copyright headers (2025-06-03 09:46:41 +0100)

----------------------------------------------------------------
MFD for v6.16

  * Samsung Exynos ACPM:
    * Populate child platform devices from device tree data
    * Introduce a new API, `devm_acpm_get_by_node()`, for child devices to get the ACPM handle
  * ROHM PMICs:
    * Add support for the ROHM BD96802 scalable companion PMIC to the BD96801 core driver
    * Add support for controlling the BD96802 using the BD96801 regulator driver
    * Add support to the BD96805, which is almost identical to the BD96801
    * Add support to the BD96806, which is similar to the BD96802
  * Maxim MAX77759:
    * Add a core driver for the MAX77759 companion PMIC
    * Add a GPIO driver for the expander functions on the MAX77759
    * Add an NVMEM driver to expose the non-volatile memory on the MAX77759
  * STMicroelectronics STM32MP25:
    * Add support for the STM32MP25 SoC to the stm32-lptimer
    * Add support for the STM32MP25 to the clocksource driver, handling new register access requirements
    * Add support for the STM32MP25 to the PWM driver, enabling up to two PWM outputs
  * Broadcom BCM590xx:
    * Add support for the BCM59054 PMU
    * Parse the PMU ID and revision to support behavioral differences between chip revisions
    * Add regulator support for the BCM59054
  * Samsung S2MPG10:
    * Add support for the S2MPG10 PMIC, which communicates via the Samsung ACPM firmware instead of I2C

  * Exynos ACPM:
    * Improve timeout detection reliability by using ktime APIs instead of a loop counter assumption
    * Allow PMIC access during late system shutdown by switching to `udelay()` instead of a sleeping function
    * Fix an issue where reading command results longer than 8 bytes would fail
    * Silence non-error `-EPROBE_DEFER` messages during boot to clean up logs
  * Exynos LPASS:
    * Fix an error handling path by switching to `devm_regmap_init_mmio()` to prevent resource leaks
    * Fix a bug where `exynos_lpass_disable()` was called twice in the remove function
    * Fix another resource leak in the probe's error path by using `devm_add_action_or_reset()`
  * Samsung SEC:
    * Handle the s2dos05, which does not have IRQ support, explicitly to prevent warnings
    * Fix the core driver to correctly handle errors from `sec_irq_init()` instead of ignoring them
  * STMPE-SPI:
    * Correct an undeclared identifier in the `MODULE_DEVICE_TABLE` macro
  * MAINTAINERS:
    * Adjust a file path for the Siemens IPC LED drivers entry to fix a broken reference
  * Maxim Drivers:
    * Correct the spelling of "Electronics" in Samsung copyright headers across multiple files
  * General:
    * Fix wakeup source memory leaks on device unbind for 88pm886, as3722, max14577, max77541, max77705,
      max8925, rt5033, and sprd-sc27xx drivers

  * Samsung SEC Drivers:
    * Split the driver into a transport-agnostic core (`sec-core`) and transport-specific (`sec-i2c`,
      `sec-acpm`) modules to support non-I2C devices
    * Merge the `sec-core` and `sec-irq` modules to reduce memory consumption
    * Move internal APIs to a private header to clean up the public API
    * Improve code style by sorting includes, cleaning up headers, sorting device tables, and using helper
      macros like `dev_err_probe()`, `MFD_CELL`, and `REGMAP_IRQ_REG`
    * Make regmap configuration for s2dos05/s2mpu05 explicit to improve clarity
    * Rework platform data and regmap instantiation to use OF match data instead of a large switch statement
  * ROHM BD96801/2:
    * Prepare the driver for new models by separating chip-specific data into its own structure
    * Drop IC name prefix from IRQ resource names in both the MFD and regulator drivers for simplification
  * Broadcom BCM590xx:
    * Refactor the regulator driver to store descriptions in a table to ease support for new chips
    * Rename BCM59056-specific data to prepare for the addition of other regulators
    * Use `dev_err_probe()` for cleaner error handling
  * Exynos ACPM:
    * Correct kerneldoc warnings and use the conventional 'np' argument name
  * General MFD:
    * Convert `aat2870` and `tps65010` to use the per-client debugfs directory provided by the I2C core
    * Convert `sm501`, `tps65010` and `ucb1x00` to use the new GPIO line value setter callbacks
    * Constify `regmap_irq_chip` and other structures in `88pm886` to move data to read-only sections

  * BCM590xx:
    * Drop the unused "id" member from the `bcm590xx` struct in preparation for a replacement
  * Samsung SEC Core:
    * Remove forward declarations for functions that no longer exist
  * SM501:
    * Remove the unused `sm501_find_clock()` function

  * New Compatibles:
    * Google: Add a PMIC child node to the `google,gs101-acpm-ipc` binding
    * ROHM: Add new bindings for `rohm,bd96802-regulator` and `rohm,bd96802-pmic`, and add compatibles
      for BD96805 and BD96806
    * Maxim: Add new bindings for `maxim,max77759-gpio`, `maxim,max77759-nvmem`, and the top-level
      `maxim,max77759`
    * STM: Add `stm32mp25` compatible to the `stm32-lptimer` binding
    * Broadcom: Add `bcm59054` compatible
    * Atmel/Microchip: Add `microchip,sama7d65-gpbr` and `microchip,sama7d65-secumod` compatibles
    * Samsung: Add `s2mpg10` compatible to the `samsung,s2mps11` MFD binding
    * MediaTek: Add compatibles for `mt6893` (scpsys), `mt7988-topmisc`, and `mt8365-infracfg-nao`
    * Qualcomm: Add `qcom,apq8064-mmss-sfpb` and `qcom,apq8064-sps-sic` syscon compatibles
  * Refactoring & Cleanup:
    * Convert Broadcom BCM59056 devicetree bindings to YAML and split them into MFD and regulator parts
    * Convert the Microchip AT91 secumod binding to YAML
    * Drop unrelated consumer nodes from binding examples to reduce bloat
    * Correct indentation and style in various DTS examples

----------------------------------------------------------------
Alexey Gladkov (1):
      mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE

André Draszik (34):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: introduce devm_acpm_get_by_node()
      dt-bindings: gpio: Add max77759 binding
      dt-bindings: nvmem: Add max77759 binding
      dt-bindings: mfd: Add max77759 binding
      mfd: max77759: Add Maxim MAX77759 core driver
      gpio: max77759: Add Maxim MAX77759 gpio driver
      nvmem: max77759: Add Maxim MAX77759 NVMEM driver
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10
      mfd: sec-core: Drop non-existing forward declarations
      mfd: sec: Sort includes alphabetically
      mfd: sec: Update includes to add missing and remove superfluous ones
      mfd: sec: Move private internal API to internal header
      mfd: sec: Split into core and transport (i2c) drivers
      mfd: sec: Add support for S2MPG10 PMIC
      mfd: sec: Merge separate core and irq modules
      mfd: sec-common: Fix multiple trivial whitespace issues
      mfd: sec-i2c: Sort struct of_device_id entries and the device type switch
      mfd: sec: Use dev_err_probe() where appropriate
      mfd: sec-i2c: s2dos05/s2mpu05: Use explicit regmap config and drop default
      mfd: sec-irq: s2dos05 doesn't support interrupts
      mfd: sec-common: Don't ignore errors from sec_irq_init()
      mfd: sec-i2c: Rework platform data and regmap instantiating
      mfd: sec: Change device_type to int
      mfd: sec: Don't compare against NULL / 0 for errors, use !
      mfd: sec-common: Use sizeof(*var), not sizeof(struct type_of_var)
      mfd: sec-common: Convert to using MFD_CELL macros
      mfd: sec-irq: Convert to using REGMAP_IRQ_REG() macros
      mfd: sec: Add myself as module author
      MAINTAINERS: add myself as reviewer for Samsung S2M MFD

AngeloGioacchino Del Regno (1):
      dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT6893

Artur Weber (9):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      mfd: bcm590xx: Add PMU ID/revision parsing function
      regulator: bcm590xx: Use dev_err_probe for regulator register error
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators
      mfd: bcm590xx: Drop unused "id" member of bcm590xx struct

Bartosz Golaszewski (3):
      mfd: sm501: Use new GPIO line value setter callbacks
      mfd: tps65010: Use new GPIO line value setter callbacks
      mfd: ucb1x00: Use new GPIO line value setter callbacks

Christophe JAILLET (4):
      mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
      mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
      mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
      mfd: 88pm886: Constify struct regmap_irq_chip and some other structures

Dmitry Baryshkov (2):
      dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb
      dt-bindings: mfd: syscon: Add qcom,apq8064-sps-sic

Dr. David Alan Gilbert (1):
      mfd: sm501: Remove unused sm501_find_clock

Fabrice Gasnier (4):
      dt-bindings: mfd: stm32-lptimer: Add support for stm32mp25
      mfd: stm32-lptimer: Add support for stm32mp25
      clocksource/drivers/stm32-lptimer: Add support for stm32mp25
      pwm: stm32-lp: Add support for stm32mp25

Frank Wunderlich (1):
      dt-bindings: mfd: syscon: Add mt7988-topmisc

Krzysztof Kozlowski (11):
      firmware: exynos-acpm: Correct kerneldoc and use typical np argument name
      dt-bindings: mfd: Drop unrelated nodes from DTS example
      dt-bindings: mfd: Correct indentation and style in DTS example
      mfd: 88pm886: Fix wakeup source leaks on device unbind
      mfd: as3722: Fix wakeup source leaks on device unbind
      mfd: max14577: Fix wakeup source leaks on device unbind
      mfd: max77541: Fix wakeup source leaks on device unbind
      mfd: max77705: Fix wakeup source leaks on device unbind
      mfd: max8925: Fix wakeup source leaks on device unbind
      mfd: rt5033: Fix wakeup source leaks on device unbind
      mfd: sprd-sc27xx: Fix wakeup source leaks on device unbind

Lee Jones (2):
      Merge tag 'samsung-drivers-6.16' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux into ib-firmware-mfd-6.16
      Merge branches 'ib-firmware-mfd-6.16', 'ib-mfd-clocksource-pwm-6.16', 'ib-mfd-gpio-nvmem-6.16', 'ib-mfd-regulator-6.16' and 'ib-mfd-regulator-6.16-1' into ibs-for-mfd-merged

Lukas Bulwahn (1):
      MAINTAINERS: Adjust the file entry in SIEMENS IPC LED DRIVERS

Matti Vaittinen (14):
      dt-bindings: regulator: Add ROHM BD96802 PMIC
      dt-bindings: mfd: Add ROHM BD96802 PMIC
      dt-bindings: mfd: bd96801: Add ROHM BD96805
      dt-bindings: mfd: bd96802: Add ROHM BD96806
      mfd: rohm-bd96801: Add chip info
      mfd: bd96801: Drop IC name from the regulator IRQ resources
      regulator: bd96801: Drop IC name from the IRQ resources
      mfd: rohm-bd96801: Support ROHM BD96802
      regulator: bd96801: Support ROHM BD96802
      mfd: bd96801: Support ROHM BD96805
      regulator: bd96801: Support ROHM BD96805 PMIC
      mfd: bd96801: Support ROHM BD96806
      regulator: bd96801: Support ROHM BD96806 PMIC
      MAINTAINERS: Add BD96802 specific header

Nícolas F. R. A. Prado (1):
      dt-bindings: mfd: syscon: Add mediatek,mt8365-infracfg-nao

Ryan Wanner (3):
      dt-bindings: mfd: atmel: Add microchip,sama7d65-gpbr
      dt-bindings: mfd: syscon: atmel,sama5d2-secumod: Convert to yaml
      dt-bindings: mfd: syscon: Add microchip,sama7d65-secumod

Sumanth Gavini (2):
      mfd: maxim: Correct Samsung "Electronics" spelling in headers
      mfd: maxim: Correct Samsung "Electronics" spelling in copyright headers

Tudor Ambarus (1):
      firmware: exynos-acpm: populate devices from device tree data

Wolfram Sang (2):
      mfd: aat2870: Use per-client debugfs directory
      mfd: tps65010: Use per-client debugfs directory

 .../bindings/arm/atmel,sama5d2-secumod.yaml        |   49 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |   25 -
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   35 +
 .../bindings/gpio/maxim,max77759-gpio.yaml         |   44 +
 .../bindings/mfd/atmel,at91sam9260-gpbr.yaml       |    1 +
 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 Documentation/devicetree/bindings/mfd/iqs62x.yaml  |  177 ++-
 .../devicetree/bindings/mfd/maxim,max77759.yaml    |   99 ++
 .../bindings/mfd/mediatek,mt8195-scpsys.yaml       |    1 +
 .../devicetree/bindings/mfd/mscc,ocelot.yaml       |    6 -
 .../devicetree/bindings/mfd/netronix,ntxec.yaml    |   39 +-
 .../devicetree/bindings/mfd/rohm,bd9571mwv.yaml    |   50 +-
 .../devicetree/bindings/mfd/rohm,bd96801-pmic.yaml |   10 +-
 .../devicetree/bindings/mfd/rohm,bd96802-pmic.yaml |  101 ++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   26 +-
 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |   40 +-
 Documentation/devicetree/bindings/mfd/syscon.yaml  |    7 +
 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  202 +--
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       |   32 +
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 .../bindings/regulator/rohm,bd96802-regulator.yaml |   44 +
 MAINTAINERS                                        |   16 +-
 arch/arm/configs/exynos_defconfig                  |    2 +-
 arch/arm/configs/multi_v7_defconfig                |    2 +-
 arch/arm/configs/pxa_defconfig                     |    2 +-
 arch/arm64/configs/defconfig                       |    2 +-
 drivers/clocksource/timer-stm32-lp.c               |   61 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |   16 +-
 drivers/firmware/samsung/exynos-acpm.c             |   58 +-
 drivers/gpio/Kconfig                               |   13 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-max77759.c                       |  530 ++++++++
 drivers/mfd/88pm886.c                              |   14 +-
 drivers/mfd/Kconfig                                |   55 +-
 drivers/mfd/Makefile                               |    6 +-
 drivers/mfd/aat2870-core.c                         |    4 +-
 drivers/mfd/as3722.c                               |    4 +-
 drivers/mfd/bcm590xx.c                             |   66 +-
 drivers/mfd/exynos-lpass.c                         |   31 +-
 drivers/mfd/max14577.c                             |    1 +
 drivers/mfd/max77541.c                             |    2 +-
 drivers/mfd/max77705.c                             |    4 +-
 drivers/mfd/max77759.c                             |  690 +++++++++++
 drivers/mfd/max8925-i2c.c                          |    1 +
 drivers/mfd/rohm-bd96801.c                         |  565 +++++++--
 drivers/mfd/rt5033.c                               |    6 +-
 drivers/mfd/sec-acpm.c                             |  442 +++++++
 drivers/mfd/sec-common.c                           |  301 +++++
 drivers/mfd/sec-core.c                             |  481 --------
 drivers/mfd/sec-core.h                             |   23 +
 drivers/mfd/sec-i2c.c                              |  239 ++++
 drivers/mfd/sec-irq.c                              |  460 +++----
 drivers/mfd/sm501.c                                |   50 +-
 drivers/mfd/sprd-sc27xx-spi.c                      |    5 +-
 drivers/mfd/stm32-lptimer.c                        |   33 +-
 drivers/mfd/stmpe-spi.c                            |    2 +-
 drivers/mfd/tps65010.c                             |    9 +-
 drivers/mfd/ucb1x00-core.c                         |    7 +-
 drivers/nvmem/Kconfig                              |   12 +
 drivers/nvmem/Makefile                             |    2 +
 drivers/nvmem/max77759-nvmem.c                     |  145 +++
 drivers/pwm/pwm-stm32-lp.c                         |  219 +++-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 drivers/regulator/bd96801-regulator.c              |  455 ++++++-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |    6 +-
 include/linux/mfd/aat2870.h                        |    3 -
 include/linux/mfd/bcm590xx.h                       |   28 +-
 include/linux/mfd/max14577-private.h               |    2 +-
 include/linux/mfd/max14577.h                       |    2 +-
 include/linux/mfd/max77686-private.h               |    2 +-
 include/linux/mfd/max77686.h                       |    2 +-
 include/linux/mfd/max77693-private.h               |    2 +-
 include/linux/mfd/max77693.h                       |    2 +-
 include/linux/mfd/max77759.h                       |  165 +++
 include/linux/mfd/max8997-private.h                |    2 +-
 include/linux/mfd/max8997.h                        |    2 +-
 include/linux/mfd/max8998-private.h                |    2 +-
 include/linux/mfd/max8998.h                        |    2 +-
 include/linux/mfd/rohm-bd96801.h                   |    2 +
 include/linux/mfd/rohm-bd96802.h                   |   74 ++
 include/linux/mfd/rohm-generic.h                   |    3 +
 include/linux/mfd/samsung/core.h                   |    7 +-
 include/linux/mfd/samsung/irq.h                    |  103 ++
 include/linux/mfd/samsung/rtc.h                    |   37 +
 include/linux/mfd/samsung/s2mpg10.h                |  454 +++++++
 include/linux/mfd/stm32-lptimer.h                  |   37 +-
 include/linux/sm501.h                              |    3 -
 89 files changed, 6765 insertions(+), 1713 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/atmel,sama5d2-secumod.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/maxim,max77759-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm59056.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77759.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96802-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/nvmem/maxim,max77759-nvmem.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/brcm,bcm59056.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96802-regulator.yaml
 create mode 100644 drivers/gpio/gpio-max77759.c
 create mode 100644 drivers/mfd/max77759.c
 create mode 100644 drivers/mfd/sec-acpm.c
 create mode 100644 drivers/mfd/sec-common.c
 delete mode 100644 drivers/mfd/sec-core.c
 create mode 100644 drivers/mfd/sec-core.h
 create mode 100644 drivers/mfd/sec-i2c.c
 create mode 100644 drivers/nvmem/max77759-nvmem.c
 create mode 100644 include/linux/mfd/max77759.h
 create mode 100644 include/linux/mfd/rohm-bd96802.h
 create mode 100644 include/linux/mfd/samsung/s2mpg10.h

-- 
Lee Jones [李琼斯]
