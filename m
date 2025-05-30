Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4F91DE896
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577815; cv=none; b=KI0wJepw+uN8EYzS6OpB2ggi5KU8KN/FKCjEJrVblwOK89nbKftqLOb3TcjRAetWAQEENYRIm++4DBDNhF9/rJy+yz+wByTPHuD61UUYA5LAXvKzPvBENkKPDzcJK6YNECbzOfAtgQHHTXmp9E2+imtFnagMmvSbWqvU7C1aJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577815; c=relaxed/simple;
	bh=SBvYM3WpXfTQ228A4WE6PNn3tmnFBf2F/MM69M5Z5HU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAj0Qc9GUUDBARIKzr9Fbyu1ldloNfjA9nqQK/cVAx93nymwAua3jPllTzpHZolVlkdzMWtecly5huNuVJEUDXg9/9rO9UvZRRaVITj0EW9leWtrug3cqsYbXFvWcYzO0zxlvchUXdsDmZU4YW316FDBGIqgb0irVei/YyeG+UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=K+769GzU; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="K+769GzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748577803;
	bh=SBvYM3WpXfTQ228A4WE6PNn3tmnFBf2F/MM69M5Z5HU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K+769GzUe/wCY1NxKsruvuTzkR7H689bOzO6yVbzNBSO8h9b0msQnCnq4ZmxGj9JD
	 vOCEaoXy8YeUnsvca4TgNJpbfFUB0KUTHw5EjWSvrDAwsaMY2vR5anpIFnyxTKbenv
	 JH05gnXItHYhE7PtmhT5SEEz1B8SbDhi3lJ15OYc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 30 May 2025 05:54:37 +0200
Subject: [PATCH v3 3/6] sysfs: treewide: switch back to
 bin_attribute::read()/write()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sysfs-const-bin_attr-final-v3-3-724bfcf05b99@weissschuh.net>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
In-Reply-To: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577802; l=69706;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=SBvYM3WpXfTQ228A4WE6PNn3tmnFBf2F/MM69M5Z5HU=;
 b=2Dn9G1CnTMLoLPiLJRy5AiF1KXux1e3JgJIiaCm1Z+03uBcXCZu+l51ft7JV/EBoFyj5s3Twn
 CAKnJqE2X8YDm/IXhYY10yDiRfQBTdooV1N1K/w7qystxUSImM/l8As
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The bin_attribute argument of bin_attribute::read() is now const.
This makes the _new() callbacks unnecessary. Switch all users back.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/powerpc/platforms/powernv/opal-core.c         |  2 +-
 arch/powerpc/platforms/powernv/opal-dump.c         |  2 +-
 arch/powerpc/platforms/powernv/opal-elog.c         |  2 +-
 arch/powerpc/platforms/powernv/opal-flash.c        |  2 +-
 arch/powerpc/platforms/powernv/opal-msglog.c       |  2 +-
 arch/powerpc/platforms/powernv/opal.c              |  2 +-
 arch/powerpc/platforms/powernv/ultravisor.c        |  2 +-
 arch/x86/kernel/ksysfs.c                           |  4 +--
 drivers/accel/habanalabs/common/sysfs.c            |  2 +-
 drivers/acpi/sysfs.c                               |  4 +--
 drivers/base/firmware_loader/sysfs.c               |  4 +--
 drivers/firmware/efi/mokvar-table.c                |  2 +-
 drivers/firmware/google/gsmi.c                     |  2 +-
 drivers/firmware/google/memconsole.c               |  2 +-
 drivers/firmware/google/vpd.c                      |  4 +--
 drivers/firmware/qemu_fw_cfg.c                     |  2 +-
 drivers/fsi/fsi-core.c                             |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  4 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c |  4 +--
 drivers/gpu/drm/drm_sysfs.c                        |  2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c              |  4 +--
 drivers/gpu/drm/i915/i915_sysfs.c                  |  8 ++---
 drivers/gpu/drm/lima/lima_drv.c                    |  4 +--
 drivers/hid/hid-roccat-common.h                    |  8 ++---
 drivers/hid/hid-roccat-isku.c                      |  8 ++---
 drivers/hid/hid-roccat-kone.c                      |  4 +--
 drivers/hid/hid-roccat-koneplus.c                  | 12 ++++----
 drivers/hid/hid-roccat-kovaplus.c                  | 10 +++----
 drivers/hid/hid-roccat-lua.c                       |  4 +--
 drivers/hid/hid-roccat-pyra.c                      | 12 ++++----
 drivers/i2c/i2c-slave-eeprom.c                     |  4 +--
 drivers/media/pci/solo6x10/solo6x10-core.c         |  2 +-
 drivers/misc/ds1682.c                              |  4 +--
 drivers/misc/eeprom/max6875.c                      |  2 +-
 drivers/misc/ocxl/sysfs.c                          |  2 +-
 drivers/misc/pch_phub.c                            |  4 +--
 drivers/misc/sram.c                                |  4 +--
 .../net/ethernet/qlogic/netxen/netxen_nic_main.c   | 10 +++----
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c  | 34 +++++++++++-----------
 drivers/net/phy/spi_ks8995.c                       |  4 +--
 drivers/net/wireless/ti/wlcore/sysfs.c             |  2 +-
 drivers/nvmem/core.c                               | 10 +++----
 drivers/of/kobj.c                                  |  2 +-
 drivers/pci/hotplug/acpiphp_ibm.c                  |  2 +-
 drivers/pci/pci-sysfs.c                            |  8 ++---
 drivers/pcmcia/cistpl.c                            |  4 +--
 drivers/platform/mellanox/mlxbf-bootctl.c          |  2 +-
 drivers/platform/x86/amd/hsmp/acpi.c               |  2 +-
 drivers/platform/x86/amd/hsmp/plat.c               |  2 +-
 drivers/platform/x86/intel/pmt/class.c             |  2 +-
 drivers/power/supply/ds2780_battery.c              |  8 ++---
 drivers/power/supply/ds2781_battery.c              |  8 ++---
 drivers/power/supply/olpc_battery.c                |  2 +-
 drivers/rapidio/rio-sysfs.c                        |  4 +--
 drivers/s390/char/sclp_config.c                    |  2 +-
 drivers/s390/char/sclp_sd.c                        |  2 +-
 drivers/scsi/3w-sas.c                              |  4 +--
 drivers/scsi/arcmsr/arcmsr_attr.c                  |  6 ++--
 drivers/scsi/esas2r/esas2r_main.c                  |  6 ++--
 drivers/scsi/ibmvscsi/ibmvfc.c                     |  2 +-
 drivers/scsi/ipr.c                                 | 10 +++----
 drivers/scsi/lpfc/lpfc_attr.c                      |  8 ++---
 drivers/scsi/qedf/qedf_attr.c                      |  4 +--
 drivers/scsi/qla2xxx/qla_attr.c                    | 28 +++++++++---------
 drivers/scsi/qla4xxx/ql4_attr.c                    |  4 +--
 drivers/scsi/scsi_sysfs.c                          |  4 +--
 drivers/video/fbdev/aty/radeon_base.c              |  4 +--
 drivers/video/fbdev/udlfb.c                        |  4 +--
 drivers/virt/coco/guest/tsm-mr.c                   |  4 +--
 drivers/w1/slaves/w1_ds2406.c                      |  4 +--
 drivers/w1/slaves/w1_ds2433.c                      |  8 ++---
 drivers/w1/slaves/w1_ds2805.c                      |  4 +--
 drivers/zorro/zorro-sysfs.c                        |  2 +-
 kernel/bpf/btf.c                                   |  2 +-
 kernel/bpf/sysfs_btf.c                             |  2 +-
 kernel/module/sysfs.c                              |  4 +--
 net/bridge/br_sysfs_br.c                           |  2 +-
 77 files changed, 188 insertions(+), 188 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index e652da8f986f0355583c9c3ebde187814c1c7224..6fe121aae4053d3f28fe07e12a3219e2e79758ad 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -208,7 +208,7 @@ static ssize_t read_opalcore(struct file *file, struct kobject *kobj,
 
 static struct bin_attribute opal_core_attr __ro_after_init = {
 	.attr = {.name = "core", .mode = 0400},
-	.read_new = read_opalcore
+	.read = read_opalcore
 };
 
 /*
diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 27e25693cf3990e4f53687d38355c4f4c0a7d8c5..cc3cc9ddf9d1876b326f3285775d20d0d5b15323 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -342,7 +342,7 @@ static void create_dump_obj(uint32_t id, size_t size, uint32_t type)
 	dump->dump_attr.attr.name = "dump";
 	dump->dump_attr.attr.mode = 0400;
 	dump->dump_attr.size = size;
-	dump->dump_attr.read_new = dump_attr_read;
+	dump->dump_attr.read = dump_attr_read;
 
 	dump->id = id;
 	dump->size = size;
diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index de33f354e9fdd1440f39407aecf1e7085e9b52df..c3fc5d2581460e7e52d6b82015beb25be5089ba1 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -203,7 +203,7 @@ static void create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	elog->raw_attr.attr.name = "raw";
 	elog->raw_attr.attr.mode = 0400;
 	elog->raw_attr.size = size;
-	elog->raw_attr.read_new = raw_attr_read;
+	elog->raw_attr.read = raw_attr_read;
 
 	elog->id = id;
 	elog->size = size;
diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index fd8c8621e97340cdf5570d72ce82f86516cb2786..a3f7a2928767f98c809f230275acb617f64ad45d 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -493,7 +493,7 @@ static ssize_t image_data_write(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute image_data_attr = {
 	.attr = {.name = "image", .mode = 0200},
 	.size = MAX_IMAGE_SIZE,	/* Limit image size */
-	.write_new = image_data_write,
+	.write = image_data_write,
 };
 
 static struct kobj_attribute validate_attribute =
diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index f1988d0ab45ce49f09f47c9e8859cc5dfcee3a6d..992a6b379a66a7071e60557ed69d2112f85b9e24 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -102,7 +102,7 @@ static ssize_t opal_msglog_read(struct file *file, struct kobject *kobj,
 
 static struct bin_attribute opal_msglog_attr __ro_after_init = {
 	.attr = {.name = "msglog", .mode = 0400},
-	.read_new = opal_msglog_read
+	.read = opal_msglog_read
 };
 
 struct memcons *__init memcons_init(struct device_node *node, const char *mc_prop_name)
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 9ec265fcaff4e2713f3fbb823bbfefd211fd3afd..09bd93464b4f72b901baf7911319f38b7874b265 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -815,7 +815,7 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
 	sysfs_bin_attr_init(attr);
 	attr->attr.name = name;
 	attr->attr.mode = 0400;
-	attr->read_new = sysfs_bin_attr_simple_read;
+	attr->read = sysfs_bin_attr_simple_read;
 	attr->private = __va(vals[0]);
 	attr->size = vals[1];
 
diff --git a/arch/powerpc/platforms/powernv/ultravisor.c b/arch/powerpc/platforms/powernv/ultravisor.c
index 157d9a8134e445ed22be8ae58ff9181b45ac7ff0..c526871a1229b1b5f524ab1ad65567f920b31c8d 100644
--- a/arch/powerpc/platforms/powernv/ultravisor.c
+++ b/arch/powerpc/platforms/powernv/ultravisor.c
@@ -40,7 +40,7 @@ static ssize_t uv_msglog_read(struct file *file, struct kobject *kobj,
 
 static struct bin_attribute uv_msglog_attr __ro_after_init = {
 	.attr = {.name = "msglog", .mode = 0400},
-	.read_new = uv_msglog_read
+	.read = uv_msglog_read
 };
 
 static int __init uv_init(void)
diff --git a/arch/x86/kernel/ksysfs.c b/arch/x86/kernel/ksysfs.c
index b68d4be9464efab13b808fd69092003a89b5612b..4ee7fd9dd69c46cf9a0e9205585d3f898122db96 100644
--- a/arch/x86/kernel/ksysfs.c
+++ b/arch/x86/kernel/ksysfs.c
@@ -40,7 +40,7 @@ static const struct bin_attribute boot_params_data_attr = {
 		.name = "data",
 		.mode = S_IRUGO,
 	},
-	.read_new = boot_params_data_read,
+	.read = boot_params_data_read,
 	.size = sizeof(boot_params),
 };
 
@@ -250,7 +250,7 @@ static struct bin_attribute data_attr __ro_after_init = {
 		.name = "data",
 		.mode = S_IRUGO,
 	},
-	.read_new = setup_data_data_read,
+	.read = setup_data_data_read,
 };
 
 static struct attribute *setup_data_type_attrs[] = {
diff --git a/drivers/accel/habanalabs/common/sysfs.c b/drivers/accel/habanalabs/common/sysfs.c
index 9d58efa2ff380c8773bd79bea613dc79a5a98020..678585cfef848b4222aac82c80a7d39a4148efb2 100644
--- a/drivers/accel/habanalabs/common/sysfs.c
+++ b/drivers/accel/habanalabs/common/sysfs.c
@@ -446,7 +446,7 @@ static DEVICE_ATTR_RO(parent_device);
 static const struct bin_attribute bin_attr_eeprom = {
 	.attr = {.name = "eeprom", .mode = (0444)},
 	.size = PAGE_SIZE,
-	.read_new = eeprom_read_handler
+	.read = eeprom_read_handler
 };
 
 static struct attribute *hl_dev_attrs[] = {
diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
index a48ebbf768f91ab354cd276f1b4dda2c063ef9b5..e596224302f4c833103001d7d8bee636db140ad6 100644
--- a/drivers/acpi/sysfs.c
+++ b/drivers/acpi/sysfs.c
@@ -372,7 +372,7 @@ static int acpi_table_attr_init(struct kobject *tables_obj,
 	}
 
 	table_attr->attr.size = table_header->length;
-	table_attr->attr.read_new = acpi_table_show;
+	table_attr->attr.read = acpi_table_show;
 	table_attr->attr.attr.name = table_attr->filename;
 	table_attr->attr.attr.mode = 0400;
 
@@ -495,7 +495,7 @@ static int acpi_table_data_init(struct acpi_table_header *th)
 			if (!data_attr)
 				return -ENOMEM;
 			sysfs_attr_init(&data_attr->attr.attr);
-			data_attr->attr.read_new = acpi_data_show;
+			data_attr->attr.read = acpi_data_show;
 			data_attr->attr.attr.mode = 0400;
 			return acpi_data_objs[i].fn(th, data_attr);
 		}
diff --git a/drivers/base/firmware_loader/sysfs.c b/drivers/base/firmware_loader/sysfs.c
index d254ceb56d8434e80085dcb4fdef2752582cdab8..c9b1564616f451d3913f2a3d07a2b20ffe2e39f3 100644
--- a/drivers/base/firmware_loader/sysfs.c
+++ b/drivers/base/firmware_loader/sysfs.c
@@ -359,8 +359,8 @@ static ssize_t firmware_data_write(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute firmware_attr_data = {
 	.attr = { .name = "data", .mode = 0644 },
 	.size = 0,
-	.read_new = firmware_data_read,
-	.write_new = firmware_data_write,
+	.read = firmware_data_read,
+	.write = firmware_data_write,
 };
 
 static struct attribute *fw_dev_attrs[] = {
diff --git a/drivers/firmware/efi/mokvar-table.c b/drivers/firmware/efi/mokvar-table.c
index 0a856c3f69a3ff94b3be928a6238077a09b5dc6a..aedbbd627706a1a8bb1d9aa8d7593d99a3764080 100644
--- a/drivers/firmware/efi/mokvar-table.c
+++ b/drivers/firmware/efi/mokvar-table.c
@@ -340,7 +340,7 @@ static int __init efi_mokvar_sysfs_init(void)
 		mokvar_sysfs->bin_attr.attr.name = mokvar_entry->name;
 		mokvar_sysfs->bin_attr.attr.mode = 0400;
 		mokvar_sysfs->bin_attr.size = mokvar_entry->data_size;
-		mokvar_sysfs->bin_attr.read_new = efi_mokvar_sysfs_read;
+		mokvar_sysfs->bin_attr.read = efi_mokvar_sysfs_read;
 
 		err = sysfs_create_bin_file(mokvar_kobj,
 					   &mokvar_sysfs->bin_attr);
diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index e8fb00dcaf65bc593dd15562f20aeea482ccfc3e..0ceccde5a3026696067c3e247820e7f42806cc19 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -530,7 +530,7 @@ static ssize_t eventlog_write(struct file *filp, struct kobject *kobj,
 
 static const struct bin_attribute eventlog_bin_attr = {
 	.attr = {.name = "append_to_eventlog", .mode = 0200},
-	.write_new = eventlog_write,
+	.write = eventlog_write,
 };
 
 static ssize_t gsmi_clear_eventlog_store(struct kobject *kobj,
diff --git a/drivers/firmware/google/memconsole.c b/drivers/firmware/google/memconsole.c
index d957af6f934984b74627e83f458575dbf2b7d592..6138a1653ec57caf7b7e4b37afa45f86651d8985 100644
--- a/drivers/firmware/google/memconsole.c
+++ b/drivers/firmware/google/memconsole.c
@@ -28,7 +28,7 @@ static ssize_t memconsole_read(struct file *filp, struct kobject *kobp,
 
 static struct bin_attribute memconsole_bin_attr = {
 	.attr = {.name = "log", .mode = 0444},
-	.read_new = memconsole_read,
+	.read = memconsole_read,
 };
 
 void memconsole_setup(ssize_t (*read_func)(char *, loff_t, size_t))
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 254ac6545d680ac099ae2efa3c2109c9eb8c41be..339a3f74b24721700dbad82347490cdb3eaad724 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -121,7 +121,7 @@ static int vpd_section_attrib_add(const u8 *key, u32 key_len,
 	info->bin_attr.attr.name = info->key;
 	info->bin_attr.attr.mode = 0444;
 	info->bin_attr.size = value_len;
-	info->bin_attr.read_new = vpd_attrib_read;
+	info->bin_attr.read = vpd_attrib_read;
 	info->bin_attr.private = info;
 
 	info->value = value;
@@ -201,7 +201,7 @@ static int vpd_section_init(const char *name, struct vpd_section *sec,
 	sec->bin_attr.attr.name = sec->raw_name;
 	sec->bin_attr.attr.mode = 0444;
 	sec->bin_attr.size = size;
-	sec->bin_attr.read_new = vpd_section_read;
+	sec->bin_attr.read = vpd_section_read;
 	sec->bin_attr.private = sec;
 
 	err = sysfs_create_bin_file(vpd_kobj, &sec->bin_attr);
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 2615fb780e3c4500db36d4746880455f05479f1f..0eebd572f9a54d1dead9feefa1084de4da0a2ec8 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -476,7 +476,7 @@ static ssize_t fw_cfg_sysfs_read_raw(struct file *filp, struct kobject *kobj,
 
 static const struct bin_attribute fw_cfg_sysfs_attr_raw = {
 	.attr = { .name = "raw", .mode = S_IRUSR },
-	.read_new = fw_cfg_sysfs_read_raw,
+	.read = fw_cfg_sysfs_read_raw,
 };
 
 /*
diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 50e8736039fe686dd402ecf8fabe37a4c237d71b..d303939e0b901f09c5751f3d72e8574dddea65c0 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -613,8 +613,8 @@ static const struct bin_attribute fsi_slave_raw_attr = {
 		.mode = 0600,
 	},
 	.size = 0,
-	.read_new = fsi_slave_sysfs_raw_read,
-	.write_new = fsi_slave_sysfs_raw_write,
+	.read = fsi_slave_sysfs_raw_read,
+	.write = fsi_slave_sysfs_raw_write,
 };
 
 static void fsi_slave_release(struct device *dev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index e6f0b035e20b22e111a7396f6d78ae9b922cd223..be9f03bbcb36c5a6c7a355c677c3b6f4c255f96f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -4117,8 +4117,8 @@ static ssize_t amdgpu_psp_vbflash_read(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute psp_vbflash_bin_attr = {
 	.attr = {.name = "psp_vbflash", .mode = 0660},
 	.size = 0,
-	.write_new = amdgpu_psp_vbflash_write,
-	.read_new = amdgpu_psp_vbflash_read,
+	.write = amdgpu_psp_vbflash_write,
+	.read = amdgpu_psp_vbflash_read,
 };
 
 /**
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index c16962256514eba5b5146ffcf61799c3140c3568..b1d1897f5eaf16cc14d6efdc89a84265dbc5b114 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -723,8 +723,8 @@ static ssize_t srm_data_read(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute data_attr = {
 	.attr = {.name = "hdcp_srm", .mode = 0664},
 	.size = PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, /* Limit SRM size */
-	.write_new = srm_data_write,
-	.read_new = srm_data_read,
+	.write = srm_data_write,
+	.read = srm_data_read,
 };
 
 struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6fad23153c32a29fd3be02700fc938..8d27ba7f0d83bcb5d32789cf46b4beec5a5715f6 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -319,7 +319,7 @@ static const struct bin_attribute edid_attr = {
 	.attr.name = "edid",
 	.attr.mode = 0444,
 	.size = 0,
-	.read_new = edid_show,
+	.read = edid_show,
 };
 
 static const struct bin_attribute *const connector_bin_attrs[] = {
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 4f785cdbd1553a7a033a5c4b87b16d616e196d88..568525d49428ed8756f54720d15b897d9e7f3afc 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -2506,8 +2506,8 @@ static const struct bin_attribute error_state_attr = {
 	.attr.name = "error",
 	.attr.mode = S_IRUSR | S_IWUSR,
 	.size = 0,
-	.read_new = error_state_read,
-	.write_new = error_state_write,
+	.read = error_state_read,
+	.write = error_state_write,
 };
 
 void i915_gpu_error_sysfs_setup(struct drm_i915_private *i915)
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index f936e8f1f12942287a5a7d6aa7db6ed3a4c28281..622c66666935505112e46e1f4db5c984e63b3c56 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -140,8 +140,8 @@ i915_l3_write(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute dpf_attrs = {
 	.attr = {.name = "l3_parity", .mode = (S_IRUSR | S_IWUSR)},
 	.size = GEN7_L3LOG_SIZE,
-	.read_new = i915_l3_read,
-	.write_new = i915_l3_write,
+	.read = i915_l3_read,
+	.write = i915_l3_write,
 	.mmap = NULL,
 	.private = (void *)0
 };
@@ -149,8 +149,8 @@ static const struct bin_attribute dpf_attrs = {
 static const struct bin_attribute dpf_attrs_1 = {
 	.attr = {.name = "l3_parity_slice_1", .mode = (S_IRUSR | S_IWUSR)},
 	.size = GEN7_L3LOG_SIZE,
-	.read_new = i915_l3_read,
-	.write_new = i915_l3_write,
+	.read = i915_l3_read,
+	.write = i915_l3_write,
 	.mmap = NULL,
 	.private = (void *)1
 };
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 11ace5cebf4c81b5d863efb0ad13dfcfc2373f7a..65210ab081bbac56cc1f2632941806a621223673 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -362,8 +362,8 @@ static const struct bin_attribute lima_error_state_attr = {
 	.attr.name = "error",
 	.attr.mode = 0600,
 	.size = 0,
-	.read_new = lima_error_state_read,
-	.write_new = lima_error_state_write,
+	.read = lima_error_state_read,
+	.write = lima_error_state_write,
 };
 
 static int lima_pdev_probe(struct platform_device *pdev)
diff --git a/drivers/hid/hid-roccat-common.h b/drivers/hid/hid-roccat-common.h
index 0f9a2db04df96aaa2fe87adc00ec14f8fa30ed82..e931d0b48efe2991faec32d526a058f287d41380 100644
--- a/drivers/hid/hid-roccat-common.h
+++ b/drivers/hid/hid-roccat-common.h
@@ -71,8 +71,8 @@ ROCCAT_COMMON2_SYSFS_RW(thingy, COMMAND, SIZE); \
 static const struct bin_attribute bin_attr_ ## thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = SIZE, \
-	.read_new = roccat_common2_sysfs_read_ ## thingy, \
-	.write_new = roccat_common2_sysfs_write_ ## thingy \
+	.read = roccat_common2_sysfs_read_ ## thingy, \
+	.write = roccat_common2_sysfs_write_ ## thingy \
 }
 
 #define ROCCAT_COMMON2_BIN_ATTRIBUTE_R(thingy, COMMAND, SIZE) \
@@ -80,7 +80,7 @@ ROCCAT_COMMON2_SYSFS_R(thingy, COMMAND, SIZE); \
 static const struct bin_attribute bin_attr_ ## thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size = SIZE, \
-	.read_new = roccat_common2_sysfs_read_ ## thingy, \
+	.read = roccat_common2_sysfs_read_ ## thingy, \
 }
 
 #define ROCCAT_COMMON2_BIN_ATTRIBUTE_W(thingy, COMMAND, SIZE) \
@@ -88,7 +88,7 @@ ROCCAT_COMMON2_SYSFS_W(thingy, COMMAND, SIZE); \
 static const struct bin_attribute bin_attr_ ## thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = SIZE, \
-	.write_new = roccat_common2_sysfs_write_ ## thingy \
+	.write = roccat_common2_sysfs_write_ ## thingy \
 }
 
 #endif
diff --git a/drivers/hid/hid-roccat-isku.c b/drivers/hid/hid-roccat-isku.c
index 65a84bfcc2f86432753c148dbb78d77de70bafb9..9fddc42f241b21328b58efa43ac6d1213b494ab1 100644
--- a/drivers/hid/hid-roccat-isku.c
+++ b/drivers/hid/hid-roccat-isku.c
@@ -181,8 +181,8 @@ ISKU_SYSFS_RW(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = ISKU_SIZE_ ## THINGY, \
-	.read_new = isku_sysfs_read_ ## thingy, \
-	.write_new = isku_sysfs_write_ ## thingy \
+	.read = isku_sysfs_read_ ## thingy, \
+	.write = isku_sysfs_write_ ## thingy \
 }
 
 #define ISKU_BIN_ATTR_R(thingy, THINGY) \
@@ -190,7 +190,7 @@ ISKU_SYSFS_R(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size = ISKU_SIZE_ ## THINGY, \
-	.read_new = isku_sysfs_read_ ## thingy, \
+	.read = isku_sysfs_read_ ## thingy, \
 }
 
 #define ISKU_BIN_ATTR_W(thingy, THINGY) \
@@ -198,7 +198,7 @@ ISKU_SYSFS_W(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = ISKU_SIZE_ ## THINGY, \
-	.write_new = isku_sysfs_write_ ## thingy \
+	.write = isku_sysfs_write_ ## thingy \
 }
 
 ISKU_BIN_ATTR_RW(macro, MACRO);
diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index b3c0242e5a37848893e2ab4303f5e6f04a650208..af8ef42aca02809a934c3efe1b3c7eb8fbc4da54 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -385,8 +385,8 @@ static ssize_t kone_sysfs_write_profilex(struct file *fp,
 static const struct bin_attribute bin_attr_profile##number = {	\
 	.attr = { .name = "profile" #number, .mode = 0660 },	\
 	.size = sizeof(struct kone_profile),			\
-	.read_new = kone_sysfs_read_profilex,			\
-	.write_new = kone_sysfs_write_profilex,			\
+	.read = kone_sysfs_read_profilex,			\
+	.write = kone_sysfs_write_profilex,			\
 	.private = &profile_numbers[number-1],			\
 }
 PROFILE_ATTR(1);
diff --git a/drivers/hid/hid-roccat-koneplus.c b/drivers/hid/hid-roccat-koneplus.c
index 5d8a5ce88b4cae003cf0e0cbf6dc818ac71e0625..c3f01f7b7e488d2aa21bf82a37601035fe3970a9 100644
--- a/drivers/hid/hid-roccat-koneplus.c
+++ b/drivers/hid/hid-roccat-koneplus.c
@@ -153,8 +153,8 @@ KONEPLUS_SYSFS_RW(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = KONEPLUS_SIZE_ ## THINGY, \
-	.read_new = koneplus_sysfs_read_ ## thingy, \
-	.write_new = koneplus_sysfs_write_ ## thingy \
+	.read = koneplus_sysfs_read_ ## thingy, \
+	.write = koneplus_sysfs_write_ ## thingy \
 }
 
 #define KONEPLUS_BIN_ATTRIBUTE_R(thingy, THINGY) \
@@ -162,7 +162,7 @@ KONEPLUS_SYSFS_R(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size = KONEPLUS_SIZE_ ## THINGY, \
-	.read_new = koneplus_sysfs_read_ ## thingy, \
+	.read = koneplus_sysfs_read_ ## thingy, \
 }
 
 #define KONEPLUS_BIN_ATTRIBUTE_W(thingy, THINGY) \
@@ -170,7 +170,7 @@ KONEPLUS_SYSFS_W(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = KONEPLUS_SIZE_ ## THINGY, \
-	.write_new = koneplus_sysfs_write_ ## thingy \
+	.write = koneplus_sysfs_write_ ## thingy \
 }
 KONEPLUS_BIN_ATTRIBUTE_W(control, CONTROL);
 KONEPLUS_BIN_ATTRIBUTE_W(talk, TALK);
@@ -222,13 +222,13 @@ static ssize_t koneplus_sysfs_read_profilex_buttons(struct file *fp,
 static const struct bin_attribute bin_attr_profile##number##_settings = {	\
 	.attr = { .name = "profile" #number "_settings", .mode = 0440 },	\
 	.size = KONEPLUS_SIZE_PROFILE_SETTINGS,				\
-	.read_new = koneplus_sysfs_read_profilex_settings,		\
+	.read = koneplus_sysfs_read_profilex_settings,		\
 	.private = &profile_numbers[number-1],				\
 };									\
 static const struct bin_attribute bin_attr_profile##number##_buttons = {	\
 	.attr = { .name = "profile" #number "_buttons", .mode = 0440 },	\
 	.size = KONEPLUS_SIZE_PROFILE_BUTTONS,				\
-	.read_new = koneplus_sysfs_read_profilex_buttons,		\
+	.read = koneplus_sysfs_read_profilex_buttons,		\
 	.private = &profile_numbers[number-1],				\
 };
 PROFILE_ATTR(1);
diff --git a/drivers/hid/hid-roccat-kovaplus.c b/drivers/hid/hid-roccat-kovaplus.c
index e31e4a2e62d5a79241a0e2a0fcb9518f4f6c59ff..7d625ed53c9f4b82490bc5b76a8e8263e4c8cadc 100644
--- a/drivers/hid/hid-roccat-kovaplus.c
+++ b/drivers/hid/hid-roccat-kovaplus.c
@@ -196,8 +196,8 @@ KOVAPLUS_SYSFS_RW(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = KOVAPLUS_SIZE_ ## THINGY, \
-	.read_new = kovaplus_sysfs_read_ ## thingy, \
-	.write_new = kovaplus_sysfs_write_ ## thingy \
+	.read = kovaplus_sysfs_read_ ## thingy, \
+	.write = kovaplus_sysfs_write_ ## thingy \
 }
 
 #define KOVAPLUS_BIN_ATTRIBUTE_W(thingy, THINGY) \
@@ -205,7 +205,7 @@ KOVAPLUS_SYSFS_W(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = KOVAPLUS_SIZE_ ## THINGY, \
-	.write_new = kovaplus_sysfs_write_ ## thingy \
+	.write = kovaplus_sysfs_write_ ## thingy \
 }
 KOVAPLUS_BIN_ATTRIBUTE_W(control, CONTROL);
 KOVAPLUS_BIN_ATTRIBUTE_RW(info, INFO);
@@ -252,13 +252,13 @@ static ssize_t kovaplus_sysfs_read_profilex_buttons(struct file *fp,
 static const struct bin_attribute bin_attr_profile##number##_settings = {	\
 	.attr = { .name = "profile" #number "_settings", .mode = 0440 },	\
 	.size = KOVAPLUS_SIZE_PROFILE_SETTINGS,				\
-	.read_new = kovaplus_sysfs_read_profilex_settings,			\
+	.read = kovaplus_sysfs_read_profilex_settings,			\
 	.private = &profile_numbers[number-1],				\
 };									\
 static const struct bin_attribute bin_attr_profile##number##_buttons = {	\
 	.attr = { .name = "profile" #number "_buttons", .mode = 0440 },	\
 	.size = KOVAPLUS_SIZE_PROFILE_BUTTONS,				\
-	.read_new = kovaplus_sysfs_read_profilex_buttons,			\
+	.read = kovaplus_sysfs_read_profilex_buttons,			\
 	.private = &profile_numbers[number-1],				\
 };
 PROFILE_ATTR(1);
diff --git a/drivers/hid/hid-roccat-lua.c b/drivers/hid/hid-roccat-lua.c
index 023ec64b4b0ea2f8168839ef6fd2c93c02846eab..45e30549c236cfc90b2b3d971ae836208c6f7a78 100644
--- a/drivers/hid/hid-roccat-lua.c
+++ b/drivers/hid/hid-roccat-lua.c
@@ -88,8 +88,8 @@ LUA_SYSFS_R(thingy, THINGY) \
 static const struct bin_attribute lua_ ## thingy ## _attr = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = LUA_SIZE_ ## THINGY, \
-	.read_new = lua_sysfs_read_ ## thingy, \
-	.write_new = lua_sysfs_write_ ## thingy \
+	.read = lua_sysfs_read_ ## thingy, \
+	.write = lua_sysfs_write_ ## thingy \
 };
 
 LUA_BIN_ATTRIBUTE_RW(control, CONTROL)
diff --git a/drivers/hid/hid-roccat-pyra.c b/drivers/hid/hid-roccat-pyra.c
index 2b53fbfbb8979ad1d1994e462b624b3f72480447..dbb9055853696bafad6266872f18819b5560a6c3 100644
--- a/drivers/hid/hid-roccat-pyra.c
+++ b/drivers/hid/hid-roccat-pyra.c
@@ -154,8 +154,8 @@ PYRA_SYSFS_RW(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0660 }, \
 	.size = PYRA_SIZE_ ## THINGY, \
-	.read_new = pyra_sysfs_read_ ## thingy, \
-	.write_new = pyra_sysfs_write_ ## thingy \
+	.read = pyra_sysfs_read_ ## thingy, \
+	.write = pyra_sysfs_write_ ## thingy \
 }
 
 #define PYRA_BIN_ATTRIBUTE_R(thingy, THINGY) \
@@ -163,7 +163,7 @@ PYRA_SYSFS_R(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0440 }, \
 	.size_new = PYRA_SIZE_ ## THINGY, \
-	.read_new = pyra_sysfs_read_ ## thingy, \
+	.read = pyra_sysfs_read_ ## thingy, \
 }
 
 #define PYRA_BIN_ATTRIBUTE_W(thingy, THINGY) \
@@ -171,7 +171,7 @@ PYRA_SYSFS_W(thingy, THINGY); \
 static const struct bin_attribute bin_attr_##thingy = { \
 	.attr = { .name = #thingy, .mode = 0220 }, \
 	.size = PYRA_SIZE_ ## THINGY, \
-	.write_new = pyra_sysfs_write_ ## thingy \
+	.write = pyra_sysfs_write_ ## thingy \
 }
 
 PYRA_BIN_ATTRIBUTE_W(control, CONTROL);
@@ -219,13 +219,13 @@ static ssize_t pyra_sysfs_read_profilex_buttons(struct file *fp,
 static const struct bin_attribute bin_attr_profile##number##_settings = {	\
 	.attr = { .name = "profile" #number "_settings", .mode = 0440 },	\
 	.size = PYRA_SIZE_PROFILE_SETTINGS,				\
-	.read_new = pyra_sysfs_read_profilex_settings,			\
+	.read = pyra_sysfs_read_profilex_settings,			\
 	.private = &profile_numbers[number-1],				\
 };									\
 static const struct bin_attribute bin_attr_profile##number##_buttons = {	\
 	.attr = { .name = "profile" #number "_buttons", .mode = 0440 },	\
 	.size = PYRA_SIZE_PROFILE_BUTTONS,				\
-	.read_new = pyra_sysfs_read_profilex_buttons,			\
+	.read = pyra_sysfs_read_profilex_buttons,			\
 	.private = &profile_numbers[number-1],				\
 };
 PROFILE_ATTR(1);
diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 275d1d0e910fbec72c4795cb3aafa714c52fcd94..6bc2ef650a74eb61f36ff7e3adac5f7709213085 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -165,8 +165,8 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client)
 	sysfs_bin_attr_init(&eeprom->bin);
 	eeprom->bin.attr.name = "slave-eeprom";
 	eeprom->bin.attr.mode = S_IRUSR | S_IWUSR;
-	eeprom->bin.read_new = i2c_slave_eeprom_bin_read;
-	eeprom->bin.write_new = i2c_slave_eeprom_bin_write;
+	eeprom->bin.read = i2c_slave_eeprom_bin_read;
+	eeprom->bin.write = i2c_slave_eeprom_bin_write;
 	eeprom->bin.size = size;
 
 	ret = sysfs_create_bin_file(&client->dev.kobj, &eeprom->bin);
diff --git a/drivers/media/pci/solo6x10/solo6x10-core.c b/drivers/media/pci/solo6x10/solo6x10-core.c
index febb2c156cf63af185c04937926f963eb71e690b..d1d3a83d01226fb08345f4d85ef0c2ea938c3af2 100644
--- a/drivers/media/pci/solo6x10/solo6x10-core.c
+++ b/drivers/media/pci/solo6x10/solo6x10-core.c
@@ -432,7 +432,7 @@ static int solo_sysfs_init(struct solo_dev *solo_dev)
 	sysfs_attr_init(&sdram_attr->attr);
 	sdram_attr->attr.name = "sdram";
 	sdram_attr->attr.mode = 0440;
-	sdram_attr->read_new = sdram_show;
+	sdram_attr->read = sdram_show;
 	sdram_attr->size = solo_dev->sdram_size;
 
 	if (device_create_bin_file(dev, sdram_attr)) {
diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index 5d5a70a62e98b6691aac1c0f9142d39555ba4f8c..cb09e056531a47fac215185b0726d76af2efe5cd 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -194,8 +194,8 @@ static const struct bin_attribute ds1682_eeprom_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = DS1682_EEPROM_SIZE,
-	.read_new = ds1682_eeprom_read,
-	.write_new = ds1682_eeprom_write,
+	.read = ds1682_eeprom_read,
+	.write = ds1682_eeprom_write,
 };
 
 static int ds1682_nvmem_read(void *priv, unsigned int offset, void *val,
diff --git a/drivers/misc/eeprom/max6875.c b/drivers/misc/eeprom/max6875.c
index 1c36ad153e783ead6ba2481c64838390f0bb05f4..a3e4cada3b51011a24775e1000a8f8002f0b226e 100644
--- a/drivers/misc/eeprom/max6875.c
+++ b/drivers/misc/eeprom/max6875.c
@@ -127,7 +127,7 @@ static const struct bin_attribute user_eeprom_attr = {
 		.mode = S_IRUGO,
 	},
 	.size = USER_EEPROM_SIZE,
-	.read_new = max6875_read,
+	.read = max6875_read,
 };
 
 static int max6875_probe(struct i2c_client *client)
diff --git a/drivers/misc/ocxl/sysfs.c b/drivers/misc/ocxl/sysfs.c
index e849641687a005fec5eb7a6b2e96bc0e9d04dc05..3100f0944fd996024f6eaf45da88a51a7dbb2ac5 100644
--- a/drivers/misc/ocxl/sysfs.c
+++ b/drivers/misc/ocxl/sysfs.c
@@ -155,7 +155,7 @@ int ocxl_sysfs_register_afu(struct ocxl_file_info *info)
 	info->attr_global_mmio.attr.name = "global_mmio_area";
 	info->attr_global_mmio.attr.mode = 0600;
 	info->attr_global_mmio.size = info->afu->config.global_mmio_size;
-	info->attr_global_mmio.read_new = global_mmio_read;
+	info->attr_global_mmio.read = global_mmio_read;
 	info->attr_global_mmio.mmap = global_mmio_mmap;
 	rc = device_create_bin_file(&info->dev, &info->attr_global_mmio);
 	if (rc) {
diff --git a/drivers/misc/pch_phub.c b/drivers/misc/pch_phub.c
index 6121c0940cd148d48b8d574065c50703b6a301d7..7bee179841bcde4e8f41dddd71740f6a97b5c823 100644
--- a/drivers/misc/pch_phub.c
+++ b/drivers/misc/pch_phub.c
@@ -655,8 +655,8 @@ static const struct bin_attribute pch_bin_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = PCH_PHUB_OROM_SIZE + 1,
-	.read_new = pch_phub_bin_read,
-	.write_new = pch_phub_bin_write,
+	.read = pch_phub_bin_read,
+	.write = pch_phub_bin_write,
 };
 
 static int pch_phub_probe(struct pci_dev *pdev,
diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index e5069882457ef6ba5dc084d02994034dc39d24c6..8fb8a43de29615ee3ec1a8d222095e10b4b28990 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -83,8 +83,8 @@ static int sram_add_export(struct sram_dev *sram, struct sram_reserve *block,
 		return -ENOMEM;
 
 	part->battr.attr.mode = S_IRUSR | S_IWUSR;
-	part->battr.read_new = sram_read;
-	part->battr.write_new = sram_write;
+	part->battr.read = sram_read;
+	part->battr.write = sram_write;
 	part->battr.size = block->size;
 
 	return device_create_bin_file(sram->dev, &part->battr);
diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
index 3383ee1dad14e2cb40062b27f32a7cffb6f3fac2..e8ff661fa4a5207470de6f8bff17d7b77ba73afc 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
@@ -2946,15 +2946,15 @@ static ssize_t netxen_sysfs_write_mem(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute bin_attr_crb = {
 	.attr = { .name = "crb", .mode = 0644 },
 	.size = 0,
-	.read_new = netxen_sysfs_read_crb,
-	.write_new = netxen_sysfs_write_crb,
+	.read = netxen_sysfs_read_crb,
+	.write = netxen_sysfs_write_crb,
 };
 
 static const struct bin_attribute bin_attr_mem = {
 	.attr = { .name = "mem", .mode = 0644 },
 	.size = 0,
-	.read_new = netxen_sysfs_read_mem,
-	.write_new = netxen_sysfs_write_mem,
+	.read = netxen_sysfs_read_mem,
+	.write = netxen_sysfs_write_mem,
 };
 
 static ssize_t
@@ -3082,7 +3082,7 @@ netxen_sysfs_read_dimm(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute bin_attr_dimm = {
 	.attr = { .name = "dimm", .mode = 0644 },
 	.size = sizeof(struct netxen_dimm_cfg),
-	.read_new = netxen_sysfs_read_dimm,
+	.read = netxen_sysfs_read_dimm,
 };
 
 
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c
index c0f20464fd1e0123b06c128a67f4091a5ba973eb..5296d9a6ee831f5c23eceae080b440d861a614c5 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_sysfs.c
@@ -1195,63 +1195,63 @@ static const struct device_attribute dev_attr_beacon = {
 static const struct bin_attribute bin_attr_crb = {
 	.attr = { .name = "crb", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_read_crb,
-	.write_new = qlcnic_sysfs_write_crb,
+	.read = qlcnic_sysfs_read_crb,
+	.write = qlcnic_sysfs_write_crb,
 };
 
 static const struct bin_attribute bin_attr_mem = {
 	.attr = { .name = "mem", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_read_mem,
-	.write_new = qlcnic_sysfs_write_mem,
+	.read = qlcnic_sysfs_read_mem,
+	.write = qlcnic_sysfs_write_mem,
 };
 
 static const struct bin_attribute bin_attr_npar_config = {
 	.attr = { .name = "npar_config", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_read_npar_config,
-	.write_new = qlcnic_sysfs_write_npar_config,
+	.read = qlcnic_sysfs_read_npar_config,
+	.write = qlcnic_sysfs_write_npar_config,
 };
 
 static const struct bin_attribute bin_attr_pci_config = {
 	.attr = { .name = "pci_config", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_read_pci_config,
+	.read = qlcnic_sysfs_read_pci_config,
 };
 
 static const struct bin_attribute bin_attr_port_stats = {
 	.attr = { .name = "port_stats", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_get_port_stats,
-	.write_new = qlcnic_sysfs_clear_port_stats,
+	.read = qlcnic_sysfs_get_port_stats,
+	.write = qlcnic_sysfs_clear_port_stats,
 };
 
 static const struct bin_attribute bin_attr_esw_stats = {
 	.attr = { .name = "esw_stats", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_get_esw_stats,
-	.write_new = qlcnic_sysfs_clear_esw_stats,
+	.read = qlcnic_sysfs_get_esw_stats,
+	.write = qlcnic_sysfs_clear_esw_stats,
 };
 
 static const struct bin_attribute bin_attr_esw_config = {
 	.attr = { .name = "esw_config", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_read_esw_config,
-	.write_new = qlcnic_sysfs_write_esw_config,
+	.read = qlcnic_sysfs_read_esw_config,
+	.write = qlcnic_sysfs_write_esw_config,
 };
 
 static const struct bin_attribute bin_attr_pm_config = {
 	.attr = { .name = "pm_config", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_sysfs_read_pm_config,
-	.write_new = qlcnic_sysfs_write_pm_config,
+	.read = qlcnic_sysfs_read_pm_config,
+	.write = qlcnic_sysfs_write_pm_config,
 };
 
 static const struct bin_attribute bin_attr_flash = {
 	.attr = { .name = "flash", .mode = 0644 },
 	.size = 0,
-	.read_new = qlcnic_83xx_sysfs_flash_read_handler,
-	.write_new = qlcnic_83xx_sysfs_flash_write_handler,
+	.read = qlcnic_83xx_sysfs_flash_read_handler,
+	.write = qlcnic_83xx_sysfs_flash_write_handler,
 };
 
 #ifdef CONFIG_QLCNIC_HWMON
diff --git a/drivers/net/phy/spi_ks8995.c b/drivers/net/phy/spi_ks8995.c
index 076a370be849e00c57a3be0bbce83c4665c49593..d135b061d810b7ba0c0731d43d176f3ba46b3f52 100644
--- a/drivers/net/phy/spi_ks8995.c
+++ b/drivers/net/phy/spi_ks8995.c
@@ -401,8 +401,8 @@ static const struct bin_attribute ks8995_registers_attr = {
 		.mode   = 0600,
 	},
 	.size   = KS8995_REGS_SIZE,
-	.read_new   = ks8995_registers_read,
-	.write_new  = ks8995_registers_write,
+	.read   = ks8995_registers_read,
+	.write  = ks8995_registers_write,
 };
 
 /* ------------------------------------------------------------------------ */
diff --git a/drivers/net/wireless/ti/wlcore/sysfs.c b/drivers/net/wireless/ti/wlcore/sysfs.c
index 7c57d4c8744ad5d19f11c5765cc7bf27aadbf740..65ca5dc569a0471a8042c069eb9da81614e708b0 100644
--- a/drivers/net/wireless/ti/wlcore/sysfs.c
+++ b/drivers/net/wireless/ti/wlcore/sysfs.c
@@ -121,7 +121,7 @@ static ssize_t wl1271_sysfs_read_fwlog(struct file *filp, struct kobject *kobj,
 
 static const struct bin_attribute fwlog_attr = {
 	.attr = { .name = "fwlog", .mode = 0400 },
-	.read_new = wl1271_sysfs_read_fwlog,
+	.read = wl1271_sysfs_read_fwlog,
 };
 
 int wlcore_sysfs_init(struct wl1271 *wl)
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fd2a9698d1c93ee52a4d86f6e0a19d2dfb6efb54..f0a664bcb01a0b43fb6ea9cd62cb01211277b931 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -376,8 +376,8 @@ static const struct bin_attribute bin_attr_rw_nvmem = {
 		.name	= "nvmem",
 		.mode	= 0644,
 	},
-	.read_new	= bin_attr_nvmem_read,
-	.write_new	= bin_attr_nvmem_write,
+	.read	= bin_attr_nvmem_read,
+	.write	= bin_attr_nvmem_write,
 };
 
 static const struct bin_attribute *const nvmem_bin_attributes[] = {
@@ -402,8 +402,8 @@ static const struct bin_attribute bin_attr_nvmem_eeprom_compat = {
 	.attr	= {
 		.name	= "eeprom",
 	},
-	.read_new	= bin_attr_nvmem_read,
-	.write_new	= bin_attr_nvmem_write,
+	.read	= bin_attr_nvmem_read,
+	.write	= bin_attr_nvmem_write,
 };
 
 /*
@@ -492,7 +492,7 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 						    entry->bit_offset);
 		attrs[i].attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
 		attrs[i].size = entry->bytes;
-		attrs[i].read_new = &nvmem_cell_attr_read;
+		attrs[i].read = &nvmem_cell_attr_read;
 		attrs[i].private = entry;
 		if (!attrs[i].attr.name) {
 			ret = -ENOMEM;
diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index aa887166f0d21030d620d43c864ca76cde1c6d05..1bb61a2c33994df9d57f33e4bb41ba8483a174c2 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -77,7 +77,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
 	pp->attr.attr.mode = secure ? 0400 : 0444;
 	pp->attr.size = secure ? 0 : pp->length;
-	pp->attr.read_new = of_node_property_read;
+	pp->attr.read = of_node_property_read;
 
 	rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
 	WARN(rc, "error adding attribute %s to node %pOF\n", pp->name, np);
diff --git a/drivers/pci/hotplug/acpiphp_ibm.c b/drivers/pci/hotplug/acpiphp_ibm.c
index b3aa34e3a4a29417bd694273779dc356be284f1d..18e01cd55a8ecf5eb926a4c875871e9518c64d0b 100644
--- a/drivers/pci/hotplug/acpiphp_ibm.c
+++ b/drivers/pci/hotplug/acpiphp_ibm.c
@@ -98,7 +98,7 @@ static struct bin_attribute ibm_apci_table_attr __ro_after_init = {
 		    .name = "apci_table",
 		    .mode = S_IRUGO,
 	    },
-	    .read_new = ibm_read_apci_table,
+	    .read = ibm_read_apci_table,
 	    .write = NULL,
 };
 static struct acpiphp_attention_info ibm_attention_info =
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 268c69daa4d573ddd584c837b2d382dc8a3922e0..f2739eafef9bf1578a08beb67387865537ab6a3e 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1004,8 +1004,8 @@ void pci_create_legacy_files(struct pci_bus *b)
 	b->legacy_io->attr.name = "legacy_io";
 	b->legacy_io->size = 0xffff;
 	b->legacy_io->attr.mode = 0600;
-	b->legacy_io->read_new = pci_read_legacy_io;
-	b->legacy_io->write_new = pci_write_legacy_io;
+	b->legacy_io->read = pci_read_legacy_io;
+	b->legacy_io->write = pci_write_legacy_io;
 	/* See pci_create_attr() for motivation */
 	b->legacy_io->llseek = pci_llseek_resource;
 	b->legacy_io->mmap = pci_mmap_legacy_io;
@@ -1211,8 +1211,8 @@ static int pci_create_attr(struct pci_dev *pdev, int num, int write_combine)
 	} else {
 		sprintf(res_attr_name, "resource%d", num);
 		if (pci_resource_flags(pdev, num) & IORESOURCE_IO) {
-			res_attr->read_new = pci_read_resource_io;
-			res_attr->write_new = pci_write_resource_io;
+			res_attr->read = pci_read_resource_io;
+			res_attr->write = pci_write_resource_io;
 			if (arch_can_pci_mmap_io())
 				res_attr->mmap = pci_mmap_resource_uc;
 		} else {
diff --git a/drivers/pcmcia/cistpl.c b/drivers/pcmcia/cistpl.c
index 0c801e4ccc6c2c8701ecf855e10a67a677c85278..05b67fd93de60d9a9ed0c21b51985a99b2924f79 100644
--- a/drivers/pcmcia/cistpl.c
+++ b/drivers/pcmcia/cistpl.c
@@ -1605,6 +1605,6 @@ static ssize_t pccard_store_cis(struct file *filp, struct kobject *kobj,
 const struct bin_attribute pccard_cis_attr = {
 	.attr = { .name = "cis", .mode = S_IRUGO | S_IWUSR },
 	.size = 0x200,
-	.read_new = pccard_show_cis,
-	.write_new = pccard_store_cis,
+	.read = pccard_show_cis,
+	.write = pccard_store_cis,
 };
diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
index c18a5b96de5ce78cd87d35878e82d293f0c201cc..f67c7f56ab2b703574faef2ae28b2fec79941b9e 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.c
+++ b/drivers/platform/mellanox/mlxbf-bootctl.c
@@ -993,7 +993,7 @@ static ssize_t mlxbf_bootctl_bootfifo_read(struct file *filp,
 
 static const struct bin_attribute mlxbf_bootctl_bootfifo_sysfs_attr = {
 	.attr = { .name = "bootfifo", .mode = 0400 },
-	.read_new = mlxbf_bootctl_bootfifo_read,
+	.read = mlxbf_bootctl_bootfifo_read,
 };
 
 static bool mlxbf_bootctl_guid_match(const guid_t *guid,
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 2f1faa82d13e824a5349b569a77520d1e29c4b68..63af9dae02542cc4736c01559e18cebbf42a7e71 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -509,7 +509,7 @@ static int init_acpi(struct device *dev)
 
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
-	.read_new = hsmp_metric_tbl_acpi_read,
+	.read = hsmp_metric_tbl_acpi_read,
 	.size = sizeof(struct hsmp_metric_table),
 };
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e3874c47ed9ed6d5a2c45cbb45d4d567404437db..b6dceca28bdb99dd5f83a7354cd22d8c7faaa684 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -91,7 +91,7 @@ static_assert(MAX_AMD_NUM_NODES == 8);
 static const struct bin_attribute attr##index = {			\
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
 	.private = (void *)index,					\
-	.read_new = hsmp_metric_tbl_plat_read,				\
+	.read = hsmp_metric_tbl_plat_read,				\
 	.size = sizeof(struct hsmp_metric_table),			\
 };									\
 static const struct bin_attribute _list[] = {				\
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 7233b654bbad1537ed0b0b08c56741d46cfe1eaf..3ed20da80a87e5867cb9a0a5614d04f390109d06 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -308,7 +308,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	entry->pmt_bin_attr.attr.name = ns->name;
 	entry->pmt_bin_attr.attr.mode = 0440;
 	entry->pmt_bin_attr.mmap = intel_pmt_mmap;
-	entry->pmt_bin_attr.read_new = intel_pmt_read;
+	entry->pmt_bin_attr.read = intel_pmt_read;
 	entry->pmt_bin_attr.size = entry->size;
 
 	ret = sysfs_create_bin_file(&dev->kobj, &entry->pmt_bin_attr);
diff --git a/drivers/power/supply/ds2780_battery.c b/drivers/power/supply/ds2780_battery.c
index dd9ac7a3296716d8ab72db56c1d9c0e439c3b2a9..8352c6401cbfab1ea03a3f946d13e05cbb190b37 100644
--- a/drivers/power/supply/ds2780_battery.c
+++ b/drivers/power/supply/ds2780_battery.c
@@ -660,8 +660,8 @@ static const struct bin_attribute ds2780_param_eeprom_bin_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = DS2780_PARAM_EEPROM_SIZE,
-	.read_new = ds2780_read_param_eeprom_bin,
-	.write_new = ds2780_write_param_eeprom_bin,
+	.read = ds2780_read_param_eeprom_bin,
+	.write = ds2780_write_param_eeprom_bin,
 };
 
 static ssize_t ds2780_read_user_eeprom_bin(struct file *filp,
@@ -705,8 +705,8 @@ static const struct bin_attribute ds2780_user_eeprom_bin_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = DS2780_USER_EEPROM_SIZE,
-	.read_new = ds2780_read_user_eeprom_bin,
-	.write_new = ds2780_write_user_eeprom_bin,
+	.read = ds2780_read_user_eeprom_bin,
+	.write = ds2780_write_user_eeprom_bin,
 };
 
 static DEVICE_ATTR(pmod_enabled, S_IRUGO | S_IWUSR, ds2780_get_pmod_enabled,
diff --git a/drivers/power/supply/ds2781_battery.c b/drivers/power/supply/ds2781_battery.c
index 8a1f1f9835e09598dd9f9426e0b63a0c5a3b4cc1..43a6b022901e39fd1aedfc744dc84b64451de2cb 100644
--- a/drivers/power/supply/ds2781_battery.c
+++ b/drivers/power/supply/ds2781_battery.c
@@ -662,8 +662,8 @@ static const struct bin_attribute ds2781_param_eeprom_bin_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = DS2781_PARAM_EEPROM_SIZE,
-	.read_new = ds2781_read_param_eeprom_bin,
-	.write_new = ds2781_write_param_eeprom_bin,
+	.read = ds2781_read_param_eeprom_bin,
+	.write = ds2781_write_param_eeprom_bin,
 };
 
 static ssize_t ds2781_read_user_eeprom_bin(struct file *filp,
@@ -708,8 +708,8 @@ static const struct bin_attribute ds2781_user_eeprom_bin_attr = {
 		.mode = S_IRUGO | S_IWUSR,
 	},
 	.size = DS2781_USER_EEPROM_SIZE,
-	.read_new = ds2781_read_user_eeprom_bin,
-	.write_new = ds2781_write_user_eeprom_bin,
+	.read = ds2781_read_user_eeprom_bin,
+	.write = ds2781_write_user_eeprom_bin,
 };
 
 static DEVICE_ATTR(pmod_enabled, S_IRUGO | S_IWUSR, ds2781_get_pmod_enabled,
diff --git a/drivers/power/supply/olpc_battery.c b/drivers/power/supply/olpc_battery.c
index b9b6078226763459ad805db266d6e52d6de057ee..a9760dbb16163ffebab218d951662ab5e3331d11 100644
--- a/drivers/power/supply/olpc_battery.c
+++ b/drivers/power/supply/olpc_battery.c
@@ -553,7 +553,7 @@ static const struct bin_attribute olpc_bat_eeprom = {
 		.mode = S_IRUGO,
 	},
 	.size = EEPROM_SIZE,
-	.read_new = olpc_bat_eeprom_read,
+	.read = olpc_bat_eeprom_read,
 };
 
 /* Allow userspace to see the specific error value pulled from the EC */
diff --git a/drivers/rapidio/rio-sysfs.c b/drivers/rapidio/rio-sysfs.c
index 6f89b232f1d5d10a4dccf51422a57d4355ccf0c2..5e8c22677e460c4a774f36e90c50930b2a0e8987 100644
--- a/drivers/rapidio/rio-sysfs.c
+++ b/drivers/rapidio/rio-sysfs.c
@@ -247,8 +247,8 @@ static const struct bin_attribute rio_config_attr = {
 		 .mode = S_IRUGO | S_IWUSR,
 		 },
 	.size = RIO_MAINT_SPACE_SZ,
-	.read_new = rio_read_config,
-	.write_new = rio_write_config,
+	.read = rio_read_config,
+	.write = rio_write_config,
 };
 
 static const struct bin_attribute *const rio_dev_bin_attrs[] = {
diff --git a/drivers/s390/char/sclp_config.c b/drivers/s390/char/sclp_config.c
index ae5d289871779cc5cc1f3070c64746ea702eb41d..356d26a09af03d1f44cd3ec682c32351739f3fc9 100644
--- a/drivers/s390/char/sclp_config.c
+++ b/drivers/s390/char/sclp_config.c
@@ -142,7 +142,7 @@ static const struct bin_attribute ofb_bin_attr = {
 		.name = "event_data",
 		.mode = S_IWUSR,
 	},
-	.write_new = sysfs_ofb_data_write,
+	.write = sysfs_ofb_data_write,
 };
 #endif
 
diff --git a/drivers/s390/char/sclp_sd.c b/drivers/s390/char/sclp_sd.c
index 8524c14affed68587cace9c2e8ac1f02f87052de..ddd26c4da26aa1b76357bb1e1d8415bd84a33565 100644
--- a/drivers/s390/char/sclp_sd.c
+++ b/drivers/s390/char/sclp_sd.c
@@ -539,7 +539,7 @@ static __init struct sclp_sd_file *sclp_sd_file_create(const char *name, u8 di)
 	sysfs_bin_attr_init(&sd_file->data_attr);
 	sd_file->data_attr.attr.name = "data";
 	sd_file->data_attr.attr.mode = 0444;
-	sd_file->data_attr.read_new = data_read;
+	sd_file->data_attr.read = data_read;
 
 	rc = sysfs_create_bin_file(&sd_file->kobj, &sd_file->data_attr);
 	if (rc) {
diff --git a/drivers/scsi/3w-sas.c b/drivers/scsi/3w-sas.c
index e057ab9c7b90e8234f4c4993ef672b1a11d47bf8..8d4174c7107ef1fc03a1a71d40fdb20ce15db1b9 100644
--- a/drivers/scsi/3w-sas.c
+++ b/drivers/scsi/3w-sas.c
@@ -122,7 +122,7 @@ static const struct bin_attribute twl_sysfs_aen_read_attr = {
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read_new = twl_sysfs_aen_read
+	.read = twl_sysfs_aen_read
 };
 
 /* This function returns driver compatibility info through sysfs */
@@ -153,7 +153,7 @@ static const struct bin_attribute twl_sysfs_compat_info_attr = {
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read_new = twl_sysfs_compat_info
+	.read = twl_sysfs_compat_info
 };
 
 /* Show some statistics about the card */
diff --git a/drivers/scsi/arcmsr/arcmsr_attr.c b/drivers/scsi/arcmsr/arcmsr_attr.c
index 8e3d4799ce93c35b0befe8744fd20aa3fe467ad3..1990af2bef953f027e40763d237e6c11aee1f46e 100644
--- a/drivers/scsi/arcmsr/arcmsr_attr.c
+++ b/drivers/scsi/arcmsr/arcmsr_attr.c
@@ -194,7 +194,7 @@ static const struct bin_attribute arcmsr_sysfs_message_read_attr = {
 		.mode = S_IRUSR ,
 	},
 	.size = ARCMSR_API_DATA_BUFLEN,
-	.read_new = arcmsr_sysfs_iop_message_read,
+	.read = arcmsr_sysfs_iop_message_read,
 };
 
 static const struct bin_attribute arcmsr_sysfs_message_write_attr = {
@@ -203,7 +203,7 @@ static const struct bin_attribute arcmsr_sysfs_message_write_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = ARCMSR_API_DATA_BUFLEN,
-	.write_new = arcmsr_sysfs_iop_message_write,
+	.write = arcmsr_sysfs_iop_message_write,
 };
 
 static const struct bin_attribute arcmsr_sysfs_message_clear_attr = {
@@ -212,7 +212,7 @@ static const struct bin_attribute arcmsr_sysfs_message_clear_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = 1,
-	.write_new = arcmsr_sysfs_iop_message_clear,
+	.write = arcmsr_sysfs_iop_message_clear,
 };
 
 int arcmsr_alloc_sysfs_attr(struct AdapterControlBlock *acb)
diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index 44871746944ad0c0f30f28975ed40e0fde4e8d03..3cc7d4016a39cfe9f0eceeaea0b014b03758f78b 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -215,8 +215,8 @@ static ssize_t write_hw(struct file *file, struct kobject *kobj,
 		.attr	= \
 		{ .name = __stringify(_name), .mode  = S_IRUSR | S_IWUSR }, \
 		.size	= 0, \
-		.read_new	= read_ ## _name, \
-		.write_new	= write_ ## _name }
+		.read	= read_ ## _name, \
+		.write	= write_ ## _name }
 
 ESAS2R_RW_BIN_ATTR(fw);
 ESAS2R_RW_BIN_ATTR(fs);
@@ -227,7 +227,7 @@ ESAS2R_RW_BIN_ATTR(live_nvram);
 const struct bin_attribute bin_attr_default_nvram = {
 	.attr	= { .name = "default_nvram", .mode = S_IRUGO },
 	.size	= 0,
-	.read_new	= read_default_nvram,
+	.read	= read_default_nvram,
 	.write	= NULL
 };
 
diff --git a/drivers/scsi/ibmvscsi/ibmvfc.c b/drivers/scsi/ibmvscsi/ibmvfc.c
index 4c493b06062ac058ad85781a10f829d298de097f..29c46bc852a5a423b986ea737de105e790d86e0f 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc.c
@@ -3670,7 +3670,7 @@ static const struct bin_attribute ibmvfc_trace_attr = {
 		.mode = S_IRUGO,
 	},
 	.size = 0,
-	.read_new = ibmvfc_read_trace,
+	.read = ibmvfc_read_trace,
 };
 #endif
 
diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index d89135fb8faa6be0423d297cfbd02e7c50e18341..faeba9ba314c06ccb58f186f3bc03d7c0eb81264 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -3389,7 +3389,7 @@ static const struct bin_attribute ipr_trace_attr = {
 		.mode = S_IRUGO,
 	},
 	.size = 0,
-	.read_new = ipr_read_trace,
+	.read = ipr_read_trace,
 };
 #endif
 
@@ -4140,8 +4140,8 @@ static const struct bin_attribute ipr_ioa_async_err_log = {
 		.mode =		S_IRUGO | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = ipr_read_async_err_log,
-	.write_new = ipr_next_async_err_log
+	.read = ipr_read_async_err_log,
+	.write = ipr_next_async_err_log
 };
 
 static struct attribute *ipr_ioa_attrs[] = {
@@ -4391,8 +4391,8 @@ static const struct bin_attribute ipr_dump_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = ipr_read_dump,
-	.write_new = ipr_write_dump
+	.read = ipr_read_dump,
+	.write = ipr_write_dump
 };
 #else
 static int ipr_free_dump(struct ipr_ioa_cfg *ioa_cfg) { return 0; };
diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
index 54ee8ecec3b361bafd22c015129e683abdef29a9..33582d48ec09b53ff08374f228eb16cf0ce307a5 100644
--- a/drivers/scsi/lpfc/lpfc_attr.c
+++ b/drivers/scsi/lpfc/lpfc_attr.c
@@ -6420,8 +6420,8 @@ static const struct bin_attribute sysfs_ctlreg_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 256,
-	.read_new = sysfs_ctlreg_read,
-	.write_new = sysfs_ctlreg_write,
+	.read = sysfs_ctlreg_read,
+	.write = sysfs_ctlreg_write,
 };
 
 /**
@@ -6478,8 +6478,8 @@ static const struct bin_attribute sysfs_mbox_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = MAILBOX_SYSFS_MAX,
-	.read_new = sysfs_mbox_read,
-	.write_new = sysfs_mbox_write,
+	.read = sysfs_mbox_read,
+	.write = sysfs_mbox_write,
 };
 
 /**
diff --git a/drivers/scsi/qedf/qedf_attr.c b/drivers/scsi/qedf/qedf_attr.c
index 769da92ee20d0fac71525a8265cb6332146585ec..7ebb46689f97a133fdf65dda3901355531088f4b 100644
--- a/drivers/scsi/qedf/qedf_attr.c
+++ b/drivers/scsi/qedf/qedf_attr.c
@@ -166,8 +166,8 @@ static const struct bin_attribute sysfs_grcdump_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = qedf_sysfs_read_grcdump,
-	.write_new = qedf_sysfs_write_grcdump,
+	.read = qedf_sysfs_read_grcdump,
+	.write = qedf_sysfs_write_grcdump,
 };
 
 static struct sysfs_bin_attrs bin_file_entries[] = {
diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
index dcb0c2af1fa7cf9b63a5613c01b792143142a412..2e584a8bf66b252ac6bd056a776de22127d1c2a8 100644
--- a/drivers/scsi/qla2xxx/qla_attr.c
+++ b/drivers/scsi/qla2xxx/qla_attr.c
@@ -174,8 +174,8 @@ static const struct bin_attribute sysfs_fw_dump_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = qla2x00_sysfs_read_fw_dump,
-	.write_new = qla2x00_sysfs_write_fw_dump,
+	.read = qla2x00_sysfs_read_fw_dump,
+	.write = qla2x00_sysfs_write_fw_dump,
 };
 
 static ssize_t
@@ -288,8 +288,8 @@ static const struct bin_attribute sysfs_nvram_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 512,
-	.read_new = qla2x00_sysfs_read_nvram,
-	.write_new = qla2x00_sysfs_write_nvram,
+	.read = qla2x00_sysfs_read_nvram,
+	.write = qla2x00_sysfs_write_nvram,
 };
 
 static ssize_t
@@ -350,8 +350,8 @@ static const struct bin_attribute sysfs_optrom_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = qla2x00_sysfs_read_optrom,
-	.write_new = qla2x00_sysfs_write_optrom,
+	.read = qla2x00_sysfs_read_optrom,
+	.write = qla2x00_sysfs_write_optrom,
 };
 
 static ssize_t
@@ -535,7 +535,7 @@ static const struct bin_attribute sysfs_optrom_ctl_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = 0,
-	.write_new = qla2x00_sysfs_write_optrom_ctl,
+	.write = qla2x00_sysfs_write_optrom_ctl,
 };
 
 static ssize_t
@@ -648,8 +648,8 @@ static const struct bin_attribute sysfs_vpd_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = qla2x00_sysfs_read_vpd,
-	.write_new = qla2x00_sysfs_write_vpd,
+	.read = qla2x00_sysfs_read_vpd,
+	.write = qla2x00_sysfs_write_vpd,
 };
 
 static ssize_t
@@ -685,7 +685,7 @@ static const struct bin_attribute sysfs_sfp_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = SFP_DEV_SIZE,
-	.read_new = qla2x00_sysfs_read_sfp,
+	.read = qla2x00_sysfs_read_sfp,
 };
 
 static ssize_t
@@ -829,7 +829,7 @@ static const struct bin_attribute sysfs_reset_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = 0,
-	.write_new = qla2x00_sysfs_write_reset,
+	.write = qla2x00_sysfs_write_reset,
 };
 
 static ssize_t
@@ -872,7 +872,7 @@ static const struct bin_attribute sysfs_issue_logo_attr = {
 		.mode = S_IWUSR,
 	},
 	.size = 0,
-	.write_new = qla2x00_issue_logo,
+	.write = qla2x00_issue_logo,
 };
 
 static ssize_t
@@ -935,7 +935,7 @@ static const struct bin_attribute sysfs_xgmac_stats_attr = {
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read_new = qla2x00_sysfs_read_xgmac_stats,
+	.read = qla2x00_sysfs_read_xgmac_stats,
 };
 
 static ssize_t
@@ -993,7 +993,7 @@ static const struct bin_attribute sysfs_dcbx_tlv_attr = {
 		.mode = S_IRUSR,
 	},
 	.size = 0,
-	.read_new = qla2x00_sysfs_read_dcbx_tlv,
+	.read = qla2x00_sysfs_read_dcbx_tlv,
 };
 
 static struct sysfs_entry {
diff --git a/drivers/scsi/qla4xxx/ql4_attr.c b/drivers/scsi/qla4xxx/ql4_attr.c
index e3f85d6ea0db25d5674ca69475af31a4267e2fdb..84f99ff8e69a8f44719af9246f35a7517bb2947d 100644
--- a/drivers/scsi/qla4xxx/ql4_attr.c
+++ b/drivers/scsi/qla4xxx/ql4_attr.c
@@ -110,8 +110,8 @@ static const struct bin_attribute sysfs_fw_dump_attr = {
 		.mode = S_IRUSR | S_IWUSR,
 	},
 	.size = 0,
-	.read_new = qla4_8xxx_sysfs_read_fw_dump,
-	.write_new = qla4_8xxx_sysfs_write_fw_dump,
+	.read = qla4_8xxx_sysfs_read_fw_dump,
+	.write = qla4_8xxx_sysfs_write_fw_dump,
 };
 
 static struct sysfs_entry {
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index d772258e29ad257468acd1f7d310084f6792bc84..deba96107d20b987c0f75b0ec9b69fef27bb15eb 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -917,7 +917,7 @@ show_vpd_##_page(struct file *filp, struct kobject *kobj,	\
 static const struct bin_attribute dev_attr_vpd_##_page = {		\
 	.attr =	{.name = __stringify(vpd_##_page), .mode = S_IRUGO },	\
 	.size = 0,							\
-	.read_new = show_vpd_##_page,					\
+	.read = show_vpd_##_page,					\
 };
 
 sdev_vpd_pg_attr(pg83);
@@ -949,7 +949,7 @@ static const struct bin_attribute dev_attr_inquiry = {
 		.mode = S_IRUGO,
 	},
 	.size = 0,
-	.read_new = show_inquiry,
+	.read = show_inquiry,
 };
 
 static ssize_t
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index c6c4753f64153e39d7e6aa717831867c26bce87b..e0ac03e052da6c3eaf7566d25008569eb080ddb6 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2227,7 +2227,7 @@ static const struct bin_attribute edid1_attr = {
 		.mode	= 0444,
 	},
 	.size	= EDID_LENGTH,
-	.read_new	= radeon_show_edid1,
+	.read	= radeon_show_edid1,
 };
 
 static const struct bin_attribute edid2_attr = {
@@ -2236,7 +2236,7 @@ static const struct bin_attribute edid2_attr = {
 		.mode	= 0444,
 	},
 	.size	= EDID_LENGTH,
-	.read_new	= radeon_show_edid2,
+	.read	= radeon_show_edid2,
 };
 
 static int radeonfb_pci_register(struct pci_dev *pdev,
diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index acadf0eb450c3d76c05fcb9cc7e7c3f6dd8f31ef..ccede85df1e1af65e93656fc4489b24e2b99bf59 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1482,8 +1482,8 @@ static const struct bin_attribute edid_attr = {
 	.attr.name = "edid",
 	.attr.mode = 0666,
 	.size = EDID_LENGTH,
-	.read_new = edid_show,
-	.write_new = edid_store
+	.read = edid_show,
+	.write = edid_store
 };
 
 static const struct device_attribute fb_device_attrs[] = {
diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm-mr.c
index feb30af90a2081d54643f75621cdd75b4a7abf76..74465e79be60d6838e628c3ea202d8bdc9831487 100644
--- a/drivers/virt/coco/guest/tsm-mr.c
+++ b/drivers/virt/coco/guest/tsm-mr.c
@@ -209,12 +209,12 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 
 		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
 			bap->attr.mode |= 0444;
-			bap->read_new = tm_digest_read;
+			bap->read = tm_digest_read;
 		}
 
 		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
 			bap->attr.mode |= 0200;
-			bap->write_new = tm_digest_write;
+			bap->write = tm_digest_write;
 		}
 
 		bap->size = tm->mrs[i].mr_size;
diff --git a/drivers/w1/slaves/w1_ds2406.c b/drivers/w1/slaves/w1_ds2406.c
index 76026d6151111ca6e8cc50723567a780f7c38d85..efb2e784f8d7412c260c8e51ed957ae080cc3c7f 100644
--- a/drivers/w1/slaves/w1_ds2406.c
+++ b/drivers/w1/slaves/w1_ds2406.c
@@ -94,7 +94,7 @@ static const struct bin_attribute w1_f12_sysfs_bin_files[NB_SYSFS_BIN_FILES] = {
 			.mode = 0444,
 		},
 		.size = 1,
-		.read_new = w1_f12_read_state,
+		.read = w1_f12_read_state,
 	},
 	{
 		.attr = {
@@ -102,7 +102,7 @@ static const struct bin_attribute w1_f12_sysfs_bin_files[NB_SYSFS_BIN_FILES] = {
 			.mode = 0664,
 		},
 		.size = 1,
-		.write_new = w1_f12_write_output,
+		.write = w1_f12_write_output,
 	}
 };
 
diff --git a/drivers/w1/slaves/w1_ds2433.c b/drivers/w1/slaves/w1_ds2433.c
index 22331d840ec18ae5fa6dfe7bd3437d8bb47057ad..a53eb34fea79fc7d815a6451b4ae4320eed2ea56 100644
--- a/drivers/w1/slaves/w1_ds2433.c
+++ b/drivers/w1/slaves/w1_ds2433.c
@@ -276,15 +276,15 @@ static ssize_t eeprom_write(struct file *filp, struct kobject *kobj,
 
 static const struct bin_attribute bin_attr_f23_eeprom = {
 	.attr = { .name = "eeprom", .mode = 0644 },
-	.read_new = eeprom_read,
-	.write_new = eeprom_write,
+	.read = eeprom_read,
+	.write = eeprom_write,
 	.size = W1_EEPROM_DS2433_SIZE,
 };
 
 static const struct bin_attribute bin_attr_f43_eeprom = {
 	.attr = { .name = "eeprom", .mode = 0644 },
-	.read_new = eeprom_read,
-	.write_new = eeprom_write,
+	.read = eeprom_read,
+	.write = eeprom_write,
 	.size = W1_EEPROM_DS28EC20_SIZE,
 };
 
diff --git a/drivers/w1/slaves/w1_ds2805.c b/drivers/w1/slaves/w1_ds2805.c
index 6ee895640d4ac781281e48ed01d9cb20cb71637c..9c86b7985d0bd60ea8a1a13de6c080ab35e8a957 100644
--- a/drivers/w1/slaves/w1_ds2805.c
+++ b/drivers/w1/slaves/w1_ds2805.c
@@ -267,8 +267,8 @@ static const struct bin_attribute w1_f0d_bin_attr = {
 		.mode = 0644,
 	},
 	.size = W1_F0D_EEPROM_SIZE,
-	.read_new = w1_f0d_read_bin,
-	.write_new = w1_f0d_write_bin,
+	.read = w1_f0d_read_bin,
+	.write = w1_f0d_write_bin,
 };
 
 static int w1_f0d_add_slave(struct w1_slave *sl)
diff --git a/drivers/zorro/zorro-sysfs.c b/drivers/zorro/zorro-sysfs.c
index 10aedcd21363442b2048ad4b0bebdbfd8c8ad30e..294d3642a2795eaa26e5e4b8fdf841aef18fb8b2 100644
--- a/drivers/zorro/zorro-sysfs.c
+++ b/drivers/zorro/zorro-sysfs.c
@@ -104,7 +104,7 @@ static const struct bin_attribute zorro_config_attr = {
 		.mode = S_IRUGO,
 	},
 	.size = sizeof(struct ConfigDev),
-	.read_new = zorro_read_config,
+	.read = zorro_read_config,
 };
 
 static const struct bin_attribute *const zorro_device_bin_attrs[] = {
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 1d2cf898e21e32c58490753fa6bc39b8d78e356a..e8e63bd025c7a4dba0cc1fce59478e24027ea39f 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -8183,7 +8183,7 @@ static int btf_module_notify(struct notifier_block *nb, unsigned long op,
 			attr->attr.mode = 0444;
 			attr->size = btf->data_size;
 			attr->private = btf->data;
-			attr->read_new = sysfs_bin_attr_simple_read;
+			attr->read = sysfs_bin_attr_simple_read;
 
 			err = sysfs_create_bin_file(btf_kobj, attr);
 			if (err) {
diff --git a/kernel/bpf/sysfs_btf.c b/kernel/bpf/sysfs_btf.c
index 941d0d2427e3a2d27e8f1cff7b6424d0d41817c1..8951d8a2f2a3cc955f9dfdecf96f49e821447175 100644
--- a/kernel/bpf/sysfs_btf.c
+++ b/kernel/bpf/sysfs_btf.c
@@ -45,7 +45,7 @@ static int btf_sysfs_vmlinux_mmap(struct file *filp, struct kobject *kobj,
 
 static struct bin_attribute bin_attr_btf_vmlinux __ro_after_init = {
 	.attr = { .name = "vmlinux", .mode = 0444, },
-	.read_new = sysfs_bin_attr_simple_read,
+	.read = sysfs_bin_attr_simple_read,
 	.mmap = btf_sysfs_vmlinux_mmap,
 };
 
diff --git a/kernel/module/sysfs.c b/kernel/module/sysfs.c
index b401ff4b02d2904d3b5fca93e10e188ddcbaf787..5183ae86e05ee7f1833568e7b419c91e2e9b91fc 100644
--- a/kernel/module/sysfs.c
+++ b/kernel/module/sysfs.c
@@ -101,7 +101,7 @@ static int add_sect_attrs(struct module *mod, const struct load_info *info)
 			ret = -ENOMEM;
 			goto out;
 		}
-		sattr->read_new = module_sect_read;
+		sattr->read = module_sect_read;
 		sattr->private = (void *)sec->sh_addr;
 		sattr->size = MODULE_SECT_READ_SIZE;
 		sattr->attr.mode = 0400;
@@ -190,7 +190,7 @@ static int add_notes_attrs(struct module *mod, const struct load_info *info)
 			nattr->attr.mode = 0444;
 			nattr->size = info->sechdrs[i].sh_size;
 			nattr->private = (void *)info->sechdrs[i].sh_addr;
-			nattr->read_new = sysfs_bin_attr_simple_read;
+			nattr->read = sysfs_bin_attr_simple_read;
 			*(gattr++) = nattr++;
 		}
 		++loaded;
diff --git a/net/bridge/br_sysfs_br.c b/net/bridge/br_sysfs_br.c
index c1176a5e02c43ce32cb3dc152e9aa08eb535a419..cb4855ed950077274f90d7b4c863c18b1384097f 100644
--- a/net/bridge/br_sysfs_br.c
+++ b/net/bridge/br_sysfs_br.c
@@ -1026,7 +1026,7 @@ static ssize_t brforward_read(struct file *filp, struct kobject *kobj,
 static const struct bin_attribute bridge_forward = {
 	.attr = { .name = SYSFS_BRIDGE_FDB,
 		  .mode = 0444, },
-	.read_new = brforward_read,
+	.read = brforward_read,
 };
 
 /*

-- 
2.49.0

