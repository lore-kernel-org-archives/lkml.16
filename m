Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14019006B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883150; cv=fail; b=GLhsJQwJF3FHBzrQEWVcWFH/oD/oAZBPj3bk1zCIvxy5SH3RAzB88K+RnsRzVg8B6V/4iKmSOZqkol3sbaZnS+wE8Xr45PgLjbPuCiveXOtZTZKNt1Lr/8b7So3zlE5eFakO+CKcMc4pYGBYg6kNxexFKmXxnQlMU2thOJ6U4BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883150; c=relaxed/simple;
	bh=N00pbzQckc2qLlg9rLTv9LX3gMDvANhKHIL5jAQN6ls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XsxzfKdAVADLeIX7f1kbQEad8fKpn+jF1VVutXNMjHoPScOSCXwgPlYdHiHtIVW1HKGsGQ3XcOWEZsJQTurSpOm0zm5SxL9dcAgJ1P+lp042kjKaiYqw4NNm8h3vK9vmnmqp8maMYUnkUe00gSxGRq+9RumqIlwt0iZXuhbGa0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aukJIfET; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aukJIfET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQlHVTCV+2/+E2d0MxzGnSIzTY45IIFX/9mEV3Q5tMXo6vij2MmwIKbxWM4sX6bG6erz9O/zZFW1nnVoaWDPYw0yteDvFU8T9dmYskXF7z+0a8i/+bKL4mjd5K9LTm6tOhwqIs1NSUb3pkZnki9c0A3u55PrMGLfFoVi0d+8D0jozdIg2XgBIFkGzFkvQfkQbpQk0HIBGgZJuZwJjO37905maVyWKsnRqHCTYt0ji1ETiBc9hzqVqXLxEKtuKgOJXD04MFB6rdGoGXMFKKQ5/7fB/ps0J7CVjtXISp9huGziyzr5tBmRv/PR++31w0bPp5QTs7RKDfzlrosxfRqlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBiuECYcUxoq3usEhaA0tRU83TdxRyPTYC2xV5RdhZg=;
 b=AbZABrXwG9NUcntCrzOyiJTC0EzLhL5GqKAqBSqafxLynTpuqjshbBSlWY93ZweGnPLe0JeMTYf42wt3Q2arqoU2BM2Ijo0Ml89TdA9AzwFm43Br/fDcPhy8dnBDYA8ouCSuWrF+oG0IZXTN+Qbx4BZpx3USrnuNTWWcTLRx/eUKXczwDcv3aczMyImQp6SCkXgeir/PZP4QoffV+a7YUxZNesrn34/i3ZkmAKv+b7UXF2i7Ge0B4HOSkQRGwdxN4NDx5ClNmlL3CwirUM+LTTihagGuu1G+jaFxlY7br9PIzQRgS1EA5ztJedt44cGIQTOhTREe8zyvDfgnDZI1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBiuECYcUxoq3usEhaA0tRU83TdxRyPTYC2xV5RdhZg=;
 b=aukJIfETJPRHeudbrHAfqHbUOcjeNlfZztIEaGbRtms+0zmJCT5EdIiNHYYCg085Q0DjQKnlxpvrZecTCVvLSzW2Z67fThNRiAFf7NKE0EheAhWzGvbA0KbFSvTtRtAlurGOWuRLoLWWgDy+2hutKXbT/3dNvEih2iqzV52DnIE=
Received: from MN2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:208:239::8)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 09:45:45 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::42) by MN2PR08CA0003.outlook.office365.com
 (2603:10b6:208:239::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 09:45:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:45:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 04:45:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 04:45:44 -0500
Received: from xsjwillw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Apr 2025 04:45:43 -0500
From: Madhav Bhatt <madhav.bhatt@amd.com>
To: <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] firmware: xilinx: Add debugfs support for PM_GET_NODE_STATUS
Date: Thu, 17 Apr 2025 02:45:43 -0700
Message-ID: <20250417094543.3873507-1-madhav.bhatt@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: madhav.bhatt@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d9b335-6d28-4787-86de-08dd7d949ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PtqT3mFt0bW/2f7YJlqRAt9BcFFgtwEyQk0cLqRferwxc9OC6x9wuJXQAICm?=
 =?us-ascii?Q?5sgrX+bKj4UFbOgArD42bEQ19aqcE9vfKsSE7ya60S621iwUn4WmHBg5WOrX?=
 =?us-ascii?Q?iij3+gcK804gEHrEvoGiB5nY6wVVwCx7soD7T8jGqqZoyooob6U/9PqUxfui?=
 =?us-ascii?Q?h4SxEDcPRBIOgFGvoBUviwdd+1o+UCru7jcnbEP9XgXrlGPY3Se5chhc6kaf?=
 =?us-ascii?Q?Nm8piZvcbbBXTL/Lm3woP9Opc9vjUygJgDA2MhN4owYYmV089mcNFnYoNfQN?=
 =?us-ascii?Q?zZtoCjDVbHhsuexNE5RPA6D7vFwvDQdlUeR4VO14C+WDcefcdbUKb1xfYZsF?=
 =?us-ascii?Q?MUK0qe7cGSt97IPf+8fGv6nqL4DER7hpzRZ4OJYz0Uje5YWU5CRr1Me/7I/X?=
 =?us-ascii?Q?5QKPTVRuvvl1qU0IJAsM+PF7pWaZrEb/o+N2EZzf0pMPQM7ues9nmGuXZUYk?=
 =?us-ascii?Q?BZEUarRpzXlr9jgHaLBV5k3sGnpo22jDmtU6VmiWiyJipPXWWToKCgBjs6qj?=
 =?us-ascii?Q?rwzJrQ5ucFvTdx6SRW9sL/tA0Cr+yzuBxXRF5/RI+wT/TnEHbxMD6F/flems?=
 =?us-ascii?Q?tWiarrGRkkFHq0RWZARPJx2kkgO5RF8Mt3Rzb1w3NJJY/PmjKhHP/3zbHShh?=
 =?us-ascii?Q?uEQxGn2r5yKrf3g18lwLxKjpsqi/EHl5nRmIDyk/GtohUIi6hM13fwn3WDwG?=
 =?us-ascii?Q?oDsE3JhuIKDqsY9iHBfmpqaiuCtnYIlrZA9wui6M2zn1DAvq2oOwi4HBs19L?=
 =?us-ascii?Q?CohQmUXZdTWeGvF+3OH3eWl0arhToo/jeNM5yB/zGm9HR4C5XCElVo1xKx+i?=
 =?us-ascii?Q?tFi51HqXhhjjExnQQeuIF0pYS8L5kcZRUSnbPjSXMpOiyYVscwF7E6V0sPFs?=
 =?us-ascii?Q?NhfedNDOOXonJw5/vxcNlNDpDgNxE5bcyhR/HenqNrLvFt0u5p4RHtOvv6GF?=
 =?us-ascii?Q?k9XM3ZbQS7c0ja9S2qL4jtYQIfXWO9BrpK8+0Srbmg+gWYTbGi6VRgSYbt42?=
 =?us-ascii?Q?FcYKI6ZcmdQuFITSbi4ll9PtoZAvL/mUjasUiXFZZbtUXSujzeJNdSao8S+a?=
 =?us-ascii?Q?lyi0K9nyWV4fXsjq3mx4piNj7KhkNKLnvgGCx2z42dSC0nTG6a3jQMow1voY?=
 =?us-ascii?Q?OyiyX1rhM8QD4mL6y/8z2WQPzh7NHj97TphuJx1KYN+2pjRbSTPtKbtXt0SK?=
 =?us-ascii?Q?Olx0DvGq4U2hTreSG2auhtl6OptxM9ITtnuFPoAmWoACIvGlNJ1108sowFRo?=
 =?us-ascii?Q?QPazolhRIhCgKw+smm3iRDmDoVyWHjOcw8MKc29Ss6gHqSQZjw4AG8FMClJX?=
 =?us-ascii?Q?bXA7ncNmOgS0u7LG5/RdHMg5L13k9lQgv0hv7eixFcPrUCzoNqUlz6y3N30d?=
 =?us-ascii?Q?tZq3O0w56NFeO1Z0FX7COTXA649d2xqr7pv1oYoOTIMx+tqx9/mKSRCby8NW?=
 =?us-ascii?Q?Q0FBvBRdf3qvBZ4j40Xl/RoxfnBfaY/VtUW518fu2yAe27pQtsGHYI5H8Y2O?=
 =?us-ascii?Q?Vkfv+UkCnnwTgmxp5swykqZm3CYqJ3WZe9ha?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:45:44.7462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d9b335-6d28-4787-86de-08dd7d949ff4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944

Add new debug interface to support PM_GET_NODE_STATUS to get the node
information like requirements and usage.

The debugfs firmware driver interface is only meant for testing and
debugging EEMI APIs. Hence, it is by-default disabled in production
systems.

Signed-off-by: Madhav Bhatt <madhav.bhatt@amd.com>
---
 drivers/firmware/xilinx/zynqmp-debug.c | 13 ++++++++
 drivers/firmware/xilinx/zynqmp.c       | 41 +++++++++++++++++++++++++-
 include/linux/firmware/xlnx-zynqmp.h   | 12 +++++++-
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp-debug.c b/drivers/firmware/xilinx/zynqmp-debug.c
index 22853ae0efdf..36efb827f3da 100644
--- a/drivers/firmware/xilinx/zynqmp-debug.c
+++ b/drivers/firmware/xilinx/zynqmp-debug.c
@@ -3,6 +3,7 @@
  * Xilinx Zynq MPSoC Firmware layer for debugfs APIs
  *
  *  Copyright (C) 2014-2018 Xilinx, Inc.
+ *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
  *
  *  Michal Simek <michal.simek@amd.com>
  *  Davorin Mista <davorin.mista@aggios.com>
@@ -38,6 +39,7 @@ static struct pm_api_info pm_api_list[] = {
 	PM_API(PM_RELEASE_NODE),
 	PM_API(PM_SET_REQUIREMENT),
 	PM_API(PM_GET_API_VERSION),
+	PM_API(PM_GET_NODE_STATUS),
 	PM_API(PM_REGISTER_NOTIFIER),
 	PM_API(PM_RESET_ASSERT),
 	PM_API(PM_RESET_GET_STATUS),
@@ -167,6 +169,17 @@ static int process_api_request(u32 pm_id, u64 *pm_api_arg, u32 *pm_api_ret)
 						pm_api_arg[3] ? pm_api_arg[3] :
 						ZYNQMP_PM_REQUEST_ACK_BLOCKING);
 		break;
+	case PM_GET_NODE_STATUS:
+		ret = zynqmp_pm_get_node_status(pm_api_arg[0],
+						&pm_api_ret[0],
+						&pm_api_ret[1],
+						&pm_api_ret[2]);
+		if (!ret)
+			sprintf(debugfs_buf,
+				"GET_NODE_STATUS:\n\tNodeId: %llu\n\tStatus: %u\n\tRequirements: %u\n\tUsage: %u\n",
+				pm_api_arg[0], pm_api_ret[0],
+				pm_api_ret[1], pm_api_ret[2]);
+		break;
 	case PM_REGISTER_NOTIFIER:
 		ret = zynqmp_pm_register_notifier(pm_api_arg[0],
 						  pm_api_arg[1] ?
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 7356e860e65c..dea6c53511ab 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -3,7 +3,7 @@
  * Xilinx Zynq MPSoC Firmware layer
  *
  *  Copyright (C) 2014-2022 Xilinx, Inc.
- *  Copyright (C) 2022 - 2024, Advanced Micro Devices, Inc.
+ *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
  *
  *  Michal Simek <michal.simek@amd.com>
  *  Davorin Mista <davorin.mista@aggios.com>
@@ -1413,6 +1413,45 @@ int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
 
+/**
+ * zynqmp_pm_get_node_status - PM call to request a node's current power state
+ * @node:		ID of the component or sub-system in question
+ * @status:		Current operating state of the requested node
+ * @requirements:	Current requirements asserted on the node,
+ *			used for slave nodes only.
+ * @usage:		Usage information, used for slave nodes only:
+ *			PM_USAGE_NO_MASTER	- No master is currently using
+ *						  the node
+ *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
+ *						  currently using the node
+ *			PM_USAGE_OTHER_MASTER	- Only other masters are
+ *						  currently using the node
+ *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
+ *						  one other master is currently
+ *						  using the node
+ *
+ * Return:		Returns status, either success or error+reason
+ */
+int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
+			      u32 *const requirements, u32 *const usage)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	if (!status || !requirements || !usage)
+		return -EINVAL;
+
+	ret = zynqmp_pm_invoke_fn(PM_GET_NODE_STATUS, ret_payload, 1, node);
+	if (ret_payload[0] == XST_PM_SUCCESS) {
+		*status = ret_payload[1];
+		*requirements = ret_payload[2];
+		*usage = ret_payload[3];
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
+
 /**
  * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
  *             be powered down forcefully
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 6d4dbc196b93..54fa85f2cf73 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -3,7 +3,7 @@
  * Xilinx Zynq MPSoC Firmware layer
  *
  *  Copyright (C) 2014-2021 Xilinx
- *  Copyright (C) 2022 - 2024, Advanced Micro Devices, Inc.
+ *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
  *
  *  Michal Simek <michal.simek@amd.com>
  *  Davorin Mista <davorin.mista@aggios.com>
@@ -164,6 +164,7 @@ enum pm_api_cb_id {
 enum pm_api_id {
 	PM_API_FEATURES = 0,
 	PM_GET_API_VERSION = 1,
+	PM_GET_NODE_STATUS = 3,
 	PM_REGISTER_NOTIFIER = 5,
 	PM_FORCE_POWERDOWN = 8,
 	PM_REQUEST_WAKEUP = 10,
@@ -630,6 +631,8 @@ int zynqmp_pm_request_wake(const u32 node,
 int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode);
 int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
 int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
+int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
+			      u32 *const requirements, u32 *const usage);
 int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
 int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
 			     u32 value);
@@ -937,6 +940,13 @@ static inline int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mo
 	return -ENODEV;
 }
 
+static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
+					    u32 *const requirements,
+					    u32 *const usage)
+{
+	return -ENODEV;
+}
+
 static inline int zynqmp_pm_set_sd_config(u32 node,
 					  enum pm_sd_config_type config,
 					  u32 value)
-- 
2.25.1

