Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED920B813
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269246; cv=fail; b=bcRbvbp4AyMafyZajr2HxSI/fbmY6CFa6v86FEsMe6a9ijqvm0ZVfab2g/7Ueo7mdBly9kFUi4qBZEIQ3Lds5skQWgH9bj4yZLANJ4brYbbwmAYxxmyeTqrec/cD7uEByyzxWmjHYDNS3G8e+V73tr8HGlW/QjyNZTD5BxcY/ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269246; c=relaxed/simple;
	bh=7NUnbYSboiAq9BpRjzFZndSqo5QB50kvCzdZm05rDOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qZhQ0KNiqGmwtbs8F+Rp4GOOD8hYqpWP1kI62mGbEK22jjPKG2BrtZkvdhhYa1kHBXO8GJxk88X398sZtRBpNBFQvFenCzmkGvTcrIBExOqKSOMiaPBNJ+YT04G0vLNMMH6LtCuCXmCTHI8J9Xndna+x8xvb9pNO5rMNMX54OC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YcMgWlEH; arc=fail smtp.client-ip=40.107.93.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YcMgWlEH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEROyrOyCbya9uttbeHuB0Gp3/d9zLUg6k0i3RyV0z8w9mblsbUBmiJKqptKt50QU9fDP8PsFDFLqse0ESwZDwn+EvbJodyOYGyHKYx7Uyqyo4jZEdg3HSqn1HRS/VPT4UzpCkb3PcVkeCGq/D8nFPnrUcJ2NOh03YoUagYUAa8FIa20GAYHR+35Ucj6bnRRx/hFo9ojT//seEnOBF/E+wSMpeANmFcgSZn0B+0zIB2JM8dlnFjXEl/SQRLopU1XiZJKcKzVv+wvMuSbwGFyZkahhCcb/M9TQq+wqhB5x+l5TClpmK7XRMV0pcfQLliibLZR2YPljG1rghFjPHxocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Udmzc0N4RngmY+7U4CajZdU30xHF3Lh+7BQVDzSNhOY=;
 b=v2zs2RSL48sspzLTIb0ePnu/TIlyolq/WrgwpRxmeCzWFOpMWuMf+nNDQ+qff2bL11esUH7/YIOl1kxg84rKfl6anTLP+cEE/gcQf8lhPR6CLu2auoIHz+pB4jL7FMgyK7WTWSzaX+DqfU8TYNbBP1H7lfBYL5fZw2UOUN3e0lpfNtq0MH1V9/j7Ft2YnDRKU5Sw3A73ydQFa6pDsXjoD/LuMh2pG8zlrUE6MU3ToRpW4jBr8C55MWkOCDvc+t3u0PtMzMHr2MZbi/tviKTrqLM1KU5EhPFkFcr5fqlbonzmD+IsxVrvSOo82fmQ4T62rL+tbAJahgk8NxMIqa1Ziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Udmzc0N4RngmY+7U4CajZdU30xHF3Lh+7BQVDzSNhOY=;
 b=YcMgWlEHSmEUlQa/Vtcie+bcq0XAC2pgyTeahgVzHMzK6yc/6nDigve7v4madWwr0TB/VXV6wqXnC7SzWsGIE8djpntn+lNy50AQmNuaN1pSVilhJ/EoJVkGfEzBy/t5grawr+oojarESCqGrel+t+LgwJzdHMtgQlNzexdJoun+6qeXPEYx7FsswPhRRprmIuYVz9Aocy9+kUXflUW0tnZy3C11SX6Skv41EfcoPVHT3iHTDPSulMkNc9Go2NhK8x0DguC9RA429RLh57RHowKsuFpuy38/LEtBJvy/MH3TyaQ0tk+D9TxkpM7xPD74Alh6vr9CcRlMt9Lf8goV3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Mon, 26 May 2025 14:20:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 14:20:42 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
 mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
 riel@surriel.com, rientjes@google.com, sj@kernel.org, weixugc@google.com,
 willy@infradead.org, ying.huang@linux.alibaba.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Date: Mon, 26 May 2025 10:20:39 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <94BF4806-ABCD-4D01-8577-9E138A634815@nvidia.com>
In-Reply-To: <dbc7c66b-24c9-49f4-8988-a7eec1280ca8@redhat.com>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
 <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
 <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
 <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
 <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
 <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
 <dbc7c66b-24c9-49f4-8988-a7eec1280ca8@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR01CA0023.prod.exchangelabs.com (2603:10b6:208:71::36)
 To DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 4031693d-8ee8-4c70-b98f-08dd9c607f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qQeuOtYTbWlMxIfe67fu9Vr8STybrMOYuMO0sVwtQ3IkhTeFA5cMhonGwVBA?=
 =?us-ascii?Q?kPTGQrTYcPhXuRbYiaSWvaA4XEMj+hriyUW9mj9pcLOr9gDp0sDDDrg1ck5l?=
 =?us-ascii?Q?tIzsqjBT6ReS6x10vRZTY9BpR/m4p3kfl/BoOFW9//sb3zS3pBaa7J7l67IE?=
 =?us-ascii?Q?3SuTwQbwWHfKKZk99i9Wk7bLNDGJyE693sHRQS21SfgjJOidIF1BcHXS6yhc?=
 =?us-ascii?Q?koOxlygM7BXRv8nfc+hyEVupY2cKIr5TkTGfUmL0JXaoTLPVgSk/j5AB7U9n?=
 =?us-ascii?Q?Zy4qoTHnbaRI5E6FXNBgZG8Fnr9Pn1uiczCZODI5VP0ASG+KWwJyTCU9Dwjn?=
 =?us-ascii?Q?lNZlhs6FLW/L+YFtKnIFbouNOsN9hyB7cuvk9hfoGIL8T0S6mkdmTjC3raPf?=
 =?us-ascii?Q?da0KxZnQoB0eKaON1CXpVAHcl0PK8CRtzguvGi/b3txINScRzS4H7c30Yq/P?=
 =?us-ascii?Q?XNAQQlIH+ORKRU3Bd87kj8/Gt9mPFGdx1UMrdgFhfqNIz2U2qtxSgi7MxWIm?=
 =?us-ascii?Q?WShZAZa6BzOm/sLYF5QZfmfvka6jKiAWgSUPlFsklfkJGlEat9DHjTZJ3+7C?=
 =?us-ascii?Q?JZR24waA5nVhyUXeBXGq9StLmw4G78SiQDTH+eY4jCR5orO2epzRM4YwP72J?=
 =?us-ascii?Q?zUFyuKpkXP4GHSI07qu7MeIWdttFgdnq0ElXByq1NVcS6JYM9+sUENhGLyqf?=
 =?us-ascii?Q?zFAPdzNFfGtDIRDKr7qGKePSXPYa7kSeOgs3Cu9OxBIpRCY60F0kuIHZ64Ct?=
 =?us-ascii?Q?VpgCl/dg/oHsYgX+XUf23tUnegnnr6Rp96ovJj4il2QDnsqqKnUufN6g5usl?=
 =?us-ascii?Q?t+c3meWOOuXDbkQPt+n05yqSRb81nXHZUys0j7ht+pN7q17St+gqk/nzC1oL?=
 =?us-ascii?Q?flBbHuJwwSgwi3lR6kdDV8nSr07ZmoNAXSaoTu832RqAygDnA3IMmPRwrb9J?=
 =?us-ascii?Q?RgOOEbmNd+TPQCH/LvAUeAk5oe7bjVbNB2SGHKm/reof1SmTH1PHUG1tVVM0?=
 =?us-ascii?Q?jMJgWavRTvdh+njOJuWqgn9HTpEnHcNDNjhOBPpQiaAxppNXtJA2lY+tU3kS?=
 =?us-ascii?Q?P5Fd0iVsifrsr9awfhPoo/fL0LdkQnLOBdXgPFP8wj+veHdRQXBpj4YHSC7I?=
 =?us-ascii?Q?3GMcPW7uhl4nN9w7tsTCb7K5YJlLEJZ/40ql2IWAUymC64oRVYevroIhKc6t?=
 =?us-ascii?Q?Vs1gnNSZO0PMsbbOc+Sogu6MeyxJX2vyhBZJDXoPio3oui6r3UKIlNmK6kUC?=
 =?us-ascii?Q?vDxtaiL8zHCuijjHz93LSQwJPRaMXqGIFWLYmYcZQiLhJkoJy27hE/272OQh?=
 =?us-ascii?Q?kcKzJo0Mu/4hqmF4JOgzsniufWJKt+c57vzFQ45of/KR56D3YFoyg0ror4dA?=
 =?us-ascii?Q?zYug5FS3MHwhOyYXZerXtQXabkJLKAeKn0l7hcaa8U+xp4vxcwEZN+QrdBhx?=
 =?us-ascii?Q?cqELnFEwQHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pciEU1QCjqOGk2RnsLUUbVC/S/O9gEym0WFBd7RUJFmYu2vjbjlJHriALnkf?=
 =?us-ascii?Q?L0DrSueHVYx6UWK2D1XdzRLgD/tO8+Rnraw8rpLS1FUAjnjgx9eMyvgnGAqW?=
 =?us-ascii?Q?nyO2lKFOzre2wSP8PCQ5Tzn7SJtK1wpBsl01fJ7BKP12DJab5c2o4vWaizKq?=
 =?us-ascii?Q?uty8psrPbdcLzLBPrdHLIzB+SNkWGkQgA9TRFFVEJaBDS5Z3emp80tDULlbZ?=
 =?us-ascii?Q?PGsFUY6QBoQYOO3p68h9frYICMLEHxmVxrU8+nAupA4O2SXiZxcHeeAF44DE?=
 =?us-ascii?Q?rxLDbExsLIsJTQUBbhVgSJ7mwhmDDH+qKvZnusV6P/h04AGzygvJrMC+nuem?=
 =?us-ascii?Q?vOSWB7TXdJRCRuNAs9BX5sYWun/pmNXQyPAtGFlvIpKMe3W3+J5Sjkdhw22j?=
 =?us-ascii?Q?yl7lW8q4W0Cf28gYbHznzN694xXsOwDa3kNg/KHIZbOrQVzCwSw02ZhmdG87?=
 =?us-ascii?Q?uK2Fd2Uhv/3ITOtnHg3I38ykmCyN2GtThfR8R9CUput8qHv2aZuM0Kq1ifu7?=
 =?us-ascii?Q?qX2yJTRAEzWvs35mUPQNzJJZbGA3X3YhkGgBPBZZQMnp7a6SiicNBwARUpoU?=
 =?us-ascii?Q?HEy8RU0Jsqaq+8LuqgGo3urqCg0KJV0B1HoD4JDggPUDnmCXRIc+tWFkZdMj?=
 =?us-ascii?Q?y6ZSXPN0v+yp+3y20Fuvct1G5rwsJ5V0H9FD0sdFRObtHIBxtoheifahZcN4?=
 =?us-ascii?Q?Ux0IqyFfDz7qEcRPv+6iPwvdfAq1FvI72b3t3QtLsVtFjI7IgVJWRFn3moJO?=
 =?us-ascii?Q?Zxt1QhZkOzvN1fS+k3kegAjHdxAwNTQEz4MrbEUTMRjMtftF5kp1oZ3eOBeZ?=
 =?us-ascii?Q?rkfLOz0FXAn3BCRoQ5lVnzzsQuT2IW0U9CwMrEQirM/eWRcdTsPy3Iq8lio2?=
 =?us-ascii?Q?hOGmZHbY70C5B70h8hWQsgC+pFuPHnN0IiGg6ug2IdoCXB/V7uNEt9u0Bzge?=
 =?us-ascii?Q?LmMT4ZQ1Oy5u3irvhAOlpleasWQE9zTkl23VzVpBOdtWOkG4xBpFuLtx4O01?=
 =?us-ascii?Q?k5aHg89p0AiN706oCtcflNOQl7bpFT+JKo0APYvV9uZTmDrrv/IYD+o/S3JK?=
 =?us-ascii?Q?mhTtNSgyQ4RLNDcJIw/H61Ni9OZDMYWWaqcDyyadFyECPu6DYaUE8FYzVzHx?=
 =?us-ascii?Q?MoEPCyyLeXD1d8FBj7MVsOSXzTGHms8RSc+FQjnSFWpi7SnxoYRWg6SEyw3d?=
 =?us-ascii?Q?+uTAXvqddG6Pluvw5IjBAZiRoqnrTWr7WWrv1tLE5EwqEI8qXhjdcgiQwbQ1?=
 =?us-ascii?Q?T4bWm4XA5yutzvwwF6lVVtqFj/KohTdgZHOQ3ygQMrlqSEkdc0IXfdwd4wwk?=
 =?us-ascii?Q?2yqo3NhiAxMmsJe6EuWVGRxC7yMkJgLTltQUKbBLTEsvwTqcQaor2gAGbTmB?=
 =?us-ascii?Q?UnyqF6glwlUL3s14JBLTrXmB5hiFuI0bgYfJ1PRCCTW+NBu3iGzMtwSd7Jph?=
 =?us-ascii?Q?QGv641pW+Lm8ZN7AdjCG3OnKyVI+F+Yk53wk0dGH4En1aDQJC7zsbo/odkKL?=
 =?us-ascii?Q?SZK4/cwInmcJxXoA9acsVzP/OkUgJH5JmUge8HE2og+spUJVd8tPgrsDKJ6s?=
 =?us-ascii?Q?TzbqU7lkP7ve8CLjc0iZNamI29Xo4tMwPWxXNwrp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4031693d-8ee8-4c70-b98f-08dd9c607f19
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:20:42.0765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8p2PRQFaoZZ2P8Y96ltC4vzKRKAlCTZmUOMfJqHf7i/vjKBZQ8m58apfC+zSeakE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232

On 26 May 2025, at 5:29, David Hildenbrand wrote:

> On 22.05.25 19:30, Zi Yan wrote:
>> On 22 May 2025, at 13:21, David Hildenbrand wrote:
>>
>>> On 22.05.25 18:38, Zi Yan wrote:
>>>> On 22 May 2025, at 12:26, David Hildenbrand wrote:
>>>>
>>>>> On 22.05.25 18:24, Zi Yan wrote:
>>>>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>>>>
>>>>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>>>>> Currently the folios identified as misplaced by the NUMA
>>>>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>>>>> hint fault handler as and when they are identified as
>>>>>>>> misplaced.
>>>>>>>>
>>>>>>>> Instead of such singe folio migrations, batch them and
>>>>>>>> migrate them at once.
>>>>>>>>
>>>>>>>> Identified misplaced folios are isolated and stored in
>>>>>>>> a per-task list. A new task_work is queued from task tick
>>>>>>>> handler to migrate them in batches. Migration is done
>>>>>>>> periodically or if pending number of isolated foios exceeds
>>>>>>>> a threshold.
>>>>>>>
>>>>>>> That means that these pages are effectively unmovable for other p=
urposes (CMA, compaction, long-term pinning, whatever) until that list wa=
s drained.
>>>>>>>
>>>>>>> Bad.
>>>>>>
>>>>>> Probably we can mark these pages and when others want to migrate t=
he page,
>>>>>> get_new_page() just looks at the page's target node and get a new =
page from
>>>>>> the target node.
>>>>>
>>>>> How do you envision that working when CMA needs to migrate this exa=
ct page to a different location?
>>>>>
>>>>> It cannot isolate it for migration because ... it's already isolate=
d ... so it will give up.
>>>>>
>>>>> Marking might not be easy I assume ...
>>>>
>>>> I guess you mean we do not have any extra bit to indicate this page =
is isolated,
>>>> but it can be migrated. My point is that if this page is going to be=
 migrated
>>>> due to other reasons, like CMA, compaction, why not migrate it to th=
e target
>>>> node instead of moving it around within the same node.
>>>
>>> I think we'd have to identify that
>>>
>>> a) This page is isolate for migration (could be isolated for other
>>>     reasons)
>>>
>>> b) The one responsible for the isolation is numa code (could be someo=
ne
>>>     else)
>>>
>>> c) We're allowed to grab that page from that list (IOW sync against
>>>     others, and especially also against), to essentially "steal" the
>>>     isolated page.
>>
>> Right. c) sounds like adding more contention to the candidate list.
>> I wonder if we can just mark the page as migration candidate (using
>> a page flag or something else), then migrate it whenever CMA,
>> compaction, long-term pinning and more look at the page.
>
> I mean, all these will migrate the page either way, no need to add anot=
her flag for that.
>
> I guess what you mean, indicating that the migration destination should=
 be on a different node than the current one.

Yes.

>
> Well, and for the NUMA scanner (below) to find which pages to migrate.
>
> ... to be this raises some questions: like, if we don't migrate immedia=
tely, could that information ("migrate this page") actually now be wrong?=
 I guess a way to

Could be. So it is better to evaluate the page before the actual migratio=
n, in
case the page is no longer needed in a remote node.

> obtain the destination node would suffice: if the destination node matc=
hes, no need to migrate from that NUMA scanner.

Right. The destination node could be calculated by certain metric like mo=
st recent
accesses or last remote node access time. If most recent accesses are sti=
ll coming
from a remote node and/or last remote node access time is within a short =
time frame,
the page should be migrated. Since it is possible that the page is freque=
ntly accessed
by a remote node but when it comes to migration, it is no longer needed b=
y a remote
node and the access pattern would look like 1) a lot of remote node acces=
ses, but
2) the last remote node access is long time ago.

>
> In addition,
>> periodically, the migration task would do a PFN scanning and migrate
>> any migration candidate. I remember Willy did some experiments showing=

>> that PFN scanning is very fast.
>
> PFN scanning can be faster than walking lists, but I suspect it depends=
 on how many pages there really are to be migrated ... and some other fac=
tors :)

Yes. LRU list is good since it restricts the scanning range, but PFN scan=
ning
itself does not have it. PFN scanning with some filter mechanism might wo=
rk
and that filter mechanism is a way of marking to-be-migrated pages. Of co=
urse,
a quick re-evaluation of the to-be-migrated pages right before a migratio=
n
would avoid unnecessary work like we discussed above.

--
Best Regards,
Yan, Zi
