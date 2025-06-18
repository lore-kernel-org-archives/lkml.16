Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204EE14A82
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228666; cv=fail; b=RmIKEt4OdNKVzGiBmySavMF2wJFmhz6qY4SSWSUwgjbc/2ei9d7Fg5Kv78mHpie7/KMY15kkABRiM1A0uXEycKiQGlfceIO/vhIjwpqIEh5RWDQrx4I7hBx9gHfAyERqC7S+mrlP/4kdGByEMhv8Gr8ZNQ7A+Pg6J6ffjFCrbYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228666; c=relaxed/simple;
	bh=opG2YnYdqpTu/I5rxLQvO7kmqQleNgvYhgUKNYfObLY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RwITH55k9s9EF8t7pL8Dmojk7r+xt11boj3mwzqN0eJ/jRUqOeTROzW+QxZ5Lx5dJrA0UYlUu0W1NHIse6fcnz1mcgM2S3YX7s2u0d38w7CgvqT98vlh9oqa33J9e/aKtwlsTRJhnscxXctqFYyVbxfxSJfOOY8P6Znt6HUqwc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GqHQ9Q5+; arc=fail smtp.client-ip=40.107.223.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GqHQ9Q5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBJAyaO/j8pJ8DlCzrvkQsn+finNe2/0hkS/xgPTVoZQA3DNktCCGNfxS3UoND/wljs3Iu8gfwFz0bgh5oEl8LKhETagrKJFHDmxZAq5tj9PH1iAKN6Ps0z/v78pMS2Phojfo/pt2dx3jY1FnCunOFI7N2kbSKIgCBUAfLAVU2H0OhHEdsMfZT9ZiYf1426EMKxraBCUBiDNZWM7DDR2y4RYEceiM+9noX4yo6Hraqo26u7rqjUCbyLp9HttC55KCW2cHTMxJY7OVTPFeF3FtAlMIaCTw1GUVkyRyYB17tY9unz+Dt8TFQqEiqJWOZS3uSvlRDMTenF+beMOW2WP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxgocPy1Ahi3NxI2YEXaFRCX0piijjddZwj4cjC0Gtw=;
 b=SWXVaqahW49nXSs0wOCRLvXOap/fS7YI1KHcHhD4YJ4/PDpHzpbvi4A5aKYT3Bv1Y0vVXAmZB7z8SWvtmbYaJ2RBI1BJWe8pet2iFWZW8vUrYVuPzpAvm3wVvXptqhfGqXjypMemCrs4RQNLI0B560J4twfIcNcr53T7mcu9oWHtgZHqrlZOp03wJKwfWStUxRucgCeADmh75heAX5pcrfFcbiePMCzBr1uRxdBlVEDMmwGjoatQTYNHyTViiXvgDMaNEtHZzsfVytXt7rHZiUgvLhUMQFgiUaeLARBHFkaYhr6Ihjf2UeG5Cm7qPS64t9in1FIzQhjy2s9lZ0X88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxgocPy1Ahi3NxI2YEXaFRCX0piijjddZwj4cjC0Gtw=;
 b=GqHQ9Q5+1VPwxrxXb/bZW4ENafjERBHO3S+ge4cZeMCQHoxMieSIqPlC4fEOI5WuGCV8GnclLWeCzwCoX7aorwWpw/VKU6TEwK7hxxjSuE2kYzPSnu1R/5OBn6GuuzB4sWOrYKlhZ+2XsF5sgHR8Ua1ACsud46nsfybBHFHOqbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 06:37:41 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 18 Jun 2025
 06:37:41 +0000
Message-ID: <5216c899-efec-4524-a5a1-1fdcd2834165@amd.com>
Date: Wed, 18 Jun 2025 12:07:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: allow imbalance between LLCs under NUMA
To: Jianyong Wu <jianyong.wu@outlook.com>, Jianyong Wu <wujianyong@hygon.cn>,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
References: <20250528070949.723754-1-wujianyong@hygon.cn>
 <e2b79e4e-f964-4fb6-8d23-6b9d9aeb6980@amd.com>
 <SI2PR04MB49310190973DC859BBE05DE2E366A@SI2PR04MB4931.apcprd04.prod.outlook.com>
 <db88ce98-cc24-4697-a744-01c478b7f5c8@amd.com>
 <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <SI2PR04MB4931A23ABF08616FD8A133D6E370A@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::26) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab06b94-19b0-43e6-96f2-08ddae329fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHVNSDBoY3ZuRnFScG5TR1ltMTFSZkd5SlRRVXhTdVRKQVRKZDNhZTJnTzRw?=
 =?utf-8?B?aDFMeTVZcERUSk5ITC9kMm5EbDV6dW9DQmdpMmVlbVZ3blJ1VGRFWmRXZ1V4?=
 =?utf-8?B?ZFlYdnRjbVZWSytjcjRtMmkzMTNIdldsdjFRbG5nRmdXaFRsQWlQemhobnFx?=
 =?utf-8?B?VmdFRVRxYVJmdFFRejd3MUV6TERySXZ6eDJTdUpubUkwOUUzOWNmSnV5NExV?=
 =?utf-8?B?UFRhbmJiMTFWbkdKTGpobzk2WjZXenBJQW5SZlhXVjFBRFNmSTBJakY0cHY1?=
 =?utf-8?B?QWFDUFE5dGs1VEpLTUVGNWtCLzR0aFU3Yzk5aGl3MkUzSnA5VCtzM24wcGhJ?=
 =?utf-8?B?WEticGlLTGptcTNHRS9OVUoyQ2l2bnEyWEU5b1BUNXZuTFJxRm9HL0IyTXl4?=
 =?utf-8?B?NlEvbFVMRWZ3VGhGZEJxbTJEKzc4UC9kU1JDZjNNRmtBQmZaUWE0T0NkQ3FL?=
 =?utf-8?B?TkdqUElMOVBFM1VJVmhyVTM3RFREVXplaGNwNHBLMGVMNkhwZThzVnFqRlRk?=
 =?utf-8?B?V05GTjFpc0VmQW53WkJWakFHU0FKOWJWbUtLNkxEeVd4Z0d1LzZ3dnBoZHZR?=
 =?utf-8?B?amk2MmFBMmhQSkNhOU12Z0V1Y2VqYjQwZDBabG9jUEJpb3NLMlNYdXRoQ3Zq?=
 =?utf-8?B?UkRydVhjTzMzWStoWFdRN1dDcHY5SXZxamRaQVc0c1JuRmpEZ294bjB4TzZq?=
 =?utf-8?B?TGZ4dmJpb1FVUk4rMGJKSEZxMjNBRnRPL3JSUlRLM0pRekhFdlE1bGJmVjZD?=
 =?utf-8?B?eDE4VE9jK0wxNk1qTHpKMXcvNWF0alhuYnY4UmlVTjZkdXhUaW9aanFub3p3?=
 =?utf-8?B?YmN3cDNxRW8yYUx1VmNDVWlBaHczWFpuYjBjMGxGaTFmUTEvdGxBUk1obE1Y?=
 =?utf-8?B?UUFMZ05OT1huMTZVL1ZkZ1paSzZrMmhDWVBOZWtyRGMvNEo3VTFCSTlmWC9k?=
 =?utf-8?B?MzhNS1NQeUtxTmlBMDVQbVE0aHdYYUkxVmpwT2o5alRyM0hpSzZ2bEhOYmt5?=
 =?utf-8?B?VnYyMXArUmQvUU9yY2tIMWpsNThQM2NUUTNMcHNyalpWeEtYblVycHB2QVRR?=
 =?utf-8?B?c216d0dNNXFmWllWaWZESlFlS3NQelZsNmw2dEEzaDJvL0FLcW5VNlhNeEk5?=
 =?utf-8?B?Y1A2Tlo0cGZFQldCQmFUdXpPSXRBdG05WGhwcGtyU244TXA5UlpHZHM0WGw5?=
 =?utf-8?B?QndGVmpMUFJkSk10aUtmaEs5UnRBN29zaEtxMzVNdnZJZDNhN01NbXRsbCtU?=
 =?utf-8?B?V3dwaEtmNjU2ZStpQWhPVXBTU3hBK1FqTXVXM3MvZ0Rjd2FoditEWDFsUW5z?=
 =?utf-8?B?dmJvcC9nNHFOT0lOekxNYmgrSURSendQVWtBNGljRVJhVzMwRG1QUEdiQXp6?=
 =?utf-8?B?VnJ2RE1jdm5lb01mMmJETE5nT0tzSGF2TjVKQTF2ajdUWXNLS1lteVVZYk02?=
 =?utf-8?B?Y25BYmh1NS85M3dxNHI1LzUwT0FVNjBSZ1Z1eUFWRUM0NDFyNGdMT3BiSzJI?=
 =?utf-8?B?cXU5a2NiMmFRTlh5TS9IWkN3U3RjZThSZmxyNUhoRGRGbmVCd3NOV3RXQWhU?=
 =?utf-8?B?VG9PZExpc3BOWGl4UnJ0d3lPeGdESnM3ai9JVEE1STE2SlBac3hkZzlnTStS?=
 =?utf-8?B?S0t3aGhKVUpQbDd2em0wZzl4OW9leVpGWXhUOHgraW1FK2hRUnZvY0ViUXd0?=
 =?utf-8?B?cG1ZYlZnb0IvZzNZVk8vckhUSlgwa25RbjVuaTF2bG1WeEduOGN6ZEVVVlM3?=
 =?utf-8?B?S0NYVjl1Z3RzclBwWUZ2eFFsdEFMeFRnNzhCbWs3bkF0ck1hT28xalM3Y3Jl?=
 =?utf-8?B?UDVyNGlicm0yTzVzcHMzMThCWEx0WmNDWHBaaEJ4ZFZrZ1g2cStRKzZ1TFp6?=
 =?utf-8?B?TVdlK2lJK2xKQ1NtcjVMSEpRTFpPZnZjQVNYdWtEZ214bVRyam5jTTY3SFls?=
 =?utf-8?Q?/9C8l4ruSUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2JjRXNybFhtdURpOWoxSzhHZU01Q2p1VC9kaXlwZVNCQ1k5NHA1RVhUUHVs?=
 =?utf-8?B?UVpWZHlsMkdXb0I5OWI1RDNzSEVHTWQ1UXE5bmZYRXhYelpCbGNzcStFNVcy?=
 =?utf-8?B?TkkrTU41NllGR3ZiY0N4Ry9PTm04UE40NHZaZDR1VHl3VlNYV1plWklDUEhv?=
 =?utf-8?B?V2RqNTcrSWk3eXVubXR0aytIMDBJdk5tazBMVjN2SytsUzhFMTM2ZkpyRXRC?=
 =?utf-8?B?N1kwcjRhZndUNkhXQ1FzTkpERVhMMDhhWWoyZkhFdVoyT1ErcUl6bGVieHdv?=
 =?utf-8?B?ZktrZDQ2d1VCVVlWMnFyYXpUbi84VEkxTnpWaU8zQkZxSnNRSDJLWVc5VWNm?=
 =?utf-8?B?N01UWVVXekxFRHVNeE0vS0xtaFM5cTRVd0pQSFpwVVhvbW4zbXdxVVZSaXBT?=
 =?utf-8?B?OXErQ2FGT25VRFRtMXl3OE9tUWh0eFR1VWd3RVhtZ0hCZGtxUjdFcktSMC91?=
 =?utf-8?B?VzhzUmZnZGRUQTJoUys3WDVvTmpycTlxTzE3cUlRZDR3dmVXd0MvR0ZGaGRy?=
 =?utf-8?B?TkVuN0pjdjd2RnY4U3lFNXdxRDdPVGVZN3JnVUVjOTRMMlRhSVdBd2U2NzVD?=
 =?utf-8?B?ZVdiaG5Ub1ZXMWY0elJxclNycXBHMkhvNU1KQ3o5dkZaVGVyL2VNWU9VTnpE?=
 =?utf-8?B?dk5wSHVMd2lITlFLZ2UwOUNUS3hPVEppZkdvNS9jcXN6Wjg0cXdnMzYyZStX?=
 =?utf-8?B?QkRHcURWU01mUjMrQTUxeHduRExLME1aRGN1V215ZGx2cUUzY2REQjU5QXR2?=
 =?utf-8?B?Mzg2WEh6ZGhxeUFITG5mbkhpUWdHNWsxTGMwR2VWbTBSL3RSRExJNWFoSHEy?=
 =?utf-8?B?NnRPVzVTb3BCU0ZXakg5VGt1dmI4UWFoYnpIVUw5T29uYXdOc24vV24vQisy?=
 =?utf-8?B?ZkRVVng1R0lWbnNtbUFab20zMmFSMkhJYzczSmphL2lscis4TnBOK2pvUWZ4?=
 =?utf-8?B?N0IwbElhdHA0L2FvSDRLbzlPQXBqZ1NZUU1JWStSTXBmTzR2OUJLUHlOT3Ux?=
 =?utf-8?B?WGIvdlBjNHNnZzhBS2UxUnI5T1J3WUdXZWwzdEJONmdRb3JScXFsRmEwQzcz?=
 =?utf-8?B?YjNTSGxFVVRoaDhVVVdYQXJoY2IzT1JNUGhWMi9RZkM5UHVaQ1BYY2hGaHNX?=
 =?utf-8?B?eWxjV2NFT25aVUdTRjNqR3VFVEhqYlR5ZmtEU1hkKzZsRzVQbUVMYWg4TzlQ?=
 =?utf-8?B?czRvRklGdnhmVUtlVGphajRRUkpGZFBRTEUrNUhhOFQ0TkV0WTJLTEwzeWpF?=
 =?utf-8?B?dlB3VW16eFRpR0cyUnQrSU9FSmsxOXJpSTZtUnBHSTdURzJvSWtDMnQrYmQv?=
 =?utf-8?B?SnpRc3lGdW0rM3F5LzBSYVBLNFZueWRaOWZUUTU5eWhDTi9aNmY1WlI1QmZP?=
 =?utf-8?B?dGdqL3pNMGpFQXkxMDdmRitxeWsvT1FWK2RxNTkzeUVVb1dFS0RwT1VLM2dq?=
 =?utf-8?B?MXViaGgwYzFXcDlJUC9hN2duVWNkOWlTd0EweThnVmpPa3RWVlQxQkNNYS9J?=
 =?utf-8?B?czJpc283TlJEK1g4K1RkUmhPeEVxSnE4bzNuZ1d6bE1KQXl3VVhoaEMreUpz?=
 =?utf-8?B?R2gvL3JZcXhkVzlXTGtPR2NiSE9FQXRyZmE0TnBDbTI3ZFBxa3VFdWpZUXVt?=
 =?utf-8?B?MzloaW4yZE5xVmdzK0doaC96YkJKcVY5dWppNTd0NjBuTEpFdURCdjBNeUJp?=
 =?utf-8?B?RWxSZmJCNktQdWlUNEtEeHo5VkRieWNDQTR5b0d2RnVrTHVBaFQzSGZkTGdT?=
 =?utf-8?B?aGdxaFNSTTZENDZka0tjZlBxQWlmbm1QaDUyUTZnK1Y3RFh5NUtnSUhaRHBQ?=
 =?utf-8?B?MGRucUtQS1JLeDZ1SXdCRFZhb1ByYWo1aFRtNlozZ01XdEZhaDUrZXFCRmJU?=
 =?utf-8?B?SXZxQ0NBRndyNXNPd2c0ZXlzK1J6bk1mMnJRQ2hidGM5TGVWMVk1NDM1MER4?=
 =?utf-8?B?eXVLUGRxMHpveDF6OERhWGVaN08vUklHdUhDMzJaSlMxdXEvOVE5TVFaU1h0?=
 =?utf-8?B?a0Ewait4TTJLMlA3ampvMHJWYURKQlpyM3A4alVMQmtTYSsrdTZkVWo0d3Vx?=
 =?utf-8?B?OW1WR0dPejR1SVVIOFpPQTF3S2pOdVFhMFF2OE5GTzdpOGdOK0RYeTBLcUZL?=
 =?utf-8?Q?P0I/HQigm2uLYrOk/0FECsBsu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab06b94-19b0-43e6-96f2-08ddae329fb5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:37:41.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZvxM0kND7oFc8vWHKPs4eJ0XmCBu+xrreRN7wxlGCzRJOv5TgsjWJ+uxqoHTP1TtLoO9q7ojV36eU+/knK8lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

Hello Jianyong,

On 6/16/2025 7:52 AM, Jianyong Wu wrote:
> Would you mind letting me know if you've had a chance to try it out, or if there's any update on the progress?

Here are my results from a dual socket 3rd Generation EPYC
system.

tl;dr I don't see any improvement and a few regressions too
but few of those data points also have a lot of variance.

o Machine details

- 3rd Generation EPYC System
- 2 sockets each with 64C/128T
- NPS1 (Each socket is a NUMA node)
- C2 Disabled (POLL and C1(MWAIT) remained enabled)

o Kernel details

tip:	   tip:sched/core at commit 914873bc7df9 ("Merge tag
            'x86-build-2025-05-25' of
            git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")

allow_imb: tip + this series as is

o Benchmark results

     ==================================================================
     Test          : hackbench
     Units         : Normalized time in seconds
     Interpretation: Lower is better
     Statistic     : AMean
     ==================================================================
     Case:           tip[pct imp](CV)     allow_imb[pct imp](CV)
      1-groups     1.00 [ -0.00](13.74)     1.03 [ -3.20]( 9.18)
      2-groups     1.00 [ -0.00]( 9.58)     1.06 [ -6.46]( 7.63)
      4-groups     1.00 [ -0.00]( 2.10)     1.01 [ -1.30]( 1.90)
      8-groups     1.00 [ -0.00]( 1.51)     0.99 [  1.42]( 0.91)
     16-groups     1.00 [ -0.00]( 1.10)     0.99 [  1.09]( 1.13)


     ==================================================================
     Test          : tbench
     Units         : Normalized throughput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:           tip[pct imp](CV)     allow_imb[pct imp](CV)
         1     1.00 [  0.00]( 0.82)     1.01 [  1.11]( 0.27)
         2     1.00 [  0.00]( 1.13)     1.00 [ -0.05]( 0.62)
         4     1.00 [  0.00]( 1.12)     1.02 [  2.36]( 0.19)
         8     1.00 [  0.00]( 0.93)     1.01 [  1.02]( 0.86)
        16     1.00 [  0.00]( 0.38)     1.01 [  0.71]( 1.71)
        32     1.00 [  0.00]( 0.66)     1.01 [  1.31]( 1.88)
        64     1.00 [  0.00]( 1.18)     0.98 [ -1.60]( 2.90)
       128     1.00 [  0.00]( 1.12)     1.02 [  1.60]( 0.42)
       256     1.00 [  0.00]( 0.42)     1.00 [  0.40]( 0.80)
       512     1.00 [  0.00]( 0.14)     1.01 [  0.97]( 0.25)
      1024     1.00 [  0.00]( 0.26)     1.01 [  1.29]( 0.19)


     ==================================================================
     Test          : stream-10
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:           tip[pct imp](CV)     allow_imb[pct imp](CV)
      Copy     1.00 [  0.00]( 8.37)     1.01 [  1.00]( 5.71)
     Scale     1.00 [  0.00]( 2.85)     0.98 [ -1.94]( 5.23)
       Add     1.00 [  0.00]( 3.39)     0.99 [ -1.39]( 4.77)
     Triad     1.00 [  0.00]( 6.39)     1.05 [  5.15]( 5.62)


     ==================================================================
     Test          : stream-100
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:           tip[pct imp](CV)     allow_imb[pct imp](CV)
      Copy     1.00 [  0.00]( 3.91)     1.01 [  1.28]( 2.01)
     Scale     1.00 [  0.00]( 4.34)     0.99 [ -0.65]( 3.74)
       Add     1.00 [  0.00]( 4.14)     1.01 [  0.54]( 1.63)
     Triad     1.00 [  0.00]( 1.00)     0.98 [ -2.28]( 4.89)


     ==================================================================
     Test          : netperf
     Units         : Normalized Througput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:           tip[pct imp](CV)     allow_imb[pct imp](CV)
      1-clients     1.00 [  0.00]( 0.41)     1.01 [  1.17]( 0.39)
      2-clients     1.00 [  0.00]( 0.58)     1.01 [  1.00]( 0.40)
      4-clients     1.00 [  0.00]( 0.35)     1.01 [  0.73]( 0.50)
      8-clients     1.00 [  0.00]( 0.48)     1.00 [  0.42]( 0.67)
     16-clients     1.00 [  0.00]( 0.66)     1.01 [  0.84]( 0.57)
     32-clients     1.00 [  0.00]( 1.15)     1.01 [  0.82]( 0.96)
     64-clients     1.00 [  0.00]( 1.38)     1.00 [ -0.24]( 3.09)
     128-clients    1.00 [  0.00]( 0.87)     1.00 [ -0.16]( 1.02)
     256-clients    1.00 [  0.00]( 5.36)     1.01 [  0.66]( 4.55)
     512-clients    1.00 [  0.00](54.39)     0.98 [ -1.59](57.35)


     ==================================================================
     Test          : schbench
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
       1     1.00 [ -0.00]( 8.54)     1.04 [ -4.35]( 3.69)
       2     1.00 [ -0.00]( 1.15)     0.96 [  4.00]( 0.00)
       4     1.00 [ -0.00](13.46)     1.02 [ -2.08]( 2.04)
       8     1.00 [ -0.00]( 7.14)     0.82 [ 17.54]( 9.30)
      16     1.00 [ -0.00]( 3.49)     1.05 [ -5.08]( 7.83)
      32     1.00 [ -0.00]( 1.06)     1.01 [ -1.06]( 5.88)
      64     1.00 [ -0.00]( 5.48)     1.05 [ -4.65]( 2.71)
     128     1.00 [ -0.00](10.45)     1.09 [ -9.11](14.18)
     256     1.00 [ -0.00](31.14)     1.05 [ -5.15]( 9.79)
     512     1.00 [ -0.00]( 1.52)     0.96 [  4.30]( 0.26)


     ==================================================================
     Test          : new-schbench-requests-per-second
     Units         : Normalized Requests per second
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
       1     1.00 [  0.00]( 1.07)     1.00 [  0.29]( 0.61)
       2     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.26)
       4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.00)
       8     1.00 [  0.00]( 0.15)     1.00 [  0.29]( 0.15)
      16     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)
      32     1.00 [  0.00]( 3.41)     0.97 [ -2.86]( 2.91)
      64     1.00 [  0.00]( 1.05)     0.97 [ -3.17]( 7.39)
     128     1.00 [  0.00]( 0.00)     1.00 [ -0.38]( 0.39)
     256     1.00 [  0.00]( 0.72)     1.01 [  0.61]( 0.96)
     512     1.00 [  0.00]( 0.57)     1.01 [  0.72]( 0.21)


     ==================================================================
     Test          : new-schbench-wakeup-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
       1     1.00 [ -0.00]( 9.11)     0.69 [ 31.25]( 8.13)
       2     1.00 [ -0.00]( 0.00)     0.93 [  7.14]( 8.37)
       4     1.00 [ -0.00]( 3.78)     1.07 [ -7.14](14.79)
       8     1.00 [ -0.00]( 0.00)     1.08 [ -8.33]( 7.56)
      16     1.00 [ -0.00]( 7.56)     1.08 [ -7.69](34.36)
      32     1.00 [ -0.00](15.11)     1.00 [ -0.00](12.99)
      64     1.00 [ -0.00]( 9.63)     0.80 [ 20.00](11.17)
     128     1.00 [ -0.00]( 4.86)     0.98 [  2.01](13.01)
     256     1.00 [ -0.00]( 2.34)     1.01 [ -1.00]( 3.51)
     512     1.00 [ -0.00]( 0.40)     1.00 [  0.38]( 0.20)


     ==================================================================
     Test          : new-schbench-request-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers:           tip[pct imp](CV)     allow_imb[pct imp](CV)
       1     1.00 [ -0.00]( 2.73)     0.98 [  2.08]( 3.51)
       2     1.00 [ -0.00]( 0.87)     0.99 [  0.54]( 3.29)
       4     1.00 [ -0.00]( 1.21)     1.06 [ -5.92]( 0.82)
       8     1.00 [ -0.00]( 0.27)     1.03 [ -3.15]( 1.86)
      16     1.00 [ -0.00]( 4.04)     1.00 [ -0.27]( 2.27)
      32     1.00 [ -0.00]( 7.35)     1.30 [-30.45](20.57)
      64     1.00 [ -0.00]( 3.54)     1.01 [ -0.67]( 0.82)
     128     1.00 [ -0.00]( 0.37)     1.00 [  0.21]( 0.18)
     256     1.00 [ -0.00]( 9.57)     0.99 [  1.43]( 7.69)
     512     1.00 [ -0.00]( 1.82)     1.02 [ -2.10]( 0.89)


     ==================================================================
     Test          : Various longer running benchmarks
     Units         : %diff in throughput reported
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     Benchmarks:                  %diff
     ycsb-cassandra               0.07%
     ycsb-mongodb                -0.66%

     deathstarbench-1x            0.36%
     deathstarbench-2x            2.39%
     deathstarbench-3x           -0.09%
     deathstarbench-6x            1.53%

     hammerdb+mysql 16VU         -0.27%
     hammerdb+mysql 64VU         -0.32%

---

I cannot make a hard case for this optimization. You can perhaps
share your iperf numbers if you are seeing significant
improvements there.

-- 
Thanks and Regards,
Prateek

