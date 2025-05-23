Received: from YQZPR01CU011.outbound.protection.outlook.com (mail-canadaeastazon11020127.outbound.protection.outlook.com [52.101.191.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447751C3306
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.191.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030806; cv=fail; b=Re3k3o7OvKHp4/S2gwgV67aalDrhhyTO+Qm02BBfDxlFEAmPpoDWc5U56+ghEWQDaHuIk6DUMk9HnfYTEJlyzuUNG378xNdHRy4KqxgesJUirP7Y8rfFR8Hwdox1u4wDwwLRwWWZgnDWnM9JBTCQBwEW3BXOjZXVPnJkt01WTbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030806; c=relaxed/simple;
	bh=aNjITffOwphCEMTCqXRdHcwRyLocWtAB5cvUFePoyy0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O3GUHVQOW+GdaocnP6XURD8x9QKrOgPIeNGmTdhaOSCKc6WLQAeUupXxCf4XvxFzcjOJK2BrcRZcYFAH25zosbJiWc3LdVSBqAAsSMlB6Ohz2qyWvxGXmumOdJojApCGuwnMx84i9EgchsB6E+ooWpKwzehZ42nvDqG+yUm2KX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=GvEVI2KU; arc=fail smtp.client-ip=52.101.191.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="GvEVI2KU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOZ1pxO3kKZUrHJoWJm5Ls1hPjjLNukpANlTm5a0h7RRNVKRRiq//rA2/XoTdtuC2bMVf0fhoWkJ9VzXqnsDfAo44tDqqJd9P+Kg6asxvDcowbrC6kUUyKS/DPCrUySgqS4FprpUZ4buB7/za+WKJjq2YC8qccn+GYuPc536EVa6vol7+dpK1QtT/hk2lETd+XWxNV7gqpIe9zM5jwgXtW8gZDxMishoXKCSwYxtuO9oZJVHT13GjDC6kqzl1s3LbDLsuE3S2NshjO6IxEZZUT3CqXsRGDF8cUmKuXlC51E43cZUAurOmmmC/k7ZHey2MZgZ0Hs2SoPznZx3NoTQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKC/RyKnKkhuKvdy5aG00huYR/beanX9v/eLRwDvMsQ=;
 b=rS1t1EI6MK3x41FcrdS9anY+Kd5LtlMD94wDnFg5/wS2v7A0aZA1iVfbc4vPNw8ZCJC8poRMkIJUOf7joV66N/qGtF4u8F8H+c1HDnrz35XZfrPcNbiGgxJkvx0H5zKeKgMw5F1iqI8l00jexCG1BLhgZ4psFz8YI2fsZUDz655XlCfihCpus5GDw7ea6a4ack44CHixRnwdS5X0NghPzmcV0oniAebW6d5dkyyLEYAKDbiY02sHFWWTjr++RGT/s7kYsumKPDWlc4x/cIP0nX1G1FMjfZecUJjNNyEWVDl+TlqKNVbCJQCN/10R9I2yIuLseDJn/EPUjcQ2xXsoZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKC/RyKnKkhuKvdy5aG00huYR/beanX9v/eLRwDvMsQ=;
 b=GvEVI2KU8YVrS7S+c33eBIionvtI3QRdqXuiuh6LtwA1BQ8yg5GdsEg2QNqvWUIx5qDosCwO+PK4xnhLwOJSgrk0gF05RkTLN3xEbkD1thKD2y6g6NMEuk9LlugHeS/+NBVc7C5az06/yQSvQSV8LhlY3qaajy4gXhsCgLwVeablTEvTWkRoT9EKOXRKuHUge/LHN7UPYdcMUWUxmBUwGKZiCbqBdyShwNHoPdDNeIKi/EahrIodtXf5KakkG4vQMNszsgLZLDjrpoxi8orb735P8FTTE+yxb4RkTmFua9W5cqPcke0mS++k9XVg045uuOeiKxoNG1VLZpkXsseLVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PR01MB6159.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:5b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Fri, 23 May
 2025 20:06:40 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 20:06:40 +0000
Message-ID: <e7e5acae-f372-45f9-aa7d-c4126ea4be1a@efficios.com>
Date: Fri, 23 May 2025 16:06:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, tglx@linutronix.de,
 bigeasy@linutronix.de, kprateek.nayak@amd.com
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-2-prakash.sangappa@oracle.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250513214554.4160454-2-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0282.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::18) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PR01MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 682327c6-aa62-44f9-e15e-08dd9a3554bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1N0aXFDZmYxanM5cGFFWThhOThFclR3Q2RuN1JIQ0VpMTdvYUZ4QjFXTDBa?=
 =?utf-8?B?bERsQ3NEeTBhb21VQXNtUmMya0ppbkcvc1k0em9uYUtSekVHVXpQYVR5djdS?=
 =?utf-8?B?RWc4LzBOR3NleWhhSU14Y2p3c05OZlpKQ1pWcVI5b2xXMXpzanJhbHFPR0NZ?=
 =?utf-8?B?dVkyV2p6TGkyQjVZQXd5SHdhNmxvT0NCTThEc3ZkaFVwZWQwa2tyZ2hYL2o5?=
 =?utf-8?B?YTRIaWV5ekNNeHNHL0hVbHh3dXllR0JkRGtEY2pob3ZGL3FrVVNyYjd0MFBG?=
 =?utf-8?B?NG44MXE2TUxtS21xallYSUJQSE1RenNUQnhnL3ZFckNjTlFZdU9JWGh3cnFL?=
 =?utf-8?B?dWxHa3BRZ3ZMYThDaVVQcG10MEtpd1FFNWpFYURlVGZpYnBxQmlQRlM1Uk56?=
 =?utf-8?B?MnVra0UrR2lJWFVoT1hNT2s1ekl4MFlEZWdIZ0RPVnNXaWJWRUdQd3dOTVNQ?=
 =?utf-8?B?bHF3OUd0eW92VE8yOTRRNTBDaGp0ZHZpK25ISlRZZXhwc1RMd1NwQTI0cUk3?=
 =?utf-8?B?RnRSaEhKekllWjBRYVlqNUQzeEFJSEdBNGZxVXJseFozZ2NzWmpTVmREcXlj?=
 =?utf-8?B?UUQwVjdIeUx4Qk1nSUMvSXlhc1V2LzIwajNMQWRwSUgza2NYVDhsV1VJM013?=
 =?utf-8?B?eGFpRS9nSkZxUE1aZWh2ZWJLRFRsVzdlMWFKdFd2c2RkRExHUXYvTTE4UWx2?=
 =?utf-8?B?cWZsQkdTY21mZ2lqSy9OKytZQmNOUFcrcjM3Q3FMQmF6UHlZMCtEbXpqb2tT?=
 =?utf-8?B?NnR3U2xEcnp3KzNrOFVWNlorRFVrMmdsYk5idHpkeURkTWw5ZUpUWGdvTEo2?=
 =?utf-8?B?dEo0aTZNei96TDRoeWI2SldWRHBXQ0ZqTUhPYnVLd295L1FIUVQ3QlRsS2RK?=
 =?utf-8?B?c3lzai9MbUZZeWtKeDg3U2tFcGErT3RocDF5Y1h6bGdiZHpycFQvdTI5bFFX?=
 =?utf-8?B?Szc4R3k3WWs1a2R2YS9Pb0pTVUJXbDZ4cmQweVM2TG1RNVpkdHNhSnQ0cnBR?=
 =?utf-8?B?ZTFjTmlHNmpHdCsyNWpHZ0Z1ZVQvV1FhazdQd0Vxc3pUTmZLNmtkRmFReDZP?=
 =?utf-8?B?SEpORkRJLzhZQ0Y5YzFRVzlJZGdVU0tUUHM3UWMvdnZkNjExS0Nvb1ZhTS8v?=
 =?utf-8?B?eDlUN3RVblNXNCtlNG5UQlA4L2NMNkE4QmlhR0xDVmFnaE1GUUcrVjZvR2Vo?=
 =?utf-8?B?VGY1U2d4QTd0cHIwUHF1K2w2K0EycXJRZW9yMk9TN3A2ek45QzNCSlFuZzg2?=
 =?utf-8?B?YnVjT0FKT2orYkh4b2w3UjNGUVphakJzWEt3cjJ6eTlHTUU5UVhtT3lGMWc0?=
 =?utf-8?B?Tk5FVTlmMDJHRXV1WWNUTHJFMENVcExIdzU1S2RKTVJXNzhQYkt4aWZVS2do?=
 =?utf-8?B?OTRqbkNtRzBZRlhKWDAxSGdadE1CeWk4azVaM2w1SlNQUFdoa25QN3RoOVhs?=
 =?utf-8?B?emprc2lIRkR0ZUdZc0xJTmRJblpHaVFNM3A3bFpJTktkOTUzb09odTk4RFQv?=
 =?utf-8?B?SkVkTkJSVEI4VEtjakNqeXVLOW9YZ0FpUFBrVUdGOGpSUTRmOEd5dGY2SzBH?=
 =?utf-8?B?amJmaDc0TkJrdlE2M2ROaytqQTMzZEhVWXhPV2hPOUpoZlNGWXFublg5bXNz?=
 =?utf-8?B?RDB6LzcrVTdMS3pIbXZsd2pRK05nb21OdEQ4cTFVYkhaaXhmMG5nR2JLbjRC?=
 =?utf-8?B?dnJOZFg3T0lycWxoekVIYVZSNEpLQXpXakdIWm1RUURWVVU3UzRXd2xpZFd5?=
 =?utf-8?B?eTdkNWY0VzFPT0djOXNJMlpoeHVYdWt2eHYwa2t0SGJmZlM1OExsVllNWC9l?=
 =?utf-8?Q?uzv9ajR50l46Hqc4xOe0mvmTuhXL4J+9TXtmw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGlqQmZLcnkzRld4VGRUNzFUalN3dHp0WVF5N1hkSTJ5M0lnalE0RFBVTkpJ?=
 =?utf-8?B?U3BtbkxmVmNISnhQUHNDUnJqS2V3eGNqdWRtVVFiNWprUnhkNkJjZS9qSXk4?=
 =?utf-8?B?cElkeSszREFSUHVldWxKUlI3QnFIYTNyYU04cEJnZUJEMSs3Q09HaG5BMHRZ?=
 =?utf-8?B?RXYwWUlUVTZLdnZPbGJRY3N4S2ZjZnpvRHJGL2NESUFieFJFbEVURk5yVFRw?=
 =?utf-8?B?MWUzV09aVSt6YkZ2TUtRZEY4T3Z3VHkvU25MY1JrSlZFcWpWcXBKdHUwZ2s3?=
 =?utf-8?B?SWQrcWRoT0VwS3VpWklDYlVCdTJsY2kvZ0pxbGVLQzBhT3pCby9EaTUyVXdE?=
 =?utf-8?B?cHprUmw3cjlpSmFyZHg3dWZick9wSFlKRDRKSnJqd0NZbkVGbkIxUlAxUlU1?=
 =?utf-8?B?YllmejJibEsvWk16Rm1uY1dJVnJOclV6Rm1pazI0VXNQMFpzOWVua3g4d1JC?=
 =?utf-8?B?dVRIQ09TMUVMVkZ5cWtXUndUdkhLcHN6RW8yaWJ4MG8xdUZWNnFvYUtnOGNv?=
 =?utf-8?B?RDZQRE9nYWcyRjZKeSt4cGI0NU04bW1XUHdBajVuREhNYm1wYmo3NlZDRXFE?=
 =?utf-8?B?QXAzQU5ZbW5ndk1mL0U2VGZhczlPNE5QekpHZlMrekM3N3hDK2tGc0RCZGJD?=
 =?utf-8?B?bkM5STR0S0p0ekl2NmxtaDFmUjFhcXNMcmJtK0s3VFRHWVFHQlRjQkpER1lL?=
 =?utf-8?B?WldnN2Z6dmtiQ21YaWtEMjVBUTYwNmRsanVBUWhEM2NraXF0OEYzWTZkQXI1?=
 =?utf-8?B?UmRXaEhKUmptbFlTNnVlYm9HNWpyTGFjZjhWczBXT3J0Z1UyY0VlM0syd0Fx?=
 =?utf-8?B?d0dnOVhvclJ2ZlBhMEpBclNZV05odFlKaU5weE5STXpKcW1YQmlzYTkvaitL?=
 =?utf-8?B?TE9admtUaDd2SHFWRGRYb3hxaVB6YWM5WDN0cGh2WGVaY1VFNHlad0R0MytR?=
 =?utf-8?B?VE80VzZBQzRFTFIyWGhZc1h0TkZraUVXZUJobHZZVk5rem0xTE1GTGgrdDE2?=
 =?utf-8?B?dU01eGNXcmQ5R2FEQi9GZDdzV2dkamZpcWQ2bHlwUUxRdmsxNE5KcmJ0RE1a?=
 =?utf-8?B?a3FGU2JvdHR2Qy9XMXRzTVlQZG9UeEFlWWJRYTdnei9VR0IvbFhZazZlQmRz?=
 =?utf-8?B?T05EbGNiSC9lK252NDRGZUlNOFVaeGVPemViaVhOQzNDS2pRaGpteVRxaHdp?=
 =?utf-8?B?NnorUW1MNGkwRlcxdnRuVktjZElNUXU1dUhJUEZVOHhJaTIwUlJLMndWZnRk?=
 =?utf-8?B?S1ZVcGhpandmQWJWbmVTUkc1eGNXRHZhM3NGVUhLSnJ4U05EQzNTMVltSDdn?=
 =?utf-8?B?azJtU09KT0hndzJmRndNZWM3TEdya29Wd3lMbE0vSGhWK2xZK3BFWFlYZWtt?=
 =?utf-8?B?SS9VenU1Q3Z3dC9aTkZJQXltcWRyeldGRWY0OXVKU1g3UVFZV2ZWUnlBOWxn?=
 =?utf-8?B?N3FyNEJ0SW04Y0w5Tm9VRzVpbmFmL29xRnlkbjZDQjVaYXFpcWlxU0JwZjND?=
 =?utf-8?B?MHQvb3NnK1FHVGhPUXlpRzFGV2NhNGVqamZ0OGp4TGtlZDV4WXp0clpXTVJv?=
 =?utf-8?B?SkNNRUxDUW5Udmx2ZEg2ZkR3bzBKVjVJbWQraGM3RE5YOVBzalFreXpQR3Av?=
 =?utf-8?B?QzlIQ3ZFc0pRWkZwN0NCeXlpRlU3NW0xWDNZNllIeENzQjNBdDZwRDdJdGtp?=
 =?utf-8?B?RWxod3Y1dzlXYWtaOGRoeHZ1V0MzY1VEaDRQVEdRbXoyR1B1d2VQUy9OVlM5?=
 =?utf-8?B?aGRWQlFmOU9UL20ra00wRHRZRkp0UWQ3emg0dW04cGh1Y3drUmpWdkE0MGw3?=
 =?utf-8?B?NjRLQnJtdEFhR01jS3VxOUdBNFhYVXdjaGJtSDJHT1VXUmtEWVhsbDJ0aEhj?=
 =?utf-8?B?eDdYZzVUQzN1L2R4T0l1VTlmWDQrOGg4aElzWEVMTjJqOXVpUXR1SktqQyt4?=
 =?utf-8?B?endhb0wxWXNTaE5iS3FZR3k5Wkdmdk5IN3M0bWovTlpaWDNJY1VXTlQ5YzNx?=
 =?utf-8?B?UW55TUgwNEJoem9YcVRSN0MyQTFwVU5PeE5QN2JpS0crU1dTVytwSXZEM0o2?=
 =?utf-8?B?VVNNVzBmN3BjNkNxZ2dFSmVibkI5NlpzU0NuWERKK0VCRk4wM1ZEeUdnQlV1?=
 =?utf-8?B?ZXlhdzFaMkw1OS9tbjNqQ0crYmprdy9GSVo4akZzMWZZeGFKSmJ4aG1HYVBt?=
 =?utf-8?Q?o+EEOHoqo3m4D0hUy/IRpg0=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682327c6-aa62-44f9-e15e-08dd9a3554bc
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 20:06:40.3891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HHoNXEvVuDW47gfuVcMZ3KJMvml6o9HmvVrnRP/g2hChAglRTt/yF4LobN2A4RnJfHbzof0E10ft+NAVtbYn180jhlbH9i5N54xM+/tGpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB6159

On 2025-05-13 17:45, Prakash Sangappa wrote:
[...]
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index b7a1ec327e81..dba44ca9f624 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -448,6 +448,62 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)
>   	force_sigsegv(sig);
>   }
>   
> +bool rseq_delay_resched(void)
> +{
> +	struct task_struct *t = current;
> +	u32 flags;
> +
> +	if (!IS_ENABLED(CONFIG_SCHED_HRTICK))
> +		return false;
> +
> +	if (!t->rseq)
> +		return false;
> +
> +	if (t->sched_time_delay)
> +		return false;
> +
> +	if (copy_from_user_nofault(&flags, &t->rseq->flags, sizeof(flags)))
> +		return false;

This considers rseq->flags, but not rseq->rseq_cs->flags. Am I missing
something ?

Thanks,

Mathieu

> +
> +	if (!(flags & RSEQ_CS_FLAG_DELAY_RESCHED))
> +		return false;
> +
> +	flags &= ~RSEQ_CS_FLAG_DELAY_RESCHED;
> +	if (copy_to_user_nofault(&t->rseq->flags, &flags, sizeof(flags)))
> +		return false;
> +
> +	t->sched_time_delay = 1;
> +
> +	return true;
> +}
> +


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
