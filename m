Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33A1A2632;
	Wed, 18 Jun 2025 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274875; cv=fail; b=bYxRQd0YZtgP+3kNY+5YPzpY691eVxHqSJjRtkKcyl34xiLmY7t2ikbwsgXz74XfLPacGqU7zyNB3+xrCrl0wDMJ3xZhuitTB4SBAl55sX4v9huMDFnS5kEPBeVQJbGIyw27zwsZVSbkjcxo62+iB9XMhC1QwcJNioj4QVUTBQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274875; c=relaxed/simple;
	bh=UIoV7y5CEagt0QyDbIKYjzqH0GE8YVv49EZ+B3u44F0=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GV0486VGODiS7ZTg6OFFvWXvQmL/sIVZvL4QTcsUieJV0DXT3l+h4Ubk0M6AJFuHXczx7FUzCY0b65SwYVmrzKKFXHPlna3NJqmYQdY3kOn23mhJ0StXZeSwUrFfnnkslrp7DM8FMW5Y7ELDG8JYCChtQ+pr7lzkxGElc80oqVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n0rEf2CO; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n0rEf2CO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ow0RM8XvV58hURUyf6P94aLSfl5ncp5CvP/LqXrtvS3rEnx2cGWVF3TjDHUbaTUQB2uIWFkmCFupkJ50LdzHP1ty9zUst6mOZVMo+cbpP17Np126KHtucd4bBYqxzYjDCnnsnGewiQWFLIVmQMwrjFnwYiwMauYWoMXu5pM7DnAKYizYAVPgv86GjatNUYP1R99omeoUFVGB/JrxIyusGN4sykRpJpBFhyH4y/MStVh2B3BWL2C8r3LJuPGej9RVK2rtvLluf6WVa2PSdjqV2XtrH+CYFoYrl/kep4gK79RtNP8CGEyc6CCVLHpq3IpoK3sd6TxQ9XSS4xkALSgN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtDZMSqB8q7M6Pk5vPSrn2BPGUrCxeocKAkI/BFkKkw=;
 b=m8M34hmgmCqeGZmlUOjxpkLlcyn+un9SIu+QzYXM4dGMBYxlw6MhJUOf8/uBxPoqxaFHt1w60wEvov7L2nFPnKRHMibT2YFNLlUgfNJFf1k70w5F7uZgMcqqtBcWZLfVSuoJ0tEk8JkKIDvOMXgH6aYXZZnBU9VhMa+uikRf2DUQqFC2UXegSL3OVFg7pm+MGNvZjQ88h6gevsmP/qQKGC0b/gMeWrBe+f6hIUMCGJlgH15yjQG+I7Nv7EFfsXdOEyqWMad90g9tqdRhTDlSTeHxf1E3HA1hL6XStogG1nq8j4/lokvqhWGhTQjDVV3jRyUwsmccUYE0QHObKa6WHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtDZMSqB8q7M6Pk5vPSrn2BPGUrCxeocKAkI/BFkKkw=;
 b=n0rEf2COWF6mdp3I2iF/A+NoxG6Ev2uUsPEAAWIbWlmuwAMZUESDTOpeE1EuAfv/FbhF7RI4URg8ifSVeBIEl2n3WsuRoRPIojRy8vc7WWt8Fi3p6l64JCL/ycD8l5WoibxN7pI2wBVvdqpgkme+ugR0mFsxrp/7QzdHrF9ECbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW4PR12MB6899.namprd12.prod.outlook.com (2603:10b6:303:208::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 19:27:51 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Wed, 18 Jun 2025
 19:27:51 +0000
Message-ID: <d7e64ce3-e27a-4fdc-911f-bc33df743696@amd.com>
Date: Wed, 18 Jun 2025 14:27:44 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v6 4/8] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <548b542ff537936cc8a20f721f6f2472189c536d.1749677012.git.babu.moger@amd.com>
 <7521ab39-73c8-4d11-b12f-bf67a7031d7f@intel.com>
Content-Language: en-US
In-Reply-To: <7521ab39-73c8-4d11-b12f-bf67a7031d7f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:d3::10) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW4PR12MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 858a7e0c-1d77-4eaf-822b-08ddae9e375f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTNIQUdSKyt3U2hJamZoMnVGWlphTk9sUGRJbi9pV3RZU3pPYkZKN1R1TTI5?=
 =?utf-8?B?ZG1CZmg2b3VyVW40UXBNbFJIdjVYaVFQVFBHQTRnc0pOZHhNT0c3ay8zN0Ux?=
 =?utf-8?B?TlVVMEQyZXpubEgyMmxVaSttMlF6Q0I4Z0RrUFBCeVQvdjFsam9CYjZwSHVV?=
 =?utf-8?B?NjRLUE9kaU9XOSt5VWNJNEtqaHQweURkMHRXVUhJeG9WKzM3RWlab1gwL2Zk?=
 =?utf-8?B?MGdUNEdYWG5ZNVg0YUw4bi8rQ00zeWpSSDlWZkJMQjAzcEpFZkc1c1RFV2V2?=
 =?utf-8?B?WXZWQkZqTUlPY3psdkJYUGJxb0RrazhuL0E0aVBIRU81Skw5K2V6RkdNM0Jq?=
 =?utf-8?B?YTNIaVNQODJCQzZLVlQ4SGtmTXhWZmF2bUVPTFFMNk5TVFY0NGFCRklOcnZS?=
 =?utf-8?B?eTRNSHk3bk1JMk5IamxwV2FzYkJKRUR4Mnp6b3ZYMzM0MFdqQXZwR3h2WFNm?=
 =?utf-8?B?VVUwQlN1cElXcDdyNnF3aVJpaW9zaTZQREtJemIyTTd2Qnp2N2xvRlBPdDZ6?=
 =?utf-8?B?UFJUeHVmTTJPQ254ZjNwWWRIN0xjVC91VHhLeTNuY013bmhleFNkNFVDdDg5?=
 =?utf-8?B?ajNLWVYvTUVsZi9zZEhIVFR4WTJnaExzZ0l0cVR4UzkxeHVmQ2dOSWsvZ2M5?=
 =?utf-8?B?c2J4UDRHTVIxUFA2ZUZzQ3dPUmtobnd5bld0d05NNHFrYTNqNTZZR0VCSlNt?=
 =?utf-8?B?N0RPcVp0ZVJkcTQvWjlVcjdPUkMyS1JHeDI3WG1hQ2lITVp0YW1BTWtvbkRZ?=
 =?utf-8?B?eG1KelE5ZmlzTlNFZ1VvTC9RdWpuajBGOEZsK2dreG51UGNiS0JvVW1SNEhO?=
 =?utf-8?B?aUw5ZlV4YkxkUjdBWmt1bjZCUXo3dHpQTGs4MFd1azBRTHQvNHJvQzZPWm45?=
 =?utf-8?B?cVJKQ2tQY0dyRGc4RXY2QXRGZWE1Nm84eGxjTlBwZURVaW9pbitlaGV0eG5S?=
 =?utf-8?B?SVNSMzlaem54cnBxVWlRcDZZZUlWSVpBczdUZC8zb295QlBPbW0wTjlMaXV2?=
 =?utf-8?B?MER1SzlUem9xT0VGY1VJNWYwdEtvU2F2cWM4M3hkUlJpN0tHN08vOXVsbmpZ?=
 =?utf-8?B?WVZpNDluRjhnWVMwZzlxYTd6U1RIVnRQSnlHdkVpU3ZralZMb2Z0eFpwSVFl?=
 =?utf-8?B?S0tJQko3bHFyODZMZEJZZmlseUhOTGVwZmpNbG5hOHV0UVdCWTFkVVIrNVdj?=
 =?utf-8?B?MG4ramN2WDF2Mm16b0NISS9KKzBxNElxcWgzOE9BT2FJR0JIek5oT2xJb3pO?=
 =?utf-8?B?cDFtM2dXTHVWU0lxcWxQVnE2YXQ4Q1hSWS9yTE9IU0UreTdqRGptcFZDVk02?=
 =?utf-8?B?a1E5aE80RUQrUjAyczZ6QndTL2xqdHJzNjBZZG0yWWpNTyt5WEFkWm5zbFF5?=
 =?utf-8?B?MGN1ZUNtdCs4YzFoOGdBamkvaTRjVysydFRHSTh3eHRqd250MWlsUC9Zazd0?=
 =?utf-8?B?UHIrSUpGM2l6b0hKQU00czY4K0pjMTBGcjMrQW5QNnBaWnczL05WT1F3cFVO?=
 =?utf-8?B?SmFaMlY0dWNCa0RKeFNWZzViSW1jbzZYYndyWEY2REpjS3hHazZCZk51K3hn?=
 =?utf-8?B?VUNLdUVJQUNYa0FOMUkyOEdSOTl4TWNXVGQ1ay95Qlk3S0pDQjZvRjV6aW5Y?=
 =?utf-8?B?c2t5MlNBK0lnOGRMQzVKWlpTZm1VN0FmUmNCUHE5NHpkQ3NGdU4vNSs4YzlJ?=
 =?utf-8?B?cmIxSzZaSjJZcDFzVGhxb2QwbG9VeHkvQkl0MHgxRzA0aERpUjFHY1RtWWc1?=
 =?utf-8?B?cnRodFFDckdZYVhqM3dUMWFoOERyaFdxN1RFYld2MGdHVmthQ0ExNTBaeGZ3?=
 =?utf-8?B?RVg5MTcwTUkxemI4UXFuZVJGbm16a3RqdWlnL2pBWkUrc1hwZm1Ob3EveElm?=
 =?utf-8?B?cWlWUlk0dXlUTmNRTTNPbTVRMlVoekdqWlZQMHJWanVNUGxNMnhMQkFrR0VE?=
 =?utf-8?Q?BiEDEoIG8oo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vis4VHZ5d0RqT1JPR25oNksvRGloS2xJcG1aUFF2UW4zZVZVcitCMlByL1VK?=
 =?utf-8?B?SDJZWURqc3p3SDg0SDAvbUFPTlNZL0d5c0lxRUVBdDJERE9uNmVCWWFHeVFk?=
 =?utf-8?B?dFdyb0lDeXJ0U2R0RVJBRmcrTnJUZmRWbzEyQVBzVmdhejd6bWpBMm1Tb2NL?=
 =?utf-8?B?OUo0Zm1kaGl0NDNBT0w4bTYzR2xnUnNoZmxad2NLV0paUGViNTNlNVJZMm9v?=
 =?utf-8?B?MXdWTCt1Yndld0R6cG13eTZ4VHphSmRiTWJaSHZ2MktOOE5COWxXeDY4S1dq?=
 =?utf-8?B?bHh2WTRJUDZaSjJBL2dtUWVEa0Fjd2I2c0Rkc0Z3ckdrWmtYWHBNWkFrTXJ4?=
 =?utf-8?B?ZzhGR2lGaXgyb2U2bHFjYjVkekRmeHBNN2dFcUV2emtWSmpmVGh4anptR002?=
 =?utf-8?B?QndJM0UySjBpT3NjSW81Q2pHcnBsZktEaTYwK2RsdE1wTy90VXFuekNCU1FT?=
 =?utf-8?B?Um5JaE5PcDAzdjZUNFZCcVR0K2dZbjFDTUliVnJZejlIVm1JMVJPWEFhOW1k?=
 =?utf-8?B?S2V3RUhHWlVyZktKbGVnVGNUSUZTeVhSL3BGR1dWSnFzQXlQUE1iSWZMbkcy?=
 =?utf-8?B?STFIZGlSc2t3RHlsTXB4NGpCV1loZEFYK3ZXNU1DVVA0cm43bHJuR0g4NUJQ?=
 =?utf-8?B?VHArVlZMMCs5S0JOcjJmYUxzTElleExiM0dRWVluWVp1ckpudUprSHUxeXFJ?=
 =?utf-8?B?UUhhb0djdjE4K2RkeWFwR1NIdGNnc2syUksxbDJpNkJGaFlIcGlxWUFCcm9q?=
 =?utf-8?B?c3A2NXU3RjNVbTMwMGMrb0ZOeU9DeTE3QnRhTkUzcm9teXk2T1ZBTEE4M1Zu?=
 =?utf-8?B?Um16VklhZEswY1czVHA2amdycEpoUk5TbXhrYlJRcEZRZmlWb0syeUxaUzdy?=
 =?utf-8?B?VngwM3lSWE91TjNpSGZnY1dkNWNLSmNEQjVNM1EvOVBzbFM4VTV3dlRCMmZl?=
 =?utf-8?B?d3ZpRkZya2NmaGZEL3psWWpndGl3em1CLzA4Ym9sSUg3dUZZTzFrRWQ1SEdM?=
 =?utf-8?B?Qlo1ZzJGZ0FmejNNYkh3NWM4Qk5DNFA5eXNPNVF3bGExenVBblVlcDBYWWM4?=
 =?utf-8?B?NSt3UUF3VVo0NjFOekFCM1ZOcjdyRFNNL0U4bmQyVjZlZlcraE11YUFoekQx?=
 =?utf-8?B?NHUwOFJUTDNZb0NhS2laSmZUQVl6UkRSZVBaNjBqa3Z0UFhlNHg2UFJvOEJD?=
 =?utf-8?B?T1ArMGZVQ0FCWFJkQ21POTEzVGd1U1RIdEVIajlIc2NxeTZnSGFEZ1RHa1lH?=
 =?utf-8?B?VXQrNkxQakxwNXpiUUZaR1pMSTRjK3I5eE9FaCs2N042aUg4YzEvQ3EzTGVs?=
 =?utf-8?B?WE5iVnFRRGNtZmJWN1JlN1JSaDFoaWtNWnJHS0I0RkMwRnUyMnA0MjJ6T2s1?=
 =?utf-8?B?eHVqbHhNc1B5YXhCaW5HTjFXekU1RXBHbnNaU2J5cU5sSExyVzdwbFRYWkky?=
 =?utf-8?B?eGNBSUxuQkhmQVF3cTR0TXRyU2kzbCtFZFVsQ0dlem1sWlp5YlorQkFHazhx?=
 =?utf-8?B?eXlsN3BicWF5a1FtMEZSTWd6eXVmZVhRM1ErTkIwMjhMRjFaRkpYT09uNzY2?=
 =?utf-8?B?ZEVvWGY5VFduQ1NiNlczTG4wZUdPbkR4bUFSVys5bTkrWHJOTitCWEdueEVB?=
 =?utf-8?B?VGpUMG1MdU5MRXZWMmZNYW1mcDBjYk5aWXdjaGZzRStoVTJUc2srdU1TcUda?=
 =?utf-8?B?U01wYStlMzFDMDA0Nk5SaFluc1pqTDBhMVVrQ2VtZVlQRDhwTWdZbmhDeGZa?=
 =?utf-8?B?YXJvODVmeW8xZnZiTnFtTFVPb2tubnlnWU9QOE5zdlhhK3AyR2sxYWRrcVk3?=
 =?utf-8?B?MnVDaFNodWVpTFd5MUMwcnUrU3IzT0RobnFKZ0ZwWjNvdnVNU0t6T2YvbXRW?=
 =?utf-8?B?Y0luN1BXRGlDaWJLMXZxUThUbDdJcCs2aTR5OVVibTFTN0xRUnlnUEhJSVRU?=
 =?utf-8?B?U1RjSzVjTE05MUtweEN4azMybG4wOEZYVS8zT0xKN29hVENzMGdQL2Zod05i?=
 =?utf-8?B?U0tlRm5zQitrbnJnS1hPdUpjV3gya2twVGxMOGtBRzFBQld4RjZmVjMwNGla?=
 =?utf-8?B?cDRUN1RvT2pOVitWd3F5cUpDVENURXVQQXdUZnl5VmlsQ0hwdlNuY2JLTEV4?=
 =?utf-8?Q?ln+M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858a7e0c-1d77-4eaf-822b-08ddae9e375f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:27:51.5802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOoTNbIDgRM/ZMQ9KZTn7836qnUmXaLgSI4zNOcGaORbwAVeAins1v9oBrMjCOu2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6899

Hi Reinette,

On 6/17/25 22:51, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/11/25 2:23 PM, Babu Moger wrote:
>> "io_alloc" enables direct insertion of data from I/O devices into the L3
>> cache.
> 
> Above is from resctrl perspective and resctrl does not limit this to L3. Here also
> I think L3 should be dropped.

Sure.

> 
>>
>> On AMD, "io_alloc" feature is backed by L3 Smart Data Cache Injection
>> Allocation Enforcement (SDCIAE). Change SDCIAE state by setting (to enable)
>> or clearing (to disable) bit 1 of MSR L3_QOS_EXT_CFG on all logical
>> processors within the cache domain.
>>
>> Introduce architecture-specific handlers to enable and disable the feature.
>>
>> The SDCIAE feature details are available in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
>> Injection Allocation Enforcement (SDCIAE)
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/include/asm/msr-index.h       |  1 +
>>  arch/x86/kernel/cpu/resctrl/internal.h |  5 ++++
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 40 ++++++++++++++++++++++++++
>>  include/linux/resctrl.h                | 21 ++++++++++++++
> 
> This hints the subject prefix should be "x86,fs/resctrl".

Sure.

> 
>>  4 files changed, 67 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index b7dded3c8113..b92b04fa9888 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1215,6 +1215,7 @@
>>  /* - AMD: */
>>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
>> +#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>>  
>>  /* AMD-V MSRs */
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 5e3c41b36437..cfa519ea2875 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -37,6 +37,9 @@ struct arch_mbm_state {
>>  	u64	prev_msr;
>>  };
>>  
>> +/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
>> +#define SDCIAE_ENABLE_BIT		1
>> +
>>  /**
>>   * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
>>   *			       a resource for a control function
>> @@ -102,6 +105,7 @@ struct msr_param {
>>   * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
>>   * @mbm_width:		Monitor width, to detect and correct for overflow.
>>   * @cdp_enabled:	CDP state of this resource
>> + * @sdciae_enabled:	SDCIAE feature is enabled
> 
> nit: "SDCIAE feature (backing "io_alloc") is enabled"

Sure.

> 
>>   *
>>   * Members of this structure are either private to the architecture
>>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
>> @@ -115,6 +119,7 @@ struct rdt_hw_resource {
>>  	unsigned int		mon_scale;
>>  	unsigned int		mbm_width;
>>  	bool			cdp_enabled;
>> +	bool			sdciae_enabled;
>>  };
>>  
>>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 885026468440..3bdcd53b3ce3 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -229,6 +229,46 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
>>  	return rdt_resources_all[l].cdp_enabled;
>>  }
>>  
>> +inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
> 
> As indicated by lkp the inline usage needs to be fixed.

I am assuming that you are referring to
https://www.kernel.org/doc/html/next/process/coding-style.html#the-inline-disease

I will remove inline attribute.


> 
>> +{
>> +	return resctrl_to_arch_res(r)->sdciae_enabled;
>> +}
>> +
>> +static void resctrl_sdciae_set_one_amd(void *arg)
>> +{
>> +	bool *enable = arg;
>> +
>> +	if (*enable)
>> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
>> +	else
>> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
>> +}
>> +
>> +static void _resctrl_sdciae_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_ctrl_domain *d;
>> +
>> +	/* Walking r->ctrl_domains, ensure it can't race with cpuhp */
>> +	lockdep_assert_cpus_held();
>> +
>> +	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains */
>> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
>> +		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
>> +}
>> +
>> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> +
>> +	if (hw_res->r_resctrl.cache.io_alloc_capable &&
>> +	    hw_res->sdciae_enabled != enable) {
>> +		_resctrl_sdciae_enable(r, enable);
>> +		hw_res->sdciae_enabled = enable;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
>>  {
>>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 0e8641e41100..06e8a1821702 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -531,6 +531,27 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>>   */
>>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
>>  
>> +/**
>> + * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
>> + * @r:		The resctrl resource.
>> + * @enable:	Enable (true) or disable (false) io_alloc on resource @r.
>> + *
>> + * This can be called from any CPU.
>> + *
>> + * Return:
>> + * 0 on success, or non-zero on error.
> 
> Please change to "0 on success, <0 on error" to make clear it needs to be
> non-zero *and* negative to be considered error by resctrl fs.

Sure.

> 
>> + */
>> +int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
>> +
>> +/**
>> + * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
>> + * @r:		The resctrl resource.
>> + *
>> + * Return:
>> + * true if io_alloc is enabled or false if disabled.
>> + */
>> +inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>> +
>>  extern unsigned int resctrl_rmid_realloc_threshold;
>>  extern unsigned int resctrl_rmid_realloc_limit;
>>  
> 
> Reinette
> 

-- 
Thanks
Babu Moger
