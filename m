Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F2F22F743;
	Wed, 23 Apr 2025 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397093; cv=fail; b=qkl1sPOzRebud2N6kHzjykr/z8T1Cjcr5RhidnrZDu1EPV6uGJ3uYILqxkEIsKzRIuTn7hKrJqmMTWaLIzxmSGB8Gv+3KMe42gkz5pptpzrDR1lxUON9BgNiAH113vgv/Jz5Puc1UDLqyLZMYlsACiAWFfYVDrUEIzCqsCWewX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397093; c=relaxed/simple;
	bh=34zAjZ7vVPma0BPwqpCQADrtk5hMOqQhrieYnk+VeFU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QEHgwvYtHSdPAc2eylW1bPfy+IvkWEac4EtK/1XTvRzZnXOAyXRiHxtpvGtKnU5zugAOiqxKoUDRmfOlx2gSF0k0BfGFnHBTpDGbSfzap8tXZ8x3SM8PFkqopLYyw9vCyM3x+Z4uD0mgSZKnmAUir4CbRmJwJ2f3LNIQaYuTafY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZawU/duk; arc=fail smtp.client-ip=40.107.236.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZawU/duk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDGm+H8rOjfvUBd8ZLGzA5oazg+wpo2ZA5YG1bRh5OArM/2QhcuBJkAUHH1W3593D5VmMeYPYawQx8XxuGkLWj+IfjcccpaRABQRKjf9wczCtCbGY/kQ5f1z6eTisL7ZfADYV0rRka8kDgS70LxHI0+xXQU/TjXJ6lweAQtwzlxd2T+BgyZsExb4/ZhCmwMqlB2T3JTEmGb6GQYvXMqFu36Ve3gJmWgy+vxTowzPp9HmWLStPq8KS18TqBWjn/XGIg9wImzoZYFFUyxBWOmAb4337PFovNSkqMg7F/U4SCkK5QjSYgyhPZKByNMfHJ2mNWX2UNN0imhnlm2x4jybsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCj23L0ePBWoz75gZgXVUFDOYw/VHUDVZ24TDyRVJdM=;
 b=BW7Rspli5okh7MOaEpx+MucR490LVpP8iUzdK8J8PzZPdPMwt8c9kIOyqUQ8QbaPoHQ/7a0aarBvfmjZ9yrYnyu/tfFzy7wyFNyJs3gNU8K3meAOAtNVo3vxCTzENart4l6hqg2Qw/O7AMC1+3SOz1I+gzpezvjy+bXzCYHVd8fL+MIzFRWTwHWEoTbqrhiMAzNeMKhSQE96vkLOMYTB4ITtfNEep/A/VnrnICCC/+zvaOHEFdGz+HvhYYIWTKDKsecbAqg4XSLzIHT/skKPyuCNzlPm+Pau9dmsvzS5mZ8NPT4teOD4ogLlmSlv0ge7d0kmUN3HbTli3fey0hmmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCj23L0ePBWoz75gZgXVUFDOYw/VHUDVZ24TDyRVJdM=;
 b=ZawU/dukb4qTvYbGBnKsx7D90v1ScTYL2NGFhMWy46VdYzAPXjkA6IdFcKcKKGapyeqrUAqIokTTAzJMcnIGgZfHe2RLXXxsqQqWpLLF3RxeBQP9sz23yu+ouU01pzZdYcuwcU+psIYRVOJ/0fQbd/QGkGc7Fnv1Iar6ESvd8wQpYiy5WyIahQpQbZ2GketpC9eIOcgjOVpl4wGNoA5KxFmJIoIX4bpSUSJKL/fe9a2gwjzibqGGqtiWZ0VSIyHV0VyAUKkU3AcMr/gTWDxU1Zgh0OGvSMx40v1sna+ON9CUhRFY1sAqZ7PmW96YJB98QGW85v583k3VXHum0OJPBA==
Received: from BL1PR13CA0286.namprd13.prod.outlook.com (2603:10b6:208:2bc::21)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 23 Apr
 2025 08:31:25 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::e1) by BL1PR13CA0286.outlook.office365.com
 (2603:10b6:208:2bc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 23 Apr 2025 08:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 08:31:24 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 23 Apr
 2025 01:31:09 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 23 Apr
 2025 01:31:09 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 23
 Apr 2025 01:31:08 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ilpo Jarvinen
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, "David
 Thompson" <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Support additional PMC blocks
Date: Wed, 23 Apr 2025 04:31:03 -0400
Message-ID: <20250423083103.5240-1-shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bea965-31ef-45b6-26a2-08dd82413bf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B81t0p1gxbwzNL5c/A6Nx7fjmTtTCmn5/qsxbMTkkToTzELfIHz6Q17+BtDg?=
 =?us-ascii?Q?i6H4AxIF7OcOtVMdgvSO36sqzpEAcoKaU9Cz5+mv4VoHaxxfmKMt3JE2psTO?=
 =?us-ascii?Q?ZfR4ufprYKLAf1/SYT7lBGltDsUrwrpWARX7XRbu+Ff2Ulo8GH+oEINvChF1?=
 =?us-ascii?Q?hOh+h0JsVZ8Em5vHS6UHmF6rDISm7J2MF3J4NJ9cAz02vsHo7GECo/EQV6kV?=
 =?us-ascii?Q?PtLMemAPrQp0Z5jch8sFQvWacNcrT7P10zn0a2y6V0+d3G8TbMDrZJySeiGN?=
 =?us-ascii?Q?4BgVpllCbExYernjHd2RrsMdMpHiMw2iYInESlP06qUYY3QaVtRICzNIRn+n?=
 =?us-ascii?Q?bqADuYkwZeiRPo/R6Debo4AF3VYRWlUTdXK0nIMjCTlHSTFR5fnKRP7L5url?=
 =?us-ascii?Q?n2C/jg3GdLpMAt8HobU6iLa0jzzBN0qV6l3ScF5NCP5O2UNj0bJIFcT1+G5l?=
 =?us-ascii?Q?sZiBUPG12LlwuplYcsRpesYGy3pT+Bpm5VEjSoeYTJXICwwO/K3PghE2EJwG?=
 =?us-ascii?Q?aBh9VfIgc53lhYCXESwkgsDBgKazcMxWn/LR9EZqlrwpvjVDr+9kGb+VTUV1?=
 =?us-ascii?Q?wOGIofmSRvhBpohjg5VK1si+DDh+FfHFtPn83UueA9E8+r6+IJ6QOzdS3IvG?=
 =?us-ascii?Q?FucZF1TZWenzkUqePVYs6eXMnBAZt9PmAZZqaJu8ULPgzlL1g45usXpim9xF?=
 =?us-ascii?Q?PWq3+c19Nha6nm2lmXQclKavsP+NwvbjsWQw+Y/dQ4zs4xbZpN43FA1QFqx0?=
 =?us-ascii?Q?MboCgr7hB6h3ds5N+5ESP3PsGml7hZ8Q59lX5MOidBganf1EhmG+kKkepjen?=
 =?us-ascii?Q?x+qKZh5aRSzU/a8cWyB2Rjs4MlYz+3qbN3r0z1B0CBrd1xpbvlCqiSAJlA5q?=
 =?us-ascii?Q?1nSbRQWSlNFV/1mOjp0GxlNugMUO6/m4tM4uUEkvfwHKjCrZ3WRERhXLpd3T?=
 =?us-ascii?Q?TIf4CCqFX/x1X0xkEQL+R/vq+WqHUf8H0aaQ0XqyemnAITx7y4U7RMiAV4Iv?=
 =?us-ascii?Q?QWo6/XFOZJwLw5Or+AJ6e5c8OSNgmT6YLMyCFiseaT0viwx6nhqJQc7125U+?=
 =?us-ascii?Q?99LHGXQMslCUFQoXI5NEUYrVZhyzarStFlep5+fUS4ZR7dwwWBme3eC6Wu4e?=
 =?us-ascii?Q?W/X+ygVsd+lA2fARhb99CxP2iCn3ldpoSx8jvEax0m+Q+oUbOqoYxO0oOfD3?=
 =?us-ascii?Q?qARsQRSEYXO0ilP/rBKskaGXr5ENO+fQeRHHkRsjjD0miDrOe8wLFHA0ANv6?=
 =?us-ascii?Q?krtUJ0sPSxkKp6x6WYM6tbGKN+9Zwij2e7z4l57GPgQXOXm1IVOf9R6KfMC0?=
 =?us-ascii?Q?/BoET6jYCN0pg59uPUD3SeDlAWmfyXTeZ7vEJWbhIvvaCI9pqX7CqN4z7Zsx?=
 =?us-ascii?Q?sw1EZ6SrIiUXdhgF2zzxtm5oKNxeumlP+y4M+Dbo6X2eVG5DTPBO7txtF/O8?=
 =?us-ascii?Q?/1nFuuWH/1ZV4UTbPZ957L7T2rONRBSiVUAVcXWe7uZJYk/OK/deLRy7nzU+?=
 =?us-ascii?Q?zfbSzZYufIWpU93B2sCevAYfFZxsho4WUj1c?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 08:31:24.4648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bea965-31ef-45b6-26a2-08dd82413bf0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027

Add list of events and counters from the following blocks: APT (ARM Processor
Tile), GGA (Global Generic Accelerator), MSN (Memory Stasher and Navigator),
EMI (External Memory Interface) and PRNF (PCIe Request Node).
If any of the fields populated from the ACPI table (like apt_num) cannot be
read, assign the corresponding block count to be 0 instead of failing probe
to maintain compatibility with older firmware.

Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 155 +++++++++++++++++++++++++-
 1 file changed, 150 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 36a00692347d..900069eb186e 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -33,7 +33,7 @@
 #define MLXBF_PMC_EVENT_SET_BF3 2
 #define MLXBF_PMC_EVENT_INFO_LEN 100
 
-#define MLXBF_PMC_MAX_BLOCKS 30
+#define MLXBF_PMC_MAX_BLOCKS 40
 #define MLXBF_PMC_MAX_ATTRS 70
 #define MLXBF_PMC_INFO_SZ 4
 #define MLXBF_PMC_REG_SIZE 8
@@ -139,6 +139,7 @@ struct mlxbf_pmc_block_info {
  * @pdev: The kernel structure representing the device
  * @total_blocks: Total number of blocks
  * @tile_count: Number of tiles in the system
+ * @apt_enable: Info on enabled APTs
  * @llt_enable: Info on enabled LLTs
  * @mss_enable: Info on enabled MSSs
  * @group_num: Group number assigned to each valid block
@@ -154,6 +155,7 @@ struct mlxbf_pmc_context {
 	struct platform_device *pdev;
 	u32 total_blocks;
 	u32 tile_count;
+	u8 apt_enable;
 	u8 llt_enable;
 	u8 mss_enable;
 	u32 group_num;
@@ -893,6 +895,107 @@ static const struct mlxbf_pmc_events mlxbf_pmc_clock_events[] = {
 	{ 0x6c, "REFERENCE_WINDOW_WIDTH_REF_156" },
 };
 
+static const struct mlxbf_pmc_events mlxbf_pmc_gga_events[] = {
+	{ 0, "GGA_PERF_DESC_WQE_STRB" },
+	{ 5, "GGA_PERF_DESC_CQE_STRB" },
+	{ 8, "GGA_PERF_DESC_TPT_REQUEST_STRB" },
+	{ 17, "GGA_PERF_DESC_TPT_RESPONSESTRB" },
+	{ 120, "GGA_PERF_DESC_ENGINE0_IN_DATA_STRB" },
+	{ 121, "GGA_PERF_DESC_ENGINE1_IN_DATA_STRB" },
+	{ 122, "GGA_PERF_DESC_ENGINE2_IN_DATA_STRB" },
+	{ 123, "GGA_PERF_DESC_ENGINE3_IN_DATA_STRB" },
+	{ 124, "GGA_PERF_DESC_ENGINE4_IN_DATA_STRB" },
+	{ 125, "GGA_PERF_DESC_ENGINE5_IN_DATA_STRB" },
+	{ 126, "GGA_PERF_DESC_ENGINE6_IN_DATA_STRB" },
+	{ 127, "GGA_PERF_DESC_ENGINE7_IN_DATA_STRB" },
+	{ 128, "GGA_PERF_DESC_ENGINE8_IN_DATA_STRB" },
+	{ 129, "GGA_PERF_DESC_ENGINE9_IN_DATA_STRB" },
+	{ 130, "GGA_PERF_DESC_ENGINE10_IN_DATA_STRB" },
+	{ 131, "GGA_PERF_DESC_ENGINE11_IN_DATA_STRB" },
+	{ 132, "GGA_PERF_DESC_ENGINE12_IN_DATA_STRB" },
+	{ 133, "GGA_PERF_DESC_ENGINE13_IN_DATA_STRB" },
+	{ 134, "GGA_PERF_DESC_ENGINE14_IN_DATA_STRB" },
+	{ 195, "GGA_PERF_DESC_ENGINE0_OUT_DATA_STRB" },
+	{ 196, "GGA_PERF_DESC_ENGINE1_OUT_DATA_STRB" },
+	{ 197, "GGA_PERF_DESC_ENGINE2_OUT_DATA_STRB" },
+	{ 198, "GGA_PERF_DESC_ENGINE3_OUT_DATA_STRB" },
+	{ 199, "GGA_PERF_DESC_ENGINE4_OUT_DATA_STRB" },
+	{ 200, "GGA_PERF_DESC_ENGINE5_OUT_DATA_STRB" },
+	{ 201, "GGA_PERF_DESC_ENGINE6_OUT_DATA_STRB" },
+	{ 202, "GGA_PERF_DESC_ENGINE7_OUT_DATA_STRB" },
+	{ 203, "GGA_PERF_DESC_ENGINE8_OUT_DATA_STRB" },
+	{ 204, "GGA_PERF_DESC_ENGINE9_OUT_DATA_STRB" },
+	{ 205, "GGA_PERF_DESC_ENGINE10_OUT_DATA_STRB" },
+	{ 206, "GGA_PERF_DESC_ENGINE11_OUT_DATA_STRB" },
+	{ 207, "GGA_PERF_DESC_ENGINE12_OUT_DATA_STRB" },
+	{ 208, "GGA_PERF_DESC_ENGINE13_OUT_DATA_STRB" },
+	{ 209, "GGA_PERF_DESC_ENGINE14_OUT_DATA_STRB" },
+};
+
+static const struct mlxbf_pmc_events mlxbf_pmc_apt_events[] = {
+	{ 0, "APT_DATA_0" },
+	{ 1, "APT_DATA_1" },
+	{ 2, "APT_DATA_2" },
+	{ 3, "APT_DATA_3" },
+	{ 4, "APT_DATA_4" },
+	{ 5, "APT_DATA_5" },
+	{ 6, "APT_DATA_6" },
+	{ 7, "APT_DATA_7" },
+	{ 8, "APT_DATA_8" },
+	{ 9, "APT_DATA_9" },
+	{ 10, "APT_DATA_10" },
+	{ 11, "APT_DATA_11" },
+	{ 12, "APT_DATA_12" },
+	{ 13, "APT_DATA_13" },
+	{ 14, "APT_DATA_14" },
+	{ 15, "APT_DATA_15" },
+	{ 16, "APT_DATA_16" },
+	{ 17, "APT_DATA_17" },
+	{ 18, "APT_DATA_18" },
+	{ 19, "APT_DATA_19" },
+	{ 20, "APT_DATA_20" },
+	{ 21, "APT_DATA_21" },
+};
+
+static const struct mlxbf_pmc_events mlxbf_pmc_emi_events[] = {
+	{ 0, "MCH_WR_IN_MCH_REQ_IN_STRB" },
+	{ 10, "MCH_RD_IN_MCH_REQ_IN_STRB" },
+	{ 20, "MCH_RD_RESP_DATA_MCH_RESP_OUT_STRB" },
+	{ 98, "EMI_ARBITER_EARB2CTRL_STRB" },
+	{ 99, "EMI_ARBITER_EARB2CTRL_RAS_STRB" },
+	{ 100, "EMI_ARBITER_EARB2CTRL_CAS_STRB" },
+};
+
+static const struct mlxbf_pmc_events mlxbf_pmc_prnf_events[] = {
+	{ 0, "PRNF_DMA_RD_TLP_REQ" },
+	{ 1, "PRNF_DMA_RD_ICMC_BYPASS_REQ" },
+	{ 8, "PRNF_DMA_RD_TLP_SENT_TO_CHI" },
+	{ 11, "PRNF_DMA_RD_CHI_RES" },
+	{ 17, "PRNF_DMA_RD_TLP_RES_SENT" },
+	{ 18, "PRNF_DMA_WR_WR0_SLICE_ALLOC_RO" },
+	{ 19, "PRNF_DMA_WR_WR0_SLICE_ALLOC_NRO" },
+	{ 24, "PRNF_DMA_WR_WR1_SLICE_ALLOC_RO" },
+	{ 25, "PRNF_DMA_WR_WR1_SLICE_ALLOC_NRO" },
+	{ 30, "PRNF_PIO_POSTED_REQ_PUSH" },
+	{ 31, "PRNF_PIO_POSTED_REQ_POP" },
+	{ 32, "PRNF_PIO_NP_REQ_PUSH" },
+	{ 33, "PRNF_PIO_NP_REQ_POP" },
+	{ 34, "PRNF_PIO_COMP_RO_PUSH" },
+	{ 35, "PRNF_PIO_COMP_RO_POP" },
+	{ 36, "PRNF_PIO_COMP_NRO_PUSH" },
+	{ 37, "PRNF_PIO_COMP_NRO_POP" },
+};
+
+static const struct mlxbf_pmc_events mlxbf_pmc_msn_events[] = {
+	{ 46, "MSN_CORE_MMA_WQE_DONE_PUSH_STRB" },
+	{ 116, "MSN_CORE_MSN2MMA_WQE_STRB" },
+	{ 164, "MSN_CORE_WQE_TOP_TILE_WQE_STRB" },
+	{ 168, "MSN_CORE_TPT_TOP_GGA_REQ_STRB" },
+	{ 171, "MSN_CORE_TPT_TOP_MMA_REQ_STRB" },
+	{ 174, "MSN_CORE_TPT_TOP_GGA_RES_STRB" },
+	{ 177, "MSN_CORE_TPT_TOP_MMA_RES_STRB" },
+};
+
 static struct mlxbf_pmc_context *pmc;
 
 /* UUID used to probe ATF service. */
@@ -1069,6 +1172,21 @@ static const struct mlxbf_pmc_events *mlxbf_pmc_event_list(const char *blk, size
 	} else if (strstr(blk, "clock_measure")) {
 		events = mlxbf_pmc_clock_events;
 		size = ARRAY_SIZE(mlxbf_pmc_clock_events);
+	} else if (strstr(blk, "gga")) {
+		events = mlxbf_pmc_gga_events;
+		size = ARRAY_SIZE(mlxbf_pmc_gga_events);
+	} else if (strstr(blk, "apt")) {
+		events = mlxbf_pmc_apt_events;
+		size = ARRAY_SIZE(mlxbf_pmc_apt_events);
+	} else if (strstr(blk, "emi")) {
+		events = mlxbf_pmc_emi_events;
+		size = ARRAY_SIZE(mlxbf_pmc_emi_events);
+	} else if (strstr(blk, "prnf")) {
+		events = mlxbf_pmc_prnf_events;
+		size = ARRAY_SIZE(mlxbf_pmc_prnf_events);
+	} else if (strstr(blk, "msn")) {
+		events = mlxbf_pmc_msn_events;
+		size = ARRAY_SIZE(mlxbf_pmc_msn_events);
 	} else {
 		events = NULL;
 		size = 0;
@@ -2056,6 +2174,18 @@ static int mlxbf_pmc_map_counters(struct device *dev)
 				continue;
 		}
 
+		/* Create sysfs only for enabled EMI blocks */
+		if (strstr(pmc->block_name[i], "emi") &&
+		    pmc->event_set == MLXBF_PMC_EVENT_SET_BF3) {
+			unsigned int emi_num;
+
+			if (sscanf(pmc->block_name[i], "emi%u", &emi_num) != 1)
+				continue;
+
+			if (!((pmc->mss_enable >> (emi_num / 2)) & 0x1))
+				continue;
+		}
+
 		/* Create sysfs only for enabled LLT blocks */
 		if (strstr(pmc->block_name[i], "llt_miss")) {
 			unsigned int llt_num;
@@ -2075,6 +2205,17 @@ static int mlxbf_pmc_map_counters(struct device *dev)
 				continue;
 		}
 
+		/* Create sysfs only for enabled APT blocks */
+		if (strstr(pmc->block_name[i], "apt")) {
+			unsigned int apt_num;
+
+			if (sscanf(pmc->block_name[i], "apt%u", &apt_num) != 1)
+				continue;
+
+			if (!((pmc->apt_enable >> apt_num) & 0x1))
+				continue;
+		}
+
 		ret = device_property_read_u64_array(dev, pmc->block_name[i],
 						     info, MLXBF_PMC_INFO_SZ);
 		if (ret)
@@ -2171,13 +2312,17 @@ static int mlxbf_pmc_probe(struct platform_device *pdev)
 		return -EFAULT;
 
 	if (device_property_read_u32(dev, "tile_num", &pmc->tile_count)) {
+		if (device_property_read_u8(dev, "apt_enable", &pmc->apt_enable)) {
+			dev_warn(dev, "Number of APTs undefined, ignoring blocks\n");
+			pmc->apt_enable = 0;
+		}
 		if (device_property_read_u8(dev, "llt_enable", &pmc->llt_enable)) {
-			dev_err(dev, "Number of tiles/LLTs undefined\n");
-			return -EINVAL;
+			dev_warn(dev, "Number of LLTs undefined, ignoring blocks\n");
+			pmc->llt_enable = 0;
 		}
 		if (device_property_read_u8(dev, "mss_enable", &pmc->mss_enable)) {
-			dev_err(dev, "Number of tiles/MSSs undefined\n");
-			return -EINVAL;
+			dev_warn(dev, "Number of MSSs undefined, ignoring blocks\n");
+			pmc->mss_enable = 0;
 		}
 	}
 
-- 
2.30.1

