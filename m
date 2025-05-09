Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A52192F3;
	Fri,  9 May 2025 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814368; cv=fail; b=CDZzOVGhtgBJkJmCAKSgapclVp4TAljh4qdkG/X3FYQNJTV9xLngB8tG0nXoRSXUMa8Fgqm7+YCTjFGPbb5/m/XNgZijHOyUxF4eGCgElyr69PCd7QwXuvbjyt+ZPFdTSLgeJPJlxXVezV/rQgWD2Uro3SM2Y0ebW/18CeLzJqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814368; c=relaxed/simple;
	bh=j8C89FFMd/5KlJ7TgFeHeX1QLjHHPX2qQ2/KnWyl5lQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gRcWng7FlDmXbqo8LIRxautmZDlnd/kpuvqeG1q2UxSnUZpkMwvxepBoCeeybfn5xFyANMvitUu+m3B366rgiKwH79X2OMXR+YRJaNKuotOPKAnYWAfn/urYh9fYHTTbCl++Wae2apWpEF2Ic4+Cid0zZqHQa1SP8Dx8BaHcV8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=15nWzUAi; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="15nWzUAi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSjNkNO6YKQIAQkNJxZ0mptAnLjcjwzEStNkp0AFVOeGhds7ff3cnqdY0dMDAoCyzfujYG1h+4giklXLvMBmO0fBCSYRZdyeb7yG9mWfOPh0LZrobJMxTwLVM7WX0pXkCts4stv+7z0yiX0BqR75K5EjRpap77xyG32GjOvhW8VLHrO77Lqyold7W1YhDz5JuWlJzuJfhrfckFSmds/Rzj9FSWgQ5RbMXTJV2aB/y/E6Cbwzp+QI3Fh9MXt6AHdfIrX5LLqyTmqbj8IxQUzGUh5CwwMTzgWg4RPC5s5k9MClKidLIp2S69PL3Ps63WeJ5bbBT8O0h8pb6ma+kzYXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRYn7GqRfL6tSo06ggttOM2LsNU1ZnkKoU+3IkPkMjQ=;
 b=AR1RihcA1IM7qMH4qtDqjAftgd1YzMLZ6+9gjrr8msmlhG4mHwNZ2HvJbjw0APl8WQSds/NptGwnc1AFNze6QOHNBDNU8w5qoH2CkugA3ibxFdhLmVSlpvFVJ/T5YOgLRjby8QIL3/skbjlF/PO9RGJK/8Xqu9dajQDmmEoIFglmpJSDIfqOrtLX1MXu97oNjExwN6GMt0+4OIPilI8OXm+XOf3vlIYiF53ytHoAD2OAYKZP3rkDuf3/jDahaIPNHbtUB+XSNx+SpWhZUTcFdnXaUABBqWybNS+MTQsULoK7HvxjUjmOJoJQN7ofi4NzHHcxvb5m5HUw2xZZIDxYdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRYn7GqRfL6tSo06ggttOM2LsNU1ZnkKoU+3IkPkMjQ=;
 b=15nWzUAija8XjNhE5Ow1R80upXRA6Y6Wm4GM5nJDF8vDJD3832Wb5/OCP30NRz4uXJbcrtCxpmzRcP0q7kZKtjmc0yz43JRwMNMQwxgFBEpj42I0fPryugFNtZ7oddaZGjFrtQh/6UXLO/7hj/MQTKh/X1PWaf4XbrsyYNz+ThQ=
Received: from SA1P222CA0057.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::6)
 by DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 18:12:42 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:2c1:cafe::20) by SA1P222CA0057.outlook.office365.com
 (2603:10b6:806:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Fri,
 9 May 2025 18:12:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 18:12:41 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 May 2025 13:12:40 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, <W_Armin@gmx.de>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v13] platform/x86: Add AMD ISP platform config for OV05C10
Date: Fri, 9 May 2025 14:08:16 -0400
Message-ID: <20250509181220.1744783-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: ec165d82-264d-4952-6c21-08dd8f2516f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|30052699003|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7oLB2bV5BcICpRZyVRX5Oxgktor0RqI0gen1I33m4YeNdIXVK0nhU7IvD4YB?=
 =?us-ascii?Q?BrogWov0tugweME1Iz6DidHPQdStnAxycAToSvXzg0PV2SHVOACPr43KQy0F?=
 =?us-ascii?Q?jC/xXQtqnfhlEyfJPmV6JtMCGl/TjqVeJefWTNfyIJeaTOSGqX1ROAE0aAvM?=
 =?us-ascii?Q?5K3FMYr5AzkDn61mz6O3KPFeBeLXgyJcXt/yDn9SrEn+TEWxoB/ktR2W36c0?=
 =?us-ascii?Q?4Bza+TdZHUTSKXquiYzhWmb/T8Zir/7gnc9opyenrtQ7972S/YiDET3yVojE?=
 =?us-ascii?Q?eSMoVsofeo2p673sKXF1zCJXqRH/0rqnVtK4HARGJkD29uSRe+IV+zuhCM+R?=
 =?us-ascii?Q?XcOSqgK/p2Jxtq27PL68WO3uSp3aYrZAQwsNevQhOg/NlAs51QBPpD0FRCNM?=
 =?us-ascii?Q?ZkzB0I0UBvjLmDB9GrwSgSqMNmV0D/5muba5vABAm+ghJBmGmUUklDLCm/I1?=
 =?us-ascii?Q?pBBwz8y1dOBeqkbs9GPA0PNM4J9XgjCDorkUL6V/cEbSD8VN3a6PFdF55Bu3?=
 =?us-ascii?Q?SEXQgMPtQtwS8Mm8ZZvlov/Nh+6Vcelm7pwk0Gk53Eg8G/w3cBzf4Ldze6+O?=
 =?us-ascii?Q?TI4Wbs5oj0cnCICg8TU/qfi6Z0cXMbj2szP7SDFueA/opNOcMkYquIFyzQ5F?=
 =?us-ascii?Q?jHxWjHY4LWubcygxFDgznP1piQ05SwI0HoHWZYpU9eWJ+k21PWJSwfnOKNrA?=
 =?us-ascii?Q?XJoqy10pPRRBT18O/BKxIHHSVTMetfw33X/8EQBYysmhG/ScYfYx+IonZoau?=
 =?us-ascii?Q?fCo4TQo3F/utEJ8CTqhUBkvG6zbDCWMecVMVq1514+qoy7Nf8LckSeYhMkoF?=
 =?us-ascii?Q?/+bmUMRvQIXgrHrRSiVtOslC0/oO7bnl69pT0TKP40r0/MKibrNtz85Jsc/M?=
 =?us-ascii?Q?UB5nzHoHafP11vxY9xkE7jW9o3xoHCLkNyQXCJCBGA8pOE9fRuY1ZzgKAIIG?=
 =?us-ascii?Q?vDPV7453k3dyY7UMnOqeZ0+vikLrp7rzdee1XtKuVR+FFRuY09n4YUMlZfIa?=
 =?us-ascii?Q?vGQvltvnQY819yTEcbn2hHM1n8/ZKOmei2LnOt/mnKi9xMU5XzjX7S0hncrZ?=
 =?us-ascii?Q?zkGlM5hvRLF0LwQwvVg4U7/Yq7yj1VLXAUW9uvk0PLwU3d086AuTR4G0YV1t?=
 =?us-ascii?Q?tjZWBBdCvzNvO2w6RUi+frhWv1IHMu8jxUy/4TsnDdNX5nSp6H3XEMUCn00v?=
 =?us-ascii?Q?b4orG6j/ExTPUn9yj7AVh0FxOTRxeNXAArPcKYwCz0DaOsBYD+XeCLijQexA?=
 =?us-ascii?Q?hdbokTF/S90/Ip0hVw7829I0DIeNQK/3ughVvEPIFFpvIlhl4wTn140FZ/2F?=
 =?us-ascii?Q?by88FRgRKpgcWr2hvJGbOGAUBmKX2klICVP6CmsA4JdQApaxxhL3bE8W50O7?=
 =?us-ascii?Q?CH+46o3fPcdxcK7RlzxnNrEr7h3Nsvo3z3ycarl/YrKN5gWqJ6xrtIrpg8Z0?=
 =?us-ascii?Q?yUV2zdFcOAF4FaKqUEswu3RNBa/RpRQ45GBlf9bi27LwynR8/fRYcfLLPgkS?=
 =?us-ascii?Q?LQhZD9zYiH08ryL0Wh2fmOaPTzKOQXPHTfFo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(30052699003)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 18:12:41.7218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec165d82-264d-4952-6c21-08dd8f2516f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352

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
Changes v12 -> v13:

* Add "struct amdisp_platform_info" to pass sensor specific
configuration and make the driver generic to support OV05C10
and other supported sensor modules in future.

* Address cosmetic and other review comments.

 drivers/platform/x86/amd/Kconfig    |  11 +
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 309 ++++++++++++++++++++++++++++
 3 files changed, 321 insertions(+)
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
index 000000000000..27939020634c
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,309 @@
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
+	struct amdisp_platform *isp4_platform = (struct amdisp_platform *)data;
+	struct i2c_adapter *adap = i2c_verify_adapter(dev);
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
+	if (!pinfo) {
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "failed to get valid ACPI data\n");
+	}
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
+	i2c_for_each_dev((void *)isp4_platform, try_to_instantiate_i2c_client);
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

