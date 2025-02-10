Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2E2236F7;
	Mon, 10 Feb 2025 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190637; cv=none; b=LZvw10RF3C8FY4iRT+7eDd8idY6P9rH4OyKxGiwTUC0crzroQAmYc3X/6zrD++rdEKgS/H60+lhnGa4dhivJt1wMJjTRauMLQq9PO1tRIg4izJ/uyZFK5gtkfZPGR4TYxo2/3acOF+0AP2plyDc/XKAYYo1dNtVi3WffSoJWg+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190637; c=relaxed/simple;
	bh=c9D3oOBKU8VLrTVavyW7pHwp3Ch/dcHbstq2a7GWBE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eCh1r/ck2PTopvZEOyBo1BYIdiAmENEbBIH72ASLR/dtsbLIscAiHJxrd5oOYD/8d2BtWSOKND5FVAzYdoOv5asQcZ1S3b22qgVbpB04PUZWthPlqCeQBErlqLfjsRTv/Y0VK2JDgg+5ETWo8fVjLLl82bZYDTUpD/Lf5uRHIZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y2UjeeHu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y2UjeeHu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4051DC4CED1;
	Mon, 10 Feb 2025 12:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739190636;
	bh=c9D3oOBKU8VLrTVavyW7pHwp3Ch/dcHbstq2a7GWBE4=;
	h=From:To:Cc:Subject:Date:From;
	b=y2UjeeHuzARc0PFFUpxZeOMDjEyBWVcQJEnM9Zn3O8rZ5dz3kb308IJEPjbBtJxLM
	 3g+ug/4mbzEdxYzY14OvVLHEhIAvWbCZcdO5GUT7W9+vTrT0b3HYsjHBm2fgRkMNHF
	 sP8nh/XEOuu3JCKQZfPzvqFdvuAKOxt20y0tNoQo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/9] Driver core: Add faux bus devices
Date: Mon, 10 Feb 2025 13:30:24 +0100
Message-ID: <2025021023-sandstorm-precise-9f5d@gregkh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5008; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=c9D3oOBKU8VLrTVavyW7pHwp3Ch/dcHbstq2a7GWBE4=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkrPya4eP2c5COm6bgq0P+v9MGvFZ0/l8jNiu41t/22N z6rcnlPRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzkPjvDPFPfCzbMemuP71z9 7XDZ4oxplSs2BTIsWCqwPPVN1TK9UsauV//Yqxge7711FwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

For years/decades now, I've been complaining when I see people use
platform devices for things that are obviously NOT platform devices.
To finally fix this up, here is a "faux bus" that should be used instead
of a platform device for these tiny and "fake" devices that people
create all over the place.

The api is even simpler than the normal platform device api, just two
functions, one to create a device and one to remove it.  When a device
is created, if a probe/release callback is offered, they will be called
at the proper time in the device's lifecycle.  When finished with the
device, just destroy it and all should be good.

This simple api should also hopefully provide for a simple rust binding
to it given the simple rules and lifecycle of the pointer passed back
from the creation function (i.e. it is alive and valid for as long as
you have not called destroy on it.)

I've also converted four different examples of platform device abuse, the
dummy regulator driver, the USB phy code, the x86 microcode dvice, and
the "regulator" device that wifi uses to load the firmware tables, to
use this api.  In all cases, the logic either was identical, or became
simpler, than before, a good sign (side note, a bug was fixed in the usb
phy code that no one ever noticed before).

Note, unless there are major objections, I'm leaning toward getting
patch 1 and 2 of this series merged during this -rc cycle so that all of
the individual driver subsystem cleanups can go through those subsystems
as needed, as well as allowing the rust developers to create a binding
and get that merged easier.  Having patch 1 merged on its own isn't
going to cause any changes if no one uses it, so that should be fine.

Changes from v4:
  - really dropped the internal name structure, remanants were left over
    from the last patch series
  - added the rust binding patch from Lyude (is this one of the first
    patch series that adds a new kernel api AND the rust binding at the
    same time?)
  - added a parent pointer to the api so the devices can be in the tree
    if the caller wants them
  - made probe synchronous to prevent race when using the api (when the
    create call returns the device is fully ready to go.)  Thanks to
    testing of the drm driver change to find this issue.
  - documentation tweaks
  - #include <linux/container_of.h> finally added to faux.h


Changes from v3:
  - Dropped the USB phy porting, turned out to be incorrect, it really
    did need a platform device
  - converted more drivers to the faux_device api (tlclk, lis3lv02d,
    vgem, and vkms)
  - collected some reviewed-by
  - lots of minor tweaks of the faux.c api, and documentation based on
    review, see the changelog in patch 1 for details.

Changes from v2:
  - lots of cleanups to faux.c based on reviews, see patch 1 for details
  - actually tested the destroy device path, it worked first try!
  - added 3 more example drivers



Greg Kroah-Hartman (8):
  driver core: add a faux bus for use when a simple device/bus is needed
  regulator: dummy: convert to use the faux device interface
  x86/microcode: move away from using a fake platform device
  wifi: cfg80211: move away from using a fake platform device
  tlclk: convert to use faux_device
  misc: lis3lv02d: convert to use faux_device
  drm/vgem/vgem_drv convert to use faux_device
  drm/vkms: convert to use faux_device

Lyude Paul (1):
  rust/kernel: Add faux device bindings

 Documentation/driver-api/infrastructure.rst |   6 +
 MAINTAINERS                                 |   2 +
 arch/x86/kernel/cpu/microcode/core.c        |  14 +-
 drivers/base/Makefile                       |   2 +-
 drivers/base/base.h                         |   1 +
 drivers/base/faux.c                         | 232 ++++++++++++++++++++
 drivers/base/init.c                         |   1 +
 drivers/char/tlclk.c                        |  32 +--
 drivers/gpu/drm/vgem/vgem_drv.c             |  30 +--
 drivers/gpu/drm/vkms/vkms_drv.c             |  28 +--
 drivers/gpu/drm/vkms/vkms_drv.h             |   4 +-
 drivers/misc/lis3lv02d/lis3lv02d.c          |  26 +--
 drivers/misc/lis3lv02d/lis3lv02d.h          |   4 +-
 drivers/regulator/dummy.c                   |  37 +---
 include/linux/device/faux.h                 |  69 ++++++
 net/wireless/reg.c                          |  28 +--
 rust/bindings/bindings_helper.h             |   1 +
 rust/kernel/faux.rs                         |  67 ++++++
 rust/kernel/lib.rs                          |   1 +
 samples/rust/Kconfig                        |  10 +
 samples/rust/Makefile                       |   1 +
 samples/rust/rust_driver_faux.rs            |  29 +++
 22 files changed, 502 insertions(+), 123 deletions(-)
 create mode 100644 drivers/base/faux.c
 create mode 100644 include/linux/device/faux.h
 create mode 100644 rust/kernel/faux.rs
 create mode 100644 samples/rust/rust_driver_faux.rs

-- 
2.48.1

