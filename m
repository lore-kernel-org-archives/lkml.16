Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEED2957C7;
	Tue, 15 Apr 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727414; cv=none; b=VgDwOtU82a9vgFmaStKiu++kvVVAQ7AATRbS1Y9vMSG1MgH5GQRGJOcPXikvVgnaiJljPNfF/nurXTU/zVQLqIZLpoOlnipL+5GKk3ahtSe58vY/ksXnJpK716F+S/REFfDZ3EOc/QSSSQC4dj6Q4Z2Ma6orlQ+kvwZO8vQSCMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727414; c=relaxed/simple;
	bh=ln/dZpPzqXMTEQvsGiaOurHQxVXjGbI/dpzUHwQ1eXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckT/X+YR3ABAtpAg1Z7EyI3tRdhAkt6h4ynLzNOFnNKKOQ1anl4o2rJ65MuejEpYtVwicuUR8QhiFywVNiZGyKoQ95Mb91ojgOwtvaWovm95UD89MicAf5Ver+NOQ4TG0dTThLNFwwU7muM/1EJDqMYh2N7Hg3NjHA26/oZTO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7F5115A1;
	Tue, 15 Apr 2025 07:30:09 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F03F3F694;
	Tue, 15 Apr 2025 07:30:08 -0700 (PDT)
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
Subject: [PATCH 2/4] firmware: arm_scmi: Add Quirks framework
Date: Tue, 15 Apr 2025 15:29:31 +0100
Message-ID: <20250415142933.1746249-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415142933.1746249-1-cristian.marussi@arm.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/base.c   |   1 +
 drivers/firmware/arm_scmi/driver.c |  22 +++
 drivers/firmware/arm_scmi/quirks.c | 242 +++++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.h |  40 +++++
 6 files changed, 319 insertions(+)
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
diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/arm_scmi/base.c
index 86b376c50a13..00dc8f86c627 100644
--- a/drivers/firmware/arm_scmi/base.c
+++ b/drivers/firmware/arm_scmi/base.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) "SCMI Notifications BASE - " fmt
 
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/scmi_protocol.h>
 
 #include "common.h"
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 0e281fca0a38..1d500663004a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -38,6 +38,7 @@
 
 #include "common.h"
 #include "notify.h"
+#include "quirks.h"
 
 #include "raw_mode.h"
 
@@ -3112,6 +3113,23 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
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
+	/* Enable applicable quirks */
+	scmi_quirks_enable(info->dev, compatible,
+			   rev->vendor_id, rev->sub_vendor_id, rev->impl_ver);
+}
+
 static int scmi_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -3233,6 +3251,8 @@ static int scmi_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &scmi_list);
 	mutex_unlock(&scmi_list_mutex);
 
+	scmi_enable_matching_quirks(info);
+
 	for_each_available_child_of_node(np, child) {
 		u32 prot_id;
 
@@ -3391,6 +3411,8 @@ static struct dentry *scmi_debugfs_init(void)
 
 static int __init scmi_driver_init(void)
 {
+	scmi_quirks_initialize();
+
 	/* Bail out if no SCMI transport was configured */
 	if (WARN_ON(!IS_ENABLED(CONFIG_ARM_SCMI_HAVE_TRANSPORT)))
 		return -EINVAL;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
new file mode 100644
index 000000000000..2f95b35b5ca1
--- /dev/null
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) Message Protocol Quirks
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ */
+
+#include <linux/ctype.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/hashtable.h>
+#include <linux/kstrtox.h>
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
+	char *compatible;
+	char *vendor;
+	char *sub_vendor_id;
+	char *impl_ver_range;
+	u32 start_range;
+	u32 end_range;
+	struct static_key_false *key;
+	struct hlist_node hash;
+	unsigned int hkey;
+};
+
+#define __DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)	\
+	static struct scmi_quirk scmi_quirk_entry_ ## _qn = {		\
+		.name = __stringify(quirk_ ## _qn),			\
+		.compatible = _comp,					\
+		.vendor = _ven,						\
+		.sub_vendor_id = _sub,					\
+		.impl_ver_range = _impl,				\
+		.key = &(scmi_quirk_ ## _qn),				\
+	}
+
+#define __DECLARE_SCMI_QUIRK_ENTRY(_qn)		(&(scmi_quirk_entry_ ## _qn))
+
+/*
+ * Define a quirk by name (_qn) and provide the matching tokens where:
+ *
+ *  _comp : compatible string, NULL means any.
+ *  _ven : SCMI Vendor ID string, NULL means any.
+ *  _sub : SCMI SubVendor ID string, NULL means any.
+ *  _impl : SCMI Implementation Version string, NULL means any.
+ *          This version string can express ranges using the following
+ *          syntax:
+ *
+ *			NULL		[0, 0xFFFFFFFF]
+ *			"X"		[X, X]
+ *			"X-"		[X, 0xFFFFFFFF]
+ *			"-X"		[0, X]
+ *			"X-Y"		[X, Y]
+ *
+ *          where <v> in [MIN, MAX] means:
+ *
+ *		MIN <= <v> <= MAX  && MIN <= MAX
+ *
+ *  This implicitly define also a properly named global static-key that
+ *  will be used to dynamically enable the quirk at initialization time.
+ *
+ *  Note that it is possible to associate multiple quirks to the same
+ *  matching pattern, if your firmware quality is really astounding :P
+ */
+#define DEFINE_SCMI_QUIRK(_qn, _comp, _ven, _sub, _impl)		\
+	DEFINE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn);			\
+	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
+
+/*
+ * Same as DEFINE_SCMI_QUIRK but EXPORTED: this is meant to address quirks
+ * that possibly reside in code that is included in loadable kernel modules
+ * that needs to be able to access the global static keys at runtime to
+ * determine if enabled or not. (see SCMI_QUIRK to understand usage)
+ */
+#define DEFINE_SCMI_QUIRK_EXPORTED(_qn, _comp, _ven, _sub, _impl)	\
+	DEFINE_STATIC_KEY_FALSE(scmi_quirk_ ## _qn);			\
+	EXPORT_SYMBOL_GPL(scmi_quirk_ ## _qn);				\
+	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
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
+static unsigned int
+scmi_quirk_signature(const char *compat, const char *vend, const char *sub_vend)
+{
+	char *signature, *p;
+	unsigned int hash32;
+	unsigned long hash = 0;
+
+	/* vendor_id/sub_vendor_id guaranteed <= SCMI_SHORT_NAME_MAX_SIZE */
+	signature = kasprintf(GFP_KERNEL, "|%s|%s|%s|",
+			      compat ?: "", vend ?: "", sub_vend ?: "");
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
+	if (sep == first) // -X
+		ret = kstrtouint(first + 1, 0, &quirk->end_range);
+	else // X OR X- OR X-y
+		ret = kstrtouint(first, 0, &quirk->start_range);
+	if (ret)
+		return ret;
+
+	if (!sep)
+		quirk->end_range = quirk->start_range;
+	else if (sep != last) //x-Y
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
+			pr_err("SCMI skip QUIRK [%s] - BAD RANGE\n",
+			       quirk->name);
+			continue;
+		}
+		quirk->hkey = scmi_quirk_signature(quirk->compatible,
+						   quirk->vendor,
+						   quirk->sub_vendor_id);
+
+		hash_add(scmi_quirks_ht, &quirk->hash, quirk->hkey);
+
+		pr_debug("Registered SCMI QUIRK [%s] -- %p - Key [0x%08X] - %s/%s/%s/[0x%08X-0x%08X]\n",
+			 quirk->name, quirk, quirk->hkey, quirk->compatible,
+			 quirk->vendor, quirk->sub_vendor_id,
+			 quirk->start_range, quirk->end_range);
+	}
+
+	pr_debug("SCMI Quirks initialized\n");
+}
+
+void scmi_quirks_enable(struct device *dev, const char *compat,
+			const char *vend, const char *subv, const u32 impl)
+{
+	dev_dbg(dev, "Looking for quirks matching: %s/%s/%s/0x%08X\n",
+		compat, vend, subv, impl);
+
+	/* Lookup into scmi_quirks_ht using 2 loops: with/without compatible */
+	for (int k = 1; k >= 0 ; k--) {
+		const char *compat_sel = k > 0 ? compat : NULL;
+
+		for (int i = 3; i > 0; i--) {
+			struct scmi_quirk *quirk;
+			unsigned int hkey;
+
+			hkey = scmi_quirk_signature(compat_sel,
+						    i > 1 ? vend : NULL,
+						    i > 2 ? subv : NULL);
+
+			/*
+			 * Note that there could be multiple matches so we
+			 * will enable multiple quirk part of an hash collision
+			 * domain...BUT we cannot assume that ALL quirks on the
+			 * same collision domain are a full match.
+			 */
+			hash_for_each_possible(scmi_quirks_ht, quirk, hash, hkey) {
+				if (quirk->enabled || quirk->hkey != hkey ||
+				    impl < quirk->start_range ||
+				    impl > quirk->end_range)
+					continue;
+
+				dev_info(dev, "Enabling SCMI Quirk [%s]\n",
+					 quirk->name);
+				dev_dbg(dev,
+					"Quirk matched on: %s/%s/%s/[0x%08X-0x%08X]\n",
+					quirk->compatible, quirk->vendor,
+					quirk->sub_vendor_id,
+					quirk->start_range, quirk->end_range);
+
+				static_branch_enable(quirk->key);
+				quirk->enabled = true;
+			}
+		}
+	}
+}
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
new file mode 100644
index 000000000000..0f1a14b13ba5
--- /dev/null
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -0,0 +1,40 @@
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
+#define SCMI_QUIRK(_qn, _blk)						\
+	do {								\
+		if (static_branch_unlikely(&(scmi_quirk_ ## _qn)))	\
+			(_blk);						\
+	} while (0)
+
+void scmi_quirks_initialize(void);
+void scmi_quirks_enable(struct device *dev, const char *compat,
+			const char *vend, const char *subv, const u32 impl);
+
+#else
+
+#define DECLARE_SCMI_QUIRK(_qn)
+#define SCMI_QUIRK(_qn, _blk)
+
+static inline void scmi_quirks_initialize(void) { }
+static inline void scmi_quirks_enable(struct device *dev, const char *compat,
+				      const char *vend, const char *sub_vend,
+				      const u32 impl) { }
+
+#endif /* CONFIG_ARM_SCMI_QUIRKS */
+
+#endif /* _SCMI_QUIRKS_H */
-- 
2.47.0

