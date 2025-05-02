Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AA725D1E1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201893; cv=fail; b=Abyiz3VUL1bEgerh3Z5lkh/BRZRwkXRrPVO8lIuZ7WglUN/ArclQJXfTpUqSv2uuuk7o324ZCAbUohCKyO7fFFfXFlbgXGyeSI/CQKNAKFjifrcdcQLwmmbsCPm2/bdsmWIY/vZZDDJOOHdfHNHtp+3wVXymMRSYlFYICFsyvLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201893; c=relaxed/simple;
	bh=WVZ22+22NXkpjT1qAGm28s1A6B+bV2Kwlto0pv3yHBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kUp+SmK5PQYF0YmcyOwA7ZlnIDKwQHXVRiIB9oaMtoqO3HSavIptEO+LGMdqlhyRKKFhD0UAKi5le5PVXu/eHgzAEsjhf9M6p3p0BunmUjeZXQiwdHzAhGGzbFqrHlyfH2dNNi1ddOUgqZvMp7VWGzX9adptv9IFOgxpYBsw1ZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B3f2B/SM; arc=fail smtp.client-ip=40.107.95.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B3f2B/SM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0tqEQJ9AZCGJRTWBSCQvjBu9kp9Mmd6dzNfanAsoyaC4pnDq+XOGf3iCVv6Y1wZ6ss86cOjGNzUKGVGerj4U3FGr8KpdbXiY20XDIJ27Q3MkrpmFZyMSNOgTQ8V6BPpAZPe6kHnrDOyrTldcnwlc4s/P3PqcVtV6GsnxaCsLEhj4zv77UWsbABe1NJngZZa5lctM69ADZKbvOzlp7neOL8Shy+Gieos36/au7Kvc9D/97d2/oiuu2IZuQRs9kG09/7YmUpQ51Ra5NkXarBenWjlB88tvbcPQOa2IiKR/bWICrHDRWyjRXfxPHXENNsOV1FZt+P1GzD134oI73ISBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuvFefNlZQ9S0JwI0WUEIUaOdsy706fIuOnnv66uX8A=;
 b=WLvjvVHTSbIr0QO8LsWQgL53Iiy/ojzypRswq0JwJFTqYSfnBUUH4Jqg/6PjvM0jL7zu/r2bmKHFrh7YGooYX1/q+kmiB9jLSJwAZWB680LQhJs9jITS6kSJiG6xfAAKseqwDdOkOHxYa9iNqMULGVx164wHYRFj9wYId5A19k3njAi4J0QDpdtR1U8FI9tGDGp+ULykvLL28223rLja61ps4igruSo1hJHR6RKzIxqj8IIgTK9UlEAGaRUOiwt5b5hMgrW6poF6FEB/MQFXakMu7E+drszVo4IWximG3TaP1kxoOk2rKdf3+uAsFQ598xMgxPr5rMdC9vHWdPMeFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuvFefNlZQ9S0JwI0WUEIUaOdsy706fIuOnnv66uX8A=;
 b=B3f2B/SM9IIiY4NxRP7lBIfekNWNovu3NHu6osOa5DBX5QaqA8m3CcqYvjN+nU8cEG8pF4lntvneSygH5BVP0zDxcS0CQ7dleEXYf1o9jfScfAQXtyW63CaJpRaEuXTLwoXe6HU5jCyANovPHHkdUURqoeb1K/328VShSDTgOEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 16:04:46 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 16:04:46 +0000
Message-ID: <76b16ef7-2f37-4c30-97af-1d372b7fb251@amd.com>
Date: Fri, 2 May 2025 11:04:42 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Reinette Chatre <reinette.chatre@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com
References: <20250425173809.5529-1-james.morse@arm.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <20250425173809.5529-1-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::22) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: eea5dcf2-7519-41d9-ee88-08dd89930ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzBKVnQ0Qk9ibm9ObTc1Tm5zNjBLcGlNVWZCU1hhU3dBbVhGNWlSNEVZNC9Z?=
 =?utf-8?B?R1ZBQ01SbzZtcndOQ2E4cjFGeVR3bFdDUDkyTmZ0RWI1L2lTdERveTVuVGxF?=
 =?utf-8?B?ejlMYjlBVDhmMWNlbjFMZ3R0VHBxU2pGSVlTNGwza3NxSDdLU1UxM3VQNzZo?=
 =?utf-8?B?QnRqa2owMXNzeUp1RkJzRmJMdXVWdzAraUZxTDZHdDhtSDd5d0lSVUlqNEQw?=
 =?utf-8?B?QWJTUEQ3K3FoUFloS29wOHhIWFhjM3YzTUZGZjZ1OUdINlVvMWpwcUplbUNV?=
 =?utf-8?B?MHMweVZWdVYrWHN2UFlDZnQrbms2VHNsSWxTZGVWQjRQdkU1VkR2Znl1Slhj?=
 =?utf-8?B?ZzViUDVwNkU4TFhjcGYrWnZ4ZmZ1elc4a2VCb21vckRTYnJtSUJpQ2JFLzFj?=
 =?utf-8?B?SjlYVXh5T05qdEVkMmJTcWpTQ3diclcxSHZUK0JzbVlYT1FKZ0gxT09rU0lK?=
 =?utf-8?B?aWNTZm43ZlhjdU9oRVNzV3ZkSWlJdjRsLzI0S3hTblY0MXd5YkhhSGVOSXpN?=
 =?utf-8?B?ZEFERG5Xd3VKVms2M2Rzc3ZtOExMUWpQbkV0SnU3VU1ubU80ZVJVOE1uc0lL?=
 =?utf-8?B?eEVzMytiVjdHaWdoYkJOQko2dVY4ZG4yd1NJTkJIM2R4M3VmR2YvUklHUi9Q?=
 =?utf-8?B?TFFheWZ4THJCZXdEL3htY0REWHN1bVg1dnhFVlNwZ3BUdURScGlLTlNsblN6?=
 =?utf-8?B?aU5peFRNNWdQUmpqOGZxWEx3NVd0RDA0RndXS0dobTZIRDRwT2pFYW9Fb0Jo?=
 =?utf-8?B?VnpZaHB2QVBROXR5Q0VrQStRblBQUXVqa0ZFMk4rSmt3Y3BJRGRlWi9XekUx?=
 =?utf-8?B?NTBDN1FlR0hZazhIaWJwRkVVM080QkZoV1VLNzdWMG9kRG1Falk4dW9xN2w2?=
 =?utf-8?B?ODJPL3VFdGQxMWpySDEyd1FuRm9TcUZ1S3BFVStucjVtaGlSWHRLQjFzM2w3?=
 =?utf-8?B?SVkxQ0U3eGxmeFBSVWV3VS85RmxqNFFtSXMvS0xOdS9aWXVhem5lWS9WT0hU?=
 =?utf-8?B?SUpTaEVDaS83MjJuMm1aUGFUcjBNcnhwc0RsZFhOTzRrYmNCVVdzUXFDclJX?=
 =?utf-8?B?TWRaUUFITFZaM3poV2cyUktxUDQ1bkppdHJJajFGQWJqdFc1R20zd3FYbndx?=
 =?utf-8?B?VFVDS1N0YjVOTE8vYWkyOW5NYkNQT1d1MnBDU2VNbnBUNUZJeW5sUG1vOEhm?=
 =?utf-8?B?RzB4bzJCamptaVZwdFBBM2kySXVUc3JjRjVTc1FXaG9CM1o1WE9peDlGVDBL?=
 =?utf-8?B?UXZjYitXOWVkMDVIMVdkK01HKzBWczlLY1MvMnB5YXFSN2dpQ09sVmw4Mk9B?=
 =?utf-8?B?ekxLNU5pMzgxQlpEb0srczloWkE0OFFCM0JzZUtXRzg0NVQ1UHE0VkpsTExV?=
 =?utf-8?B?NXFJREh5WmxLdnpUbVhrbnZiUW9xaWFkdHVKYkR4WGxEblFReU05bjBSQ2dK?=
 =?utf-8?B?bWp3eGNFSmpOcWxPeW1MYlBLSnI1dzRuM1FOeWlham5rL004UEtMOWpic2Q2?=
 =?utf-8?B?VGtMQnZZVWV0S3p5N3l1UGxIaHIzREgzUUJPc3ZBMnQ1WERQOGRPQVZ2YUww?=
 =?utf-8?B?WHdQSG5IMld2a3gvZkw0ZWtidWRWTFE5cGtPWVVOenJoQlFIRVM5cEZJUFhU?=
 =?utf-8?B?YVU4Ui9xOEo4RmM3aGp0bVVRelZwMWJkMnhZc2FJa1RJOE5lWDJTTzJUOHFJ?=
 =?utf-8?B?NVkrY3FFZk1sajBvb2lnQ1lYbXYyR0FETXpFWkxwYnJuT1dOMithQzM2TTlY?=
 =?utf-8?B?eVgxZzkvT2U3azBNa1hBVm0xWTB4YXlwOEtqZ0hodFNnVGRod2NUeThVdFEw?=
 =?utf-8?B?TDFYcHJ4Q3lNOUxwYnNEeXo2anhZRU1BSGx6dnlBUE91REdlalVJaWtUMGZj?=
 =?utf-8?B?clpSRkZ5THpyZDFWVmVKT0hpeDJVQ2huQmFmemlTUjFPRzd1bzFxZlR1c3U4?=
 =?utf-8?Q?+opF0DuxwPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVWdDZIeEFJVTVYYmkrQUR1cEVvMjZDZEtReFN3aXZkVW1TR2cyOWJYK3E1?=
 =?utf-8?B?djNDdjh2LzdVYk5NQzREdGdFdXRpYVRTQUJ4ZGZTZVVGKzZhVlp4WmJwMmxJ?=
 =?utf-8?B?UEhSc0VsMDROWTYyNkVsY2l4Y3M3RXB4b29kS2tJbzB1TXE3RU44NTc4LytT?=
 =?utf-8?B?N3FYNFEwM3VsdHRsTUw0UkhOMlEzMDZnVCsrRkg4VElGQ25IbDA3NU1vWXVj?=
 =?utf-8?B?Z1R5WXE5Qlh2VVhjbkNpLzFNdm9JRnQ3eDdWUGdJM1RMZ3ZUa3I2Z3JnQXNL?=
 =?utf-8?B?clRaUGova3IwT25XazMrNGJuZG1hb3hab2lJQ3VCV25lRmlOMm9lcVM0Y1Ro?=
 =?utf-8?B?Y3FzOTFoMk9ReWU0ZktFMXhxbG02enZPTlpSKzFuRE8zTC9sbkRmWU1IUDdZ?=
 =?utf-8?B?R1BKMERDMG1HQW1oYlBpbFIyZkY3eGVPb2pBZHMvN1lrZEtsWXJzMFB6eHVa?=
 =?utf-8?B?a1NFR1Z1Q2NUYlh4THA5VVJNTHpYVFZpNHFiNjl4NldxcHFzMDBPVkxaSkVH?=
 =?utf-8?B?MklqVlFjWWhqbFN6WVdOU3VkbWNSTnRqYldrMkJFRW1ocEVmeWdMNTNDRU1H?=
 =?utf-8?B?bjFDWEJpUFB6NXg3NS9MYkpyVzdmRmovSmJLMWFQdWhVVW1KQ1p1Nk0yYkJz?=
 =?utf-8?B?REd5aHF2aEtTaHVEVklJaVAyYkZHSXAwTk91NGdEdWUrUjZrdkJGaW1pMjRP?=
 =?utf-8?B?N3RMZXBBWHVoOGRDcWhEQlIySXp0VkRLcEx0cWIzSHgyMkIyelMzR01hTzZH?=
 =?utf-8?B?NVJKQk9qVFZaK0xrR3lSYmdkTC9NVjhIS2J1cFYxRlpvMGE0UnBQUkJYeHh2?=
 =?utf-8?B?V0RodDhWNy92K1VMNE1HRGFXNWsveVJQR2pSemxUN1VOK2FlWlQ4bHdsTkgw?=
 =?utf-8?B?d0cwb2ovSFd0ZVdDT1VIcXcrc3ZuMEVTWmlOMlUyVmxkeWwycHJnMnMwWklt?=
 =?utf-8?B?WG4vUGRSSWdkTTlOd1J1U2o0ZkIwc05jZHdSUGcxODBQbmFoTmo1WHR1akVI?=
 =?utf-8?B?cUNsRDdsOStWVnhRc3NBdUFjWVBWeFQreDFsY21EWjJnTkZwSFZ5eW0xaGlY?=
 =?utf-8?B?eEc5ZDhmRVZyQ0tOeFFReFFGWEtkam9maFhaUmRYbmlZcHA0dk9FUFp1TnRN?=
 =?utf-8?B?YU4yVGVaU2JoRmd1NGhXdldsbUVkYld3MlZkdTUrcVUyVkVkUGQvTE4xb3Ba?=
 =?utf-8?B?TG1qZm5KalZEamtjVU5PdFVnRC8vVkxoVW9uZmFMeWFieDVJc0xmVnRjSWZs?=
 =?utf-8?B?dEIvYXg0U0NBa3pzMHBsMjJHNTFVbktOamxpbGc2RGx4bk1qc2hPV3NpMnBr?=
 =?utf-8?B?anNYWGE0cHR2TU95ZUcvb3hWNlh1eTZoeldVakVva0N3c3o2T2h4dmZGRGQ3?=
 =?utf-8?B?RjFIK1JvNzBTVit2S2N1Y2k5a1V1MVMrVUFkb2dCWGJoQjV1dVErMXhSY1Rh?=
 =?utf-8?B?NEgrT2ZSblp2c3FRTVBnekVmZVBBN0MzcHVwM2ppUEFwa1RWSTIzc2JJSjU3?=
 =?utf-8?B?cjkvVVI5d2w4Q0ZoaUh5a0NjUXdpWUVrdnhoVFE1WVh0M3M2TStxaDhxNlBq?=
 =?utf-8?B?QlBMMXdvVUpjalpKZk5zQkkrd3pMdEtjSWpoUS8zUTZyeGNCTVVwejZYZkVJ?=
 =?utf-8?B?Wk5nejA1dmZTWkFwako1S2JISFBzRjZkaWJsTW50VFJORTB2MzYveUxGU24r?=
 =?utf-8?B?b2JWdElFSmFDQkl3cm1YdUx3ZWJiVGxBY0dvL2JTT1NwWldsYkh3ZkMzbkRz?=
 =?utf-8?B?Vld6VWo0SDNBUzQwRStVb1MwcXFCZ2lHSXZIdnNqWUVMUDlzL1JXdXJDVFZz?=
 =?utf-8?B?dVVLaXRQRCtEbW9mSy9NZGtDcGM3SE1aOWhSOWZFY0dKYjVhYVVzdG5Ucnlw?=
 =?utf-8?B?Wjlodkw4Yy9idFB1d2NtUlMxWjR1NzdMTmlZZU4xSHpwdThTeklqTFRGZk9S?=
 =?utf-8?B?Uk1SeDh4V0h0Mnk1VGxIS3NmVjBScVJyUEQzSzdvbkkxSjJmOS9IelZ5VGdT?=
 =?utf-8?B?cUg2TEdOeU1tVjBFTmtWdFJFV1ZmQU5PT1o3Z0sxWHBDWkI2dUdqYWhieGhy?=
 =?utf-8?B?MmxUVVhtTms5TU1jMVlta2xSVnNtZ2diS2Y0Uk9VU1NXZUVFZlQ2T0I2K25m?=
 =?utf-8?Q?vP2U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea5dcf2-7519-41d9-ee88-08dd89930ea8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:04:45.7648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fYleFqw0UTvFtMYr423Kt5lhG9xzJtlBVKf0xab/l+Ksyy1NcTaoB2N58kpKVdy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736

Hi James, Reinette,


On 4/25/25 12:37, James Morse wrote:
> Changes since v8:
>  * Added check for closid_init() on monitor only platforms.
>  * Moved end-marker into array and added default cases.
>  * Additional patches to move prototpyes between header files.
>  
> Changes otherwise noted on each patch.
> 
> ---
> 
> Patches 20-26 should be squashed together when merged, taking the commit message
> of patch 21. They are posted like this to allow folk to re-generate patch 21, then
> review the differences on top. Not squashing them together would expose a ftrace
> build warning during bisect. (but who does that!)
> That would look like this:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v9_final
> 
> This series is based on rc3, and can be retrieved from:
> git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v9
> 
> This series renames functions and moves code around. With the
> exception of invalid configurations for the configurable-events, there should
> be no changes in behaviour caused by this series. It is now possible for
> throttle_mode to report 'undefined', but no known platform will do this.
> 
> The driving pattern is to make things like struct rdtgroup private to resctrl.
> Features like pseudo-lock aren't going to work on arm64, the ability to disable
> it at compile time is added.
> 
> After this, I can start posting the MPAM driver to make use of resctrl on arm64.
> (What's MPAM? See the cover letter of the first series. [1])
> 
> As ever - bugs welcome,
> Thanks,
> 
> James
> 
> [v8] https://lore.kernel.org/all/20250411164229.23413-1-james.morse@arm.com
> [v7] https://lore.kernel.org/all/20250228195913.24895-1-james.morse@arm.com/
> [v6] https://lore.kernel.org/lkml/20250207181823.6378-1-james.morse@arm.com/
> [v5] https://lore.kernel.org/r/20241004180347.19985-1-james.morse@arm.com
> [v4] https://lore.kernel.org/all/20240802172853.22529-1-james.morse@arm.com/
> [v3] https://lore.kernel.org/r/20240614150033.10454-1-james.morse@arm.com
> [v2] https://lore.kernel.org/r/20240426150537.8094-1-Dave.Martin@arm.com
> [v1] https://lore.kernel.org/r/20240321165106.31602-1-james.morse@arm.com
> [1] https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/
> 
> 
> 
> Amit Singh Tomar (1):
>   x86/resctrl: Remove the limit on the number of CLOSID
> 
> Dave Martin (3):
>   x86/resctrl: Squelch whitespace anomalies in resctrl core code
>   x86/resctrl: Prefer alloc(sizeof(*foo)) idiom in rdt_init_fs_context()
>   x86/resctrl: Relax some asm #includes
> 
> James Morse (23):
>   x86/resctrl: Rename resctrl_sched_in() to begin with "resctrl_arch_"
>   x86/resctrl: Check all domains are offline in resctrl_exit()
>   x86/resctrl: resctrl_exit() teardown resctrl but leave the mount point
>   x86/resctrl: Drop __init/__exit on assorted symbols
>   x86/resctrl: Move is_mba_sc() out of core.c
>   x86/resctrl: Add end-marker to the resctrl_event_id enum
>   x86/resctrl: Expand the width of domid by replacing mon_data_bits
>   x86/resctrl: Split trace.h
>   x86/resctrl: Add 'resctrl' to the title of the resctrl documentation
>   fs/resctrl: Add boiler plate for external resctrl code
>   x86/resctrl: Move the filesystem bits to headers visible to fs/resctrl
>   x86/resctrl: Move enum resctrl_event_id to resctrl.h
>   x86/resctrl: Fix types in resctrl_arch_mon_ctx_alloc() and free stubs
>   x86/resctrl: Move pseudo lock prototypes to include/linux/resctrl.h
>   x86/resctrl: Always initialise rid field in rdt_resources_all[]
>   x86/resctrl: Remove a newline to avoid confusing the code move script
>   x86/resctrl: Add python script to move resctrl code to /fs/resctrl
>   x86,fs/resctrl: Move the resctrl filesystem code to live in
>     /fs/resctrl
>   x86,fs/resctrl: Remove duplicated trace header files
>   fs/resctrl: Remove unnecessary includes
>   fs/resctrl: Change internal.h's header guard macros
>   x86,fs/resctrl: Move resctrl.rst to live under
>     Documentation/filesystems
>   MAINTAINERS: Add reviewers for fs/resctrl
> 
>  Documentation/arch/x86/index.rst              |    1 -
>  Documentation/filesystems/index.rst           |    1 +
>  .../{arch/x86 => filesystems}/resctrl.rst     |    6 +-
>  MAINTAINERS                                   |    5 +-
>  arch/Kconfig                                  |    8 +
>  arch/x86/Kconfig                              |   11 +-
>  arch/x86/include/asm/resctrl.h                |   15 +-
>  arch/x86/kernel/cpu/resctrl/Makefile          |    2 +
>  arch/x86/kernel/cpu/resctrl/core.c            |   31 +-
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  635 ---
>  arch/x86/kernel/cpu/resctrl/internal.h        |  399 +-
>  arch/x86/kernel/cpu/resctrl/monitor.c         |  918 +---
>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1092 +----
>  .../resctrl/{trace.h => pseudo_lock_trace.h}  |   26 +-
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4164 +---------------
>  arch/x86/kernel/process_32.c                  |    2 +-
>  arch/x86/kernel/process_64.c                  |    2 +-
>  fs/Kconfig                                    |    1 +
>  fs/Makefile                                   |    1 +
>  fs/resctrl/Kconfig                            |   39 +
>  fs/resctrl/Makefile                           |    6 +
>  fs/resctrl/ctrlmondata.c                      |  660 +++
>  fs/resctrl/internal.h                         |  440 ++
>  fs/resctrl/monitor.c                          |  929 ++++
>  fs/resctrl/monitor_trace.h                    |   33 +
>  fs/resctrl/pseudo_lock.c                      | 1105 +++++
>  fs/resctrl/rdtgroup.c                         | 4344 +++++++++++++++++
>  include/linux/resctrl.h                       |   36 +-
>  include/linux/resctrl_types.h                 |   16 +-
>  resctrl_copy_pasta.py                         |  823 ++++
>  30 files changed, 8490 insertions(+), 7261 deletions(-)
>  rename Documentation/{arch/x86 => filesystems}/resctrl.rst (99%)
>  rename arch/x86/kernel/cpu/resctrl/{trace.h => pseudo_lock_trace.h} (56%)
>  create mode 100644 fs/resctrl/Kconfig
>  create mode 100644 fs/resctrl/Makefile
>  create mode 100644 fs/resctrl/ctrlmondata.c
>  create mode 100644 fs/resctrl/internal.h
>  create mode 100644 fs/resctrl/monitor.c
>  create mode 100644 fs/resctrl/monitor_trace.h
>  create mode 100644 fs/resctrl/pseudo_lock.c
>  create mode 100644 fs/resctrl/rdtgroup.c
>  create mode 100644 resctrl_copy_pasta.py
> 

I retested the patches on a couple of AMD systems, and everything looks good.

Tested-by: Babu Moger babu.moger@amd.com

It's very likely that these patches will be merged before my ABMC series [1].

I'm currently working on v13 of the ABMC series and considering rebasing
it on top of James' v9. That could potentially eliminate one review cycle
during the merge process.

What are your thoughts on this approach?

1. https://lore.kernel.org/lkml/cover.1743725907.git.babu.moger@amd.com/
-- 
Thanks
Babu Moger
