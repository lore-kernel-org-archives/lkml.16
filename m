Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414021147C;
	Mon,  7 Apr 2025 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057154; cv=fail; b=gWPgQzRfFF7vYP8ovtTvAtlqBRSfBvUI/xEcbgDNeMRRTC9F2VINLOrV4xX8OlvvhwdssM7sEaxMlmjBbXdbBF6zLmAHiikv05P6xUhDq4hEguXATQwEHCCIk57GCKC7QJ07oizSwo8pRAmFzCVL/XEU/xAGLGSK/OOaAdR4i9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057154; c=relaxed/simple;
	bh=WvYkofxR7u1lav5m8tHGZQk2uaBzqk9kZJyHGP0/C6o=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ttJq4sX7bbuz67lyZW7rWhHWZErY0cW2U7JqzpvuIqC9YqCYS9UfEkLVSdYVn3iMtJd4io+in1hR8aTnM3g6qFWW4Dl3aoJr1WCNGnpXSpoKfb2uWC5ckwgIN1I5VxLF4Y8r5Xno0v7DzSEs7I8LUUzxGlmGCi/E9BWW5BUbGaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pJR4seV7; arc=fail smtp.client-ip=40.107.223.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pJR4seV7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k3RnDazrqD4tQIE21dAeyc0Z1ztIlfLItf2ZhRNQSE2miTlaCzkDg3pXhj0lo9uhpt9+M4df/snNjTiwkyyUDaT7RXqEzbFwrWfpQ53cqV5bIhWy61ohJgLqduxcxgvD32qT5CeKwl7nLBwRo+NiqNndWT6P4xiM9iytgaIfeewqXAppkhKzM1tFQG5DX41FRtfNPXDP/tF0Y2mAekta7JUDZ9ECICoYBptUnzVTZnp0SFc9ubITJ2oDXMF8tsKL9fAyk+GGvGTVhcUJ/GL3yiAwxTeL3lxmBGjZLLtX8WeBxNwjAMhhtC/SHwyfBezBzNo3C0rLSrmRf7Z/BErW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzTB4Fknnzg33IgwlKp/V7dvKn7CJsD7AUlNdnJ1hoM=;
 b=VSRqz/4bsDvgrwRZpzkqMn991PIgQoVhbrAACAPPpL1u5zZfiiL76kUasdnnqF4PfKQs3sVngFf7qAwcgEFPTzHpo5AzpXNd4NMmSSkPgpZTCjj2D5AX2elr4xu+OlXW0PDvpYsdDPcc7e1czL96LzJSFk73IVFvfDMAhba0Xw78kWhhD9sM5YPQVXqWrfjiJLsqObAVispHxXMWcYWgDif+zkNQkwlNsnnJIt6pBgizO3/Yka2x51PxkAw9L+C1sXfF2p5tOi4R/8LW1zN/YfbWrfAGroTf5R+HRUX/pSZJYVKhvxv3KitFKWekP5G1ma32ZypO+p39qsgYbRn1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzTB4Fknnzg33IgwlKp/V7dvKn7CJsD7AUlNdnJ1hoM=;
 b=pJR4seV7/hX7nXRlxJZFpsYQNV+NcqYjQXlVxdDyRdNGcQ5LVwtt1ubuwx+PKXP22Aipw9RjjBywsMNYPlOjwASmYHXWevHuDYXT4ZZ639kP8GT3fwYPr6S94Nw2Xym+ArBLDEshSyVIRnWdEhQwj+TU8vS1wlo0GYbtShP+fLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 20:19:09 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 20:19:09 +0000
Message-ID: <2f83026e-6ea5-4a50-9029-841e07934aac@amd.com>
Date: Mon, 7 Apr 2025 15:19:05 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v3 7/7] x86/resctrl: Introduce interface to modify
 io_alloc Capacity Bit Masks
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 jpoimboe@kernel.org, daniel.sneddon@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, seanjc@google.com, xin3.li@intel.com,
 ebiggers@google.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 tan.shaopeng@fujitsu.com, james.morse@arm.com, tony.luck@intel.com,
 peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1738272037.git.babu.moger@amd.com>
 <74b65f562c4d61d24cb2be53fb05ee1ca436d59e.1738272037.git.babu.moger@amd.com>
 <906f3a02-3acc-47c0-9bdb-8a9135160c4a@intel.com>
Content-Language: en-US
In-Reply-To: <906f3a02-3acc-47c0-9bdb-8a9135160c4a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:806:d1::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c156b4-c02d-4e09-cb54-08dd76117443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3RZOWREMDlXaFBzdGdxMVpnQzJobStxSGUzQjYxT3psZHBFOUczNWpZZXhW?=
 =?utf-8?B?ckNUNFp0ZjJuVlp6aUNFRGF3SUdRZTBxWVVEL3RSVzNKMUlidHpKTm53Uk1E?=
 =?utf-8?B?c2g0d1owcS9hNStXUVNNQzVNR25iYTNWTUVXc0w4dkRWSDlOcWZxMFF3bnQx?=
 =?utf-8?B?RWgvRnVMRy9oeDA3YmltTHFCMEdXN2gxMm1hU3krREJKb1J6MGY0VGx1S1dD?=
 =?utf-8?B?blpxdGFQSXNWNmt6bEo3Z0xiTkxreTRBTkhXcG8vbzA1N0NIdzg3TzZVK01Q?=
 =?utf-8?B?VHlXUDRrNm5kS0dPWXEvdDFsT1QxQ1AxNzVvNHBqaCthQ0FmYkk3VzBORXZk?=
 =?utf-8?B?QVBrV1FnYlVtdzdobXpGVC8vYzFkUEgyUW03VDQxNkljeUlEUlFUMXBZL1R5?=
 =?utf-8?B?ZG9Zc0ZqODlZTVhuYmdZUEZ0QjVDWjl3bzFiQ1EwWHQ0YmFwYm5EVC9CTzRG?=
 =?utf-8?B?d2xYc3Rvc0RiZXFPTG00S1Vwd3B0MW1xdFB0SjVvRWFUcHdWTXRVZW93c3V2?=
 =?utf-8?B?YytkQmNveTNCOGJlRFFGQmh2YVpiNzluZ0cwL3dqeDBDRkZ1bmtveGIvS083?=
 =?utf-8?B?QjZvVUtWNWJ3MGxwWXVQUCtMbjNmeWlZTEthV0Jrc3RFanJqSUl4c0lFdWtt?=
 =?utf-8?B?MmRyc1UwZzB4KzZ4dFlSY3pOejAxcDJ0QjRDZWlnV3p0VzBzejhnbnJweHNE?=
 =?utf-8?B?blRvQmdlZkgybmIzWnBKb21tNVJidXp5YWo1T0YzUkV0a1ZlYkdUYnJYbXNF?=
 =?utf-8?B?QXFuWHFBb3owWXlWOEl5TFArVUVLODNOcU9nYnRDQ2NQc3NicHBXZHBmZ2ho?=
 =?utf-8?B?OEtUSVJ1RkY2cml6RGJGVXlydjNKbU8reFNQaVBxUzk2NytybndMVXN3OHJO?=
 =?utf-8?B?VG1TTVpqN0JUY0lJeVNWQ1ZvdW52SGdGOVRvQ3pqK1B5OGVMRjkway94alZC?=
 =?utf-8?B?T1Z2UFZsb2I5UHBsZGxCYS9jZVRRWDUzaFNWQloxUFB0TjJrOHg4MFQrUVVn?=
 =?utf-8?B?R0pwQi9ueEhiMlo5L0tjNG9Mczk3a3JiVmtyNW1oWHFlNTV6UVZJbHo4MWZs?=
 =?utf-8?B?L3VFMDhNRmEyOElNRDNMQ3BrZDlKRmdvcExGZmVNT2pLakhmK3BPWlJqK3RY?=
 =?utf-8?B?ckt0UGpSZG1DZnV1SUZ2a0lka3J2ZUY5SDVKUzZ0N3J4ampQQlVUTElLc2Vq?=
 =?utf-8?B?OTlNbldVL2xWb2JEUkZFbkc0MXFObjB1d09Fa0hxNXU4dmxWT3puQVJqak1z?=
 =?utf-8?B?R0NyS2FmS1REaVJEQ1UybGtWS29tWmVocU90U1EvWS9PaTZ6NEhMWE1hbXhY?=
 =?utf-8?B?V2RobE9SNnZaQml5V0ZXeXhzYlZxY2JyRmQ0V1pWNWR5dFZnSU9lWVB1U3BM?=
 =?utf-8?B?ZXl6UG1FcDdkZFJDZjFITVhUS25rUCtuaHRVVm10WUd1OGlWVlZBR3pSSHcw?=
 =?utf-8?B?cVpNbTA1bUhmQmhaUUs0b2IyMHc1eFUybHBINkNxNmdhSzhvQ3gzWUMycUk0?=
 =?utf-8?B?SzR6UDZHdlZ2Q3BpK0tvRUVrRkNQa0hFUVh0cEtnYldKc3I0eVZmMFVSOFBV?=
 =?utf-8?B?QmNaTGcvSC9lMFFMSU1kRGlFcFkwWlFnczdJY2RmUUs1eTlZU0dsaWZrN2k2?=
 =?utf-8?B?aGlpNk5Gc1VNNjZ2aENXaHNrQXhFditlSjBrakhKeVJNd3VYSW9iU1k0SnRn?=
 =?utf-8?B?YkcyUVVZRkhMaDh3UGhOUFFLODUvdWJxeER2VFlzZUVnQ1R6WkRSc2dIT0tL?=
 =?utf-8?B?TWdrRGwzVXZ6UzN2QzA0ZSsxTHg5KzVJT1czUGRDMWdxSDFtRVJJNVFTdUQw?=
 =?utf-8?B?cG1QekJhNG9HbXgyM0VySFVoM0RWSktLQW9MdEx2c1pFNkhuMnE0SlhQbEZ1?=
 =?utf-8?Q?BnWo4ghV4nidC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZ5YWNrSVc5Z296cTc2VG5jZko4YUYvekVaNWVTMXVkNXg4MjNtK004Ly9r?=
 =?utf-8?B?NUN4MTh2MENOaEd4VUcrd01pa2JwcHNiMzN6Y1YydE5DWFZiYzkxS1pQa0dI?=
 =?utf-8?B?YnNiRFpHV0tibnY0Z2VBSnREUEc2RG5BamZMaTVNelBpQ1BaSUZDemoyK0c0?=
 =?utf-8?B?dThQRy8xRU5tWGY5KzZ4UUs4NkthYmJ4WVFoS0U1cEdLems4dDltNzVqWmN5?=
 =?utf-8?B?TVZiNXFvUnMxVGZIYVVPaUk5b2VkMWhOcjQwNnhKL3d1ckpsYXFhYkZPRW9B?=
 =?utf-8?B?Z2VUMW9TcU5FeDJZSWRlSllnLzk4Z3J3SllPT2JZY0NWMmp2cFhoMU5sNUtQ?=
 =?utf-8?B?ZHM0SHJmakZ0RVVoSVhId1k0QTlGbFBqYVl1L0UwSmZQZWJiMDRWOUIySkF2?=
 =?utf-8?B?a0w0QkY1N2pndkJLN2U0b2Zlc3hoWStKbmhvekNpZm00Z05qeWxSMkN2OURx?=
 =?utf-8?B?Y0NhMUVCdVRidzRWdnEvUWNqZ1I0VEtaaFFhSlRvZ1dValpxaExSR2paM29j?=
 =?utf-8?B?ZWpoaDkxTEk2aTZVQWV5WklBMFVKb21ncVBHdFNrN2VHQ1diR0o2OFpWT1pX?=
 =?utf-8?B?dG5CMGdUZFA3eUlxcUdrYVhMc3B6TEp4VzBDMlNqMHR1WVRwWHU0WFJpdG5G?=
 =?utf-8?B?YjJOamdDQTA5dEh1WXhSRDBsSC9FYWt6bks1amdUYk1tWHhpdG1JN0paU1NF?=
 =?utf-8?B?ZUxKdFZJT04xU2RzSUdDZGltT1kyZWFuL29oTCtySU15d1M4bllRQThtU3pU?=
 =?utf-8?B?bEtRR01FRHdhTXY0SlFCb0g1WU9ub3dBVFd4QUFQN0lmbU9DRk9jVW9hWmt4?=
 =?utf-8?B?NmhrZGRSQVV2MU9mWjcxMDdCUllyaVM5ZTBva04vWkd6dkorVDIrZDJ2TkUz?=
 =?utf-8?B?cm9yU25JVkoySlVqS2E5WXRzVnhkd1hEUHR5TUc0K1Q2RDRvRDAvQkplZlh1?=
 =?utf-8?B?TWUvKzlLbEFzemQrcXBKVVFOZEw5OU1NR2ZFSE4va1pnaXQ0ZjVJYlFlT2tR?=
 =?utf-8?B?b29UZGhKMDdOV2kxbG1INjZtTXlnaCtwRHl0VG05cElVR3dBS2g4NncxU2t6?=
 =?utf-8?B?a2ZzbjVjeVd4QWtKczVpMVRSU2Y3dGVyR3ZpY0JncDBSSmxNT0ptdlpXZk1J?=
 =?utf-8?B?MXlTN1I5SmZEdzBoNXhoTzB1OStrMWxxNEp4cEdtQnhCK2lXVDNyVis5SWs2?=
 =?utf-8?B?eTdTbVBnZm9wbTZrNHVEMzA3cFJkTHl0d1JhM25XS1Z5cXgrcHM3akN6Qjdi?=
 =?utf-8?B?Vmk2ekhVVDRPZ0xjczVkdEErWnhpOENTRXhmeENnejI1Vlc4b0h0QnhmTGVp?=
 =?utf-8?B?OWpsUjVjSnhRRStLdXd1THlQWm5KYUw4Z0FXNUdBQzRNc1l3dmZCdmtjbjUx?=
 =?utf-8?B?azltUHRYNjI3aE9MdGtmbE1FbElCekk0anRGU3ZzYkc1VGsweWg3d2lvenRK?=
 =?utf-8?B?N1NGVlkvQ3dYK3hYOCt0NHFGTURXWWtzUHg1dmlUeDNzaGtPSTlqbDhrZXp2?=
 =?utf-8?B?a3J4TnVkcU9VQS9NdFBlNEFYZllYMTRJbkZFcXhUcUMrQnRZSkR1OHJmeklY?=
 =?utf-8?B?MnZZdFY1NXlOVDBOMjZXWkhvaWRUNUhXM3JVV0plSDFiS2I3WTc2OTlOVlRs?=
 =?utf-8?B?NUpod3N4YmhESUh0NVpqZHkvdTRoQXhDT2pGem5XSkZDbHgySnRmRzlIcFFL?=
 =?utf-8?B?M0pHSTZacE5zUnlNN016MVZtV2k3d2F2d2N0NUNHaUN0aWpwOXgrRmlWb1h0?=
 =?utf-8?B?WHRocGZaaEFtcmhPMGNoNVFvMit3a1JEeGlaRCtpRXQvZUw1R2Z4U0tISTRL?=
 =?utf-8?B?WFlJelFhbzFSRUhJeGp2MnVadk8yR01yQWFBNHA2WGJSb2Rjb1JaUncwWDF6?=
 =?utf-8?B?K2x5WGNseW9nbkMxRHdhUE5XRTVxR3g4WUhxeGFZUUpMSVdvektmdGNRNEhE?=
 =?utf-8?B?MmRXdGRML3FJM1Nld3hENjRxZXFuc2VwKzdjUkFuOUNPYjlVVk1nRlJZYkNJ?=
 =?utf-8?B?eDBRZjJsTTZoemw1L3FUWFd6UWdYZ0dMaEllMjNxT2MxUUQybDh0UExwVHM5?=
 =?utf-8?B?eFlnWWRHdGhFcmxlcDdQYnkvUS9LbWdWLzE1bTV0T1FneGtuYnV6OTlTWWE0?=
 =?utf-8?Q?GlGk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c156b4-c02d-4e09-cb54-08dd76117443
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:19:09.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrkaDAs7+eSXPHMlc71Elv4Qj212zRfB+AcSVT0LBuUM/pZJTdH4PoNSiwTHI46l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687

Hi Reinette,

On 3/21/25 18:00, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/30/25 1:20 PM, Babu Moger wrote:
>> "io_alloc" feature is a mechanism that enables direct insertion of data
>> from I/O devices into the L3 cache. By directly caching data from I/O
>> devices rather than first storing the I/O data in DRAM, it reduces the
>> demands on DRAM bandwidth and reduces latency to the processor consuming
>> the I/O data.
>>
>> io_alloc feature uses the highest CLOSID to route the traffic from I/O
>> devices. Provide the interface to modify io_alloc CBMs (Capacity Bit Mask)
>> when feature is enabled.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
>>     and resctrl_io_alloc_closid_get().
>>     Taken care of handling the CBM update when CDP is enabled.
>>     Updated the commit log to make it generic.
>>
>> v2: Added more generic text in documentation.
>> ---
>>  Documentation/arch/x86/resctrl.rst        |  12 ++
>>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |   2 +-
>>  arch/x86/kernel/cpu/resctrl/internal.h    |   1 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 134 +++++++++++++++++++++-
>>  4 files changed, 147 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 1b67e31d626c..29c8851bcc7f 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -169,6 +169,18 @@ related to allocation:
>>  		When CDP is enabled, io_alloc routes I/O traffic using the highest
>>  		CLOSID allocated for the instruction cache.
>>  
>> +"io_alloc_cbm":
>> +		Capacity Bit Masks (CBMs) available to supported IO devices which
>> +		can directly insert cache lines in L3 which can help to reduce the
>> +		latency. CBM can be configured by writing to the interface in the
>> +		following format::
>> +
>> +			L3:<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
> 
> This format is dependent on the resource name (not always L3).

Yes. Will remove "L3:"

> 
>> +
>> +		When CDP is enabled, L3 control is divided into two separate resources:
>> +		L3CODE and L3DATA. However, the CBM can only be updated on the L3CODE
>> +		resource.
>> +
>>  Memory bandwidth(MB) subdirectory contains the following files
>>  with respect to allocation:
>>  
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index d272dea43924..4dfee0436c1c 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -102,7 +102,7 @@ int parse_bw(struct rdt_parse_data *data, struct resctrl_schema *s,
>>   * requires at least two bits set.
>>   * AMD allows non-contiguous bitmasks.
>>   */
>> -static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
>> +bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
>>  {
>>  	unsigned long first_bit, zero_bit, val;
>>  	unsigned int cbm_len = r->cache.cbm_len;
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 07cf8409174d..702f6926bbdf 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -669,4 +669,5 @@ void rdt_staged_configs_clear(void);
>>  bool closid_allocated(unsigned int closid);
>>  int resctrl_find_cleanest_closid(void);
>>  void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
>> +bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r);
>>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 81b9d8c5dabf..9997cbfc1c19 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1999,6 +1999,137 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
>>  	return ret;
>>  }
>>  
>> +/*
>> + * Read the CBM and check the validity. Make sure CBM is not shared
>> + * with any other exclusive resctrl groups.
>> + */
>> +static int resctrl_io_alloc_parse_cbm(char *buf, struct resctrl_schema *s,
>> +				      struct rdt_ctrl_domain *d)
>> +{
>> +	struct resctrl_staged_config *cfg;
>> +	struct rdt_resource *r = s->res;
>> +	u32 io_alloc_closid;
>> +	u32 cbm_val;
>> +
>> +	cfg = &d->staged_config[s->conf_type];
>> +	if (cfg->have_new_ctrl) {
>> +		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!cbm_validate(buf, &cbm_val, r))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The CBM may not overlap with other exclusive group.
>> +	 */
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
>> +	if (rdtgroup_cbm_overlaps(s, d, cbm_val, io_alloc_closid, true)) {
>> +		rdt_last_cmd_puts("Overlaps with exclusive group\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	cfg->new_ctrl = cbm_val;
>> +	cfg->have_new_ctrl = true;
>> +
>> +	return 0;
>> +}
> 
> Could you please reduce amount of duplication with parse_cbm()?

parse_cbm() needs rdtgrp to read 'mode' and 'closid' which is passed in
rdt_parse_data.


We can call parse_cbm directly if we add 'mode' and closid in
rdt_parse_data.  Will add those changes in next revision.


> 
> (for rest of patch, please check that related comments from previous patches
> are addressed here also)

Sure. Will do.

> 
> Reinette
> 

-- 
Thanks
Babu Moger
