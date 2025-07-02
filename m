Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06A52D781F;
	Wed,  2 Jul 2025 17:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477999; cv=fail; b=fJ5EJLeR5qWrWCvthPHwFk0c8Xvo84ZYEWCeNpOBqsghaGQRb4jjb3ivuorutCYtJZSLzk5G+7GZMioIuD8/8SB2RfXpzcIU1CpW/LqCDSrJ+1j01RWwhwLetlAAmW8ma7cNV3IBw7xfVsJUji56uW5ph71gGYwrE0CxPen37Sc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477999; c=relaxed/simple;
	bh=YCHkkxfEnQDyCLzA04Q8reoD5zI2IAj9yvZpI4QFU5Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HqkiQbYv2OIeB6lCw2rBYztPGDsA/I+/ceeKTNnUVxD73mehaCBsN6aeHoGpTXV9BcUBb3rDy4vwoFPEfOiGh5WByqi2sXfcsnQbZ521S8GCdZfRoWkXIycJwGlWB0XOPDjaHmM+fW4hDYfgsOJRtcCiXoR6N90VAAtta3BlM8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3dDcbKAG; arc=fail smtp.client-ip=40.107.93.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3dDcbKAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9J/bEQ0PnPUA+klRcF8NJdtfIPoYnjzBkzyVaKPXK/UE0QtmclG+WL+W6yXIppzrkBE7Dwi1QiZKosESxR4a3PMWlbIZm9grkqJZJh1TVxpBdAL5rbyXv8sTYieYMVfp2R0rlZLmO4EVnESokcDevUW22T6Lptt82xKAqDfQxARhQxyDyvTUrfANsHK3F26hhzpuWX+jPvwcHBNLjpegK5QQVzC/afxBxUNP0RHISDwZMcLjaXro/rcKfEsjSNJGmvCTy5NdufTkMyo5dIoNGezE925qJYlbqI7EkbMoAKUeqm1twBFg9vfP9h3yjjX1J5BZ40vlAyeNSczpemEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RntHyk5quEYbybxSIdqZCD334lqhKSO/RZOdq5Q7Nhs=;
 b=lTM2bNgSNASXUjdsntoiUznSos7sJhx0oekpTBmAPe5YGLIPFrLuqtxu/X3x3FSMNKfpVkk+VSRlGE4h5Znea8Q5zNeFl0WmUFdXQTEi9KpQVUq+J7l30l5i32AjA5KNu/4hXF1t0tXkfH54uBPFgtibvjK2DDHynMWAytkSS1GqUeF0tO7H4B0blZcCsauSGwsHr3ZWhpsgX3rf+0Z5TsIuQP+QiBMHC09FVWb2TTSBF6fJTD7jlMwx5MHt/5ComqD9Wo5J4yH/C9jCf/StmuHQgT5h1EaW0cI1H3LXP7EaUO3LwSG4iWEFuh+u7wIlLfdKn1Z+wykgh0g9i47PXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RntHyk5quEYbybxSIdqZCD334lqhKSO/RZOdq5Q7Nhs=;
 b=3dDcbKAGAW5HcgV8vSaKb1ujCtY8+s4LG+7B2AOYZf1uojMWFXGxf4i0ETT71V7RN52+rLfWIOy4sZ8d3NDm6F/RQls1kB7CkHQ2C6xfdx3RIxNcEyPw7GfAl/cNuuDypOJc7d5/mKT4BKqK82oET2ufkN1NAFezn2WolNJ9YWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 2 Jul
 2025 17:39:50 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%3]) with mapi id 15.20.8880.034; Wed, 2 Jul 2025
 17:39:50 +0000
Message-ID: <e7b9a010-7044-4153-a5c9-38ade17e6058@amd.com>
Date: Wed, 2 Jul 2025 12:39:48 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 31/32] fs/resctrl: Introduce the interface to switch
 between monitor modes
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <dada02bec2f7ea2fa316f892560c07e0bc45df41.1749848715.git.babu.moger@amd.com>
 <0f10bc24-b10d-4834-9643-5e44a2b83f74@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <0f10bc24-b10d-4834-9643-5e44a2b83f74@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:806:6f::31) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 9407a615-960d-41c7-4f46-08ddb98f721f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Kysxd0ZYaTI5RWQwZ1EvWENJMjZoWWxpVGRvd0tjNnppdmRxSm9CMFZYU3J1?=
 =?utf-8?B?K1lzMDAwZEw5SUVEK3UxQy9OdE01UUhBMTRha0w5dldoR3hOODQ4eFBOZVBx?=
 =?utf-8?B?aHA2T1BFczd3ZFZ6Z3daWkdERVptZlRaZzFwbmZOS2l5OTVVMGRWckk5MHp3?=
 =?utf-8?B?Q0gvYXJmV3M5cDRHNWM4RUtjbkcrMlBYOGM4TWE0cTMvR0xmcEx3NzJqaENZ?=
 =?utf-8?B?dmRwakJna3dBK0ZoeHNheWQ2bzYrZGJnZTJudnRaekRVRnJ6VjRUdk56SC8v?=
 =?utf-8?B?TU1DK20xeWRPRVFMa044bUZKT2dDZUpINmEvS2FpYUM5aUNZdjZJdVdlQ2Jn?=
 =?utf-8?B?bUdGK2VHbTl3Sm1xVEJqS0JWd0FZRnVuRjJyOUJ4OVowSVhxV01IYm1lSmNq?=
 =?utf-8?B?SDJLRW9YOTlSOXVVSVNCWmJRVngvamZlZkpCSGVzODBMcXpvRGkzTkFMSFd0?=
 =?utf-8?B?dUdDdTBlaUh2dGdBeVNscnlVdU82TS9zdjFwRVZnV2ZoclY2eE1xb3BQeDZI?=
 =?utf-8?B?NENSdCsyKzJTTzNpMHpJbzJEcDZ2bmttcDZjTDRlckZsbGZQVVYvTEczWW1E?=
 =?utf-8?B?MERncUJ3WGVHdzErZVFGTmpZeDZoSTNPMVh4WHBra2JaU3k3dVlJVHA0RTYw?=
 =?utf-8?B?ZERQWG5JRmM2MGMxQy9rdDNnN1BKa2I0MG9MOVNvNHdFOXhHVEphUkxkYllW?=
 =?utf-8?B?TnFZQzlOY1BDblh6WG0vSEo2dWE5NmtYV0d4R2hzVStPUTEva2htcFpkdHlI?=
 =?utf-8?B?bEFGcGNQSVdicmdSN0JkNDRCL1h0a0NQaW9aSmhPUlo5dmdMV0p0VUpVbUJk?=
 =?utf-8?B?NGZETm51NzVtQkpiYVhtZ0pyUlRlUlp4bDZoUTlldENXNnZ4MjhjdFZvb0Yx?=
 =?utf-8?B?WFlMWEx1YzNhN1NjWE5tejVkWVlkS0RNelRhTEVkVTRKcnkrUnl3dHBZajdS?=
 =?utf-8?B?WEpFYXVBNHBzbkppQlBWSWZhcWJaRlh1V1NCQUU1Vk1ZbTVNRDNZMTlRQVZp?=
 =?utf-8?B?YzhETU4wWDc1Qk1QL2toa2dRY2xVQ0l2MldqWjdFY25uVEg4ajRna0pkcmph?=
 =?utf-8?B?WkI0QWNTU0xhYnRDVWliWDZHRDk4VnkrL0h3TGczL09yWHFuN1hSNGlqeVk2?=
 =?utf-8?B?VzNpcXFWeU9wN1EvR0g0ZSs1Ym5LVGhHT1ozMkh4bnkxRmRkMkdoUDQySmtp?=
 =?utf-8?B?N3MwOWZCUmdUV2lFR2JpdkxHaVFreXp6RGVaWm03NjNmS3kvOUx1NDdCeDVu?=
 =?utf-8?B?NjVyMkhicUtHanNKb0FvWUVOSStCcnkxWldxN0lsK0xad2hMTjJnN2RWNG0w?=
 =?utf-8?B?cU8xSUdVRnViNUFReGE0ZmtlUlkzQ2dIU3hXcWpWQkZ1QnVZelppV1IwZnNJ?=
 =?utf-8?B?bGZJZVg1U05vMmh1SUw3UjdYOGNLdmRmNDN0VnJpQU5WWXZMcjV0eS95UXpW?=
 =?utf-8?B?WUpXdVNqVjVyMXdxS1dKOTd1UEl5WGNWbjhsWE5tb1B1NnpPakVRa0VOV2N6?=
 =?utf-8?B?eWMxalZ3Z3ltSVlqeDZiekhrK0pXOUhQWFVGdzVoMjhxWmluNmZSa3VBTEhp?=
 =?utf-8?B?c2FNZUo2T3pXOFJMdmhPN1I3TFMvaENXa3Z2MlhhQW8rRVBNVEU4ZExqVE05?=
 =?utf-8?B?SHp1SE5ySTU0aE5nUjFwTGw5WmZYcThGWE5Bc2c3d3Q1LzJHYlFCc0w5OXlm?=
 =?utf-8?B?OUlSQWg1RHVwU0xnZlkvUllWM2lCQ0MyQTBNemJibmx4bEhXQi9oUnFrUXF1?=
 =?utf-8?B?L1JHZ004MGJBYnlOY0tJZmo1UitBdkc4ckN4TUdsTjRjcFBlcnVEZWk2TXU5?=
 =?utf-8?B?NDNzS1VqbnVYU3VxaWMvQ1RZUHdJZ1N5Z0MzdkM0WWlTVEtRTFJXVXRPOTJj?=
 =?utf-8?B?aGE5SmdVV0ltK2NJa3BJOVZDQ0xXTjBKSnN0YUZzWEVQQW91bWJJdjA5Q1J2?=
 =?utf-8?Q?MPJdCLSQPm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmJ0YUlvRzA2VTB0TUpkMUZsZWlTTEJqVExUclh5ejFMQjFmQ0sydVgzTkV0?=
 =?utf-8?B?aTg5UzVINkZIVTVFck5RL1JETWdqSll2R2hUZkNGNmV5S1ZxbzlNQ1REbVlF?=
 =?utf-8?B?cHdmWUNPOVY3ZE54S3RpQ2g3U3d1RmVReExReXkyMGgrZVhRdEVOTFdQRkZ2?=
 =?utf-8?B?RXozUWhzN1kyZnNHQm1rU3krR3k2ZnNvR0ZPLzBnMU1PN1VsdEVRSTQzNTFp?=
 =?utf-8?B?Y2kyQmFDbkFkWHRLYURaaUs2VXdlQ0c0MmxsMGZPcUVnVnJpUXgyUExkWHZK?=
 =?utf-8?B?YnBVdzRPMXR4dnpFcGZBNWVPWlJGemZyN3JIQTJQZ2pXbSs4WlZ6OXByNmN3?=
 =?utf-8?B?dlFDbklpSkZ4NnNnMU1BYVNta2ZESTRyK1FsV0VXbHdyK3BCbTBYd3ROR2tF?=
 =?utf-8?B?S3Z6WjBpMktKMHZER0dkNUJJR0FBRUJ4Q3MyOGdESnk3Q2Z2Zk9jMjgrUXhN?=
 =?utf-8?B?N0VSSkRpa1Z5RjVJQ0M2UzZsYTJpdCtIcjB5Umpqd1hKNlM5cUwyaUFJN0VT?=
 =?utf-8?B?T1pzYmtkTkpjZ0NqWUJUc04xMHZiYitzN0srWUJodUtpRFpENEZibWxteHZu?=
 =?utf-8?B?WUUwQnBlSm9JVlgxbzVmb0xYZkNPTmx2NDZwazhFWEl5a2FMSmlkQkNOa2Ir?=
 =?utf-8?B?SlEvcXJZNk9DZmdtQU84YmhCU0djdWd3YWxXWXdReDdPOE1qekV3bk5NM0Z5?=
 =?utf-8?B?UGxqUTA1QUYrQitnZ2kxcTA1bWtqR0dEaTV1clRDVTJBTUNzQXduUE13S3Yz?=
 =?utf-8?B?QmgvZHBndmhSQWFIUm84MFNralJ6UGRkdVhWdnFydHIzOXFnTjVSWU1zV3o5?=
 =?utf-8?B?cFZJY1ZYVHdjYzRSbXMvSERzNEdwYmRZWmJLSTA0R0VaWXZHRzJ0SVV2UEhh?=
 =?utf-8?B?U2krQ0tVb3NKb2lGdU1OMkt3VnJFUDZDbWQ4MWJhb0RuNnZIaHVHTUlpTmFo?=
 =?utf-8?B?YWNZM1NqMTBVS0VRWm9kTHRWNlNPZzBlRjhxdDJtU1FvcDNWc0lhS01uRHlr?=
 =?utf-8?B?Y3hkTEFGL0Z3K1p6ajk2dG5zMHRpak56dTlLZVNYQTNXSXZtQWF1c3o2NnlS?=
 =?utf-8?B?RjBCSFFMUkkvNzQ2NG1adDZFT1BmbFI4RVoySzFFZGVwNXJHWndmeklpUzMv?=
 =?utf-8?B?bHVsK3Mvb3lhRzJrKzVEdWNJRVBnaHhXMFZ4RWw1STJ6ZzhJcm9wODhTTGM4?=
 =?utf-8?B?bFVjTEtteGc5ZXd0ZTZTc3BzWFlwTG90eEVYVUllYTdBREZ2c1ZGZmE4QlFX?=
 =?utf-8?B?cE9sUDdsdEhVem10MjRncnBKS2VFSk5Kdlh5SjNZQ2hVVytaR0UwQVIwanAv?=
 =?utf-8?B?MWkzM2VuMXltbzB2RDB5bGJYL3RyOW1PdUZLcTVJMWhRbCtQRFZId1A3aGJ1?=
 =?utf-8?B?Z3U0NVZjMU4xSFVNYXVQbzlMUWZYekF2RkZPaW0reTNOSGRLb2pqa2dSdzFz?=
 =?utf-8?B?cjEyclh5Rm5La3dWeXVMWHo4L1ZZSjQ5bFBDMTlVM0g0Tm8yYmUrL01XbUF6?=
 =?utf-8?B?QkpYU3ptUy9ZemFGdnFaWkI2MnZmdlhHN0QxUk5iRVZYeUQvUEV5QmxaNXcx?=
 =?utf-8?B?TWV3LzZSbUdjNEc5OGNBWUhLMWZRS0R3aTNDTk1lN2ZIQWV0WllvWlJ3Vjd3?=
 =?utf-8?B?TERxS2RmWjhhSzlmVml3QWFEZ0I3c2hKUXFJTWJoODNrUFkwZlJtTlJKY0Vp?=
 =?utf-8?B?V3ZYZThHcXJNUGdCcVpzV2wyUTZCRVRMSGd6a3ZaTTJtanAvL2lvZGJ5cmtY?=
 =?utf-8?B?L3RSWHp0R2U5RFRISkpwU2I1M1ZOWVRvWVdyWlQ4NU55OVhMWXZDemd3NE9m?=
 =?utf-8?B?cHVtdS95RHNjeUg2WFpKSUFJQUtIcHdFNDl5aGNhN0pqMFZnbkRBM0wrR2ZD?=
 =?utf-8?B?dTIrcEpIOVhkTE5YVXpIczY2Qmp4azVBUDIrU2hnNng1Vk9jSTNWMS9STEYy?=
 =?utf-8?B?NXZHdlMrY01lcXUvT0ZvQkFpNFZpb3dqSzl1Q2dqM2psZnlNM3A0cU9SWUQv?=
 =?utf-8?B?WkJmVFREY1pQT2xpbkZNcWtiMlluMVNqdFg4dm9MazIrSGpqSjh2dE9ObmV1?=
 =?utf-8?B?VDhGTDJSVjRFTS9iZ2xIaHhIcEZvcmFkTy8rMTNrT3cxVVpTNFJUbFYydGRV?=
 =?utf-8?Q?uJJg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9407a615-960d-41c7-4f46-08ddb98f721f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:39:50.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqA8of5J1FIHLl5yb/hGQpqiQWZutdKHI3rU19RG+zb3xXtp0HfsbFYXreZmbbyu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

Hi Reinette,

On 6/25/25 18:40, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> Resctrl subsystem can support two monitoring modes, "mbm_event" or
>> "default". In mbm_event mode, monitoring event can only accumulate data
>> while it is backed by a hardware counter. In "default" mode, resctrl
>> assumes there is a hardware counter for each event within every CTRL_MON
>> and MON group.
>>
>> Introduce interface to switch between mbm_event and default modes.
> 
> "Introduce interface" -> "Introduce mbm_assign_mode resctrl file"
> 
Sure.

>>
>> Example:
>> To list the MBM monitor modes supported:
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_event]
>> default
>>
>> To enable the "mbm_event" monitoring mode:
>> $ echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> To enable the "default" monitoring mode:
>> $ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> MBM event counters are automatically reset as part of changing the mode.
>> Clear both architectural and non-architectural event states to prevent
>> overflow conditions during the next event read. Also clear assignable
>> counter configuration on all the domains.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  Documentation/filesystems/resctrl.rst | 23 +++++++-
>>  fs/resctrl/internal.h                 |  2 +
>>  fs/resctrl/monitor.c                  | 27 ++++++++++
>>  fs/resctrl/rdtgroup.c                 | 78 +++++++++++++++++++++++++--
>>  4 files changed, 126 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index cd82c2966ed7..7e62c7fdcefa 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -259,7 +259,9 @@ with the following files:
>>  
>>  "mbm_assign_mode":
>>  	The supported monitoring modes. The enclosed brackets indicate which mode
>> -	is enabled.
>> +	is enabled. The MBM events (mbm_total_bytes and/or mbm_local_bytes) associated
> 
> Since there may be more events in future I think the "(mbm_total_bytes and/or
> mbm_local_bytes)" can be dropped.

Sure.

> 
>> +	with counters may reset when "mbm_assign_mode" is changed.
>> +
>>  	::
>>  
>>  	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> @@ -279,6 +281,15 @@ with the following files:
>>  	of counters available is described in the "num_mbm_cntrs" file. Changing the
>>  	mode may cause all counters on the resource to reset.
>>  
>> +	Moving to mbm_event mode require users to assign the counters to the events.
> 
> "Moving to mbm_event mode require" -> "mbm_event counter assignment mode requires"

Sure.

> 
>> +	Otherwise, the MBM event counters will return 'Unassigned' when read.
>> +
>> +	The mode is beneficial for AMD platforms that support more CTRL_MON
>> +	and MON groups than available hardware counters. By default, this
>> +	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
>> +	Monitoring Counters) capability, ensuring counters remain assigned even
>> +	when the corresponding RMID is not actively used by any processor.
>> +
>>  	"default":
>>  
>>  	In default mode, resctrl assumes there is a hardware counter for each
>> @@ -288,6 +299,16 @@ with the following files:
>>  	result in misleading values or display "Unavailable" if no counter is assigned
>>  	to the event.
>>  
>> +	* To enable "mbm_event" monitoring mode:
>> +	  ::
>> +
>> +	    # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +
>> +	* To enable "default" monitoring mode:
>> +	  ::
>> +
>> +	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +
>>  "num_mbm_cntrs":
>>  	The maximum number of counter IDs (total of available and assigned counters)
>>  	in each domain when the system supports mbm_event mode.
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 14d99c723ea5..adc9ff3efdfd 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -414,6 +414,8 @@ void resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *
>>  				 struct rdtgroup *rdtgrp, struct mon_evt *mevt);
>>  int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>> +void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>> +void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>>  
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 618c94cd1ad8..504b869570e6 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -1045,6 +1045,33 @@ static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>>  	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>>  }
>>  
>> +/**
>> + * mbm_cntr_free_all() - Clear all the counter ID configuration details in the
>> + *			 domain @d. Called when mbm_assign_mode is changed.
>> + */
>> +void mbm_cntr_free_all(struct rdt_resource *r, struct rdt_mon_domain *d)
>> +{
>> +	memset(d->cntr_cfg, 0, sizeof(*d->cntr_cfg) * r->mon.num_mbm_cntrs);
>> +}
>> +
>> +/**
>> + * resctrl_reset_rmid_all() - Reset all non-architecture states for all the
>> + *			      supported RMIDs.
>> + */
>> +void resctrl_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
> 
> struct rdt_resource *r is unused? At this time it seems unnecessary to check if
> an MBM event belongs to particular resource since at this point I expect only L3
> is possible. Even so, to be consistent and robust I think it would make flows
> easier to understand by always ensureing that mon_evt::rid matches
> expected resource.

Agree. But in this we dont access mon_evt structure here.

> 
>> +{
>> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>> +	enum resctrl_event_id evt;
>> +	int idx;
>> +
>> +	for_each_mbm_event_id(evt) {
>> +		if (!resctrl_is_mon_event_enabled(evt))
>> +			continue;
>> +		idx = MBM_STATE_IDX(evt);
>> +		memset(d->mbm_states[idx], 0, sizeof(struct mbm_state) * idx_limit);
> 
> sizeof(*d->mbm_states[0])?
> 

Sure.

>> +	}
>> +}
>> +
>>  /**
>>   * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
>>   * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 8c67e0897f25..6bb61fcf8673 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1876,6 +1876,77 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>>  	return 0;
>>  }
>>  
>> +static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
>> +					     char *buf, size_t nbytes, loff_t off)
>> +{
>> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_mon_domain *d;
>> +	int ret = 0;
>> +	bool enable;
>> +
>> +	/* Valid input requires a trailing newline */
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
>> +
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!strcmp(buf, "default")) {
>> +		enable = 0;
>> +	} else if (!strcmp(buf, "mbm_event")) {
>> +		if (r->mon.mbm_cntr_assignable) {
>> +			enable = 1;
>> +		} else {
>> +			ret = -EINVAL;
>> +			rdt_last_cmd_puts("mbm_event mode is not supported\n");
>> +			goto write_exit;
> 
> write_exit -> out_unlock
> 

Sure.


>> +		}
>> +	} else {
>> +		ret = -EINVAL;
>> +		rdt_last_cmd_puts("Unsupported assign mode\n");
>> +		goto write_exit;
>> +	}
>> +
>> +	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
>> +		if (ret)
>> +			goto write_exit;
>> +
>> +		/* Update the visibility of BMEC related files */
>> +		resctrl_bmec_files_show(r, !enable);
>> +
>> +		/*
>> +		 * Initialize the default memory transaction values for
>> +		 * total and local events.
>> +		 */
>> +		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
>> +			resctrl_set_mon_evt_cfg(QOS_L3_MBM_TOTAL_EVENT_ID,
>> +						MAX_EVT_CONFIG_BITS);
>> +		if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
>> +			resctrl_set_mon_evt_cfg(QOS_L3_MBM_LOCAL_EVENT_ID,
>> +						READS_TO_LOCAL_MEM |
>> +						READS_TO_LOCAL_S_MEM |
>> +						NON_TEMP_WRITE_TO_LOCAL_MEM);
> 
> Nice, yes, this belongs in resctrl fs.
> 
>> +		/*
>> +		 * Reset all the non-achitectural RMID state and assignable counters.
>> +		 */
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			mbm_cntr_free_all(r, d);
>> +			resctrl_reset_rmid_all(r, d);
>> +		}
>> +	}
>> +
>> +write_exit:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>  static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
>>  				      struct seq_file *s, void *v)
>>  {
>> @@ -2203,8 +2274,8 @@ static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgr
>>  	struct mon_evt *mevt;
>>  	int assign_state;
>>  	char domain[10];
>> +	int ret = 0;
>>  	bool found;
>> -	int ret;
>>  
>>  	mevt = mbm_get_mon_event_by_name(r, event);
>>  	if (!mevt) {
>> @@ -2249,7 +2320,7 @@ static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgr
>>  
>>  	switch (assign_state) {
>>  	case ASSIGN_NONE:
>> -		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
>> +		resctrl_unassign_cntr_event(r, d, rdtgrp, mevt);
>>  		break;
>>  	case ASSIGN_EXCLUSIVE:
>>  		ret = resctrl_assign_cntr_event(r, d, rdtgrp, mevt);
> 
> Two stray hunks?
> 

Yes. Fixed it.


>> @@ -2463,9 +2534,10 @@ static struct rftype res_common_files[] = {
>>  	},
>>  	{
>>  		.name		= "mbm_assign_mode",
>> -		.mode		= 0444,
>> +		.mode		= 0644,
>>  		.kf_ops		= &rdtgroup_kf_single_ops,
>>  		.seq_show	= resctrl_mbm_assign_mode_show,
>> +		.write		= resctrl_mbm_assign_mode_write,
>>  		.fflags		= RFTYPE_MON_INFO | RFTYPE_RES_CACHE,
>>  	},
>>  	{
> 
> Reinette
> 

-- 
Thanks
Babu Moger
