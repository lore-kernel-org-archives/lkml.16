Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D672D3216;
	Wed, 30 Apr 2025 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048089; cv=none; b=CnSe6ntOYlsSLdZqZfTuBUwgcWBR18Y1XrgiYiWs1hQBpzgSGYjicNSIx7o/xTxRMLZ1hwh0Eha2wuFpM4pKfiS2HpoXzcj6/yTGtTZcCIVdG89fvsi8oG5lpkl3oqytLnGZSxcg8hypzie7cEjyP6hQ3WhLJ0oWSaA+FS8W94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048089; c=relaxed/simple;
	bh=A21ca/LGpPQK4PmvVGaNq/WgOLgChSkAM2Oz5LmXFDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aC5q0109avWcANHOuo3q59M/h4gl3U5Gu9oWadgU9ZmQnFADYMx14M66uLnBX3oqjZUhtrm/+i5/aFlFZbtNgUCq2EJfAzRJpro49VTQnUstn5AA2hpPBAWpXCY4SflXeH5lwsMKi0tSIYrAUwUiWW/S0VlWpuSpyfC80tee8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dy765GrK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dy765GrK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048088; x=1777584088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A21ca/LGpPQK4PmvVGaNq/WgOLgChSkAM2Oz5LmXFDU=;
  b=dy765GrKwBdwnJLt63qdmssU0G55fPzc/Cfie2Gz+Y+/LpQU72wVtLBX
   O7b3RVvPO2gAmPDLIq1csOyGhDmApSNefxkYPIoi+ZQ3n4qO7/YSwvfEc
   MdlkJUou5eXLxzlV+BhTXkmrDZtf1Lzwl0fW85qQ6QLTAwIQPaWwM4sgc
   CbkVqQFQmEc93ouPsOsRnXGMrT1mX6eMfHVjLc4AGRCQJrCPz3HufSZUZ
   88sL+6zsyBFsXA954ODUWFM/+kYVEKptc7XEYJlTBG298l3UbTJoYrx6O
   307/pQCnuXh+mQGAFB85R4ApehrdFdw/hn/X38hEMIS+XXzOKD+yJhvm6
   w==;
X-CSE-ConnectionGUID: roC0q6RaSk26p/128DA3xw==
X-CSE-MsgGUID: 7L3eejtURA+gTc5kydYPTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257560"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:18 -0700
X-CSE-ConnectionGUID: R/4ubYzRS0SXFINeU14TOw==
X-CSE-MsgGUID: ez6dfFu9TIq+cTK4lAbKOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972316"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:18 -0700
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
Subject: [PATCH 15/15] platform/x86/intel/pmt: KUNIT test for PMT Enhanced Discovery API
Date: Wed, 30 Apr 2025 14:21:04 -0700
Message-ID: <20250430212106.369208-16-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Adds a KUNIT test for the intel_pmt_get_regions_by_feature() API.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/pmt/Kconfig        |  14 +++
 drivers/platform/x86/intel/pmt/Makefile       |   2 +
 .../platform/x86/intel/pmt/discovery-kunit.c  | 116 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/platform/x86/intel/pmt/discovery-kunit.c

diff --git a/drivers/platform/x86/intel/pmt/Kconfig b/drivers/platform/x86/=
intel/pmt/Kconfig
index 83ae17eab462..83e20afc5655 100644
--- a/drivers/platform/x86/intel/pmt/Kconfig
+++ b/drivers/platform/x86/intel/pmt/Kconfig
@@ -51,3 +51,17 @@ config INTEL_PMT_DISCOVERY
=20
 	  To compile this driver as a module, choose M here: the module
 	  will be called pmt_discovery.
+
+config INTEL_PMT_KUNIT_TEST
+	tristate "KUnit tests for Intel PMT driver"
+	depends on INTEL_PMT_DISCOVERY
+	depends on KUNIT
+	help
+	  Enable this option to compile and run a suite of KUnit tests for the In=
tel
+	  Platform Monitoring Technology (PMT) driver. These tests are designed to
+	  validate the driver=E2=80=99s functionality, error handling, and overal=
l stability,
+	  helping developers catch regressions and ensure code quality during cha=
nges.
+
+	  This option is intended for development and testing environments. It is
+	  recommended to disable it in production builds. To compile this driver =
as a
+	  module, choose M here: the module will be called pmt-discovery-kunit.
diff --git a/drivers/platform/x86/intel/pmt/Makefile b/drivers/platform/x86=
/intel/pmt/Makefile
index 8aed7e1592e4..47f692c091c9 100644
--- a/drivers/platform/x86/intel/pmt/Makefile
+++ b/drivers/platform/x86/intel/pmt/Makefile
@@ -12,3 +12,5 @@ obj-$(CONFIG_INTEL_PMT_CRASHLOG)	+=3D pmt_crashlog.o
 pmt_crashlog-y				:=3D crashlog.o
 obj-$(CONFIG_INTEL_PMT_DISCOVERY)	+=3D pmt_discovery.o
 pmt_discovery-y				:=3D discovery.o features.o
+obj-$(CONFIG_INTEL_PMT_KUNIT_TEST)	+=3D pmt-discovery-kunit.o
+pmt-discovery-kunit-y			:=3D discovery-kunit.o
diff --git a/drivers/platform/x86/intel/pmt/discovery-kunit.c b/drivers/pla=
tform/x86/intel/pmt/discovery-kunit.c
new file mode 100644
index 000000000000..b4493fb96738
--- /dev/null
+++ b/drivers/platform/x86/intel/pmt/discovery-kunit.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Platform Monitory Technology Discovery KUNIT tests
+ *
+ * Copyright (c) 2025, Intel Corporation.
+ * All Rights Reserved.
+ */
+
+#include <kunit/test.h>
+#include <linux/err.h>
+#include <linux/intel_pmt_features.h>
+#include <linux/intel_vsec.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#define PMT_FEATURE_COUNT (FEATURE_MAX + 1)
+
+static void
+validate_pmt_regions(struct kunit *test, struct pmt_feature_group *feature=
_group, int feature_id)
+{
+	int i;
+
+	kunit_info(test, "Feature ID %d [%s] has %d regions.\n", feature_id,
+		   pmt_feature_names[feature_id], feature_group->count);
+
+	for (i =3D 0; i < feature_group->count; i++) {
+		struct telemetry_region *region =3D &feature_group->regions[i];
+
+		kunit_info(test, "  - Region %d: cdie_mask=3D%u, package_id=3D%u, partit=
ion=3D%u, segment=3D%u,",
+			   i, region->plat_info.cdie_mask, region->plat_info.package_id,
+			   region->plat_info.partition, region->plat_info.segment);
+		kunit_info(test, "\t\tbus=3D%u, device=3D%u, function=3D%u, guid=3D0x%x,=
",
+			   region->plat_info.bus_number, region->plat_info.device_number,
+			   region->plat_info.function_number, region->guid);
+		kunit_info(test, "\t\taddr=3D%p, size=3D%lu, num_rmids=3D%u", region->ad=
dr, region->size,
+			   region->num_rmids);
+
+
+		KUNIT_ASSERT_GE(test, region->plat_info.cdie_mask, 0);
+		KUNIT_ASSERT_GE(test, region->plat_info.package_id, 0);
+		KUNIT_ASSERT_GE(test, region->plat_info.partition, 0);
+		KUNIT_ASSERT_GE(test, region->plat_info.segment, 0);
+		KUNIT_ASSERT_GE(test, region->plat_info.bus_number, 0);
+		KUNIT_ASSERT_GE(test, region->plat_info.device_number, 0);
+		KUNIT_ASSERT_GE(test, region->plat_info.function_number, 0);
+
+		KUNIT_ASSERT_NE(test, region->guid, 0);
+
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (__force const void *)region->addr);
+	}
+}
+
+static void linebreak(struct kunit *test)
+{
+	kunit_info(test, "*******************************************************=
**********************\n");
+}
+
+static void test_intel_pmt_get_regions_by_feature(struct kunit *test)
+{
+	struct pmt_feature_group *feature_group;
+	int num_available =3D 0;
+	int feature_id;
+
+	/* Iterate through all possible feature IDs */
+	for (feature_id =3D 1; feature_id < PMT_FEATURE_COUNT; feature_id++, line=
break(test)) {
+		const char *name;
+
+		if (!pmt_feature_id_is_valid(feature_id))
+			continue;
+
+		name =3D pmt_feature_names[feature_id];
+
+		feature_group =3D intel_pmt_get_regions_by_feature(feature_id);
+		if (IS_ERR(feature_group)) {
+			if (PTR_ERR(feature_group) =3D=3D -ENOENT)
+				kunit_warn(test, "intel_pmt_get_regions_by_feature() reporting feature=
 %d [%s] is not present.\n",
+					   feature_id, name);
+			else
+				kunit_warn(test, "intel_pmt_get_regions_by_feature() returned error %l=
d while attempt to lookup %d [%s].\n",
+					   PTR_ERR(feature_group), feature_id, name);
+
+			continue;
+		}
+
+		if (!feature_group) {
+			kunit_warn(test, "Feature ID %d: %s is not available.\n", feature_id, n=
ame);
+			continue;
+		}
+
+		num_available++;
+
+		validate_pmt_regions(test, feature_group, feature_id);
+
+		intel_pmt_put_feature_group(feature_group);
+	}
+
+	if (num_available =3D=3D 0)
+		kunit_warn(test, "No PMT region groups were available for any feature ID=
 (0-10).\n");
+}
+
+static struct kunit_case intel_pmt_discovery_test_cases[] =3D {
+	KUNIT_CASE(test_intel_pmt_get_regions_by_feature),
+	{}
+};
+
+static struct kunit_suite intel_pmt_discovery_test_suite =3D {
+	.name =3D "pmt_discovery_test",
+	.test_cases =3D intel_pmt_discovery_test_cases,
+};
+
+kunit_test_suite(intel_pmt_discovery_test_suite);
+
+MODULE_IMPORT_NS("INTEL_PMT_DISCOVERY");
+MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
+MODULE_DESCRIPTION("Intel PMT Discovery KUNIT test driver");
+MODULE_LICENSE("GPL");
--=20
2.43.0

