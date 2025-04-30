Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87545165F13;
	Wed, 30 Apr 2025 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033313; cv=fail; b=UHURFrIWtLlhKDto1xzPsl1k/SmewatakMtt/UXTVG0B/4rH2E/nIOo4UjrHPgiK4OSIkQDoho12tWjgThzmn+u00ThwUmCjbj5qF8MfPRIVpRjWoa7Rj+QCHopt0MHUExllmZfihs1QssLl6fvjHovUGeipOCa8rNqbcA64wYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033313; c=relaxed/simple;
	bh=imQ3OcbN9PhK3P3gWoogWMDg4tqPo/gb2RiVtXr+zt8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=elqjmLnq4LUaBQyk00kk0ffMWhxW2LbZNkY1vUw8E2floVTK+cIah6B2Ga8OzCFH8brkjOAudH82uRmQMTBn/LyC5ZZ5+d2NqlhPYzbStlFXBkKnkC6MB1l7FYsOL0Luo2gp85BZ5RX25Wjo7JvmZETtVf9LNNiUe4xqWRKZK/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rNOKorph; arc=fail smtp.client-ip=40.107.96.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rNOKorph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoGz4Z0avnruDmFtB//yr0AV4iOEziLibgdVULkxIffxjWXbbqc4A0nOEk2e4grAh+/hF8/lPpjMXrWQYbr8zEco65nMGRfGx1Zxn/sNHpmYurkRc0YJRl4QcTAYcaxOitm5NT60v7QZsT6kU0fcMVEmqPp5Pkdp1hYKAIh3UWZQaMyZ2q8JGt9x035TL4AIL+mult/mx8IyXm7dbDTzX8R8er77SfqMStLxHwg07wTx8B0jE9WstrTRkHCx7qb9hfXfOdExvxI3qhnyE4kkof03Agf2IGQxNo69wPpN1QFvM7x5osGYVYCrPdHQivEX+7Dj2Qa23xiNbU8OmLTadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8I4+GVfuItn0RRhMr4JStJSB9xdADmHdfyb6IkPmq0=;
 b=RX8ofN+Z5RcMY9A8UkP+SEGxoIlpXgzmTnmkLkus7yJZzhHhdg3wEhAr+OryzND+MRGsOewurUYWpYQWC5R00q798UYarGGZoi9XD9s0D+5xoYPUFIivhHlgWEeXnawePTxbv91M5xZfytL27Lyi3I4TUmynLhg+DY770Dt90NEd5/VzQ4TTiL3Gw8t3W17RKpcPyB92fz8+AYsl5zGbEgViN2vkiYLY/d3jrSr/gVPsOpefVOPloKJgbLpmA1zLL2a19AzaOYuN37HVDmqqVPmcjjUvL/vTMu1p2tpfhB5LupnLIUkHgpzhXRlTlt6V6OpaHw5DJikGoyWYx3AJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmx.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8I4+GVfuItn0RRhMr4JStJSB9xdADmHdfyb6IkPmq0=;
 b=rNOKorphFms7a2ExWq9D0hHWufOZ5+q6J2z7wKQPTT82MEdZGyI/xP13M4BEfKsXjxwyejlkjq3fMUZAgELMd+B9B4z//xOGyrqvUAsDmE+p97oiYixm5JHU1Dn4zBPns0v0ZffOdqTkaur6VnieHV8X0JzuulvjlBfg+TOMrXA=
Received: from BN9PR03CA0052.namprd03.prod.outlook.com (2603:10b6:408:fb::27)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 17:15:04 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::d7) by BN9PR03CA0052.outlook.office365.com
 (2603:10b6:408:fb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 30 Apr 2025 17:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 17:15:04 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Apr 2025 12:15:02 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <W_Armin@gmx.de>, <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v8] platform/x86: Add AMD ISP platform config for OV05C10
Date: Wed, 30 Apr 2025 13:11:16 -0400
Message-ID: <20250430171429.1043759-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cbaf00-cea8-4b98-30a9-08dd880a8c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|30052699003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WAy2n223972BRMjPXTKtc1zy+glcY6SqY8QBXRBnzlRLZwnIH6nhIhlfUVTq?=
 =?us-ascii?Q?aSL/7B+Uqi+D7m0TfnXJ8FfB4fWrah7hLqIUTCmlLXO1swwSu95FJTYEjsTX?=
 =?us-ascii?Q?nvm3Msesadj4QOg/xFMUwk9JN8WBLp3eaIZrl56Ni9R0JtD+0snXZOw+dNXY?=
 =?us-ascii?Q?2tbcZBg4OHXsPOaLKfDWf8QC8QJpiCcN1q+Dxqvu+egpa3WV9drvi/BgeaOo?=
 =?us-ascii?Q?0CQOHY6MBK7rNvthMMRarrUg9oIKsPtKznZ8iTnup39IBYKIT1MXgOkwx2YN?=
 =?us-ascii?Q?P80tbkGQ0mKIxlV/hqpztE8iOWJ0np1IwnYwEz4thcRAaxPSiaJrcC8nO4u/?=
 =?us-ascii?Q?0gYAkfL9c2iUncKVtm282HLRC43tybXLkQH1JaduTDfs2XlKhtrK92ti2Tdg?=
 =?us-ascii?Q?q7125dD8bVD37PGlApbV/lZrgmoBrykSHykkpdRGRoGkMfNGeYNO9Gj0IkrN?=
 =?us-ascii?Q?F948KEVdLNH4ExMZX2Uffr8otlONRHreBuS4nWB6fe8D/QUItoF61w5/Sjlr?=
 =?us-ascii?Q?Dm94dgabzKn6jRg8uT9gkiKRnRDfO2HNGU6RPowRtdhcZP8xtd+WtVEEvMB+?=
 =?us-ascii?Q?rFtjBPF9Sp5dWt0n+0hSpd6YbG1i7/RRkjAkn4EtNl2r/b99n66W9uSBjzcQ?=
 =?us-ascii?Q?fvGrltldJfyp++lC+gZ6z8phLzA6t4f8nsA80tKdqSybrIpc1WWkzgnwxwUJ?=
 =?us-ascii?Q?ls2clClD+9nFZBLq5CnLkziaUvRkLlG/TJcEj8J/lR9L7rNYrcSeS+mQ1nI/?=
 =?us-ascii?Q?e9VmfF810k7FLl9OoO3Jnwa4CDgFRT/dUvPqujFwnfUp4+lbRtgjPAKIB9XQ?=
 =?us-ascii?Q?j0slbvU3o3WWAeHaVc6lIxi/1j8bMu4Xtq8EIWweJMrxjivp880rC6rMYkwj?=
 =?us-ascii?Q?4X1XMfsD00NvIC6lGezolUpAZGfUB8JeaUjIc0iE+kSEMwaCKQqMFfk0Lmy2?=
 =?us-ascii?Q?LDoWkIuyk15ThMK3XbZtTBH9g5t/smuC1dtRlnldy7Vhjc/A+hAFMLLS9Q6F?=
 =?us-ascii?Q?AwAL3JkDBKhyg76Va7ySlBQaH8kvWtxM4j2UEEfwt4U6P5tPt4OcBkuumGSN?=
 =?us-ascii?Q?GlSNpUOhhGjdztfpoWiu3vadYJDNRkfQueyjVn2/3e5QJy9bhRPNM5RjLtOr?=
 =?us-ascii?Q?IrE/TrppkmrgkdBpLY7Um97UX9FRA6drk1ejS4rhqZYr9jfJ5lDzaV4KyCD6?=
 =?us-ascii?Q?WZGcfr/b+YP0skcxyUN0nIhEYC4/9Lb0ghJy6NZwaQ6k8acAwmhNKYJr3wC9?=
 =?us-ascii?Q?Gpjt2Qk69HwAkrw0ZKwc4MgFA9rh0F9k7g+vViC/PE8oGtLniwFPLyhd2BHj?=
 =?us-ascii?Q?qsY1lTsl/FXgVT+vax6QXymXrN6qqiXsaMINw1X2PH9n77BfWFW2TFku6uRp?=
 =?us-ascii?Q?2Qhg8E00D4DeVPQyL0bnTzUD2ryXANnSpOpZ/oSW0EXjRv8PlYHycLFfsniz?=
 =?us-ascii?Q?fodI2zD00XhHKhxnt3RIyS0t3RWjULmQeLKHxOiklgJca+SexVFSaf8l9sYn?=
 =?us-ascii?Q?vtcwsuKrcZWT4av+3GyFIznR5s7Pqd43TBPb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(30052699003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 17:15:04.5362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cbaf00-cea8-4b98-30a9-08dd880a8c90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v7 -> v8:

* Create I2C client instance incase AMD ISP I2C device is registered
prior to bus notifier registration.
* Remove unused and duplicate variables in 'struct amdisp_platform'.
* Remove global variable 'struct amdisp_platform amdisp_ov05c10_platform_config'.
* Remove dependency on CONFIG_AMD_ISP4.
* Call software_node_unregister_node_group() incase of amd_isp_probe() failures
after prepare_amdisp_platform().

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 275 ++++++++++++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c3e086ea64fc..152a68a470e8 100644
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
+	  This driver can also be built as a module.  If so, the module
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
index 000000000000..6164915d8426
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ISP platform driver for sensor i2-client instantiation
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/units.h>
+
+#define AMDISP_OV05C10_I2C_ADDR		0x10
+#define AMDISP_OV05C10_PLAT_NAME	"amdisp_ov05c10_platform"
+#define AMDISP_OV05C10_HID		"OMNI5C10"
+#define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
+#define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
+
+/*
+ * AMD ISP platform definition to configure the device properties
+ * missing in the ACPI table.
+ */
+struct amdisp_platform {
+	struct i2c_board_info board_info;
+	struct notifier_block i2c_nb;
+	struct i2c_client *i2c_dev;
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
+/* OV05C supports one single link frequency */
+static const u64 ov05c10_link_freqs[] = {
+	925 * HZ_PER_MHZ,
+};
+
+/* OV05C supports only 2-lane configuration */
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
+#define NUM_SW_NODES 5
+
+static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
+	&camera_node,
+	&ports,
+	&port_node,
+	&endpoint_node,
+	&remote_ep_isp_node,
+	NULL
+};
+
+static const struct acpi_device_id amdisp_sensor_ids[] = {
+	{ AMDISP_OV05C10_HID },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
+
+static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
+{
+	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
+}
+
+static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
+{
+	struct i2c_board_info *info = &ov05c10->board_info;
+	struct i2c_client *i2c_dev;
+
+	if (ov05c10->i2c_dev)
+		return;
+
+	if (!info->addr) {
+		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", info->addr);
+		return;
+	}
+
+	i2c_dev = i2c_new_client_device(adap, info);
+	if (IS_ERR(i2c_dev)) {
+		dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
+		return;
+	}
+	ov05c10->i2c_dev = i2c_dev;
+}
+
+static int isp_i2c_bus_notify(struct notifier_block *nb,
+			      unsigned long action, void *data)
+{
+	struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
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
+			instantiate_isp_i2c_client(ov05c10, adap);
+		break;
+	case BUS_NOTIFY_REMOVED_DEVICE:
+		client = i2c_verify_client(dev);
+		if (!client)
+			break;
+		if (ov05c10->i2c_dev == client) {
+			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
+			ov05c10->i2c_dev = NULL;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
+{
+	struct amdisp_platform *isp_ov05c10;
+	int ret;
+
+	isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
+	if (!isp_ov05c10)
+		return ERR_PTR(-ENOMEM);
+
+	isp_ov05c10->board_info.dev_name = "ov05c10";
+	strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
+	isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
+
+	ret = software_node_register_node_group(ov05c10_nodes);
+	if (ret)
+		return ERR_PTR(ret);
+
+	isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
+
+	return isp_ov05c10;
+}
+
+static int try_to_instantiate_i2c_client(struct device *dev, void *data)
+{
+	struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
+	struct i2c_adapter *adap = i2c_verify_adapter(dev);
+
+	if (!ov05c10 || !adap)
+		return 0;
+	if (!adap->owner)
+		return 0;
+
+	if (is_isp_i2c_adapter(adap))
+		instantiate_isp_i2c_client(ov05c10, adap);
+
+	return 0;
+}
+
+static int amd_isp_probe(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10;
+	int ret;
+
+	ov05c10 = prepare_amdisp_platform(&pdev->dev);
+	if (IS_ERR(ov05c10))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
+				     "failed to prepare AMD ISP platform fwnode\n");
+
+	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
+	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	if (ret)
+		goto error_unregister_sw_node;
+
+	/* check if adapter is already registered and create i2c client instance */
+	i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
+
+	platform_set_drvdata(pdev, ov05c10);
+	return 0;
+
+error_unregister_sw_node:
+	software_node_unregister_node_group(ov05c10_nodes);
+	return ret;
+}
+
+static void amd_isp_remove(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
+
+	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	i2c_unregister_device(ov05c10->i2c_dev);
+	software_node_unregister_node_group(ov05c10_nodes);
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

