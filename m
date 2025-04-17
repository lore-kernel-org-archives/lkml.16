Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54391CAA99;
	Thu, 17 Apr 2025 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914642; cv=fail; b=QtdrUNaOmlZHhOjdJu/vdokCpsNAyr3z20u4mGwLf6QyrmGd09nNKpaYGIyXZFh9YoQW0nS73DDODE/CoX08zTsJg2XYL07Dez7HUbosq04QpionCLGoQMbSwmCzzvvQmuA1xKtO1u2bGExly+tR+eHtRyRqhBF+zdD/95iXixY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914642; c=relaxed/simple;
	bh=TptUQ+xUbwQ7tSq0wm9GaifmTzbi0J/3rC4MuZaKm/c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EncoFI5fnRkNp6z15KbWftwJj1THsSo8KXvfhpuh/e7gHx7N7rnuLw31TXiYulyezbkB6v+H2nioIbLsCe1zBYI0Wd77LIePcPctbTaZcjwjkzSxlq70cPz9syv/7WKpm/rl2UdeS/cb+qry6XnloLcbtt4O0TMJ/Jd+HDr94Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hjj9E/sd; arc=fail smtp.client-ip=40.107.96.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hjj9E/sd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBlEvT+Ax5VW7bQspp1VsSZZ0hl72dzdWImpdt76rlGzQMBm9JCoSckfTDNJni0dZep5txQsxp/Y70bMEYcv09mOnxFmtxic10EA1K6smYsUuxyMrjAf1+I13d7XoHd/sTOzdX9DQWwz4U6XyIHMZEKuQdR1V3nTbDj5zqw71nGxWK+Gdz6MmJjf1Q/hTBlUb0Et3Hm83OS2VattxaefkrbpVym5jfDYbQ2Vkh8/j3i2LM3CbMv7POHjlrpN3IT511OruEZ2PuvbIqH1EpN9JnQYUoWO6m5DxNaFqeT/mSvTt3LlhG3+SFL7BCJlrsCIkwjXphqf6UYorxwVBzGQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKk9D/wxfHYfGmc2p0vEjBjSrg/FB58yp13njw5Tjqk=;
 b=jNnbY3AEwL43twrUBNBfN9U+dJX4icKOVQ8Xb3dcJ91eUisAtZB4BKYE3awymxAwfP7ow5bOuDD12uWoQVoBf4WJ9IS8pximp/d3pgoWEwMVjI0fMuW0NFAMvFHrqmkrO8stJEe+hzoK/h2ckbL+JAs5v7lO3LdftSnOkmfOE2zLBW/ETQYl9yzqEMZ45Ii7WVaCin8s36oOIGRuIpH04bzAL9gay362Py/Pn1iJnnQOMgNdwvbRAgu8xWakIKTXwkihEPOP8jYNanDRVEny9+JmgsaW1D1j9fb6cTpJLAtx5tmM0utxJTKGl10LaGbrDFvSS1ay7lHSZo0dDZKP2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKk9D/wxfHYfGmc2p0vEjBjSrg/FB58yp13njw5Tjqk=;
 b=Hjj9E/sdlQ0NAv3DLz0xKjvZU7NpwAYzbXJqEJV6fidapn50n8ANKBlONK6yb0OzZ1HQO7c2V52zP40idVQPhhiji4Uqdwo5pZzsoB5BkMq12ZJDHyv6xhyJBiy6x5tWEg304p9dlsWjaLFhltsWjoaPOTOjzBzuW5O7JGf8D/8=
Received: from CH2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:610:5a::15)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 17 Apr
 2025 18:30:36 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::22) by CH2PR08CA0005.outlook.office365.com
 (2603:10b6:610:5a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 18:30:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 18:30:36 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Apr 2025 13:30:35 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
Date: Thu, 17 Apr 2025 14:28:08 -0400
Message-ID: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: f853dc14-985f-4d25-a82b-08dd7dddf23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H1Jlo+sQ4h6WY+3hhkobuwzKJryBp51Zep27mVJCtmZKCHyyLjXH/ShHE+l5?=
 =?us-ascii?Q?rtVhUZ1TdlDMV6E58ghak3c/5dWW+lrMM6L3skpPO8JgAAlpLoAKwxGYfsJC?=
 =?us-ascii?Q?LT4UvbxuIBWih3oX6bkEYT4fVXndBDU5d3QHYJFOE4WEwtkEbBIaJfrZ65Fh?=
 =?us-ascii?Q?khqXrF/yaTK1Hhty8Mxiws/qaRSdOAX85IRaXQz0opwhFoOMTF5WaNBJtXk/?=
 =?us-ascii?Q?YhNuSAoli0WCEqR6UsCbMNTeUyyALxGaf4RN12Ku86/AaEM9wL3t/92ydRDr?=
 =?us-ascii?Q?rA25CpyU+HNiGTAVbh8j3RecV1BtsiDSfFTAfGbSCyD6be3n3f/LaAHETB5I?=
 =?us-ascii?Q?52CFMNZsb6wbcvioitZCRRklFfR4O7p5Hj6H8JqsZ9/gagesp16aRLtwm2db?=
 =?us-ascii?Q?Fpfo/NWgzqhDlFZWMI3N+gA+fWotp+a6XeeyWimn2eX6EgGjlrX5NeegIrlb?=
 =?us-ascii?Q?KGa7lXkFTsv5xGIgGm7zq2Fumj74Uj/k0j+fSkmZ/CZvr5anXjdT4AFlxUP2?=
 =?us-ascii?Q?ZMxJBUKFCS3kdBwePi+/gy0+3wCTSoA7W3ptDHZ+eMSFWCy//RcVStHvigDE?=
 =?us-ascii?Q?cbsfLBQiJcYZyltxTPoC3seP3+twDSthtNIz2PyIi3OuXKZ8oCj4nsZZJVh1?=
 =?us-ascii?Q?zWJM++GEjXoEQ/X2r0BpjS6kTAGsTwPpNUjpCsbjXt24t0g2QuejG5ZGnUcj?=
 =?us-ascii?Q?I4C0E2wt738GhOY8twkHJkkN+kmxzCq2lOD0nvYPBXKRe95w8mJ114CZKOlj?=
 =?us-ascii?Q?8BBZcuAZS91I4tiABn1wC847bEGRYhynnqRXo1Bt+C+HPhjG1TMxsZzf9aTW?=
 =?us-ascii?Q?tD0JJI9uHsC020Ci4hy4uRm4D/9wf013mSvWvrTDcFpGP6/BM7G1JLlPt9ey?=
 =?us-ascii?Q?NJa1SbyuMc+/KlNo+XQ4oo+Cpfs32pTEQDFr/wWMpcsP7CSaDMPLrHl0HQlC?=
 =?us-ascii?Q?XpuxJhYSeKjw9mgFM5Ah8Pvq0eWV9KaJi2NUtY48ppdN3YsQMVR3pq/fEsy3?=
 =?us-ascii?Q?IUPSGiuR/zfPvYOygIKOqtWW7E5afJf1fyzL4GSokY9U9Ztpcdawv6FyaizX?=
 =?us-ascii?Q?vJp2XgM4EMrcCseZIe+A365PsGttkEEzuS/+oPXzCBiEkf9Unfb/ssAMwoCa?=
 =?us-ascii?Q?PsErH/d0t4vncEwAbbhIpqjqdv4lzOj/+wvsmboUqlgnc+v30o2Wom3AkybQ?=
 =?us-ascii?Q?H5pyNGEhznz8TkOfQNQOYejxOZOg0EbaSH021XxSmCQb2MU1YwFOHHabKufi?=
 =?us-ascii?Q?BedjLSEpftRdgvt3qjrYUJL8bvFK7ps4q9gZ/ui7RnPqa6MT5gVihL6gax4n?=
 =?us-ascii?Q?vrVT3gNOBfhtjPjDR1KPFBsTTWz5dh4OkKx2h95BY923LFdq3PYAp4zxZ0TM?=
 =?us-ascii?Q?aHJz7lD8tNp04PAuSotH3vYVP8vOJLFkPrVwqA7yduudK4uq1CqbNueDSLua?=
 =?us-ascii?Q?hW1N3eeD5mEJAbggRlv+/hX+FtISBAw9jdxvj79ebYFn9Xtr5KuefEtwxY5S?=
 =?us-ascii?Q?BTcxVsfdi8Emv5jbqscYkDBxwIL7g1ZYJy46?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:30:36.1215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f853dc14-985f-4d25-a82b-08dd7dddf23d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v6 -> v7:

* Use devm_kzalloc() inplace of kmemdup()
* Use IS_ERR() inplace of i2c_client_has_driver()
* Remove the extra cast

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 269 ++++++++++++++++++++++++++++
 3 files changed, 281 insertions(+)
 create mode 100644 drivers/platform/x86/amd/amd_isp4.c

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index c3e086ea64fc..ec755b5fc93c 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -32,3 +32,14 @@ config AMD_WBRF
 
 	  This mechanism will only be activated on platforms that advertise a
 	  need for it.
+
+config AMD_ISP_PLATFORM
+	tristate "AMD ISP4 platform driver"
+	depends on I2C && X86_64 && ACPI && AMD_ISP4
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
index 000000000000..461a10be5ccd
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,269 @@
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
+	const char *name;
+	u8 i2c_addr;
+	u8 max_num_swnodes;
+	struct i2c_board_info board_info;
+	struct notifier_block i2c_nb;
+	struct i2c_client *i2c_dev;
+	const struct software_node **swnodes;
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
+/* OV05C10 specific AMD ISP platform configuration */
+static const struct amdisp_platform amdisp_ov05c10_platform_config = {
+	.name = AMDISP_OV05C10_PLAT_NAME,
+	.board_info = {
+		.dev_name = "ov05c10",
+		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
+	},
+	.i2c_addr = AMDISP_OV05C10_I2C_ADDR,
+	.max_num_swnodes = NUM_SW_NODES,
+	.swnodes = ov05c10_nodes,
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
+		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n", ov05c10->i2c_addr);
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
+static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
+						       const struct amdisp_platform *src)
+{
+	struct amdisp_platform *isp_ov05c10;
+	struct i2c_board_info *info;
+	int ret;
+
+	isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
+	if (!isp_ov05c10)
+		return ERR_PTR(-ENOMEM);
+	memcpy(isp_ov05c10, src, sizeof(*isp_ov05c10));
+
+	info = &isp_ov05c10->board_info;
+
+	ret = software_node_register_node_group(src->swnodes);
+	if (ret)
+		return ERR_PTR(ret);
+
+	info->swnode = src->swnodes[0];
+
+	return isp_ov05c10;
+}
+
+static int amd_isp_probe(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10;
+	int ret;
+
+	ov05c10 = prepare_amdisp_platform(&pdev->dev, &amdisp_ov05c10_platform_config);
+	if (IS_ERR(ov05c10))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
+				     "failed to prepare AMD ISP platform fwnode\n");
+
+	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
+	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, ov05c10);
+	return 0;
+}
+
+static void amd_isp_remove(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
+
+	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	i2c_unregister_device(ov05c10->i2c_dev);
+	software_node_unregister_node_group(ov05c10->swnodes);
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

