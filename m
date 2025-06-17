Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE61F4184;
	Tue, 17 Jun 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124459; cv=none; b=gv7Z1qhHMv/HKbwq8rPSvXYklZFRuELCosp09N7LIt2Q7Oet9k7cOhNWJfoUXzK9xYn0GNYPghxs5BmHguf8xAM1VrWgnqfSbSSQQUtNh9tDyveXjjPooI2z8MIvRqFtZEqINHNTfkcLxr+B42sSOtBkoyXIoT13mciuS1B5M5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124459; c=relaxed/simple;
	bh=yGZjwRwS3q3Xd1vy2lWd5Pt0wxKCZaAfPKD0c0fHW3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jp6YEBEK7x3VSeNbwEeED1qTxSxDOg31X78kO8mNNXwbRKN8Q41+J9FqLs8TIYskMrdqnDE75lBay8WOHD6PSZpK8Ps05Fgde+xvvpyXwuTXcqRvYjiyg3Cnv2vi6WfzFnD6UXHyTY57SDiDYd6XXrmroYEICX/R6cPCCNsQkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ixpk3UPG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ixpk3UPG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124457; x=1781660457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yGZjwRwS3q3Xd1vy2lWd5Pt0wxKCZaAfPKD0c0fHW3c=;
  b=Ixpk3UPGSiWWAN2i37Yimbw+oJdr8RniYku9bLOphgslrNPLacGzUgY7
   4H27j+I3TV9Cgx/Gx6Z8Cy6TJGf89oApiZJUzSge425oRziWSkkDBA0K/
   lGbCDJobefoOZmeGyz32n/eIwnhmsqafl90dxcgzy53yt9NxuLHf0mgEN
   CJg0W/ZYSqwuRi08ZyBmz2sZSAONmszQmDnyUc2JZHpFZdKVkKeiTFgbe
   a42mM8otMqqVkT6o++5JuEpjgyNYGPRpivS3s/nFCvaDmtwjFQOiL0xp7
   Rr9qiprlAET2nOGU5KSnW7UfgHh7zCcyYBsPwyJ8xB/tlg7XtGjYAXwuH
   Q==;
X-CSE-ConnectionGUID: i3FH8PCgTjKlbeRxiIRnnw==
X-CSE-MsgGUID: GIsJZnEDTYSZhaFvQySFYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556564"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:53 -0700
X-CSE-ConnectionGUID: ErZQllkEQbKbYITwzt3Xqw==
X-CSE-MsgGUID: uTYun7SFT6+Ko1YfHp02JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989478"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:52 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH V2 08/15] platform/x86/intel/pmt: Add PMT Discovery driver
Date: Mon, 16 Jun 2025 18:40:32 -0700
Message-ID: <20250617014041.2861032-9-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch introduces a new driver to enumerate and expose Intel Platform
Monitoring Technology (PMT) capabilities via a simple discovery mechanism.
The PMT Discovery driver parses hardware-provided discovery tables from
Intel Out of Band Management Services Modules (OOBMSM) and extracts feature
information for various providers (such as TPMI, Telemetry, Crash Log,
etc). This unified interface simplifies the process of determining which
manageability and telemetry features are supported by a given platform.

This new feature is described in the Intel Platform Monitoring Technology
3.0 specification, section 6.6 Capability.

Key changes and additions:

New file drivers/platform/x86/intel/pmt/discovery.c:
  =E2=80=93 Implements the discovery logic to map the discovery resource, r=
ead
    the feature discovery table, and validate feature parameters.
New file drivers/platform/x86/intel/pmt/features.c:
  =E2=80=93 Defines feature names, layouts, and associated capability masks.
  =E2=80=93 Provides a mapping between raw hardware attributes and sysfs
    representations for easier integration with user-space tools.
New header include/linux/intel_pmt_features.h:
  =E2=80=93 Declares constants, masks, and feature identifiers used across =
the
    PMT framework.
Sysfs integration:
  =E2=80=93 Feature attributes are exposed under /sys/class/intel_pmt.
  =E2=80=93 Each device is represented by a subfolder within the intel_pmt =
class,
    named using its DBDF (Domain:Bus:Device.Function), e.g.:
        features-0000:00:03.1
  =E2=80=93 Example directory layout for a device:

    /sys/class/intel_pmt/features-0000:00:03.1/
    =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry
    =E2=94=9C=E2=94=80=E2=94=80 crash_log
    =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry
    =E2=94=9C=E2=94=80=E2=94=80 per_core_performance_telemetry
    =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry
    =E2=94=9C=E2=94=80=E2=94=80 per_rmid_perf_telemetry
    =E2=94=9C=E2=94=80=E2=94=80 tpmi_control
    =E2=94=9C=E2=94=80=E2=94=80 tracing
    =E2=94=94=E2=94=80=E2=94=80 uncore_telemetry

By exposing PMT feature details through sysfs and integrating with the
existing PMT class, this driver paves the way for more streamlined
integration of PMT-based manageability and telemetry tools.

Link: https://www.intel.com/content/www/us/en/content-details/710389/intel-=
platform-monitoring-technology-intel-pmt-external-specification.html
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v2:
  - Add comment spelling out RMID
  - Remove extra parens around several uses of PTR_ERR()
  - Add PMT_ACCESS_TYPE_RSVD for magic number 0x7
  - In pmt_feature_discovery() clarify zero-init of disc_tbl is for false
    positive compiler warning.
  - In features.c fix several spelling errors, use snake case
    consistently for all capability names, and spell out "telemetry".

 drivers/platform/x86/intel/pmt/Kconfig     |  12 +
 drivers/platform/x86/intel/pmt/Makefile    |   2 +
 drivers/platform/x86/intel/pmt/class.c     |  35 +-
 drivers/platform/x86/intel/pmt/class.h     |   2 +
 drivers/platform/x86/intel/pmt/discovery.c | 602 +++++++++++++++++++++
 drivers/platform/x86/intel/pmt/features.c  | 205 +++++++
 include/linux/intel_pmt_features.h         | 157 ++++++
 7 files changed, 1013 insertions(+), 2 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmt/discovery.c
 create mode 100644 drivers/platform/x86/intel/pmt/features.c
 create mode 100644 include/linux/intel_pmt_features.h

diff --git a/drivers/platform/x86/intel/pmt/Kconfig b/drivers/platform/x86/=
intel/pmt/Kconfig
index e916fc966221..0ad91b5112e9 100644
--- a/drivers/platform/x86/intel/pmt/Kconfig
+++ b/drivers/platform/x86/intel/pmt/Kconfig
@@ -38,3 +38,15 @@ config INTEL_PMT_CRASHLOG
=20
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel_pmt_crashlog.
+
+config INTEL_PMT_DISCOVERY
+	tristate "Intel Platform Monitoring Technology (PMT) Discovery driver"
+	depends on INTEL_VSEC
+	select INTEL_PMT_CLASS
+	help
+	  The Intel Platform Monitoring Technology (PMT) discovery driver provides
+	  access to details about the various PMT features and feature specific
+	  attributes.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pmt_discovery.
diff --git a/drivers/platform/x86/intel/pmt/Makefile b/drivers/platform/x86=
/intel/pmt/Makefile
index 279e158c7c23..8aed7e1592e4 100644
--- a/drivers/platform/x86/intel/pmt/Makefile
+++ b/drivers/platform/x86/intel/pmt/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_INTEL_PMT_TELEMETRY)	+=3D pmt_telemetry.o
 pmt_telemetry-y				:=3D telemetry.o
 obj-$(CONFIG_INTEL_PMT_CRASHLOG)	+=3D pmt_crashlog.o
 pmt_crashlog-y				:=3D crashlog.o
+obj-$(CONFIG_INTEL_PMT_DISCOVERY)	+=3D pmt_discovery.o
+pmt_discovery-y				:=3D discovery.o features.o
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 7233b654bbad..a806a81ece52 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -9,11 +9,13 @@
  */
=20
 #include <linux/kernel.h>
+#include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/pci.h>
+#include <linux/sysfs.h>
=20
 #include "class.h"
=20
@@ -166,12 +168,41 @@ static struct attribute *intel_pmt_attrs[] =3D {
 	&dev_attr_offset.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(intel_pmt);
=20
-static struct class intel_pmt_class =3D {
+static umode_t intel_pmt_attr_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct device *dev =3D container_of(kobj, struct device, kobj);
+	struct auxiliary_device *auxdev =3D to_auxiliary_dev(dev->parent);
+	struct intel_vsec_device *ivdev =3D auxdev_to_ivdev(auxdev);
+
+	/*
+	 * Place the discovery features folder in /sys/class/intel_pmt, but
+	 * exclude the common attributes as they are not applicable.
+	 */
+	if (ivdev->cap_id =3D=3D ilog2(VSEC_CAP_DISCOVERY))
+		return 0;
+
+	return attr->mode;
+}
+
+static bool intel_pmt_group_visible(struct kobject *kobj)
+{
+	return true;
+}
+DEFINE_SYSFS_GROUP_VISIBLE(intel_pmt);
+
+static const struct attribute_group intel_pmt_group =3D {
+	.attrs =3D intel_pmt_attrs,
+	.is_visible =3D SYSFS_GROUP_VISIBLE(intel_pmt),
+};
+__ATTRIBUTE_GROUPS(intel_pmt);
+
+struct class intel_pmt_class =3D {
 	.name =3D "intel_pmt",
 	.dev_groups =3D intel_pmt_groups,
 };
+EXPORT_SYMBOL_GPL(intel_pmt_class);
=20
 static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 				    struct intel_vsec_device *ivdev,
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index b2006d57779d..39c32357ee2c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -20,6 +20,7 @@
 #define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
=20
 struct pci_dev;
+extern struct class intel_pmt_class;
=20
 struct telem_endpoint {
 	struct pci_dev		*pcidev;
@@ -48,6 +49,7 @@ struct intel_pmt_entry {
 	unsigned long		base_addr;
 	size_t			size;
 	u32			guid;
+	u32			num_rmids; /* Number of Resource Monitoring IDs */
 	int			devid;
 };
=20
diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/=
x86/intel/pmt/discovery.c
new file mode 100644
index 000000000000..4b4fa3137ad2
--- /dev/null
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -0,0 +1,602 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Platform Monitory Technology Discovery driver
+ *
+ * Copyright (c) 2025, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kdev_t.h>
+#include <linux/kobject.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/string_choices.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
+
+#include <linux/intel_pmt_features.h>
+#include <linux/intel_vsec.h>
+
+#include "class.h"
+
+#define MAX_FEATURE_VERSION	0
+#define DT_TBIR			GENMASK(2, 0)
+#define FEAT_ATTR_SIZE(x)	((x) * sizeof(u32))
+#define PMT_GUID_SIZE(x)	((x) * sizeof(u32))
+#define PMT_ACCESS_TYPE_RSVD	0xF
+#define SKIP_FEATURE		1
+
+struct feature_discovery_table {
+	u32	access_type:4;
+	u32	version:8;
+	u32	size:16;
+	u32	reserved:4;
+	u32	id;
+	u32	offset;
+	u32	reserved2;
+};
+
+/* Common feature table header */
+struct feature_header {
+	u32	attr_size:8;
+	u32	num_guids:8;
+	u32	reserved:16;
+};
+
+/* Feature attribute fields */
+struct caps {
+	u32		caps;
+};
+
+struct command {
+	u32		max_stream_size:16;
+	u32		max_command_size:16;
+};
+
+struct watcher {
+	u32		reserved:21;
+	u32		period:11;
+	struct command	command;
+};
+
+struct rmid {
+	u32		num_rmids:16;	/* Number of Resource Monitoring IDs */
+	u32		reserved:16;
+	struct watcher	watcher;
+};
+
+struct feature_table {
+	struct feature_header	header;
+	struct caps		caps;
+	union {
+		struct command command;
+		struct watcher watcher;
+		struct rmid rmid;
+	};
+	u32			*guids;
+};
+
+/* For backreference in struct feature */
+struct pmt_features_priv;
+
+struct feature {
+	struct feature_table		table;
+	struct kobject			kobj;
+	struct pmt_features_priv	*priv;
+	struct list_head		list;
+	const struct attribute_group	*attr_group;
+	enum pmt_feature_id		id;
+};
+
+struct pmt_features_priv {
+	struct device		*parent;
+	struct device		*dev;
+	int			count;
+	u32			mask;
+	struct feature		feature[];
+};
+
+static LIST_HEAD(pmt_feature_list);
+static DEFINE_MUTEX(feature_list_lock);
+
+#define to_pmt_feature(x) container_of(x, struct feature, kobj)
+static void pmt_feature_release(struct kobject *kobj)
+{
+}
+
+static ssize_t caps_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct feature *feature =3D to_pmt_feature(kobj);
+	struct pmt_cap **pmt_caps;
+	u32 caps =3D feature->table.caps.caps;
+	ssize_t ret =3D 0;
+
+	switch (feature->id) {
+	case FEATURE_PER_CORE_PERF_TELEM:
+		pmt_caps =3D pmt_caps_pcpt;
+		break;
+	case FEATURE_PER_CORE_ENV_TELEM:
+		pmt_caps =3D pmt_caps_pcet;
+		break;
+	case FEATURE_PER_RMID_PERF_TELEM:
+		pmt_caps =3D pmt_caps_rmid_perf;
+		break;
+	case FEATURE_ACCEL_TELEM:
+		pmt_caps =3D pmt_caps_accel;
+		break;
+	case FEATURE_UNCORE_TELEM:
+		pmt_caps =3D pmt_caps_uncore;
+		break;
+	case FEATURE_CRASH_LOG:
+		pmt_caps =3D pmt_caps_crashlog;
+		break;
+	case FEATURE_PETE_LOG:
+		pmt_caps =3D pmt_caps_pete;
+		break;
+	case FEATURE_TPMI_CTRL:
+		pmt_caps =3D pmt_caps_tpmi;
+		break;
+	case FEATURE_TRACING:
+		pmt_caps =3D pmt_caps_tracing;
+		break;
+	case FEATURE_PER_RMID_ENERGY_TELEM:
+		pmt_caps =3D pmt_caps_rmid_energy;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	while (*pmt_caps) {
+		struct pmt_cap *pmt_cap =3D *pmt_caps;
+
+		while (pmt_cap->name) {
+			ret +=3D sysfs_emit_at(buf, ret, "%-40s Available: %s\n", pmt_cap->name,
+					     str_yes_no(pmt_cap->mask & caps));
+			pmt_cap++;
+		}
+		pmt_caps++;
+	}
+
+	return ret;
+}
+static struct kobj_attribute caps_attribute =3D __ATTR_RO(caps);
+
+static struct watcher *get_watcher(struct feature *feature)
+{
+	switch (feature_layout[feature->id]) {
+	case LAYOUT_RMID:
+		return &feature->table.rmid.watcher;
+	case LAYOUT_WATCHER:
+		return &feature->table.watcher;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static struct command *get_command(struct feature *feature)
+{
+	switch (feature_layout[feature->id]) {
+	case LAYOUT_RMID:
+		return &feature->table.rmid.watcher.command;
+	case LAYOUT_WATCHER:
+		return &feature->table.watcher.command;
+	case LAYOUT_COMMAND:
+		return &feature->table.command;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static ssize_t num_rmids_show(struct kobject *kobj,
+			      struct kobj_attribute *attr, char *buf)
+{
+	struct feature *feature =3D to_pmt_feature(kobj);
+
+	return sysfs_emit(buf, "%u\n", feature->table.rmid.num_rmids);
+}
+static struct kobj_attribute num_rmids_attribute =3D __ATTR_RO(num_rmids);
+
+static ssize_t min_watcher_period_ms_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	struct feature *feature =3D to_pmt_feature(kobj);
+	struct watcher *watcher =3D get_watcher(feature);
+
+	if (IS_ERR(watcher))
+		return PTR_ERR(watcher);
+
+	return sysfs_emit(buf, "%u\n", watcher->period);
+}
+static struct kobj_attribute min_watcher_period_ms_attribute =3D
+	__ATTR_RO(min_watcher_period_ms);
+
+static ssize_t max_stream_size_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct feature *feature =3D to_pmt_feature(kobj);
+	struct command *command =3D get_command(feature);
+
+	if (IS_ERR(command))
+		return PTR_ERR(command);
+
+	return sysfs_emit(buf, "%u\n", command->max_stream_size);
+}
+static struct kobj_attribute max_stream_size_attribute =3D
+	__ATTR_RO(max_stream_size);
+
+static ssize_t max_command_size_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct feature *feature =3D to_pmt_feature(kobj);
+	struct command *command =3D get_command(feature);
+
+	if (IS_ERR(command))
+		return PTR_ERR(command);
+
+	return sysfs_emit(buf, "%u\n", command->max_command_size);
+}
+static struct kobj_attribute max_command_size_attribute =3D
+	__ATTR_RO(max_command_size);
+
+static ssize_t guids_show(struct kobject *kobj, struct kobj_attribute *att=
r,
+			  char *buf)
+{
+	struct feature *feature =3D to_pmt_feature(kobj);
+	int i, count =3D 0;
+
+	for (i =3D 0; i < feature->table.header.num_guids; i++)
+		count +=3D sysfs_emit_at(buf, count, "0x%x\n",
+				       feature->table.guids[i]);
+
+	return count;
+}
+static struct kobj_attribute guids_attribute =3D __ATTR_RO(guids);
+
+static struct attribute *pmt_feature_rmid_attrs[] =3D {
+	&caps_attribute.attr,
+	&num_rmids_attribute.attr,
+	&min_watcher_period_ms_attribute.attr,
+	&max_stream_size_attribute.attr,
+	&max_command_size_attribute.attr,
+	&guids_attribute.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(pmt_feature_rmid);
+
+static const struct kobj_type pmt_feature_rmid_ktype =3D {
+	.sysfs_ops =3D &kobj_sysfs_ops,
+	.release =3D pmt_feature_release,
+	.default_groups =3D pmt_feature_rmid_groups,
+};
+
+static struct attribute *pmt_feature_watcher_attrs[] =3D {
+	&caps_attribute.attr,
+	&min_watcher_period_ms_attribute.attr,
+	&max_stream_size_attribute.attr,
+	&max_command_size_attribute.attr,
+	&guids_attribute.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(pmt_feature_watcher);
+
+static const struct kobj_type pmt_feature_watcher_ktype =3D {
+	.sysfs_ops =3D &kobj_sysfs_ops,
+	.release =3D pmt_feature_release,
+	.default_groups =3D pmt_feature_watcher_groups,
+};
+
+static struct attribute *pmt_feature_command_attrs[] =3D {
+	&caps_attribute.attr,
+	&max_stream_size_attribute.attr,
+	&max_command_size_attribute.attr,
+	&guids_attribute.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(pmt_feature_command);
+
+static const struct kobj_type pmt_feature_command_ktype =3D {
+	.sysfs_ops =3D &kobj_sysfs_ops,
+	.release =3D pmt_feature_release,
+	.default_groups =3D pmt_feature_command_groups,
+};
+
+static struct attribute *pmt_feature_guids_attrs[] =3D {
+	&caps_attribute.attr,
+	&guids_attribute.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(pmt_feature_guids);
+
+static const struct kobj_type pmt_feature_guids_ktype =3D {
+	.sysfs_ops =3D &kobj_sysfs_ops,
+	.release =3D pmt_feature_release,
+	.default_groups =3D pmt_feature_guids_groups,
+};
+
+static int
+pmt_feature_get_disc_table(struct pmt_features_priv *priv,
+			   struct resource *disc_res,
+			   struct feature_discovery_table *disc_tbl)
+{
+	void __iomem *disc_base;
+
+	disc_base =3D devm_ioremap_resource(priv->dev, disc_res);
+	if (IS_ERR(disc_base))
+		return PTR_ERR(disc_base);
+
+	memcpy_fromio(disc_tbl, disc_base, sizeof(*disc_tbl));
+
+	devm_iounmap(priv->dev, disc_base);
+
+	if (priv->mask & BIT(disc_tbl->id))
+		return dev_err_probe(priv->dev, -EINVAL, "Duplicate feature: %s\n",
+				     pmt_feature_names[disc_tbl->id]);
+
+	/*
+	 * Some devices may expose non-functioning entries that are
+	 * reserved for future use. They have zero size. Do not fail
+	 * probe for these. Just ignore them.
+	 */
+	if (disc_tbl->size =3D=3D 0 || disc_tbl->access_type =3D=3D PMT_ACCESS_TY=
PE_RSVD)
+		return SKIP_FEATURE;
+
+	if (disc_tbl->version > MAX_FEATURE_VERSION)
+		return SKIP_FEATURE;
+
+	if (!pmt_feature_id_is_valid(disc_tbl->id))
+		return SKIP_FEATURE;
+
+	priv->mask |=3D BIT(disc_tbl->id);
+
+	return 0;
+}
+
+static int
+pmt_feature_get_feature_table(struct pmt_features_priv *priv,
+			      struct feature *feature,
+			      struct feature_discovery_table *disc_tbl,
+			      struct resource *disc_res)
+{
+	struct feature_table *feat_tbl =3D &feature->table;
+	struct feature_header *header;
+	struct resource res =3D {};
+	resource_size_t res_size;
+	void __iomem *feat_base, *feat_offset;
+	void *tbl_offset;
+	size_t size;
+	u32 *guids;
+	u8 tbir;
+
+	tbir =3D FIELD_GET(DT_TBIR, disc_tbl->offset);
+
+	switch (disc_tbl->access_type) {
+	case ACCESS_LOCAL:
+		if (tbir)
+			return dev_err_probe(priv->dev, -EINVAL,
+				"Unsupported BAR index %u for access type %u\n",
+				tbir, disc_tbl->access_type);
+
+
+		/*
+		 * For access_type LOCAL, the base address is as follows:
+		 * base address =3D end of discovery region + base offset + 1
+		 */
+		res =3D DEFINE_RES_MEM(disc_res->end + disc_tbl->offset + 1,
+				     disc_tbl->size * sizeof(u32));
+		break;
+
+	default:
+		return dev_err_probe(priv->dev, -EINVAL, "Unrecognized access_type %u\n",
+				     disc_tbl->access_type);
+	}
+
+	feature->id =3D disc_tbl->id;
+
+	/* Get the feature table */
+	feat_base =3D devm_ioremap_resource(priv->dev, &res);
+	if (IS_ERR(feat_base))
+		return PTR_ERR(feat_base);
+
+	feat_offset =3D feat_base;
+	tbl_offset =3D feat_tbl;
+
+	/* Get the header */
+	header =3D &feat_tbl->header;
+	memcpy_fromio(header, feat_offset, sizeof(*header));
+
+	/* Validate fields fit within mapped resource */
+	size =3D sizeof(*header) + FEAT_ATTR_SIZE(header->attr_size) +
+	       PMT_GUID_SIZE(header->num_guids);
+	res_size =3D resource_size(&res);
+	if (WARN(size > res_size, "Bad table size %ld > %pa", size, &res_size))
+		return -EINVAL;
+
+	/* Get the feature attributes, including capability fields */
+	tbl_offset +=3D sizeof(*header);
+	feat_offset +=3D sizeof(*header);
+
+	memcpy_fromio(tbl_offset, feat_offset, FEAT_ATTR_SIZE(header->attr_size));
+
+	/* Finally, get the guids */
+	guids =3D devm_kmalloc(priv->dev, PMT_GUID_SIZE(header->num_guids), GFP_K=
ERNEL);
+	if (!guids)
+		return -ENOMEM;
+
+	feat_offset +=3D FEAT_ATTR_SIZE(header->attr_size);
+
+	memcpy_fromio(guids, feat_offset, PMT_GUID_SIZE(header->num_guids));
+
+	feat_tbl->guids =3D guids;
+
+	devm_iounmap(priv->dev, feat_base);
+
+	return 0;
+}
+
+static void pmt_features_add_feat(struct feature *feature)
+{
+	guard(mutex)(&feature_list_lock);
+	list_add(&feature->list, &pmt_feature_list);
+}
+
+static void pmt_features_remove_feat(struct feature *feature)
+{
+	guard(mutex)(&feature_list_lock);
+	list_del(&feature->list);
+}
+
+/* Get the discovery table and use it to get the feature table */
+static int pmt_features_discovery(struct pmt_features_priv *priv,
+				  struct feature *feature,
+				  struct intel_vsec_device *ivdev,
+				  int idx)
+{
+	struct feature_discovery_table disc_tbl =3D {}; /* Avoid false warning */
+	struct resource *disc_res =3D &ivdev->resource[idx];
+	const struct kobj_type *ktype;
+	int ret;
+
+	ret =3D pmt_feature_get_disc_table(priv, disc_res, &disc_tbl);
+	if (ret)
+		return ret;
+
+	ret =3D pmt_feature_get_feature_table(priv, feature, &disc_tbl, disc_res);
+	if (ret)
+		return ret;
+
+	switch (feature_layout[feature->id]) {
+	case LAYOUT_RMID:
+		ktype =3D &pmt_feature_rmid_ktype;
+		feature->attr_group =3D &pmt_feature_rmid_group;
+		break;
+	case LAYOUT_WATCHER:
+		ktype =3D &pmt_feature_watcher_ktype;
+		feature->attr_group =3D &pmt_feature_watcher_group;
+		break;
+	case LAYOUT_COMMAND:
+		ktype =3D &pmt_feature_command_ktype;
+		feature->attr_group =3D &pmt_feature_command_group;
+		break;
+	case LAYOUT_CAPS_ONLY:
+		ktype =3D &pmt_feature_guids_ktype;
+		feature->attr_group =3D &pmt_feature_guids_group;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret =3D kobject_init_and_add(&feature->kobj, ktype, &priv->dev->kobj,
+				   pmt_feature_names[feature->id]);
+	if (ret)
+		return ret;
+
+	kobject_uevent(&feature->kobj, KOBJ_ADD);
+	pmt_features_add_feat(feature);
+
+	return 0;
+}
+
+static void pmt_features_remove(struct auxiliary_device *auxdev)
+{
+	struct pmt_features_priv *priv =3D auxiliary_get_drvdata(auxdev);
+	int i;
+
+	for (i =3D 0; i < priv->count; i++) {
+		struct feature *feature =3D &priv->feature[i];
+
+		pmt_features_remove_feat(feature);
+		sysfs_remove_group(&feature->kobj, feature->attr_group);
+		kobject_put(&feature->kobj);
+	}
+
+	device_unregister(priv->dev);
+}
+
+static int pmt_features_probe(struct auxiliary_device *auxdev, const struc=
t auxiliary_device_id *id)
+{
+	struct intel_vsec_device *ivdev =3D auxdev_to_ivdev(auxdev);
+	struct pmt_features_priv *priv;
+	size_t size;
+	int ret, i;
+
+	size =3D struct_size(priv, feature, ivdev->num_resources);
+	priv =3D devm_kzalloc(&auxdev->dev, size, GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->parent =3D &ivdev->pcidev->dev;
+	auxiliary_set_drvdata(auxdev, priv);
+
+	priv->dev =3D device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, 0), =
priv,
+				  "%s-%s", "features", dev_name(priv->parent));
+	if (IS_ERR(priv->dev))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->dev),
+				     "Could not create %s-%s device node\n",
+				     "features", dev_name(priv->dev));
+
+	/* Initialize each feature */
+	for (i =3D 0; i < ivdev->num_resources; i++) {
+		struct feature *feature =3D &priv->feature[priv->count];
+
+		ret =3D pmt_features_discovery(priv, feature, ivdev, i);
+		if (ret =3D=3D SKIP_FEATURE)
+			continue;
+		if (ret !=3D 0)
+			goto abort_probe;
+
+		feature->priv =3D priv;
+		priv->count++;
+	}
+
+	return 0;
+
+abort_probe:
+	/*
+	 * Only fully initialized features are tracked in priv->count, which is
+	 * incremented only after a feature is completely set up (i.e., after
+	 * discovery and sysfs registration). If feature initialization fails,
+	 * the failing feature's state is local and does not require rollback.
+	 *
+	 * Therefore, on error, we can safely call the driver's remove() routine
+	 * pmt_features_remove() to clean up only those features that were
+	 * fully initialized and counted. All other resources are device-managed
+	 * and will be cleaned up automatically during device_unregister().
+	 */
+	pmt_features_remove(auxdev);
+
+	return ret;
+}
+
+static const struct auxiliary_device_id pmt_features_id_table[] =3D {
+	{ .name =3D "intel_vsec.discovery" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, pmt_features_id_table);
+
+static struct auxiliary_driver pmt_features_aux_driver =3D {
+	.id_table	=3D pmt_features_id_table,
+	.remove		=3D pmt_features_remove,
+	.probe		=3D pmt_features_probe,
+};
+module_auxiliary_driver(pmt_features_aux_driver);
+
+MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
+MODULE_DESCRIPTION("Intel PMT Discovery driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("INTEL_PMT");
diff --git a/drivers/platform/x86/intel/pmt/features.c b/drivers/platform/x=
86/intel/pmt/features.c
new file mode 100644
index 000000000000..8a39cddc75c8
--- /dev/null
+++ b/drivers/platform/x86/intel/pmt/features.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * Author: "David E. Box" <david.e.box@linux.intel.com>
+ */
+
+#include <linux/export.h>
+#include <linux/types.h>
+
+#include <linux/intel_pmt_features.h>
+
+const char * const pmt_feature_names[] =3D {
+	[FEATURE_PER_CORE_PERF_TELEM]	=3D "per_core_performance_telemetry",
+	[FEATURE_PER_CORE_ENV_TELEM]	=3D "per_core_environment_telemetry",
+	[FEATURE_PER_RMID_PERF_TELEM]	=3D "per_rmid_perf_telemetry",
+	[FEATURE_ACCEL_TELEM]		=3D "accelerator_telemetry",
+	[FEATURE_UNCORE_TELEM]		=3D "uncore_telemetry",
+	[FEATURE_CRASH_LOG]		=3D "crash_log",
+	[FEATURE_PETE_LOG]		=3D "pete_log",
+	[FEATURE_TPMI_CTRL]		=3D "tpmi_control",
+	[FEATURE_TRACING]		=3D "tracing",
+	[FEATURE_PER_RMID_ENERGY_TELEM]	=3D "per_rmid_energy_telemetry",
+};
+EXPORT_SYMBOL_NS_GPL(pmt_feature_names, "INTEL_PMT_DISCOVERY");
+
+enum feature_layout feature_layout[] =3D {
+	[FEATURE_PER_CORE_PERF_TELEM]	=3D LAYOUT_WATCHER,
+	[FEATURE_PER_CORE_ENV_TELEM]	=3D LAYOUT_WATCHER,
+	[FEATURE_PER_RMID_PERF_TELEM]	=3D LAYOUT_RMID,
+	[FEATURE_ACCEL_TELEM]		=3D LAYOUT_WATCHER,
+	[FEATURE_UNCORE_TELEM]		=3D LAYOUT_WATCHER,
+	[FEATURE_CRASH_LOG]		=3D LAYOUT_COMMAND,
+	[FEATURE_PETE_LOG]		=3D LAYOUT_COMMAND,
+	[FEATURE_TPMI_CTRL]		=3D LAYOUT_CAPS_ONLY,
+	[FEATURE_TRACING]		=3D LAYOUT_CAPS_ONLY,
+	[FEATURE_PER_RMID_ENERGY_TELEM]	=3D LAYOUT_RMID,
+};
+
+struct pmt_cap pmt_cap_common[] =3D {
+	{PMT_CAP_TELEM,		"telemetry"},
+	{PMT_CAP_WATCHER,	"watcher"},
+	{PMT_CAP_CRASHLOG,	"crashlog"},
+	{PMT_CAP_STREAMING,	"streaming"},
+	{PMT_CAP_THRESHOLD,	"threshold"},
+	{PMT_CAP_WINDOW,	"window"},
+	{PMT_CAP_CONFIG,	"config"},
+	{PMT_CAP_TRACING,	"tracing"},
+	{PMT_CAP_INBAND,	"inband"},
+	{PMT_CAP_OOB,		"oob"},
+	{PMT_CAP_SECURED_CHAN,	"secure_chan"},
+	{PMT_CAP_PMT_SP,	"pmt_sp"},
+	{PMT_CAP_PMT_SP_POLICY,	"pmt_sp_policy"},
+	{}
+};
+
+struct pmt_cap pmt_cap_pcpt[] =3D {
+	{PMT_CAP_PCPT_CORE_PERF,	"core_performance"},
+	{PMT_CAP_PCPT_CORE_C0_RES,	"core_c0_residency"},
+	{PMT_CAP_PCPT_CORE_ACTIVITY,	"core_activity"},
+	{PMT_CAP_PCPT_CACHE_PERF,	"cache_performance"},
+	{PMT_CAP_PCPT_QUALITY_TELEM,	"quality_telemetry"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_pcpt[] =3D {
+	pmt_cap_common,
+	pmt_cap_pcpt,
+	NULL
+};
+
+struct pmt_cap pmt_cap_pcet[] =3D {
+	{PMT_CAP_PCET_WORKPOINT_HIST,	"workpoint_histogram"},
+	{PMT_CAP_PCET_CORE_CURR_TEMP,	"core_current_temp"},
+	{PMT_CAP_PCET_CORE_INST_RES,	"core_inst_residency"},
+	{PMT_CAP_PCET_QUALITY_TELEM,	"quality_telemetry"},
+	{PMT_CAP_PCET_CORE_CDYN_LVL,	"core_cdyn_level"},
+	{PMT_CAP_PCET_CORE_STRESS_LVL,	"core_stress_level"},
+	{PMT_CAP_PCET_CORE_DAS,		"core_digital_aging_sensor"},
+	{PMT_CAP_PCET_FIVR_HEALTH,	"fivr_health"},
+	{PMT_CAP_PCET_ENERGY,		"energy"},
+	{PMT_CAP_PCET_PEM_STATUS,	"pem_status"},
+	{PMT_CAP_PCET_CORE_C_STATE,	"core_c_state"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_pcet[] =3D {
+	pmt_cap_common,
+	pmt_cap_pcet,
+	NULL
+};
+
+struct pmt_cap pmt_cap_rmid_perf[] =3D {
+	{PMT_CAP_RMID_CORES_PERF,	"core_performance"},
+	{PMT_CAP_RMID_CACHE_PERF,	"cache_performance"},
+	{PMT_CAP_RMID_PERF_QUAL,	"performance_quality"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_rmid_perf[] =3D {
+	pmt_cap_common,
+	pmt_cap_rmid_perf,
+	NULL
+};
+
+struct pmt_cap pmt_cap_accel[] =3D {
+	{PMT_CAP_ACCEL_CPM_TELEM,	"content_processing_module"},
+	{PMT_CAP_ACCEL_TIP_TELEM,	"content_turbo_ip"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_accel[] =3D {
+	pmt_cap_common,
+	pmt_cap_accel,
+	NULL
+};
+
+struct pmt_cap pmt_cap_uncore[] =3D {
+	{PMT_CAP_UNCORE_IO_CA_TELEM,	"io_ca"},
+	{PMT_CAP_UNCORE_RMID_TELEM,	"rmid"},
+	{PMT_CAP_UNCORE_D2D_ULA_TELEM,	"d2d_ula"},
+	{PMT_CAP_UNCORE_PKGC_TELEM,	"package_c"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_uncore[] =3D {
+	pmt_cap_common,
+	pmt_cap_uncore,
+	NULL
+};
+
+struct pmt_cap pmt_cap_crashlog[] =3D {
+	{PMT_CAP_CRASHLOG_MAN_TRIG,	"manual_trigger"},
+	{PMT_CAP_CRASHLOG_CORE,		"core"},
+	{PMT_CAP_CRASHLOG_UNCORE,	"uncore"},
+	{PMT_CAP_CRASHLOG_TOR,		"tor"},
+	{PMT_CAP_CRASHLOG_S3M,		"s3m"},
+	{PMT_CAP_CRASHLOG_PERSISTENCY,	"persistency"},
+	{PMT_CAP_CRASHLOG_CLIP_GPIO,	"crashlog_in_progress"},
+	{PMT_CAP_CRASHLOG_PRE_RESET,	"pre_reset_extraction"},
+	{PMT_CAP_CRASHLOG_POST_RESET,	"post_reset_extraction"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_crashlog[] =3D {
+	pmt_cap_common,
+	pmt_cap_crashlog,
+	NULL
+};
+
+struct pmt_cap pmt_cap_pete[] =3D {
+	{PMT_CAP_PETE_MAN_TRIG,		"manual_trigger"},
+	{PMT_CAP_PETE_ENCRYPTION,	"encryption"},
+	{PMT_CAP_PETE_PERSISTENCY,	"persistency"},
+	{PMT_CAP_PETE_REQ_TOKENS,	"required_tokens"},
+	{PMT_CAP_PETE_PROD_ENABLED,	"production_enabled"},
+	{PMT_CAP_PETE_DEBUG_ENABLED,	"debug_enabled"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_pete[] =3D {
+	pmt_cap_common,
+	pmt_cap_pete,
+	NULL
+};
+
+struct pmt_cap pmt_cap_tpmi[] =3D {
+	{PMT_CAP_TPMI_MAILBOX,		"mailbox"},
+	{PMT_CAP_TPMI_LOCK,		"bios_lock"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_tpmi[] =3D {
+	pmt_cap_common,
+	pmt_cap_tpmi,
+	NULL
+};
+
+struct pmt_cap pmt_cap_tracing[] =3D {
+	{PMT_CAP_TRACE_SRAR,		"srar_errors"},
+	{PMT_CAP_TRACE_CORRECTABLE,	"correctable_errors"},
+	{PMT_CAP_TRACE_MCTP,		"mctp"},
+	{PMT_CAP_TRACE_MRT,		"memory_resiliency"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_tracing[] =3D {
+	pmt_cap_common,
+	pmt_cap_tracing,
+	NULL
+};
+
+struct pmt_cap pmt_cap_rmid_energy[] =3D {
+	{PMT_CAP_RMID_ENERGY,		"energy"},
+	{PMT_CAP_RMID_ACTIVITY,		"activity"},
+	{PMT_CAP_RMID_ENERGY_QUAL,	"energy_quality"},
+	{}
+};
+
+struct pmt_cap *pmt_caps_rmid_energy[] =3D {
+	pmt_cap_common,
+	pmt_cap_rmid_energy,
+	NULL
+};
diff --git a/include/linux/intel_pmt_features.h b/include/linux/intel_pmt_f=
eatures.h
new file mode 100644
index 000000000000..53573a4a49b7
--- /dev/null
+++ b/include/linux/intel_pmt_features.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _FEATURES_H
+#define _FEATURES_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+/* Common masks */
+#define PMT_CAP_TELEM			BIT(0)
+#define PMT_CAP_WATCHER			BIT(1)
+#define PMT_CAP_CRASHLOG		BIT(2)
+#define PMT_CAP_STREAMING		BIT(3)
+#define PMT_CAP_THRESHOLD		BIT(4)
+#define PMT_CAP_WINDOW			BIT(5)
+#define PMT_CAP_CONFIG			BIT(6)
+#define PMT_CAP_TRACING			BIT(7)
+#define PMT_CAP_INBAND			BIT(8)
+#define PMT_CAP_OOB			BIT(9)
+#define PMT_CAP_SECURED_CHAN		BIT(10)
+
+#define PMT_CAP_PMT_SP			BIT(11)
+#define PMT_CAP_PMT_SP_POLICY		GENMASK(17, 12)
+
+/* Per Core Performance Telemetry (PCPT) specific masks */
+#define PMT_CAP_PCPT_CORE_PERF		BIT(18)
+#define PMT_CAP_PCPT_CORE_C0_RES	BIT(19)
+#define PMT_CAP_PCPT_CORE_ACTIVITY	BIT(20)
+#define PMT_CAP_PCPT_CACHE_PERF		BIT(21)
+#define PMT_CAP_PCPT_QUALITY_TELEM	BIT(22)
+
+/* Per Core Environmental Telemetry (PCET) specific masks */
+#define PMT_CAP_PCET_WORKPOINT_HIST	BIT(18)
+#define PMT_CAP_PCET_CORE_CURR_TEMP	BIT(19)
+#define PMT_CAP_PCET_CORE_INST_RES	BIT(20)
+#define PMT_CAP_PCET_QUALITY_TELEM	BIT(21)	/* Same as PMT_CAP_PCPT */
+#define PMT_CAP_PCET_CORE_CDYN_LVL	BIT(22)
+#define PMT_CAP_PCET_CORE_STRESS_LVL	BIT(23)
+#define PMT_CAP_PCET_CORE_DAS		BIT(24)
+#define PMT_CAP_PCET_FIVR_HEALTH	BIT(25)
+#define PMT_CAP_PCET_ENERGY		BIT(26)
+#define PMT_CAP_PCET_PEM_STATUS		BIT(27)
+#define PMT_CAP_PCET_CORE_C_STATE	BIT(28)
+
+/* Per RMID Performance Telemetry specific masks */
+#define PMT_CAP_RMID_CORES_PERF		BIT(18)
+#define PMT_CAP_RMID_CACHE_PERF		BIT(19)
+#define PMT_CAP_RMID_PERF_QUAL		BIT(20)
+
+/* Accelerator Telemetry specific masks */
+#define PMT_CAP_ACCEL_CPM_TELEM		BIT(18)
+#define PMT_CAP_ACCEL_TIP_TELEM		BIT(19)
+
+/* Uncore Telemetry specific masks */
+#define PMT_CAP_UNCORE_IO_CA_TELEM	BIT(18)
+#define PMT_CAP_UNCORE_RMID_TELEM	BIT(19)
+#define PMT_CAP_UNCORE_D2D_ULA_TELEM	BIT(20)
+#define PMT_CAP_UNCORE_PKGC_TELEM	BIT(21)
+
+/* Crash Log specific masks */
+#define PMT_CAP_CRASHLOG_MAN_TRIG	BIT(11)
+#define PMT_CAP_CRASHLOG_CORE		BIT(12)
+#define PMT_CAP_CRASHLOG_UNCORE		BIT(13)
+#define PMT_CAP_CRASHLOG_TOR		BIT(14)
+#define PMT_CAP_CRASHLOG_S3M		BIT(15)
+#define PMT_CAP_CRASHLOG_PERSISTENCY	BIT(16)
+#define PMT_CAP_CRASHLOG_CLIP_GPIO	BIT(17)
+#define PMT_CAP_CRASHLOG_PRE_RESET	BIT(18)
+#define PMT_CAP_CRASHLOG_POST_RESET	BIT(19)
+
+/* PeTe Log specific masks */
+#define PMT_CAP_PETE_MAN_TRIG		BIT(11)
+#define PMT_CAP_PETE_ENCRYPTION		BIT(12)
+#define PMT_CAP_PETE_PERSISTENCY	BIT(13)
+#define PMT_CAP_PETE_REQ_TOKENS		BIT(14)
+#define PMT_CAP_PETE_PROD_ENABLED	BIT(15)
+#define PMT_CAP_PETE_DEBUG_ENABLED	BIT(16)
+
+/* TPMI control specific masks */
+#define PMT_CAP_TPMI_MAILBOX		BIT(11)
+#define PMT_CAP_TPMI_LOCK		BIT(12)
+
+/* Tracing specific masks */
+#define PMT_CAP_TRACE_SRAR		BIT(11)
+#define PMT_CAP_TRACE_CORRECTABLE	BIT(12)
+#define PMT_CAP_TRACE_MCTP		BIT(13)
+#define PMT_CAP_TRACE_MRT		BIT(14)
+
+/* Per RMID Energy Telemetry specific masks */
+#define PMT_CAP_RMID_ENERGY		BIT(18)
+#define PMT_CAP_RMID_ACTIVITY		BIT(19)
+#define PMT_CAP_RMID_ENERGY_QUAL	BIT(20)
+
+enum pmt_feature_id {
+	FEATURE_INVALID			=3D 0x0,
+	FEATURE_PER_CORE_PERF_TELEM	=3D 0x1,
+	FEATURE_PER_CORE_ENV_TELEM	=3D 0x2,
+	FEATURE_PER_RMID_PERF_TELEM	=3D 0x3,
+	FEATURE_ACCEL_TELEM		=3D 0x4,
+	FEATURE_UNCORE_TELEM		=3D 0x5,
+	FEATURE_CRASH_LOG		=3D 0x6,
+	FEATURE_PETE_LOG		=3D 0x7,
+	FEATURE_TPMI_CTRL		=3D 0x8,
+	FEATURE_RESERVED		=3D 0x9,
+	FEATURE_TRACING			=3D 0xA,
+	FEATURE_PER_RMID_ENERGY_TELEM	=3D 0xB,
+	FEATURE_MAX			=3D 0xB,
+};
+
+enum feature_layout {
+	LAYOUT_RMID,
+	LAYOUT_WATCHER,
+	LAYOUT_COMMAND,
+	LAYOUT_CAPS_ONLY,
+};
+
+struct pmt_cap {
+	u32		mask;
+	const char	*name;
+};
+
+extern const char * const pmt_feature_names[];
+extern enum feature_layout feature_layout[];
+extern struct pmt_cap pmt_cap_common[];
+extern struct pmt_cap pmt_cap_pcpt[];
+extern struct pmt_cap *pmt_caps_pcpt[];
+extern struct pmt_cap pmt_cap_pcet[];
+extern struct pmt_cap *pmt_caps_pcet[];
+extern struct pmt_cap pmt_cap_rmid_perf[];
+extern struct pmt_cap *pmt_caps_rmid_perf[];
+extern struct pmt_cap pmt_cap_accel[];
+extern struct pmt_cap *pmt_caps_accel[];
+extern struct pmt_cap pmt_cap_uncore[];
+extern struct pmt_cap *pmt_caps_uncore[];
+extern struct pmt_cap pmt_cap_crashlog[];
+extern struct pmt_cap *pmt_caps_crashlog[];
+extern struct pmt_cap pmt_cap_pete[];
+extern struct pmt_cap *pmt_caps_pete[];
+extern struct pmt_cap pmt_cap_tpmi[];
+extern struct pmt_cap *pmt_caps_tpmi[];
+extern struct pmt_cap pmt_cap_s3m[];
+extern struct pmt_cap *pmt_caps_s3m[];
+extern struct pmt_cap pmt_cap_tracing[];
+extern struct pmt_cap *pmt_caps_tracing[];
+extern struct pmt_cap pmt_cap_rmid_energy[];
+extern struct pmt_cap *pmt_caps_rmid_energy[];
+
+static inline bool pmt_feature_id_is_valid(enum pmt_feature_id id)
+{
+	if (id > FEATURE_MAX)
+		return false;
+
+	if (id =3D=3D FEATURE_INVALID || id =3D=3D FEATURE_RESERVED)
+		return false;
+
+	return true;
+}
+#endif
--=20
2.43.0

