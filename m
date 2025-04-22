Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965013C3F6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745341584; cv=fail; b=CA6kYQGfNVHjPquuxIPCXbIbaIaao0uWI/lA70evgtzuO1TU+EwgrSOOECwbiMDiSjp6iLD2vtY5jAaMJ7PxGtQMvuC90TGQ64/qjlXye3jjNtUrFEhF5Htjduz15pZFr2GKd9aERAIGeYeSQdJPTAeHptcaQA1I9YR4U/Az+kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745341584; c=relaxed/simple;
	bh=ud/a49iYcqszusa4fE7pMomTKOE0yWC3pJgJT09r0jc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZLdjZmwvC/LHBbssBlitj7gCLoY5OJizu4PQmM2zZjGxNeqkfHVcuIGCqmuo+rJwYWKzNOP9bPuxDcFfJgKEtKjHA07MnmjcRkhHMrMuKDy7Q1G2J0cWDE7Y0aX91UxGGBQCCSp5gJ18F09Gi2NPftSH5sn1L1lHMpcAc9ST7xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4sd742e0; arc=fail smtp.client-ip=40.107.100.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4sd742e0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMUwulcnALiBF+WBLFsiLLaoTtW1lCRG6T/QfSwPjuw6PndMbWmACdwKAwaZtvZMya4L1JvLz/H0YJus3nDcPIrlHgOg9TsaXSUNAFRMLuQob12INdsioGBAFgmhDqSXnVtGGiR3iOgPlBgQg0YPG4WwLsjsj17qcgg60JMAQl6xnPecUaykh7mP2axPFP8kOSN0ZaASFpk+GCZAMTzLeezhpNLw7AXPOG7JXclX+7dHic7n3LiFo+xlA0FB6UAKlGgpu3Jdkjm0/e1ANjBLEFzoaOh50obLfb8D3Nk91QwiyUHPBNp/6uG7PMKQxUXalkxfRoyKnnEE5NzQT7GtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRrGl+buvLtEr8CHKjJBLkF2+vAeQ6b5V3fJn5Vx0uo=;
 b=aPRzJR9t4FtHg9BRVGumEnqJzUTvVEidZ9P/MU96kbmxEYJwYtxVxvVmPkVUVa+PDjq1suq0rpINt7hj3duRl0AgDMzixO/sKiMJSRhZ9vnrSzbZxdSY/9/pTS2Ppcvy4zhxUHd8DMTRcCq0jxayfRrfliQE8HR8QL9QuDFylDEDkiXwNrnhP9iBbprMAmS1MVcOutMPgc9JLvVXh2plYzLstpr3oKrXUgIKfUZVkYxucRsgWkeA6ESGTHz/X6TG/1Flj4ClVW9YUnMvzA5QSu8uRsvZOKWi4jleGKQwA2TvbuFwD/yzmHd2/o6Gb6AIrVw4FKyLCuuJWccDZ20RFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRrGl+buvLtEr8CHKjJBLkF2+vAeQ6b5V3fJn5Vx0uo=;
 b=4sd742e0COQUZG7qqk+nZW7CE6xspLf5GfxTCs0gNOEsRpPpwXAWMUBJGpxi3+kzdVM26MVBEzmHJ+0diZ5QfxubOrdGM/FRttkBGc6/h2DaT07ee6HoVV811xLZIPfZRG/B/+hf0yTm33thh8AtrBPU0PmdtkdxXrfiUfuXS9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CH3PR12MB7619.namprd12.prod.outlook.com (2603:10b6:610:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 17:06:18 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 17:06:17 +0000
Message-ID: <70403b1c-d81f-4c5f-936e-f3cf3308822f@amd.com>
Date: Tue, 22 Apr 2025 12:06:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/21] x86/resctrl: Expand the width of dom_id by
 replacing mon_data_bits
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 Tony Luck <tony.luck@intel.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-9-james.morse@arm.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <20250411164229.23413-9-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::17) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CH3PR12MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ea1d98-da5a-4085-5011-08dd81bfff27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlhTUEdaVldSZmxNTGRzbTNKUFBvUkhkYUdoRW5uR04weHN2TCtBRXRZejhs?=
 =?utf-8?B?K0NCVTVtb2M1eGpGUW1wbXhTVHp3RE1vNlBzdnVmVFNoTEpxN3dldHR5ajJS?=
 =?utf-8?B?Qmd2VGtNNU5yRVl1RnVhaEVTbzRTbTF2S2g2M1FCNTJCQldMU0xab1NpY3Vw?=
 =?utf-8?B?d3VVL1h1Q2hXQXhGUEJpYjBhZlFvVmpVZG9YRWJjcHprMzdrS2IxbmRCSDFW?=
 =?utf-8?B?dWdlZEQ5b1JCS3pPRHFuMnp1dGQ0ZjA4QkFKWFRRamQ1K3FzT2FTQ0xhL1Fs?=
 =?utf-8?B?b2ZlR1Y1djM5WUtsaEMyWDUzNHZLY202eWV4VTMybUc5Nm9mVGxDVTZ4TDA0?=
 =?utf-8?B?dFZSWXBZK0pHNkZlRE9mUzEwZmtUeXk4SVVFemg2MkVyd2ZRbWVaTWFXZHpi?=
 =?utf-8?B?YzRPWWRkMXprRFJFRjRjdUxJMWhhVXBST0lsWTk2anJlS0tLYjVDQ1BwV0xU?=
 =?utf-8?B?emhsUkVDZ25ZcEp0dFRTSlVleHFMb3RxdGJXSjFkeEMwUFh0akptbDFtZCtt?=
 =?utf-8?B?LzI1Z1EwZnRUSzdDUWRTM1dTZDFXN1VnSjFySUdTUStXZ0FJenZLOGNHOWV1?=
 =?utf-8?B?Y3ZRQVRFVU1hTFdwRkJQMUlFSndneHZZN1UwSmtRS3Y4ZUVQWFBQRWJoTk16?=
 =?utf-8?B?OHcvbXZYKzNhWHVzb3lVTlpXK1BPNlpZN1hXNFFNTnBndDdEcmtHTUlXaStq?=
 =?utf-8?B?bEt0YU1yaDZuRGl5Z2RoazMvbGxyMk5OSkxFakx6Ums5TDZRY1MweDlsNzVa?=
 =?utf-8?B?K29QMW56WmRMSWw2UFRxM2xIcU1xbGVJZGRyMGtWNkFwYVRaWkl1aWFtUkJI?=
 =?utf-8?B?dnpOTTVTTXVHenQ2MGd5Mk1ZWkdhUWNrNk5JdWZHVHFDMGVhV0hiOEIrVzZ3?=
 =?utf-8?B?S2FTdXNlL0ZPUkJ0TXh0dUU4RzhSYTY3WTB4Nys2RUhGeWlwSkliR3ZKOG1T?=
 =?utf-8?B?UFJ4cko5SHd6ck5hK1VhWXRENCs3ajJRUGJ5S2pWNWFHdnlVVVdjWWdqdmZM?=
 =?utf-8?B?QUEvekI3R2pXSEEvQmN6TFJrTnU0a2dTVitvYWZVZ3M1Tk1PdFg3SG9YL0sx?=
 =?utf-8?B?UzhmY2pGYitWZFlYTG9mT21BakJpK1Exd1VLNVFUbU94L1Ayc2VUYm0reWZT?=
 =?utf-8?B?SUFnVUJudmprdjVGWThCKzBxQU9keW1xTy9HWWQwQTFJKzlYTWRqc1NkaHUv?=
 =?utf-8?B?ZWNBaitEVHNwalREdE8rTFhHN1dQM1pOMmkxVzFyS1piTlRSNlZYK1FnMklI?=
 =?utf-8?B?VFhCSXJQTTdZY1EwdFZGbDhOOHV0bmlib214YTdqV2dMYjhxVmVjbXhuUFp2?=
 =?utf-8?B?dWMxOTJvYXFTZWRTb01PQnNnLzRFMlk0VzFIOFFmbkYwL0ptd0VVc29PMWMv?=
 =?utf-8?B?RWp6Q1JEK3BKVW5RMGFHcCtlc2Y5VGg1RHl0amZkS1JiangzRkVaWFlBQnpu?=
 =?utf-8?B?VUR6bUwrWnVlQTUraEI5bjltRE1yQ1h2QVdqbjVVMjk4ZURZSFcwK2RUQ3Z2?=
 =?utf-8?B?N1dDcFV6eTFHc0laWDFPZC9xZVRyUCsydG0wd00rREJhVEx4VzF2YWZjZ1VW?=
 =?utf-8?B?SXRGbVNSMjhTWHZ3WFBvYVFLVVBzOVNObzBmOERyNUl0b1ZTaGdlQnlYL05L?=
 =?utf-8?B?RGxObXBSL3VlZWFVK25nSm9EMVJSSXduMTU2QWNUd3AraDVMR3lrbFRxUXgv?=
 =?utf-8?B?SGlvNU5MNG9VelZTaVlJMkdCNlU2UWkyVmRodmR6Z2VoVHFrcmJHazV0YW9W?=
 =?utf-8?B?cnBWZS9xWnNMWTAyd29rZHlaWEVRSm5rakQzWmpkTGNJZCtwbmg2M0djekpC?=
 =?utf-8?B?anFjSll6UzRhN0xURCtKaDdhZXBaT1E0SmhkNHdqN1BUWmRod3ZmbHAzOHRC?=
 =?utf-8?B?TEk3ejJadkhsQUtqd3M1SkM3UWlOY2JSTndjdG9DYUgzR0w4MWxhUXkwTmRj?=
 =?utf-8?Q?Ci7h1UO3htE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3Q0QWZwT01JQXFXRTZ5T1crRnhsa1RxL2M4MzdLc3VwMkViaEVjZm9ZeDdD?=
 =?utf-8?B?ZXBuZ0RsTDNTYWhwZTY4VlFZSlQxRUJJYXlCbTU3L3JVbGRtS3pLaGJsUGFC?=
 =?utf-8?B?QkNtbTVhV2ladi9nWFpvSCtkak5pOHdoYWp6Y01MaXBoZUZucmIvOUlHbHNO?=
 =?utf-8?B?Qm1JbDRlZHpQWWVRaWQ4TnJCM3o3V3JXcmI5clUvZHNzcnEvMWgwRVEyVjhi?=
 =?utf-8?B?enptNXJvS2dBM2hrSkVDUkR4S1JaMmxWTjdvS05IeXFPTlNseWRTOXQzQjJB?=
 =?utf-8?B?YURQOFpNQ0VvV1FCS203QTJZaE9CZCtNRXlpZDNsQ2pWNnBrZlJQSUU3TEFt?=
 =?utf-8?B?R0l5Zm5saFpROG9XbVBjN09vNzNUSG93bHQ0Wk1sdUpheE1rYk9VanErZE9N?=
 =?utf-8?B?b3hGdXYwekUyRVdnZCtRaHNENkl4VkZKdTVQZUFXaUx4eFpTNzdvZFl3QUJC?=
 =?utf-8?B?VXRrSzRrdTZmOERlMFlWUThnMlBkWlRIUEQxY1FtclNyYk55a1BIakFzSTg3?=
 =?utf-8?B?R0JlMWtQOWU5V3dGYmpLVHpmcENZczRPN3hHOTlsdmdGQmdYYklxWGpGaFJN?=
 =?utf-8?B?SWMwTEZ1d0FKVGdIQ1FxZ2Q1WVVmMFNmR1RqTWR4RjN5K1EwSjBTclViMkVV?=
 =?utf-8?B?Q1RjRjQyeDc4SS85bk5GTHExTUY4dWJWdjJBL0c0VmxMV3YwU3d0d0xLaWhk?=
 =?utf-8?B?RGpNZDVzOHljeExWYXhxQ3pBdzFjT0gxM0xlMjlxdmF2NjBJVWdlMWJLMnh3?=
 =?utf-8?B?NnlTOEV6RHlDYU0xYURtVHNLR3FsTXMrTk02aittYVUvb2p1UjcvUkVISDdy?=
 =?utf-8?B?NFRjNzBKcVJaNkt3QVV0cDJ0YlgxUmRPckJhSW1YVUZiRFpHeHZwdkZIRjBs?=
 =?utf-8?B?SWdYL3ZranpHN0NQcnllY1lRVDFHdzhaSTVoc0s2WFlQVWFBbkdyU3NZVE1L?=
 =?utf-8?B?SDNxcDRiZFNyTjEzNXRKa1VCWUplRGpER21WN3Z3amk5WmMyUUJwcGVoMnQw?=
 =?utf-8?B?VlFtem5GYnhJaEZhVmpZL0NnZFMwZm12MnJsRFk3eVVpMkdpT0JSdVZxSktI?=
 =?utf-8?B?WXhqSllUaXBYdzF1SHVSUjYwdXNVbkFUNjQ3b2t2a0ZxdmhodUZJQ0QwaUE0?=
 =?utf-8?B?cEpyckRKVzdyQnhyMU53WDFhS3R3S0NHNERxVFc5c1NUUGhEbDBtYlc2eGZl?=
 =?utf-8?B?MllJRTlXRC9Nem5RK0hxMnlKT1FZL1BwL2lBa0VTK2xmbFhha055emZsWFEz?=
 =?utf-8?B?NnlWRmt3L21kZWl3cGU5bitxSlRVSmtGN0VaTmpiU2gxdzBLbE5xVk16ZnB2?=
 =?utf-8?B?bW5sQVhKUTdGdWpQWW16UEk5SVEzKy9MeFgrSTk2N1RLMjhNWUZkREUrNi9r?=
 =?utf-8?B?YVFaRGVORnQxZFp2UTlOdGhNd2ZTMUtUUWFMWnlENkx6bHVYa0FNMFU4ZUZL?=
 =?utf-8?B?dE5aaEtpRXAycWRSQng1Z1BPYXdoNWhKZVBBS1hxWWFLQ2RkLzVOaGJYQnJ3?=
 =?utf-8?B?WHdBUTN0VXdwWm9HWWJLMWFSVTFvREhUYVRrRC95NVFNa0xkSi9Uc1VnRU43?=
 =?utf-8?B?KzY5M3dLeVZwSmFOUStVMTZFM1YxcHZuNmNIZVRYNThkYk5YQWtLU3JybW1y?=
 =?utf-8?B?R2xTS1V3R0tWS0R2V3pvYTU5cHVtREpKdlBzYXJYV29abmpZNEw0K2R2Qmxn?=
 =?utf-8?B?anYrWFAyN3AvYTg3NEdDbmE2TW5NSGVqUUpjSnRiaWloQjhnK3RrWmd3aS8w?=
 =?utf-8?B?aDVKVWpLdnV0QmRadkFIVVhSeDA1NUVUUDFCclJ0dmRzeFFOODNVQyt2SERF?=
 =?utf-8?B?UWJOVWNsUEpkdFh4YlVNZnJLaDc5STl4d2pZM2RKRjE4b0Nva2QrdkFOUFR4?=
 =?utf-8?B?RDFKaGdISE5yTTZOQkJjK1JMM0NWNW1KR0JKcVhCLzhqV0p4TE8rbXQ3bWlp?=
 =?utf-8?B?cVBLUlFVVjhhZWRHalVEMGZsamlKV2ZDRVBnNXEwUS9uU3RsOVFhU2JHeXk5?=
 =?utf-8?B?STdrY3UzVzRIMXlBcUxOSTFLZVpiZ0loaFRUaHI1QWQ0cEwxSzI1RmZwSlpk?=
 =?utf-8?B?aWZVeHF4dnByOEFZYk1BT2tTRGNXZzhxQURnbzNiYjJTdS9OYk5ZK0JxZCt0?=
 =?utf-8?Q?ZAvI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ea1d98-da5a-4085-5011-08dd81bfff27
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 17:06:17.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XK4jteFaJ32wro5VmBEueOOfy+PHTOLULEzTsKuXALYeCFoCwK0v9A3nZGuINbBm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7619

Hi James,

On 4/11/2025 11:42 AM, James Morse wrote:
> MPAM platforms retrieve the cache-id property from the ACPI PPTT table.
> The cache-id field is 32 bits wide. Under resctrl, the cache-id becomes
> the domain-id, and is packed into the mon_data_bits union bitfield.
> The width of cache-id in this field is 14 bits.
> 
> Expanding the union would break 32bit x86 platforms as this union is
> stored as the kernfs kn->priv pointer. This saved allocating memory
> for the priv data storage.
> 
> The firmware on MPAM platforms have used the PPTT cache-id field to
> expose the interconnect's id for the cache, which is sparse and uses
> more than 14 bits. Use of this id is to enable PCIe direct cache
> injection hints. Using this feature with VFIO means the value provided
> by the ACPI table should be exposed to user-space.
> 
> To support cache-id values greater than 14 bits, convert the
> mon_data_bits union to a structure. These are shared between control
> and monitor groups, and are allocated on first use. The list of
> allocated struct mon_data is free'd when the filesystem is umount()ed.
> 
> Co-developed-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Previously the MPAM tree repainted the cache-id to compact them,
> argue-ing there was no other user. With VFIO use of this PCIe feature,
> this is no longer an option.
> 
> Changes since v7:
>   * Replaced with Tony Luck's list based version.
> 
> Changes since v6:
>   * Added the get/put helpers.
>   * Special case the creation of the mondata files for the default control
>     group.
>   * Removed wording about files living longer than expected, the corresponding
>     error handling is wrapped in WARN_ON_ONCE() as this indicates a bug.
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 19 ++++--
>   arch/x86/kernel/cpu/resctrl/internal.h    | 39 ++++++------
>   arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 78 +++++++++++++++++++++--
>   3 files changed, 102 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 0a0ac5f6112e..159972c3fe73 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -667,7 +667,7 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>   	u32 resid, evtid, domid;
>   	struct rdtgroup *rdtgrp;
>   	struct rdt_resource *r;
> -	union mon_data_bits md;
> +	struct mon_data *md;
>   	int ret = 0;
>   
>   	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> @@ -676,17 +676,22 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>   		goto out;
>   	}
>   
> -	md.priv = of->kn->priv;
> -	resid = md.u.rid;
> -	domid = md.u.domid;
> -	evtid = md.u.evtid;
> +	md = of->kn->priv;
> +	if (WARN_ON_ONCE(!md)) {
> +		ret = -EIO;
> +		goto out;
> +	}
> +
> +	resid = md->rid;
> +	domid = md->domid;
> +	evtid = md->evtid;
>   	r = resctrl_arch_get_resource(resid);
>   
> -	if (md.u.sum) {
> +	if (md->sum) {
>   		/*
>   		 * This file requires summing across all domains that share
>   		 * the L3 cache id that was provided in the "domid" field of the
> -		 * mon_data_bits union. Search all domains in the resource for
> +		 * struct mon_data. Search all domains in the resource for
>   		 * one that matches this cache id.
>   		 */
>   		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 36a862a4832f..d932dd1eaa74 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -103,27 +103,26 @@ struct mon_evt {
>   };
>   
>   /**
> - * union mon_data_bits - Monitoring details for each event file.
> - * @priv:              Used to store monitoring event data in @u
> - *                     as kernfs private data.
> - * @u.rid:             Resource id associated with the event file.
> - * @u.evtid:           Event id associated with the event file.
> - * @u.sum:             Set when event must be summed across multiple
> - *                     domains.
> - * @u.domid:           When @u.sum is zero this is the domain to which
> - *                     the event file belongs. When @sum is one this
> - *                     is the id of the L3 cache that all domains to be
> - *                     summed share.
> - * @u:                 Name of the bit fields struct.
> + * struct mon_data - Monitoring details for each event file.
> + * @list:            Member of list of all allocated structures.
> + * @rid:             Resource id associated with the event file.
> + * @evtid:           Event id associated with the event file.
> + * @sum:             Set when event must be summed across multiple
> + *                   domains.
> + * @domid:           When @sum is zero this is the domain to which
> + *                   the event file belongs. When @sum is one this
> + *                   is the id of the L3 cache that all domains to be
> + *                   summed share.
> + *
> + * Stored in the kernfs kn->priv field, readers and writers must hold
> + * rdtgroup_mutex.
>    */
> -union mon_data_bits {
> -	void *priv;
> -	struct {
> -		unsigned int rid		: 10;
> -		enum resctrl_event_id evtid	: 7;
> -		unsigned int sum		: 1;
> -		unsigned int domid		: 14;
> -	} u;
> +struct mon_data {
> +	struct list_head list;
> +	unsigned int rid;
> +	enum resctrl_event_id evtid;
> +	unsigned int sum;
> +	unsigned int domid;
>   };
>   
>   /**
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index c69ed978aa50..aa0bc57e1c7f 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -45,6 +45,12 @@ LIST_HEAD(rdt_all_groups);
>   /* list of entries for the schemata file */
>   LIST_HEAD(resctrl_schema_all);
>   
> +/*
> + * List of struct mon_data 'priv' structures for rdtgroup_mondata_show().
> + * Protected by rdtgroup_mutex.
> + */
> +static LIST_HEAD(kn_priv_list);
> +

Do we really need to maintain a separate list for all the private pointers?

Here's my understanding of the patch—please correct me if I’m missing 
anything:

Patch Requirements:

1. Expand dom_id.

2. Pack all necessary data (dom_id, event_id, resid) into the 
of->kn->priv pointer when creating event files in the mon_data 
directory for each domain.

3. Dynamically allocate the priv structure during event file creation 
for each domain.

4. Free the priv structure when the mon_data directory is deleted in 
each domain.

 From what I can see, the global list "kn_priv_list" seems relevant only 
for step 4.

Wouldn’t it be possible to handle this directly in rdtgroup_rmdir_mon() 
and rdtgroup_rmdir_ctrl()?

We could retrieve the kernfs_node for each file using kernfs_find_and_get().

Thanks,
Babu


