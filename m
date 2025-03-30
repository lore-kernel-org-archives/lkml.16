Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8ED29D0D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743359197; cv=none; b=V/Gbc+tJDVKsqui5thnNWRgNAaSnXtUhpWsebKMgK1O5WhQjQ5LnG8Doi18WYLSA7LHD8aZd/FmbpCwTcT0LY4NafXtnI1TaBcDKoJ2wCEVz6uKPJuMalfiLS8P/IpemEP3D3lStYaGDGEy0kkNlkmVC5fpfL3PmE/pNAcFJ7KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743359197; c=relaxed/simple;
	bh=AsOvyzG2+BqCl1OSBTdMoaHdgyWWwoIe8+rcvOXl3Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hwVJ/ug6Y4BgLzdDpRS9XSE4n+ip8SggZgpe3VJwpEw3drqJrK/ctGhf+vqZGnZiudbYCliRBGWHv73Mjvwb+e0+Iauwl9TSEzgH+aJv/ldm9Lm/8lnEvyntUoiDQ9eMX+Q+zN3JPSaLDluVVihv7lbbc3L0puMnwyun8jYqhm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EecGKwsC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EecGKwsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F411CC4CEDD;
	Sun, 30 Mar 2025 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743359196;
	bh=AsOvyzG2+BqCl1OSBTdMoaHdgyWWwoIe8+rcvOXl3Ys=;
	h=Date:From:To:Cc:Subject:From;
	b=EecGKwsC4PCrPQDNVnGmyffyaMYbYrmlx56IlDM/GShztPCAbIFswGB9vvTb2zRLB
	 EETCtsz2l7dgWuyjuJTJODhrTZew0/u9oEOuglcJoCgg7Eiias7Ozh4QldoED4YBx9
	 8p/A2BF7Yo0VRo6kXCNKT3ev6wAIYHGMP7KrPobI=
Date: Sun, 30 Mar 2025 20:26:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] Driver core updates for 6.15-rc1
Message-ID: <Z-mM2UCJNwRiUcaF@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/driver-core-6.15-rc1

for you to fetch changes up to 51d0de7596a458096756c895cfed6bc4a7ecac10:

  rust: platform: require Send for Driver trait implementers (2025-03-20 07:41:11 -0700)

----------------------------------------------------------------
Driver core updates for 6.15-rc1

Here is the big set of driver core updates for 6.15-rc1.  Lots of stuff
happened this development cycle, including:
  - kernfs scaling changes to make it even faster thanks to rcu
  - bin_attribute constify work in many subsystems
  - faux bus minor tweaks for the rust bindings
  - rust binding updates for driver core, pci, and platform busses,
    making more functionaliy available to rust drivers.  These are all
    due to people actually trying to use the bindings that were in 6.14.
  - make Rafael and Danilo full co-maintainers of the driver core
    codebase
  - other minor fixes and updates.

This has been in linux-next for a while now, with the only reported
issue being some merge conflicts with the rust tree.  Depending on which
tree you pull first, you will have conflicts in one of them.  The merge
resolution has been in linux-next as an example of what to do, or can be
found here:
	https://lore.kernel.org/r/CANiq72n3Xe8JcnEjirDhCwQgvWoE65dddWecXnfdnbrmuah-RQ@mail.gmail.com

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Bagas Sanjaya (1):
      kernel: Fix "select" wording on HZ_250 description

Bharadwaj Raju (1):
      drivers/base/bus.c: fix spelling of "subsystem"

Danilo Krummrich (8):
      rust: pci: use to_result() in enable_device_mem()
      rust: device: implement device context marker
      rust: pci: fix unrestricted &mut pci::Device
      rust: platform: fix unrestricted &mut platform::Device
      rust: pci: impl Send + Sync for pci::Device
      rust: platform: impl Send + Sync for platform::Device
      rust: pci: require Send for Driver trait implementers
      rust: platform: require Send for Driver trait implementers

Ethan Carter Edwards (1):
      rust/kernel/faux: mark Registration methods inline

Fiona Behrens (2):
      rust: io: rename `io::Io` accessors
      rust: io: fix devres test with new io accessor functions

Greg Kroah-Hartman (4):
      Merge 6.14-rc3 into driver-core-next
      driver core: faux: only create the device if probe() succeeds
      Merge 6.14-rc6 into driver-core-next
      MAINTAINERS: driver core: mark Rafael and Danilo as co-maintainers

Lucas De Marchi (1):
      drivers: base: component: Allow more space for device name

Lyude Paul (2):
      rust/faux: Drop #[repr(transparent)] from faux::Registration
      rust/faux: Add missing parent argument to Registration::new()

Sebastian Andrzej Siewior (8):
      kernfs: Acquire kernfs_rwsem in kernfs_notify_workfn().
      kernfs: Acquire kernfs_rwsem in kernfs_get_parent_dentry().
      kernfs: Acquire kernfs_rwsem in kernfs_node_dentry().
      kernfs: Don't re-lock kernfs_root::kernfs_rwsem in kernfs_fop_readdir().
      kernfs: Use RCU to access kernfs_node::parent.
      kernfs: Use RCU to access kernfs_node::name.
      kernfs: Drop kernfs_rwsem while invoking lookup_positive_unlocked().
      kernfs: Move dput() outside of the RCU section.

Thomas Weiﬂschuh (22):
      cxl/port: Constify 'struct bin_attribute'
      firmware: dmi: Mark bin_attributes as __ro_after_init
      firmware: dmi: Define bin_attributes through macro
      firmware: dmi: Constify 'struct bin_attribute'
      drm/sysfs: Constify 'struct bin_attribute'
      drm/lima: Constify 'struct bin_attribute'
      drm/i915: Constify 'struct bin_attribute'
      drm/amdgpu: Constify 'struct bin_attribute'
      drm/amd/display: Constify 'struct bin_attribute'
      fsi: core: Use const 'struct bin_attribute' callbacks
      accel/habanalabs: constify 'struct bin_attribute'
      Input: goodix-berlin - constify 'struct bin_attribute'
      efi/mokvar: Use const 'struct bin_attribute' callback
      pcmcia: cistpl: Constify 'struct bin_attribute'
      powerpc/secvar: Mark __init functions as such
      powerpc/secvar: Constify 'struct bin_attribute'
      powerpc/powernv/ultravisor: Constify 'struct bin_attribute'
      powerpc/powernv/opal: Constify 'struct bin_attribute'
      powerpc/perf/hv-24x7: Constify 'struct bin_attribute'
      firmware: qemu_fw_cfg: constify 'struct bin_attribute'
      rapidio: constify 'struct bin_attribute'
      efi: rci2: mark bin_attribute as __ro_after_init

Thorsten Blum (1):
      driver core: location: Use str_yes_no() helper function

Zijun Hu (3):
      driver core: class: Remove needless return in void API class_remove_file()
      driver core: Remove needless return in void API device_remove_group()
      MAINTAINERS: Add driver core headers to DRIVER CORE maintainers

 MAINTAINERS                                        |   6 +-
 arch/powerpc/kernel/secvar-sysfs.c                 |  24 +--
 arch/powerpc/perf/hv-24x7.c                        |   8 +-
 arch/powerpc/platforms/powernv/opal-core.c         |  10 +-
 arch/powerpc/platforms/powernv/opal-dump.c         |   4 +-
 arch/powerpc/platforms/powernv/opal-elog.c         |   4 +-
 arch/powerpc/platforms/powernv/opal-flash.c        |   4 +-
 arch/powerpc/platforms/powernv/opal-msglog.c       |   6 +-
 arch/powerpc/platforms/powernv/ultravisor.c        |   6 +-
 arch/x86/kernel/cpu/resctrl/internal.h             |   5 +
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c          |  14 +-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c             |  73 ++++---
 drivers/accel/habanalabs/common/sysfs.c            |  10 +-
 drivers/base/bus.c                                 |   2 +-
 drivers/base/component.c                           |  12 +-
 drivers/base/faux.c                                |  15 +-
 drivers/base/physical_location.c                   |   5 +-
 drivers/cxl/port.c                                 |  10 +-
 drivers/firmware/dmi-sysfs.c                       |  28 ++-
 drivers/firmware/dmi_scan.c                        |   4 +-
 drivers/firmware/efi/mokvar-table.c                |   4 +-
 drivers/firmware/efi/rci2-table.c                  |   2 +-
 drivers/firmware/qemu_fw_cfg.c                     |   6 +-
 drivers/fsi/fsi-core.c                             |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  13 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |   8 +-
 drivers/gpu/drm/drm_sysfs.c                        |  10 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |   8 +-
 drivers/gpu/drm/i915/i915_sysfs.c                  |  12 +-
 drivers/gpu/drm/lima/lima_drv.c                    |   8 +-
 drivers/input/touchscreen/goodix_berlin_core.c     |  10 +-
 drivers/pcmcia/cistpl.c                            |   8 +-
 drivers/rapidio/rio-sysfs.c                        |  14 +-
 fs/kernfs/dir.c                                    | 211 ++++++++++++---------
 fs/kernfs/file.c                                   |   6 +-
 fs/kernfs/kernfs-internal.h                        |  37 +++-
 fs/kernfs/mount.c                                  |  46 +++--
 fs/kernfs/symlink.c                                |  30 +--
 fs/sysfs/dir.c                                     |   2 +-
 fs/sysfs/file.c                                    |  24 ++-
 include/linux/device.h                             |   2 +-
 include/linux/device/class.h                       |   2 +-
 include/linux/kernfs.h                             |  14 +-
 kernel/Kconfig.hz                                  |   2 +-
 kernel/cgroup/cgroup-v1.c                          |   2 +-
 kernel/cgroup/cgroup.c                             |  24 ++-
 rust/kernel/device.rs                              |  26 +++
 rust/kernel/devres.rs                              |   2 +-
 rust/kernel/faux.rs                                |  16 +-
 rust/kernel/io.rs                                  |  66 +++----
 rust/kernel/pci.rs                                 | 150 +++++++++------
 rust/kernel/platform.rs                            | 104 +++++++---
 samples/rust/rust_driver_faux.rs                   |   2 +-
 samples/rust/rust_driver_pci.rs                    |  20 +-
 samples/rust/rust_driver_platform.rs               |  11 +-
 security/selinux/hooks.c                           |   7 +-
 tools/testing/selftests/bpf/progs/profiler.inc.h   |   2 +-
 59 files changed, 739 insertions(+), 450 deletions(-)
