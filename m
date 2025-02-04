Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF020C494
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689230; cv=fail; b=PPhI9odxZdTbVVK5VAaucODM6vW+yUAir6um6A/y0sQbGu30ZzTq6GYFuXflDSw2uaR53YHbK7Ky7kgyb/1DlLnBf60NrOksNN0vo/UyAgzzAWq0lH429CgYveciRSDak5xhdlzAszpLG7/9LAm5nh3bmjH7D1R91qNDDtmwEmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689230; c=relaxed/simple;
	bh=Y9CJeJSxRItquIvTr1kUEUvTWJZYnrjKuCd0siVHgeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=bL8ljZ2sJjSiSZGIBIA4okg1MgyucaZkKUDtvVtG0KAeX3qHRxTvVsOqC1ouqRwpYQRWOpA2rwa75hCVeFbRG9t384D+sP0yzvUUkn/Fe+jPmhYT/tC9m/41rwEPv7LGdSyE0IdyVQqKgqhc1Noo/soMenuZgRhQVlRjQYJveQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZJZ313wv; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZJZ313wv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n15LJdR05k/gbDs8GRiWAqLxbKw3Whty03w6jk7IZhbB2tbEDcSgXJnc5rG3RvS75tDfwHQ6hSi4tc7qmE1V4if/PAkufE6QqdXhY+J1wQACqI61wC8yYQLE4k7inpszBGp1Nb6g9vfDtUJpff+0Bom4c9XjdVVTbhlBf5a+Jtmxpd2H4VAtc8Wm5IhSenVlm17Vj5A54N+4P0DB94pqDeekO1FUjfPUTnIYNAOoMcAysCwgdOC08L4LGkVTzDslJcmd8itzHWWvtXbglYSzEyjp30kIzeuET+StB+HRsUHazxxQg95C7M0hKGGW1MjwYehFk2Y9fE79y7tSgRMWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irR5rNA3tCmCdTPDtPHKDH+VxshxuRJkkYS3eNdav+M=;
 b=g3fM8ljod5O8sEhksy0FjS/Mvxvsaj0LN7F1cZyiOxNzaTwhFj53/6niQVZD0hlVm0rlUXGKZGnFzRJjSjY/xu9Q6yJ8VkZr0rXxo+F1Uoby2S8ul5vhzpwLV58JM4h7fxKXzkAnMNt1BZePtIko9c/Fc2Wz8TUwnImNL+oOufSTq+FFXmmgiCbdkYEUX6+GlvEkeHPeqTuxlw9So9JQaw9KknkikaUq2WuldrXnR78Q+bO76o8/VXpTn/k6NpTd00xCFOtN2FUrfjSvxzafHTuj1CCG2LKeWtMrFhRNi8HgsGX0A3RALclLI5dA/m9t041znewzk3ExYmFGj3HTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irR5rNA3tCmCdTPDtPHKDH+VxshxuRJkkYS3eNdav+M=;
 b=ZJZ313wvMnwOC7k3/nf6bq47W+SVEwgec02CLFJ63kagGMcNt8QwFGjnjv7tZkfl+f4afTHx9FQiDBqEe1rat5vYLtYywUIQevYosI4yQkVNd7Dt2lmwCHIzeKRq4iPdhYd3A+oMYGYrxiEfnfalTiKogfTA9yH+Rxiw0FJcbyk=
Received: from PH7PR02CA0010.namprd02.prod.outlook.com (2603:10b6:510:33d::29)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Tue, 4 Feb
 2025 17:13:45 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::6e) by PH7PR02CA0010.outlook.office365.com
 (2603:10b6:510:33d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Tue,
 4 Feb 2025 17:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 4 Feb 2025 17:13:44 +0000
Received: from [127.0.1.1] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 11:13:41 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Tue, 4 Feb 2025 17:13:16 +0000
Subject: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
X-B4-Tracking: v=1; b=H4sIAKtKomcC/x3MQQrCQAyF4auUrA2Ow2hbryIu0pq2QRslERVK7
 250+cN73wLOJuxwrBYwfonLXSN2mwr6iXRklEs05JT3KaeCg3xwZJ3Jr/gmUyxNS4fSpLpuB4j
 bwzg2f/J0ju7IGTsj7acfNJPoTZS3ITzZYF2/jBIGE4QAAAA=
X-Change-ID: 20250204-fix-genmask-warn-489a6480779f
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
X-Mailer: b4 0.15-dev-e27d6
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: d323e9e6-af0a-44e4-bda5-08dd453f4814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFEwN0htVzBHV0hCZXJTcko2dmtzMWVYYXA2SzVPNzZvMFFUUFB2N3pUU0J4?=
 =?utf-8?B?ZWRGNFZQL1dNRkxPeVZUL1l3anJaRkxQRVlPRWxIUjVYMC9yQmVDN0Z1bHBG?=
 =?utf-8?B?TU5pVzBjOG5VTWVWZEpjc09IMkh2ekRnMHNFeVBiekNaVzFjTEpMVzBha3Jn?=
 =?utf-8?B?UnRoano2RVNVM2tLLzVjRk1JeklneGo3UjZhZnhnVjdldTB2dWFPWTVrRWhQ?=
 =?utf-8?B?YWQyVWNvbDd3QmFmTnJQWjNOWUpkSXJEWTROekRlbjRNSDB1OVpreGNNWXZZ?=
 =?utf-8?B?WGs0aFQzelJUUzBaUllKcUV3RnN5dCt1MVB6OG5WSDBKeVdTeWlPSC9penJU?=
 =?utf-8?B?S3VkL0dDRzBXWmJkejRHMmN0OHlVM0NLN3RoTDIyeFlJQ0JPakd0dFAyRjJF?=
 =?utf-8?B?TlY3cVNweXBtZXF1MUNkeURCeFJEUjdrOVpSamtOUXhkclFJZTBFRElQVGZ3?=
 =?utf-8?B?dFlmU1FEbHRnQ09mT3JxczBNeVdjSzBjWlNsVDF1OUxGUStYTFFJR2VSby9J?=
 =?utf-8?B?RU85dHBZQThMRW9nRnFidFR6Vzk0dlEvQnlsTlJaWUMzaDFjUFdEU3lINndX?=
 =?utf-8?B?cW01dXA0RDVoUDVwQWY5WlZjVXY5b3IwL3lKR0hrdEo2SURUN3pvMXpjTTJQ?=
 =?utf-8?B?YzZNa1VwaU5aR09BQkpKSTkwT21IbnBQL3czSURpUTljcHBuM0FpV3NwOHNB?=
 =?utf-8?B?NTQ2TEY0aFBubE1LZkw3cVA0SExxWXdaOTRNNEpTZ1Z3WVA5RGloYmZaT2tB?=
 =?utf-8?B?eHF4bHJQRmVtNmF4bWFHS1BPUzg1ZWhkM0ZBNm9YeWFWcFlUMjV5aGszODVX?=
 =?utf-8?B?M05wS25oRFVhU3FqNUNiZjJyNjlNUGRrN1FlL005cnlqTXl3N1dJU3BDYkNS?=
 =?utf-8?B?allzN1NCLzZxc0pKRmsxR01zL2hidk81VW16dHBRSkhkUVVyMHhaRVFyM3hS?=
 =?utf-8?B?NFhBZzMxR00wVDcyYjhIM2ZQK1hWRFUzK0lrUDBVZDN4dnNqKyt3WUhhZURC?=
 =?utf-8?B?RWd1ZzBTU1huQTBzT2g3SG5UeFViV3NNLzQ4cG91SHFNSDh3Mm1hd3BYcTkx?=
 =?utf-8?B?Vmt6bHZ2T2RPR3NFZ1BCRkpDYnBzL29CbTh0SXJrN2lDdHJQRE9ieWhIVCtv?=
 =?utf-8?B?azk5cmNkU053SGZodmVLMncvTGN6MVNzQi9vZzg0RjNCMjVSaEk5Y1pEdVAw?=
 =?utf-8?B?N1h0ZSs5VXowL3ZxbnMraW9YWGg4WE9nTnpsd25PV1paSlp6dFdvcWFoV1dm?=
 =?utf-8?B?eSt2WEVhTkR3OGMrOWR1V29ycDBBU1VVcG1oN1NvMTRNaHFJTXJYTE5pYWdP?=
 =?utf-8?B?c0FEL21oMFVaM2l1RnlOQ3pYUWRmUGFteXh5REJPT3lVbmF3Y1NUZkVNQ1hX?=
 =?utf-8?B?c2FMS3doaEZvdllwNjhBbmg5R0E5dERiMVoraU14RFhySDNyVnpKNnZGOTFT?=
 =?utf-8?B?Yi9PQ1NCU2ZnbHVtL2xhQlRYZTdWbGwwaUlhdW1nRE9XQkdBVmJOcGhST2tW?=
 =?utf-8?B?UlVQd0xtWDI1REdtN2RETGh4MThaeUVBeEJyZnZWaWYrWmtoV3NxQ2I0L2Ro?=
 =?utf-8?B?TXFoOU04RlRjOW5abmt1Q210V1R5UFU2NW5LNmFjNjM3VGxibnlvaHh5SHl3?=
 =?utf-8?B?ZmpxV2xhTTRPejBZTG1QRDlvd1Y3R1UwNjZvMVgyV3MwUTlObHllOWxoVjdk?=
 =?utf-8?B?T2RYQjhJdUszZ01CaUlJbzR1ZnZ0NTFVM3ZiZVIvMm5YTlpYTE9MR1IveGp2?=
 =?utf-8?B?QUJ0VU1UWnh3WDNkMkNIbFpyYjU3a1E5ZEhGNGRxZWorVVdmMWtLbWVxcXd3?=
 =?utf-8?B?cnNld0NQcUpINmJOcVV2QVhGYWtTdTZmUXhMcVIyRmZKS3pzTzdDQVRmb1F4?=
 =?utf-8?B?Q1NKMEY3SG1LTGNxNGtmZTVNaEsxRnd2YmhCZGF0ZHJMUVM4OUhUQ3c3aWtZ?=
 =?utf-8?B?d0lvSlRHSzlvSTZuNXQyZS9hYnRWWjBEWDQ0dnNoay9LMnd5ZGpRNmhJaS90?=
 =?utf-8?Q?ULgWhjVKuEytNSyNMbplI41cxV029c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 17:13:44.9334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d323e9e6-af0a-44e4-bda5-08dd453f4814
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100

Cast inputs to 'long' to avoid the following 'type-limits' warning:
  warning: comparison of unsigned expression in ‘< 0’ is always false

The 'long' type can hold +/- 2G which far exceeds valid inputs for the
GENMASK helpers (current max use is 128 bits).

Idea is similar to implementation in __is_nonneg().

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
Note to maintainers:
I found some previous discussions on this topic in the mailing list
archives. The upstream code has changed a bit since then, and this
proposed solution seems fairly simple when based on the latest code.

I figured I'd look at something outside my normal focus areas. I
apologize for the noise if this solution is too naive or incomplete.

Thanks!
---
 include/linux/bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 61a75d3f294b..318346f2a5a6 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -21,7 +21,7 @@
 #if !defined(__ASSEMBLY__)
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
-#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
+#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((long)(l) > (long)(h)))
 #else
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,

---
base-commit: 0de63bb7d91975e73338300a57c54b93d3cc151c
change-id: 20250204-fix-genmask-warn-489a6480779f

