Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5320B20297C;
	Wed, 18 Jun 2025 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246810; cv=fail; b=XINfYKnTSV2qzxtBtoTzb3py9NzTgAQzev23WDLKmNF/zTVQVPrD63cqSAxhpVY3DdgS1+5yH69aAWBbb/FAr/tyMIIZXkQidZUhH/JnXFz4V73Va394vDiOGzYqM7dDlWfp5gqvv3QMH47vLAFH6sAB5xiyFOohv1qubpfd2VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246810; c=relaxed/simple;
	bh=dfevu222NupktM2xPWzam//sCh9dW8aRbfMG8yKBUQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sMdfyHa1f4Uqhn7/+lZquZVegzcOASZdxPVoa7Eq1l75RcW1NWhqqs7TF15qfpUQCygx1V6tP8DwlStKeVHsociOMooMpqeB8JHYhI/iHfDs5POTLSrUps8/jRkA+HxzrpS+woB1/MoYR0fFb9nNijCN3Mzifw+ocOAeJmU0JPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mmC0t/Ql; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mmC0t/Ql"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBflIhkFBbXXkuGP5aYkuA3QTyCIZ52+rwFRgAi6yw/yy6pU1bees4g1F8tcelgeaYwuXAjA6Ifr+965Gw1Kevgo2CJm91ps9Z9eHg9GPa0YllFlAkp8Cdvf9hRl8UiK5znYU6Gio5RVR/n/xLXcJLKUf34LYZqpRr9E/DHIbM+jge3cs6ZhiOA894/nOnxJjlQMcU7iGunwtxkZKVpYh8ribSAcgFniTckywCczEroY8ywdHA8ez0yyZASJCJyjSNz0IebrJj2xGCgiqINA8/hd37qGFyZ1ZbW4Kh2KP3wY2KoeQH6+R5LShw9OYMJfXFKWs6155i3MwOytqjT6CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlNyXNA18IH6/b2oMONIDnE3lbzmjoqmMvJ8YXzaYdk=;
 b=MaiiJeVF+G+4MqKvgqFJ99B9Zr5tRRY3Dk6SWfNg0ku8Pwu3xlK5jrRY5wk+xMeCX8LiLiZBXIDEacodn1IkpY0/v1ocP+qlOo7O6NBSCSE11MSPnZCtQDwnfwGE2OPz9gJN0DQAsx+Ox0bKxGDiYoCZYW7ZPnczRkTpuem9DTLRf4wbr1gHpF7Wia2K+azx5so/I3jj0BDQIoZ969IfsQc8s/aVTudb5t6ruw8izTReWw/OVFd64cQbxYc9XJjAnHlZ/4m+sloDQjHtF27z7EykINsVhiqOpLNpYoZgZ4t45qpVI5/GZ2D49i5XN+wdo1S3IZRS0RoHM7aP37mvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlNyXNA18IH6/b2oMONIDnE3lbzmjoqmMvJ8YXzaYdk=;
 b=mmC0t/QlZW/RF/J+3Um5azsJZZlT1WBD3cZzu+oQ/jTxOVNat+YgMe8GCITkJ4GnVdRmnQ1e1R4UhWIJKJ6QVRh1Gq98VvFmQTWLqpriMDO8gIaePTbYrJOfhDHyKh+/wsfKZ1RqWLvy8vnU3EpfFYPRn2uF1kMgsoI6ADgIFFciK1+IIEg8k8F9NpL3Th/EmWWyNeCFr6Gf1q+gKpsvz+3FkV6x72lIWUzOJtz5ldfBlZ2sa6by+mgH6RvbDzms9S65F6kMUSGPgE6sRcMeVEAplMCnl1rkmov8r3N3T4X3UwYDUqzNZQYklJzviDBbQXxOovCWEcNUC0oDRdEMZA==
Received: from CH2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:5a::36)
 by MN0PR12MB6054.namprd12.prod.outlook.com (2603:10b6:208:3ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 11:40:04 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::a8) by CH2PR08CA0026.outlook.office365.com
 (2603:10b6:610:5a::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Wed,
 18 Jun 2025 11:40:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 11:40:04 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Jun
 2025 04:39:54 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 18 Jun 2025 04:39:53 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 18 Jun 2025 04:39:53 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Thompson" <davthomspson@nvidia.com>
Subject: [PATCH v2 1/2] platform/mellanox: mlxbf-pmc: Replace strcmp with strncmp
Date: Wed, 18 Jun 2025 07:39:47 -0400
Message-ID: <fbb8ab5fd566369cc47e9f23b9f4ac25dde009b8.1750245955.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1750245955.git.shravankr@nvidia.com>
References: <cover.1750245955.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|MN0PR12MB6054:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c18bc9-bb4f-4701-e848-08ddae5cde04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CcSUcgdqf64Enf49LZ1upNKcqLHKRd1ipsuh/M0/I0uc7QBsZMezFdcynN6h?=
 =?us-ascii?Q?72Vemx5gJYtGvNPL27T7aLz53onmzBL0WQBozurEVrI/zm2F7UNTvjcA0ZqV?=
 =?us-ascii?Q?mpJhBqTPNuk8g3dxsc+pL9/KTVWUhpm4jih6xjMC/26c44FANGrc+aTr8NBT?=
 =?us-ascii?Q?qotjmVpI5zkF4bQa0p8M7dxcgfRqQGyTYuxoQ1bV137EKmQPdXjmr/VF7/Po?=
 =?us-ascii?Q?+3YfxyLRb6tL0KlqIL2zCG6isM11IAX/bbzHIG1zmFQob/DRv7FvbfTAmHMD?=
 =?us-ascii?Q?wDCxmnl4y6jQzPyDxbzfCHVMAriTUPjEyi6t7zrvTEyspEL4nyy3VUHxqwsv?=
 =?us-ascii?Q?twkaFEcLg5g/c/zCwDmEMtIQP4jW4kLRj3pAj+Bd9La16l3ozAyMypa17ZRM?=
 =?us-ascii?Q?S335o24O+DzRrpyTled27U/8g3DOHYCazhSisaa306G4+JQuigAHT+S4pfF7?=
 =?us-ascii?Q?wFLZdSZW/IfwjTWvOkQRnZE9h6Yh/yV4csw7j4Ik+xOUiXR0BDt/kcb14lUr?=
 =?us-ascii?Q?BWL5R+bAe0OSMUnH0MrxsmKe8z+04byoRpQ2+h230PBgO4hG0xMzaQ/WriF/?=
 =?us-ascii?Q?olR01274fP0I6Hcn3wFFKVQ5Gp94C1BDO2lTxyn5vfC6Qs/AfCK0c5zycJDC?=
 =?us-ascii?Q?p0616iryGpl/52BNOjNcqyZV2CB79hWTfTaJk4KoztWvvpDpTKqZgH0bgljT?=
 =?us-ascii?Q?wWrDZ3vjLaG56kuGv82OePN+KHTS94ff1ioFF9PEoi4s+Oz/+p/P8sMUJbh4?=
 =?us-ascii?Q?RHY1lyd/NRCKYrvidEU3N7fwKzA5q3ktktiHYvhXv56yplPZ5rJm3mvIV4/w?=
 =?us-ascii?Q?85UHfJIWACV/il5zxI027Ae7NO+NrNW3nZ1o+e/3xjNcIuDk23q6ME471TYH?=
 =?us-ascii?Q?aVjjr0uXgvQgQ0DvJQckRHiFiHvMXoSf5JIaRKxi3ii5PKpVXupHM0i6GUm4?=
 =?us-ascii?Q?lDhSFSvf3n4DI+22Leq8jhPKqY7PX6qI4+EHt7Hb5x0T8XJUoACLHLhd6YW4?=
 =?us-ascii?Q?SsGk1Yfui6AExBlm4NEA9ux2s1MHCB150XAmF/QVrORqQoW/TwgCeVW4tFDO?=
 =?us-ascii?Q?TcjVbK9LsqdImvN3dX9ZhFTtvbYDAmZfQuPJ9x4ct5PJuKy2CrwPTdZnZqYF?=
 =?us-ascii?Q?fQty4mAr4SQck5iL7Bz/AJIokv5RIPy0ROLacn8j6IISee8/rEeEOxPEpNMZ?=
 =?us-ascii?Q?RnHYqGDt/QWwm6iHzzd7VTqOBB0WnDzF91z5GO0tGurOy7suRmtgkCNXZvdZ?=
 =?us-ascii?Q?JU24hYqtM3w+XNmxuxCYO9vylsjz9Y8DrZhuxn0Q96kuNjMttobn9CbLIdyC?=
 =?us-ascii?Q?b0PsTAzSPFfwVFsa2i+lZSHfRXc28V1XoALnlsx5ukDLqCp/knAG7QLb+zxU?=
 =?us-ascii?Q?tt2UIKA128K7F+9IrgJ9IJtm5Ju2NVyDSvYhfYTesqUqbXgnYehdg1FAQiq6?=
 =?us-ascii?Q?V0BQEp8wIb3FU13vA3uVH6y0seMGLmBHimmDTV0+LmIBSPpGlY3xxslNU+vb?=
 =?us-ascii?Q?ffm7wKPP4bH92WXqlzb1r1nbJt4G9jUk5U17?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:40:04.0182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c18bc9-bb4f-4701-e848-08ddae5cde04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6054

Since the input string passed via the command line appends a newline char,
comparison using strcmp is not correct. Use the string length of the
event_list entries to match the string using strncmp instead.

Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthomspson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 900069eb186e..366c0cba447f 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1215,7 +1215,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
 		return -EINVAL;
 
 	for (i = 0; i < size; ++i) {
-		if (!strcmp(evt, events[i].evt_name))
+		if (!strncmp(evt, events[i].evt_name, strlen(events[i].evt_name)))
 			return events[i].evt_num;
 	}
 
-- 
2.30.1

