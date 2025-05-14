Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F682215067;
	Wed, 14 May 2025 21:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747259803; cv=fail; b=c/SDAhnrs3VKrN0xh2FJM2Y620YgjEkub9OeKfc1P2068sAob3eEA68NuAKTjUTcbUushd8LbhAG5rK4NDBvl7cQyldwY7LdF92zgMhF/gOje5ye9MvlDCEwinclYgVy6xs/wZCLIILwYgLaUhQcwDpYi2BbfVijZ9QOpo2BPdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747259803; c=relaxed/simple;
	bh=qXqcXqLqDXyTUwbFbbZeAjXarOTxRkgFikJdjW7ijGE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qEq8E05ujQ0mSYD4MZUulwNCrvS6KKDVRZFLkT9wRJt+YTuzYOZDUDeMyEyHxj135J1lbJoYdYXKlNOfd2nc6F064I2kE+N0uf9ynep7bd+NtzybvZ0m63dL56kZ21aNJwH1ftL8IAvf/Ah9PFsmS0GTqt5XjDVKt13Yvt9MIhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lzO9PAw4; arc=fail smtp.client-ip=40.107.95.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lzO9PAw4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvSK/DiJBw5q1i1wfY3uzUd43F19SusI4j7vn4ry6CBSgeWOkCOcReo2jDjQY9kSSrKCOE962kmK/ntk0QPbzqeDXX4eUhbRVRQ9RSYMI2lpYYgBHI20nE2SJ/m//CIK55TUnawz9UcEPF/aCKObApgWdjtcB2acHNbuvZYjuUO6xJ4FxmoRnbm44xc0qOiY4EXwV2zfdc6r/zlVbIOWf4QGD6NIT97/gT6mHcPJf+LMt0WGZBuolYRFqphEgWKDYgGGQwhnnQ8E8TyD8YnXucdHn62OXLKrT70BzeysT9nNYLzPKOE6yzeSn2G47GJGDr3ECPDIiHQx7ejKnZU9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFxYty6KSoNY7MW++uYxhpv39mw7M7WrNzI1lrQDVUM=;
 b=M6FpJXTEfvVXpkni+ZeeX6WENV8VxekJ4x4X1XoZK0krCKag1iSrzFe/Yel4zXl2h9vZo3jzuzbx1Ptd8jfpHDPrjDCYGSuF98dxTM0IIOfcTCQ3nRA5arbAHRsKOscKoyGyngZdnYiOxMwaNBKbYcozH6Tq1cGWVnXb9nfkJgQ3yAY8JHKPzzU6v+IoSHckJDQc6PyRM3QOzov/buO80Qk5jM2ZiguCJkjnftOYtJ0Me27ay8aeQM/G0uzRtcd7O2Lur7e+1VEJly7wYwXLY2+DbdZ02uLIGX9otDumHGi+FFZV56K6l6PGIAk/DVvjKvE6Qe+npksLvplDlbepHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFxYty6KSoNY7MW++uYxhpv39mw7M7WrNzI1lrQDVUM=;
 b=lzO9PAw4b8JpRFf20Ldvie26xNDj16GSiu7MRRXeEnNVYL6ZeVVipCTt87SHHmHrrnWMRFnRiXiB/lpTg3oDaszLXiOeHtXNmkZ6HD5t+jx3F6AofQiRkSzfWFZErV9bFdg9kl9kM5TfjQDb39YzI2xGptiHYnCY4/3/jG88jE0=
Received: from MW4PR04CA0101.namprd04.prod.outlook.com (2603:10b6:303:83::16)
 by SJ0PR12MB7005.namprd12.prod.outlook.com (2603:10b6:a03:486::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 21:56:38 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::dc) by MW4PR04CA0101.outlook.office365.com
 (2603:10b6:303:83::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Wed,
 14 May 2025 21:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 21:56:37 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 May 2025 16:56:36 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <alok.a.tiwari@oracle.com>,
	<hdegoede@redhat.com>, <W_Armin@gmx.de>, <mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v15] platform/x86: Add AMD ISP platform config for OV05C10
Date: Wed, 14 May 2025 17:54:59 -0400
Message-ID: <20250514215623.522746-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SJ0PR12MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf31158-de12-4cd4-fe5d-08dd9332336c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJRRxb3SAAwj7PzXIWeUR7wVN3K+e67tpmy3W8a0xV2mKGJ87mXK74x4q8j/?=
 =?us-ascii?Q?SDmqz5Tb5X1fcctBrvc7A0aWwyOGTtHPTJM60PPBSoxsCJZaxG0hZMqpH0Ic?=
 =?us-ascii?Q?FjS9tF0OUa6ejU3DoIv4tYZCoR7hs5SGKG5oNM3KSEgWyyu9R1iSQKF/DBpD?=
 =?us-ascii?Q?MoYu8B0ZfwvWrnNIWLtWKfksTrVE5waf9AQnPG0CvDdt+LYLRyWLO2CvHzhA?=
 =?us-ascii?Q?GSz04vyEqgGZjAuVCpnvWo+KP8bfGFnZoMicwqSM93x3ygOPdpmcbQKqqMeu?=
 =?us-ascii?Q?XVMhDQlRsPQoSHij/oQZ9JFEjWhpleWS5TcS4odgsLdP0+l+mckFvAUA4g7s?=
 =?us-ascii?Q?gn2R5jCeD+mFcIdFJK5Jt/jyLDan11gnv0Eh8h7cUZXXkfAwc2hGc8RVUJtV?=
 =?us-ascii?Q?V4K35JuU86L/oU61eLkHhyTyDEc7rvRGyr3i9vGUf0O4AcCUYhzZ/xcyGIrg?=
 =?us-ascii?Q?fefGknkhMg4rNrQAHGvhH8zj/ia7BQ/+uXlVYHmiDhoE6m4+4lmgd0K7CW5B?=
 =?us-ascii?Q?R+tqoX5CFpso1wpE0s52S3DWLaWcchb5AStsW3KpcH2r1Zguwc/pySm+diF4?=
 =?us-ascii?Q?g6SzezcZAWsgA5tSFwhqUgyLwtFL/0CphP8p8QfflLeDIgBAEQlKXlOx+BW+?=
 =?us-ascii?Q?cFYF4BvKkghkHFlsu1hVcOzcaWjVim/K1P3hkFC01oDB7uCdAyrCyYsrWq4V?=
 =?us-ascii?Q?4pZUBuiWu7oZnplSKCXyHmRg5Ea2qtF071QdxsoEx5lUzygNoS2PrfPPwz6f?=
 =?us-ascii?Q?SCa8dhKciXKYwlTzrD3g+AJFIrBMKBIG3Awyh6nu5Vzaek0oRjAjYopjiF2u?=
 =?us-ascii?Q?apxj4csCfDILUqy6bC+d/Cvc5CpxgApKKOBSOOMAp2GsV4th2Wv7JBBbIl0x?=
 =?us-ascii?Q?+OlmBhDwB4jKzbNeR75HmJpknrjIkkp2vhlwZ0B7FT1p9wmDTBeS5JwaFhWW?=
 =?us-ascii?Q?YcASVh0RGWBJB6PlWzcK2jwaVIWvtt0aE8QPDjFxyJ+IJyFRBO9pi1EGkb2I?=
 =?us-ascii?Q?l1fuO1cghcxh0yhDyHotA8poYP1R3US3WacN80/MqljbSR01sGd94iPUGXl1?=
 =?us-ascii?Q?oOsO15t2mu6NSM7mHFDJdYrYD5QUY39aA/wc1B/XejtpNvkuc4uvfFHdcfeN?=
 =?us-ascii?Q?st9y7EiKtWbPqfdQK+SrKXL7LWUPNnqEmdf6aSbmKMm5UJ/pF3IGkNQdcB6H?=
 =?us-ascii?Q?2YMVNnORMjNEikydZ+ATME8z5TFP7VcWLbmdwtj4ByHh8zPHj4hij8Os7ktP?=
 =?us-ascii?Q?T5P7AmwDy74qI9plWTUYd+qJym/614Lpq0Vfc0TbnglnI42vqJSKLdqzsNu4?=
 =?us-ascii?Q?4/EtirlBB6/Dj40LA2Stu2s9KB7jUCmFcccBpu3QBjIldn2VwykjgpwAzVUN?=
 =?us-ascii?Q?sYzkv+1DWNRFHUGEsi0sVV3IdLkgEbBjpiwvRPLMjzZRXP50BvGVHAmWQadD?=
 =?us-ascii?Q?f2QEp1SrgSLIfrHD/ygXBA25yU9nKDuqPMrRL5Dn4KwDiOFX8cz/SJWnjOLh?=
 =?us-ascii?Q?9q89adJCAVEtyiUEKFc2KOUh9sRQN2xyKIxj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 21:56:37.5480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf31158-de12-4cd4-fe5d-08dd9332336c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7005

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v14 -> v15:

* Address review comments (typo errors, extra space removal).

 drivers/platform/x86/amd/Kconfig    |  11 +
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 311 ++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c3e086ea64fc..63e4bd985699 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -32,3 +32,14 @@ config AMD_WBRF
 
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
+
+config AMD_ISP_PLATFORM
+	tristate "AMD ISP4 platform driver"
+	depends on I2C && X86_64 && ACPI
+	help
+	  Platform driver for AMD platforms containing image signal processor
+	  gen 4. Provides camera sensor module board information to allow
+	  sensor and V4L drivers to work properly.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called amd_isp4.
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index c6c40bdcbded..b0e284b5d497 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)		+= pmc/
 obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
+obj-$(CONFIG_AMD_ISP_PLATFORM)	+= amd_isp4.o
diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
new file mode 100644
index 000000000000..0cc01441bcbb
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ISP platform driver for sensor i2-client instantiation
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#define AMDISP_OV05C10_I2C_ADDR		0x10
+#define AMDISP_OV05C10_HID		"OMNI5C10"
+#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
+#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
+
+/*
+ * AMD ISP platform info definition to initialize sensor
+ * specific platform configuration to prepare the amdisp
+ * platform.
+ */
+struct amdisp_platform_info {
+	struct i2c_board_info board_info;
+	const struct software_node **swnodes;
+};
+
+/*
+ * AMD ISP platform definition to configure the device properties
+ * missing in the ACPI table.
+ */
+struct amdisp_platform {
+	const struct amdisp_platform_info *pinfo;
+	struct i2c_board_info board_info;
+	struct notifier_block i2c_nb;
+	struct i2c_client *i2c_dev;
+	struct mutex lock;	/* protects i2c client creation */
+};
+
+/* Top-level OV05C10 camera node property table */
+static const struct property_entry ov05c10_camera_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
+	{ }
+};
+
+/* Root AMD ISP OV05C10 camera node definition */
+static const struct software_node camera_node = {
+	.name = AMDISP_OV05C10_HID,
+	.properties = ov05c10_camera_props,
+};
+
+/*
+ * AMD ISP OV05C10 Ports node definition. No properties defined for
+ * ports node for OV05C10.
+ */
+static const struct software_node ports = {
+	.name = "ports",
+	.parent = &camera_node,
+};
+
+/*
+ * AMD ISP OV05C10 Port node definition. No properties defined for
+ * port node for OV05C10.
+ */
+static const struct software_node port_node = {
+	.name = "port@",
+	.parent = &ports,
+};
+
+/*
+ * Remote endpoint AMD ISP node definition. No properties defined for
+ * remote endpoint node for OV05C10.
+ */
+static const struct software_node remote_ep_isp_node = {
+	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
+};
+
+/*
+ * Remote endpoint reference for isp node included in the
+ * OV05C10 endpoint.
+ */
+static const struct software_node_ref_args ov05c10_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
+};
+
+/* OV05C10 supports one single link frequency */
+static const u64 ov05c10_link_freqs[] = {
+	925 * HZ_PER_MHZ,
+};
+
+/* OV05C10 supports only 2-lane configuration */
+static const u32 ov05c10_data_lanes[] = {
+	1,
+	2,
+};
+
+/* OV05C10 endpoint node properties table */
+static const struct property_entry ov05c10_endpoint_props[] = {
+	PROPERTY_ENTRY_U32("bus-type", 4),
+	PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
+				     ARRAY_SIZE(ov05c10_data_lanes)),
+	PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
+				     ARRAY_SIZE(ov05c10_link_freqs)),
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
+	{ }
+};
+
+/* AMD ISP endpoint node definition */
+static const struct software_node endpoint_node = {
+	.name = "endpoint",
+	.parent = &port_node,
+	.properties = ov05c10_endpoint_props,
+};
+
+/*
+ * AMD ISP swnode graph uses 5 nodes and also its relationship is
+ * fixed to align with the structure that v4l2 expects for successful
+ * endpoint fwnode parsing.
+ *
+ * It is only the node property_entries that will vary for each platform
+ * supporting different sensor modules.
+ */
+static const struct software_node *ov05c10_nodes[] = {
+	&camera_node,
+	&ports,
+	&port_node,
+	&endpoint_node,
+	&remote_ep_isp_node,
+	NULL
+};
+
+/* OV05C10 specific AMD ISP platform configuration */
+static const struct amdisp_platform_info ov05c10_platform_config = {
+	.board_info = {
+		.dev_name = "ov05c10",
+		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
+	},
+	.swnodes = ov05c10_nodes,
+};
+
+static const struct acpi_device_id amdisp_sensor_ids[] = {
+	{ AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
+
+static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
+{
+	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
+}
+
+static void instantiate_isp_i2c_client(struct amdisp_platform *isp4_platform,
+				       struct i2c_adapter *adap)
+{
+	struct i2c_board_info *info = &isp4_platform->board_info;
+	struct i2c_client *i2c_dev;
+
+	guard(mutex)(&isp4_platform->lock);
+
+	if (isp4_platform->i2c_dev)
+		return;
+
+	i2c_dev = i2c_new_client_device(adap, info);
+	if (IS_ERR(i2c_dev)) {
+		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
+		return;
+	}
+	isp4_platform->i2c_dev = i2c_dev;
+}
+
+static int isp_i2c_bus_notify(struct notifier_block *nb,
+			      unsigned long action, void *data)
+{
+	struct amdisp_platform *isp4_platform =
+		container_of(nb, struct amdisp_platform, i2c_nb);
+	struct device *dev = data;
+	struct i2c_client *client;
+	struct i2c_adapter *adap;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		adap = i2c_verify_adapter(dev);
+		if (!adap)
+			break;
+		if (is_isp_i2c_adapter(adap))
+			instantiate_isp_i2c_client(isp4_platform, adap);
+		break;
+	case BUS_NOTIFY_REMOVED_DEVICE:
+		client = i2c_verify_client(dev);
+		if (!client)
+			break;
+
+		scoped_guard(mutex, &isp4_platform->lock) {
+			if (isp4_platform->i2c_dev == client) {
+				dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
+				isp4_platform->i2c_dev = NULL;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
+						       const struct amdisp_platform_info *src)
+{
+	struct amdisp_platform *isp4_platform;
+	int ret;
+
+	isp4_platform = devm_kzalloc(dev, sizeof(*isp4_platform), GFP_KERNEL);
+	if (!isp4_platform)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_mutex_init(dev, &isp4_platform->lock);
+	if (ret)
+		return ERR_PTR(ret);
+
+	isp4_platform->board_info.dev_name = src->board_info.dev_name;
+	strscpy(isp4_platform->board_info.type, src->board_info.type);
+	isp4_platform->board_info.addr = src->board_info.addr;
+	isp4_platform->pinfo = src;
+
+	ret = software_node_register_node_group(src->swnodes);
+	if (ret)
+		return ERR_PTR(ret);
+
+	isp4_platform->board_info.swnode = src->swnodes[0];
+
+	return isp4_platform;
+}
+
+static int try_to_instantiate_i2c_client(struct device *dev, void *data)
+{
+	struct i2c_adapter *adap = i2c_verify_adapter(dev);
+	struct amdisp_platform *isp4_platform = data;
+
+	if (!isp4_platform || !adap)
+		return 0;
+	if (!adap->owner)
+		return 0;
+
+	if (is_isp_i2c_adapter(adap))
+		instantiate_isp_i2c_client(isp4_platform, adap);
+
+	return 0;
+}
+
+static int amd_isp_probe(struct platform_device *pdev)
+{
+	const struct amdisp_platform_info *pinfo;
+	struct amdisp_platform *isp4_platform;
+	int ret;
+
+	pinfo = device_get_match_data(&pdev->dev);
+	if (!pinfo)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "failed to get valid ACPI data\n");
+
+	isp4_platform = prepare_amdisp_platform(&pdev->dev, pinfo);
+	if (IS_ERR(isp4_platform))
+		return dev_err_probe(&pdev->dev, PTR_ERR(isp4_platform),
+				     "failed to prepare AMD ISP platform fwnode\n");
+
+	isp4_platform->i2c_nb.notifier_call = isp_i2c_bus_notify;
+	ret = bus_register_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
+	if (ret)
+		goto error_unregister_sw_node;
+
+	/* check if adapter is already registered and create i2c client instance */
+	i2c_for_each_dev(isp4_platform, try_to_instantiate_i2c_client);
+
+	platform_set_drvdata(pdev, isp4_platform);
+	return 0;
+
+error_unregister_sw_node:
+	software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
+	return ret;
+}
+
+static void amd_isp_remove(struct platform_device *pdev)
+{
+	struct amdisp_platform *isp4_platform = platform_get_drvdata(pdev);
+
+	bus_unregister_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
+	i2c_unregister_device(isp4_platform->i2c_dev);
+	software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
+}
+
+static struct platform_driver amd_isp_platform_driver = {
+	.driver	= {
+		.name			= AMD_ISP_PLAT_DRV_NAME,
+		.acpi_match_table	= amdisp_sensor_ids,
+	},
+	.probe	= amd_isp_probe,
+	.remove	= amd_isp_remove,
+};
+
+module_platform_driver(amd_isp_platform_driver);
+
+MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

