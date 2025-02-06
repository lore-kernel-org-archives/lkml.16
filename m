Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F421D61A1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876954; cv=fail; b=CBKK7ZRVctYYEuwn+AWgFNXsucVQFo8W8B0nqEBPQ/9goYqBrycXbuS2f3/93h4QWUwzvJ3LQCZJp3d7IcZyHAzxWoBN5LlNHPKZKGNyjsKE0Vx8FyGywm4FAJ91e/d5m3j/gFrE4qRNtMRWlJVeyN7HpSTz6NN8vYQI+4A+fZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876954; c=relaxed/simple;
	bh=EC+I5UY9MrnxhddTauqEnoG9R1QILDvdZZJhCfH5+wg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BjS0VeTk/jNKe5uxD22xWEDUR+IqLDyroZD0Kub5ysJdDHGnRV6jOIQQzZzksrur06DHpjsK4w2LYSWAQhsIJmuYbCHunH2uc/lo38bSWWEUraMIFPv8ImY+CBnETGcje7GDxWOwGminsO/5QcU7h43yixr6+xpM87FF9//vxQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S1hzRwgV; arc=fail smtp.client-ip=40.107.102.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S1hzRwgV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp0IkRnIUHR04lYToZFEE6XL/qTCalCvS3zPv/qPas7KoHgrcCOdIRM+rUrEGzYYyHIfX+i62/JLt09oQCIa6EM7Q0Tiig8yzpYfIyErZN++VqXhEqPYBBxs9nNyqJWhVG6Zbf9XedgIckhY3BQBKewwSmvVhOqXf9f9tLJ9qxaB40UCm7Tepr3Wza1cIGgsATF5bFgWyVz77AVn+apfWYCUQZ7hejLZxeeaAPjHWQxgXlq8yZsn/DpVIGNuiMjC4siwd4LUkyceiandlyPb8SI1c9aN3ZdUoMRWG6U7PC3PbAVKqj8MKBzgeC2hWoE3UZR9/sYoAR8+vPMNjvFgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYE+nTXfT5SjUMoTpACw7pYtpL1anNKffx0j9EBVUmg=;
 b=NwDPWdMqpbjhNEuCsS2RjpsmwCGVXSff9zkrEZxpg83V2O1PUmPre9lWEl4CNIYJJWLDaN4Nxxor5W47NB9QOJjZw0099HR0wRXpa8r6HwceJhT4ZB07xZld+b9gXM5Si7PT+8MSEM0GLlMI3INjErOTVpb11nY//S4NXHfQwW+rqJffCWUbzjoZp+sqrDzr+PNswluNQBpRXaKMLdjMYg1HAJXYR0w6O9LLwin+Fplf9YrXiRis33w4RV/9XHBtklsYCu8xtCiJS8B8jwzN2PtzeNAEUel906lYvktKRmgHEOikgBTONaVpyRe3WzymdSBOx7SU68JjqGwXrim78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYE+nTXfT5SjUMoTpACw7pYtpL1anNKffx0j9EBVUmg=;
 b=S1hzRwgVPg0Ks1zpoqGr8kONQbkJmpBRAqY+5P4ZREqhSR0KV7sMrRrH+FPu4iSXX6xgC6b4mcGh9Z3MAqA4bKP8AD/XevSa4xy544mMWhyQi9aJvZhprBfJUDXKVK2mKChD3VFJumK3WxP/99GwZqiabqjyhyCsHO0r1sanPhFvQZoqycqS560xcg5ygSGEnUuyR+z8JtYht/eyj+o4uiJU2rIasLy5CDjf1lm0Sv5I++0+SwzQgIcrVdxB4huOVkcGK7uc5wvPGiCMhTTbvEz24ViA794Vh4KX48zwAljePAH5IKAvOMuc+pDSSAP2bNTUfNk1mM6yZidacQCzgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 21:22:29 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8398.018; Thu, 6 Feb 2025
 21:22:29 +0000
Message-ID: <47db7421-c796-4592-b223-d50277625dbd@nvidia.com>
Date: Fri, 7 Feb 2025 08:22:23 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kaslr: Revisit entropy when CONFIG_PCI_P2PDMA is
 enabled
To: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
 jgg@nvidia.com, jhubbard@nvidia.com,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20250206023201.1481957-1-balbirs@nvidia.com>
 <20250206081058.GH7145@noisy.programming.kicks-ass.net>
 <202502061145.8AFAF053E4@keescook>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202502061145.8AFAF053E4@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:180::48) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 6425c5ef-8fcd-4e55-1d23-08dd46f45c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0dIcGgxKzhQcjQ4L0R5Z3JCSWtIYkd1TmE4dFpQTm9sdmxOUEwzUTZQWkVI?=
 =?utf-8?B?ZlFSQWYwclFRY0ZvRDVBR2RVc29lZ3k0OEhWSHdZYlQ4QXg0L3BnZW4yT3ZC?=
 =?utf-8?B?Uk0xQXpFVzIxTnZRcGorQTIyUzlWYUNad0tyRkJsTkNKVmpiVURPbXB5YkMz?=
 =?utf-8?B?dVdrRnlSZlJMUnZPTi9FeXIrT0dGbnBORlYyQi9vVlNHSk1ZRUo0eWcwK3Fp?=
 =?utf-8?B?Y0taOG5WTWljZE9DMjdSbmwwN0JQclFTd2VhZStsdDYxMnFRaCtBQ0V1T1lv?=
 =?utf-8?B?QUlyN3MwcEpSSCtIK2k0RmRMeFVFOVlham5GQjJCd1BmdldyTFByU1JaNHhE?=
 =?utf-8?B?NzczU2N4dW15dkpUQzl2bkNvSXE5RnBIaWt1aWVNWURPc3ZxMjBqUGlkVFhZ?=
 =?utf-8?B?L1Zlckl4ZkZGM2NzcEIrWWxBUjBYaHRRN0tla2pyQndEQ2NCVDBHbFdNK1pa?=
 =?utf-8?B?MVpaUjBUTHBFNUVCRmpnRkd6V1NhK3ViVThRY0RiUVFML2t1RGpnOVBOM0l0?=
 =?utf-8?B?d1ZUcGRpNjZaTHlIbmNLUHBtMkJSMlVxQk5idGJ0SVhsRnMzRWdsRHNRc2xB?=
 =?utf-8?B?a0hSQVFCQVJoSGc4RWRhNFR5NzM1S3N5L3BRcmh2KzFEMlN1cERrTVQ2eG5V?=
 =?utf-8?B?TVNFQWk5aHpCOFNSSGQwWENIYkVGaFlwV0hVL1IzNDNiVzBWbVIrckZtbjJT?=
 =?utf-8?B?UUpXakxhNFVWVlY5QWlxaUNtUlJBekJuODFUaGNwNTN5V2Y4emNteGNJa3BS?=
 =?utf-8?B?bmdkL2EzZUVwSGpMcVM3S21RNHZVUE5vTjcraXhjSVZqSFJ0VXUvRVFmajBv?=
 =?utf-8?B?ZEU5TXNja1dKQUYwMGRFdlpQWXhTeTRBeG4vbWV4SDhpa3NReDBFZkpsMVQr?=
 =?utf-8?B?eFVIdmxraENtK2U2YUt1RmF3T3A3WWF3ajlsTFB4bmJMaTh3dTQyNE52Vm9u?=
 =?utf-8?B?aUg2elJTQXUvakNJUkMzWnRzNW4zUVVIYU1sTXpGbWV5eERPdnYvbzVvbWZD?=
 =?utf-8?B?b2lpcmlsdFJVKzV1ZDNaL1lvRHdrOTd2N0NOUmJaNkhjODZaUWhXSjV4RjFh?=
 =?utf-8?B?d0NwTXk3QTgwSHRLTGxMNzlEalcvZDN5NUZQbEp4M3c1M28rNXh6bkUvT1E4?=
 =?utf-8?B?K2h4Q1ZYWjlqdFYzd2VKYkxmakxVNlFYT3Rwbk9rQ3p5QysrUHJSN0xKdHNJ?=
 =?utf-8?B?NnR0bW53ZXlZM0hQSGZQRnVpQnJEaHpqSFQwakhzMjdSY1Q4YVR3ZTVnVVR5?=
 =?utf-8?B?VGtQMmU0ME0xT2Rnd2dCb2tlVENxSjUzS215WGFTV0M0NnVwU09CaHhpeFhC?=
 =?utf-8?B?dE1FM1NDMm1ldXNKeTR4QUt4RzhLdmpCQUs0TEVWQ2tQWGlVYUlKU1UxSUp1?=
 =?utf-8?B?YmFDUGJIQW9WZE56NHF1Ly80TXZ4azkyTGIrY1E0OUNhU3dLQjdmTngwakVq?=
 =?utf-8?B?Tyt2YnhwaGNQSUIvYmV6TXZiVHlyT3daRDlheU5LVThyNHY2b2kwek15QXlh?=
 =?utf-8?B?RjRMUzR4VmhTRjJNVUtKTDB3STJHbFp5bk9oY3F3ZktMTnhKdnQ2dVlSaTZS?=
 =?utf-8?B?N1puRTBwSkFKT3VzS0tVYWdXTVlJSXNPenYrUjJzOVlOc0lENjgreWdFUEx4?=
 =?utf-8?B?c2hzYmpjNzhITzhsQUxRQjJtZ2VIamVaRjFWNmVYakwybmcxK0hzYzRUQ1FU?=
 =?utf-8?B?OUZ5OGxBSU5INTRNTHNiTVpacHA2S0NpeGo1VEE5RitiZWc1UkJjSElIVHBQ?=
 =?utf-8?B?WlRQK0Qrb3lnOWhjU1ZuOTdRM2JzTjZPeUpPcjdoOGFLZzNSUWVXUmE1aFZ1?=
 =?utf-8?B?NXJRRCs5U1RUK1IrSjFUUC9NUlRUYm5FcGs4ajZOeWd2cVNCR0RXMU9ud1JF?=
 =?utf-8?Q?vmdmnL+ypirXk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUQzaEVIYnI4VW5YZEp0Nm8vdlkvNXRyaHJqNGorSGZPcWVOR2kvSnR6VUJz?=
 =?utf-8?B?QWNqOVo1L1k5VFVzWWh3NjduYWgzUDIxcTdHYnh1WHc5bzZIZUdvcUVKaWRY?=
 =?utf-8?B?djNrcEFRdGJ1UXRhN3luVDV3UDd1NEhPc2hoTmEyaUtkWUIyS014VEllSDdt?=
 =?utf-8?B?Q2t0eng2UUFyZE51VVljb3hKM2JDWGZUcElyaEluOUNQaWhOTFZpMEdqSGU2?=
 =?utf-8?B?Ui9IdkhxY0FKclhlcVVlUmU2bXlvTDF5SmVKVXVONGxpN3ppU1lkTGtUUld2?=
 =?utf-8?B?dXR4VDNtNTEzK0hrTUhMbHRMbytMMEtKZVlsZTB5MmpTSXF2NzJTb1dxZXJx?=
 =?utf-8?B?NnErSUt1eUh6Uk13N1NRNDFidlN0amt3cFlBSmNIdHJWd3JXZFN4YkplSWNl?=
 =?utf-8?B?WkZVdzB4d3g0S3dML1d2cE1DbFpOZUlaTW5FNkkxTE43VjhVZ0NscEorSEZL?=
 =?utf-8?B?TityMEtxMGxoSWdzMnhLZGVGVUpSWU1Vek9OYUk2TWhHSkl0cDgranVSbUgw?=
 =?utf-8?B?VlF5U09LL2JxZWpiaHAxdndBbm9mUDF0S215WWxDaGU1NDRwdWhGUkN3Rm8x?=
 =?utf-8?B?d2poY1gwcXZxUUVOWW1LVE11ZTVSYUx3RXJSVVRWQjl3SjV1a3RjL3Z5c3hn?=
 =?utf-8?B?VGVBZENxUzR0UmFvQ0VjejRkU1kzNzQwalZBMnlBZkJpcUJYdFF1Nnhyc1B5?=
 =?utf-8?B?TjlTRTJINzdjY1JVNXpnU29pYytZempkZGxnUHVpa1dzaUNMWjdmUGFabDVI?=
 =?utf-8?B?WlZTWGZkNy8yN2owaWk5RGhXUmhBZGp0cTVieVYxSlU2T0ovRHR4c29pV05E?=
 =?utf-8?B?YWp6R2dUMUt4b0FidnE2WC9rY0tRK0xvUjJEWXZ0SXlXQS9kOWxtYkFSTjBX?=
 =?utf-8?B?M3J3Ujhrek01aElXbGRUdTQ4MkRZUkw1dElaNFhSUW5mVitEQ3IyNnd0Z1Bw?=
 =?utf-8?B?Z2gyMzNyaHNoUWR3TEMxQlRCdytmb2ZNWVlDZU10Qk96NnNnZkFDd1BMUm5j?=
 =?utf-8?B?Qkl2UklwcUdDMW0rejRkVzY2OHBmSE9QK0VnQ3l1N1NKYW84VENUUTgzenll?=
 =?utf-8?B?RXQ5SGxjalE3TVR3czNDdG1lRjEzc1dxcW1KSERUUnVDbGlMdlI0cnVjZnA5?=
 =?utf-8?B?cUJOaW9oUUQ5d1FpT1FKZXBxaXorT2sweU9BTWZ3U1NBck5JY1BLQUM5RHYr?=
 =?utf-8?B?L0tlM0JqYngvOU9JVzlUYUk5bkhlU0hXZDRHWHcvVlAwRlc2SE5ySUF5T1V1?=
 =?utf-8?B?VFhFc1NXUEVodXJiN3g4Sk1kUm1ZNkp1Wkp6RDFMbXlOcllkaWRZZ3lpdHhM?=
 =?utf-8?B?TEZlSHdRN2wxelRJakptcWFJOEROdFB2UWMrQUdQUDlva2JLYis1Z2tiQThk?=
 =?utf-8?B?bFo5Smh6a3N4eWtzbjlmYnJOczVJdmsxS1hNNzZuVFNhWkRmc3RlcVErcEdP?=
 =?utf-8?B?UEdZZUhVYW5GN1lYVE1VRDVMWnZ4aDZkM3NqTDIwOVB6VTBJb2RVdXpXNS9O?=
 =?utf-8?B?bG50UGgxZmpDTy9IZjVJbWM4OW5VNHYzNWoyaTl2UFAzZjd6d1Fzai9ZUGxM?=
 =?utf-8?B?VWZ4UjFxWExaL2R3NTBKRmlCVnM2QmtBUHBJbDJkamNPVExicmR5MTZtY2xB?=
 =?utf-8?B?SHlBeTVJYjRmNXMxdlowZ2RlY2IrWFZIS2IzcUZMRWZyVU5UNWVQMGJnakZ2?=
 =?utf-8?B?bFUvZlFxd0lmczBCZVhzb1Z2NnJLeE5CeWp5R0gvSGNsZXpYTjZLbzBzUUt6?=
 =?utf-8?B?d2doKzVYSWVObHpWVDNDckZGWmhtZ1JGZnZORXMwL2dVZFhDY28xYTkydGFw?=
 =?utf-8?B?Mjl0a3ExUzdvSlhJaGprN1U3VnoxYkxDbEVYMTJOQWh0QzB0R0RqN3gxbFI3?=
 =?utf-8?B?Tzd6M0tsTXkwSUcxNjRTY2RxZlR3UTFLcHFKVkhOZTFzK05RVkNLSFZKbzdw?=
 =?utf-8?B?TGM0R1BVMVF2R2JyeWFHQTBIL0dYWkRaeXdHVElMOHNVNCtFdUhKa2NvV3VC?=
 =?utf-8?B?ZW53MkVnSm5UTzFlWHIyUUhpakVpVkI1aE1sZjBOMG9QRjNONEowOStEaXhj?=
 =?utf-8?B?aU5jczBvNkVwOUdMOC9FNlhKSG1MZjlTUGl0RUpBU2NURkFNNDFsYkw5Yit3?=
 =?utf-8?Q?J5nXM3MfeGXkE/zuaGf9HKV9T?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6425c5ef-8fcd-4e55-1d23-08dd46f45c6a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 21:22:29.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UC5LGFH65e2mB55M2AlkKvEQXkv02K2UPtwGWuu8M2wtb7AkxWPhG0wj2PCtwgf+jAy5spkvBhTfjbTIQbiRIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

On 2/7/25 06:59, Kees Cook wrote:
> On Thu, Feb 06, 2025 at 09:10:58AM +0100, Peter Zijlstra wrote:
>> On Thu, Feb 06, 2025 at 01:32:01PM +1100, Balbir Singh wrote:
>>> When CONFIG_PCI_P2PDMA is enabled, it maps the PFN's via a
>>> ZONE_DEVICE mapping using devm_memremap_pages(). The mapped
>>> virtual address range corresponds to the pci_resource_start()
>>> of the BAR address and size corresponding to the BAR length.
>>>
>>> When KASLR is enabled, the direct map range of the kernel is
>>> reduced to the size of physical memory plus additional padding.
>>> If the BAR address is beyond this limit, PCI peer to peer DMA
>>> mappings fail.
>>>
>>> Fix this by not shrinking the size of direct map when CONFIG_PCI_P2PDMA
>>> is enabled. This reduces the total available entropy, but it's
>>> better than the current work around of having to disable KASLR
>>> completely.
> 
> So, just to restate my understanding: this is about only the direct map
> (i.e. kaslr_region[0]). The notes (which I think should be left in the
> commit log) say that the entropy dropped from 49 TiB (46 bits) to 20 TiB
> (45 bits). If I'm reading right, the offset granularity is in PUD_SIZE
> (30 bits) steps, so the entropy is going from 16 bits to 15 bits. I don't
> see any general problem with that. Especially if the alternative is 0
> bits of entropy. :)
> 

Yes, this is about the direct map (kaslr_region[0]) and the data is from my
system which has 46 bits of physical address. On larger systems with LA57
the drop might be higher. I am happy to repost the patch with my testing notes
in the commit log, if you think it's useful to have in the commit log.

>> I'm thinking this CONFIG is going to be on by default for pretty much
>> all distro kernels? As such, does it make sense to have this depend on
>> this config symbol?
> 
> If checking the CONFIG means we get back the 1 bit of entropy, I'd say
> keep the check. Some folks will want that bit over P2PDMA.
> 
>> Also +Kees
> 
> Thanks for CCing me! :)
> 

Thanks for review!
Balbir Singh
