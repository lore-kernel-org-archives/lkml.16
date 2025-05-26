Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7551117A314
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748255412; cv=none; b=V6XjFoTEcHYbaYONbjdwnIiWWqXUZbcf4SRkXkIGc6rDtFP36X/L/GKfQQIjl17BKUTSamZGOQtEQuA8KaAV4IzmsrwJQnOtJpYmokyxs21Usx/ks9vQtmXCMOv669CR7pr/jDJ6ldoLeNYlYpPQ/nS7d1cmgTfTWB0PZCRl57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748255412; c=relaxed/simple;
	bh=fWTY213nLRSJPT439AosWNfGaJCP8WD9WiZoyY7cZDs=;
	h=Message-ID:From:To:Cc:Subject:Date; b=JVeau8DLMQ258sk1ioYTVVvlHsm07tyOMgUpscROWjWsm8+uNuhyBIIGTWMLVik/S95Cdbm2z5rTfnyicwt98BGsZB7mC/nMZTDR6+dcTALH50X4jV+YIyl07j/iaz/+eUooCfNgZTUv+n4zpHc87NZ4ZM4EPZiNfRwp0eymCy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3EpbQNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3EpbQNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B250C4CEEF;
	Mon, 26 May 2025 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748255411;
	bh=fWTY213nLRSJPT439AosWNfGaJCP8WD9WiZoyY7cZDs=;
	h=From:To:Cc:Subject:Date:From;
	b=s3EpbQNNcEXubGy4dw+PCRHk128SL9IC+XZxkHrj5r7pnAsWV/n8qIELW4xHKE55S
	 A+nItc3Z/JIRrfO95i8R1XWJHB6cvA5F2YmcQ7yi/CYQNDnbLd2YEJYpc5PtGbiWIe
	 myXENye1CWpDQWqkq1jWDegLZY+pF/9T5eaBTyyRU4htDdskLosjyWvRCD2GDIRlRS
	 tayME6GNak1qHgqNOzsrKlla+Pfni1bTloMO0tKZG4o5BbjBoVlq07c7K84vEcGQZ7
	 FWUsqfVr4ZuSEya9ciIwG2WqONU6g8nW2qcd+GuYZb7vC8PsidBPICQsrj1FVupj8A
	 /PYLV+Z88Az8w==
Message-ID: <aee0fa6dade74217ddb19cabebbc8d75.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator updates for v6.16
Date: Mon, 26 May 2025 11:30:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-v6.16

for you to fetch changes up to dcd711021389c4d19b3310cc37f09813659dfee2:

  fix: Correct Samsung 'Electronics' spelling in (2025-05-20 10:34:15 +0100)

----------------------------------------------------------------
regulator: Updates for v6.16

This is a very quiet release, there was no work on the core and a good
chunk of the updates were the result of conversions to use newer GPIO
APIs.  We did gain support for Analog ADP5055 and TI TPS65214 devices,
and there's a new restart handler for the PCA9450 which allows devices
using it to be properly power cycled on reboot, but otherwise it's minor
fixes and API updates.

----------------------------------------------------------------
Alexis Czezar Torreno (2):
      regulator: dt-bindings: adi,adp5055-regulator: Add adp5055 support
      regulator: adp5055: Add driver for adp5055

Arnd Bergmann (1):
      regulator: adp5055: remove duplicate device table

Bartosz Golaszewski (6):
      regulator: rpi-panel-attiny: don't double-check GPIO range
      regulator: rpi-panel-attiny: use devres for mutex management
      regulator: rpi-panel-attiny: use lock guards for the state mutex
      regulator: rpi-panel-attiny: use new GPIO line value setter callbacks
      gpio: provide gpiod_is_equal()
      regulator: don't compare raw GPIO descriptor pointers

Bo Liu (1):
      regulator: pf9453: convert to use maple tree register cache

Chen Ni (1):
      regulator: adp5055: Remove unneeded semicolon

Christophe JAILLET (1):
      regulator: qcom_spmi: Constify struct spmi_voltage_range

João Paulo Gonçalves (2):
      regulator: max20086: Fix MAX200086 chip id
      regulator: max20086: Change enable gpio to optional

Krzysztof Kozlowski (1):
      regulator: da9121: Fix Wvoid-pointer-to-enum-cast warning

Mark Brown (6):
      regulator: s5m8767: Convert to GPIO descriptors
      regulator: rpi-panel-attiny: use new GPIO line value
      gpio: don't compare raw GPIO descriptor pointers
      Add support for ADP5055 triple buck regulator.
      regulator: max20086: Fixes chip id and enable gpio
      fix: Correct Samsung 'Electronics' spelling in

Nishanth Menon (1):
      regulator: gpio: Use dev_err_probe

Nícolas F. R. A. Prado (1):
      regulator: dt-bindings: mt6357: Drop fixed compatible requirement

Paul Geurts (1):
      regulator: pca9450: Add restart handler

Peng Fan (2):
      gpiolib: of: Add polarity quirk for s5m8767
      regulator: s5m8767: Convert to GPIO descriptors

Shree Ramamoorthy (4):
      regulator: tps65219: Update struct names
      regulator: tps65219: Add support for TPS65215 regulator resources
      regulator: tps65219: Add support for TPS65215 Regulator IRQs
      regulator: tps65219: Add TI TPS65214 Regulator Support

Sumanth Gavini (1):
      regulator: max8952: Correct Samsung "Electronics" spelling in copyright headers

Yang Li (1):
      regulator: pf9453: Improve documentation for pf9453_regulator_set_ramp_delay_regmap

 .../bindings/regulator/adi,adp5055-regulator.yaml  | 157 ++++++++
 .../regulator/mediatek,mt6357-regulator.yaml       |  12 +-
 MAINTAINERS                                        |   7 +
 drivers/gpio/gpiolib-of.c                          |   9 +
 drivers/gpio/gpiolib.c                             |  14 +
 drivers/regulator/Kconfig                          |  23 +-
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/adp5055-regulator.c              | 424 +++++++++++++++++++++
 drivers/regulator/core.c                           |   2 +-
 drivers/regulator/da9121-regulator.c               |   2 +-
 drivers/regulator/gpio-regulator.c                 |  10 +-
 drivers/regulator/max20086-regulator.c             |   4 +-
 drivers/regulator/pca9450-regulator.c              |  27 ++
 drivers/regulator/pf9453-regulator.c               |   3 +-
 drivers/regulator/qcom_spmi-regulator.c            |  69 ++--
 drivers/regulator/rpi-panel-attiny-regulator.c     |  83 ++--
 drivers/regulator/s5m8767.c                        | 146 ++-----
 drivers/regulator/tps65219-regulator.c             | 242 +++++++++---
 include/linux/gpio/consumer.h                      |   9 +
 include/linux/regulator/max8952.h                  |   2 +-
 include/linux/regulator/pca9450.h                  |   5 +
 21 files changed, 977 insertions(+), 274 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/adi,adp5055-regulator.yaml
 create mode 100644 drivers/regulator/adp5055-regulator.c
