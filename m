Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625F78F5D;
	Wed,  2 Jul 2025 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450973; cv=fail; b=RO44LhgUbAZxKB0UAnqz9+1Hel4AjAedQZY4JkESkGOaF2g579ieGnYk89ctvEdEd3bxE5wPSDMqZTYVm3RGzmLcAkvSXBNEu1/kc8d+Gn9PQADolUlnnSJom019O6NAH829jmPU+uLuAY3Lk6B/VKdmRiMmJXmN0pjWyNRC3OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450973; c=relaxed/simple;
	bh=F1N1CsVpp+0vskSh1yhWGq70WMhzTVh0G4ifLACa0sc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jUM0WpK10GbnuAdxuUVG5PJHCXmCyI20CKUd6zKetgf1D9pOOebxMCHSqL/G/HWXMLkLN22shIt4KM0/WGpV3CqoFE3EmANO9/0jpRiSznOJJyZMh7+xdOzV/7YDIzDuE3a8ZLz4yfeACg8VgUw5S+o1xFGVQyBTzUKIV5LdqWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EaOi+F0J; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EaOi+F0J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8xoqLsJX9PQJ8Zg7TKDfilTeVwwTiqoa9V8mfLyLxTu25j0Ag5Y/SbM2/GztxihNUsRA2NyGmQ/k1dmIm0zBtvhOQNxWDHF7iNRt2/NF+WU1Fai0tjsrMb5uXeaPQPFyaEfHytN0lCMsNU9uHwS1iG/PhvvjGZKg6XhPHyWmU9avEocddX8M7Fs4YI61EncLf1NyikTj6MlGx6KE9Gis+uCCX4JytIzezRDgTvA+d8Ttit/ba+7EZxTi1zn45WgX0mxrN4gBqySUdXE0EM8aoNb27uX1HRPtsbXHbUfpRvhpX5+gouR5sw3OzL3Gw9JOdlkWDysDAfv7cMwKdywQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx+V8sKe6j95OhgqFU41UtqBxB0XwukpVWIn2Izvazc=;
 b=TGywYYuK0lPpawpGL6XSFTG5jwJuN+ZdeIR31F8jaTh+mliKVZiP33zQ37Nv26UaTUkGGk6VPJGYQBy91xSc9ZpJQnHqUSVYzy/iY74V1aj5/OfV7sQ/4701LuPoXxxGS8gWua16ykOFcCal4uXeLMElBJSl7+vcK+mOvczXqf1fb8iikDoH7/YXAaejL1sjwckPFa/HAakeGHVGUcTm5MA/b0/SXSLPq0vrpmZbzzG2a1rRZCYjsMKdYbLdJtEqcaGuL1f5fjiDuXVoSQjShhgFtWwTaxSd8Gn1on2SFW4OYxt3tlZzYGiwEMtoRkz8AipsKkT5Ahvr/7OZLdYVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx+V8sKe6j95OhgqFU41UtqBxB0XwukpVWIn2Izvazc=;
 b=EaOi+F0J1qqibelSRJkaKemlfAfktEsUextXdtkDz5rh8phrnnOQy0RT4hIslHF6MhhGuEKqc+UlSapBJSh3OYUlGoy0TK6jMK0HKlrjETPQ8uwJVRn0UIwoAsIdqaLsZBA82wrmYFN01xXkim2a7fGYIg8DoFgsv30301x+rDNj85cp6heiR/xmZZns+UuCZ4aRxGrq1MHtHBVbZrrTRuvelATySoKjKLjdaNdZQPd5hSWYorfsr4PkI0sTDbB/MCKcXLu9QEuJAms9o7g0f0tyIZzi7UW1Fk8RbcdBiyoujf7yJAqpaa7nqH4EIY0lwkABW4culhJEY42rdo4Aaw==
Received: from SJ0PR05CA0158.namprd05.prod.outlook.com (2603:10b6:a03:339::13)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Wed, 2 Jul
 2025 10:09:28 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::11) by SJ0PR05CA0158.outlook.office365.com
 (2603:10b6:a03:339::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 10:09:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 10:09:27 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 2 Jul 2025
 03:09:12 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 2 Jul
 2025 03:09:11 -0700
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 2 Jul
 2025 03:09:10 -0700
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak
	<vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] Fixes to mlxbf-pmc
Date: Wed, 2 Jul 2025 06:09:00 -0400
Message-ID: <cover.1751380187.git.shravankr@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaef906-2fc4-43f1-1899-08ddb9508799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HZjFaf87w7O3SQ6AC4jWBdYlNDHk7dqpjiMygI9WXnWyt8LxCS5sOoBus+NB?=
 =?us-ascii?Q?MhtO8PJB4L/tuJhp/xsqiyia0Ra3zX742dHCYaxCbmXHKyyjk0Hm4Q5zh6w1?=
 =?us-ascii?Q?EpEpdaCptIyC+u4cQX1t/cuj66hliTLld3GpKX+iq/ryutU5oP0RxHogEkjL?=
 =?us-ascii?Q?yT8SiqUfQpyPg5AEa4TGWWzZib/NHTtQNB9BmAavZPBdtsZkptK0jRA+C54Y?=
 =?us-ascii?Q?xxw8UM5tTSO6riz+7L0DWgpzyGuFZ0ZaxNiky+WQRzQY+hoX1FWeJHsCgUtH?=
 =?us-ascii?Q?y2jrGapgfl0Plx0NwQhlZQE9DMdRdK36Z6wcxwYLgG3evkzBEagOJIcMmiTy?=
 =?us-ascii?Q?NUF6PcVhOxS0fhbQsAW7db/OnT96kyPY7h4kU5bxqZG4NOOjP/gGSz66sAOb?=
 =?us-ascii?Q?iJE2J5hMdFm06b+HXTH5WX+mdUfDu4vFwyWBFKz43Dtpy6pcW8qUmDO4JRw3?=
 =?us-ascii?Q?PxDPpfSyANJxW92bqbmDRaX+grr+Z63Arr/0rNURs4HdHiQxGOtqUqfM1iEq?=
 =?us-ascii?Q?AhnLUl5YTAXRPTGtB6yH/FgwZ6IT3fL64K6xMWd2v366MfLGl24lRulQkBK5?=
 =?us-ascii?Q?Q2qaVOjDLy3GEi9LrOnNF//VC2F7eBbGlrMzoiTl/STBDMePv3ivNwnL7b29?=
 =?us-ascii?Q?I3fbHaO5cM8jsKltAjpgyXM/v3f7WzZke/nC+0kBgcQOL4AClpYyaokKJE7y?=
 =?us-ascii?Q?8HhV5a+wo5f5MaETme5s2d0he0EplH7Edok8oZGrMQpLsqPfsuOYBEP+m+Q0?=
 =?us-ascii?Q?FmMTAHWKW3p9YIzleGTO1Q9iRBvd8Fx2ozgMrnOl53yGTl9vbiEzIZtUfGGz?=
 =?us-ascii?Q?7GCNwFLKLvuXB2TN34Qd6298s5ZtBklJ7DMGm5G3MBGJ4zmbXbotoyMSibWo?=
 =?us-ascii?Q?bgbXQvPhWuaJEE3E+BJy8LDy6uv/S5tQ7V3lhL7wRAah0qoShcUnRUkuG5BF?=
 =?us-ascii?Q?UXmlB7Ql0meoKNCDkMQ5uoXW6JOw6GZEaYCWJesIzLsPF2pGMFNzRLwAht04?=
 =?us-ascii?Q?D7otXiWpXE1OYTcE1dEGs6XSMQCL/k+o9QBpN6ivbxIVElRvc8zGY0DJuctZ?=
 =?us-ascii?Q?rF9VQYMUCAacninj9rFrdzuDLQYMvygbynIWbcq6xyycbsrkpLx61sOQea3A?=
 =?us-ascii?Q?aijrGa/LVHa1wWdPjxW6LUumUy4DEpXwmkp1ga4SrHAFWNf5ZVtcd6oPH2F8?=
 =?us-ascii?Q?oVo38baA8uTQPjHXVsZGEuPsOnPDIKPvVoKbcxT7s1NiJfp9MtNkTsRWcMt7?=
 =?us-ascii?Q?FkSkfiKbEJzAmgecUfRfpnQ7+DzJnXzCpYz/FqawAoW5eQ16+JW+EQfOIY7a?=
 =?us-ascii?Q?FvHYZIgMluXXaEaLg1lvF3zrpG8PsAsoLF8ZVlYh0w0YaPGiGvBYU7cV6HUW?=
 =?us-ascii?Q?hzqX2G1Le2ah1V9joehbLXRlLFU3aHa/MLkSPebenjIUbsICFvrIzPxh4R+m?=
 =?us-ascii?Q?CR4KMdSFnPgf0VfzkdjjSF1DOf9irG19furr94DaI7WhICSiHlI86+Vjj0i4?=
 =?us-ascii?Q?OOARPtpoqjQMGlch6vLW4Dlv10vmV0BJY3RK?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:09:27.8652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaef906-2fc4-43f1-1899-08ddb9508799
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014

This submission contains 2 patches:

Patch 1 fixes an issue with matching an input event_name string with the
list of supported events in the event_list due to the trailing newline char.

Patch 2 adds checks to validate the input for event and enable fields, and
prevents the user from writing invalid values to these fields.

v1 -> v2
Split single patch into 2 patches addressing each fix separately

v2 -> v3
Patch 1: Remove the trailing newline character before comparing strings
Patch 2: Use kstrtobool() instead of kstrtouint() which would validate the input

v3 -> v4
Patch 1: Use kstrdup_and_replace() to remove the newline char.

Shravan Kumar Ramani (2):
  platform/mellanox: mlxbf-pmc: Remove newline char from event name
    input
  platform/mellanox: mlxbf-pmc: Validate event/enable input

 drivers/platform/mellanox/mlxbf-pmc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.43.2

