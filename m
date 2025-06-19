Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazolkn19012050.outbound.protection.outlook.com [52.103.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE1114F98
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313335; cv=fail; b=qQRh+9dRsEZ4AC7lNOM7gsraQvBRaBpgRARbs5bq8GIUHFqv9DQzoLsj73DV2ebtkb4c+bAa9ONnB3A0B8YKOnnT9pr7MQEgrYLTeQp0LPkMdgqkwkhK2u1E7jPKwGE+ppAvX1QU2xIJna3+Pd0Lt0s2SPd4IwuvbttCPEsFTLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313335; c=relaxed/simple;
	bh=Ow11wtxVzUTbFBfmEpy4u4twhQ/YDmsrx+z+MSlrN1U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VHdfbpxkOWbwblMY8cgvyKThyCIGti3/sjxUqbdZSZpPA7OFS8UqxaEqhbS4+Bltmx/ralDFYwEZ1EY1tCgnr24MFv+Qkfn2uQjcM+V1T5nSYCCJiDkU4Q0NGrouTEQeT9FuOTsdZeFKvvv/q+Es3iROECnJrRi6IhYjBPL/f0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YC6Of6jK; arc=fail smtp.client-ip=52.103.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YC6Of6jK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psFbgJqpnM0mYmL8nXTtbFcPs9yn3MSEMeH1hx9EEhKP9EP8lONEoervz37P62tOEhsv3yasi6RSe4g2iexE9EfxMhS0Jp2u16Ce9hQkC1x/8wHk80CsvJ5kXINP6DwdZR++hM+Ufzwlklbtyncs51eD+OlRTv+mGQKVxjJdL1IVHZLwK4BIGRxbVh/7/aVZD5q7d8DAcqMhNsCMaZ0dKW3kzPCn4wVG0NG7nAa/FZl3Bz6FQz5Ct7o/7t7X/34qudlMOFBIPbCX6ClYMMaNGw6sdEmYd6OZkfgFwpDOtMtskoDvB79J/PSEweF0z0bosu7OiN8D5iRiz1vt4jx3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhLueeSgTCPWgw5/RptwgaFeklZUHeFvAhTUlXHwPoE=;
 b=s8YfqbANGo0uvVDrARfqRwIyj0TS+f5jc/IJ9JFET0iTLJmxXVX9Bjewc+ZPy0BAErmqlMVT4JhlAp1ceUABGeoH3vBtjXuFy+ak/+2UKMXuhE5qyIswZeEUOnf0RDMvU4BnjLhr2s8Cd8BmASfHgybKDl4w4ov/kYq59Ot5frivoVkpKBp9Qj8dXdcSjAWC0GT8NaJYPxAxQz+5ls+WbKWvXzff2yjxBdGPNnhrS8yJl62Sefm34huFrEerO/zsQ1AK7jiC2DouJztJttr252yUPn6/VmwRpGL5Q0vrQuPjWU/i4wJO9TaS/3njwRMleVC41Dcy6llmqIa4z3c5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhLueeSgTCPWgw5/RptwgaFeklZUHeFvAhTUlXHwPoE=;
 b=YC6Of6jKckrRrzYlmUKVNfDPlXFiXOWl9zqsX3UbWZrkFk/do6KrIzNVAapTRBBB25TxeZOO6AqEeF3cZjnr9bMvXbAT00mSE8I0Od6B86AQok7d3eH4f+d23xFma2NpO097gK2QTYbzLVx2pI1HHPtWhMbgiAhKjfVCS0aSArwYlYdCjOr5L/KRgSXOBgtTS161xVi/XugNIXGd3yaiYY8Qs0lps9OnGLTIDfqxwJAahrrfDcj4FAiRtdDFl+8iMgQ5A0vMbObBy03PwU9S2L4jkJVB5LyPBAy9tiKYEnGN5tDXTK76jUvTEBlVJOz7t7GgDxf8oAg8dTLhSMUvoQ==
Received: from PUZPR04MB4922.apcprd04.prod.outlook.com (2603:1096:301:b2::11)
 by TYZPR04MB5736.apcprd04.prod.outlook.com (2603:1096:400:1fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Thu, 19 Jun
 2025 06:08:49 +0000
Received: from PUZPR04MB4922.apcprd04.prod.outlook.com
 ([fe80::9112:18ba:3fe2:5f75]) by PUZPR04MB4922.apcprd04.prod.outlook.com
 ([fe80::9112:18ba:3fe2:5f75%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 06:08:49 +0000
Message-ID:
 <PUZPR04MB492296C8301DDA9654D7970CE37DA@PUZPR04MB4922.apcprd04.prod.outlook.com>
Date: Thu, 19 Jun 2025 14:08:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: K Prateek Nayak <kprateek.nayak@amd.com>,
 Jianyong Wu <wujianyong@hygon.cn>, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
 <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <5216c899-efec-4524-a5a1-1fdcd2834165@amd.com>
Content-Language: en-US
From: Jianyong Wu <jianyong.wu@outlook.com>
In-Reply-To: <5216c899-efec-4524-a5a1-1fdcd2834165@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To PUZPR04MB4922.apcprd04.prod.outlook.com
 (2603:1096:301:b2::11)
X-Microsoft-Original-Message-ID:
 <54c89bdb-0b35-4f91-9ff3-e2361d9bb022@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR04MB4922:EE_|TYZPR04MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c986097-0dd3-4b37-d047-08ddaef7c0b2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799009|19110799006|8060799009|5072599009|6090799003|461199028|440099028|40105399003|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG1nS0YvS3c0VG12NVEzTmxFdGdoaWNCb1ZoOFNmdk9SYktKUmZNU29COUcy?=
 =?utf-8?B?dDEwQk4xUldhUWVTcTFSUlVRL3lsMXp4cUhQZHNyT3BuRHFiTjNOV0ZCVHBS?=
 =?utf-8?B?bFYxVXd2STh2MlFUVmFGc3RnVEpYM0lwc3FQWTZDcGxrQ2hVRUZKeU8wR2xP?=
 =?utf-8?B?dkVYR2FrTnZpVG1zaUtBUUQvK0xkWitPVmRoUTFyRnBwRThsQzNYcjlWZFN4?=
 =?utf-8?B?VXVTNEdpZEY0OEc4SlhTR3krR25LS1dUUkJ2Q1l5NEpSV25KNEpYTXluRXNS?=
 =?utf-8?B?aFRZY3dYSEhUNGtSdktidTNLd3dtbWlIdjA5bVVFdmZhQXl1Yy91enh3NVRG?=
 =?utf-8?B?dzIyMi9JenduRlVJd2hTV0wvMmNFaHJ0TnFwVmRqR2lsUmwraXlrQ3lzd1lr?=
 =?utf-8?B?eEFnZWYxOUlZUkdxc1BOWGpJcC9Za0hQZnB3SVBYVFp5WWdzd3o0Z3lUV3Mx?=
 =?utf-8?B?UncrZkhFUzVQeGh5bm51NFRWdWZIeDRRK2FuT3dYOFMyRmFpcjVIS0MzMVhN?=
 =?utf-8?B?YnBiN3RseDgvMEkxM01QM3EyRGp1UUp6WnVaR0p2VmZ3cWs2T0tEL3AwR0s2?=
 =?utf-8?B?dHBndk45QzdITmw3TTVYK3ZNbk1DR25uQ1RUeUJKQmlhNVdQenlKQnhmbEJa?=
 =?utf-8?B?Wk84Y0haWXlOd05JY1VrUTlpMW1MdkljTGlhaWd3TUY5UFNOUUljcUVwOG5q?=
 =?utf-8?B?MU5EV1VUbkxCL3dLNU56eHVoV1BRcC9CSjFKM2JORmFTdzZ4TVJ4Z09ZK202?=
 =?utf-8?B?Y0RaWFJoeHNTQ1NHQklWNTFyWW5LNUNDcjFZenZ5Z2JiY005eVZlc1JLczFB?=
 =?utf-8?B?Q0tzWkZCdGdkYmxEc2REVGM2SHFVaDZENE1odHdvTGVCZGlSQmJNa005Ukxn?=
 =?utf-8?B?YTdydHZYcUhXbmNEYmhVbi9LZDF2S29YYUszT29rQjlXbG5udm5NZGFTTkxQ?=
 =?utf-8?B?cU9LNTFQTjhTQnNnWUFmMmJ3dVM4Nkp5MERvYVVTZmRzWkszMkhIVkFZYU14?=
 =?utf-8?B?SSt0elFoaENXb3J6MGFHclhDaTB1RkF5T2Z1TWU1cVNhVlVBeFB2SDdqcDZB?=
 =?utf-8?B?OWowM1M4b0RDYjNFUGdQb0JRbm9KQk1RUDFadG9URWxvWDJYYWlzdjdWSU1i?=
 =?utf-8?B?aGlUSGVaNi9LZkNlV01kdURlbG56MytONzR0VmdYTUh2dmsvNlBCbzBzS3Zu?=
 =?utf-8?B?NmdiaEl3cW5NVkVvVGg4eTBCSE5ERUd6T3BSTlF1VkhyZFUrT2t0NTEvRDNB?=
 =?utf-8?B?OHhlbXRSV2FLRFMvb0xnOWpmYmZmWm1HSzBZRDN1V2I2MVVyNmVQWnpjRUwx?=
 =?utf-8?B?Wks5MGU3VDR0dDFFa0xmZEl5SVRyeklNdlhDU21OWlZoMEZ4WC9EVmpWTklp?=
 =?utf-8?B?MkluMXVFUGo2REpvL1FyU2w0RkNGTm9lQ1dVVENHNXRFWkVBS1YvTUJRc0hs?=
 =?utf-8?B?WngyTXlxL1E3NDFaS2ZRbWhvVFI3K1lwc3ovVkZ4K1hlMGZOV3NHU21kVThI?=
 =?utf-8?B?MlBCMnl2bmVwYkFHME5ncWlPLzVSMjNOVmhvSkJQQzJjUU9xQTR1SEpVODZ1?=
 =?utf-8?B?UGo0UT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0Jxb0pBYUVFd2FiMFplOW05NGlTSjVrS1NROEpFY2VCN3c5SmZxeStXbzM2?=
 =?utf-8?B?S2dCRWt6YStCbVZucXAxbHRjL1ZUa0RXdkg1NFBzemlJMCtIWCtMaE44clN4?=
 =?utf-8?B?dk5XcjZVak4vOURZSTFiSWUxbmc5SC91Wm9JYXhLSEVOczFhVzQ5YnRTTnZj?=
 =?utf-8?B?Ym5yaU5BbFF6d0xQU2MvUG9IK2hncTl4M3lBNmIzZEFsMUJZQjhMUzdPMnBj?=
 =?utf-8?B?RUREQnh5Y2d3UnAzdlI2cU5kOGlaaFppYWQwUzhiQkorNkJYbjk3SDNFQUJ3?=
 =?utf-8?B?VDhtUWJ3Y1hvc2NSRk9tbjYrOEJLb2oxQTQyZXE1M2d4R0szK2xIZmtQUW4z?=
 =?utf-8?B?eUhBeVRNTTBVeTQ0eFpDT3hOWUQwNXhIK3V5bHdZVjJadmtQdFBuWFdHWHVD?=
 =?utf-8?B?V1JHZ0dXNmcvWnFJVWRVbVJDdUw1K1JiWjlLL0dqZnlMZWhoSncvSmdTY2E4?=
 =?utf-8?B?SGJja0orb2F0ckVWR0ttaitSdVA1ck1nVTZlLzJYSG1FZkh0dTQ1ZE96Vkc4?=
 =?utf-8?B?cHlhNDQ0NW43SVVqVzVSdjBPY2dqUTRmVVY2TXAvYm9xYjJ3c0JQclc1MlJh?=
 =?utf-8?B?bU1qZ2k4SUdzNi8vazF5TVZRSGJmT005V29CS2RHcE1OK0NCdm5aYWF1Wk9L?=
 =?utf-8?B?QnF5OVppNWlac3ZjS1hFR05GajJ2STlRSW9ScVZzMU00c25qZGtuaFRjSmZa?=
 =?utf-8?B?V1FsdG0rSm41NUtGblp5UTJXWVF6VG90eWR6Q1FRYk1wNHA0U0ZHQ1lPalJv?=
 =?utf-8?B?RXNxOWdRNmI1NmFqQU85M3pPSHdKUzNPU3NxcjV0NmdJYWpaQkp3L2VDRkEr?=
 =?utf-8?B?UFdETE9NYW4zbUlkc29DdjBPQjBjVWRnRHE5dTcrOTE3MDRWeVBXV2FnMERO?=
 =?utf-8?B?Rk1aZG1TdjFxTldyUzU1dmhYQWlxQXk3Rjd1RWhsWmdyWTI3VnluQVUyWU5M?=
 =?utf-8?B?RWFOMGxBSXdEVytJYXdRMjVsRVpLekovSWVLMVdoNTBGb2lvMFpVMWM0Mk9P?=
 =?utf-8?B?b0hQSFJ4RlgycEUzaXUrZ284VUd6eCtXU2dNL0hzZ3h2c1pxeWNhb3haejlV?=
 =?utf-8?B?NFJYczdHSVRlekZpRW9OeTFmdk5oZ2NYaWdZTmFUckF6V1hkeHJUUTZ0S3Bt?=
 =?utf-8?B?WExOYVlrc0pMTlBQZSs4d1NJTzFZYzdrM01HM3ZRTU5VTjdzZFFISzlyUmZO?=
 =?utf-8?B?eXZ5V041WkpOTSs5WTV0UXp5Mkh2TUFZc2FJeEo3WUhET295UGIxU2I5cFk1?=
 =?utf-8?B?U2lWMHNpMzZVNStxaTNqRVFBOG9pdWRUejdEeS95Mndkcjg5ZURHVTBUWGc2?=
 =?utf-8?B?N3Z4dDAvRUlibUVFRVdtT3IwVGRDMld3OUlJU1pvK0padlN5c2VyUGVjZ21R?=
 =?utf-8?B?eFp6bGwzN1ZjR1cveXozb3hNR3JVQTZvenhuNml3YlZjcmFpb1pzRTRKZmlu?=
 =?utf-8?B?T09mZ2JuYlBwTVp0M3pwZ1I5Z3F0Yi9zWGl2TkRHVDNqUThEWkthTEJxOHo5?=
 =?utf-8?B?YllaT2NVSGlIN0VvcUtDZHR0WjJZL0tZTkNUNkswSlY1SmVmTEd6TVhJRXhk?=
 =?utf-8?B?TmM5R2ZETzg1Z2R1Q2cwdEVhZ0w3d2pBYlpLRGhYdFhhdFJMZXdVQVB2T0s1?=
 =?utf-8?B?ckZLQTI1VHNOL2FkVTJMOUtzU1VERDAwYWtnbzdidEVmRWFTUXV3REhkUGdu?=
 =?utf-8?Q?/6faIBNT7s9N4pZnvcIr?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c986097-0dd3-4b37-d047-08ddaef7c0b2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB4922.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:08:49.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5736

Hi Prateek,

Thank you for taking the time to test this patch.

This patch aims to reduce meaningless task migrations, such as those in 
iperf tests, which having not considered performance so much. In my 
iperf tests, there wasn't significant performance improvement observed. 
(Notably, the number of task migrations decreased substantially.) Even 
when I bound iperf tasks to the same LLC, performance metrics didn't 
improve significantly. Therefore, this change is unlikely to enhance 
iperf performance notably, indicating that task migration has minimal 
effect on iperf tests.

IMO, we should allow at least two tasks per LLC to enable inter-task 
communication. Theoretically, this could yield better performance, even 
though I haven't found a valid scenario to support this yet.

If this change has bad effect for performance, is there any suggestion 
to mitigate the iperf migration issue? Or just leave it there?

Any suggestions would be greatly appreciated.

Thanks
Jianyong

On 6/18/2025 2:37 PM, K Prateek Nayak wrote:
> Hello Jianyong,
> 
> On 6/16/2025 7:52 AM, Jianyong Wu wrote:
>> Would you mind letting me know if you've had a chance to try it out, 
>> or if there's any update on the progress?
> 
> Here are my results from a dual socket 3rd Generation EPYC
> system.
> 
> tl;dr I don't see any improvement and a few regressions too
> but few of those data points also have a lot of variance.
> 
> o Machine details
> 
> - 3rd Generation EPYC System
> - 2 sockets each with 64C/128T
> - NPS1 (Each socket is a NUMA node)
> - C2 Disabled (POLL and C1(MWAIT) remained enabled)
> 
> o Kernel details
> 
> tip:       tip:sched/core at commit 914873bc7df9 ("Merge tag
>             'x86-build-2025-05-25' of
>             git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")
> 
> allow_imb: tip + this series as is
> 
> o Benchmark results
> 
>      ==================================================================
>      Test          : hackbench
>      Units         : Normalized time in seconds
>      Interpretation: Lower is better
>      Statistic     : AMean
>      ==================================================================
>      Case:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>       1-groups     1.00 [ -0.00](13.74)     1.03 [ -3.20]( 9.18)
>       2-groups     1.00 [ -0.00]( 9.58)     1.06 [ -6.46]( 7.63)
>       4-groups     1.00 [ -0.00]( 2.10)     1.01 [ -1.30]( 1.90)
>       8-groups     1.00 [ -0.00]( 1.51)     0.99 [  1.42]( 0.91)
>      16-groups     1.00 [ -0.00]( 1.10)     0.99 [  1.09]( 1.13)
> 
> 
>      ==================================================================
>      Test          : tbench
>      Units         : Normalized throughput
>      Interpretation: Higher is better
>      Statistic     : AMean
>      ==================================================================
>      Clients:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>          1     1.00 [  0.00]( 0.82)     1.01 [  1.11]( 0.27)
>          2     1.00 [  0.00]( 1.13)     1.00 [ -0.05]( 0.62)
>          4     1.00 [  0.00]( 1.12)     1.02 [  2.36]( 0.19)
>          8     1.00 [  0.00]( 0.93)     1.01 [  1.02]( 0.86)
>         16     1.00 [  0.00]( 0.38)     1.01 [  0.71]( 1.71)
>         32     1.00 [  0.00]( 0.66)     1.01 [  1.31]( 1.88)
>         64     1.00 [  0.00]( 1.18)     0.98 [ -1.60]( 2.90)
>        128     1.00 [  0.00]( 1.12)     1.02 [  1.60]( 0.42)
>        256     1.00 [  0.00]( 0.42)     1.00 [  0.40]( 0.80)
>        512     1.00 [  0.00]( 0.14)     1.01 [  0.97]( 0.25)
>       1024     1.00 [  0.00]( 0.26)     1.01 [  1.29]( 0.19)
> 
> 
>      ==================================================================
>      Test          : stream-10
>      Units         : Normalized Bandwidth, MB/s
>      Interpretation: Higher is better
>      Statistic     : HMean
>      ==================================================================
>      Test:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>       Copy     1.00 [  0.00]( 8.37)     1.01 [  1.00]( 5.71)
>      Scale     1.00 [  0.00]( 2.85)     0.98 [ -1.94]( 5.23)
>        Add     1.00 [  0.00]( 3.39)     0.99 [ -1.39]( 4.77)
>      Triad     1.00 [  0.00]( 6.39)     1.05 [  5.15]( 5.62)
> 
> 
>      ==================================================================
>      Test          : stream-100
>      Units         : Normalized Bandwidth, MB/s
>      Interpretation: Higher is better
>      Statistic     : HMean
>      ==================================================================
>      Test:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>       Copy     1.00 [  0.00]( 3.91)     1.01 [  1.28]( 2.01)
>      Scale     1.00 [  0.00]( 4.34)     0.99 [ -0.65]( 3.74)
>        Add     1.00 [  0.00]( 4.14)     1.01 [  0.54]( 1.63)
>      Triad     1.00 [  0.00]( 1.00)     0.98 [ -2.28]( 4.89)
> 
> 
>      ==================================================================
>      Test          : netperf
>      Units         : Normalized Througput
>      Interpretation: Higher is better
>      Statistic     : AMean
>      ==================================================================
>      Clients:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>       1-clients     1.00 [  0.00]( 0.41)     1.01 [  1.17]( 0.39)
>       2-clients     1.00 [  0.00]( 0.58)     1.01 [  1.00]( 0.40)
>       4-clients     1.00 [  0.00]( 0.35)     1.01 [  0.73]( 0.50)
>       8-clients     1.00 [  0.00]( 0.48)     1.00 [  0.42]( 0.67)
>      16-clients     1.00 [  0.00]( 0.66)     1.01 [  0.84]( 0.57)
>      32-clients     1.00 [  0.00]( 1.15)     1.01 [  0.82]( 0.96)
>      64-clients     1.00 [  0.00]( 1.38)     1.00 [ -0.24]( 3.09)
>      128-clients    1.00 [  0.00]( 0.87)     1.00 [ -0.16]( 1.02)
>      256-clients    1.00 [  0.00]( 5.36)     1.01 [  0.66]( 4.55)
>      512-clients    1.00 [  0.00](54.39)     0.98 [ -1.59](57.35)
> 
> 
>      ==================================================================
>      Test          : schbench
>      Units         : Normalized 99th percentile latency in us
>      Interpretation: Lower is better
>      Statistic     : Median
>      ==================================================================
>      #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>        1     1.00 [ -0.00]( 8.54)     1.04 [ -4.35]( 3.69)
>        2     1.00 [ -0.00]( 1.15)     0.96 [  4.00]( 0.00)
>        4     1.00 [ -0.00](13.46)     1.02 [ -2.08]( 2.04)
>        8     1.00 [ -0.00]( 7.14)     0.82 [ 17.54]( 9.30)
>       16     1.00 [ -0.00]( 3.49)     1.05 [ -5.08]( 7.83)
>       32     1.00 [ -0.00]( 1.06)     1.01 [ -1.06]( 5.88)
>       64     1.00 [ -0.00]( 5.48)     1.05 [ -4.65]( 2.71)
>      128     1.00 [ -0.00](10.45)     1.09 [ -9.11](14.18)
>      256     1.00 [ -0.00](31.14)     1.05 [ -5.15]( 9.79)
>      512     1.00 [ -0.00]( 1.52)     0.96 [  4.30]( 0.26)
> 
> 
>      ==================================================================
>      Test          : new-schbench-requests-per-second
>      Units         : Normalized Requests per second
>      Interpretation: Higher is better
>      Statistic     : Median
>      ==================================================================
>      #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>        1     1.00 [  0.00]( 1.07)     1.00 [  0.29]( 0.61)
>        2     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.26)
>        4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
>        8     1.00 [  0.00]( 0.15)     1.00 [  0.29]( 0.15)
>       16     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)
>       32     1.00 [  0.00]( 3.41)     0.97 [ -2.86]( 2.91)
>       64     1.00 [  0.00]( 1.05)     0.97 [ -3.17]( 7.39)
>      128     1.00 [  0.00]( 0.00)     1.00 [ -0.38]( 0.39)
>      256     1.00 [  0.00]( 0.72)     1.01 [  0.61]( 0.96)
>      512     1.00 [  0.00]( 0.57)     1.01 [  0.72]( 0.21)
> 
> 
>      ==================================================================
>      Test          : new-schbench-wakeup-latency
>      Units         : Normalized 99th percentile latency in us
>      Interpretation: Lower is better
>      Statistic     : Median
>      ==================================================================
>      #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>        1     1.00 [ -0.00]( 9.11)     0.69 [ 31.25]( 8.13)
>        2     1.00 [ -0.00]( 0.00)     0.93 [  7.14]( 8.37)
>        4     1.00 [ -0.00]( 3.78)     1.07 [ -7.14](14.79)
>        8     1.00 [ -0.00]( 0.00)     1.08 [ -8.33]( 7.56)
>       16     1.00 [ -0.00]( 7.56)     1.08 [ -7.69](34.36)
>       32     1.00 [ -0.00](15.11)     1.00 [ -0.00](12.99)
>       64     1.00 [ -0.00]( 9.63)     0.80 [ 20.00](11.17)
>      128     1.00 [ -0.00]( 4.86)     0.98 [  2.01](13.01)
>      256     1.00 [ -0.00]( 2.34)     1.01 [ -1.00]( 3.51)
>      512     1.00 [ -0.00]( 0.40)     1.00 [  0.38]( 0.20)
> 
> 
>      ==================================================================
>      Test          : new-schbench-request-latency
>      Units         : Normalized 99th percentile latency in us
>      Interpretation: Lower is better
>      Statistic     : Median
>      ==================================================================
>      #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
>        1     1.00 [ -0.00]( 2.73)     0.98 [  2.08]( 3.51)
>        2     1.00 [ -0.00]( 0.87)     0.99 [  0.54]( 3.29)
>        4     1.00 [ -0.00]( 1.21)     1.06 [ -5.92]( 0.82)
>        8     1.00 [ -0.00]( 0.27)     1.03 [ -3.15]( 1.86)
>       16     1.00 [ -0.00]( 4.04)     1.00 [ -0.27]( 2.27)
>       32     1.00 [ -0.00]( 7.35)     1.30 [-30.45](20.57)
>       64     1.00 [ -0.00]( 3.54)     1.01 [ -0.67]( 0.82)
>      128     1.00 [ -0.00]( 0.37)     1.00 [  0.21]( 0.18)
>      256     1.00 [ -0.00]( 9.57)     0.99 [  1.43]( 7.69)
>      512     1.00 [ -0.00]( 1.82)     1.02 [ -2.10]( 0.89)
> 
> 
>      ==================================================================
>      Test          : Various longer running benchmarks
>      Units         : %diff in throughput reported
>      Interpretation: Higher is better
>      Statistic     : Median
>      ==================================================================
>      Benchmarks:                  %diff
>      ycsb-cassandra               0.07%
>      ycsb-mongodb                -0.66%
> 
>      deathstarbench-1x            0.36%
>      deathstarbench-2x            2.39%
>      deathstarbench-3x           -0.09%
>      deathstarbench-6x            1.53%
> 
>      hammerdb+mysql 16VU         -0.27%
>      hammerdb+mysql 64VU         -0.32%
> 
> ---
> 
> I cannot make a hard case for this optimization. You can perhaps
> share your iperf numbers if you are seeing significant
> improvements there.
> 

