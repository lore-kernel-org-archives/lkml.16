Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863982528F0;
	Mon, 12 May 2025 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085866; cv=fail; b=VqLsyrP3kyqq2GmZ8GLKizGhzNQk/FtI87S79Wo3WzX+2QKOTec+qhRNKzfikW3Cw6+oZKQOP82EuSzkXymuiIkt0Z9I03TmNugtJ24PiqGHOe263NAwXzyYOBE/lZVgLRPiIHI1w640s/CG6hWZeNDlfJbEDkyl7XVilb/OoL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085866; c=relaxed/simple;
	bh=xKzg7iM6tsy6OLRNR2NrXoITYpQTm0LHiWPSVNV71m4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HOXSeh7VzDPR9BxyF0P7Dsyp3zh8SuYVKjtD5Eq4oUKdEBpuulcDEVkDu79LvMr9jrw2cD02cz2biXkg200hmnppuyXAX6Ga6REkEgfbGcnHBVMtcrEcf7umMM8Bv2E93skRDHZWX68QShMkdpcVvUF3QD68n/eM40TBhCDAxRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tiQhrLU2; arc=fail smtp.client-ip=40.107.92.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tiQhrLU2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYo3Pgm7UYiZBOQW98zIOwvFBlj4Q8UAdreFt06MxQ1t6ffwaGyNt96hck6+SS5hfgP6lTuy2UlbwEttAabJouIOyevdKxGrWroFJ5Q3zKoVjUM/OCZmumoc/+5AANE5Uq0LdKY4j247a+RMZdUHJQvqYKihQMGfQ3mTt4960W2ap68yPopyDwlqfvLLiEdwnYslOBR2wCX3nw+iCep3MIeRH1eJV1HsDUkEeORb0VFo1YnJqFEw8iC4qyOG3dZTtOBBXQyD54fxQGufpb/4o2/aaf6I0ueGP58tX8BjufKQ/geLQYFyECcGkYR0enfOcXXF40jo9XLx+vmmyfLhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdAKAk/6aLwNsjPSPChqg+Dm3gLAjxsTNK561LUgZeQ=;
 b=MWhtguVnLyy9994lQ69ISWPGY+zuKHU1v1IfzgshHguZIEKoLUOEOo+2TsDst+Xew8PlMwUzPVOE4E/ZK9IptBoVk2Nz1teFj2f8TWWflkp7J0xGJk1NLolMt8PCYeyXCCaVaSlbEy7bTr1chs6sjtVybizpwdoR/s7O9Lr2eFhFEgtnSUN4avgtCgJprgLCrjLplXJbHyAZj2tYo9mB9mGzhIpZZ7L8kbMsiEQRavHRYgUVv2/0/MO8t1gWNgYf1UIxhDO1Rjo0VHlzwgW+4U7e63yFvZ5U5BxdQaUUT86RPEsa1aFF4KQozWjNyCvfuf3qQ/x0TNTT+XHH9fA4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdAKAk/6aLwNsjPSPChqg+Dm3gLAjxsTNK561LUgZeQ=;
 b=tiQhrLU2QB7eFGApicnOlxJC7DlS0+S78EcHzq0Ujs8d8mnJGmvsKE02p+dqTrneMOv4bOte4whq0u/tQtqVkRZnEO0xJ7vd3SiMGQc+YbPRA2Fl5saz8V1p8weRJVAyQ4L+Co/VKzWjHyWLiu4qGV7EsZuhG4q1rgA9csEx15I=
Received: from BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::14)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 21:37:38 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::c1) by BY1P220CA0022.outlook.office365.com
 (2603:10b6:a03:5c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Mon,
 12 May 2025 21:37:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.1 via Frontend Transport; Mon, 12 May 2025 21:37:37 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 May 2025 16:37:35 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, <W_Armin@gmx.de>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v14] platform/x86: Add AMD ISP platform config for OV05C10
Date: Mon, 12 May 2025 17:36:36 -0400
Message-ID: <20250512213711.3226784-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SJ0PR12MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 2608e0be-0a50-4cdc-e780-08dd919d373c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|30052699003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iRxL5NlIHVQhnT+4z1uoykx1xXkQainZgLDw0ON780eHQj7mRilgaTn2wlGN?=
 =?us-ascii?Q?7WKmgO6TXuS6h7NuHo2Vepk9jt1xsipTCyEdGnypGh/AxcWWps1BTW852Y36?=
 =?us-ascii?Q?wIMuiDEDA+9QlbRT+B6qvOsnzxlFii3PiXRszKlsp7y1Urt44TUUc3O3MFsx?=
 =?us-ascii?Q?Z+PaZ2BgFe/UD6YHQig39G5O1UDqa0Zu0wXFf8jO5dpcQHREcQEfRwwSztSA?=
 =?us-ascii?Q?CYcWLTPp5PsQ9fiVHw3qEJsvUDeypaq2FkU/N2vsZTuXVmAhZsMnRg6E4XbL?=
 =?us-ascii?Q?1xCjW/nUNbhbIJ2ICOF3qZkBXN+7+i9RDAR71Wje2dVFbMsd9/PQdaZAOCRf?=
 =?us-ascii?Q?LhUpUfhqzdvX4sud9zafyNQqndP9BUZyUdHt/IN7/gNl2pz/+GQM+MX9HLcj?=
 =?us-ascii?Q?6jaulbBRTwBBdPWTU/1k9lEASzPJxByad9zc4wMCI8H18r0Mf8Rjbz4C6EpK?=
 =?us-ascii?Q?Rqe/kiDkojFVclpkg1tbSNpDgqpOYBuK9D0ToAvUXFc22ErAgI6f7XB/19XB?=
 =?us-ascii?Q?oRq/hC4AZnKJuGOaqZQWBk4GMSFCPVeaG3K3678GMBl1dXX7JR8QVDulVfTj?=
 =?us-ascii?Q?oRliBzjMoSB/MjdZcWYAZ247ilDIVf87Kt/xBU3aNK2uVbvjvwbma0ZQQyCH?=
 =?us-ascii?Q?gn6buVgric8FFPWVcuC11BxrrPpHv6xFumdPg3xKtQXAWXMPw+qgI5j0/syk?=
 =?us-ascii?Q?B0/SZ3Jq6g1kqlo4Ht5c2HybZarR8oDPlpt+UMiqj1a3rNTmzTHG9wWLnmHd?=
 =?us-ascii?Q?mjCV+s6R5hrX/p0rNpFKB36d8rZTpzwHaQk/nbTUp6IKuSKb5phcvi52mFSp?=
 =?us-ascii?Q?rjujBPLlOKj7Jmkp3AmmWGx4CCJM45fPfIfmQk09HuwZHIxPH/gSt5d0/d5Z?=
 =?us-ascii?Q?Eoo75kcFBtBbTIjBJZcKLC9C+TxYwAhu6Wqf/j29C52IHZhX1Z8mdGAqIjUo?=
 =?us-ascii?Q?YzGDgzpIMac9pHFDBRumMLvwcsgRAmX/EjJHCdLB763YU8AsGa7uroOiH7dn?=
 =?us-ascii?Q?7qqefy0YAk7/nKTBldyKa5JY18oROOJKzSIjBdX1z7vq3akXJwQZh1oF8G7J?=
 =?us-ascii?Q?5Txs4A2yvAkEYUS7n25vO4J1BEyTMRMCM/jdb34BdrggR3xdTuVL/wei0CfH?=
 =?us-ascii?Q?tDDf8kTwY/pC7vfZ4EVuWHkI7I6uF68m+rFjKoECUfwz12PC6UAPfHolJVjd?=
 =?us-ascii?Q?QoCBJrLxSl8/0evqNL0PF4t3tow9tfU18dUahKBB5uFrhRgffgK9x9kEajAg?=
 =?us-ascii?Q?/JxgftyVgrgbCmXq9jrHDgmrUKjWa5NTXKCzwIVwbx9WZbXHZgwEE5QKvNmo?=
 =?us-ascii?Q?SL0osnu9+YPpO4CGzjAzF9GeaV6qrhamCYjUpCD8AvNDYXIV2/jnbgZX+fcc?=
 =?us-ascii?Q?5BU/AwPxZ201uCHubZGpiBbFlwtbBqexMPeF7qpjiAdjjqpSHS3SazgfmjNO?=
 =?us-ascii?Q?OwGEielER13aK4vVLcJ+rDwQadvDArjE+Uv1sifPlJl0Im4EkEnCQauZ+QHu?=
 =?us-ascii?Q?rjVxy3lBV9j042sd44DWx+eXwDeGwlZJnQfW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(30052699003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 21:37:37.7633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2608e0be-0a50-4cdc-e780-08dd919d373c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733

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
Changes v13 -> v14:

* Add header files, remove redundant casts and other cosmetic changes.

 drivers/platform/x86/amd/Kconfig    |  11 +
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 311 ++++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
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
index 000000000000..a073e35ecba7
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

