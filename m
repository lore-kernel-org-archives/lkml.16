Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF12221A421;
	Wed, 18 Jun 2025 20:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278621; cv=fail; b=IIuI+rW8hxUv2DXLlnmhMKBZUS6Z7QWvIeZdc4VEFL52aXzVS5Cfj29etcgyQ0bDiYfLOLSMhaZTx+YRALbJ8A26IGGj03PzdNWNgS2G6V3v/WD7ifXfXrGXfmy7cWDDiXp9MmQTWVasidnTR9j1MRIYTRxmVVHyYRFNnZuIgsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278621; c=relaxed/simple;
	bh=x5xexNG0d/wKNOByWwXBkpHSYV4kjwPJUItt5prYzYg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WJ82sc9t/uo5K4U8YtvDBsfyLFyEc+bwAg/8e4jhSR9I487YIsQXKJFZLLY2TkHLdZ31KTA8cpxlUd1ie4DdXH7wTces3bP8niLLPGToFUNkyR5bpLNlG8M6my9u2PNTta70DUpr00OIhKahjcWQUz7l504slAfQJCLBN6mXxaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E9RHsQLq; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E9RHsQLq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdJk70QN8kHmBSaqPcCFIrfa/0K5u1/CF8ogPI4/ZDt+dEhQsA0K17CHGt86TICj5oeuFvawG4M6jdLiFs1drL2ycxJzEvv5stOvCS8k5Jwo6/eU3C8ZTRgXYckNwwy+MA4YfE2B3SPZuN/Nrx+GUBvFVzlW2mwnMsnjyImUOlcJx+dmKx6iTBnkBUph+xwJ1vTpqwtVSd+r0o9wlxzP+ZrQQVLn/DFVhqh0Kc7oi80doRelS0Bq8czKMX5pLSen31PD+1gUAjMHDZL7Kb/nHHlnARW0F3lZb9K/JPA0OZrJxesQtAvmbRfwaLs6pYneBNBlVZiFQCrcGjO/sXHZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpdNInu9Ro0W50p9pE3eCebP68wNlwTosXM6jlNM7U8=;
 b=pqtGkH6b47aGF+IAzV5dhhOdAAQYswisr2wTrYVrVokzgfWcFCK+VBbUtLAIIHLVRw9XGnx8dbvg5uYhE/qW8ZP6gQ35B0e79pTpxRoPiFjdLfnjuPWpVIXAJ5bCTlnzLnE5niYIax/yxTrKu12vs9ej3VlHrL9TRGL6FxUKZ1JJJRyij0ehVKO21wNMM0Y0Ycr5TKkU3mg8lsdlZk7OXIys/IQWK8osNjqG12lqNGvNbFYxlWu2P2VtAwWorr6ZaPpjuQvnuupoNEBHClqMjOCgYmvf2FGTBBlPJSmhdRI0g7CsUL+lgnyNaIslC+1c+Dg9W6+yGI9z3ivFx6AHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpdNInu9Ro0W50p9pE3eCebP68wNlwTosXM6jlNM7U8=;
 b=E9RHsQLq6Wme9giAyp+m8be4B8yPQ0dbS9Nz7GOwt9oKuGDX++Qlkac/45u5YEvJm/PAbahEG54SiiQSYJixKTiBq1p0R2aNiKgxvFNDnWFP9jfRnHeyGvCIzK7Rskcte1PrzQKdkiCeZGG5GLbd1/Yr+ppVmLnlKdZG/ZfNiCI=
Received: from PH7PR03CA0007.namprd03.prod.outlook.com (2603:10b6:510:339::9)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 20:30:14 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::3b) by PH7PR03CA0007.outlook.office365.com
 (2603:10b6:510:339::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Wed,
 18 Jun 2025 20:30:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 20:30:13 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Jun 2025 15:30:12 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, <W_Armin@gmx.de>,
	<mario.limonciello@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <gjorgji.rosikopulos@amd.com>,
	<king.li@amd.com>, <Dominic.Antony@amd.com>, <Phil.Jawich@amd.com>, "Pratap
 Nirujogi" <pratap.nirujogi@amd.com>
Subject: [PATCH] platform/x86: Update swnode graph for amd isp4
Date: Wed, 18 Jun 2025 16:29:48 -0400
Message-ID: <20250618202958.3934822-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|IA1PR12MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bbf313-dc9b-48db-766b-08ddaea6edaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gkwheo4BiJqrt+tKtxT391EyqM8Hwmd1xJxD+cwibQCIsYpJNx0Yqp2DCK2N?=
 =?us-ascii?Q?JIzXn0L0vLsvIdbmTFFjDCTltwuj9pasELPJGqo6LEJleFjtD2sOFZx1Pxgs?=
 =?us-ascii?Q?AtKhDgbUz7M6e8QKARVkgo7TV8vpwj08aRnZOCPv+VhINpdg37QPzd/EhpBL?=
 =?us-ascii?Q?S0ZjRTObWkqCk8M/PFkom2Hc5EqfZKdUk+1xx2pEW0E5IBuEh4fwGAik1uB/?=
 =?us-ascii?Q?TXJhnsjt+ELvmYVkBIZ9At/ILeyxdp5fXsPpcj58oeIFGO1y6tdqdQjYG5qW?=
 =?us-ascii?Q?szEO/UJ6qwEuup8GaQGgbJhAxZujMzzTeyZAzYZwyiV/vN7jvWPvtHMGZcPD?=
 =?us-ascii?Q?5UqekLo4iqSygsu9kZpvMzhjO2fJStPEvO7BRi9mnTaunPIyNU7FBzz9s+NQ?=
 =?us-ascii?Q?M8nSMn9oXncnb/8kPuY1Q8qtRgeJAh049sGUzpf+vKrcDuHDJoipbfDma8iz?=
 =?us-ascii?Q?tYqwYhaL90VduxzfWJBvRxli1JJ7sv3ljq9J/GkXGn8saYr0WDGCA+Q9g5vz?=
 =?us-ascii?Q?+flW5Y1XpL8fUzl+UXsxDe7cVWVJvsXch+XH4P1nOJJALRizEpVZDM3I4Pxk?=
 =?us-ascii?Q?Ok5jgt8NwDX1m0ePX5KqBC4ZgdvNuy1oGYMwlzvsXD9GnVgNoxrdffSB8Xb3?=
 =?us-ascii?Q?mqRA8hBdFcr4Irc9fhFqP+eDMtx8mM71uyOntrZY2iBzV5FVb8B7eG85msg/?=
 =?us-ascii?Q?agjFqJp+KS83KRPShW0WYTIdvnE5I/ZwUubYv7pQqgDkjzQ0zB5hUZrtT4lf?=
 =?us-ascii?Q?ZZyzrUpZvyBf4Xe5tYJkDqhfBaFmnTPIDYnwYSEgDIRf5ak52iCq4+VLeCkQ?=
 =?us-ascii?Q?h+NZSHgUzNt4gMROuMWpy4LstoufqmBvj5ReKd63eJnufMKqaHZNNcLY7suF?=
 =?us-ascii?Q?HpOXa2nyAKqQeXu7k888ErazTh7MmHWc68fxosvYoVxL4dw01+OmrePL06EQ?=
 =?us-ascii?Q?vxXN4B4k7XYgpGuFxVvt0pwRF9g2BIpo0elko/6/TjzzZOvOj0YM95ETWNbC?=
 =?us-ascii?Q?gqCMwHuPMkaUNNA/J9fznMFFMPMtmBAbqTj046CZOaTRsxIcFyH8z5iYueuV?=
 =?us-ascii?Q?nJUMciGqIJ+whNqFtEmOO0yFY7c5EWYpxuYIk2yoo1x+kVqw8cMonjvyxym4?=
 =?us-ascii?Q?++gYV6qaFVM5hPmNUyskL+pUmcRnqgV+uUhNTwdi5Z7z09GsX+vpg3fRMHBo?=
 =?us-ascii?Q?FHSDA3eJmAlCEpWOPGJ/yZLlk6O8zWahGLu45BL0x+HeGSJ/Ar1f1W5zzM2C?=
 =?us-ascii?Q?0zqaj3z1IRzhY+g9GFptzGOPi6OUNMNfsfkI9dc8WEub0MmpNMMlsDb0LdaI?=
 =?us-ascii?Q?0B+rLw2MoD+E2w6DtHK4zOTJ2v9ilrfeWHR+IF84TLSHmeaIM3GySVpY0/fI?=
 =?us-ascii?Q?O1vczh0GstoEHE56DsvzYq34Cz3WeCn48GYhi6Y35WyKZ9CH47dbY3stm9VP?=
 =?us-ascii?Q?3dge31ie3/GXafRVuCT9WNOMlMpGZ0fn49m7qiV0suZbuSL0krRLJPSnf8K+?=
 =?us-ascii?Q?E82J7XV0OR7cCAbn9j9ozNgQfzUuYabzu6nO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 20:30:13.0780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bbf313-dc9b-48db-766b-08ddaea6edaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388

Existing swnode graph format is specific to sensor device
and is causing conflicts when accessing standard property
variables outside the sensor driver.

To address this issue, enhanced swnode graph format with
dedicated nodes for i2c and isp devices, with sensor node
added as child to i2c node. This approach allows to have
standard property variables (ex: 'clock-frequency') with
values applicable for each of the devices (sensor, i2c and
isp).

ACPI device driver_data handle is also initialized with root
camera swnode to access the property variables in the graph
in isp and i2c drivers.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/platform/x86/amd/amd_isp4.c | 181 ++++++++++++++++++++++------
 1 file changed, 144 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
index 0cc01441bcbb..c440a7dfed27 100644
--- a/drivers/platform/x86/amd/amd_isp4.c
+++ b/drivers/platform/x86/amd/amd_isp4.c
@@ -20,6 +20,9 @@
 #define AMDISP_OV05C10_REMOTE_EP_NAME	"ov05c10_isp_4_1_1"
 #define AMD_ISP_PLAT_DRV_NAME		"amd-isp4"
 
+static const struct software_node isp4_mipi1_endpoint_node;
+static const struct software_node ov05c10_endpoint_node;
+
 /*
  * AMD ISP platform info definition to initialize sensor
  * specific platform configuration to prepare the amdisp
@@ -42,55 +45,116 @@ struct amdisp_platform {
 	struct mutex lock;	/* protects i2c client creation */
 };
 
-/* Top-level OV05C10 camera node property table */
+/* Root AMD CAMERA SWNODE */
+
+/* Root amd camera node definition */
+static const struct software_node amd_camera_node = {
+	.name = "amd_camera",
+};
+
+/* ISP4 SWNODE */
+
+/* ISP4 OV05C10 camera node definition */
+static const struct software_node isp4_node = {
+	.name = "isp4",
+	.parent = &amd_camera_node,
+};
+
+/*
+ * ISP4 Ports node definition. No properties defined for
+ * ports node.
+ */
+static const struct software_node isp4_ports = {
+	.name = "ports",
+	.parent = &isp4_node,
+};
+
+/*
+ * ISP4 Port node definition. No properties defined for
+ * port node.
+ */
+static const struct software_node isp4_port_node = {
+	.name = "port@0",
+	.parent = &isp4_ports,
+};
+
+/*
+ * ISP4 MIPI1 remote endpoint points to OV05C10 endpoint
+ * node.
+ */
+static const struct software_node_ref_args isp4_refs[] = {
+	SOFTWARE_NODE_REFERENCE(&ov05c10_endpoint_node),
+};
+
+/* ISP4 MIPI1 endpoint node properties table */
+static const struct property_entry isp4_mipi1_endpoint_props[] = {
+	PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", isp4_refs),
+	{ }
+};
+
+/* ISP4 MIPI1 endpoint node definition */
+static const struct software_node isp4_mipi1_endpoint_node = {
+	.name = "endpoint",
+	.parent = &isp4_port_node,
+	.properties = isp4_mipi1_endpoint_props,
+};
+
+/* I2C1 SWNODE */
+
+/* I2C1 camera node property table */
+static const struct property_entry i2c1_camera_props[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", 1 * HZ_PER_MHZ),
+	{ }
+};
+
+/* I2C1 camera node definition */
+static const struct software_node i2c1_node = {
+	.name = "i2c1",
+	.parent = &amd_camera_node,
+	.properties = i2c1_camera_props,
+};
+
+/* I2C1 camera node property table */
 static const struct property_entry ov05c10_camera_props[] = {
 	PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
 	{ }
 };
 
-/* Root AMD ISP OV05C10 camera node definition */
-static const struct software_node camera_node = {
+/* OV05C10 camera node definition */
+static const struct software_node ov05c10_camera_node = {
 	.name = AMDISP_OV05C10_HID,
+	.parent = &i2c1_node,
 	.properties = ov05c10_camera_props,
 };
 
 /*
- * AMD ISP OV05C10 Ports node definition. No properties defined for
+ * OV05C10 Ports node definition. No properties defined for
  * ports node for OV05C10.
  */
-static const struct software_node ports = {
+static const struct software_node ov05c10_ports = {
 	.name = "ports",
-	.parent = &camera_node,
-};
-
-/*
- * AMD ISP OV05C10 Port node definition. No properties defined for
- * port node for OV05C10.
- */
-static const struct software_node port_node = {
-	.name = "port@",
-	.parent = &ports,
+	.parent = &ov05c10_camera_node,
 };
 
 /*
- * Remote endpoint AMD ISP node definition. No properties defined for
- * remote endpoint node for OV05C10.
+ * OV05C10 Port node definition.
  */
-static const struct software_node remote_ep_isp_node = {
-	.name = AMDISP_OV05C10_REMOTE_EP_NAME,
+static const struct software_node ov05c10_port_node = {
+	.name = "port@0",
+	.parent = &ov05c10_ports,
 };
 
 /*
- * Remote endpoint reference for isp node included in the
- * OV05C10 endpoint.
+ * OV05C10 remote endpoint points to ISP4 MIPI1 endpoint
+ * node.
  */
 static const struct software_node_ref_args ov05c10_refs[] = {
-	SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
+	SOFTWARE_NODE_REFERENCE(&isp4_mipi1_endpoint_node),
 };
 
 /* OV05C10 supports one single link frequency */
 static const u64 ov05c10_link_freqs[] = {
-	925 * HZ_PER_MHZ,
+	900 * HZ_PER_MHZ,
 };
 
 /* OV05C10 supports only 2-lane configuration */
@@ -110,27 +174,64 @@ static const struct property_entry ov05c10_endpoint_props[] = {
 	{ }
 };
 
-/* AMD ISP endpoint node definition */
-static const struct software_node endpoint_node = {
+/* OV05C10 endpoint node definition */
+static const struct software_node ov05c10_endpoint_node = {
 	.name = "endpoint",
-	.parent = &port_node,
+	.parent = &ov05c10_port_node,
 	.properties = ov05c10_endpoint_props,
 };
 
 /*
- * AMD ISP swnode graph uses 5 nodes and also its relationship is
- * fixed to align with the structure that v4l2 expects for successful
- * endpoint fwnode parsing.
+ * AMD Camera swnode graph uses 10 nodes and also its relationship is
+ * fixed to align with the structure that v4l2 and i2c frameworks expects
+ * for successful parsing of fwnodes and its properties with standard names.
  *
  * It is only the node property_entries that will vary for each platform
  * supporting different sensor modules.
+ *
+ * AMD ISP4 SWNODE GRAPH Structure
+ *
+ * amd_camera {
+ *  isp4 {
+ *	  ports {
+ *		  port@0 {
+ *			  isp4_mipi1_ep: endpoint {
+ *					  remote-endpoint = &OMNI5C10_ep;
+ *			  };
+ *		  };
+ *	  };
+ *  };
+ *
+ *  i2c1 {
+ *	  clock-frequency = 1 MHz;
+ *	  OMNI5C10 {
+ *		  clock-frequency = 24MHz;
+ *		  ports {
+ *			  port@0 {
+ *				  OMNI5C10_ep: endpoint {
+ *					  bus-type = 4;
+ *					  data-lanes = <1 2>;
+ *					  link-frequencies = 900MHz;
+ *					  remote-endpoint = &isp4_mipi1;
+ *				  };
+ *			  };
+ *		  };
+ *	  };
+ *	};
+ * };
+ *
  */
-static const struct software_node *ov05c10_nodes[] = {
-	&camera_node,
-	&ports,
-	&port_node,
-	&endpoint_node,
-	&remote_ep_isp_node,
+static const struct software_node *amd_isp4_nodes[] = {
+	&amd_camera_node,
+	&isp4_node,
+	&isp4_ports,
+	&isp4_port_node,
+	&isp4_mipi1_endpoint_node,
+	&i2c1_node,
+	&ov05c10_camera_node,
+	&ov05c10_ports,
+	&ov05c10_port_node,
+	&ov05c10_endpoint_node,
 	NULL
 };
 
@@ -140,7 +241,7 @@ static const struct amdisp_platform_info ov05c10_platform_config = {
 		.dev_name = "ov05c10",
 		I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
 	},
-	.swnodes = ov05c10_nodes,
+	.swnodes = amd_isp4_nodes,
 };
 
 static const struct acpi_device_id amdisp_sensor_ids[] = {
@@ -232,7 +333,8 @@ static struct amdisp_platform *prepare_amdisp_platform(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	isp4_platform->board_info.swnode = src->swnodes[0];
+	/* initialize ov05c10_camera_node */
+	isp4_platform->board_info.swnode = src->swnodes[6];
 
 	return isp4_platform;
 }
@@ -257,6 +359,7 @@ static int amd_isp_probe(struct platform_device *pdev)
 {
 	const struct amdisp_platform_info *pinfo;
 	struct amdisp_platform *isp4_platform;
+	struct acpi_device *adev;
 	int ret;
 
 	pinfo = device_get_match_data(&pdev->dev);
@@ -274,6 +377,10 @@ static int amd_isp_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_unregister_sw_node;
 
+	adev = ACPI_COMPANION(&pdev->dev);
+	/* initialize root amd_camera_node */
+	adev->driver_data = (void *)pinfo->swnodes[0];
+
 	/* check if adapter is already registered and create i2c client instance */
 	i2c_for_each_dev(isp4_platform, try_to_instantiate_i2c_client);
 
-- 
2.43.0

