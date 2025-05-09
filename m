Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22218469D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746754410; cv=fail; b=NkGRyefAAuheHH6CwTVuZnJ37uOesrYAhSJKSN3+V8Mr7b4C2R3KkWf2HShT0fqz4hWQ+Q/10eNCBZMi24edCUcki3wkdDqcZkYnxPog3WZ7yDOSDUpkLlLiMl/bOkaXMJc1N1ob/4gP82+Y1eUjOaEE4jqSKUUgmaUHiMjXzg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746754410; c=relaxed/simple;
	bh=H+UCaoSMbge9Hm9N+c6Xu/b7EIMC5szAFb++wuULYug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFhYZxn5/nNLj6LxpFqAGdvMa1k+rGC3IBIfHu0fs0XmOyJD1lRtGsH87Wv19TlfqE6DxzMaUOXHpMsY9c2faxR4RzyUnWXhO4HaFw7nLe4gYQeRs9OASsTPE/HjjWqghF9wSLYmjMDoa8MNjmZ+vSnTRBGQaDRobIqWE4GFRMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s6j7Hv1q; arc=fail smtp.client-ip=40.107.95.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s6j7Hv1q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDf4Q/QLbSWnpLJectXAP6oBsoZwRCu6qQIK+lnOSmwurubFQbXs9On6dR2/NtYz6ycdlXpUTg2AVPR9hrE64a3D8PWSKMK6M5wmNe2+Y7trjjghmp5DQKgb+pX/13IUZh+caQpTbILhJyrVge8P6Iqs2K/AVTYUAbHRmO7LSNuW19f/PNArF+nKeI/KDyO4Ze58cMakas9mFb432unWUw8hFbY7SrNRn23YLq5/lT0faK4jr8MbmMeQ2m+mRVC501npwXhs0Jo5+HHmkrnBKilg1JG46LJptXdRyQjWXGSneJCDiVgO88hPaqBaFUJtWwMm3Z8IaeuBMF7lM+IvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkayOtgP4XP3K+uLWM+5PLbGDpZLfnrx6G2TcMxNVtE=;
 b=mKajxDqVSflkPcLHeDt8znS3X4CLa9+btMpkFfRoiwRKEioW8s4f/iZzMSjB4JLXafbQ5h5OkrcvAPR69KvlLBSGUR64AofdH4O1JG3QYxPQ57ltKKaD3l/xbGV27/E8/Lgpyv3OvhgnnTlHD8l0+TgjAX6ET2vCjweP5/iJBErfWA4kWotY51Kbmf+5cJk+Gk9rDcIhxG1dQfiw9wiPNX5UWAOLmAwzL/2BsVGVLoj/w0G5Z9aIPJ+nOhlW1cD8M7oP45VIDwF6YHQ+X2lcLSf19Nr97XGnUYeiYQP0w8TWFwbRIb0nWqzY1qmpsh/imhLFeHF/EAAZlhqIwFD7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkayOtgP4XP3K+uLWM+5PLbGDpZLfnrx6G2TcMxNVtE=;
 b=s6j7Hv1qkJoHkAYPHngCfo+0HD5yi7Xg7DExvAn63jT12C+WE1cuMo2aWi6E0hns+SIneGCMrZWnplczghXO6ElefYSqXuNA6Aj3G2g9lUyG13wz7DC6zIWPf7XMoPctJzvsF69X8zZu1Gw2zc9UZ9E04GJ7bRY7fyQorlzIRALEacI2llagcLCIT7FZ9jiH2o1nvkPD5feYESx1P4E6s9mbSa4PgQ0QWr6nOUNNibNB9aVUgPIE2rTMC4f2xWdVtMDnUqVh/IhUH1i9DrNr5cRSn36/WxpJgjZgZLNP5nL3fjZzAOF3rnVS6ZfeKBw5zcV0m8CAZZzHAEVrkjrofQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Fri, 9 May 2025 01:33:22 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 01:33:22 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Thu, 08 May 2025 21:33:20 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <CB3081A6-34B6-474E-B895-0C054C1DDED7@nvidia.com>
In-Reply-To: <10C2C1DD-A6E2-4745-8C2E-D09886F4104E@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
 <20250508052409.GB320498@cmpxchg.org>
 <13898284-B62B-412D-A592-856406F7D7C0@nvidia.com>
 <D24FC56F-CED6-40DB-8216-6B705473106C@nvidia.com>
 <20250508204644.GB323143@cmpxchg.org>
 <10C2C1DD-A6E2-4745-8C2E-D09886F4104E@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0687.namprd03.prod.outlook.com
 (2603:10b6:408:10e::32) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2b9ada-c2ae-42fd-a8af-08dd8e997c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dUgEkSX8PxYNTXih/ukfMkUN83wxDwXyU5ytpjkWgzxt5WsUiLIiHc4tFT+v?=
 =?us-ascii?Q?R5iM5q8gv/OCkyG3ylIKtRD8jjF6E9uRXDBFU8aBL1PPWx6tn8Whc0SEE8CN?=
 =?us-ascii?Q?J5kYNELhaiusR9KS5SASbCL1lhyPXeTQqN+++DY+NXvvXM7VSNYSb13O8wun?=
 =?us-ascii?Q?gXQPBc5xj8SEvZeRga4Hj8i5CCDMjirLST3x+cwV/9EWKeY+FH4NO04TqLas?=
 =?us-ascii?Q?bvBZiY1Kcy0LQNfTmtWGDGILWt+pITCLleJF5JWHWi3kRAK0ymlZQ/Co5jdE?=
 =?us-ascii?Q?9Q3A8UDAnbcIC8pwlULegJ5b9w/aOc0jMKB43/4cpTMhldpJvw1SEBMhPuF2?=
 =?us-ascii?Q?R2RqCbSjFv8zJXUSrW95s0jy0cL86OGvgNFJmhB0AKGsCRVOnBClONqAJ10o?=
 =?us-ascii?Q?bXi+zr8zHRxX+BaXhyt0kqAwqyNXR31rtDu9hyG2df+Rzud+Ni/ls8cyptZQ?=
 =?us-ascii?Q?k5PuXOoJZda/VF4OjvRd9ptz6U/OH7SxEL9i3rEauPlxWTGi4OQYjWkRAV8a?=
 =?us-ascii?Q?updLjVctDoV8qPAbwkJlODJ5kl8f2Wqel30B+VVaqFkSHuXSdlsrJP9+pqqI?=
 =?us-ascii?Q?7fF3QaPWr5a6Zq1XR1pyPz4jyvFKRT4aRxH6GPn6cvjOq1zprsWUsbEsw4N+?=
 =?us-ascii?Q?+O7tFpdQWmmH4VW/mNzmy10GOp7VBTGh10BAknrXyTyOm3Nq0CbKkWLSMrAF?=
 =?us-ascii?Q?N684EWOS05eHtkCQsiZWQEHDGf5vwup4kTlr7aEopYiku8/GsIa+QQXQnne6?=
 =?us-ascii?Q?hNUNc5/k9tQ88PX2ZCt/RfZzoLk1Ctvr+ij5d8jrtKq1LADeNHzlKTZrElBI?=
 =?us-ascii?Q?W5RIBvBUZ+S9wv23zDLbohHmK/vV7pgnYij45fG2Yh5k7Tuy9Om++J2HERvC?=
 =?us-ascii?Q?73gVTJfL32FIGYYik68o/X+fCwy0i9rfFTifrV4clD0VQW5Av/XM8bfbYopq?=
 =?us-ascii?Q?evyHn8v396pByMLhgWNOJqMVFFNOkS20HmZQJpuaJtxPTLkEMcE95Reb01a6?=
 =?us-ascii?Q?XQcummLjzEX66fCrUDpuPupghnyV9yFJ0LQpz5OnjUcjis73o/8Mblollp3o?=
 =?us-ascii?Q?LA/5hEmXGfQAPpxJ2n5edN0V6Sbn+ZBvxLKEyofGrTn+BMIN5ZU8udzALXbR?=
 =?us-ascii?Q?qUX3GL2gfMDX9wHk4ERxQAhBKUJrRb5To6OP7otvNmzEi4Y1npF53DS31d7k?=
 =?us-ascii?Q?5nkYzw+zkLSTqwo9IWqIehiaFVqjkGGXSejdtGMjd6/mZRVrMUtyjRjLRSO+?=
 =?us-ascii?Q?3Am0xhbeWZjrkLaFUz7qa25HGxRQBmAdy4pUwfdDqnPwLboZl2zkES3Xeuxl?=
 =?us-ascii?Q?nNUVg2E54Lrk0fN/6uyBm0LjygFEv8laBWEyMN34BjkAx0NNUTC/EjjJ0KoU?=
 =?us-ascii?Q?WqB810legxlo5meTUZNigDcSzk4i58nOUvqlXHRK6Ei3y+BQ/z20khg4WM1+?=
 =?us-ascii?Q?aempxHNJsCs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Mt2OE7ceS0DYMgxH9CGtxQM3fpzXYZ+SkXLUvlEvNOnWtkApnfmyLOEC1Jk?=
 =?us-ascii?Q?JmQIBkavPkWIiiJ4okNov3/wOcktCG4odKPaXEoj55xFmjvt3Kn2zf9OUYsC?=
 =?us-ascii?Q?jpl84rvFKdxt0+GCiOM9JkPZHm9yUz0o0vpOVt3ZMv6H/BLeXvr5PFo2GuJT?=
 =?us-ascii?Q?NS+PKag6ke/7YVfKyGUWIkm/yNDB1pETNN2Ul+mEFMDWBlLJ9veNplCiIkhC?=
 =?us-ascii?Q?cpLAr2ChBrgJeBZ/8+gzx6cOmheOFJxTTyhfe14v0/GUxYAgOcMYUZFuF3Oe?=
 =?us-ascii?Q?25InMdjbgIAMdoixwFCpl2Eso/XFWkBPHvpzc7ZbenwdhIrtUAWckXK9Y8mf?=
 =?us-ascii?Q?jV8Im4UpDOPA+k4Et2Qfbd0wLTW6+XYWCKFUe0dnVBx9d/TZhG1987f/tX2i?=
 =?us-ascii?Q?qr1H6iOqpu0FYT4C3SpRfI0VLBTeUerK4YfY8w2Z6znJQstfJWnSJB2oVVLd?=
 =?us-ascii?Q?q6RGez/PrTy9o0feLwhAlJDiKnxfg4p02HVF8VZCpXIqea1sHY6YkruOTj6U?=
 =?us-ascii?Q?GZXzIzygOZqOIZvGwMR0FO/DvmSLEtsmpY/t0hFhjH9GLLHN4p6je5Jb1rvq?=
 =?us-ascii?Q?+kwFhA+sn+9Vyd2qSeRnSbKbQYo13JSO+41hNA7LJVbD7sdU2KhvDkjuPi50?=
 =?us-ascii?Q?8m/CUib6/lz6o+jqeCxf32UwJSkvBsAukVa1s5ouWAE5FkuQqOGS7TOvDIgk?=
 =?us-ascii?Q?WryWS2bYt007EHyZKmrzmmpD6JJ0m/p8uKYxSAVhQQw20TIUGKyFH5DqX4Fu?=
 =?us-ascii?Q?nM0maU0S90J0OWd3Ye2RduN6Ob1jf655HjzRkTOW90rmPm1YLfazm/JMWcCg?=
 =?us-ascii?Q?jH8yh4lZZFgd3rH4eNz1Kp7XoZhJrGOma/XknLHWI3fsuXAR3xnHOCfq0i5G?=
 =?us-ascii?Q?wrYpS0V1mxJTP/B8elskhvOFphz07GEUfyrcwVsfx1h9ko2lnamNVNtTQTD7?=
 =?us-ascii?Q?zYxYmBZwQRRoClwClu9sEg6T78clWUmfaRK/dMarwjXe8N77i/AAmx34fMIc?=
 =?us-ascii?Q?mVUtYSrzYWq2Wqb1wrOBujGvb7JFdtLa4dxlqJykCFmVb0xJqx2OwfGf7fGs?=
 =?us-ascii?Q?VD9/qFq9pMa9nkQrbBnB09QQKnEoEVnm08LYurVenqdIXpM3U4IXw8iqq7Vh?=
 =?us-ascii?Q?XRY/W7Ru0eIBcCnAQ/fClaVmBFCuMSeKfcvPiKjoLvVZIff/jOTuBbZ3rtVt?=
 =?us-ascii?Q?l57rcw7BlbXtBiqoHOBIrWSEQingey2LJPIkP1FiSmzTm2O0vYh8CLCzw2Wr?=
 =?us-ascii?Q?aDW1KiUzVDGg0EgOEh7jPFT0YtFJ/5ZtntycpjxmfDV2brwnJ0AzGwcWCk1Q?=
 =?us-ascii?Q?LqeS9Ga2PsJ8NwRPc0TVShL8M53ligxKCl62rE1Mtb7WP0377zSxMP5jWsQC?=
 =?us-ascii?Q?CCv9fAklK65kkY63GdT7C9GpGkihAUpl22RPcKAOwhXzWDRTeteNTE/8DDmZ?=
 =?us-ascii?Q?+RgXwYBHhHAmPXlgSPlWykZsE/HcjPKulfbFuBN5ThNqw+ZWQoFna6ceGANu?=
 =?us-ascii?Q?L3zfH9oKDzG+pcU6xNmQAmkLvVolWe8EPypkHjBbBHFSxTCM6MIDpOFFx3eq?=
 =?us-ascii?Q?OtqeeJA8dwwcuB0WKsGarjvT68sG91ZZTKYpzF1N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2b9ada-c2ae-42fd-a8af-08dd8e997c3e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 01:33:22.3334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNVrvzXatKxDFiiJ9y1Z/K9lSKIlrb9syLlFROvIm5A1zfJTUXTiXQh76Wr/5FAX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120

On 8 May 2025, at 16:53, Zi Yan wrote:

> On 8 May 2025, at 16:46, Johannes Weiner wrote:
>
>> On Thu, May 08, 2025 at 03:17:05PM -0400, Zi Yan wrote:
>>>
>>>>>> @@ -426,7 +460,12 @@ void set_pageblock_migratetype(struct page *p=
age, int migratetype)
>>>>>>  		     migratetype < MIGRATE_PCPTYPES))
>>>>>>  		migratetype =3D MIGRATE_UNMOVABLE;
>>>>>>
>>>>>> -	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
>>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>>> +	if (migratetype =3D=3D MIGRATE_ISOLATE)
>>>>>> +		set_pageblock_isolate(page);
>>>>>
>>>>> Are there paths actually doing this after the second patch?
>>>>>
>>>>> There are many instances that want to *read* the migratetype or
>>>>> MIGRATE_ISOLATE, but only isolation code should be manipulating tha=
t
>>>>> bit through the dedicated set/toggle_pageblock_isolate API.
>>>>>
>>>>> If there isn't one, it might be good to enforce this with a VM_WARN=

>>>>> instead.
>>>>
>>>> I checked all set_pageblock_migratetype() callers and do not see
>>>> one using it for pageblock isolation. Let me replace the code
>>>> with a VM_WARN and add a comment to tell users to use dedicated
>>>> pageblock isolation APIs.
>>>>
>>>
>>> Actually, move_freepages_block_isolate() calls __move_freepages_block=
()
>>> to move free pages to MIGRATE_ISOLATE pageblock and
>>> set_pageblock_migratetype() is used inside __move_freepages_block().
>>> So the branch has to stay. Will use the suggestion below.
>>
>> Ah, good catch. But looking at the callers, it's:
>>
>> move_freepages_block()
>> move_freepages_block_isolate()
>> try_to_claim_block()
>>
>> The last one would benefit from having the set_pageblock_migratetype()=

>> there explicitly, as this is what this function is supposed to do. It
>> also should never set the isolation bit.
>>
>> move_freepages_block_isolate() has two set_pageblock_migratetype()
>> calls already. And after the series, it should only manipulate the
>> isolate bit, not change the actual migratetype anymore, right?
>>
>> Maybe it makes the most sense to move it into the three callers?
>>
>> And then fortify set_pageblock_migratetype() after all.
>
> Sounds good to me. Let me update my fixups.

Hmm, hit another roadblock. In online_pages() from mm/memory_hotplug.c,
move_pfn_range_to_zone(MIGRATE_ISOLATE) calls memmap_init_range(),
which uses set_pageblock_migratetype(MIGRATE_ISOLATE).

I could use set_pageblock_isolate() in memmap_init_range(), but
that requires move set_pageblock_isolate() out of mm/page_isolation.c.
The change might be too substantial for a fixup.

I also would like to get some opinion from David on this. So I am
holding this fixup and will send it out as a separate patch when
I get more information.


--
Best Regards,
Yan, Zi
