Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2050.outbound.protection.outlook.com [40.107.212.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C218871F;
	Thu, 26 Jun 2025 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959699; cv=fail; b=lEDvIkL5WoGkBpE+25MO9YQKNfleNi9oh3ApndAv3sGv/e4Kk9hY7vLjRJRofDGL5MQ0y654LDRy+YBMYMTNvEXM1Yg+iuvJTLKhb1dKUcGkNhlFCYLVKsYFdcm1937SgZSNvlBzCcYQiXfGkzPmvr5/O27ONkQpoGMV8hXM92o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959699; c=relaxed/simple;
	bh=YVY4rZjxRODTulOqH525KpAnUp1+o/WHx/A/afbl044=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BKvdwA0z8ySQ0VAv3bkwpyjWgvpDyXqDt6rtUPPaRjSPxo2So9BdXoXlBD1yJUfuYCKJnVcp2wDQuzyV1VGAOTXKm8jsAYSmOIOjfJRZIlinUbfmECQheHC9fdgqKIzb1QoDeDjemqRIgidi51phaAea3aVYm+dk6z+ehftinNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KmS1RbkS; arc=fail smtp.client-ip=40.107.212.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KmS1RbkS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXxv/5H4N6sVuceFagJ2WRGsGBuFbxwIsNKddegdmyoVfr+tkh4dEiJFsZX+kJXJJgBlBgfLUHEhHTKSw7OEg2d38gDMrt4IjXt2P4z6xYcpG27ep5KsXrhLZA3gBZZy4zUwfv+teWQRlOIy/ITXbUy1YtmKa3ds0LbeqJIg9iJvMgnlQITyjvcIDblX6ZxFNaHUC9tHzmRImsCrGHwwNVK9y93j7RfR8+8bLN/0qcpoSl8L6KFzXPmErJxsMmmIZZXUP7lhST7Oo/ttwiYAMYn1g9hFtFT7zdCx8UlbgUVujNq2+xT7OPGDKSa1Ctblf2+qh4rQfxxFuBtl48DtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWUuYDWIlaZu8ihgHNNMA2LfaEdJXdN/L76FtBXIgXU=;
 b=Ycb4T0l3RKLKRUpfVhiZkxBlh14LCfjK1o7Z8HqQTekbYH229wuTLjE197k26TCfFBiuXCZATHkOYN/tgxrF7pdvfdf0evCcr+PlLq/NcFIDPc1ojI/FGXMTNKsg74ouJtQIoc5dfpK645qdRhl6oskXKwYLG7IJTpwD/D7oSg/mRf2LPEU7B0KpFWuf5Y0HzVE84/7/kRm2ZQTm4XdvFzhobyG1wSYLy7lZHAlkVjkOuSLBl561me7kqSnHtuckvT/MnGV++kmbJo6QmC/a1yF+2CYrFLyVvwmmJ1vAjFtuHo4w0qdGeNb5+l9S6ZV/Op/Gyw4aFeir5v+GTmQq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWUuYDWIlaZu8ihgHNNMA2LfaEdJXdN/L76FtBXIgXU=;
 b=KmS1RbkSG3aFR+Zg4502dzramEuLsmVKp+a6FqE5qcMmN0Xpovr8OT8Pys80lYWmqaR5qhZesOPYdAcEHe4MZ7bpph/9oz2z74Gz49XsSeh+yxKz288cfR17k8pQYMyUASRvUMqPj9QkWCra6aBgCPV2Op7azthKV/IlllNneNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 17:41:34 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 17:41:34 +0000
Message-ID: <fb205a5b-0689-4d53-a272-d196d337a9e5@amd.com>
Date: Thu, 26 Jun 2025 12:41:30 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 17/32] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
 <41eebfa8-34d1-4ad1-89a7-62dc372ab051@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <41eebfa8-34d1-4ad1-89a7-62dc372ab051@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:806:6e::24) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: b84b11f3-9abc-4c01-07fc-08ddb4d8b1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnRiU1g2VW9VR285UE02NnAzZDBkMG92c0FMa0JGVWVlK3htZUs2bWdCTitX?=
 =?utf-8?B?ZkpIWE1yMVdnbzYreUlGaXpJYzcwQjVMelpwYlREOGRsOEZxd0JmZlcyczBz?=
 =?utf-8?B?eFZHNWFhZnFOcXNiMkVrZnRSeWdqdk5pRGsxblVkZUFsbXBVdnJCZnNJZ0Zy?=
 =?utf-8?B?M0N5UnhJZnJCa0crc2R5dU5Vb1dOWm9LcVZFSnlqQkkrVnhLR2hjQk5IUGoz?=
 =?utf-8?B?U1lIZG5ETEkyNjNVWEU1QmU5OE1iblpsVFNmd2piaHFiT0gyRE5ZQjA2K0VM?=
 =?utf-8?B?NXJseVpLUTZrRG11Y3o0amFFZmNpb0M4N1ZGQWJ5Q1FIWHh1dkFQMGk5d3lR?=
 =?utf-8?B?UWo0UHNkeFVqUExyTW9nYzE4MEVkSVBrYWJJcFM2ZWcwUFZHVzBvdWJaMWUw?=
 =?utf-8?B?RG9JVVgvcU9nS21NUjgxSjd1aUNRRWhaVEo4WTRXN2d1Y1l3a3ZVM1JxdkVz?=
 =?utf-8?B?VjZjaGZzU01ORUFFMmlaQ2ovdGVBUHlXclJidWNhT0R2ZUhDeml5Vml5S0Yr?=
 =?utf-8?B?YjBjQVhHQUxtSlJ1azVhd2V3TUt5Mm12TWtKY0p0VTFRYXVEMHUrL09QY0Rr?=
 =?utf-8?B?RHJvZUFEaHlBT0pBS3V5ZVFUQWJuNnVDNE9mc0xwUUtKM1kweGNyLzJsK3Fp?=
 =?utf-8?B?YWNCZjF5MnpwWVFscy9QZHhwL3pNZ1lZay9YdXRXdnJ6eTdXZEsrQ1NCUHhI?=
 =?utf-8?B?TU10NGlrU1JZQ2ZUdnUxdTM1eStjN1EyNkFGaStKRnA4eEZhTnJqMDRIeEFC?=
 =?utf-8?B?T1JEZDY1alR3SHhjSVVOZW1IMGVDZUFoT05KRVlBSlVrSzR6dXNmRVFocy9C?=
 =?utf-8?B?MldaRXR5elowbmVKUGdCcjFFK3lmeW9ablp1TUVYd3M2ZXFQRGZCV2QybkVO?=
 =?utf-8?B?RFFzZzNHeVdENWZCcWQxNHhISkVvVytaOE1Kc2Z0UEs3NWQreVZSSkE4NTlp?=
 =?utf-8?B?YWNKZWYxQ01UQ1FQaDNYTm93OTVyMy9PcEVFc1AxZUpZeVNrTFMwTTJsZ2xp?=
 =?utf-8?B?RUNyWnZyeE9RMXZVcDNyb2Q3YnVTRFNxdVloVTdTVExFT0NidFRLQjJnbkNu?=
 =?utf-8?B?cDBoWWozZnAvNENsMUpRRkovSzVKUEUwY1M4bjF6dU12RTBNMGdPdTl4cVhw?=
 =?utf-8?B?T3g0clNrY1VDR0xWVnNwbkgrZE9YSFdCVFFxbW5FT1ZxL0FTU3dqWGNITlBV?=
 =?utf-8?B?ZXAxQjk5OE9TZTlzaTBLSTdGWTE1WWgvTXpreVlSQlkwa0JGQUo5cmNSWURM?=
 =?utf-8?B?U1I2YUZScXh0NXRpT3BzM0kwQkZDVVc5eloxNXpTak5pdTZsWlFZNEVrcmtw?=
 =?utf-8?B?eW0wZElBRjdpd2FnQ29tSHlOM0NjdDI0b1c5MlBlZ3BNbUJRVEVVK3V2U0VM?=
 =?utf-8?B?dVUwTmpsTmJHVHFqRWs3eVlhSFdpWGdwdjZkYkxKYVVhNDRvSHI0ZnJSU0FQ?=
 =?utf-8?B?ZWV5b1Z1b003WjVUWjBvV1J0UnFoRk4yMmJ0RFA5aW5YR2p0WWlFSGFIQjM0?=
 =?utf-8?B?WHBPMnplTXlkTWJadjYwOVRJSTNHY3pNeGVvd0dVdFE2dS9NTURKbWpWVmp6?=
 =?utf-8?B?dW1WRHllcmFhRW1SUGcxWUJuK0RYZ3ZsS2EwMSt4dmdMR3NrTHoxMVpPR0kx?=
 =?utf-8?B?cGJvQWNyNDllYVlXd1NKZnljcUppQk9QM3NOUGJMUTkwcTJvS2l5cjYzUnVt?=
 =?utf-8?B?d25Gd1ppdi9Za0Nvc0tWZU5ZUStmYnJiQ2VGUzZsQW9mYW1RK2VMSGFFZ3da?=
 =?utf-8?B?aStqYWk4ZEtNYlRyRmY1U1ZyVGdXQ21jbWZuWm9wY1A2ZURCUWxLdGxjcENJ?=
 =?utf-8?B?WUdxd3VieERCa1piWjh2QVV6bllibzcxMVg0VW8ybHNKUkJQUFhNK1lybFhO?=
 =?utf-8?B?c3hQMEZQa05qcjlDMGJNUWUwUjBzZk1mcWxMWDd1ZnhCdktNTDh3eUVaRTBw?=
 =?utf-8?Q?JV/FzdZkDuA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXJOOHR4QXhoWVVUL3UybHBINWhVQStBN0JZb2xXVmx0VVI2ZEhkRjBXNjVN?=
 =?utf-8?B?bVhDZEdkS0JoeEY0SmlIUDFGMGZ5MmpCd3NxUkpwTHFSOE5neTBSbmc0NGhy?=
 =?utf-8?B?Y2FJVjE5alRiZXhqUE9lcTBpS1UwdGpqdmM2Rk5tSXZ5STNDcWh4S3dqVkpN?=
 =?utf-8?B?Y1NmWG5DLy8vOXR0VWhnQ0kwOFBIMjhGY2RDN0dYMDVkbDJ4Y0hJRy93VE5j?=
 =?utf-8?B?ZHRweE9CT3ZEZ1JwRmYrUDY5eGNjcTFpTVhqdVA5VlRkTDJiNzYvK0dPZnl5?=
 =?utf-8?B?K2gxZm1YdFVIaDJTTndyZmpVcCsrM3EzSVRaUXJZcWx3Rzkrdm8zZ2kwbW9k?=
 =?utf-8?B?ay9qNE1iZ3E2bkJva2RXSFlwNW9YWFc0S0hPR1JYVzlndEJnRURxUVNMZC9a?=
 =?utf-8?B?MFkrUUFGZ2tvbk1mNVU3azV5OEthV3dWeWRaeUptcm00MElPREtRSE94Zkdo?=
 =?utf-8?B?MEloTCtGQ3NNZDdLR20xTFE5dGNEcEtUbitTZlcyQVlVNWRwcFV2dWtkM3Z5?=
 =?utf-8?B?WXo3ODdycXNxb1l6WmsvWUw5WHVKVlM2REV3NUMxQk1LS0dyUHh5R0xvMjJQ?=
 =?utf-8?B?YjVzaEtVeHRHalpPb3ZzT3lzZmlScS9VcTZMMWVYbXdPQk9qa2tDR2Y2bVdl?=
 =?utf-8?B?RFhDejhnc1pMSFMyMUpBUFkzaW4rOGgvVk84TzNQWUlRT3FmRTc5aXF5WFVX?=
 =?utf-8?B?Q3lLNERIaG94cElyY2x5QUQ4RnRieGEwb1p1Uk9XczBJZjhGbmE1VU1iQWM4?=
 =?utf-8?B?djcvYnZydGo2NXhDeXJLdjkwaGx0SjgreS81N3NvWVJWamxVbFBtSllRNUgr?=
 =?utf-8?B?LzhxNVljYkhoU0g2R015ZzhTTzEvalgyZ0NEbERYaEJQNkM4QURsdmJsSStG?=
 =?utf-8?B?eThpS08vTjdKQ1dNQTFTUTdFRk9wbHM0eFRiaW5NMzlSdHBzRE9weTAxUFNL?=
 =?utf-8?B?M2l3ancvaVcxQ0JTWkN0ZVFBYTBJRVBnVGNIKzl2UTVUaExJWWttQ1FhRnQz?=
 =?utf-8?B?WTRXam94RjZmRXNOQWxvR1ZabUJwT1RoVm5vNjRkd0c1OE0xdHhVNHBuR3po?=
 =?utf-8?B?QzZIS3RDWjh1ZnpvZGxPS2dIRzhpeWNlQ1ZGeCs4elBHZldZa1VnTExHQ1l3?=
 =?utf-8?B?ZXhXS2VyaWZjanFyMkR1NnYxV3N2Zkg5ZHhhOWFTaVdxNERLL1htcVdxclNR?=
 =?utf-8?B?YUZ3R0RhbjJMMHdzQmZiZWFZNXc5T05QdWRzMlpkaUdheUF5NFhsM3ZNQXlO?=
 =?utf-8?B?M2FqSUgxWlNHZ1ZWVGNvQk1aWnNoS293ajdSbUdaN3NjaDJBVExzek5pWUF0?=
 =?utf-8?B?MnhrUEVwOGt6emNreU5WaEFwWkFaY0w0NU5DOVZNUmZqSUl1Wk1Obi9QbG16?=
 =?utf-8?B?aGhLb2dPQ2JsME5PUXBvbmhPeXBaMGIwOERhNThSWTBCbks5S2x3OFlZYnkx?=
 =?utf-8?B?VWdlVkV1bFJBdHRWKzBoYWVuSDJldDZ0VHBuM0FTY09aOHFMR0xMdW9JUUlj?=
 =?utf-8?B?cDdmNDgzS1NyWGNHRllXbFJiWUMyTXVzYk1jdm1CbEVCWUFxK2lDUnRSMnox?=
 =?utf-8?B?WXQ1OERkektpckNJaERPckFqTGFPemhyS1VoRDRiRTZKUkhuSklJRUVoZ2ds?=
 =?utf-8?B?aUhMNnBubjlydE5xMlFEV253ZDR3dldVU1BqcmhnMHBXWG1na1hoNVFyejhv?=
 =?utf-8?B?dWxWckJBK01TeWhEaVJKRXFJMCtWajFFcDFYZXdmeUxEV0tqK0FEcmlmL0Nj?=
 =?utf-8?B?enlMWm44RzBUY0lJWHhWbFp3VDdrOUo0cVFxZ1Qyd2RUa2RaSHVZVEZGb05v?=
 =?utf-8?B?bFhsNVg5L1dScFlkYzhHUEttSUxiYU1BSUlKWTNqZ2t5QUFrMnY3MVcveVJj?=
 =?utf-8?B?Vzg5dzJ6a21BM2x0ejhpd2VWQjVZRWNlTzFxSE04elplTUNhOGdyMHUvRkNk?=
 =?utf-8?B?UmdxZVJ5ZzdYZENRTEl3ejhIL1FVWXFIbG02R1h6Z3NUd3lnZGdMMFBseCtB?=
 =?utf-8?B?aEYwdXo1NGZnNHdkOGJUL09SdnV5U0tOSGlQQ2hDci9hTnRrY3Z6ZGxxMFNE?=
 =?utf-8?B?QUVSdjdOdzc2QzhpZzRwMStiZ2N6SDRxMUlBY1dxNHdBY2NJeEFxZU9jOTIr?=
 =?utf-8?Q?li1Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84b11f3-9abc-4c01-07fc-08ddb4d8b1b0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 17:41:34.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cya0jatYK0hVwgBaKL3Rzxvcs2HonNx3XBBaGfDQjlSwHJ+E5//xhuQBeKpcPRTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569

Hi Reinette,

On 6/24/25 22:03, Reinette Chatre wrote:
> Hi Babu,
> 
> With the new arch API this have "x86,fs/resctrl" prefix.

Sure.

> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> The ABMC feature allows users to assign a hardware counter ID to an RMID,
>> event pair and monitor bandwidth usage as long as it is assigned. The
>> hardware continues to track the assigned counter until it is explicitly
>> unassigned by the user.
>>
>> Implement an architecture-specific handler to assign and unassign the
>> counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
>> specifying the counter ID, bandwidth source (RMID), and event
>> configuration.
>>
>> The feature details are documented in the APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>>     Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>>     Monitoring (ABMC).
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/monitor.c | 38 +++++++++++++++++++++++++++
>>  include/linux/resctrl.h               | 19 ++++++++++++++
>>  2 files changed, 57 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 0ad9c731c13e..6b0ea4b17c7a 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -444,3 +444,41 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>>  {
>>  	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>>  }
>> +
>> +static void resctrl_abmc_config_one_amd(void *info)
>> +{
>> +	union l3_qos_abmc_cfg *abmc_cfg = info;
>> +
>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>> +}
>> +
>> +/*
>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>> + */
>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			      u32 cntr_id, bool assign)
>> +{
>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>> +	struct arch_mbm_state *am;
>> +
>> +	abmc_cfg.split.cfg_en = 1;
>> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
>> +	abmc_cfg.split.cntr_id = cntr_id;
>> +	abmc_cfg.split.bw_src = rmid;
>> +	if (assign)
>> +		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
>> +
>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
> 
> An optimization to consider is to direct the IPI to a housekeeping CPU.
> If one exist, a further optimization could be to queue it on that CPU
> instead of IPI. Your call since I am not familiar with the use cases here.
> Looks like all paths leading to this is triggered by a user space action
> (mount, mkdir, or write to update event config). This would require exposing
> the housekeeping CPU code to arch.

Do you mean something like this?

cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask, RESCTRL_PICK_ANY_CPU);

smp_call_on_cpu(cpu, resctrl_abmc_config_one_amd, &abmc_cfg, false);


You want to do these changes now or later?  It requires few other changes
to move around the code.

> 
>> +
>> +	/*
>> +	 * The hardware counter is reset (because cfg_en == 1) so there is no
>> +	 * need to record initial non-zero counts.
>> +	 */
>> +	if (assign) {
>> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
>> +		if (am)
>> +			memset(am, 0, sizeof(*am));
>> +	}
> 
> I am not able to recognize how the struct rdt_resource parameter is used. What am I missing?

No. It is not used here. It is kept as other arch's can use it.  I think
James commented about it earlier.

> 
>> +}
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index a58dd40b7246..1539d1faa1a1 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -594,6 +594,25 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>>   */
>>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
>>  
>> +/**
>> + * resctrl_arch_config_cntr() - Configure the counter with its new RMID
>> + *				and event details.
>> + * @r:			Resource structure.
>> + * @d:			The domain in which the counter ID is to be configured.
> 
> "The domain in which the counter should be configured." or "The domain in which counter
> with ID @cntr_id should be configured."?

Added

"The domain in which counter with ID @cntr_id should be configured."


> 
>> + * @evtid:		Monitoring event type (e.g., QOS_L3_MBM_TOTAL_EVENT_ID
>> + *			or QOS_L3_MBM_LOCAL_EVENT_ID).
>> + * @rmid:		RMID.
>> + * @closid:		CLOSID.
>> + * @cntr_id:		Counter ID to configure.
>> + * @assign:		True to assign the counter, false to unassign
>> + *			the counter.
> 
> The changelog and comments only mention counter "assignment" but this same call
> is used to update an existing assignment, which on ABMC are done the same.
> This may be ok for now but I think it will be helpful to amend the above to say
> something like:
> 
>  * @assign:		True to assign the counter or update an existing assignment, false to unassign
>  *			the counter.

Sure.

> 
>> + *
>> + * This can be called from any CPU.
>> + */
>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			      u32 cntr_id, bool assign);
>> +
>>  extern unsigned int resctrl_rmid_realloc_threshold;
>>  extern unsigned int resctrl_rmid_realloc_limit;
>>  
> 
> Reinette
> 

-- 
Thanks
Babu Moger
