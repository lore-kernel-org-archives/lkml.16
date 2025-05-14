Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7DA18DB2F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252502; cv=fail; b=GMpgWRPGTRWhJ4h0Jrct7b+GdlJHO/RLwecMhekI6JTbutFkmXr+3E3I/rKm3KvVwS0KytP72/mQ3U6I8geiOcVztipjf1qVgGYpR1sn0HIjoxsMuIbAkPJKcBOiL5JEGY3QSIF5VZH+FnpuYLIdUZUW4YEjPOiA/8534tyPod0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252502; c=relaxed/simple;
	bh=X0BI66OdayOvbvhU6Gso1RtIr0jJFddyd1ls5DqyvdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T0bO3tvrEYWcvT+OvDyDPb3fZR8pSCbUTIurih3UCJ7Y2Uuzf4j4p5PcyLtQUqiBUVdNL8RjNB8GsL04hRB9cxsCOkYRIXUYNKMRfrTa/69iAJKMESs4SJMoqOurOZMrxq5NXhoPpZlu+CdFmbGTRvd2gh0AWpHM8DekGy+sbl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gDzogK2N; arc=fail smtp.client-ip=40.107.94.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gDzogK2N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVm7X5lawNIylyKgE/PzSPewHu8oDcmr8HYFg6TuIyzDmqHjMPHYNygm5OnATA0Pcw4qXlbfERhiwxfUtK9lVZPnHuhZXeWhykU/O0Sk7WpRAG1jRelgtXtdSTYuojo3bAbVVFRdqpFPbbZkCdP2Jp4CV0vt6o2bow0gK5N2L8j8B3P/qAUk7zKL7dOW3P988tP7XN4BoiYbJApAwRywsWlroiAY+WqflyqH+Lcc1znEdRzJEorIpEVFx9iJ0hfPCrkIhTqU5Ss1lA21sN++tLLGoVdWaXIPef/vdYEt0UiBTfb9i2y+u8dOna0JfBpVNZznMYQzFGkRRFj4NkBF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0BI66OdayOvbvhU6Gso1RtIr0jJFddyd1ls5DqyvdQ=;
 b=AoXTe5y2rOiEZi7T64Tv69kgiOjhi+RPxgeJ8xjxVPhXd+lN9wyuiraZXQsLsOfDhia6VYrtlMFWb3UCli0GEvGG5L594YiatTTn5ytlvFuSX9xLL+j2Rej3yT7zYiv6G7cWOLtxeUUssO8b9tfO5cxWTBUXSBZVXo5Yxomyz0vHR1JibBf8a2Qs/P4eFiyMv7fKffoCmKdSNxrBdf14r6aF5I0MTfUsUboYlZSnDxtnkej2ZX/7bWoTVaU0ju1BLxo9k/vheG7hKQPDJKhoH4yFXEPxeEXce0l86r/uQQXXnCnlIjQ/y7FmtRUfRjta8W45GPZuOwj4LPMpvn0Geg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0BI66OdayOvbvhU6Gso1RtIr0jJFddyd1ls5DqyvdQ=;
 b=gDzogK2NFugDhORpa6ugUPNF/phI1/a+ng8Ml0errhmicX17YIfhsA3tusi3cAL2n4yH2gKQwTxHFuP5Len0+1A+zFqFRgusQPOpIzW4zhKsT2lLFgxUlaXL7N45hs8zKp6BoVtujbBdEXJZSPw8q6qV2UFRknWdaiHVxGWquZNfHUB62rRgP0ZIzqeGVkqNkdPA/jS89t15dQ2uxqwDJOLh+gRJ52PHfsfZzZbB/XU1cN83XHulteasnaf6UOIDVsXy1Oy8pU33hdFFkroyeNnZxXSRYOKXnBKW6DXtrGRV0VcaCLzGPqMlQUKxDZ8X5AzVpf3jYqjf4vcD7EIptQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DS7PR12MB6168.namprd12.prod.outlook.com (2603:10b6:8:97::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Wed, 14 May 2025 19:54:58 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 19:54:58 +0000
Message-ID: <e9fdd869-8ea7-4026-b4da-eeec4e871012@nvidia.com>
Date: Wed, 14 May 2025 12:54:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/30] find: add find_first_andnot_bit()
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
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-3-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-3-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:510:323::19) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DS7PR12MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0078c824-9592-43a3-dbe4-08dd93213481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0lxaUtXbWwzMmFQSU5vMll6S1lOVU5sM3JaUE1QK2lGQVYrcXZjMWRSTGow?=
 =?utf-8?B?NDZyTi9wQlFEUUZXbGpDTDdNUmRNMUIvUnJMRmgzZFpHQ3JGQW92UVFobGEx?=
 =?utf-8?B?QS9xV2k4NlkxRHcwalE4ZlVYV2IwRTA1V1F4ZmhKMXVvMjZUYy9EUmRkc0hQ?=
 =?utf-8?B?NEx4NVJTelU1VXBFQklwTDNzTUdTd1g2dmlUNHZHRXZrVWlwT0VhOTJRZW0r?=
 =?utf-8?B?d3BLcFVIbW5ZbG8vNUhLL2Rld0lZWkl1TkZkbksyZUdPU0V3ZnBESm83dlNO?=
 =?utf-8?B?YVRKbmNubng5bHN0anlVYzBHYitJcm9ZcnBCcmhKYVZPVzB2SVV0Wm05SWQ1?=
 =?utf-8?B?VTI0c082KzRZOFo4TGVYYzdSKzZpcUorQXErWTJrb0RFN2NCM1o5dDRYQ2J3?=
 =?utf-8?B?SFhKVCtLYnZsTHBKdkhtMWhFZitxNFVTbHRtdHlNbTdRNGwyVnVrTkliV0VO?=
 =?utf-8?B?MGdtOWxGU1VESDdXU2gwRTVBQ1BPQ3VRRThuVlpaN0l4M1JCc0dIV0h3QVZw?=
 =?utf-8?B?a3lOMU83a2VYcWZ0MWNRd1VEeFpFQm9YcDNHeXNoQk1TU3htbUpEMmYwR2R6?=
 =?utf-8?B?b3JQZk9oeGZMd0xGdjY3NDdvQm80Z1htOUZkRVRXMUpTL25xUmpvVmJodFFq?=
 =?utf-8?B?bDVKWXM4VzlUQmg4NnRDZUpUa0hybE5renJSdFZVQXl1MjlOVEhscUZOOXEy?=
 =?utf-8?B?MndnZDZYWWdTVmFTbHdKbVlaMFVLVjJabkIrVWYxUDRzTHVZaytoR1E4QkJ4?=
 =?utf-8?B?N0E5NFB3eXFGYVpIT1VPYjRDWHdQN2lsUzMrRFZaMUdrTTFoV2RjVi8zdGYr?=
 =?utf-8?B?TjdmdVZ1VlpHdzg1b3ZQZ0FFMTczSGQ5T0ZBaWJFRkVUQ2ZpbVFFVC9vYVla?=
 =?utf-8?B?YXVhWEJ2amJ1NGJwTng1bDlwaDdqMEJURGdLSE13bXB5cUROTmRJT0N5VFpu?=
 =?utf-8?B?TDdPVlJvY2NRNG9uU1FvL1RNbWRWa0tGZzZDaUNkR1Z3ZWpNV0xqMG56aG9z?=
 =?utf-8?B?WFNIOFpTQUhDV2czVWxSSHRzK2dhTmFpVTk3Njl1QUZCVExRdVVOZENKb0V0?=
 =?utf-8?B?dHI2T3ltd0Zjb2pnZ3VtajBYWTRoWXZUSS9NSWhmbVYvN09pTlNNbG1acGdL?=
 =?utf-8?B?azRNWENwczNaTWRTbWdaVXYzT1JGaFFWeFhxQUJvVDIyckhxTkJkOVVmUlZB?=
 =?utf-8?B?eE5RTmpFODd4SUYyWUFRVUMxUkNpVklBdkNiTG1uVlNoQXovK0xrZjkwQ2FY?=
 =?utf-8?B?U3MzSW4wT1NGeXo4QUxsUnBncEF4OXZUcW9SVTh0aEpkVjVCQWFFQkt4aDVx?=
 =?utf-8?B?VjdEMnFKbXFLVU9lWkhJbVdKWCtMTFFPRTNCWG5FNlNhOGVHZ1RYd1ZhQ3hi?=
 =?utf-8?B?eTJoZGp5RDlqT0VUTFNxUU53cXZpUFViN1ZjY0Y5TVF1SEorWWZBWGV6aUJ2?=
 =?utf-8?B?THo4TjRVUHFWRXhERXhDV3BsY1d1MzB2bjBaRUJreFhEb0lFQXNYWUpiMzJy?=
 =?utf-8?B?aWZPbERWSmtwMGJraW9MNW5BTmlLQjRkQ0xTQ1UxMmt5Mi90cTRza1MrWGhQ?=
 =?utf-8?B?ME9RUS9CaFVLQStDN2EzeUJ4YzBINlB5N1ZpUTZ5NUttK0l4TkUvMjNEQzZG?=
 =?utf-8?B?c1d6aHF2ZWNSd3hMczdqN1pjeDEzOGk5cm5iVzRTNVFna1JKdWtRYXloRk91?=
 =?utf-8?B?OGMzbFN2bVBaL3I4SzJSMlM2OWt1Z05MTzF2R1U3MkJmNWU5aFNSSGNVd0t0?=
 =?utf-8?B?SXZvSk9GMHhJbG1tanc5cUdXNENzZ3h6R0pQNmVKTXAweEpvWmtqUVIyWXFV?=
 =?utf-8?B?d01heDJMWVVoWE9CeWZxRmRSellucU4rUi9xVEpUZU83cTd3NDVhcG5oZlNn?=
 =?utf-8?B?dmNnaVFrUWJBQ2tNdCs5ZDllTUxFTHgrblVualJuZzE2bHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0d5dFBHRVlWdG5nUnVZd2s5SFhCeEc0TXYweUsxME9rbCsvQlpXdlJkR2Jp?=
 =?utf-8?B?aTRFOWp4dXlZdHFmN0xIK3M2Y2FlT0lYVDhtbVdTbHJLRVpZc2pUK0NjK055?=
 =?utf-8?B?MCtxaDBNUDRMdHgzNUJWTVkyb1U1blRuT2hkUzBBbjc1UmczUi9CMDRKbk5D?=
 =?utf-8?B?TWlYd0ZpdnpRSkovY2tRN245emlEa2p4R0NSN1BIVldXRzBGb2Mrc2dSR0Nq?=
 =?utf-8?B?cG0vRkRYSDBZRWczdXRVbURhNU5ZYzJjcTFMUStvZC9hOHhkN2Exd0NmaU9u?=
 =?utf-8?B?SzBHMVh4OWxGK0tCSmFMUlNBcWREZ1krYkdqM2V0R1dmN2IwY3BFS1F6UzZ0?=
 =?utf-8?B?OUswT0I4b3BKMStkNTZzRW1xYnZHZFRRSGNYeHpjL1Rja2F2YUg0a1A3VnRJ?=
 =?utf-8?B?bVVZL3lNOUNlT2g2cHVaVHpmTERBMzZ2dmFxMTJEY2E2SWZFM1Vzd0dTR3Qz?=
 =?utf-8?B?eS9zOElMVDhIUTJGaFJpbFg1aHAzYlB2OHRXMTErUElyeUthTFVacmdwTnVO?=
 =?utf-8?B?SGNxYVA3RXJxYTVkUGVKNDc3K3R4eTMxNFA0RnEzeTNPOVJUTHFNTnBZU0VE?=
 =?utf-8?B?dzI5aFd5ci9xMDEwUHlZODNWQUhoUm44bFE5MTIrcEVjTGJBbWRkdkJvTXh1?=
 =?utf-8?B?V0pqRGpqTXBhcFRMeTJHZWhUNXgwU3ZiblQyOE0rdmtXRGVtM3I3QW8xSWR4?=
 =?utf-8?B?NDh0MVVMbFIxV0hnOHZMM0FLQjN1NlpUYjBwUFpVVW9WTFpZZ3dYK3c1Yytv?=
 =?utf-8?B?R2YyMDNvc3JvSTBtdDN4Q1NVSUl6ZzZXY1BRc2FaRjNIb0Y5Z0ViTCtkVFpG?=
 =?utf-8?B?UE02K3ZSVG5JVTJkRnpqa0Q0OERiM0pxSjl1NnNrZ3pDZGNuOUNpNG5yTDVw?=
 =?utf-8?B?S3hsemZRZktiMHlFN2R2TG5vOXRpaUNNWnQ5bkxOSXRSRXpuMzhPaERQUGZS?=
 =?utf-8?B?VXJ6UUhGS0xGd3NWaldkYmtkbDdIcE9VOHBDSm51ODhtUmxydTRodzVka1lv?=
 =?utf-8?B?U0kvWkRUMlhkUmlpNG5xV2Y5a2dPUmU1WVg2YXkrSmo2Y1FQOXRQRzVvd0Rw?=
 =?utf-8?B?bkpSclpIZGlXckpaUnR6QnBVZlBKNlJFY09wVlJ2UDYwUWs5SGFVajRDS1d5?=
 =?utf-8?B?dVFjcTVZcldpWmtmMkxqc1ZHTzdrRDAyNlBubDFhd3BMMXV2eEdYS0hOWkQ5?=
 =?utf-8?B?VlR2eEZiazFVWGxnK2ZaK055RThuTDhHVE5oY0FNWWRnaEJpK1c3MGJlNE4r?=
 =?utf-8?B?KzcwanNvRlZhVjMzdHA3WFZCUEt1M2xPNzRqVUREUkEyVHpTVmwzQ2htZCsy?=
 =?utf-8?B?ZGxwVWFuQ1pieEl6M3BOdWd2aHFnVkU3RGQ0RXFYRkZUVHdWSEUzY01oUFUz?=
 =?utf-8?B?TDFhejFPZk5KaHhxMjQwL3cyUGx1YXRZRGVpa01ORzhiNTdhZU1tZ3pXWUxO?=
 =?utf-8?B?SVZaY2RGaGszRWc1NGtJWUhuaE5vZGxRMGN2VklGa2Vzbmp0OGxBNXptYWdi?=
 =?utf-8?B?R0tNWWpicm9RV3VlbmRtZ2RkeUJjajNrRk1vQVIzdlExMEN0L05zcUVSdzBD?=
 =?utf-8?B?WDNmMVE2aTJFQUhEVzFYdklVeVZzNW4zWENib2RWTWg3cmxUNTQ3aW90QURX?=
 =?utf-8?B?Yk1BaHBpVVlBQVNlMFJleTIzbWdnNXRMckRhU0VzdFZOa2Jsekw2aGFzcEhj?=
 =?utf-8?B?eldraWpRMkNpNVFlOURwdmFWVzloMDFjMUZJWGdxL2x4cjhieFE1TWVVWmFO?=
 =?utf-8?B?YUdXZHlYWkdUZzcwQ3UxazFvRFhFVU9Lb3BXODBiT3FLN01wUnpaM1FQbHkr?=
 =?utf-8?B?WUNkbVVZalFmT3BQZ1M1QUV1cjFNR0w3Q3g0U0RuQVl3bjI0djV5ZXFVb0Ix?=
 =?utf-8?B?UlM1WGU3TmlIZTFhVzJDT1R6R0dCVHlyZ3YybVRRZDllM0VmbFZvUHRsRWhZ?=
 =?utf-8?B?MjNqTW5KejZRYkg5M0RZUXV5N3pXSElMRGZHbGFYakV4WlFyRUhaLy91VEZp?=
 =?utf-8?B?TndFem52ME5WWk1rQVlZRitLQUQvT3E5Zi9QN3dPWjRJNURwNzZBVFlYZ1RH?=
 =?utf-8?B?UzlrQ0dKTWVucmRJMVcrVTJhcC9DcmtLREwvUlV4WUhTU0xJQ3E0SlJxTXpR?=
 =?utf-8?Q?RbcxBgN/6riRh2sWAeSQt516w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0078c824-9592-43a3-dbe4-08dd93213481
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 19:54:58.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgavu1/eUmpRBCtsu2YwwLVKrOEcc0vaAM9JTfj5Ukchpe1VmfC2v8OSN+BmuE27ducvDS3DleouiTYgPyZpaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6168


On 5/13/25 10:15, James Morse wrote:
> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>
> The function helps to implement cpumask_andnot() APIs.
>
> Tested-by: James Morse <james.morse@arm.com>
> Reviewed-by: James Morse <james.morse@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

