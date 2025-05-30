Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AE2D600
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625684; cv=fail; b=ahaQTFy5eUjCMKtrusaFz6bdO/RWWoS7Yhu0I9HQFvV8DefWZGa+G4DxxBcyDiPvCHt/6i4mXFe/cEN1FBRTCSem0FoGb8ptX+Z5veX6RyI1MJTPtYgeJ4PLJGgiB+bu7HZD8ZojFYQR0VZfKTbCKi9UbWG5oC6fhjp4vxLIcYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625684; c=relaxed/simple;
	bh=YMnNBtsFP1bbMJuVbaxJkJp7k0spwtH4Ad3G/3Uba60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tOCWPNqZG9lKNAS5rwDvejcb7jDsrixDheohcmBmyRefHdz4aBpTClWJb1MqQj/A4lvX+3ai3W0XfP2z9ezLqptV7yq7xv5iX7RM7rH1xNEITH0QQ8riH/RQouyyTvUfr4CZvsERXLVTaPyZtBq9N6UZqlMLPy5O888OCCEeQjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D84hFlN2; arc=fail smtp.client-ip=40.107.220.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D84hFlN2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+QE+Sgdik+kWbutFfHx6dYFnNaWYJgOvMyP7GbLrGMxqVXw+eHE15TZm5CqPwI6UvarUdliLxwlP6PhBf1EQKPqDX9ujlIhKoy9MCpiWl06Tf/cxww/5sTMIFf1eBflPUY6KjquGbjiMu+CA4X0ZUeIp/3zYFPVbqmllRdxc5QM1CNtRy3JwkCsE+n8KblJQHjoQbz7FMlg3fgzpEtN7U+6vk1LXfekKMCOfmY71UHGQIQXOGqOAwV/LdtCN5Q3975OUBZuwX8Hya2DeoQbZEqIRpfLwV4bOm3BkEeIfD7gWj5UUBYfTNmNtRc8yiYfgmkwhtpFygWGG+7kGFWvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wQDvVXh0Ph90pKuZuNV1kpS2OSGywtubkL5sBCWMbA=;
 b=Im4RsveK0rXkAAQZ1gXscK9cXQImRlE+MwdPtVVzaAgwRM4SxB62JCKU2jjI5Gta8LPqi2cG56/OCtP4Ztd06duixDLTKgcLNkF6nu1f7ItHNu4DFESiJ30VqWNYuRKfsVBmZMXiGQFD/a5oQQI08Lprwkawkgwd6tHOpRfAgTQPVpV0NaeaRnOVGcIXkyK7gkL+wbAFp00g2FtR/yTDRfuUEtVfvA/vjN61pzTQEO6f4DUL2QNtdyJU75yrTO1t/QIc3JHTvgAi6WZMdvonCLSOAeC2IwqZuV5J1ZYbgY9yGbjBrQN5X2ycluDVrT1c5PfV1z7y+XobcoTP3kUFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wQDvVXh0Ph90pKuZuNV1kpS2OSGywtubkL5sBCWMbA=;
 b=D84hFlN2itvAokTGKHbVvgogUcOrkflgdezb+6nAPHttE8F8fu1zpcwnsR5c4J/1nfLm7JOp58Mt2RVpax109kZsOgXuMscoXogmX+GSgnxZOXPlXro0kkcwKu4OJ3TBTKnZ225BjB0oi/kC78kLT44GZRNU5OmpTB6dhTzIVSDQZYFUL2pO4QM96gO81gcUqWGdX/5j/dr1SnZwAW0pqm2xMLPRIkKy4FKdQbE7aMX+v27UwFmySScfRH4ZpQ+drhrAawzXko9BEAHRBm/aQF0ptXPZX0vm76HBb4AZYhKWYgjOykrZTCunQs4c8vfe503JGT4rtJmOpxHjnhSX5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 17:21:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 17:21:20 +0000
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
Date: Fri, 30 May 2025 13:21:17 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <D280843F-ACA7-4309-BD61-42604A9482E3@nvidia.com>
In-Reply-To: <3dd2385d-fa1b-4af3-93d8-6c88110b19d4@suse.cz>
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-7-ziy@nvidia.com>
 <3dd2385d-fa1b-4af3-93d8-6c88110b19d4@suse.cz>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:208:329::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 997843ec-4dac-44a5-72a1-08dd9f9e64c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?26voq/cacIh1qKZH4dyu3WJfZHnbmebkUZkY3Y22OlAVweFWVv8rkN49F57m?=
 =?us-ascii?Q?pZulByizsn5qNnddCkNc9mVSSM6HdWu1Lf74e2Of3kgZE/G4XfEs4gh4ejNN?=
 =?us-ascii?Q?QIrjx9pkqMsvAhEOwss7+r0Y2z6rnA0TcOFCmpMkYM7lXZEYqTj6pN35/dAh?=
 =?us-ascii?Q?vUZYz/4K9xUr4LX4fFWj52xLO1oBjN7xVGhn4FAmhICENEbL9PuJZ5s7Et/Q?=
 =?us-ascii?Q?3iKjfQsOOuB1k/27N5PkFSEvUqJEE3yTQDU8fh8PF+VB9FOuZllORUQKZLVp?=
 =?us-ascii?Q?93H3Iyd+zpRFMpdE7zEbHlUAAxJoaQc6PEapCFL8+Mbz051dAynZDmqphaE5?=
 =?us-ascii?Q?A2jsPGGRVhoTZ2LODCJAxUgpnmNV0LWU7zl8y3DD9iCuYx7gvEACFU5zPy7a?=
 =?us-ascii?Q?yGnhwDsml+a2Yq6s9EM1ctujwIRFY00XYb0rbQpRO9VUxza46+blw9y6iqQW?=
 =?us-ascii?Q?LYLxgkWryqOUE+MZ80S7WqZDG19U/mnAZMxVqPP2rD7YJ35+OPEGQMy6bKJc?=
 =?us-ascii?Q?TBfkVySdCUSqD72mly4QxeurWcUbd3A71jiQHPpOZlmHUCCCGqodg4ICh8gg?=
 =?us-ascii?Q?U9+W5ARpsnxRvEqXiPCNKLIk5IYaF4v3YklM2rcVI0IopsMlW6bJRsY6l70E?=
 =?us-ascii?Q?IcSyUavrn2FgFELDouQSHwLa68/2MhPQZtHmSFAuTpDNs06y4Avibk/m8Y0L?=
 =?us-ascii?Q?C0gyAxGEzhcm4zX1uTPKNYOEki38ILjNmwwzint21sOdGnWsWoDepV3vGBQ0?=
 =?us-ascii?Q?RDICSPaT7+p7UHi+yKEgIOyVbYozGYaO8A1egBGBAnkbY4OnUkN4LkMbrXLF?=
 =?us-ascii?Q?g4/WmFP4yZmg/Phaf9rIqmoUILEkALTLLDxSfxyK/gNRC+FmQSCm5PBAVf5v?=
 =?us-ascii?Q?pjNNBrkPBbnaSgYkKBc09C5PKR4yIeocvTm/GP5Vo+c8lOz52WrR/lSxhBB+?=
 =?us-ascii?Q?KeWV/dH4l7nHqjMTIp/8JsRX32VtV04fTaXT3RiMTGW4yewXUkTx+9wTfLND?=
 =?us-ascii?Q?bhaQIw7Fk9S+JoTyoP4OQf492YgzFnbo17h9yPNZOLO8wa3+gelQFu5ZkRGo?=
 =?us-ascii?Q?RkmdqnydmT6IDR9whfUahKM+Y5ONEpaQqYKNXQvygSqfB7ElspcvjmhcorRm?=
 =?us-ascii?Q?jLRg8mNiE/JE507G1B/2clujiOlhPIFyc+cWJU31lzZF7uGeYRfPFJ1fiPqz?=
 =?us-ascii?Q?ERvTV9NlnlTda3iRzFkxhHYmkUVzkwHTLqdJ0Hbl9LWgLVDyFPQlDMvJiUMN?=
 =?us-ascii?Q?o+AWFXgT4FEI198RmPXzdLAigdtEIqWEhnPYziX1n59pVu/sCq9oYrDwGtx9?=
 =?us-ascii?Q?kdEuTHkrZbcgLRf4TvN3Vrl2FUqGjjpPjhLPlgnSqIPWnIhHi1WW14y8eWdZ?=
 =?us-ascii?Q?b+0Lm4YveM5aluL8oicououmtahsgUDCYXH2qVNYmKRLHhd5tNkZ+YWXLbdB?=
 =?us-ascii?Q?kdhNRvuCKp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u5pF/OFrL+GC+QwbmPIPaCsJqgU+w+wzHLZRcpqZTdB4Fb2JYY/LX7TJhYNs?=
 =?us-ascii?Q?ZCz7FaePPKdL4dMfyLYVt7oNEJc9qNXgRJeXrfOqjgaEubdEJKGws0F1kOXg?=
 =?us-ascii?Q?3D4n3tSKA4C2fFhVW2oeru7EIPqmsT3D7BRmbUGqE02Q83bTqfx5L0GypfTf?=
 =?us-ascii?Q?UHm6z8KmPNbFb15tsBupUXuv6w0vCSLe1tdhvpR8lInB3OjoRquWW9xki5YT?=
 =?us-ascii?Q?3d/JMx/16qS/1ITEMmT3glLIi7lOGQBdCIaJ29XRqec+l3HifT6hM1Mj6GkQ?=
 =?us-ascii?Q?6LobSFb3o4IidpiJjShHbUpprbLFJeiAm7xj+eCIkjhvpeay/C8LrmVIsUvl?=
 =?us-ascii?Q?3RGv1KifAuMEyP5MMrPROvGM0VDINDTuwaL6p/3aKrDIdjjbJvdlt7+0hhpx?=
 =?us-ascii?Q?X28vNIyIDzUIHlGHCUAEZLzBc/F9rT61GWDgicYU4NB5TCImmdHUhakFBI09?=
 =?us-ascii?Q?JoCKSWTGLhUqmy7EV3wFmSzruNvypEkCx9h7qmLn35ImzrIUfISDT8aqeoNq?=
 =?us-ascii?Q?CekF39M9K0c5RCOS4hrTyIEZFxmz5kvqyb0AR/DvaJEw4RDXcfMWOgsUKT5L?=
 =?us-ascii?Q?Iddxh0Mk7zi1EZ3M6fpTeyYVme/JDATWvdy0LNpfs4meLg41/K2hqFFF/SfR?=
 =?us-ascii?Q?jCtae+Xrb6Idd/iP8XvqIzRMj6QAUpV56976Au6TR9doccAk5Qnnz6vIuNyu?=
 =?us-ascii?Q?oh96VJkpHuoo3Kn3oHw/WOTa6W9QoLVgkeQ2AWzxrxZY+NXsDNwv2JHDusMj?=
 =?us-ascii?Q?3H8AHBC+SalH72kuiT7uFhvYAdc59zX8HNzUAJmQ61GvqMnx13a3uOs8mPI5?=
 =?us-ascii?Q?GDWjwpO/DeumgHVrVk6jh0ByUeH95AQRVKeY6x8aMMqm8TNyL3h6gu4lbbhc?=
 =?us-ascii?Q?MpZE4E26q5Plrap6fyFqmAWuf08eSrR71tlPFWCBelKjXf8U3eIGbwn3Vza/?=
 =?us-ascii?Q?K2ybiPX3ZXfsWI/ai/jzouu0/Kz2W2M9re9GdPrqnDPK1tHlFGbjYF8nBfCv?=
 =?us-ascii?Q?TS4clPoPcxNvP8viXg8O5/haXmbjxDRkD547Jv7JKFnnY1cA8uuvaGG9JyCO?=
 =?us-ascii?Q?cDzrm2DHcbIM/3sA9Vpf5+XW5Hk5E3Vb9Wic6nLnF3JOTIMZvxDMGbrbOx0b?=
 =?us-ascii?Q?CGEa0hDohl66IpqC/VqFY/DVbzH7xMqBWgHBilq+UbhCAABCehlwv29VhMFZ?=
 =?us-ascii?Q?W8G3SXbtctq/M+eJU4nOgtmWUtKYzioRHZ1g1pae3pPYTmTiqGocTlc+0R/6?=
 =?us-ascii?Q?cAaBRUgaaCB5b6jlTV9VX+dbK8AarIjyD6u3VqjYd58WzNPHJgJxT8LaAFWt?=
 =?us-ascii?Q?BEDUFz0laMPKVA3CmaY0QUO+ruovUX2lcyAeP92W9JkaQD1YQSRcpUNZd4Ho?=
 =?us-ascii?Q?KaH0CJgcOaScWfUa3YVJgroN23a3WAUPYmHAxszKFJlm1m2DwGDlvqncDCK4?=
 =?us-ascii?Q?NCnspn7pZAV6RGb3/Eb5ZF+784pMyrAY47mcR8cA+ad1iG3eT3JzaKqKk7FQ?=
 =?us-ascii?Q?GIUljEBrFIMbfSKZof7Ykt5iV+t7AqIV+pCv3qzoEmXZZ19YJQPptutih7eg?=
 =?us-ascii?Q?qfZiYFoyEwoX8hwHh6oY5tVUobbX0ykWRARHUUrg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997843ec-4dac-44a5-72a1-08dd9f9e64c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:21:20.2083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyxxYDep7W6GYg9QCkvYcH+YW1hQf/N4eYyIYoXije8uBw3VK9C1KGJAKegNWJKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589

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
>

So enum acr_flags_t to enum acr_mode_t? Sure. Let me send a fixup.

Best Regards,
Yan, Zi
