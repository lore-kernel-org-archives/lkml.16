Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C528BA9E;
	Mon, 28 Apr 2025 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859815; cv=none; b=e2aDECqKLRTnzzIOYvAWXstZuXfC+NAh51rrq3uSWQkTi/1e051zjH2fL6drsbgM9JOFlChbEjNAPv3sneopgXw6hLEgMofOmLGYz+tqrIqnGjC+PVAnR7whaXpvnpiDybtxAUgv5Azf+O5D3Nn94Qg+jYqp7Wn4pN1gYfDKJfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859815; c=relaxed/simple;
	bh=ysrTTBSb4UrLW23Gzaw3kyKF78ts4VI3k+m1d48iRMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNRMHXd3496Jem9i9RRI0FwRUj6/v5xprmwKuLPCKRC4P6NL+Bw/NjG1/ptYHP+vfbZh9hsojI2fk5GKZqJ66cGSCnVWPvmRVQbdY7qY+kauV2ep/l6qaM2NriVObwh+i4RE8h7sdLI94KrebxXfeZlFWgq300Uak2DNHYa9uFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gr4x2vt8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gr4x2vt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745859813; x=1777395813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ysrTTBSb4UrLW23Gzaw3kyKF78ts4VI3k+m1d48iRMk=;
  b=gr4x2vt8HWjGiqy2wPbZng2koIE+1FB+FtGR93ckZ83r0lYgGW1clCYu
   /j0JQ+Yl3nb0Xvx1n3Yg9iHQj55Vb4AXofrrQKRbK85NayA4L0OM/YK1/
   xquY5sXxh/SyS8NjH3itmDXy85jNBjVEUwx4IFZrcxiI+jSUTwgo5OrgB
   Q2d9GcW+VjT8IACGKOv93Q9uUsjc4nbYC+O37WMvCNhdaSPgL64TgH5lF
   LRNC2pXr0YDir4EcGcru3iEa0SeublKzkJd+q07cvtzA1BW8I0iqIqvk4
   hym6JKZk25i6bstW21zDZmybBChNl3M0A+WSiuCdU9D9RZtJGDsmOSohT
   w==;
X-CSE-ConnectionGUID: jsic2+K4QRepHEUpMygMYA==
X-CSE-MsgGUID: 7/tuNI67Sx2uQpg6MjkPOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58111438"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="58111438"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 10:03:26 -0700
X-CSE-ConnectionGUID: 9m8tGFSZRxWE5omyqHqLow==
X-CSE-MsgGUID: 9nzGczLoSD2SDWidW/H7Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133309596"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2025 10:03:25 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 1/5] platform/x86/intel-uncore-freq: Add attributes to show agent types
Date: Mon, 28 Apr 2025 10:03:12 -0700
Message-ID: <20250428170316.231353-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
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
v2:
No change

 .../uncore-frequency-common.c                 | 24 ++++++++++++++++
 .../uncore-frequency-common.h                 | 17 ++++++++++-
 .../uncore-frequency/uncore-frequency-tpmi.c  | 28 +++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 4e2c6a2d7e6e..cfa3039a0e39 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -43,6 +43,28 @@ static ssize_t show_package_id(struct kobject *kobj, struct kobj_attribute *attr
 	return sprintf(buf, "%u\n", data->package_id);
 }
 
+static ssize_t show_agent_types(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct uncore_data *data = container_of(attr, struct uncore_data, agent_types_kobj_attr);
+	int length = 0;
+
+	if (data->agent_type_mask & AGENT_TYPE_CORE)
+		length += sysfs_emit_at(buf, length, "core ");
+
+	if (data->agent_type_mask & AGENT_TYPE_CACHE)
+		length += sysfs_emit_at(buf, length, "cache ");
+
+	if (data->agent_type_mask & AGENT_TYPE_MEMORY)
+		length += sysfs_emit_at(buf, length, "memory ");
+
+	if (data->agent_type_mask & AGENT_TYPE_IO)
+		length += sysfs_emit_at(buf, length, "io ");
+
+	length += sysfs_emit_at(buf, length, "\n");
+
+	return length;
+}
+
 static ssize_t show_attr(struct uncore_data *data, char *buf, enum uncore_index index)
 {
 	unsigned int value;
@@ -179,6 +201,8 @@ static int create_attr_group(struct uncore_data *data, char *name)
 		data->uncore_attrs[index++] = &data->fabric_cluster_id_kobj_attr.attr;
 		init_attribute_root_ro(package_id);
 		data->uncore_attrs[index++] = &data->package_id_kobj_attr.attr;
+		init_attribute_ro(agent_types);
+		data->uncore_attrs[index++] = &data->agent_types_kobj_attr.attr;
 	}
 
 	data->uncore_attrs[index++] = &data->max_freq_khz_kobj_attr.attr;
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
index 26c854cd5d97..197ca2ad327f 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -11,6 +11,17 @@
 
 #include <linux/device.h>
 
+/*
+ * Define uncore agents, which are under uncore frequency control.
+ * It is possible that there are common uncore frequency control to more than
+ * one agents. So these defines are used as a bit mask.
+ */
+#define	AGENT_TYPE_NONE		0
+#define AGENT_TYPE_CORE		0x01
+#define	AGENT_TYPE_CACHE	0x02
+#define	AGENT_TYPE_MEMORY	0x04
+#define	AGENT_TYPE_IO		0x08
+
 /**
  * struct uncore_data - Encapsulate all uncore data
  * @stored_uncore_data: Last user changed MSR 620 value, which will be restored
@@ -25,6 +36,7 @@
  * @cluster_id:		cluster id in a domain
  * @instance_id:	Unique instance id to append to directory name
  * @name:		Sysfs entry name for this instance
+ * @agent_type_mask:	Bit mask of all hardware agents for this domain
  * @uncore_attr_group:	Attribute group storage
  * @max_freq_khz_kobj_attr: Storage for kobject attribute max_freq_khz
  * @mix_freq_khz_kobj_attr: Storage for kobject attribute min_freq_khz
@@ -41,6 +53,7 @@
  * @elc_high_threshold_enable_kobj_attr:
 		Storage for kobject attribute elc_high_threshold_enable
  * @elc_floor_freq_khz_kobj_attr: Storage for kobject attribute elc_floor_freq_khz
+ * @agent_types_kobj_attr: Storage for kobject attribute agent_type
  * @uncore_attrs:	Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
@@ -58,6 +71,7 @@ struct uncore_data {
 	int cluster_id;
 	int instance_id;
 	char name[32];
+	u16  agent_type_mask;
 
 	struct attribute_group uncore_attr_group;
 	struct kobj_attribute max_freq_khz_kobj_attr;
@@ -72,7 +86,8 @@ struct uncore_data {
 	struct kobj_attribute elc_high_threshold_percent_kobj_attr;
 	struct kobj_attribute elc_high_threshold_enable_kobj_attr;
 	struct kobj_attribute elc_floor_freq_khz_kobj_attr;
-	struct attribute *uncore_attrs[13];
+	struct kobj_attribute agent_types_kobj_attr;
+	struct attribute *uncore_attrs[14];
 };
 
 #define UNCORE_DOMAIN_ID_INVALID	-1
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 4aa6c227ec82..70415d80773c 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -74,6 +74,12 @@ struct tpmi_uncore_struct {
 /* Bit definitions for STATUS register */
 #define UNCORE_CURRENT_RATIO_MASK			GENMASK_ULL(6, 0)
 
+/* Uncore agent type bits */
+#define UNCORE_CORE_PRESENT				BIT(23)
+#define UNCORE_CACHE_PRESENT				BIT(24)
+#define UNCORE_MEMORY_PRESENT				BIT(25)
+#define UNCORE_IO_PRESENT				BIT(26)
+
 /* Bit definitions for CONTROL register */
 #define UNCORE_MAX_RATIO_MASK				GENMASK_ULL(14, 8)
 #define UNCORE_MIN_RATIO_MASK				GENMASK_ULL(21, 15)
@@ -347,6 +353,26 @@ static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
 	return 0;
 }
 
+/* Helper function to read agent type over MMIO and set the agent type */
+static void uncore_set_agent_type(struct tpmi_uncore_cluster_info *cluster_info)
+{
+	u64 status;
+
+	status = readq((u8 __iomem *)cluster_info->cluster_base + UNCORE_STATUS_INDEX);
+
+	if (status & UNCORE_CORE_PRESENT)
+		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_CORE;
+
+	if (status & UNCORE_CACHE_PRESENT)
+		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_CACHE;
+
+	if (status & UNCORE_MEMORY_PRESENT)
+		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_MEMORY;
+
+	if (status & UNCORE_IO_PRESENT)
+		cluster_info->uncore_data.agent_type_mask |= AGENT_TYPE_IO;
+}
+
 /* Callback for sysfs read for TPMI uncore values. Called under mutex locks. */
 static int uncore_read(struct uncore_data *data, unsigned int *value, enum uncore_index index)
 {
@@ -552,6 +578,8 @@ static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_
 
 			cluster_info->cluster_base = pd_info->uncore_base + mask;
 
+			uncore_set_agent_type(cluster_info);
+
 			cluster_info->uncore_data.package_id = pkg;
 			/* There are no dies like Cascade Lake */
 			cluster_info->uncore_data.die_id = 0;
-- 
2.48.1

