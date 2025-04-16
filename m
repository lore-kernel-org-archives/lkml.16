Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90376156F20
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808403; cv=fail; b=f4MeTipMYooNyqpSddKSHLhiSlCKi3aQJVzcV1ovnSbVRqH6zJ6vuU13VauWZUXxJVzhCll6nSeMwZfRP7jYzQrBu7Aj39dU7IlIEeVI2AX4GZNbSMlhE6u9QItYASksNonpNBqrhdlamjXn5nbv/QCyXMZfF4kS+vS8ta1bz80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808403; c=relaxed/simple;
	bh=XrfC28u0axV/TjZBcAeEjo+KL6Oig4C0F6j0rT2n4Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZZgNjYDuL2hlKGwQudhEqg4LWx38X/X7qbWzt7RlsbSNYCzSMbV008tXQdjm+IhCgVcLE3ompkfXwAU3xk0KYzaAehhU1L5fvuhq6wizCmzy8T6KBxjTb2Ja5ZU/TxH/pYB+xOMTExQVS/33eG0RFA7bGM89jsFqHLpXKyzc1S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VFiv0wrT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MSsKwUYO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VFiv0wrT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MSsKwUYO"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GBTJsQ006012;
	Wed, 16 Apr 2025 12:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=XrfC28u0axV/TjZBcAeEjo+KL6Oig4C0F6j0rT2n4Nk=; b=
	VFiv0wrT9oCNH82nFukyhcqEy+o9b6P1XcWRN42/CrHzV9kWfCb5MFTtfvEViWc4
	LCpAVVi6TJUn9E7PXtZ0LB9eGqGxXkENhZ5JxctSXcpuTraceYV7cWuxHbB2OwNp
	BoOH8f79GH6Wi722rE6EUqrI0iAVqlu+YzuDo8x+GF3ntdCeG2JLnhqBR91X/SfX
	Jumz5tiUZqyPeQCem9/TtNiPhNG+ktYi8X5Z7h4ls6jH4JMIIeajA4ccwVdhGsdk
	0peenIXHDDpb86kWdlwqOrKAp1kE3oaPDT7ax2iOh6tcIYw5wn5iD6bjX1PNk4B2
	OzZJO+9WCblUXrss8lqBfQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 461944bthn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 12:59:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GCCAXa008559;
	Wed, 16 Apr 2025 12:59:28 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2042.outbound.protection.outlook.com [104.47.73.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2rkk63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 12:59:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/+sfRwmjFte2sFvMho6imMfAlX19eovI8C2PzFh3lzPj/xKTmEv/w68mKVRJf8bB0FuBjTzNpyjIyml8JJ6L4+cs4aQKTGmQEnMSySi7QwddGpphdO0PqturFgdEBbHRUS/Bf4oR2FFvrH1O8r19u3zEJ8dR2fEABoKPPDiUtJSg84+q5PqAGcTcxM+Lazr36hfXH2hKneJg9rb244cu0JBJkoYEQpmpgS1SiINBEhpw2bRNByqnySu+CshqqU6W6cJWZmT4FvSOXclYyFw+RmlMonUF/PXyfRuTYipAlVnqqBitY4xsJWmDb8JCJm3s3oyM+KsnMoG4BVqyygiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrfC28u0axV/TjZBcAeEjo+KL6Oig4C0F6j0rT2n4Nk=;
 b=uqNOz9Gv5QxhB0BluqjL0LJR/SM4kwwAnhQaDm+e7X6QW2adHEOJ6MHzXMTSOifvYCaJn+3c7jFZRUfSW3QK711E+Rwq62Cgr0jPv0Hg16X2Dgdehh830OROVHwX4asrHuMvzVsRtDibo+cExn59EmyBz1/rg/4DafeJYXoa78v26mTI5DRU+sVvwW+nBPCtzYEDF6qfUr4g/GyJTH/VfHzdYFTPoyKuMWasYk0zjhcU/nu1jNJ9AN4+Nb9Dzmmwzy6vKvp/xcne2rAdL1pquCiF4Ew03ipKhP40xJ5EKJKBY959ZZ/1IWKxaYOJaNJ16OTBuRp0zEAF3MT+OWbojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrfC28u0axV/TjZBcAeEjo+KL6Oig4C0F6j0rT2n4Nk=;
 b=MSsKwUYOumKLAd3MkQ9qgzST7H3lY0WXgG5p1XOE/LFOBiXZ5C6R4Bgz+G7iv2w5pq+dl/nhWMqD5MKsS+gy4zchHYQ6M5i3LDj0ckfwWJvBUpOzO86G+ciKUMoqWWqL6GQjMPY+kUkcvEwhYBAcKM5clBKLj7r8FD6vE4ql7Lw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4922.namprd10.prod.outlook.com (2603:10b6:610:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 12:59:26 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 12:59:26 +0000
Date: Wed, 16 Apr 2025 13:59:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Harry Yoo <harry.yoo@oracle.com>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Ye Liu <liuye@kylinos.cn>, David Hildenbrand <david@redhat.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm/rmap: Move anon_vma initialization to anon_vma_ctor()
Message-ID: <fde494a5-f5bc-4d5b-ae73-9fe2106e966c@lucifer.local>
References: <20250415092548.271718-1-ye.liu@linux.dev>
 <Z_5C7YNDwZ4pdwQn@harry>
 <0696eaac-943f-4116-b682-f9b15de6aeaf@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0696eaac-943f-4116-b682-f9b15de6aeaf@linux.dev>
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: a609e250-b548-4e97-d759-08dd7ce682d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk9ValZqeWdIQzdaV1dlUnBaWVY4b3g0bWVrSDhkZDRYK0tZVjd5TGorZ3hQ?=
 =?utf-8?B?WTdFdE0wRVpjMXUwR25xNlVOaVZBNHhINXVxNnJhaXh1aExmaStDcUJKdGh2?=
 =?utf-8?B?SWlQc0NyejluYnc1cDVaMGJ2TDdzVjRLb05tT203Q1RVY1lPeW5DNTNQQTBJ?=
 =?utf-8?B?Vkc4SjE4aUxydHBhS3NmQnRFZVlLOTZRanFxdUcvK1J4NncxS2s1Y0RJeWhZ?=
 =?utf-8?B?b3ZkYjBmRzlJWWdhUEtWNlVUb1BNcjllUld1eDN0Q2lTajFzcDJ4cVRoWjJ1?=
 =?utf-8?B?dlF3aGcxMkZIREJjVXE2M2FEdHZUTEZTdFFDTUZPbTZNcXRHWVhXUVFpWHJO?=
 =?utf-8?B?ZEpZWUxoYW1PSm9mRTVaa2Vra1Q3VDNITklYdTJ5NWdEUzVocjBGNjA1OHBj?=
 =?utf-8?B?R21STUFBcE5XaENuS1ZhOW5jQys4SGR2K0RvWHNKZk55UHZMZVJNMTJlZkMx?=
 =?utf-8?B?YXJCMW5KT3JuejdUMy8xMFc4RVBQS2pVbUJsUlM2ZThVZmFOczVmVE5kSFRT?=
 =?utf-8?B?bVg0QUdPWWw3VCtLaEhjWERqbi9OWEF3RU1OMDdqZ3FWWDhkZTZxYWR5Z3Iv?=
 =?utf-8?B?alRyanp3K2pxZnBRYTl1MUJzMkJRekM4eHRyQ016RldqSXpnWHgrd1ZtaXlG?=
 =?utf-8?B?QlpKeUkwVVUxK3NuVGpQNU1rZnQ4MUpiK0VxQ05mc1pycGhaVVZjOW1DdWkw?=
 =?utf-8?B?c0g3RnhwS2QvcXBrRUNzc21uUHRNdzBmZFd6a3lUbEpDZmVmTHNiU29uUGxK?=
 =?utf-8?B?MmcyTnRpR0RldTRCZVRzUmgvQTZobVdFM0xXWUxQYTdiVGZvcjJHbDFZb2R2?=
 =?utf-8?B?K0dyaXppaWdNTHNsQmRvM0ljcmZsVXFXRFBDOWpaOHAxK0xscWxLOE5sNy80?=
 =?utf-8?B?elJhdWlaeTNvaTE4WHExUkx6U2ptbXJaN3AwSFBiUXpxVi9JaWM2UmZRQzdN?=
 =?utf-8?B?UmZUTTNDYWwvY1pQQUpFc3hYSDE0V1NKZFpOa0NSMk5oOUxDTGxGbHh0Vkhi?=
 =?utf-8?B?MDliQ09VcVBldTN4K1dOQnVOTExhQUt2MkhlcVQ0cmQ3OG5WcXYrOGxlR2t0?=
 =?utf-8?B?TVAxZW80dEJFRVZwMGFrMzRSVDg2NkNXVVZGQTlCMWpBMVA3UVB5eHRPTmhO?=
 =?utf-8?B?VUgxVlJXVk9QNmJMeUt0YmVQU25LQ2dVNDFEeXJUckw0L3NLUXVDSWhhWkJu?=
 =?utf-8?B?Q1V3MEJXWmxkbUZXMEFFTmE2V1orclk5SFFmK252SEgrRFl6dnRRazFXQkFM?=
 =?utf-8?B?aExpb2lZc3E1Ni9EYVBCRUJET3ZRMlVIcGRweVVJd3dNZFY1am9IV3N4cFlq?=
 =?utf-8?B?NzgyaHJXeVdndEFBWE5QN2wvd1hDT0dFRFVVZFkxNlM0R0U3VWl6ejhzTmRL?=
 =?utf-8?B?N3Rmd2ZaV2NpdktJUEptajdaK0ZXU01sUEY0ak5OMlhTU0E2eVZ3QllDTEpE?=
 =?utf-8?B?QU1nVHFhd2NaQ0RRenFweDI5d1pLR3lwNXVSVVFjQlhlbFQyQkc3RDVzQVlL?=
 =?utf-8?B?L1IzNld3c2RGclNzb1k5UnJob1FCd3FwWWhZQVFIVDVOZEZKY0VTdm42TWRy?=
 =?utf-8?B?dFl2K3Z3c1UxTDZFOFIwdFI0RlZjbjRqRVRTOUQyVW5rdVQvZU5pV0dOYksv?=
 =?utf-8?B?RDZYY1MxamkxaVdPNEFkdUhoL1ZEYkQwOUh0M21ZZU1yVzRnVHYvVTFsVmhV?=
 =?utf-8?B?TC9XYWNuQ1l0aUtSREdWWHVpWlhKWjdFOXpqTGZCWVphNlBmUEUyZFhuZnhS?=
 =?utf-8?B?MVh0eU5mUk90RmlJRDRqR09QNVBLaTFTY0FMYmxoWVZxSEJXcnhNVUc2NTZy?=
 =?utf-8?B?aWo4VDFleHFYbjVDaHhJUlZPTEN5VmYrVGJVODROM0o0RWJOdTFwVmFQVTk2?=
 =?utf-8?B?SGRpdmlVVTdNM3AzeDFiVXo1eHVDSEZJSUFQdnlXQ0M0RWJzME1ERkNoUzA3?=
 =?utf-8?Q?5hEqKOJFRp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1NFd0RIWHJMZElUeVk0WGJnOTlhSlJzU3RBYXZtT2VzWHN5V1d2U2RNTmIr?=
 =?utf-8?B?VDhvY1ZQQ2pyZGNUV1gwK0pEemZUWFBaSGhXSmZnbWk2U3Fyc1FrVnRLU1BJ?=
 =?utf-8?B?cE9MZFZFMU00cU5ReHB4RnMyRjYrWkI5MjIyY0J1Y2JnZkJtc2VIeFU3VkdE?=
 =?utf-8?B?TENOd3kwcElHRWRuNHpWeVZPS3lmNUxEYm04ZThRcXhLWlFRRW1sOXVBU053?=
 =?utf-8?B?cjArMGRNbHNIOEt4ajZSbjk5aXRFYWtYQUMwN3dqM2QzWnRZZnNDeXZPOWdE?=
 =?utf-8?B?SDBVdC95eDVKa2hxbVJYWFp5OXFLMitOSTAvTXYrMXZMdkh5NnVteVp6VFoy?=
 =?utf-8?B?Y2kwRDA2MTBUUU54MFNKVGwzdzF0UVdESTlDZXJpNHdKelZWL2hzWlBWTXUr?=
 =?utf-8?B?NDYyN2RMS2tTNFNXYkxMQ1JqaVVvUWxWNWZ4c1NqYjlEcGs1UlF2Ky82d0xU?=
 =?utf-8?B?S2J2U0xRVk8xNkc3WkQxTVZyVDlVc215UVlWdlBseDlkK252RXlGVi95TFF1?=
 =?utf-8?B?ZVNxYjh6ZVhKSnpYZ0ZvNkE5YjgyODRsUVVSZkRncnZwUnoxckJuN3B1MVZT?=
 =?utf-8?B?Z3hpVXZIUXFTTHJ6TzlZc2t2OTV4V0hFeE8weWszWnZ6Qzd6YmVqSFIvQkUv?=
 =?utf-8?B?MkxWUnFicVNZUm9oVTRJbnMvOTJLc2ErZllQZjJFUmFReGgyK1I5S1lVeXJG?=
 =?utf-8?B?VWJOMS82c2hQbWEycWpKbVMzaUVVRFVpcmZ2WWN6dk56SThSTklQRzRBaEJt?=
 =?utf-8?B?YmRjQ0c2a1VNU1hWeTJsMFV3K04yVG1OTmFKZXJBaHU3cTJ0MDl3RHFNMDlM?=
 =?utf-8?B?M0JnWW5SZVJkdDdSMVZtZE5oSVZ5U21SRnJjbGV5ckNtUnFLNTZUMkJaNHE0?=
 =?utf-8?B?YU5SWms1V1IxZEpVWEY0b1VKK3BxUUNiUHZXRDAyaDBPYWx4Q3hOOVFnYVJy?=
 =?utf-8?B?OG1hTHVhSDJrTUJOejBiRjBBaHZKWFVwYkF3M01zQVVRcmpQY3dWQ0NPd1A5?=
 =?utf-8?B?ZE9mSjQzNXJZL1R6eG1kQmt1cFl1ZzhDdU5kTWZEaERmT1ppLzVNT245OHNY?=
 =?utf-8?B?cFFHZ1lSTzZtNThGMnZ2RnQwZWJ6dmFpUXZSeXQwMjdIOFJXS05qUUhQNXVI?=
 =?utf-8?B?WDFVTTEwMTNQeVdoRW90OFJzOUluWjFZTjZoVzc0Vys3RVZJQlZXUmtjYm1H?=
 =?utf-8?B?UDNXeU1hT3dyNWdJYUNQd3BjZ2dUM3pCQlJDNlFsMjFKL1ZmS1o1TTNEeFJp?=
 =?utf-8?B?ckU0R3g2TWxUNEowaUl1cHBmbUE0N1hrWlFtVnNZWUNja1EyWFR2dG5Nam9Z?=
 =?utf-8?B?Tm9yUFVQNVJZMC8xRHZ0TDFjVE9lcWVwRE9aRzRWRldwWnFBVEdzY2VpZjlx?=
 =?utf-8?B?K3djUURadFZLWUg2M0xNaE1YYzdPTEYwSVVFR1RhWHF3RDNmT2NvTmNuTWdO?=
 =?utf-8?B?UklvSFMzdi9ZS1U4NVoyREkvMUp4T3AwWERGZkE5UjBXYjc0RWxKNzZQRzJD?=
 =?utf-8?B?OGJsM3pDMUdRTXNCR0RzckFrYmRHUjlpRnd3bUwvR0pXQnBuVWllWW0rU3dY?=
 =?utf-8?B?eUJiUnJRc0phZDVadGJPZGNRczQyL3I4NXVLK2pyZGM4cVRpeTc2Wk1RcW9r?=
 =?utf-8?B?eWo4VTNpK054TXFIWDN4YitGQWtXSmhHbTdhb1krWnkwZHRjT3lrZFJGVG5O?=
 =?utf-8?B?cDBBWnhVNG5qUUhuYkxVV1FFd1FCcHFpSkRvMmN1eUFNblhrS21kQ0hERDVv?=
 =?utf-8?B?enlJcEltdFUxREgrcnJ2aDFHQi9URCtPT1A2K1puUlkwNWd1QjhBeFh2R1pp?=
 =?utf-8?B?UzlBRkdKQXVxK1ZZVWxOUTJzc1JsL3VmdTduc09BY0JKNEEwbnNHOVFNY24w?=
 =?utf-8?B?Mm4rcU94QmsvZ1hLaWZLdUR0Ti9KNXdJLzNJUjJnSWlGSVhkWTlEOUhoQ1oy?=
 =?utf-8?B?YlZiSVVzS3BTdWZ3dEtXYkV1MGl0ZnN3QzFRd0Zxd1VDVlZkY1ArSzE1UmpG?=
 =?utf-8?B?LzBUK2xzcFl0YmM3Nk10Sm1TR2ZSbmFEZE1aTjdNdnBXZjh2dmZrT1VNTmhV?=
 =?utf-8?B?eHlteXJtdlo5MnpWc1V4SVF6NnJxdU1KSVBQMWZleXI1NmxGZkQyVWxHQTI3?=
 =?utf-8?B?dStadnBnQyswejNNcndBWXpjMVV5eC9ONUlGWVBTWWkzWkdrVEt6dXVUaktK?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xD1ofI62PYm21ZTtSRBlvbm2k6bmPczaBBWw3AzY3GI+wzaWH6KY69O3xxWxuPPvB2/J+4oeagIUed3ffIRv2ZQuzVMRnuyE8zghAPYgTEO6XWrfxssMdDk9sdLCFtXI43aHkzYnk1nnc8q/OrDMqYAUAyRMeFRMfi9Uhkj9mF9PW13bsaMgZcrnEgRBqWbIAHvkOmujIi3syf7TrzHzToXV4sbHmM1nlbJH8pxC5EcDG66Hcu+bxrosaHQMO1tTeofZq+syDrBQ7pUAZoBDztmlfHVGu+JoU84gVKxxVj0rBOPr4QP/QC/ociSg0l7hqPAS0y/rZqpRm86axOyd4ujH5G4bFYPQU6A/YNhnRxiqkF8ejj4HyFLBHiJDuBX/WHIrdoANzho31/kr2roOoXbG1O5m3Kg/Yd5fG1Ya/Rk7pitBk3uDEooZSAtgZownYSD66I/BaEOyh2WW+mrQJHlSAcCYN/x1iieq0s1Z/IQmC5F1o5SJ7eZMRJkSpYpVyNJ9J6EMBJA5nw7CrfPqVBz3HIDa+iiVY+KJG+7tA1qPcG8jmaMJ/3DxLSUmLOIt/AV1UI5m0PuG0Tw0XzsaVntOKw19jbZjHdW5+DFBKGA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a609e250-b548-4e97-d759-08dd7ce682d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:59:25.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewSKf9ae4cSb8Zzk4RQEPVLRd4MQ19pxt3wZVI9Fs/sa/NfebpiZ2P4e/1kSXVKhbzcBkbI+tahJKxQj4RqOwuaZ8l52wV3bLiWLQN2HMM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4922
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160107
X-Proofpoint-GUID: B6xrlR4DrSkD4OENARYqn1yCsdkad_wX
X-Proofpoint-ORIG-GUID: B6xrlR4DrSkD4OENARYqn1yCsdkad_wX

+cc David, Liam

On Wed, Apr 16, 2025 at 09:34:30AM +0800, Ye Liu wrote:
>
> 在 2025/4/15 19:28, Harry Yoo 写道:
> > On Tue, Apr 15, 2025 at 05:25:48PM +0800, Ye Liu wrote:
> >> From: Ye Liu <liuye@kylinos.cn>
> >>
> >> Currently, some initialization of anon_vma is performed in
> >> anon_vma_alloc(). Move the initialization to anon_vma_ctor()
> >> so that all object setup is handled in one place.
> >>
> >> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> >> ---
> > NACK unless the patch explains how the object's initial state
> > ('constructed state') is preserved between uses.
> >
> > anon_vma_ctor() is a slab constructor. That means it is called only once
> > when a slab (folio) is allocated, and not called again when an anon_vma
> > is allocated from an existing slab (folio). In other words it is not called
> > everytime an object allocated via kmem_cache_alloc() interface.
> Thank you for the feedback. You're absolutely right — I misunderstood
> how the slab constructor (ctor) works. I had assumed it would be called
> every time an object is allocated via kmem_cache_alloc(), but I now
> realize it is only called once when a new slab is initialized, not on
> every object allocation.
> > This patch looks very dangerous to me and makes me question whether you
> > tested it before submission.
> >
> Appreciate you catching this — and yes, I'll test it more thoroughly
> before submitting other patches.
>
> Drop it.
>
> Thanks,
> Ye
>

I agree with Harry's assessment, also this is something that needs to be cc'd to
other developers - I am more generally working on anon_vma at the moment and
this is vma-adjacent even if slab-ish :)

It isn't your fault that you didn't, we need a MAINTAINERS entry for this which
I will submit, but for any future revision, please do cc Harry, David, Liam,
Vlastimil + myself.

I should be sending a MAINTAINERS patch later today which should correct this
going forward!

Cheers, Lorenzo
