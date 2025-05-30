Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F58201006;
	Fri, 30 May 2025 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583919; cv=fail; b=WoyQeUNrLel6ILZg7FIZR6Cpk6PlIQOFhrrIBlK+yM0BxRlcg0hWe5eZLYzEHuCOnWnTlXmLvWzrj+eF3kBEbILQb3SZqP1yQ6j8o72lM1gO4wC2TJoqS70qeac11CSVDOSQA0D+k8LuNBLybZQQAtSKAZgFvq1GqqNEMUBy4oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583919; c=relaxed/simple;
	bh=b1j3ryeGgdN9w7n5P3u/LD/ofKvYOb7IO3nrzDXMALM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O75w3AqwVEJlTnAeUOJ2yPSGTFSVeCMEcw5scsFaUqklUokXR9C1LLzzXVIGsjq3g0CEFDidAByo1uR96BZudUVF7IopJvPMIdXaBwf+lbPKFXZ1uonDDmiNlE5OtjdAa6f/lz+T/Gb1i/ZbJN3WKsQNpuA4QRoNr1E/fsf6TFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h+5rbugB; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h+5rbugB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOIevCyI87WFllC14w9Udp5xeoTgb+lsJNTFZpydhTJNhgT1WsYWNDwH+VT5GJjjihoTZfAVakxgPIxwNiTTbVVLmCrQBmCZhiLApPpPm58gcVAfp19nF8nufDu6wjQ29+oVX81tbFSkBCUWAqWuUzWUaA1HmRInuD/wagwuIzzl8vOjb9ZW+d0UDFyrTvqn59yqOv1TC8pGZBvLV+muP2Q6RqWcnYZ0xqd0TbbnLLXuwnJ80hOT2j8f6CzgFd3H49SzF3zjEP5kcmHz7S8SlhPg4O8qvPgF1jSl9456zBsWZlRjnYpJ3gBSi4D1rCtMxDtj2T/3PZBoLEpp6l3wVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF+WF40QFPDmL3gixvagH5aH66oiJaShlZujnp+kxAc=;
 b=riVAynQulfnHTSxkhTGppixUgJ4SJ9UnCDJVUQSfa612/MRo1eCY7nUvKZ+Lj19ioBKGw3x4qB2bVrLEfjFiZU+Ga4xl2q1vyvTKmZJwSF6A7Axg0pPUZWelNp3bmYpdJ6Z0Soft1Rg7yG+PE4Bt6gFCzl5aX/+OJqPNgUva7njq9cFfw8iUSigDCV75hMXhWvID+KWqsAzw/nB0h7An6tkjmwBO2FdIX+xQinqub4hmZqLkdNuHmBxpEvu5azdfJO2oa6MAwW1REot/EfmAMnrp2HwaifIxrty8/CPXQWKm+ps5fWvWoPIPjAvww+AHe6tyGCOYlSaoCwO0Rx9bKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF+WF40QFPDmL3gixvagH5aH66oiJaShlZujnp+kxAc=;
 b=h+5rbugBE4l6Wg9eukdlIo0ByzZHhfgKvO47xFZLKa7Xf+eb1FIgVGUf1LHJYKrUuM7LHURm8/V5r+qPcTN27o6D5vkQW4SGXss+zD//t93MQvu/wOErw5B3JhPTf383R2ATAizXfmYWMpPl2wbjXzEudg18SzjURovOSApSVas=
Received: from BL1P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::9)
 by PH7PR12MB8828.namprd12.prod.outlook.com (2603:10b6:510:26b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 05:45:13 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::9d) by BL1P222CA0004.outlook.office365.com
 (2603:10b6:208:2c7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Fri,
 30 May 2025 05:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 05:45:12 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 00:45:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/3] soundwire: amd: serialize amd manager resume sequence during pm_prepare
Date: Fri, 30 May 2025 11:13:40 +0530
Message-ID: <20250530054447.1645807-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
References: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|PH7PR12MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 20538e36-08ad-4e5f-ff82-08dd9f3d2574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ftl/v76nYqAg27MEatVf5QzT1jvF6kjjMkEfHgajHW8ZTWE69yCYcJg0Avgq?=
 =?us-ascii?Q?FY9MjWxIR69BbJeZx0WnFZmkAAR3fHJwsPi8tnX1TYM8+y/hzNrve4XX0sSR?=
 =?us-ascii?Q?1KcQJ9J8kxnqM60GRkxJPpQJXJazhmqrBdRzdY4sccS2YNHP+D8cQThf+UNN?=
 =?us-ascii?Q?Avs21sn/y1vuCNA17bqwbQrMaU8ITZW4e5NSUmJPKd5E8umKorcDc+26TMpj?=
 =?us-ascii?Q?Uc4aY0+jqAO+y5cdvMYC8g8H66TilN8qbVHf4rUw39x4bTCrdu5Oj4KKcOZe?=
 =?us-ascii?Q?++vdr4PgtmQjB8Z4fbJdIp8BFLiWqlblXtD9sYSyk8L2nTTnhOGPswpRyM7A?=
 =?us-ascii?Q?W6g5EtBE5OOntbGBnX66UqQwvyOiTq7/jgkzaV2BNJVUZ2Y4bBWvsXchCR2O?=
 =?us-ascii?Q?LHgTyr7GMozSvYAwmMWC/VQxQU4BbA+sTWtu3XQ8YzFuPH3YEb/ynnynQTU6?=
 =?us-ascii?Q?W5sMxPWqZEFPuo2ukuWL3gOJoINecYB2nVmCkfoggszg9r3g0P3HWzXll6Ou?=
 =?us-ascii?Q?XLWvrgZZEOlOB2GE3asJQSZPPEjm6WnaRbx1tVZ9kgoJ29eBYlKmu1dD9++t?=
 =?us-ascii?Q?ACxGW9rlyxJp/KljL3H6TIUWVuA2X+52w7jDz1keEvDm+Rk5JVCJ8V5Q5Lne?=
 =?us-ascii?Q?OcqI33Wtk2ZIIdcOiByekg0pZSlhMNLgXT/McjXOnQR1zsEsP/TXzsY2me/a?=
 =?us-ascii?Q?X3rIK+p3QiTlKNTbPrzN6SdW0uEQFpHENfr0UcuQ4QHVsIxa87oqOFH6lopo?=
 =?us-ascii?Q?RcMtmm3HaGf2kM+OXhrX5ARaK7UeAvDYtoV2KbPfY3c90m31hIoIvKkwV6yu?=
 =?us-ascii?Q?eihAL8FolUwLeMVNFiLXe+Z+CqTd+Ly/02b6OAXENplv4vAcmklTQHiLs07Z?=
 =?us-ascii?Q?TljBgm4pXQxvCNt7O9MmI7mKkr7lN+QOMbTol7nxAmLN83ji+FcULhyBYSQH?=
 =?us-ascii?Q?VK3ywnxUafj9Fk9SR0XArbmpwXh3KuSh9gP2L9YEKMAR9DRtkvYOw8t5ERZH?=
 =?us-ascii?Q?nP26NXlUpMCPbGXflN2GtUxqk/g9fdRlMiCY1geGsRpTWHOdiQditjSYVqai?=
 =?us-ascii?Q?zT/9PEZlmWUHy3uCinDu7erAntWGwfhJ7tQHFGqwpLBAB1cL7sIYP8NubERi?=
 =?us-ascii?Q?X5PpiZnaX39nYjdXyPhYmOHXo01nyO9s6IxW9ayGHQTCAA9jyARLq4E6KQaJ?=
 =?us-ascii?Q?HLBFy6WxqfUXq0UjJTjXVVwrvTTQ4+EZ56MTXVVuio/p6z1k/MTbz1IxTpGh?=
 =?us-ascii?Q?fvkzirBxjtOA1jENHcVBwLuuS6ziMBGHldH/4ijv0XkkQBazRqnq/6ugHgk+?=
 =?us-ascii?Q?ysvAeqq1dIRDe/qL4xjE4diSdkv2DSOT2UoOFodHDFAkxgtn9H1K5mgYDcdq?=
 =?us-ascii?Q?81Is1I6bD5VxANFCTkB19TIpMu+mXJCuL0Nc6w5zGPls1dh9LtDCh5qoiWL1?=
 =?us-ascii?Q?Pl8eC299y4+Buu6Ywsq+17Qnk+JNENiGnd3I3iwyZRJwKyr/IMMC+uLYfu1n?=
 =?us-ascii?Q?u4Fxn7eGAGBfmZHPxnX3IcMQ9SiZo3KKWfIT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:45:12.6305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20538e36-08ad-4e5f-ff82-08dd9f3d2574
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8828

During pm_prepare callback, pm_request_resume() delays SoundWire manager D0
entry sequence. Synchronize runtime resume sequence for amd_manager
instance prior to invoking child devices resume sequence for both the amd
power modes(ClockStop Mode and Power off mode).
Change the power_mode_mask check and use pm_runtime_resume() in
amd_pm_prepare() callback.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a9a57cb6257c..b775ecab697c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1178,10 +1178,10 @@ static int __maybe_unused amd_pm_prepare(struct device *dev)
 	 * device is not in runtime suspend state, observed that device alerts are missing
 	 * without pm_prepare on AMD platforms in clockstop mode0.
 	 */
-	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		ret = pm_request_resume(dev);
+	if (amd_manager->power_mode_mask) {
+		ret = pm_runtime_resume(dev);
 		if (ret < 0) {
-			dev_err(bus->dev, "pm_request_resume failed: %d\n", ret);
+			dev_err(bus->dev, "pm_runtime_resume failed: %d\n", ret);
 			return 0;
 		}
 	}
-- 
2.45.2

