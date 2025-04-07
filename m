Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A9258CF5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052390; cv=none; b=BzUQfwunLiddD6G9tQqGoadYhZnP6vNNK3gmkSgvWHe8VzaLls22AxZMB+Vi+aJ6jXK8HBcLVCQp5iozErAs4lr5qO5KIxg+KxY99KPflykIJeFbC/zmQisPIs28y+tfBrceCZwV8x9DJJA3f3F+e6/tOMhbgPNJGVNayZqgIRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052390; c=relaxed/simple;
	bh=6sGPyKTSJ79R5hErVeZrKboBKA18jxG4yTOJpTR4cUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QzaW/E7hMn7CjmzYF8R5YTPjo25Ocw4xjrJ40a6MfYCMrL+341RbPs7luETMIBSsAjELDLlF8k5nVX7uy7XSRHigF0XnzjeRF6thReFRbMScfWrjnhiicNLl5tMs6Jz3e9Y1skArKScdm15xKXWfW0r/TXDohwQFEjxMZBoAke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjTS9apl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjTS9apl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052388; x=1775588388;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6sGPyKTSJ79R5hErVeZrKboBKA18jxG4yTOJpTR4cUA=;
  b=BjTS9aplEf1lqx85Nsp53BSNa04hAEeiEcogATIjZdm0AsElbelCqUmv
   AdLSUI1DaPNySHYmStGRAHWuq0mm6XKan1Up1aEpB7igdhSMYY9CI+Bys
   bsxKDZFYdyjjRgJ15CPg0lGrR3eemWSkSmyozSWKsxPQR08Ggj1QJGOf5
   eS3Fe12Q+7ZF0w9d29lSUtaGtrD14dqvgZbnX58Z8ahyOLzILYRNw3GFZ
   31hetAs0cXGCNAArAdg8r69f9WDRX1nQ231DkU3HycTYnmJS61QHQ9C5I
   YGAHPMHRLj0lQTEZz1AtK8vFOvmYppy2yNlkCQa4yDp0J3fenOXPS7icQ
   w==;
X-CSE-ConnectionGUID: R0up1s9IRiGzz0RtzCQfuw==
X-CSE-MsgGUID: DPF327VNQUq/5SFnTZBQjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62999688"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62999688"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:47 -0700
X-CSE-ConnectionGUID: hoT2Ae1cS32UkxGAj8t1lQ==
X-CSE-MsgGUID: iBZvu7RYTEiEpetUWK+n/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128899309"
Received: from trung68x-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.115.210])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 11:59:46 -0700
From: Cedric Xing <cedric.xing@intel.com>
Date: Mon, 07 Apr 2025 13:59:28 -0500
Subject: [PATCH v3 1/5] tsm-mr: Add TVM Measurement Register support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-tdx-rtmr-v3-1-54f17bc65228@intel.com>
References: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
In-Reply-To: <20250407-tdx-rtmr-v3-0-54f17bc65228@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
 Dionna Amalie Glaze <dionnaglaze@google.com>, 
 Guorui Yu <guorui.yu@linux.alibaba.com>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Dan Middleton <dan.middleton@linux.intel.com>, 
 Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
 Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: b4 0.13.0

Introduce new TSM Measurement helper library (tsm-mr) for TVM guest drivers
to expose MRs (Measurement Registers) as sysfs attributes, with Crypto
Agility support.

Add the following new APIs (see include/linux/tsm-mr.h for details):

- tsm_mr_create_attribute_group(): Take on input a `struct
  tsm_measurements` instance, which includes one `struct
  tsm_measurement_register` per MR with properties like `TSM_MR_F_READABLE`
  and `TSM_MR_F_WRITABLE`, to determine the supported operations and create
  the sysfs attributes accordingly. On success, return a `struct
  attribute_group` instance that will typically be included by the guest
  driver into `miscdevice.groups` before calling misc_register().

- tsm_mr_free_attribute_group(): Free the memory allocated to the attrubute
  group returned by tsm_mr_create_attribute_group().

tsm_mr_create_attribute_group() creates one attribute for each MR, with
names following this pattern:

        MRNAME[:HASH]

- MRNAME - Placeholder for the MR name, as specified by
  `tsm_measurement_register.mr_name`.
- :HASH - Optional suffix indicating the hash algorithm associated with
  this MR, as specified by `tsm_measurement_register.mr_hash`.

Support Crypto Agility by allowing multiple definitions of the same MR
(i.e., with the same `mr_name`) with distinct HASH algorithms.

NOTE: Crypto Agility, introduced in TPM 2.0, allows new hash algorithms to
be introduced without breaking compatibility with applications using older
algorithms. CC architectures may face the same challenge in the future,
needing new hashes for security while retaining compatibility with older
hashes, hence the need for Crypto Agility.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 MAINTAINERS                |   4 +-
 drivers/virt/coco/Kconfig  |   5 ++
 drivers/virt/coco/Makefile |   1 +
 drivers/virt/coco/tsm-mr.c | 209 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/tsm-mr.h     |  93 ++++++++++++++++++++
 5 files changed, 310 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..df3aada3ada6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24558,8 +24558,8 @@ M:	Dan Williams <dan.j.williams@intel.com>
 L:	linux-coco@lists.linux.dev
 S:	Maintained
 F:	Documentation/ABI/testing/configfs-tsm
-F:	drivers/virt/coco/tsm.c
-F:	include/linux/tsm.h
+F:	drivers/virt/coco/tsm*.c
+F:	include/linux/tsm*.h
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
index ff869d883d95..737106d5dcbc 100644
--- a/drivers/virt/coco/Kconfig
+++ b/drivers/virt/coco/Kconfig
@@ -7,6 +7,11 @@ config TSM_REPORTS
 	select CONFIGFS_FS
 	tristate
 
+config TSM_MEASUREMENTS
+	select CRYPTO_HASH_INFO
+	select CRYPTO
+	bool
+
 source "drivers/virt/coco/efi_secret/Kconfig"
 
 source "drivers/virt/coco/pkvm-guest/Kconfig"
diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
index c3d07cfc087e..eb6ec5c1d2e1 100644
--- a/drivers/virt/coco/Makefile
+++ b/drivers/virt/coco/Makefile
@@ -3,6 +3,7 @@
 # Confidential computing related collateral
 #
 obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
+obj-$(CONFIG_TSM_MEASUREMENTS)	+= tsm-mr.o
 obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
 obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
 obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
new file mode 100644
index 000000000000..695ac28530e3
--- /dev/null
+++ b/drivers/virt/coco/tsm-mr.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024-2025 Intel Corporation. All rights reserved. */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+#include <linux/tsm-mr.h>
+
+struct tm_context {
+	struct rw_semaphore rwsem;
+	struct attribute_group agrp;
+	const struct tsm_measurements *tm;
+	bool in_sync;
+	struct bin_attribute mrs[];
+};
+
+static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
+			      const struct bin_attribute *attr, char *buffer,
+			      loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	int rc;
+
+	ctx = attr->private;
+	rc = down_read_interruptible(&ctx->rwsem);
+	if (rc)
+		return rc;
+
+	/*
+	 * @ctx->in_sync indicates if any MRs have been written since the last
+	 * ctx->refresh() call. When @ctx->in_sync is false, ctx->refresh() is
+	 * necessary to sync the cached values of all live MRs (i.e., with
+	 * %TSM_MR_F_LIVE set) with the underlying hardware.
+	 */
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+	if ((mr->mr_flags & TSM_MR_F_LIVE) && !ctx->in_sync) {
+		up_read(&ctx->rwsem);
+
+		rc = down_write_killable(&ctx->rwsem);
+		if (rc)
+			return rc;
+
+		if (!ctx->in_sync) {
+			rc = ctx->tm->refresh(ctx->tm, mr);
+			ctx->in_sync = !rc;
+		}
+
+		downgrade_write(&ctx->rwsem);
+	}
+
+	memcpy(buffer, mr->mr_value + off, count);
+
+	up_read(&ctx->rwsem);
+	return rc ?: count;
+}
+
+static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
+			       const struct bin_attribute *attr, char *buffer,
+			       loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	ssize_t rc;
+
+	/* partial writes are not supported */
+	if (off != 0 || count != attr->size)
+		return -EINVAL;
+
+	ctx = attr->private;
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	rc = down_write_killable(&ctx->rwsem);
+	if (rc)
+		return rc;
+
+	rc = ctx->tm->write(ctx->tm, mr, buffer);
+
+	/* reset @ctx->in_sync to refresh LIVE MRs on next read */
+	if (!rc)
+		ctx->in_sync = false;
+
+	up_write(&ctx->rwsem);
+	return rc ?: count;
+}
+
+/**
+ * tsm_mr_create_attribute_group() - creates an attribute group for measurement
+ * registers
+ * @tm: pointer to &struct tsm_measurements containing the MR definitions.
+ *
+ * This function creates attributes corresponding to the MR definitions
+ * provided by @tm->mrs.
+ *
+ * The created attributes will reference @tm and its members. The caller must
+ * not free @tm until after tsm_mr_free_attribute_group() is called.
+ *
+ * Context: Process context. May sleep due to memory allocation.
+ *
+ * Return:
+ * * On success, the pointer to a an attribute group is returned; otherwise
+ * * %-EINVAL - Invalid MR definitions.
+ * * %-ENOMEM - Out of memory.
+ */
+const struct attribute_group *__must_check
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
+{
+	if (!tm->mrs)
+		return ERR_PTR(-EINVAL);
+
+	/* aggregated length of all MR names */
+	size_t nlen = 0;
+
+	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		if ((tm->mrs[i].mr_flags & TSM_MR_F_LIVE) && !tm->refresh)
+			return ERR_PTR(-EINVAL);
+
+		if ((tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) && !tm->write)
+			return ERR_PTR(-EINVAL);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
+			continue;
+
+		if (WARN_ON(tm->mrs[i].mr_hash >= HASH_ALGO__LAST))
+			return ERR_PTR(-EINVAL);
+
+		/* MR sysfs attribute names have the form of MRNAME:HASH */
+		nlen += strlen(tm->mrs[i].mr_name) + 1 +
+			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
+	}
+
+	/*
+	 * @bas and the MR name strings are combined into a single allocation
+	 * so that we don't have to free MR names one-by-one in
+	 * tsm_mr_free_attribute_group()
+	 */
+	struct bin_attribute **bas __free(kfree) =
+		kzalloc(sizeof(*bas) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
+	struct tm_context *ctx __free(kfree) =
+		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
+	char *name, *end;
+
+	if (!ctx || !bas)
+		return ERR_PTR(-ENOMEM);
+
+	/* @bas is followed immediately by MR name strings */
+	name = (char *)&bas[tm->nr_mrs + 1];
+	end = name + nlen;
+
+	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		bas[i] = &ctx->mrs[i];
+		sysfs_bin_attr_init(bas[i]);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
+			bas[i]->attr.name = tm->mrs[i].mr_name;
+		else if (name < end) {
+			bas[i]->attr.name = name;
+			name += snprintf(name, end - name, "%s:%s",
+					 tm->mrs[i].mr_name,
+					 hash_algo_name[tm->mrs[i].mr_hash]);
+			++name;
+		} else
+			return ERR_PTR(-EINVAL);
+
+		/* check for duplicated MR definitions */
+		for (size_t j = 0; j < i; ++j)
+			if (!strcmp(bas[i]->attr.name, bas[j]->attr.name))
+				return ERR_PTR(-EINVAL);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
+			bas[i]->attr.mode |= 0444;
+			bas[i]->read_new = tm_digest_read;
+		}
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
+			bas[i]->attr.mode |= 0220;
+			bas[i]->write_new = tm_digest_write;
+		}
+
+		bas[i]->size = tm->mrs[i].mr_size;
+		bas[i]->private = ctx;
+	}
+
+	if (name != end)
+		return ERR_PTR(-EINVAL);
+
+	init_rwsem(&ctx->rwsem);
+	ctx->agrp.name = tm->name;
+	ctx->agrp.bin_attrs = no_free_ptr(bas);
+	ctx->tm = tm;
+	return &no_free_ptr(ctx)->agrp;
+}
+EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
+
+/**
+ * tsm_mr_free_attribute_group() - frees the attribute group returned by
+ * tsm_mr_create_attribute_group()
+ * @attr_grp: attribute group returned by tsm_mr_create_attribute_group()
+ *
+ * Context: Process context.
+ */
+void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
+{
+	kfree(attr_grp->bin_attrs);
+	kfree(container_of(attr_grp, struct tm_context, agrp));
+}
+EXPORT_SYMBOL_GPL(tsm_mr_free_attribute_group);
diff --git a/include/linux/tsm-mr.h b/include/linux/tsm-mr.h
new file mode 100644
index 000000000000..94a14d48a012
--- /dev/null
+++ b/include/linux/tsm-mr.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TSM_MR_H
+#define __TSM_MR_H
+
+#include <crypto/hash_info.h>
+
+/**
+ * struct tsm_measurement_register - describes an architectural measurement
+ * register (MR)
+ * @mr_name: name of the MR
+ * @mr_value: buffer containing the current value of the MR
+ * @mr_size: size of the MR - typically the digest size of @mr_hash
+ * @mr_flags: bitwise OR of one or more flags, detailed below
+ * @mr_hash: optional hash identifier defined in include/uapi/linux/hash_info.h.
+ *
+ * A CC guest driver encloses an array of this structure in struct
+ * tsm_measurements to detail the measurement facility supported by the
+ * underlying CC hardware.
+ *
+ * @mr_name and @mr_value must stay valid until this structure is no longer in
+ * use.
+ *
+ * @mr_flags is the bitwise-OR of zero or more of the flags below.
+ *
+ * * %TSM_MR_F_READABLE - the sysfs attribute corresponding to this MR is readable.
+ * * %TSM_MR_F_WRITABLE - the sysfs attribute corresponding to this MR is writable.
+ * * %TSM_MR_F_LIVE - this MR's value may differ from the last value written, so
+ *   must be read back from the underlying CC hardware/firmware.
+ * * %TSM_MR_F_RTMR - bitwise-OR of %TSM_MR_F_LIVE and %TSM_MR_F_WRITABLE.
+ * * %TSM_MR_F_NOHASH - this MR does NOT have an associated hash algorithm.
+ *   @mr_hash will be ignored when this flag is set.
+ */
+struct tsm_measurement_register {
+	const char *mr_name;
+	void *mr_value;
+	u32 mr_size;
+	u32 mr_flags;
+	enum hash_algo mr_hash;
+};
+
+#define TSM_MR_F_NOHASH 1
+#define TSM_MR_F_WRITABLE 2
+#define TSM_MR_F_READABLE 4
+#define TSM_MR_F_LIVE 8
+#define TSM_MR_F_RTMR (TSM_MR_F_LIVE | TSM_MR_F_WRITABLE)
+
+#define TSM_MR_(mr, hash)                              \
+	.mr_name = #mr, .mr_size = hash##_DIGEST_SIZE, \
+	.mr_hash = HASH_ALGO_##hash, .mr_flags = TSM_MR_F_READABLE
+
+/**
+ * struct tsm_measurements - Defines the CC-specific measurement facility and
+ * methods for updating measurement registers (MRs).
+ * @name: Optional parent directory name.
+ * @mrs: Array of MR definitions.
+ * @nr_mrs: Number of elements in @mrs.
+ * @refresh: Callback function to load/sync all MRs from TVM hardware/firmware
+ *           into the kernel cache.
+ * @write: Callback function to write to the MR specified by the parameter @mr.
+ *
+ * @refresh takes two parameters:
+ *
+ * * @tm - points back to this structure.
+ * * @mr - points to the MR (an element of @mrs) being read (hence triggered
+ *   this callback).
+ *
+ * Note that @refresh is invoked only when an MR with %TSM_MR_F_LIVE set is
+ * being read and the cache is stale. However, @refresh must reload not only
+ * the MR being read (@mr) but also all MRs with %TSM_MR_F_LIVE set.
+ *
+ * @write takes an additional parameter besides @tm and @mr:
+ *
+ * * @data - contains the bytes to write and whose size is @mr->mr_size.
+ *
+ * Both @refresh and @write should return 0 on success and an appropriate error
+ * code on failure.
+ */
+struct tsm_measurements {
+	const char *name;
+	const struct tsm_measurement_register *mrs __counted_by(nr_mrs);
+	size_t nr_mrs;
+	int (*refresh)(const struct tsm_measurements *tm,
+		       const struct tsm_measurement_register *mr);
+	int (*write)(const struct tsm_measurements *tm,
+		     const struct tsm_measurement_register *mr, const u8 *data);
+};
+
+const struct attribute_group *__must_check
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm);
+void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp);
+
+#endif

-- 
2.43.0

