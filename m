Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2614E3074AF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832896; cv=fail; b=QIReuh3bAZNH1mAhiG4j8CCLMsfzR4mPkl/kTjYBKcpt5gWIHc52SmQVg7aP5uLvZmev2CGelwHEY2wdUp/368ldqEzmrQDMWSsO6VbL0gg6lsBpG7aoL5UfWtljPRJxW4/jIHVsJaf7ufIS032Uj6xORS7jT91ZHRIWeirF99A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832896; c=relaxed/simple;
	bh=Qs6dR5gRywknSuoujhjlqqjl85lOb8sM02acbUMaBTs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tblq4n41YbDSZRLlZzP4n2Y05w+zg0PMHU+mdoMIRqO0YB6paJDubQRDXyMcE6VlCcvvT3KGjJ7XSf1dBCdTvSTZAgFRS2U0ba7KsAnBxaf7jSJtpND/5Dp6COruEeBTfmlMeKzD9SYOum+MU3v/X7WCiFHpYE5lsTxzerA0hNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rFkeK1ZA; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rFkeK1ZA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AV/n63GuhegraZJIU8Zy79XAliM2lQJvSa5k+qiFDGSbACEobF7yPk7niob1FdHgeTsgf7OdXFMasUYARmkm4AngIETgCFxL6RU1CdDTuq+0MunsiQRhMh4PtA5mdS9Mq6SeLEaINgpV2xywz/UZHBC/+a/+3Yn5AZ2WDtRVwPa+UBzOiE4gdKSQaSyJF3gDTygLQokVuQ58x87D0x9geoP/wlM01KuQsf5QDQaOG5G2N9fIzmc5qLp5SAQRNfmjkJgkaMHYyY64gSZ9GZX9ZYTYUPdouiN28X/VOiYx0hThzIiV+77RPsJG/1HS/UJT7Cp1JPsex4EdsKGumzGp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxbeCabeuNKXCysMgMxh325dD/vDi4aBgjU96WnNssw=;
 b=OOcJ/l2bXhjGm/z8HgBk69aGRdVqtmRLQbu3RT0XXJAKnIFev6ABUNbmDK9pEewv5zjO2qDo3kMSp1c7QHU4TCXBj4GEqqU9cX1bubdMpZoYF/3Bvmqm8Waf0xpscYQK1Ki9uz7tUyUkVVRfY38HBh33K2tC3/IDyITCuWufTu5ckFhvPF0vzCBEtW3aRJQRGmwFGpII2Q0v2q+Z4YkSWe79WOaCVqc0zK959UC7Y2R0eM9qzdDKr9SEtDbvwm5Od6EY1fbjwJmbCcoaKO1fp26cB1RQ4hcCUXKmt3SaSgm/Q9F3GtW+ulWEaB546RWJVYJfCRZVhTejONSsUBQTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxbeCabeuNKXCysMgMxh325dD/vDi4aBgjU96WnNssw=;
 b=rFkeK1ZAeZBx3RV7WGyh7NoVxEz2JxbBAlMvOB3B/NokijfJDEOq8uIq6h9mPH9cn6IZd2oGQKv+eyfdc2gmUfejfeAX2DjN9xkeupSwxLCEIfIvoWgnZ/NfH92c8TEdikEgOFfPZ6RzfMlbY5SH10ijPkMj/K2Txm1DcK3knx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by PH7PR12MB7138.namprd12.prod.outlook.com (2603:10b6:510:1ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 25 Jun
 2025 06:28:10 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 25 Jun 2025
 06:28:10 +0000
Message-ID: <38072ab3-379d-4e7d-85c8-de1d4f4960b4@amd.com>
Date: Wed, 25 Jun 2025 11:58:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] x86/cpu/topology: Work around the nuances of
 virtualization on AMD/Hygon
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, Naveen rao <naveen.rao@amd.com>,
 Sairaj Kodilkar <sarunkod@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Babu Moger
 <babu.moger@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20250612072921.15107-1-kprateek.nayak@amd.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250612072921.15107-1-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0170.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::12) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|PH7PR12MB7138:EE_
X-MS-Office365-Filtering-Correlation-Id: 67410977-10f2-4a87-f400-08ddb3b173e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTFBS29aVjRiWjcySTBNUm5zai83bnZLR05UZ3pyem1zSmxQcFF6dDc3eXdn?=
 =?utf-8?B?ckdSTGJxSkJ5MFFaeHpscmZFODRaY1dDMEtleTBaL250TTdTU1J3STYydXRz?=
 =?utf-8?B?UndFNHhNZlY0ekJONG81T3E0QWxCbGZZTlAyVlNwNWJLTjJ3VVhQeHBxTmFu?=
 =?utf-8?B?bW95SDMzMmJaTEVvWHBrcmxuYU5vYmxqMG94U0JxSUFnWVE5NGllSW53WkFI?=
 =?utf-8?B?d2E3cmRnNzEwa0FPYlYxQi9ROWhNUXB1eGpWUkxXUW5FbVY2anVPSG1YSEtU?=
 =?utf-8?B?TEpwaXRUVGhrZkxBVTRTaGdpWkM0QTZCTzRDSnFZbUNiQjQzYk5xT05sYmJq?=
 =?utf-8?B?NXl4VkQzOE9jRkx6ZCsrREJUZ3ZLcG45dTlSWHZ3NUdmbnpiVW5qS213QnZC?=
 =?utf-8?B?eDdIZlpyN3JiYjNSbUpMTzAzSHcwcEtDelBvVkRGNVJXZlRmVzFPZGZqQmZp?=
 =?utf-8?B?ZHVsK3VOSzJCVUVJVmJTTUhreWMxVForR1Avbk1WclRJYXhxYzlxb05CTXJi?=
 =?utf-8?B?ekZuR2VzcmZQemFHZHYzZ1h2OG50MHBVeTJ1VUZ1OGthU2JGWVlwZGJNZU1D?=
 =?utf-8?B?R0V1U0xDRXRuZ1IwQ0R1N2p3L0cwT2Rhc090N0ZjV1FpTTlkbFc1SkFYeTBt?=
 =?utf-8?B?ZTVEcGlBeEJFazk1M0FLR2FVdGhtejlyZm1hYlpYYmVjMmlkYkxzU29qRy9S?=
 =?utf-8?B?U2FIQ0VlRFU3ZkR6Wkltb2g1QXBXdFF1SCsrMFVBYkVXU09CSnhyVE5WelY0?=
 =?utf-8?B?bExXNEZDcjF1UVZEakdZbEtidUdYSnd6VXFXRUN0OVRINTF3d3lmQjBoekRE?=
 =?utf-8?B?eVpDMTR2d0R0eXc2M3AvV0pzY1Q1eEZFNlJ6RWF2enhhek5ZQlpEVnVVcGlK?=
 =?utf-8?B?OUhZRUwvakNaMUF5djRpaVZTbmhsWE1HVGxLNE1hUkh2QjZuZFNpeHprZzNK?=
 =?utf-8?B?RkduRTJzYm84Wm5hYXk5THljVWlHZVVGTi9jZjBiMGlqV1d4UFpwZm01Z3JG?=
 =?utf-8?B?Z2tTY1ZhcWxsQ3BDdHg4V1B3QUY1aWZLQ3h2UC91VThpVG9lbGk0TUhqcHpL?=
 =?utf-8?B?MENtSTNDQzN6YzRUamxid2ZDQ1l2MzZ1bmNhSDJ0L1h4ZC90aUZwbnh2NXg0?=
 =?utf-8?B?blJZZXZaeGtnRlkvVEcxV09vQjVWN3FCcXUxdnNkNFhWOHY4TUpPanNBVW12?=
 =?utf-8?B?L3ZkdjFCc3dTYngwNUJKUjJqNVNCSzhKMmlZT2FXTGEraXNYblZCU0Ridllq?=
 =?utf-8?B?MXNjT0U3cmpFak1kRW1FTVdHcE9BeUxldUhReFJkQUtCOUhNVWw5bVg2WEYw?=
 =?utf-8?B?WVI1alY0ODJvWE9JamJrZnJ4U2lidXJBbExWc1MvZWJZR1NzS0d2UDloWURa?=
 =?utf-8?B?NTErblU4RC9MWnNyaEdxM3g3dU50VndJTXhBamE5dnE0eVBSdHp6TnE2N21Y?=
 =?utf-8?B?U29vMDA2aTQ3aG5LeHV0MUxVZS9pZzFuWlpFamxVNUdmT0NOSVVvNDJwdEs5?=
 =?utf-8?B?dFNaWGpJUUpOUlBWMTY2ZlpJK0VzTTdBaUdiNjA1SWFDcmhGRm5rYnBYNnN4?=
 =?utf-8?B?eVdBVU5ydnFrdDRGajcrV0R4R2hWa2xnUjhzNEwwM0tEZkFtKzVQMmxsTlE5?=
 =?utf-8?B?VGFFdXNQeEdwTk1MSS95OWtoMjR5TldZdlhmaVUvaUNqVktkV3pOTFpHNWVJ?=
 =?utf-8?B?c0tHV1F5TmxhT0l6Z3RuR25wODdVSThsc3RJdzN0VUg2U2FZelFsWmlUOHR3?=
 =?utf-8?B?SUdoMEYzaTQvdGltT0V3NjBRK3o2RW5ydEVaVlh4QTRrSnkzOHRQWEp2TGlZ?=
 =?utf-8?B?UklBb1ZYNFZBOHFOU3pBK2ZrVlF4NzE3bURQdVZyZmNXNHArNDFTMkNVdFFy?=
 =?utf-8?B?SXE4L1ZNYklKQzJZTGF5T0tuNnJnYklIR3J0WDNLYXdGRDZhUDZlaEdPcmdG?=
 =?utf-8?Q?lY6KXlA6o1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXRCTWM2MzNiSVpDaXV1akhHUE5QZkpVdlJqSVlWZEYwa05MYk1kWkErN282?=
 =?utf-8?B?WlRrTmdxZCtjQnJuS1h6Wkg1aUtJVXp6aTk3NFhQdmhmcTZTeGdlYUp4VTlO?=
 =?utf-8?B?ZzVmSXRoZUFJb1dOSFRGSU5NU3FEeGVzdklCWFp1NDZkdTZoeWp4VERxemo3?=
 =?utf-8?B?NVpNc2VSNWl6Y1oycGcxazdoV0tQNWRrSVdsYjRNc1R2eHZMSE9xa2U5V2Fk?=
 =?utf-8?B?UFVnVzJEdXpyQVVCemhCUWpzc3VZWXNWTzZlbHJyUGo1MHNsdmVJSUgrd2FJ?=
 =?utf-8?B?aHp5ZnZJbmN3cXV4aThGa1YrTW14RWxSbjAvS1EreEtsZEluUUd6KzZZdGFF?=
 =?utf-8?B?c3RhN0hQNDRJRm5QcE1BaW53UENvMG96YStXZ25KZXQveGdCYXBzcCt3VDZx?=
 =?utf-8?B?eDBWeis2ZXNiSmNJTmc0bTNTeEJhMFducWdhckhiZkFxQWhnbHZERnEvTmlN?=
 =?utf-8?B?SndPaldMaytKbnA4OUZRdDhxOW5GbUpNT0g5NnRtaEVmUzdURUpvdGFrRUFO?=
 =?utf-8?B?MThRSEwrSmphZy9XdXBzbnpIUXE0WGxFTTNhcldjSzBYMEFBdW5zTk5XMEtk?=
 =?utf-8?B?UWs3bnBrSWlBN0c1V1pMVHBpMC9ZMjJXUGZ3VjJOQjdEemJYeStURGliNlkw?=
 =?utf-8?B?V2JTS0dEVVIxZFRzbFhyMjNYeWhVMmNCTXFOUmhGb0tURlRVMkVIMjIyVGpI?=
 =?utf-8?B?WFEwQkN2d08ySVNnNU1TeXhUWkl6dFdoeGVMOVR3V1BBSHJNQU1MVDVMci9u?=
 =?utf-8?B?S1hDSVhzdG1rTlBFVksxMmRXR0pFTjBKSDl1c0p2N0J3ZmsyT2N2aEREbUh6?=
 =?utf-8?B?bmJzamNvK2llSjdEOHo4S0RiVFlrTndmcStuNEhGeThVcGZveHc5YXRiOFZV?=
 =?utf-8?B?UmFMYm1qMjNjOVgxWWJjSXQyRXZaaTBIcTJDTE80NVQzSTZrOFdySklIVFFn?=
 =?utf-8?B?QnRXR3BYRVhlLzloRzhkbzJ2MDlZbUZkY0tFWWZMdHkzVm5ycy9YMTVaL0NV?=
 =?utf-8?B?MlNsTHdWVWh1Yld5R1dKU2NLQWduQUhSWGE1ZUJWd25MeTlQUy9uak02aFd4?=
 =?utf-8?B?aXJwb2c0ajZhcEs4SjIrTTdHWk82UzdaU3FBUVF2UGR2b2MzbDV5YS8wekFO?=
 =?utf-8?B?cGRTckEwL1hibEJQYlZONE5YVEZZOHJHOWNnYXBFLzV3SFI5dDBKZ3ZDZ1Rs?=
 =?utf-8?B?dmk5ZzBoT2FzTGwvR3JIN0p0T2doSmpURlA5OXhBeUY1WHd4djlNTjl2MHlB?=
 =?utf-8?B?aVpLM0YwbE5zNHpwWTNQWGFTN1JzNzBWczlpVzc3N0RuYzA5WUZxRWxXdjRW?=
 =?utf-8?B?NUtnZDJSNGNnNUh6M2J5ZnZvQ2tJemxqZyt5NDNyUVFZK21OZmc5SWUrQnVS?=
 =?utf-8?B?YTgxaGZvNFUzNy9ydXczQ3RQb3N5ZkJ0clE3dmlzVnBsOWZEQXlvRTFmSnlk?=
 =?utf-8?B?OWpwYnVQOUg0cXo5WFB6V2NxK3BHZWRkdTRKMHNPUXY5emlVbzUwSk94aWZm?=
 =?utf-8?B?dDBPTW9wc1VnVmszS2JLYnNVVjYrUWQvQUxKYW0weDZIU05rQ2RsaEtueVFG?=
 =?utf-8?B?cC94L3k2RWp3eE5VMDNtbjUxdmo2WVYzR2o2Qm1rcGc5NXFKbVRQTjFCWGNt?=
 =?utf-8?B?RkcvWnZaTlZQSWQvZTF4M2d2NWhibThGdUlqV0hjVUVsbVFhZnZ5OW5tQmts?=
 =?utf-8?B?RTA3THdSNXdtZitzUGJqNjFIYkp0cVdJaEYwTjJtUW9zWkpkRXh6ZnZkWlFQ?=
 =?utf-8?B?ZEJ0MWxTVk93c3lkbTEwSGxjVW14dkNNYXZCeDhiclI1LzBwME0yZWQ5bU8r?=
 =?utf-8?B?TUZwcjJzaHdocTVubUF3VjZkc0pBc25vMzBXcWxmZ2d5TkFUZUEwbXhkeVVm?=
 =?utf-8?B?REI4WjZpQzJFNlZRWDJSL1VxR3JabkIrK0JFaDVVRjRocEVYc1l5TDJGVzhU?=
 =?utf-8?B?UG9YL0owVVQxelppSHRKWkdaMG1PTmVKaWxla1F0czlwdXJsZUFIbXczbVBN?=
 =?utf-8?B?eHpQSHliYVhDWEYyZElaM0VLVVBadTFGTHM0c0tFeDVhMEJqZWZqV3dRYjFZ?=
 =?utf-8?B?SENReXNHUnN3dndSQVRHN1ZYK2Z4OU92VG9NcC8xWTI3K3E5NkxTU0h2SnNB?=
 =?utf-8?Q?uvZg2ehHbUbwG9GVl6ou52RVA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67410977-10f2-4a87-f400-08ddb3b173e7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:28:10.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q35GmuVnkt7lS3kls4d1ZdZAHLFjK/5B5uqOphWS3QVcYfIqoLoHX1Zp+JYy0fwMiRtNpUQBp8yWGcauZYE+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7138

On 6/12/2025 12:59 PM, K Prateek Nayak wrote:
> When running an AMD guest on QEMU with > 255 cores, the following FW_BUG
> was noticed with recent kernels:
> 
>      [Firmware Bug]: CPU 512: APIC ID mismatch. CPUID: 0x0000 APIC: 0x0200
> 
> Naveen, Sairaj debugged the cause to commit c749ce393b8f ("x86/cpu: Use
> common topology code for AMD") where, after the rework, the initial
> APICID was set using the CPUID leaf 0x8000001e EAX[31:0] as opposed to
> the value from CPUID leaf 0xb EDX[31:0] previously.
> 
> This led us down a rabbit hole of XTOPOEXT vs TOPOEXT support, preferred
> order of their parsing, and QEMU nuances like [1] where QEMU 0's out the
> CPUID leaf 0x8000001e on CPUs where Core ID crosses 255 fearing a
> Core ID collision in the 8 bit field which leads to the reported FW_BUG.
> 
> Following were major observations during the debug which the two
> patches address respectively:
> 
> 1. The support for CPUID leaf 0xb is independent of the TOPOEXT feature
>     and is rather linked to the x2APIC enablement. On baremetal, this has
>     not been a problem since TOPOEXT support (Fam 0x15 and above)
>     predates the support for CPUID leaf 0xb (Fam 0x17[Zen2] and above)
>     however, in virtualized environment, the support for x2APIC can be
>     enabled independent of topoext where QEMU expects the guest to parse
>     the topology and the APICID from CPUID leaf 0xb.
> 
> 2. Since CPUID leaf 0x8000001e cannot represent Core ID without
>     collision for guests with > 255 cores, and QEMU 0's out the entire
>     leaf when Core ID crosses 255. Prefer initial APIC read from the
>     XTOPOEXT leaf before falling back to the APICID from 0x8000001e
>     which is still better than 8-bit APICID from leaf 0x1 EBX[31:24].
> 
> More details are enclosed in the commit logs.
> 
> Ideally, these changes should not affect baremetal AMD/Hygon platforms
> as they have supported TOPOEXT long before the support for CPUID leaf
> 0xb and the extended CPUID leaf 0x80000026 (famous last words).
> 
> This series has been tested on baremetal Zen1 (contains topoext but not
> 0xb leaf), Zen3 (contains both topoext and 0xb leaf), and Zen4 (contains
> topoext, 0xb leaf, and 0x80000026 leaf) servers with no changes
> observed in "/sys/kernel/debug/x86/topo/" directory.
> 
> The series was also tested on 255 and 512 vCPU (each vCPU is an
> individual core from QEMU topology being passed) EPYC-Genoa guest with
> and without x2apic and topoext enabled and this series solves the FW_BUG
> seen on guest with > 255 VCPUs. No changes observed in
> "/sys/kernel/debug/x86/topo/" for all other cases without warning.
> 0xb leaf is provided unconditionally on these guests (with or without
> topoext, even with x2apic disabled on guests with <= 255 vCPU).
> 
> Relevant bits of QEMU cmdline used during testing are as follows:
> 
>      qemu-system-x86_64 \
>      -enable-kvm -m 32G -smp cpus=255,cores=255 \
>      -cpu EPYC-Genoa,x2apic=on,kvm-msi-ext-dest-id=on,+kvm-pv-unhalt,kvm-pv-tlb-flush,kvm-pv-ipi,kvm-pv-sched-yield,[-topoext]  \
>      -machine q35,kernel_irqchip=split \
>      -global kvm-pit.lost_tick_policy=discard
>      ...
> 
> References:
> 
> [1] https://github.com/qemu/qemu/commit/35ac5dfbcaa4b
> 
> Series is based on tip:x86/cpu at tag v6.15-rc6.
> 
> ---
> K Prateek Nayak (2):
>    x86/cpu/topology: Always try cpu_parse_topology_ext() on AMD/Hygon
>    x86/cpu/topology: Use initial APICID from XTOPOEXT on AMD/HYGON
> 
>   arch/x86/kernel/cpu/topology_amd.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3

Gentle ping!

-- 
Thanks and Regards,
Prateek

