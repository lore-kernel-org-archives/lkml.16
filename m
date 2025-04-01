Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60022040A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743529473; cv=fail; b=sfputc8J8qaU3F0XJHios5pI4RXNsLV6lmJAj4sRF0XSAlOHwVeaqIF/E/BLVU4mZOi22+2jiqxVNPpX8MoDvCEqJ1eehSPTGpSfXcLHI5d4SXYC3l1bh/MoNH42YQByYyKhFpFYMslLmEdGJLukjFzWzwvqnaXUsCpx5QOjUSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743529473; c=relaxed/simple;
	bh=k3GMpJAYNqMhpsejpWrZ36lxglG/K5HLUY6VA+klY3E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e0MOoO1Et4OdInnb+72SRb0mvR08rhu2CahLZ2kel2OBReRxv6aMl+FMIyVUrIOQlOiQrWfAtDcslFrMj/BTPZmM5k8W7r8TYouMBVxYqqTFgT/i4fZABsBmLCET4u3cR8l8lssFIrGfAezre0v4O0DQuRzCsbeWgC6v6FYnAI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ONK+bJiR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rXSgx36k; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ONK+bJiR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rXSgx36k"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531HY0FD014412;
	Tue, 1 Apr 2025 17:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=bSJkdNircJJAHSe239iekelxOywDFUPPnfYxkALFmQY=; b=
	ONK+bJiRSmI5eWGTrVb6FVt82hQs8bfoTnLGD5AqILlzxBZZl2TwZuqd63WDIruX
	sUegzI9O8K6Ba+xQvOuiQhZoN8tikNag8gKwoxsaVxf2i2trnK/HdczNpU4jHyE7
	bpE8C9Ioxy67cyhgdg2GT2BXWeAuWaLQS4o4VPARtjCrFyYR7TYZJI62CAmPTRm9
	C2owJkFIJHparMmVpLROeQyl5RP4SkTOunOXZvCUM6DbIbyXgiW85KwEZtJwy3Qe
	U0rpc7T1BzM8krZprDIhHmG+CvUlvhy13QSmjEwVP47inXKRlRrL5ZE9QvGkzeqb
	s6KfsxUdWC7eSIqBhBbBMQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2937w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 17:43:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531HEVAX003382;
	Tue, 1 Apr 2025 17:43:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a9gcmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 17:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNCpUisMsOrYISWuQAx2tcNeBxBzO/cma66C4jmIK5wUvEBmZhkPpKzvxL3NUB6upq48Rnt3QIn926KscvcPIU+9V28Vt3/k4I1huYvnYEZMP4mbIQR/plaURp9cjKdhJ5cszdA+mjHuUWr2O2eFGu/MgSfwVgL86weXW9Ep2+wDyPrJmifkE5lpFxMC1klh4x9QspgA8+DQFhkwj0+qN99MSOI9VJM/jt8Oc6f9h2kdAJOC74yEqeh4XjokoZQqLbjG0cXTqrqvQlpwXrXJ7DXtPAx4chvVuV8aSgy+bOj463rSe4T1NaziMN8dIZDFdlzYnqDoeKvAooFydRPBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSJkdNircJJAHSe239iekelxOywDFUPPnfYxkALFmQY=;
 b=qQJCNV/ZYef7kFx57pXEcHjVbT6gzwyWvli/RKu6Vxs7nPtEal/ESgMUK5WxdugLCE0oGqZtSFLcNrIkHkvFkwhe/pCpMLwSQoQ0zfM20aNR6s+bBPt8YmVPSpoLYRvsUOo/55KbhD2Q44cXck6uYUm/+mJ0EsPxnCNLp3nlOiC7knl9GAfH97fotD/Ix9Bz2mirBB4sP4PRokgc4b7JwTnvCRbFxssmDZVtFwR1EQta9sv64hQ6YUUP5sc25MX/LpA7LAjKAfIlk28B1ytRR+z4KnVZc/J7H4OeLrUJdxAJUd9t+nSGbRAV/42pnLTyRWs1G1zm9OyO30Aqvu6TLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSJkdNircJJAHSe239iekelxOywDFUPPnfYxkALFmQY=;
 b=rXSgx36kZR97NcO6ifeJ3Stlc7VrZKYKmo9fq6xc/fxiSd3M7BJ6fR6lqKOmXkp5eXlQzzEuj1FalO7pHePwjXCYNdrPAuK0mHwEntyO+cGDhJTj4dCRMO96V2d01l+v3GbwxgypTiTnnSqrYaCM873C8Mi7jaKNZmH59FVdY2A=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by IA0PR10MB7604.namprd10.prod.outlook.com (2603:10b6:208:48f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Tue, 1 Apr
 2025 17:43:28 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8583.030; Tue, 1 Apr 2025
 17:43:28 +0000
Message-ID: <3286dc67-fa35-4695-838d-cc021582be8b@oracle.com>
Date: Tue, 1 Apr 2025 10:43:27 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2 1/2] sched/numa: skip VMA scanning on memory pinned to
 one NUMA node via cpuset.mems
To: Mel Gorman <mgorman@techsingularity.net>
Cc: peterz@infradead.org, longman@redhat.com, linux-kernel@vger.kernel.org,
        mingo@redhat.com, tj@kernel.org
References: <20250327002352.203332-1-libo.chen@oracle.com>
 <20250327002352.203332-2-libo.chen@oracle.com>
 <lx5ydw2yymartewho67aapj53sjfpnjlc6l7uplhefpnnettqk@x4hcxewigix2>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <lx5ydw2yymartewho67aapj53sjfpnjlc6l7uplhefpnnettqk@x4hcxewigix2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|IA0PR10MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: f80a44c4-67e6-4bad-40e0-08dd7144b636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UTdMT3JNKzMvU0NVc1AzSWMvQTE4WU8vTEkzbDdFUnVUWWRmbTJlaFdqZEpj?=
 =?utf-8?B?MS9UZVNrVWt5ZlZOcEt3dTFmWEM3VnhEVVhaUHpTVW5HSDRvMlFhWU5OMFFT?=
 =?utf-8?B?d3JCN2w4NjZqbTFoaHBWbGtmSUIrYmFlREd3Q1JLTklOTWErZ0lPeGtZVnA4?=
 =?utf-8?B?N2tHc2g1ZFpod3dvR1F5Zmh5ZGJaK3ViS0hqVlpMU0NQczF0VWR5QjUxNVVr?=
 =?utf-8?B?NlBHdkh1RU9yUkJXaDErTHh4RlhjMWRxNUNrS0IzT2orTVFwL0VETzhCN0hR?=
 =?utf-8?B?VFJncmlIeUVtTm93RC9zY0RDNWN0aHQyQ2praTREWEF4VzdOU1VENWRSUjBV?=
 =?utf-8?B?TlhDcjRzOGNYSkp6UVJHNUdkNUZBRXlodFZXcHVCUkxiMEpkM3p3Q1d0SVlW?=
 =?utf-8?B?RHNkeGcwOURhaENTdzhhQ0ZvNUsrZWY3NHUzZGIzZ1JRNFB1dFY3VkVWaWdX?=
 =?utf-8?B?cU8vWnZTeUkvY3RzSC9USzBHcVd5NWtPZnlucjNTSjlQenUxZG4wcUpONTBC?=
 =?utf-8?B?a1JjT0JLak9ySU9jUktyaE9Nb3NISGI2c2xlZ3pMNDFHekpIRjd4ZTNGbHpW?=
 =?utf-8?B?TzNGWWd1UG9RYmFXSDZzaUtnQWdqeVluR0tOQ3NVTlI0WFFGSFRsTS9BSm1u?=
 =?utf-8?B?N3orZVAvbDVMZDRVYW1Obk5QdnUyU2RFN1pOdWdneUV2bGsxWHFsejhsbHdR?=
 =?utf-8?B?N1dNd1M4VDdRR0QrT1VrMC9xU0NuZjMxdjVubWRETHZNSktqdkxibHZlMFdz?=
 =?utf-8?B?Zkx3d3FJUnl0cGhLZ0hTaW9uQzdyeHowQUswQU5wUFNvUDV4M3FJb2xnazJO?=
 =?utf-8?B?cVFMeU10OFZJODZhbzlqSWIveGhIODdvM3ZpaVBtYTlYMmorNXBybzZiQ1hn?=
 =?utf-8?B?N1JCc0hhZFV3MlhKOXBhUkxYRENMWkRETHJjQ0thSUkyMUtIbmd4N1ZBVWN1?=
 =?utf-8?B?dDJGUmFJdFhzeUxkbVQrY1Bla0o1SnZ2OXo2ODBrWkdrcis2UG9taTVNT0JD?=
 =?utf-8?B?aDNsL1RDU2k2MldZcnRMbmxVODVmdUZZQVdwMkh0NlhwdDZYazNQbHgva04v?=
 =?utf-8?B?dVZxNERTQi93S28rdGlSTVY3WS9ERkFtaFIzdjhZbmN1UkhJY0VnWUhSbkQ5?=
 =?utf-8?B?V2xnUnV3L2FQS3NHd3NEUDdRb09HamM0dGdWcUtudk5jb2RPazEzRFlUT2NM?=
 =?utf-8?B?ZEYzRFVoMjJlcmwrUGZrNkNkU2VNZDVUbWJOcFRtT2xWbnZwOXZIenNlQXll?=
 =?utf-8?B?bWJ5ajh4cU1WdWlXU0RjRU9SOXVVT1ZBcEVXeFo0MituL1BhS2RwL1pMTmps?=
 =?utf-8?B?dWpzYkI4UTRBWGhZZlpzUWxaZ3g2TG5QQXg1Y2U3RUFTWnhmcTRnRm1xZklw?=
 =?utf-8?B?YkxHbDBZQmU0ZXF2QXppVUdzbHRHandwTzlCdjhqWGxZcmhScnBVU0U5NGpi?=
 =?utf-8?B?TlYxeWFvNUw1dTNNdG1BbG1FanQ3bTRCcGxDemRtdWVmdzRwbEgrY3l4aE9r?=
 =?utf-8?B?SG9TQjVlNDNuZjY1SWt4NWs3YU9yTHk5QjVnQWNROGxiUWdkdm9DelpvTmtB?=
 =?utf-8?B?aDVDOGJlRU8yM0xsR3dzNFZZNnFzckRHK3hKWGt4ejlSVkxOcVlUaklOVGd4?=
 =?utf-8?B?TTR6ZU52Sm0yNllXckoyUGgvTE5PQUpaZmJveVZXVzROZFJzWVJxSFYyU0U3?=
 =?utf-8?B?OFFsV05CTUk0T284Zlh5YWF1Skx6alF3ZmZENStOdVc3KzFMWUl2UzVvNDVw?=
 =?utf-8?B?L245Z0tXTWM3V2t1ZDd1MFBGTHZudE50bzMrdUtmTFdSR2xrRUxLOEdpK3Uw?=
 =?utf-8?B?TUFSYWNWM2o1UC9aNzJtbUVqZUlFWm5hVm5XWkRqQ2FwdHZxMGdyNzZZTGN6?=
 =?utf-8?Q?e4D/mcmYoRLEi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjI1bW0xNnptcEg2dmtpSkJaVHJUTURUOUxWRUh6bkJqVmUyMTlFSXlzRmVa?=
 =?utf-8?B?c0gyY1JiUEtRVkVxM0pTeDdTT3QySXJ3bmdtbCt6Tm84YkFsWS8waDZXREtz?=
 =?utf-8?B?SXBvU3ZicDhibTNtTjZSc0R1ZVBLemRmUjhRU1lOcUJVdHVjaEZQZE80dE9s?=
 =?utf-8?B?c3Z0QnpJaW05MllEMmR1cURBL0pjZzUxMWZCeEhETy9wNllJci9TYTdiMFEx?=
 =?utf-8?B?cy9tYkE5bEs2Q3lPcjhrUUlud1cycHR2ZGlmb2lObUM2a2tmc3pwbmE5R2sv?=
 =?utf-8?B?T0pQZWt2Qk1ieFU2dm9qOU9zL243cWhxek5WdFJmQ3pMaEdJWkQ3b2ZMRlNS?=
 =?utf-8?B?NkptYk11Z1MrdU5OMGR2MUxESVdycVRlcFVJbkZ3SU95RmJ6MGwwZ2F1RWJ0?=
 =?utf-8?B?S2ZaUDRiZC9QSVpLbCtvVm1HSi9RK0pxcXFxUGZNTGtxWWZZdy9kMFQ2empt?=
 =?utf-8?B?amlKSlMveFgyc0tPeEE2Y0Y3U0FZU1orSFUwZC9peHByRmZZL3M1RDF6ampD?=
 =?utf-8?B?SzZnakVOdEl4TmpEak5ETzVZZ3UweUVkRitESmlTNE9FWjdyUlUxS0ExdHFm?=
 =?utf-8?B?QkZyMjU4NmFtdzdoazRQQzNJV2RxWGlWN0djT0l6eUFMM1ZVTUlWRmJ5QkVx?=
 =?utf-8?B?R2J4WElwbWRycE1XSUlBVHd5TmQ0amRFVVVBczlSbm9KSFFIQ2RSSFdNSHZm?=
 =?utf-8?B?Z0JLM216VjU3OG5BeW00Q0VFQzRBVk9YY0hDSGl4RWRqb1JOUTZmV0N6Y2Yv?=
 =?utf-8?B?VzQ3UGZleGNrQXAvZWhzVGdDNm93ZU01MC9Lb0NXYTVCQ1JxTGpSbE1RYVdk?=
 =?utf-8?B?bjdBeVBIbkVFSzlBNU8waEh1M1h2SDNEZXIzMEExVUtZV3VRREFHcHNYcFND?=
 =?utf-8?B?V3ZUMkFnQmc1ZnJGeWhjaFF3STR2S0xoTk1zL3VHVUpKRmtFSit2SUhzS1JP?=
 =?utf-8?B?NEV1OFlnVTZzazZGVVJHbUUzUXF2K0hkK1U1SlhXNUZkSlpoTVJwMHVhMGlT?=
 =?utf-8?B?N0tBR1ZabFRXd3BXTkdsSDV1Y1EzblMzQTE3Y29DRFZUZ3M5WlhUd0xhdWlF?=
 =?utf-8?B?M0xaVXBqQXNOamo0UDdtMnRCekJvTzhTdDBQMnZ1eTZYbm0zWmlNMHl6alcr?=
 =?utf-8?B?cHd2TkRoQlBSWDJRM1Jrc1ZWb1JJQ2JnKzgyaTU2T3RsNVJJdmIwVFBPS1Zs?=
 =?utf-8?B?dDAvZlFJMzcxejRhNkNUU0VxdTFnTUJNY0tJOFlDNVVJWmNVU0dLZ3Z6ZDJr?=
 =?utf-8?B?Q0tURndGNThGdlBKYW1CbFI4NkpScUQ0TDg5a1IrMEt5ZktVOU01ZHVyNG9Y?=
 =?utf-8?B?OFpEUjk5U040Y0RhTTFabmRycXNQemM4SndmTGhaSTlqOHBiWVJ3aGZrdWdQ?=
 =?utf-8?B?bCtxSjFXZHoxbnZhbXYvWTdlR3o5Mkh6WEFPMGUxVHo3MmN4NDBETXRzcW9E?=
 =?utf-8?B?QW9EaGxHUjFOT3NjTGpocGozTzZtRzI5aEpHRzRPbHU4NWtXNCtmZjllL2Ny?=
 =?utf-8?B?MlYvNWNrUGY2STB2YlJ0NFRUT0xmeWZsYXhSaC9iUnZRQWdpUVphQmIxK3F2?=
 =?utf-8?B?cnFwTm84WlpmVDV5b1hvVk5VemlCbVFha1JIbmE3c25lbnRXbGp3VVVyblE3?=
 =?utf-8?B?Q0NWSXFzQ2VLLzBhemVGdU04VWpDeVpublVvWmI5cW1sZ0NKK2RFc2FrK0Zk?=
 =?utf-8?B?N0RKeEZHYTg0eERHRERjeVpHd2hKekJ5VG8yVmJZYy9sNFMwa3c3VzFMVHRR?=
 =?utf-8?B?YWxidkg4MnQ3SitscUN1MFZSemVvL1d3UFExUGV6U1psU0hGdnN6eTllclNK?=
 =?utf-8?B?MDJMaUs3RXp4R2swZFFtMjRZckJzMUFsdjBRNXlLMnBGYS9nOU5ZZ1liZ2ND?=
 =?utf-8?B?VUxaOGp5cWdCcWQyTXFqc3N6aEZFZVpac2ZNeVdjRS9vYzF2VjNaU0l2SVJQ?=
 =?utf-8?B?dzFralExRXRsWXYrOHphV2tqUExOcjQvT3hJY3N6MFNiTkJCalJUaGdYdmNi?=
 =?utf-8?B?eEhVbmFEYnFnZ0EycGFscDcva3cvSTF3MlQ1cWtXd3VLeGZDZXdqYWtRUXZy?=
 =?utf-8?B?S1FFYW9oUmhobW5CekRXNmtCQmJzU0pyMkVZMzQzSEQzd29jdk5PSy9ENDhL?=
 =?utf-8?Q?DXNX8ufQ2LllY/ampypKvDIgP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PClG8gy6fyZ4JaFERQVpBC87ZKpv4pkRA5+XNeVVbZtM4dVTBBxYIZ5a4tC6rMmn4SpX7eQuqX8xggiD4O7i3319WOEqp8rgp1CGLZLd0D+AR5jpfmP90ggVHNkF37VU6OmLvUNgigpVRSe8Tm1MzJoQQUg/GomiLBcg8xW7dq71nxI7W5JvS0bN/vkcnZ27Sc2sX8B525n/olpf+SCToGY9O+wfkd+eVFaIx1LALtujQ0TNB/HmYx3p4+yvk/bWXjb/7nVy/984PcuMkVOU9L1+HGyNPTPzTSEJXNCCkqQy9iXyc8X9pqxQSRoGpQN4ajnyjPqizsrsnfsX7tfcBe3RXGHUve2EpjBcRzHaplTpkEcspbxweFVwdTTHVwZqDxwRpTM5/OroxwGUgCXcYKq8NimpdHyuWnUZwfIntgwnjmGCiWmk/DSzs+7NQPRr1SzOcnX1EIIpRA3AghaLrpqy15NxLX3Z6ORLM63CAkpXtiNwP4/3D8fO8Er6V/tnhAjJTqN5gGVkxPirHE7FV3ddCQvLxSSqJy+3wIdDUU0lbkwBxSMz9IXT0pxBj5GQSkm0V9gczCbFrKFc/SCcbh5MktcloHB6zBMoAh0iQ1A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80a44c4-67e6-4bad-40e0-08dd7144b636
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 17:43:28.7850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f5QSQp5Hrxib0LeTRy0XAg+4cVaE8VEy0wqGA+RKmVowQvF6m9WW8Co6iMQB3Zj0YwgL7gIbFEU9vY9Hz22Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_07,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010109
X-Proofpoint-ORIG-GUID: z5rT0qw5UGqlF6IN_b8GsST16yfc8ycs
X-Proofpoint-GUID: z5rT0qw5UGqlF6IN_b8GsST16yfc8ycs



On 4/1/25 06:23, Mel Gorman wrote:
> On Wed, Mar 26, 2025 at 05:23:51PM -0700, Libo Chen wrote:
>> When the memory of the current task is pinned to one NUMA node by cgroup,
>> there is no point in continuing the rest of VMA scanning and hinting page
>> faults as they will just be overhead. With this change, there will be no
>> more unnecessary PTE updates or page faults in this scenario.
>>
>> We have seen up to a 6x improvement on a typical java workload running on
>> VMs with memory and CPU pinned to one NUMA node via cpuset in a two-socket
>> AARCH64 system. With the same pinning, on a 18-cores-per-socket Intel
>> platform, we have seen 20% improvment in a microbench that creates a
>> 30-vCPU selftest KVM guest with 4GB memory, where each vCPU reads 4KB
>> pages in a fixed number of loops.
>>
>> Signed-off-by: Libo Chen <libo.chen@oracle.com>
>> ---
>>  kernel/sched/fair.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index e43993a4e5807..6f405e00c9c7e 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -3329,6 +3329,13 @@ static void task_numa_work(struct callback_head *work)
>>  	if (p->flags & PF_EXITING)
>>  		return;
>>  
>> +	/*
>> +	 * Memory is pinned to only one NUMA node via cpuset.mems, naturally
>> +	 * no page can be migrated.
>> +	 */
>> +	if (nodes_weight(cpuset_current_mems_allowed) == 1)
>> +		return;
>> +
> 
> Check cpusets_enabled() first?
> 

Hi Mel,

Yeah, can add that but isn't a bit redundant since nodes_weight(cpuset_current_mems_allowed) will just return #nodes which doesn't equal to 1 when !cpusets_enabled() and there are >= 2 numa nodes? 


Libo
