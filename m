Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022095.outbound.protection.outlook.com [40.107.193.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B61D47AD
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748030244; cv=fail; b=BUx9bkRoBENMsaQfNiY62aipZ4JFWCQJ8eSqv0p5DSSTsXMi+XKdHmnjhS41iYcliUdCKRU6sSYbpbXb7wKREHd3ji5dLFnHknEe1AGUxXa8uXPk4X4fBQj2x/KadZjXBR9XlUEAd8vZGNl3LeB/COPWzBwUm1m/p3I40S1CsJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748030244; c=relaxed/simple;
	bh=8icE1aVW85zBJ0C/V8BtLrbt4hXTGEVofiWDojnAjC4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wn5A0Kgmrgywjsu3MQP2dMIRS/3Dg3rBUCZPfvYNorYgHRILBK1Arvs514jOVffGInaXMn+EvetKO6PZ71yW5QqH9H/G6JGGO467OQHFgkfYh7GEHYvXNzo1B3Y6s1yvg8j9z4C5q1HBD0f3jF0eWLEmjJkuOUqyonAuwa+donQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=hzv6AjNH; arc=fail smtp.client-ip=40.107.193.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="hzv6AjNH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csJfYbZSGqBOlUdDHYC0Rcgv8cZLi6AH99U2EXYMqm6ilBueBgQOscBlYAn0hcP7Sef6Sn6Y4vCjx1EzRB94AhnaKq4u9lpezZRP+7KPVheFaSrK68fKqJ29/oPWCoaUMq5zHm1YPt63S/KcsrXcRv4CdYFJC/p01pTqSCdxjY7msrr1mUCtJmroUxtJxV5di0Ca1PkFOWWXpy1fB9orrPCKoiPjXzhv92627ljmw/NWDzhuGKw2MQhSihHNfdgeTu8koviMTpEGyL5uatxBBDqda/O3KoFY//R6Jq6doAMgeyKR8LYCwL6OfgBRw0ZzxZjD+F/b1OloBsPDwX/rDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5rcHhRe8e5x7rqsakNxbjjtAQa/SxJRDqsLe9O+IDo=;
 b=B3VbvuTUY52gzkLsUrDMhgrFv+2PskU3sn7EDbCDKf9qSWW16o6lr93Cc6a4hlYJeAYwkfjFSblIefBela84abS7uPzJiQlgIR0J+Bf16k3koxnT/lpypFOfKIhfOSHQXOmBdvlc3tepNsE+BSYxxampYjwkS2lgDg0IrAJFFqgvbH51itXiSgM28aHZlmaJEFS76FaPOwwm+YgZKKorvIeNr+6aNxQOuhtH311h/8nFnZqhjA0pLrT6y7SSu57oDRV82xIaYDUlei3uVhq7rEFzDu/BDsk4cP+D2NDr11mMH2fjAu6DYy9s184o3+5MlwCf3Y7S1fCf8TDtNf/reg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5rcHhRe8e5x7rqsakNxbjjtAQa/SxJRDqsLe9O+IDo=;
 b=hzv6AjNHGxIxv3hJXqoVufMY1HyLVSVJAsKPCMnMhOS8IhpotrhQEb++tRR92RrkigtzMvx2qmRGjH18DjK8w5UJ4Ns4oA6bX7bLPaLBBWH0zCdJLjRVk9T4HGVOhoRpqaBdKXiF7+5e4P0Njk0N2H1ema1oeT5z2aOFqRfle2/u1WJB24Hh0zip0o1Nmv2aeoxgICkW/cCsidyHrUNbHA98DhoqdLlarsiwjbQrgzBXzEAGYSI3Xr6aS3MtCNcdpCdRqB5bazdRGh4CyMW4PhgDCMVErD8NGQvSKo3aVty97eYYXzil9N1CZCcZe0gukdhxNo1uH8gLdtCjxtgwkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YQBPR0101MB9933.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 23 May
 2025 19:57:18 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 19:57:17 +0000
Message-ID: <df3840a6-36ae-4429-80f2-b1f089917e2c@efficios.com>
Date: Fri, 23 May 2025 15:57:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 6/6] Add API to query supported rseq cs flags
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, tglx@linutronix.de,
 bigeasy@linutronix.de, kprateek.nayak@amd.com
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-7-prakash.sangappa@oracle.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250513214554.4160454-7-prakash.sangappa@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0279.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::10) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YQBPR0101MB9933:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9f27b3-2e78-45ff-0253-08dd9a34054a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTdQeTA1R3dxdlA4TkNIWHJ5R3lXalpMZHBhSkk2eUFpNkxuMG9wSktlNWh0?=
 =?utf-8?B?L2QrNjJOMHlTZm5NOXRZZEtCR1MyemdyV2RMREFQNEJWVDcwNk9zRHlkaTll?=
 =?utf-8?B?dHFYdllVZ291N2hjc1FVQ0N5NkVpZzVnZTdnOG1obzlEUll2S1R5V2tZYTFH?=
 =?utf-8?B?ZkNpVTM0dUZOdDRWeERKeWhBbDEzbE44Y2IwZFpZaUpORkJoRXZ3Q0huUzFi?=
 =?utf-8?B?K1BHRXErZFpxeWlyRzRBWVNTWW1QMHNuS1M5U2p1VkhaYWhwSHRWME1uK3lK?=
 =?utf-8?B?Vi8rS2E1eUlMZ281bXJMRmQxVFQ2TG1aYUFyaTM2RGJPa2FrMlBvYlh5WEFX?=
 =?utf-8?B?UW5BaEZPUjhrTEpHN3ZIbVJ1cnR3MVpROEVqK3RrVDNOOWYxYVFiWVdnZCs3?=
 =?utf-8?B?RFU4bmk4WDlycERvNXA3ekpDTGU2QUpHazd2RU0xSlZUZGZjT0NvZzhKZGxv?=
 =?utf-8?B?MXpIT0htQW5lVHVvVUxlaERxVXppUWFHZFBiQ1Y1dk9jajFiRlplcmFnNHpJ?=
 =?utf-8?B?VVpmckUzTUo4NHNhNUJDWEhWQUZodXBaTlNocnNha3o4eDJsV0lVemJOSTNv?=
 =?utf-8?B?RUNvMUdRa2lFYXc0WThUaVNKOUpCYzJwMWVnRWd3aUsvb0Y2TzlLTU55OHVn?=
 =?utf-8?B?SWttSTYvWE1oS3Q4K3JsVjlhRXhBY1VZZ1hXM3g1SXo5N3RTQkRyNnRsd1RU?=
 =?utf-8?B?RGw1SytxeW54ZWswZzRnVzNZWEtCbE9wajR0ZDFVME12eUdlY0V4aWRmN3NB?=
 =?utf-8?B?bTZPK09TNE50OHorNE9zbzZoelMxUnJPclNseFBZQy9DMEVzcmMrTHZJUWlh?=
 =?utf-8?B?YkhqM0d6ZVl5b1IyY2JscWN2ZUlpaEliUndWelVzQ2krUXRGYVRWaEJGZXp6?=
 =?utf-8?B?WC9zTEF3UjRRdG1UTWo2bUdVMDRFNXI0TFhUd0plSzVLRGVvcHlVWVdzTlpo?=
 =?utf-8?B?WG5DT3NteUF5RFdNbU1pWGZlNXYvUXpjbEVVdEk4T0RLZTJSdzl5MTk5U2Z6?=
 =?utf-8?B?d1NodGhQYkM2RFdSMEFRekpNOXFRZlc4MktmcEUzMFVQREgrVG52UlFWRTFD?=
 =?utf-8?B?aFJrVzFqcllycXpOV0E4cy9aL1VrblBubjh0RGNjbURmTUxROGV3MWp3U2Q5?=
 =?utf-8?B?Q2tWSStYdko0TGpaUW1CYjduTUNLTkVqVnpnSm5US3QraDU0WThSeXQ4N1lL?=
 =?utf-8?B?Q2JBN1JOMEJnRm1NMklISmZzZFdkdGU1dmVhWllTQTdzd3dwRGF6allmalF1?=
 =?utf-8?B?Rm5XdWU2THE3ZjhiN2hIalg1MFptN0hnT0Y1eHhaWHNLend2VWVkaWJqZzFy?=
 =?utf-8?B?SUN3Lzd1amRCdWZYL0pqTzBKSFdZVDgrYWdQRHNQUGhCR2N1UzBRYnQ0cUtp?=
 =?utf-8?B?cDZaS1AwK2V3ZWhBZjltdHY2WjBicmZlMXpMT21Qb2ZHM2ovaXoxMHd1a3Qy?=
 =?utf-8?B?cGVkZ0ZPZ3o4cEZ3OGF2K3RXYmpCR2IxTDdRTThsMzVnSENmaElLZVloMWQy?=
 =?utf-8?B?bTJCeTFKZUVPQ3g3MzgwNnhDc1dWRG1CdU5zM2E2TlBRdGNpK1AzaEFzZWdB?=
 =?utf-8?B?R2ZhcjNKcFJTdWFLemYxVFhwUUQxNktqUkttTUJUUTdaWG1EZnRScGRvRGpv?=
 =?utf-8?B?NjdUSUxNbER4bzZ4Q0NySnFNY2hQTmhwVFdXbmsybmZyUUF1ekVoUk14NThL?=
 =?utf-8?B?dmVqMjUyTHZyeFhJeXVkeW9EWWMzcVlXZTFIMXlNeWJCNldaVlVoWG9BOWVZ?=
 =?utf-8?B?b1ZEOTRSK1k0U1NMTEFJa09uOEVuM2QyZmViNXBlL09mNGJuSmV1ME9JZkp4?=
 =?utf-8?Q?YhaPTyy73dehhjMSbI1Q0uNYrgxEGPELGLrWc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmFFOE9UOGlOZzEzZ2xISzhCc3hsamRVVFU2bjdXV2dvVlVMS0pBamRHWVVH?=
 =?utf-8?B?VDFKN2F5RVFJVW5ObWZqdmpFcDRrZXZXZHFqcDhLdTNtNEVod0pYdm1jMGp3?=
 =?utf-8?B?b0RVRHp1dHdSdSs0YUV0LzdHL2dXWEYycXZqOEc5OFMzT3pKN0ltWnNDSkpq?=
 =?utf-8?B?RFN5cVgwd1dFLzdlaHhWR0lwdVc0MUtLMWhJZ3lXaEUrUzZpdHd0c0dyakgx?=
 =?utf-8?B?UFFNcDVWanUvOXBYYi9xNUtoUHdJM3l2eW13Ky8vdjF5Y243V2lDanI2Ymc4?=
 =?utf-8?B?WDBiUWNYQ2VGbG1CU21YM2gwR3U3VDdnTlUzTFpNUnpxd0l5OUFwY1h3QTN6?=
 =?utf-8?B?Y1ptK2VuT0VvYW92YUVNZ1JiYXV1a3RybXg0d29QaTVRTmNaU09tTXIxOEZv?=
 =?utf-8?B?NzJkN2N4dk9iN1FRbjBjQkNUQ0JQWU9saitpVDlrVUpZaDU3eHgyZEw4T1Bh?=
 =?utf-8?B?cVp0L1RnbGJsODh3Q0FCSWRlY3h3WjNoSEZEckpmejkwSldmb3UvRTVGbHBl?=
 =?utf-8?B?WmZPZTRUTm5WY0ZxblZvbFAzNUNSTE1LQ05jT1NLWFNTUEJOTGprNGRKY3Zt?=
 =?utf-8?B?T01UcWxURFBUN2ZFL3hXQWQzVk90b3FVVzFqK2w0QkF0cEZMNjMvbG5vd1ZL?=
 =?utf-8?B?R1R1bUJyNEJpcGl0dXA0Uk1pcXpSbnhaUlRhUHY2a0t6N2RQc1RFUmEvcjZn?=
 =?utf-8?B?bXJlSlRON1ZSZFBhbzRTR2NCV0I2OERnSkgvcEJ6T1ZNSHdCRTMxSm9Dd0Ro?=
 =?utf-8?B?MU12N0lrYkRDd2tKSHdJMFhRRE9heTFFdTMyNXprOEFwc2tOVzNKeW5ZYkRE?=
 =?utf-8?B?MG4yWDJpOWtxMmJhbk4reksyOGF4V0ptdkJIMXZ2OUl0MVJSR3QvSEtxaERQ?=
 =?utf-8?B?UW1PREQ3U05PaGI2b1JtcE5FRWU5QWN4ZUl5ZzdITm1VVEZJYXpnanVNaTlZ?=
 =?utf-8?B?SVk4ZnNsOXdidDBXYlVYUTZXcGlWZThDTnBneC91OUVrNWhRNnZ6MFkyREpv?=
 =?utf-8?B?dG0vNFVUUjV1aWFCblZ6eHV5SlRvam1FZ1g0THFldEI0Q2V0aUc2cTNJYmlP?=
 =?utf-8?B?b2xEQytGdVNFWTBleUpzZFVWakJ1SHZCSDU5cGtLZCtIc0NaUGxpcTNoREt0?=
 =?utf-8?B?bC9RSFo2TzlNeFRWRFN2RUFXamNLNUxqb0VXQUF6ak4zelcrOGIrQzNPcklt?=
 =?utf-8?B?NE03ZWErbG1keTdRQmRxem1qYzZGcUZEVEZreUhLOHV6ZWU2OWI2T3NEalQ5?=
 =?utf-8?B?SmVueHB6bjdIcHBNcWpoLzhDVkxXbXRLcEkyRXBDMDVZQWI5QWpzbGplaG1T?=
 =?utf-8?B?M203aFVnUXJ2Y3dMa2tXOGp4WmJWYTdJWFQ0UzAxWkhXUjEwWFlFTWE3TGdW?=
 =?utf-8?B?Z3o0TE5ENUdQdEpHMjU0THQyU2JuMFhneHJlbU5ydmMydFYzNURjWDM1d3NT?=
 =?utf-8?B?dTB1MC9UbEhVanVIRkc0NDkrSDlDNmtLTCtrbkYwNUlKdElPRndFdDdOMWIw?=
 =?utf-8?B?T3JtWHcwZE1KK0F4Q281UzNNaUx3TUthN2RLUzl0eEtVM2x2bDJyNzF0ejlj?=
 =?utf-8?B?bFNNeGkwajFMVHFjNlIrN3dFdFZIUldmLzgvVXE5aXA0QW0vQXd6Y3hLNSt3?=
 =?utf-8?B?d09Sb0ExOUVoVndMWEhGMnZ0a1JNSWd2akRmSzRUWEZ1Y1VJUWJRdkZhampl?=
 =?utf-8?B?b3ljYjZFeFR2dHFFUHR5VjUrVUxiTWxxcDdNQWd6cnBwOEkvYmE0dFVqQ2hX?=
 =?utf-8?B?bTBVcDA2Vi9iSDZOcG11OVdWRlF6UUFuNFRHSUxoOFhkTGZwTnpKZ0oxSjNU?=
 =?utf-8?B?NC90SEFnRU43VVJFVUxUbkJ0TTZjdG84UWRZeHJXVHdWWmRYUlhGS0NIakxQ?=
 =?utf-8?B?VVpmY3htRXlIUjdOVENVb1kxSlFzZGd4Y0EvUFdRY2VYZzNucDNaRjc3WWtS?=
 =?utf-8?B?bGJOS251UmdGdHFKck5XUHRJb25iY1lxT0VZZVF3MSs0UmtEdEhaL090bmlL?=
 =?utf-8?B?WVZmSGlBK05IY0trU3QyOC9vT0tQVmxjSlozTFJKUTdyZWtlV0FOWkJJQTBF?=
 =?utf-8?B?bG4zRmFlbmZ0Y2NzM2J4OE0vaW43U0FEdEdFVWQrdnREK3ZJQzNUdFZUcmpM?=
 =?utf-8?B?U2Z6TnM3UUdGaGlTb3NXY3A0QThGdjF6UnQ4aWs2cHRwZHdESkJqaTZUbk8y?=
 =?utf-8?Q?6o3QCbaBvXAMQRAH8A4+4P0=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9f27b3-2e78-45ff-0253-08dd9a34054a
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 19:57:17.5886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2QdlGnhRWF6LQqAvBNdMseDOQb5zEQMFaocrQmYqsvuJF+ZKXrd/pDG8lz0ivCCbk9zR+Fi7AlqCzDKr6NZrtO8ihGCEA0hndg2t3lCcoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9933

On 2025-05-13 17:45, Prakash Sangappa wrote:
> For the API, add a new flag to sys_rseq 'flags' argument called
> RSEQ_FLAG_QUERY_CS_FLAGS.
> 
> When this flag is passed it returns a bit mask of all the supported
> rseq cs flags in the user provided rseq struct's 'flags' member.
> 
> Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Signed-off-by: Prakash Sangappa <prakash.sangappa@oracle.com>
> ---
>   include/uapi/linux/rseq.h |  1 +
>   kernel/rseq.c             | 17 +++++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/include/uapi/linux/rseq.h b/include/uapi/linux/rseq.h
> index 015534f064af..44baea9dd10a 100644
> --- a/include/uapi/linux/rseq.h
> +++ b/include/uapi/linux/rseq.h
> @@ -20,6 +20,7 @@ enum rseq_cpu_id_state {
>   
>   enum rseq_flags {
>   	RSEQ_FLAG_UNREGISTER = (1 << 0),
> +	RSEQ_FLAG_QUERY_CS_FLAGS = (1 << 1),
>   };
>   
>   enum rseq_cs_flags_bit {
> diff --git a/kernel/rseq.c b/kernel/rseq.c
> index c4bc52f8ba9c..997f7ca722ca 100644
> --- a/kernel/rseq.c
> +++ b/kernel/rseq.c
> @@ -576,6 +576,23 @@ SYSCALL_DEFINE4(rseq, struct rseq __user *, rseq, u32, rseq_len,
>   		return 0;
>   	}
>   
> +	/*
> +	 * return supported rseq_cs flags
> +	 * It is an or of all the rseq_cs_flags;
> +	 */
> +	if (flags & RSEQ_FLAG_QUERY_CS_FLAGS) {
> +		u32 rseq_csflags = RSEQ_CS_FLAG_NO_RESTART_ON_PREEMPT |
> +				   RSEQ_CS_FLAG_NO_RESTART_ON_SIGNAL  |
> +				   RSEQ_CS_FLAG_NO_RESTART_ON_MIGRATE |

Those 3 flags (above) are already or'd by RSEQ_CS_NO_RESTART_FLAGS,
and they are all deprecated. See rseq_warn_flags().

So I would not return them within the set of supported
rseq flags.

Thanks,

Mathieu



> +				   RSEQ_CS_FLAG_DELAY_RESCHED |
> +				   RSEQ_CS_FLAG_RESCHEDULED;
> +		if (!rseq)
> +			return -EINVAL;
> +		if (copy_to_user(&rseq->flags, &rseq_csflags, sizeof(u32)))
> +			return -EFAULT;
> +		return 0;
> +	}
> +
>   	if (unlikely(flags))
>   		return -EINVAL;
>   


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
