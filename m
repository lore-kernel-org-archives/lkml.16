Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85152E3B03;
	Wed, 18 Jun 2025 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246813; cv=fail; b=S8UC9mnXsgOsLnxTPkhKr4J3ABsbOmepNt6Dx5KMoDlh9ZohMZWoXCHsjZAYQniFUi+AFRSc5k5aXJsVZWev1L3aJWs6X17JT13W38jcRjkuHoWbcrIPg7QeHRlpIrudh5DRkr3n4NyYFVaT6TFECcnV5x3oF2VHA3QwFOINL8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246813; c=relaxed/simple;
	bh=XuNxSkN71EMENpw7vtDSrZkvmSxDotpYnmGCF1EkkAs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpxyNIhRYcAGnY6bQwFTeAQZvdk16lyl1e+JZi2ZQxzF+4s+TPwgmFV9fKKmb7Nyqgmrj65RnbjuD6o51ztNDY4Qz2zSxkr+prcB0LHUPCt4/PMUm5IbBlGl81oxjq2GbaPyJJO7IKdcc0m0+oHnNMyU0ZZZdkQOOFHMrlZVqr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rHHOxZHL; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rHHOxZHL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GateL7wgaivw60YAaw6mFAaGTVIElbwpyvXS2IqZ73EOqgjzKIKB14B4jMfs+zliUgsN4jB+6AJ2Y7io4/8CWRuy7naKddInPkXMm14But4fcOZ5kDBSPVTMKG7b+3x5k8dHixI9+vwfWOTEs7auathqaczkDLh45jL24GAaoXmfWvPmUcsM4Vt1P54pgj04wYyA1J9xaWCfJY11QPHd6spV/FsNb4r22UJGbg0aDLD/rFFS7pGXR4+PAJBrvdr20QvbtCnfhbeM02f0nWMry68xri8Y6EGP1P6nNwTQxt8UISWZxX4vrN//bebM2ZneCW2lOh37GUJ1DSe4YkdCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVnsr6BWz/cr3oA8G6ddnegG7uUUn1Ac2wlVNcNrWhw=;
 b=KpTk82591aZCpXSvHaYBwqXC9ej2sVBgjOfPhVitq9C4oF7ZTSlKyHab1M2dsDCv3fhumEP4E+yNaFKzdEnu0q0wKoEzuVRzGWpA36KtLLNi7bPG2ngFotrTSyKh2OBj7wBLbnnmpIwQUNrV8GUcbAYAgjbEC5TwramV4IwgciXrJn6Ro307Z1WAZFgqWfmQUOFUM3lBWRBWncnAN9s3Mtmj0fAdXPDS1L9lzjYG7HdpTW+3EXMGG8BXQPSu6ajo6JkFd1G9gdjyAdd/Hk5pHrcvR8R6hOPMgZ7eJWXSAVLoOtdsE/W8yr8TbuxdrOes8c7gzoARW2O0Iw+h/TT75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVnsr6BWz/cr3oA8G6ddnegG7uUUn1Ac2wlVNcNrWhw=;
 b=rHHOxZHLFuzwvz44FLODxBJQlV4EEPKp5uPzPiD8ef8W+UdAbKRyEHvVOBp+swde6pzxm4gvI3NtvykRp9/yuNlWOG2HK0AlBmJUWFHm+ZyXj74OVVv6Kf6EMZ36jFkxIC60E4eTEX65gDpjoXWKqN1NOimKYrTfllLquR7m1i7iNlLzi4nvmWOWXWopwuQtU3GUFBVZZaGH6ou3iQ3t8FN0+2WYEvgvSSerRLdhu7wIKYiDunE6PtJympw3eHZ9QqvoqVLnnDgEmwAZ/bvqvvrm5Pb+wcJz9L3+fAodNDmNDKYV0lo6ZH7cZTwNwn8FDlShvLQqk/M/XhKYCzrJkw==
Received: from BYAPR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:c0::44)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 11:40:07 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::bf) by BYAPR05CA0031.outlook.office365.com
 (2603:10b6:a03:c0::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 18 Jun 2025 11:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 11:40:06 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Jun
 2025 04:39:56 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 18 Jun 2025 04:39:56 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 18 Jun 2025 04:39:55 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] platform/mellanox: mlxbf-pmc: Validate event/enable input
Date: Wed, 18 Jun 2025 07:39:48 -0400
Message-ID: <7936743cf4d6b20c4ed25dc03722e3a7277aed70.1750245955.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 678a9b97-dce2-4638-8cc1-08ddae5cdf8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FvKm0mNSzV9TFC7GB5qJvnCMYFCkcyhzIBOZcMZjqPq2Cc7HVKSxYhK5T7hO?=
 =?us-ascii?Q?3V7Zyyj6Wl1YiHcX6IzCRuX90/vcFZnGJwCjZ63tjc9BxaNPPSxr+kd6h9m2?=
 =?us-ascii?Q?avUsqInqQsgNtR8K3ZmfpOLr8EoRhruXT6/hQH1SYmlmEbDwlMygIuNU20xo?=
 =?us-ascii?Q?Tp8bFuzqLHP1FHmqXyp8gYCMPEqxU2Otp1yEoa7GX0IqlKZl3f/MMREYYlff?=
 =?us-ascii?Q?p48O4jHUhXyw/bNTEwBmaxlBMvSBgTVtP9rZmpfPXd1EOJ3Rvvy801sDd4Gx?=
 =?us-ascii?Q?brE0QrwWvwDQmCuveKw00KJVQ2XzVdWXEXb9WHg3q8GWqX3j2Eh69Uz2+R93?=
 =?us-ascii?Q?SLbZPxhMYZVPTb6fVhyXdi894NFHcLY/mW/XIHwjdDsiKOAFhtbfVkwxCJJC?=
 =?us-ascii?Q?ktkTgshz6XtrqnSKeWsACY9i3CKTymmoHt9Z4i2UEppgoRQYV9FLaIxhNG2/?=
 =?us-ascii?Q?056SmChnCJ9Jv3Rj3yU/rUbEN+2uelT5h9SLjRUoKKsKcJaRXtC4KfevuW5N?=
 =?us-ascii?Q?s3zpZ6HjdQQFi7K8l5joyTAq8jm2e2F/KoQvtuvI/qg/pr3uU02BJ82I/h09?=
 =?us-ascii?Q?YTeZ18qXJJxC5UChEZ7iwXajAbIC/z7PEihooZvP6B72PC0cNr87+UAVwCVo?=
 =?us-ascii?Q?llvDlXPdl4Op1CRzVxVUBij+y2yU9xfK9PzCX0EXmt214U1jTJ4eEWep8wlF?=
 =?us-ascii?Q?EZ+2SfuGrvPGLbnRE5LKt9jW84slz667hdC4MHRbvD7wmT7SGXHFQrmSO3fI?=
 =?us-ascii?Q?uHH5HHqj+q+4F3uAoKkkhS7E4PFfKE99EqSU30QMCH9GZV8rnYgYJWem+vR1?=
 =?us-ascii?Q?GX7IxwdBvGKGQrqrcPGBQSLRfBCk/xjUk89EsKZI0LIbbPPrHWOaFUlNdv7O?=
 =?us-ascii?Q?ZEDBmDtM0zShmGGIB9zN0mymPsG7+syZYV4TvCQUs0Zt2dTMCyXbBSzc9NlS?=
 =?us-ascii?Q?yE9izFT1cSJfwT6WlxXoIgNoo+XJYTyjfkVMXToaO8vaLdLfUvAvjWWEpvCd?=
 =?us-ascii?Q?M0EhyK8d3JWAOZNXDK5sq2/R/Q+6HEf+z7ZQ8qycD920tGUg3i18LMqV+WO3?=
 =?us-ascii?Q?TXaT0wTwRGhoCQoUk++0GxNXrChTZCoyX5i4W55Flda+NwifY9fTxbA2XZVN?=
 =?us-ascii?Q?vWp6CSvu87EOFYygUpyp/8bVBHn2D3YBH9+/VIlTzdjuUSMPMfc0tjOe6CWx?=
 =?us-ascii?Q?N/+vn1X67Hv/ReXVocmiO6HnjqvyCLVC8G93aEtFVuTgExAIyX4qqbhLU9oY?=
 =?us-ascii?Q?2xZgzM6twoVhbNFU1IpOKyo+g9DEf38GaozDQkg7Asl+1YeYWatQBB+cMc/s?=
 =?us-ascii?Q?X525/0ZrzQifm7R1n546U2TyJiHquJK+pyIGrEHVj5aBGxztSv+Vkn0JAhc4?=
 =?us-ascii?Q?h5k+4hDpql5uDIKT3lKbvzqKO/sYZ/7kL7X5naPuDyvUcrtq+PlAy68sElHn?=
 =?us-ascii?Q?35/HX3xkTwGUHp64116iyRAhDC2fqU67hMbWX7RsPgJr/PHSdMFMqOD9tfaK?=
 =?us-ascii?Q?3put2otsGJ4x1EOW3h9LH/BX8ASZk5aJzJRP?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 11:40:06.6692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678a9b97-dce2-4638-8cc1-08ddae5cdf8e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

Before programming the event info, validate the event number received as input
by checking if it exists in the event_list. Also fix a typo in the comment for
the mlxbf_pmc_get_event_name routine to correctly mention that it returns the
event name when taking the event number as input, and not the other way round.
For the enable setting, the value should be only 0 or 1. Make this check common
for all scenarios in enable store.

Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 366c0cba447f..fcc3392ff150 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1222,7 +1222,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
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

