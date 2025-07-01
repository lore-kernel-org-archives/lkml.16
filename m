Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD692741DA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376498; cv=fail; b=GKQ2G2dT2Y6hep5aLxjpg6xIfZVJfyWeSbTetC4Rmk9zGTDocgmyfqB9005Dr+8lpn5U2hY2nfxVMBLU9WlB9jAQkmEsBgKTi32ihVK0uO2lm4A/UTZotbH7YN3Ok6aWuXYP0ziLWvFJmvZleg7mpS7nYObI3m1sslNAEMSysQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376498; c=relaxed/simple;
	bh=JgagfvFXSUEWG0pQr8O2bHMd3ZSKG9GAtQiSMsNeoRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DTpFyqHIVW+QujqCqIHGE8Ku9Sic/ywycZNpJWJWXcmcoWVOC04aVPfpNZZF9lrNOsVYERKIGtXDEF7FV8mxzsx4bsVLEEOWk7DjexCVAnM+0EORKlKGZ+IlFukwYWo49SALqUnQZNSrYzIDv/K4el1Sxa8zauQbU378vgGiBd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZWx+tgde; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qOVlH+1Z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZWx+tgde";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qOVlH+1Z"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561D9CLk028040;
	Tue, 1 Jul 2025 13:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QknBdRivuXRQRe5BhD
	kt9fsRNyqnmcoYW/qN0IZ24IQ=; b=ZWx+tgde0NZpIZjqc89GnRAEDbX9nRuLHC
	lavAuA2dsNSr5xCOTY6NCQuz7BcG19K0249DJ4aT6KXbHbMcU70oi1N9bqI2sg5c
	VokeDK3xmTD3rLgmOZxQaxWuXdS7VoeXimfbckfn5503g+NyJgxI86Na7GuBjC3Q
	MmmYDgK3A9xrBsd2e48Mci4ousQwgup55eK7F3uVKlm/JaTCmlfGo97Boi+Hnyty
	UhlvWxAd0j3rTP7ISF2s7p3FedkkHwivQBW+wrkSRs5EBi6l/2jn6IPr4Pf6DwJZ
	LCh1dMXsTMJZUxnGVMN0unRDbnjs5fEBaM7yWrYLJ6waae10B1Mw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766csec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:27:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561CiNhh009077;
	Tue, 1 Jul 2025 13:27:40 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011068.outbound.protection.outlook.com [40.93.199.68])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u9svmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 13:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD6QtkSRVers3RxZpdnaYCDgfuOgrmWt3SgEqfezZgXmAasTEV2Y6GiyWzIONUqYgrslgNJh/KBRWIXxyah8badbU5EB+uUhNcYqy3LVLteWmccpBpXZEl4uspEFbzWkEW9aa3k3WB2SN5X1qW3+CcFRSvAamadVpfdgSGO0iJJ6P/Mp/te5hb/sHgdQ2RmOji4KZdTy8ajIjVOszw8yFu3yeokRiezaiNCWXfCsdtdTGIk0QMFMr6MahxkeyCGU5H8QmO6w5Vzz8tayBDKOYVXufjh27D1yaUTgC7y64pdMyAFBdLRxGReVj8hhM97qltYvqw6y/ehU1tzy8MUvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QknBdRivuXRQRe5BhDkt9fsRNyqnmcoYW/qN0IZ24IQ=;
 b=WHNFwwAGMso/0tO5r81o82TnOM1I3Vv0AAd0U2HorjjwaLgvbGYhQBag8GDyyl/DbtESHQ6z9CItz22UaXRSv+Yo0z/YVqjm1/+rNyLUZT0pfL/IZD5oe5D3zVLg673Csi+DbMRR+p+tJzyN7Qh/nAQbAFuMQhKHjhbvoItj9gfh2gtaPGc9LmRsgaI/fyyvyJHfznIuyYrOQ09k8iQZnG75E77EK52SsV9QH932p8YkcuN+RN3Kmis4TMDF1rqHYFskdfu6hBhsTLlzA09ksEpvtBq8tesb6NP5Mk4CQUphlYAtjcBRnybfp993Ax4geVVZn3/83r5DAeRStb3Dlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QknBdRivuXRQRe5BhDkt9fsRNyqnmcoYW/qN0IZ24IQ=;
 b=qOVlH+1ZdNgl1wYxoliweMuIm//353lKsOyO/YH2x9FUNHl2QjgxBgoRjyKNIz7oXseCZevCz52HDfVwgi135kY1O8wb61PTbAnwmi1Cx+ghDBmpfgTyAoN8pB6kioOqUAjhCwQpkfJFSqIlSgL0xzG7F5boF3a5thvtMETKCHY=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS0PR10MB6174.namprd10.prod.outlook.com (2603:10b6:8:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 13:27:38 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 13:27:37 +0000
Date: Tue, 1 Jul 2025 22:27:30 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        baolin.wang@linux.alibaba.com, chrisl@kernel.org, david@redhat.com,
        ioworker0@gmail.com, kasong@tencent.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
        ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
        ying.huang@intel.com, zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Message-ID: <aGPiQq4cIPDt-Ue-@hyeyoo>
References: <20250214093015.51024-1-21cnbao@gmail.com>
 <20250214093015.51024-4-21cnbao@gmail.com>
 <aGOyhvR-GaUYgLwQ@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGOyhvR-GaUYgLwQ@hyeyoo>
X-ClientProxiedBy: SL2P216CA0172.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::18) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS0PR10MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 402a08e8-1627-4c60-75a7-08ddb8a30be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hWoE1WkPTmfoZVIXZN8ZopD2YTIdTOdtQVQv6iH0hfN69ANBEAp+W+bc9aby?=
 =?us-ascii?Q?cVbKEZrefocns71G1aV7izgpcGW1h720npkF3+J1M1syZ65MLpD6GbPGlhBU?=
 =?us-ascii?Q?MxFUF201BugxE5FtuNb8pLnFyHyCKnkX0YP4jRLSctcCD0ATxXfkum6MgO+0?=
 =?us-ascii?Q?Qr5LXKmPSmUgpObWxDYMWAqI1hFOXZcBqycXH8DAXqxa7vv2Bbzz5LegARyo?=
 =?us-ascii?Q?SVsHA1qjesaNz0+B+0QWWZWQ2S5bvmxKVn1VjXI+6t5kkARZW58MS/jabydR?=
 =?us-ascii?Q?cpsHdYsTgfvaDcULThnwTqswhr3OZ1erfHSfMHFdielsrkXlfN39S8L2KsmQ?=
 =?us-ascii?Q?rvwwlpRVzQ/0pDb6Cxay1gLjTAXSHlj5bisZ/mvwwXcO9cJNJfAx6jCkoJZS?=
 =?us-ascii?Q?Uzp28cHqF6wURcTeWSbwxxG+/v1Kz/OuQGiXupYSm8sjJbZD8QTfT6Vkm+AZ?=
 =?us-ascii?Q?V9McaiCQACZBqJRRxGabuJTiJTLaR4u6Cb2GdaetdatpFe2My3+WgcjQXLVv?=
 =?us-ascii?Q?PF5kQ7dBYrZs063Lot5obFtOiSsKuus+pN7HCkMVsg3tBG8o2jfBqPgC9c6B?=
 =?us-ascii?Q?zOv2yhOOLtSYjX0j16psaohAfm2egfzDfV8YuruTyePjAHdScJ31Xa4uCK3N?=
 =?us-ascii?Q?HEhayjCO3UvX1HJFfxKTn6IWdoVxxgL2cof1bxjnoxKh/zE+Gjepnar0V2tN?=
 =?us-ascii?Q?k2AYdm/QScfc3OAiM9gKyoGEWq6XucKqtuQZ0n6w0EGaDCHlaEumZP6Yo3+Y?=
 =?us-ascii?Q?MmIgr5jkk43KD8p7o0/aOYiokSrP74NrEqeKn/eeuB7k0Ww5+NN8eIfC29PV?=
 =?us-ascii?Q?5a3lKWpwu2obqewQMyAMU06EsHCE9Dn6GjP7HVC4foEnZ+r226RCp3LLNUid?=
 =?us-ascii?Q?dma0Cvf5DPUdPRJca3g5gR59tBJhxfec8V8MsrNRBX/a/evpNeJI9JG3nf5J?=
 =?us-ascii?Q?l1ufHHE66QJ2/YPiVXUKKpKyNDKuMo5K3kh/DIE4ipIx96lvAjaPLxO9EcfZ?=
 =?us-ascii?Q?52B9awHiZUJYDOT0R1KRity9bqbgmaiopPMmJ3YJkofW8LVxBY3uCt0fwHBV?=
 =?us-ascii?Q?N1RvGeBiYH3nEHVGlmGrNsZctnwrYxNQ419JQDhCudxSRUmJBHdKhIZyWnPR?=
 =?us-ascii?Q?gIVsaipF3j+eN+Qsvpp5NBAV+nxK3nyG5AC8KXAkGF93GyOSHZH0pNJ+z/lA?=
 =?us-ascii?Q?ETqMRcuL8BV7ra0CCmKXRfvYVNSzIml62UTMc0XYMBCeX7SOrWdC/ZclWCQu?=
 =?us-ascii?Q?o/z50mhTM7HVF0xgs1PcQTXIph85AwBTStf2Pc9I/grGNpW2eyLrD7SQuvBu?=
 =?us-ascii?Q?dBrwWVSicRGYJ7ak/Gk5jgbd7e13G6qiKjHALqVjjxbJlL8oVsg7cziEEm2M?=
 =?us-ascii?Q?3mjL9bqWFMd4m0HfQ1w4WPP3sEzAhBCpMNzt3A4oBHbTeqZG0yXbJrhFYu7U?=
 =?us-ascii?Q?0+qZMaqcZLw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Quccd3DAUj57BnJAmQL1nAMh99F49e/0FJikvGyV1EJ8B/2AA8nQBLk2RPNf?=
 =?us-ascii?Q?EakDV3IhIfvZeewtIwCgPKurckd+GXmaOwngRSx60DHPUL1zEcAt/yEk0U9d?=
 =?us-ascii?Q?pCizvxRibgYDghBzHMzgk/HH2nBLuFBLCq9DEF0DsHhvYic2xjtHAz+QIiv+?=
 =?us-ascii?Q?3vMkFu4P9KHPbY4swKeBhNtKw0ju4eFiebPGvWqoNdlQRKJ25i45M57KaV70?=
 =?us-ascii?Q?pMwhuqQMse8R5TxQLn6lnQY4vdOj6TY75x54sKznnfwQGkNJsD7cenD0UD7v?=
 =?us-ascii?Q?SfwShCvfZ3MMVZbJ+GNSfnjDAdyfLuQ8EsEgvYZd+BtAQZpgdfNc4EzjBoy4?=
 =?us-ascii?Q?pT3eu4zrevo99x3OqkuDoPOTpykZB3/kTMDkcspkE/oSan26ERvOHd91d+YR?=
 =?us-ascii?Q?55ypU1moWgdw0cnbKkbWzjHz9eorxX4op9pBa6ijId8A20DWVgKnlKpt6CtH?=
 =?us-ascii?Q?+dCFPONSpdmJqevkjMS0n+W0azXB222gbCPf6DyOOzgF9fO9niRlh6gq5txk?=
 =?us-ascii?Q?iwYOYr9zUj9QyOdvrjDOV07gaS2NKW4cT3hd1I1/I3Mc9X38Y8u76hTGIHtt?=
 =?us-ascii?Q?nZX9atKTifl2cEqxGhmdQNPmBWdiqRvA1rrbF7TO4oHgjTxWomtJYlkaySvG?=
 =?us-ascii?Q?j/51BC4ezjxMhhszMEBKxiglCvl5Ek7kkQSD4XCXVxfEfxqi8elDEQF0R6XA?=
 =?us-ascii?Q?geTUxCzdg5owXSQKariN9yVfDM4KS00wpu2dNOeiJ/jr606fByPjID+0e4ZV?=
 =?us-ascii?Q?jzeG4A6zLp0c5eLgfFNMyAwjOFN4slf71vYTIMuG/7vUjzzAc7UP+K6L/Y+N?=
 =?us-ascii?Q?MYJwPGeHdCFd0vAIQ1hNc1IX0V6lkTJpVEzPrOlokogaI6jUiroR2OP9KWPC?=
 =?us-ascii?Q?hZo9taBLnSgBat/l9cnVnFt/0UJFBTNNZOTVOKJIET0SpDCwjZGgF6hu/fla?=
 =?us-ascii?Q?KfPYw/OefCxw4qkAT5p3rB3b1updHTH4M6xwgOd98L1npWd86G63RiSnHDqQ?=
 =?us-ascii?Q?3lYI/cMbMtP2WNJU+oZkrJCbT99GE+dT8IENsh5T6zhoRTif+4VS6qTH6IPi?=
 =?us-ascii?Q?Mrg2a4XREztclJPWQLRLJswvEZ/FIcx/2cWd4YZVf02tObY5HVT7AwMFmSpA?=
 =?us-ascii?Q?fAdV+8PBaFzsfl0PX8PyTR9KQloQttKnWcNqJ09iNbt3OmyWrb7Uo/Qa/MFZ?=
 =?us-ascii?Q?XmsXbhMCkHk6yvf7BqwhgU+xydTKQGVIwEh9LPVkBB8btgW2v0WoheBRdzcB?=
 =?us-ascii?Q?qrJD0/X9ACLtwPpxaXpSzdfH10AyZRc1SU1aAvo5dZCcVFp87MbLItdU/mlS?=
 =?us-ascii?Q?7Q19gJZHALdsWIn9Z4eYse3J2TroJ5dhhqfHh+nev+/ONfXCSYPLCxLwzHNR?=
 =?us-ascii?Q?cfnCOk0OJczdmKW24K6LNpnFcWKuAEmiQC8qcYCGzchUlU8iYLOs6MhOmqd3?=
 =?us-ascii?Q?gnaF9U99q+6v4B30ILMwaIa4N/orhkwDsmaZEeCjAmoSZ2yXkaLNRAOeXvgU?=
 =?us-ascii?Q?F/Us0tsuAY+d74q9IyK8K2sNyVnpoMz8BX10he5fMk0L2l6hyP1X9Li3IKnt?=
 =?us-ascii?Q?BLfZ6aGMZt7FR6w6VAPmuhYd7/M5LYDDe4chITlC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PiWXiAKndjYiMeyawknmaPBOP/9weWpnSk1wXrWfjXIiI/2lW2Dulfuls4V58235Xljc5pPwX0vQ+RqTbW5z9C+ZuJcR1JQpNJjVteHPiRbD2N+0yLwjeVwfK/jTOjlDRWEGn3YWeXU7hpeghgvf3KLeeDw03c8MUuNOHhXWFimGKmLkLVxDOt03POaE5Yz3pcoNtJXRceDrQ/yZ2dtBkaCygahnqUY1bWMpG7o5WZddYaWii2PtrUaBE4nMJXKxsAwXK38DtDufiFDJLzMAplZbRyKpTlhLoiocGu7Ple3hQILq4bSOMNmo6QP3Lb5aApxCBvbVwXtZstTeWvOnEBboEmmZfyIgtnMZi1+9hUSsVlfDCzmp8xv5C4R3g7o16oqjnbCCjyLBKuhNp3p/eVdm5mnpSREs+/Tkga+aK1nUKhbGIcBFsepJvEr2HMnU2U8qDD+1SRYQKvBj36i/t/NMKFLVEqkL9nQXOz/zpFMJ8XNLbaMPnZUbk0EU2Gg5gYxdrzP+ClJR18QdQTfS4jDVXDtXhGLU9JoRXPZjZ40ozj/TTJcUuvPiUWRq69z4XpE6TkNhVjGmmfJqRI+Lopfvk1bA0vz3OUEuvWOzDMg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402a08e8-1627-4c60-75a7-08ddb8a30be1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 13:27:37.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H+6llyOoAR0z2Jpzu4j2+m7nogVQ3bWA+loAU5vj/4bmyAQeIXH4dC7wP+CL00eoHBDw1d7xTPmqXMN9hp2Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6174
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010086
X-Proofpoint-GUID: ra8WO0sp_ND1SI3yOD113Ip-GWTNQH9V
X-Proofpoint-ORIG-GUID: ra8WO0sp_ND1SI3yOD113Ip-GWTNQH9V
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=6863e24d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=A2pY-5KRAAAA:8 a=Z4_lgzmwLQNBqJMVvFwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4NiBTYWx0ZWRfX+tXXQuZHOQ7M wmgmug1jJ+07WCITkfDTdaMnaYChpfGyBnHgoX1DAOjA/8j7NjaE21DW4yStgnJxd99B012hkVC wdhYMQYtIztXTJOSZq6OQPQgOrbS0jqIeOCmWlkUp2U+ltZP3mMXvZbDYm8Sict4iHQfikz3Ftw
 /JS1Q/eGNqDcf8l9LHJwOErai60xqnCSCoOLZSv+tE7N7WqQajGDrYF3MFg2MW+suc0STHnYZ/r JbM7iXwzS1RI8cGpKNBwKccO6map2ElK6JEs7N2dHZhj+indGnLWmMfTXSv/sQXTYb+tJ9FTJD2 IAgpa36Ev4p0CrF2aOwUcYxan10HKd9OvlvnNOGVwleHv0U8PCd1YpQhbqabF3xoSkjmh/Ks8nU
 Yj0ZT/IMZ2vKO3+wxJMwyD12yUHHpJC0bZko6QLY3w9vkpMdXGqaFQNJhvNxxqs90FL3dsOx

On Tue, Jul 01, 2025 at 07:03:50PM +0900, Harry Yoo wrote:
> On Fri, Feb 14, 2025 at 10:30:14PM +1300, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> > 
> > Currently, the PTEs and rmap of a large folio are removed one at a time.
> > This is not only slow but also causes the large folio to be unnecessarily
> > added to deferred_split, which can lead to races between the
> > deferred_split shrinker callback and memory reclamation. This patch
> > releases all PTEs and rmap entries in a batch.
> > Currently, it only handles lazyfree large folios.
> > 
> > The below microbench tries to reclaim 128MB lazyfree large folios
> > whose sizes are 64KiB:
> > 
> >  #include <stdio.h>
> >  #include <sys/mman.h>
> >  #include <string.h>
> >  #include <time.h>
> > 
> >  #define SIZE 128*1024*1024  // 128 MB
> > 
> >  unsigned long read_split_deferred()
> >  {
> >  	FILE *file = fopen("/sys/kernel/mm/transparent_hugepage"
> > 			"/hugepages-64kB/stats/split_deferred", "r");
> >  	if (!file) {
> >  		perror("Error opening file");
> >  		return 0;
> >  	}
> > 
> >  	unsigned long value;
> >  	if (fscanf(file, "%lu", &value) != 1) {
> >  		perror("Error reading value");
> >  		fclose(file);
> >  		return 0;
> >  	}
> > 
> >  	fclose(file);
> >  	return value;
> >  }
> > 
> >  int main(int argc, char *argv[])
> >  {
> >  	while(1) {
> >  		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
> >  				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > 
> >  		memset((void *)p, 1, SIZE);
> > 
> >  		madvise((void *)p, SIZE, MADV_FREE);
> > 
> >  		clock_t start_time = clock();
> >  		unsigned long start_split = read_split_deferred();
> >  		madvise((void *)p, SIZE, MADV_PAGEOUT);
> >  		clock_t end_time = clock();
> >  		unsigned long end_split = read_split_deferred();
> > 
> >  		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
> >  		printf("Time taken by reclamation: %f seconds, split_deferred: %ld\n",
> >  			elapsed_time, end_split - start_split);
> > 
> >  		munmap((void *)p, SIZE);
> >  	}
> >  	return 0;
> >  }
> > 
> > w/o patch:
> > ~ # ./a.out
> > Time taken by reclamation: 0.177418 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.178348 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.174525 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.171620 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.172241 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.174003 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.171058 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.171993 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.169829 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.172895 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.176063 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.172568 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.171185 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.170632 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.170208 seconds, split_deferred: 2048
> > Time taken by reclamation: 0.174192 seconds, split_deferred: 2048
> > ...
> > 
> > w/ patch:
> > ~ # ./a.out
> > Time taken by reclamation: 0.074231 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071026 seconds, split_deferred: 0
> > Time taken by reclamation: 0.072029 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071873 seconds, split_deferred: 0
> > Time taken by reclamation: 0.073573 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071906 seconds, split_deferred: 0
> > Time taken by reclamation: 0.073604 seconds, split_deferred: 0
> > Time taken by reclamation: 0.075903 seconds, split_deferred: 0
> > Time taken by reclamation: 0.073191 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071228 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071391 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071468 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071896 seconds, split_deferred: 0
> > Time taken by reclamation: 0.072508 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071884 seconds, split_deferred: 0
> > Time taken by reclamation: 0.072433 seconds, split_deferred: 0
> > Time taken by reclamation: 0.071939 seconds, split_deferred: 0
> > ...
> > 
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> 
> I'm still following the long discussions and follow-up patch series,
> but let me ask a possibly silly question here :)
> 
> >  mm/rmap.c | 72 ++++++++++++++++++++++++++++++++++++++-----------------
> >  1 file changed, 50 insertions(+), 22 deletions(-)
> > 
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 89e51a7a9509..8786704bd466 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1933,23 +1953,26 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >  			if (pte_dirty(pteval))
> >  				folio_mark_dirty(folio);
> >  		} else if (likely(pte_present(pteval))) {
> > -			flush_cache_page(vma, address, pfn);
> > -			/* Nuke the page table entry. */
> > -			if (should_defer_flush(mm, flags)) {
> > -				/*
> > -				 * We clear the PTE but do not flush so potentially
> > -				 * a remote CPU could still be writing to the folio.
> > -				 * If the entry was previously clean then the
> > -				 * architecture must guarantee that a clear->dirty
> > -				 * transition on a cached TLB entry is written through
> > -				 * and traps if the PTE is unmapped.
> > -				 */
> > -				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
> > +			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> > +			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
> > +				nr_pages = folio_nr_pages(folio);
> > +			end_addr = address + nr_pages * PAGE_SIZE;
> > +			flush_cache_range(vma, address, end_addr);
> >  
> > -				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
> > -			} else {
> > -				pteval = ptep_clear_flush(vma, address, pvmw.pte);
> > -			}
> > +			/* Nuke the page table entry. */
> > +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> > +			/*
> > +			 * We clear the PTE but do not flush so potentially
> > +			 * a remote CPU could still be writing to the folio.
> > +			 * If the entry was previously clean then the
> > +			 * architecture must guarantee that a clear->dirty
> > +			 * transition on a cached TLB entry is written through
> > +			 * and traps if the PTE is unmapped.
> > +			 */
> > +			if (should_defer_flush(mm, flags))
> > +				set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
> 
> When the first pte of a PTE-mapped THP has _PAGE_PROTNONE bit set
> (by NUMA balancing), can set_tlb_ubc_flush_pending() mistakenly think that
> it doesn't need to flush the whole range, although some ptes in the range
> doesn't have _PAGE_PROTNONE bit set?

No, then folio_pte_batch() should have returned nr < folio_nr_pages(folio).

> > +			else
> > +				flush_tlb_range(vma, address, end_addr);
> >  			if (pte_dirty(pteval))
> >  				folio_mark_dirty(folio);
> >  		} else {
> 
> -- 
> Cheers,
> Harry / Hyeonggon

-- 
Cheers,
Harry / Hyeonggon
