Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF44D8C1F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747271970; cv=fail; b=UXlmBRg+CPBqV6y1L4VHqN0mY5rkCe5/Jqn/xWB+gStnR5TVtAFg5ZzvHBicR9bngoRxFcVslnc6NjtvFzkWt38uqe7TzbZFcUWIxneJi9d4j3SpFopQTIjK5ToB8RGXFgZ4ZoUaEprPmasrKvqkfYpfFq6purR7woHqZ5bFdus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747271970; c=relaxed/simple;
	bh=miqzyIA03ls647kqlGVNz4QbCwli8H8pHa5mwpgNLxI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lkbt5eBjDlYowAOBKDVyE9fbo/BdZy9IK/zDj5M5QfUixO/WXfse3KMUUF1brq6gGzsiZ2MvQQnnaR1Wq19zU7tdMfv4mGv3HEq6ChfJBcoxmZ8Peu7+pG+1z8DloYPcrvt3IcbLH6c7eInWeJRzjoxI3/EcTP2ykYqJw1TNy2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mP9k+5tT; arc=fail smtp.client-ip=40.107.94.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mP9k+5tT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpeUrjrSD0509KZq4tufEiYKh60/RD42Y/K1Iuxm3XCEQB2bZINa3DTX/lp8KoTXj6w3eCQSlWU6Y+V75iUsTsHCRQCVJgb3U3TM36akw45zjmngxQVedpoMhLImjHd1i2hMADNIo//gphS72IkaOkrnAnDuDVYtfdRRBxmzD/ibOhQbYBk5J1HRIN9v71Krfi6t7GUtRn19vERvIYmn6zY3YMNXmi2djKTzLvNVdCL0Hv18p/xsjweRktwcyFiyTFXM80aixD7SjgSXi4Dibf+0es0y3/NoMrycJPi3s/4S91T3DpG2yMfb9zoxmLDYTFs7NLDdcV3m8vhyevnnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miqzyIA03ls647kqlGVNz4QbCwli8H8pHa5mwpgNLxI=;
 b=jGfA/K8PFOsQF1549lPkicv8aY65B2NFxSIDJtGfy6Z0I8MJVWBEU/+8Gz263FmdMfS9F/h2QEM3dXNKZ9lDj+y5rzAHe7yQkZAZgP/SfZDsoPk8OGv79oe2KVkOIDC2Z+UzZhQBpVmmTxRaWYXF1n5lgrp1IvA82Mg8GkIsq1DsQVJKbzxKUa4kYAcv+vCMGeJMSo1YNuiCSbPLuSkfzfnLoYaqEWL45AScDZ6F6X94XmNnJCXWjXkmeMeuwPUkxiYmMNNwe4X1jjqsqIoSvmOqtJLo9c5Wheb3XPqoWvxmxiXRlvsyWF9R29Clz8wYr+PvRccLHGy4dnAkuQmwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miqzyIA03ls647kqlGVNz4QbCwli8H8pHa5mwpgNLxI=;
 b=mP9k+5tT+5vT8C9ZZLD2+L1YBvVRAExG0bMsoPEUPYINLn764WgRTloIZuTO9QJ+TWo2Heur+3o8giAlCEh6ctIsOGZ9+oyOzn/Tbw/rdJ7/1Aia+P9jGatbfpn7E8l3ZIxOUyrWloKu91+Wm7AQty47RW0lddk7PLQUZN87q3RGJmdhPReJUvywm/M/Q/uY/2tR5a+IfNHAun1gTvgmNk7Bpc2SX5PYHNfDtix4xMdhXSsR9aiLG0xYgAY9UPAh26WPsTSy/CTqOQxYJQULGHp16qH0vkuuOx7oG9kQDjpCt8kPJKkTgOOk7N0SrGuVKMvZ1Qm5LOIC2noSin7lbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 01:19:26 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 01:19:26 +0000
Message-ID: <9f969753-4111-4601-ac18-2879666c652f@nvidia.com>
Date: Wed, 14 May 2025 18:19:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 26/30] x86,fs/resctrl: Remove duplicated trace header
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
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-27-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-27-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e55618-aa4c-48eb-84c6-08dd934e87e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amRzdGM1Q0QvQjZ6QWt0czJqNXBxeUE2YzI0aU92dkhMY0R1NHN5OUREaUJL?=
 =?utf-8?B?a2VmeEhyNWRDMjN2KzhteFIzM2J3NHo3MWs4Q2lORE56MXVnWTZEa0E5YXpD?=
 =?utf-8?B?MUR3VFRhck5uNFlpTlpMRlF4d3RRejZ6bDlJTHV1TVV5R3NpRXlyQ1g2Yzlp?=
 =?utf-8?B?RmRiOWQwa2ZObGxXTE1qVXJPdVppNksxUGVnZ0hGeTFIQUZJVm5XNTFFdm1P?=
 =?utf-8?B?RWRNZXd3ZG14eGU0Zmc4d29JSGs5c2MzVmRQV3FVMEVyTkZZSnpZVFg4dE9Z?=
 =?utf-8?B?Qmh4SUx6OTh2L3lLSXVuYkZpbUZRTHY2NVFJT1F4Y1MvRjk1Tm9icE15a29T?=
 =?utf-8?B?VTY4MEpZbno1UzVpYmFHZ0VyOFlhTnpLWHMvNUwrQjh5QzFlNDRCSjJpSUNs?=
 =?utf-8?B?NklUY0RFWm1LNit6YVJPUFNuM3Y2emJmbjYzd0pBVnBwNTNtMkdHLzV4d3Qv?=
 =?utf-8?B?NUZtU3BpZVRPZFhLbDJPejNycTUvT2VMeWZ0YWFPb2tDeFFUUDFhZzNoTm5p?=
 =?utf-8?B?Ym5iSnNrZFNrWkxEMlI3b1Q5bmM5ZzhrZ21lQlJGU1ZvdVhUNGtsOUtJYVpQ?=
 =?utf-8?B?Wno1L0R1ck80ZGV1LzVUODRWSU5PYzhHUEw1eDJ0MnhmRytYblJkVmpoWTJ6?=
 =?utf-8?B?UUVjR2VqckM1TGUrRzF4c3dIK3dXR3Z3MG9MRU5NNEVaN3dwcFZCVjR3N1pZ?=
 =?utf-8?B?WU1JU3FKeVVzb29UczVvQjl0SVBBRGFTcWUxMDVDYW1xY08yeGY0ajNYNlo1?=
 =?utf-8?B?M0dCWWZmckZsYzVmSVcyZmoySDcvUTZQRnVtMndRTFVxTEhwc3N4ZzZqeEhu?=
 =?utf-8?B?TWE5c0tEcmJuUGxtQTdEa1drNnZrSmhlUllwWmJqNFlHMGl5TFd2V0JRUnpK?=
 =?utf-8?B?YjZOZy9PbzJtcStUa0FQRG9KQTg4Rjl3RCtIRFllUmhTSHpsNW9MNm42WXhI?=
 =?utf-8?B?U0ptdWp3Wm5sSXoyUERwUThWNTdMWlJrSm1neU9VNHMzL0h2NjhpMHVaZGJt?=
 =?utf-8?B?eEJhc0RhM0VKOHcrWW54d0N2VHUrN1Q2Sy82WnlSblphYU1RcUI5S3BoYUJq?=
 =?utf-8?B?cUNrcFZDblJZYXJIVmJwRWl6N213dlFPSDlNaFVzOEpybm5BWUdQZzVOU0o2?=
 =?utf-8?B?eFUxK2tVdFhxTkpaTUo4OTI1Sjc5NnYvVzdWTjRmWksvLytqbE50YjBMTk54?=
 =?utf-8?B?TWpNSjN4Ly9CMk5taFlENENaeEpscGlmQUgwekpRZGE0QUF5R3RVRmdCVXRX?=
 =?utf-8?B?V3hsSFc0M0c3RFZ5TXpudjVlTEpmL1JHNXh2VEhvcUZYRW5YWTR5WGQwQkhv?=
 =?utf-8?B?MGM3VjM5THBMTW1kV2Z5SnRaTjhEZVNEdTFrdDhuZlExdGt2elVhdFRmUnpj?=
 =?utf-8?B?Q3lodmxRR1JmVmkxR2dWb0JvQWUyVG5ZenNjMHJtbHF6STlzZjU1M2ZGNXFC?=
 =?utf-8?B?ZjhsQ25WOFN2bmRhWExFM1pFN01KUXVMdU1Uc1RaSXROWUdmc1Q1d0wvWWcy?=
 =?utf-8?B?QlNBT2p3QnpzekgvN2JWaU9sVzA3OFFuRGdRL3hnYkpPVjRUS09sc3lUWXUr?=
 =?utf-8?B?Uk5vMlFpWm10MWJnSVIzQnVMTm5CVmsrb2J5SHcrTlFDWFo5K3pJSnd4TUR1?=
 =?utf-8?B?WnA1MlhYU3drN2xlbTlhSGZvZ2JtaVA3a0Frd3c3K012TmVMVlpxd3BGODJ1?=
 =?utf-8?B?WC80U08vNzEvd2Q2N0xHbit0c3ZpS2lpWk1nc2d6MHdGRFU2ZWlReElwQk51?=
 =?utf-8?B?Z0NzYTBvZXJiTVhFa2ZtZ0FWZ0FBblpDa2FwRGJ3UWg0SlZ3OU9aUjhwTmcx?=
 =?utf-8?B?ZWdPUWt1TTJjWHNkY0xSRFBCZVpsT1gvTng0WnhlNWpWZGtWTEdnbVByU0ll?=
 =?utf-8?B?YUxHY3Fyd1pSSGRmcUJBU1ZmNjNmNGJLYWUvM2JLdG9pQUFKZ0lFVGhsQ2FJ?=
 =?utf-8?Q?CvT86z04Zts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWIxZHVMSEh3aVFGOVBTMDlmOVdwS3p5TTJ4R3E4Y1poUndYSlVVb3JZS1hD?=
 =?utf-8?B?bDkydW9mT0VIQXRCelF4b0lUNmU5OVZvWXJWNXJSQ2lydmZ3WEE1eUpEZnlN?=
 =?utf-8?B?OFliMjBBRHZINWk0ckkyS281OXRTMWJjT3FONzFQRkEwbEpLTzA3QitvV2R4?=
 =?utf-8?B?Yy8zVnBXMzRwQ0M4U0kwM1R3enJUemh0UHBLYU9TMFk4aEJmbHpKVUVLMTZN?=
 =?utf-8?B?N0IwVmdNMDJhSzdoelN2NDBsUkRUZEtnU0hHcGNSZ1ErM2FFeHA1eDJ5OU1h?=
 =?utf-8?B?WFJwai9NU3I5S3lzQ1lWaHJKMkpaN0s5MDd0ZlRBMVRqMHppSnQyS3JCODRG?=
 =?utf-8?B?TXhmMnlvdllqdzc4VDZhWW1iYU9tb01zOHEzMkFNcDZSZy90dGptZXJhKzBz?=
 =?utf-8?B?Qy9KN3F2S042WU5JVm40bFBHUFFvczNTVkZ4WkNzZ3FaemYrMExXTkdlSlho?=
 =?utf-8?B?L200N21NaE01c3lqK0IwUWFBTlQ0MkJFYkVTdjR4RHZHV2RTc3dycUFwUFUv?=
 =?utf-8?B?NzJoM01wY3lhU2REak95cWllVmtSOXJhanhnemU4cE5TeW1aUWFqYW9PemRT?=
 =?utf-8?B?NFg2d0VmRVpnR0h2a3ZXR1dUNjR4eDVLc0U4b0NQNVM4MzMveUdoemxqaTZ0?=
 =?utf-8?B?REFVR2ZBRit1enRVQ2tDRlQzbjlmbCtrQm8rZnNiSEs3aWtIMEl3MWRIYVJv?=
 =?utf-8?B?cmdQRDFBbklOcTFSbC9tZkt5eVlGUmEvVEJxbnh2aUFEWGExZmJXN1l2MlRy?=
 =?utf-8?B?RkM0RXZxU09xS2ZMeXY4aWFyL25LdDdwVGR1ZlpEWGtiTjV1R2JLbnJhaUw2?=
 =?utf-8?B?UWZYVVpVV3ZMYkVDZ21ZU3Z0eVJXaDlwTEFQbXM0U2xodU1YVHh2OTNERmUy?=
 =?utf-8?B?VzJweVlTRjVTTzBFQjNDbzNFMW9xS0pvcUJhaC9kWGVsVHhvKzk4ZDkwQy9X?=
 =?utf-8?B?THltdnljaVVPcVhIa29GaVcySWozaDUxM0NZb0xCSmUrcEpaSnFPQ1BIQkNX?=
 =?utf-8?B?WFJ1NnhTQzJrNkY1cHdSMlpYRkhXeFlpS1Mxdko1VjFsbUpWMXI4d2ZRYldu?=
 =?utf-8?B?S0xiMmxmbjlUUEc2MjdwMGxLYVRXVzk0cFJyVGpvaU9CRTAwV0dhdVg0VHF3?=
 =?utf-8?B?UkNsN2NXeUw1aEVHSFhLZGxRbzIySzdiU2hMbmsrdnYybnJVbzhtYzRPaVk2?=
 =?utf-8?B?QlFSY3BYbTUyNTF2cEFXRGRjZDNITjYwZlU2SkNUNXUyRDBNdEJRQzJmSHNO?=
 =?utf-8?B?VzE3eU9uSm56cDBGdG5zOURYSW5ycmp6M05rVjJCWjlsQnNqamhXcmpVYWdj?=
 =?utf-8?B?OCtieTFQOTRsN0EwK1d0cVF1TThwVm5EQmlyR3hRbGVUbitHWGptRWh6OXhL?=
 =?utf-8?B?UGxUajRQM0g3K3hJdkFDd2FkaXdHdUp2Yzc5MDFlT0s5bjFuVnVrSFErcFYz?=
 =?utf-8?B?aFF0Z2o4VmJVdWsvN1hObW9OYk1EZUZidTl6ZEV6TXFlZk02dkRGWWNJWG10?=
 =?utf-8?B?blJNMXJMM001VEdDT3Juak80Y0JqVWJNWVJUV1NCOWNjbTVSbUw5RVlReHZQ?=
 =?utf-8?B?MkZmWFNIdmdXR0VMOFQrOTdPZ2V4TmNUbldFd1lmSWdwelc2aHFTZHEzZG4w?=
 =?utf-8?B?Mk45RjF0bXhBYThHb0ZJVWYxTlhaVXdDazNLY2U1OXhHNytxOTBoVE9EbFpQ?=
 =?utf-8?B?ZENybmQxMHI5bUhBTnlpYWJ1UG5ZTU10UmNLeGVrZ29xVGtsV0lGOTkvMlJV?=
 =?utf-8?B?dmNYZEhOQTlOV1k1OTF3Wnd0aWxLUVBYME9BS2N3OTJnUThSSURVS09kT0ZR?=
 =?utf-8?B?UFhiUkFQRnFhNXJ0U0JucjZZMml4SmhxNkJIUU9NVGcxYjN1S3YxQm1QcDFY?=
 =?utf-8?B?U1FJQjZNbnNibkgwWm9HdUNRRFVsVjRVenphb01xUyswa0VEbG8xcFJic2lM?=
 =?utf-8?B?S3RWNnUzekFyanozbkd2Ni8vKy9MeGFRTElJblB3MVVkUkdPWWZWUmoxQ3Z5?=
 =?utf-8?B?Wk9WS3VnVTZpUmYwR2ZqTU83VFFlSFVXNFRjNlZNWHlJNno4cmdKZW81RFFU?=
 =?utf-8?B?YzhiRk55dkl0MWdSMGlidzlrYVMyVkN6UjMrQmdUNGpMQmg5WFZQZi9JWDBD?=
 =?utf-8?Q?fTuY9PXUfVs0tcigThMdNyD7g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e55618-aa4c-48eb-84c6-08dd934e87e3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:19:26.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifsW3JWrtxp5/4Nj5DOgD4uJlHJqZsjpr4M2kBGLP7J+0Qn7+SQ+En82zxkGEKS6h6EODwI0niOllhym13o90g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650


On 5/13/25 10:15, James Morse wrote:
> The copy-pasting python script creates some empty trace point header
> files. These can cause a build warning from ftrace.
>
> Remove them.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

