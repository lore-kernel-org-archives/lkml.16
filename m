Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9458D27603C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066298; cv=fail; b=QII8ysI61QwA61dyD+QqSlk6HWnAxSrrIZB3W2x8XXK6D4oRufR8FB/qZqvUgFa547iai/5Wcs2LGRxbB5OvLKxzlVvA19QbN8k0Y+IEYxSaj//fGbMiVaeLfdwuael1lFyPutVoFl40M04eNN3x+FMS7nJnenSEHznuP/rsflI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066298; c=relaxed/simple;
	bh=PQ12MKktOIAc9UNOelO3ZMDMCVYluUnKSvISihHnxjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gz03r8X1kB6Rgf75FCRZsM91YBTIgPiQJGf+fn4xhBZLvknqAzkd43Vl6fTuTPtKLMCpzKTRUyoCFk2p0yN1wZIh1TcMZSDhfG4ibeBdY9G6JJoNanwHS5ozbPRSiSPLLR49pxIk9KJc5xBTygPli4u3UBX5/SQW1mNMSRYsgc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YpdEDtSQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T1ovXkl1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YpdEDtSQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T1ovXkl1"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CFu4Dv009852;
	Mon, 12 May 2025 16:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4G1sXnTOzvggyKrvuV
	uaxfR5a50/EdtVNUBMOez5jsM=; b=YpdEDtSQtEl2fzvsRq+hSrdAqYTFaFrQ+6
	5ejTAfpztwXvnGpVnGvoQO9y7lWUYr010Bg5GNdFgN3r08ikaqmT3cbqzQnBGyWA
	pkzHlbWLJWgSpuqIa3+TvhfYJW7pILU0gfGCkGIAPjFpCayFlDafBrpbU2U6S1yr
	ZN7HxZ2OUklbZFwBmwzSkyU0yakIzfEizw6/fZLRVGClt2ICE1fUmFNrGiACrqrF
	z5M6wK8UO0GcJESnNpLsECMTSMA5D1bnLeswGBeI1JLxQKNaMLehvz05RGQB+o2i
	9eo5MUoiBWDMOdsPSOkz/SCb8c2aEsXPURsIlV36Tx9gSIbrMccA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1662y2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 16:11:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CFgwTA022509;
	Mon, 12 May 2025 16:11:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw88k2fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 16:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAtXqNl9BSsSjN1rMB3UmeEUItdhwds37zy44Yu01vZ0CXXaWYEfbXT4K6jVpQ0GaiyCI6KIznwdPUXO6t7N5CvDNXOYcHh2s/wUMSfFI5gnjFmWi3pvLoRsZ0Y/SQyFrB3J4P3r3henvutKFDdAZHQ87yYcY7dDRZoOOQix6XVAnBZS0njV6r5MZFlLYFqOO/Dm5sOnOvxVa7jPdwEF7RDXZrtEoTD6fFQ+hK4772o8iWN3NMU6q2OM53A9O9DRCf7NLC7k4/qurvOiauOW34AAZ3KhuTv8QjUJwnJG2d9Us0nhUSx565m1h4BG9BoSKI8lyjm7plZiBOUNiAtkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G1sXnTOzvggyKrvuVuaxfR5a50/EdtVNUBMOez5jsM=;
 b=X2dlTGm8uftkQhgC4xCBqQxxJlrThSkxXO0SI9MpnpYH6H9xU8AmarxGeKkNDqz9Mmo171ln9HVPuA9PyngM//A3p6+7uPS1IhtdxStIyWAYMZVrfxai6K0nZZOa0Kx88lanEcWuyv/t5rv5cK9Sy8LEkGScVj3fq8Wur7vvo53XCUQB68B7CkycKD59xJTFuh4KoBwtFSspxDODOM85Ln90JrjKfh66RhqjQ5uWaLqBP4W1tHZYhAr2MJy9LYDO1Qgr0pKhoZh96iQe66j42evzrv+4o+u5BiSiCwjTWKZsC+OaIXN2KkpCXGDP3xfmnWcbIKhivNU0oJACaSYeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G1sXnTOzvggyKrvuVuaxfR5a50/EdtVNUBMOez5jsM=;
 b=T1ovXkl1PLhG7p9qJDhQx6E5IM2vGeo0ZIxrY8bCEnWOv/QGnnMMARgd5C0ZdT9Otpu/QDoDkglrk/GjwuSWD26DusdfSj6fU9ErLdJ0eEdD61TMbvRPYgqKshr+j+ZJK7bX9zGY1E37tQl5J4tx9p41v4T+vIShDffEqVQoAus=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by DM4PR10MB6230.namprd10.prod.outlook.com (2603:10b6:8:8d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Mon, 12 May 2025 16:10:58 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 16:10:58 +0000
Date: Mon, 12 May 2025 17:10:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
        Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mel Gorman <mgorman@techsingularity.net>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org,
        Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v4 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Message-ID: <ef5f6776-b405-48e8-9fa9-c56af392bc4f@lucifer.local>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-3-ziy@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509200111.3372279-3-ziy@nvidia.com>
X-ClientProxiedBy: LO2P265CA0481.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::6) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|DM4PR10MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bf4548-36cf-4634-c220-08dd916f9508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SB4eSdG6oGqiaJYoPzSNLx6O5P+YCKiJ8Oyf/+Ph9ZWrXEvfhtruzDIu4ExY?=
 =?us-ascii?Q?M6g+RDTwUhv9esgqtRiLb2FuVgUjR0QABO+LlrbnByi+0pXz+KOSk72nYFma?=
 =?us-ascii?Q?sBCW7dGy4epSR22pW0AQmYRROshNQnY4O147d5ezTOwUWajJTldWQw8YE4AW?=
 =?us-ascii?Q?NCvnxE53+Kfj4CeO78R5s+yLNcYByOUBn0cqIq2fZqDpYoMtlM+hCfu6yS1B?=
 =?us-ascii?Q?FPMYCmm4dXUCBqYEoROOV5XMNK+6Mme4G55+hJ6Ixkbxv5o3P1j9OwCcYuCv?=
 =?us-ascii?Q?/CVaHiKOkTJo+z6SKO0Cx60U1mbMy1ZhPybzS49yFfcv2AZcMao16rA5+VAP?=
 =?us-ascii?Q?ALTtqFa0nOgV36eR8wIihBelRQEiZv0XJNPI+6JpKiKB1/gb1C/HlaxA9YsC?=
 =?us-ascii?Q?Ud8nKXBA+G3dCbTdNo/6MB0vrVEYrVHwrynWkWHlCY0aUwGxC4J5d/izWbY9?=
 =?us-ascii?Q?g0gEganOupS+GVRin+oPHxjX60UB36SdHEm8oUPbUGpma7yls2ckO6his94W?=
 =?us-ascii?Q?UYvj/xRFlmi379vBLcUOXEmC/zxYRQscoRcqu/WQ+pI2BaVfjVtplzesc3o0?=
 =?us-ascii?Q?V/u52cldAUga9BvQ36FUgTT47K/P8giDHP/hNA4mwWkk9elDYpb4CZRga9hQ?=
 =?us-ascii?Q?YW3Eqj5lS6LDxJPyMhMlFmO7VqvxQKXbRJUHDLvPqQ2sZCfnJeYb15XS95mj?=
 =?us-ascii?Q?yjx343LMKzeQ7TY7o8xCzcrGbYXdIOksbbyNtmR2GnI5Nx3zS26Zf0TQAYTq?=
 =?us-ascii?Q?ePomqStdZYjKAqUdkr+x018xA+eo1ln22Oo8pZyj6emjGD9Zqa2yGaBNqpTy?=
 =?us-ascii?Q?FlSmrZE5sDWWtoo7v8BaCbdk2kxBMbEVs4+h1BBw+QhPEuOSv0O+FHU8kzDg?=
 =?us-ascii?Q?jfOfBLk0gqFsNitH4r2GTXOtuUeyMZeRd2tOxnahpzJwcq0CPI4w/LriXCBo?=
 =?us-ascii?Q?T2o5TrJXGr7Skxo0F4hFRd0iyzAbzAXYh1/4z8EfYNCt7VlNE2R8krFm0Hd+?=
 =?us-ascii?Q?NZLIqUbVf0hspABehw1+o1ffzLpFQjDCwrShjrNZ+Uro0ir35JTDQl82jy39?=
 =?us-ascii?Q?d7n8EiwrU3LlY7uctUcRo1PfZEBmUYsqAKToyZId551INQVbSA5PBV4Fvor8?=
 =?us-ascii?Q?70Y0LS1jh1RjbaM7ij2SW52yGyNscjLdnTE4swDHlH0hS4rcE00VeEch7sXV?=
 =?us-ascii?Q?Yvh7qH/y0+WIBFkTUJKRmYnjKTKxQVp7V8oZracRUJPMbdqSNqvFJ/wMP8wR?=
 =?us-ascii?Q?g3yqOOxkuAumPyVOSvsamSi2/USFruCZZh1y7wu6mlBEvajUqA+VeVG1Qttp?=
 =?us-ascii?Q?zrL+bEyif0GWSttenlrqwXX2rxD2zwfOo6dYgR/OqJB6ydTmqjVzsh9HU9O5?=
 =?us-ascii?Q?+L+2XJg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hs0fVJOmHVEYRaf9k0sM7gfusyVJGJ8D/eNgsWYColfCMD//pwNQoeRDgwnK?=
 =?us-ascii?Q?As6zDGZ+cs0Y/g/OwRyrwKB/5Mvt3kHu8QLb25PepQtcInfBvc/h1tJKHXc6?=
 =?us-ascii?Q?9w5sf3AABhipJLGTY6k6b9QPXGCPw2z604WNsTqGErLcjRtUjnHaceClrzYE?=
 =?us-ascii?Q?0oAyI4QMMthZv7U2wtfibR5hNkpwbMZDPAMzVDLHjz+WZabxVi+NfaXNf3gn?=
 =?us-ascii?Q?iwqsGFXNbZDjp6CyIDYt2SkLsHA84TJHwqEe8vA2G3BqIRBOdCneMImKVlNP?=
 =?us-ascii?Q?0n4Gjsfa671HHktVcBzLHLQrhm8zZhoViT3BOXe0rxcH6Cz7zq7ayOfDLOQJ?=
 =?us-ascii?Q?eL1N1IohXbtjYYRcM6LeQ+2VaYksFILcS2o+ZQhCdw6UNMI2NaQPfFqj1hdc?=
 =?us-ascii?Q?cgd5vHZmOojh02lWc4ozmUgEYnXQltUJhsAPmkqQmo5hNJv9feZD86LcwVZA?=
 =?us-ascii?Q?N/qU+ooFfc3OakeChHUD9H66zI0e1K8Mtx51vikaPZ0fCH8wTkP5kVUk4Cu+?=
 =?us-ascii?Q?0bUVWK9iXyoIohXm6PvSR+u2cgeBoDiqASrm2pxx2sGMG/O8rpPPH3Yt3bUw?=
 =?us-ascii?Q?bLcyXF5oFaDzPKN3vcABZJq/WNDtwxaPPUiA6LcRQOzuh/elWq21EfkJnNpU?=
 =?us-ascii?Q?pxeavQDqwdh81ouVKhgZtuibwIdBuCdUSTc0B+MjVzpHRKBSRBF+pzJ7Mm2m?=
 =?us-ascii?Q?omYnVUZ3d6Fe8fQFqhPOBLEcAQ/b4NodCbBViEy/VzvO+JaagQ79aHRtSeLX?=
 =?us-ascii?Q?mBVcUjVKJDLdFW9prOeTL23gkgmMx9h2aeLc3/QHpEY0izJ4Qt4O1QVCfenl?=
 =?us-ascii?Q?r+OV0rzN/kAv1pNGSDRz6M6UvhlPD+W1houL//McDgHpIMy/uaQf0ek3HlZu?=
 =?us-ascii?Q?npHX7LBYnGvLjsQbvYoK17DeWdPJ+Z42C0n7dWLkAvMj8al8RqnQUhqUXBG2?=
 =?us-ascii?Q?t5e+w7D+jO7kRSPn/dAh29PT+2Mep2nDWcMjLwT4FHDzvZbGNpefkbCP9l9D?=
 =?us-ascii?Q?q9Ir0Y5G17pvuGqptuhlCA5PyZhLtWBlKQb6C2ybzohIdUoxbHRDLrC7kSpF?=
 =?us-ascii?Q?raFiZhaP3zAA0VghGhcgkiBXCDTqVD61NaT3VKjZu42MsNMmh04puocAuayg?=
 =?us-ascii?Q?CodruPybEBtlOwuDpRdC0cLqizESsAUo8M05QpSzf8OpFeNL6wonfRi/OySy?=
 =?us-ascii?Q?qKqfianMFWoep9kUmjia7rjLJXNXfKiHDpto6kCicBIP6d08+T79ZRT0eF4C?=
 =?us-ascii?Q?6FbV6fTXpuBrnNTJlS1/YLW/uGAKu2JevQiEbMtTjAQTlxna5C39YbxK6veu?=
 =?us-ascii?Q?SV6uN7p8qHdd6sMsmTmD4kmvpTbxgd7rmTn88SjO42SlFHsVgi9kTgqj8ChD?=
 =?us-ascii?Q?qohWioQVw4PtlBjSuuykBqdjbpCxhe2zgImLirskkq2Yuju8h2IsTBj28PBt?=
 =?us-ascii?Q?UKs46KccBcmafFc94KON9htdUpFrXL/k2qOg9bAfAtN8HiBIwRvhhuRjtPWa?=
 =?us-ascii?Q?ZIupDW8Z+Pi20v3lsSB0SEqbDIsSuksGxIpHk93Q6LXkkJFYbAaRfJdw8TMq?=
 =?us-ascii?Q?BvSWWnMYd3Pj+6w37DXcrG0sHAxxXpaKbI1JCP0Ku9nfJ4sWEAGAxdoAtUMl?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pT3Ett/Tkk1l2fqKDyQ6qKmn1GA3s5MRAiNCO1W1fkAMca02gqYhGXU9x87xjc6Dpc/cwgoGtCnXVMLZNfdrIsAXR/6tEMQE3pngsboU569aV81pU33fCtJozkbT/oGVtcbgURudaNDwV6nMu/34zfFcgyZwPPiRoDqzJDcnqP9uBjWK/7tfzfdRpboso+l7HRR2ofCVRXNmgKSxoCBgB3wWe6NlnqQUthhbjM7nKXLjh7ouwfYj1tXy4eidJF94yRugF2CfaGedMuN/841qUrCQ5/ExiE9U852q6YpfjRoSJdkRIOVrTnM1dzc6atgXJxHpVCs2o7RjHDcpfU/n5FYCPWz4VWlxK7z1gRz1yjXHVOhGOoe8eu2ps3NOKCG0y+h05+8YCKYnsb0g6VMljNo65CidtDB1R1sNRq1J2jBMF4MkARABMVtEkAOGqfzbjfdjVsXYuGPqpXcdycsrj0x7wUt2w8eiEJQMY3lcDaXxTcwKCED/hs7uvaMKy6qBp5MmSoWBo+9aKv9HpCCD8q50gV2H6XoKtgUQhPu65bO+ux/WFtPtHkMfo3Ry9X1Na2JbJUF6wkhWJw3wIjuaFyFdnX2NLAbTHu4VSqgw120=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bf4548-36cf-4634-c220-08dd916f9508
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 16:10:58.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qurUNcLmUp6MbPxKUuDTU5FMmL1di91185CIeNqJXQ3DoLOnJTgA62jR5iRMGTxzWXZ0igKBqAPICqzBJ2awA5jOuaF+JQi1IeX+N7cXzW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505120167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2NiBTYWx0ZWRfX+gvDeHm3QBfV cTYgNu4gu0LcrvsCmfxCxue0/oDwkrYAmC6lNFBQe7bwomrvCuI0PF1LZTgRv0glE/wdUXsf4ss J4WcyKWgCy7q/o9ReFbphEminTGFApegJ+sFw5uWg/PJeDvzlrGHbk+7QrLWSQiBRr6TFjoYmsF
 OOQ7R4JBpnZSOin82qhJ14B35z5bVJB9GiXPLMX9lvEt4FO6bJEts39h6vQbLSepRDOEyuGZE8g IaqiaIppVvgkc2zgayTQ/3fuErq5CIMnlxXxXYTbhuAwF8MxHwEj/fJIQ3Z0n85hceJjk3zqxjB 7q46raEupPYEuyCVno24yLMa/ECTmlU2GR3DV3Zi+CDiha5Vv6OMkiJaXKjT1j4iHGfu5o3Om1d
 XOCbzYEUGFEyaEO2PNfcgpKwoADKKiYN5f0mu2Mn39cOFTEhpimFX/jvaSe1eTUopX/LIcvl
X-Authority-Analysis: v=2.4 cv=VMDdn8PX c=1 sm=1 tr=0 ts=68221d97 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Ikd4Dj_1AAAA:8 a=css0xLVYt3dFsTo6JdIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 6y6kYt_IXVymqowvkLwYJPl8YazBjrNc
X-Proofpoint-GUID: 6y6kYt_IXVymqowvkLwYJPl8YazBjrNc

Andrew - please drop this series, it's broken in mm-new.

Zi - (as kernel bot reports actually!) I bisected a kernel splat to this
commit, triggerred by the mm/transhuge-stress test (please make sure to run
mm self tests before submitting series :)

You can trigger it manually with:

./transhuge-stress -d 20

(The same invocation run_vmtest.sh uses).

Note that this was reported in [0] (thanks to Harry Yoo for pointing this
out to me off-list! :)

[0]: https://lore.kernel.org/linux-mm/87wmalyktd.fsf@linux.ibm.com/T/#u

The decoded splat (at this commit in mm-new):

[   55.835700] ------------[ cut here ]------------
[   55.835705] page type is 0, passed migratetype is 2 (nr=32)
[   55.835720] WARNING: CPU: 2 PID: 288 at mm/page_alloc.c:727 move_to_free_list (mm/page_alloc.c:727 (discriminator 16))
[   55.835734] Modules linked in:
[   55.835739] Tainted: [W]=WARN
[   55.835740] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
[   55.835741] RIP: 0010:move_to_free_list (mm/page_alloc.c:727 (discriminator 16))
[ 55.835742] Code: e9 fe ff ff c6 05 f1 9b 7b 01 01 90 48 89 ef e8 11 d7 ff ff 44 89 e1 44 89 ea 48 c7 c7 58 dc 70 82 48 89 c6 e8 1c e3 e0 ff 90 <0f> 0b 90 90 e9 ba fe ff ff 66 90 90 90 90 90 90 90 90 90 90 90 90
All code
========
   0:	e9 fe ff ff c6       	jmp    0xffffffffc7000003
   5:	05 f1 9b 7b 01       	add    $0x17b9bf1,%eax
   a:	01 90 48 89 ef e8    	add    %edx,-0x171076b8(%rax)
  10:	11 d7                	adc    %edx,%edi
  12:	ff                   	(bad)
  13:	ff 44 89 e1          	incl   -0x1f(%rcx,%rcx,4)
  17:	44 89 ea             	mov    %r13d,%edx
  1a:	48 c7 c7 58 dc 70 82 	mov    $0xffffffff8270dc58,%rdi
  21:	48 89 c6             	mov    %rax,%rsi
  24:	e8 1c e3 e0 ff       	call   0xffffffffffe0e345
  29:	90                   	nop
  2a:*	0f 0b                	ud2		<-- trapping instruction
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	e9 ba fe ff ff       	jmp    0xfffffffffffffeed
  33:	66 90                	xchg   %ax,%ax
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2
   2:	90                   	nop
   3:	90                   	nop
   4:	e9 ba fe ff ff       	jmp    0xfffffffffffffec3
   9:	66 90                	xchg   %ax,%ax
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
[   55.835743] RSP: 0018:ffffc900004eba20 EFLAGS: 00010086
[   55.835744] RAX: 000000000000002f RBX: ffff88826cccb080 RCX: 0000000000000027
[   55.835745] RDX: ffff888263d17b08 RSI: 0000000000000001 RDI: ffff888263d17b00
[   55.835746] RBP: ffffea0005fe0000 R08: 00000000ffffdfff R09: ffffffff82b16528
[   55.835746] R10: 80000000ffffe000 R11: 00000000ffffe000 R12: 0000000000000020
[   55.835746] R13: 0000000000000002 R14: 0000000000000001 R15: 0000000000000005
[   55.835750] FS:  00007fef6a06a740(0000) GS:ffff8882e08a0000(0000) knlGS:0000000000000000
[   55.835751] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   55.835751] CR2: 00007fee20c00000 CR3: 0000000179321000 CR4: 0000000000750ef0
[   55.835751] PKRU: 55555554
[   55.835752] Call Trace:
[   55.835755]  <TASK>
[   55.835756] __move_freepages_block (mm/page_alloc.c:1849)
[   55.835758] try_to_claim_block (mm/page_alloc.c:452 (discriminator 3) mm/page_alloc.c:2231 (discriminator 3))
[   55.835759] __rmqueue_pcplist (mm/page_alloc.c:2287 mm/page_alloc.c:2383 mm/page_alloc.c:2422 mm/page_alloc.c:3140)
[   55.835760] get_page_from_freelist (./include/linux/spinlock.h:391 mm/page_alloc.c:3183 mm/page_alloc.c:3213 mm/page_alloc.c:3739)
[   55.835761] __alloc_frozen_pages_noprof (mm/page_alloc.c:5032)
[   55.835763] ? __blk_flush_plug (block/blk-core.c:1227 (discriminator 2))
[   55.835766] alloc_pages_mpol (mm/mempolicy.c:2413)
[   55.835768] vma_alloc_folio_noprof (mm/mempolicy.c:2432 mm/mempolicy.c:2465)
[   55.835769] ? __pte_alloc (mm/memory.c:444)
[   55.835771] do_anonymous_page (mm/memory.c:1064 (discriminator 4) mm/memory.c:4982 (discriminator 4) mm/memory.c:5039 (discriminator 4))
[   55.835772] ? do_huge_pmd_anonymous_page (mm/huge_memory.c:1226 mm/huge_memory.c:1372)
[   55.835774] __handle_mm_fault (mm/memory.c:4197 mm/memory.c:6038 mm/memory.c:6181)
[   55.835776] handle_mm_fault (mm/memory.c:6350)
[   55.835777] do_user_addr_fault (arch/x86/mm/fault.c:1338)
[   55.835779] exc_page_fault (./arch/x86/include/asm/irqflags.h:37 ./arch/x86/include/asm/irqflags.h:114 arch/x86/mm/fault.c:1488 arch/x86/mm/fault.c:1538)
[   55.835783] asm_exc_page_fault (./arch/x86/include/asm/idtentry.h:623)
[   55.835785] RIP: 0033:0x403824
[ 55.835786] Code: e0 0f 85 7c 01 00 00 ba 0e 00 00 00 be 00 00 20 00 48 89 c7 48 89 c3 e8 4a ea ff ff 85 c0 0f 85 51 01 00 00 8b 0d b4 49 00 00 <48> 89 1b 85 c9 0f 84 b1 00 00 00 83 e9 03 48 89 e6 ba 10 00 00 00
All code
========
   0:	e0 0f                	loopne 0x11
   2:	85 7c 01 00          	test   %edi,0x0(%rcx,%rax,1)
   6:	00 ba 0e 00 00 00    	add    %bh,0xe(%rdx)
   c:	be 00 00 20 00       	mov    $0x200000,%esi
  11:	48 89 c7             	mov    %rax,%rdi
  14:	48 89 c3             	mov    %rax,%rbx
  17:	e8 4a ea ff ff       	call   0xffffffffffffea66
  1c:	85 c0                	test   %eax,%eax
  1e:	0f 85 51 01 00 00    	jne    0x175
  24:	8b 0d b4 49 00 00    	mov    0x49b4(%rip),%ecx        # 0x49de
  2a:*	48 89 1b             	mov    %rbx,(%rbx)		<-- trapping instruction
  2d:	85 c9                	test   %ecx,%ecx
  2f:	0f 84 b1 00 00 00    	je     0xe6
  35:	83 e9 03             	sub    $0x3,%ecx
  38:	48 89 e6             	mov    %rsp,%rsi
  3b:	ba 10 00 00 00       	mov    $0x10,%edx

Code starting with the faulting instruction
===========================================
   0:	48 89 1b             	mov    %rbx,(%rbx)
   3:	85 c9                	test   %ecx,%ecx
   5:	0f 84 b1 00 00 00    	je     0xbc
   b:	83 e9 03             	sub    $0x3,%ecx
   e:	48 89 e6             	mov    %rsp,%rsi
  11:	ba 10 00 00 00       	mov    $0x10,%edx
[   55.835786] RSP: 002b:00007ffd50b1e550 EFLAGS: 00010246
[   55.835787] RAX: 0000000000000000 RBX: 00007fee20c00000 RCX: 000000000000000c
[   55.835787] RDX: 000000000000000e RSI: 0000000000200000 RDI: 00007fee20c00000
[   55.835788] RBP: 0000000000000003 R08: 00000000ffffffff R09: 0000000000000000
[   55.835788] R10: 0000000000004032 R11: 0000000000000246 R12: 00007fee20c00000
[   55.835788] R13: 00007fef6a000000 R14: 00000000323ca6b0 R15: 0000000000000fd2
[   55.835789]  </TASK>
[   55.835789] ---[ end trace 0000000000000000 ]---


On Fri, May 09, 2025 at 04:01:09PM -0400, Zi Yan wrote:
> Since migratetype is no longer overwritten during pageblock isolation,
> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratetype.
>
> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype
> when a pageblock is isolated. It is used by move_freepages_block_isolate().
>
> Add pageblock_isolate_and_move_free_pages() and
> pageblock_unisolate_and_move_free_pages() to be explicit about the page
> isolation operations. Both share the common code in
> __move_freepages_block_isolate(), which is renamed from
> move_freepages_block_isolate().
>
> Make set_pageblock_migratetype() only accept non MIGRATE_ISOLATE types,
> so that one should use set_pageblock_isolate() to isolate pageblocks.
>
> Two consequential changes:
> 1. move pageblock migratetype code out of __move_freepages_block().
> 2. in online_pages() from mm/memory_hotplug.c, move_pfn_range_to_zone() is
>    called with MIGRATE_MOVABLE instead of MIGRATE_ISOLATE and all affected
>    pageblocks are isolated afterwards. Otherwise, all online pageblocks
>    will have non-determined migratetype.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h         |  4 +-
>  include/linux/page-isolation.h |  5 ++-
>  mm/memory_hotplug.c            |  7 +++-
>  mm/page_alloc.c                | 73 +++++++++++++++++++++++++---------
>  mm/page_isolation.c            | 27 ++++++++-----
>  5 files changed, 82 insertions(+), 34 deletions(-)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 7ef01fe148ce..f66895456974 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -107,8 +107,10 @@ static inline bool migratetype_is_mergeable(int mt)
>  extern int page_group_by_mobility_disabled;
>
>  #ifdef CONFIG_MEMORY_ISOLATION
> -#define MIGRATETYPE_MASK ((BIT(PB_migratetype_bits) - 1) | PB_migrate_isolate_bit)
> +#define MIGRATETYPE_NO_ISO_MASK (BIT(PB_migratetype_bits) - 1)
> +#define MIGRATETYPE_MASK (MIGRATETYPE_NO_ISO_MASK | PB_migrate_isolate_bit)
>  #else
> +#define MIGRATETYPE_NO_ISO_MASK MIGRATETYPE_MASK
>  #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
>  #endif
>
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 898bb788243b..b0a2af0a5357 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -26,9 +26,10 @@ static inline bool is_migrate_isolate(int migratetype)
>  #define REPORT_FAILURE	0x2
>
>  void set_pageblock_migratetype(struct page *page, int migratetype);
> +void set_pageblock_isolate(struct page *page);
>
> -bool move_freepages_block_isolate(struct zone *zone, struct page *page,
> -				  int migratetype);
> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page);
> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
>
>  int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  			     int migratetype, int flags);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index b1caedbade5b..c86c47bba019 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1178,6 +1178,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>  	const int nid = zone_to_nid(zone);
>  	int ret;
>  	struct memory_notify arg;
> +	unsigned long isol_pfn;
>
>  	/*
>  	 * {on,off}lining is constrained to full memory sections (or more
> @@ -1192,7 +1193,11 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
>
>
>  	/* associate pfn range with the zone */
> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_ISOLATE);
> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_MOVABLE);
> +	for (isol_pfn = pfn;
> +	     isol_pfn < pfn + nr_pages;
> +	     isol_pfn += pageblock_nr_pages)
> +		set_pageblock_isolate(pfn_to_page(isol_pfn));
>
>  	arg.start_pfn = pfn;
>  	arg.nr_pages = nr_pages;
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 04e301fb4879..cfd37b2d992e 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -454,11 +454,9 @@ void set_pageblock_migratetype(struct page *page, int migratetype)
>  		migratetype = MIGRATE_UNMOVABLE;
>
>  #ifdef CONFIG_MEMORY_ISOLATION
> -	if (migratetype == MIGRATE_ISOLATE) {
> -		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
> -				page_to_pfn(page), PB_migrate_isolate_bit);
> -		return;
> -	}
> +	VM_WARN(migratetype == MIGRATE_ISOLATE,
> +			"Use set_pageblock_isolate() for pageblock isolation");
> +	return;
>  #endif
>  	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>  				page_to_pfn(page), MIGRATETYPE_MASK);
> @@ -1819,8 +1817,8 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>  #endif
>
>  /*
> - * Change the type of a block and move all its free pages to that
> - * type's freelist.
> + * Move all free pages of a block to new type's freelist. Caller needs to
> + * change the block type.
>   */
>  static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
>  				  int old_mt, int new_mt)
> @@ -1852,8 +1850,6 @@ static int __move_freepages_block(struct zone *zone, unsigned long start_pfn,
>  		pages_moved += 1 << order;
>  	}
>
> -	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
> -
>  	return pages_moved;
>  }
>
> @@ -1911,11 +1907,16 @@ static int move_freepages_block(struct zone *zone, struct page *page,
>  				int old_mt, int new_mt)
>  {
>  	unsigned long start_pfn;
> +	int res;
>
>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
>  		return -1;
>
> -	return __move_freepages_block(zone, start_pfn, old_mt, new_mt);
> +	res = __move_freepages_block(zone, start_pfn, old_mt, new_mt);
> +	set_pageblock_migratetype(pfn_to_page(start_pfn), new_mt);
> +
> +	return res;
> +
>  }
>
>  #ifdef CONFIG_MEMORY_ISOLATION
> @@ -1943,11 +1944,17 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
>  	return start_pfn;
>  }
>
> +static inline void toggle_pageblock_isolate(struct page *page, bool isolate)
> +{
> +	set_pfnblock_flags_mask(page, (isolate << PB_migrate_isolate),
> +			page_to_pfn(page), PB_migrate_isolate_bit);
> +}
> +
>  /**
> - * move_freepages_block_isolate - move free pages in block for page isolation
> + * __move_freepages_block_isolate - move free pages in block for page isolation
>   * @zone: the zone
>   * @page: the pageblock page
> - * @migratetype: migratetype to set on the pageblock
> + * @isolate: to isolate the given pageblock or unisolate it
>   *
>   * This is similar to move_freepages_block(), but handles the special
>   * case encountered in page isolation, where the block of interest
> @@ -1962,10 +1969,15 @@ static unsigned long find_large_buddy(unsigned long start_pfn)
>   *
>   * Returns %true if pages could be moved, %false otherwise.
>   */
> -bool move_freepages_block_isolate(struct zone *zone, struct page *page,
> -				  int migratetype)
> +static bool __move_freepages_block_isolate(struct zone *zone,
> +		struct page *page, bool isolate)
>  {
>  	unsigned long start_pfn, pfn;
> +	int from_mt;
> +	int to_mt;
> +
> +	if (isolate == (get_pageblock_migratetype(page) == MIGRATE_ISOLATE))
> +		return false;
>
>  	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
>  		return false;
> @@ -1982,7 +1994,7 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
>
>  		del_page_from_free_list(buddy, zone, order,
>  					get_pfnblock_migratetype(buddy, pfn));
> -		set_pageblock_migratetype(page, migratetype);
> +		toggle_pageblock_isolate(page, isolate);
>  		split_large_buddy(zone, buddy, pfn, order, FPI_NONE);
>  		return true;
>  	}
> @@ -1993,16 +2005,38 @@ bool move_freepages_block_isolate(struct zone *zone, struct page *page,
>
>  		del_page_from_free_list(page, zone, order,
>  					get_pfnblock_migratetype(page, pfn));
> -		set_pageblock_migratetype(page, migratetype);
> +		toggle_pageblock_isolate(page, isolate);
>  		split_large_buddy(zone, page, pfn, order, FPI_NONE);
>  		return true;
>  	}
>  move:
> -	__move_freepages_block(zone, start_pfn,
> -			       get_pfnblock_migratetype(page, start_pfn),
> -			       migratetype);
> +	/* use MIGRATETYPE_NO_ISO_MASK to get the non-isolate migratetype */
> +	if (isolate) {
> +		from_mt = get_pfnblock_flags_mask(page, page_to_pfn(page),
> +				MIGRATETYPE_NO_ISO_MASK);
> +		to_mt = MIGRATE_ISOLATE;
> +	} else {
> +		from_mt = MIGRATE_ISOLATE;
> +		to_mt = get_pfnblock_flags_mask(page, page_to_pfn(page),
> +				MIGRATETYPE_NO_ISO_MASK);
> +	}
> +
> +	__move_freepages_block(zone, start_pfn, from_mt, to_mt);
> +	toggle_pageblock_isolate(pfn_to_page(start_pfn), isolate);
> +
>  	return true;
>  }
> +
> +bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
> +{
> +	return __move_freepages_block_isolate(zone, page, true);
> +}
> +
> +bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page)
> +{
> +	return __move_freepages_block_isolate(zone, page, false);
> +}
> +
>  #endif /* CONFIG_MEMORY_ISOLATION */
>
>  static void change_pageblock_range(struct page *pageblock_page,
> @@ -2194,6 +2228,7 @@ try_to_claim_block(struct zone *zone, struct page *page,
>  	if (free_pages + alike_pages >= (1 << (pageblock_order-1)) ||
>  			page_group_by_mobility_disabled) {
>  		__move_freepages_block(zone, start_pfn, block_type, start_type);
> +		set_pageblock_migratetype(pfn_to_page(start_pfn), start_type);
>  		return __rmqueue_smallest(zone, order, start_type);
>  	}
>
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 751e21f6d85e..4571940f14db 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -25,6 +25,12 @@ static inline void clear_pageblock_isolate(struct page *page)
>  	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
>  			PB_migrate_isolate_bit);
>  }
> +void set_pageblock_isolate(struct page *page)
> +{
> +	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
> +			page_to_pfn(page),
> +			PB_migrate_isolate_bit);
> +}
>
>  /*
>   * This function checks whether the range [start_pfn, end_pfn) includes
> @@ -199,7 +205,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
>  			migratetype, isol_flags);
>  	if (!unmovable) {
> -		if (!move_freepages_block_isolate(zone, page, MIGRATE_ISOLATE)) {
> +		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
>  			spin_unlock_irqrestore(&zone->lock, flags);
>  			return -EBUSY;
>  		}
> @@ -220,7 +226,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  	return -EBUSY;
>  }
>
> -static void unset_migratetype_isolate(struct page *page, int migratetype)
> +static void unset_migratetype_isolate(struct page *page)
>  {
>  	struct zone *zone;
>  	unsigned long flags;
> @@ -273,10 +279,10 @@ static void unset_migratetype_isolate(struct page *page, int migratetype)
>  		 * Isolating this block already succeeded, so this
>  		 * should not fail on zone boundaries.
>  		 */
> -		WARN_ON_ONCE(!move_freepages_block_isolate(zone, page, migratetype));
> +		WARN_ON_ONCE(!pageblock_unisolate_and_move_free_pages(zone, page));
>  	} else {
> -		set_pageblock_migratetype(page, migratetype);
> -		__putback_isolated_page(page, order, migratetype);
> +		clear_pageblock_isolate(page);
> +		__putback_isolated_page(page, order, get_pageblock_migratetype(page));
>  	}
>  	zone->nr_isolate_pageblock--;
>  out:
> @@ -394,7 +400,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>  		if (PageBuddy(page)) {
>  			int order = buddy_order(page);
>
> -			/* move_freepages_block_isolate() handled this */
> +			/* pageblock_isolate_and_move_free_pages() handled this */
>  			VM_WARN_ON_ONCE(pfn + (1 << order) > boundary_pfn);
>
>  			pfn += 1UL << order;
> @@ -444,7 +450,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
>  failed:
>  	/* restore the original migratetype */
>  	if (!skip_isolation)
> -		unset_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype);
> +		unset_migratetype_isolate(pfn_to_page(isolate_pageblock));
>  	return -EBUSY;
>  }
>
> @@ -515,7 +521,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  	ret = isolate_single_pageblock(isolate_end, flags, true,
>  			skip_isolation, migratetype);
>  	if (ret) {
> -		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);
> +		unset_migratetype_isolate(pfn_to_page(isolate_start));
>  		return ret;
>  	}
>
> @@ -528,8 +534,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  					start_pfn, end_pfn)) {
>  			undo_isolate_page_range(isolate_start, pfn, migratetype);
>  			unset_migratetype_isolate(
> -				pfn_to_page(isolate_end - pageblock_nr_pages),
> -				migratetype);
> +				pfn_to_page(isolate_end - pageblock_nr_pages));
>  			return -EBUSY;
>  		}
>  	}
> @@ -559,7 +564,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  		page = __first_valid_page(pfn, pageblock_nr_pages);
>  		if (!page || !is_migrate_isolate_page(page))
>  			continue;
> -		unset_migratetype_isolate(page, migratetype);
> +		unset_migratetype_isolate(page);
>  	}
>  }
>  /*
> --
> 2.47.2
>
>
>
