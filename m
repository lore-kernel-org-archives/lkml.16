Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D36481B1
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746306816; cv=fail; b=UoldkYkcQX+nehMjcxmh1epMC4xFavZNaBg8jjs9xtxwUZxUGajhkSU/D77LR9taQWgqLm/m1VbC+fkL9z+4/KJFz5if13oH3TTZlQhOXEOayAen5OS0HqoKmb/2aMdN7UeG85Q6aKTlwmFb6062Lb6eImMhk4v4+7BsaIUqdmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746306816; c=relaxed/simple;
	bh=wMF5U9g32x9oZJ9+6UX82DTC/T93cqAb9RJ0eWAgFEM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zredoa3UUjsNZ1xqhK75EZHM7tubSQHzhZ3D+DQJdnFSfIbF4rprppSr+R688iUUJNLl0kEXX+zismHg5+3GgwW7FIkLO08D3qMfQlRBVyFYhIQEEMaR7v6NnGq47iRnItSwh/YEp9lc9tsutHLIk+qKIKWFtIkkIhNarQ/lqrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=myIehCNw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=acjzR1uA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="myIehCNw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="acjzR1uA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543Ibgun025552;
	Sat, 3 May 2025 21:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=DCrkHrGkNiryHjGn
	z/RvboD60GliDrXoPGEL+2sF/PA=; b=myIehCNwapPxS3Sz4y7IPxQC5JAATUen
	iIXN474dwBOETQS5C393IyvhGVEqhY9sMCzf5ezuViJ9txPtLr7/kPDxCoygOyCh
	L6QHv0PePGimIB0ddpIScBqksAUW4vnRAUMd7JdG/yfKpHkh6ER3FnTxEJIYz7hC
	x1VBqDYBob8oC7i+2jFlKMjOk3S/ABfv/uGeH4BMGH3AqzQ3ZAlTh2EF7xhUw3TS
	izUOxRKEAc0hlMSIKKqFAJaBJNlNPEFw3skPMkGGB+mr4vmeDrqkjMMvr1Q+Dmdb
	s+vucdVNLdZznnRiRiZNUmikphg1ErMHsG6Fp5VZY3F06/z0OSapCQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46drjw825t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543HQZus011302;
	Sat, 3 May 2025 21:12:49 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcq2h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CB8VJOV9Kv4ubLORjztOjc5YQJoO1iHP0IIU53HKQlqouO2ReeFZIA+PYzUjQGwETfJjB16YIV6GD/SC4iEcwyHo859tYuL3Dguh5TLoBgmUR5DnXhlsRfb2Cw7qNvFgMIhJaFeOHlb+Xlo+EVkzfGerWXaV6HCFblAA00ZJcBSeJdvPh/83RMv6DVeszp1m/L2sYYW0zB9ThK7jEeiJb8yw4pGs5nrYmTk2YGFt8Mlv99vw0JkXTu606NccW8t7OAch3dc48JaYK1sLDtPue/GWHYG8XWTUxZUDu/rQa7RvTOmneL/4hxYWbDeKsQ78dVR3xiA6K/FI42a/BOSLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCrkHrGkNiryHjGnz/RvboD60GliDrXoPGEL+2sF/PA=;
 b=D0NET/fIV1hSD5CfktUiL3c9UKYsw4uB9Trp/C7V1ZrZCShihQ4uVfgifF99yIuRi7w50clL73oLFLju3cKeKIYPr06Orj4I8cYNCrgGllc64TOeadkvdyeidKHFeQW61vXaAe54b/OL/uQRmCaD89t+7yojPT9BzxNesHRiSRkvYNAHyDLi075JwDAkemAU8WgDORv5Rgi3OKq754P0S08TZrVNwH1j17eCYCSDX3NU0kDl2lOrqgcyqZehgjdjRQULVrFSBmWalvOSIglLGfKdhu6gsE1G2ihW0PLF0OhyhFNZdqmknNcWYx9X/WHSODvvUpfhYby8dyOmvsjJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCrkHrGkNiryHjGnz/RvboD60GliDrXoPGEL+2sF/PA=;
 b=acjzR1uAOcOg3Vus7nbvINhMhQIq3sgbJq6tAmo8S4hnZmEWCtttssFJc7UFbJPnuFZy6RKbdjkXbwC+bgiwfZHUywRnmOtj0sbkPcW2j1j19BcWK10OeP0WrRTrxu7AFH3wsxXlAL4lG0WTPPgZW8p+tnEzDim0DbW2wnvJ1II=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:12:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:12:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 00/11] mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
Date: Sat,  3 May 2025 22:12:22 +0100
Message-ID: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0227.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: b2803174-e17f-4bd6-7fe0-08dd8a874030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t1olZf6Ffdhy5eozpLhd/D5WFs/4BmPn3+I8IgavA5zpzbE6iA4zPA6u0sFG?=
 =?us-ascii?Q?BzvXiYZErpGDlp+aWYYYVCMGUueUf0AtHmsCrcHKHr7Z5TEI/kBz72W3qQPy?=
 =?us-ascii?Q?ueU8viSJB98Qupv/A4CJpKa72XDCZSBX6J35Q/+BTyksu2nS0hbhumDIR+Iz?=
 =?us-ascii?Q?tC0E4deNSr16oBxTiptHal8/G7YNQ+cwMudT449PJYT8Y2vAvd6CDZoya7Lr?=
 =?us-ascii?Q?MAbh1q+vxK3a0OtvRQgN5HyQRj1rj+A6c/Yx5iYng/79rIiFmoSze+FgjLWW?=
 =?us-ascii?Q?mR5vLM27RndrJBnEu4PlgySVHeR9msjpe4EO0v4mY4HJ0ctQVWTjoDiB719Q?=
 =?us-ascii?Q?YF0OV+FXb3VZj6EgioGXa6ouHqnr436vladZDa1QkostA8N/NtA9h9fLteYl?=
 =?us-ascii?Q?CiyBvuRSOtnH3Kacr9w9e255UPfdyPd1rruI8DGNFh74N/6PJwZI7Covcf1e?=
 =?us-ascii?Q?XblG+Pu7Ocy/vXgixsfcD+D4xnTpNJEupR+BClIulz/hIgn/h+MU3pPmthT+?=
 =?us-ascii?Q?zUM7+k53oCQDZFgTNwao2f/dK5Y+8iswMEzuP1zlb/VIjrdZfkWtqM7jTal3?=
 =?us-ascii?Q?3by3m3/5EfKvNnjJFTmH6X+k7CqR1jqshEd9D9dyWAtT+fbkBPSl3SaMVr90?=
 =?us-ascii?Q?jc1KHvf99QoOryRpZ3bL3xHf3hZB2ScgWQRffmcVmnLvkBA6YNa0Yu3M4W2W?=
 =?us-ascii?Q?6xiKSyZRNExa+/IPFFKgkxn0aOoW4JPrLECW3B6CX6Ev+Yln3wCUoTan8wUg?=
 =?us-ascii?Q?EZPAL0pGkcJ8u27CJ802crtIi6c3jJ7Rsfk8hyGHi/TE2IVXjGl+1j+4JM7o?=
 =?us-ascii?Q?PnTHce22PfE0qvMKHZqGnapLjFgKZKu3QkqjUYpbn9ZJBM1Mw6qADd/LBrLn?=
 =?us-ascii?Q?SHtCgCdCTheJSIiZV/NpojylVLSU9KxDxlyyWQSp8JatvHqusn5rx08MvBpf?=
 =?us-ascii?Q?8n539sc2hxM0MntYOSmXpu63kEinC6q3uRVYh9dn7NK1XvYBW799zeodsnl8?=
 =?us-ascii?Q?onUGDkqlEhmC+F+IwfssCvzyS7Ocjte3yyngZZcwfJ1iLIjd2TW9zDi2/uwQ?=
 =?us-ascii?Q?RVVMT/jX/OL7yNodcF+QMBItUBlk5gYGR40XG08sCPceCwb6MuxARP6eIiuI?=
 =?us-ascii?Q?wH7qIc1Fz1vQTtB1iD1IG/DqXj3z1efel4KIVdfBfJLDipjpXxF2ido4g6Sv?=
 =?us-ascii?Q?CtrAJoquTJTj91XTRd2vQ8/aOkIv16gBCPW5Xf0T03Rg50m1Mxpzb2RIOY1h?=
 =?us-ascii?Q?FuA+hNaMZ8HzC4gH6mYsYlVYzHRNE0GHnfhcNOhvKJ8E5XYXPq1ps1gSPtDU?=
 =?us-ascii?Q?gGqFV8UUPl7sJVhw2VNZDR0+I4HK4MBz5gPHk7Rp2XjrdSmgFjpjpWC/yQtH?=
 =?us-ascii?Q?qBd2LTxinHGwwNTC8VygTu4peISNkvdaX6XsOiobeLZyLIA1C+fG33qgn/WV?=
 =?us-ascii?Q?SZFCgan7WP8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?77v6tWtpdqWbTmAGGN1v3UX24aBZUb+MaQdvU5D2T/o9bT+M3qTQ0q7qFSLc?=
 =?us-ascii?Q?YJdWIG8u3LfHBnQpRrPO7bRGQKei4NIFzmruAhTBqvjITm/E9ahEPzYMUjbI?=
 =?us-ascii?Q?PhKALZL3NrczsiminTbdrNowQbzW461HtEK4XIwe3DoNarP4f207dJ/KRAYS?=
 =?us-ascii?Q?hwnDzKhOe/DKmfj9Xn6h2VxDapgN6zPY7RlnpZqK3XKX5dDnBTYgZsENWeLB?=
 =?us-ascii?Q?wJCF2PegCdbj7vpfRDjrO9/5x14J94Cm9ZuUpUmuuIqdXSAbEogor4WetpfE?=
 =?us-ascii?Q?6tnMZfaRu6cmjCPQnR7ntovCP0U+KgWx8vzIC4TYDIJuPEXT29f888rKbvjd?=
 =?us-ascii?Q?XlY1aGtM6mUlBWcln2/YUTroXUrAg4GljIaYSEtQsT61FFHi+sC5oO6dF2Hb?=
 =?us-ascii?Q?xFN0UHFkjAoqDrrVzEqPvHaF6VoDYI6FeWOmxjq46xsix1Dh/PbA1hgJmh27?=
 =?us-ascii?Q?XDQ/Yc0BGsDZjybq4Rujlgr+ebG5eroJmhooxA6gw4oYX9RUJGiV84wmXMgF?=
 =?us-ascii?Q?3T6rzfUzPSP47gPXWPjkAIYW/3DHsC99eEONZEWb9RAJaiD1VamZxasQV0+5?=
 =?us-ascii?Q?nUs2PnTKCLolJZuIw4MbrpKv64EBoWIYOGecy+y+1PFVfBluGsOQi+eAssYp?=
 =?us-ascii?Q?wVOgAFr9svq/s33jpaAzegHqbe3HfdyfzfrBentPIeTNhzrPI/PnS+AS+u8N?=
 =?us-ascii?Q?m/SgzWJ/6xtLV7ldFLnXMb95i15RTD4SoTklVTiZd09/Tp7RnvUbdvSrhKsI?=
 =?us-ascii?Q?M2SuUHx9tkIavGD4kVeAHsNaL5zmoWQNDi3z/SCQyMszAStFd2K5qIvHhbNj?=
 =?us-ascii?Q?cPX//TCdAqKplmL4SNZli/miKFre5ERKKGI+Nssn72QIVUZOl648zrFVxT3h?=
 =?us-ascii?Q?+LexHqCf88OzKgFga9ZA6kmNtMPWPl36igUyllJynQBFMjDqLKarCrfhva2W?=
 =?us-ascii?Q?9pKYNQzK/Ku2qun9k29j/Fv+qjHX0onkPEFQTAz6pSutu5ngQWs0Re+B9Ld9?=
 =?us-ascii?Q?E8BxPvg2JxtrAU95iJDs4FjzPxVJw+Jdm3Ol43O1fGI4qiYaZLOyrBXxgjZF?=
 =?us-ascii?Q?J3QbRFXbDicSC50HPsubnO94Kuw6oySXBAj8sm/EQT6qePse2KxWCxqutWVr?=
 =?us-ascii?Q?OJIfXZbzK20mYPfiMEv2CBe/y5oPDRGpUpIfPrTvjzLvaYDGB3IokrT3Ltha?=
 =?us-ascii?Q?0CQzQ6+jhC7luWZ9n0K/fabweylV7TDC7mWs3X1rUP5M33lh6E+H8COyzymW?=
 =?us-ascii?Q?w+V0rCv2gHbgR3nhYmglJVbq8wWZBD8as/nyWfkBH2m2fvsVGMeleZo/hiBG?=
 =?us-ascii?Q?mxopzZM/ICX8thCx+DwLeBUiUrpfxteZXPENR2Z28zI45RlRJiVgLgRmzSUg?=
 =?us-ascii?Q?aXg1h0jNugDH11ickafriyv+LYPz1s6rbEUr8m4875C6EtJGtgjA/zir9DuA?=
 =?us-ascii?Q?2JLOMS8fy6cKRaSS8D7v25mlVqwzqW+56JH+fA1EoAf/hySpvevpUNsooJxN?=
 =?us-ascii?Q?bIuG7eEaq6lMyRcuGbmbQbUmBi5ti2oOyArnIoAsRLTvolkOU9qCLRLqiG10?=
 =?us-ascii?Q?MvvDl19McYFYG/tLgITzqrRk5uhA2pO9f7/zeiTTfD31rPHNsB489HYefcIh?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8kezRHXUimwlfHnQ+UZpNFTKXQtAlxSE+GaJXMXB+hL6/BYeQeY10SSUJmWuRZx2ksMKZYpIkEf6tImXi/FJfGPOXp1hAmcV11Rk7xRPRi+WyoZGR+P8Kbs6EwnccLEqN3kovTqVASknFH/T2GhEmeuGWGT7dP8xpv2glXZT9Hoq/Y3WogdFA7zAzNDFffSNjEIDwaOVFESAGKcD2n6EH2kpIUD/R1pxPoh4Qoei9wkVPcYYGrSWKoDFETeWqcpSYRLFL4hbddKEtkqOCebTm3+5FVMtMXj+h8w0XJLEZMUzWHYMfbiSnxbZLCK3Vfj871negOl3tkQWdrw9CetMe3Bg4KaGm+LnYg4JLgetM0R7GYSGUSUrhnrIjjkz7vHYzzSLRxaoxoiTxg/2cxIqbBdJMlklolSkIAUC6xBf8xmEc82Bx5suFHB/s6EAcYAuSvrhk2pWE3xPw0KTjl81RHYvih0La+skCpbhiJqwZtdIP5sxVygqjXD6/MwAL1pH/6XB28UqOzRPrS9PaRAJe47O0uYejTir1rQY0nx5H1QDK03mjwt/X21PVSlp5zSDnxbT9NnalUu3AkKjWX5ge7rQ7lATesfRowfUoOHmIRY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2803174-e17f-4bd6-7fe0-08dd8a874030
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:12:46.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRDwBODkm8uzA4jS0GD8JuoTA2pWjf9VbnaArSw0r44E7ftOnjQ6BjvzwVpXsiblIfRxpToKCT4FPsfJqLieu+w6C/EvMwl4PZ14Z4ch+AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030196
X-Proofpoint-ORIG-GUID: jNs1neJUhU8kBfdDs7HzdM7kjMfUJI75
X-Authority-Analysis: v=2.4 cv=F5lXdrhN c=1 sm=1 tr=0 ts=681686d1 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=uwbSGSRiVLllLH1Rpe0A:9 cc=ntf awl=host:14638
X-Proofpoint-GUID: jNs1neJUhU8kBfdDs7HzdM7kjMfUJI75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5NyBTYWx0ZWRfX7JNwbXZbZKEI U/OVpMYhoX0SB0N+Y0dhCfGReQCdEsGV9YM1G1s7HAYogvsTgygdwgssVp8/lA8avHO3ksbgSLA CmUUZlWJ6HPmF36GehrnIYZFztsQsazH9a28lcUEnu3jTpSm02gMpN2xF4W2QDEXVrVWSrhBae0
 WjKFDM+i720zZ6opEQjlMYnAu8zvnoOUVm9Tgn1wmqAOnZ1UZOXRD9gclYYze+zni2zxD0JidaA D/5GmYbsQoW5pGsoYNhVS++b/HnvkV6hcsMFJ8GUborFtboIg9cSav0MI+eaFkMh1FDJb7xHVf4 yhfmdglQayxy8Hx4c8tzUOnvuM3xVF72BVCujn/97koKP5/kLV7Ul+3ogi4uFeXzFUCZWlNjul2
 wnxeuntvUo+zS/hlc1u4zPzdLwLzH7nEXSfTMwJJw53eT3pZ+fiStHwKg9ITOVst/gt7uwGg

A long standing issue with VMA merging of anonymous VMAs is the requirement
to maintain both vma->vm_pgoff and anon_vma compatibility between merge
candidates.

For anonymous mappings, vma->vm_pgoff (and consequently, folio->index)
refer to virtual page offsets, that is, va >> PAGE_SHIFT.

However upon mremap() of an anonymous mapping that has been faulted (that
is, where vma->anon_vma != NULL), we would then need to walk page tables to
be able to access let alone manipulate folio->index, mapping fields to
permit an update of this virtual page offset.

Therefore in these instances, we do not do so, instead retaining the
virtual page offset the VMA was first faulted in at as it's vma->vm_pgoff
field, and of course consequently folio->index.

On each occasion we use linear_page_index() to determine the appropriate
offset, cleverly offset the vma->vm_pgoff field by the difference between
the virtual address and actual VMA start.

Doing so in effect fragments the virtual address space, meaning that we are
no longer able to merge these VMAs with adjacent ones that could, at least
theoretically, be merged.

This also creates a difference in behaviour, often surprising to users,
between mappings which are faulted and those which are not - as for the
latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.

This is problematic firstly because this proliferates kernel allocations
that are pure memory pressure - unreclaimable and unmovable -
i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.

Secondly, mremap() exhibits an implicit uAPI in that it does not permit
remaps which span multiple VMAs (though it does permit remaps that
constitute a part of a single VMA).

This means that a user must concern themselves with whether merges succeed
or not should they wish to use mremap() in such a way which causes multiple
mremap() calls to be performed upon mappings.

This series provides users with an option to accept the overhead of
actually updating the VMA and underlying folios via the
MREMAP_RELOCATE_ANON flag.

If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
the mremap() succeeding, then no attempt is made at relocation of folios as
this is not required.

Even if no merge is possible upon moving of the region, vma->vm_pgoff and
folio->index fields are appropriately updated in order that subsequent
mremap() or mprotect() calls will succeed in merging.

This flag falls back to the ordinary means of mremap() should the operation
not be feasible. It also transparently undoes the operation, carefully
holding rmap locks such that no racing rmap operation encounters incorrect
or missing VMAs.

In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
user needs to know whether or not the operation succeeded - this flag is
identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
the mremap() fails with -EFAULT.

Note that no-op mremap() operations (such as an unpopulated range, or a
merge that would trivially succeed already) will succeed under
MREMAP_MUST_RELOCATE_ANON.

mremap() already walks page tables, so it isn't an order of magntitude
increase in workload, but constitutes the need to walk to page table leaf
level and manipulate folios.

The operations all succeed under THP and in general are compatible with
underlying large folios of any size. In fact, the larger the folio, the
more efficient the operation is.

Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
on the same order of magnitude of ordinary mremap() operations, with both
exhibiting time to the proportion of the mapping which is populated.

Of course, mremap() operations that are entirely aligned are significantly
faster as they need only move a VMA and a smaller number of higher order
page tables, but this is unavoidable.

Previous efforts in this area
=============================

An approach addressing this issue was previously suggested by Jakub Matena
in a series posted a few years ago in [0] (and discussed in a masters
thesis).

However this was a more general effort which attempted to always make
anonymous mappings more mergeable, and therefore was not quite ready for
the upstream limelight. In addition, large folio work which has occurred
since requires us to carefully consider and account for this.

This series is more conservative and targeted (one must specific a flag to
get this behaviour) and additionally goes to great efforts to handle large
folios and account all of the nitty gritty locking concerns that might
arise in current kernel code.

Thanks goes out to Jakub for his efforts however, and hopefully this effort
to take a slightly different approach to the same problem is pleasing to
him regardless :)

[0]:https://lore.kernel.org/all/20220311174602.288010-1-matenajakub@gmail.com/

Use-cases
=========

* ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
  upon which makes use of extensive mremap() operations to perform
  defragmentation of objects, taking advantage of the plentiful available
  virtual address space in a 64-bit system.

  In instances where one VMA is faulted in and another not, merging is not
  possible, which leads to significant, unreclaimable, kernel metadata
  overhead and contention on the vm.max_map_count limit.

  This series eliminates the issue entirely.
* It was indicated that Android similarly moves memory around and
  encounters the very same issues as ZGC.
* SUSE indicate they have encountered similar issues as pertains to an
  internal client.

Past approaches
===============

In discussions at LSF/MM/BPF It was suggested that we could make this an
madvise() operation, however at this point it will be too late to correctly
perform the merge, requiring an unmap/remap which would be egregious.

It was further suggested that we simply defer the operation to the point at
which an mremap() is attempted on multiple immediately adjacent VMAs (that
is - to allow VMA fragmentation up until the point where it might cause
perceptible issues with uAPI).

This is problematic in that in the first instance - you accrue
fragmentation, and only if you were to try to move the fragmented objects
again would you resolve it.

Additionally you would not be able to handle the mprotect() case, and you'd
have the same issue as the madvise() approach in that you'd need to
essentially re-map each VMA.

Additionally it would become non-trivial to correctly merge the VMAs - if
there were more than 3, we would need to invent a new merging mechanism
specifically for this, hold locks carefully over each to avoid them
disappearing from beneath us and introduce a great deal of non-optional
complexity.

While imperfect, the mremap flag approach seems the least invasive most
workable solution (until further rework of the anon_vma mechanism can be
achieved!)

Testing
=======

* Significantly expanded self-tests, all of which are passing.
* Explicit testing of forked cases including anon_vma reuse, all passing
  correctly.
* Ran all self tests with MREMAP_RELOCATE_ANON forced on for all anonymous
  mremap()'s.
* Ran heavy workloads with MREMAP_RELOCATE_ANON forced on on real hardware
  (kernel compilation, etc.)
* Ran stress-ng --mremap 32 for an hour with MREMAP_RELOCATE_ANON forced on
  on real hardware.

Series History
==============

RFC v3:
* Rebased on and fixed conflicts against mm-new.
* Removed invalid use of folio_test_large_maybe_mapped_shared() in
  __relocate_large_folio() - this has since been removed and inlined (see
  [0]) anyway but we should be using folio_maybe_mapped_shared() here at
  any rate.
* Moved unnecessary folio large, ksm checks in __relocate_large_folio() to
  relocate_large_folio() - we already check this in relocate_anon_pte() so
  this is duplicated in that case.
* Added new tests explicitly checking that MREMAP_MUST_RELOCATE_ANON fails
  for forked processes, both forked children with parents as indicated by
  avc, and forked parents with children.
* Added anon_vma_assert_locked() helper.
* Removed vma_had_uncowed_children() as it was incorrectly implemented (it
  didn't account for grandchildren and descendents being not being
  self-parented), and replaced with a general
  vma_maybe_has_shared_anon_folios() function which checks both parent and
  child VMAs. Wei raised a concern in this area, this helps clarify and
  correct.
* Converted anon_vma vs. mmap lock check in
  vma_maybe_has_shared_anon_folios() to be more sensible and to assume the
  caller hold sufficient locks (checked with assert).
* Added additional recipients based on recent MAINTAINERS changes.
* Added missing reference to Jakub's efforts in this area a few years ago
  to cover letter. Thanks Jakub!

RFC v2:
* Added folio_mapcount() check on relocate anon to assert exclusively
  mapped as per Jann.
* Added check for anon_vma->num_children > nr_pages in
  should_relocate_anon() as per Jann.
* Separated out vma_had_uncowed_parents() into shared helper function and
  added vma_had_uncowed_children() to implement the above.
* Add comment clarifying why we do not require an rmap lock on the old VMA
  due to fork requiring an mmap write lock which we hold.
* Corrected error path on __anon_vma_prepare() in copy_vma() as per Jann.
* Checked for folio pinning and abort if in place. We do so, because this
  implies the folio is being used by the kernel for a time longer than the
  time over which an mmap lock is held (which will not be held at the time
  of us manipulating the folio, as we hold the mmap write lock). We are
  manipulating mapping, index fields and being conservative (additionally
  mirroring what UFFDIO_MOVE does), we cannot assume that whoever holds the
  pin isn't somehow relying on these not being manipulated. As per David.
* Propagated mapcount, maybe DMA pinned checks to large folio logic.
* Added folio splitting - on second thoughts, it would be a bit silly to
  simply disallow the request because of large folio misalignment, work
  around this by splitting the folio in this instance.
* Added very careful handling around rmap lock, making use of
  folio_anon_vma(), to ensure we do not deadlock on anon_vma.
* Prefer vm_normal_folio() to vm_normal_page() & page_folio().
* Introduced has_shared_anon_vma() to de-duplicate shared anon_vma check.
* Provided sys_mremap() helper in vm_util.[ch] to be shared among test
  callers and de-duplicate. This must be a raw system call, as glibc will
  otherwise filter the flags.
* Expanded the mm CoW self-tests to explicitly test with
  MREMAP_RELOCATE_ANON for partial THP pages. This is useful as it
  exercises split_folio() code paths explicitly. Additionally some cases
  cannot succeed, so we also exercise undo paths.
* Added explicit lockdep handling to teach it that we are handling two
  distinct anon_vma locks so it doesn't spuriously report a deadlock.
* Updated anon_vma deadlock checks to check anon_vma->root. Shouldn't
  strictly be necessary as we explicitly limit ourselves to unforked
  anon_vma's, but it is more correct to do so, as this is where the lock is
  located.
* Expanded the split_huge_page_test.c test to also test using the
  MREMAP_RELOCATE_ANON flag, this is useful as it exercises the undo path.
https://lore.kernel.org/all/cover.1745307301.git.lorenzo.stoakes@oracle.com/

RFC v1:
https://lore.kernel.org/all/cover.1742478846.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (11):
  mm/mremap: introduce more mergeable mremap via MREMAP_RELOCATE_ANON
  mm/mremap: add MREMAP_MUST_RELOCATE_ANON
  mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
  tools UAPI: Update copy of linux/mman.h from the kernel sources
  tools/testing/selftests: add sys_mremap() helper to vm_util.h
  tools/testing/selftests: add mremap() cases that merge normally
  tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
  tools/testing/selftests: expand mremap() tests for
    MREMAP_RELOCATE_ANON
  tools/testing/selftests: have CoW self test use MREMAP_RELOCATE_ANON
  tools/testing/selftests: test relocate anon in split huge page test
  tools/testing/selftests: add MREMAP_RELOCATE_ANON fork tests

 include/linux/rmap.h                          |    4 +
 include/uapi/linux/mman.h                     |    8 +-
 mm/internal.h                                 |    1 +
 mm/mremap.c                                   |  719 ++++++-
 mm/vma.c                                      |   77 +-
 mm/vma.h                                      |   36 +-
 tools/include/uapi/linux/mman.h               |    8 +-
 tools/testing/selftests/mm/cow.c              |   23 +-
 tools/testing/selftests/mm/merge.c            | 1690 ++++++++++++++++-
 tools/testing/selftests/mm/mremap_test.c      |  262 ++-
 .../selftests/mm/split_huge_page_test.c       |   25 +-
 tools/testing/selftests/mm/vm_util.c          |    8 +
 tools/testing/selftests/mm/vm_util.h          |    3 +
 tools/testing/vma/vma.c                       |    5 +-
 tools/testing/vma/vma_internal.h              |   38 +
 15 files changed, 2732 insertions(+), 175 deletions(-)

--
2.49.0
