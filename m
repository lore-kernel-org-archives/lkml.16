Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F64414;
	Mon,  3 Feb 2025 21:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738616757; cv=fail; b=uc6wytbN+exWmDZWmRyVpztu3IQNIjWeEnnA8i1WJoqXstUnN8dUehbJZ9Gu6vf43qHEGnMC7Jxtye6vNLrehngIHzVKdg3HM56Uk0s2T935hWk6KaDnJhERETqB3L4RCdhYz9uqT80iDD+TdQFflkzhaFo0uUDvfiF0NCyI5Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738616757; c=relaxed/simple;
	bh=18WWLv4ofakDWrPnt8DRBlAgbt6ADFFWZBYa7K5GAnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VUEIoFSnWDxipb/FD68D/tkflFL9ZSMhzQqhALx/8umxoZZu+enWNGm/dFWJIx6yTFOoPcBfdhy6cNkKNcWLagaaNIeghq7VhrSrm3kvidkgDDzmrXRZdMeq2OBWYebfmHZSDzQSovTntt1N6mv1IsfRd/yYZp0hu0c48uLM1do=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dsXTJaHi; arc=fail smtp.client-ip=40.107.95.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dsXTJaHi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad0CWkVqIOfR7S4C0PdndoUHIJhWR9J4F/DiaqdSOppa+ivAG6FPZZ3EOpKjlH/mSnIEG2lb/o4F4BrzIwBodQ7Bp7Fu5x6Sd0B6GiKxCb7+hNkSCscAXMtyteJn238et9djaG/txEAiCHDXLWVVBNw301wbIcT3o3DL7gs9xhR1qtqcM3/LWqN9eZCRWrpsc9QTUBLxx5dzAarfD/18+ljZWvENglu3Cj3mIOnIvnnTX79244jmxlrtaV13Rdq49ADkI663m5kT1uIT6YAs5+B1tIC2g5u5THXZfe3BkCXgvfxPP8ZRsCb/SLzL0llYAkN9V7H1IY4VxZb4YNwrFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC18PVYx92wZJlw/sJZzVJZC4rMoIFAv3m7iMcM2MeU=;
 b=aiB7YhC63r/uUw4uDkfhKfIScP5Z7M4742CeLKezl8NDE7OpUqJ9hFJ52gYRM6XfLaPFsqaY9mJ8JD6sGnTyCg6V+PYyAwExAaSQJslgv+IZsDA8FbdyaQYDHWdowxOjeHSR84OSNJNMEz17qJi+mMEGvodtFRVgUUeXQzdZT6jfwgbJNZ/RTrEswC2Yskqbyv6TemDeQcIJipv1R3cHpGJ5hmTRRU63Efz6PGsMXQgGrZ96afRJ3jXGbP1jX+Nh+tpQEBiabnI0UueqBeVUM6UGrpMfc5uOWp0K+AvPpfIufGvlq7sx22qlRc8KFR8jnqjND/Ke0WgcMiApMr2XMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC18PVYx92wZJlw/sJZzVJZC4rMoIFAv3m7iMcM2MeU=;
 b=dsXTJaHiEVele2pqGV8QgIP/vvUBkQK6UX+iTllmr6zViwa+OEDqFu0ArGGp7ObWRTdF/JGEkt+C6ECOiRuCfXywFLgFU9EOhFotxyrd7QbECsULFXhZF7nuE1wCXhjV+g37N+vOyoyu50NJn40pcHoY7U4MI+Dwl9gVw9YdguuPgvr0uOYXpw7FNlE6PIB9AXco2oXZFkF7jZBbcYI4Suy/X6DR95Ow70Q/+M4Vsr/TAALieB47tkbzmGdOXclhh8M0/T7xUn3B4plYciFRutcMcVEz03Q9XMauEVrwXd2T7ZuV54U5J/dFcYPECnsOX2bhU5KvOOEMA3UDcKvvxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 21:05:52 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 21:05:52 +0000
From: Zi Yan <ziy@nvidia.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Date: Mon, 03 Feb 2025 16:05:49 -0500
X-Mailer: MailMate (2.0r6222)
Message-ID: <37A0729B-A711-4D45-B9F0-328FDB9ADD28@nvidia.com>
In-Reply-To: <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0455.namprd03.prod.outlook.com
 (2603:10b6:408:139::10) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b2ab35b-b59d-401a-89cf-08dd44968aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?voqeQ6snkHSJ+nkld2i0deSFIrtzjezhyW6cH9hhFwzTfWewDKl9aJ6oJbb8?=
 =?us-ascii?Q?UinnEDTVDu2T86R0dpuuIEyfnZ6KC6ceRrqMVH9/D0T2ykdGRlWYM4LGETTl?=
 =?us-ascii?Q?9rM1eW4Q+69U3B8V+NQv1eCtYhf3hQNGil+YVnIEpY8fb5SWoTzppBdOeSLV?=
 =?us-ascii?Q?EOt60hlS0KgPR3H/CmfqfF9PwyFlv0Hq1tnS/9LobMu6xe93fdpoUt1asCnL?=
 =?us-ascii?Q?peuQ9RyJP7e9IcQ1eTZSIyBXN12ZIT3Z1yasji1B9iJyXBLGiRBAJEZBrCzS?=
 =?us-ascii?Q?h8z2EHEhmBzSze1yZxsDpkRxBv0GJH+lycnpmO11WYtgJch8AKnAcM21qbvk?=
 =?us-ascii?Q?hvuFF8oD3LlauDEl5vIxBmkBsIJjbyPUbWufZf+ysnj/V0ug3ST1ELGWXcmt?=
 =?us-ascii?Q?wLbq+nCMtK+D3AyABuXXvHcT/Sxhb+q58Q2STg7Kkr48AErSziWT01r7Um76?=
 =?us-ascii?Q?iEBTaTJliw8VR5CvRxTcmAFynLOpnvOkemRb5nHXc2ksXyOp89njkDEh11aL?=
 =?us-ascii?Q?1DLdIhdEvu+SKLetXzZZin5UExG84BzIKyr7lvPHZTCDt2PYjSIh9aPxGZKN?=
 =?us-ascii?Q?VV9mkLCyekOkGnEYjZ5qPQkTzE3Glf2NJ6TPuq+5Z94XwYr1y2XPS9ZKfFK9?=
 =?us-ascii?Q?UAkYpP6UALWEuJVVg4OWmOH1fEZimhUe18Dit6X4ZhWVMWPyKv+t0RBumzXB?=
 =?us-ascii?Q?fYsgDneHkzCDXXjIxET0FW3cGDt29IVlLpqo6CYY9yvt/bfc5K1m/IS49FaY?=
 =?us-ascii?Q?GDm5aeXC00URRipWljq5n1jcl/3k2YS47sKLHe47w4Uf8yIyo3+EA87aeeLT?=
 =?us-ascii?Q?wTef8rzS0JUzG5VSZJIgYaa6xcNlVFCrnkZeAlA+inrcAL3M8brF1rZnjQYv?=
 =?us-ascii?Q?0iJTzve4F59vboRu5PORhS3VWHBN2dBGAnFkqdV4V2i8V7D3DvB4DMiElVsh?=
 =?us-ascii?Q?OvpIVHy2TlQ87hJOX9vIFZHpXWrgXwP7gYv5BdWI8ujnBH7IfVbP34qti1to?=
 =?us-ascii?Q?sApjsRSN08GIWaDpqdDXzjckL6gt1l2QzslCBTd2abXuJpgXatBR1st9CkSd?=
 =?us-ascii?Q?61I8gkQLNz+Tq8SZDvFhLsh0mdjV+hVeQHqDLbilvEhXDPdikkCW6FeMidMv?=
 =?us-ascii?Q?b/BpcrmgJqNWVNmY/9exDILLaxgen1q7cEhYzox0gjPk9Am6qBkNwEpcr7fC?=
 =?us-ascii?Q?dIeaou+vDgeFRsWDh0o2O634PgWv0E+ZqlduZ1iYnPIWmLoMSqyQxSEpE/CS?=
 =?us-ascii?Q?N284J6cmITHthRdZTM5xaULqKd622Lpwi54+OFQhZmVWv1zfwzWuz5XWjLfT?=
 =?us-ascii?Q?2Q3Q0aKykwbqZZhOObvYa4V1VHqqBnRcJJbHmLpzFsiJKlZrifaGv5mr4BXh?=
 =?us-ascii?Q?/EQFshcHdlvim7roco8BPdck8jl3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Wer04Sq3W0WAVqxGdAZEq7tuatwzDVcuQ2dHt9m4d/WNDIjLu0qIuHDMe7F?=
 =?us-ascii?Q?7NexMyQ7WgnGBriSe6wgV2UCQ1zYxcOIc7+fYY+8SEHvbkHEVTcQqdgVU8Ex?=
 =?us-ascii?Q?DOBLvqH/UxJzbJFbbBnPhWKXUQEYN/kaeIPZrLDzGYfAgdurd5vJR77LB5B6?=
 =?us-ascii?Q?3TXtIoF9qEDiGyLqzF3TECmg41lQPu2U85ZxadZHXrSWwwQ6+Orx1ugkcij1?=
 =?us-ascii?Q?39Yedebov7Lt8A2E5GYoc+jKzIZHJir5DwxjHkFGPNczvzsturm36VxUJ7Ps?=
 =?us-ascii?Q?ZgqsnYvLkDHmqGAtd/RQ8Ji1xb5MDWllrQGqnMlYfJAt6UcS6Na9czzQ5xxD?=
 =?us-ascii?Q?KKURSn5xxNtorpAYRh7DNOMEnR6e6kjnHwO+pMV3YJEfDbx1Nf4avSQRm8JA?=
 =?us-ascii?Q?wTyt9yydrQoeiUl/rmtPspOL7Dr6YEhxxTMJzZNlwvG7z6USuBN+oR4nZH7a?=
 =?us-ascii?Q?FCzjpw/jFI8Xg7kfgHwzsUg8p2462Bj/Y4llC9A/wXIdq14xCwPV1DhiiGp1?=
 =?us-ascii?Q?w63A1Lm1L0Hyx7DrKUWppWUf3a3tLxk6dOj9p/t8++ykT9ziEu/8BfoH096m?=
 =?us-ascii?Q?Toi8O3fAz7/hBI89VLWGaSUXJst9cqt3r0VT7F07rAwTj1u9BxnNVl6gTNV4?=
 =?us-ascii?Q?cPYk4eKsPnweGkT15C4va4XI65oFr7alHVc5VVHTQDON8SLPHpgB8/pPKJHM?=
 =?us-ascii?Q?vi/UOw2CHHahTCnv2abOWuJS1wN+4fuT7eUkifHsrdIdbC0YUJU++587WPqS?=
 =?us-ascii?Q?ejOOPbTaEqGEfIfVh8OfaXP7haMPKu5Q1Fv7m5SHLsdkdJZxMW5hO9ygRniW?=
 =?us-ascii?Q?svEyMPFhyewLbKjp85yWy9ftB1Lz0BBZxQs/2ZJw/wXCwYY/OENzFUbS8hfs?=
 =?us-ascii?Q?HdWA5G1gk0Ak9KEuL2ymDahEQMV34Z2Jy4yywjp/iny2C7vDoxlraFibt3DI?=
 =?us-ascii?Q?EZWuJsxLc9cQoGLMCAdlhfgBQl8ORVZBRDhEcDe0iXMWgyDoKZDiI5LAccyh?=
 =?us-ascii?Q?VGK+XZe3JDnFmXiedDoffbhgwBCpdV1FCQoi1096ZPlVXY61WXQIwgyW3f5N?=
 =?us-ascii?Q?gUFcmiBui9bOrELZvxenIYsqrCX4gPPIhWP44DNibyqYlT4BEUX+CVYfcABP?=
 =?us-ascii?Q?geG9qbCPTBYNPGbtpYioF1D+0Y5km5Lfbbg4yg0HZf19m58EPqnNlsBxiZqh?=
 =?us-ascii?Q?KbAca6nM+86Dnxgbj0VjuZJaWUq8jLPRF+85yIjGrLqTgJm++8EFYtjBKiFt?=
 =?us-ascii?Q?LMN7X3GGp5Eon1w/HhSuPtjLp+JrFNlWEmqX0/1fFf/3N0v4Pe5TZalI/2yp?=
 =?us-ascii?Q?eCyHVuhaGqaqjdOqpzBNzqfFugPo8dcEN7CyT9DcS1MKYLbiXfDYqOnaPJ4S?=
 =?us-ascii?Q?ltta5IseLiLf9naw9rDKq1AAskFCaxCMGHZn0kd100NIASJxjmr7wEt3gM5X?=
 =?us-ascii?Q?CWJW2pq4IBhLwsZFLqyhClV841QUIkOS3vwj7VOZPdHJuUIrbNVv6gbXKqP6?=
 =?us-ascii?Q?jrLLaS2Fo9KaFrd4dvI0UmN4OIKLOgIOY+QrefrZSL58PRRzV8UkPCF5TWvp?=
 =?us-ascii?Q?xkPwI9u7UuCLqyMYYvU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2ab35b-b59d-401a-89cf-08dd44968aa4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 21:05:51.9602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rTbP8aowZhgxvKvNWw4uaPCUDIKhTKZ9fx0AwIah+K4Fa4+yJoJuFe/+iBm5zia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782

On 3 Feb 2025, at 9:32, Asahi Lina wrote:

> On 2/3/25 6:58 PM, Simona Vetter wrote:
>> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>>> This series refactors the existing Page wrapper to support borrowing
>>> `struct page` objects without ownership on the Rust side, and convert=
ing
>>> page references to/from physical memory addresses.
>>>
>>> The series overlaps with the earlier submission in [1] and follows a
>>> different approach, based on the discussion that happened there.
>>>
>>> The primary use case for this is implementing IOMMU-style page table
>>> management in Rust. This allows drivers for IOMMUs and MMU-containing=

>>> SoC devices to be written in Rust (such as embedded GPUs). The intend=
ed
>>> logic is similar to how ARM SMMU page tables are managed in the
>>> drivers/iommu tree.
>>>
>>> First, introduce a concept of Owned<T> and an Ownable trait. These ar=
e
>>> similar to ARef<T> and AlwaysRefCounted, but are used for types which=

>>> are not ref counted but rather have a single intended owner.
>>>
>>> Then, refactor the existing Page support to use the new mechanism. Pa=
ges
>>> returned from the page allocator are not intended to be ref counted b=
y
>>> consumers (see previous discussion in [1]), so this keeps Rust's view=
 of
>>> page ownership as a simple "owned or not". Of course, this is still
>>> composable as Arc<Owned<Page>> if Rust code needs to reference count =
its
>>> own Page allocations for whatever reason.
>>
>> I think there's a bit a potential mess here because the conversion to
>> folios isn't far enough yet that we can entirely ignore page refcounts=
 and
>> just use folio refcounts. But I guess we can deal with that oddity if =
we
>> hit it (maybe folio conversion moves fast enough), since this only rea=
lly
>> starts to become relevant for hmm/svm gpu stuff.
>>
>> iow I think anticipating the future where struct page really doesn't h=
ave
>> a refcount is the right move. Aside from that it's really not a refcou=
nt
>> that works in the rust ARef sense, since struct page cannot disappear =
for
>> system memory, and for dev_pagemap memory it's an entirely different
>> reference you need (and then there's a few more special cases).
>
> Right, as far as this abstraction is concerned, all that needs to hold
> is that:
>
> - alloc_pages() and __free_pages() work as intended, however that may
> be, to reserve and return one page (for now, though I think extending
> the Rust abstraction to handle higher-order folios is pretty easy, but
> that can happen later).
> - Whatever borrows pages knows what it's doing. In this case there's
> only support for borrowing pages by physaddr, and it's only going to be=

> used in a driver for a platform without memory hot remove (so far) and
> only for pages which have known usage (in principle) and are either
> explicitly allocated or known pinned or reserved, so it's not a problem=

> right now. Future abstractions that return borrowed pages can do their
> own locking/bookkeeping/whatever is necessary to keep it safe.
>
> I would like to hear how memory hot-remove is supposed to work though,
> to see if we should be doing something to make the abstraction safer
> (though it's still unsafe and always will be). Is there a chance a
> `struct page` could vanish out from under us under some conditions?

Add DavidH and OscarS for memory hot-remove questions.

IIUC, struct page could be freed if a chunk of memory is hot-removed.

Another case struct page can be freed is when hugetlb vmemmap optimizatio=
n
is used. Muchun (cc'd) is the maintainer of hugetlbfs.

>
> For dev_pagemap memory I imagine we'd have an entirely different
> abstraction wrapping that, that can just return a borrowed &Page to giv=
e
> the user access to page operations without going through Owned<Page>.
>
>> For dma/iommu stuff there's also a push to move towards pfn + metadata=

>> model, so that p2pdma doesn't need struct page. But I haven't looked i=
nto
>> that much yet.
>
> Yeah, I don't know how that stuff works...
>
>>
>> Cheers, Sima
>>
>>> Then, make some existing private methods public, since this is needed=
 to
>>> reasonably use allocated pages as IOMMU page tables.
>>>
>>> Along the way we also add a small module to represent a core kernel
>>> address types (PhysicalAddr, DmaAddr, ResourceSize, Pfn). In the futu=
re,
>>> this might grow with helpers to make address math safer and more
>>> Rust-like.
>>>
>>> Finally, add methods to:
>>> - Get a page's physical address
>>> - Convert an owned Page into its physical address
>>> - Convert a physical address back to its owned Page
>>> - Borrow a Page from a physical address, in both checked (with checks=

>>>   that a struct page exists and is accessible as regular RAM) and not=

>>>   checked forms (useful when the user knows the physaddr is valid,
>>>   for example because it got it from Page::into_phys()).
>>>
>>> Of course, all but the first two have to be `unsafe` by nature, but t=
hat
>>> comes with the territory of writing low level memory management code.=

>>>
>>> These methods allow page table code to know the physical address of
>>> pages (needed to build intermediate level PTEs) and to essentially
>>> transfer ownership of the pages into the page table structure itself,=

>>> and back into Page objects when freeing page tables. Without that, th=
e
>>> code would have to keep track of page allocations in duplicate, once =
in
>>> Rust code and once in the page table structure itself, which is less
>>> desirable.
>>>
>>> For Apple GPUs, the address space shared between firmware and the dri=
ver
>>> is actually pre-allocated by the bootloader, with the top level page
>>> table already pre-allocated, and the firmware owning some PTEs within=
 it
>>> while the kernel populates others. This cooperation works well when t=
he
>>> kernel can reference this top level page table by physical address. T=
he
>>> only thing the driver needs to ensure is that it never attempts to fr=
ee
>>> it in this case, nor the page tables corresponding to virtual address=

>>> ranges it doesn't own. Without the ability to just borrow the
>>> pre-allocated top level page and access it, the driver would have to
>>> special-case this and manually manage the top level PTEs outside the
>>> main page table code, as well as introduce different page table
>>> configurations with different numbers of levels so the kernel's view =
is
>>> one lever shallower.
>>>
>>> The physical address borrow feature is also useful to generate virtua=
l
>>> address space dumps for crash dumps, including firmware pages. The
>>> intent is that firmware pages are configured in the Device Tree as
>>> reserved System RAM (without no-map), which creates struct page objec=
ts
>>> for them and makes them available in the kernel's direct map. Then th=
e
>>> driver's page table code can walk the page tables and make a snapshot=
 of
>>> the entire address space, including firmware code and data pages,
>>> pre-allocated shared segments, and driver-allocated objects (which ar=
e
>>> GEM objects), again without special casing anything. The checks in
>>> `Page::borrow_phys()` should ensure that the page is safe to access a=
s
>>> RAM, so this will skip MMIO pages and anything that wasn't declared t=
o
>>> the kernel in the DT.
>>>
>>> Example usage:
>>> https://github.com/AsahiLinux/linux/blob/gpu/rust-wip/drivers/gpu/drm=
/asahi/pgtable.rs
>>>
>>> The last patch is a minor cleanup to the Page abstraction noticed whi=
le
>>> preparing this series.
>>>
>>> [1] https://lore.kernel.org/lkml/20241119112408.779243-1-abdiel.janul=
gue@gmail.com/T/#u
>>>
>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>> ---
>>> Asahi Lina (6):
>>>       rust: types: Add Ownable/Owned types
>>>       rust: page: Convert to Ownable
>>>       rust: page: Make with_page_mapped() and with_pointer_into_page(=
) public
>>>       rust: addr: Add a module to declare core address types
>>>       rust: page: Add physical address conversion functions
>>>       rust: page: Make Page::as_ptr() pub(crate)
>>>
>>>  rust/helpers/page.c  |  26 ++++++++++++
>>>  rust/kernel/addr.rs  |  15 +++++++
>>>  rust/kernel/lib.rs   |   1 +
>>>  rust/kernel/page.rs  | 101 ++++++++++++++++++++++++++++++++++++++---=
-----
>>>  rust/kernel/types.rs | 110 +++++++++++++++++++++++++++++++++++++++++=
++++++++++
>>>  5 files changed, 236 insertions(+), 17 deletions(-)
>>> ---
>>> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
>>> change-id: 20250202-rust-page-80892069fc78
>>>
>>> Cheers,
>>> ~~ Lina
>>>
>>
>
> ~~ Lina

--
Best Regards,
Yan, Zi
