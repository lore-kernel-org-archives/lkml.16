Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75B54279;
	Mon,  5 May 2025 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746465212; cv=fail; b=VBybaSloY/1/ib4jZvbnwG7jxaeSbx6jEaJ4ca0pTJIIDWyu4oktQtd7nO+R+mCxr1M1R6/ze2Gx5MOkpzpWvl3ThRNj7E5KwNh+7NGPgu3Jb90aKhDf+Ei90LC2ZfoR9yE46vW5C37lMKfMLK99vz6Y80EApsc1Zdv1q6dEzDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746465212; c=relaxed/simple;
	bh=Etwt+aAcHpk3/+QPon06BRecH1+1zE1eIEX+C/XoJ20=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A/tH9kNdFD5UdE/BXpX2Gju352xWabfGH6SJIvtCIjsan04JXsmDZErI++OksDoHuXLz7mwxgKfW0cxa+0eszgpIyGScw/2ziS+VWP0QvxO4kUP+vfNtwGwWGRSM6ZHCSjEVva/ff+1KLQBxVtWA4XYhrrOcLnT86V6dDn/zTKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J9AbVTPw; arc=fail smtp.client-ip=40.107.236.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J9AbVTPw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uweW3b5VS6qR8eTyXJcTmzHE0Cl2+VPMuJf58oVWX8LS5xzde2OsMGMEy9LnumF6LYosdCb9x+yOgs5DjLyWgRwghIolFyCH9oVuFkM61Hk7C6u5AZYXYqji8XeXUiivPQVRGG09POI3tAaUD6tSY9nDnbf3E1kH5qUOzT2PMHCLVDrMSz1p0YDJQXxW6J9Mm6UZIE2SIFg8kNbGXdw1cQWFEgRgoX0Bl1OZyzKfVVK1L79TQzZ/0Ief6cvP7ldbiOicoUJfygIzicZLNOKuzpudZqd6VJQCp3fiOQcYRoThiaiENdTKOTbm35LEASe1fqe0k2g9I+kiBcls5LNx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaDh4nWOoJj4qRZDoCzTDd5pbXOQoeiSvMNmPlNtRbc=;
 b=VpXNjazdEY1hXSddua9t1/6ctl8Wlo7ZpvjuyVj9fCJ01oLpbrrunLaLpcLsxss4WyIzy4JUPDQfCYKFiHgJzgIhYsZ9UW6DCiSQVLQOnK7rnbylRjRT2uYtFtyGDw76mbtP0nw1mnyxyU0Z5t5VB2Ell8hnRYdLM0gvlgpaRHtkI+tElJgfcfKOPinoB7u4+BUWjWlNGYJvhZABFqPBMjHF2MqKCGJm5CFSFJ5gnjL+4FyhC0a4XBKqrZ+Ae6zaYDjWiYJpq0YB5XhZyKc/71pBzG01Fp6UtQCtUKaVIgedCLk5Gun6nFJQ4385jBkHBhya9wJr8CctANjaH0NjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aaDh4nWOoJj4qRZDoCzTDd5pbXOQoeiSvMNmPlNtRbc=;
 b=J9AbVTPw/J9KFh6+WEeeQaF4F/UHDewS+xxRGU2yNWsxirxhqUDjRkS1TYfcvMc7CcCw/PVaAQQDvh34pcKX10UKCenXfpxEWayItHrZH+1MgmNVuKIoJNGUSLqmVNllDbyqpCWyHuizwLbxbVExGa/3RlqJbs8TFnulqTnuZNM=
Received: from DM6PR06CA0076.namprd06.prod.outlook.com (2603:10b6:5:336::9) by
 SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 17:13:25 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::85) by DM6PR06CA0076.outlook.office365.com
 (2603:10b6:5:336::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Mon,
 5 May 2025 17:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 17:13:25 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 May 2025 12:13:24 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <W_Armin@gmx.de>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Date: Mon, 5 May 2025 13:11:26 -0400
Message-ID: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: a58ecafb-2f4a-4647-c694-08dd8bf825a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qEfy1ee8mZ9owS/pQBx2o5Q/6LWemhYO5jFYo1mjlA0DplVk1dGdYb+IQ82X?=
 =?us-ascii?Q?5SE4VGrcHggcmxzfWmACNLD5vX7CYDyeSIS1PHnfPj3IqgqtG6cYTHF2yb0a?=
 =?us-ascii?Q?ZGRLBZQN/3uhllRkF5ZaWiXLAxOgj2A5lMpEnSFzRppOV7LbpcCy2lHqFgpj?=
 =?us-ascii?Q?YWRYOVFQVsT9XvvGwlB0YwvkO8gc7IRFvnMlT8D904WcK0aHdSXjsLK2HAti?=
 =?us-ascii?Q?T3fKhPzvqdGWVCKfaGT5QUq6ZBhf41SxKHE3pkacFQmrRUyXSgQtLikochyR?=
 =?us-ascii?Q?tqi7FVDPsNOVahmVInZJSwTRu7OySqzfqvhuVymOzSkqQv4WUPllhfmg3xA9?=
 =?us-ascii?Q?w7wqmRx47ryjWxd6+pzGJ79YXoCCxKm7ZjAeofzc0s2nKnZnPIOP5wG6WhLz?=
 =?us-ascii?Q?Dj5AvRXBnDpKQTWlbSjpcH+8PZt81u/Kay5mWwMvANb5KilBOe8us7AydLnX?=
 =?us-ascii?Q?WIdAH3i/A42wIvRFB9s5uiSmEaQhqeKwY5XaiB3WCoRDelRM/fQPkHIkcRoX?=
 =?us-ascii?Q?WipQZnjboKyMlxKbByKExFnOZMVN9Opgk4YZNpsiK36Ie6HdDsNtF5yn4Fnc?=
 =?us-ascii?Q?o/nDaAaujhe0jVhtCx5vflNEMcX1B2SO1QgZG9yPcbexpUertyIUHHICZzHQ?=
 =?us-ascii?Q?si2zTDrh+RHk1tgXTHg+Lmr2Z7TaNu+fFotmgTTzPu+XhJ+D6a5FomwupvpT?=
 =?us-ascii?Q?G8+SRsO6yLWII11QdFtvgN7usNp65t97SVGyTAUcSP1w3ny0aWN25WWTX8q4?=
 =?us-ascii?Q?FKXMh+a1ztd7uOh/ezfNG60VHCGBXfLLBaUMvDg34vcf3tHLdrrbzGVZ2IfX?=
 =?us-ascii?Q?NvVRrqFHxmV3CDSFte92/NlYmtnmi2poEzMFy8PCNfrAQ6cn3pCwGWcpIOwB?=
 =?us-ascii?Q?XZtVB6NhVXdbw1hdKCyyEea7g492M+Y5hIa4pCO1WXbVr4ysLTveHmwbqMmQ?=
 =?us-ascii?Q?/ONM356U/oqpo5czU8fZeXswLNOcwQpg2yXCw9JDbzklVqkmxg6XvFuyv51L?=
 =?us-ascii?Q?BxSYr1dgYjYoQjtD6Hj9JYgJ0LaKZO6/KZVSYxq2J/bhMpRaABgUA9+Hv5J5?=
 =?us-ascii?Q?bQ0arcy5JQuVqD7Ww0IwqMolsA6n2NFVgZ+GQkyGHQmP4b5zPKYXFzyuikJ1?=
 =?us-ascii?Q?b47YqG/bxo2l6LqPqpYC/tvjDnB5kZjjHrUE4H450msK+5FsnOTmBoc+zWxP?=
 =?us-ascii?Q?IznTPVTjJbHInOd8E6hsyWcPs65dXEREpPoPV51yZN8p995wvFgZnUaShRpA?=
 =?us-ascii?Q?qdzKBY6UMt6/0AXEj6qbntCmmBc5VExW8kqci0JncBmG+p4qQrZlGOfZgsdT?=
 =?us-ascii?Q?lcMixJh7ddG/jnltA1hG55Bu+1x5uF8WwOdJJvVmA2K3MTaMZndAhxabh2UR?=
 =?us-ascii?Q?mFS/oz6UFUGruqGZXkXaKAEZAd1hrM/OTkLHm/5YGkV+HBD+nUITrICzKD4V?=
 =?us-ascii?Q?x3u8w3gfxQuavwXz3iwZ3xnizobAjvCALDU6LTCV8VVaAglR4FTzYowGDojO?=
 =?us-ascii?Q?wdzmw7jVsa6KK/UuTVAE9j78cWJM7zYTG00P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 17:13:25.5209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a58ecafb-2f4a-4647-c694-08dd8bf825a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090

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
Changes v11 -> v12:

* Add missing space before the open parenthesis '('

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 280 ++++++++++++++++++++++++++++
 3 files changed, 292 insertions(+)
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
index 000000000000..1520ebb94507
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,280 @@
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
+	struct mutex lock; /* protects i2c client creation */
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
+	guard(mutex)(&ov05c10->lock);
+
+	if (ov05c10->i2c_dev)
+		return;
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
+
+		scoped_guard(mutex, &ov05c10->lock) {
+			if (ov05c10->i2c_dev == client) {
+				dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
+				ov05c10->i2c_dev = NULL;
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
+static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
+{
+	struct amdisp_platform *isp_ov05c10;
+	int ret;
+
+	isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
+	if (!isp_ov05c10)
+		return ERR_PTR(-ENOMEM);
+
+	ret = devm_mutex_init(dev, &isp_ov05c10->lock);
+	if (ret)
+		return ERR_PTR(ret);
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

