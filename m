Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022139.outbound.protection.outlook.com [40.107.75.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5512158535;
	Thu,  3 Jul 2025 03:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751512819; cv=fail; b=jhOopa729mFAxFvaEcXf1iVy7P8WC4OIdCOGwNJtiK6hAhlM0YKDXTdj0K/hsKAuTXdNZyFMqTd71MeiT1aRC4AfaijfbtdkfPnxnnNpP0mxf8fQT/mA7mtyHzng1LBB8xosbwCv4sxI1Zfhbujefu9yCgx6XOrv/PfWyglE7A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751512819; c=relaxed/simple;
	bh=Yf0Hkf9nEnJtzK5cAYcABSqJDoYHjr01y+yVkpCH9/g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZOh5N2/gatrlsqn4Wt6f4GnZyttV+WuqcTRX9+uy4HH/8WN1Ebeb91Sx8covQPr43bCVcmVgEqaWSHSwA2Zkw7M2bnXOc0k2iQtN/iuD8wIG2lHJ/FauhGaKlKWh0UrLH8C4OHAYWphc4EIoN1ktAjs47nNCym3COE01anNdXe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=hsp29lyl; arc=fail smtp.client-ip=40.107.75.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="hsp29lyl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGQmMrZ6tGf9tIg3Mas1M9/pRU5zkoYV28+u0SQSXsX0g/Kb21cE/0RkcX9Xx9/TlX3KqmMD+8Kau0Ii7eV58h2IG6UcqWeZ73R3R6jr4HH1MiJ0R2y+8MKH07/NMZDeJpWPhqhfVb6P+oncwYkeqd8Dlb/r61Qf1jF7zYUq83L+rpF2SKHXnSUJ0cH6ZTbkUtlAIYHPL61w46UaLGF/f6pZZIARrojy7fqWPqWMYNn5WKnzWr9tVtu0Fw6cmjGiXT3CATaYO+4fXOTDAMODnTUjH7RrLIcEWlcQq9G/DyRoW2xm2IazP8R75rnGU8DUCOD+nA+YwKcQoBVyjUpnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX0OSXrI16ZsaWpB6DpjMbGFl2/94VIKtcs7YrSGp1A=;
 b=VCBPqng5HSXNLbsXvo4SuHRqkCu63vV1//QB3Bn4rErndmR8dcBcYCsiFK+9f642oQMh/jukHzelkf8w11iVRZLEqmZ+VlpHbc1daOmaMUXL4V45hjT8TvomdvRoHLEbApwsecSMJ3zxmcJHZRw5WZeBpuWQQjfOzCIkqn9w7/uvBNb5mj5vsEtBAwUYPhhd4y/2p2jr/nRmHHrhnpTFmDf9EQltzFm690KejybiTWCPwX4Ru6t6s4xQVQc6YURnKJqpStiNgeAETiKdRrJEj1GUsMUTppnGJcMLcuvpV7mhpdPSwv697+637Hb2MEoa279oQc/2nDZgmaqOThTs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX0OSXrI16ZsaWpB6DpjMbGFl2/94VIKtcs7YrSGp1A=;
 b=hsp29lylu8VvnhqgK6x+1s4gyd1svoqkiWKu0qKRiBr/wzD9FhpANdhL1eD1zz8nJNPVi4Vxw5fL4vkAoYJ2Tw7YDA2sde5FDmxTcs3PqiP4asoOMPbi/ZGCh2TiQKZqFXijUXuqEoe+uWDIWlZIhvN32vxdUJsZHOSrBjKXg7XbKH/dteGZBlyHjYQxJpZohF7pV6CH+ySWGa8TfaJYQEFncMw8feOGnZ2lYVuHICW3Wn+zEiaoWd6HE1R2P8Urx9dCgolNJWYWJx0bZd7TBPM5LnRgV+mpqE1gNZ6wj8D9V+0fQLRUcLNffS5+E/6k0lyPtxOaD1pphES9r6sd9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB8766.apcprd03.prod.outlook.com (2603:1096:101:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 03:20:14 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 03:20:14 +0000
Message-ID: <fcc29591-ddb1-4f9b-8668-1fe624d43b0b@amlogic.com>
Date: Thu, 3 Jul 2025 11:19:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] clk: amlogic: s4-pll: naming consistency alignment
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-13-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-13-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: c243bdce-d8fb-4785-9b00-08ddb9e08713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWRlVTJzWnlyMG5oZXJsOUFVRjRyR3JybzRBTDkrWkN6QnNocCsrMERUMUl3?=
 =?utf-8?B?M1RPUk5ndjhGQ0N1WkN0cnRPN0MvMVdlNW9HN0lBbDlZeG1BelpGVW5VeVJO?=
 =?utf-8?B?ai9BV0ord3VBS2lwMUFqUUlHWlE1MGdWc0tTUkI2WHUyUE93SXBsZnpCY3dj?=
 =?utf-8?B?bzBvb0l5NGUvelpBT3Q2U25Ic1puRXFObC9YNW9aL2JBazVPMVRxcnZncW5I?=
 =?utf-8?B?cy90R1FobDQ0OFN1d1F3R3QvR0poVHhDOTB4VHJxVWh6aVF1RWw4RmRRWVNw?=
 =?utf-8?B?Slc0NFp4TGg0V2lZa0hOUkwwUW9sVnlaTzJ1VjNzQmtiTWc2N1p6N2FNNTg0?=
 =?utf-8?B?b3dqTEpCdGoyMXR1aCtxWUpqbG1nNEM4SzVRa0U3Tk9iUm5pakQwWDV2b0Vn?=
 =?utf-8?B?MTJnVUhkZk1TTFlZUUc1cVJLWHBOdGZTeVZ1ODBWMTZka3U5SjlydzJVMmFm?=
 =?utf-8?B?OGUwQTYrMDNSTzk1Qi95UU1DR2E2VTBVeFF3YzZZYVRUakhpeUlLd2wvanl5?=
 =?utf-8?B?MFJXMU9SaWx0ZXp6akwwa04yZWQxQzZ1c0VWS0dDTmJ5N3dGQWtORlVlTXBM?=
 =?utf-8?B?R04ySXpObEhBcGRkY0VPK3ZqMnh4WHhmZGNmcHFwVm1mbGg4bWVEVDI2VTZv?=
 =?utf-8?B?YktvMUcxeHM2K1p5WUhZblVEb1hvY3Y0emUxMktwQTV1aG0xY2lybW1FTjE4?=
 =?utf-8?B?TGVJc2V6ZGYwUWRrdzVQL1JHZWk5K1ZwUVZwK2lhU2pNOEp5Y3lYNlZMQVgw?=
 =?utf-8?B?Ry9JSit1VmltTEd2bng2Rm5YQXh1YnBCd0wveURlN1FmVWN0dm85MjNwT2hW?=
 =?utf-8?B?Y3JjMjRVS3cyYTRmWnQ0TnpXdTdvc0R2QTZ4L0NaMU16RVlRSTE2ek1XYWJM?=
 =?utf-8?B?N0gydk1WM0pKNjY4SGRpWWtqaUJoMUN6YVkwN3d3R3RTY3g0RElvR3ZqTDFa?=
 =?utf-8?B?a0xFL0VuT3FZRzVxVVhXU2k5cmhkM3NyTzBIcnB3djBOa0gvMk5SZVdLSlRt?=
 =?utf-8?B?YkhwVjVtOGxDNEp3TjR1T2kzMGN6U0QzZkZ5dU9Vd2RuOU9GQmlBeHJBWklk?=
 =?utf-8?B?R3F1TzZEVHA2aU43NDF4S0tuNEI0blZnZmhmcEdlZnY0aEljMDVScWNxa095?=
 =?utf-8?B?Vzc0UFJqQ3RpcXlieUs4cnFPN1NUUGlwb1Q4SDdwOVRqSFZZc0tjWjRJZ3U2?=
 =?utf-8?B?bkh6TENEWGI5c2J4eE1zRlg2ZTBpZ2V2OGJpN3lrcHYvVW9JZ1N0V1RwLzlE?=
 =?utf-8?B?VUpDdWtBWUpwY3lFbnJHSTNQcTdJOCtwN0VySTN2Y3poMDJDaC9lOVlFL3h3?=
 =?utf-8?B?NVlkbGpCakQvVVdPK0ZEQ1NvUnJJZTh6WjNiREx1WkZlUGpVcHk4OHJ1Y2lW?=
 =?utf-8?B?SWd4TTBoNUNCWVNQSEJkelFFbzZNUXdlZkFmTWVaaVdETmJsRzRDdGhQc3Q0?=
 =?utf-8?B?U01Sd1lmM0NGRVQ4YzZ2TTh3eHRvU3A3dGYvQ2JqUXBmQTR1cWQ1ZHVDNG5v?=
 =?utf-8?B?RGdwSzJWSVU5WFJzMDJkYlpGZUpPMkZRdkRDdXMyUERNdndoZWcya1RRdTAy?=
 =?utf-8?B?Wnl0WGRnNy8yQWhGeTZ0RUxrcUh2L3pEd3JBR2hJUFQwS0ZkRkpYL3NLSmll?=
 =?utf-8?B?bWdDMzFHUnhwNnJBNTVldEN5ckpGREQwRjY4VlJyd3BTaXBrT0NsdFcvWUJh?=
 =?utf-8?B?cDRzZmx3Y29lcEJiZHM1T1ZDa2Z5NWlva2kzbDJ0WVR2enlVUzk4dUhWZ1Iy?=
 =?utf-8?B?eEZZdTkrOEh6dlJmNnV1ME5HNmZaVWlHaDhXWEFUMUMvMnFWWklaTDhuUGx6?=
 =?utf-8?B?dDZteUdsck9CMWRtYm5TdTZqb3JPUjR0elM2UVplaVp4QVltbFYyWExTczJM?=
 =?utf-8?B?bkFyalE2MTJmbE1xdldyWTRyYzRVYml2aTNxcDFSMmRzTUtFRkw2NWpxb0pK?=
 =?utf-8?Q?KQlC6YpO7D8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGtNQmhNVkVFYnR0Wmh4MG9MLzlHaTUxMi83ZFVUTEFxcGhjTEs1OGVlc2Nr?=
 =?utf-8?B?MmR0Y3R1UUdaQUFhcnA4MEJ4U1FkakhwaXJ0YkNNVWxvSzFBT0ZSdmd1MGN2?=
 =?utf-8?B?cUxjYVlyUnZpWlJVczhUWmcxTmlrdnBTdStaRTFaNndKTHdNTVcwL040ZS9J?=
 =?utf-8?B?RjNGcURVa2ZaUjVuaFRsbldiSUp3eWRzLzBaL1hsaDIvMG9kTU5BaURKdGhw?=
 =?utf-8?B?dE1BRDJHU2JFRjFUalZkemZtNVphdjMvTGhNU2w4QVFZUUVRZHdGUi9VYUZw?=
 =?utf-8?B?enRZb0wxZDhvNS9qcHl2TjdvbS9mOHk1aGZkQXJyVjgrS1JVbk9OZVhsQ0ZS?=
 =?utf-8?B?dWU2QzRaZ2xtUUQ5ZXVLV0d6TnZxZVNSWUR4RERCcTd0S3RZMDUxWHl1NkVD?=
 =?utf-8?B?NkM4ZDduRDNnU3p1U1NrN3hOS3ovTUorUmpYVHRlU0hiNnJoVlBBL1FTVDhL?=
 =?utf-8?B?RlBJT0hKNFhSSUxUZzlWaHBmUHZzL0xFbzh2QS93SVQ0WmVoNm8vWE5sYTZn?=
 =?utf-8?B?RElNaWNHTUpmMGs4MENKQ0VaQm9STTVkT28zN21VekxsNDN5QWVhTVdERFd5?=
 =?utf-8?B?cHhxNkxDTXBDTSs5aERuVGRGMWxZNlF0bCtUSDhTNGJEUnZudGxhRm1FbGxC?=
 =?utf-8?B?QVZ0MFNkQ3lJSFlRT3hqMDBIWkc2ZldzMUczOW56M0xpOUsxenR4b01Zbmda?=
 =?utf-8?B?WDYyZnRxcCtvY3dldW51bG5Gb05FUS9SR1k5MklBZWs1c2w2OTZPZ3BHNy9L?=
 =?utf-8?B?SVBYZ0h3a2RTK3pIbWw2Q1NOZlV0RnJsSVNQY2ROM2kyeENxNGdQd3Y2U3d0?=
 =?utf-8?B?eTY3dzNGdkFZUHJzVUVsNy9tdlR6VmZYZ2VCSmIwajdGOE9uc0Z3aXI1VGNx?=
 =?utf-8?B?MzJkelk2dmx1cG94TE9INHQyYWFidkpETFF0bWhpT2hpT21aYm9VZitLNnVm?=
 =?utf-8?B?OWxDK0FDdjJEQmVNUmFxaDBFL1dmL0tESVBucmg5dFR5eXh2Tkc1SjBqQmxz?=
 =?utf-8?B?cDhqNmU4U1J2Q3IwZnpPTTdIanZhSWZCRmZ1SGU1czlLZHQxWmwwVWRieEtp?=
 =?utf-8?B?UlQxUzhhV2xWSXdTa3oyamlJU3F1V1FkUjkrNUdYVHI5Sml1MjNYMlA2cFVG?=
 =?utf-8?B?a1FRVFBNWjA3WlJZc2hiSXAyZ3VCWHRIbjBTWU9nbUlCRFkvaEV6RmZndEg3?=
 =?utf-8?B?OVAvRnNaZ1daR2oxQzl5ZzAxUW1kcGNDRCtKWkFNTnVnU2t3WVJ2eGdmcDYv?=
 =?utf-8?B?SWRPeHZGRGN6aW9tdkQvQzFuSnFKSzJxSWRFd3h2SFp4RG91bmphTUVlS2Iz?=
 =?utf-8?B?MHlhZitjYW5vZEprb3JlcCtnb0VQVGFjVFRnRkV6Qjk2ek1wL0VlS0NrREtm?=
 =?utf-8?B?QnVoZFg0SlVJOGFGU3g0bUVVVmJ6dzBKWVQ4bXBlakhIZHBMdGRsUHlGMWJ0?=
 =?utf-8?B?WjRlcDdIOGxucWRrYmkrc2ZVWjBuTmF3Q1gxN0xyOHpQUFZTaWt3WU1sUE5s?=
 =?utf-8?B?NnBWUDlZYllzUHpyVmxOQllDYlBwVCtLc2RWZWV2UW1wRW9rZUdzeGY2Mmhn?=
 =?utf-8?B?Y0hacGRMMSthV1dPcGdPZFpVcy9lb0tNd2NaSnY1a2E2dnF0SHppU2M1cVdD?=
 =?utf-8?B?VXhnLzJUNitBUURlU0RiTWNIUU9zcmgzdDBFcFNKNWRZOERxc2NRcUpWekpE?=
 =?utf-8?B?WlJrUzNPeVhHYkVxSEY3dVlkUzBVdjJUZTJQWE5tQlhSZWw4aHNCd29zY2V0?=
 =?utf-8?B?QURRTURQSGVpZzFXWkFiaUlweEQrdUI1bmlBNG53ZE44VzUybXpvd0tuSVl4?=
 =?utf-8?B?VnM0YkVPMnRFWEV2eFhmeE11dW5XQlVTaXRKWUhpS1B0ZjAvSkV2bDNDY0th?=
 =?utf-8?B?QlZMZFdUTktRWE5LYWZlbExjVHVGZkFoenh4YXlQamRTbG9YdlppOFZqUU5V?=
 =?utf-8?B?WXNEc2xuN05jMXZsVDQvSVFHOE43bmlSSGZUSmhaRGV4K0l1WnVXVzlWVlEy?=
 =?utf-8?B?dnpmV280L1NTdXlNRzBkcmJpTC9sTGp1eUNqZTZwY000WTc4d0JvS2FiaTZx?=
 =?utf-8?B?VnFUN0c2bXF6cUl4RDRQb05UV2hzbVNCL0IyRHdweHRmWEkxMDRUYklWMHRn?=
 =?utf-8?Q?EO2NoQPKd+Cx0J+4dASf3upee?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c243bdce-d8fb-4785-9b00-08ddb9e08713
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:20:14.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7mz22ClviigZMtR88s62ZXSGASgA7L9wMLritwXuPOkXcneiD6Nu03fu5rZrYhPw8ChCJ1E1huULKqrTLT11A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8766

Hi Jerome:

     It's good for me. Thanks!


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Amlogic clock controller drivers are all doing the same thing, more or
> less. Yet, over the years, tiny (and often pointless) differences have
> emerged.
>
> This makes reviews more difficult, allows some errors to slip through and
> make it more difficult to exploit SoC commonalities, leading to code
> duplication.
>
> This change enforce, wherever possible, a consistent and predictable scheme
> when it comes to code organisation and naming, The scheme chosen is what
> was used the most already, to try and minimise the size of the ugly
> resulting diff. Here are some of the rules applied:
> - Aligning clock names, variable names and IDs.
>    - ID cannot change (used in DT)
>    - Variable names w/ SoC name prefixes
>    - Clock names w/o SoC name prefixes, except pclks for historic reasons
> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
> - Parent table systematically named with the same name as the clock and
>    a '_parents' suffix
> - Group various tables next to the related clock
> - etc ...
>
> Doing so removes what would otherwise show up as unrelated diff in
> following changes. It will allow to introduce common definitions for
> peripheral clocks, probe helpers, composite clocks, etc ... making further
> review and maintenance easier.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/s4-pll.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index 3d689d2f003e21658016b84918bf1b7b1954c05a..6a266bcafd6257937c1de50cbc5606dcc6f8207b 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -281,7 +281,7 @@ static const struct pll_mult_range s4_gp0_pll_mult_range = {
>   /*
>    * Internal gp0 pll emulation configuration parameters
>    */
> -static const struct reg_sequence s4_gp0_init_regs[] = {
> +static const struct reg_sequence s4_gp0_pll_init_regs[] = {
>          { .reg = ANACTRL_GP0PLL_CTRL1,  .def = 0x00000000 },
>          { .reg = ANACTRL_GP0PLL_CTRL2,  .def = 0x00000000 },
>          { .reg = ANACTRL_GP0PLL_CTRL3,  .def = 0x48681c00 },
> @@ -318,8 +318,8 @@ static struct clk_regmap s4_gp0_pll_dco = {
>                          .width   = 1,
>                  },
>                  .range = &s4_gp0_pll_mult_range,
> -               .init_regs = s4_gp0_init_regs,
> -               .init_count = ARRAY_SIZE(s4_gp0_init_regs),
> +               .init_regs = s4_gp0_pll_init_regs,
> +               .init_count = ARRAY_SIZE(s4_gp0_pll_init_regs),
>          },
>          .hw.init = &(struct clk_init_data){
>                  .name = "gp0_pll_dco",
> @@ -353,7 +353,7 @@ static struct clk_regmap s4_gp0_pll = {
>   /*
>    * Internal hifi pll emulation configuration parameters
>    */
> -static const struct reg_sequence s4_hifi_init_regs[] = {
> +static const struct reg_sequence s4_hifi_pll_init_regs[] = {
>          { .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00000000 },
>          { .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x6a285c00 },
>          { .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x65771290 },
> @@ -394,8 +394,8 @@ static struct clk_regmap s4_hifi_pll_dco = {
>                          .width   = 1,
>                  },
>                  .range = &s4_gp0_pll_mult_range,
> -               .init_regs = s4_hifi_init_regs,
> -               .init_count = ARRAY_SIZE(s4_hifi_init_regs),
> +               .init_regs = s4_hifi_pll_init_regs,
> +               .init_count = ARRAY_SIZE(s4_hifi_pll_init_regs),
>                  .frac_max = 100000,
>                  .flags = CLK_MESON_PLL_ROUND_CLOSEST,
>          },
> @@ -794,11 +794,11 @@ static struct clk_hw *s4_pll_hw_clks[] = {
>          [CLKID_MPLL3]                   = &s4_mpll3.hw,
>   };
>
> -static const struct reg_sequence s4_init_regs[] = {
> +static const struct reg_sequence s4_pll_init_regs[] = {
>          { .reg = ANACTRL_MPLL_CTRL0,    .def = 0x00000543 },
>   };
>
> -static const struct regmap_config clkc_regmap_config = {
> +static const struct regmap_config s4_pll_clkc_regmap_cfg = {
>          .reg_bits       = 32,
>          .val_bits       = 32,
>          .reg_stride     = 4,
> @@ -810,7 +810,7 @@ static struct meson_clk_hw_data s4_pll_clks = {
>          .num = ARRAY_SIZE(s4_pll_hw_clks),
>   };
>
> -static int meson_s4_pll_probe(struct platform_device *pdev)
> +static int s4_pll_clkc_probe(struct platform_device *pdev)
>   {
>          struct device *dev = &pdev->dev;
>          struct regmap *regmap;
> @@ -822,12 +822,12 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
>                  return dev_err_probe(dev, PTR_ERR(base),
>                                       "can't ioremap resource\n");
>
> -       regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
> +       regmap = devm_regmap_init_mmio(dev, base, &s4_pll_clkc_regmap_cfg);
>          if (IS_ERR(regmap))
>                  return dev_err_probe(dev, PTR_ERR(regmap),
>                                       "can't init regmap mmio region\n");
>
> -       ret = regmap_multi_reg_write(regmap, s4_init_regs, ARRAY_SIZE(s4_init_regs));
> +       ret = regmap_multi_reg_write(regmap, s4_pll_init_regs, ARRAY_SIZE(s4_pll_init_regs));
>          if (ret)
>                  return dev_err_probe(dev, ret,
>                                       "Failed to init registers\n");
> @@ -848,22 +848,22 @@ static int meson_s4_pll_probe(struct platform_device *pdev)
>                                             &s4_pll_clks);
>   }
>
> -static const struct of_device_id clkc_match_table[] = {
> +static const struct of_device_id s4_pll_clkc_match_table[] = {
>          {
>                  .compatible = "amlogic,s4-pll-clkc",
>          },
>          {}
>   };
> -MODULE_DEVICE_TABLE(of, clkc_match_table);
> +MODULE_DEVICE_TABLE(of, s4_pll_clkc_match_table);
>
> -static struct platform_driver s4_driver = {
> -       .probe          = meson_s4_pll_probe,
> +static struct platform_driver s4_pll_clkc_driver = {
> +       .probe          = s4_pll_clkc_probe,
>          .driver         = {
>                  .name   = "s4-pll-clkc",
> -               .of_match_table = clkc_match_table,
> +               .of_match_table = s4_pll_clkc_match_table,
>          },
>   };
> -module_platform_driver(s4_driver);
> +module_platform_driver(s4_pll_clkc_driver);
>
>   MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
>   MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
