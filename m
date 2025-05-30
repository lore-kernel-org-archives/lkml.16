Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5491DE8A6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577813; cv=none; b=XLb8AVxA74dsmpNrIrCcOMQ/2FnFzwTloaCuSiODb3eyMtbO5G6ETFXYqwWhHokBhbArbZIsSbo1uGfxp5hMhwCPSo4efTfJczLELasCzSxYjtrn7VK5O00nHEpmaJSBGMOf2AD2ElBcOsroMgVO2wrdoIhkNdlBSGh5I5vEbQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577813; c=relaxed/simple;
	bh=jpSNZZ6ka5EBJpW9cOEPCOcgQUUkBMqM+XkKEaIknJQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gUu5YX7MfzncjJ/CmHA8OqOPWBAsg7j0w1U68Dbba2rrMX9KjBegks7E7OIcP3PxTvp3CsdPeoUh6kqL9UQZ4bkNczim7FPPwNWrqIVU6KOg1v1t8s4OwagU8Gus4hyrM4iCbeCf8GC9bCxVR5/GVbESSMunGlAKQj2wsYhgxeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=rJy1QIus; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="rJy1QIus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748577803;
	bh=jpSNZZ6ka5EBJpW9cOEPCOcgQUUkBMqM+XkKEaIknJQ=;
	h=From:Subject:Date:To:Cc:From;
	b=rJy1QIusy50x5PDF6+D9/1WEv36iZK8p5SX1eZLTk34bIoNqqtYh1EJ/OTK7Qb1pN
	 f+gOVGhfBZP5CvYJhDifdTFvDjzJh+EXfKw2TVeleFhGNLniDG+iN4ETqckpJRsUqX
	 VnXiLaMMp4vUItXHsQv159lQMDaqFMJFq//8/h2w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Date: Fri, 30 May 2025 05:54:34 +0200
Message-Id: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPorOWgC/33NQQrCMBCF4auUrI0kaa2pK+8hIjGZ2AFJJROrp
 fTupgVxIXT5v8X3RkYQEYgdipFF6JGwCznKTcFsa8INOLrcTAm1E0ruOQ3kidsuUOJXDBeTUuQ
 eg7lz10DlhPXaSMcy8Ijg8b3gp3PuFil1cVi+ejmvX7ZZY3vJBRdKK+10bXxpjy9AIrLts90GS
 Gy2e/XzSlmueip7Ta10BRK0tvDnTdP0ARGzWTYZAQAA
X-Change-ID: 20250217-sysfs-const-bin_attr-final-d9e4d0cf8a1d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577802; l=9912;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jpSNZZ6ka5EBJpW9cOEPCOcgQUUkBMqM+XkKEaIknJQ=;
 b=gGxITmRmmxXZ0P+o3mpwehLz08/jzC25y1EOG90jWSFeD1wHapzMZeoh0WK1XyBVpt/lOuEW/
 iO40NaO+nx/DFhjs9bw0MSodoy0POk0LnoqtNdG3Dj9WXJHAeajpyRM
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

All users have been migrated to the new const types.
Change the types of the normal fields, switch all users over and then
get rid of the transition machinery.

The treewide changes have been done with sed/grep.
Based on top of next-20250528.
Meant to be applied around the end of the merge window.
As it is not clear what goes into the merge window this is done on
linux-next. Applying it will probably create some trivially to resolve
conflicts.

After applying, make sure no leftovers are left:
$ git grep bin_attrs_new
$ git grep read_new ':!drivers/block/swim_asm.S'
$ git grep write_new ':!drivers/cpufreq/powernow-k8.c' ':!drivers/s390/char/monwriter.c'

I'm only sending this to the sysfs maintainers. The treewide changes are
purely mechanical.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Drop already applied patches
- Constify internal references in fs/sysfs/file.c
- Update const_structs.checkpatch
- Rebase on linux-next/master
- Link to v2: https://lore.kernel.org/r/20250313-sysfs-const-bin_attr-final-v2-0-96284e1e88ce@weissschuh.net

Changes in v2:
- Rebase onto current driver-core-next.
- Remove prerequisites list from cover letter.
- Link to v1: https://lore.kernel.org/r/20250219-sysfs-const-bin_attr-final-v1-0-02828d86af3c@weissschuh.net

---
Thomas Weißschuh (6):
      const_structs.checkpatch: add bin_attribute
      sysfs: constify internal references to 'struct bin_attribute'
      sysfs: treewide: switch back to bin_attribute::read()/write()
      sysfs: treewide: switch back to attribute_group::bin_attrs
      sysfs: remove bin_attribute::read_new/write_new()
      sysfs: remove attribute_group::bin_attrs_new

 arch/powerpc/kernel/secvar-sysfs.c                 |  2 +-
 arch/powerpc/perf/hv-24x7.c                        |  2 +-
 arch/powerpc/platforms/powernv/opal-core.c         |  4 +--
 arch/powerpc/platforms/powernv/opal-dump.c         |  2 +-
 arch/powerpc/platforms/powernv/opal-elog.c         |  2 +-
 arch/powerpc/platforms/powernv/opal-flash.c        |  2 +-
 arch/powerpc/platforms/powernv/opal-msglog.c       |  2 +-
 arch/powerpc/platforms/powernv/opal.c              |  2 +-
 arch/powerpc/platforms/powernv/ultravisor.c        |  2 +-
 arch/s390/kernel/cpacf.c                           |  2 +-
 arch/s390/kernel/ipl.c                             | 18 ++++++------
 arch/s390/pci/pci_sysfs.c                          |  2 +-
 arch/x86/kernel/ksysfs.c                           |  8 ++---
 drivers/accel/habanalabs/common/sysfs.c            |  4 +--
 drivers/acpi/bgrt.c                                |  2 +-
 drivers/acpi/sysfs.c                               |  4 +--
 drivers/base/devcoredump.c                         |  2 +-
 drivers/base/firmware_loader/sysfs.c               |  6 ++--
 drivers/base/node.c                                |  2 +-
 drivers/base/topology.c                            |  2 +-
 drivers/cxl/port.c                                 |  2 +-
 drivers/firmware/efi/mokvar-table.c                |  2 +-
 drivers/firmware/google/cbmem.c                    |  2 +-
 drivers/firmware/google/gsmi.c                     |  2 +-
 drivers/firmware/google/memconsole.c               |  2 +-
 drivers/firmware/google/vpd.c                      |  4 +--
 drivers/firmware/qemu_fw_cfg.c                     |  2 +-
 drivers/fsi/fsi-core.c                             |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  4 +--
 drivers/gpu/drm/drm_sysfs.c                        |  4 +--
 drivers/gpu/drm/i915/i915_gpu_error.c              |  4 +--
 drivers/gpu/drm/i915/i915_sysfs.c                  |  8 ++---
 drivers/gpu/drm/lima/lima_drv.c                    |  4 +--
 drivers/hid/hid-core.c                             |  2 +-
 drivers/hid/hid-roccat-arvo.c                      |  2 +-
 drivers/hid/hid-roccat-common.h                    |  8 ++---
 drivers/hid/hid-roccat-isku.c                      | 10 +++----
 drivers/hid/hid-roccat-kone.c                      |  6 ++--
 drivers/hid/hid-roccat-koneplus.c                  | 14 ++++-----
 drivers/hid/hid-roccat-konepure.c                  |  2 +-
 drivers/hid/hid-roccat-kovaplus.c                  | 12 ++++----
 drivers/hid/hid-roccat-lua.c                       |  4 +--
 drivers/hid/hid-roccat-pyra.c                      | 14 ++++-----
 drivers/hid/hid-roccat-ryos.c                      |  2 +-
 drivers/hid/hid-roccat-savu.c                      |  2 +-
 drivers/i2c/i2c-slave-eeprom.c                     |  4 +--
 drivers/iio/imu/bno055/bno055.c                    |  2 +-
 drivers/infiniband/hw/hfi1/sysfs.c                 |  2 +-
 drivers/infiniband/hw/qib/qib_sysfs.c              |  2 +-
 drivers/input/touchscreen/goodix_berlin_core.c     |  2 +-
 drivers/leds/led-class.c                           |  2 +-
 drivers/media/pci/solo6x10/solo6x10-core.c         |  2 +-
 drivers/misc/c2port/core.c                         |  2 +-
 drivers/misc/ds1682.c                              |  4 +--
 drivers/misc/eeprom/max6875.c                      |  2 +-
 drivers/misc/ocxl/sysfs.c                          |  2 +-
 drivers/misc/pch_phub.c                            |  4 +--
 drivers/misc/sram.c                                |  4 +--
 drivers/mtd/spi-nor/sysfs.c                        |  2 +-
 .../net/ethernet/qlogic/netxen/netxen_nic_main.c   | 10 +++----
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c  | 34 +++++++++++-----------
 drivers/net/phy/spi_ks8995.c                       |  4 +--
 drivers/net/wireless/ti/wlcore/sysfs.c             |  2 +-
 drivers/nvmem/core.c                               | 14 ++++-----
 drivers/of/kobj.c                                  |  2 +-
 drivers/pci/hotplug/acpiphp_ibm.c                  |  2 +-
 drivers/pci/p2pdma.c                               |  2 +-
 drivers/pci/pci-sysfs.c                            | 12 ++++----
 drivers/pci/vpd.c                                  |  2 +-
 drivers/pcmcia/cistpl.c                            |  4 +--
 drivers/platform/chrome/cros_ec_vbc.c              |  2 +-
 drivers/platform/mellanox/mlxbf-bootctl.c          |  2 +-
 drivers/platform/x86/amd/hsmp/acpi.c               |  4 +--
 drivers/platform/x86/amd/hsmp/plat.c               |  4 +--
 drivers/platform/x86/dell/dcdbas.c                 |  2 +-
 drivers/platform/x86/dell/dell_rbu.c               |  2 +-
 drivers/platform/x86/intel/pmt/class.c             |  2 +-
 drivers/platform/x86/intel/sdsi.c                  |  2 +-
 drivers/platform/x86/wmi-bmof.c                    |  2 +-
 drivers/power/supply/ds2760_battery.c              |  2 +-
 drivers/power/supply/ds2780_battery.c              | 10 +++----
 drivers/power/supply/ds2781_battery.c              | 10 +++----
 drivers/power/supply/olpc_battery.c                |  4 +--
 drivers/ptp/ptp_ocp.c                              |  2 +-
 drivers/rapidio/rio-sysfs.c                        |  6 ++--
 drivers/s390/char/sclp_config.c                    |  2 +-
 drivers/s390/char/sclp_sd.c                        |  2 +-
 drivers/s390/cio/chp.c                             |  2 +-
 drivers/s390/crypto/pkey_sysfs.c                   |  8 ++---
 drivers/scsi/3w-sas.c                              |  4 +--
 drivers/scsi/arcmsr/arcmsr_attr.c                  |  6 ++--
 drivers/scsi/esas2r/esas2r_main.c                  |  6 ++--
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  2 +-
 drivers/scsi/ipr.c                                 | 10 +++----
 drivers/scsi/lpfc/lpfc_attr.c                      |  8 ++---
 drivers/scsi/qedf/qedf_attr.c                      |  4 +--
 drivers/scsi/qla2xxx/qla_attr.c                    | 28 +++++++++---------
 drivers/scsi/qla4xxx/ql4_attr.c                    |  4 +--
 drivers/scsi/scsi_sysfs.c                          |  6 ++--
 drivers/usb/core/sysfs.c                           |  2 +-
 drivers/usb/usbip/vudc_sysfs.c                     |  2 +-
 drivers/video/fbdev/aty/radeon_base.c              |  4 +--
 drivers/video/fbdev/udlfb.c                        |  4 +--
 drivers/virt/coco/guest/tsm-mr.c                   |  8 ++---
 drivers/w1/slaves/w1_ds2406.c                      |  4 +--
 drivers/w1/slaves/w1_ds2408.c                      |  2 +-
 drivers/w1/slaves/w1_ds2413.c                      |  2 +-
 drivers/w1/slaves/w1_ds2430.c                      |  2 +-
 drivers/w1/slaves/w1_ds2431.c                      |  2 +-
 drivers/w1/slaves/w1_ds2433.c                      | 12 ++++----
 drivers/w1/slaves/w1_ds2438.c                      |  2 +-
 drivers/w1/slaves/w1_ds2780.c                      |  2 +-
 drivers/w1/slaves/w1_ds2781.c                      |  2 +-
 drivers/w1/slaves/w1_ds2805.c                      |  4 +--
 drivers/w1/slaves/w1_ds28e04.c                     |  2 +-
 drivers/w1/w1.c                                    |  2 +-
 drivers/zorro/zorro-sysfs.c                        |  4 +--
 fs/sysfs/file.c                                    | 32 +++++++-------------
 include/linux/sysfs.h                              | 11 ++-----
 kernel/bpf/btf.c                                   |  2 +-
 kernel/bpf/sysfs_btf.c                             |  2 +-
 kernel/module/sysfs.c                              | 14 ++++-----
 mm/page_idle.c                                     |  2 +-
 net/bridge/br_sysfs_br.c                           |  2 +-
 scripts/const_structs.checkpatch                   |  1 +
 127 files changed, 292 insertions(+), 310 deletions(-)
---
base-commit: 2a628f951ed54c30a232230b5b58349d2a8dbb11
change-id: 20250217-sysfs-const-bin_attr-final-d9e4d0cf8a1d

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

