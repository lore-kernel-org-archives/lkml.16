Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501C5230993
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018903; cv=fail; b=AukW70ytuPkBMKZnQIBIhRPzMk568BI4cIxeRtAWoEucN+3BdbCp+4oxcejhPs6V1wLJ8MsHX6ZF8F6wjWB7c04pn0y+xj93mip+tRGJc3m605FvV1mH565A+kGBof7xLT7BPEdsm7egdr6ebZPnvja58Q+TJ1GHCfq3/OTCHRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018903; c=relaxed/simple;
	bh=5BH0fpLQrt+ZjDkMC+uAlQyEE7T8Q1RyPxT7gSQLWnU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pva7pzfC09igwQjxe2DjZynVBSFUXsoxGLqLw4BLfRzO5nngZYjdZaBQBATBFLEMnn9PSxFA7X554qREOcRy+rQIo7BYJHsmIrqEogGBXNsmCyvDwEoE+mmW/s9UxWQfF5OJmZwKXIAnTR5XeCaS0WHcKWomB1mLunp0neesbWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4M812jN2; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4M812jN2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2F7Q/qMBL0yKuVuACAtmcFGJvBGPodi7O+eKS/x4HtOVtncs3q7Y7OdS0/6YQUpJ+WwMccBPXvncRzTA25KG8R9Ue0NNDWHpkXI2bPovJ/G36+wqpYDmbtb1EWgvU0JMZ3qtVYgyTks+5sMqO5kVGeZPwVEsWgwBorqw+f2wiGEtsJ2P7VJ/PNquU/J5010QlangQPAr5u8abSUQtPdusJDwi0F2lYgdx7mL1WmJo+nBLijSUKjnUi/qhqv25vqPcrfY+qBchXwdjjfydsdxkAE0ey0HbJwbQ252MRnRrkS4xMXcHiHQkqCP1c72M2h3pvqArJzxnaRAgSSYtft6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PchNJNhDZk4wXG+n4CZj+6LCaUFMSqRMqpiDit0W+N8=;
 b=sRXdA0qAUYjzFDOrg6G/yIlxsFaU6Wdv/epvYBgScLhNqX6jpyJgB9kO2UND5qaHMqC5lVSWGofl+rbpyin3B/YGO+MDUkXdq915Mdf0Zw5cBom/pzyUSYqaRGC3TxMZxGY8/9PYhyJBfIYxaMNGi6ZnDdB8ULCZUSDunSvo29VUr00/ECk1iJeXLgoTA1QSk0oIUTSuaYOp5FBkaYJ0/HiH4yiqzcho/6Tx4p3MBDsVEglv1pW6FtgNdeFTJROSY6mAXHowVqf66AE+iMbhdFU/YKXY/UrLlmc9fqZ5Tnp7dm0m7p1Ak+qar1fNNHwXRdP4tLyqI4NBPRY5WJOyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PchNJNhDZk4wXG+n4CZj+6LCaUFMSqRMqpiDit0W+N8=;
 b=4M812jN2TRUS70lq1duFAQwakaT6rvA/9KKjoJORYdWl1ogMk8ZZKAAapea4jfHgBqrDFlLzyhResN1MWHzeG/Pe/RlGvuhH+73gL7hW8Sk/kRmQusC2triwhSi9gzKatq5kL/N0tzlyDxckxFqHVI2sfvsb9aV33XncqVUXtNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by SN7PR12MB7833.namprd12.prod.outlook.com (2603:10b6:806:344::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 09:41:38 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 09:41:38 +0000
Message-ID: <8bc0a2a5-a486-4a4d-83e6-45b6c00685ea@amd.com>
Date: Mon, 7 Apr 2025 15:11:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [tip: x86/boot] x86/boot: Move the EFI mixed mode startup code
 back under arch/x86, into startup/
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>, "H. Peter Anvin" <hpa@zytor.com>,
 Kees Cook <keescook@chromium.org>, x86@kernel.org
References: <20250401133416.1436741-11-ardb+git@google.com>
 <174396438105.31282.2243827952440371468.tip-bot2@tip-bot2>
 <6eb78989-efa6-4558-9637-9467560265cd@amd.com>
 <CAMj1kXHTQSfsr8m86zGZCp1cvp9_kOpOe6P1MjjjSh72HZ8PSg@mail.gmail.com>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <CAMj1kXHTQSfsr8m86zGZCp1cvp9_kOpOe6P1MjjjSh72HZ8PSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|SN7PR12MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f16e1d9-baef-46b6-f713-08dd75b86494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUJBS0RHVXp1SUdhWmxHUUUwcWJrcStOUVBtOU4wWklPT0VDZDlUa3lqY0RH?=
 =?utf-8?B?elBrcG5jRUZMbXR2bUxaYTN0bFZJOGFuUEJOcjJCSm5RcEZaazlkdXhmTUxF?=
 =?utf-8?B?Kys0TEVlbktJYnByeGx6YVhNQlgrTDFzeCtTaGhlV24wcjh0Y1Mvc3dHZ2V3?=
 =?utf-8?B?WEVHb25kRnFVT2loSXhvV0hpRlhiTk1sQkEwQTAwWU83eTJDQThlUW1xa29p?=
 =?utf-8?B?dUJ2YmswTUUwU05kV3Vab0JUeGpqTWYzOUJSOG9RNGt1SmRYQkpCWHdFMmFH?=
 =?utf-8?B?T0xpSHp6emprZEc4OE5pL0wvWXhwbjlESDFodHNIcVh5a2xoR3Y5L0FQK3Rk?=
 =?utf-8?B?Sy96WlJxTUowVDlSYWhVajJ6Tzg4SzVMcTlpTmlNWjVwN0ozZTZVSjdlQTYv?=
 =?utf-8?B?dDYwa1IvbXNXcUxnem0yMHlicDZVSU84WTJuWC8yU1A3MG95WEp1ZWZBRzky?=
 =?utf-8?B?OElIeG1tVU9aL0RwZWt2MFZ0SWU1Mlh3WTQ4dktKQnh1MC8rSWpjbDkzMjgz?=
 =?utf-8?B?aUVNeHprODh4Y1NkKzlSLzVERzJ1cjlZRUQ0WFV4SVdMa3lrb1VhS1NjUTVw?=
 =?utf-8?B?bHQzNHJtYVpENzdNUGx5bDVOY3lrcS9lSUptamluNmVEUWZKZFU1Uk5KM1BW?=
 =?utf-8?B?TDBycWs1Szcvb0ZOTW4zTmlDRXhNWlhlY0kzUFdQdkNYbzJYalNqTDhpcGJk?=
 =?utf-8?B?ZU1HNVB5OUFvVzd0YXpERDJEZldVV3JNMlhueFBPU3RBY01MdmNTME9KVkgy?=
 =?utf-8?B?eFc3Q3RiK2xndnZZWXBHeU1nbnh6emtaWUZCbzhuajdtaVg0QmlnS2M4MVlx?=
 =?utf-8?B?RnZPcDNjWG4yUHRERVBEOW0vQjVNd0wvd1RWRk1VTi82NXZDUWp0bjI3NE1t?=
 =?utf-8?B?Zi9QOExrMDYxMk1ITjFJanJCbnlWSTFaT0hpQ1g1T1FlR0ZJWU9HUStVSDRx?=
 =?utf-8?B?NWFoY0gyK3Y1eHVrQ2ZDTll4ZUZESUlSRVV2c0U3aUJ2Y0RoUTVMOUxWakZM?=
 =?utf-8?B?VmdBamZvMGJjN2hYQlVIVGNHSC9NUThVOEc1V1p5OHpHZ25BQTRucWpWcmFa?=
 =?utf-8?B?VXVrdGxYdS9RY25Hd0VKWENrVmU2SXVCa0pCeXRKcG5kWUJ3M2RIMlNPMk1W?=
 =?utf-8?B?b00vZGxDd1p2NjNPdDk4UGlXc3RpVmJveGEvdmF3UkFvYzJTcTBkY1VGSnNI?=
 =?utf-8?B?Z1JMOUdhWlEwcjUrZGU5VndpUDRNYW5uUEVhSExPNjg0Y1Qyb0VYdEdpdWg1?=
 =?utf-8?B?THN4VWpvWC9NY3BwZHMyT0g5VnFsaGtlYkFUTFhpTDdwTDRKZVlKK1gwcWJx?=
 =?utf-8?B?NWpxWTR5WFhuVjlrY1hnTW5uaGRETVJhQThtK0g2a2E1V2IwVFVYTE9raVZl?=
 =?utf-8?B?NExPRTdnMkJGR0xnL2YvZmpkbTlnL1Jma1dSNVJDVDJuUDIwd2xGVEs1Zmtz?=
 =?utf-8?B?dU5ldFJyVFFZYmo0VWhFbVNWRFM1Q1dncHNSSWc2WnA3MldRdDUvMk10WEgz?=
 =?utf-8?B?RzA4OHVFK0VEYkNSNVZGSXNMYnNyVGZYMDlUNUJzVmcvVHJ5OFJ4S2VhbjVz?=
 =?utf-8?B?bnBadHlQY3lJZy8xSHpYM295dDFEMzgzc3BsK05hRXcveElVa0V2KytPTEc2?=
 =?utf-8?B?bHZzUDU2WFUzWlRiTnZ3bkJzcDFSUzR0TTBrSTdsS3ovdVJOQm9wdTZxdDYv?=
 =?utf-8?B?SnUzd2hIa2s5QysxZU5CcWkya3VPT0pVZGFST0V0eE0xNmRSK001cnBIOC8w?=
 =?utf-8?B?a0g2dFZWbTBnTUF6ZEdZYjlMbHNhMTVYWVNwYnBXc1NTTmo1U1RlZGNMTm1D?=
 =?utf-8?B?TjBhS1pCVEJOTFB4QU1FQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlRyY01DZUNRNWl2MTF0K3JZYko1V2RGUVltL05sU2EzUG01c2FBVzlYMXVy?=
 =?utf-8?B?SnY3Ulp3clVvNUppQSt3TEdwWFdMMnhCa3ZFRXptWEhTMzM1amtSaGNQT2Jk?=
 =?utf-8?B?QncyNSs0RHBwdlEvSzFBRGFYbXJyVUxkd2I2UndxbHlMWVlyNHgrM01RVnl6?=
 =?utf-8?B?RkVGQWFtOFpXbW9MT0R1NlpoT2MyUnRYdmc5MllRMXZQSXo3MThBVjZnek91?=
 =?utf-8?B?cndFeWI5WGpxSDFzMy9mUXJtdkU1VEorMGppNjBMVDFDYXNDZlpTWVhwQTlR?=
 =?utf-8?B?NzdnYTRVc21rbEpHSU9hd1V5YmlqVFFyMGJuMjBKSDNXM0R6eDZiL2hXeFhJ?=
 =?utf-8?B?UWR1aVNBdU84UjlKd3RLa0ZxWGZNNGx3MHBrSE15T0xBbVE4ZW1Udk5mT1Bw?=
 =?utf-8?B?b25OajRLL3JrZzdRditiaCswN2E4N0ZlZm9Pc3FabUdrQjZOKy9qV0FkaXhH?=
 =?utf-8?B?eE8va1I3dmxrL2NqRTk0RzllWTAyc3FybVhJdmRQTk9sK1ptY2IwTWdid3FY?=
 =?utf-8?B?VVE5RlBvcmZwWk0zUkwzOHNNQy82TXovSHpIenNDb3NubnAvcnRyTHFwa3Jh?=
 =?utf-8?B?NFRzbGFDUG54TEJEVGJNbTNTR2pYekdhVlVJMHpBUGxxNDl5dWRVRWMwa041?=
 =?utf-8?B?ZUhjWUpkbFltb3ovTkNPVXNqZU5WcXlZUGhteEg1RXNOT2ZiSzk0dThWcS9u?=
 =?utf-8?B?MmJWaEpraWF6YjhuYmtPeG81K291aTJsR0VEN2NOU0t6dEhrREVLUW9wcEFs?=
 =?utf-8?B?endUTmMxSjM3RkxTaklFMUtucWJOZDVKRGVrcFg3bHpDVXpTanlMSnZQSXZO?=
 =?utf-8?B?TFEySGtHQ2ZmVGFZRzFvclZhVU1LcjdWQ01OUGRDelgvZEpSQUJVa0lBT2pk?=
 =?utf-8?B?UE92MWlESzlnRWwxSndLMzkrU2tWMS9Vc2ZBRSs1c2Jab3FySGZvcmFHTVc2?=
 =?utf-8?B?OGtNb01saEtPVTdmM3F5a2FONGVOYkhoME1wNGs2NExaeDU2ZDJhZnJ6cFVK?=
 =?utf-8?B?dldaMzZCOEVWLzlNOWh0RFp3KzBFcmRtQmI5c2o3TlJoZkN0QVRUQkIvOHVr?=
 =?utf-8?B?bytPN29Vc1lyaXhxZWlOOFhoYUxxVnRqSVhDajM5c0hDNUF6aXU5UkVWaHV2?=
 =?utf-8?B?VlBPRzk1TEVibXNlUXZiSFlFM1Zud0c1MTFtV3Z4WFdNL1ExVGx6VWNUL1Vu?=
 =?utf-8?B?c0xXckFhL1lrTWZ4SHdnaTZLa1dNd0djVUxka3Q5dlB6Q1UrUEIydUJ6NUdX?=
 =?utf-8?B?OTV5dDBnZ0JmZFFqR0ZRSVFUVm1TV0prcUVKSlhhSXI5VnJ0bVUvMTJwdFFn?=
 =?utf-8?B?R2liUGJqajlNRHdiWG5qUzAxR1ZvL0R6SWhOY3Y5RFdYWlpyV0JpclRjWms0?=
 =?utf-8?B?WXhzZWl5SjhjNHJTdmZ1bi80RmtaOU95MGdKS2ZlYXJRNE5yZjhRY3VUc21i?=
 =?utf-8?B?YXFqaWVTNEdwbGlaRDZJWVpvOUNjQ1N1Q3k2eklUVlAvREFndEJYcXZKQy8r?=
 =?utf-8?B?eEZLWnV6M1RRT0FBZ0s1N3RCTUpkSWx6MGhwZ0tzTUwyYzZ2YzNaMGVhbWtj?=
 =?utf-8?B?UDIyckNrSDlMaTFtalRSekJLNm90UFB3QTkyQ1B6NmdRUllJRi9WaHNaakNB?=
 =?utf-8?B?MllNZk5KN0NMbUJaZXVuNm5MKzd5OG85blhWSk1zQU9JVXZwcG50Rmlsd1Ry?=
 =?utf-8?B?bjlySG04VHlKSUx2M2gyWlZ2LzVNeDVSL3J3d0FBZzYxZWh3anErZkEyTUVq?=
 =?utf-8?B?eHVkN05tV0xHTm83SENEdHhLSlRFbUwwYk5GTlgxR3U3eno3LzIwdW11WHgy?=
 =?utf-8?B?OFZ3WjFuZDhmQ2drdlJqd29wb01wZWpuZWlsY0tJUU8zSW5wcGlrUXBZS0RM?=
 =?utf-8?B?NjJWK0R2WkFsUVppV0h2SXdvTGZmd3RoUFY0NzVtMDBlSW54Z0xhd3NiUDA0?=
 =?utf-8?B?b0lYL3VzRW1vTS9KVEpXZUVGTlBYTkowS1dwbVJsazFpUzM4cnFIaForTmVL?=
 =?utf-8?B?Qml2L01SUVEraVYyNjlYeWxIVkd5dGZQVHI1LzZLM3Y0RmlsM0lTUjBncDNT?=
 =?utf-8?B?cVBXbU1ORGZsRFBKbm1RWTVTcHZ0Y3c2Y1dlRmN2TzE5ZHlKRUtUbTZPQWlC?=
 =?utf-8?Q?cKg8uUswlM/q/qK6mZ20LQWQU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f16e1d9-baef-46b6-f713-08dd75b86494
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 09:41:38.1795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jk2YxI5AiJjeEchxN+GdhN6kiD/6ar0xfMD4tSv2eUNcWM0TqAwd8e2uzpJWLAEgRraBbYqbQ2EXHnIVDo6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7833

On 4/7/2025 2:00 PM, Ard Biesheuvel wrote:
> On Mon, 7 Apr 2025 at 10:38, Aithal, Srikanth <sraithal@amd.com> wrote:
>>
>> Hello,
>>
>> This commit breaks the build of next-20250407. The kernel config is
>> attached here.
>>
>> Build error:
>>
>> arch/x86/boot/startup/efi-mixed.o: warning: objtool:
>> efi32_stub_entry+0x0: unannotated intra-function call
>> make[3]: *** [scripts/Makefile.build:335:
>> arch/x86/boot/startup/efi-mixed.o] Error 255
>> make[3]: *** Deleting file 'arch/x86/boot/startup/efi-mixed.o'
>> make[3]: *** Waiting for unfinished jobs....
>> make[2]: *** [scripts/Makefile.build:461: arch/x86/boot/startup] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> make[1]: *** [/home/VT_BUILD/linux/Makefile:2006: .] Error 2
>> make: *** [Makefile:248: __sub-make] Error 2
>>
>>
> 
> Apologies for the breakage.
> 
> Does it help to add the following to arch/x86/boot/startup/Makefile:
> 
> OBJECT_FILES_NON_STANDARD := y
> 
> ?

yes, this fixes the issue.

Reported-by: Srikanth Aithal <sraithal@amd.com>
Tested-by: Srikanth Aithal <sraithal@amd.com>

> 
>>
>> Thanks,
>> Srikanth Aithal <sraithal@amd.com>
>>
>>
>> On 4/7/2025 12:03 AM, tip-bot2 for Ard Biesheuvel wrote:
>>> The following commit has been merged into the x86/boot branch of tip:
>>>
>>> Commit-ID:     4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
>>> Gitweb:        https://git.kernel.org/tip/4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
>>> Author:        Ard Biesheuvel <ardb@kernel.org>
>>> AuthorDate:    Tue, 01 Apr 2025 15:34:20 +02:00
>>> Committer:     Ingo Molnar <mingo@kernel.org>
>>> CommitterDate: Sun, 06 Apr 2025 20:15:14 +02:00
>>>
>>> x86/boot: Move the EFI mixed mode startup code back under arch/x86, into startup/
>>>
>>> Linus expressed a strong preference for arch-specific asm code (i.e.,
>>> virtually all of it) to reside under arch/ rather than anywhere else.
>>>
>>> So move the EFI mixed mode startup code back, and put it under
>>> arch/x86/boot/startup/ where all shared x86 startup code is going to
>>> live.
>>>
>>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>> Cc: David Woodhouse <dwmw@amazon.co.uk>
>>> Cc: H. Peter Anvin <hpa@zytor.com>
>>> Cc: Kees Cook <keescook@chromium.org>
>>> Link: https://lore.kernel.org/r/20250401133416.1436741-11-ardb+git@google.com
>>> ---
>>>    arch/x86/boot/startup/Makefile           |   3 +-
>>>    arch/x86/boot/startup/efi-mixed.S        | 253 ++++++++++++++++++++++-
>>>    drivers/firmware/efi/libstub/Makefile    |   1 +-
>>>    drivers/firmware/efi/libstub/x86-mixed.S | 253 +----------------------
>>>    4 files changed, 256 insertions(+), 254 deletions(-)
>>>    create mode 100644 arch/x86/boot/startup/efi-mixed.S
>>>    delete mode 100644 drivers/firmware/efi/libstub/x86-mixed.S
>>>
>>> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
>>> index 03519ef..73946a3 100644
>>> --- a/arch/x86/boot/startup/Makefile
>>> +++ b/arch/x86/boot/startup/Makefile
>>> @@ -1,3 +1,6 @@
>>>    # SPDX-License-Identifier: GPL-2.0
>>>
>>> +KBUILD_AFLAGS                += -D__DISABLE_EXPORTS
>>> +
>>>    lib-$(CONFIG_X86_64)                += la57toggle.o
>>> +lib-$(CONFIG_EFI_MIXED)              += efi-mixed.o
>>> diff --git a/arch/x86/boot/startup/efi-mixed.S b/arch/x86/boot/startup/efi-mixed.S
>>> new file mode 100644
>>> index 0000000..e04ed99
>>> --- /dev/null
>>> +++ b/arch/x86/boot/startup/efi-mixed.S
>>> @@ -0,0 +1,253 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
>>> + *
>>> + * Early support for invoking 32-bit EFI services from a 64-bit kernel.
>>> + *
>>> + * Because this thunking occurs before ExitBootServices() we have to
>>> + * restore the firmware's 32-bit GDT and IDT before we make EFI service
>>> + * calls.
>>> + *
>>> + * On the plus side, we don't have to worry about mangling 64-bit
>>> + * addresses into 32-bits because we're executing with an identity
>>> + * mapped pagetable and haven't transitioned to 64-bit virtual addresses
>>> + * yet.
>>> + */
>>> +
>>> +#include <linux/linkage.h>
>>> +#include <asm/desc_defs.h>
>>> +#include <asm/msr.h>
>>> +#include <asm/page_types.h>
>>> +#include <asm/pgtable_types.h>
>>> +#include <asm/processor-flags.h>
>>> +#include <asm/segment.h>
>>> +
>>> +     .text
>>> +     .code32
>>> +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>> +SYM_FUNC_START(efi32_stub_entry)
>>> +     call    1f
>>> +1:   popl    %ecx
>>> +
>>> +     /* Clear BSS */
>>> +     xorl    %eax, %eax
>>> +     leal    (_bss - 1b)(%ecx), %edi
>>> +     leal    (_ebss - 1b)(%ecx), %ecx
>>> +     subl    %edi, %ecx
>>> +     shrl    $2, %ecx
>>> +     cld
>>> +     rep     stosl
>>> +
>>> +     add     $0x4, %esp              /* Discard return address */
>>> +     movl    8(%esp), %ebx           /* struct boot_params pointer */
>>> +     jmp     efi32_startup
>>> +SYM_FUNC_END(efi32_stub_entry)
>>> +#endif
>>> +
>>> +/*
>>> + * Called using a far call from __efi64_thunk() below, using the x86_64 SysV
>>> + * ABI (except for R8/R9 which are inaccessible to 32-bit code - EAX/EBX are
>>> + * used instead).  EBP+16 points to the arguments passed via the stack.
>>> + *
>>> + * The first argument (EDI) is a pointer to the boot service or protocol, to
>>> + * which the remaining arguments are passed, each truncated to 32 bits.
>>> + */
>>> +SYM_FUNC_START_LOCAL(efi_enter32)
>>> +     /*
>>> +      * Convert x86-64 SysV ABI params to i386 ABI
>>> +      */
>>> +     pushl   32(%ebp)        /* Up to 3 args passed via the stack */
>>> +     pushl   24(%ebp)
>>> +     pushl   16(%ebp)
>>> +     pushl   %ebx            /* R9 */
>>> +     pushl   %eax            /* R8 */
>>> +     pushl   %ecx
>>> +     pushl   %edx
>>> +     pushl   %esi
>>> +
>>> +     /* Disable paging */
>>> +     movl    %cr0, %eax
>>> +     btrl    $X86_CR0_PG_BIT, %eax
>>> +     movl    %eax, %cr0
>>> +
>>> +     /* Disable long mode via EFER */
>>> +     movl    $MSR_EFER, %ecx
>>> +     rdmsr
>>> +     btrl    $_EFER_LME, %eax
>>> +     wrmsr
>>> +
>>> +     call    *%edi
>>> +
>>> +     /* We must preserve return value */
>>> +     movl    %eax, %edi
>>> +
>>> +     call    efi32_enable_long_mode
>>> +
>>> +     addl    $32, %esp
>>> +     movl    %edi, %eax
>>> +     lret
>>> +SYM_FUNC_END(efi_enter32)
>>> +
>>> +     .code64
>>> +SYM_FUNC_START(__efi64_thunk)
>>> +     push    %rbp
>>> +     movl    %esp, %ebp
>>> +     push    %rbx
>>> +
>>> +     /* Move args #5 and #6 into 32-bit accessible registers */
>>> +     movl    %r8d, %eax
>>> +     movl    %r9d, %ebx
>>> +
>>> +     lcalll  *efi32_call(%rip)
>>> +
>>> +     pop     %rbx
>>> +     pop     %rbp
>>> +     RET
>>> +SYM_FUNC_END(__efi64_thunk)
>>> +
>>> +     .code32
>>> +SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
>>> +     movl    %cr4, %eax
>>> +     btsl    $(X86_CR4_PAE_BIT), %eax
>>> +     movl    %eax, %cr4
>>> +
>>> +     movl    $MSR_EFER, %ecx
>>> +     rdmsr
>>> +     btsl    $_EFER_LME, %eax
>>> +     wrmsr
>>> +
>>> +     /* Disable interrupts - the firmware's IDT does not work in long mode */
>>> +     cli
>>> +
>>> +     /* Enable paging */
>>> +     movl    %cr0, %eax
>>> +     btsl    $X86_CR0_PG_BIT, %eax
>>> +     movl    %eax, %cr0
>>> +     ret
>>> +SYM_FUNC_END(efi32_enable_long_mode)
>>> +
>>> +/*
>>> + * This is the common EFI stub entry point for mixed mode. It sets up the GDT
>>> + * and page tables needed for 64-bit execution, after which it calls the
>>> + * common 64-bit EFI entrypoint efi_stub_entry().
>>> + *
>>> + * Arguments:        0(%esp) image handle
>>> + *           4(%esp) EFI system table pointer
>>> + *           %ebx    struct boot_params pointer (or NULL)
>>> + *
>>> + * Since this is the point of no return for ordinary execution, no registers
>>> + * are considered live except for the function parameters. [Note that the EFI
>>> + * stub may still exit and return to the firmware using the Exit() EFI boot
>>> + * service.]
>>> + */
>>> +SYM_FUNC_START_LOCAL(efi32_startup)
>>> +     movl    %esp, %ebp
>>> +
>>> +     subl    $8, %esp
>>> +     sgdtl   (%esp)                  /* Save GDT descriptor to the stack */
>>> +     movl    2(%esp), %esi           /* Existing GDT pointer */
>>> +     movzwl  (%esp), %ecx            /* Existing GDT limit */
>>> +     inc     %ecx                    /* Existing GDT size */
>>> +     andl    $~7, %ecx               /* Ensure size is multiple of 8 */
>>> +
>>> +     subl    %ecx, %esp              /* Allocate new GDT */
>>> +     andl    $~15, %esp              /* Realign the stack */
>>> +     movl    %esp, %edi              /* New GDT address */
>>> +     leal    7(%ecx), %eax           /* New GDT limit */
>>> +     pushw   %cx                     /* Push 64-bit CS (for LJMP below) */
>>> +     pushl   %edi                    /* Push new GDT address */
>>> +     pushw   %ax                     /* Push new GDT limit */
>>> +
>>> +     /* Copy GDT to the stack and add a 64-bit code segment at the end */
>>> +     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, (%edi,%ecx)
>>> +     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
>>> +     shrl    $2, %ecx
>>> +     cld
>>> +     rep     movsl                   /* Copy the firmware GDT */
>>> +     lgdtl   (%esp)                  /* Switch to the new GDT */
>>> +
>>> +     call    1f
>>> +1:   pop     %edi
>>> +
>>> +     /* Record mixed mode entry */
>>> +     movb    $0x0, (efi_is64 - 1b)(%edi)
>>> +
>>> +     /* Set up indirect far call to re-enter 32-bit mode */
>>> +     leal    (efi32_call - 1b)(%edi), %eax
>>> +     addl    %eax, (%eax)
>>> +     movw    %cs, 4(%eax)
>>> +
>>> +     /* Disable paging */
>>> +     movl    %cr0, %eax
>>> +     btrl    $X86_CR0_PG_BIT, %eax
>>> +     movl    %eax, %cr0
>>> +
>>> +     /* Set up 1:1 mapping */
>>> +     leal    (pte - 1b)(%edi), %eax
>>> +     movl    $_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
>>> +     leal    (_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
>>> +2:   movl    %ecx, (%eax)
>>> +     addl    $8, %eax
>>> +     addl    $PMD_SIZE, %ecx
>>> +     jnc     2b
>>> +
>>> +     movl    $PAGE_SIZE, %ecx
>>> +     .irpc   l, 0123
>>> +     movl    %edx, \l * 8(%eax)
>>> +     addl    %ecx, %edx
>>> +     .endr
>>> +     addl    %ecx, %eax
>>> +     movl    %edx, (%eax)
>>> +     movl    %eax, %cr3
>>> +
>>> +     call    efi32_enable_long_mode
>>> +
>>> +     /* Set up far jump to 64-bit mode (CS is already on the stack) */
>>> +     leal    (efi_stub_entry - 1b)(%edi), %eax
>>> +     movl    %eax, 2(%esp)
>>> +
>>> +     movl    0(%ebp), %edi
>>> +     movl    4(%ebp), %esi
>>> +     movl    %ebx, %edx
>>> +     ljmpl   *2(%esp)
>>> +SYM_FUNC_END(efi32_startup)
>>> +
>>> +/*
>>> + * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
>>> + *                          efi_system_table_32_t *sys_table)
>>> + */
>>> +SYM_FUNC_START(efi32_pe_entry)
>>> +     pushl   %ebx                            // save callee-save registers
>>> +
>>> +     /* Check whether the CPU supports long mode */
>>> +     movl    $0x80000001, %eax               // assume extended info support
>>> +     cpuid
>>> +     btl     $29, %edx                       // check long mode bit
>>> +     jnc     1f
>>> +     leal    8(%esp), %esp                   // preserve stack alignment
>>> +     xor     %ebx, %ebx                      // no struct boot_params pointer
>>> +     jmp     efi32_startup                   // only ESP and EBX remain live
>>> +1:   movl    $0x80000003, %eax               // EFI_UNSUPPORTED
>>> +     popl    %ebx
>>> +     RET
>>> +SYM_FUNC_END(efi32_pe_entry)
>>> +
>>> +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>> +     .org    efi32_stub_entry + 0x200
>>> +     .code64
>>> +SYM_FUNC_START_NOALIGN(efi64_stub_entry)
>>> +     jmp     efi_handover_entry
>>> +SYM_FUNC_END(efi64_stub_entry)
>>> +#endif
>>> +
>>> +     .data
>>> +     .balign 8
>>> +SYM_DATA_START_LOCAL(efi32_call)
>>> +     .long   efi_enter32 - .
>>> +     .word   0x0
>>> +SYM_DATA_END(efi32_call)
>>> +SYM_DATA(efi_is64, .byte 1)
>>> +
>>> +     .bss
>>> +     .balign PAGE_SIZE
>>> +SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)
>>> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
>>> index d23a1b9..2f17339 100644
>>> --- a/drivers/firmware/efi/libstub/Makefile
>>> +++ b/drivers/firmware/efi/libstub/Makefile
>>> @@ -85,7 +85,6 @@ lib-$(CONFIG_EFI_GENERIC_STUB)      += efi-stub.o string.o intrinsics.o systable.o \
>>>    lib-$(CONFIG_ARM)           += arm32-stub.o
>>>    lib-$(CONFIG_ARM64)         += kaslr.o arm64.o arm64-stub.o smbios.o
>>>    lib-$(CONFIG_X86)           += x86-stub.o smbios.o
>>> -lib-$(CONFIG_EFI_MIXED)              += x86-mixed.o
>>>    lib-$(CONFIG_X86_64)                += x86-5lvl.o
>>>    lib-$(CONFIG_RISCV)         += kaslr.o riscv.o riscv-stub.o
>>>    lib-$(CONFIG_LOONGARCH)             += loongarch.o loongarch-stub.o
>>> diff --git a/drivers/firmware/efi/libstub/x86-mixed.S b/drivers/firmware/efi/libstub/x86-mixed.S
>>> deleted file mode 100644
>>> index e04ed99..0000000
>>> --- a/drivers/firmware/efi/libstub/x86-mixed.S
>>> +++ /dev/null
>>> @@ -1,253 +0,0 @@
>>> -/* SPDX-License-Identifier: GPL-2.0 */
>>> -/*
>>> - * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
>>> - *
>>> - * Early support for invoking 32-bit EFI services from a 64-bit kernel.
>>> - *
>>> - * Because this thunking occurs before ExitBootServices() we have to
>>> - * restore the firmware's 32-bit GDT and IDT before we make EFI service
>>> - * calls.
>>> - *
>>> - * On the plus side, we don't have to worry about mangling 64-bit
>>> - * addresses into 32-bits because we're executing with an identity
>>> - * mapped pagetable and haven't transitioned to 64-bit virtual addresses
>>> - * yet.
>>> - */
>>> -
>>> -#include <linux/linkage.h>
>>> -#include <asm/desc_defs.h>
>>> -#include <asm/msr.h>
>>> -#include <asm/page_types.h>
>>> -#include <asm/pgtable_types.h>
>>> -#include <asm/processor-flags.h>
>>> -#include <asm/segment.h>
>>> -
>>> -     .text
>>> -     .code32
>>> -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>> -SYM_FUNC_START(efi32_stub_entry)
>>> -     call    1f
>>> -1:   popl    %ecx
>>> -
>>> -     /* Clear BSS */
>>> -     xorl    %eax, %eax
>>> -     leal    (_bss - 1b)(%ecx), %edi
>>> -     leal    (_ebss - 1b)(%ecx), %ecx
>>> -     subl    %edi, %ecx
>>> -     shrl    $2, %ecx
>>> -     cld
>>> -     rep     stosl
>>> -
>>> -     add     $0x4, %esp              /* Discard return address */
>>> -     movl    8(%esp), %ebx           /* struct boot_params pointer */
>>> -     jmp     efi32_startup
>>> -SYM_FUNC_END(efi32_stub_entry)
>>> -#endif
>>> -
>>> -/*
>>> - * Called using a far call from __efi64_thunk() below, using the x86_64 SysV
>>> - * ABI (except for R8/R9 which are inaccessible to 32-bit code - EAX/EBX are
>>> - * used instead).  EBP+16 points to the arguments passed via the stack.
>>> - *
>>> - * The first argument (EDI) is a pointer to the boot service or protocol, to
>>> - * which the remaining arguments are passed, each truncated to 32 bits.
>>> - */
>>> -SYM_FUNC_START_LOCAL(efi_enter32)
>>> -     /*
>>> -      * Convert x86-64 SysV ABI params to i386 ABI
>>> -      */
>>> -     pushl   32(%ebp)        /* Up to 3 args passed via the stack */
>>> -     pushl   24(%ebp)
>>> -     pushl   16(%ebp)
>>> -     pushl   %ebx            /* R9 */
>>> -     pushl   %eax            /* R8 */
>>> -     pushl   %ecx
>>> -     pushl   %edx
>>> -     pushl   %esi
>>> -
>>> -     /* Disable paging */
>>> -     movl    %cr0, %eax
>>> -     btrl    $X86_CR0_PG_BIT, %eax
>>> -     movl    %eax, %cr0
>>> -
>>> -     /* Disable long mode via EFER */
>>> -     movl    $MSR_EFER, %ecx
>>> -     rdmsr
>>> -     btrl    $_EFER_LME, %eax
>>> -     wrmsr
>>> -
>>> -     call    *%edi
>>> -
>>> -     /* We must preserve return value */
>>> -     movl    %eax, %edi
>>> -
>>> -     call    efi32_enable_long_mode
>>> -
>>> -     addl    $32, %esp
>>> -     movl    %edi, %eax
>>> -     lret
>>> -SYM_FUNC_END(efi_enter32)
>>> -
>>> -     .code64
>>> -SYM_FUNC_START(__efi64_thunk)
>>> -     push    %rbp
>>> -     movl    %esp, %ebp
>>> -     push    %rbx
>>> -
>>> -     /* Move args #5 and #6 into 32-bit accessible registers */
>>> -     movl    %r8d, %eax
>>> -     movl    %r9d, %ebx
>>> -
>>> -     lcalll  *efi32_call(%rip)
>>> -
>>> -     pop     %rbx
>>> -     pop     %rbp
>>> -     RET
>>> -SYM_FUNC_END(__efi64_thunk)
>>> -
>>> -     .code32
>>> -SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
>>> -     movl    %cr4, %eax
>>> -     btsl    $(X86_CR4_PAE_BIT), %eax
>>> -     movl    %eax, %cr4
>>> -
>>> -     movl    $MSR_EFER, %ecx
>>> -     rdmsr
>>> -     btsl    $_EFER_LME, %eax
>>> -     wrmsr
>>> -
>>> -     /* Disable interrupts - the firmware's IDT does not work in long mode */
>>> -     cli
>>> -
>>> -     /* Enable paging */
>>> -     movl    %cr0, %eax
>>> -     btsl    $X86_CR0_PG_BIT, %eax
>>> -     movl    %eax, %cr0
>>> -     ret
>>> -SYM_FUNC_END(efi32_enable_long_mode)
>>> -
>>> -/*
>>> - * This is the common EFI stub entry point for mixed mode. It sets up the GDT
>>> - * and page tables needed for 64-bit execution, after which it calls the
>>> - * common 64-bit EFI entrypoint efi_stub_entry().
>>> - *
>>> - * Arguments:        0(%esp) image handle
>>> - *           4(%esp) EFI system table pointer
>>> - *           %ebx    struct boot_params pointer (or NULL)
>>> - *
>>> - * Since this is the point of no return for ordinary execution, no registers
>>> - * are considered live except for the function parameters. [Note that the EFI
>>> - * stub may still exit and return to the firmware using the Exit() EFI boot
>>> - * service.]
>>> - */
>>> -SYM_FUNC_START_LOCAL(efi32_startup)
>>> -     movl    %esp, %ebp
>>> -
>>> -     subl    $8, %esp
>>> -     sgdtl   (%esp)                  /* Save GDT descriptor to the stack */
>>> -     movl    2(%esp), %esi           /* Existing GDT pointer */
>>> -     movzwl  (%esp), %ecx            /* Existing GDT limit */
>>> -     inc     %ecx                    /* Existing GDT size */
>>> -     andl    $~7, %ecx               /* Ensure size is multiple of 8 */
>>> -
>>> -     subl    %ecx, %esp              /* Allocate new GDT */
>>> -     andl    $~15, %esp              /* Realign the stack */
>>> -     movl    %esp, %edi              /* New GDT address */
>>> -     leal    7(%ecx), %eax           /* New GDT limit */
>>> -     pushw   %cx                     /* Push 64-bit CS (for LJMP below) */
>>> -     pushl   %edi                    /* Push new GDT address */
>>> -     pushw   %ax                     /* Push new GDT limit */
>>> -
>>> -     /* Copy GDT to the stack and add a 64-bit code segment at the end */
>>> -     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, (%edi,%ecx)
>>> -     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
>>> -     shrl    $2, %ecx
>>> -     cld
>>> -     rep     movsl                   /* Copy the firmware GDT */
>>> -     lgdtl   (%esp)                  /* Switch to the new GDT */
>>> -
>>> -     call    1f
>>> -1:   pop     %edi
>>> -
>>> -     /* Record mixed mode entry */
>>> -     movb    $0x0, (efi_is64 - 1b)(%edi)
>>> -
>>> -     /* Set up indirect far call to re-enter 32-bit mode */
>>> -     leal    (efi32_call - 1b)(%edi), %eax
>>> -     addl    %eax, (%eax)
>>> -     movw    %cs, 4(%eax)
>>> -
>>> -     /* Disable paging */
>>> -     movl    %cr0, %eax
>>> -     btrl    $X86_CR0_PG_BIT, %eax
>>> -     movl    %eax, %cr0
>>> -
>>> -     /* Set up 1:1 mapping */
>>> -     leal    (pte - 1b)(%edi), %eax
>>> -     movl    $_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
>>> -     leal    (_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
>>> -2:   movl    %ecx, (%eax)
>>> -     addl    $8, %eax
>>> -     addl    $PMD_SIZE, %ecx
>>> -     jnc     2b
>>> -
>>> -     movl    $PAGE_SIZE, %ecx
>>> -     .irpc   l, 0123
>>> -     movl    %edx, \l * 8(%eax)
>>> -     addl    %ecx, %edx
>>> -     .endr
>>> -     addl    %ecx, %eax
>>> -     movl    %edx, (%eax)
>>> -     movl    %eax, %cr3
>>> -
>>> -     call    efi32_enable_long_mode
>>> -
>>> -     /* Set up far jump to 64-bit mode (CS is already on the stack) */
>>> -     leal    (efi_stub_entry - 1b)(%edi), %eax
>>> -     movl    %eax, 2(%esp)
>>> -
>>> -     movl    0(%ebp), %edi
>>> -     movl    4(%ebp), %esi
>>> -     movl    %ebx, %edx
>>> -     ljmpl   *2(%esp)
>>> -SYM_FUNC_END(efi32_startup)
>>> -
>>> -/*
>>> - * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
>>> - *                          efi_system_table_32_t *sys_table)
>>> - */
>>> -SYM_FUNC_START(efi32_pe_entry)
>>> -     pushl   %ebx                            // save callee-save registers
>>> -
>>> -     /* Check whether the CPU supports long mode */
>>> -     movl    $0x80000001, %eax               // assume extended info support
>>> -     cpuid
>>> -     btl     $29, %edx                       // check long mode bit
>>> -     jnc     1f
>>> -     leal    8(%esp), %esp                   // preserve stack alignment
>>> -     xor     %ebx, %ebx                      // no struct boot_params pointer
>>> -     jmp     efi32_startup                   // only ESP and EBX remain live
>>> -1:   movl    $0x80000003, %eax               // EFI_UNSUPPORTED
>>> -     popl    %ebx
>>> -     RET
>>> -SYM_FUNC_END(efi32_pe_entry)
>>> -
>>> -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>> -     .org    efi32_stub_entry + 0x200
>>> -     .code64
>>> -SYM_FUNC_START_NOALIGN(efi64_stub_entry)
>>> -     jmp     efi_handover_entry
>>> -SYM_FUNC_END(efi64_stub_entry)
>>> -#endif
>>> -
>>> -     .data
>>> -     .balign 8
>>> -SYM_DATA_START_LOCAL(efi32_call)
>>> -     .long   efi_enter32 - .
>>> -     .word   0x0
>>> -SYM_DATA_END(efi32_call)
>>> -SYM_DATA(efi_is64, .byte 1)
>>> -
>>> -     .bss
>>> -     .balign PAGE_SIZE
>>> -SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)

