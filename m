Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77D1E32B9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747054501; cv=fail; b=VP6P/9lM+kufrv8X4+vRAQUvrAet6+1oqu5lUcWvRMtzTL5tgNBaotPj+ndW7LgG/PCxsF7tQ/2q541A+dSAo75kXvQ+hsWc8okUns2I8O+mZFYuCeRkS4ju1V6orp+FkkgHIE/VQPxc7o/VnL+c46rfuaF5U/SsDGwPOwgCR10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747054501; c=relaxed/simple;
	bh=NiwfLnMVp3qcrwNmsz1rMMvF4O7WSKm7bxZ791zmFqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AngzDwfa6TXZfmMh62Ia3X0lNAybKBPpkFUWTNLf4AdfudiC7XIuY9fhVrB9T/hZ8Wp16OHw99khjbmqiYiefo3wfaIVSuRx96ozoRnWXz+AA34ewglNaojqhQ6EXzGpULUJQAbVYUfKG6lu8opu6lFqmSGRVJt6RfywBGh5iTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VqHUXE33; arc=fail smtp.client-ip=40.107.244.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VqHUXE33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqMCfRtbZ7DmAcgegB3nznqBJb049dIA0+hbNjZarRjWmQxMc1Qlsh62oJ8pZ8bFUnyUi3M4YONp3XRE/9/SkzQ38hItP5tOXhcZCutkonSC4n6p42J8/o/lPU6qinGvX5h1iUQM+Tvlw/UKW2ra6Cfm00FnYP43syY3hHahDnL8AoTVh+l6R5XZ+hTxEHN+o3s2S87vM9DdcSdmCn0aMAEsM8Od3ZnRXwOZk+J5cTcpuSzCn6gKZ/FJjrlZqf1MxJWWm2XNWOUm2kF7gxoMJLpvI8PF9LiUvg65mP0dgZKEDhPdMf+BFs4oB4qqFfau+cLnu4CAa2acNBSxnLz+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiwfLnMVp3qcrwNmsz1rMMvF4O7WSKm7bxZ791zmFqg=;
 b=g6gmjc94AK+ZTwD8QGhJ2ToLpvVRvbzRMaUlrbKOxyG98P9ejemUQ6XRvOjaTe+tPv+ClClTR49KBi5mODPFS+roWSrBkDx6Sl+6Vy1/Ss/sdFznwdV/fDztMrZEN4CB+NqfJx/u//jiAZqNUnearO+ZpAkcBnk0bozL35ZcVtkvYDuWXSJD9UQs0g14mUpCXBE6BWGFQSYul7wnPtkPKAfbGP/oandNzgKz1704ede+43SS5GnXiUnLM/cY80DUY+fnugPzycuL6dtmN7uMZ0uUsYPxHZ/1a+s6qWkCNNPesJZuEhw/hRLq6WpEjdYEHi0dZ6M8rI5iEkXEfmM9kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiwfLnMVp3qcrwNmsz1rMMvF4O7WSKm7bxZ791zmFqg=;
 b=VqHUXE33kVHHlmle8vcvUjacd5owynzoJpeRnlQHYqy3WixNc2tRKD5uyHmHZ/svIVuICe4VcE17jayM7NzJ8gghuE5x+L5JzU/Z0aCmmlV5pV70QtAqKr3VrpgnXotBWT8Hzrn1akAOdKmnctc7hTzzIEG70oL/6xXoZKs3sAkL2cLtyeXeW+nBM49tKelv9S6zc6znfBp75os3noPccivA8hp0x0OEE4Y3urkWpzAAIYZM/Xdzddxm9rjRA1dVv4nWZMOYpYG/SL+OvahfOweH5IdNOkDwhGiXFbD08BQPy6AegtTNfSFrg/9EQHwr3K57UiLc5yFo89nxR+Lxvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Mon, 12 May
 2025 12:54:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 12:54:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Date: Mon, 12 May 2025 08:54:53 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <9AF9CF7D-D4A3-4D97-9B7D-F259E33E982C@nvidia.com>
In-Reply-To: <eb2b0bce-6012-4019-8ff7-c35c24ba7aa1@suse.cz>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com> <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
 <eb2b0bce-6012-4019-8ff7-c35c24ba7aa1@suse.cz>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR19CA0032.namprd19.prod.outlook.com
 (2603:10b6:208:178::45) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bb1e6d-8676-43f9-4d1c-08dd915431d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ocyom6BRw2RLgzVILdI67YbTNqoTlmwag0aT9gWfgR7B/5+uYt7LTQdqBpbm?=
 =?us-ascii?Q?KAtiTFG1OZlWU5khOJUClXBCzraUptjF0+Zk+7HT4f3+CNwLswaEHu/3thx7?=
 =?us-ascii?Q?MruHNumgbxDY9RqhCPoSEoJTVeac9KbajclzL4eer/M1bPDotUh3qWuh+yRb?=
 =?us-ascii?Q?ZZ02ND6912mI8cfCxD/M0GPoaRAnZ2q362joU3aQvXpn1Tq69OOGDD53DLmH?=
 =?us-ascii?Q?1a7IQpG8qGwLuaejMDMfayZ/6d/Yx9VhzmyNFnP9yty9peAnjos9jlHgtkdn?=
 =?us-ascii?Q?Qe0SkRpYDsxcxvSBk+J5r98ZCsv951+bdpmq7w5n4uxO5EUutZIk/1KspRD1?=
 =?us-ascii?Q?xxsWsl5Le27hLgMUdUVJx70bBDs+prJaRf00XM8fpPpxgbC9yEf9fTL2ZEeC?=
 =?us-ascii?Q?IKvhyLoir7vrhdNI1tIsFvulIMoXoxN6GN17WKkxJYnQp3iG1Rw7kj256Zw/?=
 =?us-ascii?Q?qZ6uYV8uGIC0UI2cz/YbghUxwxfj+jr5UmStUZhuJB9Xurv7n1o08aohb5IZ?=
 =?us-ascii?Q?51LWjaE17KMEnn7lul23IESkwdwo2r/BLdY1Vr3SP4jVWv91wFhfCgHztSap?=
 =?us-ascii?Q?ZPmm5QxN4jhV3WZWFZSwQ2uVrsGgpNkWtQeYfAaZFymhcHc5yuAXT6cCo6DA?=
 =?us-ascii?Q?X3zTnOiEtoPOMlAnoFG2TdTAhl6JrPTkh8s5+kvUem9dA/9F9XoZnJuUORD0?=
 =?us-ascii?Q?X7HDE+g8irLiQ0qqDpsCv1zsc5N2vtqgfAVoFcvVGjjkTfyUW7s/y6abj657?=
 =?us-ascii?Q?ZfdMjlET6/ONK4J1F+vNl//s1Q0+GqjXoSIQtFSt57P0uZ/HKsUkLnxY3H8a?=
 =?us-ascii?Q?ow7qnzZBjFwhwjgFJqgqj5G1SjCCVpzbgNRsanf6XJTCrrMKA7Pntw8hGe2o?=
 =?us-ascii?Q?eM+2HNqu2LY1CBUpOhcJCTypXwE3bJH1loMF719K37iSiENTyBA1q7Bm0v0I?=
 =?us-ascii?Q?g6vd+xRRg01GJW5TktoFTLM3O4ertSUUwAUsV9IG7zikY2jQ67O2+deCWeBl?=
 =?us-ascii?Q?ubBTUFQQFxPeyltdIJw0Iz4ncTXo2exPLBgTshXizkLjIQPEhb3w/NVF2NSr?=
 =?us-ascii?Q?zmptLPpcBMh7UC0BzxXvPZP9p7+Z+h19+uKqOb6bFOfpdpFfNgTa4UAMVAYh?=
 =?us-ascii?Q?PZMt2yB08ZCXij1UtFVf0lKdrMIlv29psIqzvjyAWH8qQvmjSLSBqEfWmKfd?=
 =?us-ascii?Q?w66yMWcU7nDEJ9rfiXe1J2Pg/vJAjZsNCZO6rmcmHWJNCwk7onrEvNn3xLIh?=
 =?us-ascii?Q?Qa9L/lWQk+baVgTc+CWh5aKx2z7P/OBRA7JTJGKUoRhbRfaACcbz8H6TVmNO?=
 =?us-ascii?Q?tjBDfXZAgx6nDxVwOYC5HyAOz492zToEMzPz/SukTm56b1nOTQ53ntduIo2/?=
 =?us-ascii?Q?4y46uv+9xpPxDfXF7X3MlG00++ff1hVxag8jxL4/iFqJKwcotHEWiH9oKAr6?=
 =?us-ascii?Q?z5eoxdVJ/t8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QscAXGy5poRaKlCV12PHkcEvqDOAmhCy2mRRykUNJpBIPPLsNKjM4d++SKks?=
 =?us-ascii?Q?ZS8sCieXZsi/ND9mwcx6ovLEVbGCzXv8VoiKV/jnyMzkSbYA0+X9V97thSnz?=
 =?us-ascii?Q?iXwwpga1ccxeiqmyYKNHF5HXtBcoo9piLAnen9gjn1oK7mQggMs3SuXQ/UDb?=
 =?us-ascii?Q?MmEAUYrK479ko8gQ+jy7PvKi7MeTby/d7JD1C9TzN60HqiytPrS1qtoLGzOH?=
 =?us-ascii?Q?KnwK8VxpQ42lb4Gt6uOAHIKtCOfMKNIglkaO56aS8FcbPUKHKAiEd662xr2k?=
 =?us-ascii?Q?2hgonoAUMeFjnuA+sOCrpk4xe5hK8cqXqJnyU+A7j1ameU/eMl3OYicTZONZ?=
 =?us-ascii?Q?ei10h5AGYGg739fcDXoZZ/sT3K4SeJ1OPA8mt8etcNjH+tXrpacWDvSro2nz?=
 =?us-ascii?Q?Y7IFlbxPx0rKBTJpeRGPNcSLJ9aRepqKc99naqt7HTUUsBh22zJ2HaDlERcV?=
 =?us-ascii?Q?32EutUCcnZ62JWxbTnMrCt4Rt4fmQuKx0Z+V9OQ2PrKhkLd5DsYPRhOfwCnW?=
 =?us-ascii?Q?iTpRmX296gsfEV1+JTA21R3Pb2OqIRPjjeuk2njENiyqDz3HESEK63aQS9Ny?=
 =?us-ascii?Q?46mEbzpbEjlCYwhU7R48f5mpDFIFxbuyAj0bb51PsfYzlqU/QlruhaZFntfv?=
 =?us-ascii?Q?coJrMwcD3a0ldNcn+5UanpruNgTckpd7/0rq1dZ4H6n7Q89B7T7qhc56xCMS?=
 =?us-ascii?Q?Ab41csOaarVJu5GjnW1PR1ZLKZtn9UgwZZZlcYf3tqbwXJtyWoMYqTOBBFvS?=
 =?us-ascii?Q?9eq2Arp85DnaKZJ6i1ocW4OKrNX3dIOWgUlkvq6EsTWdBcq9Rd9/l0rInjpa?=
 =?us-ascii?Q?yEeolmwIuKFA/MULlhuy6fQqzHlrc30RrG6F6rytgcCdlECsE9WSbiaD3guQ?=
 =?us-ascii?Q?oK7W7p/lV6nMgJg807mqoAsYYsObiCoO5gjOodnP/1laWgVTjwrTFs2Mj8FA?=
 =?us-ascii?Q?Nz0fbTJHCqY7/iDYxXAJEcjlvGDpt8i7usdNaV6AXHI+7EW9sCQrdaPg9O0b?=
 =?us-ascii?Q?7FI+7JyKnqdydRNtX3Nq7PTz6x/M/lPb7++EAb9Yc5FZf+YfiQiBO1hjew4s?=
 =?us-ascii?Q?y/QaYQzZgESXiSo/zRdC5GHqI9SC3TUxNMeOvIRptqu43wR332J7up/H+UZw?=
 =?us-ascii?Q?7GgQ5owkmLLl0FXSjaOIy8Fl2J+KSH6vWsIEWyILBeFgEyf5lPjL8kbdNZ7O?=
 =?us-ascii?Q?Bc24prSx0C3b+YNoAsRNBpSinl2WJErNa1+Iu8kBXJP7l5WjeO48fZ61Ahsg?=
 =?us-ascii?Q?sZbw/gxtUretq9IEDktsmj8kVPC9LZb8HPxoTJtmoZl90tOkJbOcI2+tQgxv?=
 =?us-ascii?Q?NsirCCDJrTta3lzW6kdMZ1cCdxS8Q6qLXHvJm9ktHNi8nO4QGWtKOTeX2Axu?=
 =?us-ascii?Q?CbRNQr1VgOV1Q77wME7YFBCE0mtxDg2OJbQEieukOngzlWdsKrjOLz2QP5t0?=
 =?us-ascii?Q?n3akq75jJX160MjPwnJFfmDzRvqe2KCbAjNixj93OtJf2Z2BWYBWe8OlqvIM?=
 =?us-ascii?Q?R6b+xUIJ2Km1WjPO8LLkI1Z/h2tLDMkR33zYcjaWGVaxAC6C27XkOY8Oq9UB?=
 =?us-ascii?Q?ZEuCZ6fxfujphytIwzxktq+7oRUqKasuY9zVInyu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bb1e6d-8676-43f9-4d1c-08dd915431d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:54:55.7030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjCS5SaAMM4ISpA/oJLxftFFvGRU6YjKTnwZivJaL4ssi6sH/kHK9PfckNE3mMXC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601

On 12 May 2025, at 3:38, Vlastimil Babka wrote:

> On 5/8/25 14:23, Lorenzo Stoakes wrote:
>>>
>>> M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have
>>> capacity for that? :)
>>
>> Vlastimil? ;)
>>
>> I'd certainly support this.
>
> OK, can do, thanks.
>
>>>
>>>
>>>
>>> Not 100% sure what to do with
>>>
>>> * include/linux/page_isolation.h
>>> * mm/page_isolation.c
>>>
>>> (I hate the word "page isolation")
>>>
>>> They are mostly about page migration (either for alloc_contig... or memory
>>> hotunplug). Likely they should either go to the MIGRATION section or to the
>>> PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?
>>
>> I mean it explicitly relates to migrate type and migration so seems to me
>> it ought to be in migration.
>>
>> Though migrate type + the machinary around it is a product of the physical
>> page allocator (I even cover it in the 'physical memory' section of the
>> book).
>>
>> I wonder if our soon-to-be page allocator maintainer Vlastimil has
>> thoughts? ;)
>>
>> I'd vote for migration though to be honest.
>
> I checked the code briefly and although migratetypes are related to
> migration, it seems rather page allocator code to me.
>
> In fact if I didn't miss these files, I would have included them when
> proposing the PAGE ALLOCATOR section.
> Zi Yan has a series on that topic now and is one of the R: in PAGE
> ALLOCATOR. What do you think?

I agree with Vlastimil that these two files belong to PAGE ALLOCATOR
section. Page isolation (actually should be pageblock isolation) is
doing work on pageblock migratetype, which IMHO is an important part
of anti-fragmentation mechanism for page allocation.

--
Best Regards,
Yan, Zi
