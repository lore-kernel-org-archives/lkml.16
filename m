Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6097526B97F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663278; cv=fail; b=jvqOgI2SVqXdH/CEvrZF35cq4mogBcB2gCWK2C4q0WWlIKe8ngUORRLwQh8n+rAW2g2+qutt+4GTG9haQjQzyZ1Il9rdVSKs7YrMGQ+GM7Irl0icOg5Km1/m4yGNunPnqgj8gTTVtAAHRKdBBKoG1qT16dCUhzEFcNZiWzBNcqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663278; c=relaxed/simple;
	bh=RL42+hD0GFv8MqJhjDA9iqxjOjkpts3XjzaIUvkoE3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vnvrsxni8MiKOOHdL9Lmcmt0jt0S10krj74PNIVZfK9pnukMDwTgF1LmItWroNTPENUx5S+6s2hz4qJWJYyou3DTuWuR4cYGkkJ0jKaNd7H31voY6opcjEYEjOgPcRGT4zHEBp7F27Vb8VhBlaDgLgayp9Fl0lvmGwPnpEiSfI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gBQxXNN3; arc=fail smtp.client-ip=40.107.93.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gBQxXNN3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd8RtFzto2KzFZ5KVdhRPtBC/f5d2SHMMYEqono15Gxw+HINjElL5u84wQ61lNKsP2gzRGQzUsy2XlxAM19EtJ8/ZogNRfP/SbDISZ4yrjsFeHVcZehuVcigHyFcxaAVw4HcMFMhg7g/wLSo0B/cettgb+7Twc59dN3dvVyqePKSgKX8y6TLInOrAOumGDlOg89E8K1gFvRQNv1Co+8JsKv9MlWBblYrJI9H2rMKUjuU75q9J8qp7EL48ik0vmLbe2h4lHq78adGvL6wqRzSxEthCTnxp9MUzpu1CcYDBhPOh71fjrbQQeZ97wYodeex5Sb6FN3jIptzvoh/TtU8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RL42+hD0GFv8MqJhjDA9iqxjOjkpts3XjzaIUvkoE3M=;
 b=y8rdryOY/wNd8vYtzEeEgfYes7LBe+J3fOXFIvVBJtEgundA3bDw50xBFUFOkGGymE+RAUcElE9aDHAVLnGVHsr5YqqrZyGKLtBBDpYXNO1VEdOJejZw02+6vN23nK4006N4dMCyo9hnsHDIpnoo5TPcGNBcVbsawA5wXMco2mJubvZZH/hJeJqWDiSEvsqzNwo56TedMI3QiYT6PRNCIF8FIyBaLUmVeFz7Y5qomLD3OcJwp3B0T01nmcFlkzi+fVFW/6LlxTfuznWsBoQx0J2XgUtagNNC3MnfCOiq30yEvAD93bPcq4hU6NIHYDih0QLIcuQF1Bi/dazr6IHRqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RL42+hD0GFv8MqJhjDA9iqxjOjkpts3XjzaIUvkoE3M=;
 b=gBQxXNN3W6d+7N6kqT1lMOGBnBKA3zFBzVrzpbjaaohifQIV1XwO1ujWE4m3PW7P6yYtaVuS8nw3asG0da6agHpnSucxXWtYgEQS9jbHD52ub4YChBbCRnj24Qq90Y03i4cmpfN29o/jWyplujs9zaNQUDbSbT5rr6PUa0OhIaxgRzNKbOTzr2JcpOxhvrRZxXAFk50L2i+Oi4/SEqtup3ubxWgS0JHcanbBF5/jj+8LE8W+YTR+NkDWkaQDhjVlEbqZ2PNfF6UH4HmfJtyEb0NmROqcEVin72X+Z26VbydPR/rybWrYZviFWJkkDdV//j0EbHQ4qwOH5tW5QZVMsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB9017.namprd12.prod.outlook.com (2603:10b6:303:23b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 19 May 2025 14:01:13 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 14:01:13 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
Date: Mon, 19 May 2025 10:01:11 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <7AC4F1DB-5B90-46EA-AF86-7AA3E19FA34D@nvidia.com>
In-Reply-To: <55f41277-f686-455c-a6ac-86c7e952beb0@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <55f41277-f686-455c-a6ac-86c7e952beb0@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:208:32f::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8826cf-ba7c-4d3e-d916-08dd96dd9d62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rWrWZ6WDBD5QaU7nmAViQk0tBytpXRJNfOYcxJP1TCxlwuTH+URMJO8UBdMy?=
 =?us-ascii?Q?PVFi3ZA4kwSUjSjR4PrjYyVizdkL5INbp85Rwkdx6YBRByY0RGuCUsX45Aqb?=
 =?us-ascii?Q?TzG68RYDAkJ9vR8BSdX/VSa4SQ2kZCy8tou2xwGaGjcYQZnICu2Ksfkl7EdJ?=
 =?us-ascii?Q?N0hgf5e6gPz9lNkQTYgkr2NgVpiwEQfVgIAywppneplNexez406l7IAJgf+A?=
 =?us-ascii?Q?xGhhgRAVhpV1o9kdWujbL4tjpOOklRlKbp9/29F83h5Mhm3S4kaoWFOv8LtA?=
 =?us-ascii?Q?NxpwtPY2x5ecRYl4rrsfnWBO1/JxpQundNLDgEMOiLNMpnqsjvj+j8r1FV2n?=
 =?us-ascii?Q?yyKWawh1mQSXvs9N6WsrAXRi2L2eMQDc2TKHHxUtTI+Hb2DRt7CZMFLw0yH7?=
 =?us-ascii?Q?fRJy0IiHOiCYzZ4UpQxnXXI7SAsoZOKLiK6nWJ5vwpnWW4KJjIbmP8VKZ3xm?=
 =?us-ascii?Q?XRfYIncR3MejpWa/2Yuz1glOIebu35IBsXs6XUfvufXalFz6xtyhY9yoS7Fe?=
 =?us-ascii?Q?IH0Q3Ebmcl5BRnFEIuCRLg877oG2OskaFVVUSYSn5lHUf2TFkqbN2l3lSu1z?=
 =?us-ascii?Q?IztDVqxsRV4k/jvdFm0bUTYATPx7yBGK6yZC1i4Zv0KurmOz0Yo+VRrhGL1r?=
 =?us-ascii?Q?GEmrbVdPWUOkYXK2ULrFmelFt9joRdhE68XACTsttAuQ++oKKJPP+n+ehX2g?=
 =?us-ascii?Q?nZjwyC1mxabD/eaRstLlHsH/v/a5nX35DmMfl7jPhdsSNe4IzXit6gUSCV0l?=
 =?us-ascii?Q?p/+eHdCYMV56d58ntwXJC2a9CvCMuimEjidalAtzq1eVhBjnnbEoabP3eF0G?=
 =?us-ascii?Q?ADkKa2BrFVjJnUT6a1I0SBDCe+kltFlxIn38WljXRdid+k9Op8ieeXfKKVV6?=
 =?us-ascii?Q?JRS4k8Nvd7J3sZnPj6Wk8QSAXuWs4y8DyYZ5HTtpOmUWRZQ/xa9S2jqVUxYH?=
 =?us-ascii?Q?03TatxwJOSNVAWZwHPssWvXWXBNLU86LJ5wT56NBKHekwQ/JkwsoCw/zKhF+?=
 =?us-ascii?Q?4EEE9eJtjkEQIGeVRCByMlyrfZL2YflcTQ/JpBZCH6lW2t0pLG6JdFbRvx8w?=
 =?us-ascii?Q?bdinkYcmShuFyFOkfAmlAvH7RtR8VjNcQaaw9D4W9NUOyH5uUab0cXVpopjJ?=
 =?us-ascii?Q?VbmdSGqalfWm8e10O357PHpdvQ7pUnbKVHUFGkHS5KbyKszm0d0vNH+AOgmH?=
 =?us-ascii?Q?hHISZatNTo6lbu8qTqCmmdgHmNYKBH2zsEbC4ohqw9zqLZflWRPGZCp6fbKL?=
 =?us-ascii?Q?fC1fYChU/Q01X70zhcvlgly0kv53Td89OI11dmrhPKf8hgZKS0XazjTjrUjP?=
 =?us-ascii?Q?oy0a9sc5/+CIJMSJZU4UFhYERu0vVcXrrI2/VcT8U/BAK4+FWUvPvpnIG7g/?=
 =?us-ascii?Q?EBKHDvPSAE5qrLluBbhf50glvjHoZax2nzhqABDvHSMrOZ0pTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WbktD4Do+5JyjbaXuzWHxcGOBdWtvbezSNJeYfkeXx6nxqst8Ir8/i3eW2cz?=
 =?us-ascii?Q?tlHnCveGBy3q97O2YA+GntJVFk6FLEQ+AfvU11fvNpqZXPfr9san1dkLVAQG?=
 =?us-ascii?Q?+nrWHDrPfYlsHqulzKWLjDrIoP3XKG4rUkJYntOvdMzB+0eonW+YtqT64rpO?=
 =?us-ascii?Q?Ewgbai5ggiGUjq5WdzLywvOeP1wSJ5DOMrIl3aa3O+1ih9IDzj63HKYpqplX?=
 =?us-ascii?Q?LIGKm5CIDRMllAHIFj5YPpYIuj3OF5tNIQ8H0QEa6pus2p6j9pZQ50/m2gr7?=
 =?us-ascii?Q?B06Tne7sC3iUsHuOLU2s4vMY+Y4hqB+l/VQtnu5DZNWAb7O7hmGM0RrdTNrL?=
 =?us-ascii?Q?eSEUtuWLT73bhpkLzvdezRYbk6MNL6aVgDWxQ1JaIH4btbPjXW4kJNjSwu4x?=
 =?us-ascii?Q?CPNrdbHrOYfiek0+tSEde8Ty1SswGnVbPMhl+XdVcE5oXcihYcggdFETBgTp?=
 =?us-ascii?Q?vwBipil6z+tDLh0nhFx16nrH+kOFIqf3OSzu2LMSjmftF3Vu1/HvqkdoTrSE?=
 =?us-ascii?Q?carsREtlI/Jm6k2yEIoYioTPTltgmozBU1+gqEdRMzuExmj028dIE50YX01F?=
 =?us-ascii?Q?uGeRGTnqbNmu/EXyqNg1MPhPKFbCk1zuiqKKupwZ8hTDrDgtQwo3yUXxdEam?=
 =?us-ascii?Q?QE2dddKJJsNqKNoCKDQGb9R3sKz3a2m+/vZrYbuegsDYMdZesLJsTpDLCHgY?=
 =?us-ascii?Q?W4NVqvFRkJi7//9B/q8nKY7Tr9O92INqoN2CyN12feHgozITrfLUG7wGuZH/?=
 =?us-ascii?Q?XTdS5db9Eu3K88dOO1NT5dH8tg3+8QeYZaP59nzvljOLlufc32IR63jqhtC+?=
 =?us-ascii?Q?++gNQQFy8kjeZABpDmLe+JawqqaqU33Z8csr+y1qO8DAyEIlTA1aTcOs9Dbp?=
 =?us-ascii?Q?HxBTdJ9IZLBeASHNWL7JKE0UZBGBc/xECKRwdms2TdaHAOfz4tAq0AP5iSgC?=
 =?us-ascii?Q?l1tGacvdOw+aDp/ECAudwURgi1LgvLZ1x4jI5GXIY7Mk9lu4Wn3IuIqszMcM?=
 =?us-ascii?Q?gSQIsLbEzCxfPJpXGDgkfZ98A2rhgtK+05xpc4fKt3cSD+3xV02+dLFZQ04H?=
 =?us-ascii?Q?e06k3xaF30/iPRCXwjFSdwWEtjd5B3LktQyjCjrL1BB94t71uzfBFTwv2Ie6?=
 =?us-ascii?Q?Q9a7cC0D9AE/xVKDFiaLAlRKpEOO0W06KndwMD8lOjA9DTZgqnft13wqeg3M?=
 =?us-ascii?Q?qpJWggxPahW0DGOQESeETIGkW6EAhB10YAh1mL5TZ35q+ERc9UctgDHbQZhl?=
 =?us-ascii?Q?dzYjtY0xbm69McdJM5LC/z1hhHTR2Y22OkANxJ61/+Wuekg6Ao9Ex1yNd5IQ?=
 =?us-ascii?Q?an6V47MGMnr9rF21Z28BYgRb4dp3lUcAQZqJtqyQeFJGLP7ka+jjvNDhMwiZ?=
 =?us-ascii?Q?6bLt91kJj0PUwTKj7sOkVTUivk8TWYPRB1g7U61GVIwDMalN8R3UubSZbM9M?=
 =?us-ascii?Q?Wu8fBaBqxC2/POByr8d+HfWlW4UkUtr7aYLWARBIY0G2cPSTkJLjI4BmD/Qt?=
 =?us-ascii?Q?tUgJiaGz/eSM5WR6XkT/2L7U57hTqmzoR6a0Zp2cE5uWDQM4ccLdjMFxj0xF?=
 =?us-ascii?Q?RzqRz+NfGHj/gItjVwtlmcjCTR2BTauOJR5rx6NT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8826cf-ba7c-4d3e-d916-08dd96dd9d62
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:01:13.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8P8BUBZc+ZoyU9nojTne9qJkgECksQzzbdiE3jYlNcFEXdQdPEyQWo8yBFJk8vQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9017

On 19 May 2025, at 3:44, David Hildenbrand wrote:

> On 09.05.25 22:01, Zi Yan wrote:
>> Hi David and Oscar,
>
> Hi,
>
>>
>> Can you take a look at Patch 2, which changes how online_pages() set
>> online pageblock migratetypes?
>
> Sorry, now looking :)
>
>> It used to first set all pageblocks to
>> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblock=
s
>> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, al=
l
>> online pageblocks need to have a migratetype other than MIGRATE_ISOLAT=
E.
>> Let me know if there is any issue with my changes.
>
> Conceptually, we should start with MIGRATE_MOVABLE + isolated, to then =
clear the isolated bit.

OK, in my current V5, I added
void init_pageblock_migratetype(struct page, int migratetype, bool isolat=
e) to
do this, so that one can initialize a pageblock with a migratetype + isol=
ated or not.
Let me check your comments on Patch 4 too.


--
Best Regards,
Yan, Zi
