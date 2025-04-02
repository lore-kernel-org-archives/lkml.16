Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75711CBA;
	Wed,  2 Apr 2025 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743634647; cv=fail; b=RxpZKYY5ggyQJbnLfRIcUfthqMNCfXNMYLPBn/hnvQBDuwDqJLug9IqoaexrLETPbmMHcZyLJdhlK6R6R+MnULDTBaVHUKk22biMOKbjKCJDYeksiMIki1jRZuSq0JaVdyyYBwLexAZwoM7Vw2VbzPFT/d0t912JnIxYsxlJrHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743634647; c=relaxed/simple;
	bh=/DT5YW4Wk1xcGkNqKDse5InGaXwvOmZ2GDFh7wXomS8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=atUKapg1Q+QnwXvzafYQMUuxVg+4YcNotsSeY5qoiJgExSepM0hTOQ5/91brsfXPaEZ2fRruUOMAHyt08oHcsQP1f4HOco8dBihmOeXhyAHrdxkUWd7BbjMIJPeNJnsgrYweWWGFidZBt6T2/5YL/T6KCjrtnEqkKmK4srhkiTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3/NRJUYd; arc=fail smtp.client-ip=40.107.94.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3/NRJUYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9RioOBh/wWbJqjSuGMfS7RxOIWFmGWTD9TRh1u8mOAmwhi8B5iagSbJgpkGOOE+EKj1qaHNQxgx/lHLnaqMYwpyJE/Vd4x90ffaLnHiUtgwGcSuSLtFd8TD3RqNs3vYVz6S72xPTjKri5qiLiPcOvm3cUuRkzp5aph6mjlsaxLqY8j7L1ZszqMdUc4b5Q2e2WuMcEyEmMLNJmgEcGiMw/mPq3I4BG6Vqz3Zo+V0mt/PtXdHq6xTfFfRCFsmjPjfRHfLhiPNbzeOV5R1mFRXDjONUOFbcIhIN/0NngQmjIn/ehqLYO2dFFvlffYYr73xruiQdh192hTsKCgBSRTNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqTdAfEqnyMLqH2MwK4zCO1AXZsV6j3SJXJlGdp+7qQ=;
 b=Z5jf6xr47TGuyNacxqGZ32HbwYb4ynt2wN9PM/SxWyqixUEPV17jk+eLQQvadeQjZl4OvVmQhlFhAjqWtHNDBxbGRS6GzXLmI3ihSNap/eIesoXM2HhO+zQwFTwldAf9Y9oHf3nOzIdeH0WL/rACrR1jPZXV9X7CXzD5pAFyIUcZuEbHsVqDqxGODQMQr+FhNfa6QlEAz6/WNjzO8f5ia3TOIkvcn51lsGjPA7s4PFF5MVwQockmUvodkhHqCng6/e8XZOkSVnjYP4dzVz/XfjK/2IodVA0nVHWX0HVOB1HL6TEPa1WjGic70bJ3DS3k4b8fV6V8mSaZkZZJQV7T6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqTdAfEqnyMLqH2MwK4zCO1AXZsV6j3SJXJlGdp+7qQ=;
 b=3/NRJUYdL3KW8EHXbPFS87v+255uHy1i/0R2CjReXFxNK5FpeN7na6cPulsGQn+dDkiY+64X4JG7VaZ9/G1xZM0PR0qlriGn9pjYVf1gS2HFogZzpirFRIjiqNd+8kAP4w8CHr9AJ+iLI74ppm/Zoo8tpCEuAGVJn95i333tsmo=
Received: from SA0PR11CA0054.namprd11.prod.outlook.com (2603:10b6:806:d0::29)
 by DS4PR12MB9561.namprd12.prod.outlook.com (2603:10b6:8:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 22:57:20 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::e0) by SA0PR11CA0054.outlook.office365.com
 (2603:10b6:806:d0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Wed,
 2 Apr 2025 22:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 22:57:20 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Apr 2025 17:57:19 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <grosikop@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v4] platform/x86: Add AMD ISP platform config for OV05C10
Date: Wed, 2 Apr 2025 18:56:53 -0400
Message-ID: <20250402225658.4003616-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DS4PR12MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7583e4-807d-4381-b3db-08dd7239b97e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|30052699003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGFAdHCC+w5k39QKNKtJo2S6fzL/+Ac5Rvx97T3ZJXqv7aWZuUHKJZ5Zywjg?=
 =?us-ascii?Q?eEBQHcsDUtH38pE4BpVkgyftN1uEYyudmE04R7s5wj+FBmEMtcc3VDwc6KwR?=
 =?us-ascii?Q?UWB+kAtx9Isj7j6Qdz8pUoM7glVg2DeLF5t/YxLIVCktbO6LJv4e4+sUhIPv?=
 =?us-ascii?Q?TkeuMHiBi2dw/m0W9p5XD1lnLyzcZiPR9CSVDyGkfWF3G268B3AU/eiIXA+w?=
 =?us-ascii?Q?WndfvPfd/z05wFR7CrCZPuNZZXqE7WCMlE6FuNOvlIPbpDAU20Pj2rlJy0Bq?=
 =?us-ascii?Q?IfyeuDNsRy+5pohWvs/ubOPwplzZwW8dVgUOjmUWZNrdGSLawxFhKyzXh2N0?=
 =?us-ascii?Q?POJdanH2Ko3IA/OBV2GTWmD5VQpUlpfPxK/MA8ReedcF0plRWv7Kombesxrb?=
 =?us-ascii?Q?AZCnGD6VFO4NQsijyDQItZsOUjJBWG7q44O5vNrP44ezG/ElKsYdyP+kwr6H?=
 =?us-ascii?Q?MSgRsG3KE4zIt3Hl8iWUysSOK3UkGtcFOXgD8Ev4EKJAZ9pIWhS5ZtzO0taf?=
 =?us-ascii?Q?YPEgwxd7l4AvACj6UnKTkaPYKbgV+psIayCWWG7wws3G7xlRH1pRA8kraFVE?=
 =?us-ascii?Q?JIBCdIVe0IOhvQbBtmsb3AXObWZH8erfFdxQHWOXZAKGvbKouTTdUf6h81Jd?=
 =?us-ascii?Q?kXK9qjnTi0ElSG1l1ako2Ft5yD401dhQG3oslroX2ZISxCB+ARkxxARi5i7Y?=
 =?us-ascii?Q?CsdwdUISsgiCwregIrEgwDwWygcj1LnvLyApc91JZvHt6Ej72LvTeLzloede?=
 =?us-ascii?Q?DC8ZwKaPbprVwLPvQtHNDqzTzoZ2LzF328rkBb7XdccG0c6SZWak5ujBX3X6?=
 =?us-ascii?Q?ZW28bUV1XAIPfAKW3jGMjKv+Rg1dxC3m0UGiKgzkbsMfZrv9+xr501pS4hK0?=
 =?us-ascii?Q?G9vDVmZNmLbypczNM0mZu5a24fZouFvtlTF286QNnyPBypMa3dPLU1QlkdGN?=
 =?us-ascii?Q?aVLEaKITtlqfEkasNzg1X2V8nsca+hRJqD7CXGnOjPWQRPP2r1VK4M6BTz6Z?=
 =?us-ascii?Q?SH1T/p+pWC4I/TAcFRN7Wpff/kJkPmS+yutiRRi/jIf/ym2tq2Z1eD+7GOr6?=
 =?us-ascii?Q?QJvV90ZwDt8XNXeq7EDHn63oBx+TMTJBBWGuE7a2dUjdMJexbhG7aen29Qsa?=
 =?us-ascii?Q?Xqk5gGrvPH/VWPFTD5P12+u3L4tKqRJRLxELXsWpxZoxyNEECF/sMcrttLYt?=
 =?us-ascii?Q?HSmv5On4QY6lnIYvsNUYVDNHmdE7cIt74iU7r+AOEXG3gj8Rz+5f0EZ0XQ5p?=
 =?us-ascii?Q?3m2BgC1dOjRnn2mxJucnJTzCCogg7f/Mws7owpfpcBJWYw1Ju21l3PCXhuc8?=
 =?us-ascii?Q?q+mIK1XpcbVaBjB57l35+D9JW1Z7mVG5shM8RFi/6ekQU+hkD7jM/aoTBoM+?=
 =?us-ascii?Q?wMFkWyqgS7TdQFKPK4YJGEEmFwU6qzXY7S9+oMblqXnfxUP3a9ZOFmCFiL6s?=
 =?us-ascii?Q?ZpXPLxd3Ks5/QE+7hxKmdTBWVavqj9L2DQWJnNAyd5CO3KpvkKVK7xcw3bL2?=
 =?us-ascii?Q?oK9Evexutfrmcu4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(30052699003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 22:57:20.6644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7583e4-807d-4381-b3db-08dd7239b97e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9561

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
---
Changes v3 -> v4:

* Updated AMD_ISP_PLATFORM as tristate driver

* Removed initialize_ov05c10_swnode_props() and release_amdisp_swnode_props(). Its
because page fault errors observed on accessing the variables in __initconst section
when the driver is loaded as module instead of feature-builtin. To fix the issue moved
all property_entry vairables outside __initconst section and also skipped
initialize_ov05c10_swnode_props() and release_amdisp_swnode_props() as they are no longer
required.

* Address review comments.

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 297 ++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c3e086ea64fc..0281c4286619 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -32,3 +32,14 @@ config AMD_WBRF
 
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
+
+config AMD_ISP_PLATFORM
+	tristate "AMD platform with ISP4 that supports Camera sensor device"
+	depends on I2C && X86_64 && ACPI && AMD_ISP4
+	help
+	  For AMD platform that support Image signal processor generation 4, it
+	  is necessary to add platform specific camera sensor module board info
+	  which includes the sensor driver device id and the i2c address.
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
index 000000000000..0b52042d92ce
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,297 @@
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
+ * AMD ISP platform definition to configure the device properties
+ * missing in the ACPI table.
+ */
+struct amdisp_platform {
+	const char *name;
+	u8 i2c_addr;
+	u8 max_num_swnodes;
+	struct i2c_board_info board_info;
+	struct i2c_client *i2c_dev;
+	struct software_node **swnodes;
+};
+
+static struct amdisp_platform *ov05c10_amdisp;
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
+	return !strcmp(adap->owner->name, "i2c_designware_amdisp");
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
+		dev_err(&adap->dev, "error %pe registering isp i2c_client\n",
+			i2c_dev);
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
+		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10_amdisp),
+				     "failed to prepare amdisp platform fw node\n");
+	}
+
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

