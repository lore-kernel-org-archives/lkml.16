Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E17253F13;
	Mon,  7 Apr 2025 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032378; cv=fail; b=PvoigoU/4VUrXSW9rzo0wcU72arTBxv+ZJNF6N6pAsJj+fNvGDZwSnODquTKuyO/Zts/v4Qxrqu7YKt5h16RR8frBayKi1GcLFBxP3SAWaGLh+Lj/Jp3RJ0Ge0Eg9BZiVjHmHN0nmGcvhX28ejaELjg5JaODhMhqZ+KH+psL4WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032378; c=relaxed/simple;
	bh=NM0/nFihtua0SgiJ1JXphu4GBoCcLMGOa5v0WGAKN1c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=anOPEzIsD97bT/rMjBBQ805PdgxyVp7R/yI5L3Tb7opskbzQH5T5a8kZxaytrRIbra4YJRq3/Gs0F0FoPSJuYxmcLvX7AWK6seQynsUR++9d2YRsP3NbidsqWxwyo2NtY1rCPWxkS/DgpHgUm08QQSH77yRy82Io+JEyXjrsONw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b8wx4H8z; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b8wx4H8z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYZVmqfLQKlNU85u94gCjFBouK4PyAoqjBXiFIii7iFLyFcC4Q2bIAtV0REQspQeRjIJzwKfpwU0SHJJRPo4OPpkwNJnTLhsJ2tcyC8Vy6c6eR1cbRBdIcWmjSE6OZ0J5Qy2P++4hNFzXyZZYPTpBKphvErfyTe8xe/FNFZykSVMmTAJEibGIkqZGOHAqXyTE7jeuGKIrrPiSI6s8EVL4bSvnLZAh1KqYzk3/NhHyM/ndZzd/mmiPQKW2bqTl2U+qJ7fpSVq3STsz7fZctxrA4dllX7cMdF4b/Bc4iI7x6PIC00z7T3dJISgs+qI9xL5YsvJuqrjPmSmsywyruBwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjlc9YKryFCoScj7PIdlCQo7Mc0hJ9cD24e2hV+UHZA=;
 b=aBDUUES1O5li7xLiPXKY+yuV2icK4e0arkWjGSqLF9ua95kKKl8q+F3k4RaTZrMCWxpu/5p6bFmhboshftmMkRWMcfH+5jI7GhVvzEddciHUOEqgUVzBUO2iHUd1X2KilZ+Qeg18u1nFA7Kwgeo0hVQTtxWmIYMZ0G0n4ZwcjiGI7UH9ywK5d7RqjrtZyt+0fd6Rjv3eQ8xEIIe4nanjCk4TBvbyWwfT/0CyXyo6UsdXys/f2lJbgfcMfZ7YQzv2vtbz0OKNOhZMh5oDi2Z76ts2q6D/DKRaNuegklmxlH8MHT9icp6m4RicAYJ6sf8ZfubWp31yJidVQWXwVJAUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jjlc9YKryFCoScj7PIdlCQo7Mc0hJ9cD24e2hV+UHZA=;
 b=b8wx4H8z8wnUHpZXxoJCdFYKHYTLT32cCc+fjH0rm1KNXucTPMKfDk7mXc0y8EUaWZXWvLXWd6IovxJGGK4HvpEu1K3U8kXpLM/A14t2P4eYbmq9+Regmns9cfKpoabYNRIZr/WOWMQ9GYPOOhG/w0O83xtS3CmeX23xLh2MRqyBmz0A7uNgQuJtSygIQvGMdZDrqpV3beMJOzfM9lUMT7py4IuY0Ibc6HTLnPOre0HKR7F21O2FHs1HVH0a3ZT6kGM6PgAjV5H/8LyPp3qWwTki6FxHNKbjrkXUcW3irNRDPbsoisEptz+YkGLapPSkgaaWiK6oihmjpFyVsGls8Q==
Received: from CH0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:610:cc::15)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 13:26:09 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::6) by CH0PR03CA0070.outlook.office365.com
 (2603:10b6:610:cc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 13:26:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 13:26:08 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Apr 2025
 06:26:01 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 06:26:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 7 Apr
 2025 06:26:01 -0700
From: David Thompson <davthompson@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<vadimp@nvidia.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	David Thompson <davthompson@nvidia.com>
Subject: [PATCH] mlxbf-bootctl: use sysfs_emit_at() in secure_boot_fuse_state_show()
Date: Mon, 7 Apr 2025 13:25:58 +0000
Message-ID: <20250407132558.2418719-1-davthompson@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e09503-9c28-461a-f404-08dd75d7c1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u1Bh2gDEUL2Ctj/6DWnF159x+OLu5FpQQ165a/J8+c6NjkkPDHeTfeEZX7m7?=
 =?us-ascii?Q?Wekaa8pZj8hbyEUvOtdPII83709jT3XfduhGlK7GgFuVtnAoy8x6egq/Mtyl?=
 =?us-ascii?Q?qS6GpOO9IxVhXLKRDaYH1UCRxHLBE68uuTSTxJlReTgBel5zS2g8a+0fu7Qz?=
 =?us-ascii?Q?laNePa3ScozAi5Cp5DkwcqMhy+2QqqKB9kGBE7obisxGqKeQ6KXthXpJ72F+?=
 =?us-ascii?Q?NruZr4Hcc+4Io9hatJkfVJomuUK/mElQYn63WEzdWwjiXp59qmO13OXWTiI1?=
 =?us-ascii?Q?yplaZ/j24DwVn+wRd8Fc86YxuzF5ozcZXH3lG4c4rQOoVVysq+RCNouCw2VL?=
 =?us-ascii?Q?kQNVzgCtOMLBQA7BQ3F5UMneufM3fTwyDevBkEz6LwvWAKKzrgWMeimnuUIe?=
 =?us-ascii?Q?cfjLB162eFcmIssDZWWz46ZPne4SnlWKg9xUT/ITPy9JsCUZsd+El1SH8QQA?=
 =?us-ascii?Q?xCp9lndKxFgqCs+BreyYHJaSu7QAC1Dmn3ja/JGRHa97W0eUat4dL/GLaoFj?=
 =?us-ascii?Q?Tx0XSpmbvQksElr5iR1buKmcNpUahPLYJ2PImHpPZSM6rGqVdM4bzl7UiF58?=
 =?us-ascii?Q?j8o9nJ1fe+3JYQv6th4UT7z87aKKA35wGK5GD4HJzZEOJLPp1+CnMPUZ5BHJ?=
 =?us-ascii?Q?esDHnGLVcwegt941CN56QYhudC4D1acAT1cmT8Z1nT0YhkDbZYlFZema93qY?=
 =?us-ascii?Q?xNTA9onutG4jp4xpu+Bq1Mp+ca5gtCiunE87oHdHqgHBJ259FDmBiHXSzUiD?=
 =?us-ascii?Q?NgVg1JWL97GfmygdDEwct79B5J9+Po/z40IlJ2acIxXqN6WCvvhoXsQl+I0F?=
 =?us-ascii?Q?e9lgpmPRqh1h4j5YkSFAHp2ACAAu4ks+qrYCdkU1yjgzxqF/FxnDA+8+mD7x?=
 =?us-ascii?Q?OTAHUfranqmBQ+xnK/SbwMwWamKTPeJyauUrKQgY2IzZRKzlhsm+9ADgExtt?=
 =?us-ascii?Q?YqYYx+nrFIgxL2IMMBM8PwZgTay6R6//RI1j02u9xc00u1TP4xrw88PCdgRc?=
 =?us-ascii?Q?eVGzq6Q647sFMfIzaw/I25047q10xDTWJhg7yJlIpLJdq/4P1LriiNQZOjpg?=
 =?us-ascii?Q?YyIH5Hul/iQ++N5jdOMyCz1CqcLp3Q1akLNyzTBNxTNpDVroUPHi6s6Uyaic?=
 =?us-ascii?Q?qahpW1cbaJPjBArCZJ70iBZrAz0qECK9hvdpLGd8VMPL0d0fh5hBtIhAFXOS?=
 =?us-ascii?Q?l8Sf/r5UOB2FX/LyXVQHbqnBoPbkWX2CKgti4u7Zbsa2GEQ/SWlLn73MIM4a?=
 =?us-ascii?Q?sDvszhM5TTLVdNZ6OyxKp5bXREtFX71ByTMAfI9S3bzOKxdS1udrL5qsXNVh?=
 =?us-ascii?Q?0BTtwwkpkdGx2Aii7cViTJarY5hlJ47wIQKZmrRXd9zSQBEJbDuzFYdiiPkU?=
 =?us-ascii?Q?iFqX+I6iDaYYEH8dD+uE1MvG2LLpJTSX+SiXk3MbcjWmx/kKc8j0ROZvoB8Q?=
 =?us-ascii?Q?gqAEDOrIlCQSSxxLPtcH75/hvkCJafKvs1WrxvjNbBUerqNODpzjspMNLsi4?=
 =?us-ascii?Q?yc+8bKN1HjqB5ek=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 13:26:08.6210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e09503-9c28-461a-f404-08dd75d7c1e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014

A warning is seen when running the latest kernel on a BlueField SOC:
[251.512704] ------------[ cut here ]------------
[251.512711] invalid sysfs_emit: buf:0000000003aa32ae
[251.512720] WARNING: CPU: 1 PID: 705264 at fs/sysfs/file.c:767 sysfs_emit+0xac/0xc8

The warning is triggered because the mlxbf-bootctl driver invokes
"sysfs_emit()" with a buffer pointer that is not aligned to the
start of the page. The driver should instead use "sysfs_emit_at()"
to support non-zero offsets into the destination buffer.

Fixes: 9886f575de5a ("platform/mellanox: mlxbf-bootctl: use sysfs_emit() instead of sprintf()")

Signed-off-by: David Thompson <davthompson@nvidia.com>
---
 drivers/platform/mellanox/mlxbf-bootctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
index b95dcb8d483c..c18a5b96de5c 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.c
+++ b/drivers/platform/mellanox/mlxbf-bootctl.c
@@ -333,9 +333,9 @@ static ssize_t secure_boot_fuse_state_show(struct device *dev,
 			else
 				status = valid ? "Invalid" : "Free";
 		}
-		buf_len += sysfs_emit(buf + buf_len, "%d:%s ", key, status);
+		buf_len += sysfs_emit_at(buf, buf_len, "%d:%s ", key, status);
 	}
-	buf_len += sysfs_emit(buf + buf_len, "\n");
+	buf_len += sysfs_emit_at(buf, buf_len, "\n");
 
 	return buf_len;
 }
-- 
2.43.2

