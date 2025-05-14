Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C36E8BE5
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252906; cv=fail; b=MOdsyUfN/ggPxRO+mrnM3DEHcLqbkXdASE0sCashRXC5L3xZTxNcYncBNxZPE4aBBm1zeOjJ+L8Dz0ewkVCNglgv5iViOhodeHbdrbj6Qs6Xc45y6AGfTkIUDg8p0A4c7RVKwLk1H6gTa9806LQv2Yx6tXTtka8mEpDaECLXfAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252906; c=relaxed/simple;
	bh=MngxlxpPqsA1IMDbmTJk4qXdtKzOeZANEjLzSthy+LM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bKAH1GNPnpf6bDw3IbjOnWCQBUs4TYVoU60LiQ2aNrtlKodbNIdJLJk59R3t6lFhqHiX6T+ZX9kkHpbyrP3yR/+cwqgNf+2tCO3NdBTYu+nqByfcSn1K0QxXLb4+H+RvzDAUXFApxPQbHC6wRB5G2gz9E4i6cRawBsz2yJlY0o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iaoDsWrB; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iaoDsWrB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlGaU3ja9DF1S15fyaecXjeVG/pprE9NYgwo8fypZhXXgUPVIh6/sDxkaA5SrIcseFxkKG+vFCEGKFnsa4yq2PKfDrzDGGUZWkKmCdwy9B3PE0EBeJffjebsKqTHdW7EljWTdHthqKjcEmymtEUEuCEqCn7bPDgMAdymy7jlL9ZCLgS3ZlRag+Apd6MeI/DsSYdhE3Geae1Xiv6fAMAe58cpo5PkPp9RhxKTAEn5A+XbRYQJfOItAn/Z4ZAFjzThzr9qEsWHf/DhifZHYKVEo1vwyrNws+a10dG701EWn9Q+WrAi/xuplegZZa8J26TwkkEFU+wj490597QGpGidvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MngxlxpPqsA1IMDbmTJk4qXdtKzOeZANEjLzSthy+LM=;
 b=QHaxGWibu/DeeIpj4BglThRRp1zgli7KLr1rx3sPAtyi9rbem+wlrBaHmmaKhQ5CE0d5hcRx8ZD4RmojBze3gnXAaLeuQEnxSAO45ExG4sYXefq7pvzqA2u+XI4VXY1I91JBttSSdWWv2dsISWk0SC4jeBMbJiRH71sAFGN8bNUl/e5taXAd4fYWoDJI7GoPNBaa4bniM3NevdRYxjmFHkeHSyZ01QZKH9A6OCSq3dqYG5YBFO0UodNAXSVyTQbQrUBLTcpctiots7hsZ/NILaNNEi/kSOlOUA6xCivMA3Np34dcKWh7935nuW4LHec80HIhs0s62ZaiFQM6f6I9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MngxlxpPqsA1IMDbmTJk4qXdtKzOeZANEjLzSthy+LM=;
 b=iaoDsWrBjI/cXJWZQNTj0F58YKWwxGsimLTFTAVkVIAtXGA2cUAFkkzTD+i+YIWufX5rMfN2nq12MwX517pvRewjQpHILRp5rqSJXTmbWoUe6+rhhgPamRIGohCagf9jYOHVJB2sWDB7A8oPGmkuZiM5ooPYU/tMwtjO9JgZqwrJQbA7Paz91hWXG0WoqQ2bJ7l3Ox8Q3SAiDtOkGGCM/pE327cvTUt+orobXqNrBe1uqy8UT++vx70GE7HXwYcwUxkTti8+7DaK8MvHVrDyh+CtIGvT3JoKf1AoKSP8V4YQH+Qvz6i2pd8EKmHlx+0drocRHxdbgbfXaCU5RgeGYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH2PR12MB4104.namprd12.prod.outlook.com (2603:10b6:610:a4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 20:01:41 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 20:01:40 +0000
Message-ID: <51c9992f-ea41-4b0a-8107-4043771af1a3@nvidia.com>
Date: Wed, 14 May 2025 13:01:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/30] cpumask: add cpumask_{first,next}_andnot() API
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
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-4-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-4-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH2PR12MB4104:EE_
X-MS-Office365-Filtering-Correlation-Id: a3de06df-fb5e-4370-8a5d-08dd93222421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUQvM3ZBWkdjRm8yUXB2UVJsWVVlZTIxbkhvM29WRTNaSk5wWnZ1N0wxbDlw?=
 =?utf-8?B?MG9rM2J4ZjBGTTNzbFg2c1NvMHp3SWdYNjlDTytSdnFjUmVuZVJZK2w0N0lU?=
 =?utf-8?B?a2NwVlc4RkV6bHJYZG8wcVJ6Uzg4VWVVRCtpQXY1NmFXUnA3MEJEYTA5VzB6?=
 =?utf-8?B?bU16TE9URXd5QVNtYms3a0Jaays4UVpkSzBTTlcycy9WTVFXSFJlQnhPWEo4?=
 =?utf-8?B?RS9JdFllYnRoYVowZUtpZVJZSDlHTzJpazRwQk1YMmdqeE9BUDNPazhrdExl?=
 =?utf-8?B?b0p5Y1lCRHcreFptak45Wmw1TTVQQUhBRUw2UGg0ZkZ5SGs3a29rN0o5V2pO?=
 =?utf-8?B?RTgwRU9hNk9abUl4T0NFQmFobFFVazdRMVJyelpLNEdJNyt6REZKbEZNdHJ5?=
 =?utf-8?B?dDB5MW5lbFBEQ2RUUGYySVd4STQ4Q3FYNUVDNWd4MU9ZOGtGY3F4cEVXYStn?=
 =?utf-8?B?d1pzSWpHcXNwL1lleThpQm1wM3E3cVkxdGlWNUZGdmU4Q1hTU1kzWW1RcWxO?=
 =?utf-8?B?b1RJZU5ZMkVPclpQa3NTK3laU2RxdnNCcXc0RTBxQ3Rzbm43SG9hNnZuT2hE?=
 =?utf-8?B?SURTNGNtNXJ3YiswR2FYR3o0RnM3VlE1Y01FTFFpdXM2S2NFVlVCSllIYXVo?=
 =?utf-8?B?MG5yYURMYmhrMzRuWkpxUVhFeGFycGV6ckdJVW1DS1c4TXArRDhlQ2MxZE1y?=
 =?utf-8?B?SVNNNmtGRUJIdGZsSTBlczQ1OVFoQ2tuc3oreCt3dEFYR2RRYmxmUmx6dG5I?=
 =?utf-8?B?dG11cXRQdTlDNEY3K1BLa21YV2Y5bHR4NEdCdjArTUg0NGNQRG5EZFgxdTY5?=
 =?utf-8?B?OFErU3hyVnhjU3dpalpjVEp1TEpPbjNBeGEzbVh4TlZpQjJFTG9SZDVmY0F4?=
 =?utf-8?B?ZS9pV050cUxKTzlBMVJvYTdyZ1RpRFhCamRWNUZERURoaU5DRkVEbStQYVBs?=
 =?utf-8?B?ZVcyMDRZaXJwKzA5MWxhQ1k2Qk03VnJoV3c4VStUVm9taXhHenBadTQxemF4?=
 =?utf-8?B?T3lyQ005Y1lNL0paUkVNbGZTeFBYZGZYRU5JcVBIUWZTNUFuZ1EvazhoYlhw?=
 =?utf-8?B?ZWcrQWxHemQyZkU1a3d2a3lyR1NkdjExaEZMQmJnYjNpdjY4RWRCTTZSOUN2?=
 =?utf-8?B?U3BYZ1h1STFoeG8rNlpGV0JQV3BRVi90ZzBqenFYNHJES0Z0RHFWYVF1NU4r?=
 =?utf-8?B?Y3ZZSVI4dVdLc2s3TC8zY0J1L2ZEa0RSZTBndWxzcnVESWY5d2xiM2hGMVo3?=
 =?utf-8?B?Qi9jYnE3TXpwTFZ3RnU1Zld5SVlybkk1cEgzQVp3b01WV2dXRHJjZUEra21x?=
 =?utf-8?B?TGFoSWVLcTZvaEJUdG5XTFFqY21FTk1hTGU5VHRMeEZVUUJobFZsa25YaVJT?=
 =?utf-8?B?blNvSjM3NDRld2xLQkFxcUxWbCtyencxWWRFcnhOWk0vUWtJRlVXbGRNTE85?=
 =?utf-8?B?VWcyaCs0T2FYeVVyRFZnTEpYaE1DeWhRWWJta2hYNG83K2doakZnZUNZQ0xM?=
 =?utf-8?B?Qk9VNFNOc0xXTXZUMU5aQXA0N2E5N0RUMmdybGdyaGk2UHl6dUt6b3YwUlhF?=
 =?utf-8?B?bUFtMEx6ZGlGM0hSQzQrYzZuUjhKNk1yQm9mMzJvRDNra1dQZGNMMldncGtM?=
 =?utf-8?B?Zy9kZjZqdHZsUHNzbUkxaWpsYTF4dmJNMmtIUXgyTGh2T3JZRWg2NWNteklT?=
 =?utf-8?B?b3pmSXZocU1EaUpleVZqcklKOWZRRGFYaUZHMkJwQjhHYkVXOGhsenR5THpL?=
 =?utf-8?B?bW1jZHRSSmNBWkE4bnM1NkxNbDRSR0tudFI0K3dsNHE3WEtKWE96K2dLdkhJ?=
 =?utf-8?B?NFhMWDMxTXVNRkt0VkU1R2lxMTg0UnVWT1hXVytBMlBDamJwUndlRnIycUlm?=
 =?utf-8?B?YitWbzA1U1lVYTFuakE1bEZzL1VEek91SXlEVGtrandoM2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3Y4WWhaNmRkNFJWM0R4U01KeDNKZUQ3ZzNFT1hnMWpSUmlEZ2tqTDFOVjZT?=
 =?utf-8?B?UWIwblJFeWpteTd4YXBJRWdNa0FCSktjRS8rSUpsZmIyV2dkYkZSb09SYWZi?=
 =?utf-8?B?d0w0ZVRiQXgwZEVZSjVCYk5mamxhUWFDZEVGRnoxdnptVzJhN1U0R0hUU2l2?=
 =?utf-8?B?QjgyaHh6S0V5TzhXSEhYU3FiWmE1QUdSa0ZTZ2NsWkZYbW5JT3I1SXdNT1V4?=
 =?utf-8?B?TllZZzdTKzR6bGxTaEV0QWlzKzJHYTgzcVBVTXdNUXBkSndTeWRzdThuS2l2?=
 =?utf-8?B?YitVK2V0cjRjMlpNbzZNVVR5by81alNCbGZqUGFFMXF5ZXBlZFYvVmlGT2ZK?=
 =?utf-8?B?ZXRaRUd4VWpoMmhzY2cxYnRTb0FZZjFPeWswb0NvTG1rRVFZUUNTUnFSUzdz?=
 =?utf-8?B?Y0twWmlwampuQmNWWlAyME5zb09DRHVKSUFRRDZjSmZwZ0J1Skl4Q1ZYREVI?=
 =?utf-8?B?Y3JTYlNrT2w2czRZdThYTVlnUlBtbDJlZFZRc1RFSUsvZ2l2Q2tYcGUvaUVV?=
 =?utf-8?B?YlZ0NXNjd3N5Nml1eWoyQkhpdEJCZmlWQitCNDJDOWQrcFEzYXBhRU5FcXR1?=
 =?utf-8?B?SnRFa1RvdHg3dlRaMW1mckJmdnFPQXYwb2dwWkFSK0xpaE9EMjB2WmdkTUUr?=
 =?utf-8?B?bm5wSUR3Zi9IaU1JK1pLalB0ZE54L2c0VnlkR0lYMjdRQzZIQjJOSG1QNDFu?=
 =?utf-8?B?K0t1bmZYS1hPS1FwOVowMzRkU1c1TmNsTE1RVXExMEo4anFqU01sUHlTWEp0?=
 =?utf-8?B?U0RPc2tBK011bU5oV3dTa0RHVlhWb1dxb25PK1JHdG1pZzFjdU9NQkZKRTRF?=
 =?utf-8?B?ZTN3aUVLOWFjSmtEcDFxNG1NcGZMWmx1c1FXbHl5NzlCc2E4V2xDNVFiK3FX?=
 =?utf-8?B?bUFFRjlacmdPaWVXZFBVSlc0dWJjamFrejI1N2lGamJBRXJWdzNtSmxrZ2hs?=
 =?utf-8?B?UU90UzdIYnMyeTZYRDNYT25JQ3Q1NXAveGdsQ29UcEkyb25EbXBEdno3Y1E4?=
 =?utf-8?B?S2V3dDl1ZW9QVHFzcnd3YlV0L0Qzb1hUT01udXFIYXNvT2trME9zaVo4dkUy?=
 =?utf-8?B?ZEtVRVFhT1g0VWNLOE1zenBQdm5JRERUN1Z6Mlc1My9wWVd2am02THlGYW9s?=
 =?utf-8?B?SjF3MXNtbWhNaTdNTmJURUVzcEVXWW8rWTBZVUFZb292SndlY0wzMDZoSEVJ?=
 =?utf-8?B?VHhrSlkranNoY1JCYTgvbVhmV1g5SUJQS3BiUXg1VEdrY2JVOUZEbDJGM2Q5?=
 =?utf-8?B?N3FUMXExc01idGp5U1B4QWhqRnBRa0NwSXJFRjVwYkxOeHN2ZlJJSTcrS1Qx?=
 =?utf-8?B?NG9QUnl4U202M0VMZEVQZFF2MHpPVXFYdFZCSVFFTlF4L1RuRk9BZVFkdTFZ?=
 =?utf-8?B?eThlUDl6Sm1UT1A2RG1xbmZCUFZ3a0F6b2t0b1hVTFFkVVhJVkhROWJFU1N0?=
 =?utf-8?B?a1oyRWIwUGJvOUU3MTNoWXRpLzJjeG1PUGd0SE1sVHpjRVBsYVF6dzh2M1Q1?=
 =?utf-8?B?SmZsYy9RYTRONjFWQTl0SWViRVJLTE9rcDNDN1RFeWhjTDBJWS9XV2thK3Fv?=
 =?utf-8?B?TWxpMW9uRFJqU2JManVVL1FpQVJMQ2M4MUZrRmJTSFllbmxJcXNkOHlTb2k0?=
 =?utf-8?B?cGlkazRad0kvTlhDMzhjdmFBUUtOUHBJb01RV3FjeUFFUm8yM3YySC9lWURG?=
 =?utf-8?B?QnZQTW5sN2l4M1NFSU51aDRETEJqWFNYdTBYRWlOdmRPYUkxYk9mV1hLU2FB?=
 =?utf-8?B?MVNNSktNL0hveTRjUmNoNEgySUIxRHZ1eko5RUhJYXJKaG9PMzdKQWw3WXUy?=
 =?utf-8?B?ZTJiSzZMSW8xclFJYmYwVkN6VmpZS3Rtc041Ky9ySXB6Q1BXSmw3N3BydXRO?=
 =?utf-8?B?YTlWdWl6QjZ2aWlsWUIvSjlHNlgyVTNYQmdXMU1wZkFUZUYxSGY5VjRNdVA3?=
 =?utf-8?B?NHYzdmIvaHdMOHBWVXphV1JYM3BRcVQzYUdjbzQ3OC9XTU5jbk5YT2R5SnQw?=
 =?utf-8?B?NTRDZFIvY0FhUjhWdjFBamc1OFdiN1BydUhjQ0hSRXN3dWhnYTA0dHFhdHlj?=
 =?utf-8?B?ZEZxVkZyUW9ZYjZ3aFhSZTJkSTErWUJNS0pxR3pwdjFLaDJJeU92WStVL0cw?=
 =?utf-8?Q?CJeX4kwyo0IXmHngHmmX1Rs5I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3de06df-fb5e-4370-8a5d-08dd93222421
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 20:01:40.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIcpIRnEZr0jUiD8/gYCW4+aQoTWQia3nblYDAak9cCtaFCZL95voeB/s5XhCwO4Ga37xJH1b3rWIiRRaoiA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4104


On 5/13/25 10:15, James Morse wrote:
> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>
> With the lack of the functions, client code has to abuse less efficient
> cpumask_nth().
>
> Tested-by: James Morse <james.morse@arm.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

