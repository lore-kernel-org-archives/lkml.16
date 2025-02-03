Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4E1DC9B5;
	Mon,  3 Feb 2025 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615780; cv=fail; b=fQDy3Vnwt15VNuDs0LYT4BAwqB6SH8/rkTQKvSzUc4cxbkMiTHVzP650LGmTODMrCPGIzDdtS5E62Q1gYs5ZIjAR4Xq8rGGFMkhRUUOMZQ0PHoJxXBOZJsfsbGzKTYnfurGQeu3EWDyRaIB8Oc5v5ybOJgWVrFhw4U2gg0MfGhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615780; c=relaxed/simple;
	bh=AHe4lwZgSRRJT6mYPXmy90++Dz/iA+omtmpdUqQO9+o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DYUQ9jl2CkBDfCy/XIGaS0hUj/xg25NzGHNkyKk6XTg9ClhVjDu8hXDfPow7qzEjBdEuE7ptL2Ky35S+mSNMOyyL9xBs9JeDyyvlS6fX5FshcOcbxfWq76zmHUdOiC5lztmHSqZA/XO2cU4kix1kV3kOSiaAkFStRU0G2D5g90g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2mTf/fLk; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2mTf/fLk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHjDAJGju1iagtQhO6vdUO7VhHWpfvnhgk7E6czPf5J/Q0fc1cICe6TYv9JIlOyDLgguUEdlxbb0MOYQAzmZFqmfZM8Z4xbOMvQ5fonvfI2J7vgSpZYJHty41lD5n/wH8cgcqdxJblQFawWQqXG7wuMa2iYxTsEa8Bd1DBV1VlsraI+2T3GYTaXPxykjYH6UbdyRtyoZ0pXRnp1hnBp0zQ7z5w7g7OUHmn3V7DwKCFbXyEUJbvefO55RVenYREh6bCI/GiRLCiXtPypwUoA+bRxk1PvlLviJ52QfW8MWd4Q7B/oh/27JeoXVUOJA2AAn/S9ofy4/mue6jH9I086New==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnpc6USn3k/zKTvjB5qMIyPMrNQH8lLWezkpNTSAsXw=;
 b=jrJ7AD8YTeyHXwhg65IAjoynRFM4nS+aOz1gSWkcqQO1SSS5OUqaTHDBYE8TMgT9Z0QIeZWjzEM3KhfU5DJvr+uuqol9ZpuyHHvwt/czRxpV4jBPv0VKRBlVr9uknFsGTy3O2CyT/SUcw/Z9PMBbYeU2tIVU+rTLHa8fGsVoSk4TAeNpb9AgQTj3iJnGMccY0SXuYWOwnVEpbfWjpOyaaXj+8MKIJfEaz1PN6fUJgHEJpuxHlXbd2jH6o0YQX+wLiSWBFrjqRxGRbnf1q18uXOJMHgZJNeX5kpOPo45Fc7rnDUSH0ntLd0EYGy4b/k+BvDAtT5MwKf5tX8h4A9G5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnpc6USn3k/zKTvjB5qMIyPMrNQH8lLWezkpNTSAsXw=;
 b=2mTf/fLk73fPa84M/X65H4PIBv272WSgccNlPuduGwzoNe2XIgITBgAC1qpNgdPDmrAS5okz6WQn9+tPX9xZIp8qr8SSwuJN2k9ddTXbGWpVFRm+05HHDuVsnTw0BTISRyifzE9pHON8Ebp2ZuAXp4xcpofpMiWUErVY6SGBPqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 20:49:32 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8398.025; Mon, 3 Feb 2025
 20:49:31 +0000
Message-ID: <7a87b18c-cfba-4edd-946b-dd2831f56633@amd.com>
Date: Mon, 3 Feb 2025 14:49:27 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 00/23] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Peter Newman <peternewman@google.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, xiongwei.song@windriver.com,
 pawan.kumar.gupta@linux.intel.com, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, perry.yuan@amd.com, sandipan.das@amd.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com,
 xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com,
 mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <CALPaoCgiZ=tZE_BF2XzeYMRG84x4+kGKfhHWj2Uo=Cre_B_6Vg@mail.gmail.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <CALPaoCgiZ=tZE_BF2XzeYMRG84x4+kGKfhHWj2Uo=Cre_B_6Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0033.namprd05.prod.outlook.com
 (2603:10b6:803:40::46) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY5PR12MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: ec81096e-a9ea-49c5-68a0-08dd44944267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YjdpZ3l5SVY1S3ZBVmdIY0prUUtSWWRmaGhFS0w5UjhGSDBjc0hwTTZWL2o2?=
 =?utf-8?B?Y01FNjMzM2ROZHZ6ZGZpWEFWVWZFWjEvZWpuTTlUQzFwckRySDlQMGFHcjhh?=
 =?utf-8?B?OWltWTVSdDA4OGNnUjJLci9QbHJxOU56OXhGT0U4YXhSK21jcDVmYVN6UWMv?=
 =?utf-8?B?eFdYbTJsKzh2WWU5SkxRbkY4a24zODZvd3pkZEJnd0k1S2FXVXBFenBOeXRp?=
 =?utf-8?B?QzRXYjlqVmRidzdXWThDeHdzNWxnSXZ0QWZveWhWNHNaZ2pMMHVsTE9uWG9s?=
 =?utf-8?B?NjBlYkwrbnlkNk51RENSMkE2VnVKc1gzeVp0SWZtQ0lvaW1GNUd0U3NldDQy?=
 =?utf-8?B?bmNWb3kxeVMxM2kzL0tnNEd3U1NLUnE4Nlg2U0dlNU12T2FJNEJKcFJzbGJN?=
 =?utf-8?B?MkJDZlRQZ25rSWFXUmp3SkNQRUZ3WTV2YjNRaWVYQzdaYkZMV0VjRXpmMCsz?=
 =?utf-8?B?dTBPelErR0Vvd1hlaGE1VHhRT2RtYS9qTnBPUkxMaWVUa3FEd1VlQjQvRU4w?=
 =?utf-8?B?VUZiOElnbG5vTTNkT1ZQWTlhem5WWHlqMEFWQnZPOFFIWGRUMXVkZzZSUHFH?=
 =?utf-8?B?L1MvQ1h2R2h1TVJVYUkzdU1HNHNMSzNXVU1YVFM0SmFzYm5TQlluQ0c4M0VI?=
 =?utf-8?B?Kzh2OUlkdVZOUVhIVkx6RkRZaWJ0cURVN3RScW9IcXFOWWlzaFVsRGF1dlZ4?=
 =?utf-8?B?eWJOSE1PRGNXQ2RtTi8zY3J2R0IvcitabnUxczVCYmJGV0cxRmpmck91c01j?=
 =?utf-8?B?MVhzOXZQdWJPanlHUWE5YktTK28vNUtWcW5DUSszVEgwTklDU0UrNWtvbUh5?=
 =?utf-8?B?a1EwNnlIQzFqNzVzdHcrdDUxOXdQNjlJc1B0ZUJQbTNOWVhSQXNieFBOZVNy?=
 =?utf-8?B?Q0QzdjNZT3RTU3lzaXRxbUNjQXVORVMvVEJaYllmdUV0VGN2bitialJyUk5s?=
 =?utf-8?B?SzQ1WkdldEVxTU1iMWxmM2lmNDIrYXBhKy9oVndZamJPWGRYeW5uN3dOV2Ey?=
 =?utf-8?B?NG42M1J5OEp4b0wyaUZZczRqemIwUWRqMU9iNm0vcWxFNU8vclNuSjZ1OWFx?=
 =?utf-8?B?ejBaTFV6Qm9rcEZOY3hSNUVLYnk0OGErcHB6aE96VjZoZzRWUk5reXJwTUJw?=
 =?utf-8?B?UXFwNDM2dVgwZHNHQmNJUGFFWHA4cXNVWGlESFRRMmR2Yjd0d2R4SzhuNlkz?=
 =?utf-8?B?MG14eWlzamRVMFM2ZExTTVlpb0VVQWE0Q3YrRzhvU2U5dkRpb29EcFBWcUVR?=
 =?utf-8?B?YlFHQmt5eXgxaDRmRFZuazdobGtDUEZkSlNqdVJPSnpud0h4cUpqeHp6VGho?=
 =?utf-8?B?V1duTjhRcTVKUlY0TXdqSUdJR25Qajc0VE5UR1FCQ2g4bm9MRHRDTm1sQUNR?=
 =?utf-8?B?YlpKcGhpTWw5MjgyODdPSHJodXZia3NIRTR2V2tSVWF6K3ZBbERhd2s2WUFp?=
 =?utf-8?B?ekg5VlF3eHcvRjhuTkFxTTVnWXJ0SFovMmphNHNwUXpNU0x1YUJYUm4rUytU?=
 =?utf-8?B?WVprdFc1dHZXQVF3M2dvd21XTkI3eWZ5K0U3QjNrajltQVBuTDJhcHZHV3c5?=
 =?utf-8?B?UGh1ZExjY0pzcXYweldleWNCNTZVZUNZeVpSTGRwbTdidWJQNXl4aVI0YzZz?=
 =?utf-8?B?SVJnU005NjJDUVVqelVsSkRWaU1yeWF6ZkVmS21ZekZHZEMyb1I1UHFqY2xo?=
 =?utf-8?B?ZHR1cHR2ZU9RcllTYnNxUGxhT29lRmg0cHpLUXprOVVMMnFrb0p3bTI5MlYw?=
 =?utf-8?B?aVFrVlBvZTZGQjVHckdKWWcrUnFHMXpjaC9LWjlwMm9GdGNXV3FBWnNQVFox?=
 =?utf-8?B?ZVFmNGlBSk1WYXJ0TU5hdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0lVUzVpeUNJRk9BN2tkRmtJeEYyYk9rYVNoR29nZ2RWN1pGSmRTbXNpQnJo?=
 =?utf-8?B?bkNNTnlTRjI0VGtvT2p3ZGdMWERzNS9NcTRKb1dFMHhZQWM5Wlcxd2hBRjhh?=
 =?utf-8?B?ZFpHbEh3NHZQRVJuOWs2bHcxUjFVVGNDYVV5dERYVS9wUG5SSUYrSGdQMjFR?=
 =?utf-8?B?cW1WUUtFUkR0UU9CZEc4M0RUeFNFZ0NoUk9BVEl6c1d4c21XYUxIbk5mMXlU?=
 =?utf-8?B?UnRWWHR5cGlqSmtKeVJQaWZUZnJZMm5wSXVnMFEyc29TZUlTN2lYY2ZxUnlJ?=
 =?utf-8?B?a0ZpOHpEUDFVM2tTbzczZ2tMeDlQakJJRzN3Z2UrNWlEZWdzMXJPQXYrZjh6?=
 =?utf-8?B?SmcwN1crbDh2WHptb3hZb05FYzdxMVRMQzRzR0tZT3Z4K1dJY043ZFQ3Rzk2?=
 =?utf-8?B?bXBzTGREcDk4czdCdXhkUGdhS3k4d3dPVVBKb2o1M205dGZ3QzlHUkZKUURx?=
 =?utf-8?B?dTdaZFh2VzlCU0xsNDlwUDRpRlQxU2RrVFNOMm83bTJsTm92Wjk0Y1pqN2w0?=
 =?utf-8?B?ZUcwT0M4Wi9jRzBRdDZxK1JmdHIxcWhhYkN2TmNmQUtxMmpzdmhJMU43Q2NU?=
 =?utf-8?B?ck5kTXFacUtBb1EvKzc0VnVWd1hGaFJ3cE5uQ0pMRDlsdEw2YzIybytiN1Jv?=
 =?utf-8?B?M0JIU0lBTzVkMGdiYzJQUVEyaGNvMjFreW9ZY0M2M1AxRUZRUWNjWk01aFZP?=
 =?utf-8?B?RWhrNkJMa2dNSTV1REdaQnBHWEpqT0d6bjVXVVpKSWVSQ2wwU1JOVW9JTzU1?=
 =?utf-8?B?UG1TemczMFZDSm41YW1sNEJrWWVraXYvbDhqbHYxekNHVnNhZzQwT0hNdU5m?=
 =?utf-8?B?U1puQU1yRnBoek1EeDRHcWtNMnNTM1JHOFg2c2dTSzEzaFFuajVGaHRTN21r?=
 =?utf-8?B?ZlhFVWMvaDJnbXZna3JtU1pFNnhFcnZObDhtcHFMMmI2a3NjRjZRNzY5aTVM?=
 =?utf-8?B?U25VU0lIeXFweXZwUzR1b243K0IwRzFCNUVMUDJNNmZDTjl1QWpSbkhZT09G?=
 =?utf-8?B?TlVtT2c5Qm9KcnVRdk5XUG81NHhRVGNPdDJBeTkyckJ5VmRZbzVXMkdVYVd0?=
 =?utf-8?B?SHBFY0VybXhVZWhnQWRjc01GU1MzSXhCQnFHSjRKZHBjeHdyMkRaNnlYM3Fh?=
 =?utf-8?B?TWdxZGdyaDUrakRXdllXREhqZkJlQ2x6Z2NVVkdiZXhhSWlueU9maml6SXhs?=
 =?utf-8?B?eCt2dVVLR25DcWxFQkx4dHVwZkhaYlhVWFpmOGRxVEd2TTUxNXl6UTNQcm9y?=
 =?utf-8?B?OCsvbWdKeDRjVDFjcVQ0R2h1RVJvOFBJZ2RycDJrbmY3NTJKaU9aQXo3V0hQ?=
 =?utf-8?B?WkpGcnEwMW9GV2F5aDlPZnFycS9DL3VQam5VaERlb1o4MGJUYnFEOVZadHRl?=
 =?utf-8?B?Q1YrZVZlVml4NU9oTFpHS09RK2lKZFFRRjVaRTB0bUpXZkdRUDN2bGYyaDRQ?=
 =?utf-8?B?U2NvbnkyL2VpVzVRdWw4L2dqaUlOa1JlYTlBMlYyMzNrMjRZTWlUcy91SlB4?=
 =?utf-8?B?STYya2lwUnlkQmhrQVRnK1dGaDk0S014VU15TUZTZDJHT2c0cUozU1Buc1Rt?=
 =?utf-8?B?NFZ4a1pUSUZKNUIvb3czWUIyejZzNDdab3R3djQxUyt4aDRIU3JDbGJpTmhM?=
 =?utf-8?B?cUFOdGtCOG0zVEduQjBJSDBiK2hmZkpqWVhsa2NZN1hpMTdxNGZPZmNhQ2E4?=
 =?utf-8?B?K3MzM1krNG5zUDNjWjNGT0JpTVRsaStqMUErcllNeDV4VDk0OTlrSVlQTm5Y?=
 =?utf-8?B?YUUxbFNDOUd0MDFOY2c5MkE0YkFlTmRSY0ZvQ04wa3RTVjYzRkI1bWhwbSsw?=
 =?utf-8?B?Z3Vha1lzQ1ZBSi9hMGRrTFIrWGxyeXNIQWh2Q0M4NXJ4VUhsd1RpWGFraHBT?=
 =?utf-8?B?SjZlODNHNjFoSkZXbEFaNmRFa3pBUy9xVHdMV1YzbkxhaU5XSEtxQTJJaDFG?=
 =?utf-8?B?TnRkYjMzWklkck1URVlwWnZPQlRKaUdmbkpFSkZDTkZzZnJCWjZiSlU3aXVI?=
 =?utf-8?B?K1BRUzFuUFRqUU9EVHMrclp2MmdUQXZJNGZUZncyV3RqYzdsS0htejRINEVB?=
 =?utf-8?B?NEt5WVhWWXpPUGZ0U3pmazdEU0pJaExlMVJNVGswUUlDOFhVOTBkS1lBZGJt?=
 =?utf-8?Q?ye7w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec81096e-a9ea-49c5-68a0-08dd44944267
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 20:49:31.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoQo8ALwSlCOE0GnELH+g56jEDFG5PKwrs4W5Mx+rqaD1z1D8T/+8su0YO/+6XJL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345

Hi Peter,

On 2/3/25 08:54, Peter Newman wrote:
> Hi Babu,
> 
> On Wed, Jan 22, 2025 at 9:20 PM Babu Moger <babu.moger@amd.com> wrote:
>>
>>
>> This series adds the support for Assignable Bandwidth Monitoring Counters
>> (ABMC). It is also called QoS RMID Pinning feature
>>
>> Series is written such that it is easier to support other assignable
>> features supported from different vendors.
>>
>> The feature details are documented in the  APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC). The documentation is available at
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>>
>> The patches are based on top of commit
>> d361b84d51bfe (tip/master) Merge branch into tip/master: 'x86/tdx'
>>
>> # Introduction
>>
>> Users can create as many monitor groups as RMIDs supported by the hardware.
>> However, bandwidth monitoring feature on AMD system only guarantees that
>> RMIDs currently assigned to a processor will be tracked by hardware.
>> The counters of any other RMIDs which are no longer being tracked will be
>> reset to zero. The MBM event counters return "Unavailable" for the RMIDs
>> that are not tracked by hardware. So, there can be only limited number of
>> groups that can give guaranteed monitoring numbers. With ever changing
>> configurations there is no way to definitely know which of these groups
>> are being tracked for certain point of time. Users do not have the option
>> to monitor a group or set of groups for certain period of time without
>> worrying about counter being reset in between.
>>
>> The ABMC feature provides an option to the user to assign a hardware
>> counter to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned.  The assigned RMID will be tracked by the hardware until the user
>> unassigns it manually. There is no need to worry about counters being reset
>> during this period. Additionally, the user can specify a bitmask identifying
>> the specific bandwidth types from the given source to track with the counter.
>>
>> Without ABMC enabled, monitoring will work in current 'default' mode without
>> assignment option.
>>
>> # Linux Implementation
>>
>> Create a generic interface aimed to support user space assignment
>> of scarce counters used for monitoring. First usage of interface
>> is by ABMC with option to expand usage to "soft-ABMC" and MPAM
>> counters in future.
> 
> As a reminder of the work related to this, please take a look at the
> thread where Reinette proposed a "shared counters" mode in
> mbm_assign_control[1]. I am currently working to demonstrate that this
> combined with the mbm_*_bytes_per_second events discussed earlier in
> the same thread will address my users' concerns about the overhead of
> reading a large number of MBM counters, resulting from a maximal
> number of monitoring groups whose jobs are not isolated to any L3
> monitoring domain.
> 
> ABMC will add to the number of registers which need to be programmed
> in each domain, so I will need to demonstrate that ABMC combined with
> these additional features addresses their performance concerns and
> that the resulting interface is user-friendly enough that they will
> not need a detailed understanding of the implementation to avoid an
> unacceptable performance degradation (i.e., needing to understand what
> conditions will increase the number of IPIs required).
> 
> If all goes well, soft-ABMC will try to extend this usage model to the
> existing, pre-ABMC, AMD platforms I support.
> 
> Thanks,
> -Peter
> 
> [1] https://lore.kernel.org/lkml/7ee63634-3b55-4427-8283-8e3d38105f41@intel.com/
> 

Thanks for the heads-up. I understand what's going on and have an idea of
the plan. Please keep us updated on the progress. Also, if any changes are
needed in this series to meet your requirements, feel free to share your
feedback.
-- 
Thanks
Babu Moger
