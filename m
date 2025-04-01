Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2045.outbound.protection.outlook.com [40.107.255.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAB1372
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487746; cv=fail; b=EzLQunoWXM6H/ZT5zJdfswY8qxjWrcbyWb6r+NRikBSX5i7zHUGeeH8Gg36vTevs6m7G+jsWtA/p9F7as+8mLXWt/qlB1V2JBdx7QqZxz5hEfcxtu5RJkeYhILcooOo9UmzklQKNeh5v+0AwK+ITH1HCyGyaC6KxLm2ZtEAJsZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487746; c=relaxed/simple;
	bh=ST0pF6hk5PQFwpRAkPMvRGANrqvClB6X5py31xTfYUc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sXfvKIbM7c7sLy8uVVyOBvTcU0bQQ+DDjaJU7Q6CkX5Y/wZdmEr307cIh6Xkszxa1jw/Tt2gJx9RPpXGUI44krNBusAoB5+ipYw2GRIQ3bH+piG0YC36w+vuPMfJOUp4zNjIBEtsZHQkmxoHavmLeky3djpwJoWgh3BhHHuKTKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=dMR0EPpP; arc=fail smtp.client-ip=40.107.255.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="dMR0EPpP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX6PaLM6N7ZlJ8Unyyg4ZxQDGHxDPgOVyxjbUEK+D9E9ta9tU1CyTkT9fM67HuOHSWuWCbmD5VZEDWH1A3NalYZVOPi2k4mWYAt4eAPdiJ333TrbXMrcx6GXG/mFXYG0/iZe/3eV4uXjyVR2k2ZJDZlwQ4z9IyrbrQ1vYry5P5kftzyKv8ymNyEe47rEoE+DwaNPWlKTED0cWihVuP6UNS9KLpe2RbB5JQsx84fTOEanlRk9n+TdoNuhV5mmx1kKgexiu3DDranGk0I9E8ATh3lh4sosNIBsxfBPMLLsGaBRbJo13vkHkzxsq6O1dMYYOez4QlmrIMOVkZG3LkAniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4qWhEKA8X+3E26aGgaqjb6gq+ODxkzqpug+sRg//VY=;
 b=a+OhlIRkSau0I3wIdCKNedz4cOBPmKa71HRlN/oAz7OLRaoZqsFUqOq2hTWkfLOLpgB56pZYyFxpNZuamRpNEwD57g34IFXfvjold5UzJvC0i/3qc1DQiPtADHZMl4tFJmFDrjKvlbv6UwPbQeMqIXC05ewfLCtWe11937SsADX/mm8tNEv5JQh3waKeApcMkxheQdJwKkXPhcTLhK4jIuowhQZQ5thGB483weZzGZwfOuPHUB9QC4gpf+J8fuPHwhMD+7cCAx9G420qPH83+PwGpUiDJ07FNBzMrWCfgcJawvMLQOXZx1A5sw51B0XaYd/5aysj7jludGyZutufew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4qWhEKA8X+3E26aGgaqjb6gq+ODxkzqpug+sRg//VY=;
 b=dMR0EPpPnVwCLIfsFyxRQZfxhUYlq1Z1dVqr2LUOoCE1Wv8KWbX9BKH4WPMOQpFI/LPniJNSdNH5aza4KUTs9KkfG0Cj0bGPCkXmbhMx3EORfV3sbAMALBvFeP8YBE9gxBv1VzbuPEqRaXuZvTqWx7aARYivKKILY9cEMwxDAGp9gzOn2+VezwUAamF0nmfikywvzwIz9nc8VwpMMF6oy0N+nodEjZSvUmuAPUGyOP6sm7DArPiT43jfPnCKmGESo9tenMfss1o/MtAuQDALymxgMD8uV509xN5rZrKlr+6Qtc7uWodzUlCnwL2HWmrYtObp+L5/4eK+j9BQZstAbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYSPR06MB6290.apcprd06.prod.outlook.com (2603:1096:400:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 06:08:58 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 06:08:58 +0000
Message-ID: <efd24da3-2da2-4acb-be7d-a070a78b80bf@vivo.com>
Date: Tue, 1 Apr 2025 14:08:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com> <Z-tGXf5mfTclxZgl@fedora>
 <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com> <Z-tbTWP5MYzwrRYX@fedora>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Z-tbTWP5MYzwrRYX@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYSPR06MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7d8884-799d-4406-638e-08dd70e3b084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVpDTFM2SXBrNnZOUlloQUVoTFdUQWVzYnJPanphbmU3c3E5RkhCSDM5NmFp?=
 =?utf-8?B?NjJiNVFaOXZzckd3dGFQQzgvbG1ZTzF3Uzd2dmoxRUoxRFFaRFVjYjI5eHQ3?=
 =?utf-8?B?SUZhUldGVlUrWE9uOUhIbzFGWWw1ZUNKTmU2TlJGL09oVFNGSm8zbmdramgv?=
 =?utf-8?B?Q1ZZUzNJZmtTdXVodzZPRHNtTTB2dGRTZlVTcGwraFRtVGpRNFpzbEV3S1dQ?=
 =?utf-8?B?RkpFWlFpUTA2dmpzMHQ2R3U1cTVhSVh2V2diWHBKcjVQYS9ObXBVVWdoblkw?=
 =?utf-8?B?TGxBUVZxa0RkbExIOThSbWQ5RUhJMVArQ2dDYnZUdkVFWkF0cnJ0UnY4Sy9V?=
 =?utf-8?B?K0RoMjQ1UVMvQ1o5YjR0aDd0QnVKS3JjRUdKbVNNVjVsbzdodkUvSzZUcmlB?=
 =?utf-8?B?TWJ4RGFNdEtHTnhzSkF2YUdodi9Bd25uNjlOQTNiMFdlV0hMdjNnMlMzN3ZQ?=
 =?utf-8?B?VGxhSkVjZ1RIS20zazl2ektBVzhQU0YvbEdTdUMzL3lrNDhtU2NsbDluWkdZ?=
 =?utf-8?B?S1R1MVZyc0dqY1Rkcm1BWDlrRDlYSFZGeXFUbWVWcDVmQXBYdWhtVUhMejZK?=
 =?utf-8?B?djd1WlBIRFg1TzFicFNjZjRCVElNNllrdTR0dTBUUWRmcVFMU1Q0SjA4Q041?=
 =?utf-8?B?R0pMb3FyRkNMTFVCNHA1WVNKczRVSzJkSlhHQlhyQXdaQ0RzbkliV1JMMWs0?=
 =?utf-8?B?WlVjRU9kb2tuK0lBSkRwWmMvY1dEdVhGVlBRNGU2MXExUkRoNTFscHJuVnlV?=
 =?utf-8?B?dkZwTGRmUThZWUJ2YmpWc21nc3B2blZKc2xGbk90czhMVndYUjdpUGtqaXNm?=
 =?utf-8?B?SkdQb0VSV2JEaUZtdzFVM05obW1rM0dwUk1mbHBZQ3FHcWVDcGIwYnB0ZVBr?=
 =?utf-8?B?U1ViNitoalM4T2RDZEhpYjlUTTlxSUZabWw1dXdrcVdmQUdqK0c1OHRiTm9H?=
 =?utf-8?B?VGxlcW1tdU5mOXRGWU52NVIzTTBDTmRkcmFSZG9qckhRWDZ1RWxCZm0rbGN6?=
 =?utf-8?B?dGZYbkhMVHQ4OWl2T0lTOGtwMFI2M1dyaXZZajcyRWQ4eDZrSmhtejRoQW1O?=
 =?utf-8?B?eE0waisrZW90QjdDVE1Nc0prZDBwL0VsMzVLbG4ycGREWTVaMUM5VTNPNm9N?=
 =?utf-8?B?NVpQZVVYOW0ybGZmWjlIMDI2SzNDVVVmWm5PTFQ3SG9EVDJrUjRLR29vczVN?=
 =?utf-8?B?M2JhaEZOUDYxMzdUb3NxMENiM3pqL25aVlNwNUlqcU5BcTJzUTlSbEtyTk14?=
 =?utf-8?B?bm1qVEVnNlNlOGZsWmx2WGx5WFRrM3R1cHVCU25USGwzcmlXWEUxTmdTNTd2?=
 =?utf-8?B?cHlKVk91dXE4R0RFV1JxZzNrN0hyZmpXb2l6bVhVNGJyU09qWkY3NnBnd2p4?=
 =?utf-8?B?MHEra3c2WmphMThGV0lwZUxCSnoxUTE2cWlEUUZ2aDVDQ3V5cVZMem9mcmlz?=
 =?utf-8?B?eWloZ0NETVpoSi9lVmIwWDBWVnhKVC9rREMvVnkvZXBleE1JOFdUNGhpM05p?=
 =?utf-8?B?Nnl6ak9BZDRCalNraXIxaXh3dm9xcXBLOStaV2gydi9qTWdHdmVsdzNqZ1Nt?=
 =?utf-8?B?cHFjZ0R3ZTc1OVk1bm1TM29HeXFTWVg5MnlSZHIwT29paFdKNUNleU12SE1m?=
 =?utf-8?B?bndmcGNnbzdDc3FJNGc1Qkc0K29UNzNiOUNzTFJiTGliQkUxL2ZhcVg5WlR0?=
 =?utf-8?B?Rzhid0pCSjJsVHNXalMwTml2ZFNtS3huZ004SWw3U1BFWnJIQUtaMW9VUzVI?=
 =?utf-8?B?QWNyMi9YdE9NUnNxQ2NvakthYk9HaitRNVR6RXhmSjgyRElwV3pHeHYvV2t0?=
 =?utf-8?B?NlZQd0tsZHBWZE5WMmMvZDNxY0JsMktVdDV2S2JYSFBRUzJ4TFMyQmxKeXJq?=
 =?utf-8?B?SjRvVkJxNGtMSzhvK1oyOHJhV0J2Z3JaNFJmUlZtVWpqQ3MrUXFja2ZjcW5N?=
 =?utf-8?Q?4k2VZA/BCYmAAsLxQF1f1NLuNTO2K7zX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TU83bVhmbStTWmY3amtsVFNaZFN5Q2FnenB0MkNaV3YyUmFobUlUcmtkOGRl?=
 =?utf-8?B?WlBwaXJaRXByMzQ0QlBhUTBBK1Z4Mm9oY1BreGZEK3lZOFpESUVwWHY4aHFr?=
 =?utf-8?B?ZjhOT0RWbUNZcG5YVVRSUXFDQlZYOVNtakZmM0Jwd3hvdUFwY3lwMW9YZVll?=
 =?utf-8?B?L3VpcktvajlOMEQ4bDdaajZxL3k3WHVHUlBpSVppS2gyZ2lTZW5QcUdOZ3M1?=
 =?utf-8?B?dENDZ3lrdXVXcU9wYnFKWWdhTnJWQ2FIdDNpYVdicElQZTBQL0NXdGZpSHJ6?=
 =?utf-8?B?d3dOaFFJNFZDNkVBaE5zNENITkhUNGJtSUlnYVZ2ckhYQzRNcC8xRVBra0Y4?=
 =?utf-8?B?cUFTOWN0d0pSL05ITjF4ajBpTm1tVkhmZ3BJNjZTcjd1a2pnbXhCNE9qZ0xQ?=
 =?utf-8?B?OGVyRVloQXUvejE2MWpBZzRMSnFJWis1RXBvNHZRMXlTQlZ2R3Q5Z2RkMVJC?=
 =?utf-8?B?S1FSWWp6Q0dqYWVPeHhlUjVrNzB1Zk5HbHY1MEVTWUpmbjgxbGJ3ckxhQkZ0?=
 =?utf-8?B?RUNGVjA4VjN3U0lKZG1Bcms1S0h1VDlyVDU3b0VlRTMzYlltVkZZUGF2ZVQ2?=
 =?utf-8?B?dThzQi9OZGhBYzVDZnAydWhkZUNWWXhLZlloaWZWU04wQ3hpcTJraHRZeTBz?=
 =?utf-8?B?b3V3eTRxNWZHWTl1dUVCaDJkQVlWYTBOSlVkM0ttbU5LUkdiREtmUFVOYWNn?=
 =?utf-8?B?RnRSM29RK0NqL1FpVG9FRjNpZ0RUd243eTBsbDByc0ZFUHVjQnBkZHQ5WFFj?=
 =?utf-8?B?VHUvSHFnNHpKQ2dreUphS2p1Y2RBZ0NENVM2dkVTZDRhLysvdFlRbUIrL3Bx?=
 =?utf-8?B?aUt0dkhUYnpuelFQWFBvcGlvUXlGai9aRmFJZVVPSXVXS09uazF6MXpKRTRR?=
 =?utf-8?B?MmlTQkxNWFM0Y05aNmg5cjZheG5MQzAxUU1sSGFMZDV5NThhSkx1N29hZlBu?=
 =?utf-8?B?Q1RNOC94WUJ2Rnl2bW8wZ1FHVnhUOWh0Nkl3Q3l4MmI0V3p1L2svUmRPcEFP?=
 =?utf-8?B?ZFJGcVRHMGZhM25DYW9sMXJlQWtrWmFPczdXQTZQQVFRaWVadDFWOENEZGVL?=
 =?utf-8?B?cXVBbzhWU3lPMW1tWlQ2YWg4WnVuWGc4bGhxbXg4R0hEN3NFZ1BpV2l2UmI1?=
 =?utf-8?B?REZyaWErSFNOMHZQZXZqWitVMG1MUUdCV0xGYm5jcTdnRXZYMEx0UlMvZ2Y4?=
 =?utf-8?B?S3pRMVNwS0ZMRGlYS1g5SzV0QklhYnFXN3ZJbXhxUWorOGZEaFl6Q2tkYjJw?=
 =?utf-8?B?QlpSaThtcDcrQmZyUlpvMnFSejlZK0RVbmtWdHR1R1ZQS1UrVTEzRWNaWEdo?=
 =?utf-8?B?NXZvWWtvVkZlUDNXdFlOTjVBdThMcEQ4ZmR3QjY4Ky9UUUhDajVkMUlTMjNu?=
 =?utf-8?B?VE1YNjBzMm9QaDRhRGNWdWFYTkRDcXVYK1NIbURPdjN0UEpoVU5nSDRQem1o?=
 =?utf-8?B?QjdCK01jemJwL0hnd0d2RWhIRHpnajBZQ3VNQ3VZRjJ0ckwycTMyTUtaZGRY?=
 =?utf-8?B?WlY3bTU1RDd4a3Q0a0U4RG5IclloaVNZbFJnQS9hZHBMZzF1eitvT0ZJZmhG?=
 =?utf-8?B?SFpjTVluVk52anhrRkZIaDViblJ1YmhxOWpJRlo3eW5qV2dERlZKaUJVSHNq?=
 =?utf-8?B?bzV6REhXMWtPbEFHYm9PUVVjclVyQ3puYjVDR2NOUVJlSzRhdm9zdWdCL1gw?=
 =?utf-8?B?dmhqSXljcnYrdFV4bXY1RzRjbk8vMEwvTjU1Y2FPdFlzR1RXdGJoSkI5OFhN?=
 =?utf-8?B?U1dyOUpyWS8ycVh5YlpXd3c3clVyU0xhcWczb1RwYnl6dlRqaDZUdGU5d1VY?=
 =?utf-8?B?SndiTlhjQXhZNVZyKzc0WWxaYUtCUXJ6Nm81U3lpR1Z2a0wvWGc5L3ZMYXNL?=
 =?utf-8?B?Wk83dWZ5cGlDU2hlWHlqSlduTitzWHFpZ0NqS0pEUjdweEpiZUYrN2VPdzd4?=
 =?utf-8?B?QUNUa2IvU0tuSWdHckVRM2RNN20xd24zOEVxYjJaNTA1U2JxdDB0cmhBTkdV?=
 =?utf-8?B?aXhwRmVkK0F5eXFhWlJid3JneDJydllId1VOekJzdnJRcENVNGVlckw0eS9Y?=
 =?utf-8?B?QlVKeHJjNFdzd0JSeisrM3NRMWxmYTczNkI5cVdLeXFPVDZHVkF6dHA1Wmtq?=
 =?utf-8?Q?SY0PSMH45U6cM1iQeCNEZGMI1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7d8884-799d-4406-638e-08dd70e3b084
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 06:08:58.0764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CT8DTLCM16FSBL96NdDjW1VMxwtikqVv5I28ytihA/7p5r9s1ItU+E8ohbj4oAyIJG471qkHuQ9WYNYv7bwxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6290


在 2025/4/1 11:19, Vishal Moola (Oracle) 写道:
> On Tue, Apr 01, 2025 at 10:21:46AM +0800, Huan Yang wrote:
>> 在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
>>> On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
>>>> HI Vishal,
>>>>
>>>> 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
>>>>> Currently, users have to call vmap() or vmap_pfn() to map pages to
>>>>> kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
>>>>> without struct page). vmap() handles normal pages.
>>>>>
>>>>> With large folios, we may want to map ranges that only span
>>>>> part of a folio (i.e. mapping half of a 2Mb folio).
>>>>> vmap_file() will allow us to do so.
>>>> You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
>>>>
>>>> how to use, maybe I missed something? :)
>>> I took a look at the udma-buf code. Rather than iterating through the
>>> folios using pfns, you can calculate the corresponding file offsets
>>> (maybe you already have them?) to map the desired folios.
>> Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide
>>
>> random range of memfd  to udmabuf to use. For example:
>>
>> We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.
>>
>> This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.
> I was thinking you could call vmap_file() on every sub-range and use
> those addresses. It should work, we'd have to look at making udmabuf api's
> support it.

Hmmm, how to get contigous virtual address? Or there are a way to merge each split vmap's return address?

IMO, user invoke vmap want to map each scatter memory into contigous virtual address, but as your suggestion,

I think can't to this. :)

>
>> I think vmap_file based on address_space's range can't help.
> I'm not familiar with the memfd/gup code yet, but I'm fairly confident
> those memfds will have associated ->f_mappings that would suffice. They
> are file descriptors after all.
Agree with this.
>
>>>> And this API still aim to file vmap, Maybe not suitable for the problem I mentioned in:
>>>>
>>>> https://lore.kernel.org/lkml/20250312061513.1126496-1-link@vivo.com/
>>> I'm not sure which problem you're referring to, could you be more
>>> specific?
>> 1. udmabuf not same to file vmap usage
>>
>> 2. udmabuf can't use page struct if HVO hugetlb enabled and use.
> vmap_file() doesn't depend on tail page structs.
>
>> It still need pfn based vmap or folio's offset based range vmap.(Or, just simple reject HVO folio use vmap) :)
>>
>>>> Thanks,
>>>> Huan Yang
>>>>
>>>>> Create a function, vmap_file(), to map a specified range of a given
>>>>> file to kernel virtual space. vmap_file() is an in-kernel equivalent
>>>>> to mmap(), and can be useful for filesystems.
>>>>>
>>>>> ---
>>>>> v2:
>>>>>      - Reword cover letter to provide a clearer overview of the current
>>>>>      vmalloc APIs, and usefulness of vmap_file()
>>>>>      - EXPORT_SYMBOL_GPL() instead of EXPORT_SYMBOL()
>>>>>      - Provide support to partially map file folios
>>>>>      - Demote this to RFC while we look for users
>>>>> --
>>>>> I don't have a user for this function right now, but it will be
>>>>> useful as users start converting to using large folios. I'm just
>>>>> putting it out here for anyone that may find a use for it.
>>>>>
>>>>> This seems like the sensible way to implement it, but I'm open
>>>>> to tweaking the functions semantics.
>>>>>
>>>>> I've Cc-ed a couple people that mentioned they might be interested
>>>>> in using it.
>>>>>
>>>>> Vishal Moola (Oracle) (1):
>>>>>      mm/vmalloc: Introduce vmap_file()
>>>>>
>>>>>     include/linux/vmalloc.h |   2 +
>>>>>     mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
>>>>>     2 files changed, 115 insertions(+)
>>>>>
