Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BE7EED8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931083; cv=fail; b=bd6D50T9Z4kHRDK2E+E+oOfhfykWRH0JqCq8m9UaQ+vmnmXO1cSi3ywVHxrIPnLP6D5FOOebFTDUUyEiruT5KQCMVsHVh6LFvF6tV3DFdllpW/27WlgQeyThZfdbjOudmMuT7HgKqrS71P41qC7sLuCLs6+1RV42sVQ4MbVOMKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931083; c=relaxed/simple;
	bh=4cgP/C2CqHfJGufYHMJhD0fGC1XTi9f7wFL3bfRhSnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IQZ037npAnv4fT02Mks29U15/DAasZMlQ5bvjCxB0AQ1ZnHNuepp7dEW7IuqGIwBJnxe3CmGS6Jf7G2o+gKaDlisCN91Zsj9lcwoxmZltMsWuy437ClMqLf1jxHRuLiKb6VRoV/LmSVmAPY7x+fbpJlm8YVim8gn9iy9ks3EOmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LPOCI9IE; arc=fail smtp.client-ip=40.107.92.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LPOCI9IE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBGZhptXKG0Usl3M+4moNt5lVRd7mOqKpqIfr5zIcpDT+iGakZ0nUzv+U3b1ZNWxEMLarF+1k3Tjk+TE2X/J4LAGdTPhHBw71U6N0zU2DpuJ4NPGBYip0TmIahSlNtekuRZye/2NKmE0YvaHOhFUJ/W9FDKcC6MqiydnpqpKOldm01ed/+JdKYq21y7CQcza6VslgMJl5Ix8q/gH3oGnS212/LExAgSnqn9XugOMN4BpXuyh76OgupETz1Rsb1BDD9oPwuC/wqA5zfyTdgV33wdnB8EukueaGNio/gI3y6HBPdgOE/Ufff9x+SBiGTYTADq8cy1+7dBiMkY50/zb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cgP/C2CqHfJGufYHMJhD0fGC1XTi9f7wFL3bfRhSnY=;
 b=Q3h3oJFr5LHF5DBMhls3gofdKFfOycO84wUjVDy49wYF9iD53G2UU9HEaGIZz3d2oearo6/gI69g+wkB7liaFRqkh2qNkyUNI56eS6/JsPaYyyO4DFy2g/4prp9j6kdSO37+ytKeTwqcaMVXSruaS44qwf+6cLeJuz/hsTKGCiMjlcWImgYaFdregalRX2NfbpvcuXE/6Dnhtf1hiidiMv/Mgp2o3L8EstyGBAH4lftNRXXw4q0euKT54D3D9IxmzzPPHuxkcb6M9pc841itwMGsuBNHMqdADlPPzZb86rFzll+/L16mIQ4MqjDqbJHvMcYeGZLwkx7WFjsp32EbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cgP/C2CqHfJGufYHMJhD0fGC1XTi9f7wFL3bfRhSnY=;
 b=LPOCI9IE7WXqnlCSQ+zJf1p7wm7FB+TnP20Km+INOZM9MrC+VKEfiRdv1iuhlQLJuEwjlKMjwJ+tgWgYXLlpXjy5ihOhMAJMeuY0KPF4JamXX5k2VNCqRIFHdhzl+uJ5aV3DcC2t8YFFxclE1D2Ta11q9CnIAHZzovaTrozdY/KfWeNejJhcBC6vZMsc6qGvcfpXU3kqaufBER5zIXq8Gp/YyW3p6PgkUpwcDS1FD7q09qQ+Xaxgwh2qm71ymJIbP9F4A0u5ph73lElMl3qiWEoNV2IAYkJMmPS+1zn5wqoFODV85ByRXq71C3R8AUSqw2QpfU5+rk4XiiNjJi50Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.31; Thu, 22 May 2025 16:24:38 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:24:37 +0000
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
Date: Thu, 22 May 2025 12:24:35 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
In-Reply-To: <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF00016414.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:c) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd6afd8-07ff-45ce-284b-08dd994d2584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nn4hoQtFZRK9O2QqJrRdV0ke6dyEajNxcJdXbUeQIQ6WwrIGfJ+mi3V3WVlL?=
 =?us-ascii?Q?UGYeN+tE8N01TYqZf2o61UHkHSKfIxLC7OA7HIj0xsEwFlMBh6DwLy1VQ0ok?=
 =?us-ascii?Q?3TNOqToO2BFPLWnlw810H2/Vki9yssKjgVGE3hpR5tOFj7dBcgQuKfPBeBYL?=
 =?us-ascii?Q?NYC76Wt8DvChAg7/QYNSPVrAuDxQh+p5pksM9bcPWA5a9K+rXbibrpQjwZ9i?=
 =?us-ascii?Q?8/pZZkTaUBnUQ/DX+AJ+KMZcgLgYYJwxkFRysiyp9VrJV2QLRTC2xU80ms+9?=
 =?us-ascii?Q?catqU+S48xsBlisf7R4iS9VknozLJ+paKUSJ+oerDt7UeyME5UH7hVjdrFXL?=
 =?us-ascii?Q?WfDfdvihfAqma2vwXJ3d4djndNdivHA/0bzCjcT1f/KkFG6EYUTtXNSdHOi/?=
 =?us-ascii?Q?LdLF1lWyigePD9A6gCuhYrjSN6EMPT/DdxvqqlvVYQVUr2hjpAadr1vzDW3v?=
 =?us-ascii?Q?xo8nXTj/L/22kDGPN58BAaCOgo1Qb8ajWC7pqvyLfQfTIpQ0i9uAd2N2xSuO?=
 =?us-ascii?Q?JZlxHMaidhV/vEbP1rY0T5/CbSDjdruCFIQtDxtjThewO3MIWKYrnXXztM+6?=
 =?us-ascii?Q?kOAkBjGEGtaPA7WREge5veucvt4vOSN2QTGclADclU1UAR+VBqDOf0DvfdOo?=
 =?us-ascii?Q?EmHSjiuUavad37TYXLy+c1E/adlfIzWAPNSre8GdYuy++rg/36AUlhEMs6dT?=
 =?us-ascii?Q?xnpYDlh8pS0ImTbb1hNpkxmxXDfagBwLpnabyvO7nhHikjbbEyExWohSQpf3?=
 =?us-ascii?Q?cctgb8tzRxO4nXFQC9IT1eZU5/8IOftceV2TqoLb7D+VUAShJQJAP+bMESYO?=
 =?us-ascii?Q?t3dQLHh0CVe3bZS/CIu8DYa7MMSoAonHDTXj+l0UoXc0iH54zCrDllpRjWLH?=
 =?us-ascii?Q?tTmXosiQj7mctHV7uwYtap15cWfhdy5CuOFwJlAHlB8bqsf+IkPOt74KkeBc?=
 =?us-ascii?Q?B2Hl/O5GrZy2Ph+rRIFlEBwAcMtg5IutK6vzZgMlvaHWPjsi/vtHvlraDxH/?=
 =?us-ascii?Q?RpAU5h/uwZeTmCA6thQkibq9OrDVCFJw5z+kgN8Ruj680+UGpSX4PD+F8mxP?=
 =?us-ascii?Q?Ybom+N06A4mKW/RvaKVP4QK2KRrJ3MVRKGHeo/2CzyfZLDxvZtWOisLbWr2M?=
 =?us-ascii?Q?pyK7kaXUn4ehG7X0i5jBMnoGtSUUSSwcWhKeenNQr5fRf9tNvZIEahdKK5mQ?=
 =?us-ascii?Q?GdCkQzX2cwFTmh9NlzhPgNRqfsbhJLLDbHE2ZXKW8SUSXkU13/WHucNiD38t?=
 =?us-ascii?Q?6ZhvAuKJ2Ok27fNpH9nthRREPcDjpq6ekiarLBeg/WvZ80NpKrWlJPSSqLGE?=
 =?us-ascii?Q?iCRhgZHp6IMdgIEJGfADTWtHA2ot2yW7ZC4Yu31XjKhqlHnqwaOBl0Vz04++?=
 =?us-ascii?Q?7dSdiO2lzS9JPS9DZSz0Lh8DTlzNpGkKKU8iCU7v2BKsD9LfjHEKOY1pcsUf?=
 =?us-ascii?Q?5T4edkcMTp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IwHP89v+nRlmmGtzx0EJMa5PNloCId3H1kZeUvbugLGitdu0mUADDEtULRIt?=
 =?us-ascii?Q?sQf1MdRE2WlCFIpjzrdpu5J5OyZdilHs6EotVUQ1qT3RbojMf6wuhjmMOiEn?=
 =?us-ascii?Q?blOUqbovFjtpmN95lJePsoYC6jYUlX76oo+zr8w1g9iWjx2A2/oWnXXgnqtr?=
 =?us-ascii?Q?6IeWxl+hhBjoTC94Z5LREJVDQeDrM/aoosAalPJnQhPQENRW4yN2gaYS8fXW?=
 =?us-ascii?Q?nbYcK89lcc6bIjz3LEOZQe/k9ijWiYCjWakbDaD+HzTkxC3yo782WB7fqd1/?=
 =?us-ascii?Q?n7alx1SneHESxRqeuaqO1IxkpkNZH8mM7GlZaf5NzOp9Nvf6r1LQNykDBjHv?=
 =?us-ascii?Q?QoXb539GHkBaMOBQNH5NrvPyiQETKcO0Hex1jdfBQrrmnM2552R7mWZfsM51?=
 =?us-ascii?Q?BOGh6SkSMKK5VeYeiwGg6QPy7zrM9dbXjN+05XkVccwMmQZj4kW8rYw32u/Z?=
 =?us-ascii?Q?AURyfGuWaq08hk6kk9xyLxyb1/3l4ENl+SP8Ncg3ATv0CmfneuMPzrrsKOnH?=
 =?us-ascii?Q?01toy29CfY0NnesRP5/2Q8tDHeVItmImAqFLZzHq/h1zR1bsKdLZ9YFUvkPj?=
 =?us-ascii?Q?rfCz3AmzmiOpE06GHC//+xHlVMBAo0WalFTyaZZRykzQAI0bnTmovdpd7KIk?=
 =?us-ascii?Q?xR7vcbgMKU2iguE5TawNuIfKenWJdym+hQnchvrqtey3v2AQ22YxOCdYl9zq?=
 =?us-ascii?Q?6/G/K0bUVZ2yroBA1ZMfy0xTdXqQEStTgskctyahqe4371u3vEUMG6or+rFk?=
 =?us-ascii?Q?B3Wm1bkHE3t/XFf6Ik+Vn1yo1N/2SPFHckoPqOmNrkCgdnCIKPcLSyREjkQ2?=
 =?us-ascii?Q?EhSisJ8RFUQ3VNXJCwINElgY9b3ZL2oK18O6b93c+FCuVjtNvvZkZFj1vBHn?=
 =?us-ascii?Q?7DYhwChYy3xGw4BdTYetiRmGpMpgPSWQXhHYjUFp6O40sACcRfx5iXAc97Sz?=
 =?us-ascii?Q?mJdHI3HG78nEaCpWd9+dRZeEyD+ru75EJsHzoWCjf4X5aLerMmbmclfpAJRj?=
 =?us-ascii?Q?6/Zlw+2AxcCjC67RPx9EEjhijbtwVPfhK4SJYHX3u+4eNe4oILp3kd76cPZb?=
 =?us-ascii?Q?JVahqYdHT4oI3XgNRVDGDisTtE/apeIKrgscmCzTzKiYsYonNrJuuTSa6Cua?=
 =?us-ascii?Q?JQnyRwHzp95ri4DIb/FOfGg7q1VWQSDWrkOLPuBBHoBODuhytdi/nbedmuyO?=
 =?us-ascii?Q?0BW3HhWwJ4gfDdjdhAPnL8cPt7Hg3cFDNFPLJaQOTjPh9lFX4X4os97oQ/nW?=
 =?us-ascii?Q?X9wBGt6ALkBERQDGHlcRGIgyC0M7yJhSXlfjcpdba8ftHlXnrI6fW7Dao4Dz?=
 =?us-ascii?Q?dsszV2uoESyKxfOsuHM81h1kjPx2KgnwlmEn7rFPkdA/sVMI7UP3sQqIf489?=
 =?us-ascii?Q?NQDYLjxsI9KJFZAAh3RoZbbxX4S78AWB9ISevQR8Wj9RfFVNyo1iKwXtqPLD?=
 =?us-ascii?Q?cCTHMw9mh8o0hjCIN7M8pRn/JmNTFRX08FvdjWQR3PuITMm/jXimfJDrbGNq?=
 =?us-ascii?Q?doaj2X6QzgBmmOKsOtjYhEPPabkAzZKHPn5iQU7pwksUpWHW+ZfPTV++ORYi?=
 =?us-ascii?Q?puafJngoryv450oTMMQX18tnpYqSD7nmH8kAAIAK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd6afd8-07ff-45ce-284b-08dd994d2584
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:24:37.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXU13shSP45F4xAE83t+MvuBko32X9YRV2VrfvLE/D+oKk7z5/d+f3GNurqmSCV/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501

On 22 May 2025, at 12:11, David Hildenbrand wrote:

> On 21.05.25 10:02, Bharata B Rao wrote:
>> Currently the folios identified as misplaced by the NUMA
>> balancing sub-system are migrated one by one from the NUMA
>> hint fault handler as and when they are identified as
>> misplaced.
>>
>> Instead of such singe folio migrations, batch them and
>> migrate them at once.
>>
>> Identified misplaced folios are isolated and stored in
>> a per-task list. A new task_work is queued from task tick
>> handler to migrate them in batches. Migration is done
>> periodically or if pending number of isolated foios exceeds
>> a threshold.
>
> That means that these pages are effectively unmovable for other purpose=
s (CMA, compaction, long-term pinning, whatever) until that list was drai=
ned.
>
> Bad.

Probably we can mark these pages and when others want to migrate the page=
,
get_new_page() just looks at the page's target node and get a new page fr=
om
the target node.

--
Best Regards,
Yan, Zi
