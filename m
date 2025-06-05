Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA23E1C27;
	Thu,  5 Jun 2025 04:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096978; cv=fail; b=dIzEMpWKl4e0ORGd4zjk2G8pP0MU+XtcfR0h6VL+Wb8HjQgudKagFHR7UwnhEo0M34Lw8hguG7842xoli+lpyTxioLhkkx94Nneker3/KbO6swVbFaZKxQMbaVCis55359e+Ql0dm1NboOMG5ibOARysTinB0TjCGKtLC1nChXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096978; c=relaxed/simple;
	bh=47+a1hE/MqkymBjaOpxUMF/tomZL2vpiPod5iqTCWcU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ucfwW/B2LRUipejuUEhHs/pFS+9Kyk8KLZTuG3JP9luJv3pGG8YBJv7Rtkn5ySW2bkT+yBV4NuMvE97rod7qWwit8RLgyoucQCib6IrvYO3Ghkof+GQrjuXfuyVY3XMSee/zmlXSRDCGI8ZMplRGmYzn48ntOzdm4LI6Y821fM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tA3FB8Qg; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tA3FB8Qg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO0FUd6W7EMOT/oZonf/Lm5WaC8xJTjXcCPLsTe15BKb/HZ7SJfQXDGN8PRuwdnRjRH8ej7iwEXZH09oH8cnqykwcx27ATxUsi1cj5ekqWVfFakmUqtq5b+u21BZh6hJgMejzOeM8CCnv0vTJLQEof2Nnj8Rn37ur72duyHhiHpb7kq5VZfL/LKVKaRnUYpkrZHvKiNaonEgkZSm/dq/WruDvTo8/ejBbCxY982coyTwSRoHSAEdXPkpv7mYqC64HsA6qO2sYbdHkZ3r1gcVCbbxm/Bt7ru/zyqw8k3dzxvRUVBN2OFktDL9bPaEaoWauoJpa3CCAZc/+GAR3b6K/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVOdLN/GlQDhYHJITNNqciVLcqkHjM8lLQdL1EbpJ+0=;
 b=Sthu1CNziOzvdn92n/jkSr9lYtoojazPUmFP6bmTfX1teGc6QK0q9ncK8Ur85shtaYiHtcGB0prlq6neY2ivANg0Xu4gBE+WeVdPJhZP9uQhXo7PTuEfIBmcnB3E8Oh5XgjQyVnDPUQjmlLuh98hNhQMcvTgJnj7ZLrDC7wV+iXKWYeTN1oHMSbiea+VpDRDZgh9myDieDJJhgp+Qor9JJoVmiULW7C0YZlCwrMfpNqLctjL3dc1hUpSl305terYOXOborvyDyKVMAEHW0QEwrKo2PQpFhHvWYTJnL+Pwah997Bm2MJ19CRDsGbUJk5SworJSun2S1J/bAqcuY9fxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVOdLN/GlQDhYHJITNNqciVLcqkHjM8lLQdL1EbpJ+0=;
 b=tA3FB8QgzsepADoA0nuCoEoZq5lgbOBunQw/vpyYtp2lX/APgzb6+dQrGHKc2+0jQebRe2sl5A3ctjNU5ogeTTy+hIjNl0rkQOpWsR2yMY/KwmF0/QvtbZOz58zbVr0YfDCgOfJepy4mHYAujPfKhZ8/GHNmlyaZblJ/eSKwQsUGhGmdnjj8pTo6n2VJmyN+o+ET/IJSWRih94YcVa8hEuVbOuwpOMQIJ/Jyfy4C4Dy8VXVKwIcnaXwaL4XYAHJg4UxdKBlqJdgVsbUM9M0eXRVJ3g9vGlR8GZBOrIV9C9n6P3U3/DjYAEmXQnRvoytWFaVhBIjf6KHGuskENdZfZw==
Received: from BYAPR05CA0077.namprd05.prod.outlook.com (2603:10b6:a03:e0::18)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 04:16:08 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::9a) by BYAPR05CA0077.outlook.office365.com
 (2603:10b6:a03:e0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Thu,
 5 Jun 2025 04:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 04:16:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 4 Jun 2025
 21:16:02 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 4 Jun 2025 21:16:01 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 4 Jun 2025 21:16:01 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Donald
 Shannon" <donalds@nvidia.com>
Subject: [PATCH v3 0/1] ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform BMC
Date: Wed, 4 Jun 2025 21:15:50 -0700
Message-ID: <20250605041550.1940089-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: e6c80653-e5cc-4224-3cc9-08dda3e7b246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QcUuX8JjB3SdNRfheSLrF2Led5FwmcbXtZw5VLdWqx0J/qEynL9QhXNSc2fC?=
 =?us-ascii?Q?rk18wKja/e5rc36O12nvDV2v971lfEKqFkg6cyuO+v6+Xa/Lf8DB/SddPGUv?=
 =?us-ascii?Q?75Ar6/0GDPBXchKHA+Bldm7/R6F5B6o+DMWtcspgEPaDfDetu7dZUXvhZMc/?=
 =?us-ascii?Q?LW+OmiFPVYpyweOjx7LZjN4uV+n/ou7ftKMSL4+CFF6Hyd+QMrZl/UQdjTq0?=
 =?us-ascii?Q?8u6FmfxxEaO3HWYA3Etzv2hyKeEF2uzwTtUOAlIcA1/nXFTajODV2gqic/l/?=
 =?us-ascii?Q?zHGVRra6v/3++oRDE1ddGP/xvuXhGa/2d1RtGmBZix/hT6bbjF2yjzRxVr1o?=
 =?us-ascii?Q?vXrWLyqE0SeHgEhzau/104TYCYD9DdAkTeouyGWgwa7jmfcTE5rkBFoQDcYY?=
 =?us-ascii?Q?wPMXrAWbL25Nn+zN6rECpbTIF/r19Y6AVBn++T+9lzXcJzOapq1i2bE6dSeI?=
 =?us-ascii?Q?rYFcmlCdYsiI/nBxR72WI3VIRwUyXRTbil15EEx9IPISDnfFLQjPzfLfYMIU?=
 =?us-ascii?Q?EW5TiPxFkiczgfAanJg1YFHd9CPxQrX8Sq7L30n5BJ28p9CSMxcz+81gukzD?=
 =?us-ascii?Q?C1f4FFK353Uq1CP4yns3Ou3yAoSlif1p6iK4AzhWhAP9xgCkUAQQfqt19wig?=
 =?us-ascii?Q?92lLivFwg2zdziItOP163Sz8QyYGSDy8fe0bHqT5RvzTy2pbA/rb8O6wZyZT?=
 =?us-ascii?Q?JB9FPIE1mydgbC1G9d+hvlYcek69sO27cUwBsw4GOBDDxyWWYCsMQfGjKsId?=
 =?us-ascii?Q?xTOVg9L5DmRpP2gIHhPbheg/d93PSZoIhFtXgNiwVl+r/aPt5js50mJfP+rK?=
 =?us-ascii?Q?ZIA4TvJY4FHxK12chLxw2EQTF8i52S22q6RUEh+x/EbhcVZqAOLCUv++CZ6Z?=
 =?us-ascii?Q?MqmTvIUCJvxAIW3HIrI3CZx/2OQJeRFMxdXZ7FemoivejAqwP7JgSKqzW52c?=
 =?us-ascii?Q?8K+7ODeeXHe3MCP5IMRNsx94Z9etxTd74g7PEysCFBAMEP0MK5w6E4u8v+on?=
 =?us-ascii?Q?O55RIvrr++7xrxWeOfKmgBr/93P+Yzuxi1Q4T9OR8wvNh8UU8PraRJ7hMTtQ?=
 =?us-ascii?Q?HXgP5+jrQimEjxKRnrWluku87nivYel0Cz3jRXdeLtbnGMhto5Xra5U9hbiM?=
 =?us-ascii?Q?ZmZdDtHGbdGmqZu8BwR6DebXdVQFjXIy1FNtfrzndzt2fnoOb3qDTnhMmCuI?=
 =?us-ascii?Q?qFGAUm2fZOAOp+LmxeCc/IoKJeC2W94Q4XVTugcUZuGSCeOEqy/WHdpGadgV?=
 =?us-ascii?Q?e+VY34Lzuc/aM4uPiZV3x5mFFHUstxE6FHbP7XCO0AmvNpwD3NfH9buPF/J3?=
 =?us-ascii?Q?yiQqc5wllY8vDEp33h66v/syxBZEGTfcITumJESka5zr+OufmcSQ2RenpbOq?=
 =?us-ascii?Q?aRNI4SIGhUnYK8pFoSY1QlBEhQBY8LcCzHPQw5Hz4t7H44/krJdpAFehwZHx?=
 =?us-ascii?Q?HKNwR5t8zNk1/pD2lK9TPFXMnpeCEIMhrQBYTbP+yCAR7UZMjWXrrIvC+1ak?=
 =?us-ascii?Q?NvGnHf/l8uwBZXdC+ct6FHZbnImuptUNAqor?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 04:16:07.9922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6c80653-e5cc-4224-3cc9-08dda3e7b246
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426

Fixed whitespace issues
Fixed schema validation issues from my end, but there are still issues with the aspeed dtsi file that are not related to this new dts
Reordered to follow style guide
Removed redundant status okays

Donald Shannon (1):
  ARM: dts: aspeed: Add device tree for Nvidia's GB200 UT3.0b platform
    BMC

 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts  | 1125 +++++++++++++++++
 2 files changed, 1126 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200-ut30b.dts

-- 
2.43.0

