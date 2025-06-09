Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2069.outbound.protection.outlook.com [40.107.95.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46EF25E46A;
	Mon,  9 Jun 2025 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479860; cv=fail; b=YAkCH5TycDjsWWx74sRFuCY93oyYeGCHgmCYeFEyyteSuhDyKgGOiw51BPYuc2Q3LhGjw8gSW6b2jVM4+cJKestK+ckwBJpa/qc+VAucuawzRwnO0W4lb2PMj5jpUxy/R9oa8oW8dEwku/Cx7U93+vY9rhdT4XPZpMy+jYVpyT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479860; c=relaxed/simple;
	bh=E9iyI7XJt07RO/XMjqkENp12qCMC78uopBUj68zvRf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SMRqkSDlgIBxQwOl5FNbU4LLTMl2H0S/E8duA7vzON+/WFfijV2lca/cFJc+H4wp+grEtmMPURBBXJxyDRpxOjc91snlDRULDlqjv1HI0omlbtpnjK0zU6eqOMkYUlFWcSH7VBO4KIYOnZYfZncz5gCh9EtsSN/e5IK45QLszQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QVMNogI0; arc=fail smtp.client-ip=40.107.95.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QVMNogI0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGZmZo7f3FD46QyMXgKZrxQymANIyBi6gDjfjXQaY/ThEnBLyAGDPAWSssQkRXeUd5HKrBAAjWFUafciZY49ZHFg8fBL8AojZOao6DunFbd5BRq/ZxZo6NgA3j01PsaV3LT1D/rCNlHHh+oj0wnS+E8HSn1gTpNVvRAbLTWM7Md0JZKymXd8vlOHKh7qv7x/yBj9oOv+QSxaSgfM/eNB1Zv6zpc1DDAOYqI8IIjgyho2Z3p7bg81jEYb4Ltx7EMTCoc+M7IJoUTaFLKljTW310vCbfU2rOEEjQeX0CgMzSy9P0T1pxjuC6iItyU5e/lFOHHTs1NFZKMaYmaMkXiG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziZBR2crl1poNRuSSxXrAGj6mNyZXj0ZVcCrZaj+BnQ=;
 b=pEDocDsF+U55fg+YVL5stm2eteUlZG3hhrCFj/gzDDckThjN60CLg7CCxOd1Xt5ObWakuM46nRq1l3tZejQNxLIK+yd6rZdOwrqb0jMJN/jaYfNWm6qNm0l5vdt4U2GhH/YhbMrszAnLMJHocuT09V2V3CZn59K5hik49EYrM3CPJfChG7TNKk3d/19uk45igsH9IDYUEPY/l6RvikOKd8FVoor/tXGMtPN+xK3M6QNjMFUPbVq58cvzpWGSBQv+GQ4katPXEEtnkWBUxWygvPzhQ2sE7TXhXJk2UViwLfW797sd4WEAWwVx1QRUReoZAa5IreL8vUyWnLHjGftHmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziZBR2crl1poNRuSSxXrAGj6mNyZXj0ZVcCrZaj+BnQ=;
 b=QVMNogI0y52O4pV9gTPeKlAi3Wm7AP7+vBFf5DWg8BrqwPTaR/uKcxnkMjTYh8ltTJskdDPgi5/9yoeE4SrNbj/OYv6SD4DMYq9/jvuz2Ux+ePv59fZ4QBS9Q2lNV9gYuSd/VJx1MeD7CHo++q5W2QzLVhisfkl1HxRcU82CJTbcEfHnX23A09TNdVsess027z4AYFj5t1R33sihU2YxUn6h4X2NqvZlUM36CcOBCWQrikBDMUOxALLdf/FaOi11+7f+7wsr9hrUzuUvqyQwV0HK5kGPlVVHPG12nFPk72pCHbUg7ieqnC6sR7v4y+LJWQn+IKtqjWrJI2oJMmfmBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Mon, 9 Jun
 2025 14:37:31 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8792.038; Mon, 9 Jun 2025
 14:37:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>, david@redhat.com,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, hughd@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kernel-team@meta.com, Juan Yescas <jyescas@google.com>,
 Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Date: Mon, 09 Jun 2025 10:37:26 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <B2F966F0-8F5F-43AB-BA33-BD3E65504F4F@nvidia.com>
In-Reply-To: <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
 <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CYZPR19CA0004.namprd19.prod.outlook.com
 (2603:10b6:930:8e::10) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2b4101-c7f4-4dc4-d6b9-08dda7632a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sgATq3spew9ZJePFTe9Rv0ZKCrx68Qws38KWnmXPY2fQYXbKuqgIip0th1H1?=
 =?us-ascii?Q?pUF8OywLWGYjgHoklRR3Xt5YhDDzZsFw8Sxjjy/57tNuBHSe9/SxOp/MuEDs?=
 =?us-ascii?Q?4oJDpM/K01tz5V1lG70N44qwMMfUZa7YmCYk1p2hs6DjSFTmDCWqyHTE3Ses?=
 =?us-ascii?Q?qU34HXcLhuR1QuxxAUIENzbTVeTyTePfASGG9Z8Ojje8lzI+OInapQzpPlQy?=
 =?us-ascii?Q?72YmaMZ+Td20FngjbHI6CfvIORQl2BtqzLZ7owG9mS61JWW/23db7MrYS6UJ?=
 =?us-ascii?Q?V3tsKTAd9DGrOxoKSnjrppcodY4f+P/2XuPuhXbs1F1uvsERBwQi1oFH68w3?=
 =?us-ascii?Q?iZcjVIE3TGxcN5OtLwlqFDNQXM9ZafJaoDFMsOANrML7uJ0EjF6zW8klY1+u?=
 =?us-ascii?Q?zK70dQmiX9w0B7ev6MwC1YW/4k5LFOHnU8Q2PMYtcnSleUIPt8cJ50YWOfc9?=
 =?us-ascii?Q?s5vUyJQL05e41Do2YKsWG+1GO/pkH4rGArn4mbZyR+KypAS7qqfQhQU8/Xkz?=
 =?us-ascii?Q?3nPqAhotCiZtzJQNtTRzt6cG52azNehq71gSkvRDP93LyppM8QA8+k81b8Ns?=
 =?us-ascii?Q?pXEOhlcob0cOGodRojKOc6rpsvozGdRQcRIWuWcFujUqL5H9ZrmXforeslDM?=
 =?us-ascii?Q?QClLk/7k2n2UhmDadrT+Y+FQSa8ZVRmTJ4fJ09LH6Fb1ToiE/qMP2oZFXaWe?=
 =?us-ascii?Q?8qnxYK7YLbdcszA+SpFbDWS2dXQogbq9ytC1O7u+MrzP8trGHlhjqPv6Ghhm?=
 =?us-ascii?Q?owN7gg77L0/nnF+gBJVUQ5sPVCjipmJtXGh/7IDcN1vG1v37ohM3d/T3uSsw?=
 =?us-ascii?Q?t0uMFeFSX/I+9c0QCcen62kaw4en4oeH3BQsASQRVLWRksOgKoDmIjSH2193?=
 =?us-ascii?Q?TIcIWPPDaoXpeTGXgbQgFT71e4txDg7hHHgHd2eDrG6IEQfxYeySgaYaJ/dT?=
 =?us-ascii?Q?qCo0Q5l1exC/tlt5YXzgku6mp3Hw+m6kV/4O+7X/1aA89OIpdMGU7oW6oBeh?=
 =?us-ascii?Q?7ZZAl4gPusG9i2OFNIxN9VTdpeF1gBZAYS7lya4IPnPNKkp2v1xUVS5YbIUq?=
 =?us-ascii?Q?LuQQWLSWKaMX8y97v0j2Rb1Np71WFLP54YSEcXHkstc6YknCfTn5Q+s0ROtJ?=
 =?us-ascii?Q?u5foFsjiLD4zIu2OOpELUFxgKv8wVeB/xAulRzCjeL4/DCO8usjhBlazDAp9?=
 =?us-ascii?Q?q0/GxWS4bUh/aA4nA05Pgy6BXC0CgLGCgoGQEV7uIHwuFaCDeZt5nSwxjMlu?=
 =?us-ascii?Q?Coq+NrqH9cG44R1T4Khl+c842Tw2my8qFK2Dcww0bgshRfIjDcfBVzgVeQqb?=
 =?us-ascii?Q?tyLK4fbxB+7C62xxJPZquf40Jc3K/osO9MZ36zPAJIEdmmyhZs3hrUa81XjZ?=
 =?us-ascii?Q?E6uMsWSAICbQ0bghjfc/6LfXxpylmOGPQtuavcpNIyt3effXEWiRqq9ibU5b?=
 =?us-ascii?Q?Dh7W8m1VbIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d2FoM9JDzWQXY64UMkv6wBcX3jBRy2PzLfvfrNPn0mHD75u/p/XgR4R2YekD?=
 =?us-ascii?Q?CT3UluDsxRSJFFpCL/e7Ig8hSh+Ufz2gkyIu9jgJSxAinBLwZFm7bG8cmJWn?=
 =?us-ascii?Q?Q8946MVMaFr8wK9NwGaMX/IQJFbprQq4XeV9MzKleYE0W9xTnvaUp0bivFFt?=
 =?us-ascii?Q?5ROLho2sfFrT0wiVuDc4EZDPNqtucl5JnJ0Bk2zAu4gvi+bWvYdVuwb+ciZ2?=
 =?us-ascii?Q?9cKsuxItGmpQffBtHa1suL9zoG1VgCwJbzIcU6DxVWU3S2L6kNiF1VXLqZwm?=
 =?us-ascii?Q?McMGg6WDsV+bpUzuAlu/ZR+7hhaLQOB4Y7io9+d8UrdiBZTL64ab7sVfRTDr?=
 =?us-ascii?Q?Es1paq3o0BvYAZ9w3C2EMfF6EgpRlRFJaA2SSTodV2SPceRmN4+Zm2wioO4T?=
 =?us-ascii?Q?YE9ro1t1zhfh7+2GxovbChHn5huO7azmFBkPVOyPJNOc3VzFTwU/Fcxi5kYB?=
 =?us-ascii?Q?UndIoA3q386zvOTeE1V5jlNj3WrBCaifs5WgEL/8jGMm2b7yxDSg1ZaMD4b6?=
 =?us-ascii?Q?RrXDWiU4u9OKzqs95PoZS23ap1cx443ASGLSGQSp4QnLgR6nXpgxq/yHMTc4?=
 =?us-ascii?Q?WP8LgnMdUJnD1RGYoHBo5lKE9JoGJ6oha7zzv4DEqaV45dTzYdEKZCXekhtc?=
 =?us-ascii?Q?PB9qksV2L+BelTyQXfsO+XNBv7+fDcIV6sz/R8DskFGN6bGeUGOTZ2Dwjr0+?=
 =?us-ascii?Q?Pk2pxMN19t0sb0aCzBmfYK6S1qDhoTFK6dCxEANkHfLzqD09J/sdzj3qw59G?=
 =?us-ascii?Q?rY8wxi4Hxf+eyBscaG2ighUaLPEKPpBRrgPB4amfDUhyxhdIZCGD3vlDGho4?=
 =?us-ascii?Q?raXezARt6yysTJhrwIl94wrM8xPy89gMVfCfcVFPPvHbUNZUaVW6pNurn1f6?=
 =?us-ascii?Q?1j19/HN2OD0uN66C3J5CFpd6dw5/ohFWB8Wr/n3P51lvOcWS/O0yHKugeEzL?=
 =?us-ascii?Q?865sjiDs1CEuh7ZgjGKLQaiFIeK3vaaKgLkyLbeW6jiIJEuBr3kXCXxRd+Ij?=
 =?us-ascii?Q?u5fSPrExeL6YDcSaZ3rBchfPt/GtNllDkPTJ/vyooX9RgwPCABtB33FpWMZf?=
 =?us-ascii?Q?7+m1Dl0QRAq48m0dD2YVYa015LhwCcbsISrOSsjQ1tEwbcyZb32SClNvZ2jV?=
 =?us-ascii?Q?Bq2IP5LqhWOuBvea3TGkmzYNXaO6so2L7DOE3IqTs173+AoBL+72Vyy586dn?=
 =?us-ascii?Q?sFjuMFwY8NUvFjAxU0PQMPiFnxYhTquzgv93bLA8+O3ufpNoVsEulgWSV8sW?=
 =?us-ascii?Q?kb7A3er+I2o+Vf0DPtxvN/vPCQoC6WxlZeMBDR+N9o5vnfqp7O4Z2Irlm4ad?=
 =?us-ascii?Q?0vHjSvlunc6+74vkMdCYNCfNW//24RnsX22PK6lGdxWQFZuf3kmqR19Z1P7l?=
 =?us-ascii?Q?3bBov+OMhWndBaehr3kZH8j2zPEgIdzYUTszpPMrigQvahtFoIN7ddHu0luI?=
 =?us-ascii?Q?NJoQRT3yXYXGoQ/zWYR5bd9hjEPcjgcNeZL584mQFGVgT/wDCvV2zk4QWxV4?=
 =?us-ascii?Q?Kz7D6fSxxJKxgYCP5I7TP9M3n1SloXpBLCzhMm+Z9x3BNz/c//wRiGm8RDe8?=
 =?us-ascii?Q?S4WocE+AucvJaa9GeV0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2b4101-c7f4-4dc4-d6b9-08dda7632a4c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:37:31.0780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 29jX/xEZ0QrkiJzlwm5nY//+M9GWJZ2VUB1BU4s0FN9xpCwLGTBdeXjaMJZ1wPZa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927

On 9 Jun 2025, at 10:16, Lorenzo Stoakes wrote:

> On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>>
>>
>> On 09/06/2025 14:19, Zi Yan wrote:
>>> On 9 Jun 2025, at 7:13, Usama Arif wrote:
>>>
>>>> On 06/06/2025 17:10, Zi Yan wrote:
>>>>> On 6 Jun 2025, at 11:38, Usama Arif wrote:
>>>>>
>>>>>> On 06/06/2025 16:18, Zi Yan wrote:
>>>>>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
>>>>>>>
>>>>>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and he=
nce the
>>>>>>>> watermarks are evaluated to extremely high values, for e.g. a se=
rver with
>>>>>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with =
the rest
>>>>>>>> of the sizes set to never, the min, low and high watermarks eval=
uate to
>>>>>>>> 11.2G, 14G and 16.8G respectively.
>>>>>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M T=
HP hugepage
>>>>>>>> size set to madvise, the min, low and high watermarks evaluate t=
o 86M, 566M
>>>>>>>> and 1G respectively.
>>>>>>>> This is because set_recommended_min_free_kbytes is designed for =
PMD
>>>>>>>> hugepages (pageblock_order =3D min(HPAGE_PMD_ORDER, PAGE_BLOCK_O=
RDER)).
>>>>>>>> Such high watermark values can cause performance and latency iss=
ues in
>>>>>>>> memory bound applications on arm servers that use 64K PAGE_SIZE,=
 eventhough
>>>>>>>> most of them would never actually use a 512M PMD THP.
>>>>>>>>
>>>>>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the hig=
hest large
>>>>>>>> folio order enabled in set_recommended_min_free_kbytes.
>>>>>>>> With this patch, when only 2M THP hugepage size is set to madvis=
e for the
>>>>>>>> same machine with 64K page size, with the rest of the sizes set =
to never,
>>>>>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1=
G
>>>>>>>> respectively. When 512M THP hugepage size is set to madvise for =
the same
>>>>>>>> machine with 64K page size, the min, low and high watermarks eva=
luate to
>>>>>>>> 11.2G, 14G and 16.8G respectively, the same as without this patc=
h.
>>>>>>>
>>>>>>> Getting pageblock_order involved here might be confusing. I think=
 you just
>>>>>>> want to adjust min, low and high watermarks to reasonable values.=

>>>>>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_page=
s_per_zone
>>>>>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, t=
he changes
>>>>>>> look reasonable to me.
>>>>>>
>>>>>> Hi Zi,
>>>>>>
>>>>>> Thanks for the review!
>>>>>>
>>>>>> I forgot to change it in another place, sorry about that! So can't=
 move
>>>>>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
>>>>>> Have added the additional place where min_thp_pageblock_nr_pages()=
 is called
>>>>>> as a fixlet here:
>>>>>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@g=
mail.com/
>>>>>>
>>>>>> I think atleast in this context the orginal name pageblock_nr_page=
s isn't
>>>>>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
>>>>>> The new name min_thp_pageblock_nr_pages is also not really good, s=
o happy
>>>>>> to change it to something appropriate.
>>>>>
>>>>> Got it. pageblock is the defragmentation granularity. If user only =
wants
>>>>> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
>>>>> kernel will defragment at 512MB granularity, which might not be eff=
icient.
>>>>> Maybe make pageblock_order a boot time parameter?
>>>>>
>>>>> In addition, we are mixing two things together:
>>>>> 1. min, low, and high watermarks: they affect when memory reclaim a=
nd compaction
>>>>>    will be triggered;
>>>>> 2. pageblock order: it is the granularity of defragmentation for cr=
eating
>>>>>    mTHP/THP.
>>>>>
>>>>> In your use case, you want to lower watermarks, right? Considering =
what you
>>>>> said below, I wonder if we want a way of enforcing vm.min_free_kbyt=
es,
>>>>> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggesti=
on
>>>>> is lame, sorry).
>>>>>
>>>>> I think for 2, we might want to decouple pageblock order from defra=
gmentation
>>>>> granularity.
>>>>>
>>>>
>>>> This is a good point. I only did it for the watermarks in the RFC, b=
ut there
>>>> is no reason that the defrag granularity is done in 512M chunks and =
is probably
>>>> very inefficient to do so?
>>>>
>>>> Instead of replacing the pageblock_nr_pages for just set_recommended=
_min_free_kbytes,
>>>> maybe we just need to change the definition of pageblock_order in [1=
] to take into
>>>> account the highest large folio order enabled instead of HPAGE_PMD_O=
RDER?
>>>
>>> Ideally, yes. But pageblock migratetypes are stored in a fixed size a=
rray
>>> determined by pageblock_order at boot time (see usemap_size() in mm/m=
m_init.c).
>>> Changing pageblock_order at runtime means we will need to resize page=
block
>>> migratetypes array, which is a little unrealistic. In a system with G=
Bs or TBs
>>> memory, reducing pageblock_order by 1 means doubling pageblock migrat=
etypes
>>> array and replicating one pageblock migratetypes to two; increasing p=
ageblock
>>> order by 1 means halving the array and splitting a pageblock into two=
=2E
>>> The former, if memory is enough, might be easy, but the latter is a l=
ittle
>>> involved, since for a pageblock with both movable and unmovable pages=
,
>>> you will need to check all pages to decide the migratetypes of the af=
ter-split
>>> pageblocks to make sure pageblock migratetype matches the pages insid=
e that
>>> pageblock.
>>>
>>
>> Thanks for explaining this so well and the code pointer!
>>
>> Yeah it doesnt seem reasonable to change the size of pageblock_flags a=
t runtime.
>>>
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pa=
geblock-flags.h#L50
>>>>
>>>> I really want to avoid coming up with a solution that requires chang=
ing a Kconfig or needs
>>>> kernel commandline to change. It would mean a reboot whenever a diff=
erent workload
>>>> runs on a server that works optimally with a different THP size, and=
 that would make
>>>> workload orchestration a nightmare.
>>>>
>>>
>>> As I said above, changing pageblock order at runtime might not be eas=
y. But
>>> changing defragmentation granularity should be fine, since it just ch=
anges
>>> the range of memory compaction. That is the reason of my proposal,
>>> decoupling pageblock order from defragmentation granularity. We proba=
bly
>>> need to do some experiments to see the impact of the decoupling, as I=

>>> imagine defragmenting a range smaller than pageblock order is fine, b=
ut
>>> defragmenting a range larger than pageblock order might cause issues
>>> if there is any unmovable pageblock within that range. Since it is ve=
ry likely
>>> unmovable pages reside in an unmovable pageblock and lead to a defrag=
mentation
>>> failure.
>>>
>>>
>>
>> I saw you mentioned of a proposal to decouple pageblock order from def=
rag granularity
>> in one of the other replies as well, just wanted to check if there was=
 anything you had
>> sent in lore in terms of proposal or RFC that I could look at.
>>
>> So I guess the question is what should be the next step? The following=
 has been discussed:
>>
>> - Changing pageblock_order at runtime: This seems unreasonable after Z=
i's explanation above
>>   and might have unintended consequences if done at runtime, so a no g=
o?
>> - Decouple only watermark calculation and defrag granularity from page=
block order (also from Zi).
>>   The decoupling can be done separately. Watermark calculation can be =
decoupled using the
>>   approach taken in this RFC. Although max order used by pagecache nee=
ds to be addressed.
>>
>
> I need to catch up with the thread (workload crazy atm), but why isn't =
it
> feasible to simply statically adjust the pageblock size?
>
> The whole point of 'defragmentation' is to _heuristically_ make it less=

> likely there'll be fragmentation when requesting page blocks.
>
> And the watermark code is explicitly about providing reserves at a
> _pageblock granularity_.
>
> Why would we want to 'defragment' to 512MB physically contiguous chunks=

> that we rarely use?
>
> Since it's all heuristic, it seems reasonable to me to cap it at a sens=
ible
> level no?

What is a sensible level? 2MB is a good starting point. If we cap pageblo=
ck
at 2MB, everyone should be happy at the moment. But if one user wants to
allocate 4MB mTHP, they will most likely fail miserably, because pagebloc=
k
is 2MB, kernel is OK to have a 2MB MIGRATE_MOVABLE pageblock next to a 2M=
B
MGIRATE_UNMOVABLE one, making defragmenting 4MB an impossible job.

Defragmentation has two components: 1) pageblock, which has migratetypes
to prevent mixing movable and unmovable pages, as a single unmovable page=

blocks large free pages from being created; 2) memory compaction granular=
ity,
which is the actual work to move pages around and form a large free pages=
=2E
Currently, kernel assumes pageblock size =3D defragmentation granularity,=

but in reality, as long as pageblock size >=3D defragmentation granularit=
y,
memory compaction would still work, but not the other way around. So we
need to choose pageblock size carefully to not break memory compaction.

Best Regards,
Yan, Zi
