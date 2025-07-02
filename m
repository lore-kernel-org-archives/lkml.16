Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209A2FC3B9;
	Wed,  2 Jul 2025 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471806; cv=fail; b=afX/xS3MJk8wfHwKs8/h5nB7KmnAA01e4LlaCRoetxq1/iQnewbqSrRUuGkPqYMLQXktrU9JRhuieOeOVjl2iiV9CnmeJN1XGlfQBNTnkn1Jqx1yYc6ylhUaJZRpa65vRVyCAR88JKQbyNwWOxcnNI599a7LOO/bzT5/CL+Lub8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471806; c=relaxed/simple;
	bh=wbFR5NTi2ceDADJbNIfkEywvMzrMrqX6MKjPr6Ip9/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ljhmWYKqmKxDmWrJr5VABqL7q0RosKMP83IQkPJFud3l4t4dJpsNc1FCFTEK5zbb6857y7g+Kx3SUB38M1bMvcl8Vo+u/0pPvRr1/k7xpcFtCZ5QWaTTpIQTc+L/I5N6RjI1SKJKNX3OJ3u4ddmXBEM5In1SgyppN5SrjtlAy/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AZG21Y7o; arc=fail smtp.client-ip=40.107.93.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AZG21Y7o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nc3/H8dcc4odCxM0VWqd0rDUjkWMK0nMHL9LXYPvE4cl7QVFefuUHrTPnR/zdIC08aivMoQjRpynOG9CJaml1vmbfAJKnD4sietyRFZ5fG822ngyGnHwvr6Omfej1KdF42qDUiPCRLfs2L/BmQpr5xY3zG6r6wTLq27fEi9LOyki2SGlVslK49EumP08eKWUO/lHbzqDEhYkaznlo14ph8ETLF1i31dTTHOzsBJNy/6crPgh0NBGgUO8m5obo7yg5liFCUrGLRfbtG8g3NaJqQsWuEjKDlh8JCAtBXyQip5hKgrDB7Y6ufDULjSGaYqRJQ9N/voEcjEPHTw5PBwZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEI2mhOPrrHqvl0u9OkP1htgTLxzRGxy/lVma8+IdNw=;
 b=IItfX9TXTt1xBi9Xja+z7p5rMSe/JdxBPuC7pXCgeF/ENQ8+eQ3VN4oRuKUDEPxZVtSwhTvZSC5Kd9dYGfGDLk6OrRyxrZYyI+2Oh/Fv3/F6QQYKy2mYZI0ysL7G33BWQAv/kYOOrN1/nC213Q2PcOIXhdZxKvdAbCi9+sNvJlOhajupi7AquSV5vJCorEGtYBq3UGytGUc4ZEQ1hKLox6bVNlM7zpX/ILj3U5fZRt0x+MFA+Ou0XhMSOehAFGDpHJRErjj+lMv8FoyoWcQADUxJ/OlcD8KBouww6zJPuPSqdsRHJDrYVi6V5qfK22POXzgd6CBAKbI0MjGIPGPtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEI2mhOPrrHqvl0u9OkP1htgTLxzRGxy/lVma8+IdNw=;
 b=AZG21Y7onU3HDYopYbWRbAXLcdWhqhqlMK3mzD3BAO7tUx0od0C3aVxq3ZCm+dBqFbCtRTkVDH1pa2C1+uhsycnWOCjAcgoOeGU9I/Kk2C/+Ar24+xSwqO/0kjz0tCXfeO4bUe11SMGduiTUPc/Ct7U9VBxkEPIeYxD/dHfaDPM=
Received: from CH2PR15CA0002.namprd15.prod.outlook.com (2603:10b6:610:51::12)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:56:41 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:51:cafe::12) by CH2PR15CA0002.outlook.office365.com
 (2603:10b6:610:51::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:56:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:40 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 10:56:39 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Ronak Jain <ronak.jain@amd.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<gregory.williams@amd.com>
Subject: [PATCH V1 1/9] firmware: xilinx: Add IOCTL support for the AIE run time operations
Date: Wed, 2 Jul 2025 08:56:22 -0700
Message-ID: <20250702155630.1737227-2-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702155630.1737227-1-gregory.williams@amd.com>
References: <20250702155630.1737227-1-gregory.williams@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 300be8bf-a8ee-4a62-1703-08ddb9810918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UKlUnOFmqMdBWwRMyYqN5OYLIZPHcwSw5NL9lfqXK6hDaA3/t5bKI94pVFqZ?=
 =?us-ascii?Q?+HN3yDvmzbwh1oYRVNPKwzpepBtKa8OrA+g2vPuETzxkc8WlWFoqlglJvb2l?=
 =?us-ascii?Q?2fM6OK8PvBYTI4psWYkps8+TAwEO0sY5r0xaiFm0Cj4770SvMUsOBZ81E9Ri?=
 =?us-ascii?Q?kWnlEFWfD9NaRJvdgwajtKh1OkI6LhhAHpZHIUJTRlUAcSgXpw8tAbpPd/0p?=
 =?us-ascii?Q?BZVaWiarw/xO2owVOjNG2DRHrLpZluZZdQ+3A8NRi3LUNAkP6WOtZbpyLhKK?=
 =?us-ascii?Q?hk7S9b3TZyE7x3h2b3GtA3qwtFvKCjM3+TOzEPIOfgsvbPw1FuJUW72Pf3pI?=
 =?us-ascii?Q?VpPupZcmgaJ51FIYlNGPDhQdNSjDmEOZk878I31U1bPkU9uyBpmGyPlT82Re?=
 =?us-ascii?Q?gmUJWGWUynmXcCOg4UCtIuMKbQhp7K7tDrlQt71gObwIsClZEDKo+XBZSoXP?=
 =?us-ascii?Q?Uu6oeXDfIwTvVRSf6NZ223ONWwpJFgLDClad+VaWN9MJsAmnnjJGfGceycWq?=
 =?us-ascii?Q?a9rHQUe0XWJUhdSBYGFCvmqPZI3IuMJ625VkTDYV7pd939CVAaETRo8g1ed6?=
 =?us-ascii?Q?kVlwVK1z6HMIKAdT8qqb9UoMI1Lawi7EG29UNNlw0tPwrthbTTiRf6LwzKT9?=
 =?us-ascii?Q?j69kIqTVO/q69FvI4Xoo1XdDbGOl6TPomlf9oCbY4AL1l9hIeOSMHINfUeKm?=
 =?us-ascii?Q?7sy/FAa0aKg/jU+zqlr/bVHr21SS0eaemoJRZIkPrvlWKzQpVYfIHMnk5J0X?=
 =?us-ascii?Q?nigspE2gvPaH9B68WUQrkVTV6r203c+uqpcrn2G872QjS38nIFTJjWHIn0EL?=
 =?us-ascii?Q?TReJEEUNhxQxKApgaW/US6KGuc9MAJnZfpGLuat+T1lg0+g0V6O2AxhYGRyn?=
 =?us-ascii?Q?lTvqdNiT//P87UZb4fQd1l3Wx7O69PKFvVz6xPX8pLijDBVEPdYhwtGQVf1L?=
 =?us-ascii?Q?fLfs7cSfpL9rPJ++1YE/fzQa1GsU70ONXfaxPXXxYTfKxweOu28nZIzkWUwa?=
 =?us-ascii?Q?jin4elPZyWvYDCrwjEgAG+HTcXpc83+xCWZ7vgEEZTEnFVy7rzqE0T0tKWJq?=
 =?us-ascii?Q?A9xe5QA34GFfzg5p+7RlXqDpZjCtZmI7EVTFPoU93tr+955KP0RSL/ZTDtpw?=
 =?us-ascii?Q?0u0LuOmIMlWQmHOHaK0WkRKLxkSBt1ls6HW7l7vYwPHIFsh+ZTOJMbUuUZNV?=
 =?us-ascii?Q?yOBgMCr2wtIZJQdveyevH3w3E5poVJWpaMyfzidP8Azam+pnXgP0J1YR5jW9?=
 =?us-ascii?Q?ChAILlNv/Y0KH9TDNoU9f+xyxqX8EjVIpjjaehIUpgIuzij/BM/rmJqhnz4p?=
 =?us-ascii?Q?t83ZhB8fESGCk7v3//9snUkhcH9c9Q1Ix+6xe8pIAkheI1i9LjQ3b7zFlYRr?=
 =?us-ascii?Q?W1NE60+c0Ww4p7sMgeTUL2OYQWkFpakM5/VCHrYZE/rcPAID7qP/1NHqxpED?=
 =?us-ascii?Q?KNiHlY1EQe3oefsbv3qLC4c5vmbHZq6vP3nG5FjRHeYGAdZMvaI2Dv8wIKZe?=
 =?us-ascii?Q?wk6cxw5XAvoigQOmtbde7bHcgNxRPRhw8hiC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:41.0437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 300be8bf-a8ee-4a62-1703-08ddb9810918
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420

From: Ronak Jain <ronak.jain@amd.com>

Add IOCTL support for the AIE run time operations listed below
- Column Reset
- Shim Reset
- Enabling of column clock buffer
- Zeroisation of Program and data memories
- Disabling of column clock buffer
- Enabling AXI-MM error event
- Set L2 controller NPI INTR

Signed-off-by: Ronak Jain <ronak.jain@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 20 +++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 30 ++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..d9fdfd232d11 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1039,6 +1039,26 @@ int zynqmp_pm_set_boot_health_status(u32 value)
 	return zynqmp_pm_invoke_fn(PM_IOCTL, NULL, 3, 0, IOCTL_SET_BOOT_HEALTH_STATUS, value);
 }
 
+/**
+ * zynqmp_pm_aie_operation - AI engine run time operations
+ * @node:      AI engine node id
+ * @start_col: Starting column of AI partition
+ * @num_col:   Number of column in AI partition
+ * @operation: ORed value of operations
+ *
+ * Return: Returns status, either success or error+reason
+ */
+int zynqmp_pm_aie_operation(u32 node, u16 start_col, u16 num_col, u32 operation)
+{
+	u32 partition;
+
+	partition = num_col;
+	partition = ((partition << 16U) | start_col);
+	return zynqmp_pm_invoke_fn(PM_IOCTL, NULL, 4, node, IOCTL_AIE_OPS,
+				   partition, operation);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_aie_operation);
+
 /**
  * zynqmp_pm_reset_assert - Request setting of reset (1 - assert, 0 - release)
  * @reset:		Reset to be configured
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 6d4dbc196b93..1d30366f741b 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -136,6 +136,16 @@
 #define SD_ITAPDLY	0xFF180314
 #define SD_OTAPDLYSEL	0xFF180318
 
+/**
+ * XPM_VERSAL_EVENT_ERROR_MASK_AIE_CR: Error event mask for ME Correctable Error.
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_AIE_CR	BIT(16)
+
+/**
+ * XPM_VERSAL_EVENT_ERROR_MASK_AIE_NCR: Error event mask for ME Non-Correctable Error.
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_AIE_NCR	BIT(17)
+
 /**
  * XPM_EVENT_ERROR_MASK_DDRMC_CR: Error event mask for DDRMC MC Correctable ECC Error.
  */
@@ -155,6 +165,17 @@ enum pm_module_id {
 	TF_A_MODULE_ID = 0xa,
 };
 
+/* AIE Operation */
+#define XILINX_AIE_OPS_COL_RST			BIT(0)
+#define XILINX_AIE_OPS_SHIM_RST			BIT(1)
+#define XILINX_AIE_OPS_ENB_COL_CLK_BUFF		BIT(2)
+#define XILINX_AIE_OPS_ZEROISATION		BIT(3)
+#define XILINX_AIE_OPS_DIS_COL_CLK_BUFF		BIT(4)
+#define XILINX_AIE_OPS_ENB_AXI_MM_ERR_EVENT	BIT(5)
+#define XILINX_AIE_OPS_SET_L2_CTRL_NPI_INTR	BIT(6)
+#define XILINX_AIE_OPS_DATA_MEM_ZEROIZATION	BIT(8U)
+#define XILINX_AIE_OPS_MEM_TILE_ZEROIZATION	BIT(9U)
+
 enum pm_api_cb_id {
 	PM_INIT_SUSPEND_CB = 30,
 	PM_ACKNOWLEDGE_CB = 31,
@@ -244,6 +265,8 @@ enum pm_ioctl_id {
 	/* Dynamic SD/GEM configuration */
 	IOCTL_SET_SD_CONFIG = 30,
 	IOCTL_SET_GEM_CONFIG = 31,
+	/* AIE/AIEML Operations */
+	IOCTL_AIE_OPS = 33,
 	/* IOCTL to get default/current QoS */
 	IOCTL_GET_QOS = 34,
 };
@@ -633,6 +656,7 @@ int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
+int zynqmp_pm_aie_operation(u32 node, u16 start_col, u16 num_col, u32 operation);
 #else
 static inline int zynqmp_pm_get_api_version(u32 *version)
 {
@@ -951,6 +975,12 @@ static inline int zynqmp_pm_set_gem_config(u32 node,
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_aie_operation(u32 node, u16 start_col,
+					  u16 num_col, u32 operation)
+{
+	return -ENODEV;
+}
+
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.34.1

