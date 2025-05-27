Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816FC254873
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345640; cv=none; b=ud9zbvtQRz2uQwG1S2HGWhTG9PMaJI8UriKYSLagoWfbinhCvQYf3YMeJ1XGMp7eNsz5iazliw+uLRQFfEeqCJwJUj/Yj5It1pmkJGcFa+RK41MYCk0EAGgGlb6jLqS4q9Sh9ItvC7JL9Y7bq9ggyOsCIm8FR88dA9Ht5wUcljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345640; c=relaxed/simple;
	bh=oQLylIB5/Zx9OqpGDEthpouOejbb8KQSj9MfZ///Rj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adqml7+utAr/THerZQ2zDpsPxEjZhTeyJnZjKcnmUT2Kz4NtuUH2aC6aYhodCKco9Wc5pFN20ZG3OpV6RI3veEOgTjDxl7EqEmglYtDJEu1PMZ+jHkiPFh18yU3veENDcNakbSxVAMtZO/k2HpnLmBZYQvP71iB7Rtd3+kn08+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GscrXgiU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GscrXgiU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54acc0cd458so4086810e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748345634; x=1748950434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6lyY7nyREw3qd9YfooaqBrddgeaL70rRAfHZFjJ1x0=;
        b=GscrXgiU6CcMveHNJhYI+oA9CqS8V8aFm0aHWU3mdkvNNXzPsK7c0djEORlGeocRGe
         VOot5Gmlo7wz7jLSQSrSl8+7YEHNh9mwjsPUptO4gxg+xr6YIc7RJqaidBMxXZqBESzl
         cvSVwT0/mP9kYcfHgH48adqR+kTeX1NDi/GmwlSnSvIyjBSjSfE9mS/MW0BVbaZGqOcv
         8Wl6LzSFiA1ql+tbsJ86fKMzZhCDBt9vLS+ZZhF55vfEybg5Sk1wrqGb0RcMYM3BaQCj
         Sj+tD1RKfbl3H0TvD8LFNbgydjmnWVWsljl0oCasLttervxCUGt+yg4u46ghG5rOC6C5
         cOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345634; x=1748950434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6lyY7nyREw3qd9YfooaqBrddgeaL70rRAfHZFjJ1x0=;
        b=OLCXv3JK7o7N75fjBf+gYDrfxp27waFSTe9yv9bXUDWdOPIniyebKb/L33wCBHdKXm
         vc4gdVal4Bv8y4+n2gmv81722qvMYK8IFbDq/yNtdkrAtwAM8FysqmYSm6wo/TfTteew
         EmShnfk+La4OV794A606VKvYmvbqdAGMVnoxCoBcjDLqzYuqSgzgaWy01LpVyWOTIyif
         pQ+dM/hA1EfgjN+6k0ffBJPW0kHlK+7ANYsjIgZBnJ+zth69KCMXHojU9TsiA7bC2HRh
         uX4SlJRET8jc1ioJt8r7JzXc0IVLikDS58vNnZdoVS6+1hCBk33c8zm1lniaw74tGUSb
         iKgA==
X-Forwarded-Encrypted: i=1; AJvYcCW+jhaRif7HX6tNUaPPBYYGlrdwotjk6N/38KTXiiG9lnIBsR/hg8cMwkPZmiurICimirp5kipH2CZjts8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY397eH4IR3B9Yw/t8D9DEsEjvmA88wry86hcWjGr0PZxkFjwm
	2Z8ywH8K0l/cm0YbEzJw/jEmDAJoGNdqHNVPfLtLRfo0JKiBSByeRMTZArVvscJ0udo=
X-Gm-Gg: ASbGncu1hbKsUae4mNYsmoiCOKgbpfuiSttyEtMHjUB481bVqjAfSpLU+W1kjbm1b12
	KhS0LPDUztFIC0uLaCjTN+6gG66VWKo4jdSWe7UNJSm85ecrXcmDuNNHUVng+cfjSUtJbwqUN6P
	AzO9uY26vkY8NtY0L07a/omNsfMwHabT7cOyhOj7R5KxmlgDlJR1vpiVs1WwW2IGtwe95Avj+Ze
	fPOHKyovqpvhkpxFbwyoPygWi25r9tNRTBFNkUJyx4HE0aDzs5jiV+pQyHNvdhCeStXlERaQbP2
	It4sXqbKWDz9D0860R+9LmNVbT5APimM62lhYTP431qrJLeJNyMtAGaGZ8AtURPdwssTjEdLLuO
	S0VwNBMcPB8lWOGHTiZdenOgHkP8C7UahK/Mf
X-Google-Smtp-Source: AGHT+IF0nBwBvdQzu9cVRbS4xjtiU7vGO2S88RHYgOu50vCy4TlhvKYcZ3prhOArM0GzRSHi26+tgg==
X-Received: by 2002:a05:6512:3e04:b0:54f:c101:4c04 with SMTP id 2adb3069b0e04-5521c7c47a2mr3655383e87.46.1748345634469;
        Tue, 27 May 2025 04:33:54 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532c46a247sm89799e87.259.2025.05.27.04.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:33:54 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] MMC updates for v6.16
Date: Tue, 27 May 2025 13:33:53 +0200
Message-ID: <20250527113353.209435-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's the pull-request with updates for MMC for v6.16. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 71c9475b1e2cc4d31370b1b7a328bdfeea5d53b4:

  mmc: sdhci_am654: Add SDHCI_QUIRK2_SUPPRESS_V1P8_ENA quirk to am62 compatible (2025-05-19 14:26:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git tags/mmc-v6.16

for you to fetch changes up to d2c6acff6386f43ed307822454b970c831c48f1b:

  dt-bindings: mmc: sdhci-of-dwcmhsc: Allow use of a power-domain (2025-05-22 23:33:24 +0200)

----------------------------------------------------------------
MMC core:
 - Scan the eMMC boot areas for partition table
 - Clarify purpose of mmc_can* functions by renaming them to mmc_card_can*
 - Clarify helpers for host capabilities by renaming them to mmc_host_can*
 - Add support for graceful host removal for SD and eMMC
 - Further avoid re-storing power to the eMMC before a shutdown
 - Add quirk to disable DDR50 tuning and use it for some Swissbit SD-cards

MMC host:
 - mtk-sd: Add support for Dimensity 1200 MT6893
 - mtk-sd: Fix condition to enable single burst type
 - mtk-sd: Optimize several code-paths by aggregating register-writes
 - renesas_sdhi: Add support for the Renesas RZ/V2N variant
 - sdhci-msm: Add support for the SM7150 variant
 - sdhci-esdhc-imx: Re-factor the system PM logic
 - sdhci-esdhc-imx: Lots of improvements around the tuning support
 - sdhci-of-arasan: Add support for the Renesas RZ/N1D variant
 - sdhci-of-dwcmhsc: Add Sophgo SG2044 support
 - sdhci-of-esdhc: Add support for the LS1021a variant
 - sdhci-of-k1: Add new driver to support for SpacemiT K1 controller
 - sdhci-pic32: Convert microchip,sdhci-pic32 DT doc to json schema
 - wmt-sdmmc: Convert DT doc to json schema

----------------------------------------------------------------
Alexey Charkov (1):
      dt-bindings: mmc: vt8500-sdmmc: Convert to YAML

AngeloGioacchino Del Regno (5):
      mmc: mtk-sd: Clarify patch bit register initialization and layout
      mmc: mtk-sd: Aggregate writes for MSDC_PATCH_BIT1/2 setup
      mmc: mtk-sd: Do single write in function msdc_new_tx_setting
      mmc: mtk-sd: Aggregate R/W for top_base iospace case where possible
      dt-bindings: mmc: mtk-sd: Add support for Dimensity 1200 MT6893

Axe Yang (1):
      mmc: mtk-sd: Add condition to enable 'single' burst type

Biju Das (1):
      mmc: renesas_sdhi: Use of_get_available_child_by_name()

Charan Pedumuru (1):
      dt-binding: mmc: microchip,sdhci-pic32: convert text based binding to json schema

Danila Tikhonov (1):
      dt-bindings: mmc: sdhci-msm: Add the SM7150 compatible

Erick Shepherd (1):
      mmc: Add quirk to disable DDR50 tuning

Feng Wei (1):
      mmc: alcor: Use str_read_write() helper

Frank Li (1):
      dt-bindings: mmc: fsl,esdhc: add compatible string fsl,ls1021a-esdhc

Haibo Chen (5):
      mmc: sdhci-esdhc-imx: explicitly reset tuning circuit via RSTT bit
      mmc: sdhci-esdhc-imx: reset async FIFO before sending manual tuning command
      mmc: sdhci-esdhc-imx: widen auto-tuning window for standard tuning
      mmc: sdhci-esdhc-imx: widen auto-tuning window for manual tuning
      mmc: sdhci-esdhc-imx: fix few build warnings

Inochi Amaoto (1):
      dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support

Jonas Karlman (1):
      dt-bindings: mmc: sdhci-of-dwcmhsc: Allow use of a power-domain

Lad Prabhakar (1):
      dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support

Loic Poulain (1):
      mmc: core: Scan the eMMC boot areas for partition table

Luke Wang (6):
      mmc: sdhci-esdhc-imx: Save tuning value when card stays powered in suspend
      mmc: sdhci-esdhc-imx: calculate data timeout value based on clock
      mmc: sdhci-esdhc-imx: verify tuning control status after configuration
      mmc: sdhci-esdhc-imx: switch standard tuning to manual tuning
      mmc: sdhci: export APIs for sdhci irq wakeup
      mmc: host: sdhci-esdhc-imx: refactor the system PM logic

Philipp Stanner (1):
      mmc: cavium-thunderx: Use non-hybrid PCI devres API

Randy Dunlap (1):
      mmc: sdhci-esdhc-imx: fix defined but not used warnings

Rob Herring (Arm) (4):
      dt-bindings: mmc: Remove redundant sdhci.txt
      dt-bindings: mmc: marvell,xenon-sdhci: Allow "dma-coherent" and "iommus"
      dt-bindings: mmc: marvell,xenon-sdhci: Add reference to sdhci-common.yaml
      dt-bindings: mmc: marvell,xenon-sdhci: Drop requiring 2 clocks

Ulf Hansson (7):
      mmc: core: Convert mmc_can_poweroff_notify() into a bool
      mmc: core: Further avoid re-storing power to the eMMC before a shutdown
      mmc: core: Convert into an enum for the poweroff-type for eMMC
      mmc: core: Add support for graceful host removal for eMMC
      mmc: core: Add support for graceful host removal for SD
      mmc: Merge branch fixes into next
      mmc: Merge branch fixes into next

Wolfram Sang (17):
      mmc: renesas_sdhi: improve registering irqs
      dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
      mmc: rename mmc_can_discard() to mmc_card_can_discard()
      mmc: rename mmc_can_erase() to mmc_card_can_erase()
      mmc: rename mmc_can_ext_csd() to mmc_card_can_ext_csd()
      mmc: rename mmc_can_poweroff_notify() to mmc_card_can_poweroff_notify()
      mmc: rename mmc_can_reset() to mmc_card_can_reset()
      mmc: rename mmc_can_sanitize() to mmc_card_can_sanitize()
      mmc: rename mmc_can_secure_erase_trim() to mmc_card_can_secure_erase_trim()
      mmc: rename mmc_can_sleep() to mmc_card_can_sleep()
      mmc: rename mmc_can_trim() to mmc_card_can_trim()
      mmc: rename mmc_can_gpio_cd() to mmc_host_can_gpio_cd()
      mmc: rename mmc_can_gpio_ro() to mmc_host_can_gpio_ro()
      mmc: rename mmc_host_cmd23() to mmc_host_can_cmd23()
      mmc: rename mmc_host_done_complete() to mmc_host_can_done_complete()
      mmc: rename mmc_host_uhs() to mmc_host_can_uhs()
      mmc: rename mmc_boot_partition_access() to mmc_host_can_access_boot()

Yixun Lan (2):
      dt-bindings: mmc: spacemit,sdhci: add support for K1 SoC
      mmc: sdhci-of-k1: add support for SpacemiT K1 SoC

Yumeng Fang (1):
      mmc: bcm2835: Use str_read_write() helper

 .../devicetree/bindings/mmc/arasan,sdhci.yaml      |  22 +-
 .../devicetree/bindings/mmc/fsl,esdhc.yaml         |   1 +
 .../bindings/mmc/marvell,xenon-sdhci.yaml          |  27 +-
 .../bindings/mmc/microchip,sdhci-pic32.txt         |  29 --
 .../bindings/mmc/microchip,sdhci-pic32.yaml        |  66 +++++
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml  |   2 +
 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |   4 +-
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |   1 +
 Documentation/devicetree/bindings/mmc/sdhci.txt    |  13 -
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml           |   7 +-
 .../devicetree/bindings/mmc/spacemit,sdhci.yaml    |  53 ++++
 .../devicetree/bindings/mmc/vt8500-sdmmc.txt       |  23 --
 .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    |  66 +++++
 drivers/mmc/core/block.c                           |  16 +-
 drivers/mmc/core/card.h                            |   6 +
 drivers/mmc/core/core.c                            |  48 ++--
 drivers/mmc/core/core.h                            |  10 +-
 drivers/mmc/core/host.h                            |   8 +-
 drivers/mmc/core/mmc.c                             | 103 ++++---
 drivers/mmc/core/mmc_ops.c                         |   6 +-
 drivers/mmc/core/mmc_ops.h                         |   2 +-
 drivers/mmc/core/mmc_test.c                        |  16 +-
 drivers/mmc/core/queue.c                           |   6 +-
 drivers/mmc/core/quirks.h                          |  10 +
 drivers/mmc/core/sd.c                              |  65 +++--
 drivers/mmc/core/sdio.c                            |   6 +-
 drivers/mmc/core/slot-gpio.c                       |   8 +-
 drivers/mmc/host/Kconfig                           |  14 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/alcor.c                           |   3 +-
 drivers/mmc/host/bcm2835.c                         |   8 +-
 drivers/mmc/host/cavium-thunderx.c                 |   4 +-
 drivers/mmc/host/dw_mmc.c                          |   6 +-
 drivers/mmc/host/mtk-sd.c                          | 219 +++++++++------
 drivers/mmc/host/renesas_sdhi_core.c               |  20 +-
 drivers/mmc/host/sdhci-esdhc-imx.c                 | 243 +++++++++++++---
 drivers/mmc/host/sdhci-of-k1.c                     | 304 +++++++++++++++++++++
 drivers/mmc/host/sdhci-omap.c                      |   2 +-
 drivers/mmc/host/sdhci.c                           |  12 +-
 drivers/mmc/host/sdhci.h                           |   2 +
 drivers/mmc/host/sunplus-mmc.c                     |   2 +-
 drivers/mmc/host/tmio_mmc_core.c                   |   6 +-
 include/linux/mmc/card.h                           |   1 +
 include/linux/mmc/slot-gpio.h                      |   4 +-
 44 files changed, 1095 insertions(+), 380 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/microchip,sdhci-pic32.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/vt8500-sdmmc.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/wm,wm8505-sdhc.yaml
 create mode 100644 drivers/mmc/host/sdhci-of-k1.c
