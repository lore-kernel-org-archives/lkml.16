Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED21EE7CB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738268028; cv=fail; b=gOXLNuDsF2YzqpQllVDymRqYTItnN9jDW+Me3++qNS0+MJy1yTnge1LSPPg7YyzOI2pmWXt3OAV5PmHrCIMDyXqjsa7tv6079zn5941licqAXe9l+aGkiyGiKyKxQghtOrQqhXEVuyuMC605LR5f4GznH+rIK9nth8Vy73bs5cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738268028; c=relaxed/simple;
	bh=2DXkoZfqO1ycHo0hVZm/8U0xH2dX2itENQtep9D8coo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L6aBbLJ8ddYIzfCmbM2BjWFaY2nIGKQLlcNJdoQjcaLLWJM94z1/pKSQ15nxg0cO8tWU7E4oPSRzKGx65poPbxkoba6U65nxKec3SWZgeQORUjOeVEjnFgZwbbMYV/fcWM055sFEm71qFJ1FWER+uKgKPChCi1BSUSVIvJNW84E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BzRjAFYV; arc=fail smtp.client-ip=40.107.93.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BzRjAFYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HERhAq57QIeYPxHAeEh76gSmVZaC8W5U3LzdITVeHHg8KDeeMyyNDIlKDPKObDmx/TUm5sXrH3sbmyki2VWf+hvQ1fJttE5NThjlc7LIoeVxS3SvIU/aSBunwaldTjhrDNF30UnWcPfBMuI91NZl9z+alkZEGwIxEFav47tFisPUhes3UJy6QngH5ja/yHi+80DD9ViA7Ax8+tDqdxgLpnu65r2zVHL+Hldrd/ybPWPQs0vQ1o7bJ3uGYZLd2SywqYk8CKJdHl3k4jUfDVT4j5LsKyggsQ1u3WHGTT6GejHFDRauSyE0J1bjFYeLiadcLzNyo9wGorvW8GV22MHsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfzDeC1qh6MXHGAFq12VtcBVwuLwrpgrcCAdnfRyPhQ=;
 b=N1VECaoalnv8G6emYhxiBO4bDc2udycONIj9q4moQmPJJqVRMmsz0jG6zhg9trRW9dNYeadKV/KI8QERJQqpvUtkyAh5P+4KA0s+z3YtP2RmTZRm0dX2AgvvTqjO0V3jkrT0RpHp5T/b1xjj3vUfd2HStycb40CBgelJrEaigbMSM2na7QJB6nY+D6ZiveM/KroTwg0aMOIHB2UQymm7rcjWRYt4j5YmJS8liY1cYK6tPpmKweYlIaw9aPYfFqlEEBA6QBgeC1s31u9LbEuYAqlGEMSvOW2GQxr5NQgbgHsZU8g1nUC9qxmh+kY3S00cNgi6leIxeozDgQwgQzmApw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfzDeC1qh6MXHGAFq12VtcBVwuLwrpgrcCAdnfRyPhQ=;
 b=BzRjAFYVXpHF3WEQ8HkeXPgsLRWmwFNDCJZVtmKBaUznJYpycyLRxIHKB6FnalWAhd4tYhPd7iBB3EUtpSwvS1DIqovfqXoBc8kC/ZGrkR7jrXf4YrGKRWbEAMeF0XV9Okm8xjD/PBRcRDjLtvEkSxpKeBenT+BrjZhHme2VDRM=
Received: from MW4PR04CA0191.namprd04.prod.outlook.com (2603:10b6:303:86::16)
 by DM4PR12MB8473.namprd12.prod.outlook.com (2603:10b6:8:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 20:13:42 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::d1) by MW4PR04CA0191.outlook.office365.com
 (2603:10b6:303:86::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Thu,
 30 Jan 2025 20:13:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 20:13:42 +0000
Received: from purico-9eb2host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 30 Jan
 2025 14:13:40 -0600
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <tools@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <konstantin@linuxfoundation.org>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH] b4: Include git notes when generating patches
Date: Thu, 30 Jan 2025 20:13:31 +0000
Message-ID: <20250130201331.73584-1-yazen.ghannam@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DM4PR12MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: cfafc16f-533a-4793-0d11-08dd416a97a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4KhfFGsmsQagVc8K71BMJv7W9+j9UzVYm8K54Gow2rdLIX6LdGTeD2KNCwFW?=
 =?us-ascii?Q?DxR+8CgPOaVBLn2sQm9F61yV4K0edzmuIw7sb6Xz/FrflwtxxVCtX3AM97k6?=
 =?us-ascii?Q?A3sbUMvwPjgvKhnA+v8xhYTeEj95zpiNUBF8yZweNCp064H7V5Ko3Pd5WYCU?=
 =?us-ascii?Q?+b7AQsFRU+1YSZbZ0QEITDBpik8uRFZtim8W9LSHACCEU3Wvw8HuKy9CflNQ?=
 =?us-ascii?Q?F1nhsrF/LD+EVzjWDIsds6DKjykFjxQ8Mk5y/i5QjJSEKrLagbzuBUDm1U+S?=
 =?us-ascii?Q?jC/DPPFNbGjUz9KdYglKoa3HapfywAO00xEisgZpSDC4m6f2isD9EY3hnb0n?=
 =?us-ascii?Q?37UYv/p1WhAq/vSgyoKIG8nFC82cUpv+L+c2skSO0walh7qRex8ZdMLeqjvU?=
 =?us-ascii?Q?O0tIGECJCk+Kf/PSi0bsfvyH/hkSE1VZQvpdwk8asEvgaqxlM/LnFqA/ksUw?=
 =?us-ascii?Q?AQrzumB7HS5tpwQ5heZ1e0kB8hdukCDSyqbYMUsIJ93r8rT3H1ajJ4iFQqBV?=
 =?us-ascii?Q?k0ccZ+FU1ZjsyX0R1Gwj3X4drySWE4RS/b8lEmEDJW7rBDaGRuNk/AfzNSDT?=
 =?us-ascii?Q?M6J5MKuUuNHmdVT0Fvnvwe+qX5ch8EIYOX17sKxZgMPwdeSUTovePC8cnyMc?=
 =?us-ascii?Q?iMRH7y0ezH6+SEDDgoPCqaNP+vlolIANNQ12TMfwLfbZFlzyF4g7bKYrwSUw?=
 =?us-ascii?Q?d1JzmTkZ1y01iUK9zPLgvaOHESrX70HZ1oOyxYyMk+D7HUMVdMEi3R28XMPn?=
 =?us-ascii?Q?dU6hhyQSXasKh3vntpnxUhA+lbqd1M9GQTXrBRZ5oA4kwPrEcw72EIPZ+Wq3?=
 =?us-ascii?Q?RfKZ9NerncNAnteFLAzvg29LaLJ+x7C3vGGrEUVH/gny8Mh/SHD3e3VRR9gp?=
 =?us-ascii?Q?72bapo8A9r5FYRE36rCVeLZocdeT1ESXtsyGmcCxBWcYyNyZ5WCO7BnRYsr+?=
 =?us-ascii?Q?LNKqpHoW8jgTjO1XmCBJGXOz+NI8pviquasHRg8hqSVw847FF2g5Bs0r8aob?=
 =?us-ascii?Q?uQbIx+fF7sCTI3Y/NwDefLWXMyy8QAgUkcE82yf1k7H0wgGPHuvHd6/+8l2z?=
 =?us-ascii?Q?Gx0rsAB+QblTwvG8zxsbF+taNj7m2oaFM4bvPOx1ogq1xgJb+OUcAFYxu2Yh?=
 =?us-ascii?Q?fxXFPLlj9Ee5wlJNMWuSQtWTh9wexF11uBvxTur/FZ0raVhboBYlx5B7G5UQ?=
 =?us-ascii?Q?iWLX5mq3/q3eT3XvKiA8fSZVcEdgAKkTSIxz/ss1kvBsRI3AKh1Y0S3YFLDT?=
 =?us-ascii?Q?2NNhz/g4OrbKh0XKobkaj0+KbkNNHwUep24/RUoeoOivwTA3/aGGANk2AHF/?=
 =?us-ascii?Q?TrBuRgKCUbHIpuFm/tzyWdWzDBv5j/KqzrD2da9bMLkrpHObRHpq6QED7DwD?=
 =?us-ascii?Q?J98RhxZWerw5Z/N2SrzWiJtoQlSsvZIShC7sn6u1jgzFAOKvifKCgsiqhuC+?=
 =?us-ascii?Q?6gsDVRgeO31RNNPJ6ZrofMRFwPfQcOU+esMMm230d9/u/VsHWOMXdBz0jFaG?=
 =?us-ascii?Q?necmpCNk/RkOYtU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 20:13:42.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfafc16f-533a-4793-0d11-08dd416a97a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8473

By default, 'git show' will include git notes in its output. However,
this is not the case if '--format', or related flags, are given.

Include the '--notes' flag to include git notes in the generated patch.

This should have no effect on non-users of git notes.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 4d234e01d993..23ee39bdabf9 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3487,6 +3487,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             gitdir,
             [
                 'show',
+                '--notes',
                 '--format=email',
                 '--binary',
                 '--patch-with-stat',
-- 
2.43.0

