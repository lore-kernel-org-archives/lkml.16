Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70D31F2BAD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749841101; cv=fail; b=e+s9FoloBjqdXJVT8ZpxpxJhho+UwaTkaDnTtYhQWaHuwxFvDr1dysgzVHRGch2tmvylWTjdlxjtluPYoYdwHPKbov6KYTSsoqVwaFXZ9/ZTwY1gUBrHgkpNpo/9Wb2+9dCC7g8dX5DgWxcEspRowiDVtxD0vJHR/k7JgRri8vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749841101; c=relaxed/simple;
	bh=8/76QHOD833U033JymnCcIrDp91unC4kr6Ijll53Op4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=etNK/GmPAOR80rQCz2qxUMh9r9kcCYm8tmfTg7+MZrMOVAKpxwuUGSEnD2oi9BkahLILqPaLJnpN+ti6+6lEKupxyaXXpGE8Vxrrmd1RTzgfBGfe5zZ9ozpHwj5NqtTy8nn9plsPe9J7YY9WXle68iIC2wegYbnhaWMbovxAhGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R+1T0RmY; arc=fail smtp.client-ip=40.107.92.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R+1T0RmY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFavNET0xanYSz7162zLZD9yc//51rAqO/X0Sly+gKVX7fI+EBVDG9Y5GuBRIqcQJlNvlggoikqLbWGMcwmEhcZ17T+bmX44ZtSQRFq5U7PSttpXHswUyd5Bi9oIZeSRmrYx0cVTXEt7TpjPPpaMVWPKAfB5U7bOYUbUg5sDLgQWVcni6H1figcHx8icEzPeKa5tk7EfhQOJ7CRCTIsbTFp/t0We4cDLFuBn8LjqmuEjssZoTuXzhPxaXj7fY+5Sfr8BgQZ8fCGWNZ2WDH1eVT3KzWKUQUp6M+kH/jWL7UqOyRVU6VZkrW/tA8HUcUWhfdhQX/5rhp/Zte8N6Kc0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxlgBs5CertnVWJ9cnXW1yjB2y8FRebeRVjt7GBJSKE=;
 b=WqXr/vAUprDW4Zrg/RR5wlHYyQW0hfZj2OAV9nK6R1r2ZQGqoyfUMV8bvEx6NEE+uYkTfKQzzUJ8SPRHBccaU1h+fJHT5cfdFrKsebw/D+PnfrJpuTeJ1i0z/0/r1BxziP3ZLTEgK9YUPAE8s7Tm3xJoomyC22Fd3h4l9S3g5Df6glj80OIM1O/ciwuketYMiZTEzK0RGlreM20yFQPRbAKr5mm3V1MPVxGz5RXxVmI3dE1fg4jvf4iqeNsEhnsePwvnNIfgBBr99Xo/ASuDM+w8CGIVxtGQg/to5yYBGkWLId/X8NGE9wTyW7M0NRtwezhEkKMlMQzuMUKnzyDSBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=canonical.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxlgBs5CertnVWJ9cnXW1yjB2y8FRebeRVjt7GBJSKE=;
 b=R+1T0RmYaG9DSYbHRLQ8s6XxYM0UvaOYS/BpsdpgPANIqsMlcPEGFAWQQQfDVdyJnoGrtzVyvfYlnxpU62R0jMsoCHXCoS4nTI1mRj1DxmBuKh5xJK+zwe2sB5QX28Lv7MHeP2ZaD8XcARgu/wAQ9iWnTubmVMUH2EjWtDLelyXXbDtyhlunL/U97TpgxZU+YrGjbJVm7SkiZHTMULQfQjn9aO4Ysz9xxBEb7N8XorfTpbtMWDAzX1NSj0V9AAKQRDkKHnYSlK7FswhmsNxckpvHOCbbDTA77buEyVjyl0A9rjkTmtt9lVAYw3KIEsjDW24y8JRlGIUgcrGal20xhA==
Received: from MW4PR03CA0297.namprd03.prod.outlook.com (2603:10b6:303:b5::32)
 by PH7PR12MB7330.namprd12.prod.outlook.com (2603:10b6:510:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 18:58:14 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:303:b5:cafe::54) by MW4PR03CA0297.outlook.office365.com
 (2603:10b6:303:b5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Fri,
 13 Jun 2025 18:58:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 18:58:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 13 Jun
 2025 11:57:57 -0700
Received: from localhost.localdomain (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 13 Jun
 2025 11:57:53 -0700
From: Petr Machata <petrm@nvidia.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
	<lukas.bulwahn@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Andy Roulin <aroulin@nvidia.com>, "Petr
 Machata" <petrm@nvidia.com>
Subject: [PATCH v3] checkpatch: Tolerate upstream commit references
Date: Fri, 13 Jun 2025 20:52:58 +0200
Message-ID: <20250613185258.158845-1-petrm@nvidia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|PH7PR12MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb39b19-2912-45a9-503c-08ddaaac4009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fk2UfESQJHzQDCGP7N+4giw4W1kcsMgZJQWwvHQ6bvhyZJjs/ovQOQH5RCMn?=
 =?us-ascii?Q?SLHSVtOBGSnDgK/NwZfTcM+Bcd/VFrCrfmhFYCHmbyC15mNnP1MDrm7pD5PB?=
 =?us-ascii?Q?XaFc9UVVS15Dp2ZJBUh9JCFQVDBCCLHVbnYLf1W5s1FpGEBfT5ByZjdetvJ3?=
 =?us-ascii?Q?FZTrJLW+MW8CE5X90UfnsUI8JnK781T601IU5IhtfOlXTOLBZCcOdkUQ3Al3?=
 =?us-ascii?Q?H2LkIcJtgqhC4YGUSekkHx8S7JRHfHxVdN4OxeJ5B73krNuGMW2Xs+oajkOu?=
 =?us-ascii?Q?ZkETJAMtrC4Q5oSBg3J6tfEuXg1BQlo8UBgu3P0DdytSxGkgC5K7OTa70z/b?=
 =?us-ascii?Q?S6zUZ3ibAJEikkiy52JNsEBw7QHjfk7rhz2PKae5pI9ZtSPgrQpXU/1vcZdY?=
 =?us-ascii?Q?wRu4DeCqSImF1qi3sGUbZ9RyUvG9OptztG5Mpyih1JLNbBJs6QGvknsrr7uy?=
 =?us-ascii?Q?lCj9AN/0iM2xwgqf3TxzT1NeJ7u9Y/THnC0jNy/LawO5lZaQ8ljsNQUnjfWF?=
 =?us-ascii?Q?NCUyFpFSsgi16px2oQ//pmqZG4ImL0PeiDqRLsrBTm3blRgYjrpkUZeYfTEx?=
 =?us-ascii?Q?2cexNp0+dbXdcIo31aYzuZ0rD3/TYaA7NwS3Mu5Bf88K6KZ9PW11I8JofL+A?=
 =?us-ascii?Q?EsKrDGknifeRoXR1gBYDYpDyOAIi8vnncW+flsWmTLczgpU9JnNPN8D1wCix?=
 =?us-ascii?Q?cjL6l+rRgARctmb2T3cbmzCxZUC3EvwFi6qjQG0WcczbG3Cffxy7kZ4zqref?=
 =?us-ascii?Q?7MqpqMA12d1wIitXYnJFn8YP+NNtrr3jgLsEmiPnRNrfVjb8UB48H3V10e0N?=
 =?us-ascii?Q?nlQlxWs5TLEX/gXw4XqgnNTsPdOddotWltEDBroP6fSEuksvrEDqSDtIywqX?=
 =?us-ascii?Q?7I/XL7L+E/sFp+THmapyMihuBvMuQyCiHAcXhODTURw6qmcJrp6wJxP24rYf?=
 =?us-ascii?Q?/hIbMW0ys2ptSPs1tSixd+9zF3wPfAKc0+edGlplPteXImRsDiyLrKOTw7qR?=
 =?us-ascii?Q?6Qo1ngSYzUtwpfte1K6bUXcFbggGpv4bPXQHx8yvxguRB38hePQOaUbEF1DR?=
 =?us-ascii?Q?i7TJEWyeOQ1zZNy9HeLJYTRLsNpDtfeeD5bZVDdXKBFAAhSokzP7GcPHvkpu?=
 =?us-ascii?Q?wr3mU3u+qdvHnlxUjZScAGr27Xz56kNQAg7r12B344ebx/Xv4kPsf6OlhVe5?=
 =?us-ascii?Q?VR90uJ5gSks4DD2J5C40cvE2pl33/GowvR0yf8IcipWxPvx972lFaeQol8p4?=
 =?us-ascii?Q?0Oo/71yrm5ozOZLtISoyqmspknYIFSSiKJVledTYqoSLHPUUSKx+aH5SaSIv?=
 =?us-ascii?Q?atclQk9Oo22oxg3+ULhfrD/MOsSigmME++kr1sIiIZGK+e581nuQdMDKtzEo?=
 =?us-ascii?Q?UPjEvuTcGph1Zv0KTTfzYWf7W2AE7Qk96mUsWoNyRVNQIp9nfCUYA+AD0m0k?=
 =?us-ascii?Q?lvmbFGa/Vn/o5xLlfyVQCu81UPT41fTyh/pSErnrfZTGsIApE0xKNYrka0L0?=
 =?us-ascii?Q?4TqEh0YC0/hRWBWm/H4KycbNozGCE/EfHavp?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:58:14.0614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb39b19-2912-45a9-503c-08ddaaac4009
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7330

Two forms of upstream commit references are used (and documented) for
stable kernels:

- [ Upstream commit <sha1> ]
- commit <sha1> upstream.

Extend checkpatch so that it doesn't cite these. This reduces noise that
downstream maintainers experience when checkpatching patches that may
contain commit references of this sort.

In order to future-proof the script, allow also permutations of the above
styles: with a period or without, bracketed or not, capitalized or not. The
hash is recognized as at least 7 digits long, similarly to the "This
reverts commit" exclude below.

Signed-off-by: Petr Machata <petrm@nvidia.com>
---

Notes:
    v3:
    - Tolerate a couple more upstream commit reference styles.
    
    v2:
    - No changes, just a ping.

 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..adacd7b3996e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3351,6 +3351,8 @@ sub process {
 		if ($perl_version_ok &&
 		    $in_commit_log && !$commit_log_possible_stack_dump &&
 		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i &&
+		    $line !~ /^(\[\s*)?[Uu]pstream commit [0-9a-f]{7,40}\.?(\s*])?/ &&
+		    $line !~ /^(\[\s*)?[Cc]ommit\s*[0-9a-f]{7,40}\s*upstream\.?(\s*])?/ &&
 		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
 		    (($line =~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
 		      ($line =~ /\bcommit\s*$/i && defined($rawlines[$linenr]) && $rawlines[$linenr] =~ /^\s*[0-9a-f]{5,}\b/i)) ||
-- 
2.49.0

