Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4323746B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154882; cv=fail; b=YSjy1WYMySMzTGEIWcUSzxzJzc9Yu6JMeznTgNYGuSlFCVWkJscxcFnaEm/C3p6tqE0DSRllEobDE9wMMnsYvS31TrEy212soJ49ZuzFI9toSxNA99XzidyrsVH3v8JKVLXWEaEYMhdzJ5Qdpm4hwmD5I/egYZwuNMVmlcAvPsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154882; c=relaxed/simple;
	bh=M+1YoELXwNPosVXnIznktGs2GPeJxYobekEv5IoTVrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c/MpeX/B3Vx4KsacFq2kWH2Rwk0AwFuDf7nrB3Q3yaj7OFYciIA5ONvWJGtvO6AFKasFxPrlM+et2EolFN9U3v9zOwLmd/I3nsQwtAquU0Ruwcl1Wi2a17DcHBhbDW0T7dRFzVVPjJlogHsQEZ1+nCsPHaSpaYtwQ9LBLew1lDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XUBuFbhx; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XUBuFbhx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5VC16GlwUeMoQ7VEY6YFwIJbosG0xgkou85/49k8+DTXKsz40fr4OT0KfpVfjS6jNImfJF6dHAzFJFQ8RZq8ftGscBseQ//mGCgPmrFSeerKvCbKoWu/LvQTiNCWku76MXOTueCA6xGF51qVjYjggjAp9kmZtyLlzGHvt2cl8hhFaTb5YVrMM2eZ/6T+KjUym0HHDTYcpmjqTkbz7fkPIZ+LyfJyFieLQY/cxfVuLHQLY7bRp9EBIdGo4ysaKw52Z4f8ymT2zoPgG0Xu826HWYrzneyDDJesjMMFaO2Ovjt5Sa+vxm8vpt6WXmV2eU+4uzmXknAbOk+gVDl4mW5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/j65B2vjLK4wmBgENsHJFPVA7FEpg0auFFkCVrSfL0=;
 b=xWDE7ersfF848zETIYFudjBcSHL3J5b2iB5m9ijeOJXff7CbYql/lGOngAydt1OyssFQPopRyXmkTR+FhQp43al55BoVXh6Qwlg7Qp8abTcCRS49Dv/KSLV6B9KwMKe+HI+prsACpK/Az+3nYVAdMLbSlCBy1ZYRFSk58gFBdAAZZcvcBNM6Z/hECL9UyMwAJZVoNR0W4y8T8apLrRuXGN6Kd0VVf6Hc2EmZwsy64vLGo9lD7ci0H2P+asZc5PJG3VJZx/DLugkC2DmgRwciVnuEFGZHIoN6frQP9lq30/Xsww0TonuiIIzQl3NmZKpt8C57UbwvSPTFiy7Oy2vtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/j65B2vjLK4wmBgENsHJFPVA7FEpg0auFFkCVrSfL0=;
 b=XUBuFbhxF1YbZcZoR5xx5urK6YVf+voVshbP393wlQctWJLDZ6K2UeABX/L2VS975B4G76PwzDYlBySxJCzEKwwftphag6e8uUkbwxCk2hq4ootHuyRxYO75BDQqPgMVsgreM1vacea7nfUsF1QxC2w+hdcw1kMc1ru8yYHgxyq6ZCK8Jt8IC4QLBevvFw9ufYbf5sLr2Lmy54RG31O4VLJeTRBeofdNeZcDiLKZJn8pyJYDiCy4mkQ7B0qhH89EwHYzA9kJaqD9dAWczxzIPzckA0EkiH/iiJ0YMNXVQC5nGap5LS22VAxhLFnVtRVDzd//o5ODNCKelLyZI6Zw9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:47:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 16:47:54 +0000
From: Zi Yan <ziy@nvidia.com>
To: Juan Yescas <jyescas@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 13 May 2025 12:47:51 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
In-Reply-To: <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
References: <20250510010338.3978696-1-jyescas@google.com>
 <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com>
 <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::11) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB6773:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea477ee-5867-4dc5-4c67-08dd923de7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkdiU1ZwR1ZwWTFsME8yZytrdDRUcUwwWEk0WHJINGpac3lIQTVBTEV2VWFZ?=
 =?utf-8?B?amZNckxkTG5mbDBJQXhIRWdWTGxkQkFWbGxXSzRNZGdTSXhzYWFDOHpFWktQ?=
 =?utf-8?B?Z1VlNXBBYktXZmduenJPenZLcCtMTEZTYTVpTTRyak9lK2dueXdyTjZBb2VL?=
 =?utf-8?B?cmErQWlLZmhIZ3dvMzBaQ2l6YUZTNzdRK0hXTzBHWDdqUURsSnBPNFBSNHlK?=
 =?utf-8?B?YkNFVDZiTGY2U2oybGttM0VJZEV3OXVET05tYk5sOUIzay8yTk1jZnlOaFhq?=
 =?utf-8?B?MUlZWGN2a01MbnYvNmR2NkN1QU5OZmtxSGs0d3BDcDBGM3dVN1hQaEhGTjdt?=
 =?utf-8?B?MjJOcCsrSG1uNnFWakdzZDdWdkt4OUFpVjJpMmFsQTBUTDM0aUZzeG1jMVFG?=
 =?utf-8?B?dTRsQUMyeW1mWmtBRWsvVVFoS2JDc2hQMmNvMm9kU3dsYUpzS2RSL1BDMDN5?=
 =?utf-8?B?eVErSC9MOXB4SldxNHQvOEVoWE5ONHFIZkRUd1VmRlJ5a2tvRHhiUWxCQmp0?=
 =?utf-8?B?aXo0SjZzNHRKL0ZuY3BLNzQrTXJKYlV0M3BPNWExR29RVWJmK09IWVBiSTNM?=
 =?utf-8?B?aXMwaXpGdDlSWmxEaDhBQ3Brd2o1NEltdFZwMU9uNHNHZC9EMENFdHVJQUJ5?=
 =?utf-8?B?NitOQXpBb0pTUTBJL3NNSFBTNUYwZ21oT09WTW8vMWRBeWlKVExFU0JyZG5I?=
 =?utf-8?B?UDVRaVB3b3FYYXNaTHRrbEszQnVRU1pMQS9yU3pYekExT244NjZQTjlJVDNZ?=
 =?utf-8?B?Zk1TYmJ5cHdzSGhxMFZsWnMrRklrcHBLYzZyUzc2WWd0NmNmRzhzbkJXZWly?=
 =?utf-8?B?eFV1WXJyRzlqVk92RFZYUGVaNGU4aWhHOHRhZyt1TzdGQU4weEdxQ2pld1ZC?=
 =?utf-8?B?M3lGTTZEclRaN2ZkMWJTT2FBQ2JrZjJMZU00ZHlSRmtTc3lMblQydDNqdG5U?=
 =?utf-8?B?NVRBZzRTaWxFbkJZRFoxdWMzRXE5cnVhVmRXQU8rOGY0KzE1RE5uNGxxQlBY?=
 =?utf-8?B?M2tBbFB2Wit6RzVrSHF5cHdMbG5xK1FGWHU2ZldaWVhiSktWb3ZxU2FQK0JR?=
 =?utf-8?B?ZlBSaTc5OFdzOHJWOWIxN3dzYlRjdG0rbG9lV1UvcE5qYUw2MnFwbmdGYk5M?=
 =?utf-8?B?L05NeklHZ1JiUlYvc1A5My90WWxHRUJubEE2UW04SEl4U2Y3SUxoOTZMdDhX?=
 =?utf-8?B?V21NNXUrVWcxbTEyOHJMQ2lVSWlmaWtjaUY5SVFNQU1DV2l4R0FuYTZwd3lV?=
 =?utf-8?B?dmxvMlhuL0FsVyt2NTEzV2h3Y2hBMXljV3JmQmphQ3htYTJnRXEvL3Nib1N0?=
 =?utf-8?B?SDFZcVFKcGlEZkUxZU42Tks1L1JmY0plU1FGMUtEdFhROFlnLzNvUFFORVhZ?=
 =?utf-8?B?Nm9rVWxEU1UzcFBoYzM0UVVlR3dEWXYyQXBEN1ZKelJhc3NLUjNReUdqNkdq?=
 =?utf-8?B?R2FPdHFTV3VqNEQrVTVEaTJQSHZMOHREWjM0NWFvTDhVVGVuUnpkZWlJanBF?=
 =?utf-8?B?VjExaDUvaDZtU0t4cjBjZHcrZnRrSE5wMGRJUjZ4eWFqSWJZNzhleHNtZStr?=
 =?utf-8?B?Y3Q5ZU5mNmYrcjlGTFJ0OG5rWWZUTkpJdG1IZzdsT1h6M1hDVmhHRWNSY2xq?=
 =?utf-8?B?WFJGZWYveU9WZW90cDlDTzFwTk9ITlY4dHBqSGM0dHp1UGhnME43NGZCNlJK?=
 =?utf-8?B?Rmp4TnFnRlVib1BVOG5kRytaVC9sZ1RUTGRHVWZDQ3ZmbnM4OWRyOWlxV3Fq?=
 =?utf-8?B?QjYzQjdmaGxGdnBQNWFENlN2R2hueUprZTliNjFFeDREaXRLMndoVFFyM1Z4?=
 =?utf-8?B?cnNKTTdsWWtPejErVmJSdWRFcldDY2U5VVF1VjNJNkN5eHhLWVFOcGVqRjg4?=
 =?utf-8?B?TUlpcDI0WnlqMHlNZmxEQ3I3YzJ4a0s2Z1huK2F0dDdNUnFqcSt4N2pWV2Vz?=
 =?utf-8?Q?72JfODrKN4Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEoyaC92ZXp3eHZPSHdXZHdscUk4VFluK3VRR3YzQ0lMTW4vNXM4WlRXVEZD?=
 =?utf-8?B?ZzNURzJqa2pvSUd1bzFJZ0xwTzFHSlIxb280OUhBVG5KbWdTQ3l6RWpMQ0x6?=
 =?utf-8?B?THJDbklxRU5BSWpOUFFoT01XNW1XME1aeWhRMWVaUzAzT2dvSExUZ3doQWJG?=
 =?utf-8?B?UmxxckFwOU0vWkorUUJpMFVZcDZFbytnR0IwQ3BFdVZiNVNHVjhKaDZaM1dv?=
 =?utf-8?B?U3Z2MkRJSlcwM3FjQkJMZnVHYjIzcGM5bGV1OUx0ajUxcWgzeE5PK0Jia1k2?=
 =?utf-8?B?K2t6RW9mQWJUVlBpOE9ZVUViK2dlbE04T1ljQkVhSENWejV6Q1h0eWErbnA3?=
 =?utf-8?B?elluNEZmeSs2VW1NVG5QSisxWHpkOG03NmpIbXpkWkdETmQ0cnZDOFNRSDEw?=
 =?utf-8?B?RGFDZUF5MExUUjY3U3RVOXFENlg1eFpvZGdhRnJTTkN1M0NOMXRJMDM0V3o0?=
 =?utf-8?B?bWdYRUdrV0xGNkpwTUo2a3YwN3hVN21QVWpQS203T043WFVyWFNCWm1LOER6?=
 =?utf-8?B?QzlHSUxTWWZ3V00zVGp0TTlHVUVZcDUrYXhSOHJhR2piZW8xc2NyN3I2RU1n?=
 =?utf-8?B?R1NNNGdaV05PdE85OWdyaUhMK3dBaUpOVXdpNjQ2blJ4MEVNd1FCOGNlS2xv?=
 =?utf-8?B?dHovTS83b211M0FCb05ZVFJwclNyWkhZUHRQaGJBNWFWelcxU3JSUFI5UWdx?=
 =?utf-8?B?TGRCOG0rclNJOGhmTnlPNTlqL0RHWFZhSDNMdldwV1V2SThXTmRaRG0wemdH?=
 =?utf-8?B?VG9DNGkweU1EcEI0YVQ1d0NBem9MTTNiZGE4NjJBcjYzSDJ2MW5KWDJzYWFn?=
 =?utf-8?B?aExsMkpxL2N6WnBlNnpCdmU3MUUrSU5TMURqMnVjL0pCeG56N0FBd3NxM05y?=
 =?utf-8?B?NTZzWFB1SmRSd1lkS1BUM2RQR1pFZnJjNGNHSmZzaG1YM1JwOVZ0LzJlZnRj?=
 =?utf-8?B?RDFBcU5RYWcrWVFnTnM4L1g1L1BicThFM1ZFaUtQd3g3VFdzbUVrTWVWUkFu?=
 =?utf-8?B?UStyL29OTWdZaE8xMlJlWmJyWDMvOFJmeVhWSnZ3RXFmbVF5QVdVb3cxQkts?=
 =?utf-8?B?ZGdjZTVJb1dWSlNVNk56aFBYdHZCa3JkSzlpRDY1OG5DOUhFNDJoQUNCUXFV?=
 =?utf-8?B?T1RrU0pyRHc4SG9EQXErckRnWHZnZ1RTZC94dUFCSUhYeXYxRUh3bnlocVYv?=
 =?utf-8?B?S2I3ZmpOVmN1RStUL1hRbDB5YVl5eWVCMkhnaDQxSU9Qc0l3eHU2VW5HTXRG?=
 =?utf-8?B?RHRUN2g5UVdVeS8zNXNWeFVIZEdEVVVGUUs3Q3ZFQWYrVFhVVXAwcE1BQXRh?=
 =?utf-8?B?NEo1bXZ5eHMrVVdKdi9mNFhYN0IzWGF4UkszYzhtNUlwNE5qRDZsL09ubTZ0?=
 =?utf-8?B?U3VDN1YzRHJoZzlKeEc4UGtGdVJQV3o2VXdOZUdHdDlSVm13VjMwL0pYS29Q?=
 =?utf-8?B?NkFHUnNjb0FWSnU2NllnaTU2YzZvazNYTWdtM2dodWtQaFF3SU9FNWhuRmU0?=
 =?utf-8?B?eFBndytGUEZzVGIzZUlJaGd0a1MxQTlGQ1VDUS9sV3c3ZTdpU3RsamRlSU80?=
 =?utf-8?B?TjRnck1pd1dxSmMzdE15SjBTbnlqNGVYQzVDUFFwOUgzYlZUcGt6RHhsZ3Nu?=
 =?utf-8?B?ekp2Tldyd2RXZmc5djJzMmtWbFRiRzU3ZVpja2toeWQ1ODNrV0owaktmMUZR?=
 =?utf-8?B?MWY5cmR5YlQzaW1yZTBVT3FMVTY4RDBnWWtLYjdsM25LTUczQnA4TWQ1eVlJ?=
 =?utf-8?B?VU9iYUxhM0ZxdnJtS1FDYTRnaXM5STdGY2EyRW1vWWR4ZFV3OHUzKytETTZF?=
 =?utf-8?B?Q2k0b0lWK29MZ2RkbnB4STRhb0JBcFlPNzZOMGMrTUNPQkNDM3lpWXM0cXJS?=
 =?utf-8?B?ODV3Ylp6cUQ2THoyVzFrVlMwalQrdUd2NVlOaGNpQWdETC9HdExFWUZHRXdS?=
 =?utf-8?B?SE9wdk5iTE9QdE5DcUtHSkQyRnlRaUtIOXF3TVl3bzNGalp1azJpY01vaytx?=
 =?utf-8?B?NzUzNWZBbnBsWTdGSlJVbGFQVzhyWG84VnFvU2tZSzJ4N2E0SEdhZjJkUWRJ?=
 =?utf-8?B?aURmZXlIanhpbVViVGo1cFZsYWppS3RMRFFiOUNDdWNaeUpGSjM0cDJEVzkv?=
 =?utf-8?Q?4IjJPsBSdH881SiujaWYmfh4w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea477ee-5867-4dc5-4c67-08dd923de7fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:47:54.0973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xvQVZ5jJjT320DsRW73LKLCJY9faO+mopS08S4CAAGWHLbYKhHYYn0mWm8sm9T7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6773

On 13 May 2025, at 12:41, Juan Yescas wrote:

> On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>>
>> On 10 May 2025, at 13:16, kernel test robot wrote:
>>
>>> Hi Juan,
>>>
>>> kernel test robot noticed the following build errors:
>>>
>>> [auto build test ERROR on linus/master]
>>> [also build test ERROR on v6.15-rc5]
>>> [cannot apply to akpm-mm/mm-everything next-20250509]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-A=
dd-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
>>> base:   linus/master
>>> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jyesc=
as%40google.com
>>> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select pag=
e block order
>>> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250511/202505110035.wtOWnL8o-lkp@intel.com/config)
>>> compiler: powerpc64-linux-gcc (GCC) 14.2.0
>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o-l=
kp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>    In file included from include/linux/gfp.h:7,
>>>                     from include/linux/xarray.h:16,
>>>                     from include/linux/list_lru.h:14,
>>>                     from include/linux/fs.h:14,
>>>                     from include/linux/compat.h:17,
>>>                     from arch/powerpc/kernel/asm-offsets.c:12:
>>>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >=
=3D PAGE_BLOCK_ORDER
>>>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>>>          |  ^~~~~
>>>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-off=
sets.s] Error 1
>>
>> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
>> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
>> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
>> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.
>
> In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
> and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into accou=
nt
> CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
> CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.

It seems that the Kconfig =E2=80=9Crange 1 ARCH_FORCE_MAX_ORDER if ARCH_FOR=
CE_MAX_ORDER=E2=80=9D
is not working. The above powerpc-allmodconfig has CONFIG_ARCH_FORCE_MAX_OR=
DER
set to 8 and CONFIG_PAGE_BLOCK_ORDER is set to 10, leading to the compilati=
on
error.

>
> Is there any valid case where the MAX_PAGE_ORDER needs to be smaller than
> the page block order?

I am not aware of any.

>
> Thanks
> Juan
>>
>>>    make[3]: Target 'prepare' not remade because of errors.
>>>    make[2]: *** [Makefile:1275: prepare0] Error 2
>>>    make[2]: Target 'prepare' not remade because of errors.
>>>    make[1]: *** [Makefile:248: __sub-make] Error 2
>>>    make[1]: Target 'prepare' not remade because of errors.
>>>    make: *** [Makefile:248: __sub-make] Error 2
>>>    make: Target 'prepare' not remade because of errors.
>>>
>>>
>>> vim +53 include/linux/mmzone.h
>>>
>>>     46
>>>     47        /*
>>>     48         * The MAX_PAGE_ORDER, which defines the max order of pag=
es to be allocated
>>>     49         * by the buddy allocator, has to be larger or equal to t=
he PAGE_BLOCK_ORDER,
>>>     50         * which defines the order for the number of pages that c=
an have a migrate type
>>>     51         */
>>>     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
>>>   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>>>     54        #endif
>>>     55
>>>
>>> --
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests/wiki
>>
>>
>> Best Regards,
>> Yan, Zi


Best Regards,
Yan, Zi
