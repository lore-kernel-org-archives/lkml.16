Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CEF10E3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634509; cv=fail; b=YjPPssP2JaZw2FU1NeSkeOhUEoHx+egW5fPa073qdECVtgstMvNkSwmJ+tjzx1S5bDwooHR6GjlC7W6YsbZwiRrdUceqw9z75AQBgvp6l9PVcJV5KRjWOq4auE5LvB/Q+jEXHzeDn5kpFygReq2j86HasEjDQh0jLQS0VVYNIlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634509; c=relaxed/simple;
	bh=U+dSBjIiUyC5auuqdUMFnlXK6ytekysOmhCjrQBZadU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BHqjmwcEjSEFQIFbyc2nu37Af2YHoSupwfXMtxvN+9RKaoqxR8tIZRpS/Nyvh+BPMA+QePzAfWLHsItLsVQavd1SMsu1Oo5KKOTDOLo8Pzoh3aYdyMHI58rsdKijPHUXLzkD6WfSGiSKSLHlGHO1L0T+FXF3nGDNgq8YxRqk9Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mLtroa88; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mLtroa88"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmdQ1/shuGLzQR3qGX4I2duzWrQt3hOdQA+UbP+Gn36zKSpeFXHg26FoSMAy3v6XvoQ4afSsPoD/vCRR2eNgXysVKIr6PielRwy+DBy7rF01f+SafIcD4r6pVCU3FMWsjB+iifH58uCa4drylCzBjMIXnw96bbG4oKB3r+VO6c7GhIu5QsO0CcBaUKKMi2ilU7FRqsIuUCtyFTAE3WeSU9YXqqniykiV3gdbr7spUorMmScpDLXbEW0msaQV9RJLgj5oq3ex1prtbjqCy/Tq77LWjsSVZQNgdw8zmcMvJZQkMPttcKObjgcsqqVVvq027Egb7Ts5HcwOjcgqvTjY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TDlvsqVSulsc5e2gWevWjebJl9lBjkij/DRklVba8Y=;
 b=l4pit7oSVqgr+WXGnv9sbSj4u+1inPlzfsT7QOisb3W1liYIc5MR7J0tC2zK4k/bA1rbHzAZ+1waK3G0Z1w1Mv7nda+uiD0+HcgbsRTJLSh4PYWd5y+LhhJ6HsISz4uDpX5xI5HZom72lAPpVgwqBg2l0Ae7fISDyKv6EMl+tu5OMf68EImII/9porJhFWSolaBkGvFZ09xxpwd+MMvzhMIg82xdBd0C5GOlDp8Fn/iVZPIhJKTLKQpcMpq92H5JnSIO1KUStSlLamvF6vhpVW2NFqLKALx/ceT8H3wMLv/58lHwW2XFZ65wjd5Zsa2DhAseVAdWO4UeFH+Dg9p+Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TDlvsqVSulsc5e2gWevWjebJl9lBjkij/DRklVba8Y=;
 b=mLtroa8867kch9fRYPyAr3rlYWIlPSTUIdf69EZat+NoKmk8m7ucBsL2tEjkzOjcfxv6R6GSa2rfEZLWBjaykVIEdxQXQ2Nx/kRzWlw8AjnM7mzO/shAGB2fgrKdzlDBJHGfPX8Aix3J9CFOvn2wAMQ8lOMxfy8aHpEBa9KakgA08TPYmm0kZaym2FNvJe0Clj7hG1IEff+fSnw3LseZjUvOuPYuBxI+OXY4LlZltyXguFtRSmVyw4Kj2tIuz4nqYQmcGRacCZNvO5rLTxGO+IemzWi6R1h6Uj83G9q/NZzf+i3FB2c0BA1MBQS7SE99/dzw74sf84Uhu7zNN1QptQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8748.namprd12.prod.outlook.com (2603:10b6:208:482::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 19:48:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 19:48:20 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/6] mm/page_alloc: add support for initializing
 pageblock as isolated.
Date: Fri, 30 May 2025 15:48:17 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <38016017-62D2-4211-8568-23E7089C5A94@nvidia.com>
In-Reply-To: <8a8f5b77-3564-454b-930c-63ccddda4a2a@redhat.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-4-ziy@nvidia.com>
 <8a8f5b77-3564-454b-930c-63ccddda4a2a@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0710.namprd03.prod.outlook.com
 (2603:10b6:408:ef::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 9137df18-eebd-4706-c478-08dd9fb2ede7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mJEQlGOu1yujVjY0DL1EWixZvMUjh6yKvo5KAGFzm0TuFOoAY0ovfLo9RFo5?=
 =?us-ascii?Q?MREfUOU95vH/yIuW4wZPYXtdZJHduqyI3GDwTi44S/YLnUjBwe/OYlnjBihF?=
 =?us-ascii?Q?9V5WHWzu0biZRQqRdLjSHsYdFaY9MPggICF6UTARCq6gAewdTxalt9NTBbMQ?=
 =?us-ascii?Q?CMZqKGAuctKRr7JfmLrEKeUvrp0S9uvfz/A5jyDN38OKKVBbaJ4r7BAxpch3?=
 =?us-ascii?Q?aWKSiX/GuwnEFJDOoz7JRyh/XR39OL+ApKMW0RIDXHK/SqhLrEGzgyHrwsKj?=
 =?us-ascii?Q?7Z+HZ1FqmF/7T/gYjoXKdl8AcWUTtIFn9BBgDMsCByAGGiNW2grqs9wxiWKb?=
 =?us-ascii?Q?PkvrmGrGcLEQm2+0pk18zxCQXoI7Ws5msRWxa8GLPZ2nkmTlPpai1UTcBYBR?=
 =?us-ascii?Q?cqn+KmqS7Ergo9scAtLZYy4sx0yNszzc7FBzsRhg/Nc529atkyfqBw015HUY?=
 =?us-ascii?Q?fKAsgy2R55j+MUyH69ytBiTeWRxfmI4DJ5UcZAIKFLlknfCZKy8fkLFWdd+u?=
 =?us-ascii?Q?+YCxeGCvaf8K9skMZt73ekYQrDbL4DUuS61d/B5h3ReEv8N3RfD/ydZQDvzO?=
 =?us-ascii?Q?PiUOBIlSrEuqnM9Zz2oQTIevsz3ZsSr4ROFEC71RrZ6LkmD3Q/C6CF6O1vHX?=
 =?us-ascii?Q?6oyWrPpxoUDJ9ZVkoNoGsiXA/5G+Pg3MxObNE5WwvCCvR5LRTlL9jqm2zntf?=
 =?us-ascii?Q?izR3DNg0ttx5go9bz8oVookjPOiAGYBq7WMqJ1fQso+IiZFxx+V+KI375/04?=
 =?us-ascii?Q?m/AHcS3LOE8D80HPPVxQcUXi1059zIpL+5BSbDVNg/xojX2OoNfghf+pq5Qv?=
 =?us-ascii?Q?xTqq5knMXlMc/yONH3Otr9CDpijkMWTX/Vsi8D/W4cLKC4YcripnwLGzRMU+?=
 =?us-ascii?Q?tyHbSF0hgiglppg3ZjmnWD11urg2Mg+EQNM5DPiFOBOAEQI+pnVQ63dbbraj?=
 =?us-ascii?Q?zKotQ1k+/krc4wRmg7DtR9WpnhAHxFHqatslUC6sOCFZbAd+/8kSzaQZ+etT?=
 =?us-ascii?Q?vCWyFPGqH5Df26Kw2i+ncmy3ZWywzOI0K1fHJzFuOLOEhQNevKW3l2dHismV?=
 =?us-ascii?Q?C4mO1sO0fDLg6quR6JolcbCLs0N7FxzV4fTjwIBDZjS+Ff8suD6gWiY3utfg?=
 =?us-ascii?Q?5zmq9TjQZpiqvFbHGqbPg5A0H8wOwtPsB1ImAydCbsRf9AXoOIJa2RpL0eIz?=
 =?us-ascii?Q?g5vk8u5mkPk5hqqJTZxPozW9UEaC7nau2LeNGyT8mAMiAZAH/Or0T438cC73?=
 =?us-ascii?Q?+SZLHqSFUbUc0YMuVE3qSkpyP7szwF1tsQcqjStkQ4MHZ//wTsc/1mXaRm5j?=
 =?us-ascii?Q?OmAdyRZROjd5RD6CAXZS9ikx27jaEZwAei/lBdXBoRqFKRs3DAH6o0+1VHwe?=
 =?us-ascii?Q?VRbwwl/ZJ6xWviktYQzrL4URXFRkW3sFsIo2enqePLYcbsyyXrUF/O857nkk?=
 =?us-ascii?Q?DywfSYdwIvE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnWzHFJ9xAAECAuENBF5dX6vZY2XiUYWiuDvQr5b6HjMDcu0faOEak0RniTK?=
 =?us-ascii?Q?B25LVPkdVO5l1vssiP9iJTk5VdxAQrVaaie6w3lVuRP4woCdjU4TKbfdh0jd?=
 =?us-ascii?Q?adoRGSEnHEG3kvJS8PaQL/0t3MERlxm8s6auimeU1oC6DOa19VMU8EQYO6Li?=
 =?us-ascii?Q?YB6vhjcumUylMLzpVTuwn9Lf40tT/hi2xxOKCXkbMT6ehwL7O8vdhVBFec/O?=
 =?us-ascii?Q?RhPlCqWnn+g2pVq+jRO9udhY2TBhNGpr5t+tKV2ylFDEAZ4MqpDaXWy59Mt2?=
 =?us-ascii?Q?iIiPBxv/L60ctieG9XzJ4SiFi86dWmtFrjjHOZ2KsNXTmjmVYU90GrQrNazq?=
 =?us-ascii?Q?Y0q7PGfDYs8lNzrSVVQLmT78YG1RirgBSz385WpmF21+P29z1c8jBZs/UbFC?=
 =?us-ascii?Q?Q8LOpIhWM8YG3YXzumw57MNBxwCJfhkCFz8rvIppdPWBj4WkB2uu22B/AKua?=
 =?us-ascii?Q?fy0pWl35O+F547Mwl6a6MqOdqd5fJz99Ph1B9sisnD6goAmjD6AQAVXMnvyi?=
 =?us-ascii?Q?1MMTvU7eCNaahEJ0pPzSwMWGcjF8pAP9kwYYRsDC/HrU+W8shErOVD0IqA3l?=
 =?us-ascii?Q?EtBcW1aOpxEt+koi8GjT18PSt5k3VKSNLteO78iSAQ90gKkhWF+rU1x64CXN?=
 =?us-ascii?Q?xE85NTfhLE2a0CvSVL5hL/anUFottbWZXSGpPsAqD0Wn1cbHbvmPwb38XbED?=
 =?us-ascii?Q?1nvrvoyZZy/U/oIAlVR59YRxoDH5wvkE5wWLVdbms0kkR5MYu54YvG9hBlaf?=
 =?us-ascii?Q?oCKKASzU+2jvm68x/mMYPESpWU72vBDnmK6v3y4rN4I5po3v3IAOMFdnFsZ/?=
 =?us-ascii?Q?tSwn8BzrXK7dVT4AbinrF5ixqPDyoDLB+Bml3ACmQRRms27r1iQ+c1agxN5G?=
 =?us-ascii?Q?egogIY74ds/7frhH8eKhwUTYZEIcfvUiGolKoxkY+0wTaenR8V1NFchleIwx?=
 =?us-ascii?Q?px7q/QFrEM1hCqvHZLTwbinOJjABvNxA0be+aCQFjK32G+d0aUCUwQ1wsO10?=
 =?us-ascii?Q?pyU9ph+NB1X66ym2Au0WiWeMffoKKHfLqY/7RUXX1KmtzATBSTRA8spPSvQH?=
 =?us-ascii?Q?WvwUogkZmJ1HuiPnlJf/5tELk4DZPKr9wOdh0nrnSGMxZGtIkgNTT60IPnPB?=
 =?us-ascii?Q?JAyy4lYdv7Amn0iUtStDMI/iiFZ7kU2N+lOWdOcNohBr+qFpSyh4Qanihk2L?=
 =?us-ascii?Q?eXnlD5HaQKhEsGJtQnbhy//HI8mKggxOBh6/kAqxNkWw8JaosE3xy18hInBn?=
 =?us-ascii?Q?XgDHAt6zhQ2i6QmCGnTJkDmQb1VER4YcwWp3JMMPvKnoKO/6ZoO2I7PDvAtt?=
 =?us-ascii?Q?kYRvdSh3eYGJ8cjme6rlxG2DOcafEHUKo4AFSsAa1CYBK1qqMRIqKC444zfh?=
 =?us-ascii?Q?lckgRX2J1BVkevCoal33R9/gGVTlUOqMyF3cjxY7E9YCFGdxAKSGOD9bSd1P?=
 =?us-ascii?Q?TgT7BKv++i1qvyV9gr+udLJOg2QCXx7bZjeGGowiuKfCpPROctStzZgiEV8B?=
 =?us-ascii?Q?pxmH7e6XR8a1UcsDkrW8sw4uIVbCis2SphYJ86tmDee8KvCQ+V4X1C8RA9Of?=
 =?us-ascii?Q?DzMkNULIqodGjO4viKoPnPrHvNSxrrQhDXnt5H9b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9137df18-eebd-4706-c478-08dd9fb2ede7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 19:48:20.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cadbxQh9LRpnfYlJNa2jH45/DppOODyqw+sqyO4tni+TXk3WezmCMuTYzzvcAGo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8748



On 30 May 2025, at 15:44, David Hildenbrand wrote:

> On 30.05.25 18:22, Zi Yan wrote:
>> MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initiali=
zed
>> to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
>> initialize a pageblock with a migratetype and isolated.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>> ---
>
> [...]
>
>>   	set_zone_contiguous(zone);
>>   }
>> @@ -1127,7 +1129,8 @@ int mhp_init_memmap_on_memory(unsigned long pfn,=
 unsigned long nr_pages,
>>   	if (mhp_off_inaccessible)
>>   		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages)=
;
>>  -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE=
);
>> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,=

>> +			false);
>
> Nit: Likely indentation suboptimal?

Yep.
>
> Acked-by: David Hildenbrand <david@redhat.com>
Thanks.

Here is the fixup:

=46rom 83e9b8e749481b9397b170075cb5280d0640b16d Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Fri, 30 May 2025 15:47:06 -0400
Subject: [PATCH] indentation fixup.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/memory_hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 43ac34ee8d2e..16e3ad874144 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1130,7 +1130,7 @@ int mhp_init_memmap_on_memory(unsigned long pfn, un=
signed long nr_pages,
 		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);

 	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,
-			false);
+			       false);

 	for (i =3D 0; i < nr_pages; i++) {
 		struct page *page =3D pfn_to_page(pfn + i);
-- =

2.47.2


