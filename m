Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022086.outbound.protection.outlook.com [40.107.193.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB125F788
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208154; cv=fail; b=Tq5vEraq8n9bWg+R2b+JICSAIUqNo7E+ktduYGtz39rfCW9yVZs1Rp3Ryzz2peTBCshcH2DJ8te33nW8IPS0cwha796M7veacHnwmJsB2Lc73HBcL7GAtOBtyhWQxfS2DwAH2W7zNJLmIzwNnCRWwo9tWzHvofecMSXtIP5W13o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208154; c=relaxed/simple;
	bh=Sbcg+nXXxhBLwisHdYMXXEEq7LRO7pRCHpYSPSgkdZs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p+VxQti/zI5u2rjUwt2zwtrmEy0TT1RLgpt6kjszgofDb5KAtievSSG4YCX0TKk2ZLPqbkbFQSYIIKZc2zYr9Uay/VNFDmlAI3/2i4s0ciK5xo6xxzpuOKn4yazBm6tuN9o4MMV0pgqKP5NuRQ/4oRvx/n2l/SyE5orElpaQyKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=BZ3TuqHB; arc=fail smtp.client-ip=40.107.193.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="BZ3TuqHB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ/YurlrgGsZRGA5qJbx4LSp5IhMHyYQza0xbrHyrmkfqicqzBPHTwQLvjRaIkTTDMmERANMCpmgIX4QE1zvMyXFGtaXCuIDSShvMaQMXnGcIORcg7JFZ0tNO+f1GzzaA0iv+xzIN6ClzfZMGjl4mPnVVsx+9roN5ibD2rm1kjFOao69rV19abar9DRpdiwp35Ptc0mjk8nDTiimMhrb5w6E65awE/r+Oudb8oRmd8FPi5wp9b1+NeB3jCvwKvWhTHJhzSU5Ocv1W8bGZ1CEg+eO3uxhnvLvk0ohMQJ0y48nW0hsOt4pmAEo6pgt+8KZCNKCDyFU9AC690UToSZcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAAOvs0ebaDSWwZh0w4Vvtniyl0KMk/cRz8hiKgow9E=;
 b=Fh6kw/3GQHbW8+XOHc23fry4wGTUn/Ly0T4QxZJkjlInqtNA5dXWtVgFWPL71QJY+Ud0Tmcq8WwQodeQ3OTJJuOUfLGffUy9hO/SmKhYTATraU1BYiN9rbN3BPm/qYuA+qjVR2tVpyUvtviQ/hRtODQYTVaudMosM12ps31DV5E+2mRWyFPfs0eklwjCII1bkVEscg/wxwu4zETmxHUH4R2xBXP0pcFI/GkhzqBMfG1uD9Zxnm5DU+TjZXt9N/aFl1cDXJ63iX5hFRpkz67c+dr5sJH13pD3LAlPMBijBhDaDDKci+SqA3KUMNnlMz4YWzVBR3dNNEkt+Pg6Z6qRkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAAOvs0ebaDSWwZh0w4Vvtniyl0KMk/cRz8hiKgow9E=;
 b=BZ3TuqHBuhgsG7SdASMOofNnK+954j2//5oSHqNfiYz0vTqcFW9f3NjCvi6AyLVBTkwXTkha5M5vq7PovRHTQqtmDa5hMxC1svJIbsEBqdsV2mdIpwVMcESQ5EFhIe91cnjlgy4E8dfRn9+sAdzKljA8Xb5e9HO34cIrlFmOU3hd7TIUEYHTli7LmzrElvRMrIwNkyAt5RhuBNQt9nAcSabQ5P9YtGupA9rS8W2mag1j28NL78wrTplv16eL4STaf/CqvXoz+9Oz6844dJ1ADHpxmIeBqE8sSqCGDGdxCPvqwh/ttv0EQJnnRkefrrd9zmDkKljdvQFhokyo/RAbCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT3PR01MB10750.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 14:15:44 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 14:15:44 +0000
Message-ID: <c0df7480-1c18-421f-9348-2d39b7bebb49@efficios.com>
Date: Wed, 9 Apr 2025 10:15:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] sched: Move task_mm_cid_work to mm work_struct
To: Peter Zijlstra <peterz@infradead.org>,
 Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.org>,
 Shuah Khan <shuah@kernel.org>
References: <20250311062849.72083-1-gmonaco@redhat.com>
 <20250311062849.72083-3-gmonaco@redhat.com>
 <20250409140303.GA9833@noisy.programming.kicks-ass.net>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250409140303.GA9833@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0240.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::14) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT3PR01MB10750:EE_
X-MS-Office365-Filtering-Correlation-Id: ce94e1af-45e5-4bf9-bead-08dd777103c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjFpbTJSOE5FdzZURmZFdHlULzNTL2VKVkdrampkNjZQS3ZlVEN4TEZ4VWxs?=
 =?utf-8?B?TzFJV0ZJaksvd0tLVmVvNURSeW83cjdYUWs1ZitETDV1M294aExzWTZUMEpx?=
 =?utf-8?B?ajU1UUs4NWRzWklEZDZJWUgzTlQ3M0FoRUJTUGxIRm11SW43dWZzaENKeDU1?=
 =?utf-8?B?eDJZMWU1WGVRVkFCR3prbStTM2g0Ull2VDNVdnBxVVIwWWpEU0ZxZkFkbjFH?=
 =?utf-8?B?bWprbFp1TUFUcDUvZ3FERzdrMDQzM3N5cFh1RUNiMW9RZHFBZGZzeFVSRGZp?=
 =?utf-8?B?TEE5N3F4dm5QQnpCam5xTTFleTJpMFp0TDFlWFBma0huOGp5Q29hRDA0RnRo?=
 =?utf-8?B?Y2J0TW4yMWpwOGQzZ3RESnAxaTRkRUlWaVNVdE1YdUNRUFVKcnJEVnlUeThJ?=
 =?utf-8?B?YU5COGhiSjNFV3AxT3hSb2JLVWhZWVp5MjRpWTNzTC91SzVzL05lbHN1TUpa?=
 =?utf-8?B?V09mSHIrQ1ZyUnZ2MExQMW5ERnc4TTlYZjFzVTVkNzRsMC80aktad0lLWUhC?=
 =?utf-8?B?ZlNqNk5pOWZxaTVqY05SRmNJYW43ZHVzNmd4YVlGd1Z6UkxXVktXM3p1bm1V?=
 =?utf-8?B?Kzg3eitkejdtWHliWjdqbzlhTnJaY1I0eSt2cE8zVC9STWRVeGd1SXFUNHI2?=
 =?utf-8?B?UTdRYjcyZ2RmM1lUaTlYN0swMUdqc3k3dURaSjdOeDBka2I0S1hYaktVUGdC?=
 =?utf-8?B?L1pkZjNudHFncW9JQitvRS9wb1JjbnNnQ1plMVlKWGlLSXh2MUYvQzVHd2w0?=
 =?utf-8?B?WWIwM0dHbUpHUC9qa3I4aGF6MElIUUNLZHhURVpLSVJPQXYxdzl4ekV1TERo?=
 =?utf-8?B?T3g3KzFVdWF6TTE0OU9nMGM2ZVEzdU04OEd6c1JHT3VXejMvamtpRVpMcW1o?=
 =?utf-8?B?RjIwc0NENUZOVllDb1lQUjhSOVhkc1pDZlF6NFY4ckJhOUdPRXFhdUJNUEdu?=
 =?utf-8?B?bldBbzVDSEYzS1N6U3FDQVNZc1lvQlRIQ3BBZlZSc2dNMnFaOE80Z0w4anA1?=
 =?utf-8?B?YkZKaTdqMzR2U09TTWN0OUVubVh1dytoaENua1gyUXUzeGZ3MTZhVkhMcXRP?=
 =?utf-8?B?Zkd0U1VuekJvbFVEdzVZampYSWdxTEtmSnp1WWZkUldHTXVCU21VS0wvb2lC?=
 =?utf-8?B?VVoxU2lpUy80ZmJUTVh4ZGdIblM0aHZ0UVN3VWd5WWFKRi9aLzY3U1hzVm9q?=
 =?utf-8?B?OUtTQVV2cGd2U1lWZ3ZoM00yUDlXeDZGS04vTnRLeDZkcXBJMkxabTJRUytp?=
 =?utf-8?B?dkR2d240OVBKVnoyMXN4eHNPaG4wL0p5R05uUCtPMUZYdVlBT1hpSWsrM2Vp?=
 =?utf-8?B?L3I5cTVpeWZiOGVHdnhaM004VjJYYllRMDAzYi9pS245d3FEamoyajIyRFhY?=
 =?utf-8?B?UGNUOWxhYWp2OS9Dd2FReGtJWVNYWGEyazdSVEVBZExqcWVvczJWdzdEaVJ3?=
 =?utf-8?B?QUtHamZFQk9oaENjU2RHaWNGWHpqTUx5YkFzVnBEbDMvWkJFMUhqK3Q1RTl1?=
 =?utf-8?B?a3d6VlEzdjZoOW1MTDFQN0RRQmt2REZ5NTcxMHNxNis1MDg4a2VWcmVQM2ly?=
 =?utf-8?B?dnlHZnNXcG1xdGQ0WUdZS1VpUDBhRWdpbEdjdTdQWjRMZ1VtaG93aElnR0ZM?=
 =?utf-8?B?NzlhTlkvd1lyNmQxRk5mVFcrTHJpSlRyU2NFM2VDc0lnN2tPQlFwVWUzWGY5?=
 =?utf-8?B?VlFyREs2Y1BtQ2pDOTV6MXRhY3ptbXJWbE1mRERRb3BYMjlsWk1oMC9RL2RV?=
 =?utf-8?Q?har9xWgnMJcnQ5HGxWYpGintqi2+tjwMAspgO8t?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDBhUkNjTDdDRkpIQVZTUnAzbStUQ0QrN2VxSGRPd05MZldXVmFXMXJraEQ2?=
 =?utf-8?B?YVViSVFOQlFTZlBWeUdkSVN5N240NXdWVDMxOCtqUWozamFiWUZWLzJwem9J?=
 =?utf-8?B?S0RXbWxuQW4xNzBDd3ovLzlLV0s5Q3N3Qkgxek82TmxJcWkxeWExQVJWU1pk?=
 =?utf-8?B?TnZrS2VQc2NLNXg2RkgwazBFRHBPOEI5cVF6SVNtVTRSb0JzMjBqYWo5aitm?=
 =?utf-8?B?YzU2YS9UZWViZzIrZURZUkprSExnNUF6SXlNY1VWMzZHWi9sNUNWRVN2ZkVY?=
 =?utf-8?B?UUgzcnltejJibC9qMHc0NEYzbEFwbEIyTzFrODZYVGY1a3NVUWpKVkF6MDla?=
 =?utf-8?B?c3ROMElyV05kWG5kR0MzOERGSEQ1ek15UUlsbUJoaXp3T2c4MHZnSGJZVzE4?=
 =?utf-8?B?ZnM0WWF6NmZhcGRwclAxZDErLzlKZ3Z5Q0Y4bmVhRXhCWFFSME93YlRtbHFL?=
 =?utf-8?B?ZUttSjJBVGpBejV5M3VCMmV4d1RkWkFiZkVuUnpCT3NFeEZWUk01U2w2NTRI?=
 =?utf-8?B?R0lranhYZ29DNFIyeFBrZjR3aWRVTU9VSkhEVWo4NVhJaDZnRHBYZDl4REZH?=
 =?utf-8?B?Y3NpUWdYbE5YbjZpSFRYVnFrVVczekVleHVIamlBRjE0OHBCRnJoTzE1dHdz?=
 =?utf-8?B?U213OUVTWjk2bWFzelk5Z3Jrc1ZDeDNMRGpEMjloeWNSQzFpRXVzOWVER2Rp?=
 =?utf-8?B?N1lqTDNDZWVQWlZJZ25yQTR4czNXNWFmMTY4QW5jT01YeGtZY1I0MnFqUEM2?=
 =?utf-8?B?cE1odWZwanNCckZESDY2bTNLb2pMZ2xpcE9TTThpL2l5aUttanVsaEhZM0hX?=
 =?utf-8?B?SWhYK2NZOHZRRldKeFFTYk1qTURrUEpVWDB4bUVuT05TUmc4UmFBYjB2TlR1?=
 =?utf-8?B?dm1lOFR3RjdvT2JudEMrRThZbWh4QW9HM1BPZktEdTRXb1dxVmZaVlhCQ2hF?=
 =?utf-8?B?TzArVllrNW56OFRva1JyejhyZDJyNThjbjdac3RyV1VJTjhQRjFSZjBEODc1?=
 =?utf-8?B?TnRxUDlMSFIzSlJ1YnRJelNwcXY0cWNyckl6Tmo1S2k3cVM4cW9wMWpXOTYz?=
 =?utf-8?B?RnlLMmVJQWN1M0o3cE9lQ0dCdVNHTjhWajJVbGNZSjA3ZnZ0QTNDZHdheVl5?=
 =?utf-8?B?eUptd1ZLTTFTNDBBWXlnQmhzbUJ2R3E3QitjaWdhdDJGWFgvcnJOVXhFMUE5?=
 =?utf-8?B?WnUvbFc1czlqczBEWkxScmkxUCtRYlJMa2hzcTF0M0svM0Y5b3pUbzZaaFNj?=
 =?utf-8?B?LzluTXNzYTg0NzVra1dDc3Rjbjdlcy84MlBmbDRZS0hhcUVYOGxzR3Bwa3pp?=
 =?utf-8?B?aFVPS2kwQzRPVHFsZXBISnU3dmt0RUU1VmtEa3o5bVJZRW5tWFRjSWMwcEUx?=
 =?utf-8?B?bDE1Ly9ObytJejM2akJjQ3BTSjZ5Z2krVDhFS0loOEVvN1NTdFk2TFVDY0Yy?=
 =?utf-8?B?TnplbDk2RzgyZ3VPWFpleFRuRU1UUnZGdG14RzJlYVJPOGthVVZrTC83T1I2?=
 =?utf-8?B?L1hBcDZaUGhHbVE0NDNZTEJtNnYzRjZMejE5NnNYaWlNa053MFoxOUdsbFQ1?=
 =?utf-8?B?bzBiM3J1YUNFU2c3eGZsZUJSTTJlbnVhSG9qQ29nMmdic1M0K2x0MmJGZDcv?=
 =?utf-8?B?K2drT1dia1pEd2ZKUEx1MlF4QlZpb3AzVTk5aHZOU3IzaGVycWtObTlVY1lx?=
 =?utf-8?B?aDFRYzZoQWhqTGZsTU5UdVA0M0hzVmdUM3laVEMwQnlKR2x6UHk5WWxIaktL?=
 =?utf-8?B?T05jc0pWZnp0US85N0tzNm5wS3RneGhwTUZIZmI1NFNNNEhtSEpkQzEwaDU0?=
 =?utf-8?B?a0hybmtzTmZ5N2VsYUxRbXIrdTlnYjIrVDRXYjhrU002RURrR05qR0ZVajg4?=
 =?utf-8?B?UXhpUEhOZDZwKzY1V3ZBcFpmbVZXcEZtS0xEcWx4UktEVlFZTHRlYm1mSnZl?=
 =?utf-8?B?RFJVOWhCWVZtTjJXSjl2WVRBSHJHS3hiMFNFWExiZ3NRV1hHQVRpRlBQUnJD?=
 =?utf-8?B?VzcydFdudmVoUnVHYVh0Z1ZQWlBCaXY2RG9ldXp5eDNib2VYUnh3bDNKZlEx?=
 =?utf-8?B?U1BoejY0VHhvK212aXZLRjZRREVqd0JzelcvRHhWb3JINlEraUlWcjJoRkpw?=
 =?utf-8?B?ZXZ1NVY1OW4zbzNsOE05MVZKMjZSWUNNdkZxNW9NSVhURjN5Z3p0NzMvcklG?=
 =?utf-8?Q?5cPR/rlDNn3JE8c2JzNGKIY=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce94e1af-45e5-4bf9-bead-08dd777103c4
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:15:43.8509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /atXb4dU+e+6QWTe8rbd8sB0HbD0K7/308YArZNQxLlCUaJX94w/bvcewX67MVaOLAXT1XVjy7T1csPWXPoIrSmKluAdXARrP2KhsQRv/yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB10750

On 2025-04-09 10:03, Peter Zijlstra wrote:
> On Tue, Mar 11, 2025 at 07:28:45AM +0100, Gabriele Monaco wrote:
>> +static inline void rseq_preempt_from_tick(struct task_struct *t)
>> +{
>> +	u64 rtime = t->se.sum_exec_runtime - t->se.prev_sum_exec_runtime;
>> +
>> +	if (rtime > RSEQ_UNPREEMPTED_THRESHOLD)
>> +		rseq_preempt(t);
>> +}
> 
> This confused me.
> 
> The goal seems to be to tickle __rseq_handle_notify_resume() so it'll
> end up queueing that work thing. But why do we want to set PREEMPT_BIT
> here?

In that scenario, we trigger (from tick) the fact that we may recompact the
mm_cid, and thus need to update the rseq mm_cid field before returning to
userspace.

Changing the value of the mm_cid field while userspace is within a rseq
critical section should abort the critical section, because the rseq
critical section should be able to expect the mm_cid to be invariant
for the whole c.s..

Thanks,

Mathieu



-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
