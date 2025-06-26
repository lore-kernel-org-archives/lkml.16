Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA72F1FF6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914408; cv=fail; b=DdNb1ODgUs0YL85zcImdwnP40LrElndtYquX350ge4WdUtsqimF/yg2764ubYtC9okkw/94jb3aIjYk8Q1uek/1DkVY07YMQs0PBzUacJtq+3aZPUSzUgsiVljuiXVsOYkxcsVuZqiWPEcck6NnT+ioXxNTbuavkrV2cKRNs+X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914408; c=relaxed/simple;
	bh=40VbZNzORx9t+T2LwlK2qoF38LOOI+qxlAIo0tZ6c1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XqPOZAbUDPp2xDVAf17AIX5+m4pgpKLtyp9NxSzvUzyeCpAZNas8hU5VvkFFelR69SP6Gm0T3B6giuPZzau5j9h0feyYsD5xEojJRf3zVI2kGFQS0+tdMDFiBWJg2w4el/YE/0TWhA5KWeLT5PQ+CV9JsEjkgJoLGZRexfNroJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ODMzUif4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XuLsHnZf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ODMzUif4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XuLsHnZf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLBofM018290;
	Thu, 26 Jun 2025 05:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=40VbZNzORx9t+T2Lwl
	K2qoF38LOOI+qxlAIo0tZ6c1Y=; b=ODMzUif4EbnarYtp8vZnwkvHi69USwISi4
	7lo37Ab/n6pd8REL/T6wUrEvZDbewhuHi9q62atEJnGg92I3POW23upE7vr+0hch
	XTEPUJR4ZYWrOiM7cHFW4ttk8JOJQ3nz0kcak2w4dLns29CMWmvZxbO2ac3GOuw5
	kTvbCBK0kUCqGhRfOGgZU//gSLDoad8mdTAia7NGu/Voh6gN5TwOlGebB1iH1MA7
	DmKZ7hUR4JUXaJpex5NkB7bI4Ib/RQaEtmDvUdtXtzx5ZiEyyKhUTl4+X9sfIXAe
	4aWA6AfDtnPjgvM56a9J5tiyMyFkb69KqCh0nqaMaUbAxKTO8jvA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumqyk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 05:06:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q2iEJU037799;
	Thu, 26 Jun 2025 05:06:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq60e3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 05:06:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8cTHR4Y5ppbo96N+SxY9gzOG/vCjLtGattW2TWPBo3Crh/MbqxeUZ9cvyao4zhM7iMuH2jdZkPfumbnHQF8rtgT+7CS/mMeVxQmQPx0v7fhHvld8L9dDHMUcFuUZb0aQnKwI5A82brSDMmLqzzG27gHY4Iu1Jtt3AX00a7ZCGqvAk2zjozuXJIACxj3S4wdFCYSQhV2PJ3RaRXjzKQ0Sq1bxWdYE3Su+Tu+A10eEtmgmhZLkQ0Kw2QP4Q+DcRHIdafPiMTDtZ4TdmZcfykhzTT09kHkCDaiEQd98XPyGeNPPfccqntQ0+x0I7kEM8YceYx6D5NPnSRUUMw71eJohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40VbZNzORx9t+T2LwlK2qoF38LOOI+qxlAIo0tZ6c1Y=;
 b=jDdydbLsS+0bYfrZS4W4Rihx9LeYBdkeba2rssYXB81+ySBfjAqlyJ0PzA0e1bFoYLpRwF4Vr/8yxDZevF/mT4YTDLXNaFON2lxv7T0vPtnNvZ9AcQCNGF9tCoUaU6EMzyTgJUkyFFgYJG4hMU6MHmZIRi/e7/6gEm7kMtGeClcUqf9uCB7/HZ9lEAqEt19mWDGgGA0kYUE5ZP+EXJ6b/tKlKKtryLJoCLXuuyhkJVOOX2r1ePB5z7BsLxvlPEshG3yfiINnp8m7FsFhxMnVAex0h7X2xY49KPCt4h9MfNZ57dHz2zmd14+ocJVIJ3IM47Fw4RTKRqMHOB5ZRq78XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40VbZNzORx9t+T2LwlK2qoF38LOOI+qxlAIo0tZ6c1Y=;
 b=XuLsHnZfb6dRsXobdPrCGpcYq21agkxp+ocRgGCw7Q9zgkEx5DKo/5RacLnaMg34VmOTz706oIyFOvoz+o51KFhOiiKubEFdYGt56KwWIWhGG20wQfoKstXgFQzFf16GDSKZeVwcRN040q5XzA67BEt+nK/yVmUnsOJji0xypic=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7856.namprd10.prod.outlook.com (2603:10b6:806:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 26 Jun
 2025 05:06:28 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 05:06:28 +0000
Date: Thu, 26 Jun 2025 06:06:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
Message-ID: <d6cc7b01-d218-4f4f-be89-e3805fa7adf2@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
 <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
 <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
 <1ce8408d-32b0-469d-a560-2e0050cb91d2@lucifer.local>
 <561b17cd-ad82-45ca-aba2-78515873ebb8@arm.com>
 <f3b2ae95-cc0e-42a5-858e-a614578553a6@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3b2ae95-cc0e-42a5-858e-a614578553a6@lucifer.local>
X-ClientProxiedBy: LO4P302CA0001.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ba74f3-ea93-4d48-5916-08ddb46f34ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WN8jxgbVuePDUl9+X0oKtPhhrS4qaRdws7byUd5Xw0vHDLvFO+XgeVzPyTn4?=
 =?us-ascii?Q?dk7KQhKoeaiEnliXgoGkTCYwTzlwSxcro8gutdHVDqVM7zqIt2Pa8AGT8K0A?=
 =?us-ascii?Q?ysUm2gK4zGhXQEtAi5mMP1f/6AQ+2GwLQCrHHkUjHJLMrHyybDP0dqKSSN9h?=
 =?us-ascii?Q?VDWbauL0YbW/rLavNnQyCSFRplsL09agTc6z9u3pFjpNAVf+S7MQJALlRTaM?=
 =?us-ascii?Q?ISVeP8x8RGIgPnlDSEM9kL6+8F/z7SjCng5a9pQTtyRzt507YD7OLOP4aVp1?=
 =?us-ascii?Q?1jJ+feIAMVlr76auuq2WuxijK6991YiuQwMKAzuOw9sjrzqsAHMIm3J5DO3c?=
 =?us-ascii?Q?VfMs7+MFmhfb73Cd2eUJT4TnMzgrdhW3HndkfgiNvNuASaeRG3V1C2dCc5we?=
 =?us-ascii?Q?IGveR7pSYMLwGsO0WNuw0AjqIvC+5iIy9o9OI3XYUunN6ffAvkqAvpF2z/8x?=
 =?us-ascii?Q?+ohprXIdtUSUGsqDMM5H5G5zhp4NZ1fwYzXxRVSCZvkUg2fO+ajgjiH1nxvS?=
 =?us-ascii?Q?hRy1+bHOjQUK3YjVXDzenAiL0rNniq31a9gqE9YgQPaNv87lYTJFeBXGE5r0?=
 =?us-ascii?Q?teyB2dgT6ETSH9nhk80Xezs6yzfF/Hu9pDCFIamLpMSczu8iezSHdoOVLOQH?=
 =?us-ascii?Q?Mh2eq83cyoCZvfOzXvRs69JXVfOc3X14zNE8vbLz5A+4SMr0VuXMC30oocZB?=
 =?us-ascii?Q?fMarSOgIX63E4gSbCgkz34OEzHe5nzRowaJKr3hIf10ZpKQBwPJ90iZyr/RO?=
 =?us-ascii?Q?3yX1UyH0Bs9D7v4u7pObSTFsS5TjGXXWY965eVN95E0n+rnuDNytmnLRQYmV?=
 =?us-ascii?Q?RZO4QythEOJACGVGExH9J0L2xj98+G7oTqm3YhVzqGlCtfDkgGO7uZ5H/w1S?=
 =?us-ascii?Q?fXsqUbhPK+6fe3wMqrCpk9HnDeEUH2ADAfJQRDmZl/cCxe4hXPjG3oa98yvd?=
 =?us-ascii?Q?G6vZLwe5U68dlpYiV3cSLe59+bl9PzpB9yApgDkszVmUcoP214nl1Ccmi1Bb?=
 =?us-ascii?Q?pcL/zXpGmORYjylGHwajqo2Bt2byhRUlZ6/l4/Riz4Gf1eppz/+iKFUF7/Wh?=
 =?us-ascii?Q?Dl0YaPhul5JD/A16WGPSk+j7/pSOELCUPB4I6xBCXm/6LRdgbfUniPJYhjjm?=
 =?us-ascii?Q?pxF1sAdOB99WmFESm8dMhYS2ep8gqPcXSPNqNYgUbqOpM9BRxeUgp1rkn+2Z?=
 =?us-ascii?Q?yd+LBq6/i2596lHss4A4aZF95ut04rJ6yPmU9NODsrZHy8dFjT4Gsm0+km/N?=
 =?us-ascii?Q?E6+afxQQb3tjeYxLD0QZl7ZYrJVvenKKn6sSN2q3p4a5yGe10oxg6BA84FDG?=
 =?us-ascii?Q?RfpHDbl6sEdsZONVoVhOZWOq9UsYrM+P+JvdSZRtspaHqBZBWKRgXgJaDVkS?=
 =?us-ascii?Q?aax+SqIzjJa4nloCFSpitagWZkTzxmYvhTDZAQyY2JqdNuC270SX97KJKOmf?=
 =?us-ascii?Q?WinQyF5ib0s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iy2N3/RLUoeeWpvze27+E0e/bMBaWFOBbNG0+WTpdhxbantE/8I1ewdziQ9H?=
 =?us-ascii?Q?9YqjX/roPVvYcm+M7ooHI4S24MoiwMThX9m3xKfsgHdXD3/ox+pzBw61Ad2f?=
 =?us-ascii?Q?kpQME9/pVvk848i6MaHu6TvyI4IxvnzPClgLC15I//SzMV281YyqVNoB9TTR?=
 =?us-ascii?Q?iJ0UyL7BAn1/mnj2dXGeOIhCKYYKiUyaD9QZgj6N8DN69FDlK483IuYVExtb?=
 =?us-ascii?Q?oq4igIJ6p+V2S38NYW9ooUhiXVV5kWiKdbVSbcmiuhlJ8oCRXwm/fRkA0QsI?=
 =?us-ascii?Q?DHWYvD1uX5Ovk2pEM14anY/Tx633u4A8SLE88R1LP7mN6TJSQF5lkjZ4kWTo?=
 =?us-ascii?Q?dhJ8U2BGIIQ9niMF6KNnOqEhL+zqP1OBe/BMlGe0KDfaC3no2j0BPHG1CqJw?=
 =?us-ascii?Q?TAD6m3ankJWrXvQN4ijUhdGHN2rd27IiSEv3uKBrEJ78vsH5n6XxfrqDjlTD?=
 =?us-ascii?Q?8Ry42foXX/4EZIoMNXNJ8xrlV/faR4eKBubWfep8NRZtLtfq5UKnAFgvEC7s?=
 =?us-ascii?Q?mRi+UcvDu5b+BD8lQ5qZJDwKIIhtagKGelELvCogZYO8tNx5UqsBCdyVV697?=
 =?us-ascii?Q?CxJsHXYO+HckggKcoKZHpjPTZmNp7ck0JQiPjN0n/aUz8rkw4Si0mPsTrumR?=
 =?us-ascii?Q?e+4Mh/H8OcApzlrMNsU/YVnPPvtz3uoma+PxwP6ilD9T+C2+/zC+aFnPZBoZ?=
 =?us-ascii?Q?NyG+BaAh3m4A7sU9wLKLk7+PFoQVpVm0Fc02nGOXILvaRxUo9XylbJ12YPEg?=
 =?us-ascii?Q?+jPTY7HKh75ptuVjfkNc4yZi999vVYC25Em3219sXHEsfDshFhROnRVCnXKy?=
 =?us-ascii?Q?znqb4bmwavuavoFQDTCQ771bvuxPX2cef59+h9wt00WW+wP7qZHbTXda09IC?=
 =?us-ascii?Q?RFGvSenve6iK2xo4BFCg69MTzLULZjIu0kw67IA5yp02VTeBAV2+aIGuQJz/?=
 =?us-ascii?Q?CpWox//DsPkpS3oFTSlfWW3K8yijtuztz2F0D6dGfrfSeG8v9bKW3A31DEAz?=
 =?us-ascii?Q?GhTjZW6lxLBFkTNgylxOBNRieFHUymt187WXBawazfMpE1IepU011jiZ7ddO?=
 =?us-ascii?Q?Xqvoe8o5g281QyC9xdtXnsanSCxrRA4cbeEhESDUcZ1R1T1QtmtSwIgoSg1Q?=
 =?us-ascii?Q?d+WJ1ZL1AMvXR3u/iiWoV3qHo9JxRUtNip4jkjGebnaVWiXEwPT4g9Cw9j38?=
 =?us-ascii?Q?LRwcaOYQTObvzoptYy6+ZknJPwmDIkSHZIB+axyHYl1Ze1L2X7M+sLZzEOjh?=
 =?us-ascii?Q?kitEJnxMlE7QaH5H/oxevsUqHD5fT1twt8LwJbZMcmXsPhj9IUaak0bRg1Fe?=
 =?us-ascii?Q?jRoQhnXF3dbZpmt001WaWMi1Ik0ZSQizr0tclyXlO24WDyoV+JTp4oG2ZWkx?=
 =?us-ascii?Q?gXHycqf++O3gLu/kTJXnz5/uBXbY6pndUOf2EAgn27vh7tFcRgcCLJzgrZra?=
 =?us-ascii?Q?5nx7zRH5WCV0iEvmRBXm+dlbFiCrgDArGvQb0NJoYwepmp2Armb200IPNSss?=
 =?us-ascii?Q?EzrezteYMIr2HgsqGhEggtSsHJr6M7EDFSYptHPKREQw5oc2SUuXJvpB+Iqu?=
 =?us-ascii?Q?ErGVIvjjTmOLXvv5t4iWPbBxDqkxBpSIz8k4GdiuGRQGh+rGr2hb6RLydSCb?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O7Ggk9JELdJmTb8QByFDA97ByDdQLz4/OMLzS6CX+j1vR34/LE3FGUrkvC6qNJYp/dK2vw05piugZiwTsX8MX1MEp/aa1arCUiFfzfSocBIzwlqhQgSSE0hjuT9jI7ewN/saSxFxrG2tr0ayaK0s7usawH/GAWrqv4gkAyLwLuUTHj6McJ4F4CZ9K9UEvAOaryMSdDAOkRb/FCY5xqrdDsKfx9W6/6cXN3gKGStaMDQCJVBmpTQRSUJivu5ry7C9Jr/c/SmoGHOAEDVr6NJR+0ay31s9A/nOF9UZ+ylUMdlhigwN5ylztO5ipABeYnT5SgBOckvrZVLZL5o7tfCnpf3PnksQgEFMdIBnDyE/0qacwidoXFSNI7tqFbnlwqTgJw/T11IG0N4HODezQf6UFBAUFtnpaphwTn6PGtDoRSdFKPFY3vTbYgidFYCxiAiK32xsMls7X3OHJpTOVqOc8B0h0zDBAuD4yMmfWVdxtkdbcizslYsHGzMmIJH2BSjE19gheOoLTnP26laqUBbDA0S0AENwVac+DTQJ9sQhOsE57Gjvkef0wJgw14Z05kHhGsfJVVtiWh0ZquYDxZiVPxCyc4MhsazW9zz2TR7BmEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ba74f3-ea93-4d48-5916-08ddb46f34ed
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:06:27.9922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ymL1Cp5N9KmiBOo413utYuBXPQRTIXfXzGzNeNSRA29y8lZ1RxNCKgl2q+cTScO9jsPgidLdEwEmhljvoyHomo7WcusbYu0gjRnXHaKsgeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=792
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506260038
X-Proofpoint-ORIG-GUID: NiXkS7gOUA05iIFDpvvEojdUcKGn6W_a
X-Proofpoint-GUID: NiXkS7gOUA05iIFDpvvEojdUcKGn6W_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAzOCBTYWx0ZWRfX6R0MglGWScEy ind92mn0IIMXY+6OWSgeDl3m8caLVZS2G5K96LdsHhkQfkzKPDdu08NOZvhXZqkgPdqD+ntJSWf hs46kp+uhy7538abkz4MyLB4K/lh9yPGV7F3469TPWKmYTdhHCJJHU+vdDd4dG47CGcmxtRde19
 gZdD7faydzEleDC+UsrV0yPIMXQLoCrqfkJYgE+w+jXe441DeNcZ/mAy14amCEgNCBzZZzD0fan sDyeXpHcAUQ4dKiOgZ1yFJ6wnkiXVqRtISR83EEBg3Oau6f54+sNC8hZt+a4Yd3cZZJgTGfv0qR NbsYNpl++J0tZLvYR+yEwyZzaOdVzgEPYZm8N8oMk1I+XgUPmFrBzJPfjyozs9opkPuGjpK5Sg9
 9hrs2b6Lqt1JNO7dpcNxOZeqJijLLMcjl8I9m4q6qkAENtDp0nhRjDbnb3rsuhzPQvY5Feiz
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685cd557 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=6KtbbZ86gJyhckCLVmcA:9 a=CjuIK1q_8ugA:10

On Thu, Jun 26, 2025 at 06:02:25AM +0100, Lorenzo Stoakes wrote:
> On Thu, Jun 26, 2025 at 10:29:22AM +0530, Dev Jain wrote:
> >
> > On 26/06/25 10:27 am, Lorenzo Stoakes wrote:
> > > On Thu, Jun 26, 2025 at 09:22:28AM +0530, Dev Jain wrote:
> > > > On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
> > > > > On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
> > > > > > Suppose a folio is under migration, and khugepaged is also trying to
> > > > > > collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> > > > > > page cache via filemap_lock_folio(), thus taking a reference on the folio
> > > > > > and sleeping on the folio lock, since the lock is held by the migration
> > > > > > path. Migration will then fail in
> > > > > > __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> > > > > > such a race happening (leading to migration failure) by bailing out
> > > > > > if we detect a PMD is marked with a migration entry.
> > > > > >
> > > > > > This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> > > > > Hm is this related to the series at all? Seems somewhat unrelated?
> > > > Not related.
> > > >
> > > > > Is there a Fixes, Closes, etc.? Do we need something in stable?
> > > > We don't need anything. This is an "expected race" in the sense that
> > > > both migration and khugepaged collapse are best effort algorithms.
> > > > I am just seeing a test failure on my system because my system hits
> > > > the race more often. So this patch reduces the window for the race.
> > > Does it rely on previous patches? If not probably best to send this one
> > > separately :)
> >
> > To prevent rebasing headaches for others (if any) I thought to send all together.
> > I'll send it separately if still that is the preference.
> >
> >
>
> Oh actually would it be a pain to rebase given the previous 2 patches? Maybe
> leave it then. And I can actually finally review it... :)

At the same time you'd have to update cover letter to mention and it's really
not good practice to include unrelated patches to a series.

So probably best overall to send separately but _wait_ for this series to be
merged first :>) then you can based it on mm-new without problems.
