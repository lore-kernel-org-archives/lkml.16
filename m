Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2994C9F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190085; cv=fail; b=dQYm/VFF+70a89FIuPKVwnVurzUyKGR1yZVUB+NXr+l9oa4p/B3T8lE/XhfNidMaNXP6NsN4F7aiatDN9Cf/5usDeFi7kPi5+fPdV0Mfdy4X72mnASCoi8RbFj9n5dGfEDfiUTar5Pd/uaHHmrA1DtnD8BSjWn2XKHFMPRBKOOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190085; c=relaxed/simple;
	bh=QK/GiNzOQYk3RDftDbyLP/9vA9DbjFvjHMRbvJAAL8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cdtjkuN5KVAk8w3o+5A7tST63EAeJGFxTas0ltrdus7VYDwKvP5NqPjCWJznORV/WJVwMqITWPQLKnmCk0N6pio6aTaG0e9X949oqGU6sMF1fRL2u4SChQqQlzOKlAC5deQHURAFcDXqESz510V3OZY9QZQWnvPb0Jz8TwznYWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f0I3lhE6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wkkc+ttq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f0I3lhE6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wkkc+ttq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E0fvGj008016;
	Wed, 14 May 2025 02:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JtqkVf+CQrrfnJ/iqD
	vgbqnG7F04cVqwnh4iL9YBFMo=; b=f0I3lhE6zWJ9Ty93GbiDpsoHVXpOthR5Bq
	jod4My4nuBgWEtcU6ZOsQR3+CapT8aiEMzwdprHVN88/VIwscCnnVoXKsEXiXTax
	Up7OGec9everlmwl5t9Gtozke+tl/UoZOtcj9Nnt6k2wVpPS2xp23ARIzqejM99v
	/4WlLCN+M6wVnhtpfwojVfsk29NzzdHUzI9Ry+4UU7Xw1YFqUgfHGMsKgIXvLYLZ
	xECr+ym4zCQofQ0xouQYs9FWIMfGsGHLWPxJsXrT0RDu9KAOah2RnyTSCg0g6uoT
	MZ68gVLmJDdEXN9HPJm/3SKb9dysl7z+czvAME3OETep2rFRL4fg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcrgmd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 02:34:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1PaZI026687;
	Wed, 14 May 2025 02:34:28 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012037.outbound.protection.outlook.com [40.93.6.37])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt7cmeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 02:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GykLePncVYIoyUtMy19oOJyBezLuzxrsdLw7X3+56SzkLpm24BCGk7XoKw6cmsRUyoqFaELRJkwFTCK0WK7g/czqUNUKjDDAVNncK1e80Mxax029G5PZevE1FH2z74htAwTrBRfYEfaRU1wGhQYQMyvcjJTUluLOmcQDCFYL6k0OYtrqXqCzEhyuDw5uq+qnK0ammasLhTzdAex6JZrY6Qu0Ndga4I3GdeAkeBMcw/AApG2C8AS16Am6dp1oH7Z9V3MHEvvRojew0qy92pSWkRLLDlOoZXcynUbwFDoyoLGTZ9JG+KyV+cadXM8GF6bxcve+mHqKBWp6Hy4x7tKvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtqkVf+CQrrfnJ/iqDvgbqnG7F04cVqwnh4iL9YBFMo=;
 b=TdcHYz5J2cNQf5doNBAxYM/sE2JuWRJv/ziTxy2msNyohA0QuqFummt/1wSvVlmj9ESO+pq3Ka3/yK5GVyqge1ZOllsrG9X08f1zT63hSUV3BtQUbLioO/RfvXArUuzWPAxt4/eiaoYe7i61rKq/jo86viyoPcvZzQUmk1O8FRzKcrek7clnjKevgpZinOnjGc103RsJ7PHA6NHAz0v/fh5vTyUsDC2c6Dvf4NwUCBJ5OFH3+A4ua+LNn+lyVcEoIWDoByqM7/pP+Wxk8Rcdgxs/NOviHcTqqt8BcQR/RmdhorEYYJnCM4g6mllAyppjLRkKfpmw+pfBIJn/xvaqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtqkVf+CQrrfnJ/iqDvgbqnG7F04cVqwnh4iL9YBFMo=;
 b=Wkkc+ttqDhhhYeagVq4z60/iB55NK9ka4hkvMWG+9zS7IRAVNXj/a5H3JzFIRuRcwBRBuuLSAFS9uh2Octr6QaJQnwYmAMCgqJ4mrSMytC+mQiddKzEcfALZyGfdnr+wXX7zhdh+Gz2aMO+tcisGTuP1taA9aMFeWoM3HL5QmP0=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BN0PR10MB4840.namprd10.prod.outlook.com (2603:10b6:408:12b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 02:34:20 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:34:20 +0000
Date: Wed, 14 May 2025 11:34:12 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        byungchul@sk.com, byungchul.park@sk.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <aCQBJEDWBhFsc7O-@harry>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: SE2P216CA0110.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BN0PR10MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e0f888-77e4-432c-01f3-08dd928fd48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XoSyN+vhnoXbNnoXs0kuYuvtzeoHVUGhEU/ojN17K8NFfh/pByqGvjquJLF+?=
 =?us-ascii?Q?SGAuCLSN8B+SA9B68qispYSwt1wa5EpqpIh8FFFzfgeQK5bEuBCSxzuAh1/2?=
 =?us-ascii?Q?u8Vy/6p5A7C1w4qVhtQC/wtDdhbZQ7Gd9A7Dz7WT9cK/hGEQxaoVI7VFNy0q?=
 =?us-ascii?Q?g8uH55gUnh0/Weju+tWzpR8da3ExSNs1piJ+5YT+Q+pC5sT0/WW3ykDSYo45?=
 =?us-ascii?Q?5JW1wdodkzwBJ8isoIaqhRgOIKvbmYM6oA2PMMERZX79JzX2CiDh4v4nzjcy?=
 =?us-ascii?Q?7vioDEPNxqrn0XAZ7qy5QffBLevNmavtq4GcZSOpCKFjGCcix1q1XNCjTzyY?=
 =?us-ascii?Q?AFmbQerOfUiRu94ZXIhXLED/1frIoU0sLkL4Ae9MrPX9gekoYgX6EV7K52Jh?=
 =?us-ascii?Q?7tCS/EZuSXwhL5zvdnYXLJYWVxXotAPBYhckE5J6Lw/OpCn8GcqpJj3sNlZE?=
 =?us-ascii?Q?YdNHAhis1tzH216zMCv80BIQ1jgmSu5wXSpgXZHrkmbbp9BRAKrtItCkwNpM?=
 =?us-ascii?Q?+yf71ohk4EgZyGE96oWxZqlsjaxpFM49xW99lpV5J2K36ms1ustYGBzvjyJM?=
 =?us-ascii?Q?gPKPtjCrNkbsBuGd5sLbcTXHJTZaDWwp4YYBHuRwte/MIk0jYjA2OJhqpPTX?=
 =?us-ascii?Q?fP6hk5XZwGNw+gR0nlCFq5i53EtVFj0izLbwP0rteDBDSnmzoYX8ORIXVDv9?=
 =?us-ascii?Q?PqYEfAQCp+gI3DmRyLFwLB/ekYngbfy8ohGAxidmskKnnu2OLfaYtxYf6jr0?=
 =?us-ascii?Q?Xo0cdtytPIYl5ouB4KDJhHkmPbBxt2wv+BOi4suryU7jgxtAcnqWVpL4AhnA?=
 =?us-ascii?Q?vtRWm9IkC9Urejwh5VdckUrrwvAxbBUdoQjQAN04NdfP8FoqnWTNb1ggJc5u?=
 =?us-ascii?Q?q8+XH3uTrO48puh96v8p78Q3IaoMVUTfX9NPPKHnweexnWgMxVLzJS3n3J2x?=
 =?us-ascii?Q?QWFKEqYllfcd/NZdorPaVMRJjN79+1hkqf+MDKvC7sM1DDV/F7KCnO0MuJDg?=
 =?us-ascii?Q?EhlQ22L+ikFd4XMKFPKsL5W4qt46YUfMwBB1B0gpwrbU5wvh+lz03APoNOhY?=
 =?us-ascii?Q?7QnMf/96j9aUfkLtY/pyiKoD/m8EJjsZUYv+Ad3o6eE3I/68Q3k/lbvXAEyn?=
 =?us-ascii?Q?pZU9mL9BSEhsQlogHLy5+q5032kqjJ1Cel7EbDLQrwKq1XjH/TykdA0sFHzI?=
 =?us-ascii?Q?bp07OAiicN6G0D5NH8Z2aLuDjjaO0F/teJxVP8vKON55aQ9DLqjAoMQjOsVr?=
 =?us-ascii?Q?PepnSyv5MLf2FUyhd8h9cFILEQKFzy1cVUJ73dvXrqtVPvjjrhLkXOv9Evkk?=
 =?us-ascii?Q?+DygvGq5WdoJ9vQOl0W6dMcQ20DlKaeG7zNYX3vckSCf1sY46yeh0kGylXeL?=
 =?us-ascii?Q?yEimhlE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HFaOfgesvwENG2Tn7Q7ZnJv9hqQ/93HxV7S8C//hNILZhMlFVSGut5MlUXOx?=
 =?us-ascii?Q?u9X8kQwKcqcD2yFdB4zrx6NNlhThAqxHVqNFgzcyvCDu7e1x/D+XACq59dIR?=
 =?us-ascii?Q?v0AD9WGXe2gVGn6eoa4d75xVc99KFueijTwclRWxZUUeUqYKGKrzNWSUe2KK?=
 =?us-ascii?Q?Cmf43qImXz7x361y+x1M1qRkBFBjA0rTj8qn5NjYwU1rJCfb0OwF/5pDWRo8?=
 =?us-ascii?Q?8p6alz30Z37zoL3IR2P7DIKYhDE2DOXanFiNftnHa86Dv6BjMVs3v4BCZDrf?=
 =?us-ascii?Q?3S0bOhCMRlcaACxe3GXNfolZT6TgQq+pXjkko0iwVXC1PIS05gWWemJqzQKv?=
 =?us-ascii?Q?ue5xmldjZuI0ySeoFotAEcH9EWLcleOPqOjVdU9bgcIX6SxaZjfm6VOgFvAm?=
 =?us-ascii?Q?EX400Imfk6YQTPmVWSAKmIutOCAaWjz0yu+VKaf8MG0D1hvo4mR2g+N1a0hG?=
 =?us-ascii?Q?1vEBxuIZDGdGyI7G9lLWIkaMFMJDxL6uL4JasBiy0R2k3fk7NXJkcPIwW4B+?=
 =?us-ascii?Q?8gRqYP2LgDiHyZmezX55GQ/xGiBD0jH1IOQ4zWHQy7DAnTEGGHuMMs6wtMQi?=
 =?us-ascii?Q?q5RMC5VbjCIgnj585xzksbONLdO2Kag36L3wv9fKTaLp1S2QT+lEoMbfrCgr?=
 =?us-ascii?Q?dCTLVE32Ht964Xk5qHUCyYp4WcQtwFA86scVrKfNbwbFe8+sGfZX19vSTEK1?=
 =?us-ascii?Q?NLHuj79sI/TDYo1P9latKyHx9PtTNJckxzb2S81nsfYrr5tJEimy4VqTUkqI?=
 =?us-ascii?Q?XUfZp71uiI7Ruz/n2dZOSSRGX3rKzUjyAtbbUxhgHwjSXboPbTX/9YJodXxD?=
 =?us-ascii?Q?ymjQejChOxJiozs/WGYFKVspcsiOa3hUNrrvTViEmGgNb5P8wzZx2PNh3ONt?=
 =?us-ascii?Q?RfyPulOmgniXEI5M3ZOf7Flxvo7v06/9icu8Gx1dnjYJYFlqW5y3njuK0H5F?=
 =?us-ascii?Q?TxpGrv+W5HQBVGbKSPQ1fiKaR9+PFO1J34KCTHsVVe0zp2FcM8ElIaVWsAaC?=
 =?us-ascii?Q?FBIEhrwWvVfQOpxhjbwOjTz+2jz5BTFLRz76zRVpuhlyYE9I1HK8hMmkloQR?=
 =?us-ascii?Q?hycvQI8j/ig7CmlPSmzZJkcKMhu4npOfJg32T+klIX4SzXyuonHqyzKda5qA?=
 =?us-ascii?Q?23Dgv04SrkfIlx0jdZBXSJc5bgKK527u5L7ezyVrcuLfWYnFFIQXJhtkjzj4?=
 =?us-ascii?Q?sY8rFVAMaCWfO01xuFL3ENyNqXBm7K4Xe1lxnybOMxx6AtL/ZUh1gbCZFl4A?=
 =?us-ascii?Q?wT393cUDz1DWUVFcYcdvU15LNfyCVngsQdcoFgsUS81d4Z2R26t1jDV55NsQ?=
 =?us-ascii?Q?t2Shd1pUmKsGrT3yVjrKJTR+LlanzeC/vzr27PZQlcBadaYi0vJzDAF+ZvY7?=
 =?us-ascii?Q?s9GCVpdgNodne71/7IWyFnYJn+uGaLrhwemYnTV8woVin+xXhUqc8Dy+QeB7?=
 =?us-ascii?Q?BlZ8JI5F773iFIYn5ZfbPfsCnIQxrqV03FFR3GY7NEiU8mwpRrCth/gufzqV?=
 =?us-ascii?Q?Js0NkNcHOEO9Xp9TSoWJfSgRFd2hzr2ZNNcjCuF3akU+nJS1RqG49LWZFtL4?=
 =?us-ascii?Q?fps8pbBePFY6TD0py5odNKmxvdajR5j0PAXdxDsF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LCJdZxm9R6wlaPfxBMD3QNFE6mYjLhJSjZ6rl5V41zCKyQwC7UGHZHAhgM8Ms9EdVIeJfq6zlgKKS7lCEaG7mxBwwvvLxwOhaYGChW8KrxobOMft7G4soWLQf6WdjfFBCFhQUBcj6/+H8zFkuOThig2pCX706HlI0ONdORCkznzXd54jPoXzrldFuZl6SbO3TouXycP/SVDGfBAWOufcWlPyir9fcgY3fUoYAfQvarc6nz2/KuMbL9rtL1zObS/UKsYl7fL4F7NBsCQhAfRlkG0gK4f2gnB/pA8bxAVT2fIDJPhsAN+OWJ/Xg/NHvvkKE9XuTKsgBzZ4+1PvsdxxxCLiGL5XDeKHc8afMuqZksuvWsa+b/MaMJNMxrT7jHlI3ZFmpB4rc+irndNC9NlFPTdtuYANL6Fju/EsR+OWhifMg6c8oCX6Wy5g7g0iKcDlQc3iUGREk8PPYZB1zXGw9otbglaXBU7e/MwXYF8qujHX/zGXrCskPCeKOcyhV5ij8iUoorQzzc3UqoY6K47gn+hD/zlXjDSjDI+u2FFO+PvoljpsVaWq7e53TSRv/f3Pc4EJXih6bRFcbD5DPsIhOB9YFJhj3AATd3V5n6zh3xE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e0f888-77e4-432c-01f3-08dd928fd48b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 02:34:20.2261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bPtJy2/im/rKUPBcDG/aCZOrxYV9ToUHp0kMUMIFRe3zOhbNfL9cmxx/2H87WK5HUS5iWleJamIqxAXI8+z8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4840
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505140020
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyMCBTYWx0ZWRfXzrKoayKm8YVI yVjy207yljukYZ0MtXeqGqmBkQFLBsQEN+O4A2j41IA6dBArvPMh4AsysAyUlW2vnLS/zPmgKYS m3De1hkscB7dTvJ16eZ77pTM/Q/jiAJhdZJVrbkEtLwyWrp6cCxQgI2DcLYNOcctZ6aXi5BhTOu
 ncxW0CS+2k3Xq0/cIAVZCcQImbLSsNba8weING6OxhJAk3jYJLvVt6evTTNAM2FvsqwP9QwP6oO 9heL8F3oHSMfx6qGWh16iwRJsKRvSgbnrmHnBGXesZna4bc6snYkfRKI1XQcjebHwRhTMibG4r2 qRsM5dNEeWjn4AgLOtIJJKn0xazDJYbXq5aaXkCn6eKLK/8I0p8hvKEKtv5Pw9A23RNUQjsSSpp
 y4BjjhAQZ3YnyIStMA7zUwjqJ3tQH5jVmXGpsAkSRm9Yg2FDqPU+a4vXeX1XHRB8HKdDUQDX
X-Proofpoint-GUID: oPsZ-rdocBmv22Wq9OfCCgyDWQJ_dpB5
X-Proofpoint-ORIG-GUID: oPsZ-rdocBmv22Wq9OfCCgyDWQJ_dpB5
X-Authority-Analysis: v=2.4 cv=cuWbk04i c=1 sm=1 tr=0 ts=68240135 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=ph6IYJdgAAAA:8 a=37rDS-QxAAAA:8
 a=c6sSYj18cDMLCXex5p4A:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ty6LBwuTSqq6QlXLCppH:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:14694

On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Alistair Popple <apopple@nvidia.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>

Maybe

R: Byungchul Park <byungchul@sk.com> ?

Although his LUF work hasn't made it upstream, he has a solid understanding
of migration and it would be helpful to have him involved as a reviewer.

Of course, only if he has interests and the capacity to review.

Byungchul, what do you think?

> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
> +
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0

-- 
Cheers,
Harry / Hyeonggon
