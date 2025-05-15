Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95492191
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747267758; cv=fail; b=t0LogVmcnFjZrbzUfrsU12M/G8qw+6usTPEkUFijrdTUx/63eZ7TdciHvTSBjiVa1cxRDu6DGOnQ9dRvnFs7k9vmJ49U95rGeMwRTQGPAAQWUID1/j3MRrU/eAfji5Eno/mvZS2W9wiQRcTtBbWTyVVQa+ZczWI6Fwf46LEiPbY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747267758; c=relaxed/simple;
	bh=NG2GejJQSX0S0SNnVCh5Z6WHVd+9+VTwbvyO0rOcupg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G7tkPsThNc8nrsp+3NJ3ulhqJO4HEUxZ6D9yQ8l+0BAPF5jgP+M4a5qlNFjJrpztg9aiy9Pm5D5LFlEwmhh8W6Hgqk/m66FMGqj7Bu8LBUyUIQqdZsUDDx7j30Pz8FHB5u8Kl7GGzy4uRlahpDa16BO/sDkd6AiXtrc8rU0Yuro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jvkjTnnn; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jvkjTnnn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eU7iHlAv0WbSM5s9aP9nJtX67H2eZG7P3SrAXyw9IqSXUQJRsBte3nL+Aka8JuEGNkf0BQ6theGnAuZWS7dhWKUuG2aPCR28ZhHQqC4XRmdlna4c6Yo1hVQ6rlnihvE3dwvhXwgU0BHWyMjWJDoPyDhI1IyQFTp5CdRTk/S8+THpuc3yO16I1+SCDqJt62Ctu/aqmCBZEstw5vMi6ZIZNLOD7pfAoS+aqbwRRp02pxh7EuIj1KUUiBBy9C+Vsk7+7rWv7+es+dFwhJYhCgkfhVHA03yUo3TEA//0mLVqFm0FloBomiMenZaY2SUPcf4nLxvdzMIdD63vZ9/9NLGCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG2GejJQSX0S0SNnVCh5Z6WHVd+9+VTwbvyO0rOcupg=;
 b=bhYNnwUaMCAKthbaWd1vRU0GYeAYepT8rWfCLyxsa1bNhNOETCmBn7PAP3tmealpArZV3Ddu81o5CN6eo2uG0eDqWvCx1mZ5nEekPkovziS80iDAfDUs1VnRVkhURCRUotidBnT3qDc+k/pQRM0/s0q2bXuDZPnYmw11A09Mn+fitxsW+OiGzzGpyyaHuv1jg6jlz96kTa4KptNQ2hiflCrCV+BZ/FbWIqoVNVUkCq8Eb3ZfnC2StmPuBPk1/FzZpVOGvcP5RsXmBhz2xJZL3bhYDQjb22H8FLkPAXhdBi9BtELTK4JJ0QrZ0aEetdgb3dx2sfL2k0XKmBTvkFvu6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NG2GejJQSX0S0SNnVCh5Z6WHVd+9+VTwbvyO0rOcupg=;
 b=jvkjTnnnHAK2wB8sDl7uX/lqWc2TFRR3LfJvEyZKKJh3zfpu2CH22aPp56oxCPNB4rRusklmytK5apmLAlDndwk7HNjR7JZHNrAs3STB3A639xXxTk+ZgvtPRZWA/OZWZZIgIS5Q4zmnBLYkLVS5wL2HSsfBe00BpSmNNroqI1pxgBWGb0aFfa814J8ykqSppCTegJ3PD8DbXwWg/tWwoSs88i1PhFAL6ddqCMWX+Jmkl1RLgkfEX00Y1eQqSSZ+CjPTQzwwdH1ez7t4+zdLHkquF1ihXxZM6LLtsP5zj0bgxZR8XxYYlXE5I196ImEImqGCC8UgKYxn83aTY3dpng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB5831.namprd12.prod.outlook.com (2603:10b6:510:1d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 15 May
 2025 00:09:11 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 00:09:11 +0000
Message-ID: <e637ccd7-9ac4-4df0-8ae8-2648ad737ae5@nvidia.com>
Date: Wed, 14 May 2025 17:09:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/30] x86/resctrl: Add end-marker to the
 resctrl_event_id enum
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
 <20250513171547.15194-12-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-12-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:510:23c::9) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 29145a41-8af7-4887-deb3-08dd9344b805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1NTZGJSdHRWbVRMa25hZ0p0NDV6Qms0ZmExZ1lwdVF0UWpRMWhUWHlUWW1X?=
 =?utf-8?B?ZVAvV1d2SDVCZ0JIdTNTQndtbEJpTG4yMmVIMEREWVNhY085U3dIcGJtbXQx?=
 =?utf-8?B?RDJUdWI1OHQvN0dnTHhjQklGS1BWZ1hKbzhrU1duNFJvZ01FWkN6UHVMazBR?=
 =?utf-8?B?Nkp6cjVYeWhHK0lTL0djcG9Mb3RyS0l2d0dTMEhtZWhSRzNwOXYwZUk3SG9m?=
 =?utf-8?B?am1lVTdqT28wZFF5eFlCWEhlbG5zb0dYM2l3cGtZRmhBYm1DKy9BUWxtRmxm?=
 =?utf-8?B?ZHA4VVhqdHo1UGlhdGYrTGlzVEdUYXpGYUM5MEw4TjBqT1g1Umt5bE5IclZa?=
 =?utf-8?B?NktrRWRrRm0rM0dscXRWS2F6V1IxOXpBbTdlT1BSZVNQeERRY1Y0bXdlUUcy?=
 =?utf-8?B?c2JBZlVzZlZmNGhsR3ZubTRYM3hzQ2FjNFN2bVBGNUFuUXFrL3ExQ3dVaEph?=
 =?utf-8?B?eTRaSFBPWnFCTVAyemhsM25BT283eVBySHBONVcwZ3NET1JiRGNHWU5Wb1FI?=
 =?utf-8?B?RHVic3h0UUo0NjRZNm9NMllSSW53RjUrbnFaQk9nNDdSc3VNcGo4RlUwZnh6?=
 =?utf-8?B?eGRLZnNBazN0ekNsaDRhOWV1dHlLUjR6SWF6WGduZmMwKzRTT2hUMyt0ZXFI?=
 =?utf-8?B?ZUt4dUJGWDJLcE9GczdKNVFSNzZJcFZ1S2M2dDdiQXVSNjZMZ0Zlb0g4cHRJ?=
 =?utf-8?B?SWswbHB0OHRHTFNqa0tiR1ZSMWFTNE5zcU81R29Ia0U5ei9hdFpKd3pvRmJ0?=
 =?utf-8?B?YlRPY0s5TC9udEhGZXdYNE8rUklUOEp0Nlk2UDQzYTZJVkQ4NEoyZXZvK2J5?=
 =?utf-8?B?R2RrZmVSb2pVUlhGYm9JRjFUd3h1ZDBNUFVYVG9ISUkrd2xDL2NGQkluUjdu?=
 =?utf-8?B?VWJPQ2g1VTVwVTNxRDdUZkFBTE9jNmNKVS93cEQySm5xNGc2WVl3RGJzT21S?=
 =?utf-8?B?UjJtOUl4RE14WVI3eHNMRnpFVk1YNWtlMEw0YTNSN2duaWg2dlNPOEF5V2J4?=
 =?utf-8?B?TDUxU0s4OHhubUluQ0h3bnM4SkVudzVQcDdPWmZ2b3NHVnJZaVhoNkE4Nk5W?=
 =?utf-8?B?eVgyTXdtZnhQYWMyOXhNcVh2NlY3aHlTdHA0SHZKUDhVK2ZWNXYvWGU5Y3dU?=
 =?utf-8?B?QkthUFY0dVQyUklJeHgyQnJYUkI5T3VWdmY3TnZvaTYycEFBMHl5RVNoRlRI?=
 =?utf-8?B?dG9odUZzOWRlQ3hlaWN2N0huVHdJQ3l4d21ZcFZPOWsrdWlBOUNBK0sySUwy?=
 =?utf-8?B?Z2dRRWh4VGt1WE1ERXQ5NkhUKzBMU3VxUFdGVFN1eE5zMFRDVXd3Y1pwYTNK?=
 =?utf-8?B?KzRQdUtaRUlGT0xBRGxlNWtDODh3bXpmTkVORkg2Z1VzemM4V2syTzFQRFZX?=
 =?utf-8?B?OE1Ub2xzc2ZOS0wxeUpiRExZNDRWYVg0YWZvaXQ3dnBYcnpMUkkzZ0NDMC96?=
 =?utf-8?B?NkVIcVJnM1NyUVNwM0owMll0S25IQ1VITlV1K2lpZDNPSVJWWmtYTUdWYktm?=
 =?utf-8?B?TWM4andLVUZtLzd1WXZsbEhQMTdLR2tVbHo0TlpoMDFVTW1ZZ2VBU1EzL2tE?=
 =?utf-8?B?REdmU0NicjZYS3U5blh1eUpXY2ROWlQ5UDZaY2VNNFI5K0x3dGdvdGJvUktT?=
 =?utf-8?B?a0s1eWgrSWRvUFRDcDQ3QVRuclpCejRwV0NwYUZMSVg0ZlRVNUI4STFrQXJG?=
 =?utf-8?B?UFhkOFhWT3IwNjlIVkIxYlpWMVVIZi9qRWNxZkw3ektmUzVkSW93UmhxUklF?=
 =?utf-8?B?aVQ3TWlUWTJ1Q2VESUlzeWEveEUvOWVObGZSUGxVcXgxYUszY0tsZm5HdWxC?=
 =?utf-8?B?RkJQOFQ1eHkwYlRTNFRLNHl5SktycGtWU3JrSGE5cS9vTS9LdFk0WnJFb09v?=
 =?utf-8?B?NjYvZkt5VmFJMXE1OTJEUkhQYStUMGFTS0NzOEw1MG1MTkltTGZVYkh5YTZ3?=
 =?utf-8?Q?oTIKX+ycht0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1ZIbjl0OTNFc0lIYmhZS2VCTVNzU2taN2lGMFc4WTdBTmZPN3oxanFLVmFX?=
 =?utf-8?B?ZWlHZm1iZklPTWQ5MytjOWpjUDU3bytTRUhuUDlSUTVqQlF1eUxJTnpjS2Zw?=
 =?utf-8?B?U3VuaERta2N4dndaTm11S09HK1NjK1RoRVREaWVHUnE1L1hTK212WG40Ri9U?=
 =?utf-8?B?MmVpOXVSYzdhRUJqMlZ1MWVISUFSTE5oc3UvK20vUHNRSVBrczhjaUMwRnBr?=
 =?utf-8?B?aTFWRG9uZGN1RS9iV09GT1lLZ0RqVlFlenZadFA0Wmg3ZFpaYks3ejNnSlND?=
 =?utf-8?B?ZkpnM1BuUG10SUIxMVhRak81T1Ixb1pKRTR1RkJTbk95aTZGRHRXeHJ4ZCt0?=
 =?utf-8?B?REJzcHFBd1kwZHorc2JkTVZ5VW9yL0ZobmtIeE1xeUxzZkFqUm10RndHc0VE?=
 =?utf-8?B?N0doZlZ5OTlTYjk3aGlhazRDRDY2YkUyZnlmcUpaMlBtWlpnc3ZLU0phNTQ4?=
 =?utf-8?B?Yk9lYjk4TFUzYk83RTRMOE1RSnhPdjYzUFdiKzk4YWwraXFpeGVBbnpKZ3J3?=
 =?utf-8?B?bnRNb0xabGlzRXFrbzJpdm5ZbjJ2eVYrU2NIUzZ3aWJ4WE1SbTlxUWZLSzVW?=
 =?utf-8?B?T1hPLzBjblc1OCtxUWtqV2NKaTRYcDBHWU9GUmVqbVpIQVZ3cGR2SXltWE5T?=
 =?utf-8?B?YnUwZGRVTkhKK1YvVDE3OWxLRW9pQ1NPNi9lbW5aR1hwUnM2UHU2dGVoTWox?=
 =?utf-8?B?cDByVmIzcnByazM2VjZxQ0V1WnVTbEgyNG9uOXRFckFaQVpSR2UxaTJPWXVW?=
 =?utf-8?B?eU1yZTUzQ0MxaEJkY3RXell6QkQ4RjU2dTBZa09TWkNVamZmRHNPcWptR1BN?=
 =?utf-8?B?SjhKYzZYSWpqRXNlZTZpYkhjWHlNVHl3QWVYTEZSVHl6K090Y05NVTRzSXpi?=
 =?utf-8?B?UEFVQ29WSlZyYTc5VExFQ1dtV2tVMWVDZkY5TFZYQ3FBeXI2amU5RjlFMWx5?=
 =?utf-8?B?bms3TmpLOCs1cDlGelFUZDdPWGJHK0dNZ29wTVpaR1FuM015Z0NRbXZ0dVpa?=
 =?utf-8?B?ZFpsOGU2L0FsZ2JiQjJ4OElQQk54aFYrZTI0QUtrQ2VSK29uOFUyTDRDendT?=
 =?utf-8?B?MG44S3Jpa3E0cnZRd0FZbTRRL2wwemlONktSNitVM3dzY0RpblVyWmE0b0lW?=
 =?utf-8?B?U01aditkeGxwVVhXV1M1dFVjODFGUWYzZzBqRVl5ZnhqdzVLUWNZVjBhbENw?=
 =?utf-8?B?SWhMSFJPSzAyVlJUQzNHOENybmFRQjNLYjcrUjRmVjgyRUorclhUMWN6UEht?=
 =?utf-8?B?OWUvcG5taEl2OFlZMXRVV0xGcGMzeXVmZVpuNCtta3NBZThqUFNYRmx1bW1G?=
 =?utf-8?B?cFBOdTN3eGE2NTFwUFZQVk43MGJuSEpTdkMwellOVitseWp0cTA2L3g1MVd6?=
 =?utf-8?B?NUhpcjNHMFFtNGxWcWpJaWZiMW5FdU9ydmFRNkk4OFJSY0Q1NUFqM1hBUzFE?=
 =?utf-8?B?WEVTWndkQlZJbDN0QjFpcW1VMXNNWWh0WndjK0IzcU5GNW03UzZBc2UxSlRx?=
 =?utf-8?B?ci9obUlKcWpsd1Z5V2JFbWZWcXFaR0xHYW9tR0tCMUl6Z3JmRGtlUVVOQXZw?=
 =?utf-8?B?SXRtYXFyWWl4SVZQVVkzZ05iS2VLRDVnWnBSQzlFWUZhVjBaWm0wZmg3a2Y5?=
 =?utf-8?B?NXFQRDUwK3lzaC9QcE5aSjllY0FUZVh3VHhXV2tWMDFzazNyK3U5RHNBUnFH?=
 =?utf-8?B?ZjhSMUNJK3F2WUkxUDJFSi96WkxoNUZud1NRdVRKclpsdmk5dm1RbWt0T2p2?=
 =?utf-8?B?cU9kZDJRNHR1ZEZXWW0rck9UKzhFMm9EZEhxejY2R2FSVENRTEZlYlRaYUZV?=
 =?utf-8?B?bytTSFFZV2ZIQXRqVUVwVWs2WDltbDlLWmdXdVlYQSttTGd1UnR2NDNCbk5D?=
 =?utf-8?B?WHZtY3hiTG92ZS9CaUoybUxSUm8wM004eDg2NEczQm4rN0Ezdm9DemJXYVI2?=
 =?utf-8?B?akVyU1NCTWhOaXJWenBLL1h1c3lVVHRGc1VINkp1SFo0b0U2aFhIb2JOdGlE?=
 =?utf-8?B?T1dzcVAvaHR2WStEVXlUVU9iNVZjaUQ2MXk4Z3VKcUZwOUUxQXAwLzh1OUdB?=
 =?utf-8?B?K0pmdGxkeEhnajN5emFzS3o3a2E2S1YxOTZuNjVtUDZFc1FudmYvVU41WGZy?=
 =?utf-8?Q?moSE/d3yaXZ61NTgjAAxkuAMj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29145a41-8af7-4887-deb3-08dd9344b805
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 00:09:11.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXTilAax8y0Or3j00fsRBDKpg8dL1vQ2NeATLZq6Ohy9xIlH1gn6/y4RhOWG+3Q7DKg40DOU2OC7o2VpDuesVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5831


On 5/13/25 10:15, James Morse wrote:
> The resctrl_event_id enum gives names to the counter event numbers on x86.
> These are used directly by resctrl.
>
> To allow the MPAM driver to keep an array of these the size of the enum
> needs to be known.
>
> Add a 'num_events' enum entry which can be used to size an array.
> This is added to the enum to reduce conflicts with another series,
> which in turn requires get_arch_mbm_state() to have a default case.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

