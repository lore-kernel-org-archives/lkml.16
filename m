Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30721CC48;
	Wed, 18 Jun 2025 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283851; cv=fail; b=bCrHJNzPY4mmwte+iqqLKsywZSxd1enY6+rJTRVLqyviAF5koDfCYXf1UofKsOHhYL5cJG5S4XIuxMhxd8Ry6oEFIkzfuBEmruwxQgfgtEuTiS9KKUHtMXAuTvEMXkK1TKtWhGR0CQeq0L+QZF2ZyqPMpF+LL/ReGQBYrjRCAvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283851; c=relaxed/simple;
	bh=JDy+DMPw20RiL7HJjXxVtQ1k2QA9dombUGEHmmmfvf0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fr+qJs3lKB0CO+r4DBohCrfRdhKLqdDIgMsvKoluU5l7k7kT0qjrdFq0tPH4NiTTN267ioL+AmKcstOMvwPgsrvSOhbZ0BGTfiyp7D5iTGtqvlgQwXDg48HCuVQmR0t4aKUpILk8v4sqYSMOp1F3qeLYGC+F71WNUiHQ0byVqDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K0kISPpG; arc=fail smtp.client-ip=40.107.243.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K0kISPpG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jvo5VabwGiWxMZh/IDQieYkl8Cf3vaOkiUjKg/WzynvJZ7NKz7jMEtHHRAxIWnlS3b3wh/PGgqp1mDbFLytFXeJqQxh+lnDBHDz1OqKxKa8566ZITYMfASpD7EulvShBD0OP8Z7WvZ/5vpKbaofTkarf/ZmRx6ZXRYdsS/eBwA4mtgp0OOGQvOLBONzLX61cjpMi7M4745hAH8jlaovDudBb7K28bPM1WfF+iX4Ey+T2dyR7f0z35QUq7kGE2D/2l26GUVwJDEGlrxvkhFNq++BD32K63/tUPkUXoqSH348HMyCdVX2sf4qhkPTXDWXlVa/fXBgjcJm3zZ8WbK2vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k+EAyJS32FgedkTvGWaAOJkXuVbIeHXXoPMU0x+7Cg=;
 b=Lt3+HMvIOTnYNoTUFvNofLl3KSH497UilG5Q2AxiGZGuWn57ThKFqnvC4G/jSyj1stYWBStql/9wUNDFe/3WQHNBsP8lEv3edhkrqiOOLjgB01RqpmO7n01bMQCDJefyxkAZyMnOEnDI97SmD9AjH2GrmSYSU7KhUFxulPd9vn7bhYHxoOBsPnidz+Jc0Y7zoZPxrT13WIH5LL/b+zVWxyTyt8FPP1rKuwYFAur7jwkfeklvXysh0VQpK1L4atydrXNONyqpWgIWGilxz8PmfW0K+tJXOGcWF64Sk8W01nplUy+m4rO5AtNI96n0MVJdDQqdRTZSgjSBYImSjgihTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k+EAyJS32FgedkTvGWaAOJkXuVbIeHXXoPMU0x+7Cg=;
 b=K0kISPpGvdYctXQpIPsMOnzlcoH/1MQ03xRRKBNcmmwcoDVppShFqtXgeWwGG63eLO3fJRh+gN87iQjujS03JZ4/qYyJ9UOzEQkN74TQHKiHtXBSQNXPoW7fHrvKnB5xlsCM+q0yyXso/H1HhrkF/GO4xdfGYE2yhNKVOtMq6AA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 21:57:25 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Wed, 18 Jun 2025
 21:57:25 +0000
Message-ID: <f5e679bc-ac84-426b-987e-ade14229f7b0@amd.com>
Date: Wed, 18 Jun 2025 16:57:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] x86/resctrl: Implement "io_alloc" enable/disable
 handlers
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 corbet@lwn.net, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <548b542ff537936cc8a20f721f6f2472189c536d.1749677012.git.babu.moger@amd.com>
 <7521ab39-73c8-4d11-b12f-bf67a7031d7f@intel.com>
 <d7e64ce3-e27a-4fdc-911f-bc33df743696@amd.com>
 <9927b988-47b0-4937-9d6e-5dca767504fd@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <9927b988-47b0-4937-9d6e-5dca767504fd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0155.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::10) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: eeba0885-dbd6-4054-1be7-08ddaeb31bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDV6d1JhYU0xYURQMTFLd0NVU2dHd2tTMlFTVTBGTXE1S090akI3bktKbHZ5?=
 =?utf-8?B?djlXVEVIN3RvRDE2UW92VWpkbi9yNmZsUTk4S3hqS1I0MXE2V0Vzc1VBVnZO?=
 =?utf-8?B?VjhGRFdhWExMRitPbzdYcFdXSWViZjh5RXhCbjJ5clNFRDhHVEt0U3NZTy9Y?=
 =?utf-8?B?bmxLMzhLNTA3eVhBcUdGZTI5UVhVVm1HS2JzYUltRDFwczFSMSs1TTJkZUFk?=
 =?utf-8?B?Z25RUUs1RlcwZXpSUnZ0ZWxnV0lQNW1nT2I5YUZZdmczSGgvMEZkNFBTZ2NS?=
 =?utf-8?B?aHRMTFZzTndWK0dRMXJXbVNkcnk5WldiOHVXUlo0a3pyL0VNUmxsNzV0YitS?=
 =?utf-8?B?eDk3K3RMODlTSEhZM24vMlhVNXJvNHdaQnkvSENvWnlRbVVwc29IVWhCdVVM?=
 =?utf-8?B?ZnZjdVZsakh4anJCUktWZXg3S0VWeU1iT3JtY0FaSDM1aXZXOXB1WDBhdUh5?=
 =?utf-8?B?R3Z6Z1ByNmxQTjJNaGV1MEhnbUYyZ3NyaVRkMG81OUk3U2NqbFVrczc4ZTRR?=
 =?utf-8?B?cjFLSnFKY1gycXV6RDZkUG45TGlubE8yL2ZWZDZaMHhCZ1JWOXptUUI1K2t3?=
 =?utf-8?B?ZUdIVk5XVmt4dDRac0dvbXltUG9hUldJQU5wZVRyYlU0TnF6Qlp3UXZwY0I4?=
 =?utf-8?B?MmlwcFdZYlBNWlkvL2ltd1RHejh3clMxZmhEZlBLTVBKSys2NENyaFNvSkk3?=
 =?utf-8?B?YVQ0Y3Q0ZmZrcWt4UTYraDFUdVcxV0ZPWEJ0V3Fib1NoRDBEeG81U1VOcjRr?=
 =?utf-8?B?ZEtUSjE1QUUvenBndGJZZGJUamt6UlBkQ2dFVnRCaHJna3IvMVRVM3cvbHFO?=
 =?utf-8?B?amVpUUYzWEppaWVSQVAxOTYzM0JZNmxYc3F6ZHFsR2w3Z2JFMUdDdFRjcERu?=
 =?utf-8?B?MkIvTVF6WTJjVEZMV01ZKzNtby9MeGNkN0V2L0lrRlpES0FOZGFEN3VOd05r?=
 =?utf-8?B?MDVFSzdKUTRheFp2ejdyRmNoYmdvYVFVc25hU09ISDNtMVlSdm1BQTFKczVK?=
 =?utf-8?B?MitjeW1WdGZ4TTFZTUJZZ2NZdFFGVnh4U3ByWURYZy9DM1BUSkNraEF1YXRz?=
 =?utf-8?B?Z05xbXJFcGZPMFZnMmhhVll0a3pZbmVwVjhlTkVGVkdwTHJWZ0pLd3I1dHRo?=
 =?utf-8?B?Y3ZaVTEwbmx3V0h1QU14VEtLbUxTT0pFZ0g1NEdBRjhOM285dDIzREo5K3BB?=
 =?utf-8?B?bFJxMHY5ZURZS1VkUmJwd3kyN090c1I4QnFPZWpiNGNhejJIaXpoWERqd01K?=
 =?utf-8?B?ME5VZ2xJVUtxaDc2SHpVSXIvazF5eXFxZFA2c3RET3F0TGhYQk55SCtSWTJM?=
 =?utf-8?B?dDYwc3ZSN3gxVmxCQnlLRVgxNndlZEVQTVVucE1yKzg4dTh3SnBsbDREM0lU?=
 =?utf-8?B?ZjFyME5kYjdnQTBNSG1UOUpvaXgyalRVcHZOU1IydXZnMVRzMFBEM3hQTWNs?=
 =?utf-8?B?ODFiNjVlRDN1ZTVwdVd3WDdMSWYxVklGcjdhRWZuQWNFNDVYeEYwWXFNNVZs?=
 =?utf-8?B?VjNmQ1FOemV3YVpTNVhBd0hqVi94elhxM1hkWWZnTjFyaTlhMDRlY1ZRaGFK?=
 =?utf-8?B?VVNmNnRnR2dvKzIydGswVnRPWTFVNEE0Mm5xTnNQVDQ1dFczWWtkMzlsTnh4?=
 =?utf-8?B?NDJtaExkcVl0M3E2UCthZzU1RGhFN011MkQ0dzNaYVEvc3k5QmNhWWtYT3ZS?=
 =?utf-8?B?Rk9OK1RreVpWTEhZVU9SYXFXclZPR1FBUHZBTmZ2MGEzbmFpcXU5RzRyTU9O?=
 =?utf-8?B?bjdPbG4wZ3F4a3YxMk5Va2x3ZDFPZ0wzY2RNeWNoNnpUT092R0VEQ2RYOU84?=
 =?utf-8?B?eXBiYmtQSlZZSW9uL2FJNmV3cXZGcEpJSlN3cDBnM1F6VWtWZ2xFV25zb0Nj?=
 =?utf-8?B?WkMxcVZQaFFnaE9kbGdNY0F1dlhWZzJwYkxvamdFZ3UvM3BqM2c2N20xSC9W?=
 =?utf-8?Q?2iUXM7HboLg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNHc0VlVDFmdU5VU21GZHVGT0lVVGp6OE9FRmxJWUZ2MXNxYkRyOG9YWWdB?=
 =?utf-8?B?MGtkVkY3dkdQNHgvYk9vdlZqSVZBbHlOc3V2dTQ2ZnVsMThLc29qZmdhQ0VT?=
 =?utf-8?B?SGFseHhoZXFOdk1GQmd3Q2lhUmpzelNZSHNabDJxUTMzQ0MyM1BOdlRzaGhJ?=
 =?utf-8?B?eGpJVSsvN2kvQm9BNzBNRjIrQ2QzZE8yaXNEbnIwYVRhcVpsOUJwbE8rZUhO?=
 =?utf-8?B?WlJ1VkE3SWZSNDcxdEk3Ny9FUHduSUsycWQ4bWNSUzlWMGZwaWFHOFBncXph?=
 =?utf-8?B?TWVyNVhFVG1OZ0loVHpZS2RwS3gvNVBRU2ZxRlFjK0l1N1JLSUtYSFNjV1Ji?=
 =?utf-8?B?MEpNdzNOaGZSTm4yVUJtQUJlVFdxczBEWlhVVDNXQ05NZzc3Qks0RGc3TWFl?=
 =?utf-8?B?Z28zZERpWlVqSGJlM2g0WDB0L00ycklsbDZiL0FCeWljU2NpVWI2cEowQU9o?=
 =?utf-8?B?MVRhQjNnYzRGRHlmNTkyWTFBYmtodUJVTXNkOVBzanpyd0wyYzRNZFNRZm5I?=
 =?utf-8?B?bTNYODVZUTVzUWZJMkc2V3VOV1JwQmN0WVI1ZUtwY2dWRmMrWWpNenFIMGpt?=
 =?utf-8?B?b28rMU1wK2svbWw5ZnFqQzVYcWpJa3FJNjlHZWhFdmxSRkxDTnBhcmhmZjV5?=
 =?utf-8?B?UHZlQXYzWWZnU3J4MWY3MmhUYmtJTTdNVFVITkVpYnV0TmoxTU5Qb2RLNGt0?=
 =?utf-8?B?TXhwRmhYRmlrRDRoQmxWV3FITCtaS2NLeFBsQVlOL1lXVng5L05jOHpnL1pU?=
 =?utf-8?B?bzdNMDNMWkFkcHdMTXVaTHVzdEMyTllIM0tEZjViTGFtNjd5b1p0a1d1MkpZ?=
 =?utf-8?B?alJWbldHS2R0d1pzeUlMMDdBSllxYkRNcnozY0ZscmlxUkZxQm1HQU1GdmU2?=
 =?utf-8?B?UE9PRlUwUGU4dWpWTTNkYTBhQnpnc3JNcDRXUldicnRDSmM2endtcjJ4ZEFs?=
 =?utf-8?B?QWNEek14dGtxeEdaSks0L3ZQUkdySXIzdk81ZUJlTGxWbXBueGcxYzBhZEJ4?=
 =?utf-8?B?cnJSSkhDYmsrSlZPd08xQlhIVDRBWm1PQU90VEorWEFOWWNWWmQ0ZXJjeDRP?=
 =?utf-8?B?NnpjRmlYZzZvc0RrWnowTWVIRW5JZWhnd0Z5dTRERGR6VEFXRTNpc2RVQVJq?=
 =?utf-8?B?RnNLbXNvQ3JPSEptYnowVHJnM1ZyOVNQNk8yenYrVUMyZlFwN1poU0lYZ1VW?=
 =?utf-8?B?S3gycXNjU05ZdGdvMkxZcW1ZNDlvaDBZeUxLcnBlNW1mbm1iMVAzMDZLSXY5?=
 =?utf-8?B?UmhCS3lqbjB3V0lzRFNDNFhuSTNqNzZIQ0dDVTFLQVU4QmdPQ2t5NWxmTzVz?=
 =?utf-8?B?Y2dpam0vZUkzSTBDT21ZUm9kZEsxTy9UeXp0Y1BFTWZnbUFlWEFCZmJGY1hw?=
 =?utf-8?B?RXNoRTEvQjBGemNLR3U0UUJsOE5kdlRkL3R3QjNBa2duajdLVW1iaGNHc3Vp?=
 =?utf-8?B?cWZQWEM2SWdlcFpaOE81SHhLQklTRHEzdE5NZkZpTzQrdkVMU05jWDFZdzUy?=
 =?utf-8?B?VVN3cFY4bFUvcWYwaTJnaS9UTlZEUG1LbXBDbW1mL3dvdUtEbkMwL0FlTWVm?=
 =?utf-8?B?UmFmVGZ0MTNpRDJnS2FXSzVZc3lQUE82VVpjNlV1RkFlbC9jN1diSnhKRk5R?=
 =?utf-8?B?LzFJK3BKcWp3TXExM0ZGSm5MTkMyQzNqck5qQXVQbzBFd1Z6d2MxNnhJOGxY?=
 =?utf-8?B?S1liNlZJUnFYZ2RHY0RpNzNYKy9ncXhjZm5UMi9ZbFVJcnk5SkpLVFdSN1VX?=
 =?utf-8?B?eE5yTXA3a2lxbEprYWhFTXYyUGRjLzEzeWFoZEp4VVQ0ZzBQZFhjVGJIOEZ3?=
 =?utf-8?B?KzUxRkRHRDQwT2Z5bVhzcDdzaHVHV2F6K2U4dGd5QUJsZ2dodVhveTJ1VGda?=
 =?utf-8?B?czNkd2xtZE10SHI3TzlJTEhzelcxNFppdWJPRXEvVXkrdC9mS05zS2REbGlL?=
 =?utf-8?B?b0RtN0s3SDFlOGY3SDBtTWtzdXJrbEtWMzBnaXdOQW9MOHlKWmJqOXpVWUVL?=
 =?utf-8?B?TENyRzYvM1NiZVlod1hnSTBWeXNueDAxSk1Ub2oxNEYyNjlzMDF5OEdITlps?=
 =?utf-8?B?MEZscDFvNDdoQVJvRjdoL3ZJaEViQ1Vlc1RqNXplemU0OVVpem9HU0ZkUnh0?=
 =?utf-8?Q?Owas=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeba0885-dbd6-4054-1be7-08ddaeb31bf5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 21:57:25.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H++RQehj0PBq5L4Jh5h9U8HAIFn7U+1gWCjzQozklZi2VGCXTlwP8TdUdWJIEnQB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302

Hi Reinette,

On 6/18/2025 3:32 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/18/25 12:27 PM, Moger, Babu wrote:
>   
>> On 6/17/25 22:51, Reinette Chatre wrote:
> 
>>> On 6/11/25 2:23 PM, Babu Moger wrote:
> 
>>>>   static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> index 885026468440..3bdcd53b3ce3 100644
>>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> @@ -229,6 +229,46 @@ bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l)
>>>>   	return rdt_resources_all[l].cdp_enabled;
>>>>   }
>>>>   
>>>> +inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
>>>
>>> As indicated by lkp the inline usage needs to be fixed.
>>
>> I am assuming that you are referring to
>> https://www.kernel.org/doc/html/next/process/coding-style.html#the-inline-disease
> 
> No. I am referring to the lkp test report of an issue detected by sparse. Looks like
> the message was not cc'd to lkml so I cannot provide link. I paste it below. You are in
> "To:".

Yes. I saw that report. It's strange why it was not cc'd to lkml. 
Happened few times before.

> 
>>
>> I will remove inline attribute.
> 
> The goal was to fix the broken usage of inline, but you are right that it may
> not be needed here.

Sure. Will remove inline.

> 
> Here is the original report:

Thanks

Babu

> 
>> Date: Fri, 13 Jun 2025 12:18:35 +0800
>> From: kernel test robot <lkp@intel.com>
>> To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
>> CC: oe-kbuild-all@lists.linux.dev, x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org, paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com, pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com, yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com, peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com, xin3.li@intel.com, sohil.mehta@intel.com
>> Subject: Re: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
>> Message-ID: <202506131104.d1oo8NWe-lkp@intel.com>
>> In-Reply-To: <b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger@amd.com>
>>
>> Hi Babu,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on brauner-vfs/vfs.all]
>> [also build test WARNING on linus/master v6.16-rc1 next-20250612]
>> [cannot apply to tip/x86/core aegl/next]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250612-053050
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
>> patch link:    https://lore.kernel.org/r/b3d8e2ccd23b295f3735fc9f5420458cfc18a896.1749677012.git.babu.moger%40amd.com
>> patch subject: [PATCH v6 5/8] fs/resctrl: Add user interface to enable/disable io_alloc feature
>> config: i386-randconfig-061-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131104.d1oo8NWe-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131104.d1oo8NWe-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506131104.d1oo8NWe-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>     fs/resctrl/rdtgroup.c: note: in included file:
>>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>>> include/linux/resctrl.h:553:46: sparse: sparse: marked inline, but without a definition
>>
>> vim +553 include/linux/resctrl.h
>>
>> 48e63934badb71 Babu Moger 2025-06-11  545
>> 48e63934badb71 Babu Moger 2025-06-11  546  /**
>> 48e63934badb71 Babu Moger 2025-06-11  547   * resctrl_arch_get_io_alloc_enabled() - Get io_alloc feature state.
>> 48e63934badb71 Babu Moger 2025-06-11  548   * @r:		The resctrl resource.
>> 48e63934badb71 Babu Moger 2025-06-11  549   *
>> 48e63934badb71 Babu Moger 2025-06-11  550   * Return:
>> 48e63934badb71 Babu Moger 2025-06-11  551   * true if io_alloc is enabled or false if disabled.
>> 48e63934badb71 Babu Moger 2025-06-11  552   */
>> 48e63934badb71 Babu Moger 2025-06-11 @553  inline bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>> 48e63934badb71 Babu Moger 2025-06-11  554
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
> 
> Reinette
> 

