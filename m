Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44750289832;
	Mon, 30 Jun 2025 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290058; cv=fail; b=pCAHItSuTiLrwrtkuEK2NheyR/IIFZcyNjEeV2XAOrbJLRwHMGuhOYw17Jp9Ou8LVfSASx/ya34oRyGcyeQz7/vIvOEwyOWzUqHWcWMZ+YBDkoPiPnnQ5g/m1sXEU3HWcXPMgJBN6kTdL2LmCk/A6ArXNx39DYMBYMmv/2DXa1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290058; c=relaxed/simple;
	bh=8ZvuluR7NztgBZ30+irWmyZC7xNcDkDMNiADXf6kAFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJSyjWPVuNxAbwxWU1prZy8ALg4MFhaoyBm6FrpxnzeGff2RBIwf9xEo+kQhG0u+rvIZU3GfkT6V6CwVr1MpZdEicVzs9ApJ9DALSTk3yUHqPOzvRXCe+XVQteUxDM9E7cu0Rf8Ve+8injEcmbVfXOtr8+jdESpBSIQNAaIzGbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S+gi3OOH; arc=fail smtp.client-ip=40.107.101.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S+gi3OOH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyhZHbq326knHkK5GHaW5Dpa9bExiufDHf1qFklmr0S+b4tI/803DItlmWECZBL0oa9k0AkxTeflyYlA8H8vIum1ks33WO79+b8Y6E6iAIffE0xiLWWEWptUR10EQDq1FPHutRKIFJdCA7o/MFxbrNYujcZeEyP6EmBnBbKOuRhMY1Ozf4g36H+jFSyt3lcKSgBo9GjYixb6iKcHSHeEiVCuug/4qruPlcVgrQYYOVYkcVnULl2e3shqNMgMJpl9h6pjYT8tV24rql96Sf8ggLm/yrDz7ia4hcOhsTVUee6TCjoswJm/p57LA82R7twc12Ov1FuQQvblGbxY0hsqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi4HoCIJH0InGruO5n0USaYewsy7s/itzyWXWZXNlrY=;
 b=g/deVJjxRQyJyUDsFA50RcZpjAtXZzwi6l0xF07+yNvRAIZFBghEBE111rrZrbLZBdYkIkwYy97FwYtbg0CEMyj9LEqR1IGHVMFHet6lV5uCUZBqTHSrrqMWiqvo68aG2a3kcY50CnkiY/mV+taOSBZmVYiJjnbZfcFqVgLako79oWxm3JuYcIya3eq0f6YqGCrx4RVGW6ty+IliyBtSVwGDMR4gb+Fnx6vr/mJfGHxLx7UVYsgASYv1WGP/efzrel32rerGnpJJrAmFoITo6HduGv/OnMoHuwcz3v6Zi3CIk6nRgXQmtg7Iml6SAjYYlVNu6EK/Vdj/n26QLK7Iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi4HoCIJH0InGruO5n0USaYewsy7s/itzyWXWZXNlrY=;
 b=S+gi3OOHS5gLO3ZznjThHECGGv62LpaQnUElht+ndsE3yL1HIn4BIHdqIRm/LYOwLLaHLQf6uGzs+Dj4fcn0589UnELx2py5vE5BlGx57lZorIIU1kyzQ2pFqJeUrRhCCE92wIl/rlmpENCmcnYURGIa4n4KVezjYAD+GAVnjhd0N6zujVDh7YF/HnO3d0Dog7XZjrD8mgcrhBVi5Bm0XiBR6d2jD6o8So2t/nz52PghjQxZXFv40CgiOThGTwlBztaWZBjUSsSWkCse3Gya4U7AtDqP8MCRDaaXOuSiR/3ZDwmkyOLpU0hyLo3BiXVRybuexFIyhtVhqxHo1jQAbA==
Received: from BY3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:254::8)
 by SN7PR12MB7107.namprd12.prod.outlook.com (2603:10b6:806:2a2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 13:27:34 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::f1) by BY3PR05CA0003.outlook.office365.com
 (2603:10b6:a03:254::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.17 via Frontend Transport; Mon,
 30 Jun 2025 13:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 13:27:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 06:27:12 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 30 Jun
 2025 06:27:12 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 30
 Jun 2025 06:27:11 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] platform/mellanox: mlxbf-pmc: Validate event/enable input
Date: Mon, 30 Jun 2025 09:26:57 -0400
Message-ID: <13de226d679511149cc1515c423461eca763f257.1751286845.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SN7PR12MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc1868f-22b9-45e4-48b0-08ddb7d9df8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KjxyJvYwPD4hZI94SCtLXwfZaO1VeC/0X7Vb1UIEcWKW/MwFP48SzzUVUP8g?=
 =?us-ascii?Q?zHG4mkPIJchJTTT0p3StU5DG+Z4G0tF4tjltKaBbnJ/O0b31kFwTGn+QM8qK?=
 =?us-ascii?Q?aQjVRYs+76FpXK4w4atPfM0ZfIuQeXR4qC153W3s3Le3GTX+R8QIiOgAJRid?=
 =?us-ascii?Q?G8TYz1oZJxHWy3QNqNoJDrCT7vwtrcVD5HDJA44oRNA1cn72lOqX1Qn5rGRO?=
 =?us-ascii?Q?aTKc/nti7XLaQ2+CTE+AqEj2lbG7JCfINs/dcMvur0ApNMOMyhaNoqCUNJHz?=
 =?us-ascii?Q?rUT2H2n9IZKfy0QfTyc35h5PVpVeBhWVxtZ5eVAM6g6UfFaP2XXKeKpV3aRx?=
 =?us-ascii?Q?pRIeA8R8ELb8gNqkUHf+EBwc538Q3nbWTgMufZIE+4M/uuC99QxP9SBxlIJL?=
 =?us-ascii?Q?Fjg5Hsh5gTHVwkx5iTAOV8AC25bu3EcccYSYEBrb/C8goOVXM0vqhcItC/7V?=
 =?us-ascii?Q?70GFHGq/xc69eMyi5ZvEo3xdI0irTVuWzLDTEcs+5yeznJnuBIQsnKKPC5NT?=
 =?us-ascii?Q?PKyiEUTBHQ3Sb9PyUWLm8+3894egrXlCUypPXER4nvzmxOXtVO+IrPZJNJM9?=
 =?us-ascii?Q?btdoH3zAJEmbmuxQhzLgk0CzHEE6pvL2BE3F7CcTwWY/kBEmzEA1MfzIeYhQ?=
 =?us-ascii?Q?mt1SNMGCuK6KO+OacxeIgbF+NBRBeNaEjBfn6YEBywVXUAUN/qkHEcCI+qh3?=
 =?us-ascii?Q?OPi4fbLkFsR3LJo3QhoMFZixg1hghQIxlC2AdeY7ECxn2Sq3G5NGptTglMuJ?=
 =?us-ascii?Q?4HLXgr+iZuwQ9fX1b5DXXXMWwxXaFgTgUe/3FtLdEIPfTvu8KiIeNIu7IyEc?=
 =?us-ascii?Q?KlRzLMy2pafsLCMVL289NZwaKT6Wiq9KwmlpzpXJwQbtTyO0IHu3Ao114ztz?=
 =?us-ascii?Q?oW6Yp7IImsT4Hq21CWY0HgeS8UphedCR72VH0Hy6xXzeVYKR6bpX3WQtHDpN?=
 =?us-ascii?Q?iLWGrAN07eV4jGG4ZsKw5dZkbwiXumOujeoWrjEQQv5G1tUHyVlVDx38NT6S?=
 =?us-ascii?Q?CmkH3QiQNIz3eh5qks9AxS6Fu0jcfftPolLB6gqVCxizz6Vj3LR2elk397op?=
 =?us-ascii?Q?fM11mUkKFKnMyLtdp9z7/cpPVf3xvve4NGVNqlcyawrxyG2VIKznIzZHrf4u?=
 =?us-ascii?Q?ScuQHNDmZLEvuVm1rggsvxfNA1yjArn5aaejgqhyS+oTOTHlhail9QHTukwJ?=
 =?us-ascii?Q?58yJvxjRV8YxcCmjaHNCHfIsTre/KJlTishnkozgRqNoRFWqRHDdpX9AHtyQ?=
 =?us-ascii?Q?Rn9Wz3CcMBmMEDSC48jabx/Y9doSIlDG0CS9PxWjKxwtfKR0GY/7I1YDYh6W?=
 =?us-ascii?Q?K45DoOjIJ2/Uf6DYYKIE8x0SuZsZ85qe0W1WiKX35xnrUz2+EGgS+HFh842p?=
 =?us-ascii?Q?AYY7HXCtnAWBnARG/ubQlHiX/btLxTqTVWNkvCqFxpQAu/Dv2LyClEZanSw5?=
 =?us-ascii?Q?VqjBCEz2bveB0vVj1r/Gg7jDXFPLpf8z8CLdB9c5a4g2/kvj4dfKiOia1DVP?=
 =?us-ascii?Q?wqFgQqh55APB6x1fq+8P8Ay95XbDcutOJpKH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:27:34.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc1868f-22b9-45e4-48b0-08ddb7d9df8e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7107

Before programming the event info, validate the event number received as input
by checking if it exists in the event_list. Also fix a typo in the comment for
mlxbf_pmc_get_event_name() to correctly mention that it returns the event name
when taking the event number as input, and not the other way round. For setting
the enable value, the input should be 0 or 1 only. Use kstrtobool() in place of
kstrtouint() in  mlxbf_pmc_enable_store() to accept only valid input.

Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 16cc909aecab..baf3f60e66ed 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1227,7 +1227,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, char *evt)
 	return -ENODEV;
 }
 
-/* Get the event number given the name */
+/* Get the event name given the number */
 static char *mlxbf_pmc_get_event_name(const char *blk, u32 evt)
 {
 	const struct mlxbf_pmc_events *events;
@@ -1804,6 +1804,9 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 		err = kstrtouint(buf, 0, &evt_num);
 		if (err < 0)
 			return err;
+
+		if (!mlxbf_pmc_get_event_name(pmc->block_name[blk_num], evt_num))
+			return -EINVAL;
 	}
 
 	if (strstr(pmc->block_name[blk_num], "l3cache"))
@@ -1884,13 +1887,14 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 {
 	struct mlxbf_pmc_attribute *attr_enable = container_of(
 		attr, struct mlxbf_pmc_attribute, dev_attr);
-	unsigned int en, blk_num;
+	unsigned int blk_num;
 	u32 word;
 	int err;
+	bool en;
 
 	blk_num = attr_enable->nr;
 
-	err = kstrtouint(buf, 0, &en);
+	err = kstrtobool(buf, &en);
 	if (err < 0)
 		return err;
 
@@ -1910,14 +1914,11 @@ static ssize_t mlxbf_pmc_enable_store(struct device *dev,
 			MLXBF_PMC_CRSPACE_PERFMON_CTL(pmc->block[blk_num].counters),
 			MLXBF_PMC_WRITE_REG_32, word);
 	} else {
-		if (en && en != 1)
-			return -EINVAL;
-
 		err = mlxbf_pmc_config_l3_counters(blk_num, false, !!en);
 		if (err)
 			return err;
 
-		if (en == 1) {
+		if (en) {
 			err = mlxbf_pmc_config_l3_counters(blk_num, true, false);
 			if (err)
 				return err;
-- 
2.43.2

