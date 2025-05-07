Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251381E4AB
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746576158; cv=fail; b=rOXPT6Ad5H3+VsO4j8Ttt6Mg6BBfqQUbnH6xj7V+/Gpsh3Zu4AP80XyAAQlXmI7WiQ6ayPWfZ53IE0q9a4/45x6i64VMbuCV+c7hki4AqLQcF0zAcC5rRiweYqTC7xvj/+hNj69V6jrdJCoyq8uwn3NTauCcBmDxiV6CNfkJnoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746576158; c=relaxed/simple;
	bh=eI9kGOrIwGYIUAlaqRbf1dG7KSBicAzpZzzYHSdJP9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YtSzZMsfiG69XW0veooVvsFE+iX3mLEDnWNh00SOKmiVIQBaUfeFlYcECKJwEBAZlxMHDJE85qq97H+QbpBLff9g5fH0J3WTQxTE7NC9aXIKiemO8B87njV1noTTNUCzUXJIYkbMo49ICzLfzdparU2CWFcr5tKlPK0acjywrc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TcI2IGmy; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TcI2IGmy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYPv1GbF0fMdJxWn6jHFvuB3hH/PZNwPkLHKhqp0xItn3deccjRcJwRCC32AEljd7ZDc7kqOs1TuTW5sf3H7cIJ3nw1MoyPgK3og/GRpcLdgLMGbJ0GQSL6drs2fGrwk1A5NV1KyVnQ67ut42gYvLlJre+hliCHQi2MJv0plKHm2wL4r0VVEB9jPvYQvndOqKjXz4mhYOeEbXXh2kioLa6EWNmi3PVS9hsbGbuT04dQU7i66NtE7KvXxIf/HBgoxKHopHcihaXCY9suNwHgVUw3T4+DqHfibzKaXdmXGxhyFMKLk7vr7zxtql0PNM7vffJHXjNsw9nSmmx8qq4sw8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ODBQNC0QbTZi/lzEvw9FLeEmENzDsQJNUSYFANQjrs=;
 b=K2efXea+FwkPZV3nFpvoc4HLL1CYTrBOBNwbZAxLbU88sQh92vHLlSKnu5zcP8MCs49hiklU3lq+zdFvagAAgi00a/Q5nmRLU88pDroDk+t6JEN/iHqh3XZKYFjfGMSZ7ZGivveMtQYP7SjW0FEBkbDS/pi/nDMzLI5Q85DR/+Ya86cwO4ulJUFVESLC41SDBkQU/PjTJG6TT4b8d46y+RTpnA4Yjok3isNz5WcDIiqg0nBq7i7dRgmwMObolE8KUPMi+QgUtfFoFzUovGuNj/uQ65YsvyrzAiLHq6EbAFRTSpamnpCvoh6ZOxVKmYQgrOqsXVDQ1ijzjHSqO8spJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ODBQNC0QbTZi/lzEvw9FLeEmENzDsQJNUSYFANQjrs=;
 b=TcI2IGmy7mbn8WnDPnbKtMzJ6O08gwvxALMn+BTRoYFbuUKl77Z4Ka8p5m3a5LWgge9Tx3ZYKR5LvdybdyLiPlzhKZ5/aOc6oEAlh8OvPGfgjTI6JQ7BdA8nNPneotTAPegr0YMjCWYmSz58OglthXJrlZxd+TLUFOmtREIpPMSujqKaRO80rCw5miXIF9L1EWZT1pYxim1ifCLQ2zMBsavyppq/Qc48kgkxjhWECtYo7ksPRm+3y+0skZ5IWKZZhI0nZt53kMWXnG93pTSFa/BL3QvjsVeQ08swIIqmyXbLaYa8fRDxd37ako6+LRvipOQjtQh1gvIyoFWeorjYSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4201.namprd12.prod.outlook.com (2603:10b6:5:216::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Wed, 7 May 2025 00:02:30 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 00:02:30 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Juan Yescas <jyescas@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 06 May 2025 20:02:26 -0400
X-Mailer: MailMate (2.0r6254)
Message-ID: <563E02DD-473F-4076-B1F1-1AB110A6B952@nvidia.com>
In-Reply-To: <20250506165013.4d48314b6d52d76148cb51f2@linux-foundation.org>
References: <20250506002319.513795-1-jyescas@google.com>
 <20250506000133.ba44539dd517e4f54515751b@linux-foundation.org>
 <baeb1200-5293-4fe0-aa76-b1d41875af58@suse.cz>
 <20250506165013.4d48314b6d52d76148cb51f2@linux-foundation.org>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0428.namprd03.prod.outlook.com
 (2603:10b6:408:113::13) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4201:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9178e2-24f4-4b4f-95c9-08dd8cfa75a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W3yBxJUkXaBWlULU3k9ekoYPY4UzefAALW2uR43J0ehP6kOA1FM5qXBhjHkG?=
 =?us-ascii?Q?iMC79UFEhxjPeII2IQ+FFzYrsN/3KNt0kZ6h5egbxfz7ANTApCMBT21N+V83?=
 =?us-ascii?Q?9k8C8VQ394tC8iBkzOurq2JnnitC1BqDXzSal0NcqvnvLRY4K39RvQW+v+eT?=
 =?us-ascii?Q?2jSvi/vwSDcvzmgLd+weMVuYtjv2cOePX4BaOntNbnVvTTRvBtGlHmYBFPGs?=
 =?us-ascii?Q?IQCFozr/iEFuUBuHiNscewYb12VZ4ixsJ/+rg0s9e8q5qmkFR7IcZZQvsL2M?=
 =?us-ascii?Q?8S0vLdqOw8WDUnIRq6cwANW9VV3j+GTUVnt1QNDU/mhE0e6VeUUWtVbkRyiu?=
 =?us-ascii?Q?E3/ateEIYDNCHSvNHZ6Pb40L7Iu9zomnf/MM79Z5ZUssMGmw/gOfiuLUYgQG?=
 =?us-ascii?Q?bJTc4Igv0rqXc/gR6kGUIwAaYfOV3k3MbezdN/tsNthHF+r2NiBVDnAW0Lvt?=
 =?us-ascii?Q?5EvZXxZB86QCPdYbI9v3NVIbH85RKwOlS1uOcH/Ak6QgpJbS9MCimYgcSwSK?=
 =?us-ascii?Q?W250sC4AfVisNtpRfjHLXDP2QWc5PABkuNc6RO61CSk/HLh/qf29CrZ1+RJ2?=
 =?us-ascii?Q?qGX2H2YSt6verJetGLOSfaav1fnPNylQ+B46Wtmusri2jgFeHD2EwVhS95j7?=
 =?us-ascii?Q?UTx8i4Q682ScfsPaTA4Cf+0q22p3IivBZQed0qnS0BoPbN1lHVF2GphCOXD+?=
 =?us-ascii?Q?KCzqyzq6fzoThdRgRBertBv6khe/kpgYUqQOkJVnk8YBS5YrhYywlAE8bTGc?=
 =?us-ascii?Q?4HNr3SdTayG69yrVFK9p+R9KHV8H9xrhtFZIX1f+YiScnpAm51KLeymluvw2?=
 =?us-ascii?Q?i+C7IXa6zLUMc87RnszFDz5igDT4HPJi8jLb/IC5/lpTrtCRmi5Y3LMSekwe?=
 =?us-ascii?Q?2bsk9t5bHKk3+gOOzTOSKP/b4MYZnvePvqUrNOthPXbrZ+OFI4rqAv4fFrS5?=
 =?us-ascii?Q?ALLg1Ax++1cg3f17d1occIqWUtJ07X3tvGEEbgYe5/FFfU3ZM9pNZ/fBvGDT?=
 =?us-ascii?Q?ZXJahMSIJcg7E/Y81LyDr98819Nu+SD9COHtHQ0pTjdpEvbR7R0yw7zNlSkQ?=
 =?us-ascii?Q?uxd7A5i22lyjWmfEnt1W5skj0YkumbWAIoxJaXTYWMW3Dg9cH2dEe5Worj7y?=
 =?us-ascii?Q?AHmnSh1YYNAWV4IoZkmHONzKsXlWqBI55x4v+Nb8KuE7nsTGVDuT/iqYBW0p?=
 =?us-ascii?Q?f6iSeKmFal8TW5hkRpWELwqq8o2iUbP7HVClAYLiuvqxXMzxMvJwztAz1p8K?=
 =?us-ascii?Q?hu0kaNPo44mS6GbiEduxnmDNEB81ZuSgp1MRONargo3ohItRDpy033486pTe?=
 =?us-ascii?Q?WSVMvmRAEHSVcTQxLen/+lsYHSGcShbPm8B8EtAEocM5gX9eegyC3ZWGH7f/?=
 =?us-ascii?Q?XP5V9a0H+kRimUWqWGZK6ttCqIWhl9ZYi7rcVotyIJD57T0W6a7Ypsa6SauP?=
 =?us-ascii?Q?18WeIhAmleg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YgdD+c3ERcXxwYpuzNRN3xnjkGNbWORoeUTI3GoC3AtVNSZ05XI46D5+CpP8?=
 =?us-ascii?Q?QckpPO0Hwjn1C5pINRoPweL3RZs+6lDcpC4caipimY7hKCcO87jy2UyVpqOc?=
 =?us-ascii?Q?kUYkNh1X92TL+6owcHJTBY1CffnN6jld6pHDbcwaCUJQa9MuBozFsCFZq4rX?=
 =?us-ascii?Q?ZhWxmdYKcMRmqwU/Yj35TCGDdIwtwTs7myF49rImf2eocuo3nK4cs3wyTT24?=
 =?us-ascii?Q?DcErNiM3mzfyHUvfXJkotRgFt2hI2Ylojm5I1diDSLujoOhF0yHrSHPo5NGv?=
 =?us-ascii?Q?Z7qEhmf7W/pIy0rU5WVYdwW6zDnIWh2VlrdVLXvRwazJnJQ4NQMyO8a4H8wT?=
 =?us-ascii?Q?6fhAXkrkTQEP5o/iv0G/jCogxcHBw0zah2ppZYXDRyrVyhCHT7CpKMJVE04m?=
 =?us-ascii?Q?hXQR3cViyKGeN1d/y5T7JDB/AUs0CV284E1HPG2lm1EDk3IE1eAFNL9qown4?=
 =?us-ascii?Q?vIkQad4MdJ4fKGcno/J8/APFSHqQQq7p8uqtUV45aNPwOj10mzcAR6qtuFdL?=
 =?us-ascii?Q?7adZy87ZwRVG2od9poPf+55g1vUM1GTHpwL5xOc+VfCHHtpVSx+kxGI0qFDJ?=
 =?us-ascii?Q?jU5ydwF4y4Fu6eQeQlNi0P3bSJ4Pd/1rruZKEllmfDTduFudx3rUCsuTpefx?=
 =?us-ascii?Q?dUuPkmEvW50dF8mDLVF4Osw6Qs8Kg2/wg1irtEQiAazMhQMRtFrs3mcu+o8B?=
 =?us-ascii?Q?a7GFoZcbbfndU9AO3nLNxk8pZ+k3rxE5N+w8H8rTvnKq3hgik26wL+yQgqW6?=
 =?us-ascii?Q?XFmLfRU1rwKV85H+NG1Hm8MW6cJ4BINncT9qWGruZ9yb/T+CKlADSVpqcxZU?=
 =?us-ascii?Q?vN29dZgMRHZIGa29wGAMpg1a9+NUFEgeul6P+wGOSO9ZI9NwOH1zxWzN/x6z?=
 =?us-ascii?Q?ynpb4ra9ctB/3zuM/U+7bTmvyPyRITe4X5/x1vHDzdHBNTYMrzgZU0A780oH?=
 =?us-ascii?Q?ODIZiQy6UOVOA3vko6gjadLQV6DuACRVaXkLSL6c2OtQmW4Uq8hEzWprnyXg?=
 =?us-ascii?Q?Ag/EZu1mtG89mhtpklrrx5HHBvgRwU5jNX6Vgv9F63NQx679WpyQvDXAiErw?=
 =?us-ascii?Q?58F8CXkSyVmdP/7NkVWLd0nYRl51gigj6d1cT/KeX7GlisLIIIoUzjNaTNHB?=
 =?us-ascii?Q?Oc7coX0LdMS0nN2bvAp8rGR+nUeWQId59RXRUybP+xmlypU2X7eCrPDWzkqW?=
 =?us-ascii?Q?yH6brWdW9ATdXEMR2Dq2XT8h/JQk9yXb0BkLkIR7DadELBu1xzeRCj7xU380?=
 =?us-ascii?Q?CMsP9Yj0NvF/qYXFl02bS6JQG6S/dO472WxaXRpnwADTADQj3abz/vwFmgT8?=
 =?us-ascii?Q?WYc3fX+jbsZdrayfye6oyPUdzXkWDWSEbUK6S/qjtS1hRJmKBLIlnzAsj60/?=
 =?us-ascii?Q?92+AdKLd5fkb47fTJ7HVNGFghVml0kDHYPpuw5ncZyB0vx2AeODJOv903ZhX?=
 =?us-ascii?Q?1Pc7rF8OXKvstH9zYHfXd/wkv0OcTAX+rfYzzfMTcVEEbF73Mpl0gvv8iTnO?=
 =?us-ascii?Q?zVZoQVvWjaB9gJeUmvZqr8Q+NBIM2YzR4DO+h2dGH+q95MvmHVuwnbflnmtg?=
 =?us-ascii?Q?1EKKWDwurW3ZK2mlL04+ZxmRBtrVeuE3C/x762Qs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9178e2-24f4-4b4f-95c9-08dd8cfa75a5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 00:02:30.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJunfSJbj/ft3Hwy3kssh8h6m1LDBgMmZ8r7COxI3CAhwITs75JNGm2Mnu5uBcQo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4201

On 6 May 2025, at 19:50, Andrew Morton wrote:

> On Tue, 6 May 2025 14:48:19 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
>
>>>> +config PAGE_BLOCK_ORDER
>>>> +	int "Page Block Order"
>>>> +	range 1 10 if !ARCH_FORCE_MAX_ORDER
>>>> +	default 10 if !ARCH_FORCE_MAX_ORDER
>>>> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>>> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>>
>>> Do we really need to do this arithmetic within Kconfig?  Would it be
>>> cleaner to do this at runtime, presumably when calculating
>>> pageblock_order?
>>
>> AFAIK pageblock_order is compile-time constant.
>
> So it is.  Why the heck did we make it lower case?
>
> And pageblock_nr_pages.

Because when CONFIG_HUGETLB_PAGE_SIZE_VARIABLE, pageblock_order
is a variable and set at boot (see set_pageblock_order() in mm_init.c ).
So its type is Kconfig dependent.

--
Best Regards,
Yan, Zi
