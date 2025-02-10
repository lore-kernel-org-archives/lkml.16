Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE52580C0;
	Mon, 10 Feb 2025 16:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204593; cv=fail; b=i1tpwh5zzs7QdgPnw70WhK3gjIJftFNcYpbXPoxsV16TIJZnWo7Wm+AMDWUNKRt1r4QzGCa79Q8eDKCEmqt+SadmSaQQBUJj/qs3JHIL6GGufRs3hS8UcYayJzxi6vq7duojv29H6PqkC+p4P+SkMiowHECIXpCGu3JyThiT3S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204593; c=relaxed/simple;
	bh=IWlCR67c712Te7nl8Mt5/d9M0SchuNfjjwg73ek9whs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MuUZRNuD/+wPbDSyWjYwNGDV5A8FUnGU189altFnB0FbzybEWLK+jMZ6itJOeynDtGxCVzI7LljIV4lzRquFuUFTbZDRtfKqEIXLCxH1+fBmOtLq/KmZK05jX/sfOngAX7w/0g+45SK1jZt6GvHiQiluHcm8kcU2gr7441WzWpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c7YkFMeY; arc=fail smtp.client-ip=40.107.220.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c7YkFMeY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6w5Sk6HkYiCaD1xflrV6q7PYciTQ+n1z1I+WGU2MTHPn0TKhzH9oz4Kt3kTmgUfkce003ZlxyRrsQ99Cp6/xXq3LHr0CvCwPGIyoZcjFVjoTCIRH/1J2foD8KKr70XpolmdpMuAHHwxQiAk+2Uu6AYxyWutNTkRSb3bqW1Jupn2HqiweK00ou9Zy0Kj45dEV/hxWfdOHrSInmkqKxZcEljTXqwGxDrSYWgUU3xLM+yrYhRnpBmB02c+ok6TJzGyKCWPYUpwYIIZRyac/nIuxJosOR2BepBFOeRmpxdpNoQUreziAmcumDdrvoXnlUkxr3rNJmw5kentT+zKO/8umw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0BCiRWsZN313djCmteWRXDl9E1skK+Yt/0yr7YWDKc=;
 b=hD/QE3Jc9n5PEwYOuuQV9zdRJui+AL2mryQRFY5SzdTJ5aUhmYLbhKuW9MUHeF+5ycoOCkyAMNmlCX0Z2tFyx0MX68CxDPZZq/NPGU8Vdtfcvq92C1+yBFuhFjXZTBPjDEygHoZ0P4h9O3oaibp4ZSr/rWSoDwYerDPqEMgEC0uhQHPiVfsgFmf/FkTjdmGLrv9vJI3AmWyeqwKIgOSfFN9d1MqzF9rgAU+b8spAzqOcOskmQ+uxxo+Bgq5VX7yIdK/x8iwwU7dQswjVCOCADaeb5m6Eg6zntIGS9z4+N6O8IuXQ9vG8JTH269IcVtUVGHyWdHXoWZNwwDQCPlgf5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0BCiRWsZN313djCmteWRXDl9E1skK+Yt/0yr7YWDKc=;
 b=c7YkFMeYT65CUbU7tuDSzSibtFLXATFCde9IdNFO8DzKtoAh3cqMcHXlOaaqtBLuY0JluVI0e4B6hsVyVh/RAYOIc+vw2V8pmVYh1B8e75yWLqX1XBgBL9z3LqvG+76cm+VmAqfnDHnIaHbqtaQwC6OJ9GT67ZLVeThbM4KPZdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 16:23:08 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:23:07 +0000
Message-ID: <1ad70161-2046-4c7f-92c7-809b01c8c957@amd.com>
Date: Mon, 10 Feb 2025 10:23:03 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 16/23] x86/resctrl: Add the functionality to unassigm
 MBM events
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <36262057667c27acad777836cc1497b19cb7c06d.1737577229.git.babu.moger@amd.com>
 <9746fc25-1657-498a-a290-45baaa8d8c19@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <9746fc25-1657-498a-a290-45baaa8d8c19@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:806:120::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY5PR12MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: f1665dfe-e336-4d1b-75f8-08dd49ef33f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHFLZzU2N2ZERThMdGNBeEhHQktzRlNpSEZLWXJLOXZ0anEyMWZ6cHhuaXk5?=
 =?utf-8?B?RWo4cXFINmtPb0VwRm55VmFFd2FjaGx0alptRlVsQ0NodFR2TTlWTVZMUGRx?=
 =?utf-8?B?OVNHdTNJb0k2Snd4V0U0YnhYR2Zrem84REs5eE92KzZ3UWhwWEkxbklvcnNJ?=
 =?utf-8?B?ZUptRkdvV1dqL0FROVRiK0V2bVhldzFVNk41NDdVeHMzTFkwSDg5ZVZLMHBt?=
 =?utf-8?B?ZksyeGZGeC96VTg5dkNremdmeS9NNVp5WjBPNzdFV1oxaUNtSk9SUFBoQ2JM?=
 =?utf-8?B?Y2ozMHE3OFZzTjZmS09IbmlGWHM5VWJBNElRbGU3cW9wamFIbE1XekQ1dDIz?=
 =?utf-8?B?YXErY1FzLzRkaVhhM0lTcUdmMVZ3dVBDbmVUb2VOWldYMGszSkJPTnpUYzNh?=
 =?utf-8?B?bFFsSm5maThyRVo5ai9ldHZ0YlM3UGx1N1orUFZUZWZFKzQzazd2UkF0U3Z2?=
 =?utf-8?B?Q2R1YmhwNXlLV1hjN3pFUXRTa3BuTWxQSWI5V01HTmRZNDFVbWJSVS9oMXl4?=
 =?utf-8?B?MU0zTmhNYnlnUjFCQjlVZE5jVzhFbU9aenN3WGdmS2E5aGs2R1VCQ3JpUStx?=
 =?utf-8?B?dE4xSVN3eUMrTC9tYThrMTZJbmF2SUQ0ZThPdnI4ZjNzZFZTaG1WeXNrVC9o?=
 =?utf-8?B?Ujk4ZkRHWWxFWWJQV2NnV0NlZ0JudklyaHBNaXkxeGRTRXMyWnh1N3NRTmx0?=
 =?utf-8?B?RTJsYmh5dUJaMUlHeWMxd2hyL2dyOG1GbTlESGc0bmxMUU1lczlodFNIWlZj?=
 =?utf-8?B?ZVdPaXRtRE8zY3Eyd0Q3Q3lpUUxSV3ZXMDk1YjduWUdGem5JeE5tWTdjQS9o?=
 =?utf-8?B?b3U4bmw3b0dtRjNYU1lKZmNjYnVWb3g3Y3JoTGNQQ0hoTFc3ZWRtcEZCczBx?=
 =?utf-8?B?aW5HS095OWVTWm1TdER1MzUzbnhVamxJdTNxMUtEc3NmTGtHZWZ2MDA5ZnBV?=
 =?utf-8?B?VU9LTVBQNEtrU1VjL0M3RjZmNkJhWTFHcVQ3bnpnaDJTcHA0SjdIb0syaW9Y?=
 =?utf-8?B?ZUY0dFc4cHlDU1ZVU0dQbzlORHVTblFWTUFrbDNvODlEeEdwTENqK0pBcGMv?=
 =?utf-8?B?eE5LWnRJZGtOdnpXQWdqUmNoUXFBZ05VdkR0eDNzb2xuQTBseXRpMGRWbmhr?=
 =?utf-8?B?M1FaV3ZqRStaNVNZMmdnR2w2emFoMGw0dWdRV3hJb2psV2VQMEY0ZzRXaHZh?=
 =?utf-8?B?VmFnWGRKaTI2aXdCRTdSS0NmTy9wK1dyaEhjQ3RXRmR0Y3RCa1pIVCs2UGlv?=
 =?utf-8?B?KzRWWGlJSWFob1liOTk1alhXdTU0ZFE3dmZLcjczdExBb2pVS0VzYzFINjFh?=
 =?utf-8?B?QlFEejFuSDZhMjVhSEtsMGZZZWpvazYrNjF0QVVvbC9JZTR2T0NNQWRMLzhJ?=
 =?utf-8?B?anBHL1d2NW9UVGdZQTlJY2haemJ5NXlhM0xqU0VadkZ5NlpvQXVaVGtqazlG?=
 =?utf-8?B?clNLcFZjd0dhV3ExSFFHd2FtNmRvY2VrSENCeG45ZWVYbTR4NzRmTVFaK0Fp?=
 =?utf-8?B?Y1dYMlhHN2MwVEgzUnVpZ0RWd25Qdys0bkhwRzB1Y2tHTUdUb1FtUTJ2UWFM?=
 =?utf-8?B?NTQwZWJZc09RaU9UdVJHS0RSdmNTNzdxVFZOcVpNUjk1aVhxRW1kZGpVc3lo?=
 =?utf-8?B?TFVRRE5NQmZsZUhscGt6ejRpMUpKMVNqem9HZUx6cS9sZ1RtQjFKK3RyT2Q1?=
 =?utf-8?B?VXVhb0t3WGJRZVRhMlRGRnBaOEJ0TGtNYlZyWjV6V3Bid1Zjc21pM1k2TFA4?=
 =?utf-8?B?bDhYNDk1bmRLQndzMUVxclNaRzZwQWkwenZtS3U1L1hvWExROER3TFNnTlIx?=
 =?utf-8?B?dytKbUdJeStmNGVDWmNsMkhBVWp3R0tFSmpEMU55WDVRTkJOOVZkNjVOWi83?=
 =?utf-8?Q?XEeigshZw0ZIy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHVaUjF4MGRVdXhHWitqQzJLRkM1LzNCSXpYazFPaG83ZDJyMXFCK2tMRVk3?=
 =?utf-8?B?b3ZUQUJNUWtMNXI4ek9rTU4yeGtOQ0V3ZEdheTYwRGxxYjlqdXBYR2ttQVlQ?=
 =?utf-8?B?cWNuSzBaaHkrY2JxaEdudzcxZVNCRmtTUTJRblN4d2w0VVIzOHMrNU51SG91?=
 =?utf-8?B?TGNIbTBlZ2s4ODAreXVmc0kzTUlPc1ExZHNWQ0NpSHRubkZNcDA0U0MvNzc1?=
 =?utf-8?B?enFlNTcyaXBTZ2RIMnRqMWJNUVo5Nml4SGtSZXhWUGVuVVpoVlNRT1Q5TGJS?=
 =?utf-8?B?Z3htdVlzSjBRYThlYkFueXBHNjJOMGRORDF4SEtYaHJVbXNGYnBYcjc5Qlkx?=
 =?utf-8?B?RnQ1ZXp0NXZub1V4K0FnYzB2TkhsRmc0bjNnR01RTVQxUStyMWZpRkJLbmhI?=
 =?utf-8?B?QkNlL1FIV05PL3JsemdIRzl0UUlxRFdJMHcrSVlSYi9OVUFLVHA4cHVhTVhS?=
 =?utf-8?B?d2JqQ0V1MzUya2E5SnBKc1VFak11ZTd5emxhODdUSXhYckw2UFJiKzdMQU90?=
 =?utf-8?B?STBtOUVXOVp1bEljTUVNTFRqRTgvVWRIZ1ozVHVPN2NlMnQvMUNtaWNQMkhT?=
 =?utf-8?B?QnVvYlBZTlhHVzVVa2ZFdjc2aFh1OGgvcU5NOXNocjc2U2Yzem80RG13a015?=
 =?utf-8?B?WS9XSFpKemtoOFRmZjlxU2gzcFMzTTdXUFVtc3dxQVFLREE1UEZGLzE2QmtJ?=
 =?utf-8?B?dzZmdk83bEU2L21mdmlLMm5LZCtZSDdRU0k5Zmk1eTJkZ2kwUlFLNzcrcE9Y?=
 =?utf-8?B?OFhDeEVsYUc4SXQ5cVNFT01sVTQ4c0RDTy9NaGFzaFc4YVdKOTJ5czFJd1JF?=
 =?utf-8?B?MjRqK2ozMnFkQWgyVmFwbWJPblBRUGR4eGN6V2haOFhnSjY0dEcySnFNNSs5?=
 =?utf-8?B?eUY3UEFWUndwVERIMk9Rait1Y1JRczJNV0NScFJ1STBRSjJWWFFrWSsvNFZk?=
 =?utf-8?B?aG1KQWZBdktiL2cvTG1KeTczT04wWlRpT0EzcWZtK3VlNlNrQlhaR29mUEVW?=
 =?utf-8?B?aGdjWFBCbGlBUTA1aEFPc0VBOWpuaVB5K1JSRy9VRXhpcHZwbFA2YmZZRUVj?=
 =?utf-8?B?M2ZhWnduZG9DYXI2MU1WdW80LzI5aVB1d1h0dnd2WCtDWjlNZlJGOUxEaFg1?=
 =?utf-8?B?QWxaR1R3a2JvZ3doWGNsWWhnaFc2UTVOdGhadExvczZRSUxmTGcwREo3NkVC?=
 =?utf-8?B?a04raW0rMTlrQW0xUDNyaWl0NnAwU28wRGpwUkVsSnZ2MnRYOEM5QUdKbkVR?=
 =?utf-8?B?N09LWXFvZ0I4WDIyUzNZZFlKVjRJb0g1Q3dKMndZMEw3U2ZYSDc0MU1MM2FF?=
 =?utf-8?B?SGE0TFNRK1JIcTNiRGFhU2RoTzdtNDJsWUNKdnlXdHBjc1FyRUk3c3RJZWlS?=
 =?utf-8?B?Y1pXY0tZdk42WGc0bkxqRGdIcEVqM3I5eE1tcG9ETm82aEpoc1RHb3lPWE5a?=
 =?utf-8?B?eWgxcFVPbnVTcVFNQnpUMFNKNEVHZVJ0UVR0V0NzUk9LdEw0eU1MTXFTRXZW?=
 =?utf-8?B?OGtRV0tNYTFaaXRJc0JONG4rdnQ1aiswTy9SNXRHUUlDOXdzb3NscitvQWdk?=
 =?utf-8?B?cnRDSkZwNnRTcE53L2ppOEhUakZxUng0Z0MwOHJOeGJMYTZhanhpMDl1bGY4?=
 =?utf-8?B?Tis5QU4vNVJrS3FnZERJaGNoUUU0WkJZVE9KY2xUeUxudUwrZzNzZjB4N0I5?=
 =?utf-8?B?ODNXQVVYV1VsMkl2YlF6eHJPMTVJcExRT3Mxb2RhUEQ4bEFDcWQ5bXRtU1lT?=
 =?utf-8?B?TnZKdVY5citTSmN4OVkwclBXM3V4MUpVelRxck5lMkNDNlJRVUhUUmUvSnRL?=
 =?utf-8?B?OTd1MC9yWC9pU2NzWnBuS1REM1crcVN0WDRuRWlGcXZmOEx4WTZKczNNcWFO?=
 =?utf-8?B?Y0s5aDJPWXREQnlnTW96QjV5T0xucStZTTl6U3JiUHdtbzZacFpDR2U0c2ww?=
 =?utf-8?B?Y3BTTTNzVndTTUJsS2IvcEhJQnkzRUN2MVBqRkhaZzZKQUJIRWhKbGZaYXVy?=
 =?utf-8?B?ZXUvTjFpbVdhMEwzUTdIckd1OVF2anNyRSsyQUFNa0FDdUZpZ21XeUJQbWRN?=
 =?utf-8?B?S1pHek1SRE9CeEdBQjJIeDNoMGRmbFRORk9LY3dRS0tmRlhFL0Q4d2ZiQWNv?=
 =?utf-8?Q?BJwI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1665dfe-e336-4d1b-75f8-08dd49ef33f2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:23:07.6572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oATh9n8aLDF1rrY0duyJ4gz0R7A8AY6bbNIJu4Nam7MwP8F0X27FBw5mxszGz+Tr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156

Hi Reinette,

On 2/5/25 21:54, Reinette Chatre wrote:
> Hi Babu,
> 
> subject: unassigm -> unassign

Sure.

> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides a limited number of hardware counters
> 
> (now back to "limited number of hardware counters")

How about?

The mbm_cntr_assign mode provides "num_mbm_cntrs" number of hardware counters

> 
>> that can be assigned to an RMID, event pair to monitor bandwidth while
>> assigned. If all counters are in use, the kernel will show an error
>> message: "Out of MBM assignable counters" when a new assignment is
>> requested. To make space for a new assignment, users must unassign an
> 
> To me "kernel will show an error" implies the kernel ring buffer. Please make
> the message accurate and mention that it will be in 
> last_cmd_status while also considering to use -ENOSPC to help user space.

If all the counters are in use, the kernel will log the error message
"Unable to allocate counter in domain" in /sys/fs/resctrl/info/
last_cmd_status when a new assignment is requested. To make space for a
new assignment, users must unassign an already assigned counter and retry
the assignment again.

> 
>> already assigned counter and retry the assignment again..
> 
> ".." -> "."
> 

Sure.

>>
>> Add the functionality to unassign and free the counters in the domain.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
> 
> ...
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 127c4000a81a..b6d188d0f9b7 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1518,3 +1518,42 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>>  
>>  	return ret;
>>  }
>> +
>> +/*
>> + * Unassign and free the counter if assigned else return success.
>> + */
>> +static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id, ret = 0;
>> +
>> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +	if (cntr_id != -ENOENT) {
> 
> This can be simplified and indent level reduced with:
> 
> 	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
> 	if (cntr_id < 0)
> 		return ret;
> 

Sure.

>> +		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
>> +					  rdtgrp->closid, cntr_id, false);
>> +		if (!ret)
>> +			mbm_cntr_free(d, cntr_id);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Unassign a hardware counter associated with @evtid from the domain and
>> + * the group. Unassign the counters from all the domains if @d is NULL else
>> + * unassign from @d.
>> + */
>> +int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list)
>> +			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
> 
> Same issue as previous patch wrt error handling.

Yes.

list_for_each_entry(d, &r->mon_domains, hdr.list) {
     ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
     if (ret)
           return ret;
}

> 
>> +	} else {
>> +		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Reinette
> 

-- 
Thanks
Babu Moger
