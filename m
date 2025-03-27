Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16791DC99A;
	Thu, 27 Mar 2025 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743113698; cv=fail; b=FygfjbkWCHYCAhdWsbK1KRlr/Fk7KFVAz/c1oL4CvBlVqn3lwTwnVgQ61hsurjn2gFfhButBV2bOLH3IdNHZKXAIPCjsVzpz9NVVxiD6D+Xmd/vtIF0p9gdP0/t07889ElwsiV1eNpL4vo9HxGA8pYgF+G4WfWtA23JhJe9gtL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743113698; c=relaxed/simple;
	bh=MnpYizOFo2PQRqiqlMu1MFOiXAgdDsOpl+t83IV5dzA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FrpYMEm2FH8MoYrcBxiGpOHfY30ZUV5IQk8C9JlGtmkK05bgp1/kuTf5obW4DtjINTaK9mOBOQAGFoBMRlGDB5ixC5RJ52VzdsRv8dzHx1N269qkQVjiIgrmsEtOA2bKK5sJW1e3jbS7FR2zkxO9+L9NhKmArcVifqKzexf2ADI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ynJPTh6v; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ynJPTh6v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK8MDDvmRKdlJlJZQ7264RIO87viFiGs99BVGN6eqAjKEAAz3KdaL5YgEkcNWOhZ00gcgDQUSetNvmdMu5J+4qj0DKuOMTNgL4whYnqEAvhKOQxZNWm5wYd3bHF1t3YgaCWKYCFDGftA310zhgXGBco3QRsxAUxY6R6K4IcKH1ko+yi5YUUzG4VlkwU9IuRmW5NMviZRlXLXR1e08m3olncpgfwFfzocJKp47QPDM97c7FSLIX1MubYKAi+sZZ+tnqZnnWsDYLy5+7bVrKJ4NdaEU6Po6mJV/nM8gkK8gQmsJ5H+2wM0ZMjZQTDc7GwwFOK3mW0hGHAI5tkgJH07kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOhtzngJ0wSazrgzM0iO/yxsXZyflEcYQpP0B7Bz5fw=;
 b=ALUjMsg1a399QiaYq3ScPn3i9amjbwlnfIA958E95J+eWSBdht2eXhOZGiq5C/QPhAkRTQ9ZpErWoQi6lkT1M5BSTtq1/TbD2mwHC1EDcqEcN+h2/GXpiK9sj9x4Ls2QxA5kJPQkdSvNJoOcohR81lTB7gcwmeQt5tXhQjLcufGHz8/Oo8UPfsa0XnpY+KEQ/737uKSqKCnOVe5ag7hw2YnvvrnH5xhoV67HlNNLqfNGrdAMa/KU5c02LjNCTrrQF+xar00MmdxAXayj2eXA3wZT/wGA2Xta8VuljHcrVSL2xva3cSte2oVjS79WeSfVxVpef4s5moDj4ckVMgVCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOhtzngJ0wSazrgzM0iO/yxsXZyflEcYQpP0B7Bz5fw=;
 b=ynJPTh6vA/SC8I+4320GZMWF7adFYwmkqaWCmay2v9NUOuDZWIiXWy2fBYG8No0b0/sisM/6UNaAucBy0kW97pjykU32kRqF7FYrGvpdjug/qBKbO6elNDPyuy42WM2PYl9xD3bfAITRBZXYYIZbnzcxOAPxveT4W3Oqgnkpq40=
Received: from CH0PR03CA0109.namprd03.prod.outlook.com (2603:10b6:610:cd::24)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 22:14:50 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::aa) by CH0PR03CA0109.outlook.office365.com
 (2603:10b6:610:cd::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 22:14:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 22:14:49 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Mar 2025 17:14:48 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <grosikop@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v3] platform/x86: Add AMD ISP platform config for OV05C10
Date: Thu, 27 Mar 2025 18:11:26 -0400
Message-ID: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: 7020772c-b575-4b37-02a1-08dd6d7cca97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|30052699003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nq5wkUxfwEsj7CpT1PAOxQO2e1dLH1pJqZ73gYeVyWojO+cf/c+SWWkOe4RJ?=
 =?us-ascii?Q?YLFeIGGO8YaENQdcp6qWfkTDVJ1YMi0heWNS1XcUxV1TJfQUCtBvbNAEv4qo?=
 =?us-ascii?Q?uRt6LAZO1rsTvJ+ANL5sPVZJ4o6euhSsMI/YwiDCaLPd3GzcHvK8hLOQfmUM?=
 =?us-ascii?Q?NhqGMjKwwcgsx2MEONuYxreDqcTuSu4enoj/mmrPfREmeH86n4LELV2QiSML?=
 =?us-ascii?Q?3zmpyv9MDJg7nYuRtL/vDTfsAubk6wGZYURjbiaVc+19fE89M/2UYyZ1QKFr?=
 =?us-ascii?Q?MbvfcdB7d4MmIYZ1AOpTwmKHz4/yksyYMvvIrUUvjrNGFsBurKOOKRqlce8M?=
 =?us-ascii?Q?QCqehUqQkdlCctOGoy7TNQGTo+o3FBKnncXfPcLGEMKgeeRu9apXK3q14aJX?=
 =?us-ascii?Q?x4OmzW0wAThMti8Tz+ex6e5X2P5SsoJqeW6+Q8akFhgh3HHaH+id7OWo/m+y?=
 =?us-ascii?Q?arYJuDhT5lWHoZMKFiLS/Gt/WaDNnp5QSI0Abkeeu0RkqKhP9FQeJNS/LUkS?=
 =?us-ascii?Q?HE+XIUnprS9obUpMtIDRVK3XreSNK2Sn0hrGJJ0qVLl4yYYSu7ilVULdqgiY?=
 =?us-ascii?Q?FZvxF6LlpmKzIw/Ft7EXKXhvvJcxHZ6zr4UOVXH7GHeimAAoqKUIkeOI8uni?=
 =?us-ascii?Q?y3HR8L/7G/gNdxHYbRpI7oLHBOHlgH4i2y0O1egNvwDCfFEsqjqChQHleP6X?=
 =?us-ascii?Q?5jllSvWfHor/zywjcGRZI3tKeUGDKPkKesAxb2GBmnuxODXhRiRQPfPK/Toz?=
 =?us-ascii?Q?tim2plKA2en6EKGH25xohjpzZSCiX3MjbvOOuqwAzWbhKRr75o3zkIAzn7Rv?=
 =?us-ascii?Q?fBQfrH6yUPt6Mfq1VUhnSB1QukJ9quGmi0ixYS/9i8G5rMWK7bJzwZ62Ma+w?=
 =?us-ascii?Q?o2VANTn4xZi87MBzDzCyBBahbBPfiDCbdzTMI4grt2Eg9ngkdlVkCBaNJGx5?=
 =?us-ascii?Q?tUDFJoPrl2kmANolLRv5POjLfyRQp7cT4XxB+RdIioeVCkvBPz9jBbAuIBu+?=
 =?us-ascii?Q?zl2AosM16mHd7e2OLzhF7lYSahN/eOWzkJVY7hp9mysO5F6UJkDr31kPybhW?=
 =?us-ascii?Q?kgr83oXOsrhxhHDtfJaUKhqEaIIBXXL8U5AT3XbBMV1uJzq0Msc0QQHFHzZf?=
 =?us-ascii?Q?vlZ7vj4Sor6sakKyXScAc115wVkZ7E5MXAzJvcEg6gwvavDOqPui706RSTv6?=
 =?us-ascii?Q?mbX/lcKKKyfcdjls1Allg29RUKKu8Dj7EsfA5nn9j8BV/rgd8tAgPpJ+Z+N5?=
 =?us-ascii?Q?vVmkfbdrluqldmAJF3IVVI86MMlIpkUmMGJ5m6oD+qKuFS4R+ATbcue4EJEx?=
 =?us-ascii?Q?Jk3cjbUihgDW2cOO8pQsexD7YEqtAOVKakJgE5spMs7miJ3+E61ctNKHaxPO?=
 =?us-ascii?Q?RWlkkFH2Q/lK91CJpeZbtt3lkB7eyKO36Js4SJz2IMcPHvdfijPenS8Ey9G+?=
 =?us-ascii?Q?dNS2EOAfeCzJz6SrujtSvW1oYoklT+kVHwZZJqPLeLRPtYBPqfHOkL5zBcgA?=
 =?us-ascii?Q?quHXXl/lkCfW2MTzXM/wvC+60FsasMMpf+Dg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(30052699003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 22:14:49.7963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7020772c-b575-4b37-02a1-08dd6d7cca97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
---
v2 -> v3:

- Remodelled as ACPI driver to bind the device when matching
acpi sensor device is detected. This eliminated the need for
dmi checks for platform validation.

- Added software nodes to align with camera device-tree format
to capture the camera device properties missing in the ACPI.

- Constructed swnode graph in the below format to successfully
parse the endpoint node using v4l2_fwnode_endpoint_alloc_parse().

OMNI5C10 {
	refclk = 24MHz;
	ports {
		port@ {
			endpoint {
				bus-type = 4;
				data-lanes = <1 2>;
				link-frequencies = 925MHz;
				remote-endpoint = &ov05c10_refs;
			};
		};
	};
};

- GPIO sensor lookup is moved out of this driver scope, it is taken care
in isp driver module init.

- This platform driver is specific to AMD ISP4, hence renamed driver
name as "amd-isp4".

 drivers/platform/x86/amd/Kconfig    |  11 +
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 354 ++++++++++++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c3e086ea64fc..4b373edd750d 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -32,3 +32,14 @@ config AMD_WBRF
 
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
+
+config AMD_ISP_PLATFORM
+	bool "AMD platform with ISP4 that supports Camera sensor device"
+	depends on I2C && X86_64 && AMD_ISP4
+	help
+	  For AMD platform that support Image signal processor generation 4, it
+	  is necessary to add platform specific camera sensor module board info
+	  which includes the sensor driver device id and the i2c address.
+
+	  If you have a AMD platform that support ISP4 and with a sensor
+	  connected to it, say Y here
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
index 000000000000..c4dce3779543
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ISP platform driver for sensor i2-client instantiation
+ *
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device/bus.h>
+#include <linux/dmi.h>
+#include <linux/gpio/machine.h>
+#include <linux/init.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
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
+ * AMD ISP platform definition to configure the device properites
+ * missing in the ACPI table.
+ */
+struct amdisp_platform {
+	const char *name;
+	struct i2c_board_info board_info;
+	u8 i2c_addr;
+	struct i2c_client *i2c_dev;
+	u8 max_num_swnodes;
+	struct software_node **swnodes;
+};
+
+static struct amdisp_platform *ov05c10_amdisp;
+
+/* Top-level OV05C10 camera node property table */
+static const struct property_entry ov05c10_camera_props[] __initconst = {
+	PROPERTY_ENTRY_U32("refclk", 24 * HZ_PER_MHZ),
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
+static const struct software_node_ref_args ov05c10_refs[] __initconst = {
+	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
+};
+
+/* OV05C supports one single link frequency */
+static const u64 ov05c10_link_freqs[] __initconst = {
+	925 * HZ_PER_MHZ,
+};
+
+/* OV05C supports only 2-lane configuration */
+static const u32 ov05c10_data_lanes[] __initconst = {
+	1,
+	2,
+};
+
+/* OV05C10 endpoint node properties table */
+static const struct property_entry ov05c10_endpoint_props[] __initconst = {
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
+/* OV05C10 specific AMD ISP platform configuration */
+static const struct amdisp_platform amdisp_ov05c10_platform_config = {
+	.name = AMDISP_OV05C10_PLAT_NAME,
+	.board_info = {
+		.dev_name = "ov05c10",
+		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
+	},
+	.i2c_addr = AMDISP_OV05C10_I2C_ADDR,
+	.max_num_swnodes = NUM_SW_NODES,
+	.swnodes = (struct software_node **)ov05c10_nodes,
+};
+
+static const struct acpi_device_id amdisp_sensor_ids[] = {
+	{ AMDISP_OV05C10_HID },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
+
+static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
+{
+	return !strncmp(adap->owner->name, "i2c_designware_amdisp", 48);
+}
+
+static void instantiate_isp_i2c_client(struct i2c_adapter *adap)
+{
+	struct i2c_board_info *info = &ov05c10_amdisp->board_info;
+	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
+
+	if (i2c_dev)
+		return;
+
+	if (!info->addr) {
+		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
+			ov05c10_amdisp->i2c_addr);
+		return;
+	}
+
+	i2c_dev = i2c_new_client_device(adap, info);
+	if (IS_ERR(i2c_dev)) {
+		dev_err(&adap->dev, "error %ld registering isp i2c_client\n",
+			PTR_ERR(i2c_dev));
+		i2c_dev = NULL;
+	} else {
+		dev_dbg(&adap->dev, "registered amdisp i2c_client on address 0x%02x\n",
+			info->addr);
+	}
+	i2c_put_adapter(adap);
+}
+
+static int isp_i2c_bus_notify(struct notifier_block *nb,
+			      unsigned long action, void *data)
+{
+	struct device *dev = data;
+	struct i2c_client *client;
+	struct i2c_adapter *adap;
+	struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		adap = i2c_verify_adapter(dev);
+		if (!adap)
+			break;
+		if (is_isp_i2c_adapter(adap))
+			instantiate_isp_i2c_client(adap);
+		break;
+	case BUS_NOTIFY_REMOVED_DEVICE:
+		client = i2c_verify_client(dev);
+		if (!client)
+			break;
+		if (i2c_dev == client) {
+			dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
+			i2c_dev = NULL;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block isp_i2c_nb = { .notifier_call = isp_i2c_bus_notify };
+
+static int release_amdisp_swnode_props(struct software_node **swnodes,
+				       u8 num_swnodes)
+{
+	int i;
+
+	for (i = 0; i < num_swnodes; i++) {
+		if (swnodes[i] &&
+		    !IS_ERR_OR_NULL(swnodes[i]->properties)) {
+			property_entries_free(swnodes[i]->properties);
+		}
+	}
+
+	return 0;
+}
+
+static int initialize_ov05c10_swnode_props(struct amdisp_platform *p)
+{
+	struct software_node *sw_node;
+	int ret;
+	int i;
+
+	if (strncmp(p->name, AMDISP_OV05C10_PLAT_NAME,
+		    strlen(AMDISP_OV05C10_PLAT_NAME)))
+		return -EINVAL;
+
+	/* Initialize platform specific props for each node */
+	for (i = 0; i < p->max_num_swnodes; i++) {
+		sw_node = p->swnodes[i];
+
+		if (sw_node->properties) {
+			sw_node->properties = property_entries_dup(sw_node->properties);
+			if (IS_ERR(sw_node->properties)) {
+				ret = PTR_ERR(sw_node->properties);
+				goto error_release_node_props;
+			}
+		}
+	}
+
+	return 0;
+
+error_release_node_props:
+	release_amdisp_swnode_props(p->swnodes, p->max_num_swnodes);
+	return ret;
+}
+
+static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
+{
+	struct amdisp_platform *isp_ov05c10;
+	const struct software_node **sw_nodes;
+	const struct software_node *sw_node;
+	struct i2c_board_info *info;
+	int ret;
+
+	isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
+	if (!isp_ov05c10)
+		return ERR_PTR(-ENOMEM);
+
+	ret = initialize_ov05c10_swnode_props(isp_ov05c10);
+	if (ret)
+		goto error_free_platform;
+
+	info = &isp_ov05c10->board_info;
+
+	sw_nodes = (const struct software_node **)src->swnodes;
+	ret = software_node_register_node_group(sw_nodes);
+	if (ret)
+		goto error_unregister_sw_node;
+
+	sw_node = (const struct software_node *)src->swnodes[0];
+	info->fwnode = software_node_fwnode(sw_node);
+	if (IS_ERR(info->fwnode)) {
+		ret = PTR_ERR(info->fwnode);
+		goto error_unregister_sw_node;
+	}
+
+	return isp_ov05c10;
+
+error_unregister_sw_node:
+	software_node_unregister_node_group(sw_nodes);
+
+error_free_platform:
+	kfree(isp_ov05c10);
+	return ERR_PTR(ret);
+}
+
+static int amd_isp_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ov05c10_amdisp = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
+	if (IS_ERR(ov05c10_amdisp)) {
+		pr_err("failed to prepare amdisp platform fw node");
+		return PTR_ERR(ov05c10_amdisp);
+	}
+
+	/*
+	 * Register notifier to instantiate i2c client when AMD ISP adapter
+	 * is ready.
+	 */
+	ret = bus_register_notifier(&i2c_bus_type, &isp_i2c_nb);
+	if (ret)
+		goto error_free_platform;
+
+	return ret;
+
+error_free_platform:
+	kfree(ov05c10_amdisp);
+	return ret;
+}
+
+static void amd_isp_remove(struct platform_device *pdev)
+{
+	bus_unregister_notifier(&i2c_bus_type, &isp_i2c_nb);
+	i2c_unregister_device(ov05c10_amdisp->i2c_dev);
+	release_amdisp_swnode_props(ov05c10_amdisp->swnodes,
+				    ov05c10_amdisp->max_num_swnodes);
+	software_node_unregister_node_group((const struct software_node **)
+					    ov05c10_amdisp->swnodes);
+	kfree(ov05c10_amdisp);
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

