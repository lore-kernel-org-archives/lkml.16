Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA615CA6F;
	Fri, 27 Jun 2025 01:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750988055; cv=fail; b=nu3HnWdbSBRqjlRI2LOSmItFdvJ6yXtHyrGjcRppyviDIMjL0vBoKpX3iMf3eaz14UJN3SS1eNMEQzCVXjAjjay/CiPbQ32yIfE6Ht03c7UpK9+x35p0zR5mL3vBYREXIyGrRjnRT5fodKrLwg5pVFupRgsgmqDPCcHQcnOjSGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750988055; c=relaxed/simple;
	bh=iRUBmId19F4duxzwebVvTfd8LjSnG2Nhwab5kV4V33Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Eh1UI6sZI9zDz/wjl4eYusU+TbWdPeICTdeRl4udNIxHwNqS4K8rZfrwKaTUjM515S13zLsvSkBuZGZTJfE+6gdW47C70WcxNDlkAkxeRacUidkD47OXXmjVCpGKTwQzb63tLrhfsApFV7X6nffwd+1Kn1z+urd8AhNt0RxjetU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OI9LZBkF; arc=fail smtp.client-ip=40.107.220.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OI9LZBkF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9NhfjcEJ2XffS8EhhqbKjhIysiXvD+yKJWtVMgS7eiZkg2MQBMlFDBhMDdEyjYrYKmTTHHUguPaLCk8llGB/kr8A1gW9JpzyXE1N1QDE24FPt/HJ3R9IjxC+FNL+UWCL5TUSw1/HcH2FrK12wKdI+lP+benp20PvK3HMClx2S8P8jMHyIsKZsK5Wy53Dn9gJIMq0OpTRUwjWODJ9tbDAYXe7Qt6KmSmQ31RONGGvGMstUOsdp7ZPIJzfLRdMSdBoPo6IQzlF+3y8vS1MAzKky3vrBPmZNE3F71HgsPycIDOoXMKqwWj1i5faUWV1j3GmFo3WSJ6mOmFe/BzuykLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSJRxrwWGytwKeOcSkTvlEQYdVAAD/2h/0uvDhliijc=;
 b=FG2mlOAk2UuKkDdfYHaki/ECWNKbqEI/NoU8aZewr1yMwdplmiEvQ5c8GGx+EJ4Zf2eOkvhUIxIAI0e/2H8LA/LtSItSVpcm8CJ1HGxxFG+DmnqpuWWVyhdSwiaMhBJVDSxYelP4p9CHsUYoS45t95XzMQHMV2s1q1Swbw59dGzFsVO8xCryw084iIIab1OGu88kJ4xmFgmo4lm3d+MEEVJUVHQHcr3Z+ZWNFsPtBh2pNtJGfjjiednFGgQ/XwlTws2nlAdPfu00C2RE4MjkO6hE4IzufPLhfG7akGMrLl5EUvB/1rRF5PVO67OQbMAxe3SAHrlBdPwhWn78JEinFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSJRxrwWGytwKeOcSkTvlEQYdVAAD/2h/0uvDhliijc=;
 b=OI9LZBkFf0Lx7/gTWbzd3i3J53aCkehQjDX0B7ADJnYUZyto491+ygcA+qvfqRDYmWq9wjlKGq10773kB7PwAxmQPa3t8ytM9VMykhqBZe6oLLCXmJf/+e7Ypt2+WE15URYjjybTa2q8xrPvKTS/9NK6PuuszqPELS3fzBBrqzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW4PR12MB6923.namprd12.prod.outlook.com (2603:10b6:303:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 01:34:10 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 01:34:09 +0000
Message-ID: <e55460eb-0679-479a-94d0-fe564cc77b79@amd.com>
Date: Thu, 26 Jun 2025 20:34:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 20/32] fs/resctrl: Report 'Unassigned' for MBM events
 in mbm_event mode
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <794cd45701dd52f0a7c3ebda305ff980e761ba35.1749848715.git.babu.moger@amd.com>
 <b4b14670-9cb0-4f65-abd5-39db996e8da9@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <b4b14670-9cb0-4f65-abd5-39db996e8da9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:806:125::24) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW4PR12MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d9a3bf-27b0-4c2b-bf07-08ddb51ab687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RG9vc0lhZXlGRUZ1MXl4VWdsZmNuTnZyRE9DaTNpb0YwanY4WDE4NVFiVnNH?=
 =?utf-8?B?L1N4dkp5cG8yWTRuYjZxZU5jUVRYR3dsS2QvSmpROXh1a0UvbkZuakk5UmxS?=
 =?utf-8?B?c2xqa2x2RWNJMERmVUQyOTRkRTBzLzlZZ3ptSmJLOXVGcllaRzFnUlNYM0RT?=
 =?utf-8?B?UzR6NkVxSDNOcjl3UmU1eCtpMXJPbUFZTStuVkF3ZWM2eHErbm9BYytRbDh1?=
 =?utf-8?B?R1hPYytVdHo0aVhBZnRFSnpLS2VPNWRHZzM1ZmQ5NHBZVVI0MGdvQ1NyYnVn?=
 =?utf-8?B?aFZpRmRxVDdSODFQQU4yT0ZiTG1oNUc2QTBRdEF5SFl3WCthVG1tRmFuNlQ4?=
 =?utf-8?B?SzkzMC95T0p5TForZ0xWOWZuckNPVGl6cnRhbGF5QnFja0JZMjNld0FGa1Jw?=
 =?utf-8?B?eGhIZFQ2bUZIWDhpWTltenI3ZW14YTNuOVpiWkdwU0ZGc1FEeSt6TmwrYy96?=
 =?utf-8?B?OEtCWWxySXoxcTRBV00vNWNuOC8zcUFndERQdEkwRzZMQlpwdHljOEd1NEZT?=
 =?utf-8?B?enNxRE1NRVpUWTF0MlRCY0pueE9rcnBkVG9UYlJvT2pSQ1V3UUhLRG8rWHdS?=
 =?utf-8?B?LzBlMTlTL2ppcUxZNFdtcnNkNVZOblZZY25aZTJvUnZlTStVL1VrUDJLenlR?=
 =?utf-8?B?VTFMZU1aOHhoTzNKbEhaTHdXeHJ6VjQyQTVjL0xHVEFyR3U5bDV4emExM0Za?=
 =?utf-8?B?TU51c1FMMGFxc1VkR1YwWGlHUEdac09OdjJoU1ZrbktGTFdUVTh3Wk9LN0pU?=
 =?utf-8?B?Z3RDS1RTVm9BWnNVdTZsdDhkQnl0djhjR2cvdTlBS0VHd1QxOE9LZ1RqQ3BH?=
 =?utf-8?B?R1I1SHBsYS9YRStsVWJKSU00UlhSTGtpU3hpVE5SREFpemxQMUlpQ0IxdGhV?=
 =?utf-8?B?dDlJSHUzUDZRaFBtYWY4bW1oK0tWYW9SdXQ0YTd5U1lkKzE5cncydS9xckZm?=
 =?utf-8?B?S2dReHlDNUdtOEJVYWU4aGtQaHczanlpR1dzRVhDMmY0YkxEQUVVOHMzY0Qr?=
 =?utf-8?B?MFVKSkROOUlxMUxWQUpWck5EcUZqNWNBd1BTR3RrOVduVTZuaGdXOU9sT1M5?=
 =?utf-8?B?RThscm0weFhyUVh5NkM0S3daRndCM1UxNXFmMHlLUUtHR1M2dG9FK3FKQnlk?=
 =?utf-8?B?NXliL2NIZGFSMjRJb2J4OU1QcGVLZ2tJU3lCVDg4ejdFcW1UQWxGWE9KUE9n?=
 =?utf-8?B?MW1VcE1YUy9zeGYyWG9lMEtrMGJTemp4OG11SXgxMUI3S3FJMWYxVHQwQW9v?=
 =?utf-8?B?UmlwZHMrRnJvM2IyaElPQklINE5yTHZhQUt4MDV4QVNOenJYUHJUQWZJTXZ2?=
 =?utf-8?B?TTdMeklXcHF5elFKY29PV0lJMWIxM1NKRk92bHE2d3QxNHM1SklxcTQvMDZw?=
 =?utf-8?B?SmZ5Y0R4aitiVjZxaG1HVEwzTFdZNEJqR3V6eG91NGhCYm9Eck9hd1JTdkhJ?=
 =?utf-8?B?dkpzRnZqWkFUcTBIZW1ZeWNLV25qTHkvRWx2eGpOb09tRktsT294dXZNdnBG?=
 =?utf-8?B?V3d4SzNLdDgxMTVvbFJHdi85SWhvWXRYZEtHUXVmYUY1QWRUakQ1QUs3Sktt?=
 =?utf-8?B?NzFxZEFxOXpMT1o2RjdDaVdHcUI5azd0MW14bE9kQlhFK3MyeHZkcnRVME43?=
 =?utf-8?B?NkF6S0laL1Y3T1NiMzl3Uy9YYlZzYWNOZXhJTTFMSHZGUXdFWUJnelBWTXIw?=
 =?utf-8?B?aE9zeWZCTjU4N3hud0lodUxWTVdnU0tCb3JDUm85ZkZTb3pqa3dwZjN3aUUy?=
 =?utf-8?B?WXIrUDFWMkdjZE93R2N6WEZiVU9RT3FTZzBuRUZxeWxiUnhhejR5czdPY3Y2?=
 =?utf-8?B?YUJGdlRORGwrRWJlOUNqMUY5dDJYYWhUQVE3OGtWM2x2czAzMU5xU1FrNFNa?=
 =?utf-8?B?TzVkVStrRDJKMGdNMWptaTg3MXVISXJTNHdUZUJleVVIeHFWUER1L1JoM01J?=
 =?utf-8?B?eDdhYlY5ejhka1ZDUmp1RElVQTNrd3JESkJuS1Brb2ZBRGYrL2FsT2syd09k?=
 =?utf-8?B?bEk5aUQ3eVRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elBxN0N1OXpCU3lTUFQwTy9sTm1ZcnpUbE1RZE9UemFTOW55VVUwRDU2cWU3?=
 =?utf-8?B?WEwwOGxmMEZrU3Fuem1ZTEIvRDJOWTQxU0RydG1TeE1lQ2lDemxWMmxZcC9q?=
 =?utf-8?B?UDNrWUFPZTJQdHhhZ1ZZakpsN25ncFdRaDJySmVNc25QRmczUGwxcW9ReEti?=
 =?utf-8?B?cDNZTk11bERWWkp1bnpvUWtvZ3NhQzk1U2M3Z2h4SXB2eVQyVDR3OEVybTMx?=
 =?utf-8?B?M0pnTDVjdEMzYWgrOFZwdEE5bXFvWlpXR0hiMG1lZytIak5GV0luQXM5WW9v?=
 =?utf-8?B?bXcvM2pyNUc3V0xkTVJOaDR2R2VPZW95a2lDdTc5YytVOFJaRkQ3cWFEMzll?=
 =?utf-8?B?Z2FBL1BCWUk3Rk4yS0FiQkhITU45R3U1NndUMzdOWGtQaDRHa2NIV3RzSHVJ?=
 =?utf-8?B?TXdOaVVVTWhacjRsaDNibGlvbEdYMHp3Qk01Sy80NnYwcFZ1MVRuQWFId2dM?=
 =?utf-8?B?eFU5MWRKKzIxSm5lanhOSnNjczludmNpVGdpZEZ5Wlo3OWJQYUorRnF2UWtj?=
 =?utf-8?B?MTRKeXRsS2JJWDlUK1MxRjBtSlUxczYrVmNROElsbUZTcTlac0FjSUY1SmF1?=
 =?utf-8?B?WjVNekMrT3J5VllqNUY5eEZwaXVJeW5xQmNTSXczN2lqVk5YUzZtNXYzckhG?=
 =?utf-8?B?eTIzQlUvejhFQTA0eDlJMzArRms4WUFYMVNkVCtVK1RiNDBpcXY3NjgxeXZS?=
 =?utf-8?B?TksrSDViMkRjKzE1Wi93TGV5QTZ1ZDhraWNvTjkwZTliRnJ5Sk9pRWFBcVFL?=
 =?utf-8?B?aS9XdUo5V2RTNjBISU11NlRFWjJRNmNUZExGa2ZncU44S054dmVwcDRXcGZl?=
 =?utf-8?B?cEk2cVAzV28yZ1I2MXd0LzdjVWJrODBHTGFXT3MvbzNnQnRNNzdCL2hpZVBZ?=
 =?utf-8?B?alRQYTk0MnM3NTY3VTJ2UStYUS8wZDZuN01zbHNDN0RvRWp6RVBkaVJOMTli?=
 =?utf-8?B?MXV1SytzbXpXa2FYZWlUYVd1WEFmTXh1aWUyanY0NkE0UE03Yi9JbEtzbE9h?=
 =?utf-8?B?VE5xRG91R3BoSmIyOTRqajU5RG5EL2lFM25xWmk2dWx1dEtYMzJQTjNVdno2?=
 =?utf-8?B?Z0lGMEZyWi9ocHlkb1lqSGtsU2I3R1FnS1RTZ3BMRmY2S2N0OUFMWmlHa2l3?=
 =?utf-8?B?Zk9JbGxJc2o2cXl6ZjA1aFh4WXZsYVd3Rm5MbXIvQkVlbkNsN3hqemRkWEhp?=
 =?utf-8?B?TCt0WTl0UEMzanhSMFFCVGRueWdoZWZ5bEJVOHY3ZVcrWmlkMTFndUo4ZmtT?=
 =?utf-8?B?ZlJPR3VsMHowL054OE9DMjVKYWxUNGRHMys2NDVTdXptUzN1YjY3eFdMZFY2?=
 =?utf-8?B?MXdDYmkzdXg1c2NRdDlOSCtDWnVOSTNhOXRNeUxzNStralRsSHlISUJQbDNY?=
 =?utf-8?B?aERLemZzVVhSRjZTR1o2Q0RCNW45MkYyTVl3eVl4eHhRVVgyZDVERS93RTdx?=
 =?utf-8?B?RGJOTS9BNGRCTmdPUGxmd0toMGRyd3UyOXRhWTNGZjdWV2E1Vkd2YWQyS1Jl?=
 =?utf-8?B?azJkVlliZ1l6Rk9yZ29PZmhPTXVVUVJ1SW9rOC9ieG5LdXdLMjRWWFNYanFZ?=
 =?utf-8?B?eWovK01LZWlkTFhnVjFEczNjaVBDV1RqS09lWjNkd0h3R0YvdmczaEVaTk4z?=
 =?utf-8?B?b1RDempOdVZtaVVJUTJVN2MweWVrVGVmZGsraWtMSGd5Rno5VTFINzRKSHNV?=
 =?utf-8?B?d1J2SVAybDFJcVVsdG83bk8wZjNmQXdqRTBZRmFHazAzOXhNcjdHV0pIWTls?=
 =?utf-8?B?RFk4ZHo0eUlLYlFjM1BxUi9Ta2ZnUGtWbGhhZjlwa3luK2oxaFR1aGwvdTNZ?=
 =?utf-8?B?aEtqNjRZMVFSQmdlNHJ0TjlCaHFBNzZONHRsSDZWdjZNNFNaRUE2UllRU3cr?=
 =?utf-8?B?dFQvdzRhNEpQZjJlRTdqM0RYZFlzZWJCSWllT0V0ZGowSEtmZkxOR2w5U2Yw?=
 =?utf-8?B?UmdkN3B5dVBKTmUzLzk1WmRSSnFZVlFVWkhRSmFCYmlyYy9sV25JTUNKbk9M?=
 =?utf-8?B?VThYVG1HVkk0azVKVU41a1BYWlFObTJWOFViakp3bVJKaW41NjlnRUFTbUFa?=
 =?utf-8?B?VkNDSTZkaStEdUlPV2ZINkxWNDJvaFo5b2UvdWpPQUlmTDFpaFFMYVF3OTFt?=
 =?utf-8?Q?Makg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d9a3bf-27b0-4c2b-bf07-08ddb51ab687
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 01:34:09.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnUHdrxPkyVEuaYKa6H6Niipyxda5h7WdN4pUFIpPawKXv5E67kZpwmrUAnezyWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6923

Hi Reinette,

On 6/24/2025 11:14 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> When "mbm_event" mode is enabled, a hardware counter must be assigned to
> 
> "When the "mbm_event" counter assignment mode is enabled ..."

Sure.

> 
>> read the event.
>>
>> Report 'Unassigned' in case the user attempts to read the event without
>> assigning a hardware counter.
>>
>> Export mbm_cntr_get() to allow usage from other functions within
> 
> "Export" can be a loaded term in the Linux kernel. Perhaps:
> "Export mbm_cntr_get() ... " -> "Declare mbm_cntr_get() in fs/resctrl/internal.h ..."
> 

Sure.

>> fs/resctrl.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   Documentation/filesystems/resctrl.rst |  8 ++++++++
>>   fs/resctrl/ctrlmondata.c              | 19 ++++++++++++++++++-
>>   fs/resctrl/internal.h                 |  2 ++
>>   fs/resctrl/monitor.c                  |  4 ++--
>>   4 files changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 8a2050098091..18de335e1ff8 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -434,6 +434,14 @@ When monitoring is enabled all MON groups will also contain:
>>   	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>>   	where "YY" is the node number.
>>   
>> +	The "mbm_event" mode offers "num_mbm_cntrs" number of counters and
> 
> "The "mbm_event" mode" -> "The "mbm_event" counter assignment mode"?

Sure.

> 
>> +	allows users to assign counter IDs to mon_hw_id, event pairs enabling
> 
> "users to assign counter IDs" -> "users to assign counters"
> 

Sure.

>> +	bandwidth monitoring for as long as the counter remains assigned. The
>> +	hardware will continue tracking the assigned mon_hw_id until the user
> 
> "assigned mon_hw_id" -> "assigned counter"?
> 

Sure.

>> +	manually unassigns it, ensuring that event data is not reset during this
>> +	period. An MBM event returns 'Unassigned' when the event does not have
>> +	a hardware counter assigned.
>> +
>>   "mon_hw_id":
>>   	Available only with debug option. The identifier used by hardware
>>   	for the monitor group. On x86 this is the RMID.
>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>> index ad7ffc6acf13..8a182f506877 100644
>> --- a/fs/resctrl/ctrlmondata.c
>> +++ b/fs/resctrl/ctrlmondata.c
>> @@ -648,15 +648,32 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>>   			goto out;
>>   		}
>>   		d = container_of(hdr, struct rdt_mon_domain, hdr);
>> +
>> +		/*
>> +		 * Report 'Unassigned' if "mbm_event" mode is enabled and counter
>> +		 * is unassigned.
>> +		 */
>> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
>> +		    resctrl_is_mbm_event(evtid) &&
>> +		    (mbm_cntr_get(r, d, rdtgrp, evtid) < 0)) {
>> +			rr.err = -ENOENT;
>> +			goto checkresult;
>> +		}
>> +
> 
> When looking at this snippet in combination with patch #22 that adds the support for
> reading counters the flow does not look ideal. While above adds a check whether
> this is dealing with counters, it only does so to check if a counter is *not* assigned.
> I cannot see *any* other check by resctrl whether it is dealing with counters while
> it lumps all information into parameters to resctrl_arch_reset_rmid() and
> resctrl_arch_rmid_read(), needing to provide "dummy" parameters when not all information
> is relevant, and leaving the arch to need to determine if it is
> dealing with counters and then use provided parameters based on that information.
> 
> I think it will be simpler for resctrl to determine if a counter or RMID needs to be
> read and then call appropriate arch API for each and provide only necessary information
> to support that call.
> 
> I think this can be accomplished with following changes:
> - drop above snippet from rdtgroup_mondata_show() (this will be done in mon_event_read())
> - introduce new rmid_read::is_cntr that is a boolean that is true if it is a counter
>    that should be read.
> - mon_event_read() initializes rmid_read::is_cntr and returns with rmid_read::err
>    set if a counter should be read but no counter is assigned (above snippet). The
>    added benefit of doing this in mon_event_read() is that if a counter is not
>    assigned on new monitor group create or domain add then the mon_add_all_files()->mon_event_read()
>    will return immediately with this error instead of trying to read the unassigned
>    counter.
> - __mon_event_count() should *only* attempt to initialize the counter ID (call mbm_cntr_get)
>    if rmid_read::is_cntr is true.
> - Introduce two new arch calls (naming TBD):
>    resctrl_arch_cntr_read() and resctrl_arch_reset_cntr() that will respectively read
>    and reset the counter.

It may be necessary to restructure resctrl_arch_cntr_read(), as there is 
some shared logic that applies to both resctrl_arch_rmid_read() and 
resctrl_arch_cntr_read().


> - __mon_event_count() calls appropriate API based on rmid_read::is_cntr.
> 
> What do you think?

Sounds good to me—this seems like a much cleaner approach. I’ll start 
making the changes on Monday(out of the office tomorrow). I’ll let you 
know if I run into any issues. I might post snippet if necessary.

Thanks
Babu
