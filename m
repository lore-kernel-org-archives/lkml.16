Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E124B1E72
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737624; cv=fail; b=SgLKooGslbPF31u4ldoMUMF5+aBjVRJJbtH2xuAP4o9JZCh5bfZIDTDBR1WYEsviUGA/5XLZ/YJ3/hQMGh4lrGEx5Yp+OOjDVqOrET6zkv1A3iVwLf85l+gmfKliQT1+/mIQ6V05byTkNhL3aWtvY+dKMiaMAAAdRh7LA8hJUB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737624; c=relaxed/simple;
	bh=J7cvtHnJ5UuO0dqohePj/3gMcGpD4fqvSw4xV5gNFCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=czvZOcLxvb79P8mwpcDo21gtfwZxibhgh3bf7vUAQPkeypTTc6eh02KItLgVueWeoPEBxyyN8zMOkGXdE3TTIVp91aZtrYuI7obhX+mrLSjVB8bTCxflIzD8YXS8VKg4CEdEzhzOp+yustoyssJGZG5WEtgQ01ZtSuDQXl3QOCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HcWDybYZ; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HcWDybYZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uB7LANgubdHk6cARbr9yLrh+eZIsxkTteZ+8pISJdQq8hAEE3VyHZv2Bk8aTJZTxxNGP8krUiyzCcIfREVxhuPXhetwW3j0rYN/0j62vJZl+jFJY2AqAS3JFD2Di933GhBQ/qYxLLbizKT0HqQ8guioE/fiBluQpxB45DXe37gy/pJCRBRFHmEj+68PhsasDt8tLRzXhcc87/N87y4te5KtrDf2jTVkp+hG/A979WFecb/SGFVYbEl327qNQUaDgZj+4et9Cr7edRVm5+UVcU5xN57sCtu7SDX3Hz+WuxxQEIu75h5e90WJYwkK/HmAwATZS6osgmOnbfjOxZjV0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnY93prUheBoAVe6yK2yrrymB/b/59Pg2j8nXyL4Xck=;
 b=ya+l5quQF6LP8Y+OamcnL+oX/U/fctsJH7v5ZyNr+uqaR1ib0QkeyQLXHM88s5XSCyjagjWwj/tsPimDqZrJuQkRzTMwIP+bwLY7h3S88pwyV3ehjxb2PPvEQeMH4+OsCCQYDAMqEQDr6fsyY9xmgcxEsZGBzw0O8m8ORFKKFgMwyuAL9FTa/17JGN7Frp1/pbLEm/IkcYHe/Cn9HMR0yl0Bgk1G8Mse0ez0PcdrjbHPN7LpPTvjajrGFhCZQn/ao0olHmXMG2A0omp6ok1o/vvEcnNktW5RilDS0+pM+Y/uyk3nTPjwzY7IlrKfqCfmreakzFZvaP1kT5G2OYljEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnY93prUheBoAVe6yK2yrrymB/b/59Pg2j8nXyL4Xck=;
 b=HcWDybYZFPfVMF/aON1sDJCFrCHyN02vjuDaAQiZUN/EUGK5ydg1yJGjwghQutiSlTZ6yzx9lgGKSHQU16XbskJdrY+oEfeCYYw6MD2cldJxI954yDF2wdHgWAQIWaLOOyE9lUfJl6xSaTx3B0Td9/F4oDAb5D9RjJXo5wv2qYU337TDV7mA9bvXuRGkN41R6VrnThZrZuJ7Jcvdexn0OKBPOUV+WYdJsLWA+QAS12rAO55YWVlKghthFi3CXWiKbq2D1xDXIC+9+4mgPTec8oXjD/R66zbdTfOrNlr1mOXbngcyGMasam6fWO2oUSSUUozfLgR215ECUn4aH9p8tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 8 May
 2025 20:53:39 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 20:53:39 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Thu, 08 May 2025 16:53:37 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <10C2C1DD-A6E2-4745-8C2E-D09886F4104E@nvidia.com>
In-Reply-To: <20250508204644.GB323143@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <20250508052409.GB320498@cmpxchg.org>
 <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
 <D24FC56F-CED6-40DB-8216-6B705473106C@nvidia.com>
 <20250508204644.GB323143@cmpxchg.org>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF00013DF6.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:a) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: f9482061-3e46-4ff0-da85-08dd8e7268d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aYzAblI5ptUWHg+mPl6WSlPbzYrbpAZG5/LQbn3yAgMZJ++UXj4za7+aBKYc?=
 =?us-ascii?Q?PxTjp1q4M71opoFLRWtQtjAkEaM2nm4Cu1p678pfBuZkC84BhjU6HJzv6hwc?=
 =?us-ascii?Q?6rqI/6cZpor3/P7E/5x69bXIHoXWSsp447sMCQfcOEZqOSooGjHhSzl9ewS2?=
 =?us-ascii?Q?xQ+vmUWlkvZyAmTIAeFWxMY5KK3wGayyUuNsbd5+asH/QQ5SwQyg01K4uSC7?=
 =?us-ascii?Q?t6HES1I2euM5F7wIA2TG+b7tiwujKhn1Z8grr2N+Z4CcIdwNUhNn7qPJf7qj?=
 =?us-ascii?Q?7O3Fe3r39BmrqtGyvDLfU82yUkq/dd0d57GE+ngeCcaolVCzHOwKKkmr/qrd?=
 =?us-ascii?Q?MYbaHWps+C1Rzwzx2vA6Qii0f11DGDNkNi9flG/oHlI1SXx2kVU4QK5+Ak54?=
 =?us-ascii?Q?Ks9ME1FXPxi2YGnm/2oD5aOxxrOaxcg7FFTIYpWpFsWoaft+wyR7kC018BdG?=
 =?us-ascii?Q?BLvcIe44TM/dO5k/w8TIfYsPDlmItg1gb/3VhKZj+9vmCzdmhSsc/Xswo95/?=
 =?us-ascii?Q?HxsP1Vb+I9lIAwsarTaPG3YM/PkV5Fw4ctARejLkeqNRYj/WooAl+UuEy2I0?=
 =?us-ascii?Q?RVThVKkW/5aFOmd21uI+KGUoLdgxQYCZkNvaRAnajjvMkMNGZrtAYW/Yvd8Z?=
 =?us-ascii?Q?VmrB1N+W60B9Yb6Bc+fW1lT/K2qzkjVF3H6peylCsgbI2rKdZDFoFf6uzH8D?=
 =?us-ascii?Q?Dg8o257MBZ6nrWKuMmNphhdljrCaFZxEVx4orZdymqiiVexoQRWQJtfZAnr9?=
 =?us-ascii?Q?UhBjkFIqIe1FvQcWFXt0+INHeXqEY4omGx2hFz/o0n3hcFxROloUdBowoMIt?=
 =?us-ascii?Q?0L93//oJR3CW4X80q1frNGQbinUaw/61exY1bxf58Z1rk9wcnhtBjfqYpYGQ?=
 =?us-ascii?Q?Ef/G7lu2TzjNOfYEkva+tZ+2kx3fJkne9u4TId6t4uBs1SkpHTHO8DD27mQE?=
 =?us-ascii?Q?K+iSLdOOtL8nlusrNnsY7HqC5lP7b1e+sTo2c6l+GiF46pqxRElN/sO20OjS?=
 =?us-ascii?Q?N2NLFXZ6Jc6fpMpxENWK2wXRb3/wWHKjDfe3Sg7vHiSsZlWU6xvMg4v9iw1s?=
 =?us-ascii?Q?39JZLD17lm/ipCCy66XQW9iWPCPkNdt+EhQWNA8xYada0trv2PYOs12dl881?=
 =?us-ascii?Q?Jc4nPf8xdlYk+APOdDuLU5Rgxtz4Szk5UVF1PWGa3wmCn5YF2VT4ivrn+inO?=
 =?us-ascii?Q?LJVKMdowUfZfrqjKsqvqoI70c+Py7fjtSSUj0kLYBWew+ptGKrQ+IwLpF/Rp?=
 =?us-ascii?Q?RltiGIEDcXLMqRDkJZg0gXFPT3gwxOw2PqQP5SoD0oa9dfxQ+AEPsoxQShVg?=
 =?us-ascii?Q?jikQFm4xUk5dM3yMgKgJ4thE4t0n2B8zvnRrUFVw8gkBwDS05t23Z4q0bdxS?=
 =?us-ascii?Q?2RbKHEzEnIf6its3sXd6hJ9UVNHWKBRSl22+pEj8cHNC/f6b6RCtrUHrQQTd?=
 =?us-ascii?Q?fWLWG4JP/fM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J3t9hHgYPTv/jm3lt1ITjGzgfZhbdaSXeCofd+hY3Rr+Psmj3jdDTuGoCQAN?=
 =?us-ascii?Q?S0XqLqtaUdzO/RoOnja7VV642Q2n2fK0dG1i4M/SMKD4uiawtbxT9riASiGO?=
 =?us-ascii?Q?mTM5i2fM24VEjjY5NFsdksXu7pqFZ+6uh05aRrBaBqOZkWsWjVtfY9jm98u6?=
 =?us-ascii?Q?XoOlBnzTg1ILdCOFHwVpNGIBPCHrje3Lxn1iYCQjXATuaUgjr+pmGYKAi2F0?=
 =?us-ascii?Q?TdSUVKBqurn3S0flJKbOzF7keClmGpLzokPgP2X1597dJTyRxD6pkzc9bFrL?=
 =?us-ascii?Q?5qU92zLVPS5Bs50/33ehdCPilVcoHkaj/F+ZPO9BPQgZZvhj8h5wgeg6//HQ?=
 =?us-ascii?Q?k9GFLPuLf9zphsXrg5aW2naS6j2cxsUgueu5klqDlkJg5BInLifHx4T1gFF7?=
 =?us-ascii?Q?kYhH3uoWAodaNWt6kZG4ghpn2sTedn+kCy7n6SZPU3CA37KcQJ+gGYDfX8kn?=
 =?us-ascii?Q?HOjAMJ14oaxBwmOJEN4JqpZCZAS53shO6pIoCcVEU4cr4BQExoPWmI8bO6gr?=
 =?us-ascii?Q?KZ54JrAuGHHE5bnyVW7McPPkEmZK3CfMIqbs1H9MUvKgr3efsb6ghPsankGU?=
 =?us-ascii?Q?W83qX3TGjUPKZCxXdPosOSE2G4U6HuGVzzNSzr0aKtHmDspT+m6eDp4dubIe?=
 =?us-ascii?Q?NYlaDUDiT932thWMMs1y5hE/uDIgghpdgTgs/nfjudgweXADASLT86bObH97?=
 =?us-ascii?Q?qsVy8/47L+WoVA6h6rVUKoBPVBTdyAm+8WW7MO4G9B48B3Xddv5weEnzbxGq?=
 =?us-ascii?Q?0ORs1XW5KMyWlleHB/5Y0YHhVDS+G9GurQQ3hjbYUPwDSWRcCgebH/okbiKz?=
 =?us-ascii?Q?SE1tSfJa884P8LS56rUjdULjdBOwfYLD8zfgfogKBgE3Jx/DIFUXjjEPnd3U?=
 =?us-ascii?Q?TwswCm+3x+a0nlJWghpB09KaiF346FbW/GIkL/sOu3d1rAvXPIfLKHoF9goS?=
 =?us-ascii?Q?HPW3YGknAyF0h34IORF11tOD9SrK4Ty3tg1e1dFoaApHbvoJRY9iZYmSwgGQ?=
 =?us-ascii?Q?3AO3NVa2QJd03hlRYgx4dy79jaGx4k8PrkxmTa8aItzpOGA+g8mLK0NaTFmY?=
 =?us-ascii?Q?8LABpZ2E3LBXWkJCVyn4z5CVFV/ARvdV1y+Aq4LPAfXKuwVg6gHypKAKwU4C?=
 =?us-ascii?Q?9Pt8G3zzPd5iuUOoTW08Vo89e7fshhDV4jAxyuL8LEwSudOnruUtD4EsyFqP?=
 =?us-ascii?Q?b5PacVrehM0a7ktGwR5eFqcE7mGtMPYxhoxrObLA4opfA6cxl5epz5O7UxOp?=
 =?us-ascii?Q?CjqckyTVOeCLpstn9CmRGJlw3/YlQyqkeVtBJfb+t9bkKVMxz54nikSr6zZS?=
 =?us-ascii?Q?7lsGycYql2RCMX8epW78bJt1jbk8i+wxaZUAF98ZGvUbxlw7zvCgttrwnHpb?=
 =?us-ascii?Q?cMZGY2vd5ymnodSm7MM4gsf9iotXQ/gmUlu+VQPdwAS7nLZuBb3YyxKJ5v23?=
 =?us-ascii?Q?caKB3yKvrRX0dX45DCLNX05ZCx/q1EHTJIexCM7ks+M78ntGQhJAPhSlx7Dn?=
 =?us-ascii?Q?63LC37W6oEqErFy5FeyISC+G1JKobiSCSp9j8UBoqpZx68aDK/fNnOucLhqO?=
 =?us-ascii?Q?so1Y7NWsP1f5fpL8/QzIOuRXKMK6foCpyjrWxFVq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9482061-3e46-4ff0-da85-08dd8e7268d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 20:53:39.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: engidktQ+iH0xPuGSuBKO1m/ledvR3nARZazTjPeqhT3cUwXdSWPhyorWddcT0V9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412

On 8 May 2025, at 16:46, Johannes Weiner wrote:

> On Thu, May 08, 2025 at 03:17:05PM -0400, Zi Yan wrote:
>>
>>>>> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *pa=
ge, int migratetype)
>>>>>  		     migratetype < MIGRATE_PCPTYPES))
>>>>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>>>>
>>>>> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>> +	if (migratetype =3D=3D MIGRATE_ISOLATE)
>>>>> +		set_pageblock_isolate(page);
>>>>
>>>> Are there paths actually doing this after the second patch?
>>>>
>>>> There are many instances that want to *read* the migratetype or
>>>> MIGRATE_ISOLATE, but only isolation code should be manipulating that=

>>>> bit through the dedicated set/toggle_pageblock_isolate API.
>>>>
>>>> If there isn't one, it might be good to enforce this with a VM_WARN
>>>> instead.
>>>
>>> I checked all set_pageblock_migratetype() callers and do not see
>>> one using it for pageblock isolation. Let me replace the code
>>> with a VM_WARN and add a comment to tell users to use dedicated
>>> pageblock isolation APIs.
>>>
>>
>> Actually, move_freepages_block_isolate() calls __move_freepages_block(=
)
>> to move free pages to MIGRATE_ISOLATE pageblock and
>> set_pageblock_migratetype() is used inside __move_freepages_block().
>> So the branch has to stay. Will use the suggestion below.
>
> Ah, good catch. But looking at the callers, it's:
>
> move_freepages_block()
> move_freepages_block_isolate()
> try_to_claim_block()
>
> The last one would benefit from having the set_pageblock_migratetype()
> there explicitly, as this is what this function is supposed to do. It
> also should never set the isolation bit.
>
> move_freepages_block_isolate() has two set_pageblock_migratetype()
> calls already. And after the series, it should only manipulate the
> isolate bit, not change the actual migratetype anymore, right?
>
> Maybe it makes the most sense to move it into the three callers?
>
> And then fortify set_pageblock_migratetype() after all.

Sounds good to me. Let me update my fixups.

Hi Andrew,

I will resend new fixups based on Johannes' comment.

--
Best Regards,
Yan, Zi
