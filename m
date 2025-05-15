Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E03D258CED
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747332015; cv=fail; b=BHrl21/BqyXRhsiGFIaIJGW4qwJU9dNowDALciW3yJm00gInNYVy2heYHxc1Fdk+FDV+SFwcp/Qr7FM3aVYrtZFQ/65mHRHr5qbncfcZscuaIEjVmeWBGUZ6fQvLxLcCqzl7Dm+DsSMx25xOW0O9yCiGC/++X4xBWWwxarpjPuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747332015; c=relaxed/simple;
	bh=LerbDdB8OioLwoGaVZhCv6R0bgWBUYL40J9Nq5Nc/Hs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UlfU5oWL0TC8EQMnKrgj7f349hRNbVek1xbYLybTwLfgAdfloL17yBwvOjitLRDrheymmsQgSiw72b8bz6LGVVjlrDxkPzeHmK7DKu29nLtXrV8u0ugnHrjRDDyZgtWeTwO3LyaG7NnSFUSvwdu8Vz6p+NaWwQDcF1PhaaJdLZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q4GAS9G4; arc=fail smtp.client-ip=40.107.96.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q4GAS9G4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmZndJ2J+eCZ30CuYMnNxPxwZpKrj0jhbDo2VtWWAi/bzHPPADfge29ammDf+BOEMqybSf4cPPIgLu46qFgx4coSlfVBxFaEURmIghYtnaFmFFffSGQoLqxFnNZ+LA7h7EAU2Hm3qgMQTFz6h8s7EEtKVD0qAkZb3k4WCHafSyDPdgJnOzzbNvbJwVoQrIBggryZXn8igJZpCmBmD05VddfBkophC1h0d9gsQ268Msnn2siHnrjoMwEhPGJFMMMamlCdbfkgd3reM2KNwJmYg7dpbqt1t3fxFdwBYFNhIDG98isvn7hWQjPwnKJj79TjYMCE/I3sjkSFeEiM/ZoeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LerbDdB8OioLwoGaVZhCv6R0bgWBUYL40J9Nq5Nc/Hs=;
 b=FmLTqjKoyyeZ62mg5A6+IIb+c1zNv9+o76db5E5C13k3kwmk9kL1LVWFImzN2ASGgDg3T3POBRF8oJURh718X8+mRgEahdfCdTMJYfaFg2loh/fxrN/2HlAfRJBhzuByij/6mOaCNi2nkzCOvm98kpO7iV8OjS/1PyfiNsBpLNKpzgdQAm+1LuMFItL15O+2VCR382UQZP9A/OdwZ4/7+9W6D0uSa7Q+/v5s01RVw/9uUkTKSyjsP/Mh5hE0uLUr0M6TsG/51Aj5OZnItChEBWImDgB8gtXIYvGOswgtu3Cw6KYa8NsFHbCzEHWqXxekUyADHbEekOKcdzyOw2a0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LerbDdB8OioLwoGaVZhCv6R0bgWBUYL40J9Nq5Nc/Hs=;
 b=Q4GAS9G4470u/NwofMe8V9Wt4VwkLMQr+Z/bNfIZ4QVuv53VAWa0LOnJ3eoYYiYYI/n91ybSXDUOV2eUoPam3D+izzT0a3OYDwCk5usnGSwCd6nF/3SQNANAZf6NZjBGaXrDpeDf2ZXv5P5s7mhTCxHeqSa33HJn+Xz6TMNxf6KcoLAUjD3zHVgNbJyCnN8S8qelltLdHc2Mu5qv+s0MJsiyiVSEYUjy99qhgs8eIG+oykU5yZ0wZ63W0EK1uFjbftDFRXMW28rO3+rDUn5iLn5qLCk9wXEwJIdNPli28nFSKV4UTWr8CZOYNl8VG+j7dQBgS3AGOGBM5yuKiyaw/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 15 May
 2025 18:00:08 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 18:00:08 +0000
Message-ID: <f42b0165-092a-4e58-abb4-a8d59bba5cab@nvidia.com>
Date: Thu, 15 May 2025 11:00:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/25] x86/resctrl: Move the resctrl filesystem code
 to /fs/resctrl
To: Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250515165855.31452-1-james.morse@arm.com>
 <20250515175054.GKaCYpfoCe0b7QyIqL@fat_crate.local>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250515175054.GKaCYpfoCe0b7QyIqL@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: cba88b37-7572-449a-1183-08dd93da53ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2VnOTJwUTJreXR5QU9zNXpROUtCNXpKVjVNRTZYMzhTT2VsVkFMRXQvT3pW?=
 =?utf-8?B?UElDTUlhK1ordGl0VXkzT0xSNDFJUmdHV1JPay9qaVVoMzdrWVZ5UnRUb3hr?=
 =?utf-8?B?TVd5UFVYb0hVL0t3aGNtQm1ZVzRlWVlnNUJMOGZPQytpcEhjSzl1NHpnV3lT?=
 =?utf-8?B?RjhKWGtmSXpyNFA4aVg3cWJBdXBua2RZQk4zTjZqZ0g0VFlabTgxSFBDcHE5?=
 =?utf-8?B?U2RiMW5pd2w4azByOWZyUi9Ra2c4MVBrZUhIdXBFbFBPUXVubGR2QWVaeXdh?=
 =?utf-8?B?R3NMd3QwTXJSdElyZHFsOU9RVUVlSFRQSWRTWldBYkdvZWFDSlh0ZVBiNEZO?=
 =?utf-8?B?NWxSTkYzemxPdGpFdDV4L0JUOWRLV2w1MnAyNjUyN0ZhVXFFQm11S3NhTGhF?=
 =?utf-8?B?N3MxOHVaamR3MWNIVjA0NmVYc0wwaS9qYkhvdDRhd3RleFVvNVJhbXpDL2oz?=
 =?utf-8?B?Q1ZZU0JSVktyUnNVUjZLYndtQlBTMnRTR3JrZ3JCczZteEkzQzM4TVFqQWFk?=
 =?utf-8?B?NFp1MWZSTWx2SHZzS0l1RU1kRWNpTHQ4VXBqcWFGM0JrTGZMY2Fscm9aOWl0?=
 =?utf-8?B?Y2pOL0ZVMGFWVHRZaGwrcEdWQS9vcVlVbGJac3MvWHBGZ2ZiK2p5VHpqVCtF?=
 =?utf-8?B?UjlDL1J3eVE3ZjNBRkhHK2toTXFDRTlJcXNOelM3b1ByaTFMUElDUVJBL2lG?=
 =?utf-8?B?TEZuQjJ0ZHVCVjdpRzZRdThsRE1Rb05xYnZMdEplTUF5RStPZk12VVBIcTh1?=
 =?utf-8?B?b0RvQmlDZVdtMDd6MGY5MWFjcUYvMjU2a3dQUzNLWFFNZHJwdnUrUmcvazFa?=
 =?utf-8?B?TG5kbFFmRGY5Zkl1a25aWEliYVJWTGtUbWZOdy80OFpnQ2s0Mk9ZeGZiSFVC?=
 =?utf-8?B?ak5SS1c0OTlOZHFpbnRmWTh2K1JPV0JRaVhCUXhHdERnWmwwNlNjdW5laFV2?=
 =?utf-8?B?Z05uQU04N2podnZaNzF1bTFlalprWlFIUFBqMXRScmpPNDNFcmduODU5VEwv?=
 =?utf-8?B?L3FtK3pzWk1xQ2RhaXdzWnJxVFdkOFoxUGpUcU51VTBOT0MyWFZKMXNiNDY3?=
 =?utf-8?B?M2NuSnlIWWt1emRVdEJQVXkraEt6NXBEMXlwcitMdld0bHhQM0hFeHQreUZQ?=
 =?utf-8?B?Uy9qMjZMamhMc2VZQTVSeWhDTlU0QkFWRGtnUkhzWXlGZVcxZE1MTUFzQjJy?=
 =?utf-8?B?dHB0aE11dWV6VmhObFE1ODlTbC9ER1BxOVd1RzVKUHM1VzcyVXh6VVpFNUFq?=
 =?utf-8?B?d1lzZ2VJQXYyOVBLMzlnSkc0aTgveENuVHNxNk5TaDJHWW1xUWMrdm9pczln?=
 =?utf-8?B?NUNGTExOQ0xSVDR6aHdhV3VFU083UmVVRENFaDlEd3cwVmJYdWtGYS9vTW85?=
 =?utf-8?B?WGUyc3V6UzBiWHBBMFJyM3BROGttNWRuZFNKK1Z3dFBlQUsvWjhwb2tXeHhz?=
 =?utf-8?B?em84Z2QwRXhtRXBmL0pEN2d4MFBKc0tsVzhlcjhtdkRKeDZwanlQbGV0SlBh?=
 =?utf-8?B?RFc1d21jTFNycDcyZWNtenErekVrc2p3TUFzTHVjbXBUOG1WTFlhSkdUMWo3?=
 =?utf-8?B?b3pLY25iZjJ3akFIWWs4UXFIZTBBeENqUEZhS3RBTEdhKytuZnltVlZGWGsy?=
 =?utf-8?B?UjJSdGdvNGlVYWtpaENGWDlLOUFhUG55VTh0VkhlczF3ZDU2dkNPTWtRdHZQ?=
 =?utf-8?B?NVR1dFBrWDk0Ty9lUVJjb256SitnMkRNVFQvWFVXZEc3WUFaQmkzTkN2akR6?=
 =?utf-8?B?Q0lpUENjblpCem9ITzVyWERiellSajhocVlIRVFGUVVDSGErNVN0RnFHSkZj?=
 =?utf-8?B?eVdNUDR3MmNrRkt0R1gzaExCM29LMEExWUtodzd2Z2pWOEpHdHhrbzR2cEFz?=
 =?utf-8?B?THhMVmhJMm5lV05aS1FuVDUxeUtCRUdXY0VnNUtSUHdzaWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1lVYlRNdTNRSG9SWGhRU2VYMTQwV3E3eXI0bENLcC96ZVB3NitQQXFRMWlS?=
 =?utf-8?B?V2tGNWZmYUNYRHYrVUpCVlJxY2gyQ1JCV01ER3NDM1VRTE83Q0pCdFRlRnNy?=
 =?utf-8?B?NDcwcVBWQmNudEkzUkIwVC9JL3FpVWxuWllOQVhFK1hUQkUyK0FBc2d3clBa?=
 =?utf-8?B?c2JmTCsyd0lKNlBGWDdvVVRSc2ZmelY3elBZaGRDSVZzUEZ2alE1ZExDR2ov?=
 =?utf-8?B?ekxSak1hdnB2ZG5BNWlETThMbEdCZ2RxSEtkUGZYbGo0TFBleWVlV2JjWHJ4?=
 =?utf-8?B?dW4zMzNFOTNJN0RyQzd0eHllWktVOXNadGw3R0JYbVI2akxNQWRQcFo0d25u?=
 =?utf-8?B?aHdjZ0gxenZHS1JtRXJOYjFrSFd3czg4N1BZNThiazZUQWpzbWNlM3l0MHVu?=
 =?utf-8?B?QVc3VVRTOU5UeTBMVzJJQ0FxdEY1RFNJYzZUQTFjekx3OGJoSnBuaUx4ejF3?=
 =?utf-8?B?VDFyRHBJblU1KzRmbXcwR2VEWnJTajBFaE1UNlJLRURZenBRNmtRbVBJOFRD?=
 =?utf-8?B?R0VxMUw5VHlGSDFyOEdqTmVaakUwa2prTG5GenpTK0QrdGRoaGJLR245b0lS?=
 =?utf-8?B?b2JpbC9JM1g5NDdhL1NEMHRhVGQ1aXFIanRvNW92ZWt1MWFjOFkwSWVVK3pW?=
 =?utf-8?B?S3pVRnhYNHg1ZEdjSjlPVU5HRUF5QVJUNExmOFFUTHA3NjhpZUhrQ1BQb0hM?=
 =?utf-8?B?RjdoZHlkZEpyb0FYNlJLNEdqdkpRVFpMQmFKS2drN1VuRUlORzlqa0hSajdO?=
 =?utf-8?B?MlVROXNhcUV4dGdOaGpJampuV1k5ZXA3NGs4NEdxS2NkeHZsZ1cyL0ZvNkRi?=
 =?utf-8?B?NkszMFdQYWI5cUFzWW9OcnVWSmRaNFRBRC8vMnZXM2psemFmY21wV0t0T21s?=
 =?utf-8?B?emovdk00L1liMVV3dGRxb1pmT0kyTjJpQ25CdTFJb256U1NBMWVERFhNeUZ3?=
 =?utf-8?B?SzUvUGhrSGU5dVEzYlhpcjRqUENpdm5QbXdMSldzOE5ZaVp5SktrT2hPOHNj?=
 =?utf-8?B?NURmYVpXU2FXajVUUVlDd29kL0pWVlBOMXA3Y3JyK0ZGR1FnQ1hUZHFoek1w?=
 =?utf-8?B?blN5TUc4V0JxMU5wV1dieFhKRXVBbTVyUEhvUUExUlhwdmczQVpXeHBlMjZP?=
 =?utf-8?B?bzNQTkxrRkNsSUdGS2ZjV2VkU1hZaHArM3lOK3dLaUdadlBvd1BybEl0Qmk3?=
 =?utf-8?B?eWcycmpSNFhpS1VTczBtcG4xQ3dLeDVraVU3WEMvRjVuTWFtdzlYSERZSXR3?=
 =?utf-8?B?NENENUUyY3FYK1RVcE9pS0ViMXBXcGJrZVh5MkV0V0hGSnlQelJWQjFtSGE2?=
 =?utf-8?B?VURONitoM0tOQjY5clRDNlpyd25oWHQxa1JDZ0J2UHRzVjk3K29sVDVmYity?=
 =?utf-8?B?QTFObnN6czJYaDFoU3hFMElsZzJZMnZkc09HOWV5WitYeEF1LzJDVzJBMk5h?=
 =?utf-8?B?Vmt1SGp3MFlwSWxYRUFwQ2ZlSVYwRlZad1A3Unc2Z2QxWGZxQ21SbVMyK0pG?=
 =?utf-8?B?RHRMdFNsRlNRa2lmMzN5c1U0VVg1a1llVkF1NjZhUkl1VnNHbnVDdUJweGV3?=
 =?utf-8?B?ZXg4QkViZHlmbnZnb1hqSHAzTHN6Z1Nub3FkZVc3SkZPWXRkQTF1RVc0RExn?=
 =?utf-8?B?dGtmRTIrbHpxVU5GaFozTEY3VGdnbk54bEtMREo5azRCU2dHekJxYWQrSHFB?=
 =?utf-8?B?ZFpNUXpQUGdVNUVMWHJlVXJ2UC9NNk9HR29abmZVNEgvalJxaHl1NURLMTF3?=
 =?utf-8?B?Q3ZRQzlUZENCNlExWHpTZ2g1eDhTMVN1Q3hzQ1JyYVlUUThJZDExdmRMWUJ1?=
 =?utf-8?B?emNyMXF0UzFwYnBpb1BudHFwY0FudTNLbTkyV1BQU2d1dmd6bURwcEJId1M0?=
 =?utf-8?B?NXNtUzRsdkF0RysvUHJzendFZ1pveTcybkFHS3ZrQ2h3SGlubjNZMy9kVXlX?=
 =?utf-8?B?c3kxbEhJeEtha3l5ZlpCTWZZSUZ4dTlMMk1TQzZ1dW9CbkFvV0taUWZXTi8x?=
 =?utf-8?B?cTY2YS8xNDNtcGJPVUVqRCt2UnFjcWZiTWRRN0IxNC9sbkoxTFlwL0lpcm1x?=
 =?utf-8?B?dWd1cWk3c09mT1NwaXBkaUVrMHp1cU53SEtoc1A4RlhNMWJkd3ppL2lVdVF6?=
 =?utf-8?Q?9Enwf8deuNG7IuA2ZBItm3AAe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba88b37-7572-449a-1183-08dd93da53ff
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:00:07.9523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWAJGwHevvb2PG8HMNcEWE6PyhZDJEwKmo1iV4mQPlli64IYi1gsIzY5nELm2x9VwN4iFo+K1HCU+JdOQycD1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170


On 5/15/25 10:50, Borislav Petkov wrote:
> On Thu, May 15, 2025 at 04:58:30PM +0000, James Morse wrote:
>> Hello!
>>
>> No code changes since v11 - this is the 'final' form of the series
>> with patches v11:24-29 squashed together. See [v11] for the breakdown.
> Thx, lemme see if I can queue them...
>
I build and test this series. Everything looks good to me.

Thanks.

-Fenghua

