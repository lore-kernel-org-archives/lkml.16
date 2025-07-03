Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022107.outbound.protection.outlook.com [40.107.75.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2E23A9A5;
	Thu,  3 Jul 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527522; cv=fail; b=Ti3sSa54hBZRWPAMxQnuTSTSy+ptXGAAL/oGMyqFl1M23/DnKc/AOFTPSwXYa9E3/OiJ6DyQOLgv4Am6NS1zpYqc13WAaC+xW2NvWld1gJ9bXbIuiq0pQ9sTYm4VeZq5dLN7FRCT2qIsHX1TE3g8z3BS9/PZwxdJt8kOoafM6nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527522; c=relaxed/simple;
	bh=bCfnWt/g2zofChCCNejg3XdhTV5q5aKAzy8q86+yyq0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sVkzbQOH096bL1cdPp82TDX4MnkhnuNUJ6hXqi8VgIIzbeQp4QfLuAeQnP8uwksu+xJxQ4p/JPdhfPW/MaP/uumbZ1vBpUQYgg5uzsroHIecoQELdshksG7/ywXfiWlBse5OjaQwrd/g4wAHWt3oasabSAwQWK9HROTaNH8gHE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=XLjHwkZL; arc=fail smtp.client-ip=40.107.75.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="XLjHwkZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygftamp7kWdaO2xiX/67Kt0UxcrvZ/J804U6q4GcizBTbIuKxxdWV9mE/1Z21D1AGseOVRoolTxNn79aU8b/6CIDf9JwUU1BP/NcrMYw1aJOWxTyaLh0KdYD873ljhI9Hk90kT+SuH3glwIIn2wB2NZXeqAUDQ8G7x7V8wNBQQEs65X1u0wqjYFOWODGl4uOJ78Mi4rtxIoMw39v/bZ7yv2woTh8kDrpSNuhCeuDGeF80zyZNLrlTW4D33unnehxygWnmjr7c5bXBNPb4KxiDAk0WvaOhy/ZHtN1lJQWR1Qr5z6fEtf4XH+VZeL9wR8V7xEvz6toJds/xEgm3576Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWJAb5yLzeTnv1YeZfVrpmG0ty8M+pf7F8R8jKwhT5k=;
 b=jpiuBoRZnB44rSPdTejs2w97KIuL8PjfIo2yyBfL3mYnfe0+fbzIs0uqjkmwpS5nULgK3XOYMVkdegEVl3Qx56Ax+RJjKqb+t1WJ+sFWr/BwpN6SXmvjNMEZUmelai/WsiE7XCPYzEJMWnGuW6q92b7If6ilw5ipTwOG4u8hXygywRV77jDAloEFCy4oH2G9kalbKCMyJLx/Lh0OlEnJA5shB6lAGBK9INWPCFjIFpzNhe8npDcH4p/3H7JO5YR+KsWVbtswBNyOjexjgzIy55+PJPzrb2J1TMEuvvPdk3zA5gCn6QobcmHka2Q50aSvK3EppWn7qqAMNf8fqnWvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWJAb5yLzeTnv1YeZfVrpmG0ty8M+pf7F8R8jKwhT5k=;
 b=XLjHwkZL19lQSIGD9zPNHpB502sVY3+VksOrLLdit3wtUhzH+HnMWhTo77tTB6yzcRmLQvaLkZqYnj6dmL60TCbOQ6gj+8DahaeBwPKJM/R2uyJRSXkbXW3CdVDmAQfy4VTeDHxAm5uliRFCxWREUztRpum6JLYZ5DceIFXVO9KbyyqL6Vk1DJaSytqRAEFPsTkYkPE4HYvpvf/agEQcPNgoJzkvzdXV5I0ffc369P6XX3h8gS4m1g7w8pFdHth/e4ft5eX5HiRXwGU6zb3VFG1AmdETJ3PL7lx8dlBlYA00umNPVS7+1bdik79zMc+NrkKMu5A9cgNW2+coE4Q0CQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB7657.apcprd03.prod.outlook.com (2603:1096:101:130::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Thu, 3 Jul
 2025 07:25:16 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:25:15 +0000
Message-ID: <a9b6ffdc-489f-4be9-9005-e987df739901@amlogic.com>
Date: Thu, 3 Jul 2025 15:24:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/26] clk: amlogic: add composite clock helpers
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-24-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b3ef41-8f25-4cdc-a02f-08ddba02c184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ymo0SDVkWjJnejl3cFBPOTFGRUlwL3JlM0JNNUVSMkFyazZNNTIvbmxCQURh?=
 =?utf-8?B?dmE3ZkhHbjRIdGxCYVJPYmFFMWJYK0Y0Y2xVWFJnRk9lMWo5cE5JTkxlRDdn?=
 =?utf-8?B?cFNyclRjQVAwV21hVUdDYWdmckhNSytDU09EY1FYRlBuZnJQTDlhMGZyaHhh?=
 =?utf-8?B?QnJYL0pKNEhQZnhLZ1dPZjBIQnRadTA2S2E0UUdON2tmK0NveUt0NXFjY0dM?=
 =?utf-8?B?VzRxUVJBdmZZTTRmQnpxQ0VRS3FoMGRqakc3dlVtUDF6dnVya3ZmT3dxdmpL?=
 =?utf-8?B?cEw0aUQ3aUdmbVljVFRWSlE4MUhCTEhKME12OGRmK29aT2FqeUJyRHpXNzhH?=
 =?utf-8?B?NnBvRktabEc2U2ZzanVuN1Vmdit3VFdCTmJrRGdHZFpEenRhOVhhRzdXMnk1?=
 =?utf-8?B?dFpUbGFhNFYzVEFjVEJhM3BVWVpxUjNBK2dzb3l1MUg5d2N5YStvS3MvRngy?=
 =?utf-8?B?bUxhM0o2MnczNHdzSTdpbmtmM3BjWGY2andqa0prdmJBSUxNTEp3NXd3anli?=
 =?utf-8?B?WGRSWndJZ3ZSZ0JTMWVQSEIrN2REK0c4YU1DUmVxdkhIL2pucitKeWZpbFBm?=
 =?utf-8?B?UXBhMXpVK1RCc2ZMOVYrcllLbllmU0tVcFJrWGVBYUJKRUQ5T3JpTmIyTVpj?=
 =?utf-8?B?eHBobEZOcU5taDhJTy9jbXl0VmorY0xlSkhaVzZKMFBIQnd6WGNSTjJ3ZzI4?=
 =?utf-8?B?S3NhcDdldy81ZElmZ3VmYjRPQ2oxZnZpeTF5STUwSjFmekNiQ1Q1Y0VKa1JN?=
 =?utf-8?B?T05sNUpNM1k0K21EQSsxOVlvQkxJdEYyNENRZ1NodjcxNC9rL1BERXNER0tL?=
 =?utf-8?B?Q2FpWVN3VDgzODhPZTdtQTlUVzg3V2VRVjduRG9yU1g1SDFoUDZ6MThxWnhI?=
 =?utf-8?B?SXczcnY4aXJ0MTdrUlg2K0NvcEYzTjg4QTYzZjNiNkt1N1BVYnFmTWZuT0Ez?=
 =?utf-8?B?WFdyRGlTVlR4RDhZQjh0aEhZM3Y5Wkd4dzNEUm9HMkNneEwycEJkeWhad080?=
 =?utf-8?B?dmJ3WmpEU1RaVzNXVkc0bEUxVHRKTXQzWEdKOE41YnE3dXdVSDNTSXQwQjNu?=
 =?utf-8?B?bk0ySTlmcVFDcXVLR201dTFsM3BUWXlPR0ErRGwwQ2dLOFlURWhqWGpQK3Bx?=
 =?utf-8?B?NVpiWUtkbG1aNGY2Q25GKy9lU0ZRT2IzU1RtcnE2MkNqTGN0a05LelRDTU8r?=
 =?utf-8?B?dUk1cnpMWFpUMmNaMUJucCtiQUhCVVpvcThtK29LMGZuM0duOVdOcmdkbVo3?=
 =?utf-8?B?bERSTHI3TWRSWkJBUmtuNkp1cThkcGVhamozMmZnNi9XRWo2S0tZKzlEN09O?=
 =?utf-8?B?K1kvNkdJVG9MS2FIRUlMQVloUzNidXJaSDJOdXlNUnZpS2V0WWFML2J6b2F5?=
 =?utf-8?B?Z3NyL3lZWWhibSt2bXZ6NkxiTGU3N1JWQzlLY2o2Qkh5QUVmdWdQcGhWc3VI?=
 =?utf-8?B?Z0tESzhUSjAwZUk3TStwZU92VHNOS1U2TUhKTGk0Ny9aQytxa05wNzIrVUgz?=
 =?utf-8?B?M0UraG4xd00rbkdKOGVST2lVSzFOTGJnZU9GT3NaVlZpa1pZNDdwR25GUVc1?=
 =?utf-8?B?MlJSeXlId1BPMnNjR2pDTU5BYlFSNmVtNVIyS3RYcWFZZ1lwQ0ZhVFRKT2dP?=
 =?utf-8?B?ay9qWHhIa1NJcnUybi9nalBvZDVRcXZtZTNWMDltU3plYzcwQ3BBZzdCYTlQ?=
 =?utf-8?B?SC91MXREZytFZDBsUVA1a2JEeHlmVFhKTmNoS1hIeFBKZk56Rk8wWW9nWjEw?=
 =?utf-8?B?ZGVnMzAyaEJIWCtCeFUwcTh3a1FldnM1aVdDWEcwWWI0QW1jU0xkYmcxcXYz?=
 =?utf-8?B?MWdYaE83RFhIRitsOGg5Ylp3ZHJZSndNOE5BdFNWTk5FMldxWTFid2Q0QStl?=
 =?utf-8?B?MmRjdWo1ZGNFTHplL1FvTUZsWFNDQ1JmK3h0WXVGeHBOa2pOUlc1NTUzTTZN?=
 =?utf-8?Q?vC4BSbvjgKY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzZxb05ZYmVwRGxhWWdPYzBuRDUyT050Y0E1eHFLQUVjR09OVGpNQVE4ZWFy?=
 =?utf-8?B?WnoxcHdzbXE0QzlxSERzTERqUWZqMTk4Tms3TjU0cGpYMzdzSGtMRmtaMkEy?=
 =?utf-8?B?c3JYY0ZDU2l6My8rSTFHWlRESHhzTjVtRk9uMWtzbWViQWN4R3VKdm0zUVZQ?=
 =?utf-8?B?RWc1a0p4M1lrbUdNTGVnV3JzbGtIc2hOQXR1bEIwV1B4UlZRa3dxZzJUUi96?=
 =?utf-8?B?eUEvd0VGRGQzSTJlSU5VV2pOYi90K2tBWHJlbjRwaGlrODJYaGhPSXVIZGlP?=
 =?utf-8?B?MUl6TjhjZVVKeitOV3dtaGw5d1VNcGNuL1IxcGxXSVlab1lyNmdtck5NUGMw?=
 =?utf-8?B?bUpOOXhWaUtMMVRsZE9MRTRqc09xV29sNnZMUzNoWW5DaU5XeGdOcjB6Q2dz?=
 =?utf-8?B?WGR0eGVKMlVzSml6UFNyMmI1Mk5MMlNGSk40NmV4MnQ0dndSVER2VUdjUnNQ?=
 =?utf-8?B?Y3hhT01HZVRaUjY3NnFKQ1hHVU5kRGQ4N0xPQ2prazRyWXZYcUdQZHRCZ3o1?=
 =?utf-8?B?bFBtR2ticmdOWDA1TGNERnZYMmU0dGxyak5XMHdoanRkZXJNWFkyMzQyNE5D?=
 =?utf-8?B?S2tVSWpBeE1tTS9ud21tVHhndVQrNTdnUWJ1ckUySGxoRkhOdjljaE9KSGFX?=
 =?utf-8?B?RVduaHR4cVZ3Y29XbzIyZzl0cmFmUzRRTEhPMDRmQWRxYU5CQWJTamtjYTVU?=
 =?utf-8?B?R1czWllDenVKUHhQNTVjNzZlZHdhYTVJTGwwRFNEb0dTTmE5WnVJTTdKbjE2?=
 =?utf-8?B?UC9BaVZsYkFCektpR3ZNZkpmNi9qbmE5OWZUazhmQWtwbTdSUW1UUlJsSTdt?=
 =?utf-8?B?aU9wKytUUmxIZk4zeEJtTDlETUpSM2kzV25YeWpyZnJZbnRrdE9teE1Xa3lx?=
 =?utf-8?B?NkFnTGd1d0NXL0wwclFqU04wY3gwejNHUzlJZWFmcmRqcWkvTjU5QmdvMWNI?=
 =?utf-8?B?YXZrODU5MWM5VGF1NG9ZYllvd3dSQ2taVlI5MTIyVkdqUXZxR1o4TUZ6Rmt0?=
 =?utf-8?B?NzRIanl5QzBVZ0duMkd0QXNscXgwK2hXSHBtUXVoWUM3alJhVXh3c2VZS0pR?=
 =?utf-8?B?d1pyYkJwbGhiUm0wWWJsQ1Zsb00wM3plQjFLVVZEWFE3K2pRdk1MVW1wcGlz?=
 =?utf-8?B?ZlBlbFdiSkx0NmZZM2RGK1g5WVBNcWc4eXhOMnFucG9hN2FlM0pzdThqbHhu?=
 =?utf-8?B?U21QL3NURDFSRzFHcDRVdVlFRHo2WGlaK1UxUGVISmZ1SGNLdU5sL0V4WFNs?=
 =?utf-8?B?bnFocFZvS0p6TkxFczU0azNhaTVMNDB5dnR3SXlNdTBVTjFJYTJmSkxkam5r?=
 =?utf-8?B?bXM3T1Awb1hsTGlqb0JMWEVYTUtjUGJKVXh1YXJKWHhVL3FoL2w5ZC84aUlV?=
 =?utf-8?B?SlVYYi9Zc3VJa0VISjhJTG03SEtRcXJSOC9VNEs0dy9MK1NnS1FMZGkzaFda?=
 =?utf-8?B?cTJjS0RpdU9VaXpNZ1pJQmNGUnRyMXJteEgvSVI2b1AvRHRndkFJakErQ05l?=
 =?utf-8?B?QXdnVGtrSktiaGgzZTRWeFVkL01DWEJ5WHljd01zWS81OUxrWUpKelRXaFc4?=
 =?utf-8?B?aUVuOTYrMTNkOHRUZUN2SGpVdlVVY0JBZzc0K3hnRnJGN20rZWFEOFgzZFFN?=
 =?utf-8?B?aEVVUHZFVVROUWFwK3ZnREJpeE9pVEhZbmR3dVM2enVic2RYR2lRTmhSOHFh?=
 =?utf-8?B?NitqVnFjOHZ4OXozREVLTmtqSnRPSytSNTMrQUV4dUtvRHpEWDdLTUNNc1Zt?=
 =?utf-8?B?aWZqQTRCWGdxcUpFNWFvU1pTZFJzd3VPREp3dWx1eGoxTlRZMXR1Qk00MHlp?=
 =?utf-8?B?K2t3REZMcGtsU3NlMU9XY2czSkhZMzB6d2RrOGczZi9zRkpFUnNNV1pHODhh?=
 =?utf-8?B?Vkp6Nlp6NERmY05aTXdwRWRHY0x0Y3ZoR3pHOGlYYjRxNXNGVythQlpKWVdM?=
 =?utf-8?B?R016M0crOENNS1QxRW9WS1ovU2h2bVdqRENwd0NFT3NiSjl1dFJiSzVMSzZl?=
 =?utf-8?B?RGJ0eWluSDBBZG9UT1VJdEpTWnQ0cjdaUVphemh4YTRLKzhENTZoNGxETlJT?=
 =?utf-8?B?aHYzcm5NNVN3QXRMYWEweG53V3JWbC9oei9RU1hINExNNFJnanUxVm9laXpJ?=
 =?utf-8?Q?OwP/AqSe/Bz9C+805jsNBnztt?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b3ef41-8f25-4cdc-a02f-08ddba02c184
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:25:15.7991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTAfOO1eSN5zV+mp1BQwzYHhvNDGnXToygx1qv1JiWh4vkNGmqAaTMrLULJtz5SvY94fgGmXf53VdSShcNW/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7657

Hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Device composite clocks tend to reproduce the usual sel/div/gate
> arrangement.
>
> Add macros to help define simple composite clocks in the system.
>
> The idea is _not_ to replace all instances of mux, div or gate with those
> macros. It is rather to use it for recurring and/or simple composite
> clocks, reducing controller verbosity where it makes sense. This should
> help reviews focus on the tricky parts.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/meson-clkc-utils.h | 57 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
>
> diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
> index 95d9f85f7ca22f63a16f8665d6f7a250b21bfdb8..ddadf14b4923781d8807546f35a1ba2e6a8a894a 100644
> --- a/drivers/clk/meson/meson-clkc-utils.h
> +++ b/drivers/clk/meson/meson-clkc-utils.h
> @@ -48,4 +48,61 @@ struct clk_regmap _name = {                                          \
>   #define MESON_PCLK_RO(_name, _reg, _bit, _pdata, _flags)               \
>          __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pdata, _flags)
>
> +/* Helpers for the usual sel/div/gate composite clocks */
> +#define MESON_COMP_SEL(_prefix, _name, _reg, _shift, _mask, _pdata,    \
> +                      _table, _dflags, _iflags)                        \
> +struct clk_regmap _prefix##_name##_sel = {                             \


Can we apply the same naming style to the '**PCLK' clocks? The SoC prefix in
clock names looks inconsistent and awkward.


> +       .data = &(struct clk_regmap_mux_data) {                         \
> +               .offset = (_reg),                                       \
> +               .mask = (_mask),                                        \
> +               .shift = (_shift),                                      \
> +               .flags = (_dflags),                                     \
> +               .table = (_table),                                      \
> +       },                                                              \
> +       .hw.init = &(struct clk_init_data){                             \
> +               .name = #_name "_sel",                                  \
> +               .ops = &clk_regmap_mux_ops,                             \
> +               .parent_data = _pdata,                                  \
> +               .num_parents = ARRAY_SIZE(_pdata),                      \
> +               .flags = (_iflags),                                     \
> +       },                                                              \
> +}
> +
> +#define MESON_COMP_DIV(_prefix, _name, _reg, _shift, _width,           \
> +                      _dflags, _iflags)                                \
> +struct clk_regmap _prefix##_name##_div = {                             \
> +       .data = &(struct clk_regmap_div_data) {                         \
> +               .offset = (_reg),                                       \
> +               .shift = (_shift),                                      \
> +               .width = (_width),                                      \
> +               .flags = (_dflags),                                     \
> +       },                                                              \
> +       .hw.init = &(struct clk_init_data) {                            \
> +               .name = #_name "_div",                                  \
> +               .ops = &clk_regmap_divider_ops,                         \
> +               .parent_hws = (const struct clk_hw *[]) {               \
> +                       &_prefix##_name##_sel.hw                        \
> +               },                                                      \
> +               .num_parents = 1,                                       \
> +               .flags = (_iflags),                                     \
> +       },                                                              \
> +}
> +
> +#define MESON_COMP_GATE(_prefix, _name, _reg, _bit, _iflags)           \
> +struct clk_regmap _prefix##_name = {                                   \
> +       .data = &(struct clk_regmap_gate_data) {                        \
> +               .offset = (_reg),                                       \
> +               .bit_idx = (_bit),                                      \
> +       },                                                              \
> +       .hw.init = &(struct clk_init_data) {                            \
> +               .name = #_name,                                         \
> +               .ops = &clk_regmap_gate_ops,                            \
> +               .parent_hws = (const struct clk_hw *[]) {               \
> +                       &_prefix##_name##_div.hw                        \
> +               },                                                      \
> +               .num_parents = 1,                                       \
> +               .flags = (_iflags),                                     \
> +       },                                                              \
> +}
> +
>   #endif
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
