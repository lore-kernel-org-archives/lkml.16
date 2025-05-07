Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1291DD877;
	Wed,  7 May 2025 20:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648380; cv=fail; b=QdLkdUsdd13KJOQ/37sOlrL5O4FLWQa6Tfzqd2vzsjXUDd1cIdWxoki5NxszmfYCLywYFb/l89eJ0RGRHR7/0J3CxQDPNNEmPhsGCnmZLH1yxxe5y1UWRlnhn3bmWQeoigm1PdjTXxqLKSJBpDLVRVB12Z6y9a9b5yt5D+yBK3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648380; c=relaxed/simple;
	bh=l0LyVB+PGd8d/8fwmEIMDvel9fCKBQjBnQv3ESeOrW8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EY8NmAUisE1a5TaJ2Hdze+35sl+0eEriPcTySdCBMtRAiw5OohQb42AWGhMZLzrOfp5CTX8hZX0Gdbg+m0ah6kQPYrCNvRu7w4z0zLV4LfT8Zx6ca2GTEARUNxEUQZbaBLP7g5YFZQjCUO6sfWISimq6A7YgdjIWhPNFQIaA8kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BTRHwp+v; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BTRHwp+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/Psbi19jAuPCMngfZgES2svFs/sD1EKGoLcfZvN1SysN+Nwr1uVhIrz+SIaZvHj1w8y34YAct67qk3+Y6P+wLs0w0bEXApWI0hzmVXFwnFCgy92lEnm6LfxyFnwTIwqCy2ZMagDTsuV9WBIExdDrstL3qPpekcQdGYuzM3a5H7Kkpzh8G1REMBcczJCSEXC28EgwAcNxm/H1VWyQEfa3bve5vdtI7wlB2JZpRMhYEk8yefuM0zKiql0z3MPElqR63nvlHbKRsmzxwU/aSuUYt17XOhYUqwK+D4/eqVcaUUZJDVnn64ydyQxhQG3PoB+26Kq363kb4jCkHc1/zjXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGBjEGAE6/0oXDxlO+dN/4SzoRJQWw3xWnFU+tqfWxc=;
 b=NY7vLcthhTVvTZ69uWCvN7c/Ktn0aUz7+QA23wQm+xN8nGvps2SKTEOBxdUrLtSFqYznVmkFKKedv0GhCEy9USEcLczeF66Gt0EVCVT+3XuTP/PvFPL0rOAaZnJ4FNtnm2v0UMJ3tZ1gMyjkquLEZS1vYWaz1o6TcslJ/owlCM/XH88VYDg7Ci4hHEHbjIgPOiYmxd4MVOh4a08ic5vMp1bfEu7vzehvtU8ja+a6AueK5JWEEvPNMFPhFd4bWvHN6M8bRBsb3qhuX7T0B75t7ikGuzTcCKKg2qdODyTPq7HSH2VtqAoi949IPoPjyCNhyX2WOWWa3sGMGymKMa80wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGBjEGAE6/0oXDxlO+dN/4SzoRJQWw3xWnFU+tqfWxc=;
 b=BTRHwp+vCWMST1oRYIjROR9bOFURDnx4t7wp/uDs27LDgdAUx14Pet0KiOJsf3b4UnSId2p1QH3Dha1nFS9/wXe+4KeNo/eybIA4WpmJnCwpYkuzi6DjaYouBbptgyJMLC/Lh4VIsHxgycOmpww8JzW4cgZsjXeflFz4JSJl578=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 20:06:12 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 20:06:12 +0000
Message-ID: <5284e963-7762-4abd-988e-85f188f48e6e@amd.com>
Date: Wed, 7 May 2025 16:06:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <51708888-3568-2529-2c99-c1df291f4cac@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <51708888-3568-2529-2c99-c1df291f4cac@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::19)
 To CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afe00f2-5eab-4e9b-e0ba-08dd8da29d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWgzUG9BQzgraU00bTVrZ1R2NnN1eG96RTRjRU9Ia2tQODZjSTY2YnRlN2Ns?=
 =?utf-8?B?dWxaQ1hlbkNsZitYYmt3R1Ruak9Sd0RTR0R4VE1oVTFmWWFWK0Q5SjRMWEJJ?=
 =?utf-8?B?akVqSG14K0JqdjVZcGh2S0RpaHVqeGplNDFYZHdZQVFQMjh5T1duQ3dxQmJj?=
 =?utf-8?B?S2RXQ3VpYWZCZzlQVXpaNFJGTlhybXJhNWpZVXVpLzJCQnI5c0pOS3pFMXA2?=
 =?utf-8?B?SitLaExHWTJTYTUvaXU4VzY3VnNzcVpGVWlXNVR6QmpySmtDdnRBNGVadkUv?=
 =?utf-8?B?ZU5oMmp6aGpCT0RmVFFBOEFqK2tQcU9POG9wTi94akMxbHhzRnVSY2g2SVQ0?=
 =?utf-8?B?SFlwS0J1ZlUrZ05GSkQrd24xdFdyZEhWS1BiMHF3d1M3OERubDUrSEZWZ0lC?=
 =?utf-8?B?dUdFdWgzcE5SRWg2RHJ2NUVWTlQrTlVwclYremFzSW5VMkgwRmk5cWx6V004?=
 =?utf-8?B?RUk1M2tZYlpBcEVxcU8yZTJKbDJoN25XQTNlMk9BU0J2S2pyeXE3UFY0dEJK?=
 =?utf-8?B?U3RTUFFiMTBMYTdycWlzSHNObjRWTitCS3o1WTBYK2J4WWVmcHF0VmVZcEVp?=
 =?utf-8?B?TzNuY21jUGx0bUpUNWswNTFDR1dOejQyR3o4UDFUOW9CUm1IcTJLcFJFM2Na?=
 =?utf-8?B?SDEvVUtnREhlcjA5WWFpeklXdWE2RVlsQWdYdGpVbXhPRVNUOElZR2poc3Jm?=
 =?utf-8?B?cnc0eXp3a3ZwMzQ1OUh3UGFTR2xtWC90VjFoMGZUNVdUZDJMNkxOaTVzZXVF?=
 =?utf-8?B?b0N5OVhIUEFlZkFvTVNEQVFSQmRUT3Bkc1RTMnNGZWVuOU1RWjk3MnNXUVk0?=
 =?utf-8?B?M050TXdsT25rZXFWenB0dFhobGQ2ZC9jNm0rbUYrUTBkQUR6aFhSbDNMQytG?=
 =?utf-8?B?a1NqZzhPc0xmWjlTSVRVeUFhOHFHdEZQckZXUS8rNHUvTFFZTlpWeWgzSjA4?=
 =?utf-8?B?UjZOSnIyeU5FYmMxcnZOQ0NPZGxBK1JmaEF6VERMSXJhVUw5RGpKQ0lKU0tR?=
 =?utf-8?B?TVQ1SS9WUTJvWUlraHJDTHJIVStiSkpxcDEvdGxwZ1BsN3I0NU9oVU5FdFYw?=
 =?utf-8?B?MjA5OUw2bklHc0NNZjBKRk5FQ1JVZ3ZoejZrTCt5SGFIMnBYY25PY1lDdlh4?=
 =?utf-8?B?UVM1YWE5Q3p0TzNCQ0VvM09sVU5QMWxWajFsN3NVVWIrT3dCZzFZSnFDejFs?=
 =?utf-8?B?YzdsTTg3SjVYeTRrRlZiWXhqRENkUitNNEZkSWJuUmlkQS9xd2pRUm9yeGdo?=
 =?utf-8?B?TFloZXUxcHJpUlJHSktMTFJuRi9mOHRqNlZMcHYwSHlkWVFYM05RZktLS0Ew?=
 =?utf-8?B?NmJIeko4ejJoNWtoVUVXaU1Cb0hMZkxOeGVCTk9FTFdLeUNQL2xQajdSY1dX?=
 =?utf-8?B?TjJEUDJrdmM2KzFqbCtVdG0xQThGZ0k0TWx5U2swejJ5UlZRVHdNcmFkbW9a?=
 =?utf-8?B?N2o0SW00a1BPV1NPMXdJam9qZ0pzbjEzTjI5b1VkeWtOUTdvTkE4RjE1UTJG?=
 =?utf-8?B?SlZBZmlPeXdLcnZEdW1IQ2Z4VUFaTXhiSENObzdzSm9QNWw2c3g4ZEgyMTBZ?=
 =?utf-8?B?UXJFeEwyZGxOQXZrbzIrV2tUbWw2OURROFMxbENJSUpGZkVUOVBmdS9rWjVw?=
 =?utf-8?B?UmxVTXpaVERFeHF4dFBTNkhBUW5VWXIvVjZsd3JKV0puQ2tiRXRKTHhoQkVu?=
 =?utf-8?B?RnhSN0dhYlZUSXJjNzFWNm45RTRhMEM0VGs2SHk1dW15SlU2dStJYWcrOTZp?=
 =?utf-8?B?VUJ6ZjY5eFppdU5oekdZZFpmbGdGZFhMZ1VzMnQvcFMvVHpLUUdhMHdETFNH?=
 =?utf-8?B?T0syUHBPWmkzbDNhOVF1L0E0eGh5WmNlYW9qRnNRb2VSSXl2TVpDQ1h1UFZu?=
 =?utf-8?B?dHFUd045UnlBcDFERUFhd0xTRWduTlNwOE1ZSUVPTFN6dHlBN21HYXFoa1Z1?=
 =?utf-8?Q?b5/AOh5Sj9M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmlrYjNDd0pOdk9tdVhTVE5KR2ZSMVYvQmp1K0xoRUI3M0FGcWtYaUxhSFQ0?=
 =?utf-8?B?WmdCbnp5Z0l2cCtCOS8wOE9HclZETVJjMjZIK0ZidXlYcmFQNTVFL2huRm9i?=
 =?utf-8?B?N1ZVMmhZa25RRFFub1lLYUgzeExaZXVpL2pNcFNaMGdMK09oQ3FKU3Mwengy?=
 =?utf-8?B?SldYbVliTnNiM0dJSDdZem0wTWJSNkFQa2cwMjVOL2Zxa2x0eUw2b1ljbHVw?=
 =?utf-8?B?dVBNbkIxUWJEVkh5YndVSXdrbEtQRURBQ3MzWnVJbDN6Mk13UWxCS2wwU2lK?=
 =?utf-8?B?OFAvcEpBUUpIakl5WEVabUVJTHp0ZEJXWUJBR1orU2I4OG9idFdGdEk5T3Va?=
 =?utf-8?B?SWUxemhSdnNSWWVFbGphdEhDR09mMXZERlludERyRDdDSll6b05hc1dodk5p?=
 =?utf-8?B?QTVrU2ZpYlNuWlc0TUo1SzBwcUZIMnZSb1o0b3MzVUtNVDFoeXlUcnViQzNn?=
 =?utf-8?B?L0NuSlFWVFJFOXdZSngrM3Z5RTRsUjVmSGh2Mlg1WjN2Zk9ETTE5Tlh5cDJE?=
 =?utf-8?B?OWhWaHJTNEFFOGFsMzhlcy9pVHI0K21IdjlTOEd1SVJ1ZjRPb3ZMQkNmbWIy?=
 =?utf-8?B?UjZwVlNrWitzdVZZNWFXQnlydGl1RlVrWkFHMmlwRGsxbkRRZVd4bTk1d3py?=
 =?utf-8?B?K1hHdTBSNnlJT0RoKzd4OERqTmx3bkdmcGxsdHcvcEUwNlBTMHJpWVdIamtZ?=
 =?utf-8?B?cmI3OG8rbWE2bnhkbU9vRmNQRklDaHpMbnVNU0pRZTc5OFZ0d3pxb1V5U1k4?=
 =?utf-8?B?aHVzRzVSdnBWU2IzNTY5VUMzYSt3VmxndzVwQ2hCVU5xWlI1Yk1tSnUwbWRI?=
 =?utf-8?B?UmpRMThCbm84MStTYVdJeFF1NkNkRjdnWVE3Vk9IVUhNdTQzVEdyMk9IaFAy?=
 =?utf-8?B?R3kzNkhycnZLTU5VbiszNG4xa25TaW5WY0VRdjIzYnpncHUzUmIzUitQTklT?=
 =?utf-8?B?TklwYmMwYTFxR3pxcXQyVXJITTk4QVpUWEEwTWx5YnI0Zlh3RW5uTFNRdmhK?=
 =?utf-8?B?NUxEYm1Ld2hqdGU2OEJQV2NWd2ljNzJQcmd1dXAybnFwTzZYaDFwdEFRNGlY?=
 =?utf-8?B?V1BvdW1KNXhnSUpkVkkvUFM2RzB2V3N0eFhZWHZxcE13RjNiQTkyWlhZRzVy?=
 =?utf-8?B?elQ2WGszalRvaE9MSFZ5SXZSWDRqWWR0ck5aSWFLaGwvbkNKenZLWjRWcTZu?=
 =?utf-8?B?aU1ieWhJc0NtamhLRXZhWGlNNXBralY2ci9KczlwclB3Ly9Ja0NNc1VmWnVJ?=
 =?utf-8?B?OW0vWVFvdzNuTFBzY2FSNzRrYW44blJsQS9reXZnTnU3YWNyLzJicXJTY28z?=
 =?utf-8?B?Y2lGNXBYck45clVDeWVubTl1aDZkSWJKdkMrRytscVcxL2JOYTZzSlZqa1hY?=
 =?utf-8?B?RFphcERFbHF4VDdRek9jQlArVDFGTVhXWld5eDI4Z3hteWpDRFNNbGlnd3Rj?=
 =?utf-8?B?MDVQQW04V3lCU1k3REhwWVZKN0E0UVFoSTEyQTZGMitKVTdyd1ROSG1GSlJo?=
 =?utf-8?B?RndPc3I4NjNnekN4Y0pLT1VYTmVyU2U1WE5IWHc1VjRNMGxwRVBGalptZ1lE?=
 =?utf-8?B?Vk55aFhTNTlIV1dPN21sSnU4dDRVd2Z1OVBENHBaT1BLS0M3dmZ6eHpLdmRG?=
 =?utf-8?B?UlZZVmg0Ry9KZDR6NCtkVUlrcU5EbjROZTlVUFQrQmlrR1k3akFLbU1MM1Vz?=
 =?utf-8?B?UVQ3SVJKaEN2TmFDVkNodCtha0NkcTZ6c1ZUQlNicUdUVU0yaitCSGFESFJW?=
 =?utf-8?B?ak1QNytYNlYrRFJqb1B0YjlmOXFoMGhVT2lneC9KTU5YNXc2Z1RoRnc0clh5?=
 =?utf-8?B?Z3ZpVlgwb1RLRytzRDc3aWZqRGdwM2lEbUxZL3lKdCttamxKMDh5Ri9ybnJK?=
 =?utf-8?B?aDZ5eUEzdDB3aDdBRm81cXhBemZ5NkE1VzlTTm43UTIyMS9uc0VEOGZJQld0?=
 =?utf-8?B?eHpTdHdORG1nS2RXV3ZVcUxLMmx2WncwNUtpdUJzQktvbEFaeVZJd01iVG9l?=
 =?utf-8?B?ZnVrSWFTenBrOEsyWmRhTy9YMk5QWlprM2JPT1d4UVA5ZytscHlFcUZ3RjNH?=
 =?utf-8?B?SUpKQS9jVXdUaGU0Z1ovZmpJdTFFRmg4bTBBVm9TMk02NDZXZGk2NEhJT1VZ?=
 =?utf-8?Q?2CJwVq32OYsQ6K36Cndp4ORbZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afe00f2-5eab-4e9b-e0ba-08dd8da29d30
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:06:11.9619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTfAiZ1Y/lF9DBO4Zsi/5rKjtirejesgW4PIA6wij2alSBWNYqJzak9eSf1TBaaaSMzX9yABJtO/vIjoIUzmDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415

Hi Ilpo,

On 5/6/2025 9:00 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 5 May 2025, Pratap Nirujogi wrote:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v11 -> v12:
>>
>> * Add missing space before the open parenthesis '('
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 280 ++++++++++++++++++++++++++++
>>   3 files changed, 292 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..152a68a470e8 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI
>> +     help
>> +       Platform driver for AMD platforms containing image signal processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..1520ebb94507
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,280 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     struct mutex lock; /* protects i2c client creation */
> 
> Please add one tab before the comment such that it moves a bit more right.
> 
sure, will take care of it in next v13 patch.

>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     guard(mutex)(&ov05c10->lock);
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp i2c_client\n", i2c_dev);
>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +
>> +             scoped_guard(mutex, &ov05c10->lock) {
>> +                     if (ov05c10->i2c_dev == client) {
>> +                             dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                             ov05c10->i2c_dev = NULL;
>> +                     }
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(struct device *dev)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     int ret;
>> +
>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     ret = devm_mutex_init(dev, &isp_ov05c10->lock);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.dev_name = "ov05c10";
>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
> 
> There's some clever VA_ARGS magic in the strscpy() macro such that the
> size parameter is optional in many cases. Thus, in cases where the size
> parameter is the same as the size of the dst known to the compiler, please
> only provide dst and src to strscpy().
> 
Thanks, good to know size parameter can be optional when src and dst 
sizes are same. Will remove size param in v13.

Thanks,
Pratap

> --
>   i.
> 
>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>> +
>> +     ret = software_node_register_node_group(ov05c10_nodes);
>> +     if (ret)
>> +             return ERR_PTR(ret);
>> +
>> +     isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
>> +
>> +     return isp_ov05c10;
>> +}
>> +
>> +static int try_to_instantiate_i2c_client(struct device *dev, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>> +
>> +     if (!ov05c10 || !adap)
>> +             return 0;
>> +     if (!adap->owner)
>> +             return 0;
>> +
>> +     if (is_isp_i2c_adapter(adap))
>> +             instantiate_isp_i2c_client(ov05c10, adap);
>> +
>> +     return 0;
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare AMD ISP platform fwnode\n");
>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     /* check if adapter is already registered and create i2c client instance */
>> +     i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return 0;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group(ov05c10_nodes);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
>>

