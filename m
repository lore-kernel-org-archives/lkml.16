Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FEF1D63C2;
	Thu,  1 May 2025 17:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119820; cv=fail; b=IhNSFwjyEFz0u7fBvs6u7+UxgyNSW+TuUZXHgATUGgM6qxjaHyUgQaas2kPO/PdZcHGPO0YvPnW/AyYb8v161QU9NRxXlqV2xLuiK0sLpzUOBh2hpruNlsc1w0l1oFOF8Ok0fAkhgJTT5o85IsbtoWpjmmqbdosP6QEKuVQ9P6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119820; c=relaxed/simple;
	bh=weMZg3BWPOh4pNCYjAJKTxCGqnOmTnKjIGDY4W28zeg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E5QWbbMJlCYgnr+zwFqGwWp8YsjiV34l6wGGNsAyhcSvrsZHfI1aAA/NTzvnpdifB+XdcUEWko4w6FU0VVxwEkrFicPo6fFuNcf1KGAHcaNvdxeLiODdl7pwnYTnD0AtkRw3jx6j8LvhmAS6J7TxZZaPUYyUynjVfjC1N+S6cgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vWpX9L95; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vWpX9L95"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB1nBk2ikx6MId1zcb2KAXT8WnOWB33lJ0MH4SAdUvBDVruxV719sv7q4t4z9iTdev2BA8nBzu3xcNovsMjeFW/WSd0KZ/sk5dmBunvgesKWl9w1GFMhYULbV5KcCKK+EdGgsLvic1mHmoUjCCiQ9pr2rBaiBaAfSNMxMhKr+dgXVYjyR1lML5iKzVP+2wQUyUaV+xE3LbPin86kCXV028rTZ1AfuWvdlVxvz985/VkGLDx6N1UgObmtC53ifvjarFEtTDUhNT8V9Q3qsdVB7oeU0GEZK/57hePrvKOfIbGB54fAIqZ+kLpvG5VGXWL5oT559HG9G0x9qY10wzwubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyxJzt1Fwo7iHl6Bwhts0jPgtaqi31xXMA+C5rrxcdY=;
 b=IpAfc9qjc5lgsX51nuVXkVw20FNDAaOw32Fc3AgxZTcaKayhBfGuZ6apdCnvFdtIg3nokX/bVeNmdaDJJDfaZGSiFtt58nEyzd7WFOGbbXbuCKAbw4OYfbpwqYoI0mOTYmLzFygnq8YzzrzO8bP301QRi2MyDyeGLM513ntUykHu/IhxNZAqinRq+HszavQv6Td82fe+HN1Q5fkTBzmWBz3q1LlSSVCZJfbx7PqX+h02gGOwUEROLb65swNhSY7SNUzXnlQMLGbdHyaiqc8P8L+AsPzXjSTKm2RV6XUQY9Shvq/XwF2Vln4zghJH+i2eEt4+nflunar1BQpsFkQ1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyxJzt1Fwo7iHl6Bwhts0jPgtaqi31xXMA+C5rrxcdY=;
 b=vWpX9L95k9qEIOY2T8YBC7IqMuxMje1i6BlgyZAf9lXU9Yyx0E9iX6S+CbxkEKShy97ISv0VhMl1QyKQ6L3G84aItJzif46XRqxOrOxeey4rGeaTjmP06NRJwFd/Bw4eQlmDiXcrBx6Ygh/j1+bvmRma9EYlFFX25mz/ZdA8b5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 17:16:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 17:16:53 +0000
Message-ID: <a08967df-a7cc-499b-94a4-125f9dbf05bf@amd.com>
Date: Thu, 1 May 2025 12:16:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: sound: soc: amd: rpl: No ALSA DMIC capture interface for ACP6x
 (PCIe rev 62)
To: Mark Brown <broonie@kernel.org>, Jason Mo <NukaColaM@outlook.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BY5PR07MB66126978095912E5D4A26E50A1802@BY5PR07MB6612.namprd07.prod.outlook.com>
 <aBLAwjELCoWNWDyH@finisterre.sirena.org.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aBLAwjELCoWNWDyH@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0103.namprd12.prod.outlook.com
 (2603:10b6:802:21::38) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 836ed33d-b4a4-4462-c59c-08dd88d3f784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUlZQ3o3WUFCaFE0dW9CbHJMZlBQZGx3MmZjQ2o2SUwyTGdmTVJNYkFpNGpT?=
 =?utf-8?B?dGc2RXhtWnJWWjh6OWtMWVhremF3eGlwc1RwVnFKd1B4Y2dBdE5PZ2krSkE3?=
 =?utf-8?B?MGV5OXRzUjZuTk9MNFA5TGVYdnFXVnJHdzNtZjdrTmhsSndDV1JUWkNnbmY0?=
 =?utf-8?B?dmtBWmJaK1kySWdna2lpVUt1TGdYWFo4QVViVzd1dXloYnYxeUNNU0JtejM0?=
 =?utf-8?B?dEdhWWZvYWMvVWgxU2RWVk5xa3pndnQvdFgwVUY4SzFxL3lwUms0NGNGSkto?=
 =?utf-8?B?RUVNMGhoM21GQm42c29XUi9lMzhwRkI4QWVNNWxCai9lMjRFNTMyQXlJb1U5?=
 =?utf-8?B?bmhHdHlFUVNpRXBBTXNIV2hHbDkrSldmUkhjWExnLy82SzFnSWozSGZNSSta?=
 =?utf-8?B?VFdZaWJDZnIvTWpRQURKKzdpWTZ5ZUVsTTNxSGRPUjAraFZybFo0elpjNHpu?=
 =?utf-8?B?M0NRZ3pEeXUrYnJTOWVRaW0vbmp5L3VDUGVETkQyeDk4c3Vabm9CWlJ1Uk1n?=
 =?utf-8?B?K1BCaXhuV0pvQUo0d3hjdUszcmNTWW9kS20zYjRjTDF4SE5XMjJlanhpREZ5?=
 =?utf-8?B?dGhDVXEvR0ZwZjQwR0hCRnhySWhqdGJuOWhlT1BaeXJETURmOE5YeFZaUFg0?=
 =?utf-8?B?RVlJT1lyTStkR09zQ3dSVDlkVWN3VldtT2U2Z3IrSTFQVmpPMFVaZWM1MzRE?=
 =?utf-8?B?WVBiNVplc29RbjV4NGQ1NGdpbXl5T3Z0Rm5QdXB4NHRjenNTM1VYalhacWZt?=
 =?utf-8?B?ZkduVWdlVmxJazhzZ1Q1YUJpRE1uOWRXTkJ1N2N0VWJtNktuZVZObkhxZTh4?=
 =?utf-8?B?SFl2aFkwcFp2UHYyejFxUG1UcTl6bmRpUzA3dERJK3NNeC84MzJQRWpHK3A4?=
 =?utf-8?B?djhzZGpZRDNxaldNaXdBR1lxUlhYTXdJY05sQXJFK3FPTDNsOFNURS9SY2s3?=
 =?utf-8?B?bllaR0pKMGVMU3JlcGl3dDlpT1NxWCtJOFd3UHJySlJKMTNJaHRGUDJFdE9y?=
 =?utf-8?B?elZONTFnd2h4QzFOekFRbUxBOWNpT1FLRXBtcmVTdzJ3WTBIOGdpVno0Z2VT?=
 =?utf-8?B?Y3pIRHI0ZE5sOE5KU0xUaFF1T1RlcUVsSFlsbi9WN2loS3VGODd6RWl2T1hN?=
 =?utf-8?B?VmVEdkhGeFIzUzdONFJFWDRYVWlEdnpTS3hXaFpoZnNhdTJ3OXFjSThWNHNW?=
 =?utf-8?B?Rm5FQlo2Q3F0QWVsYTQyK3BkcVdoRStuc0llTkxoMEtnTkZpaUp3bXd6U3pL?=
 =?utf-8?B?TUhOV2IraFdwRkJGbzgzZUJWUGVHeTlLb0Q3YWlLZjhjK2FLSnlpa2J0SVBN?=
 =?utf-8?B?NXlyd0RpVE94UlZvbkpUVjlTRjQzWTVueGNCWlRlVGlDVDVMcmhwSktlWVFS?=
 =?utf-8?B?blZMcW1ZY1F5OU9UeDFJNE1LOWo2OGF3aitVSW5tZGhRN25Nczl6TVl6S2tD?=
 =?utf-8?B?NE41WklHSzErMklTOGxUU0s0WU96a3RLaGgzdzlxN1M5WW9FYVR0ZGxVK3BN?=
 =?utf-8?B?SUY5S0lBMG0yaURSaE5QVmFhNkhRV0wxdHlLcTM1TVpWaktod2VQWWl0M2wr?=
 =?utf-8?B?NnR1cG5HUFAvYTYreXJWNnMxSWM0TmFEQmswcFJ2UGJORFA0SG9IbCt5anMr?=
 =?utf-8?B?VmlsWHp2ajhoUVJ6amZGL3NoVDBnYXd5ZlBHSmNNZlBjZ3BTZHpML1ZWaWIv?=
 =?utf-8?B?YWgwVjJJWjJDcTRXc01NcHRvSjlCem5aU0JIWThNWTI3MkZZU0tvcUw5a2RW?=
 =?utf-8?B?QzJBejhFdHBXejUramJTcXZ0akY4RnlFaDU2K2dIMlBHY0ppbDF2YUlnYzB5?=
 =?utf-8?B?eE1MQ0wvTFQ0NkpqQzhBSHh6UnFtSjJQUmZVOGVPZlN0a0xUbEoxMS9XVXVY?=
 =?utf-8?B?V2hBQmZZT1JXeW1HS0YzVUxPbFo2SHNtREpmUEdSaHZzK0hNNkExQ2V4V3M1?=
 =?utf-8?Q?Vq7K8kjg5QQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckFKNjgvQStROEN3T2U2WWNnRE9JQnpLVlI3eitzT1h4YnZ4ZS9HNWo4N3RN?=
 =?utf-8?B?V0dRSG1raWdVamFTYm83aDA2T3VwSnRnYUpMbWMyU29ML3NsTVZEU0hncXNh?=
 =?utf-8?B?b3JKSnBVWW4yVnhWTXlxM01UOUpXZ0MwSGFFVEQ2ZFVJZXRxTllIU1hITkor?=
 =?utf-8?B?cTUwZW1vcWtWc21IZ2F0aTFKYXV2eUVkWGZxQ3ZjdXRSUEJEZmIyRk1lWnA3?=
 =?utf-8?B?RzYvbVZQckpudmxlYkZFK2I0NEt0ckhDS3h0dS91cUFMeXpXQXhramZtNWFR?=
 =?utf-8?B?VFFweWFUb0JpYTVMT200RlVlTmRxakFJUVlMTUFYbW5BcS8veTRueDFvS2pv?=
 =?utf-8?B?aDBSeWpFTXFmRmZTbitTRnFObzdPTURtekZvVnZsWWo3Qy9qbWsrZG85My9Z?=
 =?utf-8?B?em5qTHJZY3cvV1A3aC9tbU9tZU5yZXBaQUQxMzJRWlJiNFBSSmpxR3V2NTBC?=
 =?utf-8?B?RFFoeUJwLzNwL2lVenJzWkFLajBsMW0wNnBjQ2M0N0JCeEs2Uzd6dURyTUM2?=
 =?utf-8?B?V2g4bk84MUxWNnVmNmNLVHU0SVpIeUlNZmVtT3FndlMwTWJCSzFCaEhaaEM1?=
 =?utf-8?B?azZWY3RaOUdmc1kvekpyRHpmcWJPQU1SNmNvcTdZSFNkbkdnV3BCQ2VxSTNI?=
 =?utf-8?B?aU1BUGhxVDhXUk1Rb3hPdDZyNzEwN3h6Z3NRZks3QnE2K0FvNGFTZWtQcnM0?=
 =?utf-8?B?Nm05em1iZEdFdy9VYnVQSGQwM1lqcDFTWitnVFRqNnk0M2wyeTM1UlNZcGZN?=
 =?utf-8?B?VSszSkNqZFNTeHFlaTArdlVJdForWURRQnBOOXF3bjQrcm40UlBxSjVPM0dn?=
 =?utf-8?B?YjdIdFJCQmJ6bjBvTDRWVENZTUhVVHNubS81U1JJOHRDSVRHd0laQ3QyU2ph?=
 =?utf-8?B?S3NwV0t4Y1B4YnBiT1ZJMkdHK2ppUXdnL1hkN09EbFFtZVZDMWd0dkpBT1Rw?=
 =?utf-8?B?b1lTYmtxMDZmZHZuZVhOSFAwTkZkTW1FUVJVSHNxM1dOT09NWmVlY1hVWkl1?=
 =?utf-8?B?dnVvc3JLN25tRE5hb0ZGWXo1QUhNLzF0U0l2TUdGaGpEZkpISVZjSWlxdStI?=
 =?utf-8?B?cmM2eWJJdnIxekVtVllHcUZDaXc2NTBjTWNTSldXTXV3YTdOSms1SHFHbUJ2?=
 =?utf-8?B?UEZ4dlpwendiVmVyUCtxaEE0WUptNFlZdkduNGdtNGdtY1UzQUtJN01IY013?=
 =?utf-8?B?VGh5WWt2SlJJbVN1TGZoREtZajNQUG9wZmNwd2ZiTVNvZGpEQlFJWUJXbjZn?=
 =?utf-8?B?dHFFSHVkVjAvdkYwek1Qd21DcVc3cS9TRTBpdUp5dUg4VEljNDZNU0FuSzR4?=
 =?utf-8?B?b1lOdCtia3NvVlZ2TW9rUVltZHg4eW9waHVLL2VNUDlBd1k5THBVZjZqZjBp?=
 =?utf-8?B?dVNjcG1pUXhGd1BwWmJhb1JIRlpYblJ3eUFjWElCZkcwelFSeWZtVU5GT1hX?=
 =?utf-8?B?RGlRTEVlYUIzOTdoSjE3RllrdjJmeWZsU3F3TkpzeUpTaWtjK2tVZkpJWEd4?=
 =?utf-8?B?RGk5Um1MelJ6d25kVnhEVm1YUFgxSDAvb01qcnljNWFTWktjQWZhQUxxRkw3?=
 =?utf-8?B?ZndiRlQyNUNya2NRdmVySU9QSUZ1blYvYk1EYm1lcWJqRHVva0JzNFcxTnhL?=
 =?utf-8?B?ZDJ0ZDhGVG5YK2dIaCs0VEZ3TXByMlZwaEtIUlh6bXdtWWhGTW16a1NxRjVo?=
 =?utf-8?B?TEtPSjBzcVJDTmxsVFdLeHhkU0NOa1YxdU9LYW9tajJXZ2FEN0VrMG9LSWlt?=
 =?utf-8?B?VFdYSFRmRFNEa2NjUkc5YVc1WVVkNnR5aUZoNURINUlDSi8yWW1tVFVaNnZN?=
 =?utf-8?B?M0FwSWZRZG4zU0dTN296NVFvN0RmbHlkZXIydkVtVERXdW5FdkpOa1BhTmdt?=
 =?utf-8?B?QVJQRnhaUHE3VFZtQ3RObUxqdjEvK0N1ZEl3Ulp0RHpDc1hZekRxTDVWNVZR?=
 =?utf-8?B?TWQrVkNsV29PWkFhSUtCcFE0UFdMVkZOYnZXU2oyZ2tRYXJiNnhtaFFsN2hv?=
 =?utf-8?B?cTcvWjFzUkhtaExLNy8xc0ZXRFlJRmZDU1VtQ205TFZESU1GZ2tncFJlSVRu?=
 =?utf-8?B?KzlFSkhIUktUcVoxL3FZdm9SU2N2bkUwMkhhcFpSaWR4U1VxYk1lbW5BYkhj?=
 =?utf-8?Q?FxTCgK0+p7S0RnmN0fRKV29k6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836ed33d-b4a4-4462-c59c-08dd88d3f784
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:16:53.0231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAR9H/oYeD8NuO0k//XLNWcmWOCZl7vBwSXU9oh0WTL0eA3QfOED0vzI7oWXv709WpSRXWpDiCO5dKLxb7UgjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555

On 4/30/2025 7:30 PM, Mark Brown wrote:
> On Tue, Apr 29, 2025 at 01:14:07AM +0000, Jason Mo wrote:
>> Hi Liam, Mark,
>>
>> The `sound/soc/amd/rpl/rpl-pci-acp6x.c` driver for AMD ACP6x (PCIe rev 62) appears to lack ALSA DMIC capture support, making the digital microphone unusable on affected hardware.
> 
> Adding Mario.
> 

Thanks for adding me.  This is a missing feature.  Let me explain the 
background though.  This report was filed with a system with "Dragon 
Range".  The IO die in "Dragon Range" is the exact same IO die as in 
"Raphael" which is what snd_rpl_pci_acp6x was developed for.

"Raphael" is a pure desktop APU, there is never a DMIC connected to it. 
However for Dragon Range, this is used in mobile designs and as you can 
see you have a DMIC connected.

So this would be some new development to add DMIC support.  I'll raise 
some discussions internally about it.

BTW - We will also need to see your dmidecode output.  There aren't any 
ACPI _DSD properties to indicate the presence of a DMIC, so we'll need a 
quirk (similar to how we do quirks for Yellow Carp/Rembrandt which 
predated the introduction of _DSD properties).

Thanks,

>>
>> Hardware Details:
>> 05:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] ACP/ACP3X/ACP6x Audio Coprocessor (rev 62)
>>          Subsystem: AIstone Global Limited Device 1301
>>          Kernel driver in use: snd_rpl_pci_acp6x
>>          Kernel modules: snd_pci_acp3x, snd_rn_pci_acp3x, snd_pci_acp5x, snd_pci_acp6x, snd_acp_pci, snd_rpl_pci_acp6x, ...
>>
>> System Information:
>> Linux version 6.14.4-arch1-1 (linux@archlinux) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Sat, 26 Apr 2025 00:06:37 +0000
>>
>> Symptoms:
>> *   No corresponding sound card entry in `/proc/asound/cards`.
>> *   `arecord -l` shows no relevant capture device.
>> *   No related ALSA mixer controls are exposed.
>>
>> Code Analysis:
>> The `rpl-pci-acp6x.c` driver handles basic PCIe initialization but seems to be missing the necessary ALSA/ASoC integration for capture. This contrasts with `sound/soc/amd/yc/pci-acp6x.c` (for rev 60/6f), which includes full ALSA DMIC support.
>>
>> Attached Logs:
>> *   dmesg (full & filtered for audio)
>> *   lspci -vvnn (for audio device)
>> *   aplay -l / arecord -l
>> *   /proc/asound/cards
>> *   lsmod | grep snd
>>
>> Question:
>> Is the missing DMIC support in the `rpl` driver for rev 62 intentional, or is this a bug/missing feature?
>>
>> Happy to test patches or provide more info if DMIC support is planned or contributions are welcome.
>>
>> Thanks,
>> Jason Mo
> 
> 

