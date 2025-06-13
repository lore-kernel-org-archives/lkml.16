Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2A2475CD;
	Fri, 13 Jun 2025 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749851195; cv=fail; b=WrKiH97yBMJ0/5fzPA4yq33yiX++9i2B9Mt2xHCv/vXHL0aqI945054beAU6dso2jwaVYFkor2iK9/cKGha52uD9o7whn/DnsTgJ/fIXmTQYGKpEMmxyEP04skOyJrK52ppEfWKhwd47Z0LWwIZhYBytSMtvEwMawR35pMjcyFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749851195; c=relaxed/simple;
	bh=M74lzjjeg5Qf4AaaERairdR3ywJHWRInkEyzzsMT0Lk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nPOV6fmVnIzIQA4ea37NKHcLVZFTlN0KzxnGkrkXmR/Tbb83bxQ6vdbPqrEP9t9Mr5sMiVTVGs8OFyk1MycUopKwuWqpsgBHDiseQDHFinHxWvwMU0cf69klO+y1DOD6nieA+biuNtZpgR+tn0Dh9h5rV3fR1EegXztJ6FrBW9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UQtLr+jr; arc=fail smtp.client-ip=40.107.102.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UQtLr+jr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sD7QzdKLQFTrOGxHomo+fLCmE66us4cZB7+n6keBVqwZWj7Q92Y5/Aj5dJgLEzC4adH/4kAXyaObK5K630YrPCIpeN7CA6o6JHlN9HiUn9CY5pLs1YuK9K1vToM64VBLh6UI1GFVwSVlHhBvdwbZwADF1mNx9ol4WtgETWgzPv8TyfgokjhKgbp2l3xx+DwhVTqrBgXjyzc3S9ZEIenuJIY7PxI8S0r2zfQ4YnbfqN8qddUH4ZePIilXhbnQ1BBRZaR4pKSTiR7njaB53zKPd6M0rBaMGTNSnOt7bL3m8BmFIcSIPzMrpNJ4eCncRGblnT+iu9GTj+e1mZ3qbKOSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1RQ9CtsEI0lAKVSUAoEpCc7HJadNJWzZsoDUUKnqdk=;
 b=XPE71kFT5/LmXjqLNzaE7na2Y4jf3b/MLR6CERrCyOu2Tr2cQv19FOGaShrXL6ZTQKKNvwUtvDWIJ48cGjUdCuLQJXm8WKon0WhGXkVrPl5TXZ2zkJ9KoB6rGtXZGObjK2DfuwXNiRmoY9iMnUZXIuJ3fIAJtTfx2uAC+cmTUWTNxdbUHZzJbaWEQWsO0ysDqMWIs5Iy06k4LGtYvmG1lzX1Vj9aCkIugnLUGIRo1YSo/PbnX4jAZJrZBp6qiREU4WCijxDG8/SqYWo2wq8ljwCsIFO6H0/YXZx9YkMooPWRenV9QfcLCB9nknBTAVIoCf16s8ysLuFwYsrVPbIb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1RQ9CtsEI0lAKVSUAoEpCc7HJadNJWzZsoDUUKnqdk=;
 b=UQtLr+jrK7KaBHNVIVzrN0bZ5SlZykcXH7cnGjteHOcirVkEdD4jinjYatdbmfNM7FWYQGZ0Qw3kUFJ8V9XauMl6OgylnpOyiv+suj2HvqzWIsEbMRHPh+j06gOz67a0UjUDqb4h1RnxMejWF8LRDHnM2boD/lBp3M9d69/9rdeMcrxSr1ZgMp9YvTa9Ew5s7PMGIvi2aHmXt1AzSuNY03BTW2hBFou5Q2fSaLC3X3TUGCA8RsXvK2pz1fHSgXUIrWqR8G1eThw/auYecqW9U36GDtXCI5D/lEYwLhGEkiz7LcILn96ORfvMZXTp098K5X+KcdmRtZb7R7TWpE2IVA==
Received: from DS7PR03CA0061.namprd03.prod.outlook.com (2603:10b6:5:3bb::6) by
 IA1PR12MB8494.namprd12.prod.outlook.com (2603:10b6:208:44c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 21:46:27 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:3bb:cafe::b0) by DS7PR03CA0061.outlook.office365.com
 (2603:10b6:5:3bb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 13 Jun 2025 21:46:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 21:46:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Jun
 2025 14:46:19 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 13 Jun 2025 14:46:18 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 13
 Jun 2025 14:46:18 -0700
From: David Thompson <davthompson@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<vadimp@nvidia.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	David Thompson <davthompson@nvidia.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v1] platform/mellanox: mlxbf-tmfifo: fix vring_desc.len assignment
Date: Fri, 13 Jun 2025 21:46:08 +0000
Message-ID: <20250613214608.2250130-1-davthompson@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|IA1PR12MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: 45907b5c-1844-4dfd-ccd8-08ddaac3bf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S2e4WY/xU3g1DvoaD9g/N5gcH/zjylBQYWhl4a2VRUTLtnPy6HthOWkKoXjd?=
 =?us-ascii?Q?So4eurYtaMO2A5ft5KAQqIOd8r4CkL4Esh2ZklFoPL/HG447UMRSsa3D3U14?=
 =?us-ascii?Q?JNwYuMVGlH4bEvoKbuClEylpW727ibW9/6HUWuG2uS+H+icNPVHTTW8hXGY6?=
 =?us-ascii?Q?er3aMb3SaygoaUIcpGJ7/XlZ42MLdOb6BdXyyYbqJDvXp6jTUSkYJ+GFK3vA?=
 =?us-ascii?Q?SSJgJp5jpywx9+q7deuuGVwf/WSWCJktK+JwStxq3liVaEQUunpC2gn+oPIk?=
 =?us-ascii?Q?yd3SwodyV+FYavaieGcM99WdpMLGwtEAqT9MSwr7iOa5UQ1tPZZf+0FbIVmB?=
 =?us-ascii?Q?oSEpP2q5YFst1zcdMX77SQX0rvgNXfOlHF5crO9yyxgbaqhc/O+NYRtR6883?=
 =?us-ascii?Q?uXT9tRD8/cY3Q5VenYBrp3L9T4/MCXRUHaxkdACnIAc/XTZkzkKZQXdsgsq/?=
 =?us-ascii?Q?ihIJAS/DARQ3KX27aOdGeXcNLMhIR9N2+te5QNxIMbUOfxjZFqvDMjwVdQfR?=
 =?us-ascii?Q?YHYUPJpjieWohwCfTbklbSxUqrRB9E2YmWZMSTKsuSnbG192nkmmC1cskRm0?=
 =?us-ascii?Q?Edhyum8YjnGqmoRnWmcap7ET8sfoXKFJP5T8Rh009mQ+r/QLPQM4DvWnjXfE?=
 =?us-ascii?Q?Hgn140z+KuBMVHlgiyU7ED0G6S72/lRs5OCvir7rhulWRKvq5dLE3tju0RQ8?=
 =?us-ascii?Q?zBC/RqbMd0u82c5fA+2tPnmeDcU6mk9Y++FndldEYY7wDeaFxwUO3jlvp4o9?=
 =?us-ascii?Q?twRFZVKHYWWIaf/Uohaz+lAQMSQaeneADj9YjKONbwsmsG3y6eCPTQuwCZ7H?=
 =?us-ascii?Q?esiI3QdJiWjHX7vRetycW+4MFz9v0tcAxX+tME8Czu5cZsz/LM8nbRk9xUNK?=
 =?us-ascii?Q?IVtAd4pqGu3XafErpP1zO8WGG0xBHl4NEfYfNWG0F0xN83xTetMgoWqqblgV?=
 =?us-ascii?Q?ku/+vWWTZ5JD2krB0+eIecSKQ5fZLyXH9btYTazwOkoNbhE9HUaE8+fDZ6la?=
 =?us-ascii?Q?tNyHMgf+8EvQqz2E9SZKM4yDApIE9mTIOiVDYTsXr2joZeKNG7HxUHANMxE6?=
 =?us-ascii?Q?/tGRhBYaFya3yi2iEn4Lr0x0ou+bOzOHeP822Baxb01BQxFkjC88QdrzDG4g?=
 =?us-ascii?Q?NU9jMaabmlFQV8OqZzMZi2zTj9eGiNb36ZFsOng3iqcyhry180yGnOVJHpvM?=
 =?us-ascii?Q?ejYQGRGpGIox5DF64sw6t3s9YTa2Ga7vqI6Dj03H4+l6MKd2gHPhH0hXPAZR?=
 =?us-ascii?Q?bB7BS3Ths4iSjVaga2GNGVLF6bKi7fxEWfc20AkmP7O81vbw9PVxHEGJzLCL?=
 =?us-ascii?Q?z3xOOGNsm37SNkItXiEqOGcG1jtTnoevKhQzAoy2q0W7xnoTdThi8CWbVkpT?=
 =?us-ascii?Q?nkJFY4XKBjcQo/KG94tXAR00cFs4fsD4pAychr1RWB/ZjnI5jTH0FeaMqONn?=
 =?us-ascii?Q?yVHX57UY4ezw/blSvUBASIXmVGlxgMZhgcYUsytVPDsVvSPnbi3LhemOmgjV?=
 =?us-ascii?Q?0rRCtYdQR4+by04wxixVrwFgJVuVYeLb6FQxUsjrlda7DmbA1lAcYuqxYA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 21:46:26.4946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45907b5c-1844-4dfd-ccd8-08ddaac3bf99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8494

Fix warnings reported by sparse, related to incorrect type:
drivers/platform/mellanox/mlxbf-tmfifo.c:284:38: warning: incorrect type in assignment (different base types)
drivers/platform/mellanox/mlxbf-tmfifo.c:284:38:    expected restricted __virtio32 [usertype] len
drivers/platform/mellanox/mlxbf-tmfifo.c:284:38:    got unsigned long

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404040339.S7CUIgf3-lkp@intel.com/
Fixes: 78034cbece79 ("platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no more descriptors")
Signed-off-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index aae99adb29eb..70c58c4c6c84 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -281,7 +281,8 @@ static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,
 		vring->align = SMP_CACHE_BYTES;
 		vring->index = i;
 		vring->vdev_id = tm_vdev->vdev.id.device;
-		vring->drop_desc.len = VRING_DROP_DESC_MAX_LEN;
+		vring->drop_desc.len = cpu_to_virtio32(&tm_vdev->vdev,
+						       VRING_DROP_DESC_MAX_LEN);
 		dev = &tm_vdev->vdev.dev;
 
 		size = vring_size(vring->num, vring->align);
-- 
2.43.2

