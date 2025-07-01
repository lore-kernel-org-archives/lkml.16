Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F43241CB6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350140; cv=fail; b=usBLdmn4W9+136kgitaGJ+Mu2W5Xx3381JCY0fXdz+mkqi/wznnZk5ofZtQp1wZbb0g1Q2091ByYsUDVzF9cNx0snIZu2dZW3+VXgDwVjvJ1DJZmsK1grN61QXhtUnbHUxqdaQK/hKF9BzGMHAUuxXJeJuitx18ROLSaupKKE34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350140; c=relaxed/simple;
	bh=XS5EfxciI1j8XuWBugVWVcMEhEjX6Grx/x3jNq1i2mM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LqfP1L2HxSj++9zhfAUcyvH+GEOAIjr/BqLagd5F0qI5grT/b/JDDWQHxBPsRKZNBfNEQlfQnhIdxyH7OY3x4Wc+0uzfjUT/dYoZBbwzMGU1QH/GU8lSY23gDSJ/H/SZAQLJrEg15Il4Jzs+1oK4aNqubJ8MJmrpv35lh9O7Tis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KzWkY2DK; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KzWkY2DK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhWeab3pZhKqUvhR5TniyRoBoLgxX0PoDrlAgxUYmhGZtAG5aoU+H+F+92TIguoETpIgxBjyV+amppLbpeRbFrG0FomR41mRu3NR1TxiY4Sx8ChmQi/psPPay3ETEp1APbBhyFmtRzK4TYU/a9CNgN/xEUWlfregnLhEUDwRbioCXBqnktHxawCGpjSRao1obglZ7CMoet4+oNpDc0UeoFkAI22zzDTLGiTZbV38mCXtmcmCNVK6F57+9oit65hVFIpvp+D+Q68wDAVHha0ZDaoOR/9DcS4jo17gnyv8P6Lu/9Eeh+AB7hW5VzH9Kh3xhJ60sHZCkcPqYlse5Vhp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlBM1hTpIO/NTF8REHTqgPKodxQYKBPD1co1k7o59B4=;
 b=iZcc8kE7V44zKn6aqL3+mnqptkz64PXhIBimNQWrXj2/5UvjyTpHDbcUXzOKIicLDcsk5q1PUgMpSBacsJ0s7Vnn1tyhXk11R/E+dXkpIvYU5/S9DncLAl69SZUzeF7l2Q/XUszkXvtK4lVbV5qesm5t2GZesIcZtQ4yye7B6MV/ZGC1Xt/XlJZteOV57CvW4XWTqUNMVyf67HypIolIfrTglouvb5fRDWiKocsn7r/mpvicrXMOLWfazq+zVIlJDAtC9q8FdjaLJv2ZUIb5UOdzAKl/4+YPor1nMptTSsl9bCMAEtIfTTiB58MRGXhUzLCKzzAs9GbBhFZanyhNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlBM1hTpIO/NTF8REHTqgPKodxQYKBPD1co1k7o59B4=;
 b=KzWkY2DKjKu9XvbDMQlEzT/QnJeX8WdH4e8ScRVEzYROj5JARN3MmayzLs+YJ29Wc1zLvG6opJDSKTVeKWtWuRdjHezkehkSDYH3X5dcPbfIqyNq11NU4VQ0mZ+RdJ/L0PxNMIldvwZI1qsrsFb7Gh4Aym2RjKMplS4saCUfK/1gXntVJ9EmqHvm2s9KU3W+6xEbCGDX1xjJ/MS9RQbYcR/H4/c57tpfBevcoiuGRvn0fQf4hpqrllsaJbKD22Z03aDkWWRtR0tPye+3gmA2K53iGogMWocoNjrxZDge8zI6d+6j3VfdotOwGR//EXSa71sbKm1SpE2kD76qk7PTxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 06:08:56 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%6]) with mapi id 15.20.8857.026; Tue, 1 Jul 2025
 06:08:55 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Phil Auld <pauld@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/sched_ext: Fix exit selftest hang on UP
Date: Tue,  1 Jul 2025 08:08:45 +0200
Message-ID: <20250701060845.134026-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::13) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: b709dc91-4dc1-4011-de99-08ddb865c2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tld3yP47G8D7Xe4M6FLpgMidG2/bjVa2VKeDfuuFs10aVOSxugWSVwsgyvEB?=
 =?us-ascii?Q?KK20Xve4zg/O3jpC5N/aMzoGHEdzxsBgnPxTQwBS1vDjzjRNQZVfM9ev4w0H?=
 =?us-ascii?Q?Q+a5gUYiO/e/Yt6YjtZ1XGO5GAh432WvVqMU+zP2gv2qvYw0o8EhWbRLW0ai?=
 =?us-ascii?Q?V/msqE8zv/QDMKwzSnKtjqP6XNRFHi8uhIlC269SVSAouhSV1t8l2pLo+M/C?=
 =?us-ascii?Q?FbO8ovTNhCr2PiY5FQLLtD6mupQXfJcd2iVMj3olePcNh7Tc27/gMPtLThKI?=
 =?us-ascii?Q?T8EmKn7NKkvtxzdo3gyF2xBsTpp+Bdn1R3cctwVhAU4uP879iejLvrw9WdUO?=
 =?us-ascii?Q?+hjRpaX6ojUyjloA/cpnCwTDhz2Rpw32068JayZgUe653sS2H+vmRR9dTr1i?=
 =?us-ascii?Q?dq39fHfr1wIJIfZIx5MOBrwSrVBmLfwA7E8wLPO++17srqsiCHunBEARorq0?=
 =?us-ascii?Q?4RsFXzn0Frep/Cjf/Xs8dkrf4nkyCcoPfL3byn7vLf+NhhllIX5EP5Q1NOZv?=
 =?us-ascii?Q?i+8upQbwfBYZu6DnJSonAdiuiK0JauqcNFKN0GzmbDSA3sUT1L3zzeQ8+ym7?=
 =?us-ascii?Q?2ZZ44mMvxgt8PRv3EIUo/C1tbWXJV6N7hYqHFl0lg2iGlk2/TvHnlcjHUba5?=
 =?us-ascii?Q?0U6WDoevf3sg3+IkgDopr+fIM1/PiqGYzLyO94YTowHN2MSYDgM3M1PNjb+E?=
 =?us-ascii?Q?V7I5vzSiiTN+WatHk0WdZkQCLwkAN+a10//g+zdsNNq2LWarTXBuHnnguAUJ?=
 =?us-ascii?Q?1GGvlwmsNwyp9fr4etChneFxPARX9la+n/QaGitLsIkQI2iHetN7qN/Ijv1R?=
 =?us-ascii?Q?MMNM7f9lVpiDbKTBsB8/WkfORzTxr0ozaKJCnrcyqnMEm2hIZl9IEtxvi9FJ?=
 =?us-ascii?Q?/PhH7gsyDYXGlQTKk/0PWZIcG4K4ajevPvif7ixQYUYtRHj0CP4UJNQTUBaH?=
 =?us-ascii?Q?VHSmT/QV5GBxHgtgidLIEpavScBbdC5D1Sl1e/vIH7336tnBTBIg3EWjsIMv?=
 =?us-ascii?Q?+/C02A51plpoVH9szlv/D7Zs+2Q6hY3UuKDqdzOBkqM7Oe0NREFgS+tY7P/W?=
 =?us-ascii?Q?7NTQ7s07hRY1RfDzBQPcJBJ/BQr8FLSfb39p0LkgWhfOk1xfMjm7guL5IlMp?=
 =?us-ascii?Q?4ZpVNis0dUqe8n0kXzzxFrg+XbGmV9+QW6zqB2pxRS3HR5pnlV658m38gD3W?=
 =?us-ascii?Q?VqmhR7icXuVoMwi94DhT6AifV0EbW/Ia0qpttIE2HU1hwmWbuTYgoQxk2L8k?=
 =?us-ascii?Q?/e0rPQBPeInSGrNNByFlSVeuavJy15DgFZehoqKv7VLPJyhwAlPHtTw7pq/f?=
 =?us-ascii?Q?23FFvqhPEkN2LBCrbIf9si040agzSwnZL+xG8ptXfXCIp48qE3Fxk7OrLqTc?=
 =?us-ascii?Q?i91Cjpu94B70tMFBLV6H4Eqlvdu1J4dd2HbZxWsvVeznx8oxaPYecKf3apcr?=
 =?us-ascii?Q?CXaCx1CwI3U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w3Ci5EZITh19Wk3mnH3CEK3jS2ya10HT8/1ig2yebCCKBVh9U4L6ZOH23tkc?=
 =?us-ascii?Q?kRf4quMkrAsRVVAL9AP1S94NzlRzxsM7qerBV/7d32eIhayo3142alG95RRt?=
 =?us-ascii?Q?7CHVryNoTELqKcXivd9fi/NkrU9e8g0DxXkOyeym3ZqV4k9GB3nzsHWiuqd9?=
 =?us-ascii?Q?8u8wwc5NNtT3u93TCRBiGI3ZwuHW5cdwmVUA4JSzhffSuEoZQQZC/FYSZtpx?=
 =?us-ascii?Q?xtmuaIYsabdXTCyECI3z4GwV5xaV7BTdxcb6jXqDnf2TRWnZbkcnRJp8bNW4?=
 =?us-ascii?Q?Yw9FerQz+eCg2YZRziwlLwgwg9PLn1RzW8Cg4AS6rvueA5e2kk2VopfLhFAI?=
 =?us-ascii?Q?9ND8Pd2govVQNYWFyNHXWjYvQYZY/DR3ho31KsQWqT66BSGDPTXHQ0JBh/An?=
 =?us-ascii?Q?nzwadf8n+DFUg83EHLUeJZUznNut19LwYFKc5xwMpbubp7Iq8kJeg3JE1j0v?=
 =?us-ascii?Q?jpx5wmBBKNW02BLBkShuUybpxY4Xvuh0WJijPPPBq7NVAWiCzm2RMO0OxpHS?=
 =?us-ascii?Q?LzXpy87i8EpP9lGGop+CB/AQyaeNC5BjkMOs7YAmeMc7uJaZNivn13hj/stp?=
 =?us-ascii?Q?T0g+rp2wXWYlWW11kXrcPRQS+lkl1E1ICQdGrUAHj8/D5ZXb1wUs0cDWReuA?=
 =?us-ascii?Q?rGtNNl6Z/uwGc28ZhX7B+6+4dPgS/6pLVHXMpV2TDVEgt7P60iw1QAKaLqZK?=
 =?us-ascii?Q?EK4ArkJylY2Oe1lcj4kZLEwElEe/AuL88CyHzdcuW8t0Ta8ey40OM89EbKFw?=
 =?us-ascii?Q?bSCkJct0Lczvav9GokHoNnr4XCeotF5l6joZdT1rTa1+yuu6XprjkMRmc20b?=
 =?us-ascii?Q?wu01a7turGSk3cB/jwxeFNFcENyZ48klfylM4JcFcZit21wlfh6G5pa14+eN?=
 =?us-ascii?Q?pygFtrzprDbiLVQl/Io8S2fqE69hRzyhBGT89eGWVNwzg11nuEqmJRe1QX3p?=
 =?us-ascii?Q?L1/hFgqw22JuSSVtZsJOOTeWyOv3fZFKesQ7uLpN6dUaENBDIw23ZW1HbTuu?=
 =?us-ascii?Q?NIMeMH1IDPub7SNYkriqmuBwo4GoZSzCLJPx5o/4LpX+60DJHUwxnQULVTYz?=
 =?us-ascii?Q?n1uL43nelcH7CDWqu0aig2/cLpQKuFQ13MV7UZluh5d1fZS/hpfTXnoHD6G/?=
 =?us-ascii?Q?uu9TOOOM+97PttZXBNmAs0oHXflLdpCjOgn8wqBNcKvEjOusC9gs8ZkItGMy?=
 =?us-ascii?Q?hYNk76FtI+WpFAPFXCcUIF7SReP0WNNGNN24ATkcwX7v5Hwu+/Mpo51SI+jA?=
 =?us-ascii?Q?d85GxDI62a2EEO5FtSkIrGq5NXPzyF4k3Nm2ssy8cl4Ro13cggSoEdoaLBk/?=
 =?us-ascii?Q?HLxGfm/hOk5xLm19bdXnbFrv7yknUu+MJ0Zw3/qJDZpfcQoeZY4rPeRKmTeK?=
 =?us-ascii?Q?sDgbvhDLXCAz/zft4N+D5a/SZv20NmrYaVHOpAHKK8Y+Wfh7K/pe9za+H8BY?=
 =?us-ascii?Q?cHvN4elDEk0X1GV3BmnyrwMiO2xxQ2b6Z2N5+eamFa9NKC+cieAf7Gi+tbxz?=
 =?us-ascii?Q?RbErS9Wc+t8BAyDmAwx/Ngn9RIOauh35XDgu1pBlM4Gwx1lWWpRE+NRhj4PY?=
 =?us-ascii?Q?5mBzyXG5NuLZJ59vaCupbHe03Pa1p9svjuSQahzD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b709dc91-4dc1-4011-de99-08ddb865c2bd
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:08:55.7074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ujn06tRG+HLGJ5G1mUUqnVHPaIobCSE8fnAWY0oGg9FeWIXw/Ve59Gx0pcqAHurgGnmWWu7oCKi7EIXpFsU3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353

On single-CPU systems, ops.select_cpu() is never called, causing the
EXIT_SELECT_CPU test case to wait indefinitely.

Avoid the stall by skipping this specific sub-test when only one CPU is
available.

Reported-by: Phil Auld <pauld@redhat.com>
Fixes: a5db7817af780 ("sched_ext: Add selftests")
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 tools/testing/selftests/sched_ext/exit.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/sched_ext/exit.c b/tools/testing/selftests/sched_ext/exit.c
index 9451782689de1..ee25824b1cbe6 100644
--- a/tools/testing/selftests/sched_ext/exit.c
+++ b/tools/testing/selftests/sched_ext/exit.c
@@ -22,6 +22,14 @@ static enum scx_test_status run(void *ctx)
 		struct bpf_link *link;
 		char buf[16];
 
+		/*
+		 * On single-CPU systems, ops.select_cpu() is never
+		 * invoked, so skip this test to avoid getting stuck
+		 * indefinitely.
+		 */
+		if (tc == EXIT_SELECT_CPU && libbpf_num_possible_cpus() == 1)
+			continue;
+
 		skel = exit__open();
 		SCX_ENUM_INIT(skel);
 		skel->rodata->exit_point = tc;
-- 
2.50.0

