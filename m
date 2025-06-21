Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020112.outbound.protection.outlook.com [52.101.196.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892F30E842
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 23:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550276; cv=fail; b=asXnQ8tM5+NgTR+M0YP/EHi1gvh6lH1AZLfQSgl4YZl7ohv18EzQW4YV99Su2c3tlX88AQ1ubNHWaPlYWFfHu3pXmGDh5nftPJFo4OErNMiwfdm4nIEwwXKPLlRJgWBywGsQTL+P5p7rNIpq7JJiP4mtWX5IfxK+Hs9cCT6lyW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550276; c=relaxed/simple;
	bh=fGaZ8b//i60vx+5TrhWW3j5U+IQEg7ni9xUcEiDQxs4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PyFxutxAeV/v10VtVEPTdU7I7x5SNErMJtSYZfzCQcimCN1SLMLPDyk2Kp4s9+cXgyt0BAhY1hjvGjMBpLqtT3qtuJXmpbsNuJiMhUNH2FI5xNOPrWMpJ4VQJlxoH/f5qYcqx4vV41dlcYgfnLj/ex8AYfMsy9MJo2tnX04LbaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.196.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFrhyK91+wRanJ4pPy1evjfeY1Y+mLwakO07AnL9as6dkYSkJnlPiCkBRq82lN1t7/c/iUwm/bKzyFQ/XngPq/nLiQngTuMOxpO+btPTtarNnJHWh07fbEE+5U2d4G7YmJNGZOqPWqyBkGuw6f/jP4YPmUE7MZAzb/tpnwPb/IZQpyokrQXvVlXB/bHPP9ympLZiIDcrb1qxsTinC954HkvqVqLSwFkzdXdeqIMHwpnaQPjABxfHNQI/2bRaxFYuadTofJf59kNJMzu9NX8vhvSPwKOROjWu1+40QfByzKM6B1kfziE2+IM5fL+7l1RnZnOVDQ6tQHWqHrtbEmqVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48fVgCtIs/yP7wsB008bS+0AEoZ1D2KiD1nrxO8vyRU=;
 b=Tf5bDkUVb9CHG26a9ZA0zlti4+hfZCM/Kr9HXiZyDBEbq6CSXcDOC0HJc7PJqqZVlFuIZonvJKyORqdaJxhgx7fzPG3J+SE1SViC/7j7N0icnDzcz17J4CUNhr5RUNaGFTit2yjI0IkX01qNcgFoj8QVLWoXPFOsceO1VUyUGdL12jxRNvdCtDca3wgmDVvKMKpfbKs8tfcD9zaH1l5gF4MBS9i0v9Q3E7UD1XGjA9k1dVYTEo3vTuN5G9Xy8vTxDW6rPdrCYdd4B708u+xFJavxV+CoIOuM7AjLNUHHKmitpaxB5MJs7P8pi2ur+NjTaupbB1uesQfzgPeU9ShV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by LO3P123MB3179.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:b0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Sat, 21 Jun
 2025 23:57:51 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5352:7866:8b0f:21f6]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::5352:7866:8b0f:21f6%6]) with mapi id 15.20.8857.026; Sat, 21 Jun 2025
 23:57:50 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: hpa@zytor.com,
	oleg@redhat.com,
	atomlin@atomlin.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] sched: idle: Introduce CPU-specific idle=poll
Date: Sat, 21 Jun 2025 19:57:45 -0400
Message-ID: <20250621235745.3994-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::13) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|LO3P123MB3179:EE_
X-MS-Office365-Filtering-Correlation-Id: 141294a6-5bf7-4b8d-eaed-08ddb11f6de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVNQTExZZHppUEpYaXk1NkNyNWIyWndpc3FDeG9JaHV1REZkZzcvcU9pMDJt?=
 =?utf-8?B?MnBveStONmQrd0JXU3MzTzhEOXM2VEVDemZxSFZ4R3dFazVDMmt0T1ZVWi9F?=
 =?utf-8?B?YTRqaERZSUMwL25SSDJDQ0hJak5zVUk4MEhBTExiWEVManZMbFJIazdvU3Zt?=
 =?utf-8?B?VmcrTGYvVWNnMWpwV1VibmlDMGtJRHd3RDFrcFdPMzEyZ005RC9SSUVlbEdT?=
 =?utf-8?B?dEdqczdnM0d1VkpVMzIvekE1RW04R0t1NmZVUHBnQjlQQmswNjRLcldtYUQv?=
 =?utf-8?B?ZlhhRGw4WUpvUDBUam4wcGc1bE4wQkQ0N3pVZWZ5dk5qV0F6Sk50VWsvYWZh?=
 =?utf-8?B?UmlQT0pRYnYzQk1ZdUdXbkxGMmkzdHBrQXU3ZVRwcnhreG5HUFpLT2tHb1lZ?=
 =?utf-8?B?R3FDT1QxaDIyRjkxa2k3MDY4enI4TkUwOGUwVnVBeVlueEd5Um95Q1lOQ3Fy?=
 =?utf-8?B?bjNWcmtCNjcwZ2dlTDBBVnhUbHdMdnZmeFMvWjZUUjBsQTZSem11cmR3Mkta?=
 =?utf-8?B?aFcxR09MQWtlNDBxWHFmUUZOM3FTSFdnQWRSVGliU2tTQjVKR0k0UmY3ZTVT?=
 =?utf-8?B?aEFtNmhhYXZiTzNNdlVVc0xlRDFadTltNUd4bDR2SDZRenhLNm5Sd2RLc2ll?=
 =?utf-8?B?cGdPYmdTcEpIMlNrZkNTdlo5MVdTcU5YV29PSHhXSG0vTWNNZDFyNVlSbjNv?=
 =?utf-8?B?WGVVcmw4dVN2ZERvTFpIdko3dS9Ka3kvWThIaHpBN2VuenR3NWZIb3JJSDkx?=
 =?utf-8?B?NUNHeGtQTkxYZWs3TVcrTmthckh6R0pkY1E2QVNYYlRxYVRnTm96WXE2WSth?=
 =?utf-8?B?SVFTcFRDS2xkZ2JJQ2hWTnZoK0tKbkJ6S2VCdEQ0ZmRyRmJQOWFzVXNKejVG?=
 =?utf-8?B?a2hQdW54cDRtbE9sNmZHaUdPOHJ0ZVV6UllSWDBDbnBIaGRua1ZBVG1QQ1JZ?=
 =?utf-8?B?cW1ld1ZEUEVjZmxNbkgwS0E5akpZb0NjbWprUGZrK2xFYVAramxRbFVsSHRj?=
 =?utf-8?B?U2VKc1lqdDJkSTJCcEN6Wkc4QUp4Uk5McTBpN0JoWFlYVWpQRWFWRWhmQjB3?=
 =?utf-8?B?YmE0di8vSU1BUjlhRWdLblJML0c2UjA4ek45TllOTGJDNy9sNlRhcUhlWndP?=
 =?utf-8?B?UGJHK1RRZzJFeDM4cVl0eUg3UDBKVDgrZ3FMZzhhMHNaTnZocm0rNzVLQWU2?=
 =?utf-8?B?SHFJTUM1ZytzNFBwUWI0elNMNGpWRjltS0tqaENsK3BkUXJISmtsUVVSSHBT?=
 =?utf-8?B?WXM1cmQzRlRlUTBFdnc5cWVEUjc3TmxuMm9iekVkb0didVlrNWxOTi9veFZH?=
 =?utf-8?B?ejRySU8rdWtBS1I0aUZtSm5JWTV5alpya1d5VFljTnZrWFJyekNBWm5uYW16?=
 =?utf-8?B?WDJuOGhUeFlsSTVlaG5QMlFteUJSb24rbUFaU2NFeVhDNWFTdFRnRW14eGsw?=
 =?utf-8?B?SFZ5SXc3bW16L3hkMGYxaklQcUxDK1I4bWZ6YkFONUZxakk1Y045NVY1cjMw?=
 =?utf-8?B?NEdFREZwQWxLMUJ5SXdRdkQ5K3lNSzNJQkFoTFFzOHRreFlYSmRndzYwRXBR?=
 =?utf-8?B?bm9TcHJqZitSeklDd0xtTkFaQjFiZ3BZb3M3YkNsbG8zdTlnWFJ1cGZFU3Ns?=
 =?utf-8?B?Mi92Tnl6S21GSWk5aDFicXJ6Vk1Sdkx6cHlvU2FMT0dqMVhMOTJuejZxWlJa?=
 =?utf-8?B?cXpRUVZxRGJuNmNycTRPYURvVlp1MElEMWl4VGZCaDFQdEt6eXlVWWdLZ1dr?=
 =?utf-8?B?NDErMUNQZUZYWSthM3dzeGxDREdhZkJXRE5GeEhNekl2TXdkc1NVZzJjM2dn?=
 =?utf-8?B?K3dJR1NDVGNjZnE0cTRsdlNheDVSNkJKZ1lXRjVZeFk2VExKOVhFdXJBRXVL?=
 =?utf-8?B?d0Naa2dGVFhLc25NYmorWFBqWXE5S2pHMDJOS2M3NlBvYjhvNXpDM250WXM0?=
 =?utf-8?Q?cr5FBae7nMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTZNZ1pIR1FMYXhyVTRIVXQ5QlZ2Ynh6bEVHRHN3VzhHQXI4T1dnMGNWRnRp?=
 =?utf-8?B?N1UzZG9xYzFPSHprMGdPam1VbG5uUjRPc3NtaDdoQzBNNGU0NU9QNUpUWExl?=
 =?utf-8?B?aG5zdGJTOFMyUXdDMGJGM3V6YlI0ZjhtSFRiV0xGY2FmUGRCOTBIc3JENHE3?=
 =?utf-8?B?NDZOSjFxbXpuRmk2ektwSXpzVFU1UTdpaU81d3llMERxUjk4cW45WlVSVlRD?=
 =?utf-8?B?eEZRYTZpSjNNa2ZRYkJ6ZmVpNHdLRG1FV3ZSajR4dGw1a2ZzVXZ4K1JNU2hy?=
 =?utf-8?B?NVRMQW90VU1EaTdOZzYvOXV1ajQzYXIyZXFuNmtmb3ZoTTA1dkdwaE5CL1pM?=
 =?utf-8?B?dWhWZWVyamsvcXdubkJ1UlN0aUZWRTNJQ1UrZGd2R2xaSnpLR0dzVndic2NG?=
 =?utf-8?B?eW5OWjJ1bnlDaGM5OXJsRUpkWFlQRzdMeEFhZE5Id3VLc0dKVEI0SlBVNkc5?=
 =?utf-8?B?VnhBeElKbUhxSzhjbEpsekVFRGRwc012a29VZHFURHB6NlF2TEZiY1o3blIr?=
 =?utf-8?B?SUw1YVZaSzgyYXM4RFV5U1R1RnlqSitxR28wTlhMSGNiMXpPRWh5N3R5YnVi?=
 =?utf-8?B?anBlcENLMGhhTDBBTjEvZWhuVTdSbVgzT0lBNkpzS2I3UmVOV05JSmh3K05D?=
 =?utf-8?B?OG9mYTFoSWtiMFRxTXJoUDFZTDgwMDZ6OVVjcHpZWTFuSXU5ZnBhWE5lOVhy?=
 =?utf-8?B?KzdvNnhvWFAva25vZ0RyRlI2NlUrbGtsbWp4MzY3OEh0UW8xQk1wZEZOZnl5?=
 =?utf-8?B?eUsyS2NzUlZzR3hPcTNRdFVzZkpmVDhEenRIT3dwejNvUHBOWDdFTWRtWkhI?=
 =?utf-8?B?bFhXTEdJSkRiZGNGY21vL0ROS2tEQXJORXErdlptbS8yVkU3Q2FoUjlCZC9u?=
 =?utf-8?B?cDIwUGNwZWxCTS9TK3BNdmppTzFZekFvTTdCc3JRb0xHV1RoMjlBaFFkMC94?=
 =?utf-8?B?RUNJSzBIcDlZeGNQRU1RK1U2aFkzS2pCMUppZjVXbk1OVW1RK1RzNHgvUjlw?=
 =?utf-8?B?WGpYTkt3QnNPOUlsY3psQmk0Zis1dXpHNFNCc0w5WG4xV2lobzN4THZ1MWlX?=
 =?utf-8?B?N2FKc09YcnV6Mk01a3pORjFuQzlDN1F2VWNUR0xuNDNwcVpRd01NWU9xWU5z?=
 =?utf-8?B?NDZmODBicytuZUlCMUZvbTBXd1llWmRWeTFSQ3pnRUNnVVVDMTZPNVQwczBL?=
 =?utf-8?B?NTlmdnNDVjVyRXFnWmVjcVRvcUhYeklHZ21MOHBDL1FodjFscjN2SHprWXpL?=
 =?utf-8?B?a3Y3V3lLRkhGUDVwUU0rUFlOVUUyS3YrQ1pHa1hlam0vaUJRTXd4TTdkS1ZQ?=
 =?utf-8?B?RjZaQitxckF1QUZ3ajlGZW1pUFJ2QzlYeGJTZnJxK2IrcE43Zi9xV0ZtbXJ1?=
 =?utf-8?B?Y3I4dHlwWS9nK3l3cmZZdTVQZWVtajZHVUlCRGlkcTRiREN0R3c3T0V0d2Zv?=
 =?utf-8?B?aGxUN3UvTUh4NHk4TGxwdURGT0NIZEFGTjBLSk5nZStUNjFIbmhzOXR6RVV4?=
 =?utf-8?B?Zjk5bkV5aFlVdUtwSGptamNlbm51Wjc2UTN5dllnL3UzMjkvL1lWaFVGRmc0?=
 =?utf-8?B?cFVpTmEzTTZDei9HMHBUVVl0RXd2OU9FVHhuM0JHRnZsamtwWDRWc05BYjZx?=
 =?utf-8?B?STdwdC91ZlJ0RzhYOGwwaVQ0VUxYZ2tJR0xReGdtdXBxVjZKa0dKS3Zjd25B?=
 =?utf-8?B?WGlyZ1NEY2Vjb2Y4b0o2OFZmY1Y3akFEa3ZJZWpLZXlTYis5UzkrcVNyNCtU?=
 =?utf-8?B?S3AvWWtLQ243UkVIS1ZHWFpQSjFOV01rYWZzMVJXRll1V0FVSlJ3Z3dWb1d4?=
 =?utf-8?B?eHlIeU8vcUxqcnpwdHdPZnAreFEwNjVqL25nNCtETDVNQndGZXVpMU5SNkJa?=
 =?utf-8?B?eTgzOHZlVjYwYjdwT3l5NW9NbEhuRjN1ak5lQ0VMd0lBcW84Zk5oYjNpSFIz?=
 =?utf-8?B?NUorZ0NIdjhCUTA2RDNkUzdXb3J0UitXVzQ0anA2cXhmZzdGTWxHdHZjQ3RJ?=
 =?utf-8?B?WHQ1YkM1SVBpY0NoYjRwdm93WXl3N05NSHZVZ2Y0alQvejhYK0dYa2Q0clpC?=
 =?utf-8?B?M2JMdTNiZ0lONy9aYXhVNE45eFhWZWVVVXZwSDkvTWlhZkZHTWxrMzNjQWFG?=
 =?utf-8?Q?RZO5vXHjxbAAeFXwOX8z2RJLw?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141294a6-5bf7-4b8d-eaed-08ddb11f6de6
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 23:57:50.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7i+47Ue9LB+q+kc5qdVUKsifx7T0XHfaIDa7GEPv3mSIwXA+0a6Sly8o/vsE5gh0UrDoKEDp3SZVgFq/jBPww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P123MB3179

Currently, the idle=poll kernel boot parameter applies globally, forcing
all CPUs into a shallow polling idle state to ensure ultra-low latency
responsiveness. While this is beneficial for extremely latency-sensitive
workloads, this global application lacks flexibility and can lead to
significant power inefficiency. This is particularly evident in systems
with a high CPU count, such as those utilising the
Full Dynticks/Adaptive Tick feature (i.e., nohz_full). In such
environments, only a subset of CPUs might genuinely require
sub-microsecond responsiveness, while others, though active, could
benefit from entering deeper idle states to conserve power.

This patch addresses this limitation by introducing the ability to
configure idle=poll on a per-CPU basis. This new feature allows
administrators to specifically designate which CPUs are permitted to
remain in the polling idle state.

This provides a critical improvement in power consumption by enabling a
nuanced power management strategy. CPUs running workloads with stringent
ultra-low-latency requirements can continue to benefit from idle=poll,
while other CPUs which in Full Dynticks mode, but not constantly busy
can dynamically enter deeper, power-saving idle states. This granular
control offers significantly enhanced flexibility and efficiency
compared to the previous system-wide limitation of idle=poll.

Consider a CPU configured in Full Dynticks mode, while idle=poll, a
"perf report" from such a system, even when the CPU is largely idle,
frequently reveals the following dominant activity:

    99.70%  swapper  [kernel.kallsyms]  [k] cpu_idle_poll.isra.0
     0.10%  swapper  [kernel.kallsyms]  [k] sched_tick
     0.10%  swapper  [kernel.kallsyms]  [k] native_read_msr
     0.10%  swapper  [kernel.kallsyms]  [k] native_sched_clock

The high percentage of cpu_idle_poll code indicates the CPU is
spending virtually all its time busy-looping in a shallow idle state.
This behavior, while ensuring responsiveness, directly translates to
substantial, unnecessary power consumption for CPUs that are not
"actively" processing latency-critical workloads.

Now consider nohz_full=2-47 and idle=poll,2-26. This setup attempts to
allow for a highly optimised balance between extreme performance for
critical components and significant energy efficiency for the rest of
the system

 - Dedicated Responsiveness. Cores 2-26 provide unparalleled low-latency
   for the most critical workloads by remaining in constant polling,
   consciously trading increased power consumption for absolute speed
   and predictability.

 - Significant Power Savings. Cores 27-47 achieve substantial energy
   conservation by effectively utilising the true deep-sleep
   capabilities of nohz_full when idle, directly addressing and
   mitigating the power waste observed in the perf report for similar
   scenarios.

 - Enhanced Flexibility. This system avoids the previous
   "all-or-nothing" trade-off inherent in a global idle=poll setting. It
   empowers administrators with fine-grained control, enabling a
   precisely-tuned power and performance profile for specific
   application needs and optimising resource utilisation across the
   entire 48-core system.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 arch/x86/kernel/process.c | 27 +++++++++++++++++++++++----
 include/linux/cpu.h       |  1 +
 kernel/sched/idle.c       | 33 ++++++++++++++++++++-------------
 3 files changed, 44 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index c1d2dac72b9c..43d0cc2bed73 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -973,15 +973,34 @@ void __init arch_post_acpi_subsys_init(void)
 	pr_info("System has AMD C1E erratum E400. Workaround enabled.\n");
 }
 
+cpumask_var_t idle_poll_mask;
+EXPORT_SYMBOL_GPL(idle_poll_mask);
+
+static int __init idle_poll_setup(char *str)
+{
+	int err = 0;
+
+	if (cpulist_parse(str, idle_poll_mask) < 0) {
+		pr_warn("idle poll: incorrect CPU range\n");
+		err = 1;
+	} else {
+		boot_option_idle_override = IDLE_POLL;
+		cpu_idle_poll_update(idle_poll_mask);
+	}
+
+	return err;
+}
+
 static int __init idle_setup(char *str)
 {
 	if (!str)
 		return -EINVAL;
 
-	if (!strcmp(str, "poll")) {
-		pr_info("using polling idle threads\n");
-		boot_option_idle_override = IDLE_POLL;
-		cpu_idle_poll_ctrl(true);
+	if (!strncmp(str, "poll,", 5)) {
+		str += 5;
+		idle_poll_setup(str);
+	} else if (!strcmp(str, "poll")) {
+		cpu_idle_poll_update(cpu_present_mask);
 	} else if (!strcmp(str, "halt")) {
 		/* 'idle=halt' HALT for idle. C-states are disabled. */
 		boot_option_idle_override = IDLE_HALT;
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index e6089abc28e2..ce909b1839c9 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -164,6 +164,7 @@ static inline void suspend_enable_secondary_cpus(void) { }
 void __noreturn cpu_startup_entry(enum cpuhp_state state);
 
 void cpu_idle_poll_ctrl(bool enable);
+void cpu_idle_poll_update(const struct cpumask *mask);
 
 bool cpu_in_idle(unsigned long pc);
 
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 2c85c86b455f..86365bbbc111 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -19,22 +19,29 @@ void sched_idle_set_state(struct cpuidle_state *idle_state)
 	idle_set_state(this_rq(), idle_state);
 }
 
-static int __read_mostly cpu_idle_force_poll;
+static DEFINE_PER_CPU(int, idle_force_poll);
 
 void cpu_idle_poll_ctrl(bool enable)
 {
 	if (enable) {
-		cpu_idle_force_poll++;
-	} else {
-		cpu_idle_force_poll--;
-		WARN_ON_ONCE(cpu_idle_force_poll < 0);
-	}
+		this_cpu_inc(idle_force_poll);
+	} else
+		WARN_ON_ONCE(this_cpu_dec_return(idle_force_poll) < 0);
+}
+
+void cpu_idle_poll_update(const struct cpumask *mask)
+{
+	int cpu;
+
+	pr_info_once("using polling idle threads\n");
+	for_each_cpu(cpu, mask)
+		per_cpu(idle_force_poll, cpu) = 1;
 }
 
 #ifdef CONFIG_GENERIC_IDLE_POLL_SETUP
 static int __init cpu_idle_poll_setup(char *__unused)
 {
-	cpu_idle_force_poll = 1;
+	cpu_idle_poll_update(cpu_present_mask);
 
 	return 1;
 }
@@ -42,8 +49,6 @@ __setup("nohlt", cpu_idle_poll_setup);
 
 static int __init cpu_idle_nopoll_setup(char *__unused)
 {
-	cpu_idle_force_poll = 0;
-
 	return 1;
 }
 __setup("hlt", cpu_idle_nopoll_setup);
@@ -51,14 +56,16 @@ __setup("hlt", cpu_idle_nopoll_setup);
 
 static noinline int __cpuidle cpu_idle_poll(void)
 {
+	int cpu = smp_processor_id();
+
 	instrumentation_begin();
-	trace_cpu_idle(0, smp_processor_id());
+	trace_cpu_idle(0, cpu);
 	stop_critical_timings();
 	ct_cpuidle_enter();
 
 	raw_local_irq_enable();
 	while (!tif_need_resched() &&
-	       (cpu_idle_force_poll || tick_check_broadcast_expired()))
+	       (per_cpu(idle_force_poll, cpu) || tick_check_broadcast_expired()))
 		cpu_relax();
 	raw_local_irq_disable();
 
@@ -78,7 +85,7 @@ void __weak arch_cpu_idle_exit(void) { }
 void __weak __noreturn arch_cpu_idle_dead(void) { while (1); }
 void __weak arch_cpu_idle(void)
 {
-	cpu_idle_force_poll = 1;
+	this_cpu_inc(idle_force_poll);
 }
 
 #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST_IDLE
@@ -318,7 +325,7 @@ static void do_idle(void)
 		 * broadcast device expired for us, we don't want to go deep
 		 * idle as we know that the IPI is going to arrive right away.
 		 */
-		if (cpu_idle_force_poll || tick_check_broadcast_expired()) {
+		if (__this_cpu_read(idle_force_poll) || tick_check_broadcast_expired()) {
 			tick_nohz_idle_restart_tick();
 			cpu_idle_poll();
 		} else {
-- 
2.49.0

