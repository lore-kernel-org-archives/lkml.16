Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07A189F56;
	Thu, 26 Jun 2025 01:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750901522; cv=fail; b=fR7bTnXheobY2F0g9POvCGjo3Qg4kz6BjelqufKqR2cawqLII+UyXP5JhUWv+ra5YSHmFaKzeENA3zV/hZD+rKOFJ8yjZzIpJi7k8A6Tt0Ozn3im8yU/jhkYuMi9fP0kHOyh2IN/cIMvAuBsoxzJ08vUYXVSIta+4K4gelsB7rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750901522; c=relaxed/simple;
	bh=VxTcmv9eMNY4XraJph2/msUABwE68qiQGRlcjEKrxMI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QjdUCO5cLQhneqaESfDWMALU2lPKJUQWo7VnKY2StU3CTWUZAv5ExNO4vN1jnYM/CY5b+gLKOuVuyMbkcyjdQzUgbEQ/eieg1HSyRSxVtsWm+7JTJWURekCLVF+yOpkeII9LzISZhasqk1+ezUCceEUGCdT7IfKAnRSkkpQg8ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bRf8dVvM; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bRf8dVvM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JxgL/WKozlSBIGOsLGnZUc0MpNrN5ICjV4PZxCfWDlQxHtEx+bC0D6sR/JmI4XS1sQt3UrFTqb0e4aigOa0P9yx7M41d0pU+w4J0I1xxcoV60fWuts/9ZDOnSwRNOY0SXUzkA2LII+1ndmfbaZNnb1uoQZzr0hEgHKhI/GjeWLfNcePws7gP5vpCodto71CIXOl97I4De4Xbr7VnIjf9RKGtlNZlyR7VwZ3+3GXnrvtbqvY76Z9PMfyELAKP2XpDzQilvUlVSeLGAK2sVzI+v61e+BLO+fjAcxEvWhPBnFhcX0eByAoZGeIi726uBqfS9EBS2231JGerEkJttadwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYBjdJ3k55PRtRUpcYe9FqREBSdKy6AIM9sme8RQXW0=;
 b=H7prDZ19vvixWwnkxIHsFSKfVlgpl+KdIzVP9Z4eMJfaCi8LbolUVXcD472H68UNrIkmzb7ke6n2tdg1JUmuEkoGusHoPgWSKb7PsUYyrNv6KD2hVej1zSkC9S18ajcueWX1ZpAzPAKwNEHyOGxXCwBwRCcFUlAQ983pE5lCT2vemXgQgOlQsHxlmudk3CXGBxH5eIReSw/kFAHNyht61L46P0xzuyad+cschvPjwD5AAZVu0whGCVdtbXHi+vhuMgmjVRL0fLZUtC7KTGe8y1S9U3zbncTHVbsrB2LX1W9asVZeaRQCV0f/mLobNyoLEb5xupN46G8BLzt0/9UWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYBjdJ3k55PRtRUpcYe9FqREBSdKy6AIM9sme8RQXW0=;
 b=bRf8dVvMZF87ke15XqsR4lD4hQDW+zkMBAhNRjR6UUFKEYrUQceLJOHGSv4BNyZ5Z9HNSKlwRBymv8/fsvVM/5VQZrBJSX1tIhYeshuQIhXlrFqn7RUDyFDYRGEWDspvoXTGJ6fCUCxmmAYXAPvsoT6HbUhE44VYzfAg8aCP95M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BL3PR12MB6641.namprd12.prod.outlook.com (2603:10b6:208:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 01:31:56 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 01:31:55 +0000
Message-ID: <58d214b6-9bd0-42dc-a00d-cc80bccc8fdd@amd.com>
Date: Wed, 25 Jun 2025 20:31:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters per domain
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
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
 <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
 <887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BL3PR12MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: 205a3bf2-de3e-423c-a0b9-08ddb4513beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzZZck1qeDd2T2Nqd0tQMFhOejVFM3lKUXgyN0VaNGxPYkdnWU9zMms5ZHJY?=
 =?utf-8?B?ZkozWVI5S1lBNU1GYnVDcVpESTFGUWRpNy9GTWpoSVM1dmZpdXJSYldsVzZu?=
 =?utf-8?B?RmZGTHYxY0N4YmVUSmpiUTNVVmtqN0JGSDFoRG9hdzhZaUNIeHdrN01aeTly?=
 =?utf-8?B?Mml2MzZxRnZTOWh1bllmN0RxbjN2b1U5eXo3REVUeTdKTjkxenBGYUtIbHA2?=
 =?utf-8?B?MlhZZ1JuTmhCaVN5eFk1b0ZVMVA2TzVCK2lZYkpwOER5ay9YN21BenN3eVNy?=
 =?utf-8?B?QWVlUDV0clErdGJHYjhOSTVUZHo2RFZKZTRaQ2ROL1AzcDJJd0RZYWJmamov?=
 =?utf-8?B?Y0FtTUppcU1KS0NzcDNtNzYzbmVudVFBdmxWVnR6TnV2ZXByL3dIMEFPUXpG?=
 =?utf-8?B?WUJ2VndabTltelB5bHRpRVFxL3NXSlFtWjJFSHhBaTNtaHc0NTFCdW1nQlcw?=
 =?utf-8?B?MGRJTGNad2tsQUR2ZUV4MTJ2bFZzY3pueEI1WlZTeXpPUUdFQ1RrcU1PYmVj?=
 =?utf-8?B?V0NLejIxZ0VXSERVMzErNjJuNHdOR1h2cHBZcXgyUTNKMUd6TXRtL1VqVTJL?=
 =?utf-8?B?R1hHUmUxVXZteE9Wd1pHdFh2V2ozS3lxZ05rc3hsZXRHbklFcUUzSm5veGdE?=
 =?utf-8?B?cFJVTDY2dnFHem1qSHN2Zno3aWo5TzcvMVVTR05OcGhXRmNkbGpCNkFIakpU?=
 =?utf-8?B?TjFQQ1JVa2lJRWpCVzhQOGdJTHZvM3NxQU56QldNTWZWbTRLUktiVU1TMUpX?=
 =?utf-8?B?Nkc3d0hHZHQ4Y3R5VnhxWURQNEtlWTEwTkVtSXR0L2VCYTV0NEJUaVpQTEFM?=
 =?utf-8?B?YWYzYWhkUzdaZDUyS2d3ZGVlbFZoWDAreENOeVJIZ2JUVnAyM0Jjb0VRZTAy?=
 =?utf-8?B?Mm5iRDRLZy9vVW5wNlplUjVkZjIvRHdYekhxaDR6MzNtMDNaS3d6K2RmZFNE?=
 =?utf-8?B?M0lxRWhWMHVQN2VKSWlTZ2pOTUZTejJCZ3VkbUlvNldHOWFsVkNSZ3Y3b1JG?=
 =?utf-8?B?RldIUC9YZTdKRXlXWllnd0hoZVc5QWN3aDBhR3dzL2pUM2MxaWQyajI3MUxq?=
 =?utf-8?B?MCtNNE9JQ3RTNjJNSEpaM1N3WHFqa09IYWVvcmttZTNJRkRTZHJlTmZsbDQ1?=
 =?utf-8?B?d25UMlNBVGJZcUZKQnZOblR5VFlJK29maVhDLzFZbEVJYjRWYUd3YjJUU1h2?=
 =?utf-8?B?bVB5Yk5Td1RKMmZGbSs5STBqNXl6SGxUQlk1RVRZNzdtekJSV1lTQXBYUzEv?=
 =?utf-8?B?NTN2REx0dFpMLzhReks4WDdtTWFUeERGME5XVDJ0ZWZFK2h5c1VycUF2MEtR?=
 =?utf-8?B?YmFPMk1hNllrTlNmaWJ1TGFkTjBKWXVDWkJoSW9VZWZ0WnlCeEVNSHlId3lL?=
 =?utf-8?B?eFFPVmEweFQyb2hYRUZtcnVrd2RLdndDTFBWWlFZenlBQVZHbDIxN3o2QUFv?=
 =?utf-8?B?c2dFcVVDQmJNTjVpaGc1RVZlTkNnL3Yxbkc4bGpLM0cxeE9GRXlyTU1vUVIy?=
 =?utf-8?B?TDg1QkpMam5vMjdvcjVJam9SZWdLdDJCWXZkbXBMS2VNc20xNUxxU3VNS2tQ?=
 =?utf-8?B?MVU0NjEyYzV5WGF1Uy90M2g3cmRVVm02UFRydEhnUTBVZDlxeXFXU0h0SlRw?=
 =?utf-8?B?UFQzSEFZLzB4UVpvMVRPczY1aEpKS1l6L3RUcFJrRHI0Mithbjl1a2dZa0Jw?=
 =?utf-8?B?SUozTTBlUGV1alM0MnA3YnRHZG04bG1GVVZyU3NGNVp2NDh4Qmo0SklBckhX?=
 =?utf-8?B?S3lTb1VXeUFONlFyR0x1aDIzc3d1a0FDL0NPbEh6TnluMHRsU0VmRnNkYW4w?=
 =?utf-8?B?dXoxdHR5VjViQXowM2xJcDdLa2p3WU9BNTkxNHJ1QUZlQWU0OHpMUFJFalFY?=
 =?utf-8?B?bGFoKy9KaFpveWJtOFRySzhraXN0T20xckdRQ08zSzJiSDF5cE9rRllwNTFa?=
 =?utf-8?B?Y0hYL2FBdi8zakhNZWNlNitkSHdSOGZpc04wUnRtWUFnZ2Y2V2VwU1QxNVgw?=
 =?utf-8?B?MGRRVXRxYXdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFkrYlFhbUdXeWhuR000MG5vSjRjZDdESHFncWJaaEpERGd2c095aS8zeHRY?=
 =?utf-8?B?WWgwRTlLeW41M2hRMnhhclIzeHF6SHNiYUplVFJQMlJRS1pUMnp2UEhPOHRm?=
 =?utf-8?B?RktnWUdzdkdPS25zNFFRY2ZRMjRCdWYyeHRwVU5vZWg4VWdnZFJGRVZUSVQ3?=
 =?utf-8?B?aStuZm5xeGdiTGdUMkhBck02dC9ZV0NZei9hOVI4dFdzOEZKaWhmNDRNcnBM?=
 =?utf-8?B?SFhZMDVqYWJ6aHNDVzRUSHBXUDZRVjFIb1dNOVRvK2pZc1FqOHRxaEhkSktC?=
 =?utf-8?B?Yi9yaUxYd05kU09tZzFCRk01aTdyRCtabnNGcUJ0QkdOdVJUUHVyQlV1eGpZ?=
 =?utf-8?B?SUt4U0JnNzJoOVdiNTRoS0grSXJFNFpBTG01OHd0TTVpV3dnaUJaV2I4RDBX?=
 =?utf-8?B?SjU2SVU3RzkwQmwzQTBKRjM5M015N056eWZZOXFSdEpnNkRkVUdTU3I5YXpp?=
 =?utf-8?B?MGtjeVZuYWRoeVpvOURVYUx1SDNQN1VPc1NCb2t3U05kL00vNTJaOGFVdEQv?=
 =?utf-8?B?VjZIbVVWdlNPYThhdGd2Q0dyYm1PQzIyYVdsdktkNnpLTEpQQXRrTitwRUx3?=
 =?utf-8?B?dUdJUU9MVHQxZTJ3c2Q5NkFpUnpnMkEvbWUzdmd4Q1J3ZlpVSnRxaFQvUmdq?=
 =?utf-8?B?RWxaVjltMHA3eEhwSkV4Zzl0N2NLOTZUeVdjQ2VYYkhnMUR1bk9wSVlNYm1i?=
 =?utf-8?B?Z3Fxc254VWllSnBFK3liczRkV1FpUTNUWXByd3hkTEZlNW9yM1lHVFliNTJy?=
 =?utf-8?B?UGlsbC9XQ1BVTXZENlZvOU1VaWd0ck1vbnRQK2tiUGRXTElBMy9ZZXpaN3JZ?=
 =?utf-8?B?U1RyaW1JVktxZzJNWGp1aHhZRmhNckhvM0xvVGtZZVduMVM5RlcyS0RwWHBh?=
 =?utf-8?B?eWp2c1RnQ3d0ODVWQ2xhd0xhYkN3eHZiR1dCNTIyTDNUSVNMYXdZSk81aU1J?=
 =?utf-8?B?N3NjMUFxRVVnZVJPelRBeDFHZkJqUE80U2NzNGFVSk5mMlJCY1g1UzZUSWFm?=
 =?utf-8?B?V2pTbTJYWmJ3TzhkeVZEcDZ1enRPTXhwUmNxL052Yld6TzdyWElRWTVrdnM0?=
 =?utf-8?B?L3NoZkZ1TWNPRlA0MEVIL3Z0MVVQZW9WaEtGQmJTRytxRXdYMW15ZDFKUmZy?=
 =?utf-8?B?eEN3STdlZ3I0aWtnZE01Nm5xSTFpWnNyTHU3VjZ2ZXJ0b2NMV3B3WkcwUWZz?=
 =?utf-8?B?TEE5bUZ1N0dKS0QwVzZEbDF1WFMvZGNOWTg5bDErUHBIVXFGc2ZNYmFHMTEz?=
 =?utf-8?B?UXlnM1VFaXJnNy85elpOYlJVZjdOYkNvd3U3WG9kb0JXSVN3YmhsODNzS2Nr?=
 =?utf-8?B?cnRwSkZBcHVvK29yV3U3ZHhETTNFZFpEUy85L1ZRakhYL3V2MHl6WjZiLzBQ?=
 =?utf-8?B?emNYQVNrcjB6Zjc3NVAxbUt2WmlXQ2R1RTZuRmtGWW9NbGxYVEw0cUp0TmVW?=
 =?utf-8?B?bWhrSEdyZXpaQ2FMeVRIRUZhRlRVMGhwV0RKbVNOUDhpdFBDMUppSWhFcjVo?=
 =?utf-8?B?RXdxaStGakI3eC9Gb1g5UmdpN3k2YWJqaWlTaHlkaUNpcFEzZmh0QUxEL0Jq?=
 =?utf-8?B?Y1F4OVduQUc5ZVRoRlk0UXRMZHk5b2hzdTJ1SEJCZExET0lOeStWSnhnb3pO?=
 =?utf-8?B?M1lzOEsyRlM2ZHFhMFQwNGpoY3A0VTVyUFhmQTl2TjdrTGlEaVQ3NWkySW9Z?=
 =?utf-8?B?RjJkajJqUTNDVkVGTnNoQlFXNVNCSWxwK1hRZnFNcTZXUC9YZ1Z2ZVJ3Ukph?=
 =?utf-8?B?UU5qN1hXUk4rMU9JOUwxbWdJenVMREYwaDlsVkN3TVBIeGo2aWdEWTl5WDZq?=
 =?utf-8?B?L3REMkhuSkp5SjVrV0VHRDNldm1RakQveFZOYjlPZ080Y3BDbXdYYzA2OG1T?=
 =?utf-8?B?RlZnM01ncS9LSnN0MHliNTBZYlJxU1BPb2xWOURxMWR2a3U0MGlxdW5hck9M?=
 =?utf-8?B?NDRNVTlDVG41Z1VrWW5CTlhNaE0vNVpFQ2lqaFZNK01yaU9oOXZEZHdDaVNZ?=
 =?utf-8?B?U0pwWER2MTFIYVhSZ1lPOVFoRGZGOFFxa0o1eGhqZDZGeVFyOXV5V3h6QVVz?=
 =?utf-8?B?ZU5IVHJVZmx2ZER5cGhoSjZUY2xNU292WGJVZlp5emtDUjhpenZudVorOW5T?=
 =?utf-8?Q?Adqg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205a3bf2-de3e-423c-a0b9-08ddb4513beb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 01:31:55.0540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckoIMr7M2rcwzups5Q1SM5ZmF775uINSFUjaX22rN0Ujf/XNdUhi99P+rbY0seK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6641

Hi Reinette,

On 6/24/2025 6:31 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> The "mbm_event" mode allows users to assign a hardware counter ID to an
> 
> "hardware counter ID" -> "hardware counter" (I'll stop pointing these out)

Sure.

> 
>> RMID, event pair and monitor bandwidth usage as long as it is assigned.
>> The hardware continues to track the assigned counter until it is
>> explicitly unassigned by the user. Counters are assigned/unassigned at
>> monitoring domain level.
>>
>> Manage a monitoring domain's hardware counters using a per monitoring
>> domain array of struct mbm_cntr_cfg that is indexed by the hardware
>> counter ID. A hardware counter's configuration contains the MBM event
>> ID and points to the monitoring group that it is assigned to, with a
>> NULL pointer meaning that the hardware counter is available for assignment.
>>
>> There is no direct way to determine which hardware counters are assigned
>> to a particular monitoring group. Check every entry of every hardware
>> counter configuration array in every monitoring domain to query which
>> MBM events of a monitoring group is tracked by hardware. Such queries are
>> acceptable because of a very small number of assignable counters (32
>> to 64).
>>
>> Suggested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> ...
> 
>> ---
>>   fs/resctrl/rdtgroup.c   |  8 ++++++++
>>   include/linux/resctrl.h | 19 +++++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 967e4df62a19..90b52593ef29 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4084,6 +4084,7 @@ static void rdtgroup_setup_default(void)
>>   
>>   static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>>   {
>> +	kfree(d->cntr_cfg);
>>   	bitmap_free(d->rmid_busy_llc);
>>   	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++) {
>>   		kfree(d->mbm_states[i]);
>> @@ -4167,6 +4168,13 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>>   			goto cleanup;
>>   	}
>>   
>> +	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>> +		tsize = sizeof(*d->cntr_cfg);
>> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
>> +		if (!d->cntr_cfg)
>> +			goto cleanup;
>> +	}
>> +
> 
> Please see my earlier comment https://lore.kernel.org/lkml/b761e6ec-a874-4d06-8437-a3a717a91abb@intel.com/
> Before this addition the "cleanup" goto label can only be called when
> (a) idx is guaranteed to be initialized and (b) d->mbm_states[idx] == NULL.
> Using that goto label in snippet above cannot guarantee either.

Yes. Tony took care of this.

cleanup:
         bitmap_free(d->rmid_busy_llc);
         for_each_mbm_idx(idx) {
                 kfree(d->mbm_states[idx]);
                 d->mbm_states[idx] = NULL;
         }

         return -ENOMEM;
}

> 
>>   	return 0;
>>   cleanup:
>>   	bitmap_free(d->rmid_busy_llc);
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index f078ef24a8ad..468a4ebabc64 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -156,6 +156,22 @@ struct rdt_ctrl_domain {
>>   	u32				*mbps_val;
>>   };
>>   
>> +/**
>> + * struct mbm_cntr_cfg - Assignable counter configuration.
>> + * @evtid:		MBM event to which the counter is assigned. Only valid
>> + *			if @rdtgroup is not NULL.
>> + * @evt_cfg:		Event configuration created using the READS_TO_LOCAL_MEM,
>> + *			READS_TO_REMOTE_MEM, etc. bits that represent the memory
>> + *			transactions being counted.
>> + * @rdtgrp:		resctrl group assigned to the counter. NULL if the
>> + *			counter is free.
>> + */
>> +struct mbm_cntr_cfg {
>> +	enum resctrl_event_id	evtid;
>> +	u32			evt_cfg;
> 
> It is not clear to me why the event configuration needs to be duplicated
> between mbm_cntr_cfg::evt_cfg and mon_evt::evt_cfg (done in patch #16).
> I think there should be only one "source of truth" and mon_evt::evt_cfg
> seems most appropriate since then it can be shared with BMEC.
> 
> It also seems unnecessary to make so many copies of the event configuration
> if it can just be determined from the event ID.
> 
> Looking ahead at how this is used, for example in event_filter_write()
> introduced in patch #25:
> 	ret = resctrl_process_configs(buf, &evt_cfg);
> 	if (!ret && mevt->evt_cfg != evt_cfg) {
> 		mevt->evt_cfg = evt_cfg;
> 		resctrl_assign_cntr_allrdtgrp(r, mevt);
> 	}
> 
> After user provides new event configuration the mon_evt::evt_cfg is
> updated. Since there is this initial check to determine if counters need
> to be updated I think it is unnecessary to have a second copy of mbm_cntr_cfg::evt_cfg
> that needs to be checked again. The functions called by resctrl_assign_cntr_allrdtgrp(r, mevt)
> should just update the counters without any additional comparison.
> 
> For example, rdtgroup_assign_cntr() can be simplified to:
> 	rdtgroup_assign_cntr() {
> 		...
> 		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> 			cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
> 			if (cntr_id >= 0)
> 				resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
> 							 rdtgrp->closid, cntr_id, true);
> 		}
> 	}
> 
> 

Actually, this interaction works as intended.

It serves as an optimization for cases where the user repeatedly tries 
to assign the same event to a group. Since we have no way of knowing 
whether the event is up-to-date, this mechanism helps us avoid 
unnecessary MSR writes.

For example:
mbm_L3_assignments_write() → resctrl_assign_cntr_event() → 
resctrl_alloc_config_cntr() → resctrl_config_cntr() → 
resctrl_arch_config_cntr()


resctrl_alloc_config_cntr()

{
..

/*
  * Skip reconfiguration if the event setup is current; otherwise,
  * update and apply the new configuration to the domain.
  */
  if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
      d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
      resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
                                 rdtgrp->closid, cntr_id, true);
    }
}


Thanks
Babu
