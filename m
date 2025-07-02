Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83C4242D84
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447705; cv=fail; b=e9F8KFyjct8+HM7pYAzoMRVAe0Q/lG9J1ztnpL4FybUxA8Uh8KqEugYYRC+NiYaprPT5rhGY/i+p3pmfH70adLIj6LDveNa5GbHhIs2HW9rr0UETIxlrDDoloIgK/87wPF5amxsA4ANOS/QN5TzGbBvDmYUf3paOIeYvNvrvCmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447705; c=relaxed/simple;
	bh=hdDiCrQuxPf7BenQ3XuGynTjqDFbSqY3p19MzU2O2ek=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nxlhGZ6BSTh0kIJpG1pd8v7QiKke1473pj6+AY23ALr5rGVskRIjX+IC8DBgSDRTnC/bIJhvrAQD8t3uqHVT+qp8WG7Axriui+AKlUjkyr34qF+So0fJNc8fX9lLqBd8a6FJ6mlL+AhgLq4ii80Z4zrIyy5eBqEo5K8S4Pja1oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com; spf=fail smtp.mailfrom=nokia.com; dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b=Qew6DTdZ; arc=fail smtp.client-ip=40.107.159.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia.com header.i=@nokia.com header.b="Qew6DTdZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMQ1qKgw4EpsqxpiE9tczApqqzk5SZILBrSKI6McGPulHoXar5za4C7r+kCCIUck5T2Pz6yLyOVY3zekUqnhurI3bG9+MgfU7DogKd4OYNaQzzK9d8lFDo2agHXaZoJzbPh+Okmj5poEAxPErkuSGN7HEK/ibjKTZJEmkDJ0Or3LdDXmdQBheYAQ/voM0/rp87QzjBEs1d17L/Vnj26nM78TuriF2ATNdu+KL9nAQJB4xkL/FlnaMbMnhml5eu1keiyIxciXNxw/AmA2jXGAtxTPu8SOeQng+RaXP9mWVLzTIg42BaqPB2z3VEkJ9uZuAPUmca+tRtZAsF2KhrBM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOdmSeOmeBnPlfbFALQGiI011U5k8yceaCiYzrDNXVU=;
 b=UeD2GK1NQCmQKy5qZR0dW6NAvSxz1aoaTF9s/UKniLCDv8/m+BSxG+y/ege0j3nPeQ2BdjIVE960/zoYevehhp3g6JIt4ZZ4kn7wb5yIWP/md+vkrEbYrm8tpjpHvz+vQhEnNYQ3/cILcj3RpPa+raKT+Slo2vr+sGcAKCh929hDRhffwWCrZtlt9F23GJ2ZLTtU+dIkDYOsgptWHRXuiQwRGfDmgVtE5yczISmUwBPfNlm2NZLPAKrfvB8JhlNRMYCSoxEBXLgciDLsG3udUVHGyvyUgF0eALF3xcnbN9aBKJlPQKj17EnqVMTNz9Di6D/nS+63kUkOUtstj78z7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOdmSeOmeBnPlfbFALQGiI011U5k8yceaCiYzrDNXVU=;
 b=Qew6DTdZh9jy352oF6k09UlG9lTOc6MZkXinpdBLX5qUzKD4vdOolFuJl6m1kZP58IduopLezcM1//zOf86rrIsUo/yoSKfoZL+6HE5mF/VQKVHMTi5EC71kzqNhVbdm6sHS3tpMDo9mtjyYkaZMPam1TSFGIHkX786CTegmgWScmBYg3kl9Qiq5zlFqA5iIU1NF+zysG1h4EaBPTp/y3UaJB7zRLhNM2zPRCLIZ3mvYycLnBpqyFDL5GrfiLMvINf89nBm9guW5OhF5484Cm97+61nNa7YAMbcWo/IdOu1jMa7nJX5G+HzcfG7dSRjEsOBluiPdIarb+AaUGeSE8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com (2603:10a6:102:246::20)
 by PA1PR07MB10533.eurprd07.prod.outlook.com (2603:10a6:102:4f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 09:14:58 +0000
Received: from PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60]) by PAXPR07MB8771.eurprd07.prod.outlook.com
 ([fe80::e125:c4ef:b872:5c60%3]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 09:14:58 +0000
Message-ID: <9ae77072-fb55-4ea3-bf9d-60db96d6a85c@nokia.com>
Date: Wed, 2 Jul 2025 11:14:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irq: add support for warning on long-running IRQ handlers
To: Peter Zijlstra <peterz@infradead.org>
Cc: anna-maria@linutronix.de, frederic@kernel.org, mingo@kernel.org,
 tglx@linutronix.de, akpm@linux-foundation.org, bigeasy@linutronix.de,
 linux-kernel@vger.kernel.org
References: <20250630124721.18232-1-wladislav.wiebe@nokia.com>
 <20250630132517.GM1613376@noisy.programming.kicks-ass.net>
 <c77690ff-9f3d-4ab8-9443-b377134e90ca@nokia.com>
 <20250702090614.GP1613200@noisy.programming.kicks-ass.net>
From: Wladislav Wiebe <wladislav.wiebe@nokia.com>
In-Reply-To: <20250702090614.GP1613200@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::11) To PAXPR07MB8771.eurprd07.prod.outlook.com
 (2603:10a6:102:246::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR07MB8771:EE_|PA1PR07MB10533:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dafc2fe-d55c-4558-b135-08ddb948eaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0FWd0p1eGtSSytVUm1NM1dwUlFWblJrTjBxelo2bU9CZEpiclpRVVl5Sms5?=
 =?utf-8?B?eU8yMFVWNUx3U0lJQkVneEZpWEg0QXhIME9pZHN6Y1JYR3Y2ekdIMm9BekZp?=
 =?utf-8?B?eEFpNW5udTFzbXpQbW5weW8zN1ZvZWt1SXJ3YkFTSHd3SG9MVnU4bmUvWklk?=
 =?utf-8?B?ck4rZ04wRTNXVm1LMWlhRlJFU3N4cWVpZVcyN05iU0wxR3c4TUM4amVRK3A3?=
 =?utf-8?B?a1pqcVRlQjNlbmR0VlZldjZZT0NjMzU2NngwOFBCV1I2QkFrQ3hqVm11ZFhD?=
 =?utf-8?B?ZHd2M3NqN1FwRmtDZTNBOWcvSW5wRGdhNFo2WGQyK1FDZ1orekxjTjZzblJ5?=
 =?utf-8?B?aDBlVW56U2ZzZnRlL2RYQm5keEpkdUtUZlRrdjdiaGZnUmRPc09QT3R4WEt0?=
 =?utf-8?B?NUN5ZURqNGMwZVMxdlRLV2VUZEkyVlpGVlFwekZEeS9taFNzMFJXNGRTaGQ3?=
 =?utf-8?B?NmJyVGhZdENPVUpNV2pBSDZaMm5ZeG55V1J1MkFVK2oxNFZVVkFZd3FzWnJ2?=
 =?utf-8?B?TzdIT0lWc1o1UUZkbXRlTG5sM3hYMExFTCs3SnlKek9icnpIUTE2d1FyVFRJ?=
 =?utf-8?B?SjBXd2VXdW80eVdTcUtLWlBORnZYVWJ6UFErQitSVzBaWHhIaXVvUHFmU2V6?=
 =?utf-8?B?d2VaeG1QTXlBdU4vZlF2bnFVRVpibXh3T2VabEF3a1UzMjhDMG40bkFWTnlU?=
 =?utf-8?B?OWs4ZGJnL0VkWk5BQUU1SGdCZVlDZWZHWTZPVC9ySVFVMlNhVWZRdVBBWXB0?=
 =?utf-8?B?c0lMVHFtZmpvbGNxa3dTd090M1NGMGxuTkt6Z2IrMFJUYXBwR1ZyMFpUWkpB?=
 =?utf-8?B?RDVwNlA1ZXVNMys4VkI4VTQwSGFxTWlodlEwVDV1d1pRRGp4VEcwT0FDanJL?=
 =?utf-8?B?WVVMa3lBVkluTGViZzJHSE1sYUk0Qmx0d0REb1hSL3hudlBJSy8vQ3pmR0d6?=
 =?utf-8?B?WEptOWhtMkhhQldHdjdZbjdSK09JTklPYzUvQyszTW1CdEV4Qk1mRzZOWGVj?=
 =?utf-8?B?d2pNMXplUXo3czJQTXR0Mmw5YjZ4M1pzTklQWFhMVitvTU1LTmtISWw1Qk80?=
 =?utf-8?B?RHNYTG1TWHJSOWRKZmdUWEJoQWNva1Z2Q1gyNThTelpPNmh2MnF2Um9HdW90?=
 =?utf-8?B?UHEzSllNWDdxUUNKdkx4bjhPVnVBb1VqSlBKZGgvbjhzU0FsQWlUR08zK29i?=
 =?utf-8?B?L0lhOWtzWEZ1MGdOSHZmUS9haXdRakZnbXI3RWdjV21ibXloaHFLRlBaTllZ?=
 =?utf-8?B?eFE3Wk5MS1NaUkZTazBkMWhna3AxMjc2cHpna0dwMGd1Rkc1WEIwOEtEK3h3?=
 =?utf-8?B?RFpaZm5IK0s4OVdmV01ySkJ5SURCTjBETGNpanhhSjVaQ2FlQ2JlaU9mWmJ4?=
 =?utf-8?B?b2doNzVoWTI3Y1BsSEppZ05yM1BvOUttQ0k0TlgxZG81OVVSU3VQN3lqV256?=
 =?utf-8?B?bGJ1R1hSYzlRUC9Ucnc2dkdlK3NoK2M3dUxJayt5dTk0U0dtNmpBcmQwd0ZB?=
 =?utf-8?B?WWVRTDVQdVcwVXl1eE56TldKRzg5aGVudkxDMlJhMklLNk5yaTJubG1ISkw4?=
 =?utf-8?B?dEZzSkZ3THBnSHNRU1hRUVBpRkI1SERKVVcrSzRwc3JJQ0tqMjk5ejNaRFp5?=
 =?utf-8?B?Z053SUFUUlhPcUJVNTF4dldkdXB3NlRHV0VsMGdDNXc4VzgyM3Z6TnlKVFNR?=
 =?utf-8?B?bnE1WUZ6Q3Rnc1FxY2tkRVNvQlN6NHF5bk9BeGhrVWxtbXphRVBxcFo3R3Bl?=
 =?utf-8?B?MmhRT1RmeU9zTkh5Z05wbGpnU1VlZkxidDd3SEE3allWZUZCNk10cFVoTDFx?=
 =?utf-8?B?bmVZWlRUWW1vMlh6aEh4dXVTemtFa1VuK0h3MzErblRvZ3NyZ0JPelNaeU95?=
 =?utf-8?B?Z3A2eHdCNkZHMTlpRDY3OXR6NkRBWWpEcTlTanpaSHh2aEpwbWdkdUpDYkdi?=
 =?utf-8?Q?IvgYN+GTD2g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB8771.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym1md1ZhbVhZQXJpY3pKYU41KzlCTjd0TlRGV1ZmbnR1QzlEeFUzV1JTSjY0?=
 =?utf-8?B?aS9ScFJuN1FOWmhVN3hBN0MyWVdQVUJqVVAzOTFNRlRqN0liTkRJS0tOOWt3?=
 =?utf-8?B?TW5USkk4b0pxNm5jSTJIVTBwSGlJZ3BTYWwxTWlvcjRxNzBjelpVcFlWUU8w?=
 =?utf-8?B?VTNWckl1d2ZKWmQreWNhQ2xMNm1rOVdqNmxKaHdlYmZYaWQ3ZWVQNGdTUWZ4?=
 =?utf-8?B?TTVqK0lYbGVLMSswdzhVbDBxSGtBRncwYUZObjRaUmpDVE1kRU9sSnk1MVJa?=
 =?utf-8?B?RXU0bnEydGplbHlkSGJkR0ZiKzNEdnBIZ2FYVWNxcGV5ekFkY0h4d2MxMTBS?=
 =?utf-8?B?TGwxaHk4MEFyRlE2T0FVU2p5NFk5OEsxUDhLMXQzTngwZXJkT05rY3RpZHJ4?=
 =?utf-8?B?OVoyVVU0K0drekVwbzZpTFBBazl0S0hET0FEenhjSEVERlF0TzZXbXY4YnAy?=
 =?utf-8?B?cktCU2dVd0dQS1Npem42ZkZtVjF6LzQ1NjI2bDQ3MkwzLytZMm15eU1PRWR0?=
 =?utf-8?B?T2J2dnBoVTZPWFZ2Y0xpODFzWFZWakEzZ25SZUFqK0pSWDhYWjlPY1hpa0gy?=
 =?utf-8?B?QThlQlQ3R1V1YjAza0M0NzBEUStBMDBKQ0J2cjkvckpLdVd6Umk0dkRDRXNz?=
 =?utf-8?B?c0hjY09IZkVFdzFsT1BwcEFGaDNGZlN3VWo2VXRMRmFTcG5LNE56RStvd09l?=
 =?utf-8?B?Tzh4cWJ6WERuQWNtQk1ORnZ4amoyak9ROVpocHpqMjlkU0NrZXpqbW9NQ0F5?=
 =?utf-8?B?c1ZJbUpob2djWGtNcnB3UGVZV1NFMmJwRjhhUFhMdk5sSldnTUFNWHh1NWVz?=
 =?utf-8?B?ekJvM3VuWnhGTk9uWWVOSmFOL2dZcm0zZGNIN3dGaXZxeFdValRUQ043MzRw?=
 =?utf-8?B?K09rMGYzYXVoRU10NjdqQS9seUVUbEc0djU1MjkwNVM2VTB0SlFCald5eTl1?=
 =?utf-8?B?WkdLM3V4UGVRR05JS01DakhKSkRWMzF3bTRGT2F3R0FFd2N6N3BnaC9nQ3Zo?=
 =?utf-8?B?MG83ZFJhTXdZY0VwNGhNb3dldlhHejVhTTRCTWo3VkI5d1U0dWEvMU1HNVVh?=
 =?utf-8?B?QlNDVFYyWHVINTJEcnhQcDc4N3lPN09WRndHd0hkWmZrS2RQbHZXZWwvcHpX?=
 =?utf-8?B?eWNMeUZDOFkyT1BXZlYyTndGRjc5L2t4NW9rUE1xV1B4Wm9RYTBsWm14NCti?=
 =?utf-8?B?djFySXl5RGpoN1UvRFdzQkl4SUsyNHB0akw2K2pFd01JUVl4NDJqNWE3aHR2?=
 =?utf-8?B?V0p6dGpFSjdjcEM1NldOODhJTVFNNWFQd1FxYVVoR1d5b3NKUjltV1JHWXM1?=
 =?utf-8?B?NndrYzNmNDVmdFB0ekt6b09aeGVTc1Z2R21NNWZBMEptS2hHSHlHQStzSUkz?=
 =?utf-8?B?M2dISURnNDREQVRIald5S21EL0hHYjk3a0RtWWNEV1BsUFY2ZTNQbTJ5dTBi?=
 =?utf-8?B?WGwvblUzNVkyRlE1S2FQVm14L1NxKzJlUktjOURTU01CRTRlTENVclFWWkMz?=
 =?utf-8?B?SmloaVVSVGFkR01tRjA3VzhYeGVkTU9iMjU1ZUlOUHMrQVc4NWNDSlh1S1RG?=
 =?utf-8?B?eVB1bloweUdoc21mOEMxczl1U3RiL0ZoTURSUDIyR05KSW1MUWFkd0FkQXVX?=
 =?utf-8?B?MnduS0hpZktIZk5DeXdNR3Z3Qi8yTXhjMUYxZ28zWTFlOS9KRm1nTmRsc3lo?=
 =?utf-8?B?TnV2NmMvb2ZYdXlOQllxYkdrMGpOVkQ5T3hmVllNOTd6aXh4cU1WZlZXaHhM?=
 =?utf-8?B?NFBSTXMrS0VDSW1GclRNTlI2SUFldnZrTTBsQnQ3S3NLSDBLdllrSDZtWXlZ?=
 =?utf-8?B?QXFjQzU1MFlybUpHcENWVHNKMk5lZzFZalExNnc5bHJ0cHpDWGl2V09oZGJD?=
 =?utf-8?B?RUl6RTNHQUlhc2NmV2dDVDRNM0FrSFprenlSRHFqNnR1cmM2ZGpZaTVjbTNl?=
 =?utf-8?B?U3FBRlpnc0RiUCsycTBTV1ZUYTRScHd0RnV0VjUzVXE5SU41QUNkcjY0dWlm?=
 =?utf-8?B?ZExWVFFtVEtLS3gvazZNWW91QVhMM2NLdjRZVno4YVpRM1VSYWxUdWlsUWVL?=
 =?utf-8?B?SWVnaUQ0YmxVbkhVakZ1a1JLNmk1YWRKdkw4b0FzeW9BVkw5MzRidlhtZkJG?=
 =?utf-8?B?anhxZ0pCQzhlbHg1UTEzcGhZWW9ZeXBrcW9JTnpLYkFhelpjanpsSytLR3ZS?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dafc2fe-d55c-4558-b135-08ddb948eaae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB8771.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:14:58.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1EVOHjXU9+MI7O+NKnFAkfeXeXzbjPiE6RfSMppL2raY+ZQsror0v9FhPmnFv6AIjFPzjciRXsFlKHiH6is0SiB3sJCmLI3yOMBc5/AA2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR07MB10533


On 02/07/2025 11:06, Peter Zijlstra wrote:
> On Mon, Jun 30, 2025 at 03:59:17PM +0200, Wladislav Wiebe wrote:
>> On 30/06/2025 15:25, Peter Zijlstra wrote:
>>> CAUTION: This is an external email. Please be very careful when clicking links or opening attachments. See the URL nok.it/ext for additional information.
>>>
>>>
>>>
>>> On Mon, Jun 30, 2025 at 02:46:44PM +0200, Wladislav Wiebe wrote:
>>>> Introduce a new option CONFIG_IRQ_LATENCY_WARN that enables warnings when
>>>> IRQ handlers take an unusually long time to execute.
>>>>
>>>> When triggered, the warning includes the CPU, IRQ number, handler address,
>>>> name, and execution duration, for example:
>>>>
>>>>   [CPU0] latency on IRQ[787:bad_irq_handler+0x1/0x34 [bad_irq]], took: 5 jiffies (~50 ms)
>>>>
>>>> To keep runtime overhead minimal, this implementation uses a jiffies-based
>>>> timing mechanism. While coarse, it is sufficient to detect problematic IRQs.
>>> local_clock() was found to be excessively expensive?
>> Perhaps not excessively expensive, but jiffies is the lowest-overhead option here, isn't it?
> Yeah, but since it varies in length and even the shortest (1ms) might be
> too long for some, it is of very limited use.

I plan to refactor it to cover it with local_clock() and to avoid using Kconfig knobs as based on Thomas Gleixner comments. Thanks for the feedback. - W.W.

