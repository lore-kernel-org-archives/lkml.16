Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A700156F20;
	Wed, 16 Apr 2025 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818206; cv=fail; b=bSyAe8AiMo0PdFCnu0PbdqRnvJzjI++w0/qw/GL1HtbBJwDjH9okSnQsQPeBZl9W3PAORpdZ0A4PV9x+RkuXsyQhP188fK/Fa2WxkK2cy71xS9umelJXBivDsABLllXNGHkdYRoWq1Rwalv+2sUD8AX+8UU4nrNhadgxFf+XZdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818206; c=relaxed/simple;
	bh=toswY30Zzs/14mUvN5cwVg1ToxRio6yItqOLNMRq8ww=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G78hEW+4bLgRd+nSIGl1/tIoaUvFk1VWeEhbFFr/A6CnJk5i6qi6zSPDhGyg0U0NuKMEhnJhItftRuzUBe5IQF7xTQK5Y2yTFSeHHuRJOqS5kCRivnH29YRhGjelX1lhEf49UzOA4zAtLLxAN+ZQbkjEasDIsIeu77wZYYAsWyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MpTjFvXm; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MpTjFvXm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU32tLZccrbwEcgYarxa9HZdCKaty7J121fiQPmgdhcn7AnShy+iQKsB61hPefoxY2Ohklx1/uS51at3gYb3FBuK6wAQn8Jmryms7PV4pqUvqSn18yBiK/AcMq+MZD/y98cJy9WFqk+6cSa3T9ttXYaKNYlmEgXklrsP/cwux2IP+MOq98fxH37G4heroVYy0Pmf5zhAb6eTU3p05cvVWc72uoMNwXDKJ9eX2drv2UR6eSHww9MZ4YMKOvTvVnlKBFy/TskJuuWJLuz5KreONtMmwgGiXJZID/6dEwovXwkMg5T/+9owuZuqTTHl0ci4eDcPHBtNyWDLWH4uoUM4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfKlYbM+5HdelD69KmiNZzN0bAjqkH9zUM1qCStetAk=;
 b=IhWZUZlV9lzlcIMEBuGC29XyDrYw0QbXHPL2953rMN4AjEa90Nc808FBt6iU7OKEe+qTyak2q8E4HVIUk/K7ygrKHKlQOAyq4Z1wLmHS/sQbx0PM0P9xRzYTRmBmS/2kmssT4WQlhdXsAL7FiH05KSn3bQVvdjD7aAhM/9s/68G0UtUBUv5Ofr7vpJ2Nn8k4dYLbkSUbtZqP9GfALmqus1Ahy5Sn/x2fyHL01JOYmKdVEV1d2Bem6euyjhHKmFcirHrbqOH8utnfYsBpNsYeyPU+SJY401w8TbUOiW6vGzVEa8ZPToCIyQDe0FDndb9/bJuGYIMh0UFELUAmH0H80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfKlYbM+5HdelD69KmiNZzN0bAjqkH9zUM1qCStetAk=;
 b=MpTjFvXmmBEEow6MTS8Tm2Yi/MqoqTJuEOk4n3V7v1zIhGKVYK8Oot8rcQZjqEquitFydSkcwCwq6WGvxGD2sUfJXZoctly5DD5iw0WnydaWAxHFhWM9fK7PRpZrY5fJme10P94TvM+JV8MEh3CTKf8HpFngL0AKoTohwpRv2z4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4078.namprd12.prod.outlook.com (2603:10b6:208:1de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 15:43:21 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 15:43:21 +0000
Message-ID: <37ec1d51-1180-474d-9487-38dd49988c59@amd.com>
Date: Wed, 16 Apr 2025 10:43:16 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 12/26] x86/resctrl: Add data structures and
 definitions for ABMC assignment
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <3a15e2e5d6c8a5e9ee65b3fae48ada7eafb77628.1743725907.git.babu.moger@amd.com>
 <cb71665f-a732-4fd9-90cf-213f5609e872@intel.com>
 <0d8cb80a-d34e-461a-9864-cadd5497bcf1@amd.com>
 <a58bd6f6-f5a7-4f3d-ba2a-b45be09b3c3a@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <a58bd6f6-f5a7-4f3d-ba2a-b45be09b3c3a@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e218ef7-1902-4f4c-795b-08dd7cfd6a07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE1zSzZac0VzQ3hUcDBiVTRiL3BEOTQ5aHlISm9meVBrSzFNdlovTTJYUHYw?=
 =?utf-8?B?TlJ3bGtFdCtPSkhtRlovUGhnei9BdTdsZnBYdURZZ2d2RGtBYUdidFlQaytE?=
 =?utf-8?B?L1hRYzA3UHZVeVRrVmlSRmxuWnBITFFvMHNUVlVjWVdyblF3ODl1YUl0di9k?=
 =?utf-8?B?QndtdnhmRG91Y1ZlZ2Zna3dDTnJXRjVsOTllOXRQTjhpZHlpa01wMVVVR3RP?=
 =?utf-8?B?eXlaOUFtK1lYQ1RUalZTRlZhNnczVzREaXVCekkrYk1RQkZVVGc1d2t2S2JM?=
 =?utf-8?B?c3JkM1I5WnJkOG54R2EvZWhKbHdoc3JVVURjQjg3aW9OVSt3VHVRQmxJQ0lv?=
 =?utf-8?B?Q2J6aFkxUWY3VWxWTzFCWU81eXNJcUJ6SFg4SlQ4NXB6MHpUcGVkOW1RdjFG?=
 =?utf-8?B?OFR1VmhnYUNPMjdpTmh3cjhHellHVUNPSzNsa3RrbUcwdnBBbUh4TmlDUkNC?=
 =?utf-8?B?MmNKS2djZzNiSEcvZVpYbjBUaVlIRWVaV1plODBmbC9IaHZtUjFQTFlOVzln?=
 =?utf-8?B?K1VyUXlhTzVVQy9MaCs1elZtLzdvRWROUDNmWlVrZTM0VWV3L1ZrYndIdTJi?=
 =?utf-8?B?TUlNVEpFYkZxTXpIYkJEZ2hQRUFEckNzekY1K05CSXB1MUJHeEpjcWU3UU1r?=
 =?utf-8?B?NWEydURlN2s0bEhQeUQ3L1l0dGtybEFCcnJPdlgvRXd0dndiMlVXR0NRYnMx?=
 =?utf-8?B?bkpGWXRaRXZtaGwrVmIrcnNzMXVMOW9Dc3lIN1JGaFdyYlExaTI1QVpUN2Fm?=
 =?utf-8?B?SUJVM2QrMTJndVp2S1M4bHkrNWpLOFFUdHBXKytPTktFOGhLaDlvRmdxa3hI?=
 =?utf-8?B?cXE0cTdaUDBZK3BxQmYzTmlEYkYxbC8zNEMvajEvc3djM3dOZHBUZmw0c1BJ?=
 =?utf-8?B?U2JETHl2RVhVcklGUHNCMFZzUEZDMGREM2xyUGdpMXhGYU4vK3JwdWlEdndY?=
 =?utf-8?B?STRWTFNLZUhqV0pheUVYb21Qa1hLRVNvVGlxb0dEQzB5WS9mcGJsOWVTMm9E?=
 =?utf-8?B?bDkwUVVWMHVSWGlqOU5qWVVOemgxblJRaGdvZk9SWFMxT2tjRVFPSVFBSHV1?=
 =?utf-8?B?dU85bVhDeGg4ZG5kM2tNMFlQVGZJbFN3Vk9jQWZYeG5ueFVTVXJ2YW1vRzNk?=
 =?utf-8?B?SUpRc01CZzcwc0VvSnBQc2xwTlNVTkg5ZytDTXVVSXBIbVF6M2ZOemk1VEpZ?=
 =?utf-8?B?NjQ1Y1JzK283TlZhSFRGR1k4cEpJZDlubFlBeVZzaHcrS0NSVEZaNGdMemNY?=
 =?utf-8?B?RlpGSEVGMWYrd2VXNUh0d2dVWjFOc043dm9yTFdWMmZsVjVOM1ZtZXpTOUUz?=
 =?utf-8?B?ekk2VzgvL3ZLUWN1aWpadEVvY25SV3Y1dXFRZDZ1UENqeVRlaVBJMVFFUko1?=
 =?utf-8?B?aUdLY29Rbm5YQ2F3WWtxVUJEWlNxK3BkQlpNeVJnNG8zL2xoQmk2aU9uZDY1?=
 =?utf-8?B?clFoait2Zy9mWXZsTHBZMkFIazVYaWQ4M0V6UEszdUE3TXMxaklqM1F1Umpj?=
 =?utf-8?B?ekxNTUowMEljeFh5THljK2hGNTQ4dzNEdFRwb2tiNU1KTEwwT1hEYk9HRHY4?=
 =?utf-8?B?UEdwWHFWb1AwNXpFcHd3NVlIcUJjb0JzanVlcFg1VTZKbllWZ0M2bSszcUZq?=
 =?utf-8?B?a3RaUWw4bVZlTFN3dDlFSXpJeVVOV3B3YVd1VHNBU0lNOTRWT3ZGT0psUXMz?=
 =?utf-8?B?VkNvc0wyYVBnNEE5TnRDMTZmRU1PbGh5YzErUERmTDBtR2djMzhGTGFkaCtT?=
 =?utf-8?B?aFdONWQ1NVlXdzBnak5rWThaekQvSzBtdGtPM0NRaVdrZUIzc2plZGhpQnRn?=
 =?utf-8?B?dmZyQmtWbTlmRlN2Y3pxU1hMRzA5M2R1T0lGcEYvdUM5d0NSaU1HZFZvc1Vu?=
 =?utf-8?B?YWIyVDVuM3JzUllxQXpyOXFhd3BsdGVXbjVhNVc1SFk4Zmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVBWTWdDV3RQakJ2em5YRXNIZ2sxaXAxWTg4UWhlMjlDTmRZc3IzbW9xakxu?=
 =?utf-8?B?UklGZ2swa3JrUm82ZitNci8vRUt0cUpKQUhKSHJNWmJkM1Raem52dE9jYlA2?=
 =?utf-8?B?Z1JWRXUzREUzakVHK3FvOFAyR0JKZlhjNnQxT3hGU1Ezc0hWeXVRNVV0WHZ3?=
 =?utf-8?B?cnVtdjExTTJjZ2NNTjRucDhEN2NqV1NXZThCM0xZL1Z1cW8vdmpuQ3V5ajV2?=
 =?utf-8?B?TjU5ZDNxaU1JdWRMZFAydUZWZmlacVp6VjAxVzBSQlRLMklMdzBoUTd3K0Vh?=
 =?utf-8?B?SEpYU1hiaW5Yek5RdXcrdTBrcDVmMUVlcGVLRWtOUWw5emFMUFhQYmpGUUZN?=
 =?utf-8?B?UkIzdDczb28wQlgyVXJXRFQvTlh5UmliTWptMm5qUHo3RDY4Sno5ZVJ5aHRE?=
 =?utf-8?B?a25SUUFjbHBVVFZ0WHRVTXNRQUhjeFpIS1lJcDUycjhwOEhoZmhBYkI0d2xa?=
 =?utf-8?B?NFhtcm4wcmw5OHk1emdraEE5RnJrUG9pelBuRUg3WTdvYlNKRDZaZ1VVYWlh?=
 =?utf-8?B?ZUhncTZ3OGw3R2FWZHd3ekxUMmJuWDB4RVBOTmcwYUcxUkFPRlZRekxIRlBq?=
 =?utf-8?B?UmhRMXNNTVkyQWRFZ1dQYUlqQXlUMnlkL3JSZ2c4R2NYdVN6ZitDRlhVQTZP?=
 =?utf-8?B?U3JvL1lsdEJMTkIvOERVbjlkMWFRd1JGOFU1NkZKL3FXNTBHVlRxd29DbUNE?=
 =?utf-8?B?RmJ1Y3Zjakpqekl2SjBDMWVhMzFuMTJSY1RmK2NRTExsdnRuMHlLTE5zc045?=
 =?utf-8?B?RUVoclR0d1pJdlYxUkNWL0hpYUxCMDVrckQweTAyNmdmNUswVENUNC9YVzhD?=
 =?utf-8?B?Z2Z5RktyS0hpTTVVSDlMMEtDVjcyd2RJWVVETHE5UCtMdlR3MzZyWWVsQ29X?=
 =?utf-8?B?czJNcHVFNzVKcEk1UkZUSGJBWUV1N0w3eE1Jd1prdDk2UXJJYXdSaHEyMG1i?=
 =?utf-8?B?NFBGdTRPK0xDSEJ2VHdYdXNxMENEQjVPQk9FSjhuUFpGSlVROFBMRmhlSDJz?=
 =?utf-8?B?ZU1pbllod3RKa291d3JzTTRTRTN0VXJONVgyam5oeHB0SUY1SyszdGZvbUY4?=
 =?utf-8?B?ZDZCMlN1a29xdWIrS09CQ2VFbTVBMnhnZktTNUZhK3V4SGJjdFNIN2FOQnp1?=
 =?utf-8?B?WmFNa1ZRSUNuSTB2RmVSc3QzS21INGo2d3NleTJIZ2FKdW9FY2FpSVd3VkRT?=
 =?utf-8?B?NlNvcEVHbUE0djg0OFg2andsYzRhUm1DbG1uQWJmQ0dpY1VBMzdtdVlqM1hh?=
 =?utf-8?B?aDZDbmFoL2h2eDFqMnpNcENBZ3BkeXBnOVEydWtoejUzUTR0ZkJFVXJXZzB0?=
 =?utf-8?B?Qy9JazFZd2NMM0h4VjI3Z1gzS1BoemtLemh6eWp6eEN5ZGJZenNOV3c2SWRo?=
 =?utf-8?B?M2JVL2hJWVBiK0YxS0dtZDcyWU5FZWF1SFAvZUtyT24yT29TampGc1g2SFlo?=
 =?utf-8?B?R0swSlZabTVQekxzTVFiaGJ0bVBlRWJuSWY3TkVIK1ZLc05ucXhBL2tCTTdM?=
 =?utf-8?B?WXpMVUp0Tm9wQ0VKQThKZ2Izend5K2NBTnlPU3dWNlZJTWUwWHFWVTQ4aGc3?=
 =?utf-8?B?bzBnWHVnQTFValhPZjcvS3hUbDVXVnd2UitEV0dvbFZYeVRpdWFhS1huMFJj?=
 =?utf-8?B?WS9EK3hVN1RvUW9nSGZhVFptYXF0N1p3RU9nTnUwd1VyM0JZTFc0eDgxTnpN?=
 =?utf-8?B?NGlpbGNRWUR1RExhMW45anNtUFF2aGhLM1N4U2pNeFM3aGV6OVJic0RMS20x?=
 =?utf-8?B?Y21iWEl6emdnU2ROYnB2N2pBNk91aktmZk1BV2wyM05seDdpR2lGaE00K2h6?=
 =?utf-8?B?VkExQ0dQYzlLZVViOG4wVmc0TnlKV05QbnlWaXdzbG4rdk05dkk5OE9mOXF2?=
 =?utf-8?B?TDlPekZCbkpxV1ZGWSsvV1FRdVhCVmRvdGF5eXhTMWdCUlZxcEhDbFFTMnpS?=
 =?utf-8?B?Tm8wVVdWU2xodEM2YVVHUElndFl3V1czZ0ZDTGNxZDduMGtwbE1yaVcraGcx?=
 =?utf-8?B?dElKMDhTQWJYZHR5UzVHb1ViSmxjODhZWXM1RVFDZ1JZckROTFVBWXJSclRI?=
 =?utf-8?B?cjBUNE5CcmRyMWJLQmtvZXdXaVRCOWRiMmxyRlNUT01aeXFpdmZMaVI2NkRs?=
 =?utf-8?Q?ebUgBzgVrCIJGmpxaPm4C/inB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e218ef7-1902-4f4c-795b-08dd7cfd6a07
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 15:43:21.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FW4J2V22Kb7ieX4u0HpVRnAdwK1J9eDdhchw7F7KkgllCriVpXSHZoVnbWL1hMmS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4078

Hi Reinette,

On 4/15/25 11:30, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/14/25 1:30 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/11/25 16:01, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>> The ABMC feature provides an option to the user to assign a hardware
>>>> counter to an RMID, event pair and monitor the bandwidth as long as the
>>>> counter is assigned. The bandwidth events will be tracked by the hardware
>>>> until the user changes the configuration. Each resctrl group can configure
>>>> maximum two counters, one for total event and one for local event.
>>>>
>>>> The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
>>>> Configuration is done by setting the counter id, bandwidth source (RMID)
>>>> and bandwidth configuration supported by BMEC (Bandwidth Monitoring Event
>>>> Configuration).
>>>
>>> Apart from the BMEC optimization in patch #1 and patch #2 this is the
>>> first and only mention of BMEC dependency I see in this series while I do
>>> not see implementation support for this. What am I missing?
>>>
>>
>> My mistake. I should have corrected it.  How about this?
>>
>> "The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
>> ABMC counter assignment is done by setting the counter id, bandwidth
>> source (RMID) and bandwidth configuration. Users will have the option to
>> change the bandwidth configuration using resctrl interface which will be
>> introduced later in the series."
>>
> 
> Please just stick to what this patch does. The part starting with "Users will ..."
> can cause confusion. To support what bandwidth configuration means the description
> can point to existing definitions in include/linux/resctrl_types.h without needing
> to mention BMEC.
> 
Sure. Sounds good.
-- 
Thanks
Babu Moger
