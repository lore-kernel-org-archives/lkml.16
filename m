Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2083.outbound.protection.outlook.com [40.107.212.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF9E22AE76;
	Tue,  8 Apr 2025 20:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144434; cv=fail; b=mYR+L3R1BaBD9eyo9pmuARRDmgvC4xq2j68Dx+mBIIpB9hUUDmxSTe04+sRiFUa51rV4ytzE+Y8SA5tB7v+DhC8vGeeNOYdHomOMDxfwFiEy20aEUaItceFNsPb9j8I05dTh7T04HDBfSzkidNp0cS1r/RK47S98efLmRL9ET0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144434; c=relaxed/simple;
	bh=cbzOG7keI6K9Vz+sfxoshkHAU8PXqxn4caX40POlupg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qXML0NLfutXZ/3jkX2fkSyBqZSGfz3+aZGyVKs0uQ/gSymVW/kfxNhXsQ2eevGiD3EbUlaptuaXCvm4EWxzXJ5YnAdxJgOoijrG8u3qPQpyyvZ72lVU09d9rbuBFbeAFf8K7k6pRXnvzu8Ak4Ja6uV9/wKLr3+Sf14IjaQ/866U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wYLKJHgT; arc=fail smtp.client-ip=40.107.212.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wYLKJHgT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F85LZ0NVKBDpU+Kjcsxfmvi4lA+Zhr6Gcki8mzulWw82TzIZGfAfndwNW2YsdBD18mOO9FSA+esvB2Z7axhpFiVoA1cKgDRCdVocWa5p3dho+k+bPbMeJqQBpQvdpjVV7qH174Z4xqMQVsi3ubgEE1mSn2E5qdREafLcuKwMs0eVPngqHbfuZLEXEgMqqoSpq7Zql4x7cV7var2Z0if5hxyn6SEi/h0f9jHkF8+jxSfK63ezYjtCW4I7xutHSanXMVEhtY6zbqWfFY+dEV1dB2DOhjKe6X1TD/F3fUowU4naN4V2KQzeZfyuzEOXTAES3KoBdshWweu7Fjr0wqoU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgTdrECgsx4gWsjszA45Sv9GywfFfg/k+MHb2my1MlI=;
 b=fWkd/clBP13exLFCpYUIZbOLbwMseTC62Jts5/fZjGrpQ788ouXYd11MkMj/Fxs/lb2uxVViLDDBVVTY5X2JEkrr/aT/7AFxmz2jAkkqqiNa4lfaZ1l7K1pnDpDN6Ae7cur2B0DE6Tlh6Op73w5+h5NfvdR6eh+njgOZSs9BYGTqv7yPvPMnuF5VFRf+gJNcYXlU0H2mwqz8h2n+MKduUczvZn2xTX0Pi8IfM3FYCt4wbXhhP4miTxU3oyprA0MfDeUaj7r1V7kRIWdPnY2JvkL7DPrXds20DtLL1gjbKfWQtHApyHwn7hlxc62eyunKxc4DCJdKbvlAUSQagXhERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgTdrECgsx4gWsjszA45Sv9GywfFfg/k+MHb2my1MlI=;
 b=wYLKJHgT4Td1RtH23hCQ9cFYJhU/o7TqXi7+G/BAmHBQEyWDUxFQokSu2TwYsWTY+EqN5cyfTH/Odx9IIxLf0ltxCDWbdt3xmZvx+b5E33dRLw1getDHJakwv8KyBBkVOupdsCBcZif46j8IDaM+1zflhpJdavsMkJuH2amvYLw=
Received: from CH2PR10CA0023.namprd10.prod.outlook.com (2603:10b6:610:4c::33)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 20:33:47 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::e0) by CH2PR10CA0023.outlook.office365.com
 (2603:10b6:610:4c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Tue,
 8 Apr 2025 20:33:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 20:33:46 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Apr 2025 15:33:45 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, Pratap Nirujogi
	<pratap.nirujogi@amd.com>
Subject: [PATCH v5] platform/x86: Add AMD ISP platform config for OV05C10
Date: Tue, 8 Apr 2025 16:32:47 -0400
Message-ID: <20250408203330.801792-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|DS0PR12MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: d575de2a-8d9d-4b7a-acd8-08dd76dca9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|30052699003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nqu2pp3fU4ErnLTQpHaRMIfoAdUlkslbWd91wZAfmrrrWzpPS+nJD4mmA3jK?=
 =?us-ascii?Q?zmBVLm/L2pknZ44s5aZvff+JPjqOXG9OKWI4WqYdS+VRXCUfNau8WyHHzQsH?=
 =?us-ascii?Q?pjQRYU8E7sBsYeFaRLJqg5WUbw+SAxhfOtOrfBVsw2gBLouxunMogF9WnO4h?=
 =?us-ascii?Q?IZFBmQIhg2AZjNhEYH+BHmSCLXlhE/cKIkrJILTb3kKzIQlbI7ETdJqfbO39?=
 =?us-ascii?Q?slFukQO1ozE+0h85taF3hknEQUPdIFu6iDzN/0gA2xfcZxbU5LgnX7bybWna?=
 =?us-ascii?Q?dKQJpQA+Qz2FBMo9ONEthc18flgl2pwwS4U68zWhvTNj5PMQyy4/gi+DHi86?=
 =?us-ascii?Q?Jus2kPf77C0ejlDU2H1w+d6GJV2rpq7FlycZWAhJ4tazkASBwTzc8RLW0Hs9?=
 =?us-ascii?Q?iQYNAam/0Wh41ypo8O8pcY4Xt8ZFPgtlJd+a1wJU7T80mTl5HmndeH8VWXJS?=
 =?us-ascii?Q?A0lYn/lvoyQTUjOdKIs0Zz40gGssD+mGPXvigxAoCSPmrORZxOhlFVkLRaAD?=
 =?us-ascii?Q?qVtkN4aLTUOycNN9ycXOvL0gvGjE4fDYVXynm4dENVdzYapxpKL36wnwgq8g?=
 =?us-ascii?Q?SgM5b0iRfkx8ifUA/MJPQHnQHmfZ82BIN+euJuzZcZim772WWopEVtNa9Tev?=
 =?us-ascii?Q?NEoEnbec0GcN5ALFZAPMejjdcGiXhNs1hV/gcC7r7Es1YMTz7VP/boBXLvWb?=
 =?us-ascii?Q?L4l0zoLgTVpX4EtK8Eg0Nact/wWEpRBGA2shxO9W66S3lGgJa9wdIo3H8R/z?=
 =?us-ascii?Q?xDIUUVjK+22LzOnHLuaAf4huos8GmLd8EkJCLX/z8dl/duBb7vqdanHjvq5q?=
 =?us-ascii?Q?fPaFfBdwi1bWTTEaAQ+zLzPHusZjPzv6oXN7zi4Yz3e7xR+Cnwg6SGeWtprV?=
 =?us-ascii?Q?yuxjSMl7mpwXAG82sjHkUsVSFC1YHvgBQaNChDXNIqLNZ9RvpRSEdreD7wvV?=
 =?us-ascii?Q?cb5f6uqNGlkIRRrunBNfYr1VQPw1WgpoM63WILOiiWpt36YOyTzXRB3gbd7I?=
 =?us-ascii?Q?8+s+qKwLVRnWFyDwUzzUDnrTCn8ryMUStsHDo7HxzutHsUBrp50GKSFGadyI?=
 =?us-ascii?Q?Un4xU/VtX4rOcJ5D75ApociTyE5YIhMqfaM0G4Co5BAyEF6rZd1vUeS+5yYo?=
 =?us-ascii?Q?3iaqjOtxEPeIhTjWP1wpGs0jvKzlvc69VWG6HPQbROzJrs1mLqiOL4xB/qJn?=
 =?us-ascii?Q?HFpstrC3wpthkMLckxfJxdQtVoO/65h04BBRhaj0HTRgXzLXdPZ7zKGNEaSg?=
 =?us-ascii?Q?TFmgeqvNGp7P37NcKkkU7WTr2yKGtUxlOYh13+9qbyGEEyr0CwCPm2+mytqU?=
 =?us-ascii?Q?erz50L6xb5AhKcY5evBdjBF0Z2EKoy/w35loOCgZx14vTb1gF7FlEC88M+pz?=
 =?us-ascii?Q?1Kks1x6ho7LMkFqBZeuiHZWVbBt/EziliA2fh91E4PXWt9GZLmHInoIIbCKd?=
 =?us-ascii?Q?TEORz52IQ/VJVrQA3xl1oIb/+BupFXxIpY6Wm72ZRrcfpsh/5kcmYWWVUnFp?=
 =?us-ascii?Q?xc5OLM/po0gBYtkPe+vFUT3IqxJTcEDCHYFF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(30052699003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 20:33:46.9252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d575de2a-8d9d-4b7a-acd8-08dd76dca9cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630

ISP device specific configuration is not available in ACPI. Add
swnode graph to configure the missing device properties for the
OV05C10 camera device supported on amdisp platform.

Add support to create i2c-client dynamically when amdisp i2c
adapter is available.

Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v4 -> v5:

* Avoid global variables and make driver reentrant following the
state container design pattern.

* Fix coding error referencing i2c_dev variable of amdisp_platform
in instantiate_isp_i2c_client().

* Remove i2c_put_adapter(). Not required as i2c_get_adapter() is not called.

* Use i2c_board_info->swnode instead of fwnode to fix refcount imbalance
warnings when module is removed.

* Address review comments.

 drivers/platform/x86/amd/Kconfig    |  11 ++
 drivers/platform/x86/amd/Makefile   |   1 +
 drivers/platform/x86/amd/amd_isp4.c | 295 ++++++++++++++++++++++++++++
 3 files changed, 307 insertions(+)
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
index 000000000000..ad181ab96423
--- /dev/null
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -0,0 +1,295 @@
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
+	struct notifier_block i2c_nb;
+	struct i2c_client *i2c_dev;
+	struct software_node **swnodes;
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
+static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
+{
+	struct i2c_board_info *info = &ov05c10->board_info;
+	struct i2c_client *i2c_dev;
+
+	if (ov05c10->i2c_dev)
+		return;
+
+	if (!info->addr) {
+		dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
+			ov05c10->i2c_addr);
+		return;
+	}
+
+	i2c_dev = i2c_new_client_device(adap, info);
+	if (IS_ERR(i2c_dev)) {
+		dev_err(&adap->dev, "error %pe registering isp i2c_client\n",
+			i2c_dev);
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
+	info->swnode = sw_node;
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
+	struct amdisp_platform *ov05c10;
+	int ret;
+
+	ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
+	if (IS_ERR(ov05c10))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
+				     "failed to prepare amdisp platform fw node\n");
+
+	ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
+
+	ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	if (ret)
+		goto error_free_platform;
+
+	platform_set_drvdata(pdev, ov05c10);
+	return ret;
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
+	if (IS_ERR_OR_NULL(ov05c10))
+		return;
+
+	bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
+	i2c_unregister_device(ov05c10->i2c_dev);
+	software_node_unregister_node_group((const struct software_node **)
+					    ov05c10->swnodes);
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

