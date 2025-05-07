Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC820E005
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746618288; cv=fail; b=gkMPHbTWtfSSnG15GXkFkowz9kN1oYhyuqItFPvHqdMlPZbmLHquOeg/bNNNavXOxgaiICgmfNRVO/9gmSX+rrtAhnc9JiF27Tdj1Es1hQvRM3g+wvoF7gPtmMhrL7Ml/qaV+zUCsWMxlPVAwQntZlxeBFQ8nfigYIkUHxjK4xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746618288; c=relaxed/simple;
	bh=NjQQVjksD7QCiO+9P2HG2JPuLfbhCDnKpvcvxhzhLg8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mdb1G87LjUpVQZJAg/an9h8pL6sSyMjkTN1tU4nB7miZp1FyRws3yv6pnWV8H/TUJtBugJDXlGC5LP0e6C03lM9K/hEi51zOhI7PnIR6/uR+VBYZwevLEkpLa3nkzDMwZ6P0eTqAbqXdJXCTh5jTIFc3FI0WmXb6lfEygkq2gaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=OTcrqshk; arc=fail smtp.client-ip=40.107.247.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="OTcrqshk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7Qa5DMSJYK5s6dcx0YUcXZPC3fvuNGH2hFEmr+LES5h3d1SsPSKsFt3CAC1GyT1gGI8k+LzbU7UbMLizbShUguGaHXOYPYM972lhHnR5vFQGyQDDXOM7rcCTvUanpiz3Vghua2emqJX0REYa8k6tqir6FM1+JSb7rHql2j4sjOEk4O23Raum/HlmgXfqHgk8sZOXz64PP0seYe8+4XxAI9zgrk8Ria+0lPDfpjR9l7ax4ZxWY/iG30IOCpf6bAcym1PcFT8jcfi9v5Vlu6duyj8mBlYOGS9rOVo0M9rZfI3WoDJvgHU2bInmvSj3q95aPCg2DE9nsN7K8BGMmUCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFS8b1eIlmIwNoiT3oYt8+iiXaRgQ6AFyHD/iVaPTQ0=;
 b=sD5z/bY0c6yOy707Z5WZpV5vALdJ9qQfcqGasbqr7Gf32rDbIK8YR0FaUd0bLmF/XVDHUf5Vp6SbynEdzN2eefHkKQL2Qb54z4+bFN6dkz9/PTUaHgqSMZTeW87mN2RCxLL61mnGB4XAVXnVHwLyrQL2mui+tRMfyGl/TlEvCMd1DL7Q7RBouWla6fyT+ifLl8xQOQV6Yueq0O/u9X5MJu6HITldIW+OrnT8teAqVOVAFAJyfAE/u1pTLr7OWpI504ZrEcXchOLxbmgYzHHfaKiJ2vLY9pDc1T9UAjcEZb+NFNa5lnkmSCUm2RD7qFdXiS5jollrQC9AYoPPRdSWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFS8b1eIlmIwNoiT3oYt8+iiXaRgQ6AFyHD/iVaPTQ0=;
 b=OTcrqshkxNQrVCw3sjFTzfPEiqG53XZL1JNxbEfwbxx7q1uVRyXiQZMMMDJLuluy3Otu4x19Nd2rUqueabY13x4e8Ob3cl6ZEIYRfoWvdeIDhe4y/x5x8q6B22L3Grmo7WUNmTrxKk2+rF3ZvSCTHH31zgHYnSFFl6VRTF+ER0uTlIh5QHQdaO+Lo3BQnYsbV+1hB097ZL9KSzQqeuZJ82na8YY5ppza+TpbWboPjXHnWx+gkNVjLTXAl8Y39TM1gkh1kn+QQ6ntBV/A61Y5BlFOmLMONxjNGsQreJeZVfk/Fbh8AEB5xp0fHxiILZH35KLdstOo26dGNhOYk7k1TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by DBBPR01MB10458.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:52b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 11:44:42 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%4]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 11:44:42 +0000
Message-ID: <968a59cb-2d10-444a-bdcf-55525159f1ba@kuka.com>
Date: Wed, 7 May 2025 13:44:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: madvise: no-op for MADV_NOHUGEPAGE if THP is
 disabled
To: Andrew Morton <akpm@linux-foundation.org>
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 yang@os.amperecomputing.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ignacio.MorenoGonzalez@kuka.com
References: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
 <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
 <20250506164004.e80e635a28dabb89b7257820@linux-foundation.org>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <20250506164004.e80e635a28dabb89b7257820@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|DBBPR01MB10458:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a08bfa-3a33-42ce-a287-08dd8d5c8e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXNrVEhyTjZpZE1qenB4bjNHZzdHUjV2WFUvNm9GMkQxcnU5OGNIamE2ejlo?=
 =?utf-8?B?S05zZTVvaEFMWGxSZ013N3RHbUhud2lSOVVrck5VeUlZUUR5b0Nxb2VRRTVO?=
 =?utf-8?B?bGF4SC8xRGh6UkgxRjh0amNuMEJmQnBhbzE3N0szMlBWUkZmandqcSt4dlVi?=
 =?utf-8?B?MlNwdm0vVjRWMjdwcUFkMWhMOXZ6cXFHblhIV2tXUmFaYVB5UVR4RlRDR3RZ?=
 =?utf-8?B?MzAvTWdLT2FjZnhyejhTRCs3U2ExTWdIT2luZnlXUnAwN3JMVm1hOW9aL2ZZ?=
 =?utf-8?B?ODMxeHYyamdjalhSYXVXNXZFWXg3Rm8zbmkwM2h4QVIwT0l2N3VROWpsSzJj?=
 =?utf-8?B?UGl5N1l4TUFZMmdSSnY5RVNtTUpoZ1hURGI3TUx6QTA2S3BPR3NQN3hmdHlJ?=
 =?utf-8?B?Qy9pMGZPM0dKYlhhNHYyaWI3eEFVZ005UTFsNTM4SWdCZi82MmFRUjVMYkxC?=
 =?utf-8?B?MUdSWVRHL3J3aWo5U09pbUl5UnpUeGRlT25hVDNZVDJENWVNZWl4Wi82MTFp?=
 =?utf-8?B?eTVvWi9wNGFQdWRXOGx5ekVSbmNTdUFuZ01iYlBkS0ZQOU1sekdmMVFaNlJR?=
 =?utf-8?B?WGR1eXRBMmdVb2hFMjBpZ3BXTjhPa1JOaDcwUmUwRTdLcVZHVmRKc0w5MzVP?=
 =?utf-8?B?RXdmc3J5ZXVrc2JrV2xTdUIwWThSUUp1NjlxckJlaWg0bGcxQVg2MzBmSDRt?=
 =?utf-8?B?bVRhL1czbmFXWll0RlJCRHF0c2RhbUgyOHJBbUVEbk5SSFVNMkVqdlhNS0Zy?=
 =?utf-8?B?MjFWQm1hQ3QrY2VSU2RvSDRpVWs3THNVbjkzL21sbEdPRjl4ME00NmNpWTRk?=
 =?utf-8?B?YUMxcFdCWlFyZzdMaWJCcGhsTzlKcXI0NjNXQ3IvU2JxYytuV2htUVBHcGJh?=
 =?utf-8?B?TUhMK2VuQVFGQlhjTFFidENrakpJc1U4SC9NZzNYL3MydkRTb3VVTWgxS0Zn?=
 =?utf-8?B?dis1Nit4RHQ2MEdwcm5UWlp2TGJEcVYyYkpuSkcwYWtuY2ZtandTbFJJV3F5?=
 =?utf-8?B?cUVlNGhScnJ1bzEwNWIyQzBYSWQ5YTFVM3Nha2I5eE0rR2o5N3FPT2lNODdC?=
 =?utf-8?B?KzRXV2RuR0E1MHpjb3Vtb09halJDNEszN2xlNkNCUVUvaDdqaFhQU0Q1NnFC?=
 =?utf-8?B?bWk4aHBBSHhEN0hUeUJNbzgzK3hQOXJ2UitmNXRFM3MyVk82WTUzT3RFQkhP?=
 =?utf-8?B?L2lSRHBoOVpQamx2akhFRURqZnB4VU5FNEN4THVqY1BuaGpZQU9TdUpzOW1l?=
 =?utf-8?B?aUozWnd0ZEdUSjVKWEE3L2ZHNVVlM3c5REZURHVtSjVRSmFXY0JIZWpMT2hz?=
 =?utf-8?B?UWZObnlWWHBod2xrOWJMV3YxaXIzeUFFQVBCSldyVnJ1NmZRdG4xRlJ2b29U?=
 =?utf-8?B?Nmc2cVpyS0U4SmVaZndhbncvVFMxN3B3UDFsL3ErTlkzVUVDU21VOHFUKy9r?=
 =?utf-8?B?THlUb2Vsd0twTUZSTmpBVEw0M0lGZnJ1aTVNZVNncnVFUVpSV1JqbU9rNVUr?=
 =?utf-8?B?K2FvSjZQa2VTeVIyRHFxc1RJeHYvcTBKRG5wbFdNdFdESkxnMWpnSURTNzVk?=
 =?utf-8?B?ZzlPSDIySHJXandNYVIzb1dPMXMxaUVXWUxncnVXd09rYkova0lpc2dEWC8w?=
 =?utf-8?B?YXUybDZqYWxnL3ZXYkVVNHBnM05JYWVnek13ZzgxZWVES1BvN3F3SzBhNHdG?=
 =?utf-8?B?OExHaG5rZFR1bGlhdVlub2VTcXB6emgxY0lqY1hkWkdVUG1wNjltNkFENnpV?=
 =?utf-8?B?SU8vcTlpUE9sOUlKdjhpSWdYZTMrN2J3Nnk2a1VDN1FyTjBsWkxIaWxRSVo4?=
 =?utf-8?B?WmZ0UnpiWmNtVmVMR0FNR2t4NXRnQml2YzFPWTNQTXQ5S0p1V25iSjczNkt5?=
 =?utf-8?B?b2RuSkVwKzV0RW1ReGltRlBrYytiallLekordGRkWnU1blpsNUVWMndkUE9C?=
 =?utf-8?Q?YzfaVx5G9Ds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVNwSUxaUlU0YjZNd3hLaStKRnpITTAzSkVJZVRaYlA0WTE3K045ZVU1ZmQz?=
 =?utf-8?B?a0Y4NGxJUTRraDdndXlURTFTQm9XdmlBR2F0RTJPUGFLaW5lVHhGUmJ4dFZh?=
 =?utf-8?B?cHFYYTlDV1RveGNUb2dxVjdGRDFoOW9OOWZxUzZ5YVhBY0N2bnNtbGVNK0Rn?=
 =?utf-8?B?dGcrVnhQbkVlMVRXMDdHQUVlaHRtNkNPYUdKVkhIRDFLOERGbEpxVnNGbkEw?=
 =?utf-8?B?dExoM1J2V0h0d3NPeFVjQWZpK2JOMXJDa0I5cTdYMDRNY0RRN3ZQNWFERFJv?=
 =?utf-8?B?QWd4bWY4OXZKaWQvWU43MldqbkRTMjRYV2NWaGRINTJ4QWNkUmFIZGJTVE80?=
 =?utf-8?B?M1Z0bnpndWNza0l6U21mREFPZy8vTmFQQVdRcnlzTm1rQXp5WHY3RktPUUtK?=
 =?utf-8?B?VzJCV0Y3RkxZVkk5dHpZTStua3orbnFWeXhaYXlyWUpJczQwNXVVQ1A4emwx?=
 =?utf-8?B?UGpiZ0J5a1I5a3dZRXFFckRWekY2ZXVXanhSOEhtMFJYVGJ4VGphekRaRnhL?=
 =?utf-8?B?U0pURCsyc3c5SHpyREhFL3AweHNLSVNYRzFZOXZLY29WT1JPYVQ0bFBjb1lO?=
 =?utf-8?B?b3VpVFpHRy9mQTVDVDd3N3ZPMVBJZTQ2UGcySk0xSDNtWThoa3owQWs3TjJK?=
 =?utf-8?B?Y25pK3RaMGNlRmZiTUszR0QwdjU2SmtxWFQvUWpRc2VoNlNRSzd1ZU5WVXlL?=
 =?utf-8?B?RmQydEtnbHlydnVDZDlMS1FnNlhDV09BeW44UWRldTlPL1dVNHB1MVNMVVVV?=
 =?utf-8?B?UVVVNU9tc1JqV2xVbXRXOTNQSFhaMEw4cXNEQ0JqN2NiZkkvdjBVelpJcUda?=
 =?utf-8?B?WUt6MS9QekJUelE4RUp5MEExV3VFcWx1UFpPNFphTm42eE1tOGwyRk5wUllJ?=
 =?utf-8?B?UWtxdGxlb29HTHZxejlOaEtBNHFFNnNKOFRhK3pzR3lmazE2dlFUUkdyWFE4?=
 =?utf-8?B?MkJBd2UwcU56Uk82NDdlbkhxdS9LNWhKKzY1YWJVMExsVGJKbTgrNFBCN0Vm?=
 =?utf-8?B?MGIrVjJCTUtCYU5rMmlGTlcyL2w1MXJ5bDB1VXpNK3ZnTWY3V3dDclE4SHM3?=
 =?utf-8?B?VmZuY0RRN0VqL3NvRXJzZ2VVZkNiWVVmcEtPNUE0c0FvMHBucnVCb3ZuK3Zt?=
 =?utf-8?B?UzBUZ09aRkFaVnFGN0RMQXg4L01YeVVpSURCbkdiQVpJNE1uekp5T0I5aUdw?=
 =?utf-8?B?alAzUnZxcVNnaVZXc0VoN3NWWit1dmQyUTBUME9qU0xOUFp0SnlmdUFFS2RO?=
 =?utf-8?B?alpFTjg5NkNBRG1FUjR3Q0ZZbzZBTU94RnRlWDY0MG9Dc1dFMndKQWw3ZTNL?=
 =?utf-8?B?RUZxRCtLOU1zRmlpc0NaY3NxYytKc0VBUzFqQURVTnhabmlnKzdueFpCZjJR?=
 =?utf-8?B?eXZwd0hRMS9XZmo2Tnc1NzhaU053K3Q1VVpvY2NUaTQ1TWNoUUlHNXZ3Wm12?=
 =?utf-8?B?Z3ZxTlIyUFo1dU1hbW8vYWc1dmZ3MEh2aW5BT2xXWnVMdHZURmk2elBmOVov?=
 =?utf-8?B?VzYrMXZWSlY5dnlaQ0Eyb2Q1Yi9tcUlzcXRBQkR6UUpnNmY5N0JVUWcreDBy?=
 =?utf-8?B?cmduWlVsbjFtdlh6a01PRFFBSlFLUUNJbjh2UFVKeUEyMU9ZNXNxcmFnUG1Q?=
 =?utf-8?B?SkpHRmNOS1ZoUCt3cnc0YVBMT3NXT1NUNHRBSU02bllVTm12VjVrZkpOUXFF?=
 =?utf-8?B?WGpQN2hpL3psQXAwSXhhY3ZuVXcwRVJNNVZNVlZuRTlyWlU5TmV3ZFNtSzRC?=
 =?utf-8?B?STBISWpuc2NWSE5uTWV5MWRKSFYwaU5nOFdFTjk2cGVOR3ZqV2RsYWttbEly?=
 =?utf-8?B?WEZLc3BsaVBzNE1KNThORHBMZk9aVUd2amV6TXRDY2JLRE5LdVJ1UnNydUR4?=
 =?utf-8?B?RFlwYWcyVHEvdHVuM3ZJWlJRZlF3cUlvS3BsWDZ0TVJ0bmEzSXgzUGJsaW1R?=
 =?utf-8?B?cGVORC9mYnNvVGxPNm1zMGJIZWlMWUdXeE9VNGNSUjYxb3dtVGFTYi9VTWd2?=
 =?utf-8?B?d21RTjJyemhiWWhxL1R4dnNTbWE5UEhqUU00Y2xtc1dPMU9EUk85V3hvNW9u?=
 =?utf-8?B?a1ZWRDJteHYwNS9QTC9BenYrL2llRmU0V1I5N1ZiM3NWcThLdW15ZzFnSzFW?=
 =?utf-8?B?SHdoOGdsMTNqVkZVUWpSSXZTUjB2V3hzVHYxN1B3Qkdjc1lrbThFdXk3cHp6?=
 =?utf-8?Q?X6M8fI0vtr4ARyjGlM7E+Yg=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a08bfa-3a33-42ce-a287-08dd8d5c8e41
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 11:44:42.1113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4x8gBszWysW0yC/180m7kjaNU0A6YplUGPOpSamHT0JybOvrTtqLbvkmj6SAYJEWqhzlfB5/IhH3uCX9t/d0ojBYFNiFl1LzVlORiJUyCck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR01MB10458

This patch resulted from the discussion on [0]. The issue I described there consisted of two aspects:

  - CRIU saw a memory mapping containing the "nh" flag on a !THP kernel. This was addressed by my submission.
  - CRIU tried to set the "nh" flag with madvise(), which resulted on -EINVAL.

The issue is actually solved with the patch I submitted. But it was also discussed that calling madvise() with VM_NOHUGEPAGE should be a no-op and should not fail. That's why this patch was created.

On 5/7/2025 1:40 AM, Andrew Morton wrote:
>> +#ifndef CONFIG_TRANSPARENT_HUGEPAGE
>> +#include <uapi/asm-generic/mman-common.h>
>> +#endif
> 
> Why is the #ifndef here?

Because this is only included for the definition of VM_NOHUGEPAGE, which is only needed for the !THP case. 
> This is the only file under include/linux which directly includes
> something from uapi/asm-generic.  Indicates that we're doing something
> wrong.

If we want to differentiate the behavior of hugepage_madvise() depending on the advice, then we need the definitions for the different advices... Maybe this is not the correct place to do this? We could also do that differentiation in madvise.c. 

> If this hunk is truly the correct approach then I think we need a
> comment here fully explaining what is going on.   Because it looks odd!
To me, differentiating the behaviour of madvise() for MADV_HUGEPAGE and MADV_NOHUGEPAGE seems ok, and that was also the consensus on [0]. However, I lack the expertise to determine if this is the best place in the code to implement this change. Perhaps Lorenzo or Matthew can provide feedback here.


[0]: https://lore.kernel.org/linux-mm/20250502-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v1-1-113cc634cd51@kuka.com/
