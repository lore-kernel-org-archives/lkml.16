Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7FD299
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628073; cv=fail; b=FgkjNfnywuQzmCb53wt7LHLV+oIWXJl78pqxnTcTimBjq2FMZmo8lQB5XZZdZY3Vo2pR5xVHlylz1LMuDkInSVziH34O9N989OSLMSUiSTffK/KK3eeZDsCbYHSjkMZM+m2R+SO7L6mvlw1Pktyfu2CybQw/59ocE2VzQZGdm1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628073; c=relaxed/simple;
	bh=4hAtyhPv5Eemr/rUQ7VVwUzqW/62E/7oa3Xq6g30lyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwQB02npLRzPDm8hurk/u02ykrcjlAhw/9Ou6Q474uBPIshOrqQ4u9Y1fi/vCATB95phtM/z9GMZh7r7USZwLPgIZCAbKmIp2tfWZd5dpTZjgmNbbjjMXrzwZ4cgcqf6Feh5LfQayJoHYkwO8uycwGgPI31OZppgHP3JykCORAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KVU+RcRG; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KVU+RcRG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgXlyj/RXb7+BKiex/YS7MgfUAeogW2Lfgu+2OJzYnVYnhVjW/5glo0K4pbKP9YRsbI+ZIV6ishma1/CeXaOQANFRW83Hkpe2JeAIK+EOqALiKG5lGQbDi4dkv52XTIvVDo6W3n7NqL/HSnmTNZFcux/R69jnR1GbmaCBZyy+16RQXEu7bQpY0VMmYOj7UgLTvAIFzSs3/2qv7GGmDuwOCfslDfuieoxu8hj3p2eAkZDquU2qj/skfN/zWtcbEgMDAC0vqpcRHP16G0uG/rQleRE/VRiPTpbEK3/lnXN81+StAuLaRm+JahITnWyvw1zRRkPU7j8zO1ZD5ZBpO4ozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iDPGntp84YE6ujjDHpGkWlxgO8wVjhkB8vORPa7mcA=;
 b=LYES3PfBrQrgHJ68ZDn/SWntso5GmGlUYkFAPaGBSuAwkXap2EGY0oPHa11ZkqrHywHYml8vEU1U44iP2nFCobeuMNllXPPpGKmqLjv9KfAsUH806RBCvwCraHb4Io28fL4NC8652bh2AoDa6rEr7xEO7kF/lel9m8KX7O6ajeL1csSckRJO+zGUQFLyz+Cc6vdCGsKxEbHSLtLsIyqBl+AZozASdgu0oxRvu9xQzJFSNLYNwMkIGYI0th7+O1IpIu6BSHhHyuhBKJ5TJfucsJGr6p92rOKFfno4u/HARYoYgIlxEcUrQj5sQhLIoDrWI4epUjtSNZoAvXRvkEU2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iDPGntp84YE6ujjDHpGkWlxgO8wVjhkB8vORPa7mcA=;
 b=KVU+RcRGgW30KAnPDw+6Yli83TeeEwcec5NEUo38j1xvHcUb8LqtyNJkQSyUQqUKxwotDA95Fy9t0JLb2R2Y2N0Jiq1eaZdtcOK33PWOKqAwt8gkbng59ruw0sLAC8ykezxnhX3Sn4VnwvRdNMewj0MKj8Lf9/Prwb2xQP9ALVJKaxytpcaXbMQfiAKy4IPyBzEVzQBrLQqJcacZxo+qYJ2lSjhYxuBy+O+D3J7JQrhxEW4PjtpUp3SAXJyR39xy4gM79H/inGqBfxthXBA+I6SoAyzlPgcylwnwsKNBtoXO8k8/2v4WndP5iBT0lFqATCdYM7CwJLrB6XuO1lLuSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 18:01:05 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 18:01:05 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
Date: Fri, 30 May 2025 14:01:02 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <BCE65484-36AD-4B08-B98F-7B4B8C50E5C2@nvidia.com>
In-Reply-To: <3dd2385d-fa1b-4af3-93d8-6c88110b19d4@suse.cz>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <3dd2385d-fa1b-4af3-93d8-6c88110b19d4@suse.cz>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN2PR15CA0043.namprd15.prod.outlook.com
 (2603:10b6:208:237::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4c6afa-c686-4f97-c7e7-08dd9fa3f267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BTa6TB8Say4K8vk4j11hCDruXMNtrgmKZ+gJgspLUpcoy/m1ZU2+UMdVxWew?=
 =?us-ascii?Q?Bt+35nImjOD0MPVmiN+/RcjCHCxaMvlZvoB+Ez6YlbhpJ6sxP4fGOVrTail9?=
 =?us-ascii?Q?4xx7I13qFGONWF6yQZgwFz5n32mdbwNDnszIkOoGYS/3LrWTbJuNW99u9VRp?=
 =?us-ascii?Q?HZlwu35B80QtTTCgWhWnchwhQtxPTBTOLyeXzCYHPmEeXJR4wjOM+F3XatS7?=
 =?us-ascii?Q?m2xsSsYBfRjs9Nmcha76d8aCdsrLhEcKexNyw3R6/6peeijC+0ws1E1ydk4a?=
 =?us-ascii?Q?V6jEXQWOm/xIH9TaH1gFUB86eIqvL8lhDQCfaNgesLMnkGBPh9A6wdHbe/zw?=
 =?us-ascii?Q?hjDcK2kGYpwkBE3oShhY9mXS6kP29B0yT9GQj0a0CIU+CGBdcMBZLOna0dXX?=
 =?us-ascii?Q?ybv8BBLiIAuPe1J773sJPjM4MJhSm3OrTaJeWZjck29GF9OmORvFbhmnytel?=
 =?us-ascii?Q?Z/ZCTpqH2+SLMW4y6F0gGfoLxPrEiE5luJvGOIw/kHDBQpSSDG5qsoog64Gj?=
 =?us-ascii?Q?cbwdRMo+KB+WGjUZVgqQ+yTkZiaaE4s4mbDYv5h3aseeNIm0RKIqti3ey1f7?=
 =?us-ascii?Q?OoSRugKutIT+Qpv3P/fYSHBwumC+PfvEdW/MsvjEYoM/MbhzuWNT5cejxA43?=
 =?us-ascii?Q?QklpCzprDJKAyyLSkNGLDv2xEHbApwOBPjrHG1eyzZ+O4Ndh+7buib8i25YW?=
 =?us-ascii?Q?XQXIETQ1zb5HndPbAJzdxStY+6os9ZiQOrxn3hXfflulBiA7G0JNRy25u7Q4?=
 =?us-ascii?Q?ix1NO7XWYya2tOZmdLemzn7zmmMDfx2M1xTGcXvIbEMrS7w+mP5y+GFXc34H?=
 =?us-ascii?Q?pLLyFQJTdikLn4X5AzcMXINgB1vyjw2O4XxrIZrJAzLaOh+omCzO5J0ZnZ+u?=
 =?us-ascii?Q?95n3KWM8/sqBMJtgB3t4W1AS/w8pT/AecAiZIQvXkqEnKoxhdUfqTxPfVEIU?=
 =?us-ascii?Q?KrwUZRDp5xFsT7h89st5EF5EdHpRqFdBxBGyZlE/ySDjNcbtw2b1aiVyeQyv?=
 =?us-ascii?Q?zxj6oAkLbjqbbM2mQK9SHmYJQllgRzgu4yhRGy6L0KfFyXWRsgtT4HS+SHUT?=
 =?us-ascii?Q?E422PI34iadwTnKZKHGRBozUInA7/CPEKUgDSx6Fr2ww1io2VEI9WTSV3Leg?=
 =?us-ascii?Q?OAXKNGLydHcB8lt82y67qBUEvZH33kceQe/BwdyJNHrtHTQRTfFhyBQbywZb?=
 =?us-ascii?Q?55DeXHKHKc/4pglTAhAUMzOUdoGdkOBzfHCIIwucwVAxlNbPXz4gZ4AQymkd?=
 =?us-ascii?Q?h5Icjlcehd9fnc/O0SLsQplhhI9twu6gMRwrHB4klP6YGjTIFOtVmcP650pv?=
 =?us-ascii?Q?HW8EGwn9CfTGdVO6Nfl44VTjTShK2UI2vtp/L5n77j8aLG7IE5iuqPxVpoIw?=
 =?us-ascii?Q?5u1VQkT+nAlKdmHU+yNyFGGTdbiBAjsTnzmjtHe/q+tFWfkVUnrO7sqZQVfM?=
 =?us-ascii?Q?z+DpqLYyhGc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B27wNDt0T5OutDdpg/K5+D82Cnnce75buQ1FFCXPsDGzocpFUVmergGBQAyQ?=
 =?us-ascii?Q?YE2cNW5GS8H0a9emxBCuRxSAk/zdGTFVX+SoEREjm9LoAVTOGA5TKLEIrSTv?=
 =?us-ascii?Q?ssiz6GGyuYdM28BHSmhpxrVCv6C7QteuT2UkGA9ChnwJlhOVqWedFHeac9oX?=
 =?us-ascii?Q?Y/rv0I8battXFJoo2sU6NAsRlF88oEQuIbZcAf48e7i4ZQOPDDtAtJ1YdHxq?=
 =?us-ascii?Q?PHNY+DPcrxXAK3Map2Xcq1teEJTuNtLjgkscFTDLAM0prUmBljEEQFZgLWsD?=
 =?us-ascii?Q?2Ik6U/IekK2XJlkRljxfZU0Ej5aiSzcPgyaINeHJzAYzFA3aajty3QS8usL/?=
 =?us-ascii?Q?aFj/00MR3uUoOswWX8PSyOFtXlZcgdrpDUm5QscztjhpznkrPIgqJhFswYSc?=
 =?us-ascii?Q?KUifiHRs77uXv6/Az/5CoNdpCyrlu8kkhlQAgw1z54Wv8pX2gQLSFbOZTcSP?=
 =?us-ascii?Q?RM3jEMrTSoUnDQA0y/mEZBBeE1dIjply46VgqD6RkiSNDmf14KlMmfnvPmA7?=
 =?us-ascii?Q?jCV83ZAEh6nPWYLqBBfcxrESVCIzhRRyWPCzekBJtaL7Zdp3KuILQzByidVE?=
 =?us-ascii?Q?nJGyf3JEEtmGrC0Dpzhl2lDF/VGawGVSq/94m2cOKEMvEr8gBuVEaL6ETWzZ?=
 =?us-ascii?Q?7RO2otuH3tCV8Id93/3zx2+aIInJ3sjE4lfSSL2qosZb/I4yGWlLWfJXZkwT?=
 =?us-ascii?Q?aWmqCtcWa2cCufF6GMnJqqBOA0wYNQbZgApmLeMsNRV2mogdJRI1OF08GVQG?=
 =?us-ascii?Q?gqV68tvPO72LqWby1DYhlvmJtrFnx5HFdlCuzi8vQ8dQRQ5qD8x4AHp4H+FS?=
 =?us-ascii?Q?ycDKWccrZTLAaN0g6zhGhX3ts66Zgni/YJNpY5rF7nHs84sVCQu2lraxlThm?=
 =?us-ascii?Q?zrpAOV+ms66hRpE4cCat/QSw05Xd9n9T/E44ul+88bbGGtifYMoDo9gS0TVo?=
 =?us-ascii?Q?3G8L6VyoOHKrAFFrgdRMGnNOILUmxRvHExbvTTem6GyERTFMWg6NROphFAp5?=
 =?us-ascii?Q?6zH3wF2cqIZy3W/papK76CvZGDCxh7+y6s5Rf+7QalrQC5S4aBJ7lFhwxgrd?=
 =?us-ascii?Q?hPDvNrGuHd43YrLr2tHpuhWG8Rtzgmw1N84O1dXHyEYvXy6XPNHXxou6Wfwf?=
 =?us-ascii?Q?LXX50p1NjrPsQH7QcnJRsC3R6HLlTco0V5dVcZykX4OriAZ3EM4obEXzC/sD?=
 =?us-ascii?Q?xgEhG60lRYTrPUVQ4y3RyCNsS+StXFv5wAIdC3xP0nKlOct9Vvz/oZz8mAQC?=
 =?us-ascii?Q?lkFxCTYft4LuQY9NwfWAz5i0VZmKQcagsL2J4mCy7NePcg9gfcihxQAUiCzY?=
 =?us-ascii?Q?8ELOb1ElU0Xkcqt7Rhg28pWkeTw4rCSc/GFssog8KjU4DIa7jMU+aCFHSEwf?=
 =?us-ascii?Q?P6DjlOqko6LJDB/AObpRGEgVyxXaahJc2Hh2qfN7iKj/BjZZF/PJzFxvF5cj?=
 =?us-ascii?Q?NPYhwqcAUJJMo0BhFY4QtmU7zoIO/ahdEitv+Nho48i5BiwiCjEdeIV4DNsS?=
 =?us-ascii?Q?a6g0/JLfFTo57QPo9lmtTP8kXIEZU/gUn61yCuC0N+DSPspKjGFmdUQ9uNnC?=
 =?us-ascii?Q?rHACcFuQgMUiwpeCsM3Jo58YLKldnBaPCtiLpSa0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4c6afa-c686-4f97-c7e7-08dd9fa3f267
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 18:01:05.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7/k2pmy01oRmY1t/cQPdTZVGnskEFtOHb013bRJ4Mq05a5mO9fDiIRp5Pv4FMQ8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

On 30 May 2025, at 13:15, Vlastimil Babka wrote:

> On 5/30/25 18:22, Zi Yan wrote:
>> migratetype is no longer overwritten during pageblock isolation,
>> start_isolate_page_range(), has_unmovable_pages(), and
>> set_migratetype_isolate() no longer need which migratetype to restore
>> during isolation failure.
>>
>> For has_unmoable_pages(), it needs to know if the isolation is for CMA=

>> allocation, so adding CMA_ALLOCATION to provide the information. At th=
e
>> same time change isolation flags to enum pb_isolate_mode
>> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
>> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
>> MEMORY_OFFLINE instead, since only PB_ISOLATE_MODE_MEM_OFFLINE reports=

>> isolation failures.
>>
>> alloc_contig_range() no longer needs migratetype. Replace it with
>> enum acr_flags_t to tell if an allocation is for CMA. So does
>> __alloc_contig_migrate_range().
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
>> ---
>>  drivers/virtio/virtio_mem.c    |  2 +-
>>  include/linux/gfp.h            |  9 ++++-
>>  include/linux/page-isolation.h | 20 ++++++++--
>>  include/trace/events/kmem.h    | 14 ++++---
>>  mm/cma.c                       |  2 +-
>>  mm/memory_hotplug.c            |  6 +--
>>  mm/page_alloc.c                | 27 ++++++-------
>>  mm/page_isolation.c            | 70 +++++++++++++++------------------=
-
>>  8 files changed, 82 insertions(+), 68 deletions(-)
>>
>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c=

>> index 56d0dbe62163..6bce70b139b2 100644
>> --- a/drivers/virtio/virtio_mem.c
>> +++ b/drivers/virtio/virtio_mem.c
>> @@ -1243,7 +1243,7 @@ static int virtio_mem_fake_offline(struct virtio=
_mem *vm, unsigned long pfn,
>>  		if (atomic_read(&vm->config_changed))
>>  			return -EAGAIN;
>>
>> -		rc =3D alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
>> +		rc =3D alloc_contig_range(pfn, pfn + nr_pages, ACR_OTHER,
>>  					GFP_KERNEL);
>>  		if (rc =3D=3D -ENOMEM)
>>  			/* whoops, out of memory */
>> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
>> index be160e8d8bcb..51990d571e3e 100644
>> --- a/include/linux/gfp.h
>> +++ b/include/linux/gfp.h
>> @@ -423,9 +423,16 @@ static inline bool gfp_compaction_allowed(gfp_t g=
fp_mask)
>>  extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
>>
>>  #ifdef CONFIG_CONTIG_ALLOC
>> +
>> +enum acr_flags_t {
>> +	ACR_CMA,	// CMA allocation
>> +	ACR_OTHER,	// other allocation
>> +};
>> +
>>  /* The below functions must be run on a range from a single zone. */
>>  extern int alloc_contig_range_noprof(unsigned long start, unsigned lo=
ng end,
>> -			      unsigned migratetype, gfp_t gfp_mask);
>> +				     enum acr_flags_t alloc_flags,
>> +				     gfp_t gfp_mask);
>
> Nit: when used this way I think it's also rather a "mode" than "flags".=
 It's
> probably sufficient though, I don't expect we'll be adding more and wan=
t to
> combine them in a flags way. So it's just about the enum's name.

This is the fixup (variable alloc_flags is renamed to alloc_mode too):

=46rom 9674b741eb93eb74de52fb28c644f523387d1e9f Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Fri, 30 May 2025 13:58:11 -0400
Subject: [PATCH] rename acr_flags_t to acr_mode.

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/gfp.h         |  4 ++--
 include/trace/events/kmem.h | 12 ++++++------
 mm/page_alloc.c             | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 51990d571e3e..363771903be3 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -424,14 +424,14 @@ extern gfp_t vma_thp_gfp_mask(struct vm_area_struct=
 *vma);

 #ifdef CONFIG_CONTIG_ALLOC

-enum acr_flags_t {
+enum acr_mode {
 	ACR_CMA,	// CMA allocation
 	ACR_OTHER,	// other allocation
 };

 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long =
end,
-				     enum acr_flags_t alloc_flags,
+				     enum acr_mode alloc_mode,
 				     gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(=
__VA_ARGS__))

diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index 7c4e2e703a23..4ac8fbff224c 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -312,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 enum acr_flags_t alloc_flags),
+		 enum acr_mode alloc_mode),

-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_flags),=

+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, alloc_mode),

 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -322,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(enum acr_flags_t, alloc_flags)
+		__field(enum acr_mode, alloc_mode)
 	),

 	TP_fast_assign(
@@ -331,13 +331,13 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated =3D nr_migrated;
 		__entry->nr_reclaimed =3D nr_reclaimed;
 		__entry->nr_mapped =3D nr_mapped;
-		__entry->alloc_flags =3D alloc_flags;
+		__entry->alloc_mode =3D alloc_mode;
 	),

-	TP_printk("start=3D0x%lx end=3D0x%lx alloc_flags=3D%d nr_migrated=3D%lu=
 nr_reclaimed=3D%lu nr_mapped=3D%lu",
+	TP_printk("start=3D0x%lx end=3D0x%lx alloc_mode=3D%d nr_migrated=3D%lu =
nr_reclaimed=3D%lu nr_mapped=3D%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->alloc_flags,
+		  __entry->alloc_mode,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index dd761f5e6310..dc418510aba2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6696,12 +6696,12 @@ static void alloc_contig_dump_pages(struct list_h=
ead *page_list)

 /*
  * [start, end) must belong to a single zone.
- * @alloc_flags: using acr_flags_t to filter the type of migration in
+ * @alloc_mode: using acr_mode to filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
 					unsigned long start, unsigned long end,
-					enum acr_flags_t alloc_flags)
+					enum acr_mode alloc_mode)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6773,7 +6773,7 @@ static int __alloc_contig_migrate_range(struct comp=
act_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}

-	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_flags,
+	trace_mm_alloc_contig_migrate_range_info(start, end, alloc_mode,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6844,7 +6844,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp=
_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @alloc_flags:	allocation information
+ * @alloc_mode:	allocation information
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some=

  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6861,7 +6861,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp=
_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      enum acr_flags_t alloc_flags, gfp_t gfp_mask)
+			      enum acr_mode alloc_mode, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret =3D 0;
@@ -6876,7 +6876,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 		.alloc_contig =3D true,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
-	enum pb_isolate_mode mode =3D (alloc_flags =3D=3D ACR_CMA) ?
+	enum pb_isolate_mode mode =3D (alloc_mode =3D=3D ACR_CMA) ?
 					    PB_ISOLATE_MODE_CMA_ALLOC :
 					    PB_ISOLATE_MODE_OTHER;

@@ -6921,7 +6921,7 @@ int alloc_contig_range_noprof(unsigned long start, =
unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret =3D __alloc_contig_migrate_range(&cc, start, end, alloc_flags);
+	ret =3D __alloc_contig_migrate_range(&cc, start, end, alloc_mode);
 	if (ret && ret !=3D -EBUSY)
 		goto done;

-- =

2.47.2



Best Regards,
Yan, Zi
