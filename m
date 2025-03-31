Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CB586347;
	Mon, 31 Mar 2025 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448168; cv=fail; b=EX+7OeK0ABklnTng8/WfRnRYhwkdY+ta4wk6k/VjrP8D0al8EHVLvGNR7vlwo4dLWEAh/bR+xXr4LQR7aDgRBUpBO0dV08OfWWfMGPXPpTXFEtJJnQTCLsCuQzJgz8dupgAu3Op3HNdwLM+XE/DRvqyZU4O+UCVBqU9KlFxK/8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448168; c=relaxed/simple;
	bh=AEjv1g/ou4q3LgyDDkvFOANKKPflwLvl5tAgspcMNKM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O2yuIDVPLB/q+C+kqFTtTdNnOLqAX38gb9TiASOKqZklyhYdDOrbjmidjuzc2grFsZRwH2vcnpwjgBkY2OWyv3M82BZBWkY0lrzufOvBCyRNLv9/zF41Ifbr8We6Un2AIc7BB/h5vLTa1MfPhMOQh20bJoOk/JeqNUxmNvkRAGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eJAjFtlK; arc=fail smtp.client-ip=40.107.94.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eJAjFtlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkkHq6KeovRAKFALTBfcW65AUZqLK75h+LlnAJjPk2V9Z/Q7ogxnjAgm5KJfxEiK38B2Jg/PB4SymuIhNmWUMtrmmY8FYQQZpIZIofISb8pQkH1e21Pp1o5rcsPUas93rzZKwG2BTJAsJH7G5BlutMrR7nidDa+K0B30uRHllwq2zsV86FLWROdybdCHi+gAxVbsqq7Vw9JVjZBs5vX6f1W75jiha70nHD2p/jHUPKMYoxLWUlXCvMNO1nABDp3K05pr1XpBqPjcs/ZHwrKdOdyUt1FUeDRD0DyISYW42XGO4ipvwJksVyAGQblEGdHX7FBK5bZNxiio9682PoJQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onFmMs4AQvRAx++Dfzvm6BXksbA0wX/6aooAs/017JQ=;
 b=ojCgxyM09k0PfGxGdMCXKK47TL1IVufJ9DjvweNwRB6xikVOu9LiQanSuomgj6DlOczRMkdNK6QOW2g1Jbknp5K3H9IZlAFbqF7BE8HZsvSfQnNXQdiilyE1V8r1Svcrcz45sBbmw1J4I9Ld0DR0/SmOBijqxTXbaypizBzElmUQnHj3fcyPglou8I1Xip7wrDRD82+2aj7Bl6psXx1DIc3BPzcbpBqrrtYYcVrYnPB9uAuzZVyyS0xYHbUshQWK5+QWhTh54gXCvAYwW9xRFhgAWn9bnq3TNn0J7c0qGIGrA0eL80A2RPH3ZbSuhQY3W2gDrYeBQ8SHwsWxZ+pK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onFmMs4AQvRAx++Dfzvm6BXksbA0wX/6aooAs/017JQ=;
 b=eJAjFtlKBJBKGhvF6CZJ5Fi9wU0EWPkYN4VhbhlSD2jVhyMYcimXPFSaaRqHFE+rZuL+f32BvRo66/uLDgCk7oYeq7oxzkhmVfjf92wxhowO0fty6BCWF7NRCgZkjFffTiB6WvAaU4XVEw7MU99hBVAEj0DOMBTsEsrwiodlDAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH7PR12MB6833.namprd12.prod.outlook.com (2603:10b6:510:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 19:09:24 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:09:23 +0000
Message-ID: <1e0f68b4-4558-409e-92dd-d46d85ca0139@amd.com>
Date: Mon, 31 Mar 2025 15:09:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Mario Limonciello <mario.limonciello@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com
References: <20250327221423.1248521-1-pratap.nirujogi@amd.com>
 <c9f4996a-0091-4649-a7d4-563685a6427c@amd.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <c9f4996a-0091-4649-a7d4-563685a6427c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0185.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::15) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH7PR12MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: ef93f180-b6f5-4a73-af45-08dd70878c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDZzQ3N0VFBrZDBZalZqL3R1ckRUaGRuMWNmeU03MTA2OTdKTTlHUVZoMWdu?=
 =?utf-8?B?NUtXcW9JTUFuMkJWaHJxeExLSUlTUTNTWXVPS3U5WlU1T2ZWTnUvTDcvZ3dC?=
 =?utf-8?B?WDVHcjQ5TVJwdnZkVlBVb05LQ0hRSlBwQUFWRDRMbEpwMDlFc0xCUktienRz?=
 =?utf-8?B?MWFSNTBxTGZYNFJwY1RRckJ3cFB0QXJvdE1LVDFlRlZrZlNWckUrUHBxdG56?=
 =?utf-8?B?Q2wrVWYyY3hER3ZSd2FIUVJjK1BDbjVEa2M2RkllQllqcHdjdWNjYWFNb3V5?=
 =?utf-8?B?cVJrd1lmejE2OHFZcDJqQnBSS0dmQkowbU5RRThwazdra0paSG5yWXZ1ZWx2?=
 =?utf-8?B?dDV5bk5PUDcwaE5LcXdvbWUwTWxOR053ZEJ1emZxVzNSWWkxNnVCcEhwQnh1?=
 =?utf-8?B?T0w4VkRXVzVJOWlGMHNsalpMMEFNSSs0U2Jxbm9GSlBsZFhLTE9lS2tHSlVh?=
 =?utf-8?B?L1gzZVRMaUxldjZpY0pabUpyUmw5RzVyaTE5NEdyS3NST0tJcUt3SVVPM2RO?=
 =?utf-8?B?djhZSFNlUkhZR0g2ekhZSCtIOUU4WkNNREZIVjhJaGZha2dkWG1rT1YvN0h3?=
 =?utf-8?B?Z0lJVlVvdkdCanU1Z3pEdkI2QUxia2hwWnQyRVdtQjBwTDRzc2FIWUtvRlkx?=
 =?utf-8?B?SDlUZmZRL1VoblVBUVhxQ0RJVWpVdXJpcG9RWERodDhpYzZaY2drMlNrdFlu?=
 =?utf-8?B?VXhsNFhUbjVSeklBb2lvOWlOY1F3OCt0WEJxUDNrbGZXREdhcVA2aHhkNjJa?=
 =?utf-8?B?ZjVJWjZQWUl4bnpZUXJDTUplL3gyNnNYbEVtckJtUTZjYXBVZEdpWUlENmI2?=
 =?utf-8?B?cGdCc1pQb0pEMWVkcjFVSENaamdYMXQrV3FwMmdQaUVya2xpNUV3NnFrbnox?=
 =?utf-8?B?VlAveWFKYThJMTVmanhCT25WZC9JSHdmazNxK05iL05uSHpVdlphcS9DVDIr?=
 =?utf-8?B?RkZ0T3lPcUh6MFdlTG9VekU5TTVyb0xWa3h5dHBSZS93N0psM1FHaE5NYWxB?=
 =?utf-8?B?anJ4UTVWS1RYYjlqZVg2VWVPQTBQaE5neFpYLzJOL0EwOUZZVHVjM0NOQkE4?=
 =?utf-8?B?TmJ5cGtKSTRBa0ZDRmdleDY2SHZIc3RjcTBQcVdGbXRYQVNWL2VpVENKOVlU?=
 =?utf-8?B?ckdkTzdIS0YyU3laSzNGTmRWSHRZWXVaQkY0cmt5dmc5eVhpWEQwejR0U29D?=
 =?utf-8?B?d01DTlZleHg4UFRSckI1YXorT21UblB5NnhGZW8wdnpzQjkxdktsSEVFeTVy?=
 =?utf-8?B?b29HKzlLbXNvNGlwL1JqL3pDNUdPZmlIeW1PSFZQUVZqRW9xR2ZIOURYcGIr?=
 =?utf-8?B?UC9QN1JZdUFFeVFTSUxVcG5BUlVFZDc3ZnRIOWJkV24yMHBRUjY4RndmaVdN?=
 =?utf-8?B?WmlvVHdIZ0w4bU9rdlY3WnVlRFZlR255UjlsZ1g5TWV4K1IzNUs0QjBTTTY1?=
 =?utf-8?B?U3RvZXN0Z2ZrbDdCK0Z2dGdBdGpvVU53MkhMMFo4UmtPc2wycWt6U1lnV1hp?=
 =?utf-8?B?L1dXK0oyRWdsNmgzUVpNRWhidnViNzBya0ZPeXhPMG5sQmJ4WkRmY3NERmcx?=
 =?utf-8?B?SkZEdXJHek5LL0hkYnZvMjZSci92R1hsTDJYZVprcm9pemRaMGFkWjZOY29p?=
 =?utf-8?B?Y1R2ZmZ0QVI2S0xKVURLeGhoSzVlNUN0THRqb013c3Jxb3VqMXJ3ZjFBMk5N?=
 =?utf-8?B?TVpTSnBiY1p3SEZlS2lvUlZmeEVPTDlTWTIyTUZ4UEE0bm9mZnEwTm4xOXU1?=
 =?utf-8?B?VGVQbVpVOWZtbUxMbWpZUVFoWFZ3NkJrbmZBK1VYUkxhM0d0ZGN5MnRPaXEw?=
 =?utf-8?B?dnU1MUJXeXd5YWxBVGZyNmd6WUYwckRCYnB6b0Y4SEtsUlprR3g0QkhEUUVX?=
 =?utf-8?Q?+Cq3mlQRIEX6y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2d6eXprZkllRzBVZjlleGVHd2ZDRks0Mk00MzQ0YnU4T2VPRGJTdld3eGhU?=
 =?utf-8?B?UGpjZnEvVUZ2czB3QnF5d3BCNVlWT2hTSXFoMVRIR3Z6K0l2eEhxQ3hYNGpv?=
 =?utf-8?B?Z3A2eTF3LzdzOHc4NkkzRXg4ZnFlQUtncW1mb293N3ZJNlAySHE2d2EyVW14?=
 =?utf-8?B?UnhtdEUwQlZTL2ExM2MrMEhlU1BxSHVRakh1WklZODZMaHlVY3JzcXFaczJ2?=
 =?utf-8?B?ZFhhQ2p4Umlqdi8ydUJDV0hHYXg3Sjg5Z0s5YWcxMGwwM3NBcklWN0tTcVJV?=
 =?utf-8?B?NkpnZXVzMGVNNUR3TUEyTlk1djN1a0hub29weFFnL21acTVPRHVVR2l3Yi90?=
 =?utf-8?B?SXRFU0FTNytweVM3aHcvSWxJM1k0WlJlRWZ0cnpwTG9kdk5oOWxSMU94Tk14?=
 =?utf-8?B?NXdRdG9DNVc2R1lXSXBSZXAwT2FmRVFtVDJUcTVhb2J5M200ci8rMjZVVnhK?=
 =?utf-8?B?bmhLdHhlMVlTNlg0U1lUTlNkVDcvUVFXREFxWnlydFNxMENHUXYyUjMyN3ox?=
 =?utf-8?B?bXNLOGIxZTFPc3NMNFNndEVEY3A2RitxaEhRaUVrVlBMQkM4MkJiUHMvQ2RV?=
 =?utf-8?B?bHBoVnE3WVJtenZQcmQ5ZVNINWZiY0pCVG9adFMyMkhyVXhrUnkyU2hhSlBI?=
 =?utf-8?B?c1NmdW9uanRxVnFDelgxVmZnVnpaYlIrM21iYnVuR0hyT0dHbVJTaGlRUEZ0?=
 =?utf-8?B?U1dyZHorb2YzYURlTnFoQ0wwWkRBNjBBejZLYkJKVnZRZHJ1TGJHOWhoc21G?=
 =?utf-8?B?N3RGR2JOYWljREFlSnNjL0ZpRGFUQ3Rua3pxQ2FYa1BCQmxLNXpVSmlQY0NY?=
 =?utf-8?B?SW9XN3hCb0p0N21WOFo2Vk1VSjQrcFh6MU9xc1Jsa1E1Y0UvTURmUlgzK3Ba?=
 =?utf-8?B?Q3dxR0huVXVSL3lySGFTZXo0N0k4WnBMa3pJNDVLRk1wVVFvcmJVZzdpRy9N?=
 =?utf-8?B?WUFnR29vcTVQTjZDdnQ1WERjRkRhVTJKQzZpdGVYUUJNM3VZUFV5N1ZwYzV3?=
 =?utf-8?B?a05WR05Yd1U4Sk45SCt4eFhuWW4wNThBLzN1cXRGUCtlQzhURW9vbUdPMGha?=
 =?utf-8?B?Znpmak1NcjJLaFdvWnhpRjM2MHZZSnpoSmR6QTBscytwVHVYbmlHU0VZdEFl?=
 =?utf-8?B?QUFFeHZBaVcxZkg4dUhjUUJnRjBUa2JSMnZWbjZpRVo0K1BSMzdVWWFUQWx6?=
 =?utf-8?B?cGQyK1gvV0lDVjNMbXpPbVNuQmdRYnpNc2h1SHBvbEJnRmxZaHhXdWZTeDJY?=
 =?utf-8?B?ZFRzd2FBMkpvaU5lZlpyUUxITEkzQWpXU1dVL3FpUWtGeVU1bmdQT0VvNGE5?=
 =?utf-8?B?aDBpakpnNWJiUjJwQndSSm4zYWZCMG9iL0dyNWlxbzNWcU45bi80UWUxSytT?=
 =?utf-8?B?RUdMdWpIdjUzTGhyWFFyZHVJZDZpSFdYMUsvdG0xVzN4Q3pURGZmMGVlUER1?=
 =?utf-8?B?bjhwRzR5NTNWbHdXWkdwQ1MvY09PSWNXMlZRWnFsRGtjbTZFT3Z1RXBzTnZq?=
 =?utf-8?B?aCt3V05VT0lXTGxJd0FJRnkzQndYTk13aU93R09BbjdnVHU5YnA2Ui9pdDJn?=
 =?utf-8?B?UHNIaHF5UzBnRlNVNjA0K0hiWGpmVEdRRmxhc0p2cENDRnI4QklGVGtObk9y?=
 =?utf-8?B?Y0s0TTFxYjUzTEFad3JRaW8yeU5mTi9hYVhxeHg4T2NVRjhxMkpKeHMydzk1?=
 =?utf-8?B?SXJFa1drdkw1QWlIMmcvT2hsdkluRzdHTEJpSnFDY1FvYUVlT2NkV3RnM0VF?=
 =?utf-8?B?T0ZocDBYS0tKeE5tTmtTMy9LQ28vamlJdDZKV1FMODlYL3VZQTAzQ1BGTFhD?=
 =?utf-8?B?cTJHWWxQY29TYmxqZzQ5YTJBKzVhZ1ROMTdHVUptcC92cjBWM2VVUEdmajIz?=
 =?utf-8?B?TFhNNXpPL1FhY2Vhd3dFdVpVczJIVDJtWmpqRWdHMmhvQU1GYUlsaTIwNElO?=
 =?utf-8?B?TS9VMnJ2ZmV6UFBIUjE1RG5wZmJ3Z0tSeldZaGl5YTFBeHVIQld4RXhxVDl4?=
 =?utf-8?B?S3AzbXl6Qk43eVRaOG5xVmRwVGdNcUtuQnJ0S3pjaHg2cGVqZ0pSUUNNeGJx?=
 =?utf-8?B?SkJielVZSGU1SXJGQ3p6YURJaElOMnpjekdnWjhmR05lSmsxYVpnMUd1ZHE2?=
 =?utf-8?Q?ilwSikJnomKHWmlsHqYnx+oSn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef93f180-b6f5-4a73-af45-08dd70878c61
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:09:23.7490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF5Lm7npQ3TMvGl9LHop9RVUZB2jb0TIoriTL2JNiCUSxEFcIgAGfAw5rM1VykCF/E1NdB2gSPED61LvyctjFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6833

Hi Mario,

Thanks for the review.

Thanks,
Pratap

On 3/27/2025 8:43 PM, Mario Limonciello wrote:
> On 3/27/2025 17:11, Pratap Nirujogi wrote:
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> ---
>> v2 -> v3:
>>
>> - Remodelled as ACPI driver to bind the device when matching
>> acpi sensor device is detected. This eliminated the need for
>> dmi checks for platform validation.
>>
>> - Added software nodes to align with camera device-tree format
>> to capture the camera device properties missing in the ACPI.
>>
>> - Constructed swnode graph in the below format to successfully
>> parse the endpoint node using v4l2_fwnode_endpoint_alloc_parse().
>>
>> OMNI5C10 {
>>     refclk = 24MHz;
>>     ports {
>>         port@ {
>>             endpoint {
>>                 bus-type = 4;
>>                 data-lanes = <1 2>;
>>                 link-frequencies = 925MHz;
>>                 remote-endpoint = &ov05c10_refs;
>>             };
>>         };
>>     };
>> };
>>
>> - GPIO sensor lookup is moved out of this driver scope, it is taken care
>> in isp driver module init.
>>
>> - This platform driver is specific to AMD ISP4, hence renamed driver
>> name as "amd-isp4".
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 +
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 354 ++++++++++++++++++++++++++++
>>   3 files changed, 366 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
> 
> Pratap,
> 
> Overall I like the direction of this improvement.  A few small comments 
> I notice below.
> 
Thanks Mario. Sure, will address them in V4.

>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/ 
>> amd/Kconfig
>> index c3e086ea64fc..4b373edd750d 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>         This mechanism will only be activated on platforms that 
>> advertise a
>>         need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +    bool "AMD platform with ISP4 that supports Camera sensor device"
> 
> Now that this is an ACPI driver this should be tristate because it can 
> now be a module.
> 
Thanks. Will fix this in V4.

>> +    depends on I2C && X86_64 && AMD_ISP4
> 
> Now that this is an ACPI driver there should be a:
> 
> depends on ACPI
> 
>> +    help
>> +      For AMD platform that support Image signal processor generation 
>> 4, it
>> +      is necessary to add platform specific camera sensor module 
>> board info
>> +      which includes the sensor driver device id and the i2c address.
>> +
>> +      If you have a AMD platform that support ISP4 and with a sensor
>> +      connected to it, say Y here
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/ 
>> amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)        += pmc/
>>   obj-$(CONFIG_AMD_HSMP)        += hsmp/
>>   obj-$(CONFIG_AMD_PMF)        += pmf/
>>   obj-$(CONFIG_AMD_WBRF)        += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)    += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>> x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..c4dce3779543
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,354 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device/bus.h>
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/init.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR        0x10
>> +#define AMDISP_OV05C10_PLAT_NAME    "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID        "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME    "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME        "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properites
> 
> properties
> 
sure, will correct the typo error in V4.

>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +    const char *name;
>> +    struct i2c_board_info board_info;
>> +    u8 i2c_addr;
>> +    struct i2c_client *i2c_dev;
>> +    u8 max_num_swnodes;
>> +    struct software_node **swnodes;
>> +};
>> +
>> +static struct amdisp_platform *ov05c10_amdisp;
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] __initconst 
>> = {
>> +    PROPERTY_ENTRY_U32("refclk", 24 * HZ_PER_MHZ),
>> +    { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +    .name = AMDISP_OV05C10_HID,
>> +    .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +    .name = "ports",
>> +    .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +    .name = "port@",
>> +    .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +    .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] __initconst 
>> = {
>> +    SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] __initconst = {
>> +    925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] __initconst = {
>> +    1,
>> +    2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] 
>> __initconst = {
>> +    PROPERTY_ENTRY_U32("bus-type", 4),
>> +    PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                     ARRAY_SIZE(ov05c10_data_lanes)),
>> +    PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                     ARRAY_SIZE(ov05c10_link_freqs)),
>> +    PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +    { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +    .name = "endpoint",
>> +    .parent = &port_node,
>> +    .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +    &camera_node,
>> +    &ports,
>> +    &port_node,
>> +    &endpoint_node,
>> +    &remote_ep_isp_node,
>> +    NULL
>> +};
>> +
>> +/* OV05C10 specific AMD ISP platform configuration */
>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>> +    .name = AMDISP_OV05C10_PLAT_NAME,
>> +    .board_info = {
>> +        .dev_name = "ov05c10",
>> +        I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +    },
>> +    .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>> +    .max_num_swnodes = NUM_SW_NODES,
>> +    .swnodes = (struct software_node **)ov05c10_nodes,
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +    { AMDISP_OV05C10_HID },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +    return !strncmp(adap->owner->name, "i2c_designware_amdisp", 48);
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct i2c_adapter *adap)
>> +{
>> +    struct i2c_board_info *info = &ov05c10_amdisp->board_info;
>> +    struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
>> +
>> +    if (i2c_dev)
>> +        return;
>> +
>> +    if (!info->addr) {
>> +        dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
>> +            ov05c10_amdisp->i2c_addr);
>> +        return;
>> +    }
>> +
>> +    i2c_dev = i2c_new_client_device(adap, info);
>> +    if (IS_ERR(i2c_dev)) {
>> +        dev_err(&adap->dev, "error %ld registering isp i2c_client\n",
>> +            PTR_ERR(i2c_dev));
>> +        i2c_dev = NULL;
>> +    } else {
>> +        dev_dbg(&adap->dev, "registered amdisp i2c_client on address 
>> 0x%02x\n",
>> +            info->addr);
>> +    }
>> +    i2c_put_adapter(adap);
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                  unsigned long action, void *data)
>> +{
>> +    struct device *dev = data;
>> +    struct i2c_client *client;
>> +    struct i2c_adapter *adap;
>> +    struct i2c_client *i2c_dev = ov05c10_amdisp->i2c_dev;
>> +
>> +    switch (action) {
>> +    case BUS_NOTIFY_ADD_DEVICE:
>> +        adap = i2c_verify_adapter(dev);
>> +        if (!adap)
>> +            break;
>> +        if (is_isp_i2c_adapter(adap))
>> +            instantiate_isp_i2c_client(adap);
>> +        break;
>> +    case BUS_NOTIFY_REMOVED_DEVICE:
>> +        client = i2c_verify_client(dev);
>> +        if (!client)
>> +            break;
>> +        if (i2c_dev == client) {
>> +            dev_dbg(&client->adapter->dev, "amdisp i2c_client 
>> removed\n");
>> +            i2c_dev = NULL;
>> +        }
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block isp_i2c_nb = { .notifier_call = 
>> isp_i2c_bus_notify };
>> +
>> +static int release_amdisp_swnode_props(struct software_node **swnodes,
>> +                       u8 num_swnodes)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < num_swnodes; i++) {
>> +        if (swnodes[i] &&
>> +            !IS_ERR_OR_NULL(swnodes[i]->properties)) {
>> +            property_entries_free(swnodes[i]->properties);
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int initialize_ov05c10_swnode_props(struct amdisp_platform *p)
>> +{
>> +    struct software_node *sw_node;
>> +    int ret;
>> +    int i;
>> +
>> +    if (strncmp(p->name, AMDISP_OV05C10_PLAT_NAME,
>> +            strlen(AMDISP_OV05C10_PLAT_NAME)))
>> +        return -EINVAL;
>> +
>> +    /* Initialize platform specific props for each node */
>> +    for (i = 0; i < p->max_num_swnodes; i++) {
>> +        sw_node = p->swnodes[i];
>> +
>> +        if (sw_node->properties) {
>> +            sw_node->properties = property_entries_dup(sw_node- 
>> >properties);
>> +            if (IS_ERR(sw_node->properties)) {
>> +                ret = PTR_ERR(sw_node->properties);
>> +                goto error_release_node_props;
>> +            }
>> +        }
>> +    }
>> +
>> +    return 0;
>> +
>> +error_release_node_props:
>> +    release_amdisp_swnode_props(p->swnodes, p->max_num_swnodes);
>> +    return ret;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(const struct 
>> amdisp_platform *src)
>> +{
>> +    struct amdisp_platform *isp_ov05c10;
>> +    const struct software_node **sw_nodes;
>> +    const struct software_node *sw_node;
>> +    struct i2c_board_info *info;
>> +    int ret;
>> +
>> +    isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +    if (!isp_ov05c10)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    ret = initialize_ov05c10_swnode_props(isp_ov05c10);
>> +    if (ret)
>> +        goto error_free_platform;
>> +
>> +    info = &isp_ov05c10->board_info;
>> +
>> +    sw_nodes = (const struct software_node **)src->swnodes;
>> +    ret = software_node_register_node_group(sw_nodes);
>> +    if (ret)
>> +        goto error_unregister_sw_node;
>> +
>> +    sw_node = (const struct software_node *)src->swnodes[0];
>> +    info->fwnode = software_node_fwnode(sw_node);
>> +    if (IS_ERR(info->fwnode)) {
>> +        ret = PTR_ERR(info->fwnode);
>> +        goto error_unregister_sw_node;
>> +    }
>> +
>> +    return isp_ov05c10;
>> +
>> +error_unregister_sw_node:
>> +    software_node_unregister_node_group(sw_nodes);
>> +
>> +error_free_platform:
>> +    kfree(isp_ov05c10);
>> +    return ERR_PTR(ret);
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +    int ret;
>> +
>> +    ov05c10_amdisp = 
>> prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
>> +    if (IS_ERR(ov05c10_amdisp)) {
>> +        pr_err("failed to prepare amdisp platform fw node");
>> +        return PTR_ERR(ov05c10_amdisp);
>> +    }
>> +
>> +    /*
>> +     * Register notifier to instantiate i2c client when AMD ISP adapter
>> +     * is ready.
>> +     */
>> +    ret = bus_register_notifier(&i2c_bus_type, &isp_i2c_nb);
>> +    if (ret)
>> +        goto error_free_platform;
>> +
>> +    return ret;
>> +
>> +error_free_platform:
>> +    kfree(ov05c10_amdisp);
>> +    return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +    bus_unregister_notifier(&i2c_bus_type, &isp_i2c_nb);
>> +    i2c_unregister_device(ov05c10_amdisp->i2c_dev);
>> +    release_amdisp_swnode_props(ov05c10_amdisp->swnodes,
>> +                    ov05c10_amdisp->max_num_swnodes);
>> +    software_node_unregister_node_group((const struct software_node **)
>> +                        ov05c10_amdisp->swnodes);
>> +    kfree(ov05c10_amdisp);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +    .driver    = {
>> +        .name            = AMD_ISP_PLAT_DRV_NAME,
>> +        .acpi_match_table    = amdisp_sensor_ids,
>> +    },
>> +    .probe    = amd_isp_probe,
>> +    .remove    = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
> 

