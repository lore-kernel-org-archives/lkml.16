Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AEA277C9F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382104; cv=fail; b=J2Bs15ILSdgV7hJz8XKWhjXdRkGXmX/nudIuS0X/36osIwkhNnjNZ9YUxvTYh7qKsZdZlW8L006Dqk7hyoaMECe0NFwNZAk3q0Bl3Tn2riWs6NRxsT1U56/jGjd6YHSdKGRx/2CYwAYkNdiFdw6btEP2DJ3kcFZaM2tHuzee5Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382104; c=relaxed/simple;
	bh=+530M7qCVUQcAWlo+n/fuz5cgAsWatKajLRYJrxVMg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HALmxTdExVSH9jbB5KDH0bI5VSjMJY2V8qNeoD9W5badHlKvVz+b/T6KnJcqdYeTXMxvbI4KX6xK0xwGUHLOm4rLdzvC5pFX1UBDQ/JxAViE/Zu6LODtmZXuz0LxsOCwEmt2BwA7XrTN5bW7qsSuWquJOqYJoBfyuDlvWDjNLkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LY8dik9Q; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LY8dik9Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jao+Su25Z7N46iM/jhpBI+M4qH8RytUXVEOeyhqoPH7ppk1pdsZ4D2a9qGoLkH9oIvFz0dThv++ayh8WnDjf6IkmsrLIebDwMLpqTN9lCB7c7ljdqD/gENNoNrn79Dtqaqp+vSMQE4KgZ6o/OZ6RZyH8j5LxiJa0bz/LsTaPE96ko+bAUsN/xPsrJRX3VQhAkwFuPrl6XySpc5eI+74nUkl6W/yMISSYrnO73Dy2AtupQoHpA9c8yWynOKsniYvXcssAshkUpvInUxhaobsv0YxJ8xxED2pZ+gD0Swj1FJGPAouh3ZWL1XeoqFY04fFcXLCHRmTMD3G2gHxmlbGePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9qVHkzzJosf/SjK2DKIGQmDKNoJk3AMdN8fz+JQ1Zw=;
 b=dZxMnRHmshltUbmcdHoi/FAqK2Y4O3IsRe+wXohIT1U4ld7TQ3rIx6i3ukqgOQh2UPerVc2/LIeid1N2pKQLn0W6ZdzbToTeo6wvh8okJ8x2OCkmDGho9W6MIMTC/Bvj1t0aKHEit9FhDjdiR/faqkA8nQ9Tp8kqWaqTVrwTMyavKFdUiuyAXgZixfvG8KVw96JBS4UcAS3/TiO3NwXqdR/0BcQ5uLFv6jU5rwjFvTw7Gnv2/l2Pe/Q+/LUYUlDSsNMxxIU3uKLMBXQ7z6TJZ/21AFqv9y1Sa0nHy20Fr6S3u21GXbett2pL4FtLa1q2kBL9SUBvO5iZohXIHV05GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9qVHkzzJosf/SjK2DKIGQmDKNoJk3AMdN8fz+JQ1Zw=;
 b=LY8dik9Qbl6LANsL4JoYl+2w6bQ2MRccBZTbpZM96+EFNS+WxXYP3gC9er46a11H1US9NLIr4z4N74Jn6D72/P77FeRBo6yS702EAkIDVeNopXhn77YoQ/jTVx5MDCU55t8HtJkJqTlSna9CDcrHIM8RaezJd8UezrCbk6CDEUH8L9uIiHcUil0El2KC/XyBPM3ouqP44icXfAxiqqYQvsHbYZ7cL4ad7VoK/KO7g8KIsvdffuy97nID16C3k4NS+BxPmwEYkgPVA+v4e9g+9t1i4UXVfS0u/fl7y19szYIaXyJoGvKf7Px0T98HYZdfNywqqB32RwUQhQKHJR0Qaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 15:01:32 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 15:01:32 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>, Barry Song <baohua@kernel.org>
Cc: syzbot <syzbot+359a67b608de1ef72f65@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, apopple@nvidia.com, byungchul@sk.com,
 david@redhat.com, gourry@gourry.net, joshua.hahnjy@gmail.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, matthew.brost@intel.com,
 rakie.kim@sk.com, syzkaller-bugs@googlegroups.com,
 ying.huang@linux.alibaba.com
Subject: Re: [syzbot] [mm?] WARNING in xfs_init_fs_context
Date: Tue, 01 Jul 2025 11:01:29 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <DDD5FAAF-F698-4FC8-B49C-FD1D3B283A8E@nvidia.com>
In-Reply-To: <6861c281.a70a0220.3b7e22.0ab8.GAE@google.com>
References: <6861c281.a70a0220.3b7e22.0ab8.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0369.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e00f7f2-0c07-4e67-a490-08ddb8b02a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVZ3TEZEQmR1ZDJaZUpvRzBFeFkrZTdxc05CRVlkOXlJcE1NTzM0Tk54YmtK?=
 =?utf-8?B?NFkzQTdHUEp1WVJLUDZacUFqQ3Z2T0RpUzdxM3RQUy9oUEQrbDhGSWVmbWxV?=
 =?utf-8?B?c0pMb3h4Mm9jelhiMitPQ2RQazJPVWVZUFZacFFTZDNsM0VvZVA3bGVIZUlk?=
 =?utf-8?B?dzRFZWt3Skx2bEUwWlpiT2RSaW1HTi9OMWVqRTcrK0FTelFVbWhFVlBNb214?=
 =?utf-8?B?a1locFVJQmMyeTF3Ym1uQmZYWHJDQVJ0enVGK09JZ2dibkt6cVJTZVJFK2VK?=
 =?utf-8?B?MGhmU25qZExPVW14dkVNVGJtZ3k2MDZXTmRHRDRQM1RDWExCbExPYXRSZEk5?=
 =?utf-8?B?NmZ3TzQ2NzA1a2cyTkU4c1MzK05qb2NGV0o0bUNiYTJ4dFR1cHY0MVcwenhH?=
 =?utf-8?B?bUZRQkUyMHNoQkFUMkt1a1dCUkoraVZCbGZNQ1hIdG54SUNXMGFJMjRrV0I3?=
 =?utf-8?B?NjFFeGZOdkJybHZFZVRyQnh5NlVHZ3lzaFczWS9RUXgxMUpUb2RJZysxRm9L?=
 =?utf-8?B?d3BGeHZ0bWFWK2kxazZhdkJ5VGUwUjV3S3RidEZ1VHJIYlRLTVJ2bzdqV3dU?=
 =?utf-8?B?bHVVSVRFK1A3VWZVWVYxa3ZySG9xcldkRGQ1dzVTa0Zjd05xeHhYdDVSSlM3?=
 =?utf-8?B?YjBFNHRUM3lZVnIwcklPYS84Sm0xZ2QvUk5Ba2dpd253QmlxMmtXdzRyS1Uw?=
 =?utf-8?B?aXljY0FhQTk3OXJINkl6N3hwNC8xUk5Ta3pnRnZsSDhYK0pKMmVjdVAxZHVZ?=
 =?utf-8?B?Q3Jic0VXbUtHU21UR25vakNJamRMRzlmbVRpdWpCSTV1enVXNmtBVGY4Y1FZ?=
 =?utf-8?B?YWNEM0RmUERuaFZ4N3NDVzQrNTJxMWxGeEpUbExVK1Y0WmFGYUR1eG9PbXVI?=
 =?utf-8?B?eG52M1kraHM5N3haZjBIc29qRDV3cjdFWWlncEg4c2xMNFlkV2wzOElHbk9H?=
 =?utf-8?B?OXJhT3FyQVFzOUgxK1JmMWtGdUpmeWJnZTlGMDBYNS9wL3FVM3JYcXF0bGVm?=
 =?utf-8?B?UUpKbmlGUm56M0h6M1U4UmtOTVZaVWdQMEdWcEQvUkk4TVR0MXBEckwvd3dB?=
 =?utf-8?B?SjlreFRRTlVZTzhWU0VSaHBadHZ2Z2JIeVRnMDB2bzJEVlJaVEV3RlU2VUN4?=
 =?utf-8?B?OTdSalJBUXcrWm1VclpuQjlWMXBhcmZKTkFUWFZYSkNwbHNxMlRCd3FIM3NN?=
 =?utf-8?B?VnZrbE9NM1k5b1FJSk45MHcvNFlOdXJRMnU3Z2ZyQ3BXaXZGRG1DUkRDSlNL?=
 =?utf-8?B?QkwyTy9ueFZkNi9xbVd6TEE4cWN1MFhGNU9DaEU5cktDTXRZeTJjbmdJYXVJ?=
 =?utf-8?B?R0p3THAxcGZocWI3Q2lycXZOZ3AydktBd1RvdlFPTy9GNlQ3SXdqeFB4L0Vy?=
 =?utf-8?B?VkVkcGR6NWRVUllRaGZNN2xQbGRYUzNrTC9NZUh4eWhxM2s3c3lBc0l6VEpC?=
 =?utf-8?B?cGxma3d5UWNPWGZwUktzZWFTMkZOVEFOZnpwSWMramNlMGY1SHZkdzNwdXJL?=
 =?utf-8?B?NW9OS0Yxb0V5VFhZYi9yVVVWcHF3YVhwNkRzZ3V4NHlYRWtvcXA1eFZmc0dC?=
 =?utf-8?B?ckxUOFgxVXZnQUw1R3VIVkwrY0lCRmhTS3R1S29QYVZuSU15bnpHM0txNHBQ?=
 =?utf-8?B?OXcwZmJZNko4bEhiUWlhWEN0ZHdBczRHOFl0UjRkM21meURBT0xxd05VOUFD?=
 =?utf-8?B?U0l1dXFhTCtBMDNTQmladTd5cjYxZjk2UnhncEkzdVB2SUQ0ZUF1VjlPTUNi?=
 =?utf-8?B?ZzRMK25IQUgwcTRPZWp3UmZhN2Q5Tk44UTRpZUZFRUZKbnB5MWo3L0hzaFQ4?=
 =?utf-8?B?SUc1cnMxbkNPcm9hSTBaNnZFZjJHdHBwRkN2cGRtRkVNTVd6ZDVneFlUbUdk?=
 =?utf-8?B?VXRtL09GQkw5cHVFd2ViNythM2VMUjM3WUJWOU9jalcreHBhd3QydHFwUnA0?=
 =?utf-8?Q?1msQyGDJPGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmtHVjNuNHZqL3k3MXZ4Mmo2eGs3aE1QZklKblA2OFI5Z0JXa3RYSUlyMUU1?=
 =?utf-8?B?cWl0S2w2eDcxWFNKb05Sb3M2bjdFeG5qbFo0YVpCVHJrNFFvYmNpa0xpWUZn?=
 =?utf-8?B?cy9TaXRLUzZwcVMvdUtnS0VzYWJSTlNhYzFraVlnL3dBdGpUNXZrT3BMT1VJ?=
 =?utf-8?B?TTZJaFBRV0xIUnM3N1lHZ1ZEKzhqQ0tZNk8vYzEvT0VzY3lFVmY0d1Q2SzlZ?=
 =?utf-8?B?bHkvZTZrMSthVytGZXQ4RGF6TkVyQnBFVWtQcHhYVVgvbnF5Tkg5cjFJL3Fa?=
 =?utf-8?B?d2hYZXpWSlN3alBOOEVNMXRJYTZmdFd6Y3BkUWFkUEJtKytCYU9ja3RtWGdB?=
 =?utf-8?B?M2Q3dzJIcVM0b3ptMGh3VnliajcvdDd5MUZiUnljeGhSK0VpbHc2VnpJVUZC?=
 =?utf-8?B?MUVJWTRiZFdMYkRyQkllSU4zYmwzYzFkd0VCRHBOeG9HZmxveUd6enZZVnBo?=
 =?utf-8?B?NmFsR0lxSVBDWlJJb052dnJlb081c2RXU0VxMVdEY3B3V0IyOXR1Wk9YMkhv?=
 =?utf-8?B?SjdDUEphVEFsYmNlaVpnZDRZa0hSRWw1VWE1cS9kK1dBWitleW1vR0R3OFRB?=
 =?utf-8?B?MU0xRTJZSzNXaUE5SHgrU1ZsaC9icUZzOTBBejhkMmNkMHpCMUZOR1owRTNx?=
 =?utf-8?B?T056Q0ZLK29KR3l5aFdOc0pqSVJBUEgrakllK1ZxTmw2TS9iN2JBL0pqZzJN?=
 =?utf-8?B?eko1UmxHUjA3T1FnYlN6RmhXeUpnSU1CM2JDVlBhWGs4MlIvSjlqOHF2YXcv?=
 =?utf-8?B?YmRRcGxwVG1lazZLV21EZk84Y1cyTmpFOU50RXVsdERHbUZqUndqS2Zpc2M0?=
 =?utf-8?B?RFRzYVlKNzlnWGREYXBOdmxaUUQvZkIxREdaQ0tXeE1ISTRPWUk0cWNMeVBD?=
 =?utf-8?B?V3hTcTVlR2tKV2w4andqTDJUNmlyZ0wxYWgxcEVvOHFRRlZzZkR4SzRWNFNh?=
 =?utf-8?B?eWJNSklPZFFzMGJUUk9BSTlWR1dCVTdsYUVkYkJtazFoNWk5TXNpTWVrOUow?=
 =?utf-8?B?ZndQKzU2OU9jMy9yU2F2WC92MGVBcHRlTVdvZFphU3hOZ2ZGU2JVRjZHNXRt?=
 =?utf-8?B?KzFUa3RzdFZNT0cwaDNBNzYrb0FYc1dOYzBCWkw4bWlCNjVoV1FTRlE1WDdQ?=
 =?utf-8?B?NHV1OUVRTUlWREZqMnlMM2JXL0wydDVicUhnUndJVGM2L0JFQzJvYXVENkkx?=
 =?utf-8?B?bVZPemxjbnFCcWN0NHJYWVB3SER5RjBRWTdzb0JwcE9CQys4NEJ1OUhFbmh4?=
 =?utf-8?B?WUVIWnloNTRRZ2ZvZXNsK1JqelJLblRJelBOZ1pBM1RwOS9rbVlsNzdnZjQv?=
 =?utf-8?B?anYyRlJHWUwzaTZFUk5mcnJXY2xZUTBoTGV2RW5kaXVhZ3ppTHVPYjlwYmxC?=
 =?utf-8?B?bVA2eEp1c1MzeTM3c2grNHgvenNZK1IxVE5ENHpJTmlYRlpKV2lPSEhQekZO?=
 =?utf-8?B?endMdENTVktXWU5MZ1hKT2hHN3FWTVo0eDdITHBVdjhKVmx1Z2JseFg1NEQ1?=
 =?utf-8?B?YXR2K2NCQzRDVStGNU9PdkRCbVVGSDdja0V4MTR2djBLQjVHU0g1K3dYRnQv?=
 =?utf-8?B?cThDMUdna01jOW5yWnJJbC9Ba0lIMkNhb2Iyd2VJSE1SbGRTc3FaS1ZvNnUy?=
 =?utf-8?B?NlpHMTlITE5BRlE4UGM2QTcwNHdSZnpjVmZXZUpkRGs5QlVoSkY4OGhlNmox?=
 =?utf-8?B?c28vWk1BcG9VUko4MXRXa1Y1czBVdmJLZEFFcTBWT2hnS1ZqeFBRc3pYei8v?=
 =?utf-8?B?bTJVWTlDMzhJNjdEU3V2bkJYM2tQbnFHN2FDRmpSTnEzbnhoSHVXMUo5WTM0?=
 =?utf-8?B?NGVDMnh1dVFWZkEyY3JKSU4rMEtFenFVWVlwa1VxVkY5UEQrQjdOMjVNQUV2?=
 =?utf-8?B?ZHNFaDViQUpJcG03SG40TloydmtkbTk3V2VwQW9kcGhMVlBKcnVxckdDakg0?=
 =?utf-8?B?UDdiTEt3bTNaV0EyUkl3N2gvMytIb0ZSa3ZNeStyVVFzWGJNTFlqcnQrM25v?=
 =?utf-8?B?bVo4SnpuMis5MHhSdmdKa1lmeGRtc21TaUowOUN5eUdiSldWRkR0aW9sdjBm?=
 =?utf-8?B?dGhPc1hYQk9TWHJBZkVYWGd4UHdQa3ZzYkxYT0xRNG9tM0tQbHBFVDhNdEdP?=
 =?utf-8?Q?9iMJXripLH0Rhp5z8JuxK1/PQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e00f7f2-0c07-4e67-a490-08ddb8b02a27
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:01:31.9979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuIQzXYs2AF1etUUQGKqYaoxPOKtKS+MoGZVx0FoYuX9YsD1rG93nu9PgNnRZ1R7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784

On 29 Jun 2025, at 18:47, syzbot wrote:

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    dfba48a70cb6 Merge tag 'i2c-for-6.16-rc4' of git://git.ke=
r..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D14a6298258000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D79da270cec5ff=
d65
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D359a67b608de1ef=
72f65
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e0775=
7-1~exp1~20250514183223.118), Debian LLD 20.1.6
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d=
900f083ada3/non_bootable_disk-dfba48a7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/783560258712/vmlinu=
x-dfba48a7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/685ad235ac7b/b=
zImage-dfba48a7.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+359a67b608de1ef72f65@syzkaller.appspotmail.com
>
> loop0: detected capacity change from 0 to 32768
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5325 at mm/page_alloc.c:4430

This warning fires when one tries to allocate a >1 order page with
__GFP_NOFAIL.

> __alloc_pages_slowpath+0xcb3/0xce0 mm/page_alloc.c:4430
> Modules linked in:
> CPU: 0 UID: 0 PID: 5325 Comm: syz.0.0 Not tainted 6.16.0-rc3-syzkaller-00=
329-gdfba48a70cb6 #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2~bpo12+1 04/01/2014
> RIP: 0010:__alloc_pages_slowpath+0xcb3/0xce0 mm/page_alloc.c:4430
> Code: d8 48 c1 e8 03 0f b6 04 08 84 c0 75 2e f6 43 01 08 48 8b 14 24 0f 8=
4 a2 f3 ff ff 90 0f 0b 90 e9 99 f3 ff ff e8 ae 09 50 09 90 <0f> 0b 90 f7 c5=
 00 04 00 00 75 bc 90 0f 0b 90 eb b6 89 d9 80 e1 07
> RSP: 0018:ffffc9000d62f970 EFLAGS: 00010246
> RAX: 1378840d66abe400 RBX: 0000000000000002 RCX: dffffc0000000000
> RDX: ffffc9000d62fa80 RSI: 0000000000000002 RDI: 0000000000048cc0
> RBP: 0000000000048cc0 R08: ffff88801b68003f R09: 1ffff110036d0007
> R10: dffffc0000000000 R11: ffffed10036d0008 R12: ffffc9000d62fa80
> R13: 1ffff92001ac5f4c R14: 0000000000048cc0 R15: dffffc0000000000
> FS:  00007fcd1cbf46c0(0000) GS:ffff88808d250000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fcd1bd726e0 CR3: 0000000043166000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __alloc_frozen_pages_noprof+0x319/0x370 mm/page_alloc.c:4972
>  alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2419
>  alloc_slab_page mm/slub.c:2451 [inline]
>  allocate_slab+0xe2/0x3b0 mm/slub.c:2627
>  new_slab mm/slub.c:2673 [inline]

new_slab() allows __GFP_NOFAIL, since GFP_RECLAIM_MASK has it.
In allocate_slab(), the first allocation without __GFP_NOFAIL
failed, the retry used __GFP_NOFAIL but kmem_cache order
was greater than 1, which led to the warning above.

Maybe allocate_slab() should just fail when kmem_cache
order is too big and first trial fails? I am no expert,
so add Vlastimil for help. Barry, who added the nofail
warning is cc=E2=80=99d.


>  ___slab_alloc+0xbfc/0x1480 mm/slub.c:3859
>  __slab_alloc mm/slub.c:3949 [inline]
>  __slab_alloc_node mm/slub.c:4024 [inline]
>  slab_alloc_node mm/slub.c:4185 [inline]
>  __kmalloc_cache_noprof+0x296/0x3d0 mm/slub.c:4354
>  kmalloc_noprof include/linux/slab.h:905 [inline]
>  kzalloc_noprof include/linux/slab.h:1039 [inline]
>  xfs_init_fs_context+0x54/0x500 fs/xfs/xfs_super.c:2279
>  alloc_fs_context+0x651/0x7d0 fs/fs_context.c:318
>  do_new_mount+0x10e/0xa40 fs/namespace.c:3881
>  do_mount fs/namespace.c:4239 [inline]
>  __do_sys_mount fs/namespace.c:4450 [inline]
>  __se_sys_mount+0x317/0x410 fs/namespace.c:4427
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fcd1bd900ca
> Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 de 1a 00 00 66 2e 0f 1f 8=
4 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fcd1cbf3e68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007fcd1cbf3ef0 RCX: 00007fcd1bd900ca
> RDX: 0000200000000040 RSI: 0000200000009640 RDI: 00007fcd1cbf3eb0
> RBP: 0000200000000040 R08: 00007fcd1cbf3ef0 R09: 0000000000208800
> R10: 0000000000208800 R11: 0000000000000246 R12: 0000200000009640
> R13: 00007fcd1cbf3eb0 R14: 000000000000964b R15: 0000200000001340
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup


Best Regards,
Yan, Zi
