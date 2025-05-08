Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F057E27A13D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736194; cv=fail; b=XAUnPBES/JnT7qEdw5CnOUmolZIibjpCLFfogIzlMsmhhcFATlLnAXP1m6p4ppQgwqoJOJw8o/oL3T84eyLLt4xB/zRPM4d1zV+NTiFmVwR7M5KuVlIfGV4ILe9iHffdu2ZxgqGuJJaQ1w3z4xEUJWSQR5Kjhid7UfO1KyCajUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736194; c=relaxed/simple;
	bh=lfiqWjmhiv7szQb/RQddPIV5Ps0q7mnXpDVulNPsjL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TI1+CwSK1/gEKjIPjcz8mC/0LkO0vz5GdQPUAPs3rZf8CMwLGR/YisLLZcIn76UsTopDzgXh1RpyFljELydN0MTYWm1GE88xVc11lCkah11CRsHuaeqLdBpE4QeZeWr71doc0rRTR9oMd5D8P++7ydzyT1lJsoZ2Is/P1jUdlY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PT07nUpA; arc=fail smtp.client-ip=40.107.244.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PT07nUpA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUc972d2GeuPO4UrtN48kcanSa//7njPRcrRZ3DFsVJwYPTkhZ1vj17/4N41io6d3MA94Iweo1ot4uQ6pNSPVCQ/8kbiP9DSfhrCX3INlGY6XRA+kOqxbSb4ea7K4O9bo9SJhjV1Rw2NvUNvCG8ir4I20APJKqmYNtHkPefI8U8WvuO/C+V3LNddVo3BZujKKuBYZxs6vN8TKJOpp3JDDdeDNcI5BJFF6OkvSSynOm7U/8y/+tRSRMDYpQRnp7hUi1h3mPGBUU4hsv1MXlUEnveAQoHW64icGBV6Ft8GYlA+ycILOS9dWQevNTmdMAqMi5AkqR9pD9Hi2Gez6uJk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPpAFjPAgRH4H/6+ciUk8IK6mFrYZTTvgFOv/DSi10U=;
 b=OfpYBkBWK/bcp6i4ezoR5MYqG1fjHLAqS7lnhdbmvKli6+8d8glOlO3nNNVdq+qMmiT2nlPWlziMx5+g3yjhbwqFB5vmFkthjh5pphPO3klxqDh2FnOljmccMt0SE8/FWkc0ZoaNRNp9nIPkOFeUuUz4VNDpXIyAzevEA0rk7fT92i+a68pjP486GPoXKj3RF3AHeU+9rKSujSX1S+qZM35GYqds/PravjVjP0Z8tZSkMQJgSbwLby7+3qy7GEv/v8w16Pe5TuprS4kaPBhqtGJTSFvGcU4eVL4AgVX0V5YVfgK0/xtIhWBaCGpam41EzLuFoASSACIHvlyLaq1Wlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPpAFjPAgRH4H/6+ciUk8IK6mFrYZTTvgFOv/DSi10U=;
 b=PT07nUpAFnQy8OEklomGkvFV6ADov7jiALf4fjc+P1qT74pNplZyZPFVYHx/Y0Txf02GLmgTNhKp5+E06FSqxza57XKAAD0ZqM9n4GY8LMTuXs+FP9iz0uxn1UAK4OcVbBMRrTsPcWLGey+fHB2oGXiTAGMU69xZNZ6n5n/ax/mpVokhNbzBNwrfB8BFKvpMDhAhbYga2xi7Fl4fynDxD6Uoc12v5wtwbxQ2F2J3yN43XqESpgoI8BfooI02YC+uxW5zkuUVmRGjF7taddFDfK4KcF4R6fQZcK7hkGjfAlOvoBlT12gBDDvxiVXjQhgvlGIkuzvvmbmPg0Bp+YIDXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 20:29:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 20:29:43 +0000
From: Zi Yan <ziy@nvidia.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 riel@surriel.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/1] prctl: allow overriding system THP policy to always
 per process
Date: Thu, 08 May 2025 16:29:40 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <8744CDBE-8E26-4E7B-B6B1-5600D63A9078@nvidia.com>
In-Reply-To: <9ed673ad-764f-4f46-84a7-ef98b19d22ec@gmail.com>
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <20250507141132.2773275-2-usamaarif642@gmail.com>
 <97FEC8A9-A8F6-4023-913F-5187062B0E3A@nvidia.com>
 <9ed673ad-764f-4f46-84a7-ef98b19d22ec@gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:52f::15) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 648ef2a8-d0fa-4106-9d8c-08dd8e6f10d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Sj3hm8z9n1cf+WuLgfKWAIygoFtzWRVWXqexDK5GK3KRNuSXTyWcGYmiaMh?=
 =?us-ascii?Q?Z0IuyZ8zDlrt+B1W23gaRpdQU60C/kVPo/Xk9QHhJQoUOyK1cwr1Ye5sG7t5?=
 =?us-ascii?Q?NRMFbqtlBP1LMSz5Xak/oLu8tLBilxJjvhMXkAqnfKvMsP2Di9nBo1HXdVWg?=
 =?us-ascii?Q?3e3acrQoEwNje3+uxsCR3jMq2qqpI4S1krFKvlmbFu8gt3lF3SmQPlGXvwkf?=
 =?us-ascii?Q?9Dn4PywZjn8icgfZ3SfMy9wJPlolF4W/VlGiugF0MqVCuMKQxiueINZCifYn?=
 =?us-ascii?Q?tOvuPHOL6gk4g5VMYrY43dJtjQW3eDuTW/5p0dY2he/OG4EpjmYyLTlennsG?=
 =?us-ascii?Q?ozr5B5ZIMGtNXnzlG+s18sVKO8zXYjNYcdrd4hcYRW3iRmzYT4KT6C+2OChm?=
 =?us-ascii?Q?Ns0NbPPd9ix4CnltQulRGaN9sTgsnzOSt/G6d0CcSset7yY3tXTJNBvSXmtI?=
 =?us-ascii?Q?WXzavIGw0q3cOp13PQD0A/oP+QAvD7cJC1Lamwzz2eDUmPolGkwXUA+Z4fVl?=
 =?us-ascii?Q?85QcGHUkjJKCVkyPazNb+cLEF2mOQ50AmG5OATrzCU5Xvrd7unMvfpVlvd0d?=
 =?us-ascii?Q?qg8qoUTHpQ6IFVOLkY2y+hes5KP9/FYglillCycyc+3xcPoUIIaJ2qzjwlzp?=
 =?us-ascii?Q?4u+R4LgRHJ3bMK1YKeeZTyufkfnuoK/OlMLkW61q10x3nAyH0iOM5hgoViL0?=
 =?us-ascii?Q?LsgPW+E9uS53bhSKRYyv0mmq8C8XqqAGGlMjn/W+l2Ru86utyRLl0wRX0u3n?=
 =?us-ascii?Q?eenwlaIfRGnJwjpacuu8IvUNpcNcQ48O/E5uGURGfSacERQ+CdYsOmWhTH3U?=
 =?us-ascii?Q?8LVeQpfA48050efgTOBPheZlDG2ydLJwLnsQChn9BtaDDOWvEM1AZbjbGQKu?=
 =?us-ascii?Q?DCUp3ouUcz/i0FTi73Sz0P5If7QyjWrz9panP3nmjCNB2wXnQBH4ZzSoIWkz?=
 =?us-ascii?Q?yQUmR/FA8cfzPqdjntkNl82UShTmG+jpDlKKksrBG/S6fBZd40tON4pmTk8p?=
 =?us-ascii?Q?nFXwLg7U7UOk4LwTqBYMHfVAzrX/c5wxVtgblq03FkP6uK2zkEsV8mzyL5JV?=
 =?us-ascii?Q?L0q7WhZKEPLEsoFgTcDefs5W+iLXS9UDtnhZTOAvSa0xRSZMk54lG9bjG+Ja?=
 =?us-ascii?Q?6fkUo6RinC0RGUFzbpxut7m85JpIwSRe44dnoQ0mgvpjr6YSypkVhINUCU9G?=
 =?us-ascii?Q?JqcRr1B/X/dDtE0hqtgXcDo4antfTq/4JrKjxiT6rRXSy8sKLOINjZEnkIP2?=
 =?us-ascii?Q?DMMl+iGwSdnuGp9b98480stQdOiwMJygVWfuKJuXNvMtHlNp8stZqJtcopBp?=
 =?us-ascii?Q?Tr2c7cFJs160YeHYe4S411jYblsQeFEnUCD/0fyLydzlSMGKIsGqUbtAwbry?=
 =?us-ascii?Q?3foxtcAvBKt2oaPymVp7AujEKxnWpkHSEv7O4X/3n11+/qWJfCPDV0zmRrHo?=
 =?us-ascii?Q?8D8Gyx3X0Qo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fay3uIQzvUCgnPgxzeQLLmrR5+6Eq0CAd984J+Dr5r8fscAMxQo7PNTNYcsH?=
 =?us-ascii?Q?QIW82Hbi7UOk5Zm8u9AuAPNqr1Aoe4iQuGX6/2pZ1nxKVvf74KAYo0Rc9p4x?=
 =?us-ascii?Q?0tp/pu6PDokn3FsVA45jo1usQQkMHSHSldiOHLGvGaLRRRUjMEoVNOb80iZx?=
 =?us-ascii?Q?5gCVAAsKQn0v5gBto0z+BtBa7mxrm6reNVa9YSDNeNsFwq+1KY/5gJRIk8iL?=
 =?us-ascii?Q?Vt06lhacDnQdYS1A98DI1cejFLb7Yg9YhSyPGjvKdjclKWpPqZUx3ytrFn0D?=
 =?us-ascii?Q?AWt9fn4kz9iZO7sgvMoRYl/K71DqobeUqWtXWi8s35vUZTPIUcX78a2uZkxP?=
 =?us-ascii?Q?kmapkdYeasHUGaMqdzxsHL0mrSfsBqFXdWnfYLaX1yybGVRps01h+j019MTA?=
 =?us-ascii?Q?CQBSVWHElJ/H+aLbVBdRn41YRSbPxYyqqp7uiTGaWXxleupOOsEg5zIK0gN5?=
 =?us-ascii?Q?hTy1fTwgOGEIotKxulfaNP52SOpPqcjsUii3dgG6Rbq8Zz7XsTImGnU6tXzo?=
 =?us-ascii?Q?xZwtCHLULABa0tIOEWxvRt67dNf+DNWFgfUXSxxHwJYnTWklNem9bypbwixB?=
 =?us-ascii?Q?L+/N5rZVk3uCCE0wHi1K4TXtpnOlVIFUTIITAfCxoiFpaNOuHnXe2SLnxsI8?=
 =?us-ascii?Q?Kfj4X1MDqobwpr6BGujvC2HyIJ47b2e6WKKTRozbCADQAtv2Nsh0OOUaNn10?=
 =?us-ascii?Q?aCNlPn6NCBMnME6OL03dHSqWVJxAm+wIF4QTHFjLI4SxU40MGChnEEBBgsJ7?=
 =?us-ascii?Q?P3w75Y/EhPyKtkFZCxcNckUuiwZH/0GSVdRJSBMj6BnKRyt8VwRukY1rUNu3?=
 =?us-ascii?Q?BPytYkkZLhM1c+WIRxgDHtNNjPWGkqjdeSpt4422qGc5VBvHINxC0I6li3IN?=
 =?us-ascii?Q?bnCYGptu5mfznX0VDMzXpUat7iLaVpuoRAXyulwap86z2wk5VbGBX5hXKz+B?=
 =?us-ascii?Q?y/zp6ucqZQxV3c5Bw6ydf7kEw+efCq95cAuePvTI1wxFPROV7nTk7wPZE0k9?=
 =?us-ascii?Q?+RXyVqfVVFxoYasDPj8PWW2Nw6JcZpp4SH7TmYRuNrmvn3z1JNDXzlQwpAH7?=
 =?us-ascii?Q?2ounF8aH4WG4fEzVZKRcxyy6habSl03+X+dmLQw48MNUbaZX80LKnGBKFrgB?=
 =?us-ascii?Q?SsvpswQD0XjIeqf4mSEmf1ZrKmno0DW/n4VHfZm0tacIDaDiZw4Slxx3kOaj?=
 =?us-ascii?Q?rG1qjK/OJKAJFmpSksY3p3YYWZIJ27nMztj7wYS8j2LiFWgInjjM6joA0OzV?=
 =?us-ascii?Q?p5RAWqrdHBG1BuS7wd3EquaLCO7ehAWrMdhJ2AnvhA1u+UWWarrPQTrSSTq7?=
 =?us-ascii?Q?xb/36vyieRsmIcilF4DIBAlahgQVa6nMnWb2YTetivAG7f0YEXNh8ZGYdeNx?=
 =?us-ascii?Q?MRB1JrWLR6D4YsoZtCbe6Tui6s+/VD3PZdeLDYT+Io8TvlFEyicU97w5NTxJ?=
 =?us-ascii?Q?uGED6lEQ5xWFJFw/ckYb9uAbMkO5f71e5cBCFlBM3af3BoFQtP4PVnHt1yYa?=
 =?us-ascii?Q?hA1R+CbeiZQP6kJ6jjrSCIA7dPqwqak7Kw7FNe8yKZdDwc5moCSHhGP5D9fX?=
 =?us-ascii?Q?AETG6HMS6pedEvmUu2PJNkMngB5Nuf39AoZtp/AG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648ef2a8-d0fa-4106-9d8c-08dd8e6f10d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 20:29:43.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: znoTmpKTXjy8gvJG0ZNWOz0ro4t8En/N6yJas5HxD/wqCMmhs/LWRmZRNqwsVOYw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC

On 8 May 2025, at 6:53, Usama Arif wrote:

> On 07/05/2025 21:14, Zi Yan wrote:
>> On 7 May 2025, at 10:00, Usama Arif wrote:
>>
>>> Allowing override of global THP policy per process allows workloads
>>> that have shown to benefit from hugepages to do so, without regressin=
g
>>> workloads that wouldn't benefit. This will allow such types of worklo=
ads
>>> to be run/stacked on the same machine.
>>>
>>> It also helps in rolling out hugepages in hyperscaler configurations
>>> for workloads that benefit from them, where a single THP policy is li=
kely
>>> to be used across the entire fleet, and prctl will help override it.
>>>
>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>>> ---
>>>  include/linux/huge_mm.h                          |  3 ++-
>>>  include/linux/mm_types.h                         |  7 ++-----
>>>  include/uapi/linux/prctl.h                       |  3 +++
>>>  kernel/sys.c                                     | 16 ++++++++++++++=
++
>>>  tools/include/uapi/linux/prctl.h                 |  3 +++
>>>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>>>  6 files changed, 29 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>> index 2f190c90192d..0587dc4b8e2d 100644
>>> --- a/include/linux/huge_mm.h
>>> +++ b/include/linux/huge_mm.h
>>> @@ -293,7 +293,8 @@ unsigned long thp_vma_allowable_orders(struct vm_=
area_struct *vma,
>>>  		if (vm_flags & VM_HUGEPAGE)
>>>  			mask |=3D READ_ONCE(huge_anon_orders_madvise);
>>>  		if (hugepage_global_always() ||
>>> -		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
>>> +		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()) ||
>>> +		    test_bit(MMF_THP_ALWAYS, &vma->vm_mm->flags))
>>>  			mask |=3D READ_ONCE(huge_anon_orders_inherit);
>>>
>>>  		orders &=3D mask;
>>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>>> index e76bade9ebb1..9bcd72b2b191 100644
>>> --- a/include/linux/mm_types.h
>>> +++ b/include/linux/mm_types.h
>>> @@ -1704,11 +1704,8 @@ enum {
>>>  #define MMF_VM_MERGEABLE	16	/* KSM may merge identical pages */
>>>  #define MMF_VM_HUGEPAGE		17	/* set when mm is available for khugepag=
ed */
>>>
>>> -/*
>>> - * This one-shot flag is dropped due to necessity of changing exe on=
ce again
>>> - * on NFS restore
>>> - */
>>> -//#define MMF_EXE_FILE_CHANGED	18	/* see prctl_set_mm_exe_file() */
>>> +/* override inherited page sizes to always for the entire process */=

>>> + #define MMF_THP_ALWAYS	18
>>
>> Could we have something like MMF_THP_POLICY_SET and another field
>> for "always"? Otherwise, how are we going to set MMF_THP_MADVISE if
>> we want it in the future?
>>
>
> So we actually need MMF_THP_MADVISE as well. If we have the entire flee=
t system
> policy set to always, but if certain workloads regress with it, then we=
 need to
> prctl MADVISE them.
>
> As you said, either we have:
> - MMF_THP_MADVISE as another flag. The issue with this is we have run o=
ut
> of bits in mm->flags for 32 bit machines. So either we introduce anothe=
r member
> in mm_struct (maybe mm_struct->flags2?), or we start using bits 32 and =
above of
> flags field, limit this to 64 bit architectures and wrap the code with =
#ifdefs.
> This is probably ugly, but if its ok for upstream, happy to do that.
> - MMF_THP_POLICY_SET + another field to specify what the policy is, the=
 issue
> with this might be another field per mm_struct/process. Having an entir=
e field
> just for this might be wasteful, so I think I would prefer having just
> mm_struct->flags2 and use up only 1 bit of it, and the rest can be used=
 for
> anything else in the future.
>
> I think the flags2 approach is likely the best, but let me know what yo=
u think.

Sounds good to me. If you are adding flags2, maybe put both MMF_THP_ALWAY=
S and
MMF_THP_MADVISE in flags2 to make code look more consistent? Just a thoug=
ht.

>>>
>>>  #define MMF_HAS_UPROBES		19	/* has uprobes */
>>>  #define MMF_RECALC_UPROBES	20	/* MMF_HAS_UPROBES can be wrong */
>>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>>> index 15c18ef4eb11..22c526681562 100644
>>> --- a/include/uapi/linux/prctl.h
>>> +++ b/include/uapi/linux/prctl.h
>>> @@ -364,4 +364,7 @@ struct prctl_mm_map {
>>>  # define PR_TIMER_CREATE_RESTORE_IDS_ON		1
>>>  # define PR_TIMER_CREATE_RESTORE_IDS_GET	2
>>>
>>> +#define PR_SET_THP_ALWAYS	78
>>> +#define PR_GET_THP_ALWAYS	79
>>> +
>>>  #endif /* _LINUX_PRCTL_H */
>>> diff --git a/kernel/sys.c b/kernel/sys.c
>>> index c434968e9f5d..ee56b059ff1f 100644
>>> --- a/kernel/sys.c
>>> +++ b/kernel/sys.c
>>> @@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned l=
ong, arg2, unsigned long, arg3,
>>>  			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>>  		mmap_write_unlock(me->mm);
>>>  		break;
>>> +	case PR_GET_THP_ALWAYS:
>>> +		if (arg2 || arg3 || arg4 || arg5)
>>> +			return -EINVAL;
>>> +		error =3D !!test_bit(MMF_THP_ALWAYS, &me->mm->flags);
>>> +		break;
>>> +	case PR_SET_THP_ALWAYS:
>>> +		if (arg3 || arg4 || arg5)
>>> +			return -EINVAL;
>>> +		if (mmap_write_lock_killable(me->mm))
>>> +			return -EINTR;
>>> +		if (arg2)
>>> +			set_bit(MMF_THP_ALWAYS, &me->mm->flags);
>>> +		else
>>> +			clear_bit(MMF_THP_ALWAYS, &me->mm->flags);
>>> +		mmap_write_unlock(me->mm);
>>> +		break;
>>
>> prctl can take more than one arguments. Would it be better to add
>> PR_SET_THP_POLICY and PR_GET_THP_POLICY and specify PR_THP_POLICY_ALWA=
YS
>> in the second argument? So that in the future, if we want to add
>> more THP policies, we do not need to keep piling up PR_{GET,SET}_THP_*=
?
>
> I am ok with either, with prctl values there isnt any limit like MMF.
> I went with how the other prctls are used, i.e. PR_SET_THP_DISABLE uses=

> arg2 to check if it needs to be enabled (non 0)/disabled (0 value).
>
> I think having PR_GET/SET_THP_ALWAYS/MADVISE could be better as it woul=
d
> work similar to how existing PR_* (PR_SET_THP_DISABLE) works with arg2
> used for enabling/disabling and we dont have any limits for the number
> of PR_* that can exist. But also happy to change it to PR_GET/SET_THP_P=
OLICY.

OK, if the number of PR_* is not a concern, I do not have a strong opinio=
n on
this one.

Best Regards,
Yan, Zi
