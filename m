Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD10A1798F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749706550; cv=fail; b=ReU27Tl9fIj7Y0OM/m8MLf/PmJW1m2eUOys4DmbGLv754hBgii+zFviuTNQ5BKcZHELW3dH09osFOQxGBdPFvYKsj68zYjTGpPrViwFAn6JND2PrcKtxX4I3NatUl+ZewWZ1xYlE41STntQ3cbd/jviaD/QDST9xujXtldskExw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749706550; c=relaxed/simple;
	bh=1Wog81k5a1M/o7Qy5xuA8tMbj9UfkhcDGZwkcXsmCMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fqg3+4pL51vC/CMwakZb3/xYxJejyCeAFCaVti9CBHAZKtg29XqEveXxjJ88Xp8jkZy0194B7EAjCrmSIhh1YNAJ9Cw0JrAXFvP1WaPOu6s1mzh//DvTII0q8pQMt7lCp7oCL6Ga591lAjoMWjOTAn794W+AYvbXZqmvH+DIU3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xirlR6vE; arc=fail smtp.client-ip=40.107.220.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xirlR6vE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbejGXeSYvLxdEKqULdlyCrcWh0Zr9md3X2p20+AIq4zxP6jdVa0Yk8AxMeIfLkLzZf+TqrQjlBLfunwfcySMVagR/mvr6uGO2q2PgAHsXTRHuOx2HDULsI9jL9uBsVFXyQI51c0wZmFXIakEvQTTEUL40Jgxp0PEqeH9U6sCHO3rzHqvHFLhKhEDWkEaQj05l/TO6JauaG/AgTVNomVmiIeFuy2t8HbChDYcv3dxezgnJ/M0tHVOe4WGGVSBhN4EGpUWHm7QBUFw93urqpIKdAymhlxrvbE5rF45cbk7Z+JVi/TXAI9cY1yr5dobPXhQinTyyyNDZoR9Bsm0dihlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk1uBSFMRyGg6/shz1lEjRoik28t9fvHE0E1e+ouhNA=;
 b=TX+im8bQ+HoTpy+F3nesIzFZU0D7SSyCKIlTFuFhgYVsZZPe7ATTrRmQIUSXPYqxjCrKZvu5UOfFpntWgsnCdzmSMmQ6+A1+oR5rw7drmmnIKuLRocBtZQj2MvNklbNJwSzhc9fbfnfC9KSL1feFWxD16jtOo8k+aCZV/h6YqXTaPUPEXZNLqhEYdo2IEj+a2+kShkO4lR4Q8eSS6/jGNhVd0sJ3xL+/BRU2pnQP28XxxyX2q2VsQ7dJWPj1H20rdNWxWxvq8WfedNkVTjDA4NZvbtw6gSNRT33MDYw36k+7gAHFKs+loC4v+gAUz275Vtlm7qK2s2ysOa7VPrSAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk1uBSFMRyGg6/shz1lEjRoik28t9fvHE0E1e+ouhNA=;
 b=xirlR6vE29ulJW/hVKbGFG8dh49TsTSByahFLc8EeCDc2L64ZLOhuLFK8sEMrR2zi5wn024M9SGalQBbi8CpPN652NKFtgaUFQn+7ueKWezj2KKjr6Liy40a4BCS3Ce7fhWi7+25ZfIDWRy2CU7TB4m92OzuV7RMHTbfwNKyBPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 05:35:46 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.040; Thu, 12 Jun 2025
 05:35:46 +0000
Message-ID: <4d156476-af35-4f0e-ab68-a3119b9a5a2e@amd.com>
Date: Thu, 12 Jun 2025 11:05:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] sched/topology: Add lock guard support
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guitcct <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org
References: <20250605120424.14756-1-jemmywong512@gmail.com>
 <20250605120424.14756-2-jemmywong512@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250605120424.14756-2-jemmywong512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::6) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b1de26-c4bc-4dae-9fd8-08dda972fad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzlML1VTcXp2aExWK2szektIbkpVQ0ZMQVp5am1EODR0WnhGc0UzbUJOUGpX?=
 =?utf-8?B?YVk1alBEamFlME56cE9BMXdtanllUEJGTm00OUI1a1pqTkxPdkNkbncybkF5?=
 =?utf-8?B?SzJsMkFYNUlaTVZnb25oeW01K1hCQitRU1lFMGtSZ01BdWlReTg3WjFFSFJ3?=
 =?utf-8?B?U2VmeG5EWEhpWEhXelI3dXBRY29MOEg1MkhkUnlZUkQ2SjREQm5ZN3RXZHFZ?=
 =?utf-8?B?Qy95VzhGVUVubUtPUjh5Vlp6cHB2Ri85ZFlvSjBuTHBnTHBidlpzMUE2eFoz?=
 =?utf-8?B?dmVVd1VaTVRpWWVTOXVvaHp0WXRzWjkrNFlrQm1RREV5Rk44QjUzeGJyYUxD?=
 =?utf-8?B?WVc4SlE3VHpqc2lHcFZJMHFtaHNLWHc0WStteGVxR1BQdGNzeW1NamV2SmZn?=
 =?utf-8?B?aEFoRS9qREdsVm5YMTFLVUV1ZmFnUy9GNW8zVCtmYXFvelBGQXdrUDRhNktD?=
 =?utf-8?B?UTlzMG9NUVhBRFFTc2dpNkhOVDl3VmM2UVpWOTRlN203UXNveGIzT0xyWG9H?=
 =?utf-8?B?OHdPbnhNNnBPUTU1MWdYMWl5UEdsZXZvaWwyRGcxNTd4dHhOU2xlUzYwd1Vw?=
 =?utf-8?B?TjdCWHBqT1c5U01OQkoyVVgvRGlEYjZ0Nm9yRzR0VHRxQkdSRkRhbnBCSDNV?=
 =?utf-8?B?ZURpTVhacXVFdzl5cEhydzJaNHJMVk80Q29RYkhOYTBPa3R5bDJET3V2WHcx?=
 =?utf-8?B?REpSOUpJbG54UTdySmZnWmhEeDNkUktCeVhqbEZXZDFjcmg0Q2hIY0xMaEJI?=
 =?utf-8?B?V2dnc0NoL0ltOXp1THJadlBEbnZLZVk4T281YVo2OVJQTVpJLzNhTEFRVmlO?=
 =?utf-8?B?dHd2ZDFOV1E3UmFzdmhsa2o3V2p1WXdISmJWRFZvUGVJUGRJQWpPUmpaQ0li?=
 =?utf-8?B?UE4xV1JhUHRvYXBLQ3YvOUVsM3c3LzZHdzBlRWNPeHUrSTN1UFJLTk4ydmtL?=
 =?utf-8?B?eE9PeHVHUEMxdmE0NTNmZDRTeFlUMmVsUTBMOWtEbXo1RjhaSFpPVDFTbTB6?=
 =?utf-8?B?cWM1b1cxc0UyeW1yQXN5MlUwSXBUay9TZ3cxSWJMbEFuTjUrRXoxeTVVTUFS?=
 =?utf-8?B?bG5OQUx4L3ZpcmNyQ0pocjNybW03NVBRMzlxVktKT1FkLzhZSHF2MmdmcEV1?=
 =?utf-8?B?QzBCcThKL0ZkVkNGWEU3SVZtZkV3SmE1U01jNEFlM2V5bk5FdFEzWkVRc1Zm?=
 =?utf-8?B?Yzg1c0ZlMDNFUDAzbThGYlNKTG1tb0ppb3RTWlhRNUdkcFc1NTlWZmhUc0ht?=
 =?utf-8?B?OEE0dlJqaGQ3RThIaXZPZEVUWkhlOWtZYkJncEZvaHE1MEkzbG5seEo3WXJy?=
 =?utf-8?B?a0c5OElKRFNvU1pyRW5MbmVUeE80cnlBaVZ4bTd5em9nL1h4SC9tM2FsZ2cv?=
 =?utf-8?B?UmpFaXgxanlhTEVjUmVyVm5qLzVISVVDTzUzbTByNDVpMmdTV1E3c2U2LzlI?=
 =?utf-8?B?RXdXUDZSZXhzSGpVaDAwYjk0NjBEOVd5TnpaZUc4d3NzM21Gc2MzbFpxQnhP?=
 =?utf-8?B?dHd1b0N3aHB2N0JEeFFPVjIrMDEyc0pER00rOWJKaGJJUFMrREwxKzZzcVo3?=
 =?utf-8?B?bzJLRUNkTTRDVzE2THVwbnVsbThYNHhURlRkYTBIbHo5THZnL0UzOVBiTGh1?=
 =?utf-8?B?bFhsMTlVYk05VzdqeXQ5UzVIL2pGbnhRNnpLLy9EY3JsMkhrMVFrNk9BdkYy?=
 =?utf-8?B?VTNsLzl4WE4ydUFFZS9pME9TYnB2amhZTWRwZ240YWtmR1BORWxZNERDakVs?=
 =?utf-8?B?cXZDMHdCMm15NGptMk0vc29pWVdqZjBkSlpzTXphUjh6WHB1d2Y3TWcwUVJu?=
 =?utf-8?B?bHVlbmxmcjRKbzkyREVjVkVXZmx4U3cwQzZBZE54eHdROThycDZOazMxWjBq?=
 =?utf-8?B?UG1LZkl0UU1Jei9tbFoyN3FXbUYzK3UwZDN6UnhtUVRYRkVIN1lPMGxjQnkz?=
 =?utf-8?Q?o/P0DyFqHNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU8yNlRNRGo0TGxDK1FPdEU5d1JYMnBSNkVaUkxYQUNwdEV6VlFRWVFJaHRj?=
 =?utf-8?B?TUUzWDRSdzZPdFl1MGlSQWZNbEdrbEpqZ2RwYWcyQndkdytNMXNWNW16TzdY?=
 =?utf-8?B?QTNPTEowelRJMHB6QTVkRWo0eEpmSVRONEJtOG9xM0pQOUJsMjJiSm5mdUtW?=
 =?utf-8?B?V2hIVmgwOFp1SmlRbEZxUndJeDMwNXFESGd1R1pVbFBkZnkvK0lISG9GTnZ6?=
 =?utf-8?B?Z2cvaThaUFdFcUZnUVFvYzNubmM4aGEwdmpRNlY4QVZUakRreFZKL1JWdEQ3?=
 =?utf-8?B?WnNweHlJNzlOYjVKenZwVSt5NHEwRTcwcWk1TXVqRGJUd2o0N3p4UTliSndR?=
 =?utf-8?B?Q2lBYmlEajFxcllCKys3NnFKWUlVUkxRekhqZkVMNnlPeUxoRXlLdVZwNVdU?=
 =?utf-8?B?Z0lJa0tYZkFKMkhzRzB2cElkRlBlS2tqbkV6aVdlYWRkYy83QTRZTkFyZnBz?=
 =?utf-8?B?elIwSWVmZ1RtK0JEMXltQjA0aWl5cHh0a2s4bVU4V0Vhb0xNSjBlenlFbW9E?=
 =?utf-8?B?dXJlSUs0dHFNTG8vWEFVbThJMmt3cGtXM0N0VU9BK0lpQzZhRVpjL1J4b01U?=
 =?utf-8?B?K3lwRU93VktkaXpTT2FoMXZYYk9kSTFEN0E4QXhoWHM4bThPa1grVGtQNllw?=
 =?utf-8?B?UGp1aUlyaS9BMi9rcUZrZGVNd3JrNUQwT3hraTZyUlEwTDk2YUxYVG1GWmVG?=
 =?utf-8?B?V2VBeGtLU0puR0txdUQwTkxOcGRRWGxMSloyRTJCUENqYlFPMW5qNDAzVE5x?=
 =?utf-8?B?cGprbFdRVzROWEphU2U4LzJ6M0hsL0JBNUFIQmtyZ2lOVlVuZWU3TjB5Ri96?=
 =?utf-8?B?UkhjNDB1cG5OSnlBVlJ4cWVrcjNRWmFrWXpSN0VCemR1cVI1ZFp2L2s1bEJE?=
 =?utf-8?B?RjBRNEttZ2hCdTFVd0JEMjcwcklIRlNVVFJNaHRvTGdpRUJSditMTm43RTZC?=
 =?utf-8?B?Z3djS3J3MUJPcGRPUEJUcFZrS2J0RDZUK0JUeUZDWm5tekg0NDBVYVI4STRq?=
 =?utf-8?B?K1N3aXpCQ0RqbTF0V1JrazZxV0pYUDJpRDc2cjByR3B3VlUrL01ocDkrN1I1?=
 =?utf-8?B?ZmF2eHg1M2ZDN0JUM0VsamQxWVRIS1B5OHFzbHRvZjQ0cUtEdks1ZWJqRVdl?=
 =?utf-8?B?L0tHVGdWbjZ5azErUS9iVFRreXE0cTgzZ2psUnJLaS8vUmx0aG9WK2ZFRldv?=
 =?utf-8?B?NnRyTC94YzFNNVlJS1ZaWE1TVmFWclRncFdLdjdaSnhCeXFYY1B6MGQzcDh1?=
 =?utf-8?B?cW1WT3VIRUlDdmdqV2VhVlBUTUMrekVzN05RK2t1eWVJbmdDMW5mSUlkL1FY?=
 =?utf-8?B?YTJucWIxenFNbTRFcmdBZnhmWlYvUFdRVjdBTmg2Q2hpT1Z3QlRsV2o0TXVX?=
 =?utf-8?B?MDRzb2d3d2xXLzFGcE0wc0lhLzA4bXV5R2tuc3lJMmNnd3VQY25ZZm13a3dl?=
 =?utf-8?B?RS9jbitaVENDbXltZkZ5ektnQkZBK09iYzJpWWNQTmhldE9vT3c3cERkU3JW?=
 =?utf-8?B?WXJtZXRlUGtsYmZvaUkvL1BWekVVVFFTRGc5ZVM5NVdMemovcXVHNHcxeG9F?=
 =?utf-8?B?UGpKUUI3MURXeTUxRklKVXRkM0xUN2h3QW1RL0VaUW8vZC9mOUl0NnBINkhN?=
 =?utf-8?B?aUlzaGk2OHptK2cwRkRwRnIzdndqNFlHN0ZCWmo5ZTNDSktkb1B6azNvZldB?=
 =?utf-8?B?NVRWSDViTW5MOVV1U2N4UW16YzlPZThXaVRLbzRCMzdKZU4yTU1xb29IUGJi?=
 =?utf-8?B?TWp1S2pLNTJNdXNPY3RCaFg4S21IUit5YXRlNU5qWUk1b0EwRXFuRGgxbUxF?=
 =?utf-8?B?L1VXTG43a3dZUW9ZUGhvM2lzdWdhdG5yK0ZGOTdJelRJQWljNTZMMWJPRjZa?=
 =?utf-8?B?R3lwb0pzWkZjbkF4aVpCN1ZDMCszQWZhdnNCdmthcy8vK24vOTY2R3NqbFpG?=
 =?utf-8?B?U0VTU1dtZERQRE5XWFR6MFA1dDNKK1I4eXY0dEc4aUErMFZTYkRXYmdJOGw3?=
 =?utf-8?B?UkF1VVNOUVJYcVQwQmdTMkZ4SkNVMTIrbmpYdjRXajRCbnRBS3h1OS8rRmdT?=
 =?utf-8?B?M0Yvb2c0TXN5WHV1L3ZtRzNVaEpHbUovckRybko1cHVlblJ3YXQxMDRHTFlv?=
 =?utf-8?Q?uD3tV8TLbtcurVnI6RMaPthqJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b1de26-c4bc-4dae-9fd8-08dda972fad4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:35:46.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfq2vSbe4bxlXyIJ3aIpHsRvENNOwOOHwCIsEu83c78xS1khQjEa+35mbTbJ0yN2Fs9zC2kSPe5ceu8dzg5F0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565

Hello Jeremy,

Sorry for the delay!

On 6/5/2025 5:34 PM, Jemmy Wong wrote:
> This change replaces manual lock acquisition and release with lock guards
> to improve code robustness and reduce the risk of lock mismanagement.
> No functional changes to the scheduler topology logic are introduced.
> 
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>

I have few comments below but other than that, I tested the patch with a
combination of hotplug and cpusets going concurrently and did not see
any issues. Feel free to add:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

> 
> ---
>   include/linux/sched.h   |  11 ++--
>   kernel/sched/core.c     |   6 +--
>   kernel/sched/debug.c    |  13 ++---
>   kernel/sched/rt.c       |  35 ++++++------
>   kernel/sched/topology.c | 115 +++++++++++++++++-----------------------
>   5 files changed, 81 insertions(+), 99 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 4f78a64beb52..10a9d6083b72 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -46,6 +46,7 @@
>   #include <linux/rv.h>
>   #include <linux/uidgid_types.h>
>   #include <linux/tracepoint-defs.h>
> +#include <linux/mutex.h>
>   #include <asm/kmap_size.h>
>   
>   /* task_struct member predeclarations (sorted alphabetically): */
> @@ -395,14 +396,14 @@ enum uclamp_id {
>   	UCLAMP_CNT
>   };
>   
> +extern struct mutex sched_domains_mutex;
>   #ifdef CONFIG_SMP
>   extern struct root_domain def_root_domain;
> -extern struct mutex sched_domains_mutex;
> -extern void sched_domains_mutex_lock(void);
> -extern void sched_domains_mutex_unlock(void);
> +DEFINE_LOCK_GUARD_0(sched_domains_mutex,
> +	mutex_lock(&sched_domains_mutex),
> +	mutex_unlock(&sched_domains_mutex))
>   #else
> -static inline void sched_domains_mutex_lock(void) { }
> -static inline void sched_domains_mutex_unlock(void) { }
> +DEFINE_LOCK_GUARD_0(sched_domains_mutex, ,)
>   #endif
>   
>   struct sched_param {
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index dce50fa57471..b2b7a0cae95a 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8457,9 +8457,9 @@ void __init sched_init_smp(void)
>   	 * CPU masks are stable and all blatant races in the below code cannot
>   	 * happen.
>   	 */
> -	sched_domains_mutex_lock();
> -	sched_init_domains(cpu_active_mask);
> -	sched_domains_mutex_unlock();
> +	scoped_guard(sched_domains_mutex) {
> +		sched_init_domains(cpu_active_mask);
> +	}

Since sched_init_domains() is only called once during init from here,
perhaps you can move the guard() within sched_init_domains() and avoid
the scoped_guard() here in the caller.

>   
>   	/* Move init over to a non-isolated CPU */
>   	if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_TYPE_DOMAIN)) < 0)
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 9d71baf08075..1c00016fd54c 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -293,8 +293,8 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
>   	ssize_t result;
>   	bool orig;
>   
> -	cpus_read_lock();
> -	sched_domains_mutex_lock();
> +	guard(cpus_read_lock)();
> +	guard(sched_domains_mutex)();
>   
>   	orig = sched_debug_verbose;
>   	result = debugfs_write_file_bool(filp, ubuf, cnt, ppos);
> @@ -306,9 +306,6 @@ static ssize_t sched_verbose_write(struct file *filp, const char __user *ubuf,
>   		sd_dentry = NULL;
>   	}
>   
> -	sched_domains_mutex_unlock();
> -	cpus_read_unlock();
> -
>   	return result;
>   }
>   #else
> @@ -517,9 +514,9 @@ static __init int sched_init_debug(void)
>   	debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, &sysctl_sched_migration_cost);
>   	debugfs_create_u32("nr_migrate", 0644, debugfs_sched, &sysctl_sched_nr_migrate);
>   
> -	sched_domains_mutex_lock();
> -	update_sched_domain_debugfs();
> -	sched_domains_mutex_unlock();
> +	scoped_guard(sched_domains_mutex) {
> +		update_sched_domain_debugfs();
> +	}
>   #endif
>   
>   #ifdef CONFIG_NUMA_BALANCING
> diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
> index e40422c37033..3533b471b015 100644
> --- a/kernel/sched/rt.c
> +++ b/kernel/sched/rt.c
> @@ -2920,36 +2920,37 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
>   	static DEFINE_MUTEX(mutex);
>   	int ret;
>   
> -	mutex_lock(&mutex);
> -	sched_domains_mutex_lock();
> +	guard(mutex)(&mutex);
> +	guard(sched_domains_mutex)();
> +
>   	old_period = sysctl_sched_rt_period;
>   	old_runtime = sysctl_sched_rt_runtime;
>   
>   	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
>   
>   	if (!ret && write) {
> -		ret = sched_rt_global_validate();
> -		if (ret)
> -			goto undo;
> +		do {

Instead of this do-while loop that runs once, how about:

     static int sched_validate_constraints()
     {
         int ret;

         ret = sched_rt_global_validate();
         if (ret)
             return ret;

         ... /* similarly for dl_global_validate, rt_global_constraints */

         sched_rt_do_global();
         sched_dl_do_global();

         return 0;
     }

     staic int sched_rt_handler()
     {
         ...

         ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
         if (ret || !write)
             return ret;

         ret = sched_validate_constraints();
         if (ret) {
             sysctl_sched_rt_period = old_period;
             sysctl_sched_rt_runtime = old_runtime;
         }

         return ret;
     }

> +			ret = sched_rt_global_validate();
> +			if (ret)
> +				break;
>   
> -		ret = sched_dl_global_validate();
> -		if (ret)
> -			goto undo;
> +			ret = sched_dl_global_validate();
> +			if (ret)
> +				break;
>   
> -		ret = sched_rt_global_constraints();
> -		if (ret)
> -			goto undo;
> +			ret = sched_rt_global_constraints();
> +			if (ret)
> +				break;
>   
> -		sched_rt_do_global();
> -		sched_dl_do_global();
> +			sched_rt_do_global();
> +			sched_dl_do_global();
> +		} while (0);
>   	}
> -	if (0) {
> -undo:
> +
> +	if (ret) {

Previously "!write" cases and early ret from proc_dointvec_minmax()
wouldn't do this. It doesn't hurt but it is wasteful and can be avoided
using the pattern from the above suggestion.

>   		sysctl_sched_rt_period = old_period;
>   		sysctl_sched_rt_runtime = old_runtime;
>   	}
> -	sched_domains_mutex_unlock();
> -	mutex_unlock(&mutex);
>   
>   	return ret;
>   }
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index b958fe48e020..3f89f969666c 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -6,14 +6,6 @@
>   #include <linux/bsearch.h>
>   
>   DEFINE_MUTEX(sched_domains_mutex);
> -void sched_domains_mutex_lock(void)
> -{
> -	mutex_lock(&sched_domains_mutex);
> -}
> -void sched_domains_mutex_unlock(void)
> -{
> -	mutex_unlock(&sched_domains_mutex);
> -}
>   
>   /* Protected by sched_domains_mutex: */
>   static cpumask_var_t sched_domains_tmpmask;
> @@ -470,44 +462,41 @@ static void free_rootdomain(struct rcu_head *rcu)
>   void rq_attach_root(struct rq *rq, struct root_domain *rd)
>   {
>   	struct root_domain *old_rd = NULL;
> -	struct rq_flags rf;
>   
> -	rq_lock_irqsave(rq, &rf);
> +	scoped_guard(rq_lock_irqsave, rq) {
> +		if (rq->rd) {
> +			old_rd = rq->rd;
>   
> -	if (rq->rd) {
> -		old_rd = rq->rd;
> +			if (cpumask_test_cpu(rq->cpu, old_rd->online))
> +				set_rq_offline(rq);
> +
> +			cpumask_clear_cpu(rq->cpu, old_rd->span);
> +
> +			/*
> +			 * If we don't want to free the old_rd yet then
> +			 * set old_rd to NULL to skip the freeing later
> +			 * in this function:
> +			 */
> +			if (!atomic_dec_and_test(&old_rd->refcount))
> +				old_rd = NULL;
> +		}
>   
> -		if (cpumask_test_cpu(rq->cpu, old_rd->online))
> -			set_rq_offline(rq);
> +		atomic_inc(&rd->refcount);
> +		rq->rd = rd;
>   
> -		cpumask_clear_cpu(rq->cpu, old_rd->span);
> +		cpumask_set_cpu(rq->cpu, rd->span);
> +		if (cpumask_test_cpu(rq->cpu, cpu_active_mask))
> +			set_rq_online(rq);
>   
>   		/*
> -		 * If we don't want to free the old_rd yet then
> -		 * set old_rd to NULL to skip the freeing later
> -		 * in this function:
> +		 * Because the rq is not a task, dl_add_task_root_domain() did not

nit. Perhaps that comment can now be wrapped at 80 characters. No strong
feelings, just that the comment stood out for being pretty long when
reviewing.

> +		 * move the fair server bw to the rd if it already started.
> +		 * Add it now.
>   		 */
> -		if (!atomic_dec_and_test(&old_rd->refcount))
> -			old_rd = NULL;
> +		if (rq->fair_server.dl_server)
> +			__dl_server_attach_root(&rq->fair_server, rq);
>   	}
>   

-- 
Thanks and Regards,
Prateek

