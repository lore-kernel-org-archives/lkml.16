Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022077.outbound.protection.outlook.com [52.101.71.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2A19CD0E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713940; cv=fail; b=EMoN196Y7qWacKvXOdpmCMpSXcvq2OTdQrVg7y+uXI7fxeA8AS/AZ+wFwYbc9Suk1BWZnCYkXOHIiwoV+w+Qv8FKiIAK2mh7AXB2DH2gqVk5u3uurlKKaJILyKLBT5Wr4zFQZJytHRGhHvhgxwp8am19V903z6e2RudQRyahbiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713940; c=relaxed/simple;
	bh=KVigOTUFPGRZOfZ6aNsAJLy5c7CwFKLGyrpq2/RYxPg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AvO10ErnyUdJ1o6Sv+OnS9XNsPX2PbgQ8s7C0nbnou0u3CXUi7rwqvUUK0tkXU16wyQCfjr+VhMwNwCjL1LWsf0hZvTknjAapgHJk4rrDXlz7s1qjkS8HvC2i+ZH+j3XtixgDB6uuCzpMqlqsYXLaj9iQ8mFCxQtlNSR+EcQozo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=QOi+keHB; arc=fail smtp.client-ip=52.101.71.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="QOi+keHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV0ZT+2apwyXNa5cvbi2tD1ah3UW0uEHWWJHptC+l8O5GYyDjvvFP71mew6E3ijyzcfXx3V4PRVSs8S+FI/XlawLSqT2HTJqKZxZhUVB/7BcpXYihd6dzV7L9YD9AipnLF6iGJlYo2zagXtSIYtrIJfjldJmPBLQNgdoZzFyFzahxWkq5A5ebOlKKRU0o+NPtDTuwf0Yiwa1iI9Moz4PBusqXEsM70ac/W798e7SxKpQuqHziZLKVztHs63OrDIZRNPB+l7qqnziyj9F4TZGbH1rmae5hLvPqQd5Fzv/1V/iqioXWtTdsdJwwCuJpoR3VZJBp11EvzAwxNi25kjAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDnhevAkuxTz+RlHZYg/atrU/X91ONhX2LJl6coP14M=;
 b=SJo1Pcuybafc7gwT41EfJ8eSUHUDF2a2pNmsDr5bjqDaOvz6k1Htq38mw3jKOQEgv0I93VZpJEGHYvlbUy7i+HJseO4TXrAa1j/GyNRMYJbAXQrxqY21ceeP21KOM/k/Otu4vL1KQWU27N4YFEu1ic7I5VvS4KYNYdU/aEZ4R7WdO0s27/BHFOFmJOLbP0CK5zu+aIV/c3zKEfeoMIs/rgUkxrueCA4kOuBoxgl+J2Ag5BRFoBAzfekXsmEdkDFi9WUptCUVQm9C8nH+zb1m3ILplKIsstuU20JsOuUiRyPJQv2qdKkoHryx3lcWptcfug0iMhC9Rq/VDq59QhTHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDnhevAkuxTz+RlHZYg/atrU/X91ONhX2LJl6coP14M=;
 b=QOi+keHBZv4LXf77ZO0rIKBWjzgt+MyLl0vBjIn+NGyhlu8Qj0I443JSNR4ETpHG5eUuIureJhC9BRqeco6owXjWkBVfg+JR0rm20EpnJmEPkUZL/dnTSGgxtd3OAk1JgVHZXUO1A86o2QNKWoAPsNdIFdhMtMHyCMxwe23dYEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by AS8PR02MB9163.eurprd02.prod.outlook.com (2603:10a6:20b:5b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Thu, 3 Apr
 2025 20:58:52 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%3]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 20:58:52 +0000
Message-ID: <95b7eaf0-2040-a25a-4c41-ab86aba82a8d@axentia.se>
Date: Thu, 3 Apr 2025 22:58:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH] mux: core: add exclusive mux controls support
Content-Language: sv-SE
To: srinivas.kandagatla@linaro.org
Cc: linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250326154613.3735-1-srinivas.kandagatla@linaro.org>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20250326154613.3735-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0015.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::13) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|AS8PR02MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ffed47-09c4-4879-83ef-08dd72f256f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXNLdlNxT2piNjFZSWZUeEt3UTYvSTMrWlI0dEJ1YktRTEdNR0JuR1BQQ3U5?=
 =?utf-8?B?aXc5UzBFZXlicEJDbFMwUHZsaUpRYk43RkttN2poZ1Q3dlBuckw3MTFCSFMx?=
 =?utf-8?B?YmQ0aFhlTXYxQ3hhWVpaY3BENVFhUjdzUStOclpGb01QY1ExV0kwRkJTR3Zj?=
 =?utf-8?B?Wmg1eE9kb05oR0gwdlRKUVRZL0Y1c2FKZ2lBVmNtZWFXeTROeS90SnNvTTg1?=
 =?utf-8?B?M2cxcjdBaHpHMDFvdklWRU1aa0VCdUtHMmIyNHl0TGFKUTdXTXN0S05mL2Iz?=
 =?utf-8?B?SVpZWk10c0hnK04vdk1hVENPb2diM2xiUnFEZk9xRE4rWFN6UGxhR3NHTS9O?=
 =?utf-8?B?MWdJdTVVK1RqL0pReEhHWE5ZMDZ1cGNwcTF1bXNQbERTcWlaOW5QbzFkWVRC?=
 =?utf-8?B?RjFkRVQ4S0x3d1RvR2dzWVRYV1JwZjZkZXByZU9kc3JlRDMvSElBMzNJWkk3?=
 =?utf-8?B?QkNjSTlOSmszak1HbWxEVFpqNnpjTlV5dVVyRHZLanlXZTlTYUZlazk1SHpO?=
 =?utf-8?B?d3l5ZG02bFg3OHpTZVptck16R0R4RmdDQm1kRkpWaHpWY3JiS0FmTUFnWGp0?=
 =?utf-8?B?b0kxMDFhamRPYit2MlZGSTNkaFU3a3RxaUJLSVh1VnlGVjg5UVZlWVQraHZ0?=
 =?utf-8?B?VVhuTUV5MXU3N0hMVi9DaXp1dy91VG9GZ1FaNi8zM0JZdUw5VVY0OVhzeEY5?=
 =?utf-8?B?OTNXVXU2MnFDV3QweHF0OVdPQ3Rmc3JtMnlIcy9RdVVyRUkwdEJPSTBtVnBW?=
 =?utf-8?B?cW1hSHh3eDBIVE5jaEw4Vzl5ZnFpNjY2dU1QVXpkYmlnYXA3ekJHS0hFOVFP?=
 =?utf-8?B?UHFNenBwNExHaDE1YzMyT3BKL3pmSTBPSjBNeGNxSVdvQUZWT0lLNGpUbC9k?=
 =?utf-8?B?aGgxYkRPcGpsb2hCRDhPNHNGVml2MFVJOTNFZmhDT0RQQW1zWUtJY1BOVTJy?=
 =?utf-8?B?L3paM3IweENhVW5lc3dZOXM5Q0hYOUovQmNIZnlpQmdRQVdIU2lnTUxHaDha?=
 =?utf-8?B?bEh2MTRRd3Jvb003YnREVEVEdThnOFpESm5OTFJVOFpQbG9ZRDVHdHBlaWJx?=
 =?utf-8?B?bXpvYU9HTkZUdTQ1UWR4TXdpWTRWcDZOcTE1RjU2K3oyMVZvcVJUVmg5bk1v?=
 =?utf-8?B?VldXZWNlSCtlWTRaV3FjSmR4L1ZqN092UXBRc1oxQlF4MWtjL2ptVG0yR0Zv?=
 =?utf-8?B?UktEamR2V1E3SHlhMThVbGR4Q2pZNWJTVEZFY0IvcnRGYzhKVjNheTJYQjJY?=
 =?utf-8?B?YXdieEFJUWVlcmZJT1dUNzUzNUp1d3V6S0dBWlZTRTIzVWtVcFkrRW5oU1Jy?=
 =?utf-8?B?ZEx0ekJ0ejBBQnJtU2d2bEdlbytFSStSbGd2TnVkaHFQdktQTEd3WFluQnRF?=
 =?utf-8?B?Z3VHYlY1UjlRVWhNZkRoOGhKUm1GRVo4L2k3Q3orUnUvei81Nmd5R2lndE5z?=
 =?utf-8?B?c0hvbVBOU21rREVWcStDa1Y5Q0h4cFV4azFmSnVHOWZBTGlwV2RvUWh0L0Ft?=
 =?utf-8?B?WU1Zc09ZZzJnT1l2TUhEdTJFbGQyY1FMVmdMeGZZMDdTVHg2SzdqeXpqRzZI?=
 =?utf-8?B?TVpncU5zNEw5U0pVN3c1cUhKVXc3QmY1OGNvRFdCYWUxSWxiOXU2ZUliNCts?=
 =?utf-8?B?bmR4ZVcyaWpaRDMwUEVMV1l4WHpZcUZZRGVqNThyaVZYMUhSMTNDVjEybVht?=
 =?utf-8?B?ZVFqdTJMTEtvNkhFQUJjdHQxekw5T1pMQlhiRzhUcFFITE90YlF6MDBBYmxv?=
 =?utf-8?B?Qng4b3ZCWFYydkFUVVdTdi90aW1NT0F5czVsQ3h5WXFNdWQrU2FkNlJPdlpD?=
 =?utf-8?B?ZG9mYzAxZFYzUXRSRXpza2R0Q1VLOE15WXFvazhGL09xenhGM1ZXOGFCN3cx?=
 =?utf-8?B?ZjM2TTF3ZVlTUVFaNDZ2dGpRNVlWQXIySTdBS1hEcWxxZ05aQnBTQ0g5dU9B?=
 =?utf-8?Q?2+59r24Suvs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2toaGFuQ3JHTWUzcVhtRXFqWTdBR0VvZnFlNjRYSW5IZkt0VVltZXlhUmxM?=
 =?utf-8?B?WW1HdFZMc2ZNNldMOTFJbnZXSXdLYzlOK3NTZGczVUN6bDlIU0ZVY3NyNzdp?=
 =?utf-8?B?RjJyTkp6MDhMR2R1NGlnVnVVY1ZOa2s0Sm1kV3BvTWVyUHNCc0pXaU0zMTVV?=
 =?utf-8?B?SzNjVTlqSTNZY1NpS2pNUGdIRVgxZDU2aStYTzhHR29VUC85RkFFNmFMbXZE?=
 =?utf-8?B?cS9lbVd4dlFqN0dmdzBhZEY4SDgyRk1vbjI0Kzg2T0c2TGEvMVAyMkhMazR4?=
 =?utf-8?B?NHFkMlgzYVd0bXdMY0N5REwwYlE0b2RLdmE0ZkxENy8xNXBEK1VlL0FOQWtv?=
 =?utf-8?B?cmE0TE5aTmFoVkQ5SmVPendUUXpvMlJ3cnZYS2J1SGxrTUR6ZVNFeUcyb2cw?=
 =?utf-8?B?S3QyTGV4QUkzOWdMeHVTejZUWjluT2l6Uk95VjIrNXkxMGdwc21Lblk4YXZW?=
 =?utf-8?B?NXNUQTBnVFRxcDFzYmorRDBKcklsZXV5K1AxWkk1ODhTRUNlbjZ4eDczWWJw?=
 =?utf-8?B?eGJvcmJZRnd1bHN1K0J0a2pINUU4SkkxN3QxVU9WcytjcDhaSnZjTSs5cEtX?=
 =?utf-8?B?UU5wTllsM0JjNE9qUTV5dU1MK2NubURRSEtoakd4dDNLMW4rUm5lMnJlRDlq?=
 =?utf-8?B?QjBKRUVWc2g5VVpkUnVSMyt3aS9jVUZBSjRWNksxOFIvTmJEQjh6M3FhYUM3?=
 =?utf-8?B?blArak1wZmV1SVdSUGZPQnVvM1Rvc3BiRkdSQWcwQ1piVEhmcUtWRTQ2aUhV?=
 =?utf-8?B?RC9MVjVHVVZJQU1LQmtKa1JrWHlOWXB2NjY3Wkx1K24xT2tQdmo4WnN0VmVH?=
 =?utf-8?B?MDdjNkxWV3VkTndab2lmNGNRQndvUkI4WWV3VWhDOVllYUgxNFBqMmcyQVFm?=
 =?utf-8?B?bVU3YmY0bUFJdVg5TWxJT1NqRllWWGVSbTU3TElFWmRNU1ZuOVd2bXdqTTJw?=
 =?utf-8?B?d2xaNU9TZmpKK3JvQi8ydURYVXYvUWk2QzBKZjlQVExhb21QbVAwSlFEM3hv?=
 =?utf-8?B?TFRCOVVURFhEaFFJcXQyV2dwakg4OWF0eG82dmkwSE5obWJ4Wlc2Z2xNZTBQ?=
 =?utf-8?B?c1EvdnNOZlJBNWdmckNkTVhoNTNGQWFJSjZEYW52Z092L0d6L2ladldJU2p5?=
 =?utf-8?B?Q1BmV0J6bkFhWWZFZ3FvOXJTTkRZb3BiRU8vcnloRGNLalBiam03eWRQbDFY?=
 =?utf-8?B?VWZHUXVKMHZ6bFQ5TzV4TDlkL243blhXZ0dSc0N6SUxteGJsamJSemZXLytm?=
 =?utf-8?B?Umc4SGRkUFBnWnA1Y2FqeUpzVXlkWHhDYXFoMTRNdThNQytGcFViVXFvamIx?=
 =?utf-8?B?OHNNekVmcXZRTDF2aWhPR3M2YmpVVmt6ZENZeHRTUiswbmlvNGF3Ukd3MFgv?=
 =?utf-8?B?VWxVbXJ6bTZPSEMxdmVSVDR6OWJuSC9tUDZ5ZFo0UGNQMStKZGQyaS9lamox?=
 =?utf-8?B?Q2NBU1lZLy84WmhWTXZqQ1NDdkZ5UUtFaE1LanJWWVltZTVBa1VVRmlwRC9K?=
 =?utf-8?B?bFQyYXM4M3hXeHJaU29ZWlJqdkkvODZXWEdmYXQ3bnhBR2RadjVjVmU1ZHpp?=
 =?utf-8?B?eXI5QUlWZlZ4R3lyNFBQQk1ZUzFQYmw1bFNXWEdFS2MyK2VnTElHdHdQNzI4?=
 =?utf-8?B?b0VrKzhsdXppeVVKK1JGT3YwV2RCeUNZb1Q4VjMxNE1wN0FYd2FqL2NjamJz?=
 =?utf-8?B?TEdpQVdWOTRiWE4zN2NEQUsvVzBScE1aZjROenIyNHo0bnQ0Zm9KQ1dFUFUw?=
 =?utf-8?B?M25LTkVTRHdHQ29na0RGUEk2S1hQMm9GZGpqNURLUWlBK281WkU5SVpDVnVw?=
 =?utf-8?B?UUN6S2YvSnRsWDBYYVVtZGs3T093TE4yTDlaYXN6K0NTYXdlekFFaTYrOU41?=
 =?utf-8?B?NHpFL1hVRjc1MEZHV1U4L25tallKbE9wSlpCU3k3ZTVzeW9MSzRLSTVWQ2FR?=
 =?utf-8?B?MkZpMmhRQ1B3d2VQWjdJSS9oSmRoNlVoU0UzMHV5Y1ZHSk1xVjNsK0p0a1JW?=
 =?utf-8?B?UTUwMHNwc2dJS1VrcVlteVRqSWZzMm05Uk00aEFHWk9vc1ByajNpdkFCMkE1?=
 =?utf-8?B?cW1VSGZEc1F2Z1VaZ2gwdkNZTXFjMFBZWk41TWt3K2tlVVZLdnJJN2Z2bURK?=
 =?utf-8?Q?0GjpmOubQk+9alJZdOq5f9M0D?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ffed47-09c4-4879-83ef-08dd72f256f7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 20:58:52.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZI1ZU+DyxHpsHfAHwjWRDyOE0mE9CuuqOIkcKG4tnnU3+usuEsl+ZXvdKhdGDMm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9163

Hi!

This one failed to reach my inbox for some reason? I only saw it by
"accident".

2025-03-26 at 16:46, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Mux control core by design supports mux controls that are shared with
> multiple consumers. However in some usecases where the mux is exclusively

use cases

> owned by one consumer do not need some of the locking and deselect apis.
> 
> exclusive apis makes the consumer side of code much simipler.

These exclusive APIs make the consumer side of the code much simpler.

> 
> ex:
> From
> 	if (is_mux_selected)
> 		mux_control_deselect()
> 
> 	if (mux_control_select())
> 		is_mux_selected = false;
> 	else
> 		is_mux_selected = true;
> 
> to
> 	if (mux_control_select())
> 		dev_err("mux select failed..");
> 
> This patch adds a new *_get_exclusive() api to request an exclusive mux
> control and rest of the apis usage remains same, except that exclusive
> mux do not need deselect api calling, drivers can simply select the
> desired state and its consumers responsiblity to make sure that correct
> state is selected.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/mux/core.c           | 123 ++++++++++++++++++++++++++++-------
>  include/linux/mux/consumer.h |   3 +
>  include/linux/mux/driver.h   |   9 +++
>  3 files changed, 113 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index 02be4ba37257..e0b8a723948b 100644
> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -356,6 +356,10 @@ static void mux_control_delay(struct mux_control *mux, unsigned int delay_us)
>   * until mux_control_deselect() or mux_state_deselect() is called (by someone
>   * else).
>   *
> + * Exception to this is for exclusive mux control, which do not need
> + * mux_state_deselect() as the owner of mux has exclusive access to this mux
> + * and is responsible to set the correct state.
> + *
>   * Therefore, make sure to call mux_control_deselect() when the operation is
>   * complete and the mux-control is free for others to use, but do not call
>   * mux_control_deselect() if mux_control_select() fails.
> @@ -368,15 +372,17 @@ int mux_control_select_delay(struct mux_control *mux, unsigned int state,
>  {
>  	int ret;
>  
> -	ret = down_killable(&mux->lock);
> -	if (ret < 0)
> -		return ret;
> +	if (!mux->exclusive) {
> +		ret = down_killable(&mux->lock);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	ret = __mux_control_select(mux, state);
>  	if (ret >= 0)
>  		mux_control_delay(mux, delay_us);
>  
> -	if (ret < 0)
> +	if (!mux->exclusive && ret < 0)
>  		up(&mux->lock);
>  
>  	return ret;
> @@ -428,14 +434,16 @@ int mux_control_try_select_delay(struct mux_control *mux, unsigned int state,
>  {
>  	int ret;
>  
> -	if (down_trylock(&mux->lock))
> -		return -EBUSY;
> +	if (!mux->exclusive) {
> +		if (down_trylock(&mux->lock))
> +			return -EBUSY;
> +	}
>  
>  	ret = __mux_control_select(mux, state);
>  	if (ret >= 0)
>  		mux_control_delay(mux, delay_us);
>  
> -	if (ret < 0)
> +	if (!mux->exclusive && ret < 0)
>  		up(&mux->lock);
>  
>  	return ret;
> @@ -479,6 +487,10 @@ int mux_control_deselect(struct mux_control *mux)
>  {
>  	int ret = 0;
>  
> +	/* exclusive mux control do not deselection */
> +	if (mux->exclusive)
> +		return -EINVAL;

This is unfortunate. I think there is value in being able to deselect
muxes in exclusive mode. Otherwise you might need to keep track of
some idle-state in the code, when it would be more flexible to have
it specified in e.g. the DT node. The best idle-state may very well
be hardware dependent, and is often not some central thing for the
consumer driver.

> +
>  	if (mux->idle_state != MUX_IDLE_AS_IS &&
>  	    mux->idle_state != mux->cached_state)
>  		ret = mux_control_set(mux, mux->idle_state);
> @@ -523,13 +535,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>   * @mux_name: The name identifying the mux-control.
>   * @state: Pointer to where the requested state is returned, or NULL when
>   *         the required multiplexer states are handled by other means.
> + * @get_type: Type of mux get, shared or exclusive
>   *
>   * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
>   */
>  static struct mux_control *mux_get(struct device *dev, const char *mux_name,
> -				   unsigned int *state)
> +				   unsigned int *state, enum mux_control_get_type get_type)
>  {
>  	struct device_node *np = dev->of_node;
> +	struct mux_control *mux_ctrl;
>  	struct of_phandle_args args;
>  	struct mux_chip *mux_chip;
>  	unsigned int controller;
> @@ -606,7 +620,25 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	return &mux_chip->mux[controller];
> +	mux_ctrl = &mux_chip->mux[controller];
> +
> +	if (mux_ctrl->exclusive) {
> +		mux_ctrl = ERR_PTR(-EPERM);
> +		put_device(&mux_chip->dev);
> +		return mux_ctrl;
> +	}
> +
> +	if (get_type == EXCLUSIVE_GET && mux_ctrl->open_count) {
> +		mux_ctrl = ERR_PTR(-EBUSY);
> +		put_device(&mux_chip->dev);
> +		return mux_ctrl;
> +	}
> +
> +	mux_ctrl->open_count++;
> +	if (get_type == EXCLUSIVE_GET)
> +		mux_ctrl->exclusive = true;
> +
> +	return mux_ctrl;

This is racy with no guarantee that you are the only consumer after you
have gotten an exclusive mux. My sketchy vision was to have an API
function that requests an ordinary shared mux to be exclusive, and then
another to make the mux shared again. Those would take/release the same
lock as when selecting/deselecting, but also mark the mux as exclusive
and trigger _not_ taking/releasing the lock in select/deselect.

But then we have the little thing that conditional locking is not
exactly ideal. Which is why I haven't done this before. I simply never
got it to a point where I felt it was good enough...

Another reason for me not having done it is that I also feel that it
might not be ideal to reuse mux_control_select and mux_control_deselect
at all since the rules for using those when the mux is shared are ...
a bit difficult, and will remain that way. Thus, having those functions
*sometimes* behave like they are easy and sometimes requiring great
detail will make the already bad shared case even more error prone.

I wish I could see how to do this sanely.

Cheers,
Peter

>  }
>  
>  /**
> @@ -618,10 +650,33 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>   */
>  struct mux_control *mux_control_get(struct device *dev, const char *mux_name)
>  {
> -	return mux_get(dev, mux_name, NULL);
> +	return mux_get(dev, mux_name, NULL, NORMAL_GET);
>  }
>  EXPORT_SYMBOL_GPL(mux_control_get);
>  
> +/**
> + * mux_control_get_exclusive() - Get the mux-control exclusive access for a device.
> + * @dev: The device that needs a exclusive mux-control.
> + * @mux_name: The name identifying the mux-control.
> + *
> + * Other consumers will be unable to obtain this mux-control while this
> + * reference is held and the use count for the mux-control will be
> + * initialised to reflect the current state of the mux-control.
> + *
> + * This is intended for use by consumers which do not need mux shared
> + * mux-control, and need exclusive control of mux.
> + * exclusive mux controls do not need mux_control_deselect() before
> + * selecting a mux state. Any mux state can be selected directly
> + * by calling mux_control_select() as long as state is supported.
> + *
> + * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
> + */
> +struct mux_control *mux_control_get_exclusive(struct device *dev, const char *mux_name)
> +{
> +	return mux_get(dev, mux_name, NULL, EXCLUSIVE_GET);
> +}
> +EXPORT_SYMBOL_GPL(mux_control_get_exclusive);
> +
>  /**
>   * mux_control_put() - Put away the mux-control for good.
>   * @mux: The mux-control to put away.
> @@ -630,6 +685,8 @@ EXPORT_SYMBOL_GPL(mux_control_get);
>   */
>  void mux_control_put(struct mux_control *mux)
>  {
> +	mux->open_count--;
> +	mux->exclusive = false;
>  	put_device(&mux->chip->dev);
>  }
>  EXPORT_SYMBOL_GPL(mux_control_put);
> @@ -641,16 +698,8 @@ static void devm_mux_control_release(struct device *dev, void *res)
>  	mux_control_put(mux);
>  }
>  
> -/**
> - * devm_mux_control_get() - Get the mux-control for a device, with resource
> - *			    management.
> - * @dev: The device that needs a mux-control.
> - * @mux_name: The name identifying the mux-control.
> - *
> - * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
> - */
> -struct mux_control *devm_mux_control_get(struct device *dev,
> -					 const char *mux_name)
> +static struct mux_control *__devm_mux_control_get(struct device *dev, const char *mux_name,
> +						  enum mux_control_get_type type)
>  {
>  	struct mux_control **ptr, *mux;
>  
> @@ -658,7 +707,10 @@ struct mux_control *devm_mux_control_get(struct device *dev,
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	mux = mux_control_get(dev, mux_name);
> +	if (type == EXCLUSIVE_GET)
> +		mux = mux_control_get_exclusive(dev, mux_name);
> +	else
> +		mux = mux_control_get(dev, mux_name);
>  	if (IS_ERR(mux)) {
>  		devres_free(ptr);
>  		return mux;
> @@ -669,8 +721,35 @@ struct mux_control *devm_mux_control_get(struct device *dev,
>  
>  	return mux;
>  }
> +
> +/**
> + * devm_mux_control_get() - Get the mux-control for a device, with resource
> + *			    management.
> + * @dev: The device that needs a mux-control.
> + * @mux_name: The name identifying the mux-control.
> + *
> + * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
> + */
> +struct mux_control *devm_mux_control_get(struct device *dev, const char *mux_name)
> +{
> +	return __devm_mux_control_get(dev, mux_name, NORMAL_GET);
> +}
>  EXPORT_SYMBOL_GPL(devm_mux_control_get);
>  
> +/**
> + * devm_mux_control_get_exclusive() - Get the mux-control exclusive for a device,
> + * 				 with resource management.
> + * @dev: The device that needs a mux-control.
> + * @mux_name: The name identifying the mux-control.
> + *
> + * Return: Pointer to the mux-control, or an ERR_PTR with a negative errno.
> + */
> +struct mux_control *devm_mux_control_get_exclusive(struct device *dev, const char *mux_name)
> +{
> +	return __devm_mux_control_get(dev, mux_name, EXCLUSIVE_GET);
> +}
> +EXPORT_SYMBOL_GPL(devm_mux_control_get_exclusive);
> +
>  /*
>   * mux_state_get() - Get the mux-state for a device.
>   * @dev: The device that needs a mux-state.
> @@ -686,7 +765,7 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
>  	if (!mstate)
>  		return ERR_PTR(-ENOMEM);
>  
> -	mstate->mux = mux_get(dev, mux_name, &mstate->state);
> +	mstate->mux = mux_get(dev, mux_name, &mstate->state, NORMAL_GET);
>  	if (IS_ERR(mstate->mux)) {
>  		int err = PTR_ERR(mstate->mux);
>  
> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> index 2e25c838f831..649b86c74bf3 100644
> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h
> @@ -54,8 +54,11 @@ int mux_control_deselect(struct mux_control *mux);
>  int mux_state_deselect(struct mux_state *mstate);
>  
>  struct mux_control *mux_control_get(struct device *dev, const char *mux_name);
> +struct mux_control *mux_control_get_exclusive(struct device *dev, const char *mux_name);
>  void mux_control_put(struct mux_control *mux);
>  
> +struct mux_control *devm_mux_control_get_exclusive(struct device *dev,
> +					 const char *mux_name);
>  struct mux_control *devm_mux_control_get(struct device *dev,
>  					 const char *mux_name);
>  struct mux_state *devm_mux_state_get(struct device *dev,
> diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
> index 18824064f8c0..cda75b9b4775 100644
> --- a/include/linux/mux/driver.h
> +++ b/include/linux/mux/driver.h
> @@ -26,6 +26,12 @@ struct mux_control_ops {
>  	int (*set)(struct mux_control *mux, int state);
>  };
>  
> +enum mux_control_get_type {
> +	NORMAL_GET, /*  Shared */
> +	EXCLUSIVE_GET,
> +	MAX_GET_TYPE
> +};
> +
>  /**
>   * struct mux_control -	Represents a mux controller.
>   * @lock:		Protects the mux controller state.
> @@ -34,6 +40,7 @@ struct mux_control_ops {
>   * @states:		The number of mux controller states.
>   * @idle_state:		The mux controller state to use when inactive, or one
>   *			of MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT.
> + * @type:		Indicate type of mux control, Shared or Exclusive
>   * @last_change:	Timestamp of last change
>   *
>   * Mux drivers may only change @states and @idle_state, and may only do so
> @@ -50,6 +57,8 @@ struct mux_control {
>  	unsigned int states;
>  	int idle_state;
>  
> +	int open_count;
> +	bool exclusive;
>  	ktime_t last_change;
>  };
>  
