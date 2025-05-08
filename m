Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020126.outbound.protection.outlook.com [52.101.61.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BCE270573
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718381; cv=fail; b=Ups8KTEGBjF/GrvMidyx7/RIM3Fut8ylRlrd81Y19HwuJo9AOHLkfvH5iyzffkdJLta3xqk9awxUjXsb2cFgFo3V6kz9NhtKZxOoFMSat7gzk5/fgtJeHWmdCDyPfYsvQPLnFnvJmR2wFBPlnLYM8QdKMPa0paPdEHU3kcUg4vU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718381; c=relaxed/simple;
	bh=LjM+tMz4N6+e12gLSHc+TyJ2YS2/NTD3m2AbjqIQBFI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e+G+tF3m8wNlWQfKaBnzhw1BP+RjxnmDmrMatkSIVtPJzInBEJLeiqolQeUgLTb6jkYENd2Brr1pBsyOxOFTy1q9RUdF4QqEbPtqfEs9AMVFzKKxK1liaNVK8VrihDZYeuLo/V1VUsT5u8851ZudjAQKAYJ+GlmYfFJdYx1LUrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=OwuYvRxV; arc=fail smtp.client-ip=52.101.61.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="OwuYvRxV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0vuxrTMjOvke2/AzEes3LLlE/aR8KyEwPYBdgqLpUZweB2+cynqeLAR5MpD1WpCJMx7t1DvtufjzzWQplVyAZYsGhP48Nhna66WDk0AjbZ5vPYbsSWc54w84HdQl5gy2lJnQvQr84l2KSNdUL5QbdLNjUEzhQtjHJBfWeY0bJXkDomPNkHWxNTl1Fn9lJfG9IvsFyJc36VsXL5mfLxFN3f2IWZC5LZv8DfQK061Pyo6R6mu+pWFRdVgB+6sqyX4K/MXtjuVmBMzQ0+RUKxgKks61YB+EYG7mFVHfx6S57lxsZbdglIKg9hICtkn+FWbhrmMN3nj82PCwuZnA2Dlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oujdxC5835zJvmD2DsRyMgTtZ28drJHlnQBna0D219I=;
 b=lzkD1VawaXrS9Jv+EZqYXBqfX6zVaFua+1XTwjKbQsk5DiEifIgnRf14on6dyEJ1yrVxZ4wmAsuZ1Q2flTiky3wRqXnQhiNqflPLacF1KKmPFcttC3jfI9bY8X2FKJWvFxYb5ENLRh7AFYdrW7sY3HliAVYGp0XyNbLZC14ZlltMh4Zv9yCB7GujdQBeSIdCnlx4RZaJV9ndQJEuTUrv/RVfrOGRywDIvKPQ6ND4rwPRMbJ2j7nKeixChb4wg431RmETX1XVGgpeM+0R5L3KO0NzI0pmrH4i93RSj1dZpeUEiILQ44abPEo8citV7LmaG2+MSXqKwSCU2loV4pX8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oujdxC5835zJvmD2DsRyMgTtZ28drJHlnQBna0D219I=;
 b=OwuYvRxV2tfm+pDbaTQOj3XWpZSDdyw2t2fEjOIiQFzIib5ARPdJ44sXKsFQBdxE6hVwkc7rWq1R4kwUv1gA5zuQgPEbX8QF/ZUxQByZuGMhW+TxY+IVncFVmvHy2l8wmXhKn6quWWTkfe2iTKeJqUtAPO9apIMeRiG/5mpH+/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BL4PR01MB9121.prod.exchangelabs.com (2603:10b6:208:591::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Thu, 8 May 2025 15:32:56 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 15:32:56 +0000
Message-ID: <3ff5a4aa-38a9-411e-894c-4c00290f614a@os.amperecomputing.com>
Date: Thu, 8 May 2025 08:32:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Ignacio.MorenoGonzalez@kuka.com, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:806:24::11) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BL4PR01MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: fe615d94-14df-4d60-77a7-08dd8e459b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEd2eVFIbW5DWDVuRStWeFJYdkFlVVZCb3N6MzhpaEpLWHFRb0xnWnJZN2lC?=
 =?utf-8?B?bzl2NDlrVTR4ZDRkeVdOdXRxY1ZESWU2VERtWitWTWZiV2NtTUVoYmZCemMz?=
 =?utf-8?B?Q2JSVjB4VGpBMlJRMkFBTGMyOWRhaWlwVit4S2MxWE9XQ0N4cGFNQ2FPQVhW?=
 =?utf-8?B?KzRzcXhiZUlSS3lUTE5KY1hYOFgvdFl5U2JmR3BCNlltWldHeEVoc1ZHMUMy?=
 =?utf-8?B?VzNqUE9UK2QvcFlLbkErVFJXWmVCVTg0RCtTL0RXcy9EVXpzRFJBRHgySE9l?=
 =?utf-8?B?K3lNRFhaZ2hlZjZaNyt5QjZvNFpTQUpOZ2MvZjl0ZXNiWGFBakJacEJlS0FK?=
 =?utf-8?B?ZWxzdmpsZk9YVkxxaXNRNVA2MlhWcEhqWmxodGtJUjd5NDdaMDZpREdtaGQ3?=
 =?utf-8?B?SzZMV2lmSDhBcEdKTGU5QkJuRDM4aFZJWktNaFF3azhpYno2SE1ONlJpZ2Rp?=
 =?utf-8?B?TGFpRWRzNHh1SFRlOUV0RVBjYUovRy9GbmtsYkRNdklBSzc4d2tFdVdLeCs4?=
 =?utf-8?B?TTk3SUtyd3pGa0FacXVHenk5dm1oNzQ1N0lQanFaVzZmVG5qOHBmQ2ZiTWdX?=
 =?utf-8?B?bGh6cklsMmxlcE1JNnA5MWg5aFc3UEs1RDhlY09EN3oyeEc0dTMrcW5MU3Zv?=
 =?utf-8?B?TlZ1TWVLRkpsaFlpR281dnphMmwyR3NuNTlycExTOUlBRU5sdkI3WWZCaTJZ?=
 =?utf-8?B?NUdIM20vT2czamo1MUNDNno2bDJkVXdHek5UdmpRSzFtc2lDeDFRcGF3L3JY?=
 =?utf-8?B?RUo2OFBxTk1UTUswZE5YTEJzbkhZeEFaVC9DZnZlaFJhMkwwL3J1eVRScU12?=
 =?utf-8?B?djFqS2N4RG4rQW9Db05mYll3RW4zQUVhQmVwd0N0dVcvR24zMVo1Mk9DT2FD?=
 =?utf-8?B?QzA4YzdCYTFsNyt1Mk5aSzhXQ1NEdnBmUXdSSVdlRkZkQjZkd0huUmp0SmUx?=
 =?utf-8?B?UDNCaGplRnZvcTVaR2ZtTFRBUjZqWCtXVGpSMi9KS0NEbGduMS9IR3lTbGtM?=
 =?utf-8?B?MkhIRDU5L0VyLytzYWVmSURNYmFNMnRYQlFiU21MTmZpOXFKL0ErSGdrblZv?=
 =?utf-8?B?YnppWG9vSUFoMHdhcTBvdVUyTmk5SXdjUEhkQmxUaTVaK0hacEFDVVQ4cklH?=
 =?utf-8?B?djZDbUx6SThRZHU1dUI5c1lsZXdObHI1ZnNjdEdDK3MxeFFIOE5vRXdUbFRs?=
 =?utf-8?B?cm1HTWtPMis3WjZLd2t6RWdRaXNTT1hmMWNtZDUzaG1TeVkyR1VyeHhYZzF0?=
 =?utf-8?B?TjlDQklobC9EekhScWh5SCtRUkVrMkJUUTQ5ei9kaWhLYzZ4bU5yU0FIN2VU?=
 =?utf-8?B?em9OVzlPQjR4M0FxSnhLeGNXQytIazlGNEFyUUdWU1BHbEJ6UWNKbk92Tmxl?=
 =?utf-8?B?b3hLUUJPbVZvZVE5WEE2VTRuT0Z6ZlpWcWZsZ0ZjM2dqYzFuNEZWeHZESHVH?=
 =?utf-8?B?dHlQM0oydlMraW9zeHg3Y05xcExoc212d004VXcrT0Rqc044L0xtelFjeE9q?=
 =?utf-8?B?REFqYjNic1JIeks1Z3NHS1c5eU1EY3lsYkFUL1grZCtZRHVBWkhCMGFKK2Vi?=
 =?utf-8?B?U2diZzVWZm1yK1liVjM5YWhZL1V3RFRYSEZZRUo0aVZzeXBqTjBnR2hiaERj?=
 =?utf-8?B?VGpkd095K1JTa3NBWkhRd2ZBb3d5N2h6VndBam1QTTRuVHB5TGhYZ0ppOXM5?=
 =?utf-8?B?YnJVRkhPQzJTWHVrRHUrTVdCVDN3UXRLaXF2ZVRzRmpSU2JWb0FQTVJQLzVs?=
 =?utf-8?B?Q3piTDk1dG5vN3dHcFJROHpIL0ZZRmpucVoydlZBQnJ2TXdBZDVxblNWMjVE?=
 =?utf-8?B?T3J1eVd2ZllTZzF3eTdVa2NvSXJ0bFdnbWlhZWI4RDFMNGtpZks3Y0d3Y0xm?=
 =?utf-8?B?T01aaTVlckFLb3V5MSttdUJEaUxoZjZVdmdsS0w4MFRKR2g1Vk9FclZDd2c2?=
 =?utf-8?Q?RjzPP59cGd8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWJPK015cUQ1bG92Z2trWmZXZ0M0UFdMdkVKWXdOekNFZkNFdEh6elZiSDJB?=
 =?utf-8?B?QWdBRXdKU1FzSnl2L1RSLzBKT0dOUzRsdy9KSFB5Z1lGYTdnOHFvcTdDRUJI?=
 =?utf-8?B?bXpLNWsxZW1YUnpUT280OTBJVTlSdk13SE5MQ3BGYW11WFM5N0h2VXhHQTFw?=
 =?utf-8?B?aVFuUUI3QWdrblJ0QW9qbk1EcTVkOTJNOE1ETWwwaWhlUmxlbDhYbFdRb3Yy?=
 =?utf-8?B?Y3pnUUFqc3BUdEo1bkZGaFNaSWFVTVM1T3FhYy9qSlJVR2I2ajhTRUFNUXNw?=
 =?utf-8?B?Sm4velIyaDkrZSt6MkJVbzJnSi94Z2Z1L3AwZURXMWVMQ0MwVTlqaXFpMUpD?=
 =?utf-8?B?d0ZHUHNrWmVpdWZ2THhsbkVjTFBacVRNVERBUVJFaEQzMnNEdEVsS0JsVDBs?=
 =?utf-8?B?UnR0WGc2OGx0ZXV1eXJwYnBWRWJndlpDdnZ4aVkxZlhSZytvekRQQWxyVmVz?=
 =?utf-8?B?MGF0Q05WQkErM0xNTkVxSFRnZzQ0aXZORnRucTZzQWtuZFV2UWdKTTdaS3gw?=
 =?utf-8?B?eTdQdFZiaGdlZHRvQ3c1c25QSWhWTTVPa3FmRzZvTkowcWVJblBXbnBiaE0x?=
 =?utf-8?B?Ukh3Mkt2ajc4bHQ3cFA0bkxXQytwRmltejFUQU16QldaaWxadkg2K0M0eHYw?=
 =?utf-8?B?cnNRQWFLY0N5cnVkMGhlWDI4dG5nTDVLOUNMbFNkTVhlQXlDd3RkelV1VmZa?=
 =?utf-8?B?eHlTajM5dG9wMGNCYjQ1MkxWZXBzMTExK3pXUHd0TjNQS2xZYUk3ODZ3TFB1?=
 =?utf-8?B?Q01FS3k3WG82cW00Y1hsVVNPZWZiUUdET2ZqUFg1djQ3Z3BpbFMvZzlnVjdH?=
 =?utf-8?B?UVlwZ2tZSW1BTVgwQ3dOYmhSdUJGOWk1QXhxS0xpSStFN0MzTXhFdnFuMU9x?=
 =?utf-8?B?UHlnTVFpWThvNTUrZWVWN2s5aE9IQkYzemFWOEVhQTJJY0lFTEV0ZXpISzBN?=
 =?utf-8?B?MjFzcnlxd3grMG1sY254MWJ3bnRyL2NNdGFET1Q4KzhJKys3S0tVdHg1RHdQ?=
 =?utf-8?B?MDNKVWN1Z0VucTBsTFJzZS9sLzRhSDk4bkpnYTAwdVlMNnJhNzlEbzZua1hQ?=
 =?utf-8?B?R0UwVDFpUjd2NXYrcmF3R1dxOXRWMTRpZVVFbklvaEhrSFNadVpLWFBrQkM4?=
 =?utf-8?B?djRRNStXREQ2VzZUOGtzcm43MGVBbTRPOTBrdzNkVUhYUU41K0pYOXErdG9a?=
 =?utf-8?B?ZE5xTE1rbnR0eG9NeitGOFhEaC9pQS9zb29XRG9JV2xQUmtlUG5LNmN4MzRt?=
 =?utf-8?B?SlV3UjZTek95dW01R3pDNnB4bjdVVElnL2RKVmtzM3A2aVdYZUFYV1hrSnhs?=
 =?utf-8?B?UnZqQW5xcWZGNXQ5RFhmN0tjNmlFcWVvQnhrMDVoRm9Uak56MnFWOGZNZzIx?=
 =?utf-8?B?ODhVYkQyaUJUYjh2SEdkc3JLcWtSOUtRdjMxWmxEQTZMdVZqZlRwbmtWYS80?=
 =?utf-8?B?UFROY3ZMcHlENVB5STNsV1dVbkh1NEk0L0xuQk9RNlNzaVcrazVEODBTbjNi?=
 =?utf-8?B?N1ZXYXoxWEFnNmFYTER6OEplN3F2OEtHRFFFTWUxQi93WWlKZFRaeU1yUk41?=
 =?utf-8?B?TWNwd0V6cFEvSTVicnV4VkFJRzlTMW5OMnNLQU5HTnNCbGpkUUVZTEs1WGda?=
 =?utf-8?B?QUVxeUFxZDBDZ1dZRlk5eGVveG4rYW1jbEJGSnhBdUd2NExRNXRSaGZ1NFVI?=
 =?utf-8?B?MlhSeTNTb1NBZ05pZWZ3cW5HVXZtWjNocXFCMUdLQ2liQXFRbHJiMTI0WXRT?=
 =?utf-8?B?aWF1eWJNa2cxOVZvMTVJN2UvVmREM3BxQ1ZhU25pd2lEeU9SMnFzSW5YaWox?=
 =?utf-8?B?TTY1dWhReG5waENUdXZQV3dRRHJ4SGszL2ViRm5NWDBPS1B4WlZIS3huRlRx?=
 =?utf-8?B?KzI3dnkwQkdQNXd0WU5pZUZLWHVVMFRxL1cyZStUU2JvL05uU1p1WlRsZTJ1?=
 =?utf-8?B?VWx3Sjk0Yy90QmR6RVR5UExKNW1XLzcvWnhOazg0VEkwY0hXTlFFdXNXYTVR?=
 =?utf-8?B?cEU1TUF6Nk1Qd2J6K2JBUWxZV05EU05TTmpkS1pDbnRWb0d0cjEyVm9paFZT?=
 =?utf-8?B?OHphTy9ZSEtZNHAyS3FnMHdxWG54OTF0aXMvT21NMHh5TEdjZzNRb084cm1H?=
 =?utf-8?B?SGM2OHdxTHhNeUkyKzFXcXZsVS9sY3hQUHZVUkFaRWszaUZTeEtISS9QeDZz?=
 =?utf-8?Q?V/fB9thHkDZg4POTk065YaA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe615d94-14df-4d60-77a7-08dd8e459b4a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:32:56.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naduErX9RLoJ5PScWR6qFKEK/3M9g2V0wRqhB4YN9ip0CE/I7axYpoGU3LrP9nsRcgh0rlxDZSUsG8EkK76Ee/nhQuYhzAXr1xPapRZJctI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR01MB9121



On 5/8/25 3:20 AM, Ignacio Moreno Gonzalez via B4 Relay wrote:
> From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
>
> VM_NOHUGEPAGE is a no-op if CONFIG_TRANSPARENT_HUGEPAGE is disabled. So
> it makes no sense to return an error when calling madvise() with
> MADV_NOHUGEPAGE in that case.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
> ---
> https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com
>
> Here it is presented as a separate thread to avoid mixing stable and
> non-stable patches.
>
> This change makes calling madvise(addr, size, MADV_NOHUGEPAGE) on !THP
> kernels to return 0 instead of -EINVAL.
> ---
>   include/linux/huge_mm.h | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Yang Shi <yang@os.amperecomputing.com>

>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index e893d546a49f464f7586db639fe216231f03651a..5fca742dc5ba784ffccea055b07247707d16cc67 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -509,6 +509,8 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
>   
>   #else /* CONFIG_TRANSPARENT_HUGEPAGE */
>   
> +#include <uapi/asm/mman.h>
> +
>   static inline bool folio_test_pmd_mappable(struct folio *folio)
>   {
>   	return false;
> @@ -598,6 +600,9 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
>   static inline int hugepage_madvise(struct vm_area_struct *vma,
>   				   unsigned long *vm_flags, int advice)
>   {
> +	/* On a !THP kernel, MADV_NOHUGEPAGE is a no-op, but MADV_NOHUGEPAGE is not supported */
> +	if (advice == MADV_NOHUGEPAGE)
> +		return 0;
>   	return -EINVAL;
>   }
>   
>
> ---
> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> change-id: 20250508-madvise-nohugepage-noop-without-thp-e0721b973d82
>
> Best regards,

