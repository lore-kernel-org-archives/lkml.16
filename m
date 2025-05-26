Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B043ABC
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236505; cv=fail; b=Ssm5Sx1ZgKPf0nKh/hnuGeMxMdL10kYe0SyiqPnYqHAKoKKR7RR4axCiFyDEi6CQLziZ7D7c2ZNkzQPQzXvBAyFh8Uixda8Wsd3RTz3E5Gf2jxTniLq6uFfAWfHxedDTWF3dfVNhKM83ShP7B3NgxWyuSyie7N9NWcdq+ND18eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236505; c=relaxed/simple;
	bh=H5yrTANiLcHtrLEGeaTII0cELv2ggLzy+G+GtbXsqKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D9FDfB20hxNzwLzclcTc2SwaOnvpvPFLxxn0d44qdD7idDuhl9FgVy2eiSBIG9uwA9lt7fZDaGXbIj/GYGReZ1sXRmdxIwhUDfPuxgOAkgAy1LGUDCv3xzqikXSVs2HGeUCEYwJdpi7Zf40clHjsnh4KEEH5zB2yvo//eUpGmHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fZMiJob3; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fZMiJob3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vkn7SPuUPkxADgeeiNXBvU+duLvBgqYrRBLE2iCBhUowHn+QZ3s0koKKbZ4mzSL+7e5v8eEU9HPbag3bQieufWdM6+JF7WRzg2uvEJBxWgsDZzWRVbLGmBPkZKjm1aQ0eruF30F/CrhrR3JZ632ywSwyNJJKBu6dWU7QYILsPzOHxoVIXx0SEdbK+o5LveZa87LjexdTQKD1tdstN/Bzy5cohGm3FnveaYXrV4F94Q/UIsh2vzX+4f98qFqK5bar1idmvPkpu1gv68MlSBhc/HBPzyVwFNy6gLOq3yVLC5wrfA//hnyCD6ph0IU4zzP60ra0M/RVfYl2jl/Vmz7l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4X7NTjNrjx20e0P8WrpYed8dGBOeRSNQqK3akIZO9m0=;
 b=JNym7bB9HHSbWbUHy3nO0nspXCYcziLCT7mn9YszWGUJln/hJve3pYRKRR+sYfP1nUqvU+EX2k7HAzplqjgdZz2mG3QWqMv55Hm2EewnFl7GKnRjDYt29GpiO9ezN8nXrqBXARnKpnmA7bUaLetYVtmdtDuq2YBrErDh6uNxMH9E/D50CTD+rfd0pk+tWJQ6Bf8fdAp/ex68GE8cFz1IM9zvXCk473/ODxaoyOWRJ0yqYf4CyyLbIfDeezAk8rceZC4mhk18TyeEe6JB3zvbq+WN+VMYrk6tWsF76sslqipC12QH1het5J7rJTdMnbvEYPk/UlrVqNloR7vW+kt4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4X7NTjNrjx20e0P8WrpYed8dGBOeRSNQqK3akIZO9m0=;
 b=fZMiJob3Fm70RJh3R7gKJYgLaWrzaic+eFHiWUFx27gkXuq/0oWaNOAM+3fNNjmGacdzVJazWlWTXbu9W3PmF4hkKiDeoj268jk8g7zxPwg7rS5pkA69aCe0AXACGrJSQwpoVm1xNz3pLQZ10JqUcP6nxdX/ekqshzK6qQIdhA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by MW6PR12MB8834.namprd12.prod.outlook.com (2603:10b6:303:23c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 05:14:59 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Mon, 26 May 2025
 05:14:59 +0000
Message-ID: <975038b2-0c38-4937-9934-f81c082ff127@amd.com>
Date: Mon, 26 May 2025 10:44:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::31) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|MW6PR12MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 287bd2ac-211b-4095-cd2b-08dd9c1442e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eE0vdSs5WVo2bGU0d1g5U00yZDN6WTVlc3U1dkM2NW56Yi9IK0lNQVhMbjgv?=
 =?utf-8?B?NVZhYkV4RGhJKzlaR3BsRnkzcnhPNVFGblN0a0Zic0hvUFIybWNMaE5mUE9n?=
 =?utf-8?B?cGVjdVYzTlZ0TmFnODR3eEIyTExKZUt4MWh4d3BuMEZGcmdEUkZHanRweDNO?=
 =?utf-8?B?QWtuSDk4b2pQdnZxOVpCaUhwNnRsYk5oc3ZXZE1lL0pqZFFkS1lRQi9VZldN?=
 =?utf-8?B?UnRuSUpRT093THMrVW9MdnkwL2lIeDFncWtJeThjamR4VmIxN2c0V0pWRFJl?=
 =?utf-8?B?TEozMVdUQlFPeG1jWkJGanBvaGpDeTl2V1FKNEdzZWFpb3dkQWlieCtFb0NQ?=
 =?utf-8?B?WDliYTRYWHpMaDhablNqUkc5Z0loT2pxM0swQjR4NDN3QnVVMWVabGdBdTd4?=
 =?utf-8?B?bWhUUVhSODEyVXp5T3k1eW9LNldxMHN5VThRUEp1aGdaNWMyMzBIYlUwdjJ5?=
 =?utf-8?B?V3VGTUFwT2xHc1hadHlGTVdPYzBUYVBmTHJ4OUkyWnUyRmFNKzV0MG9sUTM2?=
 =?utf-8?B?MGRtaThPNWloK2dpRi9KbUJ5SXhaYnFNN0owQmZaRFhPRTFJcHA3Q2ptSGNX?=
 =?utf-8?B?UnZqWlZCWVNrajIzYjF2R0hYb1VnT1J4REtlOCtXSzNxSDZ2aVE3K1lDd0sr?=
 =?utf-8?B?bTJmZll0bThlbW0vYUEvYUNGVTltdGFWQVRPTy9hcGdpRlRzQkxnUFBVcVA0?=
 =?utf-8?B?WUk0WkNUNVQ2dGcybWVqalh5TXhodGErU00xc0tjSUdFNncwTWorWFQzT1Y4?=
 =?utf-8?B?NCsxdDJMTzhyU3ZYL3JWS3VlWnpKaGR5cW0zUFJOK2lPUVlsVkMvRzVuWmdN?=
 =?utf-8?B?aW1EQnpUdkRBbzJnMjhUcVVmaHJEcUt6NkU0dzgrdTQrL0Q5V0VFQ0YvRzkv?=
 =?utf-8?B?dGVrNTgwVzZheXNSVjdBMWtQaUVpdGw4TDV4aWZjR1VMeXdyZ0dkdUdDWjFo?=
 =?utf-8?B?bVRmQWNjREJyR0lMTnppMXhaZnlaSzFpSEhWTGxJMFZzOVRHRUg2ZWUvLzVj?=
 =?utf-8?B?OTNlM28xNWduVWZqOFkvKzM5d1VtVS8rY3BabElGUi9oRFQxaXFQNzdxYVJn?=
 =?utf-8?B?MmF0TjE4eDBtRlkwRE8yb3I2dytYb2dHUVc3MFFIeWUvY0VqVGNEQ0RkVjM1?=
 =?utf-8?B?ZEVBQUlRaVZIVjFUejdiQ25MWlg2Tk5IR0lIRkNmMkF1Ni9vWTJMVTlUblV2?=
 =?utf-8?B?R00xMUFPOVJ6UjNPU05XT3FWcXBnMlZMMVl6RlVyRkFXRVQzdVArNnZCcnl2?=
 =?utf-8?B?enY1N3ZpOWh5dlZHL21jTEZiRDJpbVROUzRrQXAzR1hNTm9ORWl3dHA0eHA1?=
 =?utf-8?B?elo1TTd4NDhTVWZQMENhbWg2dFdyL3FSb3RHS3M3ZSs4T3RyRzh2NFF0ckRy?=
 =?utf-8?B?WHFoc21jd3FZeW5yRUZlM1NMeStJZE9KZitEdDlhbzFYMFJMc0FsZDl2K2J5?=
 =?utf-8?B?eGJXV005aFoyeFh6bVdocW93OCtBUnVoZWIreGRCTmJqeC8yRDBpNnMzUFgy?=
 =?utf-8?B?eDJDNWhCb2haR3BpaWNiR085UTBuVndXUEtHS21NUkQ5MWNhNFJKRmczc2x5?=
 =?utf-8?B?Q2VQeFRqY0doTWIzUGVpN2o4aENmNmlnZXZXeERvejVFM0lzeU5OZ1ZSQzN4?=
 =?utf-8?B?WjlhcVk1YlFDTWJrOEwrMnNERGhDMFJtczFQcUw1UTFXdkpLRXFKb1M5VHh4?=
 =?utf-8?B?R0RIbEUrc0xXaGc0OUZ2YmU2dnN2UVVtRkl1ZC9LdHNQbUZrL29SY0FIQ0VN?=
 =?utf-8?B?d0JzU29qblBkR2Q2WU4rZ29oOWhBbktTU2hlclowODBiQnpLUXovcSs1clQz?=
 =?utf-8?B?YktZcEMwakJocjFHcytyQkk4LzNlbG5jcUZYNU9OTWpFVWowVzlOVDlzOVhZ?=
 =?utf-8?B?QW5lUXV3SjNDZ3dvVEpYdGUxMUd1S21hem5oZzF0dktsQ2RsRnRaMXRlWUhZ?=
 =?utf-8?Q?U1tDKGETuvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXJBL1h0K2hFQVFXcDNwWHlFV1RHaFhmWTNjVVI3VS9nWWNKcWJVYll5dTU5?=
 =?utf-8?B?bWg4bnFDMXhzWEFRcDNSN2hsRWhhYmt1YVF6MEcvZ2NRUlZpOXAxWHRNMm5S?=
 =?utf-8?B?Rjd4SDFXYUpuWmY5ZWV4T3g2R0JCaWw2K0J5Rm4xWEo0VXNvSHR0NE9vVWRM?=
 =?utf-8?B?VGczUUp6TFhBelZYRVJOUnhFRy8zR1BJVDNZUEhtYzJJVGRxZi9PMzA5dXNr?=
 =?utf-8?B?aFUwWmZkZmRHdFBFL1BlVTRGR0tML0ptbkw2bU52blRwM0wrU3FnUU5HR3lq?=
 =?utf-8?B?OW9WYmZLUkhxL1M5alMrOVp0NkFwQTdyVmYySVgrNXFaUzI3ZkVZYklwaTJV?=
 =?utf-8?B?ZExtNGZWUVkvMXl0b2FXbXJGZDlVMkQ1NUNnbG9nNjBzcUxkSzVpeXN2VndC?=
 =?utf-8?B?RUdNZUF4cVdTM2JKRjhlTi9Na3BKRmNHQVA2cGZVeDJ1ejFMT0FRSWpaN0pJ?=
 =?utf-8?B?bHF6Y2FMaXlkdmxpUUVsUGpLTjN1czNXOVk1Wm55MHVEK0ZuckovcWxtdWVa?=
 =?utf-8?B?K0R0TTZrMTFKaHlnN0xLNjNZa1IwNmJJa0wvNng3T3VWSHR0dVN5VitVTXdu?=
 =?utf-8?B?eks5Y3BJZGd0VnVYVHIzUk92WlZpYWZPMlZRZURzSm1xY1FMMHV6L0xpaGdL?=
 =?utf-8?B?OHFRTE9NTnI1NC8rWG01d1ROQy9LZUR2TkttcHk0Um5tanY3eTBlb2Uya0tq?=
 =?utf-8?B?RU5VVzZBU1Fld3htUlY5djhJNTdGdE5PTG1jSEJxcUdQcDVMRjBWdnVCUVFR?=
 =?utf-8?B?UVdjaVQ0WXc1RU1ySitjeXBvUGlLTkp1WDhtb0JmYi9RS0JiekVJQWJUUVVK?=
 =?utf-8?B?TGNPRWdsSDB1Y2ZaWUVYRXhCaXhTRHByQnhmUEhYZ1d4cjBPanU1bWxuWjN6?=
 =?utf-8?B?UlpZdmZmR2cxNkF4TXFUYlRxZzlDZ1VubDRVZmxTYmd2U3d5UUhVOGFhakYz?=
 =?utf-8?B?UkU3TENHT1l6QTY3UGFEU1ErRlViTUpOUnhkcE1zZyttMGZYU2ZUOHpXSGsr?=
 =?utf-8?B?VnU5allGRUI3MUF0OU9sLzZOdWtRUVFTLzBxWlBNY3hJZEIwRlp5TUw5RTg4?=
 =?utf-8?B?bGh0QXJPNlBubW5tSkpRaXdqRnBpSi9XdEltR3NwaDJzb0dKcDIvRzFVN3Ux?=
 =?utf-8?B?RVBobS9CcUtnZS8xZUxHK052aGlSVE0xVFpKWlJ0b1N2cXBuWjF3QllJK2d5?=
 =?utf-8?B?aWN3OFgyZW5rdm9hVWw4OVVkd09rTW1ZTHNocWQxZ1MxQTZyeVBSUlJWT0dy?=
 =?utf-8?B?S01TKzdxTUliZHdHeVI2S0NCK2hzRkZsUFlmejYzUEVEN2JIdVFnb21PQnhQ?=
 =?utf-8?B?Lzg0bXNPSTh1T0ZyVHBGNTJud1lkU05seGN3NUVuRjU0M081cEliWU92ZEwr?=
 =?utf-8?B?ZVNHMTN1Q0w0cXIzYUlaOTdqbVlCdzdQbGZRQXY4UDFRLzFZM3EzYkJSWVVL?=
 =?utf-8?B?UTVvdDFObWZacHRuR1RxaGpPWXQ0b21sMTV6NkM4bGlycVN4cjJqRkhHUk43?=
 =?utf-8?B?MUZjbjg2bXgvdmRsaXFyclFqMjNRS1ROMjZRVEk3Z1ppdG5xcmgyditMNWw4?=
 =?utf-8?B?ZnU4THBwTEVxeG0rTndlZEhXczBRTnFoSkw2WEpHN204Q294NDRHME5LaTF3?=
 =?utf-8?B?cCs5WTFZS01KOXZqRGdTaG5tK1l3YVl2bzhTRE10cnZEWVREU3VwZzlScVIz?=
 =?utf-8?B?SEJGeUltOCt2ZW1iVHJBN3VxcmtUOTI0Ym9DVE1iY1Y3SEpJY2FucVdUVTdu?=
 =?utf-8?B?c0R4MHhiOHJNbmlUTG56UzJyVFJOVG9WODJXUGdkczZ0ejA3c2lXenVIdU9r?=
 =?utf-8?B?aExHb1FQUWxkaVJDWXRkaVVEYTJpWVNWRE1Zenl5TTlkY0hXNzcwbE15WVFv?=
 =?utf-8?B?WTJQSlNKS3Y1ZGllUFFTS0U4WVcvUzc4bEo0WmVPWjhieExrdi9PT1o4b2tk?=
 =?utf-8?B?ZHBZTWdaMFo2WWdRK3pWWlVPVkpnUE1DZC9mY2tYNndYWmRndWtobndocko0?=
 =?utf-8?B?WUtxcFNBaTVFS3JnWm5QSVZDVzAxRFREc1RpTnE4RUJLQmlhRXVyRjZBV3l3?=
 =?utf-8?B?UnZGUVQ2YmllL29WSUcxZStLV3UzZW1DOStDU1hmaVY4THlDMEg1YUdhSWtp?=
 =?utf-8?Q?KHzCZ8dDoGO4I8askQoe1TZ5m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287bd2ac-211b-4095-cd2b-08dd9c1442e4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 05:14:59.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eYjgTMD9VaCXIwZxH3LvCAmFtZdccw8rpkLyi6FuH5R7mWhRQA1jXk0UWhitwxfwVu05XniGdy+T15ZFw73fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8834

On 22-May-25 9:41 PM, David Hildenbrand wrote:
> On 21.05.25 10:02, Bharata B Rao wrote:
>> Currently the folios identified as misplaced by the NUMA
>> balancing sub-system are migrated one by one from the NUMA
>> hint fault handler as and when they are identified as
>> misplaced.
>>
>> Instead of such singe folio migrations, batch them and
>> migrate them at once.
>>
>> Identified misplaced folios are isolated and stored in
>> a per-task list. A new task_work is queued from task tick
>> handler to migrate them in batches. Migration is done
>> periodically or if pending number of isolated foios exceeds
>> a threshold.
> 
> That means that these pages are effectively unmovable for other purposes 
> (CMA, compaction, long-term pinning, whatever) until that list was drained.
> 
> Bad.

During the last week's MM alignment call on this subject, it was decided 
not to isolate and batch from fault context and migrate from task_work 
context like this.

However since the amount of time the folios stay in isolated state was
bounded both by time(1s in my patchset) and the number of folios 
isolated, I thought it should be okay, but I may be wrong.

Regards,
Bharata.
