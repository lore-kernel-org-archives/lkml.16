Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D692820A3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523526; cv=fail; b=GveSZvVT/88Nnixgk0FuLb0kJjy+wb+iCAUdO0J4wTkXaLn9wSbrEei0NLvpYPgncf4f4k/x8qod2fboru+h6jNqcJZy2oLOwNNc8w9RSVmMxuTH6jLdvFjpdlwWWY+uDGsws0wuse7WCmF8zPFjrOMJwDglO2NTsj6iyXaT1R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523526; c=relaxed/simple;
	bh=Mdxi4llgSVVCk2AD9eI2Iy3Hj2o9rWT0Se4Mc6JoDgo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=PJNSowOZxaD2OWNcrbrqqqvAQFMG3y1ggw8Oz0BNcNQ/eO7IYhcccQiwWjNI/Nv6eN/7IJtT17cGpaC0mJ5Dx9xOPzYngLyo2yu6/oj0jyyZRMPWI3GvGhYFidMSbeS67oS+p6vqk4JhSYJLZSu7RpmdBAHrqlJ1P/UK1At9TIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E7FG5ZXl; arc=fail smtp.client-ip=40.107.243.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E7FG5ZXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBF3so2GUnJUPfyXMT3tfhXsj2uLMoYnQI2ueq13WlkKuZUcl1KUYH5662U9X9XS8d0VzQlhluu012ZPaos8O/NMW3dPQn9dfZ/g056qRWzeAkpaltD2CIo7Mhz53XyTg8/rmqU7gpngbpu/4V7itN6W8E0r2gK54OtvjeCpGFMNPqmgDcPg4CcH7Tj81+JtCuTtMUllSP7kheyn40x6XVlzBALHlr9MYbTkVo9fx3vuuERHFKHKlEE2t3hQDdS62gdImlTX13ABFHQggLV9yXGunEXd6JBesB6dQTSvbu388xhNxroNcCcV4jbgnWC0FSYPSYGf8jS+unNToHtZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyjLQkzkc1ZqqGKPhjryiBA7YHceuzQzuVY1eF2oM9M=;
 b=LOBWGSRFvZxkLkPvBCNFsG149odutLFwFd2YBwb9k4FtKlfGvCEzbqgTPXIEeTqlhmX1tmVsBkAfbGB81dyFkBJO3Kvr6GFihkzZsso3Y6RrNfnyFa+36gaHLS5aWK0Q1BR/cu6FrrR9aN3YLGTDYromsY/SitAWq92aoLGM2crkAeooqKcQepeBYSbTdl7/6hPt17f0dESQq3kgDz+uwsdIEmvGeRW/3z1ITDYuSO0fJ/wMPBSSsGQri1A5K+3sqbhxHF5QiyUWQHrbKNYP9OCT5og0sHLPgYpybSJg66lT9smf54OEQSXcJt4jspri0tKEqY+qb9FTyK2ftSVdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyjLQkzkc1ZqqGKPhjryiBA7YHceuzQzuVY1eF2oM9M=;
 b=E7FG5ZXlC+lmSp8KJ0QbkkGiztC+B/us+0vMo/fOQuiz8dWCwz3WpYeC+a1YfFvBF6VmTX9gdxr/P0m7j/ZQf8KtHI7U/+JA6pXk/2HKvHONyw3Ju5IMN01z0OJdXDEFbBDWh/NHbqhjrPNk/nH9g1ARwYZp/ADTsd4iAourbaTzP+7iqUEifB932dgGyTSdk9hzw2rgn4/CksGtVQYWjHgICMCNKuy6MKzD1YQ0RhJyGnknl1UrVLmLMJkYaOSo/c7K0+rl0WwGXb6SGYg5/z+Rn01ayU/A1m+lt86pXL0IuaBHCDcuZsBsCcJBiJtEtnUN+ajUGZM8WCovCZpP3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 19:38:41 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 19:38:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 15:38:39 -0400
Message-Id: <D9F4G2PS9ACB.20J8ON7DQU7GK@nvidia.com>
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Zi Yan" <ziy@nvidia.com>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, "Nico Pache" <npache@redhat.com>, "Ryan Roberts"
 <ryan.roberts@arm.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
To: "David Hildenbrand" <david@redhat.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Matthew Wilcox" <willy@infradead.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.20.1-60-g87a3b42daac6-dirty
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
 <aAp7ggknCytUyAXd@casper.infradead.org>
 <40e69993-e83b-4019-943f-ab90a43eb0de@lucifer.local>
 <bc0b7131-ae02-4675-9a21-23d432c20f19@redhat.com>
In-Reply-To: <bc0b7131-ae02-4675-9a21-23d432c20f19@redhat.com>
X-ClientProxiedBy: BN8PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:408:d4::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e357473-dbce-4cb0-33c0-08dd83679de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXcwRFhUNUdZaGU4ZDcvaEQ5N0pqRDBsVlZWR0NhYnBXenRkUkQrZmJ0bThk?=
 =?utf-8?B?Z3d4aVl2WjV0dkErYlRsMC9ISWVaR2IxemhRYzZVeDg4d0I4WGYyMjNjaFZM?=
 =?utf-8?B?cUZuRHgva2Y3R3VSenlieFNkZ2FFVEdYeExGb2ZhTHZXdGxhU1dRb2JXSU81?=
 =?utf-8?B?NFc2dDl3YUZ4NHRlVG9NMzNucmpQeEZ3bkp6OUlTT1dtbFA3Q0pwRU1YeDVn?=
 =?utf-8?B?dFljd0E5T1Q2bExsc3JPR0hFYnZoa3pRRElNc3BPTTFsSE8wSm83TEZFZjFS?=
 =?utf-8?B?dVFKVmFLRUM4cWlwTUFPY05TSlhWYTFBQnJjZmkvYmJka3pUKy9xTzZWcHRK?=
 =?utf-8?B?ZGpzRE1ROXFyU3FHUExLSExNdWFFeTJ2VG9Vc3dKVDFJTWxrZXcvVnA2cHBx?=
 =?utf-8?B?dHV6VTVUTUdCTGhxNjRkTEFtZmZob2pxRzhQTlBOOXFOUUZOTkpGb2VMQmxF?=
 =?utf-8?B?aWVhdXZBU05KMXlDNE1XbnpkbDN2WTZZYmxmRzMyUWhrVXg5bjFNL0hhcVYz?=
 =?utf-8?B?ZXVDWDVSU1d2RitCbkU2SDRaWVBncS9tUmhXTnAxZHNQTm9qUCtKVHE4ZTA5?=
 =?utf-8?B?cXFKbWUrRVJBZ3gyWTZXbkdRTlpWVzAxcnhUbEEzZDZYQzA0eUg1L3M5U1U4?=
 =?utf-8?B?dnJFMngvcjFURGtJc1JHUUFuaU5yWWZaSWd5S1BGU3ljUWpHd3hGWWhSR1VP?=
 =?utf-8?B?NmJZUWFnejUvQWRxUU9sbWJNSHVKRkIwTW56d00rYitpZm1YMHNKTFZOMXRh?=
 =?utf-8?B?NFBucSs2RWFoNUZ4Qzc2eVJXNEZXNFhJWW54ODlFM2RFZ1lsbUJ3Mzk2aTdx?=
 =?utf-8?B?L04wbDE4SytyeHM3cFBQeTdrRTludE9QazFZdnN4OHZUNG80bzFOck9WU01r?=
 =?utf-8?B?eTgxaDE1SkNhdlJ4YXpxa3NCelZIdmgxc2hrcktWeDVEOEJEamlNdDdmN2FF?=
 =?utf-8?B?T2hSRW5SdGUwTEV0LzlZWjBobmVHNGZhWGZIUHJ6QVVYTkNQUmdTMFNVTVFI?=
 =?utf-8?B?V3diWHdkT0ZOMk93SmovRjA2aUdIcWxVaG9RQ1dSRTRWcWdWRDg5VlQ0cWRB?=
 =?utf-8?B?bDZoZjA1VzE4ZTR3elJobGQreUY5UDBsdkNYNWlvNW5RS2VFQXY0bXEwR3Bt?=
 =?utf-8?B?T1NmdGFmeHpGTnNkTVczRzJtRkhBQWxucTFHaVhOR0pLQWUxVzllUCtXODhn?=
 =?utf-8?B?Rk5OWjRLaXF0SUxQQ0E5UDNHcGtucjhsOWhNb2IwRXJIQlZBNk5NbFZ3TFlw?=
 =?utf-8?B?TFM1TTZFc3ZuZ1FIR2RkY2NpZENZSFo1WjhtLzFxeUhwbmdOWXBMa1F3Njlv?=
 =?utf-8?B?TC9yamFBMjd2UHlsRXJtcVA4cExkZGs3bXlSRDl5NmRBQzFXZW42RUk1N05X?=
 =?utf-8?B?aVZ1T3pqR3dQcTliMTRYWkd0Tm4vM0lWekJGNTJKU2lHNk1CcWgvQ0ZCQis3?=
 =?utf-8?B?NkI4eWdoRTdxTG5GTit1NWZjVWNEOTBvcjNQcXlsN1BnRmM1cytQYlhZWU9J?=
 =?utf-8?B?Smd2TUowb0RSU012QmQ4L0FPVFpTVmE3b3ZreFV6dVZwNU1ZbVRzY2lqY2k4?=
 =?utf-8?B?Z0wvM3VaTjRrbVlNS3p4Q2ZYd1VoVmZxeFpvZ0p1MHgrRThNZm0wbkpZSktK?=
 =?utf-8?B?WERJYTVzTm1oY0doNjZFcFJ0aG1ZZXpWcUxBUkpyd3JTbEpzWlp5d0N0ajRP?=
 =?utf-8?B?RnBTR0pOaU1Hd0p6NzZHMGYzc3pIdkRtT3d4cHZrdnI4TEdmYWVCd0x5SzZ6?=
 =?utf-8?B?eHV3c2hCMzhRdldRckpEdUdmV3FlOGlzZmFBNnh3NEo0eFM3NXk5YkhpU1ZP?=
 =?utf-8?B?WDBSdUpxR2J6SWZnd3hLZklTbFd5NFhSVG5zS3I4azVJejdhNVlUN1B5RUtS?=
 =?utf-8?B?d2hQK0x4NnRkUHJvNFVkQjlLVFgzeFlwZ3NYdlpocWVwK09EcXEzOHlTVzRs?=
 =?utf-8?Q?5L4dK1m90mc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2drVGRJZHhCU0loRHRxdjYzVDhzdENnOW8yc3QrN0JXWk5Oa3kwYnpEaU5E?=
 =?utf-8?B?QkV3RTRsUzZYcVBuMzJqT0JOdEFJWE5PdDE5UGtYN00rMjRaalJFRkdMQ0FD?=
 =?utf-8?B?ekZvSFFhZjhSYkRoektBM1U0VEsyY3RzczNzcHVHVGZnaXg2QmxiR2kwUktm?=
 =?utf-8?B?WHQwMVVjcVVpQVR5M2VlbEh4aXVvT3E2VXp3c0tGRVgwYnh4clBiVmk2bmJQ?=
 =?utf-8?B?dWtaejJUOTVQb3RCUHpYOHg4bDhMNkpET2grbjZQcWU1V3E0dUR1R3YrWkV1?=
 =?utf-8?B?bDIzRHprWncrOTVaMXExakZ4N3Qxd2VvZTEwQmRnS0srRzljYTBqRW9uL0t2?=
 =?utf-8?B?YkJvaDVvclBpbUNxKzRqNEcrZ1MzUXJnay9OallkMWZ0TEdFeVRJTmJoK1RG?=
 =?utf-8?B?eUwyR1N5dU0wK241aG8vNEk2dGZjUUdmODREc09ZTGhsL05FbHFJWXZTRzR4?=
 =?utf-8?B?WkRkRjVOM3AzZUp3QUZPcDVPeVhDNXhDQWY5RFBHcStmdnBPTWY5VmtuZmNH?=
 =?utf-8?B?bldPelJLL0JDSnpETUtBbURRak9kSy9qN2xDQkR2L3RENXE0ck9KaXk0WjFn?=
 =?utf-8?B?RFF2Q2N6V1dFUW00QlhBdW5wV3JZQVBQaDRQcUpRUlhiMkhJdjVwcldjalJK?=
 =?utf-8?B?c2ZiSE1hdjJnd0lrWC9iZDV1Ukc2VEF4T0JHeXp0ZUJhVXBVOWNvdEIzWGZj?=
 =?utf-8?B?ODg3WUtQMGgwOHFOQlJRU3B1ZUw5akNnRG84M0tHNUVTaDZpR3hnRXNCUFho?=
 =?utf-8?B?ZTFyck1LYXZiaXJVbUNiamZ1cVRPK29JWlcveHlLcTYyZmFNYzZML2paUmpn?=
 =?utf-8?B?ek5TZjJQT09EUzFNcUUzSHF3SWgzenlZYi8xVVBTaFVMWGlNMFB5NktsRWZs?=
 =?utf-8?B?M1BEdXBKbHVJL3VPUW0zeEpZQVNodE5iRkZKeERvMGJ6OU1ROG1UNWNjNGFP?=
 =?utf-8?B?ejQwOWtIa0svNlg0QWNDbzhOaW8zdk5rUkpMc3dKcERHZkNhMXUrUWdpNDNC?=
 =?utf-8?B?U3pYcWF6YndsOW9PZ3I1YmdSNTNtKzNGM1NyekFzS2x4bkJQc2VTbDYwTjNs?=
 =?utf-8?B?RlZlbHlkRmYwRjRaZ0ZaTEpHdzByT0I1Rzl3NWY1RTFGRWUzd09QSytXL2Jz?=
 =?utf-8?B?SVlLRnc4VDQ4bGd3eUVKby85Mlp2R2xuWmw1M1lneHM1ZW50K3gvQWp0bWdB?=
 =?utf-8?B?TCtEU21kOHdiL1IzWmJKTnorV0p2K2ZibzZwLytXZGV4a0s4V3grNGhvRFRi?=
 =?utf-8?B?V2NPbzhpTUJUcUc1NXRMRkZVWVgzMWt4ZWkvUTViR0d1M1A4eVV5NFplUjNB?=
 =?utf-8?B?MVd4WkRnajUxalJUb1JXR0o4YTB1L09rVWYyaStLYXJBd0U1ZVZrdzZUSi9T?=
 =?utf-8?B?ZGFtODVPcG1FWU1RNm5FcUhKWk05Vk9wbzdFRUVsVHlDeWJyY2JEU21Yb3lk?=
 =?utf-8?B?ZFJBVlhOSDNsNTVqVnN6LzQvRk96a2dnQ1hUdXlubDl2aUQydVRJdU56dWVv?=
 =?utf-8?B?aXgxZXozVUdXVE5nV0FrMnBoYk00ZFpVVU9QTlgzY1RvMVpYMDhVMFcwVlJ3?=
 =?utf-8?B?SUx5OXJRUmJXaWFWRlZrSGNCUzJwK0JkNUNuZThnNktNUjlHOXlDNVIyb0ZE?=
 =?utf-8?B?T2JjOEc5OFhHaFU1cnlORFZ1N0xsMjJTWEtXVmhKTDhLM0x4WWF2WWprc2Zm?=
 =?utf-8?B?aGE3MHBvUWN6SGVpOFlqTE9EMC9mcDZBV05mVXlpOGFXN2FkT081ejN1K3BK?=
 =?utf-8?B?NURnOEg1ODZCOEVHVDNsVVFicHZNZ1RTNXBPZkN6cktIR1U2VTFjYUg2dEZP?=
 =?utf-8?B?bWIyYXlhdFlyVll4akVTNHdHZGRGSFpHQmFVUHhjMVNDZ2dmc3FDQTZoUmJV?=
 =?utf-8?B?WFIxc2ZiQUlOeHJqN2IxdDd6eUZHcGlUTXhCT2ZFUm04eDYvQTcrUGhwdEpv?=
 =?utf-8?B?Vlg4cnBxRmExRFJYWnUycWFMM3ZjOUp0YVBVc0Ftd05yeHlVaU42NEdTYUJ2?=
 =?utf-8?B?VHRVb2k3UldQbm5lYUlPaFRkRWlKTE9idVFmNUFOVnh2Wk9WTHNLVE9ZYTZx?=
 =?utf-8?B?ZkZrQVJnWW5XZjd2U0JueTBwQlJqTnZGOWRpYWZqMXd6VTMvODZDUVRWWnNC?=
 =?utf-8?Q?fGltxZ4+/41MrkOiIQHqFAEcj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e357473-dbce-4cb0-33c0-08dd83679de2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:38:41.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h70ql2P1LTd7AXKh2sGtW/4fXBht58wgNAjzGxhDHX5fypWdjc5iPsbpYxYwUYkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

On Thu Apr 24, 2025 at 2:44 PM EDT, David Hildenbrand wrote:
> On 24.04.25 20:11, Lorenzo Stoakes wrote:
>> On Thu, Apr 24, 2025 at 06:57:22PM +0100, Matthew Wilcox wrote:
>>> On Thu, Apr 24, 2025 at 12:16:32PM +0100, Lorenzo Stoakes wrote:
>>>> As part of the ongoing efforts to sub-divide memory management
>>>> maintainership and reviewership, establish a section for Transparent H=
uge
>>>> Page support and add appropriate maintainers and reviewers.
>>>
>>> I'm quite queasy about this.  I'm doing my best to make "THP" disappear
>>> as a concept.  How would you define what THP is?  Originally, it was
>>> PMD-sized-and-aligned allocations, and some of the way we expose it to
>>> userspace, that's still the interpretation.  But we also have folios wh=
ich
>>> are of some hardware-defined magic sizes, as well as (for filesystems,
>>> at least) random other non-zero orders.
>>>
>>> Memory is just managed in variously sized quantities.  There should be
>>> nothing magic about "THP", and I'm still annoyed at the anon-mem people
>>> for baking various magic sizes into user-visible APIs.
>>=20
>> Right, but as it stands, we already separate out handling for a whole ho=
st
>> of different THP things by file, which get_maintainers.pl knows nothing
>> about.
>>=20
>> For:
>>=20
>> 	include/linux/huge_mm.h
>> 	include/linux/khugepaged.h
>> 	include/trace/events/huge_memory.h
>> 	mm/huge_memory.c
>> 	mm/khugepaged.c
>> 	tools/testing/selftests/mm/khugepaged.c
>> 	tools/testing/selftests/mm/split_huge_page_test.c
>> 	tools/testing/selftests/mm/transhuge-stress.c
>>=20
>> This is not a philosophical position as to where we _might go_ in future=
,
>> or how we might decide to treat varying folio sizes going forward, but
>> rather a purely practical step so these files get seen by people and the
>> de-facto maintainer is ack'ed as such.
>>=20
>> When we get to the point where we can simply treat all as the same, we c=
an
>> reflect as much in MAINTAINERS too, this is not set in stone.
>
> Yeah, I think we all share the same long-term goal of not even having=20
> huge_memory.c anymore; it's simply not going to be special anymore.
>
> My hope is that with the planned "auto" mode for anon (m)THP we'd be=20
> able to switch in the future as default to a "let MM manage all that,=20
> it's now smart enough", to slowly phase manual control it out. We still=20
> have to deal with the legacy Huge/PMD-mapped stats that keep annoying me.

I agree that we should not have per-order knobs like now, but letting
kernel to figure out everything might be a stretch since it might
requires a lot of profiling to get some information about user program
behaviors. Some hints like madvise(MADV_{NO}HUGEPAGE) could save a lot
of profilings. Maybe your auto mode includes such hints.

But pagecache does not have such hints, maybe file accesses gives good
hints already. Matthew, what is your take on this? Hints or no hints?
Or anon mem is different for this aspect?

>
> Personally, I wouldn't mind moving it under MM core already, but for now=
=20
> this might be better to find the right reviewers. As you say, we can=20
> always adjust -- especially once huge_memory.c goes away because it will=
=20
> simply be memory.c, or whatever that file will be called then.

Yeah, I guess we want to be able to distribute patches to different
sets of experts, otherwise all patches will be sent to a large group
of the same people. That might be inefficient.


--=20
Best Regards,
Yan, Zi

