Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011030.outbound.protection.outlook.com [52.103.67.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED528A73A;
	Tue, 17 Jun 2025 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750141503; cv=fail; b=BdQ/YLfIIR3DtvZmJ7T6BcS5XblrMNkwA9+azJgNM96LbfZrrK+ugRmHndQHiiFrLPas8/i889+91OJrWsYiAN4ajMfwY6hqNiuiFPwyMFpWcbMX1Y5mjV8EEi79WSPvAWKE3yFSw57+D69asFQXLPe4LdQi4Tbh6w0BC6z+r5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750141503; c=relaxed/simple;
	bh=v8mOISlTAmAoqcbSw41AamSExmS+TxbHHFO/M4nsnq8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GUbvFaqtdQZahaGGGlEkAKrhIL6rWoecCCUrw2SrP+LclemgRKEBf2CAFd83x6rqQ6oyY9YG9GyvWhha9poHXdMg/+koHhA/LZQyzioWEGuWw6pCKJThzMJlthLRKxOxIHRSj1/b+tdBxmNlefpJFHMKSA5hhp0mHpb3a8zhnVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sXILu/4/; arc=fail smtp.client-ip=52.103.67.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="sXILu/4/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZvbEiRKPKN77EiMMMgZFIgvOwHI+UBqRahjBHoCCLRvtfbr2RHjNckayvRcaYdEK+hJjGn8OwftAUPyI4tW9xSS4MEI1zefR8M76rE55G7VIYXWGRS+pX4kUpNj2IgMWhhGTibhyCQzxZHzvGq1XH18UKzXqaasIBRBJPyRN+DUkqQk5dNnqsnAQJiwiPLQndIrAbyoyVZAgjO1/e9gQnhSRliSwmeYJ+rjCyKMDf7Z8GDvWoNVwMaWg8zusbWVVkghB5jd4wefL+7LVhYbR1zGUcYmS9LT5B2op1i27WqzwjmWcmIjqriaXiu45ewDMsejiZJ5u31vSp0oNnoN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jiiy4Y/qnI3fU5m9D6WhYwsZpdHZHadjJZLlsnqFk8o=;
 b=EPmuM+X9z5FAIQFlgoumrW1bWDczHjtquBNqNn3AUwrzw4hWUOGEQl0BcqRwrgdLV/bApx5QDSjuZV1k4dKjRC+tDAvQ1iinCay99X4pNQ/0ctOKx1oYCf82I0gX3Vm7+qh2PIIM1Dq3vP5yC4cf/Jw0dE71KnfUp7qN1wDj5e7mcNayXGOhIft0qAHj7ZJyarHeoMMlklSxw3ZiIcm72zvvKRcGOROCxgcv36Gx9tvLvQ4zfj/GhRMhFoYv4bfoTZFicty2lYZvHq91sUHu0biJqX4+geYVKmqbXq5bsnNNoT5vqziB72/P9rP6kEiZPCrn7OmFGbx+BdspydcmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jiiy4Y/qnI3fU5m9D6WhYwsZpdHZHadjJZLlsnqFk8o=;
 b=sXILu/4/V69m9t1JfEDe6FZ+gAao31kRlZlR3r6QWW/gUIAH8DgTy9Z3OgAugfVNdLNgKkRWzpp+v/3Rc7k2OJDLYyORhsNqw9rYEVQVHBK+V1QdMST1h8tRN7nJfrI9ycdvU5+5bIZv9y4TN87iTJabRIJFUwM/K2odpA/u5cNLTQIxMxonClBkhLCzXH5eRp3zgnnOfBwDkJUJrmZRPIgUrXbdkh3LPNXy+1xvJp5o7dHQQHOUWptWLOqPQGPu0nuQXqBtbkPX5aTHL2ORyuXQa2unGdjdiAiDj2UWA+NYftgza4kFa6kxXc0whDgMawzq8KYKb4KUjNNoNtLO2w==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN1P287MB3744.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:251::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 06:24:56 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 06:24:55 +0000
Message-ID:
 <MA0P287MB2262A3379FE97E90DE0CBAF4FE73A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 17 Jun 2025 14:24:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] reset: canaan: add Kendryte K230 reset support
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <6fe1575b-eeff-49b5-b8f4-a0b6c919827f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN1P287MB3744:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f9d6b2-6b4a-44db-6ff8-08ddad67ab71
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|8022599003|21061999006|19110799006|8060799009|7092599006|15080799009|5072599009|461199028|6090799003|440099028|3412199025|4302099013|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGVBNldWOGE1bFpTQmpsYkRNNHdtM3VQL29NMzM4NE1VZVZqRTg1N2ZCQTVa?=
 =?utf-8?B?Q3Z3MDEvTnJEZkkrc2k0YmpOTFRqTGRSc0tFWnZnellOZEtHN3RKcVc5UGcz?=
 =?utf-8?B?RGVoa2VWV0NwQ3NUNkl6My92N1cwUlVLQUJSVHpqUFJlcURTNlMyWnNtL0xs?=
 =?utf-8?B?dkNNZzVjZ0o1THRBUlBPYTFhTm5WVm9wU25iSUVxUWdoRXZtQjNHaG5NMGpy?=
 =?utf-8?B?bGtvV0hWdXl2ZGo2OTJCT1g1MmFnWnhybUtrWTRIeTZubzhQRmJHSGxXVzhK?=
 =?utf-8?B?MGt3cGNRUUtGTHhxNWlUbVRVbWs2RXZxeWk0Rzl5OExVdng2MU1vMzdLSVFv?=
 =?utf-8?B?OWdjZVBGckJIR1pKZTViYU84YjMwY0QzVDFRRXRUdmdqRHdhUFVIRXgvc2FY?=
 =?utf-8?B?TGRRQ2NFdHVEaVNzblFwaUl5TUdHcldYUFh6T25ETzVjUHRRS0hHR1BETW5I?=
 =?utf-8?B?eDR1WURUZXBBRlRoSmtmYXZnc3JGeXpnTVdselZCcytPZHVpMldlbHRNWEEr?=
 =?utf-8?B?WWt5YlJXZlpZZVVXRVpVU2VBZm4xQmdybE1ZYVpBVThYcWhnL2FpL09CNThP?=
 =?utf-8?B?dGorOUoyZ3FsS0JkNk4wZzdUZzRSNEk2b2pWRGxHT3RlNUkwWEhFc0V1bmtM?=
 =?utf-8?B?SWhhMlRWM1l4bitIUDk4enlXM0cxZHBWYmxEUFk2MnFEZXg0ZkxjVHlsOGlx?=
 =?utf-8?B?ZFd3QUtZZDQ2SlVwaWUySi9NUmkzUTJWTkh4cUVzbVVra3BOT2lDUjBkOXB3?=
 =?utf-8?B?S2dFclJTWWJWUzJQUlBpL2VIOW9NTFVmUEFkNnBrZHZnYUtuNUVtV1JwUFZm?=
 =?utf-8?B?U2xVbC9Xc05JMHBCdHpwanlJSmZSbzFZdlFsR21KbUJiUWJrdVRub1h1UFVE?=
 =?utf-8?B?cU9nVmIyU3hyM2pPOGFWZFptRzNZQkVZa3BXTkExQ2hCZWJBYTFYWUcyeHlz?=
 =?utf-8?B?ZUpwNHhjdXllREpvZ2gvQTFTVnBnWmVYZEZlSVQ4RGhscFV6WHNZbkpWSDB5?=
 =?utf-8?B?bG9yZlVycTZTVmlSVCtvVmgvTWVWc2YrRFR0VWg2R2VzR1B4Qzlzc1hTbVU1?=
 =?utf-8?B?eHB6aDZDa3hyaEttRTlEaEJrUFQ2cGdENllWWHNydEVRaXZpOFNXQTMzZ0xR?=
 =?utf-8?B?MWV3cVhGMTlrT1dBSStUcjQ5cHBCQTdvcXhxWjJhK1NtSW1VSW9UcFlaM3hC?=
 =?utf-8?B?aVorMCtJN2d5RVZFQi9tRjdsajN1OUMwTUt6V1luVmFTSUErYWE5YmszUm9q?=
 =?utf-8?B?b1pjWEFaODVJbnFyc0l5ZU93Njk5ZmxLL25JWi91bVU4SThnbFp6MHJGZEZY?=
 =?utf-8?B?WUhoeEJTOHN6MFlXZ3BUL1lXNXBlcENPcU9tNXF4ZE8zaDYyLy9NcmczaUg1?=
 =?utf-8?B?MHFWWHAzVnUxemFqSXphRERkeWpYNzg5c2QyUDc0NjVmK0w2QWtjd0pYUXpS?=
 =?utf-8?B?OVBjQ3Y2WDlnai9Ba1NXWlFRKzFyVUM0L1FZOVIzUGdlbGRneStXL3ZEMzN1?=
 =?utf-8?B?WEpjM2lDaXJCcHRWMGFsNUs0N2JlL1M4cnRXdkFCTTh4dDFlNzgxLzZnRVpY?=
 =?utf-8?B?bW1NMmhCR2ZMUCtQY0FBeC95T1IyT0hVMWtTMFBnK0FPcTYvQ1JZQnlhK3ds?=
 =?utf-8?B?ek9jeEk3bTd3U0pSSWRTcy9NRVBHR3hNeU1jMlVCalc0MTVYbTJtSTd3VjhL?=
 =?utf-8?B?S1pPZmpZUkZjZXNENUVsZWFnT3FNakpUM0NOKzlnR0EwMzFnT0t3a00xMXoz?=
 =?utf-8?B?bm5qaS94MTVDU3ZpQmREWE0rY0JnVjlycmhqWUJMa2xXSXZyTThlUGplMTAv?=
 =?utf-8?Q?ayYCiRA/59vrAa1vzf/lQ8RJJ3zEccJWiKfkc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGxvcTdUMDF2Wk92bmpWT0ZTckE4Z3grUnZsdGoxRHdtRjNYSzJSOCtDUzhx?=
 =?utf-8?B?UDgxWi83eS93Wk95MFozL2VpZnA4aUJwRldLUUlSbTBTOC9WcUpCRFhrZXUw?=
 =?utf-8?B?aWNKelBmSlllMHlZd2hQZURGS2VWdGxrQnZFN3p3R01mZmhjRVI4YWkvTFBY?=
 =?utf-8?B?SllsQkxyZnU2NG1QWG4yb0hIWlgxTk5WNnQ4RENhazdwOVVzWVFtYy9JUVdr?=
 =?utf-8?B?aWovYkFFTVhDSWpNTGJxTlVkOExmbW1UbnZVSDB3RWZoaUkwU29nVUJqVE9i?=
 =?utf-8?B?VlFvanI1SDFmU3pHdC9aeXdIUHpVeVR3UUQ2MWQxY2RaTlRBdGtyTUJFNVdl?=
 =?utf-8?B?a3ZDZUpkWklRYm56Q3ZlenV2QWJ0YWJ5RmNodXFJWFRJcDdCMDh5cWxQZnlK?=
 =?utf-8?B?YnJHdjM1SU5oUHNkbDJjZCtUNnd0Zzg3WllWbkExcnluVTJVZkdaNStYclNS?=
 =?utf-8?B?UGVBb1krcXZGUDFQK214dkNDWGFqbGY0VC9sNi9kQWhyekZaRlNmeTZFeUJO?=
 =?utf-8?B?cGZBcU9sYmpmbm9rNjluOENkZ2RFbnVHb2xnUFRqSkNBay9LNThydmtxbGhN?=
 =?utf-8?B?QlpHdUNsUElOMnBOci95MXlnR01FV05oeDMvZlliWXNCVlJCNHdlUzkwaW1z?=
 =?utf-8?B?aERqZ1FYbGVvbVBRMlBVR0VEbFR0c3J3RXFsVWd2NjVYNjQ4Q3ltYkpCSldo?=
 =?utf-8?B?SW5GaHpPNy9TUTEzMjRxQ3o5WnNJQzBNU213M3dNcmpTWEdNK1Nlb0dRVTU5?=
 =?utf-8?B?TTBsZVE0N093aEdUQUtxdlVPUERSZ21MUVpMZUVCTUZLTjg3RGV0djNlZnRM?=
 =?utf-8?B?MVZFNGZ4UjBidVZzWmJMS2ZRQnJGWnBPZkNod21KaFRxTnlSYmlSdnUwTTBr?=
 =?utf-8?B?MzRrS1ErSU9XV2VLSVYxN09SMXpRM0hBUXNZY1NCRHFGcytzTjZab3p5QkZR?=
 =?utf-8?B?NlZNLytRUVNWeElHRmdWK1UrWUVNbDlzQ1o4YWd4ZlZoazBWMWRvMFlPN1dJ?=
 =?utf-8?B?RXgrdUtmKzhNUUpPTVV6ZUJTZkh6cU0xeUVXbUovbFdUWk5uNTVFVDQvL2xB?=
 =?utf-8?B?dVg1Z0pGYW1OWmQydW1qcmFQYk1KTEUwQnZyZDlwVEp5aDk2diszVngyYXhs?=
 =?utf-8?B?U0Fvemtsd0xPS3diajJjeWM4VTRreHI5aEVRaGZETnI0TFVtY09PQ3R2Y1kr?=
 =?utf-8?B?Q0ttQUtOcVFFYTJHbGxEaEloN0VBZFM4VDVsN0k3MHM3ZGltc09adjloWHFW?=
 =?utf-8?B?Qm5DSUpFbVJ1MmMxMkRIS1lkbDVHa0Y1a2piOFh0NG1NWGc1YUQ0bFIwYjB4?=
 =?utf-8?B?ZzBYOFprcVJoV2dQK0RuUi9Eb2ZyNVdhSGRUOEtCZUVMOSsrTjRDdzBuT0h0?=
 =?utf-8?B?ak1iYjYvWHZEVVQ4S2R2WkRZTGQ1UnZndVNOcDgzRFNvOFFWRmliY0Y4ZUJw?=
 =?utf-8?B?L00zSlpVYlo1eFE3bFUvVHVMQ2FBVXUxVjE2YVR6RHNtZGFWQkVHNFYzcFA4?=
 =?utf-8?B?aVlWWittVHJyajl4OHRoMnlobW4za0dsaDVZa3FEZXBlYVVDNjVjK0hZU01u?=
 =?utf-8?B?cXNhL3lac0lFOWhoOC9CVkpFcWhwd0lEYldscVZwUmxNcDhEWEpJTEV2eXNL?=
 =?utf-8?B?cm9HZHc1dE5OVWdxMVpDQlQ0T1JOZ3dMTDRvOTJ6RXNGMEhqM3dQTjBjTjNS?=
 =?utf-8?B?R0JDc0k2cndsc3QzeWV6Vm8vNkdnQ3NCNm1yUXVEdEJQTmpMMHZOcUlBR0VI?=
 =?utf-8?Q?KejQ+7qg3WQS3Jk7RfZ9xacPx4xXY51JLXbnoiK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f9d6b2-6b4a-44db-6ff8-08ddad67ab71
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 06:24:55.3467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3744

Hi， Philipp，

Will you pick this for next(v6.17), I see you have reviewed it.

Thanks,

Chen

On 2025/6/13 16:49, Junhui Liu wrote:
> This patch series add reset controller support for the Canaan Kendryte
> K230 SoC.
>
> Tested on CanMV-K230-V1.1 board. Some of the HW_DONE and SW_DONE reset
> type was tested by reseting the submodule and checking the reset
> register value[1]. The CPU reset type was tested by a temporary rproc
> driver[2][3].
>
> link: https://gist.github.com/pigmoral/cc45de673775575750ac7fe49d4456a2 [1]
> link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu0 [2]
> link: https://github.com/pigmoral/linux/tree/k230/rproc-cpu1 [3]
>
> ---
> Changes in v4:
> - Rebase to v6.16-rc1 and test on CanMV-K230-V1.1 board
> - Collect and update tags
> - Link to v3: https://lore.kernel.org/r/20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech
>
> Changes in v3:
> - Update copyright/license in driver and bindings headers
> - Rename HS/LS to HISYS/LOSYS in DT bindings
> - Add reset-timing notes at the top of reset-k230.c
> - Replace long udelay(200) to fsleep(200) for HW_DONE paths
> - Remove rstc->dev, store device in rstc->rcdev.dev
> - Link to v2: https://lore.kernel.org/r/20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech
>
> Changes in v2:
> - Turn to_k230_rst from macro to inline function
> - Use guard to replace spin_lock_irqsave and spin_unlock_irqrestore
> - Remove assert and deassert operations for self-clearing reset types,
>    only reserve the reset operation
> - Add delay to accommodate the reset time
> - Remove blank line inside read-modify-write operations
> - Remove redundant default case in enum switch
> - Update copyright dates and my email address
> - Link to v1: https://lore.kernel.org/r/20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com
>
> ---
> Junhui Liu (2):
>        dt-bindings: reset: add support for canaan,k230-rst
>        reset: canaan: add reset driver for Kendryte K230
>
>   .../devicetree/bindings/reset/canaan,k230-rst.yaml |  39 +++
>   drivers/reset/Kconfig                              |   9 +
>   drivers/reset/Makefile                             |   1 +
>   drivers/reset/reset-k230.c                         | 371 +++++++++++++++++++++
>   include/dt-bindings/reset/canaan,k230-rst.h        |  90 +++++
>   5 files changed, 510 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250404-k230-reset-32987c6f0ed5
>
> Best regards,
