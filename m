Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D62222D2;
	Mon,  7 Apr 2025 20:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057105; cv=fail; b=VwrE0SxNDdwm1tD5X+MKFFvmzIibd+CZyL1evmd5RuWxVVgBCPkktR3BJDBr6s2APUg3mf3BktNDd5NptcdH9dlN52rAbGwR60LStrekCktyx0aSm811TwStXyghPqnpwnuZlC35y0t+Aeh/zXdL+UkDdKCLKWbTbhylqaqOUyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057105; c=relaxed/simple;
	bh=b9TLj2P5nVtCcEcI7nBqLX1rWZDe/a3g0f24+d1Km0g=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=swwtd6Wse4fOGdD+P4sChpGtFxxMug28Lvty5vTfKFjjgNF0DjLFaYHHZcZMQmL7OS/ZlSUlshnpITzsytVMF1Z2gi4qos6H7Y/PuYEATtw2qerP2bKFYTV2besfq6lCu6FazzyDwOo1USSKqqyOLsKSDwPMtHQXyinSUHzdPSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GXNwMxmF; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GXNwMxmF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fjrzw4xlCsifj2gj9Znmfipc2l3dTKprr/QNaFQyWx8qQuBZqzakAZWwFLOiaAVEzCu/kPZrTPwLdPd08vCNDzUSv4g9X0BQP8B63O2XQztAvAYZomBU1nsu9JK02aY6S9ZVil1EQ8+M2RhVPUJj2UggwskTk7rPD0X/bw1mMZZfc4HQW8ALUVb45g6M2HsXv60fqOyQlhR4a0AphAxh/LeMZiltqRwI0OSWgQH2PcVbv97Cl5/nQc8McIe1U4S2OhXbmeGKVKz/F0gN8B9JeqRADKVlk8JhX27t6qfVm1Imtc6V69Wp+hrwdbL/vN3JUI65d1vIA0/CUMKLULUzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rj0gUkbOiWuD1xiVMioctKCOmxwNkGagM0petJTmgjo=;
 b=UD7AcfCCyekpxAz6YmJdZAn2spGrPFw9/VrHYEXGy1aV29IJegvpVTVaozbd/wJxAL5XpD6PkHtuc52RdJLiPGmVSY3T/13IcuRbvffM6vnsDLV9uWpHbtQPNPrtDM9K6Cl59Ryktbn49Gka9vL8oFng5UUYFLTV0Ce/Cc2MwiLEfiRe8VcrTEm2sXu8BVATWEYw98MsGZTdLDwnvPTeEOSjq+FQ9c9hqIsAV9ZxKjM+mTl3sPJNAwfByjBzEx/jAv25B8YHXnw65WhzR24taxlv6mzTg5yGUMrQDCnno/YnB9VlwuXyyLlTwuc1kUsT57Iwj9SAXCNyQxMooI4Fog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rj0gUkbOiWuD1xiVMioctKCOmxwNkGagM0petJTmgjo=;
 b=GXNwMxmFVaeETiETnnoFApo81IkKSZcNhEkjWj0XC3o4deKvqDOieja8L/HxsRl29aC4x2On9O2Gp3XwWizUpNBdOOirfmzGleXO/I667up3Rama4RefoVYh+89yenUJblE/m08eAwNsWAGaGqSdTEgQjkKb7s9ps4dNP3uhyx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 20:18:20 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 20:18:20 +0000
Message-ID: <c4ec0e32-5c4e-4c83-bc9d-4bdfd3474ca8@amd.com>
Date: Mon, 7 Apr 2025 15:18:16 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v3 6/7] x86/resctrl: Introduce interface to display
 io_alloc CBMs
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
 <873d649aa0e5f6c24b6340cdcf9ac96ea57d7331.1738272037.git.babu.moger@amd.com>
 <65124831-2c00-4ab7-91db-f8e348686d7d@intel.com>
Content-Language: en-US
In-Reply-To: <65124831-2c00-4ab7-91db-f8e348686d7d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a048cc-1b6b-4a67-fd75-08dd761156dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THVUbW02NzFNZXZNd3hBVVg1L0FzUkJNdGVUWDRsS2kvVGpwYnRFZHYxbmtH?=
 =?utf-8?B?d0pVSzJaeENwWTNOZWtVcG9YOHM4SnJuNnZTOGtMWVQ3MjRIRk12NlhPK3Rw?=
 =?utf-8?B?Z2NtYWxabEJVcTFNUXpxM0NpaXNQbVN4K1BEczYzRkdMTDlsTFMzL2JtRU5D?=
 =?utf-8?B?SFNDck5uV3N4a1FhMmZwd2ZmSTF0bkJGb3FpaGYwMEFiSmtvbDJKSmFrQUtM?=
 =?utf-8?B?RXRqSW8wYkxRVlFDR1VTVnNVUXI3NFRGS0kvUzQ5UGtZSkUzQ1dPcU94cFV6?=
 =?utf-8?B?LzZLSityajRUOSs5UmhwMmRnbzU2L1FIQjg3bGNLdTk2M3VPUEtqdFMzK3RE?=
 =?utf-8?B?NlNKNWlwUTBDVU5GUHkrWjBFUjJ4K01XVXovRTRENU1ERTY4TFp1eHk1YWEx?=
 =?utf-8?B?a2xka1k3K0hpbUJQSlMwSjhtNXpoWmV5M1g2WjVFZ0FYL3JRc3h3UDBiWnhl?=
 =?utf-8?B?bkNrckN5UGUwRVRNSXBMYUNNQzg2QkJlVDJWbXM0UEo3UWhCSEpYZERla1kw?=
 =?utf-8?B?R29yOTgwcldORFJ3eGpibXdqYTl3Yk5XVWt2LzMrbVdubnZiQkY2YkNGeVc3?=
 =?utf-8?B?SlB0WEdhWU9kNll5Z3FDaWdSdUVIUVlVODJyZzJ1aFZiS3hNRjJpclJlQnpS?=
 =?utf-8?B?OHNGb0RnaGtLL3U3NGYrK2gyN044UElYK0VOcjBhR0lRaEE3Y0VLbzN2S3Bi?=
 =?utf-8?B?aFR3bFA0WkUzR3htbERQcW1ib29vT3NCWG1JMDMzQUZJRXZUQUVEWjVNWHFU?=
 =?utf-8?B?VnFURUw5ZEE4NEp5ME1seU5TdHgvTzdnRmszZGhob3dOVWlnSjdqQ0xkalp3?=
 =?utf-8?B?YTMxZjNwc2pEZm0xSEd6UmF2MFJCT1YxL05mcDN0TEhVU2N6ZTNSRWJLMXVI?=
 =?utf-8?B?MWRoRGJ1cFlpSHhGek51cWpFUDdLc2tFd3NKcXRmRXhPeDZNbno0ZW5oeDE4?=
 =?utf-8?B?c0RNeVVjeFc5MDhXaVZqNE8yYlloMndZbnBaeTlkb3hUZ1I3YktEaE9DRUxh?=
 =?utf-8?B?dk1vUEFiNEo2cDdYTDQyYy9JMTY3N0s4SW1nUmFGVnY3T0lSeEZud0hkOE44?=
 =?utf-8?B?YnFEa0N6eSszcUd2cmQ3WmdLcEsrN3pvOHZyZmVqUUxYZ1ZwK2dkb3BWUmty?=
 =?utf-8?B?Z3NUOVlaRnRaZTlvYWwrY25zYUlERStaZTNVTlBYYzIrZXlCSkwxYXluMDFs?=
 =?utf-8?B?MXlYSk43MTNzUTRCUW95RFl3Y0RaQVhEUGlMMXUvTkdjT3pPOEtFamJnMGNQ?=
 =?utf-8?B?ZVdnWGlhbGNoRmdCN0dNTW5PemJ4S2hraThQZEZiczJJbTlMNnZOc2VnQ3I0?=
 =?utf-8?B?dzRucUJsc29HUVRlSzJlS0dxdFRNeG9uelZoNU9FdjN1SVpXUGZaSS9IYm42?=
 =?utf-8?B?bVExUkRGRmNBNzFUTWswcmhUbFd6S3pTYjQ3RzduWDhiZnBKb2d1Q2haYVhK?=
 =?utf-8?B?MnYwcUNMOFM1VDc2UGZJaFZ6bGVRdXpTRndaSk9xbThxekMyZnZxTzJxV0hl?=
 =?utf-8?B?U2dDVHR3WC9mMENzTmNxZDNtMGVxRkJVR3M2ek1sRVVVSFVBaWR5MkNtLzA4?=
 =?utf-8?B?ZGdwK3B4UThTa2hwWVVBOHNod2c4dzBaQjEwOUIzVlJwRUM4dXlTWitObjBO?=
 =?utf-8?B?M3dabStyV004aWxZcFRvNXk2cjcyWlpvNGVmN0VvOW53V3MvYmhJNzBwOGoy?=
 =?utf-8?B?eGp5VU0zK3VhUXpLU0FPRkx6SFcxNDV4UTZpNXpWRUoweVN5RTdLczdvZUs5?=
 =?utf-8?B?U2IrTkdqQk9KNTRPNElqTkJ5YUE5dzdLVGUzVFJhT1g5RmJrVi9hamwyb01K?=
 =?utf-8?B?ZTFRSkdQY3BsOURPclVzZ2o1b25ycU1iUzNBb1RmS2N5eTBEeUlZZldLUE41?=
 =?utf-8?Q?tdJqNB2t9jn3w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEU0RldLYVlUNmhaWGpUVmNwc3FIV24xaWpVSzJYS1ZlOHpEZnoyZU9wMW14?=
 =?utf-8?B?UFg3UzFqTFBHMHdGK0ZvSmhqR3VIT1lwbzFabkRmYVc5Ykh4U2VxVitLYTNH?=
 =?utf-8?B?cFZHbXprTTE2TmRtTDFTMldEOWNQYlAxUGxMTThPb09Lc010Z2lGM0cwa1E4?=
 =?utf-8?B?NWZWdSszVE5WZkpqZWNRb2RsNS9MM3BiU3JqcGFaemdFa29zWDVkRzRZenZq?=
 =?utf-8?B?b3JXbGdRMHJONkx0RGlKNm8vL0VOTFVlSGhJU0VFbDRkTjdTMUFmRFFpV0Ry?=
 =?utf-8?B?dGhpcWQ0ZHVpR2NvSlBIUE53MitpeUp1aHc0ZjZYMTdsU3JlYTdNc1FuTGlZ?=
 =?utf-8?B?Q1p0N1A1WDZSNTd2WXBUNWdjWVNOL05TWHJ6V2k1a0tQTEQ1MEpDS3ZkaWI3?=
 =?utf-8?B?cTRCanNmUXpINVJ2UEdocGc1eFprMGo0cllEQ0htc0lqRTB3andNa2FKRjNh?=
 =?utf-8?B?aXFrYkNtOEQxT1Z6aER0KzNlL0dDaXN3c25GbnhXTmZiSzd6aWdaZk81VCtj?=
 =?utf-8?B?allaWURxL1ZkVE4vdEdjZzgwamduTjRaRmkwNlYwSUwwMWRwUlQvNEU4ZEhx?=
 =?utf-8?B?RU9mM2hHQVBrTVN5NFdqVXIvUVovQ0RXemJSZkJCUVdKR2h4QXVlZG54Mzdp?=
 =?utf-8?B?bUdkOGQ2S3MzRERKWXRNQzljZndUSTJJd1BJNkJOMnRjMjgrcEtOTUFudjJx?=
 =?utf-8?B?aHVsWEtvcFFoeWw1UEZrYjJzNGNqMDgzT3FrdWVvblRncGlkY29vOEprTHQy?=
 =?utf-8?B?QVBpVVdxU2h2SWNzWTVUbXB1dnBHbkpnM2ljQTAxRFd1dUQ2dDVDblZlcE1s?=
 =?utf-8?B?WVJlZDRBcFIvdWZLemxMV0dyZjUyeGpzUUNYaklxeWtwYmVkYkg3WFhBSUI4?=
 =?utf-8?B?M2d3aTBlYytTVVExTGZrc3E1VVYrMisyYnNJN2d0NW9Ldmx4YXlGSE1zQTNn?=
 =?utf-8?B?L2JVSWl0VFJDUTBHM1cwbUJDOVpvL2xCTEJYY25wajUxZmRGdVVMQi8zdTl0?=
 =?utf-8?B?dERXVlUrV2MwUCt0eTB2RzA5dFNxVFMvQURBeHZ3NmNwSzYwZTNJcGNhK3Ev?=
 =?utf-8?B?cFlEOCtBdmxUY0V6VU5ZcjJBS3RjTHBVNk12Q1BPajJzYUhaeFY2WHJTZHcz?=
 =?utf-8?B?bnNKR1pzLzdpTG16SVJZdmEzVmVIa21OMk9UVy9Gck9Kd1RwTmkrRjl4bGwv?=
 =?utf-8?B?U0IvWGNVNTcyTisxdklkNWsvUjVPOGI5VkxDY0duZXBEVjZJQjNZRjV1VTNN?=
 =?utf-8?B?YnhBYXNGNzZWN2JzRWFLR1lkUGMrZTZGOXFQZHJhUXVwNXV2QWJUNTI3a0hM?=
 =?utf-8?B?TjkzdGhPYldnRVBxREhpbnFlaTRBVU1xU21WOEJCRWE1YVM3WUhlbklCWkRs?=
 =?utf-8?B?YWlDQjVrL1RhTDVoTldoVjU4blBLL0hJckRRaTRycFU3UExZY3Z3UlR5Y3pD?=
 =?utf-8?B?RWhHUzlwTDZKaGNlOWhhd2ZEaDJKVzlubk5ZbkEreGhYanJ1V29Xc2E5YWNF?=
 =?utf-8?B?NzNoMEZRN2FUNkh5SmNhVU5NYTlDb1F5d1phYVJHYzZ4QTFGOXcrWUZZY0lY?=
 =?utf-8?B?dldBSHR4ejNzeHFvbFBCeHVrMGo2RVNrSlBMcTQrVjc4T3RFTFl0Rk1FaWxv?=
 =?utf-8?B?NlBVQnhuYnlFenA5QVdmRVdoKzdzNlNaL3g0dENLZForMXRtbGhBRlZFTGhZ?=
 =?utf-8?B?S3o3TTExYTJIVHU2RzViVFRjQ2tUWGZ3cGovQ3l4eWJ0MmZFMy9XanhEMDRm?=
 =?utf-8?B?eUdKWFRIbkJXeFh6SEs2N3BJKy9uSnlpYmNLQkNvanhiWldWTDk5cVM4NWRu?=
 =?utf-8?B?UTI4eUk1SUxCZTAxVFdUc3RSbFJsaURiSHh0NERCWFJSNVRqTlFMMTBoY0ZK?=
 =?utf-8?B?cktpUjdyU1JhYzBvVUZ6ZGxDbFZUYk9JMFprWVBZU0hPeU84emNiY1F5U3dS?=
 =?utf-8?B?TTZWY254T2w3azIwMTNvV1lNakVIcXJTeFpMVVN0ekNuZzVUYncrTU9INDh0?=
 =?utf-8?B?bjE0Y2lQUmowdnF1d3lqcVp2ZnZhNmZaaDhiQkRDeWhSekxJK3JCcW1mU3NT?=
 =?utf-8?B?SnkrK1RwR0ZvMTZyUmNIOEljaHFHUlZnR2orSTVFSFgyOEZWTjAycnZ6eVZq?=
 =?utf-8?Q?aS9o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a048cc-1b6b-4a67-fd75-08dd761156dc
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 20:18:20.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3K/aAdKAN2qNeOpruDg0xhelRYZ5vweFy27kDiAm3Nt+7QA6/4eM6ELKX98N6Gh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687

Hi Reinette,

On 3/21/25 17:58, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/30/25 1:20 PM, Babu Moger wrote:
>> The io_alloc feature in resctrl enables system software to configure
>> the portion of the L3 cache allocated for I/O traffic.
>>
>> Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
>> feature.
>>
>> When CDP is enabled, io_alloc routes traffic using the highest CLOSID
>> which corresponds to CDP_CODE. Add a check for the CDP resource type.
> 
> It is not obvious to me what is meant with "highest CLOSID
> which corresponds to CDP_CODE" ... how about "highest CLOSID used by
> a L3CODE resource"?

Yes. That is correct.


>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v3: Minor changes due to changes in resctrl_arch_get_io_alloc_enabled()
>>     and resctrl_io_alloc_closid_get().
>>     Added the check to verify CDP resource type.
>>     Updated the commit log.
>>
>> v2: Fixed to display only on L3 resources.
>>     Added the locks while processing.
>>     Rename the displat to io_alloc_cbm (from sdciae_cmd).
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c        |  2 ++
>>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  2 +-
>>  arch/x86/kernel/cpu/resctrl/internal.h    |  1 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 38 +++++++++++++++++++++++
>>  4 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 88bc95c14ea8..030f738dea8d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -311,6 +311,8 @@ static void rdt_set_io_alloc_capable(struct rdt_resource *r)
>>  	r->cache.io_alloc_capable = true;
>>  	resctrl_file_fflags_init("io_alloc",
>>  				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>> +	resctrl_file_fflags_init("io_alloc_cbm",
>> +				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>>  }
>>  
>>  static void rdt_get_cdp_l3_config(void)
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index 536351159cc2..d272dea43924 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -444,7 +444,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
>>  	return hw_dom->ctrl_val[idx];
>>  }
>>  
>> -static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
>> +void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
>>  {
>>  	struct rdt_resource *r = schema->res;
>>  	struct rdt_ctrl_domain *dom;
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 61bc609e932b..07cf8409174d 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -668,4 +668,5 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
>>  void rdt_staged_configs_clear(void);
>>  bool closid_allocated(unsigned int closid);
>>  int resctrl_find_cleanest_closid(void);
>> +void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
>>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 37295dd14abe..81b9d8c5dabf 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1967,6 +1967,38 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
>>  	return ret ?: nbytes;
>>  }
>>  
>> +static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
>> +				     struct seq_file *seq, void *v)
>> +{
>> +	struct resctrl_schema *s = of->kn->parent->priv;
>> +	struct rdt_resource *r = s->res;
>> +	u32 io_alloc_closid;
>> +	int ret = 0;
>> +
>> +	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
>> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
> 
> rdt_last_cmd_puts() has to be called with rdtgroup_mutex held, also clear it before use.

Sure.

> 
>> +		return -EINVAL;
> 
> How about ENODEV?

Sure.

> 
>> +	}
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	if (!resctrl_arch_get_io_alloc_enabled(r)) {
>> +		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto cbm_show_out;
>> +	}
>> +
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
>> +
>> +	show_doms(seq, s, io_alloc_closid);
>> +
>> +cbm_show_out:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +	return ret;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -2126,6 +2158,12 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= resctrl_io_alloc_show,
>>  		.write		= resctrl_io_alloc_write,
>>  	},
>> +	{
>> +		.name		= "io_alloc_cbm",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_io_alloc_cbm_show,
>> +	},
>>  	{
>>  		.name		= "mba_MBps_event",
>>  		.mode		= 0644,
> 
> Reinette
> 

-- 
Thanks
Babu Moger
