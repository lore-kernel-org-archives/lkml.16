Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD2E248862
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931925; cv=fail; b=mTgQvCfdaF6m7xFxvcz+k9608qqgqr8BZslTd8UvFGZp3jh7QimiJMNLnHsOiSQcyCrOrk7W8lRU65AOsFiinXSPTc+nOPEioaIHoImTJRvp23KoPPxeRn19Hii4DM9gSwY7j1R1xSMifY8UKEZCd4zAGGLT2G7XfRhd/KVALmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931925; c=relaxed/simple;
	bh=xuwj4r9UpRj6s3bE3C6nQGhwU+KLxMYZ2p2V6kOrUOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rb/XLimEUNldc/2avVnSb8NZMgKZiUtvAT1ct6tHqDyqvQdGydo0gNtBYoBusiBU/B44wkFf8DKw2AjRVyFyTvofvMcSNy/ilZrPrS6Td1DOIkTCwWyEtwkTOCkODC+pcuC2qGYcoNTGslErJVtJG0qsSRHjZgxqwM2qv7/66Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k1FzNxkC; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k1FzNxkC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUdHYpxJmaem0rD/DJCcgZH4e6ChR0BiMf7YzhXVsM11UNN9TianvMXyTgthme+vqsd0GfWlLdTqgFvl+HOJ4HrdjK4O9GVOhqKcsI4gPO+CygeRpueoxoZKANwncMAbZup9px3pRc24qMJQsWXmrIWle9EMHdj2ic7QTi0LdXgOCnExDiIGCABUYSvBj4cjeJPXWyen+D6XqWJCZD2kKsp8k0gN30bkTxfiDHzG4CBmcWWi/bTCEwZRLf+ELOJmdK5De9JqOkQwL7p9/P0S5x664lIArXGliADfJYJXFocuzc0DYaayc6/50grxmkGO7sE85P99mkhPnb1gAud9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuwj4r9UpRj6s3bE3C6nQGhwU+KLxMYZ2p2V6kOrUOc=;
 b=T2OhEji9EqlJcoGrBs0W+/wFL3AB+J81rlxVVopOME7RKz16sfU+FC4ASw/WvMDIIiKlmNxduzZgvCFIx6nXnoXTWNRvqhjZT2pWcYwwg2DKK7SS5dSDpguwo59Dsuhx+I3u2hgEv3L7xMqX9W76MbqlETIw5BCq7PXKXtFOPHXk3V5MPuNWxtU4NG9uJQ2y13a07bxFb3CnOFZ4Pl4yg5M/1/BgeTPj6XoIRru6cFKcwE6RxtwqFSU+BN1R5BUW5GnNM2A4lV90ZrwqyNz+B8gbMAWt9QkfpknieEaF7hTimACFS2gOLqiB1KdMWa6ahW+DMFq8dd6IRxff1CC9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuwj4r9UpRj6s3bE3C6nQGhwU+KLxMYZ2p2V6kOrUOc=;
 b=k1FzNxkCUfT7R1O7fDRkekQIoLdLQK+/4VjNhvJVDbr4SJ0zNJnfSKDK2Au4yhuTHgRqS0omRJMMZuz6z2jWGeb6t/RFV5p6V9IhjVzr6Q7wmg75WIVFct9cufdQXz/xzngdPw8d2+PYMXVBT2kV0A+3GMpK7mbU+77Of3LEC3NXt9eiwi941v85noVJx3ZR2RNIoLK0hAmDh3pcJ4eAWQIpOOvoLxbnJL5JXnZRBGgYjlpdEe7/ns2HpTBZfkbIQrcS1qG02ARiGO54BhagQJlZJe9IXvj0Hh+f5LSU/6WFaNq17npN3bjq18BRAhC3olDqEAuIf6v/7j0lLVh4Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 16:38:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:38:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
 mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
 riel@surriel.com, rientjes@google.com, sj@kernel.org, weixugc@google.com,
 willy@infradead.org, ying.huang@linux.alibaba.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Date: Thu, 22 May 2025 12:38:21 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
In-Reply-To: <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
 <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
 <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:208:32e::28) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db762e1-4111-4ded-979d-08dd994f19aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pXQ5wxtj7/AEuIQMjdagjx9n5nTA5VmPurf8FABwO64YUdnr/UB83/44q4p1?=
 =?us-ascii?Q?jr462b1nxHkeZtvqj+4X8moTFYV3/U2OX122PnNGrHF9sRgFyRt6beZlTseE?=
 =?us-ascii?Q?N5aFYRxRaZqh98PpbOjO0aabrZ+dlbkyYnoQFKZuUVuKFniKQs0Ve28OQ+Dn?=
 =?us-ascii?Q?AqKx/qOMa5ZcRr7X1/9UeSEbkVKaLdBkoAKZhq4z97uwBJxqc9Ka8hnsvGx3?=
 =?us-ascii?Q?BcvJ0QFuYLLMrFyPgdliQDAtyHsiWAEFAJngtwIbUjL+emsBPWDpXKCu5OBY?=
 =?us-ascii?Q?3hlFPp21+zKEpM+ffF0LZsIVJ/pXHCTBpjkNFmIZFHN6Hx+1eazBuTVleLV4?=
 =?us-ascii?Q?fR+ntt5TKQyiOLw2omsO+Vt3FO0xRdB1cpPVEoIPC/UDQt4DMOJqf2/GcvsJ?=
 =?us-ascii?Q?cAaqiGVxeSLurYY4FlXlrUclhnr4Nw5bvwbvDamQYWEeHseSrIpg1Kq1hNJa?=
 =?us-ascii?Q?8BVOPnLczsKpAvMF+TPw97bX5hP+GRXKWdVuthh5BZLKybW1+TLml2reSqYI?=
 =?us-ascii?Q?ZDiqBBZt2t30x1iqcSn+3KtSXOAIPhtgzGoEh++z/TimozUQTWoSVAhjbSk/?=
 =?us-ascii?Q?YBNHi9ZxXYoEUUggUKGLQmr4GA+lrfkujFiI0456gKC4hAEOc3zuuNvTdjgT?=
 =?us-ascii?Q?1aOrvzx07SkkfrIYRfDL7d7IPYp0TaSsJvqrvgs6mJR8605IcksDjzDNgu39?=
 =?us-ascii?Q?Kq4GwRN9BAdepaDKppgp3rrRbhDkqtnd3swD9GsKqNk9X22G9iVBK1m5yVKE?=
 =?us-ascii?Q?sEo5byJlPnd7+wTVMnTMcx3U/rN51hM92S/lg+519yHUnZN5FMKy3bTbN+3t?=
 =?us-ascii?Q?iCr5CDfCJVi98fDKdGeZwhVWeAldupyKCFrxUuSMvNlgohkVi44Nz2n853G1?=
 =?us-ascii?Q?dX9GlN1knZE5HjzdMrWEzIZNHz1K1soasO9o52JwxHDPG7BQOJjjwwc4oDG9?=
 =?us-ascii?Q?A+/g4QPpoSMOJ7GvCjK5n4Ax41qeMCInL3zCwYlP10iKBO1/9JexhmQHcnuF?=
 =?us-ascii?Q?r4U2Zi8Is67zfoV+pDmlxL1/uucKa0DIt8ufiw8ekwjLXz++g4SH9QS0wlr3?=
 =?us-ascii?Q?XETYdAtHh4xs3XMumsNHaEPXOXyn4n9KrDmW0l7Pv88CQX38G5ab6ENmm3u7?=
 =?us-ascii?Q?baVm1Sr3geIHsVsIGzgfGfDnocVvZ3y9YsmfLmHxQiI0Yz52SMhfJwi9Qc4E?=
 =?us-ascii?Q?UBxYAipzGxNz5K/9UUDNiOMctUpsuOEdKHnnkw8asGWLE5+eMes9pJA4mzDC?=
 =?us-ascii?Q?b2/Rkszf7PBUEgLPSx6uQjXWycgf3zUuNZfRSrByv/eZXSAsZwkXCwjpJ61y?=
 =?us-ascii?Q?2m/exH6rdb4KS4nrPmkSzbaW+jfIeOWZ3pDUY5WEYqdYNgseCKvMmvSneEhJ?=
 =?us-ascii?Q?4Qprs1uLk9oaZ7qSwZJ2i4+LWGj21YAe/U/JIn5+DYJ9mK/dJ6JUs9lE9jj1?=
 =?us-ascii?Q?Lv4asJtCWa8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hpqLFi97yW6N/CyPnhVv0Onw8hFDXKflEiM3EQIxZ28OdeHbIvUiTmfH/JtY?=
 =?us-ascii?Q?Y6kEpx2ppAv1ZDx/OHSuFSEtNR2m0eZaVBV32IfbiG4OsY6rlGDL6olZ+oAk?=
 =?us-ascii?Q?OIirVCjnk+tVVZNPYxV8Dl7Q1pKv24+bXpydouDxcOjyGi+WuCoulcGulpWd?=
 =?us-ascii?Q?aLn1koSYuVrShCTcMwQKi3We2tEwfEkAn8daNu+ZoqbU4s5jWfcYelI84Apb?=
 =?us-ascii?Q?G+Y9gMir42VvXjj1KYl39qrdFEu6/OIzix1T43CvAwpQMeHEEJEMdAjYY1Yj?=
 =?us-ascii?Q?mvCZg/Io73cW7q9UKbtsBfJCluSkvVFcwR8vZzHe+SfoQgFyiy0HHc/r7oH4?=
 =?us-ascii?Q?s01Mf+hIYNw4tNi/dbL/VbVLXVBy2WvjHVM4yj+YuRozhG2xdtpYxaKp7cj1?=
 =?us-ascii?Q?OpkkhDaP1QoBEnov4g4w4p9EZoMfw/iPb5xlskY41w5hsjuay1XzdtQfTcFe?=
 =?us-ascii?Q?X2zXQHEc3VOCeuzVWbcOK6FpYXlg0nSkUXml8qH8e/yfniqPzHPOks9YBcoR?=
 =?us-ascii?Q?wKOty+PP6eIiXe5fkM/GKOWMXY6NgbAP0XIF1uNSvY/JlcnfnJoLlfFqkMCc?=
 =?us-ascii?Q?6qaOX8iDI8Q7HR8SFJMPrPbSeyPGzzYSb20cRQSzTQ2Q2OC1CNJYUhez2jqb?=
 =?us-ascii?Q?+FRAtfg9gAwjEZiT/LHtqknrDfiZMr7S8mKh1ORkcG6kGQd0NXD6DwO+pwiS?=
 =?us-ascii?Q?KreYpkZrw6PVb22aXoW8PTXvIdjdttLDR6mQdo8ZE+Aee9374xveFmI77dym?=
 =?us-ascii?Q?pfRJ2RIWF/dFtvvMsbncGtDz3f4jz5qz9KYXxXhCx++F6lttt0T2aGQxTQtO?=
 =?us-ascii?Q?juwJIUICa9oekwUiCpgDErDDBu97mRjqj0BoI/Afx2IdsWVQ8QIo1KvEIyjH?=
 =?us-ascii?Q?dxCw5tvQJHOH3Fcd80hkaBN1VyVYOG8iP0OkzdC7BqC04e4RmP2AQ8JjMHYS?=
 =?us-ascii?Q?eXk6MrrBeRwG4wRZuw0cNqAJoEqLe91ZzNVfGvGXCmOstJJm0DhYjIVs/9Np?=
 =?us-ascii?Q?tpuDbiC5g8L8JbheALNZFTim7qlmhEZSubjDfM3+dArJigy5GUi34cIWVPWS?=
 =?us-ascii?Q?MX1JRQctCMPSTqQyezoIBGdoO1pvArURi7RE48sO+tzY1k/lL/7MJZUj8ECp?=
 =?us-ascii?Q?ZKI+at4743uM8U62sFYCUjMI+WB7MiG79Ur7fWNiwcJsaWO3haPgLKsJJbXK?=
 =?us-ascii?Q?JNKmrhtUmLB+HZOPj355Sr9dUHOTv3Igr2g2hpiad2XLYtjPC28n4lkWv652?=
 =?us-ascii?Q?PwfyrxnzS/apREtg6e+k4nKodPhiJ5mtdhRpqSB3pwYBeZL9Hbx+BG/F9nU7?=
 =?us-ascii?Q?KRPivIu2seKc07UaA+nHd2w8uGSkXlkQBK3d1s2oaGkB7xOTv/NuWAz9SnUi?=
 =?us-ascii?Q?CAhJs7I6jpcNf/r1Uvvm48F4nkNzLPjtyZcdkMFA3w74D4e2wUqB0BOmS5OM?=
 =?us-ascii?Q?SPFnON/J1f9yrlqeQRxGqLSvibf5bc6bk/eauHW1cBuvbEQRI4PPHbv0yEl/?=
 =?us-ascii?Q?0KlumJWCZ5vCNGvOKMNYsX+E3R6lf61vfCCT7tcrOE7DplGZwdD1b+ZZkmYv?=
 =?us-ascii?Q?bRjNUYnA/RmXwOAaHsCR9KzQ32r89P9ylqA3Enwe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db762e1-4111-4ded-979d-08dd994f19aa
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:38:38.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RK6XS1dysLylgu9S5m126OkszjWpovu8xJ28eksmGpxlodLFLYEv2p4HcKTBt4jE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258

On 22 May 2025, at 12:26, David Hildenbrand wrote:

> On 22.05.25 18:24, Zi Yan wrote:
>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>
>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>> Currently the folios identified as misplaced by the NUMA
>>>> balancing sub-system are migrated one by one from the NUMA
>>>> hint fault handler as and when they are identified as
>>>> misplaced.
>>>>
>>>> Instead of such singe folio migrations, batch them and
>>>> migrate them at once.
>>>>
>>>> Identified misplaced folios are isolated and stored in
>>>> a per-task list. A new task_work is queued from task tick
>>>> handler to migrate them in batches. Migration is done
>>>> periodically or if pending number of isolated foios exceeds
>>>> a threshold.
>>>
>>> That means that these pages are effectively unmovable for other purpo=
ses (CMA, compaction, long-term pinning, whatever) until that list was dr=
ained.
>>>
>>> Bad.
>>
>> Probably we can mark these pages and when others want to migrate the p=
age,
>> get_new_page() just looks at the page's target node and get a new page=
 from
>> the target node.
>
> How do you envision that working when CMA needs to migrate this exact p=
age to a different location?
>
> It cannot isolate it for migration because ... it's already isolated ..=
=2E so it will give up.
>
> Marking might not be easy I assume ...

I guess you mean we do not have any extra bit to indicate this page is is=
olated,
but it can be migrated. My point is that if this page is going to be migr=
ated
due to other reasons, like CMA, compaction, why not migrate it to the tar=
get
node instead of moving it around within the same node.


--
Best Regards,
Yan, Zi
