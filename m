Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F52C2356DE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331846; cv=fail; b=nC/fBGIBgV1VZxsrMfx4LIwm02PPMncA1sWF40Ssy3DRb3paqsa28aGoLZHdur/esw3pO8TonS78urDuw0zLXRIxy9hfvG+SzjQwLUbLdJOjUdcF14g3g3EkaX7BmafKi72CM8ig8pRlPznPuejkGXq5UxvGcDr9otgdsjjUNZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331846; c=relaxed/simple;
	bh=KITXj6JrtjHX6KTA8XPZ7IQ8ATMfc8yzTyq70du6OKg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V2rOMywoA/Q+9G5StHGCXmy20/0SwhecI8pprZvABAIPaawhbzbfjAx+Bloo9gqJRjZqZtliYsgiIl/YBSvrty8bZtcMTDv6x0b8y2G8ZKC9yHwG4M1jD9BRRDL6SNHEYDTcJ/qZi7UZsJGes0UvZA8J/q65KgDJn2qwnTc132Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aZq+2+BZ; arc=fail smtp.client-ip=40.107.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aZq+2+BZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqHKW6qeYd9akNOd3s86SoVwdf0Tg/w1X+l8hyWdVTL2TniopGdIuvnxzTvnooMnFds+Ic3nUjTwHeqJDUYLUcn9s0mYpmxNbpJCMu6XVatMDDoU5/FkQ9YnS6AZoUWYKkxm1Fczx6/IZbx4fJimBjMbkKn6ku/TcLTljrQGHWUYzjrzEtQzejQ7cPvee3Ll2J2aDa/KYSZ7MycGuJy0YAF1ITdMAnnkxXTf0mFbp4PFV4s5FDF7HNNAZclNZkCI6tUZwiwRvHIRmhGM/3gMXeO9TWsAmKljo8gF72cJ1t0JKst8DVnbq3ZZJ3rOioL0l8zprT8DZFfeArykukSz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc655n00LfOigRt730lMICp8H3af39oP2boZs7cnclk=;
 b=Afvph4NFhhcRsLafK7VcZi0fscaOIVxFscvesFb4JvdMXcTBJyBHnF9rFgFqFbP5CPb+sc+/w9INFb6hHbl7gVaAbaEp++XNkJAceeDc5piNvH/mo75v7fSeGgix+13ho1o+tos5J3OuYUn5C52RGlwjTHvnYNbRyRKxfVxIOstMUP2sYEGZdDSq87g1+dZJM7VeaDvsAH8WXG9PNFO05PvjTPFdaTE4ETrjFj9w/dHHzMjtMt1PyuLCmvJA5h7/hBHmwNEHq+LpIwH71CrLq0k4qU2+GWH9udOVJYcrFpGDvO/MW2z1pNQQnPmbnTUHAhD5Ug+YPg6uQj9b+w6ZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc655n00LfOigRt730lMICp8H3af39oP2boZs7cnclk=;
 b=aZq+2+BZLwSdRBz7GoxIpRys/+b2dHZZeWceAtQ9clwmj83oLgknFjiEWlTrjZEL++a7c2GVic0GdDvwRoaNIzDvxpp0WUgEJ7Oet0AiNlOW3qG2g++f0vSunZ5WswajmjfFy1M8hazoQGN9zkbagLV0xRqUQRQFTvhrSfyBJYB3nxo2POrfIThzrcgVDXA8Ya8UrbtM1jPJxmC700TffBDfBskEHrN2ABGyYQfoTh+mv3KqPTqpepU73QiMLiPGlTSncIHmjmjIs8Zppu/0Ap8vaBGeb5izdQuUx0aJJmA/Rcvgw2bI7197edVUD2zZ9ia3NvtfyvkE7q2ADGLyHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 MN0PR12MB5811.namprd12.prod.outlook.com (2603:10b6:208:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Tue, 22 Apr
 2025 14:23:57 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:23:57 +0000
Message-ID: <fd59c2fa-1259-4eb0-b0fb-96b823027dc8@nvidia.com>
Date: Tue, 22 Apr 2025 07:23:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 18/21] x86,fs/resctrl: Remove duplicated trace header
 files
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-19-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250411164229.23413-19-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0161.namprd03.prod.outlook.com
 (2603:10b6:a03:338::16) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|MN0PR12MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d543a5-8eca-4654-0ac6-08dd81a9513b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEpGL2hud2ozTGFFM0Z5cnAvRDdrQmNPM3k4VldDMjhUYXFUc0g2RitibXFn?=
 =?utf-8?B?dmRJQjRvUThVSkV3eEVUemowanREZ1VmOTRBcDV2TkJrRlhUNWgrZUg4dVZi?=
 =?utf-8?B?Q2haU254aVhBbGUzRHlTV0cvODJvY0s4Y2ZrVisyckVVRU8rL0F3aE9BcGxl?=
 =?utf-8?B?MWdlWldFRFB1MnFiSlRFWFo1a05Vakx4Wk5JYk1QUjl5cjZyNnRoKzZ3cHNh?=
 =?utf-8?B?OXFFbkVGd01DMmpKNkVVdUg2aitSalNpZ1Q1Z0F6RGh6Qm5UeHZnNDg0V2c1?=
 =?utf-8?B?Y3B6cVRBeHhQY29HdzZYY2RscDh2Nks5c0xoeWlTbG5mcUdCWnU5b1VUaXp0?=
 =?utf-8?B?bUdJNVRNQmh2cGkxZWFJS3ZLT0VUY2NlVUt0Y3l5OUtCUTJmTDNGalBuODBh?=
 =?utf-8?B?RHBZMFRMaldtUHR5WUlqMUVtR0Z3QktLaTIvclY0OExOWEtCU2VJeEdyRlNL?=
 =?utf-8?B?akxYaGpvUUF6L28xdGtXOHYrSkcrZGFvZUcyeGNjZlZRTDdORE43blNqdGNX?=
 =?utf-8?B?SW9oaU1ibFFsaHlHVElCME9UYWdzejVpaUhOaGU0MlhYb1RMWHBaQUltWjMy?=
 =?utf-8?B?ZytZT0dHZzRhSGxsNnB0bE9PMFVXWS9RT0tidFkyR2tlTTA5UkVoZGJPYUV6?=
 =?utf-8?B?eFEyc3ZsRUMrM2lNZHp2SXAvS1czclgzeUx4TXp5aExaK2NzV2xJR2lrOW80?=
 =?utf-8?B?U0RKMERUWEtXNm00NGhHbDhzZngvblEvWVIwSHh6ejFXbzNIV3NoNG5ldXZp?=
 =?utf-8?B?QVNQcVNWaGoxMWw1SDVKYzZJOVZiblEzSE5HSUlsM0NkeHQwcmhPRk45WFpP?=
 =?utf-8?B?WFBlUUE2TDBKNTdLeXpiMlcvV29rcExlc05YYmRZT1B4SFhXdndtNGY3Qy9W?=
 =?utf-8?B?Rk9MYi9WUHQwMllySmhheElkbllrRThKSStFMU5qdHp4bEY5MTRLcFJiK0VD?=
 =?utf-8?B?ejNOVnM5eTRIZXhmMzNySnpJUmliVGFRaWlrbHRkS25qWUdGWTI5SlptcVlL?=
 =?utf-8?B?cS9McDdSZThIV3ppMEd2WVgwU3NGWkVYT3BRbDg2ZVJDaXJ3cU9sQVVtUXVa?=
 =?utf-8?B?eWYrS2xvbjl4bTZoL25keGgxbUszcU45cmwxdlNTcHlMY2Rhak93TUwxVHF5?=
 =?utf-8?B?cEdIYTQwV0JHbkNYeS9YUDhwZnpuMEVyMEVNYnFjOFpURlNGSlQxNVVSVTBR?=
 =?utf-8?B?NUE5cjRHUzdJK1dhdHdDRkR3dTJTR0laT3o2Q3J3RUVCbkIxSXIrblp0SFYv?=
 =?utf-8?B?U0F4TTVJdmZUNjQ5cTZOTE9GbDU3dG5VTzNsRVZtdXhaN2dHWTlnYnU4U1V0?=
 =?utf-8?B?SDdmNG9QaVh0eTNmbnd0aWgySFV6VWcrRWlQMmY3Mi9nclloK2xkYjQxdEhL?=
 =?utf-8?B?dzVNMk9Ic25waFpMb3ZhZjNobktWbHVuTkFwRWNXVDFaYUJLOUlnOVRKSFlk?=
 =?utf-8?B?NkNiVG5HajVRQ3YrVGo1RzFmQkFyWEF5QzVJakpGSVMycWVlSk1WOGpyaXFT?=
 =?utf-8?B?REZNUmhMRDNzQ1F5VUlFd3hLVTBQNi85bHU0bjB0UGpCYmROUzAvNHBGY1Yy?=
 =?utf-8?B?L1crWlhtS2xnUUhSa3h3YXVNVU5BYiswWEdmaEYyeWhkdW1RRHF6UVlGNXRM?=
 =?utf-8?B?TmdBejVqQ3BDQlhLUm41Qm1HTFVaUlBiQU5Dai9nK3VqS0J6MXB3NmFtK2pi?=
 =?utf-8?B?U09yWThzQ1NPTGJwbnB1QkRWQzNVVkgrVlNOWkdVb3JMckUzajB5Z0pxMHQr?=
 =?utf-8?B?MkVKTThobXpRSXBTUXpVMWlqeVZxQkJkZFFNMjA3QmE3ZWE5N2gySUJEY0gw?=
 =?utf-8?B?eWV2NS9ZZzd4dTUvMUVCRVdpZlo4eXBXelBweGZrWEtvelVNYnFYekJRNy9F?=
 =?utf-8?B?RmkyUWhXU0s4UWdyYkFKQ3V6QUdjc0dLNDhFYndqY2R5VWx4Mi9hL2pGeXc3?=
 =?utf-8?Q?xEO7kyNBdBg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWY4ZTEzOU1HT3ROMklVSXRIS1JMdjN2YnFHUjhtWXFkdGF4QlI3VFZJMjVl?=
 =?utf-8?B?NlB5RC9xSHJrR0pLU0dIN2YzWWVOV1VXaXo5aGRKblljcTJQUlRXRThzQkQ0?=
 =?utf-8?B?V1lXdUdwTHBmM0xKOTN3a2hLWnpZZkRPOFI1TmN0SXlvK1MwTGhvRERHby9N?=
 =?utf-8?B?Z00zbWE4YWkrZnRvdVlabHF4U2xabmtINXY0NXE1OFh0R3VGK25yOUkrYUZD?=
 =?utf-8?B?VTJmcXVlQWhlQmc5c244dGVqQnFaRUVGZDJRNHZ4bTNmdU5TaVIrbWExdm5q?=
 =?utf-8?B?Rmxxbk5HK0J1NmhocnFoUHBnd29mVlJWc2p3K0xWU3NSUCtXa05sMW9NaVE4?=
 =?utf-8?B?RUkxN3ovRXhybHhibTh0dmhlM0Zaa1JqTmtLRkRkeUFZTHM5WXo4WXMwWUNC?=
 =?utf-8?B?eGdDb0grMitmcy9NMVBPbllOWDBiVEJLNE1nbUxEZlg4M3pvUWRjUUk1Q1Y5?=
 =?utf-8?B?RWdKRDN5b1M0Z3oyc1BDRVFNekR0WTQ4aUlkUWwxUi9qbFgwbzkwUDI4VXBi?=
 =?utf-8?B?T0pFN0hVM2VNVHpmeWZhRVUvSWEya04zY3FrQzZrSEl4Qzh5ZWtiZktWU2xB?=
 =?utf-8?B?RzhwY2FBdG5LLzcwWStFb0xzOFlzYk93UXZWcWJ3eDVYQ25OaXpLWEdMR0xP?=
 =?utf-8?B?QzBGQ3BBVU1GTUkvbDZwc1RzZDg2QmxGWlJ4RjZVMGs0YkM0R3QxbzF6Sms0?=
 =?utf-8?B?UkRKQnBnVkJzSCs3WFlXeVliZUhHTVdHS0lBMW1xeVB5cXNDL2lrMjBudDF0?=
 =?utf-8?B?UHh0ZWlpLzZ3T0wwS2JWL25IcldKRktXK2xhUkFzYTRqWVE4MjRwa2w5Vldh?=
 =?utf-8?B?aFcvbTVaczJsNFU3OVo4WXpEbmFXTFRrcDNqV1hzZnZKNUVKdWdlNGRXbVIz?=
 =?utf-8?B?SCtlOFpWRVA0WlF4dUtNQW9oeTFLbEVWejZnQUxnK0JaeDJxaU1ncS92blN3?=
 =?utf-8?B?OHZHWjVmcFdONVM1a0dUekx3NHZ1STZBdjFWY2FzQXN2S1lWL0MzSUM3MWpt?=
 =?utf-8?B?cEZPVmV5UzNKdG1BRm8vQUhBWGFEUC8zTnpuYjVldFNwenV5Rjgxc2xBVWNE?=
 =?utf-8?B?ZDE5OWM5Qitlc1NVY2tPWm1laGxrc0hpdHlLZzZPaWc4OGtNZFFsWCsvQ1Uz?=
 =?utf-8?B?cCswMnZldmxqRzhzVGhTS2dsNGl0T25NK1ZxY3FOeFpHbDRGZlhZL1NMUHVK?=
 =?utf-8?B?RnBWK1V2a21rU0hGZ2k0MWEzOHkxM01LWVBPaXVCcVJzYXl1TFJjbG51NEtU?=
 =?utf-8?B?WHBid0cyRno1eEtXbUxHYldrNDFrZHl2dGRIUDRZSzBDR1ZzZVgvQkt6MHlx?=
 =?utf-8?B?SXA0R0s5TjBwV2NKTU9xeVN3YnhhRHg0Z09NM3MxcnUrNDRSRDhNVXo1TGV5?=
 =?utf-8?B?UFZTblZlZHBna0cwMWNLTkVRdExXcXh1cDRxbnRVNzdaUUx5N0lmQjAycXlR?=
 =?utf-8?B?WmVsVlFVQTNsWmkwc29GT0t0Y29tUi9idExWNHZyK0JXZzUvZzZhNThjR2pn?=
 =?utf-8?B?QTlxTnBEb1Zwb2R2WG5SYkwwb29qVnpEUDdzeU5QNzBLZTdZOEh0UWRUZzQ5?=
 =?utf-8?B?TWd3U2tXZUNKd0V2WkRqcXpBS2dXVkVCQ0pOUTV3eFNheVoyK0RQcnl0UFFB?=
 =?utf-8?B?K2RXdDI1eDNHYUxmTU9jNzBucGZtcFliZVBCMWdRK2JGREtBdFpYeVpmNnJE?=
 =?utf-8?B?UW5GQWh2aEtscE90eDFCZXNSNG1lMVVIV1N2Z0V4NTl6eU0zbjlSSXoyQzdn?=
 =?utf-8?B?eU9qS3Z0VlFFL0RmT1Fuc0xKOWFXcEUremlTMDlUZmhqK0J1bno5VjJhMCsr?=
 =?utf-8?B?Q1VLUWhWQ0grUEE2dTM4WmJJK2JLTE9sRUI0dGIvS1RrZnBNazZicERtY05q?=
 =?utf-8?B?Qy82UEFFTllydVcrY1cya1U0Y2NvM1cyUWppYTZXcnAwZnFEZkZmQlZ1WVVu?=
 =?utf-8?B?ZjZVTDhsTldDaEYxYXJMZGhtSDM0cXRjb1ZBWjhvY3FNSVN6eGQ0MC84Q1VD?=
 =?utf-8?B?ZWtyWGFEYkJwNDY5TGIrNW44eGFzTVM4cW93K3JiMHE3QlhEcFRaMGs3UExi?=
 =?utf-8?B?L3k4WW9UVWhMNFI0WWJuUlVKY0FJU25kcUU4T2wxbEhLREljMUtmK05mUU9M?=
 =?utf-8?Q?SghWeG5dir/PM1jtun+w/ggmL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d543a5-8eca-4654-0ac6-08dd81a9513b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:23:57.1302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieqdn2+STaxA0fvWwOd3ldh/EbilNQLF0w0P1tTlaoP5xtqsF9OWiV8d8XVoWFIBhLMxI0ufJA00uYYygwx+7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5811

Hi, James,

On 4/11/25 09:42, James Morse wrote:
> The copy-pasting python script harmlessly creates some empty trace
> point header files. Remove them.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> ---
>   arch/x86/kernel/cpu/resctrl/monitor.c       |  4 ----
>   arch/x86/kernel/cpu/resctrl/monitor_trace.h | 17 -----------------
>   fs/resctrl/pseudo_lock.c                    |  4 ----
>   fs/resctrl/pseudo_lock_trace.h              | 17 -----------------
>   4 files changed, 42 deletions(-)
>   delete mode 100644 arch/x86/kernel/cpu/resctrl/monitor_trace.h
>   delete mode 100644 fs/resctrl/pseudo_lock_trace.h
>
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 1809e3fe6ef3..800e52845b1d 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -27,10 +27,6 @@
>   
>   #include "internal.h"
>   
> -#define CREATE_TRACE_POINTS
> -
> -#include "monitor_trace.h"
> -
>   /*
>    * Global boolean for rdt_monitor which is true if any
>    * resource monitoring is enabled.
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor_trace.h b/arch/x86/kernel/cpu/resctrl/monitor_trace.h
> deleted file mode 100644
> index b5a142dd0f0e..000000000000
> --- a/arch/x86/kernel/cpu/resctrl/monitor_trace.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM resctrl
> -
> -#if !defined(_FS_RESCTRL_MONITOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _FS_RESCTRL_MONITOR_TRACE_H
> -
> -#include <linux/tracepoint.h>
> -
> -#endif /* _FS_RESCTRL_MONITOR_TRACE_H */
> -
> -#undef TRACE_INCLUDE_PATH
> -#define TRACE_INCLUDE_PATH .
> -
> -#define TRACE_INCLUDE_FILE monitor_trace
> -
> -#include <trace/define_trace.h>
> diff --git a/fs/resctrl/pseudo_lock.c b/fs/resctrl/pseudo_lock.c
> index 29682dd46871..7305b232384e 100644
> --- a/fs/resctrl/pseudo_lock.c
> +++ b/fs/resctrl/pseudo_lock.c
> @@ -30,10 +30,6 @@
>   #include "../../events/perf_event.h" /* For X86_CONFIG() */
>   #include "internal.h"
>   
> -#define CREATE_TRACE_POINTS
> -
> -#include "pseudo_lock_trace.h"
> -
>   /*
>    * Major number assigned to and shared by all devices exposing
>    * pseudo-locked regions.
> diff --git a/fs/resctrl/pseudo_lock_trace.h b/fs/resctrl/pseudo_lock_trace.h
> deleted file mode 100644
> index 7a6a1983953a..000000000000
> --- a/fs/resctrl/pseudo_lock_trace.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM resctrl
> -
> -#if !defined(_X86_RESCTRL_PSEUDO_LOCK_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _X86_RESCTRL_PSEUDO_LOCK_TRACE_H
> -
> -#include <linux/tracepoint.h>
> -
> -#endif /* _X86_RESCTRL_PSEUDO_LOCK_TRACE_H */
> -
> -#undef TRACE_INCLUDE_PATH
> -#define TRACE_INCLUDE_PATH .
> -
> -#define TRACE_INCLUDE_FILE pseudo_lock_trace
> -
> -#include <trace/define_trace.h>

Will patches 18-21 be merged into patch 17 eventually before they are 
pushed into upstream?

Thanks.

-Fenghua

