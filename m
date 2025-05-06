Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271F2FB2B4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746497169; cv=fail; b=IsxElHqtD/Mz/Ue7gTKVSLFBpFV4Hwh4x5gHKmuFYmi+/Fblln54S5CjGvKbSJ9DspYByhGJSMDZTQUNIOOFl/sn8Eb/XzSylOPeXwOsYWfOmIIljMOOD3tOUq9f+I/3ilenuF001b7tN+TWu8nyqXMH0jGY4vBKP70EvNltl1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746497169; c=relaxed/simple;
	bh=6etu/+3iP1CMai+FxuNfLnmtVTdZV4j9EnF+vgzAtic=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PIy8nFQ+ovbwRe9nRgBgLipRcvy/KbWmaKcgpi7dmXIEPeqYvdDTohMyfQtbMgbGQPnM5NWKA6TM8t/cZHusk4K7Ffy0c1DthtVQW5WaaDZAzjCvzaslEFwAll2jSbvuFoV6cxVqyg/FREK03SOVAs4d/GyrhaQH0fMYoGsSo8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FxZ1EqXQ; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FxZ1EqXQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDzfhj027NVnFRubCVZLRSYcUg4zcy7GPi23S+pyY2njOc9/3oeD+bWNg7OdC49OgwXeBg7gs4pnh99PblFMP/B0RWjM4AXYTV9DBNtF04DPuQeuD0HvIYlS/SJ5Aa43vtbn7hD0uRKqEZhY3J4WO5NhO6yZE4i7gdtKZFBw1lKnZ7tv4I6TJ7m5dlHQ+j7UYwV8r3fjtkatjktt/7oAiPaJtDpzUBcKGaZNoy7ypPoQdi9KwOCKggCq/jQjbZBJbtBuFOpWuiM92OgyKlJeX7wVQ8tiFLi3x6ELoX65C8kJvElsqY6KL2fRfmWslL4fervIHHN2uRHfD5g1VGbKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGwLiJ7l+BsBYuEIxOUk4dIwQ3MgKo0EN/5gBBlgMUI=;
 b=rD89FFCjnE3DLvkdqlL8BOT5CjHC4ojENQTj7bv+5OxumC32Lzp2n4t/6LiN+NJ8Fjqkq2vnwVg7t7aqKkrpIqPGZdIIKAoUb9Jl6eL//tpRyqRL9EcplU4x+ZorYR6zkZucXNZ8vkbX0tDZ11AFI5mI/W86U/QlpT0Bwx/tRJyLVPlLqyME+5BX6yZFnIMNeq+zqDFtIJcpIxTlUO43nf08VrNtAjBrtngikqI1e/2ss1APBhlJdraohiFKWb6KVrbSKFOv3IbDnSouDLJmvgURJaYpwvpp70uNmLzuxHcOJur1OJY0nLp64b8YvPOGUHclAZWni9JCl3drnFhRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGwLiJ7l+BsBYuEIxOUk4dIwQ3MgKo0EN/5gBBlgMUI=;
 b=FxZ1EqXQZAMVnXqAxb1MWawXWh5VMs7CCwleiR6Dvu4G3YACy5O5kfSJJ3DoIXPFZOdYX4khSxp12RbAUGSvdCZCf3M56V6uoyHPk1CH5Dt9zPOsniWqQhe5EGiJpZp5MkyvTfxZ4UYfj7lztTHCoN9pjeisincFNKe/rfLs2Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SA0PR12MB4478.namprd12.prod.outlook.com (2603:10b6:806:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 02:05:59 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 02:05:57 +0000
Message-ID: <16e559e9-7161-4ac5-a823-22c5cf529bab@amd.com>
Date: Tue, 6 May 2025 12:05:49 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 2/4] x86/sev: Allocate request in TSC_INFO_REQ on stack
To: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>,
 Ard Biesheuvel <ardb@kernel.org>, Brijesh Singh <brijesh.singh@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Liam Merwick <liam.merwick@oracle.com>
References: <20250505141238.4179623-1-aik@amd.com>
 <20250505141238.4179623-3-aik@amd.com>
 <13dc0d80-5d7f-40ce-be82-8d0f3eb24a1a@intel.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <13dc0d80-5d7f-40ce-be82-8d0f3eb24a1a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYBPR01CA0211.ausprd01.prod.outlook.com
 (2603:10c6:10:16::31) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SA0PR12MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba614fd-c720-4b7b-bce1-08dd8c4289ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW9kN3dlSG5ZNGRiSDY3REltTGRhazEvajBXeit0T1lrbk9UYUpzbEFiS2RF?=
 =?utf-8?B?Z2dIeGpBUU9YQ0tFV2poZnZ2SEFEdDVINlVUcE1DajVWdWNRaGZ3RThhY25l?=
 =?utf-8?B?eUhBeVUrTUJ2TkpmRmcrdy92cytpTVEwRFRUdkNoUE4vSWdpZlBlY0pGUVdh?=
 =?utf-8?B?cE9IOFdEWGoySlhMdUpWQVhuUEYzRzFHYU5PYW40RTM4Mzk2S0hGMzFFdkQ4?=
 =?utf-8?B?YjVOZkJscEdYd0c4WHVZZzJ1c2FzVmdYRGV4UUkvS2NpbWlUSExkblcrL0Ir?=
 =?utf-8?B?T3hpSHZzLzFxbTdnMjdTb0d3N1krbEswelRuZnN6YjRxTmxIUklpZWtDNGpK?=
 =?utf-8?B?L2xLZmJTRnJ5VVBLR1I3SW5pOUM3NEhjVjB4ZDI3SkgzVHorQkM1K1R6Z0xS?=
 =?utf-8?B?UWNwZi9wK2F4UlhWVXBHWktZWTY2LzhaMXcrc0hJRkYzVUxRTkZiRUdYMXBa?=
 =?utf-8?B?UGt0YmxuN0VnZnRxRFFjeVFzOHQ2c0NpV1VIL3NXOFBxSmU5RTZidklVSWNB?=
 =?utf-8?B?WUJwdkJ1M3V3UkwzSnk3SDJNS1EveWQwV1RqWno2MDlRb0tRZEZ4RXBpVitD?=
 =?utf-8?B?NUp3S1F1RnUzdkszZVBTNDFHNGc3b0lxNW9oRTd4VTBNRUxqK2ZkcVVvL2xu?=
 =?utf-8?B?RkhQZU01NjNTR3k5dVNvbndOOGRQbFdSS1krTXdDMksyZEhqY0w3bjlEYVR4?=
 =?utf-8?B?ZGptd281eGpuOEI1a2RkUnAxRktsT0ZSYStCZTNVMG5GUWJJc3lyMUtHRS9L?=
 =?utf-8?B?LzNQa2lPa0ptTlFJMFpHcjJzc1U3N2h1d1ZZUFNwSW9UQjBSV0hQSDNqeklT?=
 =?utf-8?B?eGhKbTJMODRDZFNZOG5KYWEvNk05cTRsUno1em54WXZRMXlHT01FbmQyRnZr?=
 =?utf-8?B?aUFUMS84OUpZcEJ1a0VJMnNOcmlRV1lodnY0bmxTOU1xeXgzZkNpM0ZyQVND?=
 =?utf-8?B?Sy9XdDlHeCsxQWJyU2xDRHNwb1V0a0drMUFtdFlVd0p0Z1dvdlFQbU05ZTFv?=
 =?utf-8?B?eWZlcDQzem5Sc2xUZDBpVWFQYjlOeTJoVUliQnB2c00xTnZodVQ0QlNyUVBC?=
 =?utf-8?B?cDI5cE5nWlFkQlRRZTAxdTNvaFdON0pla2t4QzJFOUUwc3EzMlAwSlNwYjAy?=
 =?utf-8?B?TXlxSVVvSEZqaGxmNGphSG41bGx6UEQ3blNkSjM4eTZ4MmFyWVpKSEN6TERw?=
 =?utf-8?B?cFQ0UVNUa3lsYmtUQWl6LzhVdkhrL3F6OHA0QkZqRHVoRjZ4dTVtWUFWZmE0?=
 =?utf-8?B?TDNmTDBxaXowSGgrcFJGU2J6RFcxWjVXNXNHSFF2NXM0Y0NtZHlIRC9tQW1E?=
 =?utf-8?B?cmdOZExUcWhhbGh6bGUvVjJJYkVKZ1BQUUpHdXBGdktHWHdQYVpJQi81c0pG?=
 =?utf-8?B?eEY3ZU0rZjhaV0RxWHI1enNGQ05iWmhMR1AwclZWbGdpVFgzZjFtOU9KOFJC?=
 =?utf-8?B?WGhSOGltcURsa3l1Lzh0Nk8zV2xMa1F1NG1BaXRmUGZvS251ZXpWcXZxK0pK?=
 =?utf-8?B?czQxaG82TDZJYzNEZGdrdXo5UkpsWUNnOHNlRHc0VlBnYzEzNUl3dXdkVjFZ?=
 =?utf-8?B?SkcxWVBKQU5aTnE1ZG9Ja2xHck0vMkhKQ2djV0xOZFdBV29NN3ltcDYvSkRu?=
 =?utf-8?B?R2lVN0ZJOUowTXRSQU15VXlGRmpHMXgyU3JmZ256U21DYzcwS2NtamlHNkJU?=
 =?utf-8?B?bVZSS1hNcng1YXJuKys3U1hiNEg2c3VUUHd5TE9Manl5QmN6T3V2NzNjbE1h?=
 =?utf-8?B?Y2RKR3BoZS9kMzhlOEEyVTZsWUtIUHQxVmNSSUxzQ0FSY3Y3dWg5ZGF0Wmth?=
 =?utf-8?B?ajUyVEtEbHNDeU4zNVFHN1hRVHc4MkprV0lTRVNMUTJ2VjFKNWlTRG15MmNa?=
 =?utf-8?B?d1ViTmhrSGlCV1J3UWYxOHdZeDh5SUZLQmVmbHJQbkllQUZrUFZOTFZOWTdr?=
 =?utf-8?Q?6/k0uBIoCmM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1NNbUNqZHQyb3FmcGNCUGVXdkcyQXJENjZkRk1MNGFwT3loUHlLZFlOR0pp?=
 =?utf-8?B?M3pscys0eHFVbFRpRDRWdFRHbXN0YkYrVVBqNkozREFhSjZLMzF3RGhubTVF?=
 =?utf-8?B?OVpKN3pFdHY2MGQwejVHMnFqN3NDeHhkbUVhQmdyVSsrMzhwbVFaL0dMSUc5?=
 =?utf-8?B?ajZVYThZUmJwQnV1cUJJUUk0b1dMRWJlRjcvNTNqSE5jMjJ0ZGp6MFhaTjBr?=
 =?utf-8?B?OTVjeTZuTkdaY2RUVXNlVzR5aExWVjIrSXVPd3hSZW9JaUhvUk9wS0hnTE9r?=
 =?utf-8?B?eloxaVBNK0JoSFdTQVpWNUtWT3YvVk1lWSthUGxBOThsZXlWcE9GV1JwRCtY?=
 =?utf-8?B?S04wUGlhcTRsbFVNOGxkVCtnNy8xMDd6SnVqQnkvWmVPRUFieHlXOTkxMGNm?=
 =?utf-8?B?ODZEZHRTYkVuejBkaUJUelltQ05mU0NPV3BwWDFCRklNRFV6ZDk0SE1JUWZH?=
 =?utf-8?B?SU9BbUtHZzBUdm5PVytndGFibHBNZFlEanZoZC9lN2FDeVl1bkpTZnNrVmxY?=
 =?utf-8?B?R3VydzRDd2JYWVZtTXRaSEZreVgvbTFYNFZkRlBsM2ZlUWZmYytKQXZtU1hq?=
 =?utf-8?B?bjFvNVhYenhtUXNLK0J0ak5uOEluam5JSk9lajRZelZxenpDTkZnei9uc0pz?=
 =?utf-8?B?WkhjaGUzOTgya2tFVGZaTlBQYmZEaStwTkF2WGwwMDZ5eUNFeEhiUUlyVXpw?=
 =?utf-8?B?K2JheXN6Si9iZSszclZhWllVOG52S095VXdiVCswNGdyamUyMlZzMDZWZmts?=
 =?utf-8?B?ZFhyYU5kT2I3OXJCWVVGUGVqTGVpVVZoWlhNVXBjcWh1VTRRWDNnVldJdkQ4?=
 =?utf-8?B?Z3ZUV2QwVk5HRnBUZWZnbUh2UlFmUTV3aEYwSk1nMDY3cGxIYllUOUF2UU1E?=
 =?utf-8?B?Snp6Uy9Dc0N6OFZPWUlqRzB5Y3U2ajl5bElEVFRady9jYTNmQ08yeEZzSUxn?=
 =?utf-8?B?NlJXTUdOVVFCOWsrMmpJK2prSU9GVmh5K0lqWVEvVUVlcmhVQWxCcWUweGtU?=
 =?utf-8?B?NTJodDBYamF3L1NJbFFVZjdmT0RaMnFEWEhlaDhjVC9aWk9TU0ZYQlN2QU1K?=
 =?utf-8?B?VWhxVGk1S2ZtWWprZWhYdk9rcHRHNVNQdloyMzl2djBpSFA4d1crWkRqa2pM?=
 =?utf-8?B?Kzh0aEtiOUdiako4NWlLSmVXTFVhUVF0THUvUklLMk1FWlNvbmx6MmJYZTJu?=
 =?utf-8?B?ckRRKzdCS2JEQVd6MnBQbXJzR2RvVWlaVi9VMDFkdTFycENmM1ZSUnhmUlhV?=
 =?utf-8?B?engyWEdBM01YQXRTRG1NUVpaUmRudUU3OHdYWm1rc1d3QVNQakgxa0FtYUY5?=
 =?utf-8?B?MktzZnJDU1dEa2xpdWRDUEwyS0EyQnMxZ1pNRDBvZlVsTjlOcDR6VzVaajQr?=
 =?utf-8?B?d25SQ1Q0OHVOaWNja0xqK1ZuaGxFTEhGS0crZlFvamdXWFI4R055Z3RabjZI?=
 =?utf-8?B?aGhIM1MyWkN2K0xmL0FubzE3aE4wYXoxcXYwUEg0UkF1NGVlamlRdCtkSkVU?=
 =?utf-8?B?U0crTHZIQ25wK3ZhMHBLMHExY0QrZFB4WTQxVWUxeE52UFpxUjFFWUdQNFY1?=
 =?utf-8?B?Q042U1I1NmhDWXBFcEVJZEZzR24raDZSZVJ0ekNOazNpV1o0Sjc2dk9JQytV?=
 =?utf-8?B?dDIrZXpyMzI1U2hqZkY2UTgzdTQra0dlU1BqZVhVNGx6SUw0c3Q3dXh6eUpR?=
 =?utf-8?B?QmpPMm5uKy9UdGZ6SitNTHdvanVhUFludGlaWFpxRy9JRWdYbGtQcHZYNHBv?=
 =?utf-8?B?UmRuTkFlU0ZHL0ZSbElvYVRQUGp3SllOR1c0NTBFWVRPNlpKN2N5eElqMVVI?=
 =?utf-8?B?Z2FoUEtOUEF5b0wwa1c0T3ZqeHdLdFYwbHVXc25nb2JzV2tIajVROWFOLzhw?=
 =?utf-8?B?ZjVSaVBkZCtoc2NFN3ZHT1JCcnB3NzV2SkUzeUVQOC9MK3ZTZ2Z4YVpXV3ZR?=
 =?utf-8?B?R3JjaWpDSkRVQzZIVWxlK21zT05CTHdyWHo5UjFXSHJIWTNOK3gwRXFKWHpQ?=
 =?utf-8?B?MjhoTy9WaWtLekt2S2hDNUV6L2dMeE9jcUJpdmJGRHF0aGhDenh4cENKVUZk?=
 =?utf-8?B?RHhFcUhKaWJSL2szUHRwUS96UWt4SlFqYUhtcXFCaWZWNlJLMGJmSHAvUlBW?=
 =?utf-8?Q?TWxRQ3qqbTgrvtxYXgO/HHJCl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba614fd-c720-4b7b-bce1-08dd8c4289ec
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 02:05:56.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeJbHGbNSMIno9ETKf5hDiz0pmexdmtStZhwCiUk4Cgil8AU937IZAVWcEt9vsYJ2uCnObZsRQyfG6vcHpS1OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4478



On 6/5/25 02:03, Dave Hansen wrote:
> On 5/5/25 07:12, Alexey Kardashevskiy wrote:
>> Allocate a 88 byte request structure on stack and skip needless
>> kzalloc/kfree.
> 
> Could you maybe take a closer look at _all_ of these rather than poking
> at them one at a time?
> 
> snp_guest_request_ioctl, for example, looks to be ~32 bytes. Why fix
> 'struct snp_guest_req' and leave an even worse offender?

snp_guest_request_ioctl is allocated on the stack in snp_guest_ioctl(), it calls, say, get_report() which allocates snp_guest_req on the stack too. Do I miss something?

> Or, maybe just be done with it and convert them all over to __free().
> Yeah, some of them don't need to be kmalloc(), but kmalloc()s are cheap
> and consistency is nice, like in the attached patch.

I'd rather not. cheap != free, also hurts to read all these __free - I know it is cheap to kmalloc() and initialize pointers on the stack with NULL but also useless.

More to the oint - it helps (at least me) to see from declarations what structure must be page aligned page size (or any other special allocation requirements) allocation for aesgcm_encrypt() to not barf later on and what does not.

> It also wouldn't be awful to mix stack and kmalloc() allocations,
> especially when the freeing semantics are the same for stack and
> __free()-annotated allocations.

If anything, I'd rather merge snp_msg_alloc() into snp_msg_init() and skip on allocating the snp_msg_desc struct.

For now I want the patch to be painfully simple to review and make the code a little easier to read.

> But it would be really nice to completely eliminate the goto mess.

I understand it is 2025 but it is not exactly mess. Thanks for the review, I am planning to follow up on this, just probably not exactly with __free-cation of everything.


-- 
Alexey

