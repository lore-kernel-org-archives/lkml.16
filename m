Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE53292B50
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305510; cv=fail; b=GpnvbCxns2NVipaYaHVMWbZ14NF5rBbflBJUYYyfiToXomuHdgQOZWBiTRZLt8dOD98F/Ton4ta2ihlYNg2SbW/3PrCdOHYUkoYoXu4S0mKXBZQ3Q8yVeRNXtjGpzEY3rWMhMsdoYU3hv00DMP2XRPXdLMcTMbiQBrDYnyIU/18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305510; c=relaxed/simple;
	bh=vHPtuzAFmcVrIxl/lGsv8et8FdOcWloAwV53oZVW9Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFVGe+SObMrBgVj0MrP8y8RjB9y7BupVZcQbS24VSCpCB7dQHeihCAS/ao7xbBsSvtJE5p72qRNfg72YaVI855NVQm1foFvImAG/gM0wCEpIcoNUnhFOiKAsNqVsLD5O7E+rXmsUHqOp7y8fiRE05+kSaFFyM6aOdPrxg7caoaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pKCFpwf0; arc=fail smtp.client-ip=40.107.102.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pKCFpwf0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVInnYAJ/ixGPTQfhGrj3CCW2vJ6KFSeEu1l4MXn8hPPekpjW6+FRSHMBqjIu067wrRrN8FYvH0IYimOWIAl9ThqIDt44E9EQKwTTKOrLu0Mw/deCl06qP9YBd2zgIeb2IK8+PXw/nSVEMsJsA+DrlWwu4Auj3hKCmbBkvpjf3vqxQFhu1I5OWztTaec/r1XvXqprbjOrbox8t1hDUcl8XFu0lbCJK0SBoEVvtMJRgbl3mpy3J+GvHtr06lvr4xg63U7FY91/GDi3mtUP1wj8G9W2Qyd4KbULlkzIwPwbUJtWg4KSG3sLtuAfwkwjwtOUQnJq80RgLKoCxFU4eUL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGZZU12Fppali/PQaTt2Hr86VZBUK/wr5rOB6aYYwiI=;
 b=oWzsj+54fAK6z1+OFQXsK9tAQAXwkwzixMMMMvv5SF0F5aWjnIRXkbSeL6oKf3Yznq8UX4lsT+GjU52Ud0VHFDB0+t4mDewjW6I58xVHqPDjVJg7Cyf41hDMHGNV8B6YBMQFEqy4C9902lE3j7t7I/DKej4LchOr1vkxsUrNrzvw27iXsWFXE2C/w+KGaKxMZ5csDNUW5wrI2/KR94Z0mvDgeSrIO3EiQ6eyOjYRa8SXjSmHl9138oqWjdPYOLvdyDqQ1X1OBAozif2J8nQ2T93UB/pHo4CMSpO5HNklknAjANvg1bz3bDRxNJT/Q7gDyXT9KDMoPs6nCJumGYw9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGZZU12Fppali/PQaTt2Hr86VZBUK/wr5rOB6aYYwiI=;
 b=pKCFpwf0l2Skzbb7/zQKOIZ0xSW55syqtmJ/J+7LAi0Mew1j50D/ei0vb2efCP0NaKZDTPt1vpbK+9IGCfxvQOLLbCZmbG1BdD4VxzqMvdrZwvEc5ymC/B/nv2gkZ9hmOrXoZLQFJjcacWoY6ewnivQD6SLp6nnvOKrOWXGQzr3pmR77Xhn2O2+zzpbBUtmA9yk+m8eSpeaoMATcKrUJyXANo34y4FvkmNhHdX3JTZJTylIbwu4U74FoXzRHPQ0kqDFKnbbyEtJ6rJTHXP+orcdD0O5EPmlbU9ewxzs4zxoBUNBi0Qba3JbjeCF2uOaPZmCWPnl7e5IT3Eazq0rdCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB8094.namprd12.prod.outlook.com (2603:10b6:806:336::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 17:45:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 17:45:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
Date: Mon, 30 Jun 2025 13:45:01 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <F5F9F9AF-4557-45D5-97FC-8BA1143FCA2F@nvidia.com>
In-Reply-To: <20250627115510.3273675-4-david@redhat.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0017.namprd18.prod.outlook.com
 (2603:10b6:208:23c::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a1f24a-6f62-4819-3701-08ddb7fdd880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BTk6x/QkjTTGFx91lVqpCBtc89WZu5LFW/2ITnHL+pT9WuRSA6ViWlVQ7UZB?=
 =?us-ascii?Q?5QVKHgQz10jHSShNjqNjmpZ1lJFz8UQqZIYtqyRvIuYE1MzfPFM1dSMMoLWw?=
 =?us-ascii?Q?ZzgshtTB/xuiqcqyhET3bBwrWBFvZ3e5iOBOLg72Vhb0tk5Kz8/ZqcAFwhKr?=
 =?us-ascii?Q?xt0W++uoCdvSMfWyAW4jtgCWxGagEnbxsllng3pfQmh4U3H9PKCICXemD+AW?=
 =?us-ascii?Q?qxTCNrfDpnzE/yMSDzQA26kq3JZ7nkx8f/NsRLAWIsiDvkVcsgL4RnO5R8UW?=
 =?us-ascii?Q?Y+zhhqzJYTzjo+0s40yRYk2FkMYCAoyDvBL2UYvVO4g2UAIJ3DjTDvvGKt+q?=
 =?us-ascii?Q?8tHZtN2FJqvP0/JxtWmyqhMkfujQmd5iklRWFNJO8b2ktQjNRUdoCtmP6MhG?=
 =?us-ascii?Q?NGPZNjoXPHsDwKDcvNwTKjl8kNzy+w6RUxc29JTmq7/hCtEQcqv/uRnLfn7a?=
 =?us-ascii?Q?xHr9o8lWVs0X05ou8m1JUSnmhUbTV/wCsfVTUa4JOejqquAOi8xyInd0vk0R?=
 =?us-ascii?Q?rbgOYsdA2wI4gHIZoxBJAwg+P506PRrYJdwedoT8KjfhxVQ3vCQCmqeqKaFs?=
 =?us-ascii?Q?z2tAgC6S/Hppio1b1ZvQejOv+hZuC3bgwy1+82Q9MOKny8jbTVL9y4YMSA35?=
 =?us-ascii?Q?oHHg1v3RplF9BjJBKJoSPW+vBoMGTWxiYzRyo7Gog4dk/u9efjQdFOPXj61V?=
 =?us-ascii?Q?XAf4lnsUIjQS+sV6d6iFUXXTHTf8/7k3fNZHDN67d1jmD4G1H+JCcSmv/hCK?=
 =?us-ascii?Q?EyTJ2G2iSTVwlsQRROmQwEKKI3lE83Vm79gP0SRU26O1ffBF1duHmijEt0rl?=
 =?us-ascii?Q?kfv3u4Sfi6QhF2GztjHOfD2tPO2VFsHNC49iKKYcVeMEoHtuConR1U47zDLk?=
 =?us-ascii?Q?EkaiNEwXDK+Z9bCSXn53NKTYa2mHBDhzrK1tNHg754ykcXh0kOdnx9UOMNxC?=
 =?us-ascii?Q?uurX+WvO5+A2YFuLfmNPEmVNWB+VxEFFqPL4pxc66WQSxOFgry0F6kRxqg6U?=
 =?us-ascii?Q?wdjisYR5A8sX3/8dxe+lIoMCsOBjy3EDVsSjqCx2Ot6YBnDG0ZFBw8h+DkDo?=
 =?us-ascii?Q?Vt27dB5UgoaRPMxDMvUMg128LPqOuMFr8p4b9dNDdwhc5D+FAVo2tqMp2OF3?=
 =?us-ascii?Q?S/tn0UNUzM9zbZ9rMpkvNA9Vxn6DqTqSkE67w5U8Cxj+BlxtSZpWikvxWaqJ?=
 =?us-ascii?Q?j9jEMQzFaQRlOeoKU55rXV73ZPO4RF+cpGaYNj4+GjiGoJ085GALu/v4xS2p?=
 =?us-ascii?Q?zVAuSNCmtDgBtYEZAdD+Naqa3stzWUt+1ld7/KzM3eoeG8vV6SMnHqh+ESWm?=
 =?us-ascii?Q?Zmhx4maTE7RBomdm7rC7afmbDdZUTJVcRZ+kjitdmzk/EPi0KzzLYWYClT8C?=
 =?us-ascii?Q?sKydYbVrvai6L6g2UiNo14L/oc5qS/Y8xyBBmeQuAHosy6uBDX5Wdo4atY4M?=
 =?us-ascii?Q?Rw5gU7Ywnco=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CVX2ukRN9wmRrnm8zHr8RSNSWZ8h87lcBoaZP0PUO1jyvrC2VtX2s26wj+LB?=
 =?us-ascii?Q?wim+kwaoQRqkyRQ5DVh94h6kngnS4RLeeswIpgZpQVTH9viwlg1zO9qQTiK2?=
 =?us-ascii?Q?FtosdKJ5baZHr4OdfuZchYfxlumT35qDmh3uIJk/CMoLtcRBzztpMdk1VZGR?=
 =?us-ascii?Q?i7BAPtXa4UygnObh0KTUz8pE47n146yANGTNCXu5XSNZMIKrz1VXkJFpD+kc?=
 =?us-ascii?Q?cKGATbcmBM3VEh8ihURFZPFMKkcelC2OfFOgnFcdgqHvV3ZdXZT0njaib+TC?=
 =?us-ascii?Q?ocmvOWb2ZBECKolvCXNjDcIid21QbReZ5A/W38tixZO4IsEomKTG41GJNv+7?=
 =?us-ascii?Q?E3dGWyD32o+MX9lrvudljYXMr5D0lcmqAg+HtbYItNC/pfSEj0ijpQranLqW?=
 =?us-ascii?Q?ketqL2rVAEFJ+JU21rwdHp64/gx9M3HLV6+Q0siVUcWDVgmN70K+OLUYlQ7a?=
 =?us-ascii?Q?c8hAgu2i1oWqiHf8jAqurdhGGfjldq1MbG0k7FppZcjgw0F5NSO6ji6YPZOY?=
 =?us-ascii?Q?k0u8koUI5IKPZeIYcneezk04HlOSACMiqMPjzLUHFjQZAu5U6LzIExXwx/pF?=
 =?us-ascii?Q?hnGgijAvXyhqNh1LsIcEdTBHbgdgJtFTP7CigeaKQqq6gL6F/IimqWNAwgKW?=
 =?us-ascii?Q?UhERyZV/w4TMUuMrZTFZ3BHaGf+G5uUUihkv1nyssxhkTbFHP91PswqIwbQO?=
 =?us-ascii?Q?xez05aJ3KlrX1q0C1A7l06WlLorNEc0Df6qusLTpp1vn0Wh8ebEs8TXR9FC6?=
 =?us-ascii?Q?V1rqdJYUM39CCuBBtEqXRo+R4duvDDz9KfNj4fyt/yA4H5kSl+1JUHFSGrlY?=
 =?us-ascii?Q?WUPFonkDE+65juyQ4kihDm+hE3x7Gwa2xBf/SFFdjadxdqJ55vPyIGfBvLKt?=
 =?us-ascii?Q?TDaFZmAVWwRyB/ad2IvAea31w2c76FC7JCsKaCBZyfDoAPWr0Hj2cAN3hVFx?=
 =?us-ascii?Q?uYbwYPzbK77UzKtNoZmvjKkKbNHFf+0foe3KuqhVkOn417Y8rcJ9qyHKEti4?=
 =?us-ascii?Q?7fEqtpSHxsnZEJW+h0SuWXlNl5FjP0+nAdGJvfj5hor0oaKfQW81BEPNuxZT?=
 =?us-ascii?Q?gN/iSnwch0RaFicB9v+gnFxOjKTWkfvHey9ZxSMiXU0rMotce11PUiXjw+Id?=
 =?us-ascii?Q?Y9c8oKb81PD5UG34fLATAru+yFBm6zAsEnT9xUphRiNXBIhmQ7CHUqOWy4xQ?=
 =?us-ascii?Q?78xIcZDeEKSTZZY+jejoPNZcIOUsHo+15LJOZwilPSC+IpMmMzLsogmbAkBD?=
 =?us-ascii?Q?PZAd2yIBZJxJ8kGTnIWKfLoJBIG3BkCm1Y8SRFZuPoQ4glSxke7m+nlxD4y+?=
 =?us-ascii?Q?KyNqYGj6RK2IPH3v616ykF7eNgg7qNkn/JfR50cbVZs4d6a+84p7cPlRVBBW?=
 =?us-ascii?Q?e4pjo3D1NFiJy7zLpiViFIloUeets6lsvL36l37D81GPgv8xmwTNb7IdyOGK?=
 =?us-ascii?Q?hsoHyF8w/nASJEaDVXorJuQgyRJLPQQM/8l74OBP/yoIaAfbvjn8jCIZ6kht?=
 =?us-ascii?Q?+PY86pgOKylbuqg5H7TmTElapo/F88oJfWXE4C3ksTH5WU74uHlPxAz5y0qc?=
 =?us-ascii?Q?zUpfW78LLLwh2gdo8CVCsuUQ9M4kYujI/vj7Opwh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a1f24a-6f62-4819-3701-08ddb7fdd880
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:45:04.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpzPLnbkWVEDXEU9QgfBfvrTQXCRCfjZce66X19QyAukYAf1al4gQq1BR1TkZKbS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8094

On 27 Jun 2025, at 7:55, David Hildenbrand wrote:

> Many users (including upcoming ones) don't really need the flags etc,
> and can live with a function call.
>
> So let's provide a basic, non-inlined folio_pte_batch().
>
> In zap_present_ptes(), where we care about performance, the compiler
> already seem to generate a call to a common inlined folio_pte_batch()
> variant, shared with fork() code. So calling the new non-inlined variant
> should not make a difference.
>
> While at it, drop the "addr" parameter that is unused.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h  | 11 ++++++++---
>  mm/madvise.c   |  4 ++--
>  mm/memory.c    |  6 ++----
>  mm/mempolicy.c |  3 +--
>  mm/mlock.c     |  3 +--
>  mm/mremap.c    |  3 +--
>  mm/rmap.c      |  3 +--
>  mm/util.c      | 29 +++++++++++++++++++++++++++++
>  8 files changed, 45 insertions(+), 17 deletions(-)
>
Nice cleanup. Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
