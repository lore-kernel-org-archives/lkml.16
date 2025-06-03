Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9977111
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944959; cv=none; b=DgqLq53/sTUFaxBC1QX+BHQJxOzT92JU+7uhpVfHJQRQysco/uT6yolvrTLOeWyKQH1xiRdu5uj9/Z97E/AR8zEsaJQyIamWwNxd1SJ7VSjmrrWLfyHbnIkdklspNf6EqKEjYCwrQFsJU7HphaOwwx0LLeaFAu2JkS3fSo0vLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944959; c=relaxed/simple;
	bh=5PKIFHRzec6lAxHM2SRU66PHIbwaH9IVizeIwvP3LEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=icTgKKMNqjOkclwhMP3qA1UwPfWeDSTEWa+UkZJHcDJYSazw4SnJTtRz4/mpho7HwXgjSx9Zdhpyf+Wco5Puk4K5UsgVSOP2C75qOmSWORxL9iOG4arAiLqmIo+DOvE2QahkU28Ax3SnozV9nSDOtGWj72Jv2mwrKa9IS4FMd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVNr+7Z6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVNr+7Z6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CBAC4CEED;
	Tue,  3 Jun 2025 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748944958;
	bh=5PKIFHRzec6lAxHM2SRU66PHIbwaH9IVizeIwvP3LEw=;
	h=Date:From:To:Cc:Subject:From;
	b=TVNr+7Z6p8Afj5ExGqD/UB98gcKR8o/mwWIUItN5T7ARLx/nVrg0x0sigr9fblYIU
	 VVWiD68wvyIGB1BRRoQmeNu3F9ECL9HgzrngU7uFJ39l7/WcYO4vH3Pl5npIcKDLyb
	 3Uvl9GNJ3wq0ostpJKVRQYWJqthRsUt4tOngOKSXGMd4NZfKt64uiDxOSIjsL0ga7p
	 oi2uDpu7RUUmhy+OeRQaacxDCrYlzU9a6sFrKy12aQEIruKQ3IKONWACvBi7DMXWLi
	 8ppvLgaGoBF0zzAPPCjCdV0nN3tg/J9SKUA4wmke2O9amD0u2lfBrNrAzj1FsJ4wd/
	 yYcY/kWaY0Mnw==
Date: Tue, 3 Jun 2025 11:02:34 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Daniel Thompson <danielt@kernel.org>
Subject: [GIT PULL] Backlight for v6.16
Message-ID: <20250603100234.GE7758@google.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git backlight-next-6.16

for you to fetch changes up to e12d3e1624a02706cdd3628bbf5668827214fa33:

  backlight: pm8941: Add NULL check in wled_configure() (2025-04-15 18:27:38 +0100)

----------------------------------------------------------------
Backlight for v6.16

  * Framebuffer Subsystem (fbdev):
    * The display's blanking status is now tracked in `struct fb_info`
    * `framebuffer_alloc()` initializes the blank state to `FB_BLANK_UNBLANK`
    * `register_framebuffer()` sets the state to `FB_BLANK_POWERDOWN` if an `fb_blank`
      callback exists, ensuring `FB_EVENT_BLANK` listeners correctly see the display
      being turned on during the first modeset
    * The `FB_EVENT_BLANK` event data now includes both the new and the old blank states
  * Qualcomm WLED Backlight:
    * Added a NULL check after `devm_kasprintf()` in `wled_configure()` to prevent a
      potential NULL pointer dereference if memory allocation fails

  * Framebuffer Subsystem (fbdev):
    * `fb_blank()` has been reworked to return early on errors, without functional
      changes, in preparation for further state tracking improvements
    * Fbdev now calls dedicated functions in the backlight subsystems to notify them
      of blank state changes, instead of relying on fbdev event notifiers
    * For LCDs, fbdev also calls a dedicated function to notify of mode changes
  * Backlight Subsystem:
    * Implemented fbdev blank state tracking using the (newly enhanced) blank state
      information provided directly by `FB_EVENT_BLANK`
    * Removed internal blank state tracking fields (`fb_bl_on`) from
      `struct backlight_device`
    * Moved the handling of blank-state updates into a separate internal helper
      function, `backlight_notify_blank()`
    * Removed support for fbdev events and replaced it with a dedicated function call
      interface (`backlight_notify_blank()` and `backlight_notify_blank_all()`) for
      display drivers to update backlight status
  * LCD Subsystem:
    * Moved the handling of display updates (blank events and mode changes) from
      fbdev event notifiers to separate internal helper functions (`lcd_notify_blank`,
      `lcd_notify_mode_change`)
    * Removed support for fbdev events and replaced it with dedicated function call
      interfaces (`lcd_notify_blank_all()`, `lcd_notify_mode_change_all()`)
    * The LCD subsystem now maintains its own internal list of LCD devices instead of
      relying on fbdev notifiers
  * LED Backlight Trigger:
    * Moved the handling of blank-state updates into a separate internal helper,
      `ledtrig_backlight_notify_blank()`
    * Removed support for fbdev events and replaced it with a dedicated function call,
      `ledtrig_backlight_blank()`, for fbdev to notify trigger of blank state changes
    * The LED backlight trigger now maintains its own internal list of triggers
      instead of relying on fbdev notifiers

  * Framebuffer Subsystem (fbdev):
    * Removed the definitions for the unused fbdev event constants
      `FB_EVENT_MODE_CHANGE` and `FB_EVENT_BLANK` from the header file

----------------------------------------------------------------
Henry Martin (1):
      backlight: pm8941: Add NULL check in wled_configure()

Thomas Zimmermann (11):
      fbdev: Rework fb_blank()
      fbdev: Track display blanking state
      fbdev: Send old blank state in FB_EVENT_BLANK
      backlight: Implement fbdev tracking with blank state from event
      backlight: Move blank-state handling into helper
      backlight: Replace fb events with a dedicated function call
      backlight: lcd: Move event handling into helpers
      backlight: lcd: Replace fb events with a dedicated function call
      leds: backlight trigger: Move blank-state handling into helper
      leds: backlight trigger: Replace fb events with a dedicated function call
      fbdev: Remove constants of unused events

 drivers/leds/trigger/ledtrig-backlight.c |  48 +++++++-------
 drivers/video/backlight/backlight.c      |  93 ++++++--------------------
 drivers/video/backlight/lcd.c            | 108 ++++++++++++-------------------
 drivers/video/backlight/qcom-wled.c      |   6 +-
 drivers/video/fbdev/core/fb_backlight.c  |  12 ++++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  82 +++++++++++++++++++----
 drivers/video/fbdev/core/fbsysfs.c       |   8 +--
 include/linux/backlight.h                |  32 ++++-----
 include/linux/fb.h                       |  12 ++--
 include/linux/lcd.h                      |  21 +++++-
 include/linux/leds.h                     |   6 ++
 12 files changed, 219 insertions(+), 210 deletions(-)

-- 
Lee Jones [李琼斯]
