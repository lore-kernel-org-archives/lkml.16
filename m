Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968B49620
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171140; cv=none; b=J/rz4uilbnme89++pnbd8fOH333BaVLgXae02aeChglXWsglsm0+pgWCUXTadxONbhJoLKVtU9H4jpVyP2KlrYytpLXy5zSdHoVfuqCAf1YAgdRiiO1v90hGLCN6DrXIpoYEOiu1ra3+M4C3ywVVUg7mFYAE+j2jzuzwyBzLCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171140; c=relaxed/simple;
	bh=yh/UqcAoRS4y6zo1sspu+BI0TwR5cyGVKO1hjw8ze5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqjlmc+f9H45HWRuOobeZIwlyU5XLNq3twySOZQljfCQmlVIL7yLwCLH5+nAAtdI2Kh255Ng24fTGk5LD2xc/D+Q6/5eA1ChElBqI9j/Jndcp/OwNdUpdWwE34G0cwSr8h3w68iS7daTv3qnfsJ6aKh0dQ9U4Pot7vqfJPOIago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAfiXo0i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAfiXo0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D86FC4CEE4;
	Fri, 28 Mar 2025 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743171140;
	bh=yh/UqcAoRS4y6zo1sspu+BI0TwR5cyGVKO1hjw8ze5A=;
	h=Date:From:To:Cc:Subject:From;
	b=QAfiXo0i7gQcdRWTmVdL0XC6DmlJgSK0Fd2XFqUwH0VvR7hrjXq/F+QHbIjud7qXQ
	 eyyqmA1a0Vrwx6aNIo7nhmtpejk73yZuvy9rVd5lWnHHzq4/o4PPH5k3j89AkOAPG1
	 AdONrzqGVGrqmL3YRU4jLW8d+y8K4agfCgRL3a3Q38WRaMt/9MekrQeDnGgc9Qx0tf
	 j2VYOaYg5LRqrWbuEadN+dZF3gTh2AXUyEL/exozABjzVXFUKjb4m/qtSKKJtbhPhH
	 RUycPYBlqjo8BpeuyDcixXh5jQI0GY2dkYT6SjZ6ZlXg7+4jPuDxT5Up29pwLPqKDX
	 VKDZsC8oBZORw==
Date: Fri, 28 Mar 2025 14:12:15 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Daniel Thompson <danielt@kernel.org>
Subject: [GIT PULL] Backlight for v6.15
Message-ID: <20250328141215.GC7190@google.com>
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

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/backlight-next-6.15

for you to fetch changes up to dfc034a0494b8fb8ea881aeb41a0c4e2619ff1e4:

  backlight: pcf50633-backlight: Remove unused driver (2025-03-14 11:36:33 +0000)

----------------------------------------------------------------
  * Apple DWI Backlight:
  * Added devicetree bindings for backlight controllers on Apple's
    DWI interface.
  * Added a new driver (apple_dwi_bl) for these controllers found
    on some Apple mobile devices.
  * Added MAINTAINERS entries for the new driver.

  * led_bl: Fixed a locking issue by holding the led_access lock
    when calling led_sysfs_disable() during device removal to
    prevent potential warnings.

  * Removed unnecessary <linux/fb.h> includes from a bunch of
    drivers.
  * tdo24m: Removed redundant whitespace in Kconfig description.

  * pcf50633-backlight: Removed the driver as the underlying
    pcf50633 MFD and s3c24xx platform support were removed.

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      backlight: pcf50633-backlight: Remove unused driver

Herve Codina (1):
      backlight: led_bl: Hold led_access lock when calling led_sysfs_disable()

Nick Chan (3):
      dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
      backlight: apple_dwi_bl: Add Apple DWI backlight driver
      MAINTAINERS: Add entries for Apple DWI backlight controller

Thomas Zimmermann (16):
      backlight: 88pm860x_bl: Do not include <linux/fb.h>
      backlight: adp5520_bl: Do not include <linux/fb.h>
      backlight: adp8860_bl: Do not include <linux/fb.h>
      backlight: adp8870_bl: Do not include <linux/fb.h>
      backlight: as3711_bl: Do not include <linux/fb.h>
      backlight: bd6107_bl: Do not include <linux/fb.h>
      backlight: da903x_bl: Do not include <linux/fb.h>
      backlight: da9052_bl: Do not include <linux/fb.h>
      backlight: ep93xx_bl: Do not include <linux/fb.h>
      backlight: hp680_bl: Do not include <linux/fb.h>
      backlight: locomolcd: Do not include <linux/fb.h>
      backlight: lv5207lp: Do not include <linux/fb.h>
      backlight: max8925_bl: Do not include <linux/fb.h>
      backlight: tps65217_bl: Do not include <linux/fb.h>
      backlight: vgg2432a4: Do not include <linux/fb.h>
      backlight: wm831x_bl: Do not include <linux/fb.h>

WangYuli (1):
      backlight: tdo24m: Eliminate redundant whitespace

 .../bindings/leds/backlight/apple,dwi-bl.yaml      |  57 ++++++++
 MAINTAINERS                                        |   2 +
 drivers/video/backlight/88pm860x_bl.c              |   1 -
 drivers/video/backlight/Kconfig                    |  20 +--
 drivers/video/backlight/Makefile                   |   2 +-
 drivers/video/backlight/adp5520_bl.c               |   1 -
 drivers/video/backlight/adp8860_bl.c               |   1 -
 drivers/video/backlight/adp8870_bl.c               |   1 -
 drivers/video/backlight/apple_dwi_bl.c             | 123 ++++++++++++++++
 drivers/video/backlight/as3711_bl.c                |   1 -
 drivers/video/backlight/bd6107.c                   |   1 -
 drivers/video/backlight/da903x_bl.c                |   1 -
 drivers/video/backlight/da9052_bl.c                |   1 -
 drivers/video/backlight/ep93xx_bl.c                |   1 -
 drivers/video/backlight/hp680_bl.c                 |   1 -
 drivers/video/backlight/led_bl.c                   |   5 +-
 drivers/video/backlight/locomolcd.c                |   1 -
 drivers/video/backlight/lv5207lp.c                 |   1 -
 drivers/video/backlight/max8925_bl.c               |   1 -
 drivers/video/backlight/pcf50633-backlight.c       | 154 ---------------------
 drivers/video/backlight/tps65217_bl.c              |   1 -
 drivers/video/backlight/vgg2432a4.c                |   1 -
 drivers/video/backlight/wm831x_bl.c                |   1 -
 include/linux/mfd/pcf50633/backlight.h             |  42 ------
 include/linux/mfd/pcf50633/core.h                  |   3 -
 25 files changed, 199 insertions(+), 225 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c
 delete mode 100644 drivers/video/backlight/pcf50633-backlight.c
 delete mode 100644 include/linux/mfd/pcf50633/backlight.h

-- 
Lee Jones [李琼斯]
