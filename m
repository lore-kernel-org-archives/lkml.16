Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931C2BEFFA;
	Mon, 16 Jun 2025 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085266; cv=fail; b=sZ8/APXsaRHhAsDQa9nnEqrgL83ZlkeZEgQrVXrRTXU/5gNFUxAsz5v6ec/GFM+CGFNdGiMms3bMR5v6PGsYl94Tno1/X0u6pPJIij02ji//q+ocTZqMgZ4ANOMufv8D93XGgqV0F0Q0aU5O7pxweFNOS5BoF8YAKEuoNGBoMEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085266; c=relaxed/simple;
	bh=6Fqv0OKuRgG41PthjWkE9dKJkVEWb2xiyvuSsZlc4Wc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QRvLLxlkAt5Y3c/B/bpNDqCSPZFnqHW1A+lRTkp8hfaDfE8IK0MTng05uIIy06FUyn8AXNGg/Pl05ramCclGO879unl7g4Hr2rtLMnhJWy+jk/2ILovmgIzqGO0N6nrHcnk2kE3rFTPzZcF2w7q2crVQFBhBfp6BVH+4wV0GdbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w0RPWDLR; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w0RPWDLR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spiQL7f/sh57RVYcVWcd3gdDteek8siAFrKsa/otV88OXJqELBWqY5d7HhKXsokZk/pLoKBf384lvf8HEwAQMP1QOWQGYGIdjmX4wUhmCOr+uyPZijf2lAmTDyTXp8WL/X4r2AjnTrr5zypZ9xHAc2Uw1iKoMDubhI8/OeQvxRv3z7fnZTtjv2GtkCbBLcV9YYWniA8Owat74iGEt8nLadmIsYF0sbdwEtZb31KXcdhuP/3kgQzLvjWE8m3fkbSHW7CDFUuQGDSbZjEcFcZ80wNDnq9x8BHDk7gsKGihGotQT3zW6Ys+tcL5QGyLDqfY0qU8lX1hX/DnmqGb9je4Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDuoEEsXBeULc0lmQdm1lAI/aWpd9KHGF0pXIEU5/TY=;
 b=kYn/QlqrKjc/+ph5lsGvFsh80azx4/GaR97pOAfH1EAAgj7z3R2dTo2m7Afhd8UWAixg5dOTgZokUeFZEQdEdgjAi9iRJ8fY7ezIpye/FEYmZg6Fu5sq2OpG46YRfgbtCeTEnjgGOLw4P60Bk7lqirBLsBgybDF/DU2au+wKVUL0I9gQJZOvdi3zDhre0E6zFsdkUhITgMJ13a4dLZkujQ54DEim4D+UIaV1aOlKjOqgOMiR+HI/qSb++bW9NOanGxHWRtl0RMkuOMcFsF7HpVJt6OdeqzY7+MvTbnlqTCoATM4zw6vXYjjmxqaWltIU4hePcLjdIze8ccMjdCXqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDuoEEsXBeULc0lmQdm1lAI/aWpd9KHGF0pXIEU5/TY=;
 b=w0RPWDLRya6wDlYAQVAATpj6Iz1KqFowlUEKZTEXmK2W79VeXeawQfDwgaQKqa6CkZLUtaMUG7k2WUhhQHaJk0t7Z4cDRx2MfCyKUxyqPvpt8wXzFFFL8eKzz6Uga4sVhI/GDOacCL8xbsVUy5J5sKsi89tF+YEop9qb5OSeP+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 14:47:41 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 14:47:41 +0000
Message-ID: <d50ce593-a324-4b08-ae13-2264a41ebc6b@amd.com>
Date: Mon, 16 Jun 2025 09:47:35 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: RE: [PATCH v14 00/32] fs,x86/resctrl: Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
To: "Luck, Tony" <tony.luck@intel.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "thuth@redhat.com" <thuth@redhat.com>, "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "manali.shukla@amd.com" <manali.shukla@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>, "Huang, Kai"
 <kai.huang@intel.com>, "peterz@infradead.org" <peterz@infradead.org>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "Li, Xin3" <xin3.li@intel.com>,
 "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>,
 "xin@zytor.com" <xin@zytor.com>, "Bae, Chang Seok"
 <chang.seok.bae@intel.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <SJ1PR11MB6083DAFE4FD5A6D2712C088BFC77A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <SJ1PR11MB6083DAFE4FD5A6D2712C088BFC77A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:806:24::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: c88b8313-d928-4f0a-68f3-08ddace4be91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tlp4bHVscmhlY1FPNkg1WE1wMXhVSUFmWGxyUHdDOUtyVEZCTnRyV1l3d3hk?=
 =?utf-8?B?T0Y5SmM1Vlc3ZElsZUxhdUlONXVETjVmMHdMZVBSNm85YjlGUi9ONVRGbS9B?=
 =?utf-8?B?TlVZeHRlUFlFdFBYSGNHUjUzRGpXMW9Wd3NMNXJaMWl1QVc4TWdtdExlMmhB?=
 =?utf-8?B?UFlwWnhXcXhnMGpZdEYwQUtHZjhaem5ZL1REbTJxOEpkSGI0VHRGQStQZWxO?=
 =?utf-8?B?ODZhQUZubldPSVpJZGk5SEdrYyt5RnJDUmhlWlZBVkluN3RZUk52R2R5Wjk0?=
 =?utf-8?B?TjVHUXZLN2d1d2NaaU44U084ZFZkK3FKcnJTK3dEMVVoVUVPQVE5RTRUL3ov?=
 =?utf-8?B?R1lMUTVrN1BvajdtdXpXaG9nNm1aWDB5M0V3YTZDVlhsSlB0N3JvRU1yQjdK?=
 =?utf-8?B?VmEyM0RxVFF5ZHNzcDF0bm4zZlRmWU5GdWJ4TGVheEtPOUJyTVBjR3J0bFN6?=
 =?utf-8?B?cXNHT1FyYXc0VlZ4TU5JR2pmR0gzZnhxRklVQjJINWZXMGRUMzZGTHc3bEZQ?=
 =?utf-8?B?WUhYYndPR3hkS0JPdFdkWElNRzY5Y2hzbEROMWNjYUN2Q3J3SDFiVnVsUHBI?=
 =?utf-8?B?UERRUitQV1NGRkF3VHZ0MytMayszWFpRSDNZTFh1eTVYMno5SXpEYXZ1WTUx?=
 =?utf-8?B?ZjJOOEN3TjkxOUNWczhGRFVoZXkwbXNTMXdvaUlUdVl1amNZQkVPWnB1MWY3?=
 =?utf-8?B?YnFlNUZVdkI2R1VZclJmV295SmJFaUdNR3hYT0ZROGl4T3BvK3ZTR1FnZXp4?=
 =?utf-8?B?RVdYSkNPQnorTnlpOEJUNExUNTF6N1dUaXNaaHpaRkZEdTJ5a2drWk1NZkV6?=
 =?utf-8?B?M0pnVmxpL21qZmFWNU1WRktDS1Buazd5TW5mUEI4TGhGT3RoWE11T1RPZlZs?=
 =?utf-8?B?ODBnbmExbkY0cXkrT2s4cnVwb2NVaGFPMUFiL1ZZVjhrYlF2Q3NpUVlTY085?=
 =?utf-8?B?OU1ZZWcreWYzakZneUxNa0RXemtlU1QxUTVXWkdMazE1SzZRT1VqVjFmc25z?=
 =?utf-8?B?a0creHM5K1VpMEw3eGVsNm5IRFB2WWwvZVk5dWhtNWNSQ1owM2hMNzM3WFpp?=
 =?utf-8?B?elVCZnQ0U0xNeVZsSitZYmE5NXcvak5mZERLRmxSSmZTSEtwOVJTQUxvRFdB?=
 =?utf-8?B?RmlTdGIyUzdFN2xXUnNpZG85Q3FHREhHUy9VbzRBQzV5dGw0dEtyRURKNlZ3?=
 =?utf-8?B?dml5Qk9QdmtzalFvZzhNUW1Tei9PRDN2WHdlMTZYWDR1T1RlTTZnaXJWQ2lZ?=
 =?utf-8?B?dnJmRFZmbGVFVVQ3citUbTJQK1llaFRlZnBJRDhvUGUvNVljNUJwNHdTSlBZ?=
 =?utf-8?B?ckh5ejFXeGxEdEJOcy8vWmJ2RjFFb0c2M3FjQWtaODB3TTJMSmM3TGcxRzl1?=
 =?utf-8?B?TkduR0wramNNdVlpSzlnMHFkMWNkV1laSngrOEsvcmJuWCtxZ2w5K2F0WVlY?=
 =?utf-8?B?aUhMMXRZQUJyeWhhMC9tSHZzc0dyNDFzYkd0MFA0MTR3d0d0T2x1U2N2MHp4?=
 =?utf-8?B?YnkwajJ4Ym9VdXNyRTQyQ1ZtTy9CL200aG1XcVBpUlhrek5mNTV5bm9oenRR?=
 =?utf-8?B?RnNvSzY2ZkYyd0xrSU1IMG5jdk1rbU9ibWg5U1NjYnU4MXdWVXpmYkdsR2xz?=
 =?utf-8?B?ejBPclNkbVFiMkxLUlBPS0E1TzJIRFJoUTQyZGZmZ2hxY29PL3dYUkhGSXB0?=
 =?utf-8?B?eE1FL1drYm85WUwvU2xZb1FNL2NSYjhtNXRNM3B0UDBuY0w2Mi9ISnpGSWNt?=
 =?utf-8?B?VEtIc1NYRHRPRmpRY3o4azF4M1R3MENFaUV4dDUvejhKaDl3aUFNWmttcnpG?=
 =?utf-8?B?a0VDenc5NWF2QzhZWjdCSzQ5dWIwNFFCZnVSZDB2ZWVBd2pJdTVDME5Nb1Jn?=
 =?utf-8?B?WEplV0J0a0k1ZnhwZGg3ei9lZVNzVktmNkNpblRoL0NtMFRQdGJCbk1scDJi?=
 =?utf-8?B?WVZqY2hvOWVvOGx0TVVxeDlhbWhVcnNMMlY5SlhXR014ZzNndm1VMDRMU1pI?=
 =?utf-8?B?RzVOd3MzZG1nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czh2Ty9vbGM0TGpEQVROUXNqd1JwMmtHMVEzRE9xYUJsQUxvd3lzTXZIVmFU?=
 =?utf-8?B?aUkvaFM1OUU1NDJHU2ZyLzVPTjdHVWorUGt6NllkYm0rOWdUazVDRkNhd3Za?=
 =?utf-8?B?bkI3T0NTakR0am9xTklOeDd6dlN6VmNzNmdqclFnS1MvSm5ZdERTalFPSlBP?=
 =?utf-8?B?MzJxTExzb2M5QnAzc3lNL2d6N0NESHRLdUZQVU5LZnZpZHVPbngvRFNjSUli?=
 =?utf-8?B?eEtHNzlaQnQ0QXAyaWdCWmpOcW5Qa1ZpU2RYei9ZK2drb2hvWUE2TFNyWjR2?=
 =?utf-8?B?MWVtRGo0TnpkTGJmcTF0YkdOOWFmUkpMaUJOWklyRHhLcnpWQlNKb2hGeDcv?=
 =?utf-8?B?Q0krNUVtTFMwZm85VEhDSHVKV1hLNW04SFNHZzl5eGRUN2s1cW9OS2NWR3Bp?=
 =?utf-8?B?UUFaQ295UnlXOWgrVzArQ2Z2S2czM2cwUGU0UmoyRkVZd0hRSWxwQmFpUEM4?=
 =?utf-8?B?MmFadERZWjN2aGwrQkQzVkxoOWJ1alU4R2h2aFJrSmszQjVjNVBRS1FDMEdZ?=
 =?utf-8?B?M1R3RFloVkMvYkJBMWRBdUtpUnBtSTlyTHhTK081Sjh1Y0dVV2hEWUhCMTUr?=
 =?utf-8?B?MUwrV3VyWncwdjZmc0JKa3VOdC9mb3RFaFY2S1hPa0MvaU9iTkM4dHFqQTFj?=
 =?utf-8?B?bXByV0FUSzg3bDcyV2ZETEtMYWVrR2gyazdYdlVid1h3NzhwN2tFaW5xcHpv?=
 =?utf-8?B?MEVYM0htYUxhK2FBNlBqV0xvUGVBYmpVNnBUYlM1UCtMT2F6WHRucENES0lS?=
 =?utf-8?B?aUpGdGpodStQc3ZrNHlod1dvSEFIcnVIb0QreFczUDRhM05oMHV4V3B0eUJj?=
 =?utf-8?B?bnlrV3l6ZVlzZ1M5cEVSdmR3MGh6OWptcEdFTjM2eWRsb2prTGkwWlZXblo2?=
 =?utf-8?B?TlhrNXNUNXc0ODZicHFweThMenFodVRvbXVIR3dMQUxsRjVkVWRBOGw5WTNr?=
 =?utf-8?B?RUttZys5RXVVV0JHdFBTWk9HRTVqN1JhOFN0UWgzZHNyZ24xTGhyMko5c3R2?=
 =?utf-8?B?YVZ1dXFPYTMvd1VCVlptWnN5RnNwRmtPYTlmU0wwaEQyYm0xV3JYbjZGVUpr?=
 =?utf-8?B?K2tIaWZKYXNkTjhqZG5HY1Q3WHJnbmdDc21ldnY5RU5wMk93OVFqb0Y2ZDBO?=
 =?utf-8?B?cHptVDhDcmtpSVlKVnYzNjNPVXhLWC80QTdmcTBDTlY3bFJYelg0Ny9PZFAw?=
 =?utf-8?B?bDlNN1RsUkVrdGM3cC9HSVZkTGxpMEl5UVRQV0VkOG1VL2sxUTB5R3RaTTJ3?=
 =?utf-8?B?Sm54TStFV1p3ODkzcmZaYlpSanU2R0l1R09TdFl1UFVyTExnQkozT0lGYTZ1?=
 =?utf-8?B?N1hSeE9xbXc3RnM1RTlEVWQvU25NRVoyVmtSMU1FaThTNUhBZENNYmhXNnZF?=
 =?utf-8?B?eU1hbG8zeDlseGhsV3BYekxleUQ1eXlZMTJHb0FSZ0dxTnRUNFpNZ1NSQU1Q?=
 =?utf-8?B?YVJaNnRUdzJrYmtFcE1ONEJQS3orVUliRG03ZjgyN3lybmtkdHhPRGpXbFgw?=
 =?utf-8?B?UVE4SjFRMjdKNVNXUjNpaGdyRFZ4V2lVTGhzbVNkRFpKMkpBTkxvV2o0OHJa?=
 =?utf-8?B?K3drUTZsazllWG5PTjd1OGJZaXhmT1o5cDJRMHlMaTlPSTBBeFZMUWcyd1h6?=
 =?utf-8?B?V1hLQ1dQMmozM2FBTnMxNWN3Q1NvcDFJM2FNbVlVajFTZk5BS0xWN1Q3d3hK?=
 =?utf-8?B?bW54Z1R0WGNNbWw1MUxZMk55bnlneHZwc2dpanBkMUY5dm9UenR5QXByb1Ex?=
 =?utf-8?B?RXltbEprZnEycW91ejhMbFJkd3ZxVXZxbDE5aFE4RExKakF4bE4rTDZXRWRS?=
 =?utf-8?B?enYvTlBwYktwTGZCM1dpMDE3VzBCWUhCY29sU1I0b09RNzhLV0s5bG9mbmtw?=
 =?utf-8?B?NnU4ZVFHRUtvdFFzUjBKclBRNXd2Uy9rQWtYcjZVNEVKc25hSnp2Mlk3OVlh?=
 =?utf-8?B?RURTZ0F2c1BjcFNSbmZnZGZwTmpZby9SSEFpMDJjU0VTODVVVTdOQjZHU21o?=
 =?utf-8?B?YVljczhjL3pLZWpUaVU2ZER3RzgvNXc5TXZGTjNCd1ZmQml5S2dINFhYbity?=
 =?utf-8?B?TFAwZUhoZHJTbzR3UUZaMTlNN0lreldkdUErNldsR1JWYXppYXI1WjdFdGRO?=
 =?utf-8?Q?VthE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88b8313-d928-4f0a-68f3-08ddace4be91
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:47:40.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Twdu4OPyHj6r68+gbyvWrZp4t9BN+xuNnhijq2KBij8MuzCITaDc/+2O38DQtUQO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773

Hi Tony,

On 6/13/25 16:41, Luck, Tony wrote:
> Babu,
> 
> Compiling with "make W=1" you have several kerneldoc comments on new functions
> that do not describe their parameters.
> 
> E.g.
> 
> /**
>  * resctrl_config_cntr() - Configure the counter ID for the event, RMID pair in
>  * the domain.
>  *
>  * Assign the counter if @assign is true else unassign the counter. Reset the
>  * associated non-architectural state.
>  */
> static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>                                 enum resctrl_event_id evtid, u32 rmid, u32 closid,
>                                 u32 cntr_id, bool assign)
> 
> 
> Warning: fs/resctrl/monitor.c:984 function parameter 'r' not described in 'resctrl_config_cntr'
> Warning: fs/resctrl/monitor.c:984 function parameter 'd' not described in 'resctrl_config_cntr'
> Warning: fs/resctrl/monitor.c:984 function parameter 'evtid' not described in 'resctrl_config_cntr'
> Warning: fs/resctrl/monitor.c:984 function parameter 'rmid' not described in 'resctrl_config_cntr'
> Warning: fs/resctrl/monitor.c:984 function parameter 'closid' not described in 'resctrl_config_cntr'
> Warning: fs/resctrl/monitor.c:984 function parameter 'cntr_id' not described in 'resctrl_config_cntr'
> Warning: fs/resctrl/monitor.c:984 function parameter 'assign' not described in 'resctrl_config_cntr'
>

Yes. I noticed several of them.
Warning goes away after replacing "/**" with "/*".

Now I am not sure if we fix it with replacing with "/*"  or adding
definitions for each of these parameters. There will be too many
repetitions. All these functions take r, d, eventid, and rmid as
parameters. Also these are static functions.
-- 
Thanks
Babu Moger
