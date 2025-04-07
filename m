Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8E21ABAC;
	Mon,  7 Apr 2025 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056783; cv=fail; b=tqpTgj8ryFLJTieuKeNjoVvmq4kVV8gkSGamBhwCBYybhH6eYzAeDuN9FLvSAWa98QcKWj1jamXuQ4c4XTo+/8v+Gata5XzU1qRS8RE5xthOAWBYv976f/FCjrufe+KKURLqSNYOjShysyehhtyvoXqGYMKRCaNMl3ivE13j8eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056783; c=relaxed/simple;
	bh=V8+v95+xFjOliT3g80PRszqQaTEQWU6Ne1zGMvPknGg=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d/BIGGpNaRSAuUiGWBrIASUxvdr+Cy7gX5Ciu4Um/56y7ZkxHvNg0tKj6cdfuA9Vg3fh8xCpA/sVDiKRwkLL/yCTbNjslMDuj58SaB4UWtG2F6eVds9V6U+2V5tGCeAGEVciSpy8X/4jUYkL05b+gm4jB91RsdSEuNiJ3ittbCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GnIorgtC; arc=fail smtp.client-ip=40.107.96.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GnIorgtC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLDMCcpBzN4BXneBablIpKMuQW9IPLF16UUKrWvE5Ij1XiudIyivj7lQj+aDML5VZTBL28AQxT9mU4/C8q8T40c4j/hfEu9M1ILvIhnJI3e39G7df5Ite9yOM6BFIG0rvAfh9VGG6v3uLS0rN+DxjUD5zS46ROlZEFgGdEhkehbjH0RO4zpxf4iI+yHr3+tXXKFGgSFcEVU8I/YxSB93OoN3ZZ5AP1UvoO2kaMToxO8vduRjzOyAEJVqVX1pGohcU3ayCDcqnOyaHC8WaGwa4lPUjSKslTii3jZ7HTCghFNsO3RrE9+91R5RND1P1aeGKVf0cPSygtaSfXami8Wcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN/YdP+ycLMpI4EYxohtGcw2OmXYzjuTbknR9MjZO/o=;
 b=KJg2x7gkKwpSuFU8NwOeQeMryCMBtJFsrt9LVvtMjkS66eE8FCFXhAf99TzJilIBc7eyg+22RsalBJseQawXr/eZ7LzZgL/G4C+B2MvMEQLA3tRNRrQvDAcjA904JzcgOTeI0xJXHDVFhHXWtFW+kTaIPJhJd4YMpDu8izG3YLmnlz6In55HAF2fElGNsB4Jg0daV0ForiKW/rxNl9WPWFSNzhMP5meF+U2qcGJ0xILDLOfql48dyWJNvNwbg32a0nN5UMZxHY9pJMN/hGLKIfUBf088scVXGuS7ceFS1l9EoXRe9Ip3YUZlV1pZk62pNpYop/bznuC2wQP7edkJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN/YdP+ycLMpI4EYxohtGcw2OmXYzjuTbknR9MjZO/o=;
 b=GnIorgtCuCg3U9Y5a925+3D+tohfT86ZWvxqRGsdWaL+Bm39D0CzmwI18ioVwFAWxD8oS72P54Ro3k+M/54ci7/ZpvxeCKKHNhWqXR2AGQfWugJkrv6L3Pnd7ygpnEK6yy4HImbSiaXv9QrpcAvGkv9MMQj5A6rsmBi3igs300w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 20:12:57 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 20:12:56 +0000
Message-ID: <251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com>
Date: Mon, 7 Apr 2025 15:12:50 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v3 0/7] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
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
 <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
Content-Language: en-US
In-Reply-To: <7c135464-d859-459b-b86d-e8c18f106fc4@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR01CA0026.prod.exchangelabs.com (2603:10b6:805:b6::39)
 To MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b50053b-0e65-4751-a825-08dd761095df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE5oTmpmaHV5R0dyWVFPNUhkb011TWw3NnpJYy9tS2RpU1ltZUQ1ajVPUm9J?=
 =?utf-8?B?aDdmQXJTazlxWjBLTjlVdk11Qy84cFJLeEhzMGpxbktGUkJWa2hNNk9taUp2?=
 =?utf-8?B?MDhISXhOVVBsaXJFSlBlRXprV3V3ZFRoZ3gxOEFFL3A4YThkOUZrV3RPTnow?=
 =?utf-8?B?eHRIcEdtREdmVnM0cG1uUkZIK2NQczRWSXNZZi9ZL0lCQ25PN2xSdENNQjg2?=
 =?utf-8?B?cDFpeEpRNnB1cEpEakFjV1ZkUytHb0JTQXJHWDUrMFQ3Zml2OW15UVg3WER1?=
 =?utf-8?B?Z0pJRmpKVnJvcW52c3NYcEJMYnE2aWFLQVdkNXpzRHMydTFXakZadldpL3NJ?=
 =?utf-8?B?UWZLQXl3SDBYeDcvK3JHd3VsMExkYWt2dkp0anEvbmorUjhvUHNsSDhpMXBS?=
 =?utf-8?B?cVYxQlJzeGlvNllsUVFtZXBHajVjaWc4ZFE5R05INGtCQ2xjN2M1YVlwZHds?=
 =?utf-8?B?WlFGRFF2Q3hqU2E3N1E5Z2FmM2oweldoQ3pHQWpHZG5XTk9laGNLR0JTQ3JM?=
 =?utf-8?B?VHFkZWxxbEp0NGhzeEJJWlY3STE0Zzl6Q3hoeVlOWjBpNFh1dWYyS24veUNm?=
 =?utf-8?B?cWhBejVQbEN2T21GWnJJS3JibHZQek1aS1dnaE5YazFLeDY2dDRYcGZNTEJR?=
 =?utf-8?B?NWRXN0NWZnpxbzBzRHFCYzFjTEJ6Q24rNHBLZGV1UW5lektTTU42WW0zMFVB?=
 =?utf-8?B?NVFBTUpaWjFuRGFNNWk3WFlaM2R6UVNTT0E3L1hpZHAwQStycVR5czRZdGR0?=
 =?utf-8?B?aW1CUHpxeDM1eURWQ3lnVTBraENSaUhQaGF5Q01xeUswZ0pEY094MzlKU1lh?=
 =?utf-8?B?T0VmelhpLzFrZ3ZJV1ZvbDlUNVFVai8zdytTTFNVa0pJM3JtKzZmRzFHUXdt?=
 =?utf-8?B?Q2d2SDNkSDJjZEtFSzJPUVMrZHJZblJHN2NNVnNnTXNvZXZQWEticHpXUWM0?=
 =?utf-8?B?dS9uMEpXQ1ZCWWJteHJqaUgyc1pUcCtHenp1S2dxM1UranV0SEplekwwZ1dT?=
 =?utf-8?B?YnNwV3Zqak9GNndELzQxLzlmd2xIYnpTTVNhelBTTmlUYkVsRHZwb2Fuc2Jt?=
 =?utf-8?B?WXhpTC96N1BXRkxJcEoydU5ackxleGNndlNNamtUNEowTEdsdkdZNGs1SnFt?=
 =?utf-8?B?RGlhZytoS0Z0cWtBd2FCT0R4L05zT1didmlRTnVMTjkrdzR5SXBCQS9PNDgr?=
 =?utf-8?B?WDljdDNHZ1ZidEJaUTd6c0R1YjZuWTUvTHhXakl4OHFnaUNlaVZ6UGRzS05n?=
 =?utf-8?B?aThaWk1rN3hNUGJHd295TGZjTjNGbVRzdldBSGR3TmU2YXczMEpoSnVHcnNJ?=
 =?utf-8?B?RlIxQk1LVGV3bUVBMVJJNFB0ekVJTlJKbytPTHcwajNwQXpxK2IxcXlkU0lU?=
 =?utf-8?B?OTJoZ3FNcEtMeitZbitIeGMrS1c1Qk8vZ3lrWWtTR3VFS2RieWNZYnFuQWNE?=
 =?utf-8?B?cmViMmxRdTYyZnc3OG9ONlhBTnhBUDJRdWtPcWYzak9pbDV2UDZpVGpvU1Y0?=
 =?utf-8?B?aDU0Qzd4Mnd4QzVTUlZQSDUvWUdnNE1TTWhQL1FWL0FxMjJsbzFyVWZqaGJD?=
 =?utf-8?B?dURKUEZXbFJ3NVpsbytWQTlxTkF6ekJYTlBGT2lBNHhvemJ2clcrb1VSQUdC?=
 =?utf-8?B?bWd5Um5PR2p4Qy9XYXdMSGJ0eGM5Vld2TjdPSW8rc2hQMDlVUVVDeC8yd3dv?=
 =?utf-8?B?QXVIRGJDWEd1R2h5cjhHRDEyOTdZM0ZITjQyZ243MEVURUdRQkd0Q3VMQktQ?=
 =?utf-8?B?WUlIa09RVFBoZlhxRlV3U2NsbzZZcUFEL3Y1R3NtbFZJaDV0WGl6NEljZnFN?=
 =?utf-8?B?U2t6MndpQUN4TlFmZE5YK0RsMDBCdUFTejlaQ3dvbExSVnlFNFdQeEhxejM5?=
 =?utf-8?Q?l1SykyynOw6Tc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFl5Y3lvbU1RYUZUVDZtSjNDd1BSQ2RLd2tMWGhxQmY2SnB3VzNHZzc0WGZp?=
 =?utf-8?B?N3VXVUlzeHV4elNuWE0xUzd0SVZIUFJBMDc3L3pRN2FmUzV0azBBZTNWWnBG?=
 =?utf-8?B?TUxrOU5SNzR0MXk5UXNUSENodVluUDdNMTJOZG5sWjZvNUFleGwxT3pGVmJY?=
 =?utf-8?B?Ti9WYkEvQmVrdGE2MmZraHRYU2hvdktHME5SSjdDcGkzRUVrSHBaQnBTTlVo?=
 =?utf-8?B?aVhZelRKb0xuMFlPZEJOd0FZYXZERjRBdW12UGpoKzhVcmptTWl1dnVOY2FB?=
 =?utf-8?B?VnppZ1c5Z0N6YkIxaGtEV2NmNzIxTEIvTnBUMGczODFITkVLdkFLcm9lcHNj?=
 =?utf-8?B?ckw4NUprNHZzTEI0MXdrbThmS042a0xYN0xzSkl0MklpZEdCcVNrSURnN29P?=
 =?utf-8?B?UVJ2MG5BUmVRVmJnL2FTM3ZHZ2NwcFlEcWo2Yng1UVRSc2lTbEd1TDByRi9l?=
 =?utf-8?B?bkFCOExaeVFDeDJ0Qy8wMUx5dkJBdzB5RUNrY2NNNFdSZVRWOHdwTWN0NW00?=
 =?utf-8?B?dVBhVFBTYTI4MlQwRU5KTWYvUkpOQ29TNzBpbVhVMDVSckQ0Vnp4cmtlYTR0?=
 =?utf-8?B?QWd4L1J5aW95azBKcmozallQVlVnRXFadjhSWXhoMkdWVHFjZTNqN0QvdlFM?=
 =?utf-8?B?eVRQZjB1NTBKK0c0NytXZG12OTYrUzlNRHdHR2dEeDRlcmpBUExqbElwYTh4?=
 =?utf-8?B?SjN6ZlptODZhL3d3Q2dkRHg3dElqQXd0VjVMa3kwRyszaklNaS9XWXNkaTVP?=
 =?utf-8?B?SXI4NzVWZmJkWDlOSGF4TnUrSkRmN0JuQ1E3UTF0b094c3VQMVN2bCtBc0tr?=
 =?utf-8?B?dGVZVEt0WE1IREN2RGtEZXdOSFBWb1hzS0dYbnRmTkFpbjdiR3BUWFU1T0Zu?=
 =?utf-8?B?ZzhGL1hXNEpSSi82OXVlQktQd01qeUFaVnpOSlNpbWRodXQvVDUxMURjeUc4?=
 =?utf-8?B?QUUyZkNqZnJ0aWRkak1CbmNDVUJjMTllejhRTmdwOEgvWVhZNXdxaTBWV1dS?=
 =?utf-8?B?MW1pOHdvWWJTN284eEZBczI1Z25TbGtNTkZaeUFnVGh3TDN2a3FGdVBkK3pk?=
 =?utf-8?B?S0FOOVlqWTN5aGorSkZySUEwVmlaWWdCVTk5NUlLUUw2dytVemlxMFZIaXBY?=
 =?utf-8?B?SFVzUjN2SUozVVE0T25UeXNyak5KY2FwTkdBdTRaUThVemVuU1pjT1JZbExL?=
 =?utf-8?B?STJrS3hZZnAvcEtOWEJwWHB5dzVSK3FDcmxWV0x0Um9WbElFcGhyY3lKOVVn?=
 =?utf-8?B?bHJRelJWR3U3b0Nvcm55cC9GY0NMa0poV0h4VTFweTBkLzJKbTFNWUJNSHdQ?=
 =?utf-8?B?c01CdXB2Q0JxRWRNUWpWTEIwc3hydExwSTFPMEU4M0w3eXcya09odGtVZWM2?=
 =?utf-8?B?QkFaK3duL3hXWCtocC9xa2I1TU5rM2Zya3lZOXFzNWpyOWhQckwxM1B5TTJx?=
 =?utf-8?B?dEg2aWRTSTNlZENzcytaZUtmbnAzYkdJY2ZaeE9MVmw5cTVYQlpqMU9WVngx?=
 =?utf-8?B?ajNkZ281cko1MlhaeXJTOTNOOUY0TTJUM05sR1o2R3lja2gyZHQ1aWVzSWhX?=
 =?utf-8?B?dmphRzU5Z1hSdS9aYWQyaW9PSHRVQXo5V0kwczJRNzVJMTJ0cDZNWXR3eFpw?=
 =?utf-8?B?V3V3dVQyUkYwRDdBcklDYXUxb05INEVkSDhsN3g0cG84bWxUMzU4UzJOejZn?=
 =?utf-8?B?ZzRYamJXSXhuOHJyd2g0V0d5YXBuZmgzcTZUcjFDajNDd1B4MElYNVFDcHBq?=
 =?utf-8?B?aVNlQjhjZGtPZlZ0QnhSOUtPaE9wSkp0Q215dGpSYXVsdGduRCtQb0VSOE5h?=
 =?utf-8?B?ZUFGL1RUMlQwTERKTmxBbjl5OG1Zekl6L1BIYmRER3ZFV3VyRkMwL1RiRFlt?=
 =?utf-8?B?ajZxcWJUZG9TV0JUb25HaUtRRG1HRnlGa0RKeURDdm14bVVPZFI4ZitHbEVF?=
 =?utf-8?B?cUg0NmZiKzAvOVNKYnExNS9ha0Y5WFZUYXk4RjF4VFkzVEZlYjRSU2g5TFh2?=
 =?utf-8?B?bzVkVUR6Zjc3cW85UW5yY1R1aEVBZ1IwckJlYlpNMFVTZ3lmVkZaN1ZEaGdF?=
 =?utf-8?B?WisrZWVOY0VHdWpURm1CUDZjbUYvVU1UT1VTdWYxaUJkWGFrN29TS2NteTRs?=
 =?utf-8?Q?znpA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b50053b-0e65-4751-a825-08dd761095df
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:12:56.4679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjrWsfDXAv5Udt/alznqVYge7wCMg4i+CVgaS4ZNTHA2cKzcW9YaNDUVyRMfby49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315

Hi Reinette,

Thanks for the feedback. Sorry for the delay.

On 3/21/25 17:50, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/30/25 1:20 PM, Babu Moger wrote:
>>
>> This series adds the support for L3 Smart Data Cache Injection Allocation
>> Enforcement (SDCIAE) to resctrl infrastructure. It is refered as io_alloc
> 
> "refered as" -> "referred to as"?

sure.

> 
>> in resctrl subsystem.
>>
> 
> ...
> 
>>
>> # Linux Implementation
>>
>> Feature adds following interface files when the resctrl "io_alloc" feature is
>> supported:
> 
> Please note that, for example when L3 supports io_alloc but L2 does not, the
> implementation also creates the files for L2 (since it sets flags for all
> cache resources). "io_alloc" may just be present for resource that does not
> actually support "io_alloc". (more below)
> 
>>
>> /sys/fs/resctrl/info/L3/io_alloc: Reports the feature status. Feature can be
>> 				  enabled/disabled by writing to the interface.
>>
>> /sys/fs/resctrl/info/L3/io_alloc_cbm: Capacity Bit Masks (CBMs) available to SDCI
>> 				      supported IO devices. CBM can be configured
> 
> (please use imperative tone throughout)

ok.

> 
>> 				      by writing to the interface in the following
>> 				      format::
> 
> ("in the following format" is not followed by a format example as expected)

Sure.
> 
>> # Examples
>>
>> a. Check if io_alloc feature is available
>> 	#mount -t resctrl resctrl /sys/fs/resctrl/
>>
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc
>> 	0
> 
> Considering that io_alloc will be present for resources that may not support
> io_alloc I think it may be helpful if it instead display "enabled/disabled/not supported".
> User space can still interact with the file with typical boolean variants recognized
> by kstrtobool()

Sounds good.

> 
>>
>> b. Enable the io_alloc feature. 
>>
>> 	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 
>>
>> c. Check the CBM values for the io_alloc feature.
>>
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
>> 	L3:0=ffff;1=ffff
> 
> Is it expected that more resources may support IO alloc?

No. There is no plan for that.

> In above output the resource name is redundant, but if
> more resources could support IO allocation then it may
> be more intuitive to move io_alloc_cbm one level up in hierarchy
> and keep resource name in output in order to potentially
> manage multiple resources. I do not see impact on feature
> in current design if files are kept within resource directories,
> but in that case the name seems redundant.

Yea. Will remove "L3".  Just keep 0=ffff;1=ffff

> 
>>
>> d. Change the CBM value for the domain 1:
>> 	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
>>
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
>> 	L3:0=ffff;1=00ff
>>
>> d. Disable io_alloc feature and exit.
>>
>> 	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
>> 	#umount /sys/fs/resctrl/
>>
> 
> AMD also supports what is exposed to user space as "shareable_bits". According
> to APM:
> 	Depending on the implementation, some portions of the L3 Cache may be
> 	shared by other system functions or used for some other purpose not
> 	under the control of the PQOS feature set. The L3 Cache Allocation
> 	Sharing Mask returned by CPUID Fn0000_0010_EBX_x1[L3ShareAllocMask] is a
> 	bitmask that represents portions of the L3 that may be shared by those
> 	functions.

Here is the complete text.

The L3 Cache allocation sharing mask (L3ShareAllocMask) returned in EBX by
CPUID Fn0000_0010 with ECX=1 is a bit vector which represents portions of
the cache which may be shared with other system entities or used for some
other purpose not under the control of the QOS feature set. When software
sets a bit in one of the L3_MASK_n registers at the same bit positions a
bit in the L3ShareAllocMask, processors executing with the corresponding
COS will competitively share that portion of the cache with the other
function. If this mask is all 0’s, then there is no other entity in the
system competing with the processors for use of the L3 cache.

The "L3ShareAllocMask" is always reported as 0 on AMD systems.

> Could you please include what (if any) the relationship is between the CBM
> discoverable via Fn0000_0010_EBX_x1[L3ShareAllocMask] and the CBM of 
> "highest-supported L3_MASK_n register" when SDCIAE is enabled?

No. There is no relationship in here.

> 
> On the resctrl interface side the documentation currently states:
> 
> 	"shareable_bits":                                                               
> 		Bitmask of shareable resource with other executing              
> 		entities (e.g. I/O). User can use this when                     
> 		setting up exclusive cache partitions. Note that                
> 		some platforms support devices that have their                  
> 		own settings for cache use which can over-ride                  
> 		these bits.                             
> 
> Even though this was originally used to expose the content of
> Fn0000_0010_EBX_x1[L3ShareAllocMask] the intent of the content does
> seem to also apply to the "io_alloc" CBM also.

It says "shared by other system functions or used for some other purpose
not under the control of the PQOS feature set".

"io_alloc" is PQOS feature set. I feel it should not affect "shareable_bits".

> 
> I also expect "bit_usage" to appropriately reflect the io_alloc mask.
>>From what I can tell SDCIAE does not enforce isolation between hardware and
> software use of these cache allocations so it does seem to me that the
> existing legends apply. 
> 
> Reinette
> 
> 

-- 
Thanks
Babu Moger
