Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA68CBA2E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748309240; cv=fail; b=Jii7aqPwFw8rKzfogZyYB/Kf2KtKrMsQaRO40roV43hJeO2SynL05yjf54CQgZVrpYvrMycDUSuYx/s1rAk21jwOqGdPuo6Fx2snnb56q258akmt/OFDaUUZLPgda1KgWNDivULPmHqMOyQla5x3FWEGjxdYPt7Y3anoH9gvlJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748309240; c=relaxed/simple;
	bh=OaesTcuurd8YanFWF2D/BG5x00UjX3qNPWyW+tMgx9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kqKqRAV++3GOhkl9XMACglBdvdqcYXq4hlfBlxlcs+6lptykpNwRelRg3JE5X3J0/qt/CNnKx5EmTGvWJppHWeKDpO8UbaVN4EjpXwlYtEqyHWfJ+uB28ibqvYXXEqmveh4P8cVsalRnDpz4g2vi9PC9B3ZuSx+EtijRVlSyFjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qDl1Wzgm; arc=fail smtp.client-ip=40.107.95.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qDl1Wzgm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqMMiXfw8DVWKlVeDErcJYY4YUtZrLaqTCzhD+q2er/iSEevxYeVXn8pESt7zuxSQy0B1cbX6SoHsaMMiGuxxhlPnOoq+GjynQdy3abojL5Z0Z7vxiSIAaVMSkds8xwEfrgy/9WGjGb1ESHa9G4iYlZ5ZRlobmOCk9Zu9qxyI/k4v/virsuYEqcKC98qGLGwLgkLJnOwXoBkPeBn1JuaZODDBByeaxw8Dy7QdzeQUi3mS4thoj6Y53TnBxTF/NBuWXOJT2sggNTR2bfRHYSU9NYKwRCcMOfnkAeaQ2YpsyF/xayTaji3aeCfPD60+++1nXwChLylddARaFDDnZlVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLA71ldIQOXsCKrLzzfm+LPt8myDPkE9MkNW+HffgQQ=;
 b=wAFoUDtIzY90fraB/QUqT0gVCdWxX1lw0sRALzFeVOBgB9FarJHAxY2hmvGvrFfVB/pCGYho0U3qbS5ESUjtR9pBiA2dFAEbp7Ql4JSPJiRBDrGtms6SJA+2xryEFPNMyurd7X/9izJEIJhMcuoKvNolNPRMSO16i7iu0fLe1JAYf3UrO6q8hLe70hrthX0NhtZV4446aYxbEqfP1OXHcG7guzeqxPsg8Id5lyoXNhfSZ1lTRteizQUnsTkBWKTHJjKEupeff1MVj8jCChm6l+BoDAUnigRiBi9D20budp8I9G8YocjLBgQmTI4BPCIjv22x27wvM9WqB4mWHfHg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLA71ldIQOXsCKrLzzfm+LPt8myDPkE9MkNW+HffgQQ=;
 b=qDl1WzgmW0ICDz1KJBH0aspFXt7e3H17X4mxJxbDfNDvvG2ma2nwi5ri2gJnLpeUjO99RQBLxyNHKcXMk13jhJvvIwE7ORpxl/BUqvPkKUB4fGHYGPAgSl6FWWOxNfRSMLmRzIbl7q97Hz44Uc3gxT8INHXZ6t9SnV7TTJg0YrLGaKshHJ6wxNz20ZeIH30hf+5MWO+gNbqiAJqTlmk0v350onBANiurUk2wo40HkUbM147mv5vtKF+aq0HP9Ojh/yPN8YaArp7QrWCvOHgYw5qrIfJyr7hj5fxCQxSz2vRRQuUCpPbrqKbohavxsqQ0bqyBDeVBUGJBggHH1e8zAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 01:27:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 01:27:13 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: David Hildenbrand <david@redhat.com>, Bharata B Rao <bharata@amd.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 dave@stgolabs.net, nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
 xuezhengchu@huawei.com, yiannis@zptcorp.com, akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Date: Mon, 26 May 2025 21:27:10 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <4B786FED-0247-4105-B9F0-F2E3D865D0FC@nvidia.com>
In-Reply-To: <87a56yc0mj.fsf@DESKTOP-5N7EMDA>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
 <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
 <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
 <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
 <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
 <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
 <dbc7c66b-24c9-49f4-8988-a7eec1280ca8@redhat.com>
 <94BF4806-ABCD-4D01-8577-9E138A634815@nvidia.com>
 <87a56yc0mj.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::31) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: cce80a0e-403c-45c8-e6f5-08dd9cbd9bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KTruqQ33D2+fuIpcNLJdwnhL6HpA2dpqzwH9Mnc6nGbA9vwBHZ5r/0yFXnZc?=
 =?us-ascii?Q?jXZSga+A3aZU2rIne0Ko1CEGPsRzf/hnx0fPDn+rH6JYsqmogsot5/4vbrv8?=
 =?us-ascii?Q?0tbrQ3Ub3Is/2hH8fV9xWkutNJwkMRMW1q6QOz/CGMQCtm6FNrA/sw20rwcN?=
 =?us-ascii?Q?4pvBOAktciHsYYlkVep9DRN3UsHv2C98cOPVbj3cFrWMrDuI9jrxDDed8xGI?=
 =?us-ascii?Q?NDKeLBCQoqXfVQ5rQtGeGv6HHXCJRvlzyGvvGX90GMG8LtHHolG0bf6ivtIx?=
 =?us-ascii?Q?6l0mQnbf8B66EmmWth4qTIctdIwYjoos6L2G7KWHMhFPDxoE6fqF/7jpqsX/?=
 =?us-ascii?Q?jMcva9mywqiRG6NulVp4wwQhMmDnxVhdwWwfjrpqBCrB6oPRW2NQDqGISRLa?=
 =?us-ascii?Q?+7QTBr6jTXkrYq7xSMdpipg+OXCvg07jP1+upgMB/+OtexB3Us+Bn8fEL5ei?=
 =?us-ascii?Q?u/sRPL/PD5tl4SvtTI48AUA0qDOADTyQLFQ5QLt5SPrfOUbCaFmn7kUOlAtW?=
 =?us-ascii?Q?3L/nMFbb3pVYbRWXzyUylxxTWfCp0ZU0eykhbllEO5HzFwEYZ8CPhaWLcBC+?=
 =?us-ascii?Q?le+0tSEz7ynQBl9gqBIDkNqdZ7zaasvgPcNIB/fRSRPkZF3k4Kuh568f+VNs?=
 =?us-ascii?Q?BNQOhgjI6QHiRYIH6dgSWWjyLIFh+PRBLtKI4q/T4hTorYBKVhNgXoWiRM2Y?=
 =?us-ascii?Q?dpAmp24pBJ2KHoGUCRUiY7Os8mwa1vlRm1Q1Br/nB8r3mpqU+jXSTD0sBm1t?=
 =?us-ascii?Q?+uF8mLNFeVfjRx40oKGrCvMSMGMnPcDv5fzrvSi1X+QcO4u09Un6B0z8WnUu?=
 =?us-ascii?Q?CpeLN4KYlw6iNfsZVTm/5ixxArtiH0C906FU0shXVEcJIizpHBeJ5uF3imYa?=
 =?us-ascii?Q?fTJkcdzAhaFJCjqm4ZuIoJhM2Zx1p+NuF8czvBEAA45id0kr0Bz/c+Z0UOaH?=
 =?us-ascii?Q?fmN2UsgvvBcZ/G6HDscfIBE9Of8b3O/2ZGt2dUYE/R5jGw40Okpf9wdhlQlp?=
 =?us-ascii?Q?iE/VVCedp4PXjR07VfHtHljbZYeqeyjjilYnF9KEAfGsBoGfBYJibfSvysLo?=
 =?us-ascii?Q?LsV3GjmQNCZp8mNOfhaj7KIgba1Wenf0ow6/esnFwrze2VIJdPEHpOarmRHD?=
 =?us-ascii?Q?33SkqslRaBas1nrKVQWbozotOhlWKwmUGE71xq7ADxo8pd4LfkLCbbdyJjEf?=
 =?us-ascii?Q?bVMRSd6/pXXVmBK6/BxJLktPmqqa5WYzkZ782Q0BGP/8LJDkuqm4UqTDYFE3?=
 =?us-ascii?Q?aaMra7pRENUqkna2uqYERSgxZuYklYuP3WrWQa0upykRI4vDkeeGiF7TJeDH?=
 =?us-ascii?Q?ugqqud1RnSE53X6qOK9qyu6gnSX66AAriUIvyJFTTyZ5gUOv0/gb0C8NONY5?=
 =?us-ascii?Q?GUy7rhHEMARfka9Q2W3A/HQpkJ6tOoU1fmq8ojT3E6YCW0uhJzRhAqjpDBhY?=
 =?us-ascii?Q?gKfq+CyMRng=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8IeT8ylpsiDv65rCEfkXxc2AMFNyQ4BpLlwMXZoozVbrcrx6Uhobx/zEUejj?=
 =?us-ascii?Q?spRQfzf3686YRybz4l95xszfO8Ld3NK25YqvkQVaN93+lk1qEjoW7owVKGVY?=
 =?us-ascii?Q?debmkM2vkjYgwjskWGKLXO+zI9iRXb7jL/sdO4b8XyC7QbcSjBDKzgcbCRj2?=
 =?us-ascii?Q?egeQ0L1igWUpoj1n5SLp8fNQOYCwl6GDLTFzqrsVL3RDm+2GY0NaD6LnmS3J?=
 =?us-ascii?Q?CEFJWCEW9677hRL/+EWYCrKXNqZrV9Rdy/zf36/q0feG6j32KAPGajC/ncPN?=
 =?us-ascii?Q?1n48rAD/MpzZoGKPETrL2SF15f1ACUAB+1fWKLJz1zpqv5bL9nszeafNi75H?=
 =?us-ascii?Q?2+LzBybi9K4bGQPg0scFgp88WT8lKG/RAvKC04AAWTCMCi5eE6JMmfZg6/Yu?=
 =?us-ascii?Q?ApBjkhy753DREiUo0MUwEvKxxT4RxsUUnI0V3UraruaS7R7pZJ1ua1Jal4ns?=
 =?us-ascii?Q?TG2Vy7lr1NU9eN0dQsUDRCtab6q/2grtUfpERSkLPGujm0Ma51VhxbrtKSnB?=
 =?us-ascii?Q?NTHljEtvhN/BWoRXeMLIoWQRRfNCaeUdcISV+Rf9OK5Prxo2wsW88m7QUKyB?=
 =?us-ascii?Q?cZMVMvQtQQuopv+Xs+XeErbjE+dN5b8GldL8xyw3JrxvnDxOoAmjRsAsDIo5?=
 =?us-ascii?Q?Z58mwuSmbeGk283b8ByP6m76gpSogrMFYZgvJY2msDBJUOzc2OXD2ccibui7?=
 =?us-ascii?Q?hOO205znyvGCOCBG6LLLf77OWnShco4QCKQuCKMmhjYdWCR2Is64TTWfXLG0?=
 =?us-ascii?Q?ZHIc0D5vA/l8LClH8G9cgFBVrqXM+mreGA1SVvyQ1EZrwrNhPE2cm1SQYO90?=
 =?us-ascii?Q?ApR0YNhvYtT9Ak60Jffo/AeewvEw85eGajDZugh3XeKjUeMwcN4PRhg90/gC?=
 =?us-ascii?Q?1ZzIRRLIWPtK1DLTOdUwtwr99PYtEQSci0mwai36NCQ0wmotW7aleirDRu5O?=
 =?us-ascii?Q?0iQ+IskOTilxtuFKc2QIy7Sm5l+6ymppkZ7iHC4YlzG8xpmn3wi2thPnWXri?=
 =?us-ascii?Q?W9tYHZAtNzd8Br7nIgDtDTwwzM8YE1j89lM58ljuZqAzTmWH87lJG9MIxjSR?=
 =?us-ascii?Q?RmWxcFDt5r7kU5GQ1YEsTGQIzsbOj8mz2+mwxOaKb9ydEd7tbH8Zoso0Piow?=
 =?us-ascii?Q?/tYXsMcvIYn1ePWa2L3K77WK1UMebkNOt4M6pTj7FDM7RmDnLRW7zOvM2fGi?=
 =?us-ascii?Q?0a3DbGld5w3CaQV+p9v0Fj0TxxBZwoMZKSweP1t5i9WrCBeodQNtdUxlI22f?=
 =?us-ascii?Q?NynqbJbgjjenvbtDk+3yF9RCNJ3o9iXWp4lCMGKvR8f5/Wxk+DWHLeZHf1jy?=
 =?us-ascii?Q?AGHRMe7V7o4DjXM8as25gCkqK6SWdSYMbRJxodod7VnWYKmrhf8ShbVSmqJj?=
 =?us-ascii?Q?Y7VweDu6smCqCzEDbU9sU2nkgJqyZGRRCVs3pwRUBPont6BeekotT/iEywiV?=
 =?us-ascii?Q?u1bS6k7tAqf4xPxbitPrLLjcX/BxbBJhND8w6/TUotYnraI9YKUASlK2uSAt?=
 =?us-ascii?Q?Lzd5USViLeWJBtowXINBiwEybg6rjrchCtXZ5w+XoVCAlnN0Z/hYA5ZdMEpv?=
 =?us-ascii?Q?+nE891QY0Ho9vz/sprFMDlSq5rao75Cnaj9Hi7l9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce80a0e-403c-45c8-e6f5-08dd9cbd9bc2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 01:27:13.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJRu+Jgf89AqcyOulWmNE462BjAiUXDT/0usP3nJGA+VMsU76KLK6+c0IhNKN0/E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470

On 26 May 2025, at 21:18, Huang, Ying wrote:

> Zi Yan <ziy@nvidia.com> writes:
>
>> On 26 May 2025, at 5:29, David Hildenbrand wrote:
>>
>>> On 22.05.25 19:30, Zi Yan wrote:
>>>> On 22 May 2025, at 13:21, David Hildenbrand wrote:
>>>>
>>>>> On 22.05.25 18:38, Zi Yan wrote:
>>>>>> On 22 May 2025, at 12:26, David Hildenbrand wrote:
>>>>>>
>>>>>>> On 22.05.25 18:24, Zi Yan wrote:
>>>>>>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>>>>>>
>>>>>>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>>>>>>> Currently the folios identified as misplaced by the NUMA
>>>>>>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>>>>>>> hint fault handler as and when they are identified as
>>>>>>>>>> misplaced.
>>>>>>>>>>
>>>>>>>>>> Instead of such singe folio migrations, batch them and
>>>>>>>>>> migrate them at once.
>>>>>>>>>>
>>>>>>>>>> Identified misplaced folios are isolated and stored in
>>>>>>>>>> a per-task list. A new task_work is queued from task tick
>>>>>>>>>> handler to migrate them in batches. Migration is done
>>>>>>>>>> periodically or if pending number of isolated foios exceeds
>>>>>>>>>> a threshold.
>>>>>>>>>
>>>>>>>>> That means that these pages are effectively unmovable for
>>>>>>>>> other purposes (CMA, compaction, long-term pinning, whatever)
>>>>>>>>> until that list was drained.
>>>>>>>>>
>>>>>>>>> Bad.
>>>>>>>>
>>>>>>>> Probably we can mark these pages and when others want to migrate=
 the page,
>>>>>>>> get_new_page() just looks at the page's target node and get a ne=
w page from
>>>>>>>> the target node.
>>>>>>>
>>>>>>> How do you envision that working when CMA needs to migrate this e=
xact page to a different location?
>>>>>>>
>>>>>>> It cannot isolate it for migration because ... it's already isola=
ted ... so it will give up.
>>>>>>>
>>>>>>> Marking might not be easy I assume ...
>>>>>>
>>>>>> I guess you mean we do not have any extra bit to indicate this pag=
e is isolated,
>>>>>> but it can be migrated. My point is that if this page is going to =
be migrated
>>>>>> due to other reasons, like CMA, compaction, why not migrate it to =
the target
>>>>>> node instead of moving it around within the same node.
>>>>>
>>>>> I think we'd have to identify that
>>>>>
>>>>> a) This page is isolate for migration (could be isolated for other
>>>>>     reasons)
>>>>>
>>>>> b) The one responsible for the isolation is numa code (could be som=
eone
>>>>>     else)
>>>>>
>>>>> c) We're allowed to grab that page from that list (IOW sync against=

>>>>>     others, and especially also against), to essentially "steal" th=
e
>>>>>     isolated page.
>>>>
>>>> Right. c) sounds like adding more contention to the candidate list.
>>>> I wonder if we can just mark the page as migration candidate (using
>>>> a page flag or something else), then migrate it whenever CMA,
>>>> compaction, long-term pinning and more look at the page.
>>>
>>> I mean, all these will migrate the page either way, no need to add an=
other flag for that.
>>>
>>> I guess what you mean, indicating that the migration destination
>>> should be on a different node than the current one.
>>
>> Yes.
>>
>>>
>>> Well, and for the NUMA scanner (below) to find which pages to migrate=
=2E
>>>
>>> ... to be this raises some questions: like, if we don't migrate
>>> immediately, could that information ("migrate this page") actually
>>> now be wrong? I guess a way to
>>
>> Could be. So it is better to evaluate the page before the actual migra=
tion, in
>> case the page is no longer needed in a remote node.
>>
>>> obtain the destination node would suffice: if the destination node
>>> matches, no need to migrate from that NUMA scanner.
>>
>> Right. The destination node could be calculated by certain metric like=
 most recent
>> accesses or last remote node access time.
>
> Do we have the necessary information available?  last_cpupid have eithe=
r
> last accessing CPU or last scanning timestamp, not both.  Any other
> information source?

Not at the moment. A unified page access information framework
is probably needed. The recent LSFMM has a related discussion[1]. We
also have a biweekly discussion on it[2].

[1] https://lwn.net/Articles/1016722/
[2] https://lore.kernel.org/linux-mm/ae6e7b19-f221-9a5d-a3eb-799ed271de11=
@google.com/

Best Regards,
Yan, Zi
