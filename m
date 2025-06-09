Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394181FBEB9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467565; cv=fail; b=r0mIl3EI7Kaz8eg1LbEiD3K+HZhkZcgbTk5FuB9zn8mfQZJwEHR32Kg3qHRBAWa9YzcSDBF+T8nbR12ZLhWNaWNcX31VcbcALMN1KVYsIUH8/bl1aBgBdS6xvg1hzc4s8adRkCHhow0Oi06H45MBHHatu1GvFou/FnMNl0u01Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467565; c=relaxed/simple;
	bh=//idJwSiSndTN0sUadrH+O4+ORNINAO1EATLgoh6w3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VzJZes+ks6h0+C5QdqLlrvg1WY86wvAdiLql5TswqSSkrb6Y93n9wGdqCQEJmyPg7lcqPcYCtyRom2Jhe1bVCRr3GxMGuyH6QfoyQrDa4mKpxlQNWsCgZn8Bq9ukL5+HbHjKkozwHPZe30sgMkeTq+v0WVhM1nx0oOadAUq8T2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZI29TXTJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bGc5Uoux; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZI29TXTJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bGc5Uoux"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593ibLV011582;
	Mon, 9 Jun 2025 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=KVh9FRuWACrGHaTBruQweXFQ0diLaBL4OAgOOUxCp2k=; b=
	ZI29TXTJLLQZJ0tB6g3811h474gatxjNB1JljZ7GLBcCHGNnM2asGeZV5oQtFAbN
	feQBNoIZ6QyJam7bjRQKnY0q8iLd/ISmwgT9JwVH+/PhfGVgObzcZJIwdoQSmbqa
	ohKUFWlVwwS8WA39pes6wCStngkSHhnnOTiYwhhflEJF20uuIKKhRjfIVY5TV43p
	3JHfjNZ3BdLmskWk5R9hJbq1lezDhlpSCOeBUpNCqEUsn4+Bd+nb8VLjCrLbNw9/
	fB3Dw5VNWEcrwb+iaYaJgvwPlTUESQGqFmZyoS0/QtASDnwocM4AgR72EyF9T4kG
	AIR8DEuNavU9YlheW1kHpA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf1xvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 11:12:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5599K1VS007378;
	Mon, 9 Jun 2025 11:12:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv72w3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 11:12:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYNf+MyBIehfCyS2XJsnNyxTVaToP6Z7s0Rlz/2K+nNnElZnuj0ePjj13hhhQdMbHX1iZgwkMexinKNSTMX6C865Hm4EBW0+EC/THHi0OV59dRV6QGutXLc2eWZyLdSpOfaesnccfJbeRy114M4Fi6F6ROHs1xVQuypOZ36R0AaJhamg7EhLRn3jXKcEq/1OMaOKk+u4pCwg/geyPKQUhz+BLHvbZlASowM8jvu+Y0nWstsxbRF8g1V9eDDalrR1qbQyPptDhl73kKOhBvb+JZ3hfjZfQhKIB6argik4GcMW7+PzdWHyAVWLwvuSk9+HmMthRG8BCICPxrP7zoDxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVh9FRuWACrGHaTBruQweXFQ0diLaBL4OAgOOUxCp2k=;
 b=uWPvcDh24sx/Xchlak7HWKu/JUwBcuKZ0z3QS3wDt2MFMni7lB9P/IP+D5V3vLV72Z8ww4IY3eTE+LkWUz9wBrR73Fzcpqy1roCQMb+qA1DOfEQSWAUbXVHbF1m1KlBlIOic0uQB5MYwp5fW77sKZZjn9/cQiRurPu++eYfPcNgv4vfRaF/MUldzZUkJDEvv11FoYraREAAaXBSo2ORY2ai5tk115G+Uys13lW7l5BTTBaCIBU0GtPtPeclsI6Zwu7vvCAZD9EzDFIf8w26yWVc89Jhh8jI8OffsMIu3qQIurKZ7awoh3uQPnMEUp+xbjHhQYsiM/RXZMCl5ZVO8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVh9FRuWACrGHaTBruQweXFQ0diLaBL4OAgOOUxCp2k=;
 b=bGc5Uoux+maYOU3iw44/cnZw/RaCj0kKOl4MmRuslfFG9shCmxU4V0yLSEIiapdqkVEVCQp2uzayRO4mEjdZnIyN5VetsuoAlIacVbEa0FSP3EiJMUQFST/t0W2cWY6P/8mWxLElyqwMD/2TUEz5Ve18s04WrgX4moX/8U+ag18=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6471.namprd10.prod.outlook.com (2603:10b6:806:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Mon, 9 Jun
 2025 11:12:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 11:12:19 +0000
Date: Mon, 9 Jun 2025 12:12:17 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com,
        anshuman.khandual@arm.com, david@redhat.com, dev.jain@arm.com,
        jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        lokeshgidra@google.com, osalvador@suse.de, ryan.roberts@arm.com,
        surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz,
        zhengtangquan@oppo.com
Subject: Re: [PATCH v2] mm: madvise: use walk_page_range_vma() instead of
 walk_page_range()
Message-ID: <4f1edbf8-eb6a-4081-8b49-c9d1a5f85748@lucifer.local>
References: <e61b8931-521f-44b4-a78d-4988ad7c70b5@lucifer.local>
 <20250609105513.10901-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609105513.10901-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0169.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e5434a9-6a2a-457c-5d97-08dda746800e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGk1YktsYUNQTUk0Zy9PWHVMUkRDSXBkdm5ua3IrNXc2SU9HMlBmUEh0ZURp?=
 =?utf-8?B?b3ZES2QxZmZTb2tLaFdNeURVaytWeVJPM3pFZ3VLd2hYejg4OXdkcUoyMWMy?=
 =?utf-8?B?K1J1Y0lJS01QdmxxdUp1WUUxNkcxWVhxVkJGdjJuS1lzUCtiT3RrUzA2Y3lo?=
 =?utf-8?B?eXlBOTdrN1IxV2tQN2JSSHZiRUN5a1dyT1VrYUpEK01GL3FmSFdVbnd2bWZ5?=
 =?utf-8?B?WHJGbnRseXJQdzhuT1pDVXRlallOTlFMTUdKTFFDRHhTY3lGQkh1WStNeEs2?=
 =?utf-8?B?anBaS3NtOWp4RjJvSlJsVWZDcy82cVk5M0w0MFN6Z0tVQ1RZeTd1Z1M4Q2Y5?=
 =?utf-8?B?Zm5FVHJ0eXJPV3NIMGEydzZvd0hHZVZvUmdqNXRCblpQa08wbTI3bGxpRzM4?=
 =?utf-8?B?M2JHc3VUZFltVG9URXR0SzUwOWF0M0pCMTV5b3h1RHdLK0dpNzAvR21xZUNV?=
 =?utf-8?B?WGlFYnZmU3hHOXFpTy9PMTc0Uk5RR0FPUjhDZW1PMmdtUXcvN3NXMUd2WTRm?=
 =?utf-8?B?enFGRmlvRVIvOVNaV25JT011Q01Ddm5xcmhVZTJpVVhhNjJlVFJtYXhVWGxn?=
 =?utf-8?B?WFJ0R3RQODM3b2I2UFhZa096M0lILzRpWHErL2tDSzlxMWxlWElnNmN1ZUFR?=
 =?utf-8?B?RE0zZnN0OFE2LzdPZEVTY2Ura21veHVuZlhSaGIvVmNEMi9nWEZyM2RzemZK?=
 =?utf-8?B?bXYybHdHMHk2RVVTQWZRaWtrUXZqNE84S2htNGdzRndhMWVuRXFYNjVkLzRL?=
 =?utf-8?B?blpDSlY5aE5KeHBxT0I1Lys3WURDRlZLRU5venZpcFR3Ty9RdC9hTVY1dTIz?=
 =?utf-8?B?VUhyRlh0YXRxYzQ4S0RGMEdnLzlPWXdSUlFueWJDNWFJWmtSSXNsc3hYWjdZ?=
 =?utf-8?B?K1MrakJ2NlpCV0FvckNkc0s3azdJVnFrWjFNTU9RM2VORUgxZk5mQkRjN3Fo?=
 =?utf-8?B?bFZTV3BkZGJ4dWtOT3Q0Y2s5dHRFYk5wVXZOV2JKWmlDTlh4UWxnWWZZaUhi?=
 =?utf-8?B?dk4wbUN2N0o0VTlYcVFRMGlWQldGNTdCTkJQY1ZmU3NJUFV6SkhNY01PS056?=
 =?utf-8?B?aWhCNUtQQ25CTkg5ajdVVTRyY3hNczNXckFLL0RFcnVObVVtMDJwaVc1dFll?=
 =?utf-8?B?bjlHS2Q5WGdDS2JzRnlMUVZKMXlBRWF2VHdDMks1d3hiUHlKeUdaWEpQbmll?=
 =?utf-8?B?bkJxKzBQQ25LTklqclFzLzFJM3lWc1ZZQnNtdHk0WFhMQitoM0tDUmpobGlt?=
 =?utf-8?B?TFNyM2NxY2luZVB2Zk12MjFGc0pBZ1lyK2pjclR6TGp4ZGlwdjN3ZnJyZHZI?=
 =?utf-8?B?MFFxWkRqVVo0c1NrQmZFbkprZ2RiMFU3SHozczhjVjVLaHU3QXhLUlZ0dWJx?=
 =?utf-8?B?TDlHRCtnbEI3dXlrQStNQW1OSURGc1Bqb0JSTStKYmhQYzBhOVFmL0R3bTcw?=
 =?utf-8?B?VUJnNVV2WDFEMjBHSHUyVytqVXVlR0hCS3B4V29FWHBkL29HSmF1RTkwd2Q4?=
 =?utf-8?B?K1Zma3FxdTFiM0cvdzF2MXFCSHgyNDJTcTYxM1BVdkJ2bkE1MkdvQXlTaE5v?=
 =?utf-8?B?OW90UXVma2RKbDVnUWlCOUk1RVAxdEZJUk41SVF1ci9WNlNlMmlNSnJnbUd3?=
 =?utf-8?B?YThqaWVCYUdqZkZGcC9TNlVlUEtEaVhTSnRyK3VNY0dXaHdsdWh0My8xSCtL?=
 =?utf-8?B?amhvS2Y3V0Q5K29zN1pmN3BrcU15MG8wSURXa21nK2Jibm5Ed0tlT2RpZVhJ?=
 =?utf-8?B?NkVFR2RPdnE0TjFjOGFNbTRyQ3ZIWDlnVWVhbnkzNkdNTDRhMU9KLzl3cUtM?=
 =?utf-8?B?UFBuZEVnTCtQa3FoaEdra3B4dkhyZE5uKzB4bUJjUmtnV2ZCNjRXMEQ2Tk5S?=
 =?utf-8?B?a29rNEZIamdiaWdQM0lXaVlMbnAycW5iTlM1bVB6WXp5LzRiVTQ4MW54TGNk?=
 =?utf-8?Q?EdqNzWs2rXM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNZcWtpVTRJSWd0cHNCQmRaWkVRMzdFcy9PSFJTcGRjTVliVXZ2N25yR0Q4?=
 =?utf-8?B?RW9jaHdFaWZrZWE1eXZEVU9SVWpMb2VsbytOWWdYNEFIdk1HdThmOWh2eWZS?=
 =?utf-8?B?V2FrRUl5THMvT3Rpb3kwQSs5VmRxOVM3eGw1SXJUTHh2RENvcisrWUtBNjE4?=
 =?utf-8?B?ci9PSVZWUHIvWStaYVFvaGd3ckY4OG5zbFN4dzJnWHVSK05BcmtRUThmR0NL?=
 =?utf-8?B?Vks2bHBMYzY2eFhvZWRaVFlCekpqdjJUQTVYV0xkMW9ZRGVkdjVWcWg2R0Vv?=
 =?utf-8?B?eDV0YWRmNUcvZ2U0eG5ZMVc3S0kyMUpLT2ltcTZUNTR3VklwYjFVM2ZUZzln?=
 =?utf-8?B?a1prT0Q2d1FHbFNrdnFwV0JYWUZwdTNSekN4U2t4cXFQa3JTc05jTHE5Tnhn?=
 =?utf-8?B?SnVoY1JBOU50czFuVXo3aXo4YVhIZ1g2YlNPYnA4cDgwaE9NaHk5QXpJUHov?=
 =?utf-8?B?U1JpVDU1dkZCOFh0cHY2ek9TWGhVMi9iY2VOSU1rc1VpTGpBSW5nODJrNkMw?=
 =?utf-8?B?QVVsU1lJSlpTc1g5elY0aUN3UWFFWnRicXhEZzN5SlVXSTBzUU81dXhXc2Fr?=
 =?utf-8?B?Y2RYYTZZSFR1cWQrVG85TlhDTW9va2RFMnRzQUxOa1JJcmdKNWk5bnpHTEhU?=
 =?utf-8?B?QTBHcS9YZVp1TjEraEFGVTVmalJZMjRhNFFSNEE1QWZra3R6ZzZueDY3MU9M?=
 =?utf-8?B?SG9yRWJrTGd0SVZROUFPbXdDQ3Z2WnRpaHBGT0pRQ3hraUpwa1BNeUo5SzhB?=
 =?utf-8?B?ZHlaL3IvVU5iY3MvcEwyYlk3VUZqNTVQVlZsUWN2TlZaSHRoRTQxSWZnT3FN?=
 =?utf-8?B?UndYYUlEbmJNRTlOMi9lbTBOK3NnVWVHWGpMb1RnMytLcW0rcVVyZ0t6L0k1?=
 =?utf-8?B?V0VuM1o2eWMxVzhSdG5yQUI1U2pmaWpraDUwTHljQWpXU1FrRXRSYmdaMjJY?=
 =?utf-8?B?R0VxWHM4VUhUeTA1TjI3dnN3YlMyZWxWY09KczBBdy9nTUE3THlINnhMQjhS?=
 =?utf-8?B?eFduVHZCZDV2alNoLzBjT056SFF3b3hhbEIyNURHbGJVdllaYWt3cmdHejBH?=
 =?utf-8?B?eXovN1JjUDJPblQwcjFDZ3VkdkV1aWZ2cXFVZDRNeWxlWUhHMStGc2tONWc3?=
 =?utf-8?B?MHJ0MVI1c04vQjJYWFpiYVRUY0NoODRDNENpa1NkbmZEbmNzN25Ra2FlYlhx?=
 =?utf-8?B?UHhBalJYY0VVV0R1bXV4cVpWakdRWTZkdmF1TDdmd21GdXRKRGFqME50cmQx?=
 =?utf-8?B?YXFmMFpNSWxUTStaUFpBTVEwTHFObC8vZ3V3YVRJUlJ2dnRBdFdYekdJOGJj?=
 =?utf-8?B?ZTlXYTJEV0hmOXBJMnBVbzl1c2RYYUtDZWMwWnhnMXRNc2FheWczT1FNMjFa?=
 =?utf-8?B?YlROejNEdDAzc2JyQkphT1BvUitXVEhFemNwNkdGTi9lcWppS1hubjJ6OU9r?=
 =?utf-8?B?azVSYkF6dTBBMXRvVHBjckk4eVcxYlowVTRLRUpjaDArRFlsQisvbFBXSytq?=
 =?utf-8?B?M29uRVNycGlFeFBBZ2NnQUNyeWtZb3FSdzNKb1pYbExsOHNySlBFeGFqdTlQ?=
 =?utf-8?B?SWtPeVBEdDkwVGZzYTlkNm1nWjMrMTAxekgzamNXMWNyd2gwMHdQNHlTVWNJ?=
 =?utf-8?B?RHZrencrTHArKzFaOVAzV2VwSG5XTk5ua3BWRkt3ZUZCSUNETHcvZVF3TTBj?=
 =?utf-8?B?T1lWSDhEZnArc3dLR1dvQS9tSFNiRXNvWjZmSFMrQlI4R3RKcFVhWTNoN3Vs?=
 =?utf-8?B?VndoYmVDVGZMV1RBdU5WaGsrc2tvaHczYmtRSkFsNXI1cTY5VG8zOEJqZUJw?=
 =?utf-8?B?TWRrOWtSdFhUaTA2RjFBU0Q1VXg0QnBiZXdqTXBJWS9qWUh0QVBBOWpnTUhR?=
 =?utf-8?B?dDVYa3RELzYzUVNGMTBOdXE0VDFlaFNWaDR1UENuRTdEcGVRRWR1UjFPTVhx?=
 =?utf-8?B?ZUNDSStUMUZUNFUxRGNXQmFqVTRQbHMya0wyclUwSHYrdjB0dm15NEdoYTFh?=
 =?utf-8?B?Y1h2NU9oR3AvK2tqMjZ1S0hKUU5oN2s1K0xOYThDeDhFdTN2eThmSU9oUEhX?=
 =?utf-8?B?N0hiN3FZSGhkTnl2bXEwd20xVGNDa1B1ZFNVcGlIMDlIUWpiTUhJSVMxUUtJ?=
 =?utf-8?B?c25PcFBxUVJ6aVd4ZDhaZGVBU0Y4SU5icFFwRi80bjNxb0xhRnVQL281Qyt4?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t9qtYO3wFxD2VLcAwLbdCdluqB/pnExIhrCb5mUziLm1Bs+cRocFpPdCpvkh6n5irFkVZi6Kw3NrXVVO2d4opeCBqj/uP+tanhmehIBQ0e9THe7twz2Eqzn+6iNsiiXBswtGxolJpI5sHrT/qjZO7vn4a7iaR6HVbUAiZk8WE8ozEdc9WlD3igxpPx41CTZ/O5PMNVRHrJ+cwOv9rkbflOBeSVr0FfqFiu8ZQozMXYo+khQwijM3X+i5bcy52reDcxZEnfGVWvPKwuTlaJdaxbVTnVPhIBWc/mxJ1lY8jSBuwVeGYZGINYR8ecWVNJQQQPsUP3CT3pE9aFSi9ySn2Nsw9LoRUR9FQS9knZ54zRkGE6KHnURj+qjgb+EnSKz9Atkr+SB+KswVjakzdcO2bMYga+/m45kJFBgzWmw8cpgKMw0HWi93on3NbvVMuL4gLnBeCOeEK0Uk/oReroVTG1UgYMSeQJ4QlHK5QWx3uITu1LOelJx6HsC45t4VodVa6dd9Vyx3lgpcdhdVeqCjA2cYxCo9alyTrRwbV0hRa9hm29tEG89pHoi2Ao7SifNmrP9tE5awpKJvNQvsDJ+1MDMSY5q4PG/b3ucgcXzKRg0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5434a9-6a2a-457c-5d97-08dda746800e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 11:12:19.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7prHXpCaVlY2ahue+486hm2qlz0jFW63wlhzJWOJDJjvJZiM/FBBkAoKkU8hhldw0jBVAqne4LTZ738wzbPqiShAi7Dnt6jb1tp6VmJFkvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6471
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506090085
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6846c197 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=A2pY-5KRAAAA:8 a=XTEMzoNly7wSrGwwMLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: hKa1UVG0YCy6kQXnno68hHl_lYN5GiEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA4NSBTYWx0ZWRfX/9fCU53XtCpy kRItmfG4fYCxYVrD+tE1pH7GvjBZaZd/nYA9blhz5Umzx0SqX6Hd9Z1EADpQ+GWpnPlZbCQ73Xs mp8shtMnZUgnwHjFAlJ/ZDVeUtFM2Rdf3Gz2sacWFuqZyYbgZ9SIe5OZCwSlDdghSEuDVGd5TQr
 4h4w5vT3U8A3FMjrAS8uzzv25LCfZklhJiXgg/ZoQyrLTiimnmqTZCigsI3lDn8yrMVCAUxxg1T mvPij5Fy/jTm/5K9wIg+ih4Qgh9wjQOZ8LoLvc9btli5dOyiraNRrFPSSnsaq8DS1KduwDVqHRu N8B69unMcy8RCDD+otLmjit9mXui3rZk5eejrDKAoDlVoVhPWm4q8hFdoqmdOgBlrao+vJAisu8
 E6eo4Q4s6+nxjCAi9EuDAKH2GmqErAa8KL3fGzXQjeyRfcgkzGpDi9w5Y/U0TBoTLDvysY6i
X-Proofpoint-ORIG-GUID: hKa1UVG0YCy6kQXnno68hHl_lYN5GiEM

On Mon, Jun 09, 2025 at 10:55:13PM +1200, Barry Song wrote:
> > Yeah dear god I missed this oops!
> >
> > Yeah Barry - could you revert this change for the guard region bits please? So
> > this is intentional as we do not want anything non-mm to have access to
> > install_pte.
>
> All my fault! I wrote a multi-process/thread test to issue lots of madvise
> calls, but it looks like I missed INSTALL_GUARD.
>
> Thanks, Ryan & Lorenzo! Does Andrew prefer to pick up the fix below, or
> would it be better to send a new version? He’s handled fixes like this in
> the past—happy to resend if needed.

I'm totally fine with this thanks!

I can't speak for Andrew of course but he highlighted at LSF/MM his
preference for incremental fixes like this so I would say this is probably
his preference also :)

>
> From: Barry Song <v-songbaohua@oppo.com>
> Date: Mon, 9 Jun 2025 22:42:13 +1200
> Subject: [PATCH] mm: madvise: revert the walk_page_range_vma change for
>  MADV_GUARD_INSTALL
>
> Fix the broken MADV_GUARD_INSTALL reported by Ryan.
>  # guard-regions.c:719:split_merge:Expected madvise(ptr, 10 * page_size,
>  MADV_GUARD_INSTALL) (-1) == 0 (0)
>
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Closes: https://lore.kernel.org/linux-mm/671f8164-a90b-48d7-9446-359eb9493500@arm.com/
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/madvise.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8382614b71d1..381eedde8f6d 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1141,7 +1141,7 @@ static long madvise_guard_install(struct vm_area_struct *vma,
>  		unsigned long nr_pages = 0;
>
>  		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
> -		err = walk_page_range_vma(vma, start, end,
> +		err = walk_page_range_mm(vma->vm_mm, start, end,
>  					 &guard_install_walk_ops, &nr_pages);

Actually ack that only the install needs it, we can keep this fix for the
remove, as that doesn't of course use .install_pte().

Also it's kind of neat to only use the internal one in the instance we need
that and the 'public' interface when we don't.

>  		if (err < 0)
>  			return err;
> --
> 2.39.3 (Apple Git-146)
>

I also did actually test this this time :P and can confirm it fixes the issue.
