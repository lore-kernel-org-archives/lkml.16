Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA1126A1B1;
	Thu, 15 May 2025 18:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747334529; cv=fail; b=ehxRAQXdk3wQEx5Zvp5gYb4YCz16wzkKKfU/K3K+kxnGlv5EStpn44mY8bauDI3TyCk+msCn0HqJQG0Z4aCmEh/g0fh42H/QR6F5R0tIoAtLoEz7MzKprPBYWNyId2gzaxlH/MQEqvcyj/L+24LlNv9smmrZLsWFSzozpTEl6X4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747334529; c=relaxed/simple;
	bh=l73lvTzyra6TZ4pHK+EfhBmM1gD5r6p248utgO8+los=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hbY7E94qcdE2hQN4tHEK49x8+ri8rmk4aLfnmE3Sg/jKDlvMmjfWEaZf/lUpZK54rcRyP5PXvJPq4aofD4Ek3Cgt+uGjR0e6LGma77a2rTmKxHgE/qgr+lrW5uxiF8VywLsj4MEnNMXq/nQgWEqLtCI6GFRlnJc7+b16f6/L03o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hI+3yVtr; arc=fail smtp.client-ip=40.107.94.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hI+3yVtr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLW1w6kIhgV2F4PNRGWmjK7bL8q6ZdhCkRgeWm20lSqH7U08/r8/29KLsPo5262SyOnNKV4oBi2jVG0B0sbpKgvyhuSjkZrtkoGQFZlG/SjIb88s5FDv4jKNaLGx4IIjxzQXK4OtK6EUvOs9iYZZyssBz14LLJ43IeeJDxmEvywa6mJTO/pM6J5iKD5HQttLC4aNRyv2aWpjp+XpNQ+7vVx9Pf8a61/ihRQYhADdY8KMsu/rkTrd072fxwCQJKK+DeoqM4fMxN4E+DuMWNyil8ENuVNFXg1m4xITHWuWi3RAr76IVLxxi8wZxO75Kzg8eHyPgwbOpwhBWwv+fr6URQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVDuc4+uAy+e2+ZLgLTEp7fAAcvQPaZyMU0r1QS6awk=;
 b=c2WD+L2B0rZEmam6375/b+LWdq/j6ksyiLnSSRH9RBwNUuysTzdAFfGzLEBLliG7iOU7+KLtYBn7s/6goHGZPRRZY13LhLXdqPYhWPgXI/VKCA6890eI32MYqGiNPKKwLbCuzBwSspdDddk+n7l6N7hYB9kDi+dH0eTDSIf/u1NOF73RkEwla6TOfObPaHsVAPRL4ua9yuicnGEXyUmoLBSLcGqmfF6+1s0/JoFJPQCGwJzrEDoRtPZ689+1rQxOnxB0dl1dNidHEj4Ebg8PsrkYBGPMD5B/U7CIpOoGapvkA1VTV7WoLMgAejPqVs/4XaG7OERMbWrpEunI6PUfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVDuc4+uAy+e2+ZLgLTEp7fAAcvQPaZyMU0r1QS6awk=;
 b=hI+3yVtrba/pL3i94juy5wC2FsBeIyqRL8RoNAF5mSABldEUQCtTbtv3KRNjLVaAcZjYpNE3pzZg2Fd22T/kADvDrgrEjrVtcknopQgzk6Y+vM4bO7q2N30ohtvwtcmFITOJeSVSTS7C77+zM+FjFPzzYv6uEOYyskn8TX9Nt+oDmqAwcq5JjY3H9Bo3EPpQcjB5HT6tFdiuDe/t6mxhC+uCack10qj+VlR8NqJOAVvUziprGZwEBpS259OGzW41/UYbk2ClwAU2qokH1RnIn7v5UAb4Jh2E2gV4EyhRtUsMmrWwSCKj548HAtkKqAUNyR18/c5cOYayVx3VdgKr1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Thu, 15 May 2025 18:42:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:42:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 David Hildenbrand <david@redhat.com>, Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 laoar.shao@gmail.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Date: Thu, 15 May 2025 14:42:02 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <EF16AFD9-DDBB-4FB0-BF70-B7282159EDB1@nvidia.com>
In-Reply-To: <3635aacd-04e6-4873-961c-0b1fc09d2353@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
 <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
 <c3c264fa-b74c-42ba-a3ad-615715c8fa80@redhat.com>
 <yec4eqg73qejlnmtckwjiexelswcxf3l5ctoaphq6ugyp3tu3e@vmex647zbp52>
 <3635aacd-04e6-4873-961c-0b1fc09d2353@lucifer.local>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS4PR12MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e2d177-73ed-4852-99f4-08dd93e02ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gl1xYohW1EV9cKog4xUY8E8Qdrvo6a7V4FD5PQG/MrY4NIgLwc8XlGcB/Msk?=
 =?us-ascii?Q?MxgmmZSQk0Mzuazvzn3W0LpjJFSJOgTq2+xA7omtvhQOsDvsvxxhN3zvP/An?=
 =?us-ascii?Q?shA7TqYGdYIjZkkZ77IM44vUGkt7nwDftFPgLt926gcnDZdLfUJ65XtPdYjT?=
 =?us-ascii?Q?Sr2fXroiI9466f9Mp23UzAcP1cksUNMFAdAo/POxjfkGcckX1KLZqskHfJ9+?=
 =?us-ascii?Q?ahwYc/UrBqMrjv8tECOhiLuJuV1ioHQytuxkqmCgpY+5uQ3ep/eBqrBJPqxy?=
 =?us-ascii?Q?HUmeze7kJMu7dUyxR0fIIimvPo/qd0mVhOGRFkgVGGSxd6d2Zvg3PZ6YUff7?=
 =?us-ascii?Q?CsdaNui+nbTLK4/tGri0PPvHv2oacWEkvXAWQzF5nQeXNpY15GhM1XD2WEiY?=
 =?us-ascii?Q?EgmIViWxg6JYhKm5cy4ZGR3CbHk+hXlo+YxDWkVku+nV8UT42irLow0ph5UC?=
 =?us-ascii?Q?wvJdwgwidnGSRRZPKUQ2VjTkPMhjgFZtIyuJRSpJyah/GXwxOgRHMdP9NZXj?=
 =?us-ascii?Q?yV+CQTSYDVTRc0ZZKjGIK7KU/rQ+2MVO8XGhnRvRXk9dZtvpr3i+SMyTLTaW?=
 =?us-ascii?Q?rwcHy/LCD3AwzovKZQhWLF2sApWQ8TRiCnFFE08u31rGG64UP8No1o7NXbPl?=
 =?us-ascii?Q?X54zU7pUkvbgx567j4hgL+b4fBlHPoN3IvCib2mxxkDLRe6deBLGTuZ6folr?=
 =?us-ascii?Q?aFOrNCPBZOczskXX5C2dOduxtVHLa73M3lMB+iIT06YraBUo+1LLLAn9COo3?=
 =?us-ascii?Q?nL0qzjGjQGIkdKfDW64j3oIrTH6mEqMCS4+93tbbSkzaCttnlIpHiLTjYHDU?=
 =?us-ascii?Q?/7Mh7Vy7JaMbesvuXovrTjhfftUPif4UTh7XCxsuHddc0EO5lDofeWy9PfO9?=
 =?us-ascii?Q?cZVCB7jXnJm+igZFJIal1BE1WtxPOlQfqOn9MlbOs/A4QG96UyOs0GqxWGHN?=
 =?us-ascii?Q?GQDaD8o51Wv4M4BncMuXHFusKUYXv43RkAJaJy+CL9g7Ng1n0m2OINXT47dw?=
 =?us-ascii?Q?gZjeR8ZQdR0NEQE/ZIedKuYIZcpI8vXv6hUCY837gC3b0UGSpzUT+VKQ3ZoB?=
 =?us-ascii?Q?PlUXwY6a2EqWF8XQOS4oXPI3xIrEqDjluDjXy8aC7itxXOCF75spGckfOu7u?=
 =?us-ascii?Q?GbqF+/F1SU+WUD/PbX9xTVdAZQK3+1c+pJLz+XZrWkDP7JA5vMR0ct63V70b?=
 =?us-ascii?Q?T3RLaO3FePPVlIF5GVNlxkBRpG/np6nKYndDYl9+31t5kac02U3Rprt9/Q0U?=
 =?us-ascii?Q?fnF8ugt2ZH+/bDTCVM3uWalQKnsaF1Rf3ziud4N/IfPqqwTzHcbmptpNMB8M?=
 =?us-ascii?Q?T8RGQnGM4rxYnfS+X9hEWliabSxfvO2nJ+ybbw/zhVbRdf97BwpDK4zQSX36?=
 =?us-ascii?Q?8NQUAjfj3GgYy2uLjL+XN/D3KehO77mNX5PxRMVjO1daFDGDKZllWIpfcJoq?=
 =?us-ascii?Q?M2oZvgOF0No=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oftoEARQfFODmddIz22vTH2Ibz18CCGZiOZ2ub9EkZWPzzW7KXzw3+VO1Jg0?=
 =?us-ascii?Q?soKQAdnuXO4sPcVkbHkO+3cxBtrsFcDTNA9qczR816GiH765fhywvRBVmgkA?=
 =?us-ascii?Q?KhaVcmOm+iLMkW8qQZWmnfMjPtFERPF1oMQjyLm+4l1GQLGRh80fv51f06z4?=
 =?us-ascii?Q?w2WXgmvYbyqyiUFU146wdhwvYIKc6HtIKhOIUVzFn/AI2dDiY7gV304YizEr?=
 =?us-ascii?Q?JniNcfhuoZAh780tC0i+c5W0FxlcEJkyRbiGpWxr6srjA9eWLg43daLItuI4?=
 =?us-ascii?Q?d5KSF8JnsH6klzTJt8yIGfGgU//CAlzK49WqE4xSN/3B+tg257IJgtiluuy8?=
 =?us-ascii?Q?YfRJXEukjFeumw8r7UUSBmV9rE9sIn4IyM31DuuHtaef/BsVJHAT4pz73tDE?=
 =?us-ascii?Q?Nt1zQN6q2FDP0ejVBfeP2VsUnMSKDUihyFvTvPSHR2HpkNoZI5CASRr50F+p?=
 =?us-ascii?Q?fLBuE/gnHoYzTW7seplqAOjewfRwno0B9C3o41wmb463LUm30+yMAs9yTTFv?=
 =?us-ascii?Q?Ue3ft1DF1tbboWQvxHpo0WY6sDYp6x3ZM/pMxXumkRHED2LJG9GLffuFZKCQ?=
 =?us-ascii?Q?1tCp1nzHSzdJHQqxSXmCBwZj/tRPmNU4caomNAXZYon3ZIu+Wg2HwYU2wGZM?=
 =?us-ascii?Q?C5+7aeKfK2fk+yUuojtKd78Gy/sjhfeR+HeRXj0aQ2USnVngRTQgVl1m0geh?=
 =?us-ascii?Q?natkeNlI5ij8SRBeZx0XBEARexFKqZHQYKSNqpn/c86k1JPEb//OClEAByw6?=
 =?us-ascii?Q?TcoZHDuLJgUSCdSTF9LruKcI795GW33cx8K9cRmm1sn0JrYUnhYcR/qgYDTG?=
 =?us-ascii?Q?AnRe/VDb5Rwa/5x5bW8SW8QPlm9aRa/ODBXCFqMJ1dxMG3YpcPLkqEoZ3t9Y?=
 =?us-ascii?Q?P8YXcG4O06VdnAGuKKnEMQ6WRb+5Do386cUsNaHWxf6a5ezTSJy1ESJ926U0?=
 =?us-ascii?Q?0GjvFwtcjcdEygL9VdzOBXevxtT75MbfWksDE41+pBS7P6KwteuBp9rJVGxF?=
 =?us-ascii?Q?/OnPhZAZsKN0f20JV3W7r+zHQ2lG4dhwxcNqUXp83qGi4Ft+ynQwVRz6A47K?=
 =?us-ascii?Q?GLBwS4lq8IwOV5fZPHXrB2GSTTErcWDlDvkrFiV2HRCcWPOs3n2+gssSuPjk?=
 =?us-ascii?Q?/yiL4Udg6AmTQNe0AE6bkTZdYtl9UEyXb3b8fk27zZs0wuF5q59gWsSikQlV?=
 =?us-ascii?Q?4m4T9yY5SWZPcnQ0iI4krj9YKJwU1IkwzxqHlPY3htJEZk6+r2is+ZBQGnvw?=
 =?us-ascii?Q?7hEJkt2QwTNCcSILbqBvskmcdlmsasyBwhzrI+RnxYXP9Dik2JKtH6CzRAZ2?=
 =?us-ascii?Q?FWabtVqXPRxvMskOD6xB36BrSbNu7KKZgSvOTbH2Ki+S3sL/GXi820rWHX1v?=
 =?us-ascii?Q?/Rno8kK4GHlMJoJzUO2qv9O7ZgLQxiLZZzmLY6x9xkqN5iZ11xlyZT4TznuP?=
 =?us-ascii?Q?XTw4y4fIX6hFfj09Ccy9ddx9wjpscwlaLH0zszgJink5LdJ0wS3rpeYPtG9k?=
 =?us-ascii?Q?2Sn0HDvcNOgphpHCVG3watbcMeE8BWgq9sF4OfsBcxP+ojT2MdX0sVZAr3tr?=
 =?us-ascii?Q?y52gonfN7zeUdFz5Wbwd4iMdZ3xJXBMN35u9E4mL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e2d177-73ed-4852-99f4-08dd93e02ffe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:42:04.5145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZ18psY8k3i5EaTBLD4VxtagqKV08A+AkymBQhCUfXo/R6cjXMbi02xuSFUm5259
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659

On 15 May 2025, at 14:21, Lorenzo Stoakes wrote:

> On Thu, May 15, 2025 at 02:09:56PM -0400, Liam R. Howlett wrote:
>> * David Hildenbrand <david@redhat.com> [250515 13:30]:
>>>>>
>>>>
>>>> Did we document all this? :)
>>>>
>>>> It'd be good to be super explicit about these sorts of 'dependency c=
hains'.
>>>>
>>>
>>> Documentation/admin-guide/mm/transhuge.rst has under "Global THP cont=
rols"
>>> quite some stuff about all that, yes.
>>>
>>> The whole document needs an overhaul, to clarify on the whole termino=
logy,
>>> make it consistent, and better explain how the pagecache behaves etc.=
 On my
>>> todo list, but I'm afraid it will be a bit of work to get it right / =
please
>>> most people.
>>
>> Yes, the whole thing is making me grumpy (more than my default state).=

>> The more I think about it, the more I don't like the prctl approach
>> either...
>
> prctl() feels like it's literally never, ever the right choice.
>
> It feels like we shove all the dark stuff we want to put under the rug
> there.
>
> Reading the man page is genuinely frightening. there's stuff about VMAs=
 _I
> wasn't aware of_.
>
> It's also never really the _right time_ to do it - it's not process
> inception is it? It's when the process has started, now you suddenly fi=
ddle
> with it.
>
> Then relying on mm flags being propagated over fork/exec is just, it's =
a
> hack really.
>
>>
>> I more than dislike flags2... I hate it.
>
> Yeah, to be clear - I will NACK any series that tries to add flags2 unl=
ess
> a VERY VERY good justification is given. It's horrid. And frankly this
> feature doesn't warrant something as horrible.
>
> But making mm->flags 64-bit on 32-bit kernels (which are in effect
> deprecated in my view) would fix this.
>
>>
>> but no prctl, no cgroups, no bpf.. what is left?  A new policy groups
>> thing?  No, not that either, please.

BPF might be OK, as long as we provide right functions for BPF to manipul=
ate
system, process, MM, VMA level knobs. My only objection to Yafang's patch=
[1] is
that the patch adds a VMA parameter to the global hugepage checking funct=
ions.

My take on BPF approach is that it does not add new APIs, so we can chang=
e it
at any time, assuming people is willing to accept that the functions inst=
rumented
by BPF can go away at any time and the corresponding BPF programs will no=
t work
forever. It allows us to explore various huge page policies without the b=
urden
of maintaining APIs. Eventually, huge page policies become transparent af=
ter
we learn enough.

[1] https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao@gm=
ail.com/



--
Best Regards,
Yan, Zi
