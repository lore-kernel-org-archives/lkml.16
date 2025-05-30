Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634D22D782
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616710; cv=none; b=o8+F77XXnmUvCKyHdpS7oBuOeO5CfZjv15/7CynWjQCuN2teQoMhuTS25p1/V0sLsFIByjYgzDTdFysJB09hkRd0kxEjeQxCFv+7BGe5muuv/DTR/k7i0gEq00QxtxceElcDI0BYxEo4sCplrfS6JDWM4/vjg72tmrloKieZR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616710; c=relaxed/simple;
	bh=Pozm0+L2zpnMRJcn3ae1TKMn6c26AOXd81hAFxL9Pgw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VYcNfSmKRPBqikZdtTNJDmvshJErUe1yJPOREmMG2pqlF3PnllAf31cD+mes+VTZJv1Z7ilR9vijXClbQ1hzwSZxKN5wKZfO0eoQJp1dR5cZ5UWUc8kWS+WeRR8bzl8V9gSMxGGyyCVbIkNI8MumjKTXouG5sSAdHo3lflQgFpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5rxh+P6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5rxh+P6"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55324062ea8so2992812e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748616706; x=1749221506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ELdomJwnFSi74XtzdJRNt2bPgN9Fuu9BPaxW5bQWlGw=;
        b=o5rxh+P6rsBf+aC47ECf4XAsWIX3PW62QnAe5+G3S6ZUUK/oz3rCC7Z5QWZuI4SM6L
         QlhfAVjeMQMlVn+ym1ejJWPcMEo9gKYy/lpeIk8NEc9PTI1+QkWLi8wY/jIvCKWuBLPO
         WUvg+KwCcv6KnErEv0CRkv1VbftDYCp5xP+INIKsjHQqc+FORsanliFgeEmpQjD01lo0
         3Evzf4QixtZj0BTrKN5ofQ69X6p/nwjmnnvpq1iFt5u7FNRP6cZYB8gZ23JaTv4ZXLGE
         djOCDQDbLx8A+D+OUPAzHuc07sTEdph3b4eh5ISZYp6CVG6XSOuHjrefpeNb7JEy/8O1
         B+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616706; x=1749221506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELdomJwnFSi74XtzdJRNt2bPgN9Fuu9BPaxW5bQWlGw=;
        b=lU0uZ9zZjPEq8PdLmb88m9DRORG+YM7JbbghiADJQGmmTRxn2d8tn5Pbmr0JSFBCqn
         CIMUWWu6hm29L2YZepyNJoVIsc07VAvFHQy9rMPvWlxd+F9Eat3f7bgeTH6eCzlKMPbL
         tQ+5tDrQ+aPvcvIDZIoDua6kUXh5a84FrWlCwMP0qEPyNR8jgT++MdZJWqVms54CQisD
         Ztxd+pw0PD/zj7aN2Qa8sTwOrtCTaPbSn9Bn2uU+i4F28W2grWRRbKAfOBYC/rbI0PpH
         E4Pjq+CHTINMsKvOEHTpOCzH3uo+yLcFRfaxjkX2b/b5aSMC4J7svi62LUE+Ap/FvcKp
         LxGA==
X-Gm-Message-State: AOJu0YxicDb5/2pPQNx1BtsCoJlRc8WCh8fQbta3+ZZh9Ag+61RVIjaL
	pVFp10LzwNkNd8qC9dTIYdpbimaNVLVqDGSKsfMak0aXssKMOCR9bsrWjnvA8Uym0IGOq5Vp198
	Y/Prrl8QF8UQwyw6dkpUe8h+D/HyB5dmOJy58Q7Z2P116bzhKGNZffrk=
X-Gm-Gg: ASbGncu3ziZHVxcp1l3zlAG/2/oZPsgq+yIvuMWl6bU0BUaV+EC55kjiKhzn9UPgPzM
	AB535C/LmHSdHk9iy4i78tsJvzP33bDlRmRlaiOyGg4Nahp62Ak7IJbLKCzUfzIzq+zP7S8y6V2
	RYrjrIz8MY+L50UYr0CkfRgFl5BsbUKEr1
X-Google-Smtp-Source: AGHT+IE2wlcRsnSsyhlqlqS8glWDiRgfTyNoYraVlywZO6logkB7bDz/n+CgBBj8G0d3nwMdUWvOc69Flo17s1PmOfk=
X-Received: by 2002:a05:6512:3084:b0:553:2c58:f971 with SMTP id
 2adb3069b0e04-5533b9079ffmr1376108e87.33.1748616705699; Fri, 30 May 2025
 07:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 May 2025 16:51:33 +0200
X-Gm-Features: AX0GCFu2pgXaj3hqiaBLtxdsZ5EhwHTNkd59xBCUC28P10mZZhYx0xFi8iSjy84
Message-ID: <CACRpkdYuGv=mQJB+i_1itMCdeSYHVj4bcxrbVL1z=uJCEci8OQ@mail.gmail.com>
Subject: [GIT PULL] pin control changes for the v6.16 kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

this is the bulk of pin control changes for the v6.16 kernel cycle.

An especially linear and sparse improvement and new drivers
release. Nothing exciting. The biggest change in Bartosz changes
to make gpiochip set/get calls return error codes. (Something we
should have fixed ages ago but is now finally getting fixed.)

Please pull it in! Details in the signed tag.

Yours,
Linus Walleij

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8=
:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.16-1

for you to fetch changes up to 08dcbe30be481bc66eb5ee1e82a577d64e451612:

  pinctrl: freescale: Add support for imx943 pinctrl (2025-05-21 10:12:14 +=
0200)

----------------------------------------------------------------
Pin control bulk changes for v6.16:

Core changes:

- Add the devres devm_pinctrl_register_mappings() call that can
  register some pin control machine mappings and have them go away
  with the associated device.

New drivers:

- Support for the Mediatek MT6893 and MT8196 SoCs.

- Support for the Renesas RZ/V2N SoC.

- Support for the NXP Freescale i.MX943 SoC.

Improvements:

- Per-SoC suspend/resume callbacks in the Samsung drivers.

- Set all pins as input (High-Z) at probe in the MCP23S08 driver.

- Switch most GPIO chips to use the setters/getters with a return
  value.

- EGPIO support in the Qualcomm QCM2290 driver.

- Fix up the number of available GPIO lines in Qualcomm QCS8300
  and QCS615.

----------------------------------------------------------------
Alexander Stein (2):
      pinctrl: freescale: Depend imx-scu driver on OF
      pinctrl: freescale: Enable driver if platform is enabled.

Andy Shevchenko (1):
      pinctrl: at91: Fix possible out-of-boundary access

AngeloGioacchino Del Regno (2):
      dt-bindings: pinctrl: mediatek: Add support for MT6893
      pinctrl: mediatek: Add pinctrl driver for MT6893 Dimensity 1200

Bartosz Golaszewski (37):
      pinctrl: at91-pio4: use new GPIO line value setter callbacks
      pinctrl: rk805: use new GPIO line value setter callbacks
      pinctrl: abx500: enable building modules with COMPILE_TEST=3Dy
      pinctrl: abx500: use new GPIO line value setter callbacks
      pinctrl: meson: use new GPIO line value setter callbacks
      pinctrl: amlogic-a4: use new GPIO line value setter callbacks
      pinctrl: sx150x: use new GPIO line value setter callbacks
      pinctrl: ocelot: use new GPIO line value setter callbacks
      pinctrl: cy8c95x0: use new GPIO line value setter callbacks
      pinctrl: qcom: lpass-lpi: use new GPIO line value setter callbacks
      pinctrl: qcom: msm: use new GPIO line value setter callbacks
      pinctrl: qcom: spmi-gpio: use new GPIO line value setter callbacks
      pinctrl: qcom: spmi-mpp: use new GPIO line value setter callbacks
      pinctrl: qcom: ssbi-gpio: use new GPIO line value setter callbacks
      pinctrl: qcom: ssbi-mpp: use new GPIO line value setter callbacks
      pinctrl: amd: use new GPIO line value setter callbacks
      pinctrl: axp209: use new GPIO line value setter callbacks
      pinctrl: stmfx: use new GPIO line value setter callbacks
      pinctrl: owl: use new GPIO line value setter callbacks
      pinctrl: stm32: use new GPIO line value setter callbacks
      pinctrl: ingenic: use new GPIO line value setter callbacks
      pinctrl: microchip-sgpio: use new GPIO line value setter callbacks
      pinctrl: at91: allow building the module with COMPILE_TEST=3Dy
      pinctrl: at91: use new GPIO line value setter callbacks
      pinctrl: armada-37xx: use new GPIO line value setter callbacks
      pinctrl: pistachio: use new GPIO line value setter callbacks
      pinctrl: samsung: use new GPIO line value setter callbacks
      pinctrl: at91: drop unneeded dependency on OF_GPIO
      pinctrl: mediatek: airoha: use new GPIO line value setter callbacks
      pinctrl: mediatek: paris: don't double-check the GPIO number
      pinctrl: mediatek: paris: use new GPIO line value setter callbacks
      pinctrl: mediatek: moore: use new GPIO line value setter callbacks
      pinctrl: mediatek: common: use new GPIO line value setter callbacks
      pinctrl: bcm: nsp-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm: iproc-gpio: use new GPIO line value setter callbacks
      pinctrl: bcm2835: use new GPIO line value setter callbacks
      pinctrl: add stubs for OF-specific pinconf functions

Cathy Xu (1):
      dt-bindings: pinctrl: mediatek: Add support for mt8196

Charles Han (1):
      pinctrl: qcom: tlmm-test: Fix potential null dereference in tlmm
kunit test

Frank Li (2):
      dt-bindings: pinctrl: convert fsl,vf610-pinctrl.txt to yaml format
      dt-bindings: pinctrl: convert fsl,imx7ulp-pinctrl.txt to yaml format

Gabor Juhos (7):
      pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
      pinctrl: armada-37xx: set GPIO output value before setting direction
      pinctrl: armada-37xx: propagate error from
armada_37xx_gpio_direction_output()
      pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
      pinctrl: armada-37xx: propagate error from
armada_37xx_pmx_gpio_set_direction()
      pinctrl: armada-37xx: propagate error from
armada_37xx_gpio_get_direction()
      pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_nam=
e()

Guodong Liu (1):
      pinctrl: mediatek: Add pinctrl driver on mt8196

Hao Chang (2):
      pinctrl: mediatek: Fix the invalid conditions
      pinctrl: mediatek: pinctrl: mediatek: add mt8196 eint pin

Jacky Bai (1):
      pinctrl: freescale: Add support for imx943 pinctrl

John Madieu (1):
      pinctrl: apple: Make regmap_config static const and fix indentation

Krzysztof Kozlowski (5):
      pinctrl: meson: Do not enable by default during compile testing
      pinctrl: uniphier: Do not enable by default during compile testing
      dt-bindings: pinctrl: mediatek: Drop unrelated nodes from DTS example
      dt-bindings: pinctrl: mediatek: Correct indentation and style in
DTS example
      pinctrl: meson: Drop unused aml_pctl_find_group_by_name()

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC

Lijuan Gao (4):
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs61=
5
      dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs83=
00
      pinctrl: qcom: correct the ngpios entry for QCS615
      pinctrl: qcom: correct the ngpios entry for QCS8300

Linus Walleij (4):
      pinctr: nomadik: abx500: Restrict compile test
      Merge tag 'renesas-pinctrl-for-v6.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers
into devel
      Merge tag 'samsung-pinctrl-6.16' of
https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung into
devel
      Merge branch 'ib-armada-for-v6.16' into devel

Mike Looijmans (1):
      pinctrl: mcp23s08: Reset all pins to input at probe

N=C3=ADcolas F. R. A. Prado (1):
      pinctrl: mediatek: eint: Fix invalid pointer dereference for v1 platf=
orms

Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs10=
1

Thomas Richard (2):
      pinctrl: remove extern specifier for functions in machine.h
      pinctrl: core: add devm_pinctrl_register_mappings()

Wentao Liang (1):
      pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()

Wojciech Slenska (1):
      pinctrl: qcom: pinctrl-qcm2290: Add egpio support

Xianwei Zhao (1):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5

Yixun Lan (2):
      dt-bindings: pinctrl: spacemit: add clock and reset property
      pinctrl: spacemit: add clock support for K1 SoC

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |    7 +-
 .../bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml      |   99 +
 .../bindings/pinctrl/fsl,imx7ulp-pinctrl.txt       |   53 -
 .../bindings/pinctrl/fsl,vf610-iomuxc.yaml         |   83 +
 .../bindings/pinctrl/fsl,vf610-pinctrl.txt         |   41 -
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml  |   95 +-
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |    5 -
 .../bindings/pinctrl/mediatek,mt6893-pinctrl.yaml  |  193 ++
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml  |   56 +-
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |   70 +-
 .../bindings/pinctrl/mediatek,mt8192-pinctrl.yaml  |   78 +-
 .../bindings/pinctrl/mediatek,mt8196-pinctrl.yaml  |  236 ++
 .../bindings/pinctrl/qcom,qcs615-tlmm.yaml         |    2 +-
 .../bindings/pinctrl/qcom,qcs8300-tlmm.yaml        |    2 +-
 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |   18 +
 drivers/pinctrl/Kconfig                            |    4 +-
 drivers/pinctrl/actions/pinctrl-owl.c              |    8 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              |    9 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           |    6 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c             |    6 +-
 drivers/pinctrl/core.c                             |   29 +
 drivers/pinctrl/freescale/Kconfig                  |   11 +
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c       |    4 +
 drivers/pinctrl/mediatek/Kconfig                   |   22 +
 drivers/pinctrl/mediatek/Makefile                  |    2 +
 drivers/pinctrl/mediatek/mtk-eint.c                |   30 +-
 drivers/pinctrl/mediatek/mtk-eint.h                |    7 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          |   19 +-
 drivers/pinctrl/mediatek/pinctrl-moore.c           |   18 +-
 drivers/pinctrl/mediatek/pinctrl-mt6893.c          |  879 ++++++
 drivers/pinctrl/mediatek/pinctrl-mt8196.c          | 1860 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c   |    9 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c      |   15 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h      | 2283 +++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h      | 3085 ++++++++++++++++=
++++
 drivers/pinctrl/mediatek/pinctrl-paris.c           |   29 +-
 drivers/pinctrl/meson/Kconfig                      |   24 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         |   22 +-
 drivers/pinctrl/meson/pinctrl-meson.c              |    6 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c        |   43 +-
 drivers/pinctrl/nomadik/Kconfig                    |    6 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c           |   12 +-
 drivers/pinctrl/pinconf.h                          |   17 +
 drivers/pinctrl/pinctrl-amd.c                      |    7 +-
 drivers/pinctrl/pinctrl-apple-gpio.c               |   30 +-
 drivers/pinctrl/pinctrl-at91-pio4.c                |   18 +-
 drivers/pinctrl/pinctrl-at91.c                     |   21 +-
 drivers/pinctrl/pinctrl-axp209.c                   |   35 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c                 |   17 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |    8 +-
 drivers/pinctrl/pinctrl-mcp23s08.c                 |    8 +
 drivers/pinctrl/pinctrl-microchip-sgpio.c          |    8 +-
 drivers/pinctrl/pinctrl-ocelot.c                   |   17 +-
 drivers/pinctrl/pinctrl-pistachio.c                |    8 +-
 drivers/pinctrl/pinctrl-rk805.c                    |   26 +-
 drivers/pinctrl/pinctrl-scmi.c                     |    1 +
 drivers/pinctrl/pinctrl-stmfx.c                    |   13 +-
 drivers/pinctrl/pinctrl-sx150x.c                   |   23 +-
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |    6 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c             |   70 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |    2 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |    2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |    6 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c            |    6 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           |    7 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c            |    7 +-
 drivers/pinctrl/qcom/tlmm-test.c                   |    1 +
 drivers/pinctrl/renesas/Kconfig                    |    1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            |  299 +-
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     |   52 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c           |  294 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h           |   28 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   34 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    8 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              |   10 +
 drivers/pinctrl/stm32/pinctrl-stm32.c              |    7 +-
 drivers/pinctrl/uniphier/Kconfig                   |    2 +-
 include/linux/pinctrl/machine.h                    |   19 +-
 79 files changed, 9753 insertions(+), 857 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-iomuxc1.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,imx7ulp-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,vf610-iomuxc.yaml
 delete mode 100644
Documentation/devicetree/bindings/pinctrl/fsl,vf610-pinctrl.txt
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt6893-pinctrl.yaml
 create mode 100644
Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6893.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6893.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
