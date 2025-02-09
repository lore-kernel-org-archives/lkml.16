Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0413213E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 22:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138714; cv=none; b=l+bqvnZJNvXUzlESpOw6xSPkqIGgFURdJqKQUh7HkyaaT0vMF1CfByCVGye7w7mB0wxhArPeO3YUMf5T8cAI7BqY5I3M9OqQCNJgwlKcXlpu9aDu2uq5SbAisi9KyvGy/qbDOLsACNTsyrq2EWDOrdrIjEDBTy8YMkZIQLqDO3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138714; c=relaxed/simple;
	bh=RUhEa3Q2GEDJMqC2kd5kkN1YkKGRWYlDQW1Os4Tat+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POfZ8ja2LDmUrwyHMEwdeyu0n56ufvcKuEAmYL0Ow3lIRvR6TKH2S4NR5vKLoQE0EhRFwklCek0gwBjqBR//tX0ddi/NK8u1XBlxqIF5l5wz7cwylnuDUfVidkC5kErHy51WGG4Bv29FS5xlwthClf6ZO1ZLFRRrxpL4CfSmupQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DCGsPujF; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DCGsPujF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739138707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+43qqLyyGsm6JXFPFr567gVG3Q32Z3aoVErLYEfhwOw=;
	b=DCGsPujF+Nxju+C7R6yOP8bic+MtAynFt3bIRJ5mojlqZCvop0bO5oKmvIw+qrpKFzO6xp
	TCCzO8cB/TzMhiqD3bYe/fcZXz93n7qwC1XzE7duX9b6ppwq5xXP7o8ARw9eSBDN4SOjLp
	6cK3nv6sAh6I7mJTBYZGgMepPL4tLog=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Robert Richter <rrichter@amd.com>,
	Bruno Faccini <bfaccini@nvidia.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ACPI: NUMA: Use str_enabled_disabled() helper function
Date: Sun,  9 Feb 2025 23:04:32 +0100
Message-ID: <20250209220435.76178-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/acpi/numa/srat.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 00ac0d7bb8c9..ac7045f3b85b 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -18,6 +18,7 @@
 #include <linux/nodemask.h>
 #include <linux/topology.h>
 #include <linux/numa_memblks.h>
+#include <linux/string_choices.h>
 
 static nodemask_t nodes_found_map = NODE_MASK_NONE;
 
@@ -187,8 +188,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 			pr_debug("SRAT Processor (id[0x%02x] eid[0x%02x]) in proximity domain %d %s\n",
 				 p->apic_id, p->local_sapic_eid,
 				 p->proximity_domain_lo,
-				 (p->flags & ACPI_SRAT_CPU_ENABLED) ?
-				 "enabled" : "disabled");
+				 str_enabled_disabled(p->flags & ACPI_SRAT_CPU_ENABLED));
 		}
 		break;
 
@@ -200,8 +200,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 				 (unsigned long long)p->base_address,
 				 (unsigned long long)p->length,
 				 p->proximity_domain,
-				 (p->flags & ACPI_SRAT_MEM_ENABLED) ?
-				 "enabled" : "disabled",
+				 str_enabled_disabled(p->flags & ACPI_SRAT_MEM_ENABLED),
 				 (p->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) ?
 				 " hot-pluggable" : "",
 				 (p->flags & ACPI_SRAT_MEM_NON_VOLATILE) ?
@@ -216,8 +215,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 			pr_debug("SRAT Processor (x2apicid[0x%08x]) in proximity domain %d %s\n",
 				 p->apic_id,
 				 p->proximity_domain,
-				 (p->flags & ACPI_SRAT_CPU_ENABLED) ?
-				 "enabled" : "disabled");
+				 str_enabled_disabled(p->flags & ACPI_SRAT_CPU_ENABLED));
 		}
 		break;
 
@@ -228,8 +226,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 			pr_debug("SRAT Processor (acpi id[0x%04x]) in proximity domain %d %s\n",
 				 p->acpi_processor_uid,
 				 p->proximity_domain,
-				 (p->flags & ACPI_SRAT_GICC_ENABLED) ?
-				 "enabled" : "disabled");
+				 str_enabled_disabled(p->flags & ACPI_SRAT_GICC_ENABLED));
 		}
 		break;
 
@@ -247,8 +244,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 				 *(u16 *)(&p->device_handle[0]),
 				 *(u16 *)(&p->device_handle[2]),
 				 p->proximity_domain,
-				 (p->flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED) ?
-				"enabled" : "disabled");
+				 str_enabled_disabled(p->flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED));
 		} else {
 			/*
 			 * In this case we can rely on the device having a
@@ -258,8 +254,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 				(char *)(&p->device_handle[0]),
 				(char *)(&p->device_handle[8]),
 				p->proximity_domain,
-				(p->flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED) ?
-				"enabled" : "disabled");
+				str_enabled_disabled(p->flags & ACPI_SRAT_GENERIC_AFFINITY_ENABLED));
 		}
 	}
 	break;
@@ -271,8 +266,7 @@ acpi_table_print_srat_entry(struct acpi_subtable_header *header)
 			pr_debug("SRAT Processor (acpi id[0x%04x]) in proximity domain %d %s\n",
 				 p->acpi_processor_uid,
 				 p->proximity_domain,
-				 (p->flags & ACPI_SRAT_RINTC_ENABLED) ?
-				 "enabled" : "disabled");
+				 str_enabled_disabled(p->flags & ACPI_SRAT_RINTC_ENABLED));
 		}
 		break;
 
-- 
2.48.1

