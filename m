Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584E32AE66
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969132; cv=fail; b=JnHjhCryiYst5cQ1e3gnzjm1N2J/CDGeJ4fsF7JmyYMDhgpYueFyQwxzeENuD7DaKSu9UAZoQ44V4ed2jiaA54iQ5SnRtQ5qZxKFxEhER0/GBTplFU1eaEqZ/25fIePCckXL4VaoyHfcUFMNHUZOt16jcLSzKfah/YaS6nqlVkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969132; c=relaxed/simple;
	bh=bhciMNzsQXBr5HPNQrFs1O2a3YaYWX4/sArbrWVQB+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RSo3t2/bUi/yt68RafRSrpuOO57rjLQKzMJg9pxR/b0yWwAd8eGSxBj+F4nTPgl6iwVvthat2mGCvVu1/WDZ+ZZsYJOAbap6FR4wOkOzw3WqiJ48/qg+tbXMc3PJpnDcg+aCTS+ePyx7ZO2MbJ6xpy9PKeibPXdCOfpFjkbdLyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QvsakzGG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=E6V9k1Hi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QvsakzGG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E6V9k1Hi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7u1VE022501;
	Fri, 18 Apr 2025 09:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vuFy2Kg6bUT1WRLW/k
	6pG/fIMmg5tfQL20zo519kKHo=; b=QvsakzGGN3CrOiM00HSqqS/VaV40A9PTxw
	iOqzty8X4zXOcQp8J9eQSRK/nwg9f1mjIpsDK85GrOaCfB85s65Z4giDkNYQIr9d
	yTBl7glVjDmMcT6ogjXoBGA4IOxt7GHvS8ZhEugn3yMcAXlUwFghM9EtVwIfic7e
	fjc+sti5/qM3vs7Tf4BTB0ksjei3mKzKqp6oE3nfbuq4EjV5vRYTpE5Pajvfs5MA
	YwcsoYOLuv317bYkp9kl1UeX7wWo8fVUF3siHjP7OMzObBLTuhFX+MzqjAwesrY3
	Z2GpJwIhKobJArH429MmozOs6LmR4NqRQ+s3Fngd5VVgnLZfJm8w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185mywqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:38:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I7Xoe4008534;
	Fri, 18 Apr 2025 09:38:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2uf365-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 09:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3LgY0miIY6iZ4F/ff+hAcnS7P+xNaSpGVOrg1uM2eOXq0YS3+P17slprjU0M3M6ua6IF4261xWsAVdQbVnkYAHBOzmnDhbcnhF1CP6UBIdP041IuCJAjE+o9kRFKTEhb1yKD6ChoSgZEvRHoOW9qpPXg4dEO8kT1XtdBW8Mm0PyptIGfS8IJ5c5Qc6XLjvsQCK45OCjFb2u8Mvda4OIOaKxyDTWE3Xz1tR+vsffA5E+k/gnJ/axEov9QNFeXktTLPWmgkswGVNTVBarZYxjWG/O4kIjTTymMsRdIiBSrzOP/MWE2XDG9eZp2wU8onF/9DMSnzlQVaf9qsI+l35iqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuFy2Kg6bUT1WRLW/k6pG/fIMmg5tfQL20zo519kKHo=;
 b=bYk7S2LZk+rh7XCR+BfmIDaydkqLnaWCwNwgQ6J6luu6Zp4LxXcA1ApkrfPsO16CvcoDlqh5hEcu7OJu3w08es7N3qds733SW/RcrjyLkTfZFvtOfya8kYcGMSv1TLJqCycl9JklM+ilLLksDn243/yMMTjpkuQ2v2md/IDY1QS0nhChwqLQ3Afd3mVegNxGT/gk5sayyi5VNiDWSQRGlRriP7uy9ecxMhTGI/GBd2dPOLaWyHtH0LqLHDMA0PVaAaWMyN2X2QNC1FT4QBhmBpFEyFQQgmKsj6c4i5z1Zn8nHRAEm15G5Rmk27nWSxjn7PLLReH2+QYWP4ypoKKrGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuFy2Kg6bUT1WRLW/k6pG/fIMmg5tfQL20zo519kKHo=;
 b=E6V9k1HitzFUPsS8wBEJusWcnyDtr2e05dZdx55JK79snC7CbQwd4K6hqsdWTXBRe34vTL8is9wNo3uLe1jtq77rejPl4vnMCxoEoGGLPK9rANnLBMoq+H1jm4wR55o24bAtnO5r3qFHZB/+LoyvRWepjfN4Vcqq4lP8S66y3KM=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 09:38:05 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 09:38:05 +0000
Date: Fri, 18 Apr 2025 18:37:58 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org, linmiaohe@huawei.com,
        nao.horiguchi@gmail.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>,
        David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 1/3] mm/rmap: rename page__anon_vma to page_anon_vma for
 consistency
Message-ID: <aAIddlu9x5RTZT8k@harry>
References: <20250418075226.695014-1-ye.liu@linux.dev>
 <20250418075226.695014-2-ye.liu@linux.dev>
 <ffb0d633-84c4-4c02-a4b2-021ff8c9b6da@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffb0d633-84c4-4c02-a4b2-021ff8c9b6da@lucifer.local>
X-ClientProxiedBy: SE2P216CA0021.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::8) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 895f61b2-9768-4516-4090-08dd7e5cb816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qSMpyZw0ALAgttI7sdve6EqWzzh/U1agmd9VluEPkq7Zk3ZzoauIjgNO3APE?=
 =?us-ascii?Q?fbNlFo0vsZdrSTQ7A4sgCm+NnRA7gincqGrhW2Rb0npQnASIUhqtAC0dmgHS?=
 =?us-ascii?Q?Z/6+7uchOtwU6lz0LU9+dyXVFG7l14FdrMMnjzyQaU1/0zUq0val0fDkCEQy?=
 =?us-ascii?Q?KzJWfctW9RKyQCP3ee3/kr6zgEN68gc8TLOgPTgExRyp5F4g0QheNl3rf1lA?=
 =?us-ascii?Q?CUoBAUzFQHeS5qxjH5BkcZ7gxG8Ahg/iwIOXkVGzWLVuE+KWtiHyECjwfb/F?=
 =?us-ascii?Q?6vNl3JMRBYUdBpOZZiZLrQFgfR5jik86w+bJigdSrsnj9ROjVGSx57m9Zpjn?=
 =?us-ascii?Q?39EeyOZL0Th6j7sT7WfjVKxs94VHJ45DWy8mbaFIQtGfChV5K0dFnkoT4J/Q?=
 =?us-ascii?Q?dwUI8GbFj23X/rB/NSjkRGxDJ5+tWEb5zKy/iD5Wi33fnPPeA1Nmc7cXjQZY?=
 =?us-ascii?Q?PhHcj3/aFNMW6fA+Vd8N9ew67JMrrQmTNVmPSo3QOoOoaZSm1UU333aaH2Ew?=
 =?us-ascii?Q?YQCHnVlNEj92WsQUkqV+dlTFjJQjw5ORVq9WwOQI4Suuncvp8rFiClw4qzrk?=
 =?us-ascii?Q?0cok7LwibVSOoiaw5dChlgMIe0yN3X5qCit0/XtqbtZ9TTAeRYGsr3ZwSP3t?=
 =?us-ascii?Q?dqLKIG339WOYhchCGWhLTD5UryiI8WD9W9b5aZMwEoFdInuCHIcIkdzSgAbr?=
 =?us-ascii?Q?+S3crxuSFmzfWMa7ypwfpGrKVY6CG4JMLUaammW5LduY0AUWrhQUUH0ZlgCr?=
 =?us-ascii?Q?rQHJ3LwvXGyOEhit+YhIpAatsTYaeT3OXY+h7qgohLWFmMgBvrjMNWlN4uQx?=
 =?us-ascii?Q?79d7BIZqeDYUkqXsrMbyrALVqp1kd8r8Wwg0Hxskvi0M5p6EHfEq0q6eOT/z?=
 =?us-ascii?Q?tKUnN+SoZzPwdANuxrE5Xd1Syv4aJRBGUxLXn3Y7pBM7O08xXFmoySppkPKA?=
 =?us-ascii?Q?bHLOnZjIYIP88SsQA6MV/edw8HKmCmE18POISzHXPuIhDE2I4/7QkusGPga+?=
 =?us-ascii?Q?oGSHOW6TENPnzPBloJidsQsNhfC75E2t3zeTBueER88xuaKjrIjN+02GGmsC?=
 =?us-ascii?Q?2aToFkimwXq4gtjA/ouJaiGqsZoQEM1uYQasdD7U2EsN6sT7YACp8+KZGCeW?=
 =?us-ascii?Q?mNsDcn0vA96PFbrhbjgPKUy7WPGi7tWK5Y/IeGGnsn2P+N9jRukrrDzM9sm3?=
 =?us-ascii?Q?VP3b6vKlrLrFFOlT+bjxwM/DcuPCxIy+Tbss2dmQLXjY/TBD3gQOeCOrFar3?=
 =?us-ascii?Q?OYClMUCNXjl3Y2puAmQ2ug2sppYmUyTyZgkp7MC5UTqRcRR87JNFSf1wsWxU?=
 =?us-ascii?Q?BG6CrWhIy3fc+qXU4JOhAEVzCP4Xsk0xWhLdygxh48nrgJm/oUoiuvDt36UX?=
 =?us-ascii?Q?VctNYEOStzLR7fJhYgYTyyE5kFUmeoj/KvxZBmDKoSN6x7FpHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D8YgFm0+pDPWfUGquDx1hgoSerTr1X3R1lKeHGbQ/0kFzYFmuq5DpotrK3f+?=
 =?us-ascii?Q?3r+KNfzUZZmAm+Ye9LPZL1xIdXFE+Sgac1KrMuykwHfyMDnw7RBr+rCUOI99?=
 =?us-ascii?Q?XiG8/QkUX/SAf+x34vHv1IoQ+GU3h+Kq7mK/iKOKJ/NOMpCG9JuOFNLuZgO6?=
 =?us-ascii?Q?A0gA+poBdPICEXMVa7sFMkbCaM/TXUwjpiX/OdhxTjUPpzPX/GPAZpYGROry?=
 =?us-ascii?Q?VhFlApqVEesA4je7ymbU3T8S1qPhI0Hl3fAWjQ7WGztmwPFdO3GDoL9hrheD?=
 =?us-ascii?Q?IgWIcY4OycNi2YMDKlyf+1xn8H37afWLcTM3j/jC2QezCWM+A91sh8+sQsDK?=
 =?us-ascii?Q?fMczsfrrDJQFEB88gzO9/61tcDk8fIfBRmFxwyYwH/qQZbU9iUBj3VJ4ViJM?=
 =?us-ascii?Q?R9HwMBi+JNbQwTA7umATHtlx+XL0XiO3+SLh2QeJBaTcv5kWugnCIPa7s4/Z?=
 =?us-ascii?Q?9G5s/99I9BnXMURa57yuf1BVZgnbstbg/ou2kv5Y03IiuMQFRqfieoe7sNac?=
 =?us-ascii?Q?kwGSW21m7yt3Ce38QZw4DBBnFYReJilyMVBPL0a7kdjm+QyFKKHlydorBVpY?=
 =?us-ascii?Q?WVqHcSZvH9hGYWHoeMBAGm9f16ds6qqWOtZj2HgAZCrZZZUpfzh3DRu+6UHF?=
 =?us-ascii?Q?9IcS/JMorF6yPLgF1Stl3CQZytVkoIBxr5IWbeI8Pwr0wLsLY26Nxctlbe8g?=
 =?us-ascii?Q?QhbNJLGSKNmUSGngRK+X8Gtd23HRbPoHRSea6ySrV/bt97Ofxo3OcHD8aL/l?=
 =?us-ascii?Q?mF6Xo3DCUY5XepEqfSfQjJIUp+TGjLxzzi2fCGRHFrVCBiKsyKVVzmTsFsNk?=
 =?us-ascii?Q?QVrEJMxy6QFGKehvAnJ7Xuq8OLxDmAmoizUt1aKD2Gbv7hKtH6zmm5oX9MOV?=
 =?us-ascii?Q?FJXux6JI/5hJOaZY54qTFSb4qFmIiskP0U3mnSWV5YByUwU7LnYKfDX/HPbt?=
 =?us-ascii?Q?RNXW692MlpCuaAFARHZlsIHE7UEf41jgaomXdfqCwYruxEMMwy9xUOoEq/Uu?=
 =?us-ascii?Q?MuM0Kkwc5PRD1jgiZqWX+St+ziDdZusYgw8AvuO9CPowVaXfpgF3IqUezsoG?=
 =?us-ascii?Q?t7DkQXHofQE5odYynDvL5EAXf3Wpf+PRlz9sgTRG/QlNVuGKlW8BE3OQGiHf?=
 =?us-ascii?Q?V0PujsPy3wNefLQlFDixk85E75qvwFePXXE9Uon3Wdst3ZqGEvSHkS/F3H6m?=
 =?us-ascii?Q?dO2MDkHYeQFfkRAk2cCOgYvXT8dVdMiOfGyUBAx3ADatcS8cd5BqJBzP9Rv3?=
 =?us-ascii?Q?pLB4g0M3F7TVwkgcgriW5rCLlSmFG32nrmQkIKj/gTUNPLKv1mNWIAywFSmI?=
 =?us-ascii?Q?9AfDkqwwGPYMkLQdh+wUrvJyWfECmwITvl6z1ouEpa67mcqqgAOM4hS63CvN?=
 =?us-ascii?Q?I4swlHKHFh4fO4wgnmRl617hdJPdTCLTyATwDc6HSwGlSCNIuALR7IZefpo1?=
 =?us-ascii?Q?W1k2ZEW6sT+zWnBmfIa08bg+FN4fTBJhbiJRrfgAMaUwuzQDLU8H3QA3p79S?=
 =?us-ascii?Q?2JzRty/MN42n3WpiAxgwz6+eNItOqS3ekU3tw4JOPEFJS1YiUtyEHaxOvmwx?=
 =?us-ascii?Q?lg9Gmq1Ir1Mnrp6/6NPlrgvRXW39XWw6HmpRqcr1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+UZDHQBZ2S98t8LyzNUgAsssg9bUAa14rEW2JXje5u2b13Viys/uKWZ51nU7YW7q5YUG29LxuZi5g2JC3bK4zzWwJQ3hQsDE57kE/qLuK648l5dJAJWjPEbTKNI1P39SP3cqGqgfw/wwgS59tEhhOnlvZyUAox6OKI9D8dOixHWIswP0+qrZNamdLVe/SYhs2qz/FlMfai67XvcUrH2Y6EZtJQaL5ppmZzXcUH9pNLQMuQPNNICYy5EAvb385gpLBYfFY00hVz+Pvp+Ij9+YDgXdhc3S8x2y8+G74TF/11+YJqCejmnqC58GxXZ405O5VyyYLpfDYl7ocK5khC954YambFP32H/dY+CNg7AMjxdGvbQz7hJzloouccHlzmTY4EfI5Y/++XsnUQBmb7WP6DsQ1q8uoiPT+TfXLOnA4B/MEFBq0veHJqK2BwpAD1W08hJHDDlQ/V7sZWqBIWjAk2oCr6RIC7BnghkDwVBD4ksLwJqmxHlIK5tX2oBbboJ7Yna3XYCl+sAGjiri30Nx35iYJ4ILc07dUYOEyt+H2N0EepRpX7rvNRcetn6I0OY1sXhhDf3lVmoM5pBx67uoglTSP30LOpPJ2FwhaKdAF+8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895f61b2-9768-4516-4090-08dd7e5cb816
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 09:38:04.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDc7rtw1agXJcf+C18mp3cDOBOKyftnU92Z8AWiP0hofvFDNQklUmzdRASzjH8ATPmn9EslYGcueDrnfx8OUIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180070
X-Proofpoint-ORIG-GUID: -wXHotR4XWfU-9rmLx-hIKStsKRwjk7q
X-Proofpoint-GUID: -wXHotR4XWfU-9rmLx-hIKStsKRwjk7q

On Fri, Apr 18, 2025 at 10:14:25AM +0100, Lorenzo Stoakes wrote:
> On Fri, Apr 18, 2025 at 03:52:24PM +0800, Ye Liu wrote:
> > From: Ye Liu <liuye@kylinos.cn>
> >
> > Renamed local variable page__anon_vma in page_address_in_vma() to
> > page_anon_vma. The previous naming convention of using double underscores
> > (__) is unnecessary and inconsistent with typical kernel style, which uses
> > single underscores to denote local variables. Also updated comments to
> > reflect the new variable name.
> >
> > Functionality unchanged.
> >
> > Signed-off-by: Ye Liu <liuye@kylinos.cn>
> 
> Thanks, this looks good. I don't know why we named it this way :)

At that time there was page_anon_vma() instead of folio_anon_vma()
so the author couldn't name the variable page_anon_vma :)

-- 
Cheers,
Harry / Hyeonggon

> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > ---
> >  mm/rmap.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 67bb273dfb80..b509c226e50d 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >  		const struct page *page, const struct vm_area_struct *vma)
> >  {
> >  	if (folio_test_anon(folio)) {
> > -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> > +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
> >  		/*
> >  		 * Note: swapoff's unuse_vma() is more efficient with this
> >  		 * check, and needs it to match anon_vma when KSM is active.
> >  		 */
> > -		if (!vma->anon_vma || !page__anon_vma ||
> > -		    vma->anon_vma->root != page__anon_vma->root)
> > +		if (!vma->anon_vma || !page_anon_vma ||
> > +		    vma->anon_vma->root != page_anon_vma->root)
> >  			return -EFAULT;
> >  	} else if (!vma->vm_file) {
> >  		return -EFAULT;
> > @@ -803,7 +803,7 @@ unsigned long page_address_in_vma(const struct folio *folio,
> >  		return -EFAULT;
> >  	}
> >
> > -	/* KSM folios don't reach here because of the !page__anon_vma check */
> > +	/* KSM folios don't reach here because of the !page_anon_vma check */
> >  	return vma_address(vma, page_pgoff(folio, page), 1);
> >  }
> >
> > --
> > 2.25.1
> >
