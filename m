Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE913B7A3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750737125; cv=fail; b=OMViGPlkcMNygvsR4csOSDQhoOnSIqV7FZ1kHTtfIn77WosopbUay5hYuNfe7MGqxzhuN30EZNCMhmWfk0lpcJ+iqxzWOriCQE7QMH3bKSkTMQHinfvTQUi9JLTMmN4wuvlOXvHo3nGAOfeHX7PTcBi0ijUvK3EFKmWA4y2k2UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750737125; c=relaxed/simple;
	bh=rix8yEGk5Cvf+gdSzBE9MtljTto3Z63L5fKeGAaVLl0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UZN+0szglpSIdl1bUxv9dacY2UtGrQ6TZiNNatPr2Lj4cjdaoqn335WFE3o8xx7RFie5Qu4Bi8E+mHyN6iAy5kGBgSxfwXGS8zwR/NBhyuLI29xaqLKlm/NRLlg9AVbzHBkLdnd6eItXMuKIFSrmoexlbhWSYq/7cOtZPyk87E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oJG1W7Tc; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oJG1W7Tc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOX+h6x/15L3GmmG9xIPVr5tVCSQ4srk9Gswr3AK7vZ4g6oO/nJjvkUxnPmFc/YabJM9ZPsYlbfoDJlMEqtlYq8OLI7B0HGjegiDIcAa357nK0K7OT4wQLozYBpOtJKxCjO0HtsoNdWa5Kp/LC//RFU+mAky4h1dngeYytTZ39lIt4JfHcIR5eNkwZ6+izIZY3kiylS+mv6ONYQViTtzaTqitPPpyzG7bxRjU3eXy3twvUlyKCJF5k6qlyvEJ6EyeJFyyoA3bsQhRhD3ZKfdBR33dojcvSBsOeiFfkAElJmEKNkKG21uyzW/BMvebTm6FOTbqId9jYtmIY9XD1bjQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alNg4xhG7zFJUyph91lgavIHzRzCtUa6mIrabAvviGM=;
 b=AjGAx1GVGYZYjW2Sgh6IGNXS3yv+pKO1O8FH5IGk642heLADSg+p8usDMiHrRvn3deVKk9M/s3MW0lnv9rxXXCuWDP4DzV9BH2TZOG0XDUd14dIyhEcIiFUYrh8aklZBQXvl1i6xAflRPmBRc6w25PEizYnFtEEpaPMxueZ1ElEB4UYk3xKH2QYFhEqM/cDjbhkSIBivDM+XH53XcLKzsGSytbEtTlEztTJfjgqHyK0b5K6p+xVtvippAAXMCgbCFZv40pTOTomtLnhabyPy2vcPnh9ObCIKWmBSHjK82A7yuy3doL+cGuk+LpCGip2kkomf74svPqoFpWJXGvaKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alNg4xhG7zFJUyph91lgavIHzRzCtUa6mIrabAvviGM=;
 b=oJG1W7TcOrinV/QV2T690Ar8eEJ0QCevZd+K6VLulRYjieRC5vVO8PqxNc1zIfx5YIjpm0i2I1wo5ZYeGV/z8cRMe8Yd2FmH8DDZivss+zvRoXrzCNlqbPrFcBB+i/Vs4vAWbAnVJCdC3sPBZmuvRcwFSeJcTMJbdzkJK9SziSAB3b4rgA66BWkkFqXmIjdMXgNJ8aV3ZkHYwwbuV9ZEU3xe3Q8DBt/NG0uzqeBbTqnyr7CUBaIIIK5dM/m9LvNYVBbrRvI/sH+C5HKoouIq0NkmCskXVzwG8jq20FNJpXyEcVqSqqQzsYfgXs0KlBw3JLfw+N87/bA+KhWqh/xdEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB9513.namprd12.prod.outlook.com (2603:10b6:806:45c::14)
 by CY3PR12MB9580.namprd12.prod.outlook.com (2603:10b6:930:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 03:52:00 +0000
Received: from SA1PR12MB9513.namprd12.prod.outlook.com
 ([fe80::d2e1:5a4:6598:e5f8]) by SA1PR12MB9513.namprd12.prod.outlook.com
 ([fe80::d2e1:5a4:6598:e5f8%6]) with mapi id 15.20.8835.032; Tue, 24 Jun 2025
 03:52:00 +0000
Message-ID: <f37b0dfa-ae59-4693-b10f-79868e093e80@nvidia.com>
Date: Tue, 24 Jun 2025 11:51:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Optimize code in rdt_get_tree()
To: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 James Morse <james.morse@arm.com>, Yury Norov <yury.norov@gmail.com>,
 Dave Martin <dave.martin@arm.com>, fenghuay@nvidia.com,
 peternewman@google.com, Babu Moger <Babu.Moger@amd.com>,
 Borislav Petkov <bp@alien8.de>, shameerali.kolothum.thodi@huawei.com,
 bobo.shaobowang@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, Shanker Donthineni <sdonthineni@nvidia.com>,
 Xin Hao <xhao@linux.alibaba.com>, baolin.wang@linux.alibaba.com,
 lcherian@marvell.com, amitsinght@marvell.com, Ingo Molnar
 <mingo@redhat.com>, David Hildenbrand <david@redhat.com>,
 H Peter Anvin <hpa@zytor.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Jamie Iles <quic_jiles@quicinc.com>, dfustini@baylibre.com,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250623075051.3610592-1-tan.shaopeng@jp.fujitsu.com>
Content-Language: en-US
From: Koba Ko <kobak@nvidia.com>
In-Reply-To: <20250623075051.3610592-1-tan.shaopeng@jp.fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::10) To SA1PR12MB9513.namprd12.prod.outlook.com
 (2603:10b6:806:45c::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB9513:EE_|CY3PR12MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: 8888eb83-1f9a-4580-7130-08ddb2d278de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnJzdW5tdlQ4bTlGSWkxa2dzK282WlpSZlNNYmhMOHA1VW5wY3NpZ05LMDRN?=
 =?utf-8?B?V2FSSks4MjlLcGJRemtGTERyN3NyR2wxcDNNRlkvanEweHUrMHBUQU9oUlUx?=
 =?utf-8?B?V0JzdktMeWRPR1hIamNBRUV2QzdtM1lwVW1DaDJkd3ZKbm41UXNqc0NkWnJL?=
 =?utf-8?B?Z3MyaFlFbjFCSG51dlh1T3JVUWJERnU5eXRLd24yL20wMGNveXdsTDlYVDB2?=
 =?utf-8?B?ZGNRcXFRZnpTVFhIQTRHN3M5LzRTd1lkbHd0a2M5UTJXOXV6UTdadGdJQksz?=
 =?utf-8?B?SkYwYlo2Q0lqbGZGci9MOG11TTNVZGYwKzU5WjFuWmZHQ3NsbjdyRXFOMTBN?=
 =?utf-8?B?aWZyai9NMnZkMEg1VEg2eGJlNTFvWGUzNjBJY0JZclZpWjN3UEIwQzlnaCtt?=
 =?utf-8?B?SVJwTUx4SkM4V29jUFlxUWdxUFB2K3RTRjZvcEhUS05OTFIrN3Yxcm9GdWdL?=
 =?utf-8?B?UFV3OW9UejlubSs0d3dVbDVxK1c2S0NabWVENDU5TERjVFJUMng5VEU1aFZB?=
 =?utf-8?B?SVE4VEdzZkZRb0ljYzFvSkxLajdGVGoya0JvdUpIUUJxNE5zK1o3dUh2RXBC?=
 =?utf-8?B?WHYxdHlLQ05GL1plU1Ivei9UK01BWEkwdmhSaTdyVnk1WU5DTFg3WlBOaGtn?=
 =?utf-8?B?eFhiWjd5b2Z2dE5hU21hZml5SXNsZkFGejc3OVFUODdNMFM3bDJxWEg4Q254?=
 =?utf-8?B?Y3AzSmF3WnZDM3pCV0tNSDh3OFU4YjJ6RmFYdERxN3NMUEhFMnZONldhUzNO?=
 =?utf-8?B?b1Q0SVQ2Y2lQREx5eDd6ajFEMUxDUkowdzhiWmZpZXhLTVRTZFExVlpodlVI?=
 =?utf-8?B?QVpsTXJHdUZkTTEyVkZ2bGpTQzlZZnM2dDdPWVdaL1l5SDQwQVpTcEFoNmxR?=
 =?utf-8?B?ZDJCUTRncDl4dDZnQk95eHdHSm1IT3lmQjV3ZlVpZHlmSXNpdlpOMlJPVmZk?=
 =?utf-8?B?VHJNaEdpQTNRSXRJdW5NUmsxYmFKNFZ0RzlFVnF0dTBGTlJ6Vk1ZNklWOXVn?=
 =?utf-8?B?d0llUTU0c1Jnb3V4L1RoWWg1eUF1VUV4alZUcGszWWppL09jcmFuWWpxT09G?=
 =?utf-8?B?OExQSnNGcGRTLzZEdEVNQUFUV2hqUFpJdUtjOTdOaG1WaytwRmcrZXVTaEUx?=
 =?utf-8?B?engzeXVlZ2V0d0JCYVR1NmU1MWhpeHRnZFRTZk1YNFZENERBMXRZbXF6SjBa?=
 =?utf-8?B?dXFDWFpWSGE1cXNMZ1VNc2Y2MVlFV0pFMm1EN2ZaYy9WSnVsQ2pzRXJsOUlh?=
 =?utf-8?B?WnlxcXpyTGhpZFNHeEl2RTZ1YnhhWDVtb1daZWg5SjVmUWltbXJOdVEwWmxl?=
 =?utf-8?B?bW5pMWloR2hNY25COU5tUFZkejBpS1BBdUVaQzRVa0gxUm5ndjAvdmtpaGpq?=
 =?utf-8?B?bWpkYU1qMXNpcE9aNm52bjg5NGd5bTduVmcrdjQ5YktVazQ3ai9yNGZyQnVR?=
 =?utf-8?B?ZFAxTTNiTHBoUWVBNHRVV2V5Nzd6WVF1MmpnS1RiaWRoTXJrdFlvS3I0UTR4?=
 =?utf-8?B?TnFQL3pSS0h3cnJlOXlCWk1aSWgzemhIMzc5K2h3SEJway9FMXJyMTZqUThT?=
 =?utf-8?B?R0JvamE4MSs0eS8vTHgvblFsbzZMVWUrbEFsK3R1eEFtS2RlWGNuSnpyMzFt?=
 =?utf-8?B?RlM0QkNBNXhkSVhaM2tqZUdPWGNhbU10MmdRK2w4bm44SnFQdDhTVlNERnNs?=
 =?utf-8?B?OExJU25QdjRnT24xREM2Y3VpelR6dEozUk4rS0srNHliVEVaVDcyNWZXQW9X?=
 =?utf-8?B?R25WVDVEZHFKek54Uk9KZXgycmR3bmJjTXFFMWkvTFE2Ulp1T05FVXZUS1BO?=
 =?utf-8?B?cUd1RVBMbFZlblVMM1F1M0NIdGJidkFvWXhuK1VGZkJWVmpGVlU4aXlnODZn?=
 =?utf-8?B?bkw3N2lRT21SNXp4M1ZYZE5MclU3NjNmSVpCS3ZiQnA1Q1NQS0FBbDUzOUFa?=
 =?utf-8?Q?AJxTaSpMvL0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB9513.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1ZuSEhkL21INk1KSlgwN1dSWFVWcWlrRXVHWVZ6Qk9OdVRWOCthMUF6T1RZ?=
 =?utf-8?B?bFMvQ292OGJsdy9qRlZWNXNuenlHRVR6TXZPS2FvM1NDZmxhck1wMmFJbFRD?=
 =?utf-8?B?ZVdCdGRJWFhwU1NIcWNTaEN1Zms5RC91c1RVSVpIMFpNSTYzZy9nSVprVzhE?=
 =?utf-8?B?cG85dzhGdjRhTG41N0FzL25lbTNiUVZsTk9aeUZBUGlNRlVxbnA1b05SaFdD?=
 =?utf-8?B?NTNwQmRPcVJVME1NTWFxcWdDaUJyeDdNc0dpRGY0Q3ROYUE2dzVjeGw1anlp?=
 =?utf-8?B?YVRoZUMyVTJLSVF5UklKT0xNWDI1Q2Y5SmNRK2xSNy9MVm5MUERCdEZucCtB?=
 =?utf-8?B?ekJTQjZCY1R0azlvb0xxSEdxSFJFaUtRcFoyaWN2SzUzSW4wMjlDbWYvVGNt?=
 =?utf-8?B?dUdvYUZLUjVnK0JVM3Z6dGE1cEtDOFJHVnZQS1JaTVlxdnlaWTF4ZlJMb24z?=
 =?utf-8?B?V2RPWjFXcE5vd3lKdVFzVzVUZldyUkhBb3RRYjBwVUFDRGdPMkpsK1gwd3Zl?=
 =?utf-8?B?ZDhNM2VZWDhpdUpRVE1NREY3TXBMc3dZZ1Y0bHNEYUpINGlVMjZCd0N1eC9j?=
 =?utf-8?B?RnpydmJvcU1PZjl3ZkNDY2xxdXhwOUdURGlnSlpTNHFaMlE2SlMrY2MxRHl6?=
 =?utf-8?B?RVZJK0Z3cnNJWjNkZFYxQjJXOExOOGlNZ1dZQ3Z0eGFyQVNtazErMnh6UXk4?=
 =?utf-8?B?S0ZBODZPQTB4V0IvQXU3ZTJrSkNMbm1LZnBMQlNxbDZxQkp0dFhpSWVOdWpT?=
 =?utf-8?B?ckk2aXBsSzVKS0pSYWJHUGUrU1VpZ0VIaENvU252ZDl4RlhWajd6WkhTSFVz?=
 =?utf-8?B?V1hic0NaSnMwUnBXcWtBNlJJeWZFSk1vWk51VnJaRXZEaFY5SHh5MmRUQTNs?=
 =?utf-8?B?QlA5Q3ZRQ0JEVldSTk5xeFNlcGdMQW1rdWdyOS9xaExLaW5TbVEvaUtEemlo?=
 =?utf-8?B?cjNzK3lZT3ZRWFZkQnJQc2UwNHlQNlJQNlgzd2JoK1lucktpU1JORnlnY1V3?=
 =?utf-8?B?YitMRitHR2JWd2t6dGdkcnFzT0NrWkM2WW94VHlTWkc5VVNqb1pOUGx6b0N5?=
 =?utf-8?B?eHRmdFhBUjVnZVhRRTZ2d21hUHRKQlpnSlZ5S2hyZW9jd0lWbzlTdkN1QzlN?=
 =?utf-8?B?eTJaR3MvdWh3cmlnM1k5SGhuMDhwSVdpVzBaY2tkN1g1YjFiOTZZL21jTHR0?=
 =?utf-8?B?WnFFSVcyNkpyaEhOUnJWTXBiL3FlUElmZUQ2RXhZUG41VE1zUjhFMG91VFE1?=
 =?utf-8?B?dWxZS2VDcEQ0SHd4VmFjUmx4ZzhYMVhjeVZDblBBemxFSUhobFE4ZSs5U1Jl?=
 =?utf-8?B?SzRTOGpzMjFNZHh6TEVjVk1rRWhzMlFhRC9kRm1YRG9QZ0hzQWczUktZVStB?=
 =?utf-8?B?dUVrb3VzMWpLRTh2aXdkZWkycUVhY0ppWEVGcDl0a3c2Sk43RWNNMmJsMnFS?=
 =?utf-8?B?WUVkZmUrWnJTM2Vpdkd3cHdSMm95aGNOSHNrNFJpNVU0b09lQUo2di8wcUwv?=
 =?utf-8?B?dDJVN3BHalEremErQkRZN1N3ZmhGRkFyUDRTb0ZmNSt5OEpRUEwwSnA3UTFC?=
 =?utf-8?B?dDlWYnRLdUhNOUF5TUIvN0drQ21Jdm13VzlZaXRrdzhLejBRMXROQ3VEUEFT?=
 =?utf-8?B?UFlLMkE3bEVSVmVhZXh1WW04NWkyZ3RINjhNTnRQY3VZangrR3ExVUYxcS9K?=
 =?utf-8?B?a25WM3NNQUprMjU0endTRDM1bmZMTW1FVXlHMTlMNmpPU3l5RE9kOFduUUNU?=
 =?utf-8?B?K3J4dUF4WmFEWGFEd2duWGQ0SVJpNTgvMDRXZTVxS3gzUE4rSE9YSVRnTXBI?=
 =?utf-8?B?aExDWVdBVzJ1VVNUVm1BRjJCVjEzUndRamE1ZkFvQ0xpdTdCTDNSSW9nbm5l?=
 =?utf-8?B?cmIyKzFnSnBadFZqSG5sWXJNMmlsVEY3NGxMMmpBbFBEL3JRQjFheWg1cklw?=
 =?utf-8?B?MlNwUzJCZ09yNnNXRFp5TnNKV3JFOXQxNk9DejR0VzJzQUdidUk1M0w1bUE3?=
 =?utf-8?B?bGhMQ0RqY3d5WlIxNFl2V25senM2NHhrcm1qK3dJNktxb2xBQ1h0eC9CT0R5?=
 =?utf-8?B?QllFeU14UExIRFU0eHdxcm1TM09uanV6YnptTWdoT1I4LzFZamVhMGtSVVBu?=
 =?utf-8?Q?AKcdYm/ox68/Byoluo0p7/be9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8888eb83-1f9a-4580-7130-08ddb2d278de
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB9513.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 03:52:00.0204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/beifGJcNtkXd1MDguwR9fB6Eo7fatk6C1P/lc6QmaVpMWK41X26auWfTEmvjmqhjdE87WxTptNVwDtFr1wtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9580

Thanks
Reviewed-by: Koba Ko <kobak@nvidia.com>

On 6/23/25 15:50, Shaopeng Tan wrote:
> External email: Use caution opening links or attachments
>
>
> schemata_list_destroy() has to be called if schemata_list_create() fails.
>
> rdt_get_tree() calls schemata_list_destroy() in two different ways:
> directly if schemata_list_create() itself fails and
> on the exit path via the out_schemata_free goto label.
>
> Remove schemata_list_destroy() call on schemata_list_create() failure.
> Use existing out_schemata_free goto label instead.
>
> Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> ---
>   fs/resctrl/rdtgroup.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 77d08229d855..5f0b7cfa1cc2 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2608,10 +2608,8 @@ static int rdt_get_tree(struct fs_context *fc)
>                  goto out_root;
>
>          ret = schemata_list_create();
> -       if (ret) {
> -               schemata_list_destroy();
> -               goto out_ctx;
> -       }
> +       if (ret)
> +               goto out_schemata_free;
>
>          ret = closid_init();
>          if (ret)
> @@ -2683,7 +2681,6 @@ static int rdt_get_tree(struct fs_context *fc)
>          closid_exit();
>   out_schemata_free:
>          schemata_list_destroy();
> -out_ctx:
>          rdt_disable_ctx();
>   out_root:
>          rdtgroup_destroy_root();
> --
> 2.43.5
>
