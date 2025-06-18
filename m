Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82819DFA2;
	Wed, 18 Jun 2025 07:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231080; cv=fail; b=jw/nQjwBpWGsfbw3fjvcGF1ElRYSiBYAWxpXmLRMAq/5ORIShp4mUU3zT2BAYLBQwfSd0t5uOPNpILSMi1Xx7POCopcpNgFN9gITx9iGxfUAVPMlvDFMm76QAkpQpajpzyVV+6drqhoEvE8YV2oHdxn8vCTzBWSEUaJOcuQ+pOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231080; c=relaxed/simple;
	bh=LvC05DVt0puEdrIhG7INIVvrbnRxz6MsNk6reYqt7VA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jUDIVFKlAqt5UtYpwO1ftOQBiTMWsEjS51BwT7kCIIXWbAhPw80jlul91Lg7yocBXlId0xkfZcRXn/iWUMKnJbWwuygXSRtPljCCIWHLO7u6kAFIckeV57kll7OSQpIo0XA/IWS1So4USN8eMo+37k4zPaxv8J03Yt/kiC2EzkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Eoavw9RC; arc=fail smtp.client-ip=40.107.96.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Eoavw9RC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7a89/9dAYAwAed/WXlyeuFy7I3Zc92YDsPElhxCAbVk986UQLqlFrj6IrLQyPuy4lRFcj0KpCwceb+omMbqXyV30GXO2TX9RaaPAQgandhhZVe1Vx49em77HMOuYhC254MWpdIKKni82geo8BV+QeZg/vRvdtHac49dlz+L8//CalMFlN45JZ0/YRPMkg+dB3eb7jW4Dt+P72Mmu6lgfmwhdskrYM6lyWEZ2//VSi9leBWhj36LWp4nZJA86u3R3EgWTbNxlg9NzBNHJ6MBhuO2mE51K02KTtq65DckJwNR6WY1kc/7EBFT5dq/7PY2nmQeDvorKAU1z//7too0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9F//+d3SI0sPoAgCiZkEuy0CObKMVucyoSrrKfwAFo=;
 b=eggK+Fn4P+ZcCXLKKCekuuEkgSf4uXJV12/N09iqpfNcs9uO01IiOBA7Ywbn+hsM05HKzTLfywWZwSt32X/l/aMG6F2X/T/DW2Y8aBggmA6qEvBkOptVzFZWO9gWWuCmg3CjPqDb0q81pehudRA0JMxBPmxtWgNe5I/0PjLFOenoiL5PD7jV1K7dY69guSJQl/vvo8HbknEOBdC9pjIg+CjmhRWT5J0Z6SsVWyOYNzgFm60DT9zpQp6I7jokdPm8iPg0tqm1YMC/RP1+oQUJ08CC1CVn6pCsQtLIMKnsmJOBt4yQLCL0sc2LDY6tD/YLkePa2xtdSLPRhH5Cv2D/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9F//+d3SI0sPoAgCiZkEuy0CObKMVucyoSrrKfwAFo=;
 b=Eoavw9RCH+9XIzBpZKJyykXjOLWdJBxov4v0LDtjEtMIUoDEbsJa3GhDyvoxVdp+l8D7Kb83Zr4i18dCd/99xGU0CrHgLyLLAeyyMxG5/azSeL99loP2ZKrMq7hkkIFO9Pt3/b3LAqd08VCJlN8Wa8Bb4DlVphzeNR36yIjiRL2G4XWkGedbNIUtKqyfEh5GN3082M0GMqPAU5cHul2PWbW/1QAn4qzv8noYU7SDpE2hXk8cEU3ZlPD3G8SicUq8EQ1CcNHYldpzMMajyarQeq5ErPsxQWABuLmPivH8AJ2YSAtRPwcBq1MqKLfaxE5e3XbtVAYNcSm3fY5sq1mNYg==
Received: from CH3P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::31)
 by CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 07:17:55 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::70) by CH3P221CA0030.outlook.office365.com
 (2603:10b6:610:1e7::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 18 Jun 2025 07:17:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 07:17:55 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Jun
 2025 00:17:39 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 18 Jun 2025 00:17:39 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 18 Jun 2025 00:17:38 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Check validity of event/enable input
Date: Wed, 18 Jun 2025 03:17:13 -0400
Message-ID: <20250618071713.8595-1-shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|CH0PR12MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: b18b3d23-daae-4c0f-0a43-08ddae383ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lBVndR8VqdPuKxzzza4sVtwk0t1nanASgmNyo7VWC6ko+FQxRdjZFk5tfw8J?=
 =?us-ascii?Q?XPAPYmfAbmfiSTMAcUdW9ixPzQFEvz3oLgYyHmk+g5iKPzp4TBWAVsfYUkPW?=
 =?us-ascii?Q?vB51DOcsiLF7sxqy8Rff3Rte80oKF3RiYvCISg10rjiUP3p02OIskosjNdWb?=
 =?us-ascii?Q?pgiByzc00RJNgbahLRW4fc/sNGFNqvn9DbHQMextYF/szHylX3Ayo+x2AGuJ?=
 =?us-ascii?Q?tUDZVgkzmjPRo6+0ULfL0F7HfUWPlVh6zRuRVd8FpDgH8zAO4jdor/cAEhJZ?=
 =?us-ascii?Q?iaTcIFuLJbPUVq/6QOOCMzJQtoAqsRbGXJ0rlexe7omvvTQ/afkpIJip3o80?=
 =?us-ascii?Q?OOOaZOfoMErUUmG+TbNP5RAZf5rHg3wklKiREVzgW+tctYwauUintd/3luI5?=
 =?us-ascii?Q?4rCzwqq93k86Hi90UFFqZpz3LlbQhbu9j81aZX1pZuPCepj0gJeXFQdxAbE/?=
 =?us-ascii?Q?K46i6Ic3F44f6gNzV9SmPLM8iXtBpTY/TejgQFb9VtxI+C5oLbj/Ub9/wfJB?=
 =?us-ascii?Q?V72akWn5bqu1vDrSzc7Ued+AnNDLxEEys/L94JtiJScKW3Qzk6vIY+XdotVQ?=
 =?us-ascii?Q?Rn7NyUQ+lR0QDZ2GA3vK1c9WYz1R5WLqWdTJ2VxB8fh8UfF0hUqCqdYZtWHP?=
 =?us-ascii?Q?mvEGIRNsiOTM/ilZta5SciQRI83nBU47be3nfuTBLI8814xQzp7Qv8Yy8GQm?=
 =?us-ascii?Q?ELcmXj3WVWEIwnkrkZ6eyNv8spp0aGbe74xbIf2xwTIdHT1CvNDGZjBrnXK/?=
 =?us-ascii?Q?sH2kI59lX7zqBxodulftYKjpZ8vNv0Czo6fQWqn8b5R0+CnEVxuGzZd3QyKR?=
 =?us-ascii?Q?eK23B97hHlV7mBXjTczRlbDzdHC0lSL7MQBE3TQr1+uJV1t4g9bcpieeJiHX?=
 =?us-ascii?Q?VxwjvdmulBV+KQjY3D75NpmuK23wFjk1T2UE1VrCm48/B8YjQ48mFNqI8RmN?=
 =?us-ascii?Q?6n3bVS5ZeOoUXzfjXXXSCiM+dat/83HWwYFy5+qKXgvW1DaRz1F0/aBQ7bPe?=
 =?us-ascii?Q?WMNXrixdrRr081JOTAM/PHx5b0KW3ZwCpE+zrsLF/Mlow1Q/NmBdsZrT11va?=
 =?us-ascii?Q?2LdtVFip+/plubU7nCcJmCs+UEbmtnPczYegMJeS6y1Yi2zZ3NDK36AgRGnh?=
 =?us-ascii?Q?G6Qg/FX2Im3j7f/4adEmf1y1k6UjzGViSLBJX0SfW0c27/ObLiszvoOXsrYT?=
 =?us-ascii?Q?hQ9+6Ycuel9WSm9eZXA+/bO02vBmE1P/jh8yiFQK/2j0BDM1qBmKsST1bgnN?=
 =?us-ascii?Q?1ep9lqfpduSlw1PnCaJrd3a2oCG875Td6OcsKEOF3+8ou1sQm4NUMuJP5lfH?=
 =?us-ascii?Q?OA/NSwANsDrXJ9HFKD+YTgOueyYki15Nwmnv8O97IRRMYlxKkWQ+tJHeMf0h?=
 =?us-ascii?Q?qjoF7S1er+IrBjlByBSe+0bAyY+lM9Og6q7KQleBpkxB3wSgONnprHusFUHY?=
 =?us-ascii?Q?te5j+j5dxZW/fhbRVo+BsVUP8smZd2SAz/WYPx7jm5XttN5aMNNrcrWHXVv3?=
 =?us-ascii?Q?2enD1eURATThbD469jDjjsVrA2AfeJXILeGM?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:17:55.2438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18b3d23-daae-4c0f-0a43-08ddae383ef2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577

For eventN input, check if the event is part of the event list
supported by the block.
For enable input, do not accept values other than 0 or 1.
Also replace sprintf instance with snprintf.

Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 900069eb186e..fcc3392ff150 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1215,14 +1215,14 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
 		return -EINVAL;
 
 	for (i = 0; i < size; ++i) {
-		if (!strcmp(evt, events[i].evt_name))
+		if (!strncmp(evt, events[i].evt_name, strlen(events[i].evt_name)))
 			return events[i].evt_num;
 	}
 
 	return -ENODEV;
 }
 
-/* Get the event number given the name */
+/* Get the event name given the number */
 static char *mlxbf_pmc_get_event_name(const char *blk, u32 evt)
 {
 	const struct mlxbf_pmc_events *events;
@@ -1799,6 +1799,9 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 		err = kstrtouint(buf, 0, &evt_num);
 		if (err < 0)
 			return err;
+
+		if (!mlxbf_pmc_get_event_name(pmc->block_name[blk_num], evt_num))
+			return -EINVAL;
 	}
 
 	if (strstr(pmc->block_name[blk_num], "l3cache"))
@@ -1889,6 +1892,9 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 	if (err < 0)
 		return err;
 
+	if (en != 0 && en != 1)
+		return -EINVAL;
+
 	if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_CRSPACE) {
 		err = mlxbf_pmc_readl(pmc->block[blk_num].mmio_base +
 			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
@@ -1905,9 +1911,6 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
 			MLXBF_PMC_WRITE_REG_32, word);
 	} else {
-		if (en && en != 1)
-			return -EINVAL;
-
 		err = mlxbf_pmc_config_l3_counters(blk_num, false, !!en);
 		if (err)
 			return err;
-- 
2.30.1

