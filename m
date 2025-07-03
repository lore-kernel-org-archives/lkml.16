Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9752DBF48
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585751; cv=fail; b=iT0my+7p/MNzkzLPH5f73rbXXkXfFfRiPqztFva44pF7TTsOJWv56v+axah/R4Wi8JMebNUlAQWiupvH5oQlkuSd8GRpSCjt2Cv5CdoVEJLWWSpJ6X5BumBIGG+5WG9t52toi4Dexpb8qL6dT3Uz6rl1ucK/y8GCTYN/7oLTmMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585751; c=relaxed/simple;
	bh=oZKx9NmzQ4weCRa34ubjYUFr+ATVubsUeurrFjc+zMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MA4B94tdgLZof/Ne7Evffu7qmMTBQvtKrCsr5cAcHZuuUjwuZUJXvQLI2g9vIW9SHBxxR6ykrvFLA4P67PdonlbGjuOJAY/pDeoWB3nw1/fAwq6ByWlut3xrS1tNbgttJWjGSZRyHBk+gVF2KgfRNFoqRfWXfa9O1eFqYsLDBZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wqd/gUHy; arc=fail smtp.client-ip=40.107.237.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wqd/gUHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg5vmF/Xjgscx9r2bJZRtiY9PpdN0B1090CfXitP0MgEsS9V5VudlMnpBE12gwkSya2ohsFax3MbzFid+fmb+hcfs3d/ZY7ZOemgubkVod+d8l6ETcNXLQyLG7TE+lcy3BzPGOoo3Xwq/P4L5p59+nU1h25P5uJwhPNLwFN5p9JCU4wchsSVvKXYqs3ihH9yrl914FYJpBqiLmxYNyze3zaA/hL9Hoi59S1x9NWrIRR/bNzEhSGOHDAexMqHvCl+rjsq1EGD+RRVVO8p5X2Od1gReNqB+QPaJHNfNxkr3m5gP81edMdcEEwsCoefilO7zTVPHbdmtashD0PnMMqbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUQrvL+mwqOp3NW7URwvG+WV9xhs0HoNlo6lA0jFPjE=;
 b=MOlQ1vqYYto0HzBeXI0PauSqWylxvEfFqO1NzLQ/MG1tmjCsLRNJ3H8izvHffqJ40uAkuvndzmLua9743FXWizrwpV+Z9J7byXwyWbz1sKNVmeDbZGd7/zbhsSyaEHX7K65jCT+k1dOIihluPNSq6cRCKl4ew92tbqc5lC3l5Rn5lpzbihQZH7F6t6bMicunEAZcHS7RShq9GR/rxavNjgtuud/GwlZD1xsRm297bjhGcfxvASdrxSYCqBJ4Im3BvEu3ppyd7WGBQIFb9hddoFMcDkqvmIbh6O7760ZZCFWQS9/sAI7fWhPbKZ5KIsr0TtKPOwAcwp4gpa3K63u0bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUQrvL+mwqOp3NW7URwvG+WV9xhs0HoNlo6lA0jFPjE=;
 b=Wqd/gUHyRuej2DZ7/7GxCa48oxnV/iH+5AoY1aumchsGZOQsebISkWUYehJSFZUegkL0D9I8K7YnB65bpu1kxGw54dnphLRZPJUTZrHrUQtSWCsJxAjiOuEs9kTbg2EzfRwJDwkxAf5qv6RaLv73f6rNzbDuIUFJ9zYomxUYT0jLzccK2o0rtxINjtd4iFdMDVGwLULqaO85/XnLOtvmbuwgN9+2iBj8RSJX+jGs3b1Yv8ocfiJ/7CyDQk7c0uRtVqxh3ZEqwEApcbAE4P7YZPA73p6XjyO8Zx1vyabMDrckNJoUKB1HvFbH0M15R9cTWDdhNh8vonW5a2+yA7ODjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:35:46 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:35:46 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 resend 01/12] mm/zone_device: support large zone device private folios
Date: Fri,  4 Jul 2025 09:35:00 +1000
Message-ID: <20250703233511.2028395-2-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::12) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 9545c12b-10f3-4403-2b9f-08ddba8a55f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFQwNHBFZ3RIVDRubTFkSFoxa2tYUVlveDNncHVrSnp3MFRsUXkzNXh0MlRj?=
 =?utf-8?B?ZUpQalkyeVQwY255SzJrLzR6emxxNDY4Z0YwOWhaWWNDMXlxUjBINUFtRFRL?=
 =?utf-8?B?V1hmWkZBUXhyWGNDUWQyRGg1eWVVeVdMTnkxemN5RXpJNGhqeCtaNno0OGNo?=
 =?utf-8?B?dnVTaFlRbnVHTWhZL1RYbTkzZXNaRzBGRDhyNnFudHFWUGdqSVk4aHJRaXpN?=
 =?utf-8?B?UkdNWmNlVllMdDFWd0hZREUrQkN2dENqcE41WW4rdkRzV2x6MGQzbEp0K21E?=
 =?utf-8?B?Mmd6d1FSRERaY1VobTBtdjdPYmJHVnZaaVplNkZKZzNTaEI1U1pGbTUzbGdt?=
 =?utf-8?B?SWg2S29oTzBqMURwR2JZYnVaSWpOTjljMlFRSmZNcGlMKzhEVVlEekNBbkVm?=
 =?utf-8?B?ZFpFaXJ2MWdpWEpCbm5FK0NTR3FjUlVZZ1lISWFVWXRiUjVVTEl5cWU4Ylpj?=
 =?utf-8?B?OEkzVVY3OHlMQ3FCNng5cnU0VWlQd2pKd2h3bG5wcThUcXIyTUVUZDM1dTFF?=
 =?utf-8?B?TlpBYjFBOWZxZXRWb1Y1Z1B0V3NxTXpqZDdWcEZrdmYvdHVIcGRzNnZCK1FT?=
 =?utf-8?B?SlFWb2QvNzFPOVc4OXE4cktBOVA5aXF3VlFSdmthRlZmQUxzcnRpTEY1RWRB?=
 =?utf-8?B?VkZveEVOdHVFU3pPTzBXVkt6a2NzYmRnSFFDY3Z3ckZjekdQTzVERmpqODVw?=
 =?utf-8?B?My95MDdDZFNMNE1KM29jcXZyYUxGVkorRVFYa2QwRy9tRDhPZDh4OGVTUENr?=
 =?utf-8?B?ZndadUwyQ25TT0JuMDJkcDEzRUxMMkhPMWJlTGxzOVZwdmRyZXA2cHE1c1dQ?=
 =?utf-8?B?ejRrV21wMGhGLzhQcHpTRDVVODRDaFFxa0J0c0NqY0xpRXZUL0dPbHFLb29D?=
 =?utf-8?B?ZHBMSVRDQ2pIODc2TXc0Tms4L2hkYTA2bVhId2V5VzY2amdhVnd6dlJ6cjJG?=
 =?utf-8?B?NkFUNTVPNWlwWWIyNFhaSitPb3NaNit2THFsd1ZWNDZkSUFDazVGNXowYmRw?=
 =?utf-8?B?cWR1QnBIVktndTc2NEpETGhRWGYzQjJTM01WLzlxTXFTUHBpQkd1QXErVElt?=
 =?utf-8?B?RUc3cmNZbnc2dkFqS0h2aHF4bEU0SDMvdE1wUjZYcmpacWtzZU0vL0FWV2xK?=
 =?utf-8?B?N2w2ekNsVUMzZExiNE90bVVMK2hrMTRjUjdQekJtT08rcE9mekduclZ5VE1p?=
 =?utf-8?B?SzdZcnJ3RzV0M0ZIYW03RWhVNmFrR01HU2VHTHp0eGRBdE5QUmdNWE1YRTRH?=
 =?utf-8?B?NW1mOGwrUFdrRVpseGhsNExucGNnUS9vTEpITjhDRUNGMWZsMkE1NHpzbWRF?=
 =?utf-8?B?RWFUd2E5Mm4vMlkrWDIxdkZIWUVOME5mWmhLemxNOEFRQkJveXA2UUJHWTFZ?=
 =?utf-8?B?em5aZEZHVmZ6WHNESGtyRllIU0diUnNlV3g1T0FnVHUybHE1TkVqMnBiR3Jk?=
 =?utf-8?B?YVlHQVZ6M3paQVNSb1RsTTM5REErcjhMWmJiZHZLYkZCTWJkLzF2QmloYUJ1?=
 =?utf-8?B?c3kxWWVCM3U4Mk5rTXVJdTMwaXZ6bkQwMkx1R2Z6cm8ySEpCQU9nYzUwSGll?=
 =?utf-8?B?SGdXZlczOUNDN3ZKUUtJaHowRWlUc2dBVFNxYUFxUzZ5U0dtd3R6UWZwRW5N?=
 =?utf-8?B?azZBT1kwWDBqMVVBVVJNaHVjQWNEY0NsSmxndkRqVGVndmZCYmdjbjVNY0xI?=
 =?utf-8?B?QWZMbXlMQVlJVDlnZysxa3pYR2JwQU11MlVDWjZLWXRDTmhRbFlKbmtJMmZB?=
 =?utf-8?B?cDF3VTZDNENrS0xJZ3RTSE5WaU5Nem5XQzAwWDhBNzM1VEhNSUdhUTFYMndE?=
 =?utf-8?B?THlFVGN3azhKQXZxcUhBT0dQMGZQb2NRSkJ1bjlETnd2Z3AraitYSVNXQWlG?=
 =?utf-8?B?MENSYjJuTEo0S0c5UWd1MmJtQzkra29jV2ZtWGJRdFp0STdXbytHV1VmUFo0?=
 =?utf-8?Q?DHj6o/I5KEA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K055T0RTTUV1WStZZ2tsTG1hcnlFbktnL0hNb2o4RzNXSHdNV1N6ZHJ1Q2RW?=
 =?utf-8?B?bWV1NnIrZU9OQ0FPbVY3NFltNmhSM1dKRmk3VlZtUlhNYkx6VVNzcnJ4WFFo?=
 =?utf-8?B?d1RRbTc0QWZYZklxZmJKRE84TElJODRHZWhYaFg5SUdNYjlENlI1bklBbHE2?=
 =?utf-8?B?a1VkWEZrVnBiQjFnQTlndGVsWDJ5aEJzaXY4cHVQck9MR1JYMjhyY1o1YTdl?=
 =?utf-8?B?MlB4SkxTNkJpSW9MV0FSL1Q4OW1LZS9TZFo4blhxOWlCV01TdFN0NSt5YmNN?=
 =?utf-8?B?bU8zMC96TGt5ZmIyZG50TStFNXZMZlQ4dmRUbHJXeGdCa1RjOERpZnk0VFdM?=
 =?utf-8?B?RlNzelBBTk5LMi94THNpT094VTVtUTJRc01uOHNjTjhzQ1psKy9wNlBtc1Fa?=
 =?utf-8?B?U0ZqU3FNT3pGL1c5ZGFFaVJZbHdsUWNmeFI2c1MxcHJoSStPT0p1QXpSN054?=
 =?utf-8?B?Q0FXVXRucW03Y2c0YjZ4bzA2YWRORk95dWxCZENxUldjVm9uYmZySVhPQ1ZN?=
 =?utf-8?B?Rm1rTzA4NkVUQmtPUFNHYnBlOU5Pc0NFdTZMNHdaTkxHclBqYTdsOTRmalp4?=
 =?utf-8?B?MW9UOExUYU93OHpNYmhPL1JrNHFxakVNc29BMlpZNzFodjRFT1JJZTBuNGVo?=
 =?utf-8?B?THlaWEpzb0QwVEpmSnY2VGc5eGRkb0cwWDZNSUV4azNSdlR0MU9HQlNSbVZE?=
 =?utf-8?B?WUtWMDZLamVSTm9rYzZYRFI3MDBWZjFxVEVPdm1DQkxaM0paVS9IRGRMSS8w?=
 =?utf-8?B?Z2pOVlJzckxsdm1VT0ZCNFN0c3lUSHZCc21ZRkdHSlV2cmliRTdWcnk5cEVI?=
 =?utf-8?B?ZzVOc1ZTYUdncklHMjFLeDVsYmV4TXczRnA3YWM0YUJINUZFWkZRczU2Mzc1?=
 =?utf-8?B?MEp0RnZ2V3dEallNT25XeStRdTRtcVRyOHVDeDY5bDdhV2FJVnlpNitURzZT?=
 =?utf-8?B?cmw5c29tdkc3V2FxKzVjYzJZQ2toV0lkUEVQcDBzRGJDWXVGMEdiMnBwZ3JJ?=
 =?utf-8?B?UWZnS05WR1FWK1VXKzZDY09jaUpuWDRud1F4d1lZbHBxK3g0ZGNGK0Uvb1l0?=
 =?utf-8?B?eTdtSjQ5SXQwL2RuakxaYllJelZTM0x6UERLdHdjcGlaY0xPdHJzODBkOGZq?=
 =?utf-8?B?NXhjN0hyOWVSVlNmK09STmdxTytHTWtMRnJBanVBSUhSWUdWSmlKYUYvb1Fu?=
 =?utf-8?B?V0FxSGJYY0RKM09SMCtEK1JhV2dmMVhTYUQ3eklMczljdU01V2J5cHdDWWtx?=
 =?utf-8?B?bEtoWlU5dUhRbk1RQmRWQjVBUzdkREFOenJsR3pzSjFQcUhVby9FSmt2dEIz?=
 =?utf-8?B?bytuWFA2cWx3RGdrWlpIS1RENmxHZEtzSnZrVHdBK2lpK3IyMzlLTlhRemg2?=
 =?utf-8?B?d1dDK2ZvbWtZNGVVb2NYOGxaNnFGZ0xNQmNPZEdBVFhIY25zK0drU05QQ0RY?=
 =?utf-8?B?SWVHTk9GbmV3WkMwYTArY0ZUaEJ5aG9sMzA2dUlEanpUR2dMUkhJSnc5WHdB?=
 =?utf-8?B?aGkraGdaTEx6Nm5PdWRNT1hCYU9vR2dwM2F5UjdwNjZCOCtQY3RSM1B3RTdt?=
 =?utf-8?B?ZXVkb3ZJaUk4QjNNREtWVDlNRTB5UTh3RnpnTXoxSThNaFRnUkh1YVJDTmdF?=
 =?utf-8?B?cTdkTzMxZFNsK2dWMzZ5MFJMK3RkV1hqNUdNN2dObEZvYmtZTEtGUE41ajZ2?=
 =?utf-8?B?NzdPb2ZGVFlBR3VJZUxYdGtKaGFId0hGdU5HMDhpM0k3UEMxZ21QV0Zoc3Fz?=
 =?utf-8?B?YzVvRERseEk3YVBib2NyaVZ2bndCVVg4UXQyVnQrS2YyeEhaQkdrRzFOaHpH?=
 =?utf-8?B?WnhxQUR1OWQwOXlRbklJZnoreVRhNzd5QmM3djNuQ3pzY1hxQ28yNmJ4MUxp?=
 =?utf-8?B?Y2JkWVJ2c3dJdjllN2VTejdOQjhVaUwwbUZac1k1WWRRcVgyM3pneWEzemR3?=
 =?utf-8?B?U1J0bEw4ZnQ3eUVqMDdra1JIaHJ1K3gzbERhTjR4b0wxZ1owdDBLdzV0bHBh?=
 =?utf-8?B?TTk3dFdneTdCM05MYkp1VkVKNWNzeW5sdVZENEhuTE1OWWNXMjh2VHhUaGNq?=
 =?utf-8?B?d0xkbE81SEl2Ui9QaDQ1TlFmdkc4ZzVpTUxhQjk4L0hZYmR3Z2ZFeUcyQ1lN?=
 =?utf-8?Q?UNSO+40v63pkxvzR0w4R6H6EZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9545c12b-10f3-4403-2b9f-08ddba8a55f5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:35:46.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQdNeq4hFo3TDUmTdxxKSbHBNJNUZt2W0hKP/HLmd0qXoXvJbBN+Yt6HOmuaCJdRSVgB2m9EsYx6mLR4zpQsiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

Add routines to support allocation of large order zone device folios
and helper functions for zone device folios, to check if a folio is
device private and helpers for setting zone device data.

When large folios are used, the existing page_free() callback in
pgmap is called when the folio is freed, this is true for both
PAGE_SIZE and higher order pages.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 include/linux/memremap.h | 22 +++++++++++++++++-
 mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 4aa151914eab..11d586dd8ef1 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
 	return is_device_private_page(&folio->page);
 }
 
+static inline void *folio_zone_device_data(const struct folio *folio)
+{
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	return folio->page.zone_device_data;
+}
+
+static inline void folio_set_zone_device_data(struct folio *folio, void *data)
+{
+	VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
+	folio->page.zone_device_data = data;
+}
+
 static inline bool is_pci_p2pdma_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
@@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-void zone_device_page_init(struct page *page);
+void init_zone_device_folio(struct folio *folio, unsigned int order);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
+
+static inline void zone_device_page_init(struct page *page)
+{
+	struct folio *folio = page_folio(page);
+
+	init_zone_device_folio(folio, 0);
+}
+
 #else
 static inline void *devm_memremap_pages(struct device *dev,
 		struct dev_pagemap *pgmap)
diff --git a/mm/memremap.c b/mm/memremap.c
index b0ce0d8254bd..4085a3893e64 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -427,20 +427,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_zone_device_folio(struct folio *folio)
 {
 	struct dev_pagemap *pgmap = folio->pgmap;
+	unsigned int nr = folio_nr_pages(folio);
+	int i;
+	bool anon = folio_test_anon(folio);
+	struct page *page = folio_page(folio, 0);
 
 	if (WARN_ON_ONCE(!pgmap))
 		return;
 
 	mem_cgroup_uncharge(folio);
 
-	/*
-	 * Note: we don't expect anonymous compound pages yet. Once supported
-	 * and we could PTE-map them similar to THP, we'd have to clear
-	 * PG_anon_exclusive on all tail pages.
-	 */
-	if (folio_test_anon(folio)) {
-		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
-		__ClearPageAnonExclusive(folio_page(folio, 0));
+	WARN_ON_ONCE(folio_test_large(folio) && !anon);
+
+	for (i = 0; i < nr; i++) {
+		if (anon)
+			__ClearPageAnonExclusive(folio_page(folio, i));
 	}
 
 	/*
@@ -464,10 +465,19 @@ void free_zone_device_folio(struct folio *folio)
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
+		if (folio_test_large(folio)) {
+			folio_unqueue_deferred_split(folio);
+
+			percpu_ref_put_many(&folio->pgmap->ref, nr - 1);
+		}
+		pgmap->ops->page_free(page);
+		put_dev_pagemap(pgmap);
+		page->mapping = NULL;
+		break;
 	case MEMORY_DEVICE_COHERENT:
 		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
 			break;
-		pgmap->ops->page_free(folio_page(folio, 0));
+		pgmap->ops->page_free(page);
 		put_dev_pagemap(pgmap);
 		break;
 
@@ -491,14 +501,28 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page)
+void init_zone_device_folio(struct folio *folio, unsigned int order)
 {
+	struct page *page = folio_page(folio, 0);
+
+	VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
+
+	WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
+
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
 	 */
-	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
-	set_page_count(page, 1);
+	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
+	folio_set_count(folio, 1);
 	lock_page(page);
+
+	/*
+	 * Only PMD level migration is supported for THP migration
+	 */
+	if (order > 1) {
+		prep_compound_page(page, order);
+		folio_set_large_rmappable(folio);
+	}
 }
-EXPORT_SYMBOL_GPL(zone_device_page_init);
+EXPORT_SYMBOL_GPL(init_zone_device_folio);
-- 
2.49.0

