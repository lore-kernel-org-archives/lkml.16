Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DEA25F79E;
	Tue, 29 Apr 2025 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956747; cv=fail; b=oJrcXmlq631kEbbLaokpEzkcu6m2EMdetIxHVJOs9pZ6nzxp3J2ob9F6fcVHegy36TLdyJnYY68TIyGc/tGy1c9P4LAz9/hX7UjWQES56JDC2l5e6ZilkumPS7p36ap3jeCsBhNtoqFDvj7rX37sepyr5hOs7dab/3oRfqd+bOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956747; c=relaxed/simple;
	bh=vg9WdbS1gBnLF2iEooNZsHa2w4x4ZCsVnndFjOC/AiM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SKRpQxYHww1H67wfFW/9odyMwHkEUXw5ZKV8BqDh3gEQRaJz9YwtesKYl2M4ID6f4lwLkyFhcHXcsgps3z0yWInEe9/8+2aaGrpmcgZPEYne4Aa1ZYJ0uhWRjA+ZF4rIjxqivcXzz2lZdy6fFJPaefWxZSNvhIfrfdUN/MYtPSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zn35JG6n; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zn35JG6n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZbsJCy49hwavNpNUESvmCAw4Gs4MZY/CBLfpQNSzalUdDR02kPQqNdpBAsgCT1BUZ4CNF2eJMfW4e1ArGixdDuVZKskptMNgc2zB3y5v3GstIdCa1RZUfcKFU7L9q8X8Hi5s1zB985+HXchO3pDyonMjWiTdcmu32NXYu/VP0gGtc/FT3FzujoxR5aIFFTXwXedjAv3xr+rfM84v6Oo7LhEA66V6D1QZxsofHP8SvTjp6GmyoTB5arR8OlDgbEjRMRA+jU5zSomCsLG8nL5PPbH/5OdHZ7Hy2ULeDQzQGzxSZ+PRpyBe+3GnXrZfa2nYAGLaTxRzaMsPspBkRKVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4L0nqyznJ5MrAaVo4nCHHqNEdcMzBgmS+bO7uirms7w=;
 b=cfX3be9X6a6dcFjzL/RnBZ+F+NmzS9oPKpfxc6RD8+O27rR5AUoJZxiypIhIRGNkgPE9hkCLbskMG98S9sC6zcajWN+swwYvkSiNXlMCVZcPKWBJxmKQ/niVsDF40lZkQsg633mD9X/ozQAuLnX81f90Ncv+bSNhgcBCWMntpqqZDv0den94EC1aHpkBHp7mwu3mxcLtY47tXOAz8Mi9nf2l9qMkwmYbgkBQ+DZ/LilZrFT2R7I0QomZGmIq26KwqAsIkEqER+aYONVq06grtqLf6mwn/98IvJtl4BJo8Ns3Pyjl3fEneDWldd48NKymhOxpcuULlwzjDza4xjAkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4L0nqyznJ5MrAaVo4nCHHqNEdcMzBgmS+bO7uirms7w=;
 b=Zn35JG6nvMcfafvppdBwE6fZVKMF2+WHahXY+z6p07UYQxnU6ObMf8FOK2VLTjpxYUzWXNffHQYVuvj2kGSr4vOPH+IakqYlel2ahbpSZFWtvkIReJ7MiQURp0YzUUnIenNjE5FvbqkD59+1XYm6gmTrMb+IkrTZ/YeQqPYb0ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 19:59:02 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 19:59:02 +0000
Message-ID: <9bb289c9-6aef-4900-bd94-c4ae6b246641@amd.com>
Date: Tue, 29 Apr 2025 15:58:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf
 <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250417182923.1836092-1-pratap.nirujogi@amd.com>
 <b6701589-4aa9-4988-8b28-4b0ae60daa43@gmx.de>
 <7d17ec49-e075-4b04-ab00-3eeabf58c4f2@amd.com>
 <911a1642-2cd9-4619-b409-6df8aae82ca9@amd.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <911a1642-2cd9-4619-b409-6df8aae82ca9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0165.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::8) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffdf0c2-a8d5-4b1b-9112-08dd87584992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXUwUnZmeEM1UkszeUJiU05IZVBraGFaQXBwYWVnWVA4Smg0dk1jSks2bVRP?=
 =?utf-8?B?bVNvbTJNS3UvWXFqdVorYk82eFUwZ25Kdm5Zc0dFd2NJY3I5eXc1Vk1ISzRl?=
 =?utf-8?B?cXBlb1BMblBoQWtmNzNiaHQ4Zko4cC9DdFdQeW9VanE0ZUV0L2FkN1M1dU14?=
 =?utf-8?B?Tjk0dTBkOTJZSHA4VlZqYndvcnRIWmZCK0lybzI5M1Z0cFpkZDhVU1J2RmZ0?=
 =?utf-8?B?eVdFVnVsN1U0bXByNFJSS2FDRDZEOVFleENyMkIxUEZmVnQzQ1kveEVjZkNE?=
 =?utf-8?B?Rk5hMnB4QlhKUGNaNURRRCs5aEVnbGM5bDM5dXVhaGQwRno5VldYL2xzRWxH?=
 =?utf-8?B?TWQyUTVPb283SFhNUkp2V2lLSkViTDVoVmZnQURvbTFLYXcxQXlNQlZyMWRW?=
 =?utf-8?B?dlBlYWI3QVhwN1A0SDV1dE1IQ0h4ZXBsL1VSOW95dnExZmxEcTIvTGJtOGJt?=
 =?utf-8?B?dkwvczE1V3grZ3Q4ZFVXTTdkY1dLa0xLdElDWE9LVmhOcm9aTXV3VEI4QTRl?=
 =?utf-8?B?T1ZxVldnWTZWamV1SFRJTFFxdyt4a09PdG1JcW9CUTZyYTBYTVdxNytlbWdH?=
 =?utf-8?B?M3ZwY044WUpQNEN5MVVxaFhjblhHamF1U2VNdms0Nys2K3g1c0xBWVNXZ1Jz?=
 =?utf-8?B?cnUwMGxPR1NvL2NuODZQbThMZHNsM05lT0x3ei95RzU1eDh0NG5nZ1QzZ0Rn?=
 =?utf-8?B?VFY2YlFwZE85OVIySW9kaEV5TUZ0dTF0b3ZkYW1aK3h1OXFVa0JWWXkxVjFN?=
 =?utf-8?B?dWp0Vi9CQ1REendWWThYRnVYemIvQ3daeHpld2lwL2RNQ01HNTh6TUdXemx5?=
 =?utf-8?B?UWpnTTdpbk02SVltNUV1T2o0bXpwOW5qcjUyRWs0Y2RNcDRaV2Zzdmtaa21w?=
 =?utf-8?B?cXdYZVdwTEpyR0s0NXFqN0VNV0FPUEN4NTU1RHdiV09TeWhjZTlqOFp3bE5Y?=
 =?utf-8?B?bTNuRkxtZTN6SCtNMFBiWjlvRWovbVFqZTlQc2YvNTBBSytrNEhHejUzWjBK?=
 =?utf-8?B?YzFEZGdKV3d3M3BWRkNmODV4OUU5bmlxaUNNRUtMOUlNZ28rczlWLysva2s4?=
 =?utf-8?B?V0hVYjNxRVUxVjZiRmFRNUJubEpwSTc4UUhOWXVjZzl0cmlreEQxODgyUHpI?=
 =?utf-8?B?VzRxb09jV0ZvcmVqSjZiaVZ0SldXakpBM29qR1VHd1pWWE5yM3QyRUsyejBn?=
 =?utf-8?B?TDlha3E0T3o5dWRScDhOTWdsU1lpR1FOcVZpM205UTdTQ1MwSjN6WndPZld5?=
 =?utf-8?B?UTdZRWs0eVpIeTIwZjNQSjZxMHZDQlJnMVI3NEtwTk4yY0ZxN2NGSGk5WFJC?=
 =?utf-8?B?SzNqdVNSeXRxM2RzRkdINnE0MXNVZjFhVjhPMURPK0wydVBHNzFIVzBQbWxk?=
 =?utf-8?B?TWlRalVaSWFmRUx2SzhiSURJZ3VmNHpSRnlEcVNXNnFDdmo2em9taHlrdjZV?=
 =?utf-8?B?MkRGbUpNekR2ZVBDZGVhektjd290bmMySi9UYkcwNkpPQUp2R2lUeUFOUWxE?=
 =?utf-8?B?VVk5ZEg0SHNWRFlKekdLcDZkZUNCeHZ5YWtKUW4xRy94Q2lzTDV6dVBwSVA5?=
 =?utf-8?B?UkhMN055VWF2eW80Tllza3YxbDg2MGFHZk4yWFIydXhOc2EvQk1sVVd3MnB5?=
 =?utf-8?B?RnM5bXB4eDRnVWp1eVV4bTBCYlZubXdZSm91L0JHZ2pBN1BiWWNVQlRBd3pV?=
 =?utf-8?B?ZUY4cWpHYVhNcHZnOGg5Ym1PQUJNbVg5c1hFbFNOMWd6VTNCM0V3NEZYcG11?=
 =?utf-8?B?ZSsyOWdVa0FBbG85ZHhSL1grUC91M1BPNEExQVA5V3FGV1lsNzNURmF2cmFL?=
 =?utf-8?B?dE96LzhXRmdPWk9XMFB6dHhBVGZSbUloTWZDbjJOVW9EMUpGRlRDYWRTTEpJ?=
 =?utf-8?B?bVBnYTNCVllGcUc3UVNFOFEvYjY0ZFlQYVN2NGpSVTdKeVhHQ1VFYlp1dVph?=
 =?utf-8?Q?1Xhucgcd1Vk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRISnlTRXRKdE5mTEVvblkvVVdNelBVQXE0Qk91WGRaUnZHSzRnVUF4SWZT?=
 =?utf-8?B?SHl2SDhlZTAzVzNOV3VldEc1Rk9ERWJMTHV5elZHMDN5a1FCMEdWVjZvVkJr?=
 =?utf-8?B?NWs1OUphMTZUOXBtQ2F0SHdId3FNRXc3ajdScWNOcUtlV0I5d09SZi80dVVn?=
 =?utf-8?B?Ym9MR09TemI3VDJ6RDdJSjdJdnZQTC9lZ3BwbmN2MmMxbHFXMWp5cCtmTDZk?=
 =?utf-8?B?Qjhhc2RwTk1LbkoxOURmZm9meTE0VUw4a1VVQmJaNnowSDJNaUxCS1gxa1Jk?=
 =?utf-8?B?MElndjVVaGJkQnZBaFFDakhDSk9qa2J4QlhhOXA4OHVIOUpGd0E2Vkk1WXVI?=
 =?utf-8?B?ZzJXRmgwd3JRWlpyL1VnekxhWFM2eS9YbzFJY05zc1VhY0Npc3hGTHlLNUQ2?=
 =?utf-8?B?WlRLWTlnRjhYRkY3WGcvRjRURzg2NUNzWU05d3VPRS9MYzNQeVF4MG84dlVC?=
 =?utf-8?B?R2xNSGo3Tit1MUpTV1ZUN05ZVEpDYWZZajQ4bEViV1R1UWN1Z1Vtb0ZUNlJn?=
 =?utf-8?B?OVl4VndFenkrdDNHWjlLSVF1dk5yeTdrYWkrTGhPRUhudlAwY21hd1QwK0x5?=
 =?utf-8?B?dVY3MFBZYmFEa3ZFVzBWZENIT3JtN0hHMG1iZnpPNEFLOVozQ3lZaVhGN1Ur?=
 =?utf-8?B?cEk2andJeVozeGZSS0FpbVZidnZnRDB5OEhoU3U3REV0Mko3TTB0K3lxQVhE?=
 =?utf-8?B?NHVZRFpSTGgvU0NXVFRWRDhxKzdoUUJubDZ5MnVHWW91c1BkTlo5TlAyWjZE?=
 =?utf-8?B?S3lKd3dGRTVLQm5FUzZsbWlrWTZlc3pOVDFNZFl3ajRPUkhnVUZ2elBTTDdM?=
 =?utf-8?B?eVRKRVFDUTE1OVlycms3QUN2ZGhYS0xnYk9iTU5lSERqa213QjVmZGUwcG5w?=
 =?utf-8?B?cjRsSjQvWlRrOEF5bndsUnZDUytsNVg2SzN5WlNDTnQ3eEV2VFN1VGx1cjhO?=
 =?utf-8?B?Qmk3eDdQcFAvQVhJR1BRYTRZVGpMUTE0a25NUWJWSEhnSWRiZTcvbVZVVkpD?=
 =?utf-8?B?R2x1WGRYUmF3TnNHc1hhYWI1M3hIOEI2YWRpL2FQbzBFRWxqY3RnN1ZXS25Z?=
 =?utf-8?B?WHpZM0hTNVJVeGdFTUZ4WTcxQ0VXeHkxZzYrdCtlZjZqQmZmdjdOdXIvSEpw?=
 =?utf-8?B?TzV3bC9OeXZRRlE3Q0Ntbm9XZkpLcFloTFgvdVBkTkJ3N0tVclFEYkp1UGVy?=
 =?utf-8?B?S3BEY085LzZGL0tzWlJ0MTdlUThMWnkwcjMvbzZ2WjZ4QjJzWmlBZ3dyVDd1?=
 =?utf-8?B?R1ZyNWV3MEgxL0h6UnVTa0tmaXY2eEtvbTVFRWg3UjVmNWFBeDNiRFZBc2Fu?=
 =?utf-8?B?TUJ1ZGdqWmxrT21TZmtnVHhZRnE4aVVZSG9Yd08rQ1hBSnJFOTUrN1lLMU8y?=
 =?utf-8?B?WDUyZnRNUVFsQlFYc0s5NzBDZy9hcjZ1MWIvQlZVdHZBZ3dZcmtYcWRHUFkx?=
 =?utf-8?B?Y3BiSWRKazFsMzV6c0lUSTZCaFpsNXUxRlVBMzdMVk9OYUpnTTZBa0VpWk5i?=
 =?utf-8?B?bWgyZXFBMmF4QjE3TkRhVjQzQnkxMGtWak5DYkgxbXBKazNrRU1uNFRLUW9y?=
 =?utf-8?B?YnBnQStaMVMrNU8weWl6eXQxZXRZV2lSbTdTWENKaUpISGZZSzh6dFZ3NXgw?=
 =?utf-8?B?aWRZQXQxaXp6QlJnc1Y0UUtnMEg4Njl3YmFuS3NnT00zOEpZTlhYRGVneWw2?=
 =?utf-8?B?SXVxRXJpTmF4YzM3QnVJZm1LVk5wcGl4SXZJV0F2S053d1RnQWxkMXkrNXFL?=
 =?utf-8?B?dXQyZlhhY0Q1bnpTOHNjV1BxWHVwbTlqUFU3RXRVdS9XWlBrbm8ybFFQZi9z?=
 =?utf-8?B?QVdBbml3c3JMTUJiaTY0QktxNmdNQmZzMzJ1cXdUTFlud2h3SlJ6em15TXBj?=
 =?utf-8?B?UW9XejErSVJZTExTRjZtUXlNdzVxdlc3M0JnOVhTYkZmQWlFbm9RWityOVB2?=
 =?utf-8?B?SGZnWHoxQUxiTW15WHVpd2FpWjRQNENTTjJsU2ZLU3hnQW03cHpuc0d6ZzRH?=
 =?utf-8?B?OGdQdGI1Z3F2TWtvQ3hnb0ZHTk5OOFNaWGdKMEFEcEVXZEtTUVhkMTF6V2hF?=
 =?utf-8?B?YTlVYkhpNWZaK1BvMjRQK3Vvcm5GcDErQnZsTDBjTWRuWGxJUEU2Q20wTUgz?=
 =?utf-8?Q?X+iIhvjPfgC7UDm0pfDPPVrkE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffdf0c2-a8d5-4b1b-9112-08dd87584992
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 19:59:02.0048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXH2F2DuNP09xhT4+i007Bt0spqrt7QOyZmGeUgshGaimKUrT7AuIgzz8Wb1ufGWKRcpM8PgS+ErSMqkZIuNQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510



On 4/29/2025 3:30 PM, Mario Limonciello wrote:
>>> Hi,
>>>
>>> just a question: when will the CONFIG_AMD_ISP4 symbol be introduced?
>>>
>> CONFIG_AMD_ISP4 will be introduced in the V4L2 ISP driver patches. We 
>> are working on isp driver patches and planning to submit once the 
>> review for x86/platform and sensor driver patches completes.
>>
> 
> I had a side bar conversation with Pratap on this and that dependency 
> isn't needed right now as no symbols are used from it.
> 
> The drivers are coming in different subsystems and can be enabled 
> independently.  That dependency can be dropped for the next version.

Thanks Mario. Yes, this driver has no strict dependency on ISP driver. I 
will drop this dependency in V8.

