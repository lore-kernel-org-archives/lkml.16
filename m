Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2120.outbound.protection.outlook.com [40.107.100.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9421A451
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640804; cv=fail; b=hyonKoB8G5zMhBLAOYT3Pmfj+sQPY6SxQUQXnORhDVfk3s/efHIhasts8QK2KAkb/Wpo2Ot6i+4OZNLzTR9gzTLJ/w1dxRKpWRhoaBx9LlUsnf5BY7erPNc0rLmgFv3R9jR1/rwbCSNtj3JPKKyvgzcbLPIVklvua29oGWIQIwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640804; c=relaxed/simple;
	bh=/6CRbWzQ2dqVtgxrbwk8OjseeObYXie7n8aBgmHGAn8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p6S3wZf3taZvkCJfodstllRg5/6miOd7rxNEvcABksFgad7id0Lv/0w/ziCeqPTLlj1G4Rl9a1d8ixAbehKfZtJhQ/SsDbgjt1bwb93IhSg7Z8pY/eOVT9kCJPden+wnwPrejHgVc9E9oKp9wkGKrE/x4Z1b4BHWAiaXAEnuQzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=ifXlTmEW; arc=fail smtp.client-ip=40.107.100.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="ifXlTmEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkYeOsV2fda2/H3c67aP/yMunsl15l9BzjizyLCw/tpIYx9QsGgxG4eoFGRou+MkmGkkpSX8htsxgsSFBaSyvYcKzUrg9O4Od2vp6tuEVAQ3mCwgBL570gzAGBYOxXfUzQhk+Oz7odp6EMiMUe8mYwzTzL34AX2TmXrbc+85veJOIYDKIDowPDstqaR9L26uou2hAHcub8Tu5wiWpj1aRLWExmu0WuqFjLzE/4+i+dveJS+PHFlFo8zI7I1Kb0wFzwNpvisWPJOOVu8glyAnxcGyKYMUQhUJpjqryQNyr0AU5jCmwOr3ZNzPNgAShVW25TY7SJLJTNRZi0uf5rL6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e00HIB4g/S3fg3UJnyixTDwUZmA63nA9/iv1zAQZxU=;
 b=lM91i68bQQlPAWJ+TWv/Nyk2VEvE+xLzmPqi3vt4lDLisY+FiizJRRzyo5lQM62JM7f1OVfRm5nA8Ft8ZmqAPHN9d2B9yLebY4v0BPV97z9A27LlldEsWDvfrTUUbhNrrgeSKJT7yKFWUIwzeTyvZdbGT5uKfKI8HnJlxQ2bOIHhfB1g3vNy9xLpGbF1XJRaTn3c/YzYzdZMb9jljVNH2nVX9ES+O53k0kQSLK632M45kkbAr4EuQdunSniehtLMSENih3HLXWlTPIWUjTm2g7gbRhcCrlBohw9nJePvetaUtUHIqwToG4xiLyocbYLLSd8FSksRjUTNKag626XEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e00HIB4g/S3fg3UJnyixTDwUZmA63nA9/iv1zAQZxU=;
 b=ifXlTmEWjDS2AHq3HqloUlnOJ8HoFg1N1rs4ZD8s6gqbTSb3HpB4BXm1UXo/mbaW+83t29M5hemofkA2sKpyPlwoFtY/tMEGtI1FNXV72KX/gGVj+K9wDZAvCchLmzY8V8/UifFghwZ720Hl7UXaiG0P313aj3Xow8Mu3HIJLCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV3PR01MB8651.prod.exchangelabs.com (2603:10b6:408:1bb::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.32; Fri, 30 May 2025 21:33:18 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 21:33:18 +0000
Message-ID: <972a602e-27c0-48bc-aa69-acf6425a3871@os.amperecomputing.com>
Date: Fri, 30 May 2025 14:33:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: Allow pagewalk without locks
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <20250530090407.19237-2-dev.jain@arm.com>
 <1c17a9e6-b04b-4754-8af5-521fcadba1bd@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <1c17a9e6-b04b-4754-8af5-521fcadba1bd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:930:a3::16) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV3PR01MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: d734021a-2fb1-48bc-7ae7-08dd9fc197d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnppSlJFWXhuaFZZK0VaY1VNbXduclVPVE10UFBib1FOVHByRk5WSUFpd3NK?=
 =?utf-8?B?Wjg0eWhBSXZRRzlDU1ZyV1lJY1RUbDdaSHZTdGZVUFVibGFGUDZPNTIzellS?=
 =?utf-8?B?bU40RGZrd2YxbnBGSnE0N09qNUs2QWhhRUdyVGRlQ041Ykk5UC9pSFFtQ2g3?=
 =?utf-8?B?bURZU0xGZ2R3VHpZSGZsUGlOL1ZUeEJLU0lTWXIrdXZZSElGTUR6aGJpN1Zv?=
 =?utf-8?B?UjlSbEg3WHRmaXAyb09YOTNGY1crdGVscWxKQ3lhaE1nbkl0T1YxdGxZQ2Fx?=
 =?utf-8?B?RVNtZzlWK3VpVHdFa1NuOEJCcGdyVm1uTnBaVU9kajlWL3c1VkpkSElLcWFJ?=
 =?utf-8?B?VGRkaFo3ZU9BV2x0cnNXRVNybE8zRWUyMzRaTkdna21xbnJQdjlMQjFjd0pD?=
 =?utf-8?B?S2w2VVlRU3o3K2NaaWVObWoxYTJJeWZRdmxWb3JZR0NOeFFxaDYrZHhKWDd2?=
 =?utf-8?B?UzlVNmU4OXVlQ2tsZnNkY1ZtaDVNeGRjSzh1bUxMNlJlbkNLNktGckgyc1Iw?=
 =?utf-8?B?QmhteUtybjJRTzJCTHVFM1dBbUhWc2d4bkJzS2wxWE1kdFJqM2cwQ0VBRG9C?=
 =?utf-8?B?a1hBZWZicmNSTGFwd2F2bHV3U2pjVjhIYzVPUElpZWIrZ2hnaTd4NDF6QzJv?=
 =?utf-8?B?ZmpONTdnVDg5aXF3YTU4aEZ3eU55OXUzeDhzRk4yemhvb2xYN0lCYis1VDY2?=
 =?utf-8?B?VzFXOERlOVAyNzdvcnBjVjZ3WS9VV0RBWW80c3BHZUVSdk1PMFRLQWF3c3NU?=
 =?utf-8?B?N2xnUnJpM01sNXFRVG5LNUhNRDRVSnMvUXFWY1BpWExkWHFkYnlzU2VMY1pQ?=
 =?utf-8?B?ZlBPR3U4akE1dzdCbVF1bkhrRTVrQUY3SVJWd2NGZDcxRnhSLzJGSjRYNCs4?=
 =?utf-8?B?d2MyWDlMUUo5YlVHa3BCZ09oTVM2RUVjOVFraE8rUHZNZWo5YjdobURqTk8y?=
 =?utf-8?B?Y3FOVkZnZkJKTFFva1FXZjVibXI1SXY2WnRDUVpTMjg4ZXZOcEdBY1ROZG4w?=
 =?utf-8?B?RWdkMlR4YzBjekNsVEp1MDNTalVVN3RhRFF1NXRmOWxTS1JMeWlhSExMbjdq?=
 =?utf-8?B?YkpETXp4TkVWQktWd2psMUQ0RTdVcjFjc1pmNExsNzArejgzSXVvSTJEQzJu?=
 =?utf-8?B?N2Z0cG5kSmJ0ZmpUOVowV0MxQW5Ea0xUbGdBVEgxK1F1amU1bXg5Y1FBR25U?=
 =?utf-8?B?WmdPRGp2dmxmcC9VWEZ3aHVSa2QrQVdkVlJOd0RQczRuKzRoRUFRV1lkRGpN?=
 =?utf-8?B?NVR4S2N2ZnZudm41VUwyT0psSytsRkZTZjlWeDIyQzVWRnJvV2lkdzBuNWN1?=
 =?utf-8?B?TmN3eVdickUxZjBMQ2ZNOHRMaVJhbzRaZFhWSnoyK01NN29sQng1OTlnNFd1?=
 =?utf-8?B?b3U1aHdhdlVqQ3g3S2tXRlBhbDIvL0dpQXlHWlJyQllQV3Q2RmZQTmNyMTAy?=
 =?utf-8?B?ZVVXeGYwRUdqZUF5TmxrWWNKNGJKbnRTazRUdk9TblpOM2pjL2dlVlJsUzUx?=
 =?utf-8?B?aG1tSFRtNkNlVzhkRXVsN1Y0b2dSamZTTUdLaEl5N2Nva3BCRUh6K3p5ODhy?=
 =?utf-8?B?YnRpMWJwWCs1WG0waEo0R3JhbWNUeXV6OHRWQnQwazRJeDV2dktPQjRleUYx?=
 =?utf-8?B?d0RuUWx1NncvQzdzSlR0ajdCOHZMZDJSMFdrZTcwMSsveXgvaHFwQm5jRXUr?=
 =?utf-8?B?WUxHd21QRGFXaDBOUmFteHRDR2FBZHFPQ1dpM1FRQytUdG1WTjB5SC81eDh3?=
 =?utf-8?B?YlBrcVBQYlk4Vi84dG9NOTRsbUhUb0RCMXF3MHVvS1lRTHltK3BEanF3ME56?=
 =?utf-8?B?R1B5VVdyVytra2x6a0tpSFJvTWhNWmxlOUxpUEJvWHN0dmpBRWNkUk5qVFhR?=
 =?utf-8?B?bjMxUnpNTHpvc0NZcFlkTmQ5QWxnMHczdU9SdzZJa1lVMjZKWnFyVUVYemgr?=
 =?utf-8?Q?r8F3Ht5QVIU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC9nMk5EZnludFhRakVkcHhQZnBIaDdrNmo5WTlmVHVTSlh3UEFubHl4ODY2?=
 =?utf-8?B?bHJjWDloM3hnTVQ3bkZiTjdJU05DTlpGVlRrWVNTOStlUmZqV1R3Vnl2RVVz?=
 =?utf-8?B?eVBwQ29LZGZ3U0J3cGl5UzIzU3NjV28xSU5XL1hWQ3RPVmVrWVhzKzV0cmxM?=
 =?utf-8?B?TVdkaHd4MW11M2ttSkg5OGN3Q0xnTERwamdmbTgyZkhLSURCNXc1dXlXUHBH?=
 =?utf-8?B?TzhGanN4SElWTThhSUdUbXUyOHlFV3IvakdMSHR3ZXZqOU02QkpEV1kxbFlB?=
 =?utf-8?B?QTNWMVVxQ2tVWjVYUVN0ZWxLQnZPUlh1WkptRXpDaGd4NmlEaUVvK1dGZ0tH?=
 =?utf-8?B?cmNzS2VhUjBBN2trMUlMZWJrN2lCSGpBQmNsQ2tuN0hSQjRWdTZKdGltek15?=
 =?utf-8?B?ZmpGK1pLaVhrYTVOZ2t3QkJkWjIxNW5MS1liUHhFWGdoZ0FrWGw1RkYzc09R?=
 =?utf-8?B?eTlLU0VUTHA5eVJaM200dksvNVBwRkVBZXRFSlNQVW5qeCtyWVFEc0tWczkz?=
 =?utf-8?B?ZnIxa2FzUnlYbnNPd2NLTDdySWlteUtyNDg5alhIZkdWOHBuOHN4bUx2MUlV?=
 =?utf-8?B?TjJLS2w3bmdvLzcvTmZYcmEvUUZvYjBxMGJYaXNNUzFnVWxkTFVEdUlySHM4?=
 =?utf-8?B?bkNDaW1haWhNZm1icisxUWdlOGFyNEhLTlVHN3lPajk2Q0ZwZDRBdHloOGxm?=
 =?utf-8?B?K2M2M0Zha1R5NnNzd2NmQkhrNzZFdHVTYWQ1anFUN09kQWFuSkg5aEhCS3VZ?=
 =?utf-8?B?dm5zQ3A4TWlTU0JGTmFyWWlMS0IwczdsalV4UG9xdnpSckkwSTBEKzFSUmRG?=
 =?utf-8?B?MUYvTzk0ZEZhUFRxMS9UMDFLcm4wdjZsdEYzc2wxUU5nMWlwcHFhOVFTSmZm?=
 =?utf-8?B?VUlkaFNleWdxamlYdWlMbDVDcUJNOVZPMEF3TDVzcHZHMDUwQm44VjZ1YjJl?=
 =?utf-8?B?aElqMXVBcTJjczFDeWlFYWd5MDE4ZFVIOU0vTVZOWHRsb0Mvd0EvdVdDcTZD?=
 =?utf-8?B?QTVQTFREOHRXekhqTFBRZk9tajlQT3dyVlhCQmNydjY0RDJRNTlWU01qRS9J?=
 =?utf-8?B?QlMvRlpvU1ZFaVhsTFlMQkE0VzBBUEljWFo3ZWlSQzU2dzVaUytiNG5NYXMx?=
 =?utf-8?B?eGJyTzEwNUhuLzZ6NjhtYUs1ZFJIYS9KbUlhM3pwRWtja3hqY1FFb0Z3RXVq?=
 =?utf-8?B?dGJXcm5rVEo5dHpLMG0rbVZlRVhpb2dUdjkyMlZTdVdFOXRMcXl5NFF1dFo0?=
 =?utf-8?B?NWFoUFVycnhpU1g0d3hPNjNEOXFZaFo0WVFRT2lUcllGSFBUemxDd2VtZUxR?=
 =?utf-8?B?QkdqWGIyd3ZGZEY3d1VwQUVIWklBQnBRUUNTaVlQQTMzenYvWlk2VlVHNkhR?=
 =?utf-8?B?dmpFTWwzaWFoTkhZcVdlWHNOTXdPVjNMZzhjTy9oMW1ITmRHdjh2Y1VPc0Y3?=
 =?utf-8?B?L3BuSFNzR1JUMmNJUkROQnlGMUt4TEZyWE8vQ1ExR1JpV1l0ZThhVzMrUHB6?=
 =?utf-8?B?ZjFwTm5aQ2NVRkk5TlNmMS9GbXBGcUlZaTdNRUxrVmM2N3pKMzR6ZmhTVVFx?=
 =?utf-8?B?MTBwR1VsTVN0RUg1cktUbTFXandZNmdHd0tqTW1vNDljbnI2anBaL2FObkR0?=
 =?utf-8?B?V2FSQm9KRStOUXh2N2JYcmkyZGFDb0tNQ2x2N2d3a0RxMmZBYTduK09RYUxK?=
 =?utf-8?B?Uk5pU2ZIRVJuWDBjb0loLzFiYXlJTmMwTzhwbERoRGp0UkhYN29qZFNrZ2Ji?=
 =?utf-8?B?ZkJraWJ6UWdyMUdHTnIvbGMzb3dKOUkrekxFZFVGbnBKelBtelZSeUx1akVi?=
 =?utf-8?B?OVpnaUdFaUNCVjJPazFTT29XdmFPVXBrNHFiZTAzbXZtNTMrZTJvUFVJVit2?=
 =?utf-8?B?czdzeVpTU0F5ZVlnQjZMSGUzUjdVcnlRUy9QYnRmZ3VPdE52VWE2N3pRV2pF?=
 =?utf-8?B?b1BmM3UzOWRTQlJoaUJZN1lrQ2ZSNmZLTmhKNGpWSUZpOXBuOXYxZnByckhx?=
 =?utf-8?B?cHBib0E2eE1TMkFKdjhtWHJOdy9qcHNrcHZoMUZ4VXFWWFRrSlA1bjQ3dG1R?=
 =?utf-8?B?M1JINTlYTW5JMzkzbkN1ZlVpYk5vVzVkWWxqUDdWZTF5SlRsQWR1SHJ6ZFMy?=
 =?utf-8?B?SGJldjRvVWZNczFkN2dRRXVoOFBhUnozV0I5VCt3Q0Q4Q01WNGkxREVXKy9l?=
 =?utf-8?Q?GExsflX45gf7cIqqX/YzGN0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d734021a-2fb1-48bc-7ae7-08dd9fc197d1
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 21:33:18.2210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqwfYTsMsxrLRCu3pFVsvr5CnBWoDHNY3eFlvAEi3y4MIDaP57rxSmR70IU/T9hmcp5JWUm0IDYRQHbmf0rQ4clx6w94Pe7YE68A/c1xhQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8651



On 5/30/25 3:33 AM, Ryan Roberts wrote:
> On 30/05/2025 10:04, Dev Jain wrote:
>> It is noted at [1] that KFENCE can manipulate kernel pgtable entries during
>> softirqs. It does this by calling set_memory_valid() -> __change_memory_common().
>> This being a non-sleepable context, we cannot take the init_mm mmap lock.
>> Therefore, add PGWALK_NOLOCK to enable walk_page_range_novma() usage without
>> locks.
> It looks like riscv solved this problem by moving from walk_page_range_novma()
> to apply_to_existing_page_range() in Commit fb1cf0878328 ("riscv: rewrite
> __kernel_map_pages() to fix sleeping in invalid context"). That won't work for
> us because the whole point is that we want to support changing permissions on
> block mappings.
>
> Yang:
>
> Not directly relavent to this patch, but I do worry about the potential need to
> split the range here though once Yang's series comes in - we would need to
> allocate memory for pgtables atomically in softirq context. KFENCE is intended
> to be enabled in production IIRC, so we can't just not allow block mapping when
> KFENCE is enabled and will likely need to think of a solution for this?

IIRC kfence typically uses a dedicated pool by default (if sample 
interval is not 0 on arm64), the pool is separate from linear mapping 
and it is mapped at PTE level. This should be the preferred way for 
production environment.

But if the pool is not used, typically 0 sample interval, we have to 
have the whole linear mapping mapped at PTE level always. I don't see a 
simple solution for it.

Thanks,
Yang

>
>
>> [1] https://lore.kernel.org/linux-arm-kernel/89d0ad18-4772-4d8f-ae8a-7c48d26a927e@arm.com/
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   include/linux/pagewalk.h |  2 ++
>>   mm/pagewalk.c            | 12 ++++++++----
>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/pagewalk.h b/include/linux/pagewalk.h
>> index 9700a29f8afb..9bc8853ed3de 100644
>> --- a/include/linux/pagewalk.h
>> +++ b/include/linux/pagewalk.h
>> @@ -14,6 +14,8 @@ enum page_walk_lock {
>>   	PGWALK_WRLOCK = 1,
>>   	/* vma is expected to be already write-locked during the walk */
>>   	PGWALK_WRLOCK_VERIFY = 2,
>> +	/* no lock is needed */
>> +	PGWALK_NOLOCK = 3,
> I'd imagine you either want to explicitly forbid this option for the other
> entrypoints (i.e. the non- _novma variants) or you need to be able to handle
> this option being passed in to the other functions, which you currently don't
> do. I'd vote for explcitly disallowing (document it and return error if passed in).
>
>>   };
>>   
>>   /**
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index e478777c86e1..9657cf4664b2 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -440,6 +440,8 @@ static inline void process_vma_walk_lock(struct vm_area_struct *vma,
>>   	case PGWALK_RDLOCK:
>>   		/* PGWALK_RDLOCK is handled by process_mm_walk_lock */
>>   		break;
>> +	default:
>> +		break;
>>   	}
>>   #endif
>>   }
>> @@ -640,10 +642,12 @@ int walk_page_range_novma(struct mm_struct *mm, unsigned long start,
>>   	 * specified address range from being freed. The caller should take
>>   	 * other actions to prevent this race.
>>   	 */
>> -	if (mm == &init_mm)
>> -		mmap_assert_locked(walk.mm);
> Given apply_to_page_range() doesn't do any locking for kernel pgtable walking, I
> can be convinced that it's also not required for our case using this framework.
> But why does this framework believe it is necessary? Should the comment above
> this at least be updated?
>
> Thanks,
> Ryan
>
>> -	else
>> -		mmap_assert_write_locked(walk.mm);
>> +	if (ops->walk_lock != PGWALK_NOLOCK) {
>> +		if (mm == &init_mm)
>> +			mmap_assert_locked(walk.mm);
>> +		else
>> +			mmap_assert_write_locked(walk.mm);
>> +	}
>>   
>>   	return walk_pgd_range(start, end, &walk);
>>   }

