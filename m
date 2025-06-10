Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6D238143
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573263; cv=fail; b=bpGEDH1gtkZ1FlMtvhYQUDSS3yQ0nHXLDbEo0eQ235I7kA141V9/SfH+hxX1MMQhXik/dO6UmjFBtMFMukSbb5o8alGq5RDpvEFRX0JNReOO7VeoBvn4DeuMTu6N0zWWmUAuErY3OUyjFdKGxkx9Qz4dVyhfG6CVl2c9w8fPd6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573263; c=relaxed/simple;
	bh=igiHQl1detnN329c1z3aA81QWUWo1XSex89c3CQAl5g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d7ONv724BqeFkz3RMjQfRadXcs40U6EH5UOBbXcN6thhktfd9ouPZ8Z32pd+mVxnwp/dyoV2X0rdpg+qwMGtpr7WGhHxFCNZcH47Ysme3ZCHTAbYhjSl9ZvarzOqHTYhsDNPgaySLhUDptgPymUlv6SOVzxzxWQCD0dcmcY5smg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gs7GGOzD; arc=fail smtp.client-ip=40.107.101.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gs7GGOzD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gK/AJRxm+YG349WbgRLPsIEw1Zf7MmRiv2PU7wCyjHWN6hc2mDqr7xebtaQx8x3b4OtnfxTy8V3oMFUokLXqZ2N/9LHM/2d37rhKoRCZvK2jWXkdNOepe0Lw4P4fznLCwvedCEohDZGSCcgOquGEgmAwNSYGEBvhzg7GiU9MBlL+czmdo+ihjTbvBzyOot+bGlEmTK6M3+qDOnPUNmTXZc8i0+3QNoShHEBwfQAWHxVygGuXcTp47qqlNxaKXdK8XghRlHASa8cetPnPAu2D++5jVop3jo1sxU15fxcQtC1uR5tZSKP6FiKMPnri4tlOseIVCZQuBKqEFJsZ9DSmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKoc4i8xMgkEoVszBXFmnuUw3+nUOwYLg27Ole5T7Jg=;
 b=y1foKbD1OX73diKgaLQ8OVnm7zhLdbnfmM2uNgmEehXWpZmD6UGCHZb18tFLTVGGpxFwSNNsoX+dRBvoiFUWJctKcum86lz1Iqzmz5YcsiYBTG0+uu2Dvy0lMErlajrpgBwTg0x4TbJNRSxLn8/fkAqMy++4vugaasFGfwYllufKLPVTlNxgvQku8RVPPs2w+pntyrB6XR70Uupo24vil6+LbJL3ust25Js9kvTDgmo/pEnQgzUeRrnWcSYOuiXqjwEoSI1jF644b2JIznoJsciGI27KU4MzAxzaSs77RNl1se/V3tbrPqtfnKqJy5lB+NAQugDuZYitpg8/l5OC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=canonical.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKoc4i8xMgkEoVszBXFmnuUw3+nUOwYLg27Ole5T7Jg=;
 b=gs7GGOzDK6ttw3s0gVVhBNPLT2dWSCeZ3A/0BdVIxj433WC5zXKb175LY51bSg+z9xG/RT00XyLPg8vNgjiEgDlS92Eft/WG67MFs2YUGakTYoD4TWYt9Y0nl8OjJA8MOjSrziHz2JwljKsQYz7N2HzYpPYExsDpSjHturV4u+f3AuW6brcuxLn0mlg+AH9YuEig8qvhOjp8gz+9iWt7KDn4vXXBn1l4Wd+Z5DgfmRzDBvaFXnTZqM38hrn+8o0lPID7NJXEQMxAaESZ48P7BqSGPjk+gn564SHMZwN93sUUD84KawhqtW9eBYFHcCoAmwDeqJ1ci92gcY9cYmH6HA==
Received: from DM6PR06CA0046.namprd06.prod.outlook.com (2603:10b6:5:54::23) by
 DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.18; Tue, 10 Jun 2025 16:34:16 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:54:cafe::9) by DM6PR06CA0046.outlook.office365.com
 (2603:10b6:5:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 10 Jun 2025 16:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 16:34:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Jun
 2025 09:33:55 -0700
Received: from localhost.localdomain (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 10 Jun
 2025 09:33:52 -0700
From: Petr Machata <petrm@nvidia.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	<lukas.bulwahn@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Andy Roulin <aroulin@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>
Subject: [PATCH v2] checkpatch: Tolerate upstream commit references
Date: Tue, 10 Jun 2025 18:31:33 +0200
Message-ID: <20250610163133.217957-1-petrm@nvidia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e5eba4-f01a-4418-f2b8-08dda83ca45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9iQ+kFJiCijLV3iwsgkv0wMVBCcOZNS5BqDx5E1XGNtuHeBam03TWRPUiqu2?=
 =?us-ascii?Q?cWdCghwI2o0/RqaXm4yYmDVc/PEcsLnsFrggCQEiRJJcRAL9FoTnYGSQ4fAL?=
 =?us-ascii?Q?TpW6lGv4drFpFizpnthHkJvAAs9ABX2W5e3Kcvf2caDuRQvKRB6bq9EwsAys?=
 =?us-ascii?Q?J5Nxv00HBpej8tzz+dQKU5Fs04A9/ZxQtTWhXXuwi1bsdqV9aI01fbyrbXAz?=
 =?us-ascii?Q?/xNebTmGEVtHHY7JngSHBYwE2xqKw1jKlKqnlWEICYeXJPfG6yEbAlHPVXp5?=
 =?us-ascii?Q?15z/Um2kOReafFXsSVSDNf45b8GGSCDQV0kvmCPzPDo+Rhei3ysvhsiBnd6j?=
 =?us-ascii?Q?pp7lxbJ/b4wC2ebmLxzIWsa2oV8m7I2MNyW6q44vqbX1TuIU1lX9yqLrQs2+?=
 =?us-ascii?Q?YYGvV1LEygIJaOwLDTmepp/BlSMrIuBrbUg1CfGY4VoIvJwXVP+c3FMMIWnJ?=
 =?us-ascii?Q?Djxe3CNHoVOcCjJ06RyTgvMWpl7nhpv3lzfXXxdiWdDAzolVMF0Et6F4Em+i?=
 =?us-ascii?Q?5VHivejAjktkOmZCxmZjIAmcsxbKNLZMIxZlkr4jzycY4UTe02i+H3BfaXgF?=
 =?us-ascii?Q?gQ7VgewseGwyr0VZTS6u3NIIlzajvV3/9ff16mlwCJy/UKl+QAJOdgMIab87?=
 =?us-ascii?Q?pqg0T7eBTyDKg57Td4p8bgXBGeZixMMRoZcUIfa9H/LlFiSo1gS8oKd/bAqH?=
 =?us-ascii?Q?BClEPq1VbTcAUlgVqgxVltGyOq+RgcxBfxaS8iGjsuJL/CCirgxdKsq7sdJP?=
 =?us-ascii?Q?OXDppNnqCBtmO6edQhThaMwBvYdHBI+DZaT0CiL/stnYC6+G5Sq3UgXqcQ/B?=
 =?us-ascii?Q?58r0gMyYLuayiRWocGcIKb0agD53BaLScSIvSlzQmLajyPZ2ZJcp5cDT+SBY?=
 =?us-ascii?Q?z4Nue0nfjoEb9tYoJ2aElB//53mzcpB0wwTWlQDim9oIwSxOq0Wy5f3TMICO?=
 =?us-ascii?Q?xYysaC2uWREFv2Wwi+FAdEebS2ABjzOceTA5MUif1JZFxPb+0tn30QyC7stf?=
 =?us-ascii?Q?Y6UQioC4cZttDRCsJkUxhFd2rPt30yKiTZfeKOr9qMjR9yTZ+HubTDZrauEl?=
 =?us-ascii?Q?preJVY5Ut+ONaO1QrfLDc6yoEVcgOjuICkb+0KaG3xXXeaU5+z8wJRjWBFxW?=
 =?us-ascii?Q?TjkKsAexTol4LFpGAhnUo/2wpik7A4sUQJc3fwUzUWnoVpB1J84awVKH7LwA?=
 =?us-ascii?Q?SrFvstuIzyRPIAPuUjpt6itMx87yhNeWX8Mb7obfZLqHnqPVyTTBG6cwP5mA?=
 =?us-ascii?Q?dYfgBHQTbpLsYlfnt2AkS/a+bMqQ5awofUPa3H4Fj2Us4tImn9HHb8Dyd5js?=
 =?us-ascii?Q?lIYL2aNeGwVTH45U6gA/Xs84tx7qQpsVndaqNgdB6Jr8D4iR5tOzb9ijVZX/?=
 =?us-ascii?Q?USlYZqblgoyb1gL0cA71V3hEfCEDLVZjOEIoEOv5lt1amH7M46SZpyNMsehG?=
 =?us-ascii?Q?OkQRY1lxGv5NXrZNYMBMcRMJ9khSH1T/H0IaXJa9xZGLP9VmSxYvd0kXslqN?=
 =?us-ascii?Q?HuHMkyfPjOr6RiaNcDoB7S+ikujEf1O2EKJQ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 16:34:16.4133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e5eba4-f01a-4418-f2b8-08dda83ca45f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251

Two forms of upstream commit references are used (and documented) for
stable kernels:

- [ Upstream commit <sha1> ]
- commit <sha1> upstream.

Extend checkpatch so that it doesn't cite these. This reduces noise that
downstream maintainers experience when checkpatching patches that may
contain commit references of this sort.

Signed-off-by: Petr Machata <petrm@nvidia.com>
Reviewed-by: Andy Roulin <aroulin@nvidia.com>
---

Notes:
    v2:
    - No changes, just a ping.

 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..bd4405b59103 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3351,6 +3351,8 @@ sub process {
 		if ($perl_version_ok &&
 		    $in_commit_log && !$commit_log_possible_stack_dump &&
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
+		    $line !~ /^\s*\[ Upstream commit [0-9a-f]{40} ]/ &&
+		    $line !~ /^\s*commit [0-9a-f]{40}\s*upstream\./ &&
 		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
 		    (($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
 		      ($line =~ /\bcommit\s*$/i && defined($rawlines[$linenr]) && $rawlines[$linenr] =~ /^\s*[0-9a-f]{5,}\b/i)) ||
-- 
2.49.0

