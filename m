Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD52253E4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744199676; cv=fail; b=USjRQM2kNobqHciwOMa9Azf1bdrPt9DUnW8fPkzo8ww9pWNadZwV4cUhPKQL8qAU26PC1Rx8MTwHdYbfPgMXrULR8Bxfx1PHPq9pSw+KO5USnOMLq3he3wFna9zZ/i5rFhFSVOnTWhyxYYt7vJyGw1Tqr1RXCfB1BZ3HlIt6KfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744199676; c=relaxed/simple;
	bh=xwTnpZMnse6dQwHkfBdAHLB8wB99PTr3Osbj/uSS/0s=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EpM0gl+5Ry5lAS4ZZTJniB9VSwr1qC/k3odYVq4I3kvOvRacHAYWKqg4q5PtVFID+smr7z0Z+/SHgIZmIGnVSNMWlKg3vsrAXMDqAfIsr/5Vzi/0yrrd1uZE4M+m8284wMFtslnsH5oMdNIYCV7KfXDbDhDNrZM404kP3T677f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0wj8HxrO; arc=fail smtp.client-ip=40.107.236.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0wj8HxrO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=df16rqVQ9K3AYPBPviufOyV23TjPaZ8VzIKe3DxmE2J7uzLiGCurD/A6zNZfLdBf4A2vViY5GFGZHXT3d0KlDpdYk4tEzv/tqqVIHUHCDSYEKxI1I0i5wXT5/2oLo9WleD8gVI9W1wKv1bso6C0tz41HwLbZ0JR88inHf3ahXE+80HBZmaFE1X8FFV3S3nT1QsAPJx6JIYMfHVv2UGs+unulO8dTB4m9kt1qbQB3tEZC1ODkzw47PGV6v+POX3wnmi+u+D8Kos7a+KNz6CORQK09a/TbU7OK14OFQDmS/WdtqqGoAoeFt9Nt221DJBv5/5xvJDzW4Sbbne2y6+YNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ejft4Lk8+1RmqYmyl+RRLYhYGmtZmVtOpHluJ/hVGA=;
 b=sDQgDYIuM9TdHrGm4OeR4VEExQxgO9sCC4udHIA6xM8b/Spm1rxR8qTz/JYJJzqmZ1XH76tuWU+2cxoqp3ILudok3OJWHMOCbg0fsAwoWr814C/uAue+S61jSABJoiDPxpRJfPg3nTNTUPtYnBJDITLihjC5wk2fK7eAo31PqhQzp3Uky7ZxkV63hdWXFLMY4iUBgCTxWbd+RSrFPWfo/dZSP5RxbgCrHtWIqYm+/MSg5tKzxE4DSx/aQ+yVSY1NM0eNsnLTrfXDQjDQZVT1fo+DUDfT78gvTm8H9gBwFB057DoXILRlz27NUZDnT0EETKazkLG9UDkT5TDWEKeIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ejft4Lk8+1RmqYmyl+RRLYhYGmtZmVtOpHluJ/hVGA=;
 b=0wj8HxrOdPyykj1BsX/cVWWg7hLu/+oQ49YrOhRZ7SBbv9Gk7BcsDPIucWYKNYO6bF25LVCtKycYSx08SYii5+FKYNxcnzsxQWnm/N8KA6oruugzy0LMPw/WYn/wUkd8GZWveui+CYKUmYc4F2fGjsqnM1g5fhGbgL8I3HPyHNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Wed, 9 Apr
 2025 11:54:31 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 11:54:31 +0000
Message-ID: <34a1c2bd-53f2-4f4f-9f5a-272f677eb9a3@amd.com>
Date: Wed, 9 Apr 2025 17:24:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [tip: x86/boot] x86/boot: Move the EFI mixed mode startup code
 back under arch/x86, into startup/
From: "Aithal, Srikanth" <sraithal@amd.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>, "H. Peter Anvin" <hpa@zytor.com>,
 Kees Cook <keescook@chromium.org>, x86@kernel.org
References: <20250401133416.1436741-11-ardb+git@google.com>
 <174396438105.31282.2243827952440371468.tip-bot2@tip-bot2>
 <6eb78989-efa6-4558-9637-9467560265cd@amd.com>
 <CAMj1kXHTQSfsr8m86zGZCp1cvp9_kOpOe6P1MjjjSh72HZ8PSg@mail.gmail.com>
 <8bc0a2a5-a486-4a4d-83e6-45b6c00685ea@amd.com>
Content-Language: en-US
In-Reply-To: <8bc0a2a5-a486-4a4d-83e6-45b6c00685ea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::13) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|CH2PR12MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: 38fa51ea-fc2d-4ced-bc37-08dd775d49d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHRhUjU2cEcxZWpMNlRKNWVsT2ZoSXRjNDZsY2prVjM4MXZhclNSYmZEdyto?=
 =?utf-8?B?QzNiN1hnWFQyQmU4U0EzQUFaUGYwdlI3Tk12RktZanN3MFRwcG1rTEJtK2c1?=
 =?utf-8?B?Tnd5OCtrUjRWQ0F6UVRjMnk3SEVVZkJLREdsZyt4MTdueTNld2NHT3pqS0Vr?=
 =?utf-8?B?QVN6SzFVVERhZDllM3ZIRkROUVFETENTSzhTZ2xMTVpPY0pyZ0hScTRrZi9k?=
 =?utf-8?B?OEJmS3RNNUpuakFUM0xOaVFWNjRNMUloYXNYemx3eXdtQVJTOVZvSisrK0k5?=
 =?utf-8?B?dXBQNGJGbFA5ektzcjdoakNjS0RUemFOdnlaN0M3R1RHNUdpQTU5N1AxMXJk?=
 =?utf-8?B?TWVDcVhOY0xHRjJWT2dUcFZBT1NURVQyVXRHQ2pPeGozU1J0YWtLdURzdis5?=
 =?utf-8?B?MWd1M0cwVllqYzBjcGxYNXRJOE5WWVRvNW1oWWhUekV1LzgwcUV2V1M2SGlz?=
 =?utf-8?B?TEVibkp3V3FLUUZWMHFseUF3QnYwbXFoRlpXOHdKMXFVR1FJbVNUY3lEdUlh?=
 =?utf-8?B?K0RWNW8raVhiWVVMY0xKcml1d213Ry8rbnVocXdFRDl4L0pSQTlZcXR1N3Rl?=
 =?utf-8?B?dXhINEZPdThxbnhUeVNDUXJ5VkhhK3BlU3BPSGRIRERqalprcU9iTHM5Z3Ry?=
 =?utf-8?B?OGFnNFJ3aWdXNlNuNEpxUUJBY3pLVngwUVB2akVWSUNwaFBUQnJmUnI4NWUx?=
 =?utf-8?B?RG9FQmgrcXczZW9jVUhRaWV6MVQvWmQ1ZE9QQlNXbDdBSDZnUGRGcmF1YWV0?=
 =?utf-8?B?V1M5RTBZTjZjVFN2aldzUzkveHhkUlFKN3ZrUjM4YkRhSDdLd1J5V3FudnVO?=
 =?utf-8?B?UmgvV3FMQWc2RHFDK1NFaXJaMWFIbGlhMjBXOTlnNjRpaGRVNlIxY3ErRUJC?=
 =?utf-8?B?SE1HNDA1ek9TcS9yZDRnNWhIYkN2dkZXUTBUanlMTXdTY3dLQXBNYzBmUHZi?=
 =?utf-8?B?dmlHUU8xRGFManFvcXM5KzNxUHhYVTdWc1VTRmJVaUdjVXJ0c0lJK0c2aVNn?=
 =?utf-8?B?YjFxOXNMd1F2OXRwUTk2eTZ5WVQxeGFWbUFtNmVzcnpxVmoyeCtOcDIzVkRN?=
 =?utf-8?B?ajBuWGFCeWJvRXdadkM4V3FYbTFEbW11U0crNFhsSEw5ZlNqdVhBU0toeElG?=
 =?utf-8?B?a0ZzdGRhOFE5aEdFeWZkYTdxS0xLTG9lVDJ6N0pGRlJZY3FIOUVVUjYyNWxz?=
 =?utf-8?B?SzhVWDBpdzk4Y25tZE4vVkRoL3NxOVUrS1YxaG9KRUZvbDU2N0hWMVFld01H?=
 =?utf-8?B?eDZMbTN3NC94OEpGRjJtSW5FVUd4eGxYajZ3cVVubk1Zc1o5cWlvVU9KSURp?=
 =?utf-8?B?bG8vZEJRWi9EYWpKKzNoVVE4ZVJBemkyMlhiOG1BckNZT0JySWlBWVcyaURF?=
 =?utf-8?B?R1dZakxGdVJvVXVWTnNIQm9BenZ1emo5Uk83UVN5dWFzTy8rNVdXei9RUlBY?=
 =?utf-8?B?R1djZnVmeWJ1RjQ2Tms1Vk1iSXRmaWNaUWMvdnNhVG41cS9aQUw3b3dOMTBR?=
 =?utf-8?B?OC9DL0pMQTJhQTBvYUpGQkRkY0ZZS3hQNndmRkx6a2dHNEFvVWdWdG1zS2lU?=
 =?utf-8?B?RGdKelk0ajNxdzIvTjdrcEFIS0loTHpJU09iMDBKMHNicWdGVXVCMVMveFVC?=
 =?utf-8?B?dGYrdDNGS3dHM09PamdsWjY0NHdXZHRxd2ZzeGc1LzljWnVEQVBqNE5EcWw5?=
 =?utf-8?B?OExYaE44Vy9TZ1dlbjAxT00xMm1TMUhoa3RnN29NS0t2RzVpNmg4c1Nmb04w?=
 =?utf-8?B?S2F4a2lqQU56dDJrb1VTQVltQkR3RTh0cmZUNjNLY3NYSlZ4bXhZOHZ6UW03?=
 =?utf-8?B?M0JrTjJtQ0p0NDA3VTl2QXhQUW1VVmpoeW5lSVV2cStXQ0laRzJqVitaZWRB?=
 =?utf-8?Q?4PFaRF8DxIw5O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEQxMmg2L1cxS3V2d05VWDUwZUFEK25FR0JEY1prMjZRUFJYSXVNNlNGVktn?=
 =?utf-8?B?ZXJQYWpOamFhK2MxYlBLN1E3VU00NkdrUWIra0RsOFBOcnlIMjIrZWhzZU5w?=
 =?utf-8?B?SE9COE9TYUFMK2JQeStnMGZPZFViQnYzY25iTjRvOEg1UC9OVkF2ajdCazhC?=
 =?utf-8?B?M1pldnRtUzhGa0Q3SzJwU2FFdnovRVY1cE5wTW4rOGtMQnBpcU0wOE9PTFdK?=
 =?utf-8?B?djhTOEl2KzBMZ3NrY1plOHJ6cTYySVN3a1I5TXNWTGdoSDZDQytDc1ZPOGVD?=
 =?utf-8?B?QTRCU2tncGJJb2Y3L3dOcjdhTUxRRHRqWTFYQXdXejBFYVVZS1VKdElqTkJ6?=
 =?utf-8?B?OWZaT09tUkJ1L1FNWUVMS0JYb3kzUjJ4NVB4ajdXUUhRbUYydDVkU1NXZmJN?=
 =?utf-8?B?QlcvdCtHbVV5VDlQZEJyNHhpdC9wRTNuV2RsQ21yWXVHbU84bFFhZ05WRUxz?=
 =?utf-8?B?YmFETkhZMHoyTnZOZUdpNXBjeXM1NXk1cVBqRlRNMktLOU92YkR0U0JTQWI4?=
 =?utf-8?B?L0xPc1BiYzJld2piREdwRHBaQjVoYkVDc1l0eEhONDJiZElKb0lKQTFlWERq?=
 =?utf-8?B?M2dKbUdsQnpjSVgyU0k1NnAwd2J3eTJsVFFMQjBVcHBZSzZyVk80NTJEeUdQ?=
 =?utf-8?B?OFhpeVkrcmJEMkdLWndtU3ZrcUtYbFlqTmVhbU1ueThCQ3RHanRYR1lwclBF?=
 =?utf-8?B?S3RHQWlpZTZKaTNUL05kcktSVG9wNm9QQTZlN0M3ODdqWHdxa0VMM2JNMEQ5?=
 =?utf-8?B?U3J0dXJrZWUzSG52UnVUS0ZaVG1LSTd2azk4bWVJeUtzSkFNazJuYnAvdUtS?=
 =?utf-8?B?MzVqVzJyMUVwT2R0c2xvM1I3aU9CL0Q2aS81OTNUbjI4NkVONzZ3R0JVb0Mw?=
 =?utf-8?B?cGNhM0I2WGZ2NCtDcHFNK2QxeHZmR2VPakgxVmN2aEo5RGltbEUzcVlubkRW?=
 =?utf-8?B?L3E2L1MwYmtHNkF1Z0p2VWVreUp2K1VoODAveFMzY1RuY1o2bWlBSk1oQjhC?=
 =?utf-8?B?VUM3SmwwYlphZS9vOXBYc0YrSXRTMGNvMWtiQ2FpZCtzbDUvYytjTldXckd2?=
 =?utf-8?B?V1ZPcjdYQlFzbW03MEhTUnFtWHNCMVFEV29pTDBiejJkY0FhTjlZUlJVUHcw?=
 =?utf-8?B?SVpEemhrdlIxaG8vcFBuOWo4N09OT2JZRWZJMjlMYVlFVVdiUWpCdEt5Z29x?=
 =?utf-8?B?VmZ4SG15WVdtUWxlVjQ2ZXNicTZjOWVweVZZM21qVUZ2Tk9LNVpCZDQ2VGcz?=
 =?utf-8?B?VHpvaWxCd0V5OHJhbGdXbDVONE95WTVoS1hKYnE5QzBjZW1OYU9DT0NOMk1r?=
 =?utf-8?B?eGtlUHdVTzBXZGYvSGZHekhHS2pFcFc2QzFMYTBVSFVpUFZnN2tSK3A5b0xi?=
 =?utf-8?B?MVZxOUladXFRcU4rMlpIcm56c0lSVWdybWw0eXRRdTU4cjRTR1NnR3Z0a3RO?=
 =?utf-8?B?bGcyU2FhdFJSNTBuVCtrbGE3YWlmTkFwRG05RXp1ZW5YTlJTQndiaVhFR3Iy?=
 =?utf-8?B?VWFyeEJNZlZybmJuZW05Ti9ZZHNFMDkrWTM0eWM3RkhINFBIVlZmRjhUVS9U?=
 =?utf-8?B?WkVFWUFuaUU0c29uc0d6S2JPektyZitPY0VOeHplZlRsTU0vRU94NXFRVlRu?=
 =?utf-8?B?ZEpQUk1UQm9VeGhrUGpyWkppdmI0ZGFMTWJNdm42QTY2NmV1a2tsREk0MFlj?=
 =?utf-8?B?Y0d6cWhSMVhzalY1UmZtRUpKYkxMV2VjTFlIdWRIVlFBRXRUQXY1VHhXWEFS?=
 =?utf-8?B?akppVHVlaG5CclFONFdST1d3dEpnTVlldmVnZS9FL0VHVVR5aUwrYlBibmta?=
 =?utf-8?B?WUx5OFVPb2o1MHR4b0VZeVlwbVg2OCswRGhVd0JWK1RyQ1VOZjRJWHJkN0ow?=
 =?utf-8?B?TlJoMk1iRkZpQitXa1gvT1dTaE56ZTQwQi9XWHl6ZFRZelR0ZzNpd285elFI?=
 =?utf-8?B?K0xkLzBTcVJXVDg5YlFEZU95UXZVaVE1QkZFeGIxa3NMNnFqVTY1TmJaaUNa?=
 =?utf-8?B?Rk5OcUVXdUQ5a3RGbTBIbFB5YU1mdWxMYlkxamxMMGx5dVFGS0prcXBWMHdS?=
 =?utf-8?B?RnI0RkRyeEN1MDhWWkQyLzJyUzdSZGJXK0M4WWRONXhHbFh0M09uS2xtV29S?=
 =?utf-8?Q?BCSzpcXSLHYqKrEuc/xL7LKjf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fa51ea-fc2d-4ced-bc37-08dd775d49d8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:54:31.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1WEAyBPpiDxeH+g1K+u5TaMTIIjbb71TrNmvuVCt0ckCG4roMaImMVufGolQMh9lxLO2JsQI91oiKT42brtHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494



On 4/7/2025 3:11 PM, Aithal, Srikanth wrote:
> On 4/7/2025 2:00 PM, Ard Biesheuvel wrote:
>> On Mon, 7 Apr 2025 at 10:38, Aithal, Srikanth <sraithal@amd.com> wrote:
>>>
>>> Hello,
>>>
>>> This commit breaks the build of next-20250407. The kernel config is
>>> attached here.
>>>
>>> Build error:
>>>
>>> arch/x86/boot/startup/efi-mixed.o: warning: objtool:
>>> efi32_stub_entry+0x0: unannotated intra-function call
>>> make[3]: *** [scripts/Makefile.build:335:
>>> arch/x86/boot/startup/efi-mixed.o] Error 255
>>> make[3]: *** Deleting file 'arch/x86/boot/startup/efi-mixed.o'
>>> make[3]: *** Waiting for unfinished jobs....
>>> make[2]: *** [scripts/Makefile.build:461: arch/x86/boot/startup] Error 2
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [/home/VT_BUILD/linux/Makefile:2006: .] Error 2
>>> make: *** [Makefile:248: __sub-make] Error 2
>>>
>>>
>>
>> Apologies for the breakage.
>>
>> Does it help to add the following to arch/x86/boot/startup/Makefile:
>>
>> OBJECT_FILES_NON_STANDARD := y
>>
>> ?



If the above is the solution, could you please let me know how soon it 
might be included in the linux-next build?


> 
> yes, this fixes the issue.
> 
> Reported-by: Srikanth Aithal <sraithal@amd.com>
> Tested-by: Srikanth Aithal <sraithal@amd.com>
> 
>>
>>>
>>> Thanks,
>>> Srikanth Aithal <sraithal@amd.com>
>>>
>>>
>>> On 4/7/2025 12:03 AM, tip-bot2 for Ard Biesheuvel wrote:
>>>> The following commit has been merged into the x86/boot branch of tip:
>>>>
>>>> Commit-ID:     4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
>>>> Gitweb:        https://git.kernel.org/ 
>>>> tip/4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
>>>> Author:        Ard Biesheuvel <ardb@kernel.org>
>>>> AuthorDate:    Tue, 01 Apr 2025 15:34:20 +02:00
>>>> Committer:     Ingo Molnar <mingo@kernel.org>
>>>> CommitterDate: Sun, 06 Apr 2025 20:15:14 +02:00
>>>>
>>>> x86/boot: Move the EFI mixed mode startup code back under arch/x86, 
>>>> into startup/
>>>>
>>>> Linus expressed a strong preference for arch-specific asm code (i.e.,
>>>> virtually all of it) to reside under arch/ rather than anywhere else.
>>>>
>>>> So move the EFI mixed mode startup code back, and put it under
>>>> arch/x86/boot/startup/ where all shared x86 startup code is going to
>>>> live.
>>>>
>>>> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>> Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>>> Cc: David Woodhouse <dwmw@amazon.co.uk>
>>>> Cc: H. Peter Anvin <hpa@zytor.com>
>>>> Cc: Kees Cook <keescook@chromium.org>
>>>> Link: https://lore.kernel.org/r/20250401133416.1436741-11- 
>>>> ardb+git@google.com
>>>> ---
>>>>    arch/x86/boot/startup/Makefile           |   3 +-
>>>>    arch/x86/boot/startup/efi-mixed.S        | 253 ++++++++++++++++++ 
>>>> ++++-
>>>>    drivers/firmware/efi/libstub/Makefile    |   1 +-
>>>>    drivers/firmware/efi/libstub/x86-mixed.S | 253 
>>>> +----------------------
>>>>    4 files changed, 256 insertions(+), 254 deletions(-)
>>>>    create mode 100644 arch/x86/boot/startup/efi-mixed.S
>>>>    delete mode 100644 drivers/firmware/efi/libstub/x86-mixed.S
>>>>
>>>> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/ 
>>>> Makefile
>>>> index 03519ef..73946a3 100644
>>>> --- a/arch/x86/boot/startup/Makefile
>>>> +++ b/arch/x86/boot/startup/Makefile
>>>> @@ -1,3 +1,6 @@
>>>>    # SPDX-License-Identifier: GPL-2.0
>>>>
>>>> +KBUILD_AFLAGS                += -D__DISABLE_EXPORTS
>>>> +
>>>>    lib-$(CONFIG_X86_64)                += la57toggle.o
>>>> +lib-$(CONFIG_EFI_MIXED)              += efi-mixed.o
>>>> diff --git a/arch/x86/boot/startup/efi-mixed.S b/arch/x86/boot/ 
>>>> startup/efi-mixed.S
>>>> new file mode 100644
>>>> index 0000000..e04ed99
>>>> --- /dev/null
>>>> +++ b/arch/x86/boot/startup/efi-mixed.S
>>>> @@ -0,0 +1,253 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
>>>> + *
>>>> + * Early support for invoking 32-bit EFI services from a 64-bit 
>>>> kernel.
>>>> + *
>>>> + * Because this thunking occurs before ExitBootServices() we have to
>>>> + * restore the firmware's 32-bit GDT and IDT before we make EFI 
>>>> service
>>>> + * calls.
>>>> + *
>>>> + * On the plus side, we don't have to worry about mangling 64-bit
>>>> + * addresses into 32-bits because we're executing with an identity
>>>> + * mapped pagetable and haven't transitioned to 64-bit virtual 
>>>> addresses
>>>> + * yet.
>>>> + */
>>>> +
>>>> +#include <linux/linkage.h>
>>>> +#include <asm/desc_defs.h>
>>>> +#include <asm/msr.h>
>>>> +#include <asm/page_types.h>
>>>> +#include <asm/pgtable_types.h>
>>>> +#include <asm/processor-flags.h>
>>>> +#include <asm/segment.h>
>>>> +
>>>> +     .text
>>>> +     .code32
>>>> +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>>> +SYM_FUNC_START(efi32_stub_entry)
>>>> +     call    1f
>>>> +1:   popl    %ecx
>>>> +
>>>> +     /* Clear BSS */
>>>> +     xorl    %eax, %eax
>>>> +     leal    (_bss - 1b)(%ecx), %edi
>>>> +     leal    (_ebss - 1b)(%ecx), %ecx
>>>> +     subl    %edi, %ecx
>>>> +     shrl    $2, %ecx
>>>> +     cld
>>>> +     rep     stosl
>>>> +
>>>> +     add     $0x4, %esp              /* Discard return address */
>>>> +     movl    8(%esp), %ebx           /* struct boot_params pointer */
>>>> +     jmp     efi32_startup
>>>> +SYM_FUNC_END(efi32_stub_entry)
>>>> +#endif
>>>> +
>>>> +/*
>>>> + * Called using a far call from __efi64_thunk() below, using the 
>>>> x86_64 SysV
>>>> + * ABI (except for R8/R9 which are inaccessible to 32-bit code - 
>>>> EAX/EBX are
>>>> + * used instead).  EBP+16 points to the arguments passed via the 
>>>> stack.
>>>> + *
>>>> + * The first argument (EDI) is a pointer to the boot service or 
>>>> protocol, to
>>>> + * which the remaining arguments are passed, each truncated to 32 
>>>> bits.
>>>> + */
>>>> +SYM_FUNC_START_LOCAL(efi_enter32)
>>>> +     /*
>>>> +      * Convert x86-64 SysV ABI params to i386 ABI
>>>> +      */
>>>> +     pushl   32(%ebp)        /* Up to 3 args passed via the stack */
>>>> +     pushl   24(%ebp)
>>>> +     pushl   16(%ebp)
>>>> +     pushl   %ebx            /* R9 */
>>>> +     pushl   %eax            /* R8 */
>>>> +     pushl   %ecx
>>>> +     pushl   %edx
>>>> +     pushl   %esi
>>>> +
>>>> +     /* Disable paging */
>>>> +     movl    %cr0, %eax
>>>> +     btrl    $X86_CR0_PG_BIT, %eax
>>>> +     movl    %eax, %cr0
>>>> +
>>>> +     /* Disable long mode via EFER */
>>>> +     movl    $MSR_EFER, %ecx
>>>> +     rdmsr
>>>> +     btrl    $_EFER_LME, %eax
>>>> +     wrmsr
>>>> +
>>>> +     call    *%edi
>>>> +
>>>> +     /* We must preserve return value */
>>>> +     movl    %eax, %edi
>>>> +
>>>> +     call    efi32_enable_long_mode
>>>> +
>>>> +     addl    $32, %esp
>>>> +     movl    %edi, %eax
>>>> +     lret
>>>> +SYM_FUNC_END(efi_enter32)
>>>> +
>>>> +     .code64
>>>> +SYM_FUNC_START(__efi64_thunk)
>>>> +     push    %rbp
>>>> +     movl    %esp, %ebp
>>>> +     push    %rbx
>>>> +
>>>> +     /* Move args #5 and #6 into 32-bit accessible registers */
>>>> +     movl    %r8d, %eax
>>>> +     movl    %r9d, %ebx
>>>> +
>>>> +     lcalll  *efi32_call(%rip)
>>>> +
>>>> +     pop     %rbx
>>>> +     pop     %rbp
>>>> +     RET
>>>> +SYM_FUNC_END(__efi64_thunk)
>>>> +
>>>> +     .code32
>>>> +SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
>>>> +     movl    %cr4, %eax
>>>> +     btsl    $(X86_CR4_PAE_BIT), %eax
>>>> +     movl    %eax, %cr4
>>>> +
>>>> +     movl    $MSR_EFER, %ecx
>>>> +     rdmsr
>>>> +     btsl    $_EFER_LME, %eax
>>>> +     wrmsr
>>>> +
>>>> +     /* Disable interrupts - the firmware's IDT does not work in 
>>>> long mode */
>>>> +     cli
>>>> +
>>>> +     /* Enable paging */
>>>> +     movl    %cr0, %eax
>>>> +     btsl    $X86_CR0_PG_BIT, %eax
>>>> +     movl    %eax, %cr0
>>>> +     ret
>>>> +SYM_FUNC_END(efi32_enable_long_mode)
>>>> +
>>>> +/*
>>>> + * This is the common EFI stub entry point for mixed mode. It sets 
>>>> up the GDT
>>>> + * and page tables needed for 64-bit execution, after which it 
>>>> calls the
>>>> + * common 64-bit EFI entrypoint efi_stub_entry().
>>>> + *
>>>> + * Arguments:        0(%esp) image handle
>>>> + *           4(%esp) EFI system table pointer
>>>> + *           %ebx    struct boot_params pointer (or NULL)
>>>> + *
>>>> + * Since this is the point of no return for ordinary execution, no 
>>>> registers
>>>> + * are considered live except for the function parameters. [Note 
>>>> that the EFI
>>>> + * stub may still exit and return to the firmware using the Exit() 
>>>> EFI boot
>>>> + * service.]
>>>> + */
>>>> +SYM_FUNC_START_LOCAL(efi32_startup)
>>>> +     movl    %esp, %ebp
>>>> +
>>>> +     subl    $8, %esp
>>>> +     sgdtl   (%esp)                  /* Save GDT descriptor to the 
>>>> stack */
>>>> +     movl    2(%esp), %esi           /* Existing GDT pointer */
>>>> +     movzwl  (%esp), %ecx            /* Existing GDT limit */
>>>> +     inc     %ecx                    /* Existing GDT size */
>>>> +     andl    $~7, %ecx               /* Ensure size is multiple of 
>>>> 8 */
>>>> +
>>>> +     subl    %ecx, %esp              /* Allocate new GDT */
>>>> +     andl    $~15, %esp              /* Realign the stack */
>>>> +     movl    %esp, %edi              /* New GDT address */
>>>> +     leal    7(%ecx), %eax           /* New GDT limit */
>>>> +     pushw   %cx                     /* Push 64-bit CS (for LJMP 
>>>> below) */
>>>> +     pushl   %edi                    /* Push new GDT address */
>>>> +     pushw   %ax                     /* Push new GDT limit */
>>>> +
>>>> +     /* Copy GDT to the stack and add a 64-bit code segment at the 
>>>> end */
>>>> +     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, 
>>>> (%edi,%ecx)
>>>> +     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
>>>> +     shrl    $2, %ecx
>>>> +     cld
>>>> +     rep     movsl                   /* Copy the firmware GDT */
>>>> +     lgdtl   (%esp)                  /* Switch to the new GDT */
>>>> +
>>>> +     call    1f
>>>> +1:   pop     %edi
>>>> +
>>>> +     /* Record mixed mode entry */
>>>> +     movb    $0x0, (efi_is64 - 1b)(%edi)
>>>> +
>>>> +     /* Set up indirect far call to re-enter 32-bit mode */
>>>> +     leal    (efi32_call - 1b)(%edi), %eax
>>>> +     addl    %eax, (%eax)
>>>> +     movw    %cs, 4(%eax)
>>>> +
>>>> +     /* Disable paging */
>>>> +     movl    %cr0, %eax
>>>> +     btrl    $X86_CR0_PG_BIT, %eax
>>>> +     movl    %eax, %cr0
>>>> +
>>>> +     /* Set up 1:1 mapping */
>>>> +     leal    (pte - 1b)(%edi), %eax
>>>> +     movl    $_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
>>>> +     leal    (_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
>>>> +2:   movl    %ecx, (%eax)
>>>> +     addl    $8, %eax
>>>> +     addl    $PMD_SIZE, %ecx
>>>> +     jnc     2b
>>>> +
>>>> +     movl    $PAGE_SIZE, %ecx
>>>> +     .irpc   l, 0123
>>>> +     movl    %edx, \l * 8(%eax)
>>>> +     addl    %ecx, %edx
>>>> +     .endr
>>>> +     addl    %ecx, %eax
>>>> +     movl    %edx, (%eax)
>>>> +     movl    %eax, %cr3
>>>> +
>>>> +     call    efi32_enable_long_mode
>>>> +
>>>> +     /* Set up far jump to 64-bit mode (CS is already on the stack) */
>>>> +     leal    (efi_stub_entry - 1b)(%edi), %eax
>>>> +     movl    %eax, 2(%esp)
>>>> +
>>>> +     movl    0(%ebp), %edi
>>>> +     movl    4(%ebp), %esi
>>>> +     movl    %ebx, %edx
>>>> +     ljmpl   *2(%esp)
>>>> +SYM_FUNC_END(efi32_startup)
>>>> +
>>>> +/*
>>>> + * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
>>>> + *                          efi_system_table_32_t *sys_table)
>>>> + */
>>>> +SYM_FUNC_START(efi32_pe_entry)
>>>> +     pushl   %ebx                            // save callee-save 
>>>> registers
>>>> +
>>>> +     /* Check whether the CPU supports long mode */
>>>> +     movl    $0x80000001, %eax               // assume extended 
>>>> info support
>>>> +     cpuid
>>>> +     btl     $29, %edx                       // check long mode bit
>>>> +     jnc     1f
>>>> +     leal    8(%esp), %esp                   // preserve stack 
>>>> alignment
>>>> +     xor     %ebx, %ebx                      // no struct 
>>>> boot_params pointer
>>>> +     jmp     efi32_startup                   // only ESP and EBX 
>>>> remain live
>>>> +1:   movl    $0x80000003, %eax               // EFI_UNSUPPORTED
>>>> +     popl    %ebx
>>>> +     RET
>>>> +SYM_FUNC_END(efi32_pe_entry)
>>>> +
>>>> +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>>> +     .org    efi32_stub_entry + 0x200
>>>> +     .code64
>>>> +SYM_FUNC_START_NOALIGN(efi64_stub_entry)
>>>> +     jmp     efi_handover_entry
>>>> +SYM_FUNC_END(efi64_stub_entry)
>>>> +#endif
>>>> +
>>>> +     .data
>>>> +     .balign 8
>>>> +SYM_DATA_START_LOCAL(efi32_call)
>>>> +     .long   efi_enter32 - .
>>>> +     .word   0x0
>>>> +SYM_DATA_END(efi32_call)
>>>> +SYM_DATA(efi_is64, .byte 1)
>>>> +
>>>> +     .bss
>>>> +     .balign PAGE_SIZE
>>>> +SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)
>>>> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/ 
>>>> firmware/efi/libstub/Makefile
>>>> index d23a1b9..2f17339 100644
>>>> --- a/drivers/firmware/efi/libstub/Makefile
>>>> +++ b/drivers/firmware/efi/libstub/Makefile
>>>> @@ -85,7 +85,6 @@ lib-$(CONFIG_EFI_GENERIC_STUB)      += efi-stub.o 
>>>> string.o intrinsics.o systable.o \
>>>>    lib-$(CONFIG_ARM)           += arm32-stub.o
>>>>    lib-$(CONFIG_ARM64)         += kaslr.o arm64.o arm64-stub.o smbios.o
>>>>    lib-$(CONFIG_X86)           += x86-stub.o smbios.o
>>>> -lib-$(CONFIG_EFI_MIXED)              += x86-mixed.o
>>>>    lib-$(CONFIG_X86_64)                += x86-5lvl.o
>>>>    lib-$(CONFIG_RISCV)         += kaslr.o riscv.o riscv-stub.o
>>>>    lib-$(CONFIG_LOONGARCH)             += loongarch.o loongarch-stub.o
>>>> diff --git a/drivers/firmware/efi/libstub/x86-mixed.S b/drivers/ 
>>>> firmware/efi/libstub/x86-mixed.S
>>>> deleted file mode 100644
>>>> index e04ed99..0000000
>>>> --- a/drivers/firmware/efi/libstub/x86-mixed.S
>>>> +++ /dev/null
>>>> @@ -1,253 +0,0 @@
>>>> -/* SPDX-License-Identifier: GPL-2.0 */
>>>> -/*
>>>> - * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
>>>> - *
>>>> - * Early support for invoking 32-bit EFI services from a 64-bit 
>>>> kernel.
>>>> - *
>>>> - * Because this thunking occurs before ExitBootServices() we have to
>>>> - * restore the firmware's 32-bit GDT and IDT before we make EFI 
>>>> service
>>>> - * calls.
>>>> - *
>>>> - * On the plus side, we don't have to worry about mangling 64-bit
>>>> - * addresses into 32-bits because we're executing with an identity
>>>> - * mapped pagetable and haven't transitioned to 64-bit virtual 
>>>> addresses
>>>> - * yet.
>>>> - */
>>>> -
>>>> -#include <linux/linkage.h>
>>>> -#include <asm/desc_defs.h>
>>>> -#include <asm/msr.h>
>>>> -#include <asm/page_types.h>
>>>> -#include <asm/pgtable_types.h>
>>>> -#include <asm/processor-flags.h>
>>>> -#include <asm/segment.h>
>>>> -
>>>> -     .text
>>>> -     .code32
>>>> -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>>> -SYM_FUNC_START(efi32_stub_entry)
>>>> -     call    1f
>>>> -1:   popl    %ecx
>>>> -
>>>> -     /* Clear BSS */
>>>> -     xorl    %eax, %eax
>>>> -     leal    (_bss - 1b)(%ecx), %edi
>>>> -     leal    (_ebss - 1b)(%ecx), %ecx
>>>> -     subl    %edi, %ecx
>>>> -     shrl    $2, %ecx
>>>> -     cld
>>>> -     rep     stosl
>>>> -
>>>> -     add     $0x4, %esp              /* Discard return address */
>>>> -     movl    8(%esp), %ebx           /* struct boot_params pointer */
>>>> -     jmp     efi32_startup
>>>> -SYM_FUNC_END(efi32_stub_entry)
>>>> -#endif
>>>> -
>>>> -/*
>>>> - * Called using a far call from __efi64_thunk() below, using the 
>>>> x86_64 SysV
>>>> - * ABI (except for R8/R9 which are inaccessible to 32-bit code - 
>>>> EAX/EBX are
>>>> - * used instead).  EBP+16 points to the arguments passed via the 
>>>> stack.
>>>> - *
>>>> - * The first argument (EDI) is a pointer to the boot service or 
>>>> protocol, to
>>>> - * which the remaining arguments are passed, each truncated to 32 
>>>> bits.
>>>> - */
>>>> -SYM_FUNC_START_LOCAL(efi_enter32)
>>>> -     /*
>>>> -      * Convert x86-64 SysV ABI params to i386 ABI
>>>> -      */
>>>> -     pushl   32(%ebp)        /* Up to 3 args passed via the stack */
>>>> -     pushl   24(%ebp)
>>>> -     pushl   16(%ebp)
>>>> -     pushl   %ebx            /* R9 */
>>>> -     pushl   %eax            /* R8 */
>>>> -     pushl   %ecx
>>>> -     pushl   %edx
>>>> -     pushl   %esi
>>>> -
>>>> -     /* Disable paging */
>>>> -     movl    %cr0, %eax
>>>> -     btrl    $X86_CR0_PG_BIT, %eax
>>>> -     movl    %eax, %cr0
>>>> -
>>>> -     /* Disable long mode via EFER */
>>>> -     movl    $MSR_EFER, %ecx
>>>> -     rdmsr
>>>> -     btrl    $_EFER_LME, %eax
>>>> -     wrmsr
>>>> -
>>>> -     call    *%edi
>>>> -
>>>> -     /* We must preserve return value */
>>>> -     movl    %eax, %edi
>>>> -
>>>> -     call    efi32_enable_long_mode
>>>> -
>>>> -     addl    $32, %esp
>>>> -     movl    %edi, %eax
>>>> -     lret
>>>> -SYM_FUNC_END(efi_enter32)
>>>> -
>>>> -     .code64
>>>> -SYM_FUNC_START(__efi64_thunk)
>>>> -     push    %rbp
>>>> -     movl    %esp, %ebp
>>>> -     push    %rbx
>>>> -
>>>> -     /* Move args #5 and #6 into 32-bit accessible registers */
>>>> -     movl    %r8d, %eax
>>>> -     movl    %r9d, %ebx
>>>> -
>>>> -     lcalll  *efi32_call(%rip)
>>>> -
>>>> -     pop     %rbx
>>>> -     pop     %rbp
>>>> -     RET
>>>> -SYM_FUNC_END(__efi64_thunk)
>>>> -
>>>> -     .code32
>>>> -SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
>>>> -     movl    %cr4, %eax
>>>> -     btsl    $(X86_CR4_PAE_BIT), %eax
>>>> -     movl    %eax, %cr4
>>>> -
>>>> -     movl    $MSR_EFER, %ecx
>>>> -     rdmsr
>>>> -     btsl    $_EFER_LME, %eax
>>>> -     wrmsr
>>>> -
>>>> -     /* Disable interrupts - the firmware's IDT does not work in 
>>>> long mode */
>>>> -     cli
>>>> -
>>>> -     /* Enable paging */
>>>> -     movl    %cr0, %eax
>>>> -     btsl    $X86_CR0_PG_BIT, %eax
>>>> -     movl    %eax, %cr0
>>>> -     ret
>>>> -SYM_FUNC_END(efi32_enable_long_mode)
>>>> -
>>>> -/*
>>>> - * This is the common EFI stub entry point for mixed mode. It sets 
>>>> up the GDT
>>>> - * and page tables needed for 64-bit execution, after which it 
>>>> calls the
>>>> - * common 64-bit EFI entrypoint efi_stub_entry().
>>>> - *
>>>> - * Arguments:        0(%esp) image handle
>>>> - *           4(%esp) EFI system table pointer
>>>> - *           %ebx    struct boot_params pointer (or NULL)
>>>> - *
>>>> - * Since this is the point of no return for ordinary execution, no 
>>>> registers
>>>> - * are considered live except for the function parameters. [Note 
>>>> that the EFI
>>>> - * stub may still exit and return to the firmware using the Exit() 
>>>> EFI boot
>>>> - * service.]
>>>> - */
>>>> -SYM_FUNC_START_LOCAL(efi32_startup)
>>>> -     movl    %esp, %ebp
>>>> -
>>>> -     subl    $8, %esp
>>>> -     sgdtl   (%esp)                  /* Save GDT descriptor to the 
>>>> stack */
>>>> -     movl    2(%esp), %esi           /* Existing GDT pointer */
>>>> -     movzwl  (%esp), %ecx            /* Existing GDT limit */
>>>> -     inc     %ecx                    /* Existing GDT size */
>>>> -     andl    $~7, %ecx               /* Ensure size is multiple of 
>>>> 8 */
>>>> -
>>>> -     subl    %ecx, %esp              /* Allocate new GDT */
>>>> -     andl    $~15, %esp              /* Realign the stack */
>>>> -     movl    %esp, %edi              /* New GDT address */
>>>> -     leal    7(%ecx), %eax           /* New GDT limit */
>>>> -     pushw   %cx                     /* Push 64-bit CS (for LJMP 
>>>> below) */
>>>> -     pushl   %edi                    /* Push new GDT address */
>>>> -     pushw   %ax                     /* Push new GDT limit */
>>>> -
>>>> -     /* Copy GDT to the stack and add a 64-bit code segment at the 
>>>> end */
>>>> -     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, 
>>>> (%edi,%ecx)
>>>> -     movl    $GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
>>>> -     shrl    $2, %ecx
>>>> -     cld
>>>> -     rep     movsl                   /* Copy the firmware GDT */
>>>> -     lgdtl   (%esp)                  /* Switch to the new GDT */
>>>> -
>>>> -     call    1f
>>>> -1:   pop     %edi
>>>> -
>>>> -     /* Record mixed mode entry */
>>>> -     movb    $0x0, (efi_is64 - 1b)(%edi)
>>>> -
>>>> -     /* Set up indirect far call to re-enter 32-bit mode */
>>>> -     leal    (efi32_call - 1b)(%edi), %eax
>>>> -     addl    %eax, (%eax)
>>>> -     movw    %cs, 4(%eax)
>>>> -
>>>> -     /* Disable paging */
>>>> -     movl    %cr0, %eax
>>>> -     btrl    $X86_CR0_PG_BIT, %eax
>>>> -     movl    %eax, %cr0
>>>> -
>>>> -     /* Set up 1:1 mapping */
>>>> -     leal    (pte - 1b)(%edi), %eax
>>>> -     movl    $_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
>>>> -     leal    (_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
>>>> -2:   movl    %ecx, (%eax)
>>>> -     addl    $8, %eax
>>>> -     addl    $PMD_SIZE, %ecx
>>>> -     jnc     2b
>>>> -
>>>> -     movl    $PAGE_SIZE, %ecx
>>>> -     .irpc   l, 0123
>>>> -     movl    %edx, \l * 8(%eax)
>>>> -     addl    %ecx, %edx
>>>> -     .endr
>>>> -     addl    %ecx, %eax
>>>> -     movl    %edx, (%eax)
>>>> -     movl    %eax, %cr3
>>>> -
>>>> -     call    efi32_enable_long_mode
>>>> -
>>>> -     /* Set up far jump to 64-bit mode (CS is already on the stack) */
>>>> -     leal    (efi_stub_entry - 1b)(%edi), %eax
>>>> -     movl    %eax, 2(%esp)
>>>> -
>>>> -     movl    0(%ebp), %edi
>>>> -     movl    4(%ebp), %esi
>>>> -     movl    %ebx, %edx
>>>> -     ljmpl   *2(%esp)
>>>> -SYM_FUNC_END(efi32_startup)
>>>> -
>>>> -/*
>>>> - * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
>>>> - *                          efi_system_table_32_t *sys_table)
>>>> - */
>>>> -SYM_FUNC_START(efi32_pe_entry)
>>>> -     pushl   %ebx                            // save callee-save 
>>>> registers
>>>> -
>>>> -     /* Check whether the CPU supports long mode */
>>>> -     movl    $0x80000001, %eax               // assume extended 
>>>> info support
>>>> -     cpuid
>>>> -     btl     $29, %edx                       // check long mode bit
>>>> -     jnc     1f
>>>> -     leal    8(%esp), %esp                   // preserve stack 
>>>> alignment
>>>> -     xor     %ebx, %ebx                      // no struct 
>>>> boot_params pointer
>>>> -     jmp     efi32_startup                   // only ESP and EBX 
>>>> remain live
>>>> -1:   movl    $0x80000003, %eax               // EFI_UNSUPPORTED
>>>> -     popl    %ebx
>>>> -     RET
>>>> -SYM_FUNC_END(efi32_pe_entry)
>>>> -
>>>> -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
>>>> -     .org    efi32_stub_entry + 0x200
>>>> -     .code64
>>>> -SYM_FUNC_START_NOALIGN(efi64_stub_entry)
>>>> -     jmp     efi_handover_entry
>>>> -SYM_FUNC_END(efi64_stub_entry)
>>>> -#endif
>>>> -
>>>> -     .data
>>>> -     .balign 8
>>>> -SYM_DATA_START_LOCAL(efi32_call)
>>>> -     .long   efi_enter32 - .
>>>> -     .word   0x0
>>>> -SYM_DATA_END(efi32_call)
>>>> -SYM_DATA(efi_is64, .byte 1)
>>>> -
>>>> -     .bss
>>>> -     .balign PAGE_SIZE
>>>> -SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)
> 

