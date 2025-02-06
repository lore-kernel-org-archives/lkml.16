Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B256237169
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738880640; cv=fail; b=FYhjVIGgY1k6kMA73eqtHIVNVPnHQ2jDLesvhg3ku20GDfF/1OXmC0smLEP1FHDiWI2QJlE6+74nvN74FhftlGp97njIp/CCcwJVD5yKv50ZR4ce/P9X3eXnSNNI+TfeyxGzDRQXr37uPVluvOAqFStZz60Xntz/HMw3JvCXOKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738880640; c=relaxed/simple;
	bh=mF2VYON8QuoYWoicMye+qzkNbP1RsgHMU8rBRD9DPyU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WnYMrJVCNxCv4owfxiGNYDMutPoEQ1nhK2FACbuDhwtwtKeylOxFoPOZBLJhWiF6JZe/0dYHQq0m7n5wlkG9PAFoZnq8NHH6eAW1Y0JBJg34DuTSVK2kD2CzqcTpluq4AUUCp0mEmLqBIQvLvO/EpPEK9MN5q//Tdv8IRUbGtz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jRtUaaUd; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jRtUaaUd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBOIdGNVdpW9cDGZ9y7F41QrDNurx3bzp0g629xB/tJFz0v98wpO6Otx063b++pty8lYOx9yLeZPc4DS0nOWR7DcB16y1UlntFJsciseLwULFaRMsFcJe6nPIdnxtYUZRYQLdCwe/zPxbQJKorIWAjlsxZsVSDbYa+E7dNWLMUUP8D8Js/ZZDjqIyhUcj32nfrLa0iePaGwfcRBz+Z9Yl1ksxWYNhtmCiIPv6tNDxV9Z+IcFCaJkbQfbyKYaZufW3Zn55s3ritElEf8Q7Hav98AdwfiJZOnUZcaiy639NskUw5MSavSORUt/H1YbhWbxReQI31/KaSARbv5Y1udZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpgIpcGvuxJwodyFhtT6wsxv1xMAmZz0M1Cv5qGh8C4=;
 b=DR4qFB0/nL9EKUxqH5+tWIG3dAbvX7GhBGPC16qzv7gUvegayWD6wEWXkURCIT5XCuH/Nj6dA8nTBz+dL0T1mdkd3If/9yiJvFzVwLm/bD2tvq/o99FGfG1d8n4kXA+fYCJjCANWlF+Td/Zk+5yc1LSVm21SvQakCsEfniZ/HfJO5rdIaOQUADAeJU9qOeeGyEsKzLJL2aAcjKU3SOKiHcLwrciBctrpELD60J1sdzepGWLEFTWdrEFxRVYnQVaBYMuHhEB9uskCUFhQkMHo2e1C5mvK5PEWImNGHu0ZWiqGUZ0wWqxOfUgAWUlwHnAuyliKwxqW8jxoyB4AgCMskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpgIpcGvuxJwodyFhtT6wsxv1xMAmZz0M1Cv5qGh8C4=;
 b=jRtUaaUdV86nJdbMBb1EYS2uzz0O2aEzsbu7xQ8Pc+rsxGrBah1JERCtqqHCMRq897ECuPyYk/E7qs3EtaXxSwsyUGUrtqZVWYBRkDHg7lACSmk/udYDbTRcA6EVxZlgXWtsbb19hZvqyWgOVj8S+W1kgAYjZfkg9oogLxfhrsY/Xb3ENU2/SD6iIlCGtHQ1ODXqzX3fqM0tv5txhPMGINGP/kyvAG+GjuLVsBeViBN39BMEbfTAneJzSJkjg0wfj95FtcSRQEKG1Lqeqe5xnQiSct1jhrtMgmgxI1ZGIvpflW64i3PzMb42NALXSy8ex58AO8CM/gyrxfeD+E8YXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 22:23:56 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8398.018; Thu, 6 Feb 2025
 22:23:55 +0000
Message-ID: <08746633-d844-4dc1-90c7-7c3d63b5f4b2@nvidia.com>
Date: Fri, 7 Feb 2025 09:23:50 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kaslr: Revisit entropy when CONFIG_PCI_P2PDMA is
 enabled
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, apopple@nvidia.com, jgg@nvidia.com,
 jhubbard@nvidia.com, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20250206023201.1481957-1-balbirs@nvidia.com>
 <20250206081058.GH7145@noisy.programming.kicks-ass.net>
 <202502061145.8AFAF053E4@keescook>
 <47db7421-c796-4592-b223-d50277625dbd@nvidia.com>
 <202502061343.44A6657E@keescook>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202502061343.44A6657E@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::30) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bf1b16-39ec-463e-8b4f-08dd46fcf1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3FKcmRuemN5VEJLc29rVFlueVFId2tZK2tEb1B0RnE2Um1EUWc0bHN6b0ov?=
 =?utf-8?B?YTBPYmkzUkpvYXlSQUJXMjBCUDE1OERlUDRIZkFqZEk1bmxvOVBqejVYLytU?=
 =?utf-8?B?aUhpalZCbHVQWEtWcVEyTjF3WVlaK2N1a2ZWbUE0dXQ5RytTcUkySHpUdWV5?=
 =?utf-8?B?RGZWTEVrdW90QVQ4MjliaXRVb3lYRXVNL3h2L3dMRTdQdmRFTStjWmZRcVYw?=
 =?utf-8?B?RlNrLzBlRllycnVNMWFFRGVhSXVNcng1TGFsWTBudUlQbnYvanY2TzIzYUlL?=
 =?utf-8?B?U2JYS09hRU1OWlFGVDRSMzFZT2ZDNFRtOEdSdkk4SXBlSDNzVU5qcFlBSDM1?=
 =?utf-8?B?MlFldjRTbExKM3VZVk50NXRKZllMTXpTV2pZR3cyWEQxc0RLdndlZnRsS3Nn?=
 =?utf-8?B?RTBmRE1xUVRPMUJVQ2VQd0dkeEF3RXI3VC82QXBobDhOMTVPWC9DM3RvT04r?=
 =?utf-8?B?dWhRa3RCU09hb0t3TUd1MDN6R3I5MDZ5RHlIMnR6SFNlU25ISTF4UmttcEdV?=
 =?utf-8?B?NmZZc0h6MERlZHQrS1dBRkE5Q3JLOTVlUlRhWmUzNCt5QXFBbEFkN04ySDhy?=
 =?utf-8?B?elB6cmZNdnBBNE1lRkFjMVFMVnh2dWxDWEFnNTNuV3V3N0w1ZWFCY2J0UnA4?=
 =?utf-8?B?UnYzKzFRYWZsU3V4WTZUSnFVQzUzc2tubk1YZUdPUVhBQ3B6aDJYdGpCRVBG?=
 =?utf-8?B?alBRcDgvcVV6ZTZPaDUzeFB3eFM0dVlvL3ZVQ0ZONktUNThuaGtIMzBGK0Nv?=
 =?utf-8?B?bS9neHVZak5rd203WUpyNlRnZWVMY3lMU05GUUp1UnEydWkvb0hDdmR1NlJJ?=
 =?utf-8?B?TUhVZDYvQmFLaTV2dEU1ZGM2T3Aza2dmeGlZQm5XWU56b3puSkRnQ1FNcnRq?=
 =?utf-8?B?NWJVMnpycS9WZUtVM3V0cnVmVlpoc1ZoejE5SzRmN2h1dzkwdytYMmdzRHYy?=
 =?utf-8?B?Z3J4SytUcDZmQ2VDNlFEaWNyNVRwUmZZeHRYekVPNWNqaUF1L1poNURGOTRT?=
 =?utf-8?B?Z3MxVm5HTExURkVIUG9CRGRBL2xpRk9STS9NaElaelJXNjVpR25IbDdxaytI?=
 =?utf-8?B?NlpsM1A2aDRoMm9kWFpkWmFONURjUXFpRFJJbml6YW5wNlBBQkpRbkd6VG0v?=
 =?utf-8?B?Q000TUV0UjVhalo3M2ZoOTBoRFR6ZWpCYmN5dGIzbHI1UkoxU1RIVUhNWkJT?=
 =?utf-8?B?anhtVTV0VlVkdkIxS0NSSTcweWthUjdCbWV0ZXFzemRkcTJpTTNybmtKUmdj?=
 =?utf-8?B?UEhWUUh2aG1TeE53T3p6a1l4N3V3eE9aNVM4S2JDZUtMNlJjelFMZVBwUlVI?=
 =?utf-8?B?cnU1K1J0NURrVzE3TTlEUXp5NWhRSVJKUGlxWTR4UmpLQVFKckdPKzBiWFc1?=
 =?utf-8?B?dFN4MmcyQXl0VmR3V1R4amF5cWJNN2dsQ0diOXNpYlFDNzJvMmluWlQ2MjZz?=
 =?utf-8?B?cFBvdytXbmk2QzlzcjBwVUVxOEFkT3ZYRGVVZXV6SmRhVnlXdnVMa3hlWXd3?=
 =?utf-8?B?eXhZWGlpTkFERjFucWIrMklCblJTcjNzU0g0MmthbkluL1FyNTN3QnFsaHV1?=
 =?utf-8?B?MFBuRFRTTDZTNi8rQUNWMWJtZW4yeGJocEMwNWE4RmVWSkZkVUVPRXRJYjJI?=
 =?utf-8?B?UkFNQmVqK0UzalVjemNwNUg0L0lDRUszcURIMlYvQkZiTUJSbURjQ2lFcFor?=
 =?utf-8?B?N0d3YWkvdCtLSzBKVDRIbUduQkVhUHZNZ3VlampuTFc5dERXQWx0aG93VFRs?=
 =?utf-8?B?N1owRUZwaEhDYWFveU4vR2xhdlMrRllLREJIOFM3eFJMWW5JeUhOUkRUT2Y5?=
 =?utf-8?B?bUMwTFJadk5XVUhQdjB5bWFQMTVCYTFjWERlalNEcWpMRXpjcE9TNXU0Tlhx?=
 =?utf-8?Q?9orw1jTpoJle+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWFhcTJyVmZZU3FVU2xBVEtKNjk4VWp6anY1dkN0V0U2cU1UNFJOYitZTGYv?=
 =?utf-8?B?R0dCRHJVcWRyYVRIQ0o4T1F3bVE3c3BCV1ppNXZ4Um51dENFSUtqbkNCUkc5?=
 =?utf-8?B?UzB3YkxHWFRPOGozTWhmZjJhY0hrSC90TkU2N1RLOGdlMWdwYW5VMjA4d2du?=
 =?utf-8?B?RWx0T2J1bTdZMVBDditlQkN2aFV6ZHZxbHA1VitsVTZuRi9Rd0c0OGI3SjN4?=
 =?utf-8?B?Sm5leDJRU1U2d0wvUkIzUkxHZlB2NUQ1ZWYyYW9LMGNqRFVWM1ZrY25BQmhD?=
 =?utf-8?B?V3dYTGVYN3pXUTZLVStqMDdnTW51NHc4aWZOaHNIamdXSWJPWmlZVmUyU05V?=
 =?utf-8?B?QTdJQlhGZzlBZUtPRmJaNkdzbVA0M0xKM29ab3cwQlkrZ0lYUU5xS0pPTmV4?=
 =?utf-8?B?L2ZsTG9nV0FlcU1kZDFONFpCZTdXZGJSNTIzMUw5dzJsZFFCcHEzcHZDeUVm?=
 =?utf-8?B?ODl6VmNXRlFmemN3UFIvUTVNOWNzWVZFRHFxcTBkUSswWExJS0VlSGpMdUNR?=
 =?utf-8?B?cnBJU1RzYStYT0hzWklpM2VTRWluVnh2dHpkMkt4YTNRa056c1kyajFPSTJR?=
 =?utf-8?B?L2UyOFFTKzZWR2N5WFRKN1NOVkJ3WGttQmJISVZMVTgrR1pzY08rMmQ4Titt?=
 =?utf-8?B?WXdBUCtZcTczamtXenZReEpTcWJmUWR1Y3F0NHBMdEZMcEhRa3dDWHJIY1pm?=
 =?utf-8?B?dE1kTjFlbU9hK21RMElVclV4b1RhRk85S1UzU05Na0V4VUFna1JvVFIxc2xj?=
 =?utf-8?B?N3lQa0NzOURPMFhPUmJpV01CazdKTVRMcW54OGdwRlFld1VnUUt2WU5Yd1pG?=
 =?utf-8?B?QktuQjFqbEpzZUNuZm5ZOWxTS0FSR2sxR251RzJyWk1EK3ZFcmJkeVE3MFRu?=
 =?utf-8?B?N2hURmFKb1M5VVU2N2wwdXY1Z0hTNXRhT25OYW0rLzFodXlmYjJoYnhwM3Jp?=
 =?utf-8?B?ZnNsVS9ZNDREODM1Wi83YWRTd3JueUNVY0pGK1hSRmlEUDZjSlJVSmRzUnpu?=
 =?utf-8?B?ekFSYjZkaEp4aEQzVjNNMDZkdzBXOTRGeFNpdThXZ0VYWUM0MUZNbG9KK3Rq?=
 =?utf-8?B?Uitid1dpelh4cTdQTGJQTmhVd3VRYXh2WUNBVURnM0d2NUVyMW9pZlZIS3NP?=
 =?utf-8?B?VktCanYvNHMwaWp3VnlWaTBNQm1DaHhhNUdXbEl5YWQ2SjJubDZQWWVORG1W?=
 =?utf-8?B?VFA0UHdKelhyL0pRUGpNVHpwSm8xY1JKdldRZkRVbFFnY2dKNnJiY2p1aVY4?=
 =?utf-8?B?NHZnYlBiVHpIMVp0czI0RkJVYXdwZ1VBTEEyWUlnL1hRVUFkQlYwVDc0cjJ6?=
 =?utf-8?B?RUpidytvK2QvaTFCTEpJazF6ZjcyZ1VkZGlJd3ptVTB5eFVJN0xsaDlJSWM4?=
 =?utf-8?B?ZHhjcXVrZ2VSalppRmYrRDNpTzlrYlViTkNxb0pObjVCNnBrMmRLb3JIdVBC?=
 =?utf-8?B?MUx0ZEJMeFd5NExrQmJ5WUk1WkNhS1lUTjNlckpvbmE4blFSdXMwc3dxTXY4?=
 =?utf-8?B?c1FhVmxFZ2hFbDYvdWpqdnFTUnpHcnpYSmUzMjNZOEtFdm5TYVovOFNhZDZ6?=
 =?utf-8?B?Z2N3blVtVFgxQ2lweE9ZREJ6Z0w0R2F3b1kvRiswYUlKOU9jeVhmTlhMSTZH?=
 =?utf-8?B?OTZFOTdMbzZaSmNFTDRNakNoU0w0VmdLbzM3VjA5ZGRFdXN6R0pNOVkzMjlF?=
 =?utf-8?B?NW1hUGNXa1JLR2JmVHNxWnNTeUNwSlNkRGUwKzVnM3FNbi95ZlJtRVpJcVUv?=
 =?utf-8?B?QThCcVR1NTgxMmhMSkVVVU9tTmhHZUpXakJXWVlrYnQ5SGJoOXVpZVo1TExO?=
 =?utf-8?B?a1pJR0tnYkRaNkg0YXFaUjlnYklkTDBuVzlnVmhKUWZOczE1UWVaL0ozR0VS?=
 =?utf-8?B?a1JESWcwUGthclgzOGovdXJ0UEs1eDlEbUVSNkx0WUJWenhoTXJRaFhrVy9Y?=
 =?utf-8?B?WlIxd01iMDRTdHYrUWY2d01GY0xWdzdCc01YeDgxaGFkR2xrOXNnRXlDMERl?=
 =?utf-8?B?dk1rei8yajJ0bHhyNVhwMnh1S1YyS0RlOHRHd0Zwa20rcHQ3dGNONkI1b1Vk?=
 =?utf-8?B?QXZyYWZSdE85RGgvTDY1N1NpSklpSEQzTml2cENjZ1VQVGxXMTRGV29aMUha?=
 =?utf-8?Q?HV3oLgVpZsWGDNkPe7wClAsRY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bf1b16-39ec-463e-8b4f-08dd46fcf1b4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:23:55.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAz7E7W7LccRiLlFcekmOGy93u/c7MokauCCc4RPecpXy5fkx9n+j9CnBPyHLy/ERfWLX5zVSPhM1X37DhOzjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519

On 2/7/25 08:46, Kees Cook wrote:
> On Fri, Feb 07, 2025 at 08:22:23AM +1100, Balbir Singh wrote:
>> On 2/7/25 06:59, Kees Cook wrote:
>>> On Thu, Feb 06, 2025 at 09:10:58AM +0100, Peter Zijlstra wrote:
>>>> On Thu, Feb 06, 2025 at 01:32:01PM +1100, Balbir Singh wrote:
>>>>> When CONFIG_PCI_P2PDMA is enabled, it maps the PFN's via a
>>>>> ZONE_DEVICE mapping using devm_memremap_pages(). The mapped
>>>>> virtual address range corresponds to the pci_resource_start()
>>>>> of the BAR address and size corresponding to the BAR length.
>>>>>
>>>>> When KASLR is enabled, the direct map range of the kernel is
>>>>> reduced to the size of physical memory plus additional padding.
>>>>> If the BAR address is beyond this limit, PCI peer to peer DMA
>>>>> mappings fail.
>>>>>
>>>>> Fix this by not shrinking the size of direct map when CONFIG_PCI_P2PDMA
>>>>> is enabled. This reduces the total available entropy, but it's
>>>>> better than the current work around of having to disable KASLR
>>>>> completely.
>>>
>>> So, just to restate my understanding: this is about only the direct map
>>> (i.e. kaslr_region[0]). The notes (which I think should be left in the
>>> commit log) say that the entropy dropped from 49 TiB (46 bits) to 20 TiB
>>> (45 bits). If I'm reading right, the offset granularity is in PUD_SIZE
>>> (30 bits) steps, so the entropy is going from 16 bits to 15 bits. I don't
>>> see any general problem with that. Especially if the alternative is 0
>>> bits of entropy. :)
>>>
>>
>> Yes, this is about the direct map (kaslr_region[0]) and the data is from my
>> system which has 46 bits of physical address. On larger systems with LA57
>> the drop might be higher. I am happy to repost the patch with my testing notes
>> in the commit log, if you think it's useful to have in the commit log.
> 
> Actually, it might be more useful to note it in the CONFIG help
> text? "This may reduce direct map ASLR entropy by 1 bit with 46 physical
> bits, X bits with YY physical bits, [etc...]"
> 

I worded it as follows in drivers/pci/Kconfig

	  Enabling this option will reduce the entropy of x86 KASLR memory
	  regions. For example - on a 46 bit system, the entropy goes down
	  from 16 bits to 15 bits. The actual reduction in entropy depends
	  on the physical address bits, on processor features, kernel config
	  (5 level page table) and physical memory present on the system.

Does that seem reasonable?

Balbir
