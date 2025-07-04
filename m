Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4557315E5DC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751603667; cv=fail; b=duchwWQzzpdNPbRER33AVinbX0fglPoia80lqzGDJD7gC8AO1snIfL9g47aPs5H86YTSXzP3U8XOkcKCo5RNS0vFpGKIEvEnt0Ip4cwMUDpJOdVcmYlJS2ejoT/we+iN/gdqbC5ZksVOiYK2GrUaSrh6s3eI12ea9MSg+Q52TDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751603667; c=relaxed/simple;
	bh=ddA0Zik3Y1D3e/1uvKBW8NHu7ECinett6QDM2kP+nlk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZhDLN45B1JJswHzGwLu11XjXChIBLE52Z4xTe8yptXURTV8Q9JVnWs/AsrXyVnCNRCVO7PLDfziR+El9JM/UaveFjsLbp6tliySbjRNv6dnVMc+Ctx+9q41krFNuXmdSqU85PevKg2mIBcgGCruFXJBmTcWRsX6fIl76ggnpDf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DNaXJjGF; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DNaXJjGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBT4UbgPw9xYdQclmdAAdjq3M6EauzTZi39vRsib4NTndZJ39qfbiVJ9hyg6rM29tcpT+ywqc8MvarX1xaVJWvoXjNcghR1+Z2tRyn721JGqEQklEMPghZbdAr9rBMhMIRJ7vCVtSU3A9dBOOV7Tr+92B981GevvwNfOd3ywlU4vC20BYON8CBKmkYjsYYpTAZonFC9OHhbtA2WItzqVHFRsIFBYlfknJlBgnNHdtbybQ9911zgDZ0o+3czVtHdKqTWdSTv/p+PYWbkJifF8/MaNSZ5JrDcjtRvgtlTLmC5iyVpwOBwFvdx3N9ddm4L7lk2mJuO0L05wkTX9Un6bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qzltW8JHcxXAFUZsFFeaLtPeKkX7w9a2ym+8YV7W6E=;
 b=Q5+R1Wx3zb6TuUVtjlWEfhG/3yiPjkfDBak+IuphLus94i4He8fbR5Ij05nDYXvJEvzneOps14TjotaP5vsj2ERBfqjG9m+mx8iKBXaUhkpk00Mv/xwt+KEriBvnp1UEoHAmKo69pn3GCqokB7zKG/N6hikUD5k25x7ZtyDPQClZ7+1VvVDUfoy7ME2YlHLHbXhnLfaFoPsnrF0cdDOFupawkmj7G329Xi32Il12vzSMCoRfHlJmExvr/uRBgWK5QKwXxjki+cuILxtECwYLhm1gjUmb4ZoeqCWDX8sStqW5Yg1BaZBdwTMRdRWOD9SkaMKcw3K10jzMGVT9kMNpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qzltW8JHcxXAFUZsFFeaLtPeKkX7w9a2ym+8YV7W6E=;
 b=DNaXJjGFMoAAFykh7NeKIMYQ/6j75U8tlppO1lXme1nF2G9K/VtiNqHnHqTXz8nsJdJ2q3NboH+OyAAMcMJ2Dx9U15L3jDVnIesIcrI40LBQuS0eIbSwDH1kKsrrONuSzoBDvU3UhUeu+28pgjGxwj+ACO5CaMF6gs6wATv2Ym4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 04:34:22 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 04:34:22 +0000
Message-ID: <dc54a6ab-2529-4def-ae7d-6a217e3bc1bc@amd.com>
Date: Fri, 4 Jul 2025 10:04:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
To: Benjamin Segall <bsegall@google.com>, Aaron Lu <ziqianlu@bytedance.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
 <xm26qzyyb6cn.fsf@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <xm26qzyyb6cn.fsf@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::14) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|MW6PR12MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: 89195722-195c-4307-8d37-08ddbab40c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm1ET1JPMHRMVm5kb3hyU3dYa3lJS1dJVHFMZnBWN1RTajVzTS92aUpWREZv?=
 =?utf-8?B?UzVrM1VjTWVZaVhpdFFOZHV5R05hQUNaUnp4NFNtZFdDYTRpZ0lqdXFBeitB?=
 =?utf-8?B?djhEeDZvTUJxelkzcVFKSEZiL1hRWFdyUndKc2UwczE1MWNpcDJMbEJyTGtl?=
 =?utf-8?B?QUR0TW51SWFZZWNnd09NeS9Xa21TUGRwUHhNS3cvb21QOCtBSE44UkEvNFNZ?=
 =?utf-8?B?cDVGS2h6c1YyVVZRdUVPYW1HWVFQSVM5R2lEQkJUTVkwSjl5N0ROd0dRa08v?=
 =?utf-8?B?d0w2WU85L1BzNFZxdDVwRWlISm5ES2IzeTY3cktsZFIvcDgwQmY4WXF0TDlI?=
 =?utf-8?B?RzVJRG80THE0Wm1jbXE1VmQ2RXF4NU1sMVBxS2R4dHhjbXNWRGZ2UkRLcFJv?=
 =?utf-8?B?enpDZjBSdWVxcHgyS2tNb0h4ZElyUzFySzV1QmdmeFM4eWQxd251ckkyRW11?=
 =?utf-8?B?SVJmdVFSeU1ZVFliQ2ZlRU9jZFBwV0VTMlNqMjZYdUpZMS9yTXN2R1lrZVBq?=
 =?utf-8?B?ZmtTWjcvUFpyayt3MjFXaTZoTUxoajFUWHlMQ2lISEtNWndOVHJRTVZsbGI0?=
 =?utf-8?B?OVh2VnB4bTVLeVh2VGNNdkkwY2pKTWxXMnpNVC8wK2FzL1hNSndUSFA2NmhO?=
 =?utf-8?B?Mms1Vno2UXl2c296S3dUUlJOakc0dGMrcVRKNmR0SDkzK3U2TFFDRitCTWdX?=
 =?utf-8?B?OGMzYzVTMHM0YUhKOHpJeTR2amppRlA2MDVxeThEcDNXTks1UmhJeWFnQkpK?=
 =?utf-8?B?bldYRXJvQm8yZHBSazlFUVNEdFN6WHE1M2hqSmtIeVZSbyszL2pGM01BOENP?=
 =?utf-8?B?R0daVnIwYnE5c2xNV2dRZmJDT1dzRmhTYUN0NzBieWFLbEY0Vk5veEswbW42?=
 =?utf-8?B?a0o0cmMxRU1xK1JIbzVtVHFuSjUvNjdPOUpaNWxZLzlmSjVFbnFpdG9qblVu?=
 =?utf-8?B?ZjJpT3RoVEFOUSt5MEN1VjNsZTJUNktqdXEwa0Q4U2tRNVJlMWVIbS90RDZN?=
 =?utf-8?B?ZmN1VmZNWXRnckl5VHYxdzR4YTk0NGYvaGZ2VTgxVTlFZWhkdU1XQzBsZFR5?=
 =?utf-8?B?NVJtSHF3T3BNTGtuMUdWK2lybmd5V3ZWanJDVmY4TkxsOUZFMmdrL3l4S1pE?=
 =?utf-8?B?V3EyV1U5ZzlHTUhMQmI3WG5rMTJuYnRPVCtkanIxMEJKMnQ4R1U1QlRiMzlk?=
 =?utf-8?B?UFVZWXJkWFBnVTBZRVRJa3NUVzJ3Z0FVYVF6NTBDZ29wY1luTUJ5bHQ1dXBt?=
 =?utf-8?B?M3l1akY5WlNjanBwdHQ4VVREcnhtTm1US0xuczJtNDBMUmlSaWt1N0dRbUFP?=
 =?utf-8?B?N0lvZ21VRDFhS2NpOXJwU3JlWTJRNkVNMkd3WlJ2TDRSQVlsWHI1cUpvU3I1?=
 =?utf-8?B?cTM0blBQY0E3NjdOMlowSFFHU2hDTDV3Ry9sUXRua2ZjSlp6M3hmekhYZGF1?=
 =?utf-8?B?VS9vSVJhTFRNcS9uemw4aFU5SFAyVmxVRnFXekRiQXVBcENsMERxTFR5WXpI?=
 =?utf-8?B?dmJ5bGg4S3BXWTNNY2hsQ2NEaTQ3UFE4V3lQeXFpd0VpT3hpRlJTV0ZrTzVP?=
 =?utf-8?B?T0RWTVJtZHBGU1E5TE1WUkZybVB1QmRYSnFSeW1uRWVVL0VCbTZodGoySWhl?=
 =?utf-8?B?K1ZWeWhLUktZSXBqUjhlVUM2YnpPSCt4R1R6U0RBUXJ6VXhseDhTMWpid0c3?=
 =?utf-8?B?RkF0V282QktzZXNKMUxjb09ubmVocW5sQkRlTGdzK2QrVUk2b2NsU0pMUTFU?=
 =?utf-8?B?Mmc4ZnBVRytTSWowMWw2bE1RaWw4NGcxS0JWNUlkS2Y5TTg5cFYxZ1BoSHZ4?=
 =?utf-8?B?V2h1OC9xVkVHMGFrbHZGbXplZFVxWGVQTERiSGovamNpRGhrTlFQeU1oTXh4?=
 =?utf-8?B?eXZBSmhjZVhnR2oyRjREYkxqSVh5aVcvMVZBMGVUSjdLTC84dWZHMm5Ha0Mx?=
 =?utf-8?Q?uy1ok3ZVlTk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVlCMlRaWG54YXphd1JqQ2JEZEVpZ1N6YW9mc3ZOeVZvREV6eXdnQUx1ZkN3?=
 =?utf-8?B?c2crTURXRHBhNm9RODZlZGtvQ1JhSDdzVlBTWDZqS00zT2ZNOEIrZG5HNjgv?=
 =?utf-8?B?eW42YW1qOEJ2SnVRYzFwRHZFcTBjcU4wOXJ2Q0dDTFY5MmlRZmNKdkE2a29p?=
 =?utf-8?B?cE9DVXo2VkVFcGdxUFNZTk13YkVxU3krRTRMdVU0THk5clFnMnRaR0k0OUV1?=
 =?utf-8?B?Q1hadWdBdyttUGJTYzFSd2NuQ0haNkFNNG1zRTRHdWhDdmJEQ3hKZm1yd2tz?=
 =?utf-8?B?SldsYlhHYldQMGVEd3JmRm1taE0vb3dFVHZ5VzJ5RkJuSktMVXFtcUpSUWNX?=
 =?utf-8?B?ajNFSG9neTVVWTJKdHFPWkZwTG9qeERnNkJaazZ3RHZvUm5mMlhGT1pTOCs4?=
 =?utf-8?B?MEw5Z0tVUWVzUHdjTnUwN2tYaVpUN1NJOWEraDgvMm9nUjN1c0N1eWhObHhQ?=
 =?utf-8?B?UHNvQ2dJOGdQOXZScW9XSlpsL09Dcm1ZbkpYaHNFMmhJVGxhWkpiV0NZNGxx?=
 =?utf-8?B?SDBsV0tCVkdWUGV2MEF6cTRrTGVHSG1TRFd0UER5WnRHZ2xPMFJORkNxK20v?=
 =?utf-8?B?YUo5SDBQSEt5YlVFNnFwOC83aHJUTmF1dVZGUDA5Z0orQTlqOFJYRFphQlE4?=
 =?utf-8?B?cFpDa1RkTVh6ODlZMmNrTlVxc0hOb1VZVElWanVVTDdyNmdSL2RTeFJ3d1kv?=
 =?utf-8?B?aHh3aDdsK1JaWDg5ZW9MMVdVNUUwZ2lCYXNlNSt4bmtOL00wejZSTFdnWTM2?=
 =?utf-8?B?elo4VXVRamsxYXdWSkdyY0xGa0h0QTRIbXNBSDVJb2dGT2lBT2JBZVhWellF?=
 =?utf-8?B?aHE5U3YzL2U5bm5VVFh5R2kxM1hqNkFCL0pVaVAyc0dNVFlyK0ROR0pKeWpM?=
 =?utf-8?B?WHNGQnFqMW1yOVVlTHkxNWlkT2FoMStlVlhlVWZCQU9HbHM3R1Zab2tVakp6?=
 =?utf-8?B?MExqYncvcmFybHJMTnIzNlBldDg0akwzc1FESUc0TW4zclJpbmdpeVlhNWNK?=
 =?utf-8?B?Uml6Wllvd0xCQ2ErYnVzVTBaMk83c05RTmRwRFdrSEdUN085Ky9xaURwVkZH?=
 =?utf-8?B?MkJ3OHVhU1grdXZaQWp4OU1YWDNrT1FJdFZNckZWYU5YSGVPYnpPMlRPd050?=
 =?utf-8?B?amJNMDVYakVHRnFHeEFXK2xIb0lKaUNEVHhLRmw2L1FUMFlMWk5rSDJ2K0pr?=
 =?utf-8?B?MEQ2aFB5VngwVm1TVVZaSEs3aXI2U0Y1RlQxbGYrNFpGU1ovTXJMOVB1S2tW?=
 =?utf-8?B?SUZvZmc4UDZ5U1pueDJUUmZVZDNWQnFxclJhTE91ZFFnZFpRUkRtdlczSUlN?=
 =?utf-8?B?Q01NQm5nRHRKem80Vnd5Sy9EcVExdk1nQkdZTW95bGgrZkJpN1FOYXdRWHJw?=
 =?utf-8?B?bEFQcWxLNzQvTFZqNW1IU0pRR2FQYTNYc3FzY2tCNngxQTVxMnpKMzcwc0xj?=
 =?utf-8?B?eGhEWU1BSEJHeUFsYm5ZZFFsMGMyTkdYaVRlTFJuUjJibGI2WVlGZURQVVZh?=
 =?utf-8?B?czhaZVBRaXRyUi8zVW44SU1WbU5zWmZNTm9BeklZQVlhNzBYRHhPS1FGOEZZ?=
 =?utf-8?B?c3p4bnZRR0tETmtPQStBOVBFZUhJL3JYNzlDLytIT294OVRTR1paL1N6SUU2?=
 =?utf-8?B?TzBtcEdycUFURlNuVnE2SittNGRnMUVGaFBkemdNZ2R2bkpqWDFOQnlDWVM1?=
 =?utf-8?B?RmpEL1J3UUlPUW8ydTBoVnE5V3FKSTgwbi81UElNM0lUR294d0xac3QyVS9I?=
 =?utf-8?B?VFpBK3NuL1lQUWUxemFxOVdnT2ZkMy96cFFZY2czWlN6WU9lQU1KVlVoNjRj?=
 =?utf-8?B?TjBtTEtHVndKWlFWWTM4ZytHR0dkSnZmWUVkYnZJQVUvRUM2WU1obCtnRGpH?=
 =?utf-8?B?YkdQa0FmenFFZE1PWDh3Rm9rS2t1WTUvTmkwSGloQ0x6SzZhM2ZFWkpDcEF0?=
 =?utf-8?B?WHVOWmswS25DVVIwYXRXTWMzL0w1SzBNbXA1MXJ1L1Z4VUtzbGl4ZVRHS1BR?=
 =?utf-8?B?cDRYWVpHNGg5TW5XeTkyZVR6K2c0YTZrc0orMVpFZzM2UVFOdGFVTzZ2bmNO?=
 =?utf-8?B?T3hMd1VGZ1ZpSjZZYkZUdHdYV3dRc2JHNWllM29KYkVlTVVDdmtmUms2UnQ5?=
 =?utf-8?Q?bafGrwtjD0bkzGDjNFx0I6CWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89195722-195c-4307-8d37-08ddbab40c16
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 04:34:22.0426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je3cYUuShwKDToYxlKBze3d4e6TxhJTNv+SPe+eGCErlG6M3yvQfRjym97+EI3k6s46LUOnqxvnaBlHd9PnSZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9020

Hello Ben,

On 7/3/2025 3:30 AM, Benjamin Segall wrote:
> Aaron Lu <ziqianlu@bytedance.com> writes:
> 
>> For pelt clock, I chose to keep the current behavior to freeze it on
>> cfs_rq's throttle time. The assumption is that tasks running in kernel
>> mode should not last too long, freezing the cfs_rq's pelt clock can keep
>> its load and its corresponding sched_entity's weight. Hopefully, this can
>> result in a stable situation for the remaining running tasks to quickly
>> finish their jobs in kernel mode.
> 
> I suppose the way that this would go wrong would be CPU 1 using up all
> of the quota, and then a task waking up on CPU 2 and trying to run in
> the kernel for a while. I suspect pelt time needs to also keep running
> until all the tasks are asleep (and that's what we have been running at
> google with the version based on separate accounting, so we haven't
> accidentally done a large scale test of letting it pause).

Thinking out loud ...

One thing this can possibly do is create a lot of:

   throttled -> partially unthrottled -> throttled

transitions when tasks wakeup on throttled hierarchy, run for a while,
and then go back to sleep. If the PELT clocks aren't frozen, this
either means:

1. Do a full walk_tg_tree_from() placing all the leaf cfs_rq that have
    any load associated back onto the list and allow PELT to progress only
    to then remove them again once tasks go back to sleep. A great many of
    these transitions are possible theoretically which is not ideal.

2. Propagate the delta time where PELT was not frozen during unthrottle
    and if it isn't 0, do an update_load_avg() to sync PELT. This will
    increase the overhead of the tg_tree callback which isn't ideal
    either. It can also complicate the enqueue path since the PELT of
    the the cfs_rq hierarchy being enqueued may need correction before
    the task can be enqueued.

I know Josh hates both approaches since tg_tree_walks are already very
expensive in your use cases and it has to be done in a non-preemptible
context holding the rq_lock but which do you think is the lesser of two
evils? Or is there a better solution that I have completely missed?

> 
> Otherwise it does look ok, so long as we're ok with increasing distribute
> time again.

-- 
Thanks and Regards,
Prateek

