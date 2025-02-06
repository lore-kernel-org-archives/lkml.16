Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5318A93C;
	Thu,  6 Feb 2025 17:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863521; cv=none; b=X001mD994/M/EeI4ipnpBL2zCmARwkRVmF+/n3/CT4peZxQjPlzjUU/YMlmh28ZvH8h+UhDJhXgEYvvPkACcEacrne4p6UDFiF3VqyDYOAP9jUSagRjSonvETmGh5LwgH4+w1PXWZEShTG2puS74vNBraydCUaCncAOJB9p1LqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863521; c=relaxed/simple;
	bh=pkYFJ4LaLF+Xd6E3ZdhXgUAOXThcaHR6MGn9iSLxnlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m5NE9EF9E43d38Nh9Xltp7wVAM53eKgZr7oPHW22GE/HtPr8wCDeuD3fKLPj4umBnCaTvkrxjWS4s/V1tMnP1G+93HlZjLhGJ7fJqSQI9/EO3yLfbdfjPbkyJcGyIfgBYh/2kut7V1TWv/VDYdx0JZW/Mx+yZzfectM4eYezwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a3J6DA2E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a3J6DA2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F117C4CEE3;
	Thu,  6 Feb 2025 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738863519;
	bh=pkYFJ4LaLF+Xd6E3ZdhXgUAOXThcaHR6MGn9iSLxnlM=;
	h=From:To:Cc:Subject:Date:From;
	b=a3J6DA2EH1CsQ1hv/NHX2h/KPgrX2vQScmeJnLEtED6juMlR0jqqkG2Og42Vn9Bmf
	 uPnhKCJ/S4katL2WWR6sTFiYaZBmBLpkFBTwtaSj+yT+AbdPUr0AodR8/b8sOjII8Y
	 7AaOGoXNi+DXyGDySXjAAgZAC4QgLryW47qow2g0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
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
Subject: [PATCH v3 0/8] Driver core: Add faux bus devices
Date: Thu,  6 Feb 2025 18:38:14 +0100
Message-ID: <2025020620-skedaddle-olympics-1735@gregkh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3780; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=pkYFJ4LaLF+Xd6E3ZdhXgUAOXThcaHR6MGn9iSLxnlM=; b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPvdqT821vXN4kauuOMOSqLtS+h5dOXYHy/a0c03hO s9cU/yzI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACay5z7DgnlPxbSjI907j971 2brnqWRJ91qRUoa5IpNZHnqUi9ybcOzthLUr34Tvr/j+GgA=
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
patch 1 of this series merged during this -rc cycle so that all of the
individual driver subsystem cleanups can go through those subsystems as
needed, as well as allowing the rust developers to create a binding and
get that merged easier.  Having patch 1 merged on its own isn't going to
cause any changes if no one uses it, so that should be fine.

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

 Documentation/driver-api/infrastructure.rst |   6 +
 arch/x86/kernel/cpu/microcode/core.c        |  14 +-
 drivers/base/Makefile                       |   2 +-
 drivers/base/base.h                         |   1 +
 drivers/base/faux.c                         | 228 ++++++++++++++++++++
 drivers/base/init.c                         |   1 +
 drivers/char/tlclk.c                        |  32 +--
 drivers/gpu/drm/vgem/vgem_drv.c             |  30 +--
 drivers/gpu/drm/vkms/vkms_drv.c             |  28 +--
 drivers/gpu/drm/vkms/vkms_drv.h             |   4 +-
 drivers/misc/lis3lv02d/lis3lv02d.c          |  26 +--
 drivers/misc/lis3lv02d/lis3lv02d.h          |   4 +-
 drivers/regulator/dummy.c                   |  37 +---
 include/linux/device/faux.h                 |  65 ++++++
 net/wireless/reg.c                          |  28 +--
 15 files changed, 383 insertions(+), 123 deletions(-)
 create mode 100644 drivers/base/faux.c
 create mode 100644 include/linux/device/faux.h

-- 
2.48.1

