Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7B2147F0;
	Thu,  8 May 2025 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745377; cv=none; b=p9P3C2Co/ed4l45RYFrS0lF95GJuPWFQztn8e2BVh6ogS/RPbzPAa4YbMv4PWnGzoPf/HbCUBJShKCA0AGfif2iV0b7MdEz2KUYrU47uT0lS8cvAGQdTkanD+KKYXHGysqm62w2EFspOLfQH6u7PQAdvzTMD2clgZXnfgGgf7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745377; c=relaxed/simple;
	bh=r8/gkEzLXUP0XuLcEadO1d7CVOGjpc8o5KtS/2MiVq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOd+Veu/StcJAxSmPGXEoqVb3H4jZwDaNW4OeuhtDbK1zHtYhuPtQGVtCs18fq1Bu2KBCb80LI9w3JQhlU384Kot1pvK4NYVt2UyKvRKNYBJOyD5df7UywHoUcgyydk6rdxpvQvNhWss3V6PjGc9pXGOQnB7gRMBQPUsVa/H1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo6hqFQt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo6hqFQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745376; x=1778281376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r8/gkEzLXUP0XuLcEadO1d7CVOGjpc8o5KtS/2MiVq8=;
  b=fo6hqFQtNCs7XR7J4k43ycOHxvFJ8i35v7SvVVq9Jtir+QyOMxMYX1JK
   GeXQm1RIxi2WNIrNLmcs8IgMou03FHQx+xrZI62oV0id+IImyVJmT87bL
   /MjTL6Ppg9EPFCSoqkMIcSsAHPSOBLOcAzy8MzWjCleBBU811AMcGn8qV
   +VRjJCT/iGX2o9Ov22xxde3/vSApnlLaFUq1b4jlTyVBnrezMvFOJpHgM
   4PUY/t9dSj9AsfRooUyVP1gPItYa4fwPOqaGCgYrzrmvM6UgrRDS7Plnr
   Hbm5914of83OG3c6hcH1RAeC8A8QMxdDCcNYHiUt3ubDDmtUxjC+IanZz
   g==;
X-CSE-ConnectionGUID: Up+kxS+ATCis4c2ffDYcgg==
X-CSE-MsgGUID: CT/HWc4MRYqNIA6thWBeNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59552594"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59552594"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:02:54 -0700
X-CSE-ConnectionGUID: bjfLRH//T7OuupFQ4/1ChA==
X-CSE-MsgGUID: pYOS2QgZT2OpyK2lSCGJJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136931252"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 16:02:53 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 1/5] platform/x86/intel-uncore-freq: Add attributes to show agent types
Date: Thu,  8 May 2025 16:02:38 -0700
Message-ID: <20250508230250.1186619-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
References: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, users need detailed hardware information to understand the
scope of controls within each uncore domain. Uncore frequency controls
manage subsystems such as core, cache, memory, and I/O. The UFS TPMI
provides this information, which can be used to present the scope more
clearly.

Each uncore domain consists of one or more agent types, with each agent
type controlling one or more uncore hardware subsystems. For example, a
single agent might control both the core and cache.

Introduce a new attribute called "agent_types." This attribute displays
a list of agents, separated by space character.

The string representations for agent types are as follows:
	For core agent: core
	For cache agent: cache
	For memory agent: memory
	For I/O agent: io

These agent types are read during probe time for each cluster and stored
as part of the struct uncore_data.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v3:
Replace if() checks with loop to convert to string and removed trailing " "
in the sysfs display.

v2:
No change

 .../uncore-frequency-common.c                 | 27 +++++++++++++++++++
 .../uncore-frequency-common.h                 | 18 ++++++++++++-
 .../uncore-frequency/uncore-frequency-tpmi.c  | 21 +++++++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 4e2c6a2d7e6e..9bc84962e2d5 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -43,6 +43,29 @@ static ssize_t show_package_id(struct kobject *kobj, struct kobj_attribute *attr
 	return sprintf(buf, "%u\n", data->package_id);
 }
 
+#define MAX_UNCORE_AGENT_TYPES	4
+
+/* The order follows AGENT_TYPE_* defines */
+static const char *agent_name[MAX_UNCORE_AGENT_TYPES] = {"core", "cache", "memory", "io"};
+
+static ssize_t show_agent_types(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct uncore_data *data = container_of(attr, struct uncore_data, agent_types_kobj_attr);
+	unsigned long agent_mask = data->agent_type_mask;
+	int agent, length = 0;
+
+	for_each_set_bit(agent, &agent_mask, MAX_UNCORE_AGENT_TYPES) {
+		if (length)
+			length += sysfs_emit_at(buf, length, " ");
+
+		length += sysfs_emit_at(buf, length, agent_name[agent]);
+	}
+
+	length += sysfs_emit_at(buf, length, "\n");
+
+	return length;
+}
+
 static ssize_t show_attr(struct uncore_data *data, char *buf, enum uncore_index index)
 {
 	unsigned int value;
@@ -179,6 +202,10 @@ static int create_attr_group(struct uncore_data *data, char *name)
 		data->uncore_attrs[index++] = &data->fabric_cluster_id_kobj_attr.attr;
 		init_attribute_root_ro(package_id);
 		data->uncore_attrs[index++] = &data->package_id_kobj_attr.attr;
+		if (data->agent_type_mask) {
+			init_attribute_ro(agent_types);
+			data->uncore_attrs[index++] = &data->agent_types_kobj_attr.attr;
+		}
 	}
 
 	data->uncore_attrs[index++] = &data->max_freq_khz_kobj_attr.attr;
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
index 26c854cd5d97..a638d2e1e83a 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -11,6 +11,18 @@
 
 #include <linux/device.h>
 
+/*
+ * Define uncore agents, which are under uncore frequency control.
+ * Defined in the same order as specified in the TPMI UFS Specifications.
+ * It is possible that there are common uncore frequency control to more than
+ * one hardware agents. So, these defines are used as a bit mask.
+*/
+
+#define AGENT_TYPE_CORE		0x01
+#define	AGENT_TYPE_CACHE	0x02
+#define	AGENT_TYPE_MEMORY	0x04
+#define	AGENT_TYPE_IO		0x08
+
 /**
  * struct uncore_data - Encapsulate all uncore data
  * @stored_uncore_data: Last user changed MSR 620 value, which will be restored
@@ -25,6 +37,7 @@
  * @cluster_id:		cluster id in a domain
  * @instance_id:	Unique instance id to append to directory name
  * @name:		Sysfs entry name for this instance
+ * @agent_type_mask:	Bit mask of all hardware agents for this domain
  * @uncore_attr_group:	Attribute group storage
  * @max_freq_khz_kobj_attr: Storage for kobject attribute max_freq_khz
  * @mix_freq_khz_kobj_attr: Storage for kobject attribute min_freq_khz
@@ -41,6 +54,7 @@
  * @elc_high_threshold_enable_kobj_attr:
 		Storage for kobject attribute elc_high_threshold_enable
  * @elc_floor_freq_khz_kobj_attr: Storage for kobject attribute elc_floor_freq_khz
+ * @agent_types_kobj_attr: Storage for kobject attribute agent_type
  * @uncore_attrs:	Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
@@ -58,6 +72,7 @@ struct uncore_data {
 	int cluster_id;
 	int instance_id;
 	char name[32];
+	u16  agent_type_mask;
 
 	struct attribute_group uncore_attr_group;
 	struct kobj_attribute max_freq_khz_kobj_attr;
@@ -72,7 +87,8 @@ struct uncore_data {
 	struct kobj_attribute elc_high_threshold_percent_kobj_attr;
 	struct kobj_attribute elc_high_threshold_enable_kobj_attr;
 	struct kobj_attribute elc_floor_freq_khz_kobj_attr;
-	struct attribute *uncore_attrs[13];
+	struct kobj_attribute agent_types_kobj_attr;
+	struct attribute *uncore_attrs[14];
 };
 
 #define UNCORE_DOMAIN_ID_INVALID	-1
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 4aa6c227ec82..8ebf6856fa7d 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -347,6 +347,25 @@ static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
 	return 0;
 }
 
+/*
+ * Agent types as per the TPMI UFS Specification for UFS_STATUS
+ * Agent Type - Core	Bit: 23
+ * Agent Type - Cache	Bit: 24
+ * Agent Type - Memory	Bit: 25
+ * Agent Type - IO	Bit: 26
+ */
+
+#define UNCORE_AGENT_TYPES	GENMASK_ULL(26, 23)
+
+/* Helper function to read agent type over MMIO and set the agent type mask */
+static void uncore_set_agent_type(struct tpmi_uncore_cluster_info *cluster_info)
+{
+	u64 status;
+
+	status = readq((u8 __iomem *)cluster_info->cluster_base + UNCORE_STATUS_INDEX);
+	cluster_info->uncore_data.agent_type_mask = FIELD_GET(UNCORE_AGENT_TYPES, status);
+}
+
 /* Callback for sysfs read for TPMI uncore values. Called under mutex locks. */
 static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncore_index index)
 {
@@ -552,6 +571,8 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 
 			cluster_info->cluster_base = pd_info->uncore_base + mask;
 
+			uncore_set_agent_type(cluster_info);
+
 			cluster_info->uncore_data.package_id = pkg;
 			/* There are no dies like Cascade Lake */
 			cluster_info->uncore_data.die_id = 0;
-- 
2.49.0

