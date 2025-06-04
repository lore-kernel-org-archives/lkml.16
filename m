Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CE1EF395
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043595; cv=fail; b=MH1L6ywtgTx47zKn4EgDb7HVD5Ia0IWML02QPvkyvXU7ie4N/Wfz2HswznnsXVioJ6pXqYh5zV1e3THB0kLWRGy5uAkmQuDamvLqcsBEMKjvrufaxh252Rj35zxRxx7YRElh2gUA1CERZ2rI0GojFkcPcJ/VgHrzQ+fKKn+upAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043595; c=relaxed/simple;
	bh=Qq/ylQj8aRqCGaRWavUDFqrG4XgP3DinYVvofluMSNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4OIXcG9AZO8jV8ACF9slVcIWlQBtJ2ZChQElmtkwbMAO7zkouilWRcYVD8Q2lNP0lY7tagjO7v4KHK9dh9/mLTrwBv0+WwFlEBZlfParVhlhVysLIE0Dw30f2qmj/P9oYJtR2YcWfouljbBB8MhpuHjf0pDpnQ9d3kAkmSOAM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iLg2oHSO; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iLg2oHSO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODBo2Yc4L0n9HtX0rosuo/j2BQ5+dvsmwYmB1HM53XjpqPzVbr7XyG//qh2cf2fkRhpQSUJIYk2x3zM/vfJFMXe406b7712mqNKV7lczlO/oEVkqPlEa+AD6WqigiabNpeSeRG5P5I0HZjlbSp1QFLSY/n+khrtWvLpoiTEzkMxefkQeX/i3u+5wN/rWgxTbv8UPnYI7zF6UXWhN1ZTycgW9arIynDmI1TC0cC10D64UJ418wzGKL+SEGaarLtoItLCuouPekecn4Ia3s3fZMYe8KbQoucxacwwy+1SrGEeMCSsKuCc5IKBi+ljBXOru5KkIK5fgFammEgziQwqctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq/ylQj8aRqCGaRWavUDFqrG4XgP3DinYVvofluMSNs=;
 b=ClYRU+ifHNTyH+qrsorXmsVK4msKu0dsFqtu6nWLp87NP5E50EfK6OQX1NPdduloTUz5iOMo4pJORjDuHEM3rivQXDdiVxrrePNaIv01A30786cnkijaj8v7S80HP1eVKiBvJSdCTP8qP0/do6TIi1rykNaHsNBVc42VZ2tVrXV+V+nRZb87vygHelKQE7JfEYiEevzKsjWV9kPDskueptaxZwAGAhbVhnGwwdULhw4N0FAuFtP30t2mH/LBMiY1QSmwW/LVghvDBMjeTqDPyVklLlP5dsbTrE5vfZNn3jBQFcor62R401DKuudrrlqmeptJN/HUZy+iDUSKYdztDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq/ylQj8aRqCGaRWavUDFqrG4XgP3DinYVvofluMSNs=;
 b=iLg2oHSOOAP6G6lYt7i1vUw3jj2nGI66PWvUMxTessKI9Mwyyc/2frJQXdWIboTEgbuR3cQZk0fteNPwtL1nJl/bDleZNQ1dn+NtISrzmkexZgFS4DZ1P2InCn29jg0HfDtVUMnUxX9HNz2vSWnq2uEIhgjbm7gDimZgnQSHuiLblBQHK2Rr6vilWqnDowK2OHPdvQXnQKwEFM9mnB1zTz5q2oxRoegTuaZvhGtjL2Z3j7yDTxmoNekE9APGDfF7UvOSPYIfL4sBoPwCk5hVLSsW67D6UbearcYe7Ra/UElTlOvI7Vck7Zkr28JITzTymmSSnuGhLsESbOX90hl6oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 13:26:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 13:26:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: david@redhat.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 isaacmanjarres@google.com, jyescas@google.com, kaleshsingh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com,
 masahiroy@kernel.org, mhocko@suse.com, minchan@kernel.org, rppt@kernel.org,
 surenb@google.com, tjmercier@google.com, vbabka@suse.cz
Subject: Re: [PATCH] mm: rename CONFIG_PAGE_BLOCK_ORDER to
 CONFIG_PAGE_BLOCK_ORDER_CEIL.
Date: Wed, 04 Jun 2025 09:26:25 -0400
X-Mailer: MailMate (2.0r6257)
Message-ID: <957DB2F9-9C7E-486E-95EA-1E6574F82D4B@nvidia.com>
In-Reply-To: <d6f18e51-47a4-498c-ad66-60fa2d8efbfc@arm.com>
References: <20250603154843.1565239-1-ziy@nvidia.com>
 <d6f18e51-47a4-498c-ad66-60fa2d8efbfc@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0361.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d970d64-c01a-4a08-0fdd-08dda36b69bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aalxr7N6Tfj8xdjW3xH65B2EH4u1zj/0ctNIRWVzYQ74UUEO9F10N16T1WL6?=
 =?us-ascii?Q?ofdZQYKzEzRKf3sTi0VbwUJFuivaAzxZWRsVYZmrDh33ylX3m8G2ZRUjGtXr?=
 =?us-ascii?Q?JrSDXFrVETIegQafOOFUozeS6voJYWmCmyIOQ9gvWR6T0/pnl6bCaZAhcj4N?=
 =?us-ascii?Q?NaAtSxjSLULDLDOIWT6+Ds0enN7u7EYRMpuUNdjJwleE9LnwC6//9fBiaj1B?=
 =?us-ascii?Q?fNDy8bpMQ+y/r5u7vd6pHZUhTS7O08/0oAyds/tWBpDWVp8unyxoFAxbsRGQ?=
 =?us-ascii?Q?xdGsBuz34AMz74+bbC4kxbqctILyDKGIFKPvhmBEkk11Wap/3HDzwweB+kjz?=
 =?us-ascii?Q?t9L+tq0eyq5M0mjjIVb72IuxKMTtFwjN0p6jWWoaGXhgtT29c0PqjXRktAxU?=
 =?us-ascii?Q?FuiYFiVzL/wenORuf6yXpwRRJ3WVrjtH1f6TGG+dVycbyP7JtTf4SI4N46Jg?=
 =?us-ascii?Q?QZnQDo8yJ6ibFQjV41EF1nnQRhExsply4s0ptfRxiz8OB2YQA645SJhSTXau?=
 =?us-ascii?Q?r3pDjh6I1Zv84L+ugSo19+pNKh/0pCcDySQ9ZoLKBKj0ZjKKQhVbbgHlai8q?=
 =?us-ascii?Q?yAMWR3U1OnEPpSYi0Yey+NyKvGGWxqZJb1CXRNuUDKtqBhdC/hfK5QWdOqRt?=
 =?us-ascii?Q?wsB8UhiFCobXIaMkHGXXb+xWI1TPbhn1PET7jhzmvLXp+6GuGramRFAavxPT?=
 =?us-ascii?Q?wKR0T2nU2coqT3Y5m3PuwH3XxV3RZLr6B0jNCsNMW7HQ3HPfiyOatDlFiQLB?=
 =?us-ascii?Q?iaE7365zzre3caq+bOeSinq/w7uGtAG8l2Xo+S4l/Wne5lm4SCFj9aaNFTNb?=
 =?us-ascii?Q?TtZrSbExgI5eIBz0MGIPz1A+g6XNvTs1O17OCGvhI4m+xl+GFSeepiVoSwZ0?=
 =?us-ascii?Q?z6jsYyUqaruRs5Y94k9TdjyGhv4/MnriU3iuN0xZb0DghtISjsKc/YAwK6PD?=
 =?us-ascii?Q?m5QR1OtY1wNACIfUP4oAloHP84BxrOEv82qlrgYGzYX7Svf8WIgORsq3RDHF?=
 =?us-ascii?Q?k4fefBjz7AEz/Jaj1sCvjLrQ29FJLDayXmUU0gwDdkMPX4YFr75a4drmfazB?=
 =?us-ascii?Q?+3RT8Z9Q/ND9bnyKuPJkbimGruBK23yeC+ZMEi2dV0RKwarQi9aEBEscTt+c?=
 =?us-ascii?Q?S7n3YJMk/z2/qKuTt1xnS+3iJ1IeU5N0tCCBwMeRKWe7TARDYG3fVmJnEZ4u?=
 =?us-ascii?Q?4AbO1PgXbYWHlnU23eDJ9ZLIbbn3+LAXRHONTaQR0De5GY6Vjh3XPUgzCHkw?=
 =?us-ascii?Q?MQI4KUUpb4EPMATNy307Z7P0Xi9ILNcAFNXCiXSXQpvLMR6E4uxcvQSxcg64?=
 =?us-ascii?Q?OntI4cwdwPLInGkoBjd21gXz6ZIbWtJRrxkIcf3OyHe52ROMd0Y+A9IC6P1h?=
 =?us-ascii?Q?BaMAUbDqSaD3Nso2JfzYBiFds3QpuPO7/iUpen4WRl9Qgidr9mZRwI7N/jGt?=
 =?us-ascii?Q?1tWL9so2hMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOq8nGm5W7vKQpKHrYcr7/Iq22lUFZp9I8o3s7dWbAMRSx0dpF+XSuvqT9Fz?=
 =?us-ascii?Q?s1kHjAQNSo7AKmrZJsW52i7BANiqYUBd6zRCJ60mQIOJjdVU2Tiv5+cSfh2O?=
 =?us-ascii?Q?g0SZQCeYl2C0WXjVqUGKk8E5Tm+EL5rET4+WSD853csLG+no5lRiebOSh+Aq?=
 =?us-ascii?Q?ZyoyXXRNGRWAHNjBj7OeFPAK8FxWSMbAEpkU0TmC1qD6x9ODimsmKj9aCYag?=
 =?us-ascii?Q?ccI54kdJ2s7OLh18BB4IRDaGtjqke7OS8JXPwB2egPWcpx1f3mdkmXnDX+Ll?=
 =?us-ascii?Q?OW/lC9k1EyhNT9friY1YzixHureW+BvYQa6HiETmyTB9vsza6ySl4kNBL70f?=
 =?us-ascii?Q?WczW1Klh5QCNReg75y8YaMsRoLVG3Vex7X7qRA0sCIjX2sf0x1qpXVKB8Mv3?=
 =?us-ascii?Q?MYNFiINgVa1K5pRNJKui48TOo+XjWlLYMfdcu4/J8IYE4VkMfRs7ovtiA9xF?=
 =?us-ascii?Q?8r92hXuefCDTx3glrTjsfHIv/4lrxzA3GRMUzXgur8brx38eCtRzC1Urqzbz?=
 =?us-ascii?Q?xEVReH44RGAvC8k6FQdONRhdF/Yu13cIfQzXGIKbiB7auATxt8r9HllEP1MV?=
 =?us-ascii?Q?Kw18f1HX0VAAu+oVZPz7n27UYSvI/A1LGlemB6DVIoKm9SYmQU2wl1I/3Vkm?=
 =?us-ascii?Q?ogYKKX5SHy8Gr0qToYJ4DO6JRV1UmLYx5oDtD8vlfy8ma/l2rfJ0//i+pPcg?=
 =?us-ascii?Q?GDRZRe+x/9zAA8q0Cs0kCpnvPJtJzv+SrSr3afTjtx+CYOswU1+Yc5qBlSPZ?=
 =?us-ascii?Q?sXoLEzS/pjCLWjWP2Schna6XeS5ktKGTU5p5zLCNfP6c/htEFRvMPne+xaxt?=
 =?us-ascii?Q?+kzQ9igKRFrSQ9xokRFq4CxXTPfUgKenI9d5brrV+QKrMDTGV5HpB/N0gSl4?=
 =?us-ascii?Q?vZU/mv7vLo96V3sRL3cn59+0NAd3czixe79AMLgUCgMX/hVs5+GSrTfxaF7Z?=
 =?us-ascii?Q?rB0/r5tJFXNQuCCcRt2KccKbJdEGyBxUVl+8mnf3ZHYppw4k1xZdO8kJVTZr?=
 =?us-ascii?Q?4CeiwRxbkoQ5/IcuA5kAQsxHs5xNz5AKjhJ7QEgQxs6Z8dLuvWuj49qMuj8p?=
 =?us-ascii?Q?f+gfg5GFhRwQ75K2CXbPvaCy4z6faFCFXjm+QWs6AfXeCNhHIOs5vUegdJ3w?=
 =?us-ascii?Q?6taJvyoFfA2d0unG9pkpn8zOqfTg6XtB8G5ZyUNl/WZfgZH1jS77fbVXRaHO?=
 =?us-ascii?Q?5r0M9zgKiVK3/laDdAjiafFSNIS5Wnss+uc+16uFfeix0/NirI8QptykpyPW?=
 =?us-ascii?Q?F4heXkBPMgfyTkRPoQTjCrS8cNVarIkq/MRvgwQQho2QA6Tt+o/0qjbQN2WH?=
 =?us-ascii?Q?5lllkLujNxWtWChdYCRj05XGa5L/KYrrqM9iiEvm4PMaK8dNAarOoeauuZVz?=
 =?us-ascii?Q?TD9OotFxB6A/QHtKjjXx0yexhRe2nzTtZVITnq+96qY3UysvewsD0/rxCP3A?=
 =?us-ascii?Q?tEWUnFij+0S1q1QR+NJVKevKH+I4VrlYQzy9poIJwScBXoqCrJZ29KntYGmR?=
 =?us-ascii?Q?m6iEBtM/zhkLVDns5dWw2Q6+R9Z1xSqtOnuQT0JdkDgewyKyHa1lN0nJ8kxL?=
 =?us-ascii?Q?SZGto+kynXjB1Nn7fYzTcc3OclouwEfL1Wiexjb9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d970d64-c01a-4a08-0fdd-08dda36b69bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 13:26:28.8521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvA+HKWeQs5p7qbHtg913+IIKCAH295DO7W58INQEoDOzC5SHiNbVO9kdBqi2C3i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277

On 4 Jun 2025, at 0:36, Anshuman Khandual wrote:

> On 6/3/25 21:18, Zi Yan wrote:
>> The config is in fact an additional upper limit of pageblock_order, so
>> rename it to avoid confusion.
>
> Agreed. This new config has been similar to existing 'pageblock_order'
> that might cause confusion. Hence renaming makes sense. But instead of
> PAGE_BLOCK_ORDER_CEIL should it be rather PAGE_BLOCK_ORDER_MAX ?

Or PAGE_BLOCK_MAX_ORDER?

>
>>
>> Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
>
> Does it really need a "Fixes: " tag given there is no problem to fix ?

I have no strong opinion on this one.

If you like a different name, I can send v2 and drop Fixes.

--
Best Regards,
Yan, Zi
