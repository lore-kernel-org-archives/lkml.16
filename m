Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023117.outbound.protection.outlook.com [52.101.127.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771635579E;
	Thu, 24 Apr 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483566; cv=fail; b=VS6IsX5cynsjPCHai2IH9eQho//cfiZ+I/idNPUAy/DO+ypdLLZ7Pohxosiii6RuPflDO8AnDbp6IjeJeG6Zo/BZpdb/OfE3IZsNr4NhhCvfGv8sRIXwfEDvAcjr+AvpfVhk29nYDwjOSeZrQY0oVADyr1xo+MT4YVGdo7g7hnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483566; c=relaxed/simple;
	bh=UHoWGzGUHZ3fOcXNCcVfCUnlhJXik6pNzOO+AdR0CAU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X2LXgD6Jh5iK/2Ww9FrWCGwE1o7994OFVFAU7yOEt/WH47cQ/J76Gd2x3FTibTLdniOnu+vf0ndrpew3fzQEoqhMNLrI53h5nBXyZhTwJCKt74ChG7aQVqyVPB7LY2MdSGwg5OfpZFvgG+WDDbHy9aVDlrFzDpHyFcIPJRL5zVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=mQxKn+It; arc=fail smtp.client-ip=52.101.127.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="mQxKn+It"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aljuSBDucnCxJKUog41q3IJf6bFshI7W6oHH76U2YvIrT6tPhjylJGlB8ZxtMKqPjlQUX8nyW36lepAyvQDurCoSdpWkfVNezYTjBJ7N/cadjBSEnpx3Nyk+DOBQKNS15hgPsizZq0WuzDZO7gRtOM+h+Eo4UfXmOjix2ag9fZxGcaZ5qZ9NzNtkk7R30MhCte6nkt8qQuRKuiHmpYYagBNgfA6aMViYSjzvfNK7Fp62MI1T0qnHDpqAQJ9QtEygQVytZ8F0rikMLeW2yhyRley1KJKfBY4WPrq+heAqONbLh9kClWLdyFaJxaXEeXW3hetUmh4pdFHL6qRjcP0vGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rc2pbhDSYO/Elfs6BaG/hY+NlS60JGWYq+5xnWvYrY=;
 b=cTPB3grlG0ZPMHSE2zsAgfxmSC0YFo8zRY3deYKMNHkt2mjU5YI/qkgOE4sRc1BMlzwtEVTV8F14+9oGfOyochDqNdzJsqs20YyQZyiDyLhS5+jCK3gjowLrPoHWfAJ5mUHf46wOyIE2Z+bTmCfDfu4Jy+xO3VKqrSa1Xh+PpZKvZkQXhdkGH0kj/pFppLTJ9FSBrNcGj+Dt/SxQ/Z2/d8sQkV+dxTSqWcg+AaWObHFOfLRmqb6hpFq3OyyLuOtVnarhdAuMedQpHhvVznVOqSGYktg0VZmcbvuDEHwMGEzPE9HHKMewzPK15Ikym2PtvtGWmusf/vzKigCNrl+pbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rc2pbhDSYO/Elfs6BaG/hY+NlS60JGWYq+5xnWvYrY=;
 b=mQxKn+ItiTzvB8aF5NOnOK/2LD6MwAzMSACI2/K+WHdC+24JqYV+0zyNFrlUvLuueZ1TqMcHM9X+d1Vh8HBdWgU7hsT7z98fAy/Z+WlMj0GlkBHLg+3CoiceSfvcqR0vHhiJmqYGxeIp1VjfvSWBgHmrrfabmYDpALv72k3gi03F1WubvZ/uzaEd6Z+3ug1ryLt0t7WCoN5ndxRm4flZrpJd3ayaLJOAgM7n1rUPT9wh9UTGOZW7KjFe8X/rnppcjS0Fg4W3NuGCefdBSeuDZEl9gSxb+drGZg5f37nnkRWk3GAyneF6NIOmbzV16TnROgyIG3SSucQqSJUp+xYwKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
 by KL1PR03MB8238.apcprd03.prod.outlook.com (2603:1096:820:108::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 08:32:39 +0000
Received: from JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732]) by JH0PR03MB7384.apcprd03.prod.outlook.com
 ([fe80::1ff4:d29:cc2e:7732%7]) with mapi id 15.20.8655.022; Thu, 24 Apr 2025
 08:32:38 +0000
Message-ID: <ef1ac07a-09c5-4f8a-89d5-44d232f8ae41@amlogic.com>
Date: Thu, 24 Apr 2025 16:32:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To JH0PR03MB7384.apcprd03.prod.outlook.com (2603:1096:990:11::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7384:EE_|KL1PR03MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4af045-33e5-4182-0369-08dd830a9244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDNENTE1Q2hYRGMwbWR1RGVJbTIrSnV1NDEvUjBVakV1cWlFTlFOQTk2Z1RQ?=
 =?utf-8?B?S0pDYjRleTdBbStCSkJxZTlxbTJFZnJEbjFpK1B4TDN6Y3lZT0Y3dGVoYmZP?=
 =?utf-8?B?dndORXZWMDhGb1NuUnNHU0lvTWFkME5OaXFZNE13ck5hNHFwd3h6MUNzUFlr?=
 =?utf-8?B?dURzOGFBdk9ubWh5TTZ2V0pzQS8vSkZIMStXeVZjU3JmNHIwV0lLcGMvNlZ0?=
 =?utf-8?B?RWdib1JZVmQ5OUJLZmlqeHZXRS9zdmpsdEMrei85bU1WcDRiOW9wSm95Um5F?=
 =?utf-8?B?RWZyVUlwRzNFcVF4WlBzZVNyT0Y3SmhldEFPZEtWRE1UTXlIMHY4NWxEcVZV?=
 =?utf-8?B?R1VOUXVlVGNvcmRRR3NlbTFWTlVLSnFvaG5VVmZSMk10R3ZhbFcvZDI0bndV?=
 =?utf-8?B?MVc0bUVEQjM3bTBHRkJmZWRnbFJydVpUdjh5c3lGUVVjSUp0SWI0MXNPZldm?=
 =?utf-8?B?bENBMG92UDczNzJ3bm9YSkp5SU5YdVZzTzRJUHhzTVhJU2RwUW5oN2djbThu?=
 =?utf-8?B?c1hYVm1DN1BVV3dZU085a2x3dit4WWpFNElQNHJRaDcwcmlTOVNtZitCY0Qy?=
 =?utf-8?B?NzNtcWRmd2ZqV1VQOUU2UWF3cUdod25QSThoRjBNNlF2SG5hTHBDNDVGSWtX?=
 =?utf-8?B?Tk96ZG9oTnB1RXJoeWY2QllmOEVCcmJ2R1pHOE1SbkdlTU50Vlg2ZnVGNnVR?=
 =?utf-8?B?ZSt5b2k4NG52N05wMEM2UGRuRjdQNDJ5NU1kV3hqRjlIS09vQXBFb0dGeWRF?=
 =?utf-8?B?SEdqc3RTNnN4SEdWTjBpVkhkT2VONCt3OWhOQUIvZ3VRbHhXMWVsanJXWTZL?=
 =?utf-8?B?ZCtZU1Z1RkU4enl4UGFEaFpwMWt0dzh0U2liVEtWUTlvRzQ5N3dMbnNLYUww?=
 =?utf-8?B?WWxGQmZBNTQxYXIybGhzRTZLbjdoRlJ5Tnd0SjFLTXpTVHNrTnVlY1h4azhk?=
 =?utf-8?B?YlE4OG1DV2hJaWVjM3JUOXVVYW9UdlorNGlNeU9qejUwRzVySzFMMi9YUFAv?=
 =?utf-8?B?cWpnZmY1bE5RdUhQOCtmK0NWM0FBWm9ZQ1RjU2I0S0hHRXpWSlhuN0dGTVMz?=
 =?utf-8?B?MVNSYVJZT3FZWGlpRFpncXFKYUkwWUhKMUpFVXdubkpIREVoOE1uR1Z0THBz?=
 =?utf-8?B?TG9TTVZTT1RUVEdMclBUVG9hTFM4VG4zTkEyNENUemZybVZSeXJVbFc4VGJt?=
 =?utf-8?B?emtoaEthbGxoRzVxQnVPMGs3dzJQNTA2TmJNWDRuKzFlQmtURlV2dFJ0WURx?=
 =?utf-8?B?b0h0a3dsa2g2YXoyN3ZmRnJJa3dtaUdKN09QWFZ5c1FKREJOQklQSE11UGVS?=
 =?utf-8?B?OXJtU1ZqcTFhZTBWNGhQN1dlSC9qUk9meGp2Vk1JRVUxbXBXZzRiWEM2b1py?=
 =?utf-8?B?WDBTbW5QZjc4YWRSU091c1JUNDJ5SzNGdlBUMnMyRXc5akxTYTBzelBRWUJu?=
 =?utf-8?B?SUM2eTRIS3FNUnc2SXFMZlNlVGJ6RUpoNFFWcGZRY2ZSVjBjdW1lTmM4bUxk?=
 =?utf-8?B?ZHlkOHVneWpqUEkwbWNta1VzVm9BM1RUMlR6cFRWTmx3amZMV2I5WmFMM3hF?=
 =?utf-8?B?M2thbkl2YWl3YWVGN2taQTFQeU5vMWRiZDdKTmJYd0V2Z1hwQkxYT1oxOFBW?=
 =?utf-8?B?OVFVVXRnVlRZbmR3RjZGMHlyOVh5S0daMm0xcytHSHFxZW1aL3liYWRIN1dj?=
 =?utf-8?B?Q21lR3ZibnNyQW1IcHJzbU1tdFVUa0NjQng0cU9oand2QWx6U0dkMGNlVTFh?=
 =?utf-8?B?QU1JeERwSlp1akRZVjRDeEJiUUE2TTgxQUlKNXpLNVI3NG03SkViV211YWx6?=
 =?utf-8?B?djJ5M1pldHNPcmp3SzBhWVhCb1dSWHJ6cmNuOXVuTis1dGF1a05INXdTYWpW?=
 =?utf-8?Q?Mh6gDK41Te3RR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7384.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlEvZTlxb3NsS1hsYkRYMXd3aDlBcmdwTFNLWm9aL1QyQ0pJNk94bTZMQk8y?=
 =?utf-8?B?RjhYeWlVQ1pHN2gvMXNNK3BRZ1JwdGZCaHg3R0JMK0JlNUQ4a3JvaWNOZ0hT?=
 =?utf-8?B?YUczMVdXbCs4UXBydEFRdDNPTHI1Y2JlcmtJNXlPRzBnRUo5ZitaRUFJSjRv?=
 =?utf-8?B?cDlpdE9PU3pTUUc4cFdFOHJyMFJSSGlQN3ljYXlvRXVWM09WZWY5dE8wdUhS?=
 =?utf-8?B?WFU5UkdoaDhjWFJBbGRqZ3k5QW5jWmlqUkxpbjJEaWhlNVZTcVY1VlNmQXli?=
 =?utf-8?B?YzNSWFMyUldZNGFueXpVTDQzNGhBQ2dHSWNkQXdDKzdyS1pQUDQra2NXZWxw?=
 =?utf-8?B?U1BpWER5ZWNBbnpJdXppd1NiRlNVZEtwOXZLVytwUnJTa1lYY1VVVGlLRnZi?=
 =?utf-8?B?RjFOeEJJRkdvaG40a2Y0RXd5Q2RRbjdBaG9XWUt0ZXpXdlBzZStjZFlON3pR?=
 =?utf-8?B?TDhNaWlKcWFIdnBodHlTbnlDUjErNEdsS2RrS3QrTGFZT090eGF4VnRuMkRH?=
 =?utf-8?B?V1lZSTMxZ0tOTUtRRWlqaWR4c01qanNObmgxb3oxM0lxRXBGc2xRNHFnbVVX?=
 =?utf-8?B?SFUwa1Z2UU8zVEdkUFpHM3BlM1RRTy9SRjhoZXR6Z0QyenFVVXgrMmtCTGdF?=
 =?utf-8?B?WXVPU3BuOGtkaFllTk1COXdYVFRsRm9SeTlUcHduWDU4Z2YxMU51a3lVVkV5?=
 =?utf-8?B?K3dKMFZaRXo3WHNjMjFqSVhZRlhMU2ZLcERYWGl6VWs2UDZob2h5QjZEYllV?=
 =?utf-8?B?bWhBVS9Kb2wvUHF2a3ozL0VKU05paE1nanJ4ZnlxRXpnek10YVdIY0VSRDh3?=
 =?utf-8?B?c09Ta2NLYktYYi9iR0hEaG93cnpmcXRmVllTR3NnaERUb0U3VjNxMDYzcWhH?=
 =?utf-8?B?Q0RYTFBlbzZYYXZ5UFZRMVRXd1VnWE9pNVNOODFILzh1eTQ4QTl2VCtFa2t3?=
 =?utf-8?B?dmhmeXJCa1A4a1Z0eUhhenIzeUpncDl2Tk4rTi9OemRhSWJEU1lNNUZTR05v?=
 =?utf-8?B?T2Q3eWxNdEN1UmJ3MmpCRTc1UHlZYU9lZWVxUVpkY1MySGdHYjJFdmx1bUxN?=
 =?utf-8?B?c09aTFlyUk8xb2o5RnZOOHBkaUtQTWlPa3dOdFNlcmx5cEhWaktPVEpYYnk4?=
 =?utf-8?B?SDFTYllDMG9va1RWUHcybWhxTkp0SmtHNzlIZUNNeXVLVmF1Uk1XUExIMEV5?=
 =?utf-8?B?V09hSnUyZVRrc0dmSGJqbEhUVk4yd0c2TWd5ZDZ6Zzh6dk90M1c4SDNteW5a?=
 =?utf-8?B?RHQxSlpzQi8rM0treFAxdkFLbHNEVXNMOGdlbUFIVUFZM1lXcE9WQ05yN2RC?=
 =?utf-8?B?ZmhIRDJCb1I0ZWdqTDVNZlk5K3NXYXMzMkZlbEJBa1JnVUVrMm1EK2J4citr?=
 =?utf-8?B?VDBxZ2VuanpIZngvVE0ycm0xbUxuS1NLR01raGpXcVBpUXcyZ0xxVUJYK3B2?=
 =?utf-8?B?TVZvdTFkc3VrR0lLdGdKOFNtdjNLQjI5YnM0dGd0SFZOMEprcHdXZThuVGsx?=
 =?utf-8?B?ZHdkVTdCd2o1eWluL1RlMEF2cDFLUDhkTnRURGhXVUxiTm0wL0FCSWVqR3J6?=
 =?utf-8?B?RVdvcmNoeFpnVkwreDhNdHZqbGRzNVZJallyRlYxWGZwSVFVY2YxdHVyamFG?=
 =?utf-8?B?SFI2VWJITjcwRFJyNmVwdTRkK0lrK0E1OXFwZEYwTUJDMGZxd1JBOHMyR0JY?=
 =?utf-8?B?MnJka3pQZVF6OEVsT1lxemxKZytvNnlCR05QeFB3YXhUOXhlaXNvUDYxN2hC?=
 =?utf-8?B?Syt6cjNsKzNPUnNkMkptYkthWnRDNnZ5TGh6UE03Q3JsWXptV2VnK1NFWGJH?=
 =?utf-8?B?SlZsMnZ4NDlJRXA0RFpxcEgxZ2tMT3Z6RjcrQ2VjUWNPMGxONnpxZGtBamR0?=
 =?utf-8?B?Z2VXMGFGMDMxNW9uNmIxaVJwN0xRUkI4ZjBzSzZiTDNZRWkxMUJYRjV6L1gz?=
 =?utf-8?B?dlc4T3ZqRlIwT1lrejdpNVNNU3VHMk1kbjJZTmllTnZZUVRyYVJzczlNLzd5?=
 =?utf-8?B?bHQxS1d1WjJkZUFmdXdFNUg3RjFTaytqcGt1ZENqUFJGeDdNbTlKbWwraHlE?=
 =?utf-8?B?cE5vWGEveVpPNmdzQWZMWXVyYXdGYm0zdWlaZnJQUW1lZW1kNFVTSFFJU3lO?=
 =?utf-8?B?eExyMkE0TkJzRXQ5K1BMV3BUMExnY2VzL2JmaXAwejNmTEhhZmx5clU4Y0pw?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4af045-33e5-4182-0369-08dd830a9244
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7384.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:32:38.6426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gb5cDNj2aELyoyorl2+nGatJzslz351TRMz+0RE3wUYF6U+hjNhQXMkOpnUxen/CzuqbxNN5NpeGjt6gIm6Gu2tpOrMNvZNGB2eRTwd5eDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8238

Hi Neil,

Are there any improvements needed for this patchset?
Thank you for your review!

On 2025/4/11 19:38, Kelvin Zhang via B4 Relay wrote:
> 
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v6:
> - Rebased onto the latest v6.16/arm64-dt.
> - Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com
> 
> Changes in v5:
> - Rebasing on top of the latest upstream changes.
> - Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com
> 
> Changes in v4:
> - Remove the superfluous 'items' in the dt-binding.
> - Rebasing due to recent upstream changes.
> - Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/
> 
> Changes in v3:
> - rebase on 'amlogic,t7-reset' patchset
> - Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/
> 
> Changes in v2:
> - remove 'amlogic,t7-reset'
> - move 'amlogic,c3-reset' to the other enum list
> - move reset node from amlogic-a4-common.dtsi to
>    amlogic-a4.dtsi/amlogic-a5.dtsi
> - Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/
> 
> ---
> Zelong Dong (3):
>        dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
>        arm64: dts: amlogic: Add A4 Reset Controller
>        arm64: dts: amlogic: Add A5 Reset Controller
> 
>   .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
>   arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
>   arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
>   5 files changed, 218 insertions(+), 8 deletions(-)
> ---
> base-commit: 4bc28af2da876531e5183d25ae807e608c816d18
> change-id: 20250313-a4-a5-reset-6696e5b18e10
> 
> Best regards,
> --
> Kelvin Zhang <kelvin.zhang@amlogic.com>
> 
> 

-- 
Best regards,

Kelvin Zhang

