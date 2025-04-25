Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2327F253943;
	Fri, 25 Apr 2025 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585606; cv=none; b=r4Na+lvztTeGVmVnhj/J37TQ/ZelpsaERDxFvyAWtLM2xbA/AZrCkVe6olTDSNLR/2uPkxJ2LD1H2egzlNZMUl/zhVBnhbTno/UDBSG3lG6Sqn//K4hIImh+bVoTzGa5TCqQIQJtnl5zZviJ1Wsoiq4m8YHGw9gQnZkY6z+uH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585606; c=relaxed/simple;
	bh=+g/FY8kNph+glr76IAr6IVn8OTbKqdx7zfjLHWhrTRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AyaUtBBx5pDEurxC1EBPfRfJxUiNJMfD+7WJzTZQXiwQfK+bsE+aCval6EwBKvr5BaFJ44a2CeCfEQnz6Sfzry65odPv4eyOwHDOItlPTTjyzTgy7Ctiiue6yOYfe/6G2fnQcBC9ozfT+4la/eBVNrdHUVCBIsgp2S99rJlsazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12358106F;
	Fri, 25 Apr 2025 05:53:14 -0700 (PDT)
Received: from pluto.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6826D3F59E;
	Fri, 25 Apr 2025 05:53:16 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 2/4] firmware: arm_scmi: Add Quirks framework
Date: Fri, 25 Apr 2025 13:52:48 +0100
Message-ID: <20250425125250.1847711-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250425125250.1847711-1-cristian.marussi@arm.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a common framework to describe SCMI quirks and associate them with a
specific platform or a specific set of SCMI firmware versions.

All the matching SCMI quirks will be enabled when the SCMI core stack
probes and after all the needed SCMI firmware versioning information was
retrieved using Base protocol.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
V1 -> V2
- compile quirk snippets even when SCMI Quirks are disabled
- added support for quirks matches on multiple compatibles
  (via NULl terminated compats strings)
- removed stale unneeded include
- added some more docs

RFC->V1
- added handling of impl_ver ranges in quirk definition
- make Quirks Framework default-y
- match on all NULL/0 too..these are quirks that apply always anywhere !
- depends on COMPILE_TEST too
- move quirk enable calling logic out of Base protocol init (triggers a
  LOCKDEP issues around cpu locks (cpufreq, static_branch_enable interactions..)
---
 drivers/firmware/arm_scmi/Kconfig  |  13 ++
 drivers/firmware/arm_scmi/Makefile |   1 +
 drivers/firmware/arm_scmi/driver.c |  27 ++-
 drivers/firmware/arm_scmi/quirks.c | 316 +++++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h |  48 +++++
 5 files changed, 404 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/arm_scmi/quirks.c
 create mode 100644 drivers/firmware/arm_scmi/quirks.h

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index dabd874641d0..e3fb36825978 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -69,6 +69,19 @@ config ARM_SCMI_DEBUG_COUNTERS
 	  such useful debug counters. This can be helpful for debugging and
 	  SCMI monitoring.
 
+config ARM_SCMI_QUIRKS
+	bool "Enable SCMI Quirks framework"
+	depends on JUMP_LABEL || COMPILE_TEST
+	default y
+	help
+	  Enables support for SCMI Quirks framework to workaround SCMI platform
+	  firmware bugs on system already deployed in the wild.
+
+	  The framework allows the definition of platform-specific code quirks
+	  that will be associated and enabled only on the desired platforms
+	  depending on the SCMI firmware advertised versions and/or machine
+	  compatibles.
+
 source "drivers/firmware/arm_scmi/transports/Kconfig"
 source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
 
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 9ac81adff567..780cd62b2f78 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -3,6 +3,7 @@ scmi-bus-y = bus.o
 scmi-core-objs := $(scmi-bus-y)
 
 scmi-driver-y = driver.o notify.o
+scmi-driver-$(CONFIG_ARM_SCMI_QUIRKS) += quirks.o
 scmi-driver-$(CONFIG_ARM_SCMI_RAW_MODE_SUPPORT) += raw_mode.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_SHMEM) = shmem.o
 scmi-transport-$(CONFIG_ARM_SCMI_HAVE_MSG) += msg.o
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0e281fca0a38..ffaa68cdf644 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -11,7 +11,7 @@
  * various power domain DVFS including the core/cluster, certain system
  * clocks configuration, thermal sensors and many others.
  *
- * Copyright (C) 2018-2024 ARM Ltd.
+ * Copyright (C) 2018-2025 ARM Ltd.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -38,6 +38,7 @@
 
 #include "common.h"
 #include "notify.h"
+#include "quirks.h"
 
 #include "raw_mode.h"
 
@@ -3112,6 +3113,26 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
 	return &trans->desc;
 }
 
+static void scmi_enable_matching_quirks(struct scmi_info *info)
+{
+	struct scmi_revision_info *rev = &info->version;
+	const char *compatible = NULL;
+	struct device_node *root;
+
+	root = of_find_node_by_path("/");
+	if (root) {
+		of_property_read_string(root, "compatible", &compatible);
+		of_node_put(root);
+	}
+
+	dev_dbg(info->dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
+		compatible, rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
+
+	/* Enable applicable quirks */
+	scmi_quirks_enable(info->dev, rev->vendor_id,
+			   rev->sub_vendor_id, rev->impl_ver);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3233,6 +3254,8 @@ static int scmi_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &scmi_list);
 	mutex_unlock(&scmi_list_mutex);
 
+	scmi_enable_matching_quirks(info);
+
 	for_each_available_child_of_node(np, child) {
 		u32 prot_id;
 
@@ -3391,6 +3414,8 @@ static struct dentry *scmi_debugfs_init(void)
 
 static int __init scmi_driver_init(void)
 {
+	scmi_quirks_initialize();
+
 	/* Bail out if no SCMI transport was configured */
 	if (WARN_ON(!IS_ENABLED(CONFIG_ARM_SCMI_HAVE_TRANSPORT)))
 		return -EINVAL;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
new file mode 100644
index 000000000000..9e93a8242182
--- /dev/null
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Message Protocol Quirks
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ */
+
+/**
+ * DOC: Theory of operation
+ *
+ * A framework to define SCMI quirks and their activation conditions based on
+ * existing static_keys Kernel facilities.
+ *
+ * Quirks are named and their activation conditions defined using the macro
+ * DEFINE_SCMI_QUIRK() in this file.
+ *
+ * After a quirk is defined, a corresponding entry must also be added to the
+ * global @scmi_quirks_table in this file using __DECLARE_SCMI_QUIRK_ENTRY().
+ *
+ * Additionally a corresponding quirk declaration must be added also to the
+ * quirk.h file using DECLARE_SCMI_QUIRK().
+ *
+ * The needed quirk code-snippet itself will be defined local to the SCMI code
+ * that is meant to fix and will be associated to the previously defined quirk
+ * and related activation conditions using the macro SCMI_QUIRK().
+ *
+ * At runtime, during the SCMI stack probe sequence, once the SCMI Server had
+ * advertised the running platform Vendor, SubVendor and Implementation Version
+ * data, all the defined quirks matching the activation conditions will be
+ * enabled.
+ *
+ * Example
+ *
+ * quirk.c
+ * -------
+ *  DEFINE_SCMI_QUIRK(fix_me, "vendor", "subvend", "0x12000-0x30000",
+ *		      "someone,plat_A", "another,plat_b", "vend,sku");
+ *
+ *  static struct scmi_quirk *scmi_quirks_table[] = {
+ *	...
+ *	__DECLARE_SCMI_QUIRK_ENTRY(fix_me),
+ *	NULL
+ *  };
+ *
+ * quirk.h
+ * -------
+ *  DECLARE_SCMI_QUIRK(fix_me);
+ *
+ * <somewhere_in_the_scmi_stack.c>
+ * ------------------------------
+ *
+ *  #define QUIRK_CODE_SNIPPET()		\
+ *  ({						\
+ *	if (p->condition)			\
+ *		a_ptr->calculated_val = 123;	\
+ *  })
+ *
+ *
+ *  int some_function_to_fix(int param, struct something *p)
+ *  {
+ *	struct some_strut *a_ptr;
+ *
+ *	a_ptr = some_load_func(p);
+ *	SCMI_QUIRK(fix_me, QUIRK_CODE_SNIPPET_FIX_ME);
+ *	some_more_func(a_ptr);
+ *	...
+ *
+ *	return 0;
+ *  }
+ *
+ */
+
+#include <linux/ctype.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/hashtable.h>
+#include <linux/kstrtox.h>
+#include <linux/of.h>
+#include <linux/static_key.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include "quirks.h"
+
+#define SCMI_QUIRKS_HT_SZ	4
+
+struct scmi_quirk {
+	bool enabled;
+	const char *name;
+	char *vendor;
+	char *sub_vendor_id;
+	char *impl_ver_range;
+	u32 start_range;
+	u32 end_range;
+	struct static_key_false *key;
+	struct hlist_node hash;
+	unsigned int hkey;
+	const char *const compats[];
+};
+
+#define __DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ...)	\
+	static struct scmi_quirk scmi_quirk_entry_ ## _qn = {		\
+		.name = __stringify(quirk_ ## _qn),			\
+		.vendor = _ven,						\
+		.sub_vendor_id = _sub,					\
+		.impl_ver_range = _impl,				\
+		.key = &(scmi_quirk_ ## _qn),				\
+		.compats = { __VA_ARGS__ __VA_OPT__(,) NULL },		\
+	}
+
+#define __DECLARE_SCMI_QUIRK_ENTRY(_qn)		(&(scmi_quirk_entry_ ## _qn))
+
+/*
+ * Define a quirk by name and provide the matching tokens where:
+ *
+ *  _qn: A string which will be used to build the quirk and the global
+ *	 static_key names.
+ *  _ven : SCMI Vendor ID string match, NULL means any.
+ *  _sub : SCMI SubVendor ID string match, NULL means any.
+ *  _impl : SCMI Implementation Version string match, NULL means any.
+ *          This string can be used to express version ranges which will be
+ *          interpreted as follows:
+ *
+ *			NULL		[0, 0xFFFFFFFF]
+ *			"X"		[X, X]
+ *			"X-"		[X, 0xFFFFFFFF]
+ *			"-X"		[0, X]
+ *			"X-Y"		[X, Y]
+ *
+ *          with X <= Y and <v> in [X, Y] meaning X <= <v> <= Y
+ *
+ *  ... : An optional variadic macros argument used to provide a coma-separated
+ *	  list of compatible strings matches; when no variadic argument is
+ *	  provided, ANY compatible will match this quirk.
+ *
+ *  This implicitly define also a properly named global static-key that
+ *  will be used to dynamically enable the quirk at initialization time.
+ *
+ *  Note that it is possible to associate multiple quirks to the same
+ *  matching pattern, if your firmware quality is really astounding :P
+ *
+ * Example:
+ *
+ * Compatibles list NOT provided, so ANY compatible will match:
+ *
+ *  DEFINE_SCMI_QUIRK(my_new_issue, "Vend", "SVend", "0x12000-0x30000");
+ *
+ *
+ * A few compatibles provided to match against:
+ *
+ *  DEFINE_SCMI_QUIRK(my_new_issue, "Vend", "SVend", "0x12000-0x30000",
+ *		      "xvend,plat_a", "xvend,plat_b", "xvend,sku_name");
+ */
+#define DEFINE_SCMI_QUIRK(_qn, _ven, _sub, _impl, ...)			\
+	DEFINE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn);			\
+	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
+
+/*
+ * Same as DEFINE_SCMI_QUIRK but EXPORTED: this is meant to address quirks
+ * that possibly reside in code that is included in loadable kernel modules
+ * that needs to be able to access the global static keys at runtime to
+ * determine if enabled or not. (see SCMI_QUIRK to understand usage)
+ */
+#define DEFINE_SCMI_QUIRK_EXPORTED(_qn, _ven, _sub, _impl, ...)		\
+	DEFINE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn);			\
+	EXPORT_SYMBOL_GPL(scmi_quirk_ ## _qn);				\
+	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
+
+/* Global Quirks Definitions */
+
+/*
+ * Quirks Pointers Array
+ *
+ * This is filled at compile-time with the list of pointers to all the currently
+ * defined quirks descriptors.
+ */
+static struct scmi_quirk *scmi_quirks_table[] = {
+	NULL
+};
+
+/*
+ * Quirks HashTable
+ *
+ * A run-time populated hashtable containing all the defined quirks descriptors
+ * hashed by matching pattern.
+ */
+static DEFINE_READ_MOSTLY_HASHTABLE(scmi_quirks_ht, SCMI_QUIRKS_HT_SZ);
+
+static unsigned int scmi_quirk_signature(const char *vend, const char *sub_vend)
+{
+	char *signature, *p;
+	unsigned int hash32;
+	unsigned long hash = 0;
+
+	/* vendor_id/sub_vendor_id guaranteed <= SCMI_SHORT_NAME_MAX_SIZE */
+	signature = kasprintf(GFP_KERNEL, "|%s|%s|", vend ?: "", sub_vend ?: "");
+	if (!signature)
+		return 0;
+
+	pr_debug("SCMI Quirk Signature >>>%s<<<\n", signature);
+
+	p = signature;
+	while (*p)
+		hash = partial_name_hash(tolower(*p++), hash);
+	hash32 = end_name_hash(hash);
+
+	kfree(signature);
+
+	return hash32;
+}
+
+static int scmi_quirk_range_parse(struct scmi_quirk *quirk)
+{
+	const char *last, *first = quirk->impl_ver_range;
+	size_t len;
+	char *sep;
+	int ret;
+
+	quirk->start_range = 0;
+	quirk->end_range = 0xFFFFFFFF;
+	len = quirk->impl_ver_range ? strlen(quirk->impl_ver_range) : 0;
+	if (!len)
+		return 0;
+
+	last = first + len - 1;
+	sep = strchr(quirk->impl_ver_range, '-');
+	if (sep)
+		*sep = '\0';
+
+	if (sep == first) /* -X */
+		ret = kstrtouint(first + 1, 0, &quirk->end_range);
+	else /* X OR X- OR X-y */
+		ret = kstrtouint(first, 0, &quirk->start_range);
+	if (ret)
+		return ret;
+
+	if (!sep)
+		quirk->end_range = quirk->start_range;
+	else if (sep != last) /* x-Y */
+		ret = kstrtouint(sep + 1, 0, &quirk->end_range);
+
+	if (quirk->start_range > quirk->end_range)
+		return -EINVAL;
+
+	return ret;
+}
+
+void scmi_quirks_initialize(void)
+{
+	struct scmi_quirk *quirk;
+	int i;
+
+	for (i = 0, quirk = scmi_quirks_table[0]; quirk;
+	     i++, quirk = scmi_quirks_table[i]) {
+		int ret;
+
+		ret = scmi_quirk_range_parse(quirk);
+		if (ret) {
+			pr_err("SCMI skip QUIRK [%s] - BAD RANGE - |%s|\n",
+			       quirk->name, quirk->impl_ver_range);
+			continue;
+		}
+		quirk->hkey = scmi_quirk_signature(quirk->vendor,
+						   quirk->sub_vendor_id);
+
+		hash_add(scmi_quirks_ht, &quirk->hash, quirk->hkey);
+
+		pr_debug("Registered SCMI QUIRK [%s] -- %p - Key [0x%08X] - %s/%s/[0x%08X-0x%08X]\n",
+			 quirk->name, quirk, quirk->hkey,
+			 quirk->vendor, quirk->sub_vendor_id,
+			 quirk->start_range, quirk->end_range);
+	}
+
+	pr_debug("SCMI Quirks initialized\n");
+}
+
+void scmi_quirks_enable(struct device *dev, const char *vend,
+			const char *subv, const u32 impl)
+{
+	for (int i = 3; i >= 0; i--) {
+		struct scmi_quirk *quirk;
+		unsigned int hkey;
+
+		hkey = scmi_quirk_signature(i > 1 ? vend : NULL,
+					    i > 2 ? subv : NULL);
+
+		/*
+		 * Note that there could be multiple matches so we
+		 * will enable multiple quirk part of an hash collision
+		 * domain...BUT we cannot assume that ALL quirks on the
+		 * same collision domain are a full match.
+		 */
+		hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
+			if (quirk->enabled || quirk->hkey != hkey ||
+			    impl < quirk->start_range ||
+			    impl > quirk->end_range)
+				continue;
+
+			if (quirk->compats[0] &&
+			    !of_machine_compatible_match(quirk->compats))
+				continue;
+
+			dev_info(dev, "Enabling SCMI Quirk [%s]\n",
+				 quirk->name);
+
+			dev_dbg(dev,
+				"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
+				quirk->compats[0], quirk->vendor,
+				quirk->sub_vendor_id,
+				quirk->start_range, quirk->end_range);
+
+			static_branch_enable(quirk->key);
+			quirk->enabled = true;
+		}
+	}
+}
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
new file mode 100644
index 000000000000..28829b4f0646
--- /dev/null
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * System Control and Management Interface (SCMI) Message Protocol Quirks
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ */
+#ifndef _SCMI_QUIRKS_H
+#define _SCMI_QUIRKS_H
+
+#include <linux/static_key.h>
+#include <linux/types.h>
+
+#ifdef CONFIG_ARM_SCMI_QUIRKS
+
+#define DECLARE_SCMI_QUIRK(_qn)						\
+	DECLARE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn)
+
+/*
+ * A helper to associate the actual code snippet to use as a quirk
+ * named as _qn.
+ */
+#define SCMI_QUIRK(_qn, _blk)						\
+	do {								\
+		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
+			(_blk);						\
+	} while (0)
+
+void scmi_quirks_initialize(void);
+void scmi_quirks_enable(struct device *dev, const char *vend,
+			const char *subv, const u32 impl);
+
+#else
+
+#define DECLARE_SCMI_QUIRK(_qn)
+/* Force quirks compilation even when SCMI Quirks are disabled */
+#define SCMI_QUIRK(_qn, _blk)						\
+	do {								\
+		if (0)							\
+			(_blk);						\
+	} while (0)
+
+static inline void scmi_quirks_initialize(void) { }
+static inline void scmi_quirks_enable(struct device *dev, const char *vend,
+				      const char *sub_vend, const u32 impl) { }
+
+#endif /* CONFIG_ARM_SCMI_QUIRKS */
+
+#endif /* _SCMI_QUIRKS_H */
-- 
2.47.0

