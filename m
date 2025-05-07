Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B774C25DCF3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628491; cv=none; b=J84Yfs0Jdv2XeMtuoYK06ocRc1eTWDBn2VtN1wn2cZvATXi2sZ82G+xSIE0UVRecuWQ/w6ce3s0uSxAKywm7vfN7Gr4/TzzkW2SlEF2tuslPFcZgHZQsOToYKFAushw/RxpAKNdh6d8ZD4rsCcA8plYGVdejBhxZd866TYV47rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628491; c=relaxed/simple;
	bh=1vx2zeheeJDoHFOHKcduICilW7sEdCX7aHfLVEa9SvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XSaDrTjYphQYXVYTrIqhgDFb+SjzIozSYVKNT6nkVsbgFkBQmlanwRfo1xb8yO6oT9RShp2V+q4WEnO6ygA7MP2GHmGTK/J+HW/HAan2/lL2YihxVfZcrfxXWTYhyhqHsmUA40/fXISr4Obo26ncOUBUvKWz1iP9EuB/80JOos4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0LrLdSG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0LrLdSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746628490; x=1778164490;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1vx2zeheeJDoHFOHKcduICilW7sEdCX7aHfLVEa9SvU=;
  b=W0LrLdSGRrb8563oQ+Q8EJ0AwVtwEJbrA5GI4OHwyaqG63Cem2KxY8TS
   lMP/BYBpcl4DOBjyOlQoC8m7Bzi+e9Wdq062wMZFmv6STaT75yyHaGT38
   md/aexrnIWKhhyKV/g3aAH53al+ZOXxKhzPv0nhiu2fiFP/3n4AKWRP2M
   PI9Awyub0xTZlU4meuIWK6DhVCBaEcQOeX/A4tF8T7YMAY/bY51Qm2CEn
   1NxxblpgpDSbjDXvAh7tVMV3LRtgt7zV060ecbsF6C+ZzVbw3cUxeHvOX
   F+sE2UD5EhSOzIJEDcxoZtsYuP/UmLH9E7qBUzpsOcvaH59cFRWmtuIbm
   Q==;
X-CSE-ConnectionGUID: Yne/3xTHQl+trkp5oK59/Q==
X-CSE-MsgGUID: IX20omZNTWq77mhNprVQOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48378077"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48378077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:34:48 -0700
X-CSE-ConnectionGUID: EguQwi7PTqCWB/sS3Tupbg==
X-CSE-MsgGUID: 1fMu9fjbRsKBP3XdnFa0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135943610"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2025 07:34:47 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com,
	linux-kernel@vger.kernel.org
Cc: Kan Liang <kan.liang@linux.intel.com>
Subject: [RESEND PATCH V2 1/4] perf/x86/intel/uncore: Support MSR portal for discovery tables
Date: Wed,  7 May 2025 07:34:24 -0700
Message-Id: <20250507143427.1319818-2-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250507143427.1319818-1-kan.liang@linux.intel.com>
References: <20250507143427.1319818-1-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kan Liang <kan.liang@linux.intel.com>

Starting from the Panther Lake, the discovery table mechanism is also
supported in client platforms. The difference is that the portal of the
global discovery table is retrieved from an MSR.

The layout of discovery tables are the same as the server platforms.
Factor out __parse_discovery_table() to parse discover tables.

The uncore PMON is Die scope. Need to parse the discovery tables for
each die.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
---
 arch/x86/events/intel/uncore_discovery.c | 87 ++++++++++++++++++------
 arch/x86/events/intel/uncore_discovery.h |  3 +
 2 files changed, 70 insertions(+), 20 deletions(-)

diff --git a/arch/x86/events/intel/uncore_discovery.c b/arch/x86/events/intel/uncore_discovery.c
index 571e44b49691..8680f66c3e34 100644
--- a/arch/x86/events/intel/uncore_discovery.c
+++ b/arch/x86/events/intel/uncore_discovery.c
@@ -273,32 +273,15 @@ uncore_ignore_unit(struct uncore_unit_discovery *unit, int *ignore)
 	return false;
 }
 
-static int parse_discovery_table(struct pci_dev *dev, int die,
-				 u32 bar_offset, bool *parsed,
-				 int *ignore)
+static int __parse_discovery_table(resource_size_t addr, int die,
+				   bool *parsed, int *ignore)
 {
 	struct uncore_global_discovery global;
 	struct uncore_unit_discovery unit;
 	void __iomem *io_addr;
-	resource_size_t addr;
 	unsigned long size;
-	u32 val;
 	int i;
 
-	pci_read_config_dword(dev, bar_offset, &val);
-
-	if (val & ~PCI_BASE_ADDRESS_MEM_MASK & ~PCI_BASE_ADDRESS_MEM_TYPE_64)
-		return -EINVAL;
-
-	addr = (resource_size_t)(val & PCI_BASE_ADDRESS_MEM_MASK);
-#ifdef CONFIG_PHYS_ADDR_T_64BIT
-	if ((val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) == PCI_BASE_ADDRESS_MEM_TYPE_64) {
-		u32 val2;
-
-		pci_read_config_dword(dev, bar_offset + 4, &val2);
-		addr |= ((resource_size_t)val2) << 32;
-	}
-#endif
 	size = UNCORE_DISCOVERY_GLOBAL_MAP_SIZE;
 	io_addr = ioremap(addr, size);
 	if (!io_addr)
@@ -341,7 +324,32 @@ static int parse_discovery_table(struct pci_dev *dev, int die,
 	return 0;
 }
 
-bool intel_uncore_has_discovery_tables(int *ignore)
+static int parse_discovery_table(struct pci_dev *dev, int die,
+				 u32 bar_offset, bool *parsed,
+				 int *ignore)
+{
+	resource_size_t addr;
+	u32 val;
+
+	pci_read_config_dword(dev, bar_offset, &val);
+
+	if (val & ~PCI_BASE_ADDRESS_MEM_MASK & ~PCI_BASE_ADDRESS_MEM_TYPE_64)
+		return -EINVAL;
+
+	addr = (resource_size_t)(val & PCI_BASE_ADDRESS_MEM_MASK);
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	if ((val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) == PCI_BASE_ADDRESS_MEM_TYPE_64) {
+		u32 val2;
+
+		pci_read_config_dword(dev, bar_offset + 4, &val2);
+		addr |= ((resource_size_t)val2) << 32;
+	}
+#endif
+
+	return __parse_discovery_table(addr, die, parsed, ignore);
+}
+
+static bool intel_uncore_has_discovery_tables_pci(int *ignore)
 {
 	u32 device, val, entry_id, bar_offset;
 	int die, dvsec = 0, ret = true;
@@ -390,6 +398,45 @@ bool intel_uncore_has_discovery_tables(int *ignore)
 	return ret;
 }
 
+static bool intel_uncore_has_discovery_tables_msr(int *ignore)
+{
+	unsigned long *die_mask;
+	bool parsed = false;
+	int cpu, die;
+	u64 base;
+
+	die_mask = kcalloc(BITS_TO_LONGS(__uncore_max_dies),
+			   sizeof(unsigned long), GFP_KERNEL);
+	if (!die_mask)
+		return false;
+
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		die = topology_logical_die_id(cpu);
+		if (__test_and_set_bit(die, die_mask))
+			continue;
+
+		if (rdmsrl_safe_on_cpu(cpu, UNCORE_DISCOVERY_MSR, &base))
+			continue;
+
+		if (!base)
+			continue;
+
+		__parse_discovery_table(base, die, &parsed, ignore);
+	}
+
+	cpus_read_unlock();
+
+	kfree(die_mask);
+	return parsed;
+}
+
+bool intel_uncore_has_discovery_tables(int *ignore)
+{
+	return intel_uncore_has_discovery_tables_msr(ignore) ||
+	       intel_uncore_has_discovery_tables_pci(ignore);
+}
+
 void intel_uncore_clear_discovery_tables(void)
 {
 	struct intel_uncore_discovery_type *type, *next;
diff --git a/arch/x86/events/intel/uncore_discovery.h b/arch/x86/events/intel/uncore_discovery.h
index 0e94aa7db8e7..690f737e6837 100644
--- a/arch/x86/events/intel/uncore_discovery.h
+++ b/arch/x86/events/intel/uncore_discovery.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+/* Store the full address of the global discovery table */
+#define UNCORE_DISCOVERY_MSR			0x201e
+
 /* Generic device ID of a discovery table device */
 #define UNCORE_DISCOVERY_TABLE_DEVICE		0x09a7
 /* Capability ID for a discovery table device */
-- 
2.38.1

