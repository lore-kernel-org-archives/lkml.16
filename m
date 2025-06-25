Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519022D4B67;
	Wed, 25 Jun 2025 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874321; cv=fail; b=m3RMj9ZEodwVd0OUv95DfWWL2rTD+24SrV90K72HoKB46mvpfWJ4TjrKvq1SBX+z+4bWSqtx7PQgVev/wRAgNFiGXluU9i1uTkyDHw1XFUp4fWcwL0cRcmy31DtU/vNTClji4mk+x92fqBKnpn/gITvhBsCJLbX+rzeoe1ObYuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874321; c=relaxed/simple;
	bh=YtC13JlToXqYaV0mgrl1fVNh5h0Yt3lZQ4bf+pVIX/Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K2DTzkCT2cH8FCVWyJZsrd0tclnzl5frMTv4kW35Es9LU/QG9HaAGrO2p+muAwAuwVMvnaYTW2CNll53KhfrrTiyh1FcR7zsvQCMgqfhlEPpBGaxAQfw7WgTYcAys6nttZu0k/34W0kLaAYxaYZRsVMSwYcizd5qFTpolag4MOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=llEuc2LS; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="llEuc2LS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnK553if+46NTQV/RZJlC2yNclT3W1FlHns7Q2Q3KDDZYv0LiSaUW7Jshxf82rx9qCakw2WMni9TnNBXSt3ydKgTcQRwe+9E6OausAT09ybTsdwiz3ah3rMK4MX6NZpv6hC86Tb33tl5xSK1NaMNL+6kjrF5i2mXKqi/+An+9M1X8YWyrXBQAZXly/dIWGKPn6k2/PqLcuaiC9YMjOeyxgw1+Q1pY83XzUVo3dqROH15jlat0yWWzoVlZYBhVCX82gJ6uJcjossRWubKrsD8BuvmdUQJU0JM3+osD2ikXRjeYCU71ELDAoY+8YqdhI+2C+vBfGUGzc7VQn5UL7Y6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyu7ysjsdmxYFAZHy87gDXL6Arqpw4X4LsRejwX6zS4=;
 b=EiF8W6/6EBJRticreU8lUCfGa0/GHfhOw04uepCkvt7l0klRSUdhQOhZHxsUwmqRqOi7/ESH2Iqmy04EhTCLYtoB5EWgbvoKZosOoi9c2mNnJ+s2VxucOPTV+aHGe6fhEq0+Baan1kxa2RZmeZnl3/EKi0AGCQ2M+et1OY+8tS9NPltgDXoJiTt3NhNoX3rs/louuG2/lmF9tA4jh9IUjKK8+rgHPGQM9NU0ALs7fsp9nqbkGK9ZsdAxTsOhSTesxMz0XDVatY6EnqNlU1Avx+3OFZhJyywaMVmyt+/m0fcOAzSEf4JtwThIlwuVbaYTL+5oJc+cBHVyCP4Aa5HcYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyu7ysjsdmxYFAZHy87gDXL6Arqpw4X4LsRejwX6zS4=;
 b=llEuc2LSOT9neV2b/dXqUczBezKvl4nvAjxQRZOjRmJYpA68JBq03FMWurAkCwb5bkg1pM+59YTnJQFjtuqOvJeZDH1CkwPSJIdor08RxxDW7lET4Z7vAdhd6RJgoxmdkvqegmaHXMVxQ/MQgWv1O/hrkQX5jWZBCULuIf2cvOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 17:58:36 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 17:58:36 +0000
Message-ID: <aca368e0-0936-4852-9cf6-688931e0c65d@amd.com>
Date: Wed, 25 Jun 2025 12:58:31 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 09/32] x86/resctrl: Detect Assignable Bandwidth
 Monitoring feature details
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
 <31b14155abb7a66aace3dabfa4cc481bfd9e6647.1749848715.git.babu.moger@amd.com>
 <d4ecf9b2-0fc1-4431-be7f-ddb73b530e3a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d4ecf9b2-0fc1-4431-be7f-ddb73b530e3a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:806:d0::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 865b89f7-b677-4dd5-349d-08ddb411e850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXpBRk81dldFbkQyb2lqNTBSalRsN085VWx0bU5sVmF6ei9TRmExbTRjL1ZC?=
 =?utf-8?B?Y2RaV1dsdlFvalRaK2FPTTlwVmJxZHVBTlMwNGdwQ0lScG1EQm9MbXByckdi?=
 =?utf-8?B?Z25xOGw1QmhpOXMramcrdnBXV0sxeVozRkVEcEtZa2t4ZHpLaC9oMUNHdlQy?=
 =?utf-8?B?cWRaR2k1U2VXejRpdEVqQW5ibXpLUnNBVGthcWhuVXQxaUNuVFYvZ1NXOWVq?=
 =?utf-8?B?SlhwVk1UWk10UFpkMk5QSGJ3eGtJdmh2Y1k4MldOdDJnZVp4WGUrQVVsQlJj?=
 =?utf-8?B?OSs2d0lCYmI0Y2Z5d2RrbTg2NjVGWmlmZEM2RWg0eGNYczZHNXFwVzVjcGpa?=
 =?utf-8?B?MDhkOTJkdE1zemN1cFM5d2pOTzh3dkJjMEhzdldzUDduYWZrN2Z2WlVUUTY1?=
 =?utf-8?B?L2RMM1JEd3FmbnhSUHI0dkdCR0luRXB3T1ZTMU43S2NxSGVCYXRnQnVsMkg5?=
 =?utf-8?B?T1NtR3FMZmR0b3hVN25HK1RsRjRFbDlaVmwxNkMwdlRjN0Jjc0FnVnRMUURs?=
 =?utf-8?B?RjNxK1lLdDVka2QwanNXbGd6V2R2Qksva0dVWEd6Tmtzd1lNVU1ieUJCdUhR?=
 =?utf-8?B?dkozdnl3Qmp2K3ZnaXBLVXliL3JXNWZWblY4Y1ZWSFBCY0psRXl0c1FuRnRo?=
 =?utf-8?B?Mkg1T3dMWFR6c3prZzduMFJSdC9UVk1jSFpEK1lJaUNjTFA3d3RqR2MzRGZU?=
 =?utf-8?B?ZTdJSUdMTXhiMGJSS0FPTmdVM2xBZCtRZkVrbFZkRkFRL2lRK2J2NUxLNS9s?=
 =?utf-8?B?R0Vqd0dDcndoMTFCM3Y2cEFVRTk1THpidktjTFV0aVZZOFJYZFlSb3N2NVdz?=
 =?utf-8?B?a09WS0orU2I2YWdEbXY3c2wwb21IcnIxMTN4aTBjUVdNWWo0UTAzVnJKVXEy?=
 =?utf-8?B?d2hFWDYvUlZuUWFjcG5SRlo5TE9TMm9qUTM5VnhHL1cyR2FzcmhaWlM4ZklB?=
 =?utf-8?B?RUg4VE9jVFM1Zm10SzJZbzIzQzlJTHZNMi9JcFczRVFINWltNm1ZZkdGcHln?=
 =?utf-8?B?MUd4U1BvMTI1TDBPQ1g3bDNKdWI5NnJCUXBBdjFYVlEyQUd4bE5wdGkxNDhM?=
 =?utf-8?B?WnIxcDdEOERiNW5VUldneGdHeEFnUDhJQjFoOFpuNU5JV1FqVHJWQ2ZNalFy?=
 =?utf-8?B?N3lWODk4QTk0YVFqc0FmbFNYK1liSlZWOVpxNS91b295VnB4YWpOWUNBRDU0?=
 =?utf-8?B?dDhGOUJOTU9KUHRrbzREZFh5dXF6S0xJKzV5Um4xOWdRa1puTTdjTlF2b2Jp?=
 =?utf-8?B?Y0VFTlhnYTBFN3BPakpZODJlbTZuZnRIa1NSUUpjalQwRnNpYVUzb3NaQTJH?=
 =?utf-8?B?VXRLZXhobWpyd1IzVVBSNlFzc3lUOFZCVWZ0WE9QbGNOY1Y3aVJVa292SmJj?=
 =?utf-8?B?QWZnVTFEQTFEUFBqOWJwYzRmS2ZtL0VuZlo3dU94OTI2b3AxczVSd0c5VS9J?=
 =?utf-8?B?U1lTeW9yS0VjREQ1UWJ6RktYYmhCVC93NUVydXZ5d2s4RUFJT054NzA0ek9Y?=
 =?utf-8?B?ZGdTeFA5eXZGTDFWMHJhNkdnb0Vib1dVdFBLbGlmWmgxQXNNaXI1ZmFCbHpH?=
 =?utf-8?B?VVovQU5iN1ArTmtrMDJCTXQ0MHJXUG9mb3phTUhuWm5mb3NUMzFMNGhaeE5k?=
 =?utf-8?B?ZnNjbjk1QlhQV3piMkU5RXNCTTd6cWh6WHV0MnowVjFMcVJoaFVqVERuUEQw?=
 =?utf-8?B?TjBJS01Tb3p4MlRieGh4MEhZWUl4SXRhNEF1cGdGK3FOTkdDdjVoN3RSbUg0?=
 =?utf-8?B?cmdJN0lsMXo3RXFqWkdiLzg1WUtvd3MwNlFEc0FaTHlJcmJFVE1Cblcwc2RB?=
 =?utf-8?B?RTVBWTE3RnhndUh6bGJiMkU1dVFickdNU0h0em45Q2xDSnpzbmRMK2tUNURz?=
 =?utf-8?B?dHdmY2wrWnlRdm92cjNqb3I2NnpQaWkrOFpwMFhzc1ZraXltd2FMbkpCeTRj?=
 =?utf-8?Q?MCc5lCYjnzQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0djRENDNHZMRHhwWkhrVkN0NkMrOGNoTmlKcWlyNEhwSk1NS2dDT0Z6cDk1?=
 =?utf-8?B?N1VZcTdtUm9LM2V3Z0dnemhpM1hWakRKNm1OU2kyRWRmMms2Skkwb1dJcUxn?=
 =?utf-8?B?b3FnTE5HYit2aW5GMzM4RnBTVTdBTVR4SU5QYUFVYk9PY1FOdFlQQkxtZFdr?=
 =?utf-8?B?ODFpZmwvMHFoVmg2VjJUeXZBRWtpV2h5N0dnMWdocmNnWUJZWEVabHpJZFB3?=
 =?utf-8?B?NG8xeXdrdTJrWDFpaDgzTE12cUpDU3ZDSFAzSFpINEM3RklSc1krY29nK3BD?=
 =?utf-8?B?RXBGWkswVFJ1R0RrS3F3V0loSnRnbzVvOE9KTUgyMC9iMUpxSFEvWjlmK2Rz?=
 =?utf-8?B?cEJqMVJTTG9JaDhPZ3p0WW9jRVBHVFhkanlKUld3SDNSV2JqVXVJUU1QeGtR?=
 =?utf-8?B?eVJ5RTY1c3dKZkU1dXlydXRzUWYrakpFS3pTQ3cwMXoyWnBLVkdLY0s4YVNj?=
 =?utf-8?B?VVEvZWtIcW9kRitSME5vMktQTmlRQzNTUHpBdlY2cmx4S1ErT1dsS2RDSzVF?=
 =?utf-8?B?UVUyZkNvZk1obTN1cXlBakJucFlsYU01aU5vRkVISUdpZExZSnoxZ21GbDE5?=
 =?utf-8?B?UkpkcThiMkdsSWtIS250TlJYbHFGazFGSkxLaWpNZmp6MTNxSU5BWEc3dlNK?=
 =?utf-8?B?ZHlPU2xieFZzNzRITXhpYW1XNmFmQlNlUml3UHg3cWdjV3hsMVE5YTVOMzRK?=
 =?utf-8?B?RkVJdkNvLzJ6MG9KZVhsb3I5ZVVFdy82SlUzYk1oY1pFMWhQTmc1M1hra0pa?=
 =?utf-8?B?MmV1MDg4TEJ6bDdkOFBkcTNPMUZnMTVEZjQ0SHJhdUdZUDJTS3ZxN3Z0bVlQ?=
 =?utf-8?B?WkdxcWJ1LzBkUWJQbExwV05OUTZvbGVEaVhtQXZCbGtCOXZXejUvM1VoRmhM?=
 =?utf-8?B?UDZobDRzMEdPc1FmTHdLbzZYTjJyRU5RTENvK3B4cy9FNU80N2crOVNpVkl3?=
 =?utf-8?B?NWxHamtMbkYwZ1h2dHBPWjZ5YTdTUHFHUzA0YU5KUUJmNVJGdVFUekRTTFlx?=
 =?utf-8?B?c1U0a0tENGZsaE5qMS9WaFlMVWo1LzVsZm5Ma2ZMUFN1UWpWaVZSYWxOSldR?=
 =?utf-8?B?OGJnT2g5SXVnbmZVbkt2aVo4S3oyb20wRkkzSy9SeDNweGw3VFpWYWlzaVNY?=
 =?utf-8?B?NVJGb1lwQmtVK2R5K1hGWTJNQ0J3UTlnVzVtcEhZV2EwVDYwLzJBbFRXaER1?=
 =?utf-8?B?QXg5ZWMvd0V0YlhNNnVXOUZwYjg3c2FlL1BqTEs5Njlac3NKRW5rMFZnTWNs?=
 =?utf-8?B?ZUNTTDFPd25vaEVtV2pidlEvekVwTDd2dG9KOVVSbWhwbFF0L3p3ZHprZFY5?=
 =?utf-8?B?MnFKODhpTjNhRFJlRGthQWJkTzI3dzZUNFlJcytTb1AzZE81SXhZV1c3cXVG?=
 =?utf-8?B?L3ByVDhrYWNEOHltRnE4R2NLL3hNbVM3c0kwYzVCSWo0Zk1QRWpTVm1MUVRY?=
 =?utf-8?B?aVR3RTRsUnJCSFRCZ0haTmROREFocjhVc2gxOW9GREU1d2ZJOU1BeDRWQmNx?=
 =?utf-8?B?VUpuN0hqdXZQR0hyYU84YmxyS2xZWUZ0V1RvNXJrMUpjMXZVamF0OUM2YTZZ?=
 =?utf-8?B?QjRtSExWY3ozN0hodEViUEhyUGp6Z1Q5VUwvRWJPck1hTkhtR2dzdjYwNFhp?=
 =?utf-8?B?b3RSbWZGaHh2WTg3U0pwc2g2b3BXQXZuQUlIbk5rc2RDQ0liUEJoR0VhdGhB?=
 =?utf-8?B?MlhUOW1JcUQ5LzJFRWd2Vk12SVhlMEVZWWM5R3JxNUp2VWxNOHY2dkxBUERX?=
 =?utf-8?B?cGdKVDVDT1drNzArOEwySTdteFZUMjRyRUd2MWZOM3BzS3pEQmZkanVvaUxE?=
 =?utf-8?B?aUZyeFY5ZjYvcXpWN2R4SkE5S08wSjBpYTFUYUZmOTVuMjNhNHVnMDZJSGtr?=
 =?utf-8?B?UzlpcitKWklKaFYvaHh2M2F1RGozemVCRWVoUnRRUGhsOFJGTGdNOEJwSnRa?=
 =?utf-8?B?VmxUdFQvVmVGd1ZTVG51VEVCYm5SVGlMNUhzUkNYRnludXRRL09oSDlTYXo3?=
 =?utf-8?B?UWl6bU1yRFpRazJvRzd2U3lVK2U0ZUNCZVd3WmtzTXhWeGl5R0hPWUhPZENK?=
 =?utf-8?B?TGU5djU2U1RPTFVDSUlXUUxBUkpVWllwNXp3ZkpxeVBkUlovZHM3KzhzK2ww?=
 =?utf-8?Q?qb4U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865b89f7-b677-4dd5-349d-08ddb411e850
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:58:36.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmC3yezEamk/9pmny0gYzetymFgHF5jFwjJSubSi8xuOZMuqmwadoaZobWAY5Opa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023

Hi Reinette,

On 6/24/25 16:33, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
>> Bits Description
>> 15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
>>      Monitoring Counter ID + 1
>>
>> The feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Detect the feature and number of assignable counters supported. Also,
>> enable QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID upon
>> detecting the ABMC feature. The current expectation is to support
>> these two events by default when ABMC is enabled.
> 
> "The current expectation ..." this need not be vague since this is what
> this series does. Perhaps previous sentence can be:
> "For backward compatibility, upon detecting the assignable counter feature,
> enable the mbm_total_bytes and mbm_local_bytes events that users are
> familiar with as part of original L3 MBM support." Although, when it comes to
> this patch this may not be appropriate in that this is something that
> resctrl fs should do, not the architecture. 

Sure. Added the above line. Removed the "The current expectation" line.

> 
> 
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c    |  4 ++--
>>  arch/x86/kernel/cpu/resctrl/monitor.c | 11 ++++++++---
>>  include/linux/resctrl.h               |  4 ++++
>>  3 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 22a414802cbb..01b210febc7d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -873,11 +873,11 @@ static __init bool get_rdt_mon_resources(void)
>>  		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID);
>>  		ret = true;
>>  	}
>> -	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
>> +	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>>  		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
>>  		ret = true;
>>  	}
>> -	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
>> +	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>>  		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
>>  		ret = true;
> 
> This backward compatibility needs to be managed by resctrl fs, no? What do you think of
> instead doing:

Looks good to me.

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index dcc6c00eb362..7e816341da6a 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -924,6 +924,11 @@ int resctrl_mon_resource_init(void)
        else if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
                mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;

+       if (r->mon.mbm_cntr_assignable) {
+               resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
+               resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
+       }
+
        return 0;
 }


> 
> int resctrl_mon_resource_init(void) {
> 
> 	...
> 	if (r->mon.mbm_cntr_assignable) {
> 		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
> 		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
> 	}
> 	...
> }
> 		
> There is another dependency that does not seem to be handled ... ABMC requires
> properties enumerated in resctrl_cpu_detect(), but that enumeration is only
> done if legacy monitoring features are supported, not ABMC. Does AMD support
> enumeration CPUID.(EAX=0xF, ECX=1) if ABMC is supported but not the legacy MBM
> total and local?

Yes. The CPUID.(EAX=0xF, ECX=1) is kind of building block. I would think
it will always be supported.

Added this check now.

diff --git a/arch/x86/kernel/cpu/resctrl/core.c
b/arch/x86/kernel/cpu/resctrl/core.c
index 22a414802cbb..e9a8c4778d22 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -988,7 +988,8 @@ void resctrl_cpu_detect(struct cpuinfo_x86 *c)

        if (cpu_has(c, X86_FEATURE_CQM_OCCUP_LLC) ||
            cpu_has(c, X86_FEATURE_CQM_MBM_TOTAL) ||
-           cpu_has(c, X86_FEATURE_CQM_MBM_LOCAL)) {
+           cpu_has(c, X86_FEATURE_CQM_MBM_LOCAL) ||
+           cpu_has(c, X86_FEATURE_ABMC)) {
                u32 eax, ebx, ecx, edx;

                /* QoS sub-leaf, EAX=0Fh, ECX=1 */


-- 
Thanks
Babu Moger
