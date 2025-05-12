Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF92594B7;
	Mon, 12 May 2025 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038459; cv=fail; b=Uy+mvFTc5M5SkVAQbvGiyDgF6q35tACTFaecMTUb+dYKc290iEA+A0EY5LGjgXtDRugKQxPy2ulYepJUXx3M3Ytr+tOLA58YDOjKHAmUJOtD6TDBDk75TqpaJa45ccJ9uoi9rZn87EK1ihtPltI05GHgMyJFqhee5tHq0/X8MnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038459; c=relaxed/simple;
	bh=+xPe4c8KefJ6zKTcymMXAgoPEAMrqfet7jc50ZlrwAU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GQg/cvZpVlbaZc/zQr25aehdL7AXLe2fT94gP4qFjaweKcl/wXRe9s0UUg5+Ba7BqJBgj4MMmSatRsgl0KUQjxjyYnI8fHSnc06Ds4QEhSV8wb2xcTZHrU+6cs4TCZEyl96EZ4uz/rpdq3Ff7RuIHDi6WXI32Xnqe7kD3RWncbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=W1FT+5Nx; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="W1FT+5Nx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL2s077eyO6m/2mbo0iZQarM11CMPnawNM8jJQ69Z10pT9QqvQ6wFAp6W0GKiPugm88bOHYfEgGlmBJqapoFyzy9aTvN1i7oxWZmwfIkjfcX+f1uaJc1/ERegfypKPEYGKze5tvgLpZ+e5DuxT7jtQxR4EOu6mJsV3dBwAPtgU61Lchy7qzVgddxdf2w1RLXIvAD2kjIPe+hv8YD3APnBBWUcICQjSak9AwZDgb6ImpHjKRLT0UpfrvadN9YOskfn13nN8XRGB53Y2AsMrT2gFRwCdohzcR5B7G9g6/M/GwQ/99jLPAd5r/HFCdJ1WnQdtTTC974WxS7MVmdeBEK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb8b6xH3X0kXZGGRGXdW8mgGy56pgdgTewGeeXAaqY0=;
 b=wJj7oREqiCwAP1uMuDSbQG5nWRNf6tsOeJtGBbCZqkJJTbsGVZkT2boBTpKKkIzJnkFqPHydkxH5u6C+bnsXCTO2+Gd6lg/PPD5Ih16bZi798l+ooTFF8hIaQVluTt0aUXGjhyRSaX4vtl14+J+k9ZS0A8z44Uh0KOCgSTnpS7h3idxaRkTdLnXq+dHMf/AJIx5vO+XeAAoE9Z11LOX/OYEsDa24F7vn6Gr29OMJsv9GtTFcLoEM1dVfnDjEFbn0ts941a+0X+wcg9d0G52Z5zQpC61LwXt2QeSOwL4TtbSVg3gT1gS24PrL25rwr4zZ2QAHYNcGpyj9qnkzHWaAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fb8b6xH3X0kXZGGRGXdW8mgGy56pgdgTewGeeXAaqY0=;
 b=W1FT+5Nx0pY/4fcerD449wXzYCrSiOgsQD7IfeXPoC/8+snrCNIkc//WjBS/IrQB4ONVQcAOj7ZxxD1cp8rBQ74CqTqGCgk1QBmEuRwIj5bef1g58ZI4jYGru1h1p+DausDt4QA0p8c4I9FHPHp57obTZLn9pHE2yikFjW0rVBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:27:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:27:34 +0000
Message-ID: <9e96bec3-83c7-45b6-b2f7-0ccfe347643e@cherry.de>
Date: Mon, 12 May 2025 10:27:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: arm: rockchip: Add Luckfox
 Omni3576 and Core3576 bindings
To: John Clark <inindev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250509122637.26674-1-inindev@gmail.com>
 <20250509122637.26674-3-inindev@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250509122637.26674-3-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7d9bd9-387c-4023-605b-08dd912ed85c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVFxSWFROVc3clNnK3NPUUVjOW5xOHo2QkVycExTSUkzQ01LdkpVZzVUR25G?=
 =?utf-8?B?b0l1RjFtbEpPNng0ZzhGVEhsRHJHMkVJTFUzcnJRUDJDM1FKUVJmd0lrbzJ3?=
 =?utf-8?B?QURlT2kybG1WWm1aMlpHWitHM0xYZVlpMktpc0dhSEJqUlFoYmtSWDJaZ0FY?=
 =?utf-8?B?MlhWZGdJOUZsOUUzQ0YzNHhLaXB3NjRnaUdJTmZFYmQzdDQ0U05QVkh4KzNq?=
 =?utf-8?B?YUwzd3IwSk9SSVcvS3JrL2ZRT2RWZGpKUncrWGZ5YVNrK0ZGR3VnbXVkcCty?=
 =?utf-8?B?b3c4cExocGZ5bEUxL3pqa2p0VjF1cVFlQWp5RHgyRW9QQUFlb2M2M0dJR21a?=
 =?utf-8?B?QUhPTk1meW5QMWdOT2lyMFFoaFVnVDI0VkxPWkViUEhaQ0wrRXM3ZzBjTXlk?=
 =?utf-8?B?VTZETzE2a2FMREdJT2p5elZ2ajBtMmVJMTlOQXp2WmdhbjljNG9ZdVJHN3Mz?=
 =?utf-8?B?cjVpZ0FIUk9QUWxmS1prNlBWaWN4WkxuM29oeXN4UWo5aW1PUWdqVlp2ZG9G?=
 =?utf-8?B?M1p5SVN5TWl6a3dpOWNIRUdhTTBCaHIycElKckp5Sm1lTGpUay9GcFg1dml0?=
 =?utf-8?B?TWJQYzgxV3ZEYWl0QzBzNk4vNGhNYncvckdkSDkraWJhQ21oVEpUelVUbEZk?=
 =?utf-8?B?SWNYb0R6RGlyVlZUMDR1cFhwdUtudXZEVktrWm1YZ2VFU3N0Ty9lN1pOajR3?=
 =?utf-8?B?NUQ0VmVFOVgyUGJRTXlsZTdRWFlOZm1rMk4wR1poSCtHODFNdHhtTDh6Vm1O?=
 =?utf-8?B?aXV1UDNTeUlBdFpkU0xqTWg1RzBId1B5RFVaYVUyamlyUzgyWWo4NnJKNmRi?=
 =?utf-8?B?b0lqRmhGS3FsMk9mSkVTRDZBZGI3WW94ajdlL2JOejFMdXBLL3VGUUtYOVN2?=
 =?utf-8?B?WVFTZFRiWlFtNlhJRVRiVHpzUFZHNXgvL09FSkpHTzduNW52ODNlbWJNS2pK?=
 =?utf-8?B?c0VLK204bC90WWtWa3Q3MTN1NnBvR2hqeGZSbFFCc1BUNVRibHpnTDdvSUVY?=
 =?utf-8?B?Y0l1U2V4cmJxZmhoZHZDVkVMWlVvVmtTN0xmbko1WDFxblAyeVlRSUlkYURW?=
 =?utf-8?B?ZVZyMmZlb2xTa2ZWZXAvbllKU0xQVlpNd2poSkhZUFkwNXhPczhwbHNSRWwy?=
 =?utf-8?B?K21QWkhac0J2MkQxTHpvMGFzZHJ4djNKUkwzOUVJdWtlRFB0a2xFeHpZb25I?=
 =?utf-8?B?OVVHRHNrV0lINnM5OU5QWHY1L0NIQXB3YlVSRHZaSllpek55M0lSNUhieEhq?=
 =?utf-8?B?VktwZzlNR3JKL0ZwUmp1RGlFTk1kZDNHTlVUeXd5OXo2blVKUGcxMndFTk1J?=
 =?utf-8?B?cmxSeExrZ1c1TTlPaC96NjhXMWlUNnEwSmh5MG1jY2NoQ2V0c0YxQnJTemZZ?=
 =?utf-8?B?bS8ybHJZSzNURmdpQW92WmYwU1FBK3RPbTRpZzlWeTA5NVdra3NMZzRWN2VT?=
 =?utf-8?B?TkgwYlRVL05QUTFlU3pmcDkyZ2FHVm5GU2g1ajJLRktEYlJwY0hjTHczMFgx?=
 =?utf-8?B?bCtvazF5ZW9iNnI0azBkSDZkQWlIQTRMVGdJbGZQeTAyOXY5djI1OHRqVjVL?=
 =?utf-8?B?ZXBOZkQrcEwybUFoSmtlQlViRmdVK1JVZXp0QnBrZTlHMmQ5NlZidzJoWUJL?=
 =?utf-8?B?SlRzcGY3d1RsWkJQdS8yNDZzZVh1L3dWWEx5UzNXK3RiT0ZLcEZoSm0wZlpo?=
 =?utf-8?B?UjFIWHJIMzZTb09NYVdTWVR1R2ZLZXZjWGx6RVJzRytOMDAvV3Z5OFYyelQ2?=
 =?utf-8?B?aWdlQ1BiVWVTQXJyME5RaTBiRU4yUzVUcWtVZEFiY2xEblBROXNPT1FySTZS?=
 =?utf-8?B?eHg2Yk0zeGVZSU8wbDM5RWkxK1QvaDNyb1hBNHptWmp6R25oS2RvOTBFVWVz?=
 =?utf-8?B?cUtJUTdZa0ZSZ3oyVyt4N0U0NFJFVm5ONkVpdGJ4Wk5mYXI4SmN3ZUU1L0VW?=
 =?utf-8?Q?qJrr4g2JDP4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdkOEZEYzZjcFNMTmxwWkpZSll2Ymk1OVd2cmo2ZkZ6V1NISEN6M2FmU0sx?=
 =?utf-8?B?bDdQcnJ2LzRtREhUSkg2YkN3UDhjSktpajVPSWQvZXBBeHNMNHBuUDZ4ZGlv?=
 =?utf-8?B?MGZ2V2xYT3BjT1FGUGNsaXpBTC9SU1BtUzQxSW1nekdlVW1PV2dJM1pjdlk0?=
 =?utf-8?B?SWVsYnZqK09tRW9adFo5NEdNeTFXaGRydUVMSklzWjJ1TmI0QnhkWUJlZ3Ns?=
 =?utf-8?B?aDBVVEhDdERpZHFYeXlscktibi9sMm56RTJxK1ZLVUxDdE1ua3NvcjdjWXpR?=
 =?utf-8?B?SzVuakpsenArYVpLNmxPZDI4bWYwZ2lxSGJiMFVJVElhK1FURW5YS3FXRWgy?=
 =?utf-8?B?MVdwUTNGTGdCcEpaVW5BZ2NKWXdaZC83OVMreVltZE5ZT2htZ0JPUWZZK0dN?=
 =?utf-8?B?cVRPMzluazR5bHZZNFdJNUlIZDJIaXFlejlXQ0dxSEtKYUJqOW01VGp3RGph?=
 =?utf-8?B?WmN6TTJJVGJTaTBia3gzNXZ6ME50dmt1KzYzc3VjR2grVzNiNVdRUU1KRDJt?=
 =?utf-8?B?REI3RVdrVk1hczZsR0U2QVdCYWlGUEZrczlRUlhSbGVSdTBYZlY3NHBYNEdF?=
 =?utf-8?B?WmpsZlRsWEZSemE4WmdXOTZPNk8yclYwRE9XTjEvZkJYWkQxNnBzeHI1Qy9s?=
 =?utf-8?B?ZzJVaVRobTl1VzJDSk1JelhxY3FVeE9Nb2RwNHVESjhvYzFGQ3poaWNpU1hF?=
 =?utf-8?B?aGZtbHJiSHBUZGN0bDk2cFNHSUZ1Mk1idjZDYjhIN2ErMStjaE5zb3NML0JM?=
 =?utf-8?B?OWpKdUV3c2hFdmZRK2swd2ZXZkR0UlVOYVlyTUhmeXJkTG96OGx5WWRObmRo?=
 =?utf-8?B?OEFjWktqZ0JQNlVWeTJZWk41Wk9kZDZ5SDc3RU5xemtwbnNhYmNQcUtqdlIv?=
 =?utf-8?B?UkF2QXJ2MmRvYnpMU0U2UnE5ajhPVnQ2TkUySmQvUUx3RjRkYzZUa21ZazRY?=
 =?utf-8?B?SHozVE4rcHN2aVQvTU80UWlwOUhDa2U4YnJtTm9zVEU2UXo2QU1LNUtNeFRz?=
 =?utf-8?B?Zm5CWUd3UXJvMXMraytVVmp0VUJiR2E4SktqMnNzMnlsYjhnZWJyZHBOWENE?=
 =?utf-8?B?NXl2K0gxWU9kNXBEeTJhS0N2cEl6SHB5UGNjd0hqamtHaEtvVzZOczRzUTVO?=
 =?utf-8?B?T3V4RkVHTFJoUWRmMUhWRDI4ZVJIK1JPcnZWR2dpVWFyYVl3ajNVQnZLUUdl?=
 =?utf-8?B?TGtZdno4TTBXMnQvdnY5dlo1MTBlMFhpWStCejRkVnVZM20zZUtZUmNwdG5D?=
 =?utf-8?B?Vm9BZE9PR044NVZyQSt1U2F3L09lMXRwOGl4ZmdkRXllYTJVaTkxZTdFNVRC?=
 =?utf-8?B?NnR1ZWNtYjRYRm4yUWhLbStVQ0ttZlhuZlR6QlBNOVFpa3FjMktoSm53c3hU?=
 =?utf-8?B?dDRLb285UG01R1hLUk5iOGxzdlBHWGpva3VCQTAweW1pNy82aWU5d2N1bGFq?=
 =?utf-8?B?K3RDdm83K2VUeGNXdzlucXBMNXJpcG91dTR5WVYxMWpIYTdJWUFBTDE5bDRh?=
 =?utf-8?B?ZlkrUXZDekVYSGh3OEtyNVd6ai80TkdnS3Z4dTZRUjgzYXAwb0dIOXNWUXRm?=
 =?utf-8?B?S2pqVFNpa01QWDZtdnR2SmlDOTFVTGZJNk1Sc2dkaWhsU3BRQ3NLYUpET3Fl?=
 =?utf-8?B?TzY3R1JkelgyQWM3R1RPSFBRWkxKQjNhNWdaWW1BeFk3RXRuZ0FQbnFpSmZZ?=
 =?utf-8?B?Q1dkZ1JOSDJZK3hvL1Fic1FpS1ptK0hINE1kSmZWVFhlVUJRNXlBRzFSTUhr?=
 =?utf-8?B?NkVVNzlrNlB0dnVoQkduWUJjTWVwZ2JHcFl3d3hiMmFtTEtoSGxscGhma2dr?=
 =?utf-8?B?em91aDY2c0tLZXZGZmdtbTQyWVpPQ1FJWDhRT1pNdFJueEdwR1l3OWt0ZEha?=
 =?utf-8?B?OW9JdXlxdUt5OUpNVTZ1NWtHTVg0aVp2bTBZYlAyNjMzSktPbngyL3V4R2NS?=
 =?utf-8?B?N3JvYnNTL3lTL0lqanBNNlVLcllBZTgyTWlXTDJkTFFVdHJadEhhNytOQTls?=
 =?utf-8?B?SGFrb25ZZ0tZbkZjcnZ3bmppNWdvbVgvZEg0RFdRZGhxVzFGbnMrL1ArUnhl?=
 =?utf-8?B?Y0MvL3d6b0lVdHhUeExwNFducTM4NkwxVUcySGFMaEJTcWVlSnZCM3FxOUhj?=
 =?utf-8?B?MVNNVW9QQmd0Z3JrYlBSUitOVFBVK2tMYjg3ZlU0UEprUG14b245OFovNno0?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7d9bd9-387c-4023-605b-08dd912ed85c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:27:34.2531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpMxZqyzmO2+75OSOMQ++ZzYEc3khC38QtZ6szrzVfq4iDPjfBCQNztFNKyswblSjYsok3NtTmJ0hUWzoJo9quwhZujzJFBg3zXJOGB64W0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

Hi John,

On 5/9/25 2:26 PM, John Clark wrote:
> This patch adds device tree binding support for Luckfox Core3576 Module
> based boards, specifically the Luckfox Omni3576, with compatibility for the
> Rockchip RK3576 SoC.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
