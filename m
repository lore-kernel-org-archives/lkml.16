Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319427EC6F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323895; cv=fail; b=Cq87Jf232pTMLdMmy43wJSRPOKVUzolNf0xXEUQ6euQIYhp80Yds63ZX0VwOdSWaCwv+YrAyL8NmtsyoRlokUyQBAt+/NuLDYAtPipB6aaX0Yp+0BbmlJ4WOizcjC44ghU2G3jN7k4M7BRe+cyVpecDjLpaluaXuOUI6mbok0OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323895; c=relaxed/simple;
	bh=4q2hjrNatFNRAqcq6JEFuLOFxjAxqKMAXMyI0dV4dEg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AejFHMJveJ/gJlTK6iuCg25phH0LwlLY3aAuc62dzSpAfRTxuncV9qXwqs9PzTlBoo5AXOOrfHEgjs0KWx+FmzN8GDOwMcAOQLLUSh3PW9tdzEHz/MegjqSoOWWv7cKqqxgHPLDET5G0BZtHn8TXLvjRNXaNRh37s7ScaAMPK/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JE2v5+2N; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JE2v5+2N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWsxhQxAdhXvo1DbDax7/kvfV+4qzFwAspLmCDg/SEocvHhHfKm6vaJr/medo713pbXwpnCVWoQKkhWmy0isZsxrH8LXrqA9r+72SFtTEyG72Mv2v9j+zbv93+9mYdEcq/EsRZz6J5bgYKY6C26wqDOI4o0pYhHaQpf4x6aRqfBB/akhaxT1zamptBCngUKgXvq2DPS81mbzw5jO7lt3t8BrmrnnQ/OOJBenIrAL/DuYiFVJtBPqpaH85+e9sZzCqCNNVAFQSBbUALL+aaBuG7aDcR6elmR3pktkN6AffaUkoRqJWBHP7/UupI3homhyjZU8gIEBeMaXFKYPpiNkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKRKmKPT8VyziZNbF6wIlN0N6ILIVDVZJ68O5bieOdk=;
 b=mGertoOoLcXHPB3FKU4Ls61pN35XeRszxSh0VvMqtlU35CSXitqf2uL2p4NhQ6PKAJZlzJ8fZ//jvtBVwL0x8h2AAVCFfti71FoaVVG9Icuci6UrBLobOlBwSqcEpncB4t75tzWl4oRv5LuOd7/h2VaYlTWMqz9pBGsFI6Fejdrti8iH09GUeiMe1ks5CpehZBX0/7FSiS297IyyPNhWgHkhwROiMxzb6B2E4AsDQskBPV9buYpDes4/DDympLd0P4OiVBM791OWe6Xnhl6tC9kJNkeW9zg1sOesisA0xkLEjJaSOrTtkWcZa27RdHCiLPxXhXj3vX/vS9KoMKGZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKRKmKPT8VyziZNbF6wIlN0N6ILIVDVZJ68O5bieOdk=;
 b=JE2v5+2NqNkPt0o2rFqm82EJMIppt7JC5xQ+GY93bdwJMSCPwo93RJmG82OlE1hriHIbIEAJq1En3oyWiZOEqV84Osh7pbBOJlbrwfL74o3cQgi+EAReP11nmkL8r3LomnZyqbSXH75ZjvRCzqUw37OAeScmDqnfDNgVonQAl2/U0jstIgPyH/DF7otQZ24wKZU6YlM9Kwb0hXfCuBZdmydygeIurVKFa0X3T2FtMH77zlahy8khBBsh7jExZzZEHUxbMGM/CHZnyWI/yTvFKB4QYo303muQDsbypK0ZExLXQezCgi6b0LjOwy6ufaBLuX38YPd7Z4eV3vz3e0iNxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DB9PR04MB9284.eurprd04.prod.outlook.com (2603:10a6:10:36c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 09:04:49 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 09:04:48 +0000
Message-ID: <fa052786-f22b-4dcf-a9ee-a9378db9f35e@oss.nxp.com>
Date: Thu, 19 Jun 2025 12:04:45 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add NXP S32G RTC driver
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
 dl-S32 <S32@nxp.com>
References: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250526163259.2470550-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0040.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::9) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DB9PR04MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: db28ddc9-6373-4a6f-794b-08ddaf1057d2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dS9lc1plekJwZ3NFOTJSM2p5TWRpODNKRHRHVXBoY2NxQU1HNEJNZG8yeEtt?=
 =?utf-8?B?RXJxc0sxNm1ZN3lyU2pac0ZobDQ3NnRyL2hHK1RtRHVMRXRIYTlTb3RoeGxP?=
 =?utf-8?B?Vi9aT0pyenpEa0tOSm13cG51TC90OEpmOE85R0Y1TGlDVlIzeG1nRmVNbkFN?=
 =?utf-8?B?RmthUVdvNjJ6OVFocHVsS2FncE10STZzb0xNdWo1aWJkTUc4OTBqdG01OStu?=
 =?utf-8?B?WW1nb2N5Qnk3U2U1eW05L0FHU1hWQ2NlYlEwK2ZFR2dFeG1RbDBhb3F2a3dv?=
 =?utf-8?B?Y0ZDOE9TSGUyaUFCOWxuYXZjbHRUdjFZWDRjL2NubkcwNDBpYUFhUnUzUE15?=
 =?utf-8?B?VVR3b0IycS93RHNsTDdCOURic1VzU1ZKdS8zaVdXME8xRWRKcGc0WWx6RE42?=
 =?utf-8?B?a01QTVp6U0lVY0NQdWNUT1hzMkl5aUJUeEpGZDhCRExOeFV3OVZzVVBxUW03?=
 =?utf-8?B?VmJkY0IxK0QzY3pmWUpVRmFOcDhqdkduL3BVYmJYNkRBbjduN1VQZEVNTzZG?=
 =?utf-8?B?WWtKNGtnQnR1ZEZCUU8yWXNZU3RJMVNsVkp4REpXYjcxVWZ3bGQxVldCT1hG?=
 =?utf-8?B?bXZYZ1QwRHVJT3JseWwycDJ6UlIyTFpEdDIyR1piSE02KzBMbmZ0YVJNVzhh?=
 =?utf-8?B?YURzZzR4Z2dVUE80aUI5bjF2TnVLeGtDd1pWeHdOYjBrYjU1cUZwNk1XZVVr?=
 =?utf-8?B?MnFhRGZKU0NIYnNtQm9RRGRiczgyQ2lCWXlqVitCOVJmdGVnUzFKeFYwSVpT?=
 =?utf-8?B?eEp5enJoNWlEcFRNQi9YcG1LWlNrSXRrZ2sySDg2KzA4cDNaTlp3cGFqeFMr?=
 =?utf-8?B?SDdaVFdpWEFYMkhnRHhpMW1TRm8wVkVFdm9QT1FzUUdlQitDV3dnaUZXL0xN?=
 =?utf-8?B?bzR2RjEwSkpFVUJCb0VGblF4Skg0Vm9GTjRaREF6MEhhdW5adCs2em5sMlYw?=
 =?utf-8?B?YlkxeXdqMUtFV0lKalNYdFEzcW9YbDRRa25EbmRFVHJ4M1VOelFzNTdDR1Bw?=
 =?utf-8?B?M2VmT3hXS0pub05teCtIYnFWd0JwZ3dmRnNIWHVQZkZENUY3NzJVbXVZOE05?=
 =?utf-8?B?RjRTYjdtU2x3QnJ3MlE5OWNmbnF1eVkwRThCM3NVRmJ4NHVUQSt3TllOaU5p?=
 =?utf-8?B?ajVybVUzVEFlejdJRXJVNWtxVFJqNHN6K1pkbzhBb0MzMkRHRUowMkkwb2Y4?=
 =?utf-8?B?bEFINjhtSXdXemJGVHVEcm1BUEhiUGVVRkpyOTNBZjJ3NStZUUV6WXZheXQ4?=
 =?utf-8?B?L1pPRmR6ZkZ4RWF3UC9FV21VaDUvOVhKVGdPQzRuMXBLQXgybVJJbXNTdkJh?=
 =?utf-8?B?SmtHbU5mVGxqQ0FaNldqZDdSb2kxbDdFZnJWVkM0VzBwdXZIb3c3WTRHL0xR?=
 =?utf-8?B?aGJTYVlsUTZmQXRaRDh4QVhCQkFmdjRJSmwwdjZsY3Q2NkhCbG9OUlBQOWFN?=
 =?utf-8?B?RHltUDBiSTNUcEQ1MVVqeGVMNy9xb2JpSHhrblltZTB4SC9JUXkrYUZaSk5v?=
 =?utf-8?B?T09SNG9NdEZsMUxybFh2SVdJVEtXY29WSkZkSm5hRDY4eUdFSjBya3ZFS3U4?=
 =?utf-8?B?OVlQSHQ1RVVEeEFvQXc2NzRpYXhEeGNyVGhkNVlOMlpIVHlHbURtald4K21q?=
 =?utf-8?B?V1NmY1Q1WHdBb0RuU0lVRGpYWEpXZGxzT1RLVFM5a2dSWmRuWkpWc0RjL3RN?=
 =?utf-8?B?bnUzZ1F6Wk5GNlM0TytFeDRhTTRrN1czM3RMUmcwZ3BHUkVVaWdZUTYyQUpR?=
 =?utf-8?B?U0ZQdWxaYmpTZUlNajRDQ0srRmc0c0p1VlRVTExGR1NwYTJONmtsM0p4a1Bl?=
 =?utf-8?B?L2ZtVXhaM013L0FqellUZGZ6NTF5dnQzY2YvQkpTUmFyVFNnR0I4VDNhTUNa?=
 =?utf-8?B?ZHMxWUlVTVZWTFprdWhNK3AvLzA2SkYwY1BGYmxlRVYraHJ2Z1lJaVB1K1Fz?=
 =?utf-8?Q?wxxiprmBczk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmZYblorOEdZaHNVL003VnQ4NWQrNDJsOExDeWhCTnBXTGU5UzFtU0dXaGIv?=
 =?utf-8?B?Ymg5UWd2d0MzRXp3VTYvVnluNTJ0ZC9EU2NQQ3FQMzZmY0Niby9RN1UwVGx0?=
 =?utf-8?B?S2hXY2lQT0grbU1LM1YvQ1pzbkpVc082T25Wb0E0Z1FIU01jMzlkMkFOUDBS?=
 =?utf-8?B?MWRVNGpUeUd4RTBzUW96d200T0FFVkp0Y1F3QWFNZ213MldmOWlhTmFzL01h?=
 =?utf-8?B?dUU1SXdjTmc5ZktpME9YbHo2aHJUWWF5WDlXeVdkSHhnOGM4UW85RENIQ1Z6?=
 =?utf-8?B?V0hQQWhabmhnYzBDZWxHVFJ2dENwclc0MVNMaWJOeUtSSVhWUEp4Z2pYK0VJ?=
 =?utf-8?B?S1g0NjQ4UmN6UjlUM01qSkRLSTI3TkwxUFZRRWZQSzNQeXZhRGhwZzh1ZmM3?=
 =?utf-8?B?OG92RU9VSkliUk9IbU9aSStPcDcycGJ3N3BTNzg0T0xGaGt3a20rbmFsUGlW?=
 =?utf-8?B?cUZGWlFwY0g1OHZKaWVVcks2N0YxR1A2ZUJ4bFRaVTJyVXhERllFTFJNdTNO?=
 =?utf-8?B?M1BPN1pvL2dOTDlTN1lIcWI0enQ2U2dCL1NKZUhBS0pkekV5TTJxdjVEWS9w?=
 =?utf-8?B?a3J6TFkrZ3ExVm5EbnV2dk1JUU9La1pPU2hNU04rWm5ndUNGaG9OSUJ0d0RK?=
 =?utf-8?B?YzZHbVprbzVYSEY3Mi9QVGxKdGlWRjUzWDR1QjFtdUhzek5udlM1dWkwa2ZL?=
 =?utf-8?B?MW1uQ1RyVkpyMkZuUHdOb2dmZGFGTVA5Z2lGZEhVSDhORUNXSWRLNElteVJU?=
 =?utf-8?B?RVc3TWhRb1FtVWRNUlhHUGhyQVJvSzVWUTNQL3hNNG1VbTFsK1ByYVhXVzh1?=
 =?utf-8?B?NHlGdTI1MVh4SmloRmlySDRjc0paLzBZbTZTR0JPcW9ibFVaUGdHTmc5SHAz?=
 =?utf-8?B?NkMrMjFwa0xQU2IwTXlxT3NOTnF4Z0YrUGpFaDQ4STY1K0t2MWI3Qzc0T2po?=
 =?utf-8?B?WTJGb0ZOY3FwOFV4UThvUUZWZWVTL1RlUzB5MG5tbjJEWnVSZjJEZ1NIWk1i?=
 =?utf-8?B?UkNmR3VXU0FSb09PMzVzbC9SVHNBY3RTNzdOMHVRWWN5NmdoTHpvUWxZTTdZ?=
 =?utf-8?B?NExjZXAyVXlkL1hybWpjcFhrZHRlZTlXdEYxdDVkcUxmYitRN2lraytDbGwz?=
 =?utf-8?B?ZHZkNGdRa2NCcEl0NHhqNU8xMVloeFNpYXpqdmFKUU9PVTFEUTNacmJQOFNB?=
 =?utf-8?B?K0pwM2dMN1k5eWh2anVCZXcrMk5oSEdXK09pdWl6RXJ1SGw1dkdBMVpqY0Zn?=
 =?utf-8?B?SS95MnpONTZMWXJoTERybng0eHJsRW9sWGh6VnFGNFpudHNRUDBLbk5Yb1pU?=
 =?utf-8?B?U3JFSkF0cW1majQyMjVjeldlTUN0a1cyZG41bUNwUys3QWcvZ3ZPbVM0dnVl?=
 =?utf-8?B?b0RGUU9jZzdSVk5iOWorR2tZQ2piTktWcWJ0NG90VElOY0UxQWh0RlRpQlJU?=
 =?utf-8?B?cUpkR0dtSUc1bHFVZGdBVTY3RnlGQVZnd0NhUzgxL0hFODNQbEk2VENqdFB4?=
 =?utf-8?B?d1dJaTQ2K1NuWjErR2h1VkJqVWtmR09LeGY1VUU0Vm1FYkpmeVluckt3ajdC?=
 =?utf-8?B?cG9WcVExZjZITWExSVVvSmZvQUR5c0lRK0pwVm1zOEd2ckp3aGdSdFhMSk1K?=
 =?utf-8?B?TGRaUk9aUFN5N1BMRllTcVZRZUFxeVhxaVRrVEJoTjlRUVJBcVNDZjE5TU1q?=
 =?utf-8?B?dE5SNy8wNHkrZzN3c1UrdWRXNFNkUjZpMUdtZ3NyVEZuUTMzVHEyUEJRaDVC?=
 =?utf-8?B?NzJPTFFQN2hpckFHcVdPeXJta3V0MkQ5REE4UldhVnppNmRrYSt4MllGNkZ0?=
 =?utf-8?B?UE4zemhBbWZoVVNJcEYrWWJOQU9hWHN0Y00yZ2lmMzU2am1pRWlGS3p5N1lj?=
 =?utf-8?B?Y0M2ZjRpZzBRQkltNmRaVnUraHZNem1IWWZJWDlZQ0NaUGdFRlJLdTZwbWs4?=
 =?utf-8?B?RmpQbG04c3NrSXhpVGw2VWRUT0p6VVNWT3ZpTmdEWW1uZzIyeHBsSHFZd3Nj?=
 =?utf-8?B?SUlYLzJQU2ZnbkV2a3Z1Z1JBK3dXVFBTbkY5THpWRU0yMUZQQXZlUFYrQjJB?=
 =?utf-8?B?SmIvUmd4dmlTd3p0TjBuK3R0eUM3NGhyUklINmdHdEppa3FjWkM0L2poU0oy?=
 =?utf-8?B?bm5hYXNmeFhJNG5NVmIzR3luaktaMVpQc0JTQ0RXZWtublJwaW5EcWNVWmRw?=
 =?utf-8?Q?d79+TGW28/wOwD/ri4AN/lg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db28ddc9-6373-4a6f-794b-08ddaf1057d2
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 09:04:48.8123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj96xVcQdPN8nMNam0AlhvLz5R8r4xI+eR9ZXJ/ddChGqfURq/zZ7BO5Gv8gZmqP2q110iIsuaKJkfbD/v4UkWMjsRZQlwGrlCa2RuGUr6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9284

On 5/26/2025 7:32 PM, Ciprian Costea wrote:

Hello Shawn,

What about this patch ? Does it need any updating ?

Regards,
Ciprian

> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add the NXP S32G RTC driver as maintained so further patches on this
> driver can be reviewed under this architecture.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e20de38ffa54..dd0c02846de7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3001,8 +3001,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>   R:	NXP S32 Linux Team <s32@nxp.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>   F:	arch/arm64/boot/dts/freescale/s32g*.dts*
>   F:	drivers/pinctrl/nxp/
> +F:	drivers/rtc/rtc-s32g.c
>   
>   ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
>   M:	Jan Petrous <jan.petrous@oss.nxp.com>

