Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7699286436
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447927; cv=none; b=mHKfFrn0hw0ecuvh0ZzyxRFtLzW/9YYeMZ8dqdxiSo1K65dIVXuFJMHhltgAVM50Cc1KhWBnh0qAf2smekX0NUtAnCkDOMUjrhF6f2zXUxjQ/dcqxlehJzRpg07L7UUIBJ38OlnuD80s7NfrSQRkWhMmf7yoEG6VmN39FFrCSHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447927; c=relaxed/simple;
	bh=SU+mU5oQxy8bSSEFYsj0BOipry6meOH69Ie9WgYQZVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNpvCe7x3KGW5BfU9tbWlNWqkE7z/3pZArTlIo9nX9rCL6DaOQLmyIEN/iuQIMOeTHED3gBR1iEUOw92+lSg/9IzS4htLkUTjSJyLX3Oyq7hCSBL+VEyMdOiE9RkkCvb0c+8+gVJpywsWGlZ42dD9FEFDXovpUnGBNIrkRm9IeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kpa9c+Ya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kpa9c+Ya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24AFC4CEED;
	Wed, 28 May 2025 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748447927;
	bh=SU+mU5oQxy8bSSEFYsj0BOipry6meOH69Ie9WgYQZVU=;
	h=Date:From:To:Cc:Subject:From;
	b=kpa9c+YaPO8qrDqbTzmKusm3H9dr60VxNUMdOINNKpeSKlRNhQ+DN1tBiNa8tvfu+
	 Wbxuran5oLhEF2F/X0T3FaSbM4dHxR77qfcQ1j2mAlq+AWau28sA+X1UPs96FsrrnE
	 yh42uABVH0lME13MVsRlu5Fyct8Kf6NY1RA/orLQ=
Date: Wed, 28 May 2025 17:56:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] Driver core changes for 6.16-rc1
Message-ID: <aDcyRMojWUbAllVX@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc1

for you to fetch changes up to 071d8e4c2a3b0999a9b822e2eb8854784a350f8a:

  kernfs: Relax constraint in draining guard (2025-05-21 14:23:13 +0200)

----------------------------------------------------------------
Driver core changes for 6.16-rc1

Here are the driver core / kernfs changes for 6.16-rc1.

Not a huge number of changes this development cycle, here's the summary
of what is included in here:
  - kernfs locking tweaks, pushing some global locks down into a per-fs
    image lock
  - rust driver core and pci device bindings added for new features.
  - sysfs const work for bin_attributes.  This churn should now be
    completed for those types of attributes
  - auxbus device creation helpers added
  - fauxbus fix for creating sysfs files after the probe completed
    properly
  - other tiny updates for driver core things.

All of these have been in linux-next for over a week with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Andy Shevchenko (2):
      devres: Move devm_*_action*() APIs to devres.h
      devres: Add devm_is_action_added() helper

Dan Carpenter (1):
      driver core: auxiliary bus: Fix IS_ERR() vs NULL mixup in __devm_auxiliary_device_create()

Danilo Krummrich (10):
      rust: device: implement impl_device_context_deref!
      rust: device: implement impl_device_context_into_aref!
      rust: device: implement device context for Device
      rust: platform: preserve device context in AsRef
      rust: pci: preserve device context in AsRef
      rust: device: implement Bound device context
      rust: pci: move iomap_region() to impl Device<Bound>
      rust: devres: require a bound device
      rust: dma: require a bound device
      Merge tag 'topic/device-context-2025-04-17' into driver-core-next

Eric Biggers (1):
      firmware_loader: use SHA-256 library API instead of crypto_shash API

Greg Kroah-Hartman (4):
      Merge 6.15-rc4 into driver-core-next
      Merge tag 'gpiod-devm-is-action-added-for-v6.16-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/brgl/linux into driver-core-next
      Merge 6.15-rc6 into driver-core-next
      drivers: hv: fix up const issue with vmbus_chan_bin_attrs

Jerome Brunet (1):
      driver core: auxiliary bus: add device creation helpers

Jinliang Zheng (2):
      kernfs: switch global kernfs_idr_lock to per-fs lock
      kernfs: switch global kernfs_rename_lock to per-fs lock

Johan Hovold (1):
      component: do not try to unbind unbound components

Kurt Borja (1):
      driver core: faux: Add sysfs groups after probing

Michael Ellerman (1):
      Documentation: embargoed-hardware-issues.rst: Remove myself

Michal Koutný (1):
      kernfs: Relax constraint in draining guard

Raag Jadav (1):
      devres: simplify devm_kstrdup() using devm_kmemdup()

Thomas Weißschuh (2):
      sysfs: constify bin_attribute argument of bin_attribute::read/write()
      sysfs: constify attribute_group::bin_attrs

Timur Tabi (1):
      docs: debugfs: do not recommend debugfs_remove_recursive

Woody Zhang (1):
      platform: replace magic number with macro PLATFORM_DEVID_NONE

Zijun Hu (2):
      software node: Correct a OOB check in software_node_get_reference_args()
      PM: wakeup: Do not expose 4 device wakeup source APIs

 Documentation/filesystems/debugfs.rst              |  19 ++--
 .../driver_development_debugging_guide.rst         |   2 +-
 .../process/embargoed-hardware-issues.rst          |   1 -
 drivers/base/auxiliary.c                           | 108 +++++++++++++++++++++
 drivers/base/component.c                           |   3 +-
 drivers/base/devres.c                              |  20 ++--
 drivers/base/faux.c                                |  22 ++++-
 drivers/base/firmware_loader/Kconfig               |   4 +-
 drivers/base/firmware_loader/main.c                |  34 +------
 drivers/base/platform.c                            |   2 +-
 drivers/base/power/wakeup.c                        |  12 +--
 drivers/base/swnode.c                              |   2 +-
 drivers/hv/vmbus_drv.c                             |   2 +-
 fs/kernfs/dir.c                                    |  33 ++++---
 fs/kernfs/file.c                                   |   3 +-
 fs/kernfs/kernfs-internal.h                        |  16 ++-
 fs/sysfs/group.c                                   |   6 +-
 include/linux/auxiliary_bus.h                      |  17 ++++
 include/linux/device.h                             |  38 --------
 include/linux/device/devres.h                      |  41 ++++++++
 include/linux/pm_wakeup.h                          |  15 ---
 include/linux/sysfs.h                              |  27 +-----
 rust/kernel/device.rs                              |  90 ++++++++++++++++-
 rust/kernel/devres.rs                              |  17 ++--
 rust/kernel/dma.rs                                 |  14 +--
 rust/kernel/pci.rs                                 |  33 +++----
 rust/kernel/platform.rs                            |  32 ++----
 27 files changed, 378 insertions(+), 235 deletions(-)
