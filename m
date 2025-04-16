Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D51E9B04;
	Wed, 16 Apr 2025 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830896; cv=fail; b=dlDd8uvkAH0KHFA0jfHYe2vu/QU/S07+JLbkqCGRH/s+39ghz8FumDD61rLztUy5pV095aQEepqDK/nemlnImH9ymOdQmkUaxEX2ZRIqr+LYHjtaC5vZMpNo9MbXcUeoY2A04M03PKoIlg7ZpopKpj/ZWEkHI8bj6LMBCrEz4rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830896; c=relaxed/simple;
	bh=9W3YT1nmZxZ2zlDV56Pu5ArLgrKUtuRomvocEWfXFLo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AAlxCVUTw80/HUIYwAVNpuX4JpkdVuU9fwCedPvm0/t8wziGQvrbC4w7lyxAnzO9gvboTvGYBydvnpo/U08tJ2f0dAS7f0JeSSmBustj6RDs75NIyJCz3QeynI1fKfWOQ/NV1QHH0+2Nf01MnhYAjnhJcwHTsQuLf7rd2AZ/kbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OoIaQsb1; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OoIaQsb1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkcQfyWD67fFvSrtaXVdrGyEnDzKty4PSXN8IYH0pNuz9yHVN2xL1mizTM5/Zbvhkp0tcN8CjgQgtsUdXIXOvPzKgjB28ey4coHo10gRk1XDQ7L2stWee8mb0Sjdgxg1a1u+7oX4VVy1e6gmBUO2d5eiYUDAqMQqUKZMypIzu2zQLyHR/hNS+G4gpARR87TKQHBqHnhoQ+u/GnW7AhpOWbgRQ4OabSPjSJ6NLRfvCGq4Q5xA7stw0pRRUxpJ5OWeEOH1xL8jXA595VTOEWuxaxLJKvMGHuGwSzyOrZ3khebo1TjVxyjEMLTsEVkI9zfjjo9xUmxNhXjY/iY55nKW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGYM60oDwyADSqSLL+tMAQUGb4HCGLDYOkBtTrrek7k=;
 b=MqUrrvhCEKtd3w3ly1mS5lpV007fzMeNX32Vrgcx2RSfqsPo5PnZ6s18NPH4uiBy0PRl8UNaIixAen4tF3gFe1XD8NVpQUo8kfxQXYKgfUdZ3Kqgoq9uPt8x86JQRv+nMFhG6UqUH/IKk/Apo189A/ewGgQv7k6TdxH1VElI4hdXhr1EUTRj00wEEDgWiKtf1lmfkh3bYPnZvt2QCMGLHQRNGdghzkOBBIiEBGDpwHkSvF8KMBbQVRUhaEIYdbAPhd5ohAVRm+ZGUT1upniU/FkE5F29VHdHBGqBdYOjXWW2ZEoaZAiJSASPG3xoyIuYggqSBK6H2XzGjmmUIeCsBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGYM60oDwyADSqSLL+tMAQUGb4HCGLDYOkBtTrrek7k=;
 b=OoIaQsb1yfRHGaJsisjBvMEdJkP0ANiSxkACwVadDGLStAQ7TdNzPq1/YtqsAm48oBMp8hjOvF6hAhxj9LD4q6V+9hL77YTZoybXiWptxO2xuZCnMf149Ap4xfAwaPYEQ3BsxhEMmJUOikBt2uMYKVq0ZJMUErU1OhqXaP/QuAo=
Received: from CH2PR16CA0030.namprd16.prod.outlook.com (2603:10b6:610:50::40)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 19:14:47 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::9d) by CH2PR16CA0030.outlook.office365.com
 (2603:10b6:610:50::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Wed,
 16 Apr 2025 19:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 19:14:47 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Apr 2025 14:14:46 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v6] platform/x86: Add AMD ISP platform config for OV05C10
Date: Wed, 16 Apr 2025 15:13:10 -0400
Message-ID: <20250416191411.1482060-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5cf7e9-c866-413e-7d2d-08dd7d1af3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|30052699003|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2g4hsKJA4ZntidXG8dpDILRjnTM4w8WVEJbSuYKyKLZWNilypASdgm/lTUUl?=
 =?us-ascii?Q?2F6wiDlrqR0H4SPNmUW9WhsY+Mv5nd/H+1fePRKHk+M+IR3yz59SM+S5l9Op?=
 =?us-ascii?Q?M67SwHAhH9EQbDZDhDBRegoxmN84S2hrGRSFWZBuMS5u4aLM24djCxk5OlE4?=
 =?us-ascii?Q?4qHQ1P6EgE04l0O9Ja0Yu4SZ2Ydk0qd7lF2L5xgCd7APeE5RxnviQINrhVEp?=
 =?us-ascii?Q?AmHOPza0ofs5UrLDE9h/TajYVPhy/sK9TH/HumIDoSlS1VRab56B4xzb4mzX?=
 =?us-ascii?Q?R4CcGIZTUzylf3CTCqCAX36hbmb6rZ5MYv09MqQsQXVGmJiNPEOLzDZLiiMi?=
 =?us-ascii?Q?ZQn0h5GZx19i4zS4OZr6OWmMY1D8cj+QfTycirBa6HjCK4yQcdyUhOWZEE8C?=
 =?us-ascii?Q?raefq2QFn5w5uac5dDfrE7rUQAA/2I6a2Uwt16/yWJsxLgq/Y663vC06dlnT?=
 =?us-ascii?Q?+fOHgbkl24/5wHciHU19pDi9D4920Xo80ToOtuQrpAaL9I/JtMFfmUB0f+h+?=
 =?us-ascii?Q?8N0SMXwAYf8evzKJuTqHNf1KDhKW8MWMaMggySJA6mt5wxpnaZC02Gy12lZE?=
 =?us-ascii?Q?a+htq8CyUCl9namnccHhYe1Ed60UNu84ZLi1bvbjrctC3hw8h/Vi0HPTBw2D?=
 =?us-ascii?Q?MlItl7p10oRWR+Ohu/N9nfd3UsE4rSTqRON4VFRxhBgP/KigVEstBJlrwinj?=
 =?us-ascii?Q?n3v/eIbV6+HG2TnFn8dVRWovdezlKnUMBtHzI9z10GpLVwJTqdhraJCIeCkz?=
 =?us-ascii?Q?TZwdZAoPTidOKrneh2xV8R0GX1g9R1OdgK3oYgKRawDLw9i4cgw/LVeohalu?=
 =?us-ascii?Q?KI5JvQYnPsMsOmfVP4aIdzhG71EbxhcCKsdP8SmLQpabqfBRiucWpyRl8aru?=
 =?us-ascii?Q?mYYY+Sy8vseIeLlHlW7VvbC6DWRwL5lGnfizt/VCSki0rB7g5wzkDgo9ahSq?=
 =?us-ascii?Q?WxJO1c9p2iYZrcwFBg6ux5GkTq3gXsLIPSURoNh41FCec+ugSvqG7je4B2T5?=
 =?us-ascii?Q?zbZpeazSv+2HsoTlsahZXdCZZSc2l+hlrtw1gwsoiiUEmInBT9vHNx0RtfNj?=
 =?us-ascii?Q?H09sFHcVtqEKGZXAXwv5tgTV5M9mz2Y2cvwm0oWRw61LdjN9iCepmViK68mk?=
 =?us-ascii?Q?tkbQ1MYmO8m4GMIqPjSfMVPwXAS6vGAJqyfvp5tRMkLipi5ZH3NiJaM16KVw?=
 =?us-ascii?Q?WXdsK2K/Zq35+mPMV16755F/suw7lMSRJlZUgCSzGg5ke3TQ3HmF/sQqufjw?=
 =?us-ascii?Q?FaZfL/Iz7Eny7XHtI3ZqkF27grc11LYXS2L/msK6qc4WY39EN/OskON5JyWW?=
 =?us-ascii?Q?BY7C2gyomsdMk8EzOnZtaPiMHe1KNm8eEBoqxDQU9WaGgiCMTaEaafWYQVAQ?=
 =?us-ascii?Q?lPHl36BXEnxDuRzDgusfigM12LvNZEPRTTq9HO1CEYmh4xo2zJUnjnAaLor7?=
 =?us-ascii?Q?YDma3q27juJ3vNNpUfJ2PTMLFeCT7TXw282LJ0kGsal7uSX0NQmPzy8crz4E?=
 =?us-ascii?Q?HdZTqVG3LWNfA0egpCmR18b1ymU6vdv2CGcC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(30052699003)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:14:47.0247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5cf7e9-c866-413e-7d2d-08dd7d1af3e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v5 -> v6:

* Cleanup header files
* Avoid unnecessary casts
* Fix coding error with software_node_unregister_node_group()
* Use i2c_client_has_driver() to validate i2c client handle
* Address other cosmetic errors

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 278 ++++++++++++++++++++++++++++
 3 files changed, 290 insertions(+)
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
index 000000000000..9d1abbcc915f
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,278 @@
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
+	if (!i2c_client_has_driver(i2c_dev)) {
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
+static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
+{
+	struct amdisp_platform *isp_ov05c10;
+	const struct software_node **sw_nodes;
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
+		goto error_free_platform;
+
+	info->swnode = src->swnodes[0];
+
+	return isp_ov05c10;
+
+error_free_platform:
+	kfree(isp_ov05c10);
+	return ERR_PTR(ret);
+}
+
+static int amd_isp_probe(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10;
+	int ret;
+
+	ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
+	if (IS_ERR(ov05c10))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
+				     "failed to prepare AMD ISP platform fwnode\n");
+
+	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
+	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	if (ret)
+		goto error_free_platform;
+
+	platform_set_drvdata(pdev, ov05c10);
+	return 0;
+
+error_free_platform:
+	kfree(ov05c10);
+	return ret;
+}
+
+static void amd_isp_remove(struct platform_device *pdev)
+{
+	struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
+
+	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	i2c_unregister_device(ov05c10->i2c_dev);
+	software_node_unregister_node_group(ov05c10->swnodes);
+	kfree(ov05c10);
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

