Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA78265CD3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745395997; cv=fail; b=j+aanbmBj8i9BNxCejT1G5lEMOoOxoEQqSXfT6B/jLZuImzG3so7tCfQtxysXX4oSxBHId1Z0Pa5KXQJUwRbwgzBTD2AhydtZcVh6+fT1Mhxrk5fQVBv47lztVfwN4HCw5p8tsDHA+OIYiuFyfjvA2d48aB+fWJqTnviuD8CsOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745395997; c=relaxed/simple;
	bh=wldVVbpFN2/TheJgPooULT8fYRewr0b/Akpc+2Ff60A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pMtMyZV9s32KhiH9vSs+HmIrpPqMx/BLFRv1OAfkXOcLQGAMyXc7FkOaVi+vBEL9FuxQERh0aPUOTdEjX7N1Xl9WFgV/TCcunHsEcXnV/AJabiP6E6+BrO9NViJNWSBScNwaVRfjCfWxTm9Wa9TkRLon9JiNyuKSC/kzmgac2MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tD6+5E6A; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tD6+5E6A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auSIRbbfG3nkpe7YTzVcPTeZYgp05E1gvYq2xScRWKmDWLpNUxqMju7UoppsCoCKsES31awokcFB5jPn0VgJ2mhgtvdUHb+m+tLbOK7ArCrmDE4w4tDaV597ADOU5TNNn1MsjyIKqs0Uqsvy37DpQHEn2P1iqlN26QhqWCt9xqkD1wNwc8nSp6RGN7MDCqR6m1X7VUnObjjEFB131kVc9RsoMvQ5SG2O/bQRSHfqVmLg9u+E5dQd6aFrQfYl8DFEQJGXnVMaIaPvYmct0g6Ado8EWV0Fd8eRzneVFXcNACcBIpEfTbi1JfJIvVhKLq1zM4e9LhBHs2dSuf0Pc8ineA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbX9sqDXgI7dcYLPwyXd29ttqh9Ddg0t8gCqAHeN6VQ=;
 b=LCbTUeYsxr0vzlYv03OrC9mQeIOEY52j7NoEqTSUCO8i0dGpsnByF3pa47KKw5kLgkUwKx9YNhrokm6LBMy+ze+wSLh+egi29c+7ic2Ivxu5UfDWbrW0cgumP8cXc8dFAQ+HbU6/mQoGldgLcNZyeGe2/9OGPJQBHtA8W/zSTSEJvFqkAGVENK26U4ys1226TdsycHOe5NaQdncvH52nGvjL6LZlCVKiM6ItdjNuf3cD91xkdGyuh2tDAOUSBumkFs29229I2pmmzK8P+/rWG3f9sBdVpajD7VZwEIOxAWxAkpzecvLzfjCGlSBpBkx77TSK3xrMzQftPJ1260k3rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbX9sqDXgI7dcYLPwyXd29ttqh9Ddg0t8gCqAHeN6VQ=;
 b=tD6+5E6AnPpuXWZzeZQj2TctIfZicWaWerFloDnzB/TgP5WtAFm9+/HtWn/BcknincGJayDENa41EJmJbrMJGe/5UiRYdPUBG1d5qCa1sMCZgu6me2GsLiCN61atqalL5Si7B/KmqX3hJho1XhkYZxUw0HfHCw7IouTZvWNQUPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 08:13:08 +0000
Received: from PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3]) by PH7PR12MB5805.namprd12.prod.outlook.com
 ([fe80::11c7:4914:62f4:f4a3%4]) with mapi id 15.20.8655.025; Wed, 23 Apr 2025
 08:13:08 +0000
Message-ID: <b7423090-4504-4d68-878f-7ea4cde2af45@amd.com>
Date: Wed, 23 Apr 2025 13:42:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
 luto@kernel.org, peterz@infradead.org, paulmck@kernel.org,
 rostedt@goodmis.org, tglx@linutronix.de, willy@infradead.org,
 jon.grimm@amd.com, bharata@amd.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <0d6ba41c-0c90-4130-896a-26eabbd5bd24@amd.com> <87jz7cq9wh.fsf@oracle.com>
Content-Language: en-US
From: Raghavendra K T <raghavendra.kt@amd.com>
In-Reply-To: <87jz7cq9wh.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::11) To PH7PR12MB5805.namprd12.prod.outlook.com
 (2603:10b6:510:1d1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5805:EE_|IA0PR12MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 0abc4a0d-78e6-4bf1-b249-08dd823eae44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzFjT0tLSmZWM3o0TEVKNllIUGV6cHJlYTJjYm9mbVRUKzY4dzFhZXI1cVAx?=
 =?utf-8?B?SHBSLzJ4ODBVdXAvRWVyeUVQMjFlM0V6ZUswdTZONktLaVliREF2OTByS25J?=
 =?utf-8?B?R3hMWE1Vdk1QM0dyQTJ3SnQvaDUwamhUY0ptZkh3NnFNMGtDcmJUNURUL3Z5?=
 =?utf-8?B?emkzbDQwU2ZaNmFXQUhhK1lhNUcrMkR1eERHejVpbVBJVkh2S0F3dWdDYkNk?=
 =?utf-8?B?UmpZUjk3djMrRVZzVXYxY3JiTlZ2d09VZEVzeCsxaWRsNTZlZER6TENDNjdk?=
 =?utf-8?B?RnNpdWNzMFJpT2lNZ2Q4UFNpQ2l4S1paMWJBdzBqdjlDSmwzUGVMbXNUdEor?=
 =?utf-8?B?dlRtWnFLYWE1NXFYWlNwSWtRZWVRNGlTUnpmSVhVMkIwb1VFeFBmM3VXb285?=
 =?utf-8?B?blkvaGFOTzkxbVQ4aDVYdDhYYWtuUDNlN0ZtNDc2VnREamptNDNzTHc3cEFG?=
 =?utf-8?B?T0dTQTBzNmpkNjVBNkV4c3BkVHhhQy9ZbkhQcVhvUjZuN1FlZnZHZEwycEF0?=
 =?utf-8?B?ODVPQno1Q1I2R0xyZlN6SGpaTVhaaFBrUzdQN09jSUl6VEdmajhKcW5iVUc0?=
 =?utf-8?B?OVcrSHlZbGNzcG1iMU9vNnRvQm11OWFUZU5qSUFuNW1hQmdjMkhmeXhYTHF2?=
 =?utf-8?B?VXNmQ0d1WFZzRkNtMjRkVDZCRDdwbHhPZDRFVW5naDRKNS9iMitZVEFEK1FD?=
 =?utf-8?B?Vm1naU8xWmJoT3hXd3dDL1c0ZzdaSXZHbW1KaE9sWkFuc3FGQjhzWGNWakY2?=
 =?utf-8?B?MU1yT3A5VGVWbkVCajJINCtJVWRlNi9tNWl6SUdzUzg3cEJMUzN6S245WDUr?=
 =?utf-8?B?OUxLNWVxenVjU0xRSmJ3ZS9LSVVkYllrK3pRajI2SFZCVWY3V2NOdHMvTlBU?=
 =?utf-8?B?WCtJUElrZlZoSmlyMVErTStIRUo1ckk4dGlqRy9NQ01EWWVlSVFLNjA4RHBj?=
 =?utf-8?B?bS9qVGRKcE5QZTBzZmNpejhFQU1aUTgzemdUdHV0TWExK01aMzN0eDlPMU9E?=
 =?utf-8?B?ejJmQSszbiszeVcvNVQzc0VadzNDTFRScWJ3OVpBMjVwTFVCbWZWcWpUam5u?=
 =?utf-8?B?RlU2eS9mOTBEVURsS1oxTjQyYTlzVzFpRFhkcCsydUhmM3diNktUaFVMRmlJ?=
 =?utf-8?B?Rmxpa0luRjZGTmt1Rk9wQnROdHZneDdKTnNRWVRneFo1a1RCVzlFMEhkVEFv?=
 =?utf-8?B?ME8zWS93SXBTZ0dtcWVLSzAvUmNvZVhaNmpLM1J1djVNakVoWDVDZUVJeE9G?=
 =?utf-8?B?NmQxNjJWanQwZDR1QUd2ZU00OXlDbndSQzZWUzlWNU1pQXdUM1RkQTlsc2xQ?=
 =?utf-8?B?cWFXa1ozVVpHYWtoM1p2ckV2U215dm1GS0k2WXdxT3BBUXl0dVpnSkg4T3ZG?=
 =?utf-8?B?SUtkNDJZL0FnT1c5U09oY1o3anAwTWdMa3dmaUJDQzFKRUZRR2FGSW5oRDRy?=
 =?utf-8?B?TEROSXBjLy93UkVwTGtOOWw2QnF5enVPd0V3ZE9uY0RTaEVxRFRDdHZSUUJh?=
 =?utf-8?B?bWgzVkw0cHZ4alNrK2g4NWx1bmVsc3pNR21KcGl1aDU2Z25nSGxtWndlM2hy?=
 =?utf-8?B?TFRaTFl4cFpLcDBjL3VwODl2OTVQTlI0Qjd0QVRLdTB1WklkcXNMYUxackZX?=
 =?utf-8?B?djhvaEZRUHZtaDFzTUZOQTJiUGdwUVhjYmZ5ZllkeDBYdWMwVkNZYzVrYmZM?=
 =?utf-8?B?eHkxRWRrWjFqR1R5N3pic2huR295R0R6WDZzcUVNUmJFei9MNHpDS3hrUEI3?=
 =?utf-8?B?N3o5dGNSUEFlRElqTjhmVzlVNE9uU1pxUzVYT3BvRUVNYWV3SUFFTU9hTG1r?=
 =?utf-8?B?Vml5Zkl2RHhnbTdiQWlOSVJlQlAzUDNxN2xJS0lYUDVyMkY5TDBycW1heHVG?=
 =?utf-8?B?MHU2c0ZCc0hwSFhNMHM2S2Z1NHdJekVVZUhWS3Y1ZGZVakVBSmp2TUZUUS9S?=
 =?utf-8?Q?3IZwBj44d4k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5805.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUR0dVVSQTdPNFpuK0dkb3RzVEFpTXZ4ZVo5M2tnWDJRREIrRXJlUVY2Wk9B?=
 =?utf-8?B?dkV4ZEV4UmVreWkxRVBIK1Z2bzRZbTRxZ1BRNVM3TVk4OXoxRTVMUDZFNE5G?=
 =?utf-8?B?ZHJTSHd6WlZYMnZuSGlWYndjQWkzaWk2R1ZvajlOWkFNNSszeXFZUGNmLzZK?=
 =?utf-8?B?SXE0ZmNEU0pjUm16MWFzV1lPb2VlL016ZjdFK3FWcUtBQjNWMVZrSkdqSHdO?=
 =?utf-8?B?QzkrMTM3VWtQMTFWN0lFcERXK2dJUm9ETXBCSkxoVittRlJlZiswQVR0dUF1?=
 =?utf-8?B?RWpETTYxc3pWaEM3Zm1ycGNpN09OOThaelpSWVE0aFZLUE5kMFYvVVUxeVhG?=
 =?utf-8?B?ZFVOVFN6eWVrcVduMUFnSndSZEtpZXZJSkZidDl3V3VuUjV6Wk1hd0hWb1I5?=
 =?utf-8?B?TGFIQXoydU9FZC9zV05mSkhaSVVXSTAzNFNVNElIbjQ4enBoMWNxOENCZEZt?=
 =?utf-8?B?bytWUEpQR1VjUlFXRkFIYXhVeUFISHZHNzRRRWdPSDZ0SEZxSVhBU0N6aFVV?=
 =?utf-8?B?RHhDRzVzWFNYS0dOd3g2RWoxeUtVKzJhZ3J1ZVZlRnBYb3poUFdjbVZZOGZ4?=
 =?utf-8?B?WjB5bDI0SnN4OFpvd3B6VytZOG9TMkxsOVpTMVpyb29WNndZWjl3Y3l2U2E2?=
 =?utf-8?B?eElsRTlReWZwVnpDLzUvc3RFRW03NzkwS05aRkh3RlJtZyt2a0VuRE0vSllN?=
 =?utf-8?B?UDYveXZERW90OGI0bnpCdHorY3U5MlJrc0w2QkZ2QitJQS93Yk9PY01OL2NY?=
 =?utf-8?B?dUxVKytJNmkwZitHaUpBK1Y2REN5YVV4SVZ2RS80Y2ZkeURlcjU2cnVBNzdt?=
 =?utf-8?B?WGhlenByMjdodzNTVS9BUGMrcWVPajF5WStpZGh1b0JuZkpGYlNxU2M4RklK?=
 =?utf-8?B?WFFYbGt5cDZ5eUwwOTJ6OHV5citjaGM4YzFSOWlCc3dpd3ZDL081MDNBWjcx?=
 =?utf-8?B?NFQ3dzFmQXdUMDJRdHRPSHRGUW9zM1JCR2RMTmVBNTZrb3o1STBqMEs5MDFw?=
 =?utf-8?B?ZXM4TDBxc01kTW9oZGhEU21abUd4NGZxSVZYUFVQZEJIWXdsU1ZQdUFjMXBZ?=
 =?utf-8?B?WVlMNzlXWDhwTkFGL0dQRzRNcUJYY1B0Smdud0RhTEloYjFncTRKMmlRZVZG?=
 =?utf-8?B?UElIY3kyVUQxMnJZYkFSSVVnRzI0d0o5VnB5OGdpR0ZkS0V1ZVVMTHdPbGJN?=
 =?utf-8?B?dmRMbmRLY2E0b29ZaHdJdElTc1N2cm44RGdhY3FEVFQ2SXZta1N6dlgvb2N3?=
 =?utf-8?B?UnQ4Q0JDamdsMjMrN1pNaTNXZ3pCZ3drTzZLTWJjZVo0VGxGUC9rQlJSemxw?=
 =?utf-8?B?TEFhVVRJUDgyUEhoQ3QrTFdWOTFuOXBTNmpicy8yQ0p0TXhUai9BQ0RSNVZw?=
 =?utf-8?B?MUE4S2s4Wk0xeUhIRlZMOEI1ejBjdi9taFA2M3NFOER5cEF1VEphZ0ZINTli?=
 =?utf-8?B?NGppSEdnOGMwL2pqNm5MdnNDbXI2ZWFySHBFaExrdE5SVkl5bE51K2pZdnJH?=
 =?utf-8?B?Rno3cE1CejVCNExUN3Z5SytjVWxCdXpGdTg0NjltNk1ZS3BCL2pTRyt0ZjZY?=
 =?utf-8?B?ODI3MzFPck0zSmtJZlAwZkwyV1B3VjZxYmgvbm9WUldPUFl6V21EdHcvd0xT?=
 =?utf-8?B?bkYzTTJySkNIajVqVlB4dERXZ29ZMnJKMzR5MWJRTVFkcldISTM2SVVvQ1Bp?=
 =?utf-8?B?dXFIc1hwWHBJbXMxbjdRUklxaTkzNmxuM3lHc2p6Ri9rRC81NGJXL2V3RjRi?=
 =?utf-8?B?alduSHRNak4wQUlRT0srbEl2MXZla1NOMUx6SytUbmJSN0hQYStFRlI1TVph?=
 =?utf-8?B?UXJnWGV5ZFpjREhDMllqaTJ2RHV3OHdPam5yZjhLbFRBVWdBL3lFNW4xZmEz?=
 =?utf-8?B?bXpTV2VGNGJsTXZTWmRiRjc2M1ovSWR5LzZMRzJVT0wzRzJoKzZvK3gzVGt5?=
 =?utf-8?B?c3ZWT0FBWjNkUGl5M1VuVlJka0hLek1yUjNJb2liYTJaUC9lMzBoYmhPVUhK?=
 =?utf-8?B?RktlU0c4RCtvYWVUNHdzcy9XZ3VLeHJwWHhudFhJSTNjMGRPeU8wcGlwcVhJ?=
 =?utf-8?B?WXd3MXpnMUIvQnNaWk5kaGE4Z2hPSXZJKzNQUnRWMEUyaFV5OGJYVFZBYzlN?=
 =?utf-8?Q?MJ2uxWvYPSE6B8h1f6+3I+Zrr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0abc4a0d-78e6-4bf1-b249-08dd823eae44
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5805.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 08:13:08.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShsPfYi63fj0tZ85CWoXbL49fMPWWK7zbgMAGQalLsJH2marhZdNmEJ0TOmYM/CbHX0ZfRvGCl9qxJwi+3MS7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302



On 4/23/2025 12:52 AM, Ankur Arora wrote:
> 
> Raghavendra K T <raghavendra.kt@amd.com> writes:
[...]
>>
>> SUT: AMD EPYC 9B24 (Genoa) preempt=lazy
>>
>> metric = time taken in sec (lower is better). total SIZE=64GB
>>                   mm/folio_zero_user    x86/folio_zero_user     change
>>    pg-sz=1GB       2.47044  +-  0.38%    1.060877  +-  0.07%    57.06
>>    pg-sz=2MB       5.098403 +-  0.01%    2.52015   +-  0.36%    50.57
> 
> 
> Just to translate it into the same units I was using above:
> 
>                    mm/folio_zero_user        x86/folio_zero_user
>     pg-sz=1GB       25.91 GBps +-  0.38%    60.37 GBps +-  0.07%
>     pg-sz=2MB       12.57 GBps +-  0.01%    25.39 GBps +-  0.36%
> 
> That's a decent improvement over Milan. Btw, are you using boost=1?
> 

yes boost=1

> Also, any idea why the huge delta in the mm/folio_zero_user 2MB, 1GB
> cases? Both of these are doing 4k page at a time, so the huge delta
> is a little head scratching.
> 
> There's a gap on Milan as well but it is much smaller.
> 

Need to think/analyze further, but from perf stat I see
glaring difference in:
			2M		1G
pagefaults		32,906		202
iTLB-load-misses	44,490		156

- Raghu
