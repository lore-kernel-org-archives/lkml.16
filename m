Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB2265CD4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829936; cv=fail; b=gt9GFL67QNf6fY1/NLV5oKG1K0o5ICXznRUBTd/AFUPI5Dm9275QqyYP66IF0JRjDK5LbL6Z65CCrUbm+7gaDg6QLdTCDDg6v8vRTZogKa3ockT+TM7FNqvgB4TIraewwZ1N9jOiyKoQ/iBhjnuCG50mAPN7p9MAzwG1MHYqICw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829936; c=relaxed/simple;
	bh=YM7leiAiUgxPOxbNFaPfFaVtKwhWiZn+rK0qeQvjAEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jS3ZC0Xnk1Q4IJxUB8RgcWIQpGGibZHmNnjJds/VgTmjWd3CxS0TaTiAZcuRHiB4JAYOk8Cv8RxbQgZmejuyn9s8cXpfbj3BsistQyD07/RZ9XJlQJoBojw1wUYd6ZYJHeYxsH5xtHYi/5/Yywty1Fw6kfkCtNGWE6wVoWJm5S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jLQtQSpQ; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jLQtQSpQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+rErSSzH49lSASCQqH6EZsgnJatWFwmjuYB6UPJvVz6d4d4qbx/Ta/HOgd54aZUsNECns8iK/kuhKT+oIk7RbGUFYM/Gr5lZBGRlj5qnP5jwTGkaafkYYLQwG8RRdYKTJ2q+xC2Xn+fsnz6+VLCeTgycX59HrTEbUADzr2Ox51mwXazmxLQRNdn3X7OlL8zAoessonZZ5BOC0IGPxBrPAP2U6vQg+SI3N0qZp6VeVFVb/5n29vj1gQnnv2tJ2MwlHTJFriGwMLKfFGfSuXGYcA2aklWp/NvKNiBoSdOxHpMQTmEB1LB2ilNY/PvDXpGSubS4d8tFjX/Yq/5vNEDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhKSwLeDLM0w1wQxvsc/kttMswfVMDJiPlHkWbhIreI=;
 b=EppYqG3lOKJMT4LJMNP5Gepr+WhbRWNY8csM2Tk8shH6UBR47dWtBxpwzM0PI9OdmN5AefNlLjAKtoRQ5ytoXhQ2SMTl3OWeoAf6A3KclhEt0DYztNAkWvGAI2unvuLlWr/nZwUQWuWQl5Gy/+HCNXS11cvZ7mpoKNDm3KKzr02SvA2+uiDvsXnHz62mqLhfcyw63KcrmwRKDa9TdRJ4rpM/K2ZiQ3eSKaPvEnwi3qJT0JtgiP2eP4wyMaw4BzfEHvqzu3UbRHAto5qVAmiwFL6vPXRHEvqjrlva34TNRC/CZSMZixxlRMtpi8524aC0mx0+50gb7zZ9v6SooJotlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhKSwLeDLM0w1wQxvsc/kttMswfVMDJiPlHkWbhIreI=;
 b=jLQtQSpQ4IAXMifVbwj1Xh+BIc5K3giv/xgV80DZ+mD5mrk8R9DI5dajz/a9DYfbqg+WBqiBNX+vUuSb0gPs9Uz9NDfZq9WQLW6eNU3N8E4aLqw5hmEU9G80mGDRiO6O9T5xaufZ+9eXMl3Zb9QeovT2DkdYdVGZFekJ/HjXjkyYZP/1rbnCxwFicGWoQKdLvFFntpd8QWVUcTbv9zyxgkQrvE/62q405XCZsBDi86Kfnvjq1iL4pDiDeRoBzZu+WO477yBob7rZNS6f5SnuBEyajtjnYiyP9cnvJ5wKK/yAE9tukD0S6XpQqcyynKyj8zTlXzah8Gu3fK4cj3ztQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Wed, 21 May 2025 12:18:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:18:44 +0000
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
Subject: Re: [PATCH v4 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Wed, 21 May 2025 08:18:41 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <45154D49-0EE6-439D-B169-35864F8EAF5A@nvidia.com>
In-Reply-To: <e9b85836-b4d9-4678-a59b-dbaf916fa1c5@redhat.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-2-ziy@nvidia.com>
 <506798aa-0280-4f63-9c0e-d5f2f5d58c3c@redhat.com>
 <166E73A3-02CE-4023-AE0E-022C9C618C33@nvidia.com>
 <a8dbfbf6-97e3-4a69-a1f5-a32693e46730@redhat.com>
 <CA27CAF4-DD4B-4350-90A6-AE9A808F05C0@nvidia.com>
 <c8265d22-5cbb-4211-b91d-87965b8505e2@redhat.com>
 <B21E6F5D-C824-4BB8-974D-A1BA313880EB@nvidia.com>
 <e9b85836-b4d9-4678-a59b-dbaf916fa1c5@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0312.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: df205838-8a32-4844-7a45-08dd9861a164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AFXynvn/RNexDKb7gyrmlf2e1+oJ4f+va8qI5B1xtQ7QJ/VeImwswqUiHL2p?=
 =?us-ascii?Q?pOmX/RUFMl/XQQ+GFmRANXemWCpCQ152bSJKE4kt8CoRcT1/PncYCN//MjOv?=
 =?us-ascii?Q?w6FahBAt0JhaX2aTfTZ+kqqr29tRZIHGb1UBf6XqIc9qx6J8dkLv0Meatr9a?=
 =?us-ascii?Q?Sy6rIDjHm7UBIe+Npjz0K0oC+21kaApUYy328qSaVoAUVXfBkJanzVDEmkeB?=
 =?us-ascii?Q?bXQS86IiUEvNGm7aI7Vta11R6cv0SYvRBpMATGPFN/5YtlNt01G/eV7EA7KZ?=
 =?us-ascii?Q?cKP7315kdj2IBYelftcaPk9sY0IF5Ebgo2hAlXt2ir3cvmkMkK0tcFtNJWyv?=
 =?us-ascii?Q?wT8F6JV+f3PkoPNss27q9wiz/ZthTJ9LggSH+IgQbI45y484BIT8Ap9p2Ym8?=
 =?us-ascii?Q?JKJzAMhPaISwTHFZO6SK+wxe5OnCzkSYQLJaD6A7cF+amMe6FptnPI//ZuyI?=
 =?us-ascii?Q?Z5c8t86jK+oCqG5na5M/LA7U/IM/b7Jdw+d7s5E77lPJV/RFtWtPcWOUIFYn?=
 =?us-ascii?Q?3ab/JzRmZm39LRBWBRbeCPmiSCUFqEvrsEltM9059jT5eaWFygX+3hXvvO/D?=
 =?us-ascii?Q?+VISTwMw45Q6EsaAhzl/k9R5u7zkfryafn77tpNV3JkORR9ihqprsheoPwPB?=
 =?us-ascii?Q?jh3kl/wdAF9mB6ATCBoSMtqwQmLzkgabT6coCFgyQgcVruK1jcyzoUBLTk2L?=
 =?us-ascii?Q?7csEGswLOmTTViWldWv0dvq+DN74+T+C+r6ASLiQZOR9zl8gxCOfrjjf8l1y?=
 =?us-ascii?Q?6pSSoOfz4OdndLgDNkQ2Um+XucrmNjo/vNcVyf9SXcdP8E3ezQ+rzUjz1YMz?=
 =?us-ascii?Q?v1QhjaC4OhiO9WbRNBaKLo96PILRCVwUJjPgsJ5M2zmtwgPlC56WSBgLjkgP?=
 =?us-ascii?Q?xZdFXXO0tlBpmZGwIw7eWwFqEH0N7Pgx1k6iiw5HfvRbDHO63IwxGYSQeXJO?=
 =?us-ascii?Q?LJ/tpIRbTOKk+9NHb72EpEgQvG8etdQed9kBTOizTzZ9mh3Z3hrUTtRyfsRV?=
 =?us-ascii?Q?pdthyQI/WnklUnMNwS82OAJ2EiI1rFeBohPtfMsQGkfALfjBBQwY0+gSd85X?=
 =?us-ascii?Q?XLys6dtYT/mlAtVyyiuRlOmDQO7Q3iP/3O8z1iE+kwvJBoGdw/ogF9l0JF6U?=
 =?us-ascii?Q?OpfrxnVpwKisz/HssKAXncOuJIHjrG5spTgH1BX1MHbnk/6BjgKv0AyrLC8C?=
 =?us-ascii?Q?ODXbBjmfKKrBJtkldvJa1zgYVGLkD7qbLVRs8JROOF98ei6YSqF/wbrXoRZG?=
 =?us-ascii?Q?dWx7OI7nOp37D+ZJAHA1Hc2lxgdz0pkLmaIbPOG0gQrilLJrPIA0ppoYcEX6?=
 =?us-ascii?Q?IIMlM5hJKiezk58rB3NHorjn5sKyglSp7CjDMJ+fOjRjikKGELsXMgnG4607?=
 =?us-ascii?Q?WAXbQHfwePpWnLxjsoDFMyip6s4ITQFDbMbm8SGk21TurO+0Xs9slyUL13NW?=
 =?us-ascii?Q?5oUkYJ4jdFo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d+1B/Bx2tJ04Vloeba6t/mKqgCeO99xtiNagzwQxAsFcffQAfFXzJLa5An0a?=
 =?us-ascii?Q?WRdz29oHJn7C+2i9fn7ZZaY+5ALP0g1s0Xdh39dYRJWyG+Zu8Dzg3Qg1uZo+?=
 =?us-ascii?Q?2eFIKtpd1IL5yto5rNsomQ+OwDuE6cF4kPOUOcTpuu9DlQJ4hUlL7qipw6Qw?=
 =?us-ascii?Q?aMJ1PKtjIBWNVkC+ZbQMCCpRbwh16MTtBiiRUaHcrkY8k9xwg8gFtLniw+CI?=
 =?us-ascii?Q?CmXcRCNowMIn+zX4UVKT/4JUUPLSl+EPlqoW1P281g6uhk4Z9sIOCgfDIU3R?=
 =?us-ascii?Q?D7Sdq0P6vUqXaC1UnQyAp6xhPGdYhaOrvovRSD8ceHRetFUlYsMF26NICRtg?=
 =?us-ascii?Q?LgmM1CBSR0AVC2KD0yjQ1869v+dwX2LyJgTylj9GQ/FpAAxW0zHt5Wrq41ZA?=
 =?us-ascii?Q?Utcvw3gzfasH4A+79U5EBQtN9uvVym9/YskI7uTJ5ZuBx1t1dHvtSxHj7GoV?=
 =?us-ascii?Q?lp1Yj9SdkzX0tDQSAkU667wibJGvJlf39j3teY53czVvjbUu52GvCIkkV7lq?=
 =?us-ascii?Q?IPXxwGcJnw7yNBazC55mnwjGWe2U/SAfF4GHJg70PFqLqiXFXum2zJEY84Xb?=
 =?us-ascii?Q?fTMl/QO8sRxE5HIq378ftWArgr/mPg0qu0fJgMQO/m3QMeJ+o6YUo09bCga9?=
 =?us-ascii?Q?M8Xs65MV/ReDwrtYdEylWI6ne7yruTw2WNLm9m87cxNaVupmHvtDOgkKwy7t?=
 =?us-ascii?Q?efujwbru1VEOufpk6kAfGttdLaKB5Otz1kWXBoOH8HUXELRF+Yf7zUgdYjZk?=
 =?us-ascii?Q?cItjJJrDg3cexz7ALADEibe+6tPcIqFWgIONpg3iQtY9Qg3Fh32ga6bjZddb?=
 =?us-ascii?Q?U72EKs7SnrMxpVANT2LOkqC/HL8MpwvSyZOelXmt/Se7f1eqsnFAEsHylyVq?=
 =?us-ascii?Q?n+wKAUyyuwoLg2c/Qcmv/B6uOZK7Z2XmVGhtoI7Ea+gQz3goHFr6kzDSz++g?=
 =?us-ascii?Q?o4jpK1tIbBzGP003Cm7rLu/Sf5T2TZ5xlN54s4ezH7e9AtvYqO4DuEut7OT+?=
 =?us-ascii?Q?kX+auobyejtAH5v7XamhWjJKr5v8l1zFWdSj7saLIZjevZzDABl8VAvnQr9a?=
 =?us-ascii?Q?GMaEnbTYdaAVLlJyy5q8weINftpJdGQ5ECONSixSt96aMPalsUtpKCwwst5e?=
 =?us-ascii?Q?j2BKwiHSRlgOn2zYyKUeodAg1p8TLKG9NwowZ76cBgLAt28cLywUHSWQ3ne6?=
 =?us-ascii?Q?J6I+P2fJFIcqLVJmWWQ8cww3RQjPiXThHmMOeTjcCTnPOwfw2Z4C0HO1vMLR?=
 =?us-ascii?Q?gUiuNmN+Aki4L3iyRUuzl9sVPO5+t4JaqvX5lMk/ECRrkT/+Zoe9h1SjXwI2?=
 =?us-ascii?Q?0pG+ohmNrV289JAZt6CD4tNV6vmjW626AG/Xud3tLwFfvBCcqoOEhwxbXOZs?=
 =?us-ascii?Q?aV/QXiUcD6tbGCPBRCaXahWOUcXEvyMpL+xYCdHCy26NZ4LgBjcPb00dgKed?=
 =?us-ascii?Q?h6YGxJGXjcc4u3hP6fncZCOZ5f0pf+iyVmU54gb5iqiWypNLorOCMx27ZUpx?=
 =?us-ascii?Q?/zSkm7uuz4NnEndoIKzjk+n+M26MRSAfFLKQ59PxUmi1Y578YDPcqaCAOVcl?=
 =?us-ascii?Q?TECsxCRJWMZDeBHFwIU3i0NXc1vDGENs49nY61Tr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df205838-8a32-4844-7a45-08dd9861a164
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:18:44.4985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QT8qmVdlxRbtRzd86Y94fg9aGx/2liSRk0YIOUv43zeG915cUL2kkg6MdkVdRq5e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083

On 21 May 2025, at 8:11, David Hildenbrand wrote:

> On 21.05.25 14:00, Zi Yan wrote:
>> On 21 May 2025, at 7:57, David Hildenbrand wrote:
>>
>>> On 21.05.25 13:16, Zi Yan wrote:
>>>> On 19 May 2025, at 12:42, David Hildenbrand wrote:
>>>>
>>>>>>>> +#ifdef CONFIG_MEMORY_ISOLATION
>>>>>>>> +	if (flags & PB_migrate_isolate_bit)
>>>>>>>> +		return MIGRATE_ISOLATE;
>>>>>>>> +#endif
>>>>>>>
>>>>>>> If you call get_pfnblock_flags_mask() with MIGRATETYPE_MASK, how =
could you ever get PB_migrate_isolate_bit?
>>>>>>
>>>>>> MIGRATETYPE_MASK is ((BIT(PB_migratetype_bits) - 1) | PB_migrate_i=
solate_bit),
>>>>>> so it gets PB_migrate_isolate_bit.
>>>>>>
>>>>>
>>>>> Oh ... that's confusing.
>>>>>
>>>>>>>
>>>>>>>
>>>>>>> I think what we should do is
>>>>>>>
>>>>>>> 1) Rename get_pfnblock_flags_mask() to get_pfnblock_flags()
>>>>>>>
>>>>>>> 2) Remove the mask parameter
>>>>>>>
>>>>>>> 3) Perform the masking in all callers.
>>>>>>
>>>>>> get_pfnblock_flags_mask() is also used by get_pageblock_skip() to
>>>>>> get PB_migrate_skip. I do not think we want to include PB_migrate_=
skip
>>>>>> in the mask to confuse readers.
>>>>>
>>>>> The masking will be handled in the caller.
>>>>>
>>>>> So get_pageblock_skip() would essentially do a
>>>>>
>>>>> return get_pfnblock_flags() & PB_migrate_skip_bit;
>>>>>
>>>>> etc.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Maybe, we should convert set_pfnblock_flags_mask() to
>>>>>>>
>>>>>>> void set_clear_pfnblock_flags(struct page *page, unsigned long
>>>>>>> 			      set_flags, unsigned long clear_flags);
>>>>>>>
>>>>>>> And better, splitting it up (or providing helpers)
>>>>>>>
>>>>>>> set_pfnblock_flags(struct page *page, unsigned long flags);
>>>>>>> clear_pfnblock_flags(struct page *page, unsigned long flags);
>>>>>>>
>>>>>>>
>>>>>>> This implies some more code cleanups first that make the code eas=
ier to extend.
>>>>>>>
>>>>>>
>>>>>> The same due to PB_migrate_skip.
>>>>>>
>>>>>> Based on your suggestion, we could make {set,get}_pfnblock_flags_m=
ask()
>>>>>> internal APIs by prepending "__". They are only used by the new
>>>>>> {get, set, clear}_pfnblock_flags() and {get, set, clear}_pageblock=
_{skip, isolate}().
>>>>>> Then use {get, set, clear}_pfnblock_flags() for all migratetype op=
erations.
>>>>>>
>>>>>> WDYT?
>>>>>
>>>>> In general, lgtm. I just hope we can avoid the "_mask" part and jus=
t handle it in these functions directly?
>>>>
>>>> After implementing {get, set, clear}_pfnblock_flags(), I find that
>>>> get_pfnblock_flags() is easy like you wrote above, but set and clear=
 are not,
>>>> since migratetype and skip/isolate bits are in the same word, meanin=
g
>>>> I will need to first read them out, change the field, then write the=
m back.
>>>
>>> Like existing set_pfnblock_flags_mask() I guess, with the try_cmpxchg=
() loop.
>>
>> Are you saying I duplicate the code in set_pfnblock_flags_mask() to im=
plement
>> set_pfnblock_flags()? Or just replace set_pfnblock_flags_mask() entire=
ly?
>
> The latter as possible.
>
>>
>>>
>>>> But it will cause inconsistency if there is a parallel writer to the=
 same
>>>> word. So for set and clear, mask is required.
>>>>
>>>> I can try to implement {get, set, clear}_pfnblock_bits(page,pfn, bit=
s) to
>>>> only handle standalone bits by using the given @bits as the mask and=

>>>> {set,get}_pageblock_migratetype() still use the mask.
>>>
>>> We'd still have to do the try_cmpxchg() when dealing with multiple bi=
ts, right?
>>>
>>> For single bits, we could just use set_bit() etc.
>>
>> Mel moved from set_bit() to try_cmpxchg() a word for performance reaso=
n. I am
>> not sure we want to move back.
>
> In e58469bafd05 we moved from multiple set_bit etc to a cmpxchange.
>
> -       for (; start_bitidx <=3D end_bitidx; start_bitidx++, value <<=3D=
 1)
> -               if (flags & value)
> -                       __set_bit(bitidx + start_bitidx, bitmap);
> -               else
> -                       __clear_bit(bitidx + start_bitidx, bitmap);
>
>
> However, when only setting/clearing a single bit (e.g., isolated), set_=
bit etc should be much cheaper.
>
> For multiple bits, the existing try_cmpxchg should be kept IMHO.

Yes, I was thinking about that too. Let me do that as a standalone cleanu=
p series
first, then resend this one afterwards.
--
Best Regards,
Yan, Zi
