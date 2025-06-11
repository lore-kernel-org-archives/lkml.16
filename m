Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8317A2F4318
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682634; cv=fail; b=szpMvnih7hyN/4ptyRzhDYRSr2z7RhDzGM2Fi8ziUOUifOz7KZyWIuldd5qM2YA1J47KXGtq45t+WXoNNsdFc6mUX7Xv/DzcLZ3ggq0JOwHPUXounmVLHrK2Tz2EroxSh4qPXNpNwk8OYFDC+9bP9unWBScKo1qQTqryBZjRskk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682634; c=relaxed/simple;
	bh=fljO76R8eGMQXtOhSrPbFnFaDg5/9wlKQNyB3W/ZqBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QViwXAcQDD28E+cVjB7ULGn9cuplw/uvUecZ+EInK1sjJGm2y22hjvXPKL/UTRTpiehLWBGtySe1ZvlxXMaBdPSUCZC5wuzBnSXABrFJvv9PQ1Cue9u/GgVl0bKs42hwIXopXpOfrNs1TGKrTDABqIA4VRM8nUuPfjQ8SK79j50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HdtFOkaE; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HdtFOkaE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqd/GDd2xxHof2lAiNN7VQEamRZV8Ub6iCt/H35Ak1ZNkyP+a4KcLSCT59V2Lbtoj4H3EKXH48NInbIjlGyx2kKeZrdsWhB/77Zi7hV1JbwDf2+1+VdbGhZSV8VYxqPHszptaDyRwczaVc16M7FZM7ByFO9N+NKCAVR1QcLQd2xXCETGrtq/+RrFOQm/f0vC5jKioELDtJ015IEs/GE9J3bgzf4QvTQ4gm+GgmCWCSJvxpIuROCiKGgS1ENy3anTSzYDFGPClvVCdtYQVoBqgann8i4Ql/q6aPzJTVHfzOG/wUFi98KxAOzakN3L9Uobj6HaAltcKCWsoMP1r0JlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4RoGOt5iWlcoGwbtIzUMt5SJ8l+X1bFqezD5G4CMVc=;
 b=HyJum+Xy63hI3xKF1uhyeoKhbPQxi+w6T++pamYT1kxj91hXfDQ5y8Dkka2F38S34z7Wm+nRiqzI1v9nbi1cH8tCARJWPWPhSVeTu5jUBVWShv5XlohhKnTfrJywTFWcC2QAt8I9OcJRTgvJgftfijBAvIM3ifCO3OkStO89EKXBI9KdXqQCocJxxMXfb/8AhWLOzNoKC5n0emT9YZ26AYdqWBSJrF1dDRG5NV3SEWLCl8K/moMkU7zZMNceOyLg6t+tVIYQiTPdReZ+Rt0fBJHelJyeLOaapT1sHqY5/A3n9Gv48l+Miahumpb6qE7DuIPft3rcpU5JLJwd2XFrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4RoGOt5iWlcoGwbtIzUMt5SJ8l+X1bFqezD5G4CMVc=;
 b=HdtFOkaEvXRP5NRzYXQU2xWOXGIDYgiLEhAdaBgL6T3SrletyG6TG3JAecQw1h0MceAFFhuj/P2zLRzi2bTbJNkLLt0IZsbo62QbdOx7pDKDnUHmcrkEwU7CF5NA5d8BhMgDhJCWrU8UEabjQWd1nLpDmoVqSXyUsU/LSXQ5pRQ=
Received: from BL1PR13CA0232.namprd13.prod.outlook.com (2603:10b6:208:2bf::27)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Wed, 11 Jun
 2025 22:57:06 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::d8) by BL1PR13CA0232.outlook.office365.com
 (2603:10b6:208:2bf::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.18 via Frontend Transport; Wed,
 11 Jun 2025 22:57:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 22:57:06 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Jun 2025 17:57:05 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <lee@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <benjamin.chan@amd.com>, <bin.du@amd.com>,
	<grosikop@amd.com>, <king.li@amd.com>, <dantony@amd.com>,
	<phil.jawich@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: [PATCH] mfd: core: Fix MFD swnode and fwnode conflict
Date: Wed, 11 Jun 2025 18:56:14 -0400
Message-ID: <20250611225642.266069-1-pratap.nirujogi@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 053aa9ad-bfc0-4f97-5da5-08dda93b49bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k4pYhgyObKHc0RbZv49z+W8a8m20g1Vx6NwK5pjoRPXAsHgiZhh3zRvOK/Pt?=
 =?us-ascii?Q?r73VCMGuXbS5wHKxXvJhHST80XP6ZRqv7NsBhZu8s2W+HO+qyKAqoitkLnmR?=
 =?us-ascii?Q?woNhNTIuMaFdA7uE1/VHMSDTi6JpgrxLN5DoZ+asXLQrO1mfsoF+65Ybi2ho?=
 =?us-ascii?Q?bfwUMGowojJ5TO+CIuhyvWOox6WS1cCJldkxUq+o/mbMN8R74vgR/1YkS0la?=
 =?us-ascii?Q?FEOsCBcl1ojAIoKzdfiNcekIXI3Okukr4rkaB/8IzHjHDHcMh/Cexy0aIh7S?=
 =?us-ascii?Q?KWxlmBmHtzIbcfmwJmjqCSkzhmz0E64SCSlfivMsA0fseyMfZ8XVp4/Yuarm?=
 =?us-ascii?Q?2/S1NU0IESqCYpQEbgLL3tbReBOVTPZWtTTGOIE6VycqZ/VeTAlwlCxGREDe?=
 =?us-ascii?Q?z5h1vJwDAMKOOb6Db8SIOHyq9O48UF2UhMZuuxqGFHp8TTCLuXauDSlQ+9r9?=
 =?us-ascii?Q?uh7BQX/k7l2K1mblO0WHn4DhnIs62D5xOzukeiD7bTPDs4jjwBekxr7Fr6wj?=
 =?us-ascii?Q?f9kBqcdmeYlxVJM2hOyKlh7XXkEE0ZGvkyOZsuLYljq7KgfpkguCM5BYmVi6?=
 =?us-ascii?Q?co5zsbz4RoUoqElVRxuTK4D8zdhKgN9BNLw+vqBfQrVpKq6bK1CK63vFlLw8?=
 =?us-ascii?Q?IqVfCw/+qppAvEgR71TlvC3qXk+golAyUxVmCiryA8C7a+YC0ItlMyF2iMfA?=
 =?us-ascii?Q?hEfNNV1lZBB5JNughvIXrQFKrgi9XLmVQAnrm4cM7nFNmJiZrsCdct+0U1wl?=
 =?us-ascii?Q?/vYdHWKcGVcOsxbQtECcjbJWMAWbqV6QmmnBAyVJzqmFi5LIJ4+9AuPUBruh?=
 =?us-ascii?Q?lYF2uox/DjFosSqciexVKMtahOxX4Aeum/jLlrwhWWHHQq8BpHPGkb+cNgrq?=
 =?us-ascii?Q?HwwXqUPWHUrzFBvQN5SfHSOnpGIexOFbd5gtngcSxwbNlEvgxBHuxaDZVrNB?=
 =?us-ascii?Q?xurir6rZxqg1N36o0WSdE7nup9PG/2+0CctXwHiPcrZBu66JeUwLeXPBMCin?=
 =?us-ascii?Q?cGSIaQ4H6kCE5I27K/z6tFpTGLwqWHwZlbEOS+iP8VXGHhKFahKl+MPKDy0e?=
 =?us-ascii?Q?VH9FJWj0e62fTFR9ZutWmti3naMSA0dU2q5m6x9hU279MRpIXpyAvTgZMk3n?=
 =?us-ascii?Q?MFP/poCwhByvshArby816VYQSw6T8PMcFszwMIi/HCX5+S3trP/QpxiiLw+o?=
 =?us-ascii?Q?lXBTpkC5s8PrsKZMHSw1hItaJIyvgPdpdahSuizKZ/kihVyHmhxR03sw/I0i?=
 =?us-ascii?Q?XRtjAZPxxJMoOYDtwKtVf+U8dEAn0/GT3kQ7iXbdRmEOjMWUSuxRgW9D2UO7?=
 =?us-ascii?Q?NuJJ4khjOf6d52+1LwSYaibQiTGX8WjUHM0YXgbSjcgFWSMyhqxr2iXFQbyU?=
 =?us-ascii?Q?5Q98ap/uTpqOMXNGi+ozeRtyUX0T3AsLHHaaqBLHCYmI2aDllrydF0+dwgbk?=
 =?us-ascii?Q?XOR1ydsC6cKmpdlshr+1OFsli7L8Qa5Mi/7kafiXfjPMz41mvwUFnyVXGhwb?=
 =?us-ascii?Q?8ZMCmpTzBX4e6DxScJ3ahH3T6NpvsyBqlWer?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 22:57:06.1322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 053aa9ad-bfc0-4f97-5da5-08dda93b49bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055

Initializing the MFD child device's fwnode with the parent
or matching ACPI device's fwnode is causing conflict when
software_node (mfd_cell->swnode) is explicitly assigned during
device creation.

Since a device is not expected to have both fwnode and swnode,
this conflict is leading to mfd_add_hotplug_devices() failure.

To fix this issue, skip initializing the fwnode from the parent
or matching ACPI device when a swnode is already present for the
MFD child.

Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
 drivers/mfd/mfd-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 76bd316a50af..d5680132ed21 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -212,17 +212,17 @@ static int mfd_add_device(struct device *parent, int id,
 				cell->name, platform_id);
 	}
 
-	mfd_acpi_add_device(cell, pdev);
-
-	if (cell->pdata_size) {
-		ret = platform_device_add_data(pdev,
-					cell->platform_data, cell->pdata_size);
+	if (cell->swnode) {
+		ret = device_add_software_node(&pdev->dev, cell->swnode);
 		if (ret)
 			goto fail_of_entry;
+	} else {
+		/* add parent dev fwnode only when swnode is not present */
+		mfd_acpi_add_device(cell, pdev);
 	}
 
-	if (cell->swnode) {
-		ret = device_add_software_node(&pdev->dev, cell->swnode);
+	if (cell->pdata_size) {
+		ret = platform_device_add_data(pdev, cell->platform_data, cell->pdata_size);
 		if (ret)
 			goto fail_of_entry;
 	}
-- 
2.43.0

