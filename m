Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C91EFF8E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044229; cv=fail; b=tXe7Flb0wey7fzCctv0lXuCVX3Zl5/bhvKXUKeCI99l67s63Nt6xjX9IUzsDsI4Jve7zxN8Kl3DA4Qyg+ilohDlH/qZRuEzjN/xb6139PeZS/vl8nGp0T1Kih96d9yTeZ+v2ifWDABKbb5vxoCPxFZ/iiu5WwPpWP1qXs6dATpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044229; c=relaxed/simple;
	bh=3x/2tYGmRM2F1DaGvB7rEHyw4rxwU2Zeh/gLH9ANPNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X6iHkSYw3DckMkcXZZ9epHmDGz7CK+R8i1kwfgOdzglR3/zoX9UQa97gLHSCxzfSbZf65t4V0WSXdraDNRRSbba9LuFx9oJLYpeRPlu24x9HT2JC+dsScdYO4aKbWk1dE4DSiBUY5L22naLjZpzWw/yYbqzsnzNCLQjltkInjhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PXyua9Pn; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PXyua9Pn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STKtxIJFiAoZv3JrMKPSvLI/I1kgXJhw3JD4pQ9DltysDJFDThahkcioFld3rCtQttFjHKuBOgV5GVNhjdTtl54Ps6vdDakvHn5HRLcQnvRs/daUiQ7bZZR6GG5yOIQOqBxhDCCqxPIfbpg1WxTj9x77UDlHf1AOQGDB2ca80LK0ULnYQMPwvvsFZwxEe6sHItAO70BJjoatXb4+w1K+eU+p6JLfzeKsvKpHhYM3LZpLqx6dJquIcx51Mfx2TCIvKoe2kBLqi3w1XjFVlxZzsWD78VVILvKJrtMrieLHhwiLgiApUD6Z7tyuoYZcJZyglKiElzD7QOZd7CYTZ/oZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x/2tYGmRM2F1DaGvB7rEHyw4rxwU2Zeh/gLH9ANPNg=;
 b=qQPULTnrTuqdrzC+cO4zHKdjwEfPb3GXz/LZxJDAx/kRDY3P/jVEtiEMw1bczDrMV8In6Obw4qotWE5t9EavI+wngvbvJxRHRK8l0FMy7ufeYBWyTANYFrIJ0u8D3FHeLW6NBNx7fs8fDN/JSmMwZ0+l63NYEEaRJgWA6R4b9RGzuu/34SanuGvX+XTYyA6xHHlHFOkjHRS3+N4E2CC3AjIkgJVT7iUgiDZHYqU7I9GNendgp45C65wcTxE4xywDe4HqiMPQtFpLZ1i0CLONFa9Muk3FZOqp8opm/9Uqfxeef1F2TNUEpc0SZfa+nWI7BOF5BTYYHnEj4e09ZL45UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x/2tYGmRM2F1DaGvB7rEHyw4rxwU2Zeh/gLH9ANPNg=;
 b=PXyua9PnC++oHF0pop2SWr181GiP5wgHcahsCZ94YBjLqGT0tVilfA1eRSyyNxdHe/rasLV3SZrcJw9RivWrIBCjpTMJlAJSmpmEc9AfYgyKvEsLsspTOp/rSisWJ1HjjJi9U8IxwSf+aTmTJR6HBwSRv0Hws9g1QrPgWfb+MmXqgKB+kguJ1RiqbXAFxjSTvOU/Bzu0gOeb61ouPTisLaOj51yFxi04HPC8yLfsp8Uzpbp+DsPFykrKSYa84Ngu/eg8gXjfT6mWeqMebmS2irdK0Ts/A27S7Bm/WG7EbJC2piFrWTF0GpYDcxC2tROtVORVAKFppIAl5WfFoH+4XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 13:37:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 13:37:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, isaacmanjarres@google.com, jyescas@google.com,
 kaleshsingh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, masahiroy@kernel.org, mhocko@suse.com,
 minchan@kernel.org, rppt@kernel.org, surenb@google.com, tjmercier@google.com,
 vbabka@suse.cz
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.
Date: Wed, 04 Jun 2025 09:36:59 -0400
X-Mailer: MailMate (2.0r6257)
Message-ID: <CF888D46-CEEC-4008-A908-B7529CF237AA@nvidia.com>
In-Reply-To: <b92484b6-c028-4969-8efb-aff747c38f83@redhat.com>
References: <20250603154843.1565239-1-ziy@nvidia.com>
 <d6f18e51-47a4-498c-ad66-60fa2d8efbfc@arm.com>
 <957DB2F9-9C7E-486E-95EA-1E6574F82D4B@nvidia.com>
 <b92484b6-c028-4969-8efb-aff747c38f83@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00016414.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:c) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 06861fc3-1357-4aae-e536-08dda36ce467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v2EEaH40idtk4MtNGFVb4ttCKqIEJimWE5sxUf6iagC0Ay3dGq0FqB6veYiH?=
 =?us-ascii?Q?v6lifusw1zt5sBLTkzbp9KPeYg3RbOc6MHhpmDsoobG689WJEIvnPmS9PuQF?=
 =?us-ascii?Q?dZZvvFZG76AizTH/ld83zHN3AMQxFJ31kKuJYo/0+3YvNgO5hcodyzKq02Ay?=
 =?us-ascii?Q?y2Ti2kH4CNoTodBA16UIJdJ0ML691ZMvLk1RER4qqz+5IOoHdPU3bUOU0uqq?=
 =?us-ascii?Q?+K4lhTbY5mFZFaRzvSGU/asU8e+d9kEMGcpfDsAkUEBdVLM1amKD7QWXij+z?=
 =?us-ascii?Q?KcnKoCjaNjn+G8gucrXwTfsHHiFIHbOLKtSVPmml/pGsct8OglMH8GY7FCVw?=
 =?us-ascii?Q?eunYq6vwKRhDX5GfGVjOxKlUplrhpVnJdeemaOVpk+OQKKPjON9wIQXbiky9?=
 =?us-ascii?Q?GGF+VHzEvIbsexRwNSaqMQc/yU7BCZez2EiYHzo+BAUwI/ETQr/Bgyo9A2KC?=
 =?us-ascii?Q?VvyEpqBLl3mi6OBoFVnW/oKYM+i8Rb9aw07I52Aec/9OD5le+ePyTDc1/oHx?=
 =?us-ascii?Q?MrY1t8Xlp8tunjG2xJMZCLYIFX5m6K0Cx43oDIOe/R5QpkqO4mXiammhejhY?=
 =?us-ascii?Q?LePd5q/mE17GFDL/8qeiaKI41t1VzWsS39Pg6has5DuB7sKqHNvtw31Tkf4f?=
 =?us-ascii?Q?MDjfw0oUYQEiNdDcUdiAKIpvgwIWp4DbIjg+hiwOjj2yaRFcvyhQ/MTqFxcD?=
 =?us-ascii?Q?D0zhmFXduyKpHZx7jVv06uy7nDFE6UmrPtwMEInpUqbP42g8tp/v5JtbWUoD?=
 =?us-ascii?Q?R9WAsqHh7thkfJST0+sAXTm2ryihvjRqkCnhzBUGj+cEb8nlaU/tVuUuy9QW?=
 =?us-ascii?Q?R2miQUkxxDwWbRPomuNmLHLz7pBtR7mENYHsgRp8kCFJRHTIbbe2ssh3BOuJ?=
 =?us-ascii?Q?tBvm6Y0Hvq0Ja43bpzfk+e9twHZd8zCsqVvyoyE4fvR/z9qt916uDsZ/BklW?=
 =?us-ascii?Q?9+8sXZXCbusXhDukpmtiUUpKINUFOTxXgoFBRzoW4Pox7LDF1OuG9J9Goe+v?=
 =?us-ascii?Q?m8oQvpBJfyHyWCifBkEyJTpFmVoQUWc0x0r+LvEN0iScFSaswlyK2fkF5PWr?=
 =?us-ascii?Q?fbUddHL1dnLA3Q3Fb76K62z9FmgqIums2LbS9jvOJX8sye7BkP9i1P/wNnuw?=
 =?us-ascii?Q?ejY+FHzcbrSRUp4EdFPNv/L0y1tpn3U7mLew7c1LzvD1BahO6gEiIc+RdAsL?=
 =?us-ascii?Q?08Hv3SsRvfqXAkSQgT/qXiOUAewZ46gVtxZZtqS2FMxKHIYONAQU4dU7e2Wj?=
 =?us-ascii?Q?UorE4qDIdQGjQfw9Gy/dxLRJ3SNZnWw5jJuYbfNvbKQHjO7jM7BtcfXjaROU?=
 =?us-ascii?Q?NlC42+GCG2GZnsgRjLoN80fIJXt2eCnkfMYZw9Q63WJuuVyEOFhyTNFZTfDg?=
 =?us-ascii?Q?IqZ/NSmaT/tzG67YDv2zRMjRm9BuwKCIqgZiOpTtKDobVIa2Jq5aPihE9nVG?=
 =?us-ascii?Q?CyXYvOisD1M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJNSJn15hzdHxiT+qWQYMm9owahrODqyzZO3m+iFMkGgkqK/2nUWkdFgP1E1?=
 =?us-ascii?Q?iRlQiIj3H2H8mCTN2DAb1ai3YNWMfP3PAYTCAaQ/t8BaHaflgYz2YXF2ghLx?=
 =?us-ascii?Q?Gl0rELTJrqLg6oIlHJHlC6eULd75nikAeRKC7/gwZyVjRrhO2jJTPxkvAPIX?=
 =?us-ascii?Q?HR9x8gqkmEiUgHKPcRW/Py6Yrz5uD3kg9ridAQU0TXZdj4ZNtt/JXcjBXmbN?=
 =?us-ascii?Q?ER9MzBlybtPU6dOi9H+DvAnO8BjNIdoQF9pYWTOhx4dTYfbYBn5vAxJOma/t?=
 =?us-ascii?Q?QxLbUEzaH9Z61DNxMzoUYN8FxfnQysCWR6GX+AS9KLG/QoFzYSGVWrnVzlAl?=
 =?us-ascii?Q?4rKjGdlPNZmxz62jGvvtiezQCG90t4XfTHLYiHyezyDEs6Do5XePfHGaHZ01?=
 =?us-ascii?Q?08GrXATmp2weeb38mT3gbTjjne6icFkCexEwIs6zMOzOU4act/B8TF+HULfX?=
 =?us-ascii?Q?4iph8aZHOiTvK3LgT5Udg8Z+ImAYWEJaS5tfOSdQPfj5MK07MJQMphqJXPzK?=
 =?us-ascii?Q?cBMYvV4f5c3iuXooQvxytfEVsaez3A0Mry/lY/u6TG9KUQ6hZit8Erm0tLZM?=
 =?us-ascii?Q?qDT/HAkTzC3O5ooq2cTYKk6kW7/3G6aLLRzDp5wyb3h5lqWcHbJBBpZ7PLvn?=
 =?us-ascii?Q?KDrr1g7wJ35E6/fH+IrK9td/cwhyvQsN1c1ZBnT5RiQ5NaZGCk04w+5Avb6J?=
 =?us-ascii?Q?L+WeMZrCCZnHAAXRWW2d2LfNiLd5beg0TpNc4xM937Xc9VBF4s1kVpBw1Hsy?=
 =?us-ascii?Q?5FCkDEY2Ogx39pEpGk5de+0ZMMU0DrdEKh+i5nBbpEwZZEGnHso4HxSFeH0r?=
 =?us-ascii?Q?G01JSV2u0wxCmAZBTid80GUS4CojHLMSlxPx4dJiAsQVX4PXdZJDTooIqUrj?=
 =?us-ascii?Q?wIUY209S9ab0P99CEe7woXLcyfOg5T+TIhz0ZogcEjVOE2KPU8Z3x2jGVHRn?=
 =?us-ascii?Q?c5CHHk+zPXeDrqvMRIvSFC6wXiePeX72vLYlKgYSEVV4me6ooqY6KYjdCV3R?=
 =?us-ascii?Q?3gJWGmXOQVYouaXtir1wJjrE+7APXjy5Q571eux5suVQgTwBzbE7nnzlODvG?=
 =?us-ascii?Q?5flpLgShC5jgjRMsU3sC655nU3+vzybOnFO0QRUAs6WMb1m/eI6xpYRohr4v?=
 =?us-ascii?Q?y+PyiamSoYcVkZFBED8qpDxi29s8cyBKSZv2BHQZGnKo7S7vI5dDlt6vIN2b?=
 =?us-ascii?Q?XI/OzZvybY+mld4yIRPmfnSsB04jX/fZv/0jgoJmOgQuKxur9tKIl+6mS7sw?=
 =?us-ascii?Q?OLOH6WAkRJxihmZ50VQDpyTsXy1OGFI6F2BQoDiWzUpPD7JNyT6IwCPOfzOj?=
 =?us-ascii?Q?u/ae0fpbUrgDHx1k2PJ5mRkS+u1i/EaOpY6vMOfGiRc/47ZKsbBOoXpjOugh?=
 =?us-ascii?Q?VSu5aPFbm7YqT9Qeouo2qbMceV/bi/Kslgno9FkDHVYLxhLBhBAWshKyETA0?=
 =?us-ascii?Q?WfdyBTbbYUsh9sEGbiR9JRoYQNLNZIJhn0sgarRfSJIXGPCngY9IKLSVD5+w?=
 =?us-ascii?Q?TJiTjcy0RwWwDQ1OLgPdD/WNC4vjm+d8TTUdOkMsgAihK7yAqijcrlxeVT7m?=
 =?us-ascii?Q?TSUBSUXvDvJtRQwsENBUWI3KCqhgpLCR1x5QPXel?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06861fc3-1357-4aae-e536-08dda36ce467
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 13:37:04.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfLS/dEW0ySIR3XgDpHdJEz6pNJhrEooAmeAmvR1CfgnMR6QJo9OJ2QgeeqgoNOE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941

On 4 Jun 2025, at 9:31, David Hildenbrand wrote:

> On 04.06.25 15:26, Zi Yan wrote:
>> On 4 Jun 2025, at 0:36, Anshuman Khandual wrote:
>>
>>> On 6/3/25 21:18, Zi Yan wrote:
>>>> The config is in fact an additional upper limit of pageblock_order, so
>>>> rename it to avoid confusion.
>>>
>>> Agreed. This new config has been similar to existing 'pageblock_order'
>>> that might cause confusion. Hence renaming makes sense. But instead of
>>> PAGE_BLOCK_ORDER_CEIL should it be rather PAGE_BLOCK_ORDER_MAX ?
>>
>> Or PAGE_BLOCK_MAX_ORDER?
>
> Would also work for me.
>
>>
>>>
>>>>
>>>> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
>>>
>>> Does it really need a "Fixes: " tag given there is no problem to fix ?
>>
>> I have no strong opinion on this one.
>
> Probably we want this to go into this release. No need for a Fixes: I assume.

OK. I will send v2 later today, so that Anshuman has a chance to reply to my
new name.

V2 will has following changes:
1. the new name: PAGE_BLOCK_MAX_ORDER,
2. add the missing PAGE_BLOCK_ORDER rename in mm/mm_init.c[1]
3. drop the Fixes.

[1] https://lore.kernel.org/linux-mm/202506042058.XgvABCE0-lkp@intel.com/

--
Best Regards,
Yan, Zi
