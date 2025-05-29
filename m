Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9D1B87EB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509213; cv=fail; b=ZD2u12kcepmog+OcYn0ala/GVBTVwvpQeT10cPkV9zizTG5l9uA3KStOyQnxi0i96+tkpbpwA94IvszZczQV+Xgik8JFUEC3S2w7JE1etxAYv8bdvt2PwSEtXJwrhTw/AbjnFMg0KLVOXoMhjWQFS9OPk/oPVr1APQiJwy/eOLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509213; c=relaxed/simple;
	bh=I3Q2I/GK0/6zwzQKnP+58Ee1/o9C+axbrmg4J2wnwPQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JEARC28oj0Xt55YqWKKmZkNzD1NDw1oL4tFLfMV4kuSeGABbSwaaoVunQBrQn1xIDG5V+HB0TzXeY1EirEXTyEs+fSThoFusv/idD8AKI38FjyxDrxkrk/ou5d/9nwl2DWV/5nI5VMXrc5ifaViZ0ZQ5jwOHHHOu0aAkxaLXpmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sOMn2IlK; arc=fail smtp.client-ip=40.107.92.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sOMn2IlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5rwNHbEbyhM5cMX/vGEzCLgGodLvBzOMh266dSllbPUASrmZ9TrsN4uwAZGB64gWK5RX23TEm7Y1tFd7ACngmObPoxRBkFC349GqUCcZZ1CkMoWZ0jrVoS1SG0zYj4DuvOb72RbbEzy0PcxvdR/CIPaHySEI2ojSvQYFcGRqJnMEUVlEBDt3mcmb+NV11VCnlm5ZlByH8ZrL/pU7KpPY3RczaYzLLbxLepEmFufznRgrugyPBPXSVxQutuFI96ki1DmzXOyTW19G+7obGDSjVxDsu9CpIk1VpiR7j6y6Ac2iML2OIQZE8J6j4gFTDvVDBL8b8v3kisigmTgYiSwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejZX0vZdAn0uCeHWvGuclJd/rjdqemz+gGoamuKTBgY=;
 b=B1MfAZl1UxDal1DLpRzat1EgAt+jiSveZFMBth3VkXILYuZgX0Lmyn9YJxPZ7jvLXtLEGhrx/hrm8b2z+76iwAdF8RvExIHaQdbLbx3jQj1PqCgyviiq69vBHrmZOgyMYL9Tr4EQPzzZStM6L14sb2tLzARMQpYiASf2SDwXg4IujBjmCmdsP9mMcePYRmKpXlh1AMoH0EyfQ+NKgogrQylvhjcs1rM0Z0Wj7Un8AduRaOoI9b7PJcXfsDh0U2dcKNBVk82hyKomxPJzWkFJPtUoPJDhum96GVITdnpLrGfZpm7o7LiNS31gfBruqSgGJQQmQDD6s6PakSH2jysETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejZX0vZdAn0uCeHWvGuclJd/rjdqemz+gGoamuKTBgY=;
 b=sOMn2IlK8ce5S7OZcv5b8EG1dijCdxSirqszxGc6VWclHhcnEaKjz1ywz3pdkPnvUiHpDWkDROTpozs2y4shilbReTBjZF2J10FbqlDGBTmepajHkr/TI9MCHr+H1Tc6XOdYNRU3910KtZxHRLoBPdibbz+L39smSzM3EVzL2wg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by SJ5PPF28EF61683.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 29 May
 2025 09:00:07 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 09:00:07 +0000
Message-ID: <e57983b6-d604-455c-b1c6-5459c9544331@amd.com>
Date: Thu, 29 May 2025 14:30:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Tim Chen <tim.c.chen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Chen Yu <yu.c.chen@intel.com>, Doug Nelson <doug.nelson@intel.com>,
 Mohini Narkhede <mohini.narkhede@intel.com>, linux-kernel@vger.kernel.org
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|SJ5PPF28EF61683:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e6c58d-e5fe-44eb-399e-08dd9e8f351e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHlXK2ZVWkhiTlhtV1JickQ4Mm04ZmtlYk9ST3lORHd4Zmo2Vzg2b3U3d3dJ?=
 =?utf-8?B?NjRXZmxvWjNFeHhTbjlraHM4TmFmSU9yTnRYRnVWemtKV3gyYnBYWkNyMEs5?=
 =?utf-8?B?cDRJZWVOaHhKU2dVK0pja2hvL0pjWWZwaElJN25PSWtEdnBPUlBxR2pFREZs?=
 =?utf-8?B?QlBIbWJlcVNJbzdzT1ZoL0dScm10alljTld5SEFFcDlCV3o1NWMveXFKMDBW?=
 =?utf-8?B?NXBSTHdoaTZsMFBNU2RiYjNQeDQ0aTNkVTRkWUN2Wkp3NlB5ekx1OGJwY0pD?=
 =?utf-8?B?Wlg1eCt4OTFFcEFSN1loUFYzNGpicDRudm1KSDNrclZwUGhMaktUNUlnSWFj?=
 =?utf-8?B?aUFkckcxaC94TlpxdUpaZ0twREFVQlV2MzBlTlhyQ0RiQmI0SkM3WXY4elpG?=
 =?utf-8?B?eHJKRU43ZlZyREtONzFKQ1Q1UDRTSGoxSS9IVW4vUzM5M2p2eEhnSDh4dkVw?=
 =?utf-8?B?WUJTc1QyMXdGeXRBaktBUXBwcjJPTTZvaHRhRkV5NC9MdkRaWmhwbFdzRm9V?=
 =?utf-8?B?N0ZWbCswVXY3VlBnVHZGY0JRK3doeHB2VVNGZlRWWXVDUWhQVVZZVEhWZk5B?=
 =?utf-8?B?ZWErVmdTYjNMSnVCRlBqcDZaV2RwcFl4MU0rdE1EMnBKTEc2QVNJTVhhR09W?=
 =?utf-8?B?aGNrOEcrTHBuS1JGYlk5TEQ0S3g1KzNYWHMxdFlrMEVnZ2NTQ2w4cHVIanlv?=
 =?utf-8?B?S1JYeDNUaWt4ZE9NTTZXdkRkQmJiaHVGRUdleVRFaUcxVzZsa2V1VXkySkhh?=
 =?utf-8?B?UnVMYTdwOXNmNGNBdlFsRnNwZkZURVdDN2tEb29LNXpxWksvMTFNYytleVJJ?=
 =?utf-8?B?YmFab1VoaHMrbTVwRm04WEhhRlNZZnVOSmdSK3BXd1FDdEZMWmFaUTduNi9B?=
 =?utf-8?B?WEtLTTFERm4wMytDVytJUVVwRVhjcmhtL2Y5MS82dGM3bC9XNVF5YzlRU2th?=
 =?utf-8?B?TmhPRSsvT3gvbFZOOFVtMDc3ekU4eTRLWm1BL0JFcDNCczJkdTRTTG1mODFM?=
 =?utf-8?B?RG5qNGRhYUwyOEFrd1Mzbk0zQi8rSGoyOXh5WTNnUE5QNE1ORm12Y2Nod3NZ?=
 =?utf-8?B?UHBBVjV6YTZ4VzJBQTJYOHh4dHVQd1hVUTl5RVZhSmVadXhLTENKWXJnc2Er?=
 =?utf-8?B?R3FHN3RYcW42RWM4S0s2ak55Y1B5UmtSQzhDaHJGb2MxclhDNUtVc1IxcnVu?=
 =?utf-8?B?VStOc3lTWVBiNWNIbmZ2bUgzNUVndjJEeklHc2NKemRGOGZsemU2SlNndG9j?=
 =?utf-8?B?c2ozblgzYlBGMWdCN2FQTml0ZE1JK3NGdVlwMEtpN09GRmx5MjR0alFmK2Mw?=
 =?utf-8?B?aG9sSFNXMkNseWZvY3c5RnF5N2VDUE8xR1ZqRXYyRi9GTGg5SHZZZSthRXV2?=
 =?utf-8?B?NXUvdG5ZL2hiRFZnR3E5WFN3OWRWdDNJbDJOZlNRRm9WY2t0UEdlQjJJUDRL?=
 =?utf-8?B?Uk1oQUtKbjhYR0VaNnN2bmhiSGk4cFlQVkJnNzUxV3NyNTJiZm5RbWhOYnFp?=
 =?utf-8?B?NmV4cmkxN0FwbnNqZzd5UEpqeHdqbHVaYXJlc1N3alVtbDNxK2ZKTkl6eVpM?=
 =?utf-8?B?RHo5ZkVqbEhxVit0SmliakFkUmthK256ZldCQUQzN1NIVEFrQ0ZBb3o1b3V5?=
 =?utf-8?B?ZjZMOU9CeXFQVzc0Y3lyMHE3RFdkR0ZxaUtOS1dvbzd6VzVPcGdSeVV5c1Ru?=
 =?utf-8?B?bVRhNXJpSUZZRzJZN3MyMlNvSWpNV3ByMXpQbUdERW93cVhnRFZVTnpRKytn?=
 =?utf-8?B?TmZvSHhKNU5HNkFPQ2xwUk1RUEVJUVpLdXdLcGp0ZzM5a1BxYWx2ZWR5YzMv?=
 =?utf-8?B?RTg0VU1JKzkyckFESDJEUXM3dTBWVGx6QU03SElBWDZsdG80QXRzb2VMN1Bq?=
 =?utf-8?B?OXFXZTlCVlFWUzB0UkRxVytDTWkxSzBWajNma3J2YmJPeEVpN1BJb3lHbkxZ?=
 =?utf-8?Q?TXgWc0FBaAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJTRlRUL3Z5UktmdkFVamdZYXJyMFdjUzA3aUVlUlNjT044RDBlbkMzVEw1?=
 =?utf-8?B?NDhzQjIremhQcUpNakc3SFdHajFWMldhTXJzdVhaNSs4VjB0a2YxQTJQZWJu?=
 =?utf-8?B?a3NJemZYY0ZnRjZMMUtVZXl2aVg4dGFIamJ1SUxkODUrZ1phVkxqQzU2U1hr?=
 =?utf-8?B?RldWVkRZd0V2RDh1WmVIRkZQSG9NR1dxYzFreHFMbGgwTlRIOS9sOFJTZlRi?=
 =?utf-8?B?Z3B2TUQ2enA2aERWN2RzR0pTcEtSQjc2VHdjOVdpM2l1VGpVUU9EZnFzTEl0?=
 =?utf-8?B?MDVQdnJEaEpLTGZrU0pyS0VycjF2TkdKL1lKWHRPSEl4bS9zSDZObUdYMXB6?=
 =?utf-8?B?VVJpVlBCQzRTVCtwdVZSSzhNMHlBN0daalpZZ1hvTkpCMXlmNHJURjYyMkk3?=
 =?utf-8?B?R0N3MEo5Yi9zNUNTZWJTaHJjTWg5a0M1bWtvU3VyM3dSb3FBaFo5cUlWYTZi?=
 =?utf-8?B?a1RWQXVSN3lQNUg1dDFXbXBFcm56UENQMWIwR05Sam9iMWY2QzRETTdaaUNK?=
 =?utf-8?B?dk84aG90MmMzTjYya1NGWVFvNXFxakZ2QkNDN0s0NWRZUjdUWUJFOGhLMGFz?=
 =?utf-8?B?S1YxT1lLQXN3K0F1OW4xTUtOVmZHdW15cmJ3VmxrTEI5M3RWSnZVeDBTK2RS?=
 =?utf-8?B?YWE4THp2aUpDZ2t5MkNXWUJzMUgrbmR4dHpocmVRb21Xa1FDUzJTc3IwVVh0?=
 =?utf-8?B?Mm1HU1ZneHNWdGVwclpzSGhmV0JQN0pYWHNsYWtNN29oTkU3ZlA3NVVEK3Jt?=
 =?utf-8?B?b1A3bEQ2dnQ5WGFiWlNDTGlPLzdiSUM1eFFQdVVmdlZWR1VmYzA2Y1IvcUQy?=
 =?utf-8?B?c2lvZVlEbE51aEVydHpnOUMxL0NWdFFGYzZwWkJjUkhnMnk2ZUtoTTU5WFZr?=
 =?utf-8?B?R2pKYUtMeEFyVE9QMEViK05xRlpka0NJNFVoYmJWdS9SV2VmWUhBd0FXM3do?=
 =?utf-8?B?OXRCdUpabUdjREpBWXZVZHVFcVoxeGF0VzQ1Y1RhT3JIQXZKdTRKTHEwN0ZY?=
 =?utf-8?B?WDl4TmZBOFE5M0Ewc2x4emppdldlOG5aOEpsVkFlYUJmOVZBdU00RTIrYmtt?=
 =?utf-8?B?ZXBJZzZuM0cva3ZzOXhrRmNFRXI0YW5nckVZNWlLcDRvOWpWdllsQ053QjdC?=
 =?utf-8?B?cmZqSVlrM1NkRzJaSTZydkRldnBva09QUFhtdTJoNGkwVmRWeFd3Z1JIMmti?=
 =?utf-8?B?emc3NjZMc1JReEtsVVRkSkdiT0pXNE92Q1gxczBnd3ViVWlXNlE4MThLMzlD?=
 =?utf-8?B?OEVYdkZpb3d4NjVSY0ExZStlNWFwMHBzVlgwZ2ZUMVR1V1QyclRCYUk5dkFo?=
 =?utf-8?B?WXZSVEZ2QlVYNlNpUTBEb1RiZGt1UTAxV2NZY2lmRStROFU1eHNJWFFxUVRD?=
 =?utf-8?B?MmVURzU5OVNrSmM3bzNDUGVRZHN4VHhQUEJrR1JmWjczb0xQN1RHNWJmemFF?=
 =?utf-8?B?cEhCenBQeHJPTi9uZGJqRkJVSHMxOXRZZ0E1Q0J4dHE3bjZ6MGxVWkhrT0xB?=
 =?utf-8?B?TWlMaVM3aFBqOHdqQUdFa2JtbzlRUWFjVVgxODlXcWs4YjJJbHEzUnhRSDg3?=
 =?utf-8?B?YmdycndFYzJvYlJHOXY4d0ZZeXYzU1MxZ1MxRDE2NFdYVml4MTQ4Z0loRG9m?=
 =?utf-8?B?ckFHeVhXZTZMQjc3SVMwdC9GSk8xRWZ1SnZjZWd2T25uYkR3TDdoTzcxTDZx?=
 =?utf-8?B?aThBeTlQdjBrTDhpYkFuT282UHpwN0kvVk9jWEN1UHphL2liNU4vR3ZyNjB2?=
 =?utf-8?B?ODQ3ZUdDY1NVeXZNRUs3THp0ekpGRWpPM01IbFV0ZUFxenkybVFtengzMUJ5?=
 =?utf-8?B?dUY0bjhycStOL3hNZkI4OWluYURxclkyUFRWeVZoQlg2Sk40NXdNZ0UxTC9z?=
 =?utf-8?B?YVhVZXU3VURTRlBMcjBMalVNZG5rMkRFN0Nwd0hYVDhwT2NLNTRHSUpMNUtE?=
 =?utf-8?B?bVBmdlc0NXRJNUdvWmRaMGJzR21LTkJCSFlMWHNjbUdYaEpyOHdXTytKbGVj?=
 =?utf-8?B?ZkczNDVxb1dHL2NKc3JzT2hPRnJrY1Ava3ZjOVhKS1VvbDlVWE11QUZJK1VI?=
 =?utf-8?B?cGRBckdwYm1wUk40L3NZbVpvQ1oxcExweGtYVUNJVGJsUTNnbjBDQWgxRG9E?=
 =?utf-8?Q?/hDdL5OJkP0cHl7FpBTUCfuG8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e6c58d-e5fe-44eb-399e-08dd9e8f351e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 09:00:07.3853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5Pylnbd2ljeD6hZ7nS0CBH7jRf3l+/u1L1ritZtShug0yDKO5+R7MKVzg0vrEf/AITCYO1cf+bK0l6l37IpkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF28EF61683

Hello Tim,

On 4/16/2025 9:28 AM, Tim Chen wrote:
> At load balance time, balance of last level cache domains and
> above needs to be serialized. The scheduler checks the atomic var
> sched_balance_running first and then see if time is due for a load
> balance. This is an expensive operation as multiple CPUs can attempt
> sched_balance_running acquisition at the same time.
> 
> On a 2 socket Granite Rapid systems enabling sub-numa cluster and
> running OLTP workloads, 7.6% of cpu cycles are spent on cmpxchg of
> sched_balance_running.  Most of the time, a balance attempt is aborted
> immediately after acquiring sched_balance_running as load balance time
> is not due.
> 
> Instead, check balance due time first before acquiring
> sched_balance_running. This skips many useless acquisitions
> of sched_balance_running and knocks the 7.6% CPU overhead on
> sched_balance_domain() down to 0.05%.  Throughput of the OLTP workload
> improved by 11%.
> 
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> Reported-by: Mohini Narkhede <mohini.narkhede@intel.com>
> Tested-by: Mohini Narkhede <mohini.narkhede@intel.com>

I tested this series on a 3rd Generation EPYC system and I could see
minor improvements across the board for most workloads. Feel free to
include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

> ---
>   kernel/sched/fair.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index e43993a4e580..5e5f7a770b2f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12220,13 +12220,13 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>   
>   		interval = get_sd_balance_interval(sd, busy);
>   
> -		need_serialize = sd->flags & SD_SERIALIZE;
> -		if (need_serialize) {
> -			if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> -				goto out;
> -		}
> -
>   		if (time_after_eq(jiffies, sd->last_balance + interval)) {
> +			need_serialize = sd->flags & SD_SERIALIZE;
> +			if (need_serialize) {
> +				if (atomic_cmpxchg_acquire(&sched_balance_running, 0, 1))
> +					goto out;
> +			}
> +
>   			if (sched_balance_rq(cpu, rq, sd, idle, &continue_balancing)) {
>   				/*
>   				 * The LBF_DST_PINNED logic could have changed
> @@ -12238,9 +12238,9 @@ static void sched_balance_domains(struct rq *rq, enum cpu_idle_type idle)
>   			}
>   			sd->last_balance = jiffies;
>   			interval = get_sd_balance_interval(sd, busy);
> +			if (need_serialize)
> +				atomic_set_release(&sched_balance_running, 0);
>   		}
> -		if (need_serialize)
> -			atomic_set_release(&sched_balance_running, 0);
>   out:
>   		if (time_after(next_balance, sd->last_balance + interval)) {
>   			next_balance = sd->last_balance + interval;

