Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5078F2E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269210; cv=fail; b=Sg2Ttdua0eSAHoN0anspEYwcNW9goRBGVFFiXVcJi9tgHbadjzzRsPexnPyb6swJM4ycfsoRLeUz3pL2jJd9aZg96GJ6vRYEBtR+m+V3Gb4rFJwRA000GsMjn3a5KcWAInf6/D+LZvpxxIV49BfljxKQUX1vD3Dvh19rKvvd0+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269210; c=relaxed/simple;
	bh=4EPFhDszlluRnUSVMJFJiy95e9mb5+1wGQrIfO4iZhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OzTrjoVSrDfzWbTzra8hJU1ge0gDHmeQaO+lcOW/yrraRnfS3vcDl0kcfyLi8zJ1vlDuL60nNUzEIOzXSTXyU4fdm7fvn6TAk5v8IFmOWcb0X6DAcV3qTWeOssEWC/AE0+FyC4AXEHMveJNt60dCR5pJzccb7UH/eh0vArM7o6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n4rj3mny; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n4rj3mny"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEB/5cjoQ4ghvGOuER/ZxnQYZRTHmZEhdK4ANcsrFlPKiLTDk7+KBMWQNxEaEpURJWAWowfn9tbQIfpE5saRrhFuFrqglmbkdZ7Uo/DguUO9Fy2mmGQj8eW0VdvCuSdbA8CGOGjswWD7c+oH8uuWS9Sxjj1V1R6eXQiQaIo3vvK3W+i7TfC/mpdIL8fPPAi7E0f601xQln3WvORjSqxZi8ZoNG9ywaf8Jgt8SKnDlU7xFW3gtGK20KoSklX5PyrCkhCVFRjjWj0FQaN1tl6GuPIMn9i88DOEmLSFupl198jjjlCTnI4INiPdZtausaWugRGzxZv77e3FLjUrtYJ0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLOiVJghPaQsGBpWrP1SalvlACZdrOTTryROW7StVbE=;
 b=pq0QzWenOGgeOtwHxxE8lnjuAdSsW9O6qEdoUbg37TU5SIX1J5Wrx5qN2bFjGwt/oWaGMQxIDSnuliIbRy+kOp/phyx8Rhw0kZolGSzNb3/yxjSz6/y3W/lUvzRH9bVCB11sPONk0D1rfLW1Qna7HYwN7FRTqhu4AdkJXgjTAfCo7QyOf3jUdFcSby7m8OqczDTiMKNP91iHlWtZFPrNAoI1VSLYuHPt2XOQYGjHQs+mXs38J4Xg7VRdt7PdkU66Mw3yEXt1lq9oEF6fsNEfEmUT1yB30hRM6d5fglk0crai4bKg7tH2JJ8F0T26QihucnUy8/YW+fQNGoz6icUIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLOiVJghPaQsGBpWrP1SalvlACZdrOTTryROW7StVbE=;
 b=n4rj3mnyuPeE2WCSwb2VkBqjyUoSSEa/2akOy1HfFw8F0ben7rMAUZManp5rH3YpKtRv3vyjot9QeF6Xuklpx18SbdkZ+gXBYNWsFHoNjqgiJSRBihHFqLx6d2gDlr8kIbs4rBLP+76Ab3lJyFeQVN+nS+j5aFUf9WYvyQzaYutNQgmBKAH3fXbHy6HFK/Lg54Bq9rXaBJP6cRwmQbH9m747fzHnzM7pDe7bHoympopBFjcn+IcrG9BPo5wSI39kY6SpjdH97UCFCVoI+ze+wAco8m14dom8pjm4OF0YZt3O5S7nqZnBb/gfXugSgOE0JIqKkuSG20TgHak2eef9Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Wed, 18 Jun 2025 17:53:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 17:53:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Wilcox <willy@infradead.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized
 symbol 'entry_order'.
Date: Wed, 18 Jun 2025 13:53:23 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <2C5E9AD1-A548-4B29-98C2-DB4A78D51B4D@nvidia.com>
In-Reply-To: <aFL7zYgdMoqNbJBS@casper.infradead.org>
References: <428fa0fe-8960-4566-9054-5bfd967c18c8@suswa.mountain>
 <aFL7zYgdMoqNbJBS@casper.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR02CA0082.namprd02.prod.outlook.com
 (2603:10b6:208:51::23) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c15254-fa10-43c6-349b-08ddae910636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uNwY+zds1ntCYWqw/a+SnejaZNPGINTWhj+rqXI8e62f0yN3dx78M7J5Tbei?=
 =?us-ascii?Q?ChODKHFbs31M1siOlC6qBjLm0ybLajnMqryASWjY+R92sKYvbI0/wpglcnW5?=
 =?us-ascii?Q?V4+71owhDErM3ruzEXOPxPmET/eTBQWtabyCm0t0vR2lAescchgDOIf2WL0w?=
 =?us-ascii?Q?oJl1B3L/UqSz6p+HyqPDeEVmOtGi15BgO1IdgyfZ5C2qdE0/js1EDaTAI2p+?=
 =?us-ascii?Q?lwn/d5hKR6UvZFL0G5PpxbxRuhaRG2wfxX+Yo4ksjaBm8oI591tlXGuP1PUO?=
 =?us-ascii?Q?vsPEAnyx5DxZ8WcGawypzhn/fBfhCxyB+7q5DH12Z6lh1F5EMgJ8Nx3PlsG6?=
 =?us-ascii?Q?M94ro2iozngXDl5CLqeUCTsc/aJL8N5sBC/q7qA1UHcXVZYOyLchf5acz4iK?=
 =?us-ascii?Q?s7Jefwg2aKYPHH5dkPqLHil86EB7CSs7C/1Nznz437qy0hhledE/HOBvYGkg?=
 =?us-ascii?Q?+3qqvuvecJKZUERA4Zr/d7Wt/FMMmcoRDIusy4ROnUB/J19OaQac3PmPe4lP?=
 =?us-ascii?Q?jiRRBBSJyuKxgxlMfQ3ridgaJEiXgwrIlO8yoiEaV9EKvCLnzMuswCZRUyRg?=
 =?us-ascii?Q?x1XMOF2j7cmsKXzSEDTn55NJ8JqQR8GNpVspTZAR0aF/qtMdnsrj6I17JpEf?=
 =?us-ascii?Q?QfBCho4CVByJ6xcocQb6VQewP/uMmjYPxJ2u3DnGY26B0Zyjw58OwxCLgFAG?=
 =?us-ascii?Q?mihp+0B2R1AIXK/SXwyOc7BqgNUpzTSG5eGh9m9XjYJFhbiWf5/qa6QYTb75?=
 =?us-ascii?Q?FfiKWfN1RN1N7TCXtem5umMjkPkaS8QoSUf4i1TOgiaI5Rxpac0gShCeSOxT?=
 =?us-ascii?Q?0YavAoU1sbSJAuSj8JOvtfDJqxfwO0QQAt7g8iZAg3Cze8JEKB3+WrwTTHcz?=
 =?us-ascii?Q?S1GzDgYfXmUl+QHqt/bU9659PVyRwy7YrL6YZW4djaukFO15jo7n4dyZAFBe?=
 =?us-ascii?Q?eYAgRiznfZaCg8hLRkZJ7+3wXJlpduPp+dLLZIVX0/FSWzVYWIs54uXbSwkR?=
 =?us-ascii?Q?Rtsn5zggcIl4SROFVvwl6Jtg+JpmrPeTB12ily0CxBQIk4jHQJfHHDIqZZAq?=
 =?us-ascii?Q?F90+j/6h5fPPlh3SK3S4hLa8FJD0IbAVE9SEQ3/exBgkcfKeNi5hyVD5gdyI?=
 =?us-ascii?Q?lbPduA+f3Z3IaCZ0NgEbzE1hHFqUzmj93IndmPNTVyDIHSnFqPSUld+ckQr4?=
 =?us-ascii?Q?C4tbkpfxAUZJ4hUnAcZll2rfvwv4cNrIhj9yhA8AdMyiCxs5BuFmMG+G3vOE?=
 =?us-ascii?Q?QfYfSjMOUMBYgb3ywX78bTofdfnVGWRHJp5dhZKq9TnkGLJ7i9mT4xHLzXEy?=
 =?us-ascii?Q?0riAeX2e4GgXeWWpJSGjmErm3pyZ1rflpdAlbg867yeEum2cB8KBEemavBwj?=
 =?us-ascii?Q?amcKQK35oPkyYfUu+zh7ebJiU3ULcAA6alJ4KAVc1RhGmth8IojZPRAfiDXf?=
 =?us-ascii?Q?YWLOhzYJg8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+uhojREIlvLb5KFDw1Ibm/tpOHpQW64JHuK6kTuNfrQ4MayJZbKImJrxT3Dx?=
 =?us-ascii?Q?iAhymcEAJd0YdFkIPJ+ScRxm5govyoy2xmThHqMFBKrzt3WTZu+QXnH1YOM8?=
 =?us-ascii?Q?hAglJhS/kUmkFGIfy8kDLB7dtwZCtSUAXBuSjh7iaeL4uICKZKr4Oi4beO20?=
 =?us-ascii?Q?aFTd5alr74Qj71wiXenDboeMNSPCHF4lyBzXWh5epiktD/4WF0YAow3+Y0V1?=
 =?us-ascii?Q?CtQyDrlxVxnumjuLkc8TLz6QYFJn6KslP+ccFnEMZp45RpoVYpJv1sIvnwXf?=
 =?us-ascii?Q?FZb6eos7I5beKytFfxN83qG2yo5V0LbonBdNRu7DDrb7FwW0u3CazSZSDkbJ?=
 =?us-ascii?Q?6V5jjUhU2258GiPecdjjX+4igAB5Ke4YDPd4cSZnsN7gj6FIh7w3iPbGQNix?=
 =?us-ascii?Q?a1xvYpguRQ0x5zCLmTwfSihZ4ZHY/6WwQqtQni/1yiccXw/u+GnWFtBH2BfC?=
 =?us-ascii?Q?GLMBKJ0q7HaufGlasjun7ppgI26xb06ui1Vw046wWzXG1eKROeFASZZZomFV?=
 =?us-ascii?Q?4MwkcDUy5N+OmfsOeTqTbp6TvgbpmGlp4jgRUFrjBf7P8UAHTPg+vSVkTbq2?=
 =?us-ascii?Q?nJGUwfh28soiNRpzLbFRuxO8iDHGTzEPfm8vgd8E0/l5ijEUYnvF2nLk86xR?=
 =?us-ascii?Q?XOkWLHnEYkbDGCVR3Rk+hsEvYXy8ce2y+ESi+YFdbwmddRUUkURWFP1izZOa?=
 =?us-ascii?Q?ESi8esM/P1HgvDTpp8DIu2ntO48b9/LW8cMEMu3YEeidmjXZR7a2FPo7pIwB?=
 =?us-ascii?Q?8jMsncb4k6Gd//vS4/rwYu6G+uBodvMAMlL8wjTgwoBbwwMxJXCW7MJPf82C?=
 =?us-ascii?Q?tblWMMRZflP9a8IWCy8Md/m3ey08ezDWMw3oIRAfEc7F6BLKLOhnLreiTzEc?=
 =?us-ascii?Q?E0Pq+H/MD7EOu6iXweZCPfZMd04nIdHB1E2o4nyg2m7x6h3T+FU8I1UUcxxl?=
 =?us-ascii?Q?6o45aW562BKpWGhgjKrCsOpTkz+WUb+/fHUP6TLuoFITuqAKM2QdXEOLkw1Q?=
 =?us-ascii?Q?3WMHGE+d2pJqIn2J0I1NEN8q/Hv24sD04tz1ycdj96oobYe2BiFOAZJ3ySkK?=
 =?us-ascii?Q?nJ2NklvSj13uI21Mc6KazqRuIu13vhmTAFw/nBqoh2IzQ3J4C37kww5DEhy6?=
 =?us-ascii?Q?4wLHiGRb21XBiZ1oO1Gg2mPdwUdjHfD2RmFfP3R+IqXoc4cl9w7UP+L7Cwfn?=
 =?us-ascii?Q?hhFfEUG6tKR+mS9pjHVkfnxEIrITlNuhUg55ChzHGGGT+T+gyN4aMTF1mCMh?=
 =?us-ascii?Q?SY2x1RE2HyvQoxfkElByGIi9HIjsfk24Eb//aLNdnN3+zz8cmvBMIACi/Vp8?=
 =?us-ascii?Q?3Xof6wpOumF3MpYPR08gxfw7MUMSCgNo16Pvxstlb+RV8p751A38TUzJ805p?=
 =?us-ascii?Q?N270+gqWVvJPjNaxcqdnA/3nr589Xu53JxsBAggcyWleF2MTnEmv1xsHtOqU?=
 =?us-ascii?Q?Zz+Xn/FBodRb5dzgm99UQGmIREKZRnGsD3oxKcuxf6jtlFkxXnMcBKrt47RA?=
 =?us-ascii?Q?jHn7rrEr2N03m5vHXK8eSWLk3sOQ5sKro50lZaW9zUKoI9m4cP+fzCmb2iOp?=
 =?us-ascii?Q?9gz7bBix70C9bhjUc+FqOHLd/iDEG92V5YbsN8UQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c15254-fa10-43c6-349b-08ddae910636
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 17:53:25.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZ8iN3KLcKzGoZEoIroFxStu1JA3OzmYITcvg1xl1uk7tyRBlloUt93LCx5hUGhi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632

On 18 Jun 2025, at 13:47, Matthew Wilcox wrote:

> On Wed, Jun 18, 2025 at 08:42:17PM +0300, Dan Carpenter wrote:
>> smatch warnings:
>> mm/shmem.c:2223 shmem_split_large_entry() error: uninitialized symbol =
'entry_order'.
>
> ...
>
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2169  		if (!xa_is_value(old) |=
| swp_to_radix_entry(swap) !=3D old) {
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2170  			xas_set_err(&xas, -EEX=
IST);
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2171  			goto unlock;
>>
>> Imagine we hit this goto on the first iteration
>
> That can happen (but if it does, we set -EEXIST in the xa_state).
>
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2213  unlock:
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2214  		xas_unlock_irq(&xas);
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2215
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2216  		if (!xas_nomem(&xas, gf=
p))
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2217  			break;
>>
>> And we hit this break.
>
> That's guaranteed.  If there's an errno in the xa_state that isn't
> -ENOMEM, xas_nomem() will fail.
>
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2218  	}
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2219
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2220  	if (xas_error(&xas))
>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2221  		return xas_error(&xas);=

>> 12885cbe88ddf6 Baolin Wang 2024-08-12  2222
>> d53c78fffe7ad3 Zi Yan      2025-03-14 @2223  	return entry_order;
>
> but if this does happen, then xas_error() will be true and we'll return=

> -EEXIST here instead of returning entry_order.
Hi Matthew,

Thank you for the explanation.

Hi Dan,

I got a similar report 3 months ago and explained it already.
See https://lore.kernel.org/linux-mm/B024C29C-96D4-4F92-B2EF-F01CB06B27DF=
@nvidia.com/

Best Regards,
Yan, Zi
