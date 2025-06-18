Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B3A20297C;
	Wed, 18 Jun 2025 11:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246803; cv=fail; b=YcC5eDrZy6yStLrOjFO9VODzvPqYeIR5v9vbbSyA7b3bRmyQwGlBsZ3mGwoOJcN/FsUCmkh3YfzMI8spMAAm2k29Y6mGXJWEUtiTSvglQALYvZzFG+5CZ9xXv0Lmv0SVI06gfnJL9KcpQqUrb5bHaFow9kqxIQb3v6DrWAwMIVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246803; c=relaxed/simple;
	bh=v5o9+bZQmoyEVb2WJlKDNyqqBpIQfjE8FKTbGAJtquY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FZ6Qpnuctvxo98+hbx4mLC0cG4jC1s77vUJo02iwuQdsHEIsuLba/Tv57AakBaI/csFidxWRfe+a8EeYhiIOcOUWu1WMfP1n7/xzj9G+APcaxeyz4NsFG8NZfJSm5cx3X9BQeT7nXjCiQpxpLlqhGvVu/AIIkTiOhz9N8VVEls0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IrE1cnpV; arc=fail smtp.client-ip=40.107.223.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IrE1cnpV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjoclwR1y13CuaTGFpsTVhcN9O3520WGjNwey7pHxafagud/FusAxqf5dQYyqd3wqUxz4JEzXB7npWMNnfrBWqnfdGbPemoLSz1JAKX0K5mIVdoM7ieSkskxTcBy4AgJ8GbGSbYNizyv1zMZhR2hj1RhrVHH+Z7GF602kP/BdPAVy057sLSgm0V+v50ooKadf7E12QU8Hv8y1MBmDZvASI6kv2IFti0jYfJHHcQBB0yHLx+lsQIgychOokTa4yfFnDlUgNtW56d8ISdxk4o7a0QxGho5ONJnItPXZPw6HJtLPYLU2lwJ1kf5yOCda2J/0hT7i3oL/WZiZa+R5XeB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuxwBTkRJWr/h4C95buPLcOQK6hPupeZG+vlzNklvXY=;
 b=mlYAyd7KqaTchBJ+Iefa+XtN7n+wRVmND50M+0yZu8S0VbI4Gf7V7OWcpzEI9WxRKDhrpLhauFNr56n62Ky4riWuVNFwlSIz4NijbrmaMs3kI3CTVbL0r4n0pZv5hYZmT6qddH7wsimylJ5xUrvJp6RNQ1K9vZsCFxcJE6qHzgxIVwrkWBWspJpaOHiATZLDr655IjhLJXbevtYVoWVacoKCvKEwZXIMUDFUwFenLGiKIHThapYRAdCpgFyDwXPPgawNayC5VkGoY610ILQ7xp3csVOKrD5muhYH9zNeboqwWQrfPCqbRL8VCPJ5aierkKFbcuP+dSDC/cQynsGpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuxwBTkRJWr/h4C95buPLcOQK6hPupeZG+vlzNklvXY=;
 b=IrE1cnpVSlju84ulbJnPlPHwGAuwK7HXPQwg4klDu92KmmlmCuUcexXQpQETswVhXRbler5LYioagjfBliHfUtDn3MXCAdsml2OjZNoWj7oSH0Ymr/fPUeI+4+dEUqNBHvCB4AoowzpMpjCYwNmNGw3QzsGHucVDBE4KSm5YAx0d4NH0Hu3SiNJKvqvOAU8Xksy+X3ZHf/cFUzG9siCESba6YMd6curfr5QXSt5CLWpqER2Lyj7Dbjnc3rrJo01QLxyIgj1cqxtFWJoropTY0fcucSzb0i+ZZ/HBqmOkQ5T6pDyNFZPDMSGZvaHME2xDAVgjdzMXA3+i6aV+FQ/Rug==
Received: from BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43)
 by DS0PR12MB8217.namprd12.prod.outlook.com (2603:10b6:8:f1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 11:39:58 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::8c) by BYAPR07CA0030.outlook.office365.com
 (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 18 Jun 2025 11:39:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 11:39:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Jun
 2025 04:39:51 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 18 Jun 2025 04:39:51 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 18 Jun 2025 04:39:50 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Bug fixes to mlxbf-pmc
Date: Wed, 18 Jun 2025 07:39:46 -0400
Message-ID: <cover.1750245955.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|DS0PR12MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0f55c0-bbea-4753-036a-08ddae5cda4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ottYm4DoretS1w+HK0s8mg97/3vXxxc5tM76tK5P9aZbb45PdbcrsliPZfi5?=
 =?us-ascii?Q?5RiS3EvOS2EXgTLzg+gSpmog5CefqrBEvoI1l4fFt2abdasKKydKoY8FO6bo?=
 =?us-ascii?Q?16CzzE5C2UidEoe/LON/OloOcd9ndFVxQEjaukO94uDx4BSNRQGmo2jboEc2?=
 =?us-ascii?Q?GdfdZ5uIre+0WnS7DbANzlIGCvsj5z2zQc96VP1bFe64N4JV7wZ01Y9Bv57t?=
 =?us-ascii?Q?jVToN5tVPMlUbS67F7qYnGqSXmSFRjDa2CzWaghq/uJAKLBgSCcb96ertF3P?=
 =?us-ascii?Q?iNipbj0PZPRq5ULyieS/4je7FvbPnzTwakHDOY6OiwDFNoUhCVld8k7pKYFv?=
 =?us-ascii?Q?QcH1sBRBgFwCBGYIkGNsrNCaW01IdKnYRCz8uCJn/j7deewbEpxZQQUvHwYA?=
 =?us-ascii?Q?a2BOncSC26SylCergbLNsUIF+e2g4r6XAHsPJWFC32pdKqjXhRWoEPQMsn61?=
 =?us-ascii?Q?El88k9KSnQQzyCSJQf7hfh7t0bPoFjp9Nb+txW451T7hy6xtpnqAxhlYRhf8?=
 =?us-ascii?Q?mAgYkDyMwGyzNNijuUQJlRqJyMCXqzM33FfPTpa0Q4w9Fe+Skl176SyPKEW+?=
 =?us-ascii?Q?7ty3KBItTOy8m/ph0GitDYdy7psYSMQkUmOdlJ1bEm9jSn1TIuHMcSYonsyx?=
 =?us-ascii?Q?qAejcg1J1axzSFQJpcDkcZdvIh9i/JoSXG1Q86a0tyKD4uH4d0WeeFku1D6j?=
 =?us-ascii?Q?f5WWshjLPo0v4Fz0DYJOMzNrwBuVaKxBoAMrHeAADnUvsJyBit9f8+bR54OC?=
 =?us-ascii?Q?DKhbPZggLfNIryAVp1tZ5sJGKQWsisB2iEOSsqaHp/H9ErbIFKm1bgR36Os3?=
 =?us-ascii?Q?CTAJpsTol5rsyhNS04PbUoaNnWOcTUHXaa895qPicfo2rojxjbbJIWdkVdqt?=
 =?us-ascii?Q?oiYxF06ArjeICZF0YcGbPosAjoMh+EX8UnS7kq0ZEdi/Yf2pZ3CxT6ggZFug?=
 =?us-ascii?Q?dpo9anJrwSmklg5YJj4ovOIulAjn7NwOh3Reuq8IiYpWucfKUYOeImJVJqMP?=
 =?us-ascii?Q?pTA/X0t6PQtymBbc1xRfvqbbRPqryucCXDGeUVbk+3eqon6sWX50KttpMbyr?=
 =?us-ascii?Q?HRw64XhAqD+qjUpEUzXUnnDA2whGRsu+h2lhKquGW0cV3kC5qYM3YIVWyrvq?=
 =?us-ascii?Q?fwRWHuqr/jwbpTtQMJ6nLeeeKVJZIggNh9DI60k8qPX1qcwnscG2ZvlXvIk9?=
 =?us-ascii?Q?F+wZYtry4wgz952IOtaebPmA/QUfNVM4XH80ZZSWPqJNB420EIJ5ItkyW+q1?=
 =?us-ascii?Q?Z01PaZzVx8yQffPIX6S4qAgnRhhStz8BnvrY3iq6PQ+YEnKnoVQbQr1Tv2sL?=
 =?us-ascii?Q?dAp77kPyk7dPsemB2CjdnUs/6eN3FGbHsgHtvWZUhCYvmzm/xYkQahAzlAUH?=
 =?us-ascii?Q?6VKr0qSmAfz9xKW7tXH+6Z0jhPYQE1p4xapPqj8xlli9t8Yyj0qbonmGoAt0?=
 =?us-ascii?Q?wWD3qI6G4jAW8MC2F7mzWCGyRL65+puNzWe142b04rSD8jglwAiTQF28LV+i?=
 =?us-ascii?Q?8F7wrOMVANKabMoLqYPkJoUSclyiS5pSfw7G?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:39:57.8503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0f55c0-bbea-4753-036a-08ddae5cda4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8217

This submission contains 2 patches:

Patch 1 fixes an issue with matching an input event_name string with the
list of supported events in the event_list.

Patch 2 adds checks to validate the input for event and enable fields, and
prevents the user from writing invalid values to these fields.

Shravan Kumar Ramani (2):
  platform/mellanox: mlxbf-pmc: Replace strcmp with strncmp
  platform/mellanox: mlxbf-pmc: Validate event/enable input

 drivers/platform/mellanox/mlxbf-pmc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.30.1

