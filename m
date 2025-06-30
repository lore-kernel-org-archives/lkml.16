Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406C285411;
	Mon, 30 Jun 2025 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290057; cv=fail; b=rdCmnvTzGMvmbNWwDdhBxgykuUOdiaU8G2QLlwmIfeuimEMyAx8hzA4YQgmJg9+1hWL4GU2/JP7y4tkmAMQHURN98dg/JUf72DGuxc35pq9gV/dZ6ECi4y6NvsVrq35iLUCbY/zwAp4M1PNab5HqYO8jUgOkOL2Q7S1tVvulp/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290057; c=relaxed/simple;
	bh=4FbeuXNdmaL3JWU2CndtXMStj+vZinBYkfbsZ5v5szI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYp1kzPY//nDS+HRVH0Dq9aTxHO6Mc63PCzrtS/tCR5Ky36NkF4Kayn93MzfleQoWhChK+x+tzsEBxifO8VOnW25V4TqfLVpdUcWZROo97W7L943Db3FCENXRmtJUC3n9khBdFDoWxaxMVExQoW5uFCFbZNwyJicITMzlm2CUoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ffTCHxsn; arc=fail smtp.client-ip=40.107.95.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ffTCHxsn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QgK0IV0Y+vIkaQB/AxW1H3updGlMEx8z7vBdCmbtRrRwbjVaIawwJaKyKELsndGaBWVHqsr92nwIUIn2a9AVoaG0XneYlylduhCXEvIVVQua99FTqLUqSoLgX6jRVh5dQ6tGlNufn5r2v4vF6f0N3KQTTtgqfG5dPtmbw2clKoRMWs07HSfh/h8rHD6/7JNqc5lhEtBJyFZw8wAzSiwcGdoFv2vFU7heORp5XfBL5blLzHOeGdQqCPTuCeueJI7bKxdwyM7yZKb3e0yuHWEdoe/ddr7Xn/wekD8/i39GANnQEYASHq0y8cYL/NLDwlhKHsUMohWRuPi6mjOAu06QrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=as8IjUL8jY1u32RMROtMEA5PH/U8ec8UZ8/vmvdks5A=;
 b=PxlJguNyiTfh0EFY4C8EDKBEUnSTOYoBXSuGwJ3CYkAdUkjavTtP4tD/ohmjenaevOrCF2ov19umnT3FXVPC0g7J1BIofD9NMG+he/a/DN5p0m9s1Kf6B5DDllJHIAhuQ3JXo5++xuL+7tP4h4LDoONbtw3u1dytdqizlNf7E1QeyHvdhtAasMjXvxrqKoFgmFwtOOut/W852SO7OEWW0hiqwn5Ke0gsfykyVjxXfjcltSpfsxyeokk7oB8ueIr8doqXLpQxxoZelybUnAsqg6fzMKXyx8QUwC020a7FgbTMSDMFLzhU4wa04NbUUiM+SGLrS44NffBtg4+002Fj0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=as8IjUL8jY1u32RMROtMEA5PH/U8ec8UZ8/vmvdks5A=;
 b=ffTCHxsnYZYcPft6qzrR1yfkGgXax9XC6IyaqqCglRV29ztbr5Ms//R75OW5o5k6P5EqSPVgGA+mytFI+OPKDr9CuEIOvAiBxiN+NQbjHQr5hr8itp5pjOJrjb5hWijhYzhLLgr5+B6dhavTyHMnRS0Ptjz/2aVuMkkbldZEsLyeMDEK0bIlNs3MIIklSSCLBfpsGKw+FOqtCRkE+Yu0FpQAjuaBp6fSyKNDbOW9Q4krm9amHjw4X7ihLDdFnMdVINiBUYY/sR9Se8z4CMTQAk90rCV7fDu93zKnkmVBTyWAWtGpwK/hL9uXUyHuSig6yko3jwW/AJMMSvZA2eE1jw==
Received: from BY3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:254::24)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Mon, 30 Jun
 2025 13:27:32 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::e9) by BY3PR05CA0019.outlook.office365.com
 (2603:10b6:a03:254::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.16 via Frontend Transport; Mon,
 30 Jun 2025 13:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 13:27:31 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 06:27:10 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 30 Jun
 2025 06:27:09 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 30
 Jun 2025 06:27:08 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthomspson@nvidia.com>
Subject: [PATCH v3 1/2] platform/mellanox: mlxbf-pmc: Remove newline char from event name input
Date: Mon, 30 Jun 2025 09:26:56 -0400
Message-ID: <cd2607b381630c0ae5ef7c86a4ab7e75c86d276c.1751286845.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1751286845.git.shravankr@nvidia.com>
References: <cover.1751286845.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DS7PR12MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5f154a-4949-4baf-4581-08ddb7d9ddc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aPZMrpoPCKnnbpypzUbRf6FtwuqI5rAZribtQCeYZxopnR411MLu5qrujMSS?=
 =?us-ascii?Q?5rOdxN4dONEzmsndpV2gRTj5Dm8uLmIjehhXuYoo94KIKtNh86+PcF5TnWlh?=
 =?us-ascii?Q?HZpm+6IMRNpNfl1mjhvzZYk1bwyHuZnoIzpH67yN8mCYflZh44SfzsZRE4ka?=
 =?us-ascii?Q?51zaKmdmsxzJvhuz0Nz9Bnw9g9SvKdFDR0iAaH/WmbVdZWtyyThWkewdlc3d?=
 =?us-ascii?Q?PdwUvZZnXZ5jUUVUA6rnh0cwR/bLID50SIL8MwQ2NYwZTLZHxCeAHj65K8Ui?=
 =?us-ascii?Q?7KvDdvp6V3RPAki7mo0Iu1zFxsk5S0UJGhLsz/W+fH6Xg4fiTMK0wjUhSV5a?=
 =?us-ascii?Q?4l0Ku5lAsPr7N/q+yoxxEpy/TXnFIHs4OaojIZ2xVjdfe5vOBmYlXlgNGrt4?=
 =?us-ascii?Q?FVMd5V/hQMcT5+511bCXfmY3FewESoQu0RRN6D/2WphQlFjei904mhv6J4fL?=
 =?us-ascii?Q?5HWcrgUOB2Kjk2AEZUPbRJb/kglB9/UUQ4ttbxvpd7w3oo4luIOXjyYV2zOr?=
 =?us-ascii?Q?GGhk+9VusC8l/ngfUDRPnb81Ycb7q/21yqwXyoqrUlAC+5w38LSOAA0LwI5t?=
 =?us-ascii?Q?JqQnC6zRljteRe1rncQi7L3YqC5/pnhNkNhvJ4jZnpeV+h5s2tQE70b3UKXW?=
 =?us-ascii?Q?BRyE6dq+Kqgqa0bIba/S0vr0raYdg6l4PfbNo+iZkkaWnrG6culkFkmHhuBI?=
 =?us-ascii?Q?MrApRK5DUO3gDYH2/WboPu1OluPtSyMce5AjagDaa9NPOvrZZnhfvG5cKQAc?=
 =?us-ascii?Q?Pa/v+6OCYOsPUkGM0hchl2BQ/pdaIcLjKQbMciQCC51GtcTUqTI/U8cz8jUH?=
 =?us-ascii?Q?f7iKJ7fkFEoxMWYQIsYqzAn7uFAeZID5mS7XkWM4mae3+Nsd4I2QYaDNRbUy?=
 =?us-ascii?Q?nODTbgjAhc6UqUI0zf/0Vt14BPtRKOPqixZOC2jod77W1LOL60ea4W7P9Huk?=
 =?us-ascii?Q?IKlTVIhgPx/2zj19jEgcWhS/wAZ2hnPBF2r9+ySmzqxM0TodR6+AyWOoRbNf?=
 =?us-ascii?Q?qD4KgRKx+rUSKmh6wDAkvSYnCgWE2ErylRpRgoAREB1kgY3nXfJa1aju/ULT?=
 =?us-ascii?Q?+UVAJ28/C0o50NPOUVRM69RZqeKAP7BeHGHlzR7js1DOps9xBZ2Y7OSpBdaP?=
 =?us-ascii?Q?Rxw+pvqPQWRoYO2b6+oVtWUeZ8LEHbK93Q1VFBjgk0IFmo4nPCpFYx167JGS?=
 =?us-ascii?Q?9dA3VXclN0vp7oGFMcS1WuVLlcVxGs8UL5bhp4WqohSi7Nslsn5tlntBewo4?=
 =?us-ascii?Q?UM5tln6I5xxYmSOGO/qHpOKDJDaB+J59wFVO72jusuA5ekHDkPV2Rpbiihyk?=
 =?us-ascii?Q?RuS3UIETayBW1d3o05+v0/n2ABzRhjy9YIFoZjAqn2QD4Jkk8aoKbCEvfjCV?=
 =?us-ascii?Q?eILuWqsh3xgExMiZcbx5DL7fc8vsW59ChJH8uKVUUsqHUVdpTaBHlbSU5x1/?=
 =?us-ascii?Q?JtHyiMVUbj8DH0g43u543ZWO1OWz3iyGTsEysnByqeIKHJ1InE7fsNrNNJuL?=
 =?us-ascii?Q?klIxgtp9HJReck+Nn/CC3TS9LMCa3M54aKGH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:27:31.1556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5f154a-4949-4baf-4581-08ddb7d9ddc6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983

Since the input string passed via the command line appends a newline char,
it needs to be removed before comparison with the event_list.

Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthomspson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 900069eb186e..16cc909aecab 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1204,9 +1204,10 @@ static bool mlxbf_pmc_event_supported(const char *blk)
 }
 
 /* Get the event number given the name */
-static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
+static int mlxbf_pmc_get_event_num(const char *blk, char *evt)
 {
 	const struct mlxbf_pmc_events *events;
+	int len = strlen(evt);
 	unsigned int i;
 	size_t size;
 
@@ -1214,6 +1215,10 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
 	if (!events)
 		return -EINVAL;
 
+	/* Remove the trailing newline character if present */
+	if (evt[len - 1] == '\n')
+		evt[len - 1] = '\0';
+
 	for (i = 0; i < size; ++i) {
 		if (!strcmp(evt, events[i].evt_name))
 			return events[i].evt_num;
@@ -1681,7 +1686,7 @@ static ssize_t mlxbf_pmc_counter_show(struct device *dev,
 			return -EINVAL;
 	} else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER) {
 		offset = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
-						 attr->attr.name);
+						 (char *)attr->attr.name);
 		if (offset < 0)
 			return -EINVAL;
 		if (mlxbf_pmc_read_reg(blk_num, offset, &value))
@@ -1730,7 +1735,7 @@ static ssize_t mlxbf_pmc_counter_store(struct device *dev,
 			return err;
 	} else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER) {
 		offset = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
-						 attr->attr.name);
+						 (char *)attr->attr.name);
 		if (offset < 0)
 			return -EINVAL;
 		err = mlxbf_pmc_write_reg(blk_num, offset, data);
@@ -1792,7 +1797,7 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 
 	if (isalpha(buf[0])) {
 		evt_num = mlxbf_pmc_get_event_num(pmc->block_name[blk_num],
-						  buf);
+						  (char *)buf);
 		if (evt_num < 0)
 			return -EINVAL;
 	} else {
-- 
2.43.2

