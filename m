Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183A18FDD2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746742565; cv=fail; b=o0jufuUG8C8gCkMkpqHXp5V6g5aWVPC3GQx997oDWBNrlAS8Iq1rtY3WTOI6I9dsAB4FYrQ2sOk2X7pqEIve9xqRCBfN2CXCMZY6J9uR+TjtXHZFdXm3XcBLoIB/WIzG2P6JkjO26LddvCY/7zD+7bkqHi3bJTXhkaFj/jjCiWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746742565; c=relaxed/simple;
	bh=k09YHhjVGo3omGb6XIcJz/iYvGCyirwYpgwWaT+Y69I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lBqqRL1RpmWxCeAn39RVa3s/Cg6YmqjH2niprWmeJRaTMjyisE9ZB6/9cYmPBVi/MmpjyDHSjC/0aDRXLKGkmLox1MVHx8NVwJ0TOp3ncOu9rv81vzYxKx+j5bNNWwAM6V0GI4Vy1LR1nT+OJ0qo+GwpRARKNwpYmotdpK4P4xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=COZHyC1D; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="COZHyC1D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQMNYUysku2v2vrk0wITcj6cUr8hwmQWLTkqRLSzPNi8/eR0DNKedckpwa21fdJ61y3fDpgM83WpB8VDPNgkJQ4NCMpY9hNwWlCql3We3luVoaqDqOl9RCHY6RZS62xsObG7zUMwKztwhISOwcAp8oTB5MPhqiaflz5IkbPSjv5ZJjehzoW3fGT2Rc7BHda2BeagQou/3L4f/RYgCOL3iotjuK30VLwnZWkyCyzdzKRthlGpnP7X4Gib2yMtGArRTuzpnBc/L579ZY0ciNHnS93omzI7ThoWA877ysYqu3v5cdFXtZz50D6mxsENkpZwKuu05D4ttAbTSEQWq8zfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcXgQkkCHayVfsRy/9VctTImnKgaoEe1DFsArwMkvec=;
 b=Kx00uTM4DLOU3sOLtUsjMBGrkRtZ7QOD1cLe6Zp8K0u21aWTbSB6Ny7MFO+5c9OhSpHHM1UMKu0hPvYVa1e6iQ2FJIvv2ge1q02C+OIk/Q+2fkdUF1pjI05AB94QO/QOTk7ceKT0mHJoQtiO+boHwZWi5ByFTxZV4mM4t0f+0Ud+A97j+r2FgtgbeXAYq4FFDIOgAvzNH9e3zLRqpTQrJcTvod2bl1xuGLOwrN6ZXWGjC/2hBHFTA0tv6FToDdly64U6QgnPYniKojvZE6c+73/NSFJd1ejtF4h9QREqe49BtQCv6TmQkI98UWJKeGtCOn/rBwbVNDiDEMx1gX9MsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcXgQkkCHayVfsRy/9VctTImnKgaoEe1DFsArwMkvec=;
 b=COZHyC1DtWDrl02aewuxo3P1te1hoEwhs4ntiPOIClioFD+QJgQZTyjPrjqP9TLrQZeODAHYHaRdyLiYg9zunxlPH5Tl/aEm1pM4vUELEnADQJuUSQkBcYlTEWvx6ZJXsmJxqRSNcNeWVveDLu/R4FRQrjWzKvEfBUpUgtOgGmkv+a5fGSz20IAVj8XMC/z4bSS3aR4CgYOiC7en0aZUyoACffMZnk5UHGJgHTyHLCoJBF5cEn+fkra5OjW1nSwfQR/HV4UrwaYQEJQOCNOBObUhbYH7MnQr1IdfJP/+MK/q2OlYJ3ge2PNG6BvMTGamvFWT/5Kn42x3X6POSKDSdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB8758.namprd12.prod.outlook.com (2603:10b6:303:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.22; Thu, 8 May
 2025 22:15:56 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 22:15:56 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Thu, 08 May 2025 18:15:52 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <EB345ABF-CEAF-44CC-B144-39CE50354C36@nvidia.com>
In-Reply-To: <20250508211109.GC323143@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-5-ziy@nvidia.com>
 <20250508211109.GC323143@cmpxchg.org>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:208:160::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: bc387764-0149-4880-30fd-08dd8e7de752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TqiRlT3V7WJRq7mBaUcjmZzELO7aGDd1ZtCniDfVylNJ1yUvF5OHbRsXQzcE?=
 =?us-ascii?Q?QH+m73fEmfNsNpNwBWGlCPCMfSdym/j8TVerFPRIo/RfY+4ACEfGmrw1TYpY?=
 =?us-ascii?Q?CA4cJtzPGdOLTwLcLNKBV1gPx3N/nPJd/qUw3WZp+kYPexP4LOWvvgUfnUC0?=
 =?us-ascii?Q?CBo7gYOcR9hEfkj8W39og6X36uxvatxCVf///oRNIf7UwqiQOPzDu5zmKoWS?=
 =?us-ascii?Q?HPNKUBfHfw4572O57l1zdpQ4z3a8drPRvL0L0Rm0T7o3glzZIuEWvS7TjPnD?=
 =?us-ascii?Q?gYPoaqqVX0rEEAG8mNvwzc/+rSfGu1F3Q3awJMYzSKNYmCEywSJa+mMn5iSo?=
 =?us-ascii?Q?l2PgmCSeRAMmqEzzkLnCLMaORYUKIqiBUFvJIfxM5AjKxtPnGmJEciAs1ev8?=
 =?us-ascii?Q?CHF0XBTWtiBLuZeX83FlSi5y+vggGMAuFlHu222tDK5KI0s97a1AMJbhtcbN?=
 =?us-ascii?Q?zci6tMmn7hZvs3lhmltfYYm5LYCsKA2ocxceiIhsKpDbQyBXZa84mzNcdmPl?=
 =?us-ascii?Q?qdhHVCVZUsfJc+MJAgEU9LaOImt75jxF55BY4yauk4sRnURR0KDzk9b1IAB5?=
 =?us-ascii?Q?8s3Paa+zvHekqd+US5FtqJeaKREyK1BNaZNdEhzJD6jcgGs2cuDXQ7bFnYHE?=
 =?us-ascii?Q?08fDDuPj+v9Ct1MxUQyFnDCgFREpWGuqXDhAO+FWPZu68ZZ6XqQxFQ5+ctAC?=
 =?us-ascii?Q?wP6wdjyff7aT/1Q3LYduRQwKxjJcJsWwiT4JvlhFMhcuBA+hMtmr8embO53q?=
 =?us-ascii?Q?2pCjFZa9kQEBvyrOgzeH5OuQl+Cv4fjPoPkKDq1a1yMD/W5pmZjvX6laSDDi?=
 =?us-ascii?Q?RkBkKsRdSN12YJ7u4u7CNKXgPgoZD2KogrRqdMUydLsHzdSIky8G7J9r7PAE?=
 =?us-ascii?Q?BxLCHsrrL7sFP74igjQEMYrK77ADiyp4ezF2hz8VYcdQUlYahl1ML5UylHYt?=
 =?us-ascii?Q?EskUgh09ZnE0V4lwk6tCMlabBySdm/a1dZCdlwGx73nAlKa9JtFrEsYxJ/+F?=
 =?us-ascii?Q?nP1c2aoDmvlOacIqDq2RYPXHdlDdGyF3h/AYmcSVafQqGAAZkK8uc86cuTFi?=
 =?us-ascii?Q?K53U0swNEsh7jZIayzfJg5+AoKCc7IzeEqGPIAASIKxTKvUZnu2FjpW+1VRA?=
 =?us-ascii?Q?9Gt2Q+nviPnmgeS/QO/rUuxWXQUyVcGwdkBULL+ojbktXDwrl/HSK/oiQPQ7?=
 =?us-ascii?Q?xPA3p1EH0Et/xzaPqLd8oAQqxFEPVbVweugmfzbJK010uOsP0B7OvyLmuaFY?=
 =?us-ascii?Q?W7k2vLhHGdHLuVEsqboX706N21iMQUlcrkd84cLvhfcl1z4/1xa4s0lFv+e4?=
 =?us-ascii?Q?gwE2GrnD7vZ2i1fQkOZKtzx2zN3RAZF+aFotvkwMeuyh5mvfwCOcfCAqTM6Q?=
 =?us-ascii?Q?EdonzlzswEOV9opesGHyO5NLKboLQPoirgvHZPcvfrfsrd6ovCfYnOO3WIya?=
 =?us-ascii?Q?S3A56sELNBA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Evoqpr6yYkadMcpsq9YdS95ivNBChONhBUV0k3b/lLHzpVGfl/dzUixe26J4?=
 =?us-ascii?Q?SxeefsGtuTBWiy6Uuyl5sXTGNRHYHW72HCouj1G6hByr+Uwsq7ivuePs1HS4?=
 =?us-ascii?Q?JBoLKFATQ35LNjWiKCW3rLJAPHssWxS8lk3C2+5LCFA3twVxhYfQptbT5LRU?=
 =?us-ascii?Q?UuUe72aFxM1f+mULDze95F20wsLBeKDDT+qnuJsUoHamypELuV5ImM0KEkCA?=
 =?us-ascii?Q?WQqCgGQesjv5C8W+3aZhSSgCHr4/LQq9Nj7qgD8pHLMxMdMThJVzJa7oCSSG?=
 =?us-ascii?Q?c3W/fXXtdJYn5FruBghayzLHuGkKwYffPQj/VJ0djoevtOOwiTwN3HV0/SEU?=
 =?us-ascii?Q?/LlNtCfa2ytwY2Kf9IzwiX9tZ+5Qr+B1DTj4Bj6soPA5k96/Zi6XrK3InHcf?=
 =?us-ascii?Q?SxXpqwhuQaZ9eKMGisPEU2gEeJ8qcOS5gqc4puF3EGHRylW0ax8q54hXQdCG?=
 =?us-ascii?Q?x3G4NbT07pBGmbArrh6CEQRYaai+VBi47K5fi/a6B20375+O+QzlkfhwG+xU?=
 =?us-ascii?Q?pCfcDroSSMnQXBblwlbyP8eoZEecjVlf4UDKLxIM2r7HuZGnEflf9HkQSyGn?=
 =?us-ascii?Q?yq7Rv86Wy/pToHb7TRqe+/mbnAmGTkEc6zQUXQaZezXmmlPga7zKhnNXI9yk?=
 =?us-ascii?Q?8xtYS9IlxRXnw+Q53gvR2DjiCwWIYJv0YTGIFZ4ZdZ+hryK0EcSmA6BuY5RR?=
 =?us-ascii?Q?9RlPu9mehDBQEAsxMXvuBLsjymhQvXZbP1+I9aonneoXEYR68vdTC52L9Bf5?=
 =?us-ascii?Q?9VBtn0L4VQu8aLy1NJOhNRcVvx/1MFBu5jfI0oCEfRg2nHKZVMvNZWKruCHe?=
 =?us-ascii?Q?eFixokFiXXq+c2Rj6p6/5N9c0wGCA3ttARyTfDWWjGQ3kWKKja25Zar0srH9?=
 =?us-ascii?Q?EiKu/FIigNYMhsY9RlEVU2EoRdm0grUBrQH5SCId1h4Fd08Q8NLJsnV8HgIg?=
 =?us-ascii?Q?06HALNzHNxylGeU4OBy0o4j0ka0+emAC+ypGz2ByvYRLlK+2/1XwsRT3m7cy?=
 =?us-ascii?Q?gbyvfiNVvQZG89FWdaJ/uq6ZOsNhIbHlRXcPmYd0JzkmM0vB1c1artKnZzuO?=
 =?us-ascii?Q?mJGK0wLAZtB581eR3L4pJpERj7fZfhWDUNQysPKDjJznOFYdZgG2xb2QlVLU?=
 =?us-ascii?Q?6lbwBFAELzPL2HGH38PdAT6upRObq5l3c9lETkCbb4WE9P2OK0W/XUrwcYId?=
 =?us-ascii?Q?gp6G+iII2DpLLrRpRpGr9CbmzoMlZWh8BXKWcWgCVOJv52bS1s8SqHSLE6ec?=
 =?us-ascii?Q?iBGH7thJzczV0S2B97K6q/QHgyjgANyuWq1gdL9dmkVNHJz48BX/gKG8k2Cj?=
 =?us-ascii?Q?DsKqTfMh5NTs++2z0HKr5PAGzwOMiTHC3sQpswMjXv/sBFYlw6iVH2YqL0oX?=
 =?us-ascii?Q?jlX/6Igns9InYfRyu2FegTceot4MzfLL1YsXtAwSDdZ+KDOiNOWNF7MocWq7?=
 =?us-ascii?Q?XsU/kvVvY7zxiTnSr7+xmQaN671MMIDY8zgMCSH6/OHSPMqSGUcZ7mHQKyNd?=
 =?us-ascii?Q?VqN1pZ7qNSve/kWjPLvO+5s7xvpHLYcJqo/1ZgKiQItENV92Q5wzMhbhDBvc?=
 =?us-ascii?Q?ht9X9BoRHo0lOLnXdZGcvy4XmMS/jtCHG9mjbTr4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc387764-0149-4880-30fd-08dd8e7de752
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 22:15:56.0515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWrhXOCGt+sXJGvUxruh4YSIkxNcruOdYMahefe13p+3ssz3F0rdj9AqkN8txTQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8758

On 8 May 2025, at 17:11, Johannes Weiner wrote:

> On Wed, May 07, 2025 at 05:10:59PM -0400, Zi Yan wrote:
>> @@ -22,8 +22,17 @@ static inline bool is_migrate_isolate(int migratetype)
>>  }
>>  #endif
>>
>> -#define MEMORY_OFFLINE	0x1
>> -#define REPORT_FAILURE	0x2
>> +/*
>> + * Isolation flags:
>> + * MEMORY_OFFLINE - isolate to offline (!allocate) memory e.g., skip over
>> + *		    PageHWPoison() pages and PageOffline() pages.
>> + * REPORT_FAILURE - report details about the failure to isolate the range
>> + * CMA_ALLOCATION - isolate for CMA allocations
>> + */
>> +typedef unsigned int __bitwise isol_flags_t;
>> +#define MEMORY_OFFLINE		((__force isol_flags_t)BIT(0))
>> +#define REPORT_FAILURE		((__force isol_flags_t)BIT(1))
>> +#define CMA_ALLOCATION		((__force isol_flags_t)BIT(2))
>
> Should this be a mode enum instead? MEMORY_OFFLINE and CMA_ALLOCATION
> are exclusive modes AFAICS. REPORT_FAILURE is a flag, but it's only
> used by MEMORY_OFFLINE, so probably better to make it a part of that
> instead of having both a mode and a flag field.

Yes. Will use an enum for MEMORY_OFFLINE and CMA_ALLOCATION and
make REPORT_FAILURE as a separate flag. Thanks for the feedback.

--
Best Regards,
Yan, Zi
