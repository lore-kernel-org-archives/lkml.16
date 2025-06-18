Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75381274FC2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252875; cv=fail; b=EI7trVSURs8qCF1nnShn74Fw6q1Hzpndo8Osvg8V85lICIcYAOmIeiZTHwO00uR8ybLUZ3zESr5dBkhcDfpXWsAF9xbTZIQoo5zdMK5OnM1yjILsfg0iu2DT3rc4WDebGmtmK5d3NG75J3mPBS3Wz4XZu/DBYyfR+xOpNYdqtQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252875; c=relaxed/simple;
	bh=ARjEqoCemFbH3UIrDfZa8rNjc5VEZupMHJFg47nxpm0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A3Dydaw6w86y56PFNQq6PTF9t1lINoyNHSthfG2xWinPFGHKSLjgV3wylMpkkaiz3apzGR/qcyEwxzQmL1x/F3Fd5Kgrfno4AHen5lTh1KxhW/MxOUYJjxwdVl1ZuUiiedxD+bMJG5LyN8QJrrU6Qg4s/0R/jRy43qgVDHEruZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M4+0rhmZ; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M4+0rhmZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ2yUwXONvUBwQMlcS0P/4bKg0fTWiTXLkkk2SzBNy+iyeztqWC+7ZB3yfcGD9wL65WkX52abkBVAeN3+QnP8CnuFa4NCpHZbHASj+IR7AiiQjtK3Eh+WQdmuzEKrVDWG0NaMZGfXd+noW4JhFh8a98jIhZ2cdJxazHlfdeY8BeE071hR00h0O7loMXHyKsEEJsLNQvrtiLWdGX7ZWIkI8JaR9bVP4Xuc2w/vN6Lmxi7bvPx5d6mVHPzSLsILJYV21VWaWToXePtP53aNH7bgjKUj9rUWn6LtNmV+McwHgVW5o4IFbELiHRyFJSBZ6syyJeEb4TrM1VIe7Us3NG7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=davggYNEkM/aB/HST2T7Nu+2SNZaSxKh0bx6AxnQeyM=;
 b=qlqMuqVLoBfiW06HqLxSH/I/Z4v1szB/laQ2A30/ts+//crSE/IaPDyB8CIJB1IENJnvAVszZOgWz4oCImBjEpqwWHHRS7MtKFpnMDJa2GB/+Pt/YcRUSVnoDxpMsIJtcWNWWAR1zNolA93prJ0eCbEK3pn6ZmzKYX2G+vgAxQeKMZKezDwliOBwoEoqEfLn/d5IAs2Yxjqo0lmHF6A3xrL6hbtfc5L65rXMuh7+CCYmGVDydbRJ0h5UhF+g8gDfRCuU3InmOXqyhK2gCUL84uaEGF9zBQvIxNTlH0K5I7aETVXSW3/JsdgtWqB/DmkMEaSscqX99K8JyBVUF4fMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=davggYNEkM/aB/HST2T7Nu+2SNZaSxKh0bx6AxnQeyM=;
 b=M4+0rhmZhG7RX5W8TKeb0qzhOxRMTyQmlgK/cJRrNhtjxYKU6TtUtjpYxvfEX7O6So/KQ85nB7P675JSd0KEJyBfHPpQLXwNuEuQmCPVTE7Q2yrto4epniIrA+XofUU9NLD1hzvt2cktG56xjtMtSMBHgK4zbn7KqMUa9pPulSfEnbwEgzQMR1wN1j72UU1o5rD88oB/SBYnHKazSuLpheB/R+DmbDKj3Dk9iCAesXd85UdraAm0/iL1R2vbfL3KrnfaPXdsvNF6wJdWoYDnLsjZdQKdOzi01vyM6gqehPeEdqRC5VuuLziUjq0C5IGR6mM273jbcBbm41UP10na3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7883.namprd12.prod.outlook.com (2603:10b6:806:32b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 13:21:09 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 13:21:09 +0000
Message-ID: <33a80bba-22b7-4c2e-9acb-14d590dad55f@nvidia.com>
Date: Wed, 18 Jun 2025 09:21:07 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] Remove the ext server BW before changing tasks
 to FAIR
To: Andrea Righi <arighi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>
References: <20250617200523.1261231-1-joelagnelf@nvidia.com>
 <20250617200523.1261231-15-joelagnelf@nvidia.com> <aFHTSJzanNYjIwJt@gpd4>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aFHTSJzanNYjIwJt@gpd4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN8PR12CA0022.namprd12.prod.outlook.com
 (2603:10b6:408:60::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7883:EE_
X-MS-Office365-Filtering-Correlation-Id: d7389ad0-92da-4b05-c685-08ddae6afd0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkpQcDI2aVBkTGQ4L3hwUndwK2FFUk9ENk5HWi8zUzhud21INE95WHhJa3hs?=
 =?utf-8?B?bHBHdlBpVTB4SDIwYUN1Y2NEdFdUeERqL09uZEpaeHlVanZpdXRsSEZMV1lC?=
 =?utf-8?B?RHZvZSs0eU5MSW1abVlpbEZnL3g1d2NJSzF6SFJCUG0rMndEN0pSTS9LNnJR?=
 =?utf-8?B?eUJudWFhVlRpNU13QStxNzZvbFU2Z3BoQWhVbUNHR0FudzZFTnRLUy9SdWRL?=
 =?utf-8?B?LzJJcXkvd0pTVThsS2VRVTF5YTdGSlhuTzZPTms5NGRmVm9vdU93VzEweDRN?=
 =?utf-8?B?cU01a3g1M0YvTjdvc2UyQUlpMG1qTkN6NmNsQ0JNajJraThHSXZSbWNKd0po?=
 =?utf-8?B?Z3l3TzJ2Mm9NaDJqc3lLbS9IMFRralpEa3NYaFZJWkpJTVhOSkR2RTdMSVNU?=
 =?utf-8?B?ZEt2L3hQOWd5UWdiZTZzVTJHbm14VnptcXhQUE1saEkxcVFsaDA5WUpSRVBo?=
 =?utf-8?B?QzZsU1Zib0pKcDU0M2dLUlQrdnEvOFBJaE0xeW4zQTJRMEJZcnFseHdqeElK?=
 =?utf-8?B?b2dJSDU0R25kSjZ5cDM1QXE4K1NhdU82YUpVYlBSWDVCVll6b0krd2lydHZ4?=
 =?utf-8?B?VStxZUZLaDZTWm5TTG5nQm85YnhmK1BkSU9aZUVDSHFiSEMxUEZ0NkR4UTNY?=
 =?utf-8?B?Z0hUOFVFRU5FUFFKRVZmY1Bzb0lOL1kwQ1FkeDJnSnBYNUFGSUowY3lHZnJL?=
 =?utf-8?B?K1JRVFh3dll6UVY1S2N2RzExWmd1bTFacnl2UnNueHloaFozZmRvc1kzWGFx?=
 =?utf-8?B?OXNoVWVTa25ZMDNobHZFdlppSkJQd3hFcFZpWU1mbGZSOEd2c25PT2tjSFUy?=
 =?utf-8?B?RUNCbXo1ZFQyWnBrY1owRUhaVmYyZHhmd2dOblVsREF6L0FyTDRadng2MjNw?=
 =?utf-8?B?cmNGZE5LR2U2blZkWFZWZ2s2ZEwyWXlZekR6L2UxTDBzWW81U1BPZXhNbEt1?=
 =?utf-8?B?NUVncUNxYXF6eHMwbVdRVU1zNGJKbWZpTjBvRjgvbDJuL0J5eEQxb1VydWRY?=
 =?utf-8?B?Z1NianFLUjgzdFFiR3cyd3BoNzZlWGN6UjB5WGltMmcrUkFMWWdycU1vS0hR?=
 =?utf-8?B?OHR3K2RtZDF2aTRpckxXRHAwWkRkK3AvZVVCbEpaSjYycmhZbDNXUHVFajZQ?=
 =?utf-8?B?TFNaMmNyb0pKSGRyWkExM1dIaHgwQXNVd1VJdEpBVWtBRHpJMlcyRkVldHhM?=
 =?utf-8?B?dmJlRjFLanlRMkJYTytDS2w5L001VEVRTnNiWWN5eFY3bzd4czlEWHd0WXQ1?=
 =?utf-8?B?WTRmeHZzaXlvN0kvc1lGL2JxMGdmRGRpU0R1WjVCRE9EVVd5MFZrWm9CQ3Fu?=
 =?utf-8?B?R0FBNHJCNUdGLys2d3IzdVNjTG5BaVZBOWhIMnZWVGlKRGg0WElRYkJzeUtH?=
 =?utf-8?B?M3RyZitPUm9TVW1FZW95c2V6R1NwczlCUmFpRThMZlBnWGpUSC9NeERFbml4?=
 =?utf-8?B?SWlKcGttSzNVSXd0TjZ2UzcwUkFuYU03cWF2MW5GUW80eERQVE1GRzd3Qlc0?=
 =?utf-8?B?MERKZWpYU1NORmdZelpvYjNwZENHb25aWkljOTBMT0cza3JkTTBNR01YYzMw?=
 =?utf-8?B?clpFOVNLWFdUbXBSVHFtdlQyMmxLSjRNenZQN21XeVViUFBZZmF3ckM0Yk1X?=
 =?utf-8?B?ZXVxcW9OcVNXblc2WjhGYXJEWi9BcFBsSlJPTHYvd25rS2JTWkFGWGFXbHFN?=
 =?utf-8?B?OTFveW5RWXZVa1NLWE1FenRzVm8zZEdBQlBJdkdNeGRNMk1iV1FrZSs4ZE1V?=
 =?utf-8?B?Ums0c3VXOFpTTlRabElvS2V2elBTZzVubm5iR3REV0liQTZLcWhrbEZ6N3g4?=
 =?utf-8?B?N2tKRjZXN29hcjZnUlNibFl1RGlZcVQ2cWRGVCtuT2tra0p1RFlPclgyaWgy?=
 =?utf-8?B?UDhzUUhVM2hVblhGSmNSWGNsZE9UMEJqaDgxY0NNMVAwRytmNUdsNEphSkJo?=
 =?utf-8?Q?7SGRe72RhKM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZ6UGNzMXRyQnh3dnhGMXhRcTlvbGZPbHd5OVduMGlaNGdmRnpVZUhKMWs1?=
 =?utf-8?B?cjZXOE1Fd29vUGIzR29tNjRsV2NqNng2VloyUGFHUTVpazJheVV1VVBPcnFm?=
 =?utf-8?B?YkVSbEhZN1h0UFU4d0h1QjNCR0dsVU1VNUFjTWNRQXkxSTBuZHljVHJ6dTJZ?=
 =?utf-8?B?blR5L01OSlZod00wc0JjN1RCakhraUNycSs2Z09WMHlRYmpacWlQOWlSTFcx?=
 =?utf-8?B?OW9sNE84Z0Rxc3FoeEZRWE01MEVOY2s4VWxRUzVpSUZyTU4rRStnRHY2cDRJ?=
 =?utf-8?B?bVNnU2swOVgrRjE2UVR0ejdSenNUZWhQZlk2YmExTGxQQmhMZ2NiMmt1Qlov?=
 =?utf-8?B?WlNEbkJoS3pxSUVYb21jc3AyMHhTS0p1N1VLYnM3c0hYbFdEV0QrYnk0VXNG?=
 =?utf-8?B?SlA5KzB2NTZ6U1NieER0VzNpby9JdlNoaFd6V25vQ0tYL3oyYnJHZWtMVlVP?=
 =?utf-8?B?UGNZUTFPUlB3T3FnR0hESTV1SHE5OG0vTnVIdEtYU1FWRTRISjk0VWZORDR2?=
 =?utf-8?B?ZTBKVkhlb0NOOTk3T3FjYmJBQXJmYkJDQ2xIZjlTT2JTYitKcnVaM01SM202?=
 =?utf-8?B?cDJmdkJ3R3M5czNNeW5tK1VoWEJDMWdZek1zRmxlVGtkeEdhdW5UWE5qb1pW?=
 =?utf-8?B?cEhPR20wdkdtVTQySnluNTc3S0tzQldjamxJRVZYaFZ5a2l2VXZHNXZla21l?=
 =?utf-8?B?c2pJM1lpdElGbHRJMXQ4MkkxdFVDZk95OGZKdW1pN09XZlJIUVE2ZHNOVytE?=
 =?utf-8?B?aWJPeE1yQnBYdjF0T01FRFlnaVhiV3MwdyswQ1F2Q1dDdm9kWURLY053SEwv?=
 =?utf-8?B?TXF3OWhrVitKb3NDaEFtaWtLbm1MWFZ2dUdPWWZPWVdzdWNiYjVRTTh0NTV1?=
 =?utf-8?B?SFZjZSt1U2RrdkVmU243em0yNmJtZTkrMkMrNk1nUWF4M010WFJiNmExQk9K?=
 =?utf-8?B?NWxHSUFqRE9OSmVzUHFDckRXYlAvVUtjbksrc1JYM2RCUGpqbXdqMlNSLzdJ?=
 =?utf-8?B?YmxaN2dkOFlFR0t0WUlMUlE1MnRKNFMweXozSkc0M2thQ0hNOTVWaFp2Nkhu?=
 =?utf-8?B?Y3FaTzVESmJRYjBwQ3IvTFZVMUdna09FTy9LUkVnZFNKS25MM2FkaEZFTGxB?=
 =?utf-8?B?T3BjaSs0Rmo3SjlwUGRuSms1VC84N2RIbXR5d3lvUnF5dVJHWllrcEY1QmVP?=
 =?utf-8?B?aHpacjZucklUQkkzOTVCRGVkMFFxbjhVWVFwUlFOeW5wUnVhT0J4SFkvZEdn?=
 =?utf-8?B?dTJHY0JBaTAvL1dLRGxIbS9lWEFxenBHUTl4V0dKVzlJSWkrQktNRVhCZDBt?=
 =?utf-8?B?NjR4WHNScEVwdWp5S2x3QWk5dmRNbUw3VWxsUHB1a1YrekMyQXBPdkFxUzZi?=
 =?utf-8?B?K1FSSkhxQThka2FsM1RXMW1PNTJVZEluWnRsa0NBeDZBVzlra3p2anBxcFE4?=
 =?utf-8?B?ZkFwZk16NlVUdGRldHdBL0hzcmlKa2VVNkZ3bTJTTEMwUGxFZnJXSy84QWsw?=
 =?utf-8?B?Sm9TL2dJNTlId3dCUmpEQ3pNTEZlOElWWmUvWElERkRmbndnNVJQVFE1d05J?=
 =?utf-8?B?QzI1ZG81ZkFtbkxCWTQrdERBMGNORUFjbTMrQlpRV0Q5Y1EvVlgwWWI2V003?=
 =?utf-8?B?d2VEWG91NjhYdzN5UWxqbFNqV1FpdjFqWXY5VUQvUWJTRzk3QTdEcEdFeklM?=
 =?utf-8?B?UC9NQnQwTWJaTGlISlBDOGNzaEVEQlNCbmt5WEJzMDA0MitOZVF1TlZmZUFO?=
 =?utf-8?B?eGhFb1RYY3FDRXlyb09ickltUVlqbmZNdVp2UHY2SXVGOTV6a1BPU09ndFF2?=
 =?utf-8?B?VFNna2ZoVVJ4SCtySXRVeXVMenFhTEZTRTBtbmUyNE9EVGk3c3hwWmQxSGds?=
 =?utf-8?B?cDJ4clMzQWtuTWxSV3lwbE9jVzNyUXhnRFUvQm5nVlcxMCtDcjNHYUFHUkQ0?=
 =?utf-8?B?YWk5bnh5QWlFeEJPd1NTRExYQm9sOTFpK3YxVmdzSWE4Y2xIZDQydDNZRkhl?=
 =?utf-8?B?WnpSY3ZqM0EydmdXVXgwNFRXdVB4N2dKdkVxM1VMemtQZ3NSN2VZUE8rQVdn?=
 =?utf-8?B?ZmVSM3lGTVpWSW9jb0N4WVlKZnFxSjJ3VStWRW1RSVdIek1VVzVZY1JCN0tM?=
 =?utf-8?Q?0x7V2L5VR5OiHsAlITln2lrKv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7389ad0-92da-4b05-c685-08ddae6afd0f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 13:21:09.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFpckPgN8n5eUw8RkdgDfvtoW/9Q8BxM8cvCxuFzG2DVDB1KJla7dVImkO7wsBoeadx6ypDmDp0NQ1zYWDITPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7883



On 6/17/2025 4:42 PM, Andrea Righi wrote:
>> +
>> +		/*
>> +		 * We are unloading the sched_ext scheduler, we do not need its
>> +		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
>> +		 * the first SCX task is enqueued (when scx is re-loaded), its DL
>> +		 * server bandwidth will be re-initialized.
>> +		 */
>> +		rq_lock_irqsave(rq, &rf);
>> +		update_rq_clock(rq);
>> +		if (dl_server_active(&rq->ext_server))
>> +			dl_server_stop(&rq->ext_server);
>> +		dl_server_remove_params(&rq->ext_server);
>> +		rq_unlock_irqrestore(rq, &rf);
>> +	}
>> +
>> +
>>  	scx_task_iter_start(&sti);
>>  	while ((p = scx_task_iter_next_locked(&sti))) {
>>  		const struct sched_class *old_class = p->sched_class;
>> @@ -4985,26 +5010,12 @@ static void scx_disable_workfn(struct kthread_work *work)
>>  
>>  	for_each_possible_cpu(cpu) {
>>  		struct rq *rq = cpu_rq(cpu);
>> -		struct rq_flags rf;
>>  
>>  		/*
>>  		 * Invalidate all the rq clocks to prevent getting outdated
>>  		 * rq clocks from a previous scx scheduler.
>>  		 */
>>  		scx_rq_clock_invalidate(rq);
>> -
>> -		/*
>> -		 * We are unloading the sched_ext scheduler, we do not need its
>> -		 * DL server bandwidth anymore, remove it for all CPUs. Whenever
>> -		 * the first SCX task is enqueued (when scx is re-loaded), its DL
>> -		 * server bandwidth will be re-initialized.
>> -		 */
>> -		rq_lock_irqsave(rq, &rf);
>> -		update_rq_clock(rq);
>> -		if (dl_server_active(&rq->ext_server))
>> -			dl_server_stop(&rq->ext_server);
>> -		dl_server_remove_params(&rq->ext_server);
>> -		rq_unlock_irqrestore(rq, &rf);
>>  	}
>
> We should probably remove this for_each_possible_cpu() completely.

Ah right, we only need to call scx_rq_clock_invalidate(rq); per its comment:

+		/*
+		 * Invalidate all the rq clocks to prevent getting outdated
+		 * rq clocks from a previous scx scheduler.
+		 */

So I'll get rid of it and run some tests, thanks!

 - Joel


