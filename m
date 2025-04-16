Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020115.outbound.protection.outlook.com [52.101.191.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B022FF5E;
	Wed, 16 Apr 2025 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841320; cv=fail; b=XrIce/hYFRHZZBrVrz3FgldbNVi+P5KII4sdoq58UWa3gQHvhWz3rCkJ6gldK+knQ+wl5aQrwb6iGv55eTmOtt68DpFLTAwz/gAo1pUNWX0iBFYYhVXR1bCs6kur3kLVTnnxxEyYPh4u69Uzt8EV5H/4ia7sW1XjiHJe8OGQ4kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841320; c=relaxed/simple;
	bh=2P+uccbh48B56g3CaPtAY+YL3MQlFgt7KfDdKdFyUcY=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=L9jGiCMl3QPy7XJcbYoxXwIUHQhMZZKngs1VYosTm1ML0tangTfVMwQPTw/AnZyn0UefmkUwo0cT0eRzOjOAdy6a9E7Pcr/UASN+26nin4gU8D6PfnJgtT8f7YEDPxpZRDeHTDeWCzUQzjKion0yYU3SxKMOCzpVLkcL9bzjI70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=U9oKrzWl; arc=fail smtp.client-ip=52.101.191.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="U9oKrzWl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss1c361LH5AJ7R4Dc16jQWfWFOf/dmsKpNf+In6gyoaFTwRUuGV3pgP8VgB4XsAYcGKmxIGRntxZ6zRJaHF41iCv8jQLr5o9H8kLx/n+abnYNMAhYUn7NMow/0iwZKeeRJZnLVSzOWKZg/WOL+1sSXHh4HA3u71sSfHzkW6uNuXPjpf2kaUqooqrRxV/oRweHDVuMQL2ohaSdsQ1U35kVKPzdayaR1BBJq7Nc60Bk9npsEN23WIuJspUugykMvBnSIvEYsXIOl6HsPVoNIioWWD/4qvcCtg6FAEqaDpH32knl/4VPyicyvaL3tQJgJsg47C+gbjzYdFXRsSfFk7YWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgtSXpRKGFJLlVp52NyoMPY7f4nUl9UTvzRa5qFTUcw=;
 b=Yjf89sKA2OwPqud71HmDS9BVex/DgVoSwS12r+N0BA6dS1oyrfal5DRjbkzfNR+gtdk2sdXRli/0QgbGNtbE/r1s4Bv2F5fk7as2VV2dXzetR2EfJ3bnhC7cIz1v6tdw0DFOUZX6r9K0OLQpll5EgetB13WRTHcRVOBS7toqwfJvoALq3wX/WQ43sRaJuZraj3/jOHp/aLXJVg7gUt5HkAyveKSwZVggVH9UVWDfutvUkbrP7hdeyttqeWO/opT1SdB/Tz/Z/sqYaTmqleSSDOo2VASk1O2IDnjEakQtzLtO2JaFc0N5d2y7fGuI/oXI+a8MF0+txCcbE1360sKvzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgtSXpRKGFJLlVp52NyoMPY7f4nUl9UTvzRa5qFTUcw=;
 b=U9oKrzWlq9GBmRfGPG0eZ70h21q3SckG/WLvy1UscQCJjBDXwBHP5uEgwMNwvbKXMwzA+ynBUIiTXrvFTF3bWPJpxcnOO2kuz9kMh2ftdVPjvm+1P2ZnbzDcLcLY+P66dp3Sv6+IeEmFHzyM7YO0+q/hjIsrRBoIi/TUMpPnQa/9OtlaRcs470eMNngIMfwZWcxay5e5OQb+QjoUxcZxxkiwY7l3KAP97lmKgSWqmfZUkOULqndSRFWpp3mGjvBiKBtoSNHD+ighvQ6zRxwnDKekr92WH6tn8mpN3W+f71rUGP4hEBHbNCt2uDgwYLMVTMSPamZ3hLkgqAz8FGoevg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT1PR01MB8171.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 22:08:28 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%7]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 22:08:28 +0000
Message-ID: <9a161f81-a02a-4196-9106-9c645664157f@efficios.com>
Date: Wed, 16 Apr 2025 18:08:27 -0400
User-Agent: Mozilla Thunderbird
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: lttng-dev <lttng-dev@lists.lttng.org>
Cc: Diamon discuss <diamon-discuss@lists.linuxfoundation.org>,
 linux-trace-users <linux-trace-users@vger.kernel.org>, lwn@lwn.net,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [RELEASE] LTTng 2.14.0-rc1 - Orbitales - Linux kernel and user space
 tracer
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::17) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT1PR01MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c87b4e-b62b-4bdd-685d-08dd7d33378d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2xuZTNyRWNNdUFXcDFsZWJiV3p5cXFoTjFXN1V3UHpENnlic28zMWlNd3Ft?=
 =?utf-8?B?Ynk2aUtoYjVwOTg2MDJER2ZuVGt0M1VqZlNPNVJJVnZSSE94eU5admtHNC9J?=
 =?utf-8?B?RVoyTDRSWEt0VFl4RENHdVE0WVcxQWF4ODE0MnJOcnNoK1lScVoyNlp0YzIr?=
 =?utf-8?B?M3JzYmNwMzJpWkZFZEV2bWRZV1FJV3hLbDdkK0VkMVp2UWJPQk9LWW80bGNm?=
 =?utf-8?B?N0QzTGs1MmN6WkJXUUZRTXhvVGlDdUlkZVRQZS95aTVLSEVqbXRqVHUxNHA4?=
 =?utf-8?B?NWFrZUFFVXZyUGthYk56WE5PWXZoSFZTVHE1WnE2aXN5bkRrU1BjVUZLbXNi?=
 =?utf-8?B?NE1pNC95RksxTUJvRUV0WEplVlZCdk9pRUlWUDlvR2d1cytWYkQ3ZVYxVWJv?=
 =?utf-8?B?REJMbHAyWFVqVmFOQnorUnJWUmVzQ3RzRnpaWnVGVC9BUmtid2lwK1VOS0ZX?=
 =?utf-8?B?SFJOUDhVdENxeTRSU0QwaTlaWDdFVkdEUjVZVFU2ODMrVUhoOUlwandobVRu?=
 =?utf-8?B?aWFiNWdmTkVBQnpoZmFLeCtJUWVZMzQrTFRBV2dhWjdaUjg1eVJ5aDRiUnRI?=
 =?utf-8?B?WHhqRnVqTWdkYVdiNEJENndlRHZiemc4d00wOGNEeXd3aW0yN0JEOXB3bU8r?=
 =?utf-8?B?RWQzcFdEWGhROTBxRnB5OGRwYnhWSnJtSWFLWldaSklrZEQxN3NLS1dhbFhC?=
 =?utf-8?B?TThXWG05RVhBZm5yNVdOMktJS3Q4OXAzTjJpQ3VEMDhqQmpFR1k1aHdIczNR?=
 =?utf-8?B?NnJ5QlNrSzRuRGVoekJ6cVE0LzV5UUZSZ3BxUndWMWRjYk1vTHBENWRuQU5V?=
 =?utf-8?B?MUtEWXhJRG1McjJrN0FrMFE5Q0F5S1JxSHN4d1FvelRhNmdnajBVWlZvZXdG?=
 =?utf-8?B?VkN2RkhDT0xWRnBxTjdYdWttMy9ROG9ubW05SFhKR3pRRnpDc0trTUhqdmkx?=
 =?utf-8?B?OHIrU3dINTNSTE4xSklUVk9oS1BJc2RrV1BsNzlXL2h4Yk4vdDZwMkZIcGdE?=
 =?utf-8?B?ZGl4c0Y4VkVmYUpuVjRMSERxWkNyTHpJbUNINDVNRVV3UXhCRlVUVXdBTjFj?=
 =?utf-8?B?YzNyRzN5dTVWOUpPejhEc2ZyQUVnSHhxZkk5bTJDRG1GbEVWWU9XcVFEVkVm?=
 =?utf-8?B?ck5lZ05tK2tjeTd4ZDVZNVhtWUNoemJqRWVCRzNjdmtzT3BXZEplWFdvRGpM?=
 =?utf-8?B?NUxnY2xWRTllb3FGSVBOVElaaUFSU1M3dUVEaFl1R3VnSUFldHlaMGszT1lS?=
 =?utf-8?B?WUcvSDVTRGpKV2xlWlAxSTlYdVh6azdlZXpLV3YzdGQ3MWl2RUFVRkN1R0Q2?=
 =?utf-8?B?UkpmdVhNcnUvbmJHYzFzd09Va1BCZjNHNGVUcUw3NlJlRG5VMjdrNEtvZnBs?=
 =?utf-8?B?VTkzdHcweWlPaUhXM21Sd1daeGRmU0FPb1hwNjIrNkp4N2tmckdsRWRPZGNv?=
 =?utf-8?B?VWZtcEtsRVU3NmFJSXJDMWlTcUFld2I2NVNDQWxZTE9uc2YwWWZDcUovZjlO?=
 =?utf-8?B?YzBIUldBaGorVG5DbWg4ZnVyNUI3UzAySlo3cGRpNmVkU3JPRUFaTkFuaE1R?=
 =?utf-8?B?dlg3SXFYTlhuTjlzdmZHcEtiOTcydmZBRUJiQW5tYUhKeTdlMjJFRUwxckdD?=
 =?utf-8?B?aEJrNjlnckZ6YTV1cVhlT3p4dGUxUFJrZHN5Z2N0V3pGMVpZdWdDV09ESnRH?=
 =?utf-8?B?MU45WWNDN1UrSXd3S0xKYm9rOFhIREt5YUg0Sk5Md284UnNvTXhZMEcrSXVY?=
 =?utf-8?B?Y2NGQUNHZEhtWEZwYkR5RGVrWTYwS3NnVnpmbUJ4VVVZNkM3UTBVZHZJM0w3?=
 =?utf-8?Q?MA+Audkjri+FOpWBiFqrcmYCWKa8mt+Gew9a0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ai9DZC8yQThVeGRoMkNYUzh3RGhqeFpTWExIeWg1dURoK3hZNWEzdWZVL3gx?=
 =?utf-8?B?dDRQZ0pORFp1anZvcGZHZkVJaFJiRjFxZnV6MWRDR0taN3pZaTNqL3pjcHFT?=
 =?utf-8?B?L1p1eGI5aEwwZlZoZnFOS0Y4alMzS04zOWcwcUdOM2NYMVlFVExHV2ZxYTVI?=
 =?utf-8?B?WU85U2gwc3ptcFR6dGpRaUQ2VkUxN2ZxY3Rma2JjRU5TQW4vMW1ad3BaQ3Q2?=
 =?utf-8?B?STNtWTRzRVFBWVQ5ekJ3RmloSjNzdFFPMGtjUTZCS1N3R0NMMG0rLzZ5Rkt1?=
 =?utf-8?B?NXBDMVRzTDRQdEE5QUtHTnVxeS9pQTJZYWg0NmtZZzQ4dE16bDhESDBLUUY4?=
 =?utf-8?B?NUdxcnR1MWNqYnhNdE1VdGl2TDVzY3RjN29zK2dvc3FEajJyM2MxdStjOFVO?=
 =?utf-8?B?YWNhem1LZzlVNkt5a3JIVmVsdW9teWlOSFNwaGdnYjRIc0J6UWJodHZBdzZ1?=
 =?utf-8?B?YUFjM0w1NmQwaXl1Q05NbWVTV3RwdDdBTG8rMVhLc2hvRUxESlpCZlpob0Zn?=
 =?utf-8?B?MzhYRXVwbVM5dlZnYzBUK2NlM2VLUHM3L1VkamZwK29jUlltOHJlOE5SRlFM?=
 =?utf-8?B?V2dBV1FFMXd5eTRsTjhjT2NIaFFDL0tNUHh4VUZLQnNvRzBSeU5seUZTL0Rt?=
 =?utf-8?B?bWRPZVBmMFdMTjJaRHpNRFN3cjRZN0dKaW5mclpPTUU0SDBQcmc4c3hVeGVE?=
 =?utf-8?B?SUVFbkNqZTNiTXMveWxTTTlITVgzbkR4SElnZk9vR2dwV2tOOGZlNXdSOHdB?=
 =?utf-8?B?bnBMTTZ4cXF5ZDNVcHlEQVFSNUdBV0lwZE5WV3pIV29XQWM2bkRIWm5vZTBG?=
 =?utf-8?B?WVd2czBON0tGTzAwZ1lSOFd1M3NSVDBzTUg1TVNLWmRHK2orUVlNWjArN1Rl?=
 =?utf-8?B?UjM2SXU5UmVmQi9DYWQ0WHFHMnZkNTdnTUVPTXNtd0dXbnpVS0Y3WXEwbU4y?=
 =?utf-8?B?WXNaK0tmOVN0YVBibzhFSFNSMjNmN3N1WEtndHg0RldybTdIV0hCK2R5alhk?=
 =?utf-8?B?N09QdU16UHNpaXk0bWpka3k5M2xlWHp6Y1lEa3VFQTR5K1N1ck9aWDdPWTRk?=
 =?utf-8?B?cmZtWk54QkRMWFN5MmRnNWRKa0dxSEp0bXd3b2lGdURxajcwckpUbHp6QUJU?=
 =?utf-8?B?cWNHSzZtMGxSd2FXODNnOW9yQ0ZERnVoK1ZnNkxZV0hMZ0ZTMFQwM2czVisx?=
 =?utf-8?B?SnpONnFKT2VBRUNWejRMMFA1Zzg5bGhEdzhmeDA5bDdzZDZYZWVkQWZKYXZB?=
 =?utf-8?B?Z3RUd1VkUGdHdXMwcjEzNk1rSGpONzNsWE5HS254R3Y0R2E1cGw1VzV5N08w?=
 =?utf-8?B?T1R4YXdXR21BZVZnVGxSejRYNjBGY0J4WjZQUUVOT3FQdGFMZjNET0FKK29B?=
 =?utf-8?B?Y3FYeVF5VkdjSEVOd0hNQXA5Q2FQMUt5b2U4bW1EOHpBWW11WGs1SklLU2Zr?=
 =?utf-8?B?R1lXeGFybDRiZHZMeWNCQ3NkeUU0RTlyb2piZnpDL004b0dralFKTUY4M1Vz?=
 =?utf-8?B?djZXYkNIRjRoRUJQV25SWTBZZm1aTFB6MVFUNTN5OHlvL1h5VFJrU0R1RGh1?=
 =?utf-8?B?bndsWFYwSWN2Q3YxYTZVMDZibVFYd3NaTDdXU2lSRTUrdlcwaDhJYmZZS2NM?=
 =?utf-8?B?QWFuK1RMTkM1SFNudFlkczZ0UDNvUDlLcHE2aUdnUHB3bnBqWmhLR1hncCtG?=
 =?utf-8?B?QXgxcSszUi9Zc1ZuclBJNDN0U1RkV2IzYWFjWEVPOWZaenZBUCtrbncxejAw?=
 =?utf-8?B?MVR0ZjA5YTJsOVJiU2hkeDJxUWNUT0UzRGNtcTBWRFBHTENPaXg0T0xsY05r?=
 =?utf-8?B?T2tYMnZQelJzSUtLb0ZGKzh1OU5kbTZzSmNseHU0dnk4RUhyQXpwUk8va2My?=
 =?utf-8?B?TFdyRmcyaVdmRm1VZlBodHpoamtrQXBDVW9UY0RQdnV2Vk1XcmJTSHlpTDVk?=
 =?utf-8?B?L3JQNFlqaHE4R3VqTS96K2RDUFM3akdON0NEd0N0eWFHai92L1NCVjBkUm9U?=
 =?utf-8?B?NVdSMnVpeVpuTGc2SFRObEtMSkJOR29GSGp3Q1Q1RGNIbFdsR3A5amhGL2tw?=
 =?utf-8?B?R1Rra0ZsR2xpNUhUcWZ3OVlYcEhteG9tVm9IVFpRb0pRNWhaYTk0RG9xZXVR?=
 =?utf-8?B?TGRlWDB0MklkSUZ3U2kxazQydmpibnAyYTZ4MlQ2Wm92bndRVTE4VytpaDJ1?=
 =?utf-8?Q?dLn9rCsFpq+tWsMiiM7cngs=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c87b4e-b62b-4bdd-685d-08dd7d33378d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 22:08:28.6823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZA9rDtAgESz3bC5/4ChUNP2dNF5fmKnKePQFJe+rBkoYz1fULTX5DEBtLg60oiwNyX5WK+STdOTOpMebl+z1EFDZvguuo53UFRbOFYoJ7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB8171

Hi everyone,

We're excited to share the first release candidate of LTTng 2.14,
codenamed Orbitales!

Four years in the making, this release introduces a range of new
features, improvements, and experimental capabilities. The release
candidate phase will run for a few weeks, giving the community time
to test and provide feedback before the final version ships.

WHAT'S NEW?
━━━━━━━━━━━
New features and changes in LTTng 2.14:

General:
     • User space channels now have a _buffer allocation policy_ which
       specifies whether LTTng tracers allocate ring buffers per CPU
       (what you've always known) or per channel.

       The buffering scheme term now refers to the ownership model
       (system, user, or process) and the allocation policy together.

       The new per-channel allocation policy means each user/process
       (depending on the buffer ownership model), instead of each CPU of
       each user/process, gets its own ring buffer.

     • User space tracing now supports the Apache Log4j 2 tracing domain
       in addition to the existing support for Apache log4j 1.2.

     • LTTng 2.14 brings _experimental_ support of
       Common Trace Format 2 (CTF 2) [1] for both the user space and kernel
       tracers.

       CTF 2 output isn't enabled by default and is intended solely for
       preview and feedback purposes: having an experimental support will
       allow users to test and evaluate CTF 2 until we make it the
       default output format.

Tracing control:
     • The new `--buffer-allocation` option of the
       lttng-enable-channel(1) command can set the buffer allocation
       policy of the channel to create.

       The default `per-cpu` value is what you've always known while the
       new `per-channel` value is available for user space channels.

     • The new `--buffer-ownership` option of the `enable-channel`
       command of the `lttng` CLI tool replaces the `--buffers-global`,
       `--buffers-uid`, and `--buffers-pid` options (now deprecated).

     • The `enable-channel` command of the `lttng` CLI tool, when
       creating a user space channel with the usual per-CPU buffer
       allocation policy, automatically adds a `cpu_id` context field
       which, as of LTTng 2.14, you cannot remove. This has always been
       the case and remains true, but `cpu_id` is now an officially
       supported context field.

       Knowing this, with the new per-channel buffer allocation policy,
       the `enable-channel` command doesn't add the `cpu_id` context
       field: add it afterwards with the lttng-add-context(1) command if
       needed, for example:

           $ lttng add-context -u --channel=my-channel --type=cpu_id

     • Everywhere the Apache log4j 1.2 `--log4j` option or
       `log4j:logging` option value is available with the `lttng` CLI
       tool, you may now use resp. `--log4j2` and `log4j2:logging` to
       target the new Apache Log4j 2 [2] tracing domain.

     • The `liblttng-ctl` C API is updated to support the new features:

       ‣ Set and get the buffer allocation policy of a channel with
         `lttng_channel_set_allocation_policy()`
         and `lttng_channel_get_allocation_policy()`.

       ‣ Add the `cpu_id` context field to a channel with the
         `LTTNG_EVENT_CONTEXT_CPU_ID` enumerator when
         calling `lttng_add_context()`.

       ‣ Apache Log4j 2 functions and enumerators are available
         everywhere there are Apache Log4j 2 equivalents:

         ⁃ `LTTNG_DOMAIN_LOG4J2`
         ⁃ `LTTNG_EVENT_RULE_TYPE_LOG4J2_LOGGING`
         ⁃ `enum lttng_loglevel_log4j2`
         ⁃ `lttng_event_rule_log4j2_logging_create()`
         ⁃ `lttng_event_rule_log4j2_logging_get_filter()`
         ⁃ `lttng_event_rule_log4j2_logging_get_log_level_rule()`
         ⁃ `lttng_event_rule_log4j2_logging_get_name_pattern()`
         ⁃ `lttng_event_rule_log4j2_logging_set_filter()`
         ⁃ `lttng_event_rule_log4j2_logging_set_log_level_rule()`
         ⁃ `lttng_event_rule_log4j2_logging_set_name_pattern()`

       ‣ Get the status of the Linux kernel tracer
         with `lttng_get_kernel_tracer_status()`.

       ‣ Get the shared memory directory path of a recording session
         with `lttng_get_session_shm_path_override()`.

     • Set the `LTTNG_EXPERIMENTAL_FORCE_CTF_2` environment variable to
       `1` when starting `lttng-sessiond` to enable the experimental
       CTF 2 [1] output format.

       With this setting, all the recording sessions which the session
       daemon manages produce CTF 2 traces. As of LTTng 2.14, this is not
       a per-session configuration.

       The produced CTF 2 traces are expected to be semantically
       equivalent to what the tracers would have produced without
       `LTTNG_EXPERIMENTAL_FORCE_CTF_2` set to `1` (CTF 1.8).

       ┌──────────────────────────────────────────────────────────────┐
       │ NOTE: A client of a session daemon started with the          │
       │ `LTTNG_EXPERIMENTAL_FORCE_CTF_2` environment variable set to │
       │ `1` cannot create:                                           │
       │                                                              │
       │ ‣ A network streaming mode recording session.                │
       │                                                              │
       │ ‣ A snapshot mode recording session where you send the trace │
       │   data over the network.                                     │
       │                                                              │
       │ ‣ A live mode recording session.                             │
       └──────────────────────────────────────────────────────────────┘

     • The `--all` option of the lttng-start(1) and lttng-stop(1)
       commands is now available to start/stop _all_ the
       recording sessions.

     • The `--glob` option of the `start`, and `stop`, and
       lttng-destroy(1) commands is now available to start/stop/destroy
       recording sessions of which some globbing pattern matches
       the name.

     • New lttng-relayd(8) options are available to help control
       its process:

       `--dynamic-port-allocation`::
           Let the operating system assign the control, data, and live
           ports if their respective option is missing (`--control-port`,
           `--data-port`, and `--live-port`) or if their port number part
           is `0`.

           With this option, `lttng-relayd` writes the `control.port`,
           `data.port`, and `live.port` files, as needed, to its runtime
           and configuration directory (`$LTTNG_HOME/.lttng`).

       `--pid-file`:
           Write the process ID (PID) of the `lttng-relayd` process to
           some file (like the `--pidfile` option of lttng-sessiond(8)).

       `--sig-parent`:
           Send the `USR1` signal to the parent process to notify
           readiness (like the `--sig-parent` option
           of `lttng-sessiond`).

     • You can now override the path of the directory where
       `lttng-sessiond` places special files for user space tracing
       applications with the `LTTNG_UST_CTL_PATH` environment variable.

       See lttng-sessiond(8).

     • You can now override the path of the directory where
       `lttng-sessiond` places its control files with the `LTTNG_RUNDIR`
       environment variable.

       See lttng-sessiond(8).

User space tracing specifics:
     • You can now override the path of the directory where a user
       application instrumented with liblttng-ust looks for special
       registration and control files of `lttng-sessiond` with the
       `LTTNG_UST_APP_PATH` environment variable.

       See lttng-ust(3).

     • You can now override the policy used to populate shared memory
       pages within the instrumented application with the
       `LTTNG_UST_MAP_POPULATE_POLICY` environment variable.

       See lttng-ust(3).

     • We improved the memory usage of lttng_ust_tracef()
       and lttng_ust_tracelog().

Kernel tracing specifics:
     The minimum supported Linux kernel version is now 4.4 instead
     of 3.0.

VERSION NAME
━━━━━━━━━━━━
This release is named after "Orbitales", a bold creation from
Noctem Artisans Brasseurs in Québec City.

Pitch black and dense—one team member compared the color to used motor oil—this
beer offers an intriguing sensory experience. Aged in wood casks, it delivers
rich aromas and flavors of blackberry as well as a hint of acidity. There’s no
head to speak of, but a whisper of blue cheese funk lingers just enough to keep
you curious.

IMPORTANT LINKS
━━━━━━━━━━━━━━━
LTTng tarball:
     <https://lttng.org/files/lttng-tools/lttng-tools-2.14.0-rc1.tar.bz2>
     <https://lttng.org/files/lttng-ust/lttng-ust-2.14.0-rc1.tar.bz2>
     <https://lttng.org/files/lttng-modules/lttng-modules-2.14.0-rc1.tar.bz2>

LTTng website:
     <https://lttng.org/>

Mailing list for support and development:
     <https://lists.lttng.org/>

IRC channel:
     `#lttng` on `irc.oftc.net`

Bug tracker:
     <https://bugs.lttng.org/projects/lttng/>

GitHub organization:
     <https://github.com/lttng>

Continuous integration:
     <https://ci.lttng.org/view/LTTng-tools/>
     <https://ci.lttng.org/view/LTTng-ust/>
     <https://ci.lttng.org/view/LTTng-modules/>

Code review:
     <https://review.lttng.org/q/project:lttng-tools>
     <https://review.lttng.org/q/project:lttng-ust>
     <https://review.lttng.org/q/project:lttng-modules>

REFERENCES
━━━━━━━━━━
[1]: https://diamon.org/ctf/
[2]: https://logging.apache.org/log4j/2.x/index.html

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

