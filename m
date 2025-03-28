Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ECA49620
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171057; cv=none; b=q2UKSqykoyTWmKUyA4WGrhfmaS5jC2haTrEchn4JHbBhZ47dKF1817QU1uQmmONqMvcw3bll2hhEO3dlqJIgpLHuP7Y3XjUzh+YWD/7H1vHPjgUpB2WMikFOxQSRR2Cz5ZDsyw5cTcrXk3ruiZ4lUVu4RkP7isZBnMoLnTwcHUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171057; c=relaxed/simple;
	bh=fWclp7nJB2VTYDvbnpx4IhPZk05Kk8swRynjIbvzJFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqwfA3QsFZnh9E7H+tedBy7OrXKU8ufRJyGzouF1OP3JentllsGRrs6cLyTVr1vUJG3jWs5Ovty7TLPeUhCZhNtRQlwRe+JuILJojjm0t7Rf6f/9wMQiE75CdwHBVLUyJUGD3ZXWe4OzwNedd+r3z2hZ0JJvGnitOynKXsEFF3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzpWi9af; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzpWi9af"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E99C4CEE5;
	Fri, 28 Mar 2025 14:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743171057;
	bh=fWclp7nJB2VTYDvbnpx4IhPZk05Kk8swRynjIbvzJFM=;
	h=Date:From:To:Cc:Subject:From;
	b=pzpWi9afM4tzbQwGQoFU+Lyizoos/crBtUt0bzNl7pIn91Vl8haYBQDWK4L5q774k
	 X10hKdFW58ZHRzziUs21z0HMOVGSpC+ZhkO6qEF/I+oeN04WRKHRNKJ8+2vVbhbBf7
	 tJP2j2S4bNKTMvzVSBZ2QaZMzErvPK3nZAWP37OyOf7f1ihWg984Yqhnm2Zk6dVTS2
	 Y5vZp5rvGKSmH7U2bgoO0fktIPVhdoiva7QOpItVHDeyKuy/8VKZ9X7S81QPHqK+in
	 0xlUTgT4yOmgTiQZIpWbLkmFZd+9t0Yz4wCUkOqbB3h0hEG8QjEEUCGsweoYltKSwu
	 AlvpNpfmWMhlg==
Date: Fri, 28 Mar 2025 14:10:50 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [GIT PULL] LEDs for v6.15
Message-ID: <20250328141050.GB7190@google.com>
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

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/leds.git tags/leds-next-6.15

for you to fetch changes up to 161e3bea8fa5ba34b2291e5cfeb3e533cf991613:

  leds: nic78bx: Tidy up ACPI ID table (2025-03-21 09:49:37 +0000)

----------------------------------------------------------------
  * pca955x: Add HW blink support, utilizing PWM0. It supports one frequency
    across all blinking LEDs and falls back to software blink if different
    frequencies are requested.

  * trigger: netdev: Allow configuring LED blink interval via .blink_set
    even when HW offload (.hw_control) is enabled.
  * led-core: Fix a race condition where a quick LED_OFF followed by another
    brightness set could leave the LED off incorrectly, especially
    noticeable after the introduction of the ordered workqueue.
  * qcom-lpg: Add support for 6-bit PWM resolution alongside the existing
    9-bit support.
  * qcom-lpg: Fix PWM value capping to respect the selected resolution
    (6-bit or 9-bit) for normal PWMs.
  * qcom-lpg: Fix PWM value capping to respect the selected resolution for
    Hi-Res PWMs.
  * qcom-lpg: Fix calculation of the best period for Hi-Res PWMs to prevent
    requested duty cycles from exceeding the maximum allowed by the
    selected resolution.
  * st1202: Add a check for the error code returned by devm_mutex_init().
  * pwm-multicolor: Add a check for the return value of
    fwnode_property_read_u32().
  * st1202: Ensure hardware initialization (st1202_setup) happens before DT
    node processing (st1202_dt_init).
  * Kconfig: leds-st1202: Add select LEDS_TRIGGER_PATTERN as it's required
    by the driver.

  * lp8860: Drop unneeded explicit assignment to REGCACHE_NONE.
  * pca955x: Refactor code with helper functions and rename some
    functions/variables for clarity.
  * pca955x: Pass driver data pointers instead of the I2C client to helper
    functions.
  * pca955x: Optimize probe LED selection logic to reduce I2C operations.
  * pca955x: Revert the removal of pca95xx_num_led_regs() (renaming it to
    pca955x_num_led_regs) as it's needed for HW blink support.
  * st1202: Refactor st1202_led_set() to use the !! operator for boolean
    conversion.
  * st1202: Minor spacing and proofreading edits in comments.
  * Directory Rename: Rename the drivers/leds/simple directory to
    drivers/leds/simatic as the drivers within are not simple.
  * mlxcpld: Remove unused include of acpi.h.
  * nic78bx: Tidy up the ACPI ID table (remove ACPI_PTR, use
    mod_devicetable.h, remove explicit driver_data initializer).

  * tlc591xx: Convert text binding to YAML format, add child node
    constraints, and fix typos/formatting in the example.
  * qcom-lpg: Document the qcom,pm8937-pwm compatible string as a
    fallback for qcom,pm8916-pwm.

----------------------------------------------------------------
Abel Vesa (3):
      leds: rgb: leds-qcom-lpg: Fix pwm resolution max for normal PWMs
      leds: rgb: leds-qcom-lpg: Fix pwm resolution max for Hi-Res PWMs
      leds: rgb: leds-qcom-lpg: Fix calculation of best period Hi-Res PWMs

Andy Shevchenko (3):
      leds: lp8860: Drop unneeded assignment for cache_type
      leds: mlxcpld: Remove unused ACPI header inclusion
      leds: nic78bx: Tidy up ACPI ID table

Anjelique Melendez (1):
      leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM resolution

Barnabás Czémán (1):
      dt-bindings: leds: qcom-lpg: Document PM8937 PWM compatible

Eddie James (5):
      leds: pca955x: Refactor with helper functions and renaming
      leds: pca955x: Use pointers to driver data rather than I2C client
      leds: pca955x: Optimize probe LED selection
      leds: pca955x: Add HW blink support
      Revert "leds-pca955x: Remove the unused function pca95xx_num_led_regs()"

Frank Li (1):
      dt-bindings: leds: Convert leds-tlc591xx.txt to yaml format

Lee Jones (1):
      leds: Rename simple directory to simatic

Manuel Fombuena (3):
      leds: leds-st1202: Initialize hardware before DT node child operations
      leds: leds-st1202: Spacing and proofreading editing
      leds: Kconfig: leds-st1202: Add select for required LEDS_TRIGGER_PATTERN

Marek Vasut (1):
      leds: trigger: netdev: Configure LED blink interval for HW offload

Pei Xiao (1):
      leds: st1202: Refactor st1202_led_set() to use !! operator for boolean conversion

Remi Pommarel (1):
      leds: Fix LED_OFF brightness race

Thomas Weißschuh (1):
      leds: st1202: Check for error code from devm_mutex_init() call

Yuanjun Gong (1):
      leds: pwm-multicolor: Add check for fwnode_property_read_u32

 .../devicetree/bindings/leds/leds-qcom-lpg.yaml    |   4 +
 .../devicetree/bindings/leds/leds-tlc591xx.txt     |  40 ---
 .../devicetree/bindings/leds/ti,tlc59116.yaml      |  90 ++++++
 drivers/leds/Kconfig                               |   8 +-
 drivers/leds/Makefile                              |   4 +-
 drivers/leds/led-core.c                            |  22 +-
 drivers/leds/leds-lp8860.c                         |   2 -
 drivers/leds/leds-mlxcpld.c                        |   1 -
 drivers/leds/leds-nic78bx.c                        |  16 +-
 drivers/leds/leds-pca955x.c                        | 359 ++++++++++++++-------
 drivers/leds/leds-st1202.c                         |  21 +-
 drivers/leds/rgb/leds-pwm-multicolor.c             |   5 +-
 drivers/leds/rgb/leds-qcom-lpg.c                   |  23 +-
 drivers/leds/{simple => simatic}/Kconfig           |   0
 drivers/leds/{simple => simatic}/Makefile          |   0
 .../simatic-ipc-leds-gpio-apollolake.c             |   0
 .../simatic-ipc-leds-gpio-core.c                   |   0
 .../simatic-ipc-leds-gpio-elkhartlake.c            |   0
 .../simatic-ipc-leds-gpio-f7188x.c                 |   0
 .../{simple => simatic}/simatic-ipc-leds-gpio.h    |   0
 .../leds/{simple => simatic}/simatic-ipc-leds.c    |   0
 drivers/leds/trigger/ledtrig-netdev.c              |  16 +-
 22 files changed, 418 insertions(+), 193 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-tlc591xx.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tlc59116.yaml
 rename drivers/leds/{simple => simatic}/Kconfig (100%)
 rename drivers/leds/{simple => simatic}/Makefile (100%)
 rename drivers/leds/{simple => simatic}/simatic-ipc-leds-gpio-apollolake.c (100%)
 rename drivers/leds/{simple => simatic}/simatic-ipc-leds-gpio-core.c (100%)
 rename drivers/leds/{simple => simatic}/simatic-ipc-leds-gpio-elkhartlake.c (100%)
 rename drivers/leds/{simple => simatic}/simatic-ipc-leds-gpio-f7188x.c (100%)
 rename drivers/leds/{simple => simatic}/simatic-ipc-leds-gpio.h (100%)
 rename drivers/leds/{simple => simatic}/simatic-ipc-leds.c (100%)

-- 
Lee Jones [李琼斯]
