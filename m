Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CAEAD2C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744693039; cv=fail; b=bbDkK38apd+S/9eZFkwgPsPXmF8f1fONoHYAosJGRj6h22REdGfQupxsMRQZXUpssCzFihtn+w/QSgmtRwfw3s6GEd87ktpmdhbbTEUEcguuuWEvZptlSj3k1kgK3YckNpHUwSpa/F/ck8m3BKmuChVUdDZlvCgoLrO/g49rQyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744693039; c=relaxed/simple;
	bh=Bg9+lSXK6Y0NNtwxqXA7++4/PlNm5PCeSG/Sb2crmvA=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=cxSecyEYlu2FqVUSp3R7HNrRKan/hMMCbQur3smFm9vKW/bCCXv/0IhUbB20vuONeWXYVlmLncdJziBsnXBrZLq7I2DpZCfZT9FdrtCJlBztX4K4sK8DH2dOFUXBe1O+tx9FXgqMyVpxEHJe27jNUAszk8V6/ARcTFQNyZEU3Ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MXIuTI4N; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MXIuTI4N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuhRlWtMicVpcbLTXcMDvp405egh03lUE+s1gXQLSjUT9gyV9JSz0JG8cbvVSUQOkkIuyEBX5wN79Xd6ULhcpTXF0bZmyr9pZnNoHghJ/tPGhnFF6AsWTsVITlNO0yfZBL0nAq8FNagpWTPyWVFEKAh0CyE/YeExNIcqjxV2LOf/2hCnwBTfOb9svtuek7AMp7iFZS+M3Vq9Ceqs181+6sZ58QIc/mNwPN1T7nkcZeK1k0+UMyJBUTPEwnm0JFLJwGWjYpQQWcgkGPO9uUlF3rQnchyjGpz8q/j9TTpdJcoqlnqGHvejGWt7D8u1WWZHTP/cfSMPtR44L4gevXmnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9bGasJKT4ZV9gfN+W3GKA1wU04crIrWw1bSshCa8GQ=;
 b=Uqcwz0TlFMEzmiWugxXPP8bo/hcv+70cV5pfJc8Kxon9dct7iEJpf/kZlvIxts2sx+YR8QLSP7IyMHt9G5vnLI1PVEsGll8KFa1UDsbkTNy3m7tKbClgJc15q9+ielawjWrM0BiODJul0JsbnVsicIo1sG8ep1hRqS9up/vuh9Ih58UppnyV7TnMt3sPWwD7+BVHUrSL334KEOowyU0Wl5iQq4MKKwwReY3xZdGBglBfgfJYAIU5em9uB5w53BSZI0TO3tUBHOx5A50Pf67z+5orSV+e6fmZjHiGfUnOSKSRR6obbwLszNfp0x4/yCFVtVBkmJq643mkU8tIECncBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9bGasJKT4ZV9gfN+W3GKA1wU04crIrWw1bSshCa8GQ=;
 b=MXIuTI4N6Il5Qh2FPiy3BGl7zTMJt8TZTZT+l/ulZQuCuKPbpndM1+DmhUiKaTPvTIuxkh+wZfs2X/cIAX6Lfxx3jCSYCzPQr/1AeNyJkqnPhjdway2h+racB0UrRk9gmooRuGCq5+ne/soEuPlKb+rw9RRSkqXw8mV/lQPozkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by CY8PR12MB7416.namprd12.prod.outlook.com (2603:10b6:930:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Tue, 15 Apr
 2025 04:57:10 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 04:57:10 +0000
Content-Type: multipart/mixed; boundary="------------THGHd2BzcuMsi2RtFkv0mWFl"
Message-ID: <cbbffb90-c342-4738-b7cd-76db8fd44556@amd.com>
Date: Tue, 15 Apr 2025 10:27:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
To: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, brauner@kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, shaggy@kernel.org, syzkaller-bugs@googlegroups.com,
 willy@infradead.org
References: <67fc3023.050a0220.2970f9.0361.GAE@google.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <67fc3023.050a0220.2970f9.0361.GAE@google.com>
X-ClientProxiedBy: PN3PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::12) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|CY8PR12MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d64e073-252e-44e3-f43d-08dd7bd9fae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|4053099003|4013099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDVteUhTcW9QbWFRbXFSWmg3WlRTY3VHblh2bWplN3U2S1hJNXhKZTJVNkkw?=
 =?utf-8?B?QmV2Z1g4WkF5RTNJWTVsYW10dk9ZUUdwYStRZWlrcUNSQ3VjQk94TXgwSzNu?=
 =?utf-8?B?MFhrUGNSSmhWdXFBbWpuRWsxL29VYTZlWkx2MmRYSlY3eHhld2tjcDRLT0d0?=
 =?utf-8?B?b3RKdjJlU01pWnlHb1JydXZtdkVvZ1MrWHZpWlVrUWNnRHdmZXRsNjJDS2Iv?=
 =?utf-8?B?Y3J3WkJEUXlmTkdjNVJqQWIzU0k3YVNJSndTUVRyaDYwY1hHdEtsdElrUUVB?=
 =?utf-8?B?bFBocUFtc1ZzZFZsbmgrVVZMQVVqZWpDYlFWZXVnZDBDUHhHcVAwT3NKQ2pr?=
 =?utf-8?B?aGprL29QY1lLVmFnMXRadUxWb2VlSVBqVFljWG9DeVF1MUY2YmcwcXkvck51?=
 =?utf-8?B?d0dSUCsxbnJQSk1ISVlDZzlPakZFV1hGMGEzdU9SQ2VsZGJrWm52alpHZGp5?=
 =?utf-8?B?M0daTFZ4bGlEODNBSmg0aDcyYVpsT1hHT1RUR25GdFM5UjF0YmtFUGZ6MDUv?=
 =?utf-8?B?aFJyWitaT2hRNHBBc21oaVBMMDVrYm5FM2s5Y2RWT24weVVnanBYY1VicExR?=
 =?utf-8?B?R1JZaHpnV1pwamhnVVFlQWkrZGRVeW9pd3E4OElnTk1JRjFhblpFTTJ5Nkhy?=
 =?utf-8?B?SXExRE1nVlhDS2VXZWkrdWw5c3UvTW9MWUkrQmowNldNREllN0Z2dHRvS05o?=
 =?utf-8?B?ZjNHWStGV0h1cFAweS9FamExSmtGdDdQeXVzQ1c4R1RsRTd0UUZsWmpmaWI3?=
 =?utf-8?B?MVQ3d0M1WnNkOVdyQVJFMzlZWndvTjg1cTR5bXdzOTFnci9KbG1GOEJNcFhU?=
 =?utf-8?B?bVpBcXVmRU1vS1J3ZWVmN1BEL284djRXaDFqaUtZNWNWcFJRSVVuOUF5Mk5u?=
 =?utf-8?B?TjB6QmsyQ1dpeEJNbWI3eXdJWmZUU2JzV0lXaU1IdVNzOW5ralJBNG1tWEdJ?=
 =?utf-8?B?MmJOR2wyUW9OYlYrMjB1cWdxUUg3ZDJtbUt0eTRsc3F1Z280QWpPQ2hNbnVt?=
 =?utf-8?B?VVp5TXhZcG9GOWo0bmdQNm8yaWg4SGlyeUdrekhtbzlpWmwzVHhkZFRpcWty?=
 =?utf-8?B?cU9CVEpNN0JhT0w2Z0ZFZ05Sc09tVUNzbTlSV1NxcDU3ZUx6Q2tWaDVIeDlH?=
 =?utf-8?B?RElDTTYxT21hZ2hHN21hVzJRUDVhMTlOWWVYQmxObDkrNXZyaFc4SDluNVNC?=
 =?utf-8?B?YTZhcEhtTzlSWGV5MTVvOUd5dC9sZ2ZaaE1tbmttRHpGWTduMXVDRXY2STZM?=
 =?utf-8?B?cmxmMW9BM2JXVTRXSkJ2angrSUVBT3AxQWc4RXk0ZE5DRnZCbTkrN2ZMWXpy?=
 =?utf-8?B?SjVYc0dZWlh3RGgwZlZiQ3BDZzJBbjNJdDMydy92UGpudTZYT2g0WHBYNnJM?=
 =?utf-8?B?S201SWN2UWpYa2R2b1hnYVRvVlZnVXZJRVR5eGVPWUxINWVlbDZhditpZTQ2?=
 =?utf-8?B?NG1rOFVSdVRrVVZpZFkyM2JwMnlLbFpaNDRyL3VuSU9CLzZhUm1xdG9QTWdJ?=
 =?utf-8?B?RDRZcnFFcUhSSldUNk1QaERmbDZzL3VvQTVjODJVUWwvZ1VaRGFlaE5oNnJw?=
 =?utf-8?B?ZGFUdU1wb2JlYkkvQ3BWd3kxbWtUbllRdlV5Z0J1T1puRlVHZ1J6TzNnVHFz?=
 =?utf-8?B?Q1ZyVVZKMFh0SFhuOFJOMEs3dFpCOUMvaHZ2THBRaVVuVFF3dEJtWlJmTk9Q?=
 =?utf-8?B?OEQyN29RWkpsTTgvS3BxL2lldk5Ecjh0MFFrdzVaRElNKzA3aEVGdWR2anAv?=
 =?utf-8?B?QjVZZWZFcVAwOVVuMHcxY2pVRE0yRG83SGJZMnk2UnlnYzFyNzA4cVV1dTNu?=
 =?utf-8?Q?s6RQ9z8GZ0Ki1UHdpBNSPdoLo+LxwB2x6jGZw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(4053099003)(4013099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U09aL3U0NzhxQldsQWU4V29NZFhHVjNsRE11MlJUMUI2Z1QrOFM2UTNSTHNU?=
 =?utf-8?B?RG8vL1dmcnhsQnlNYnRHamM4MnNDazBpWjkveFJaWVVwdjgxM0lVU2hNb0Yz?=
 =?utf-8?B?OFNpSngrdzUra2c0eUJiYVRQWHdzSWpRNlFzRWgrRUpNc1duTG9SazdwdzF6?=
 =?utf-8?B?bkNGUFBLaHoxNVd6S28yalFBQ0FscTU5V3VQQUlmTFN6YVQxRHRGcG1ScTBP?=
 =?utf-8?B?Sys0elQxcDNQSHQ5VVFLUElpelhVaytNZmJDQ2lFdkt4MHFyQ3FQWHJHYTFw?=
 =?utf-8?B?cTVtaFM0Zm9tTzg4ZDUvZmRzMThIekwxL0JTQ0p6QXhzMEk2bGFtWEpMYWc1?=
 =?utf-8?B?WFYybGcyRFAwdHkyUDY3dmZudVlBaDJqUW5FTkhnempCRnBUcE1lM2g3TzNl?=
 =?utf-8?B?Szg5MTBDQ1RwK3ZsRWNqWTRFR1VEVFM0ZnRjSTRyalNaUjVZckRwMnlUSFUr?=
 =?utf-8?B?czc2T2NXVFZDRGhONk5yVFZjTXJrVnJsTUsyNks5cVFObXNTVzNZaElxYnlz?=
 =?utf-8?B?RGNYaWlnNitiUXVLR0hJOCtzcU1zcHpENFhkblNMVmx4RHN4SCtLWVAwK0NG?=
 =?utf-8?B?eGloNTRlVkFNdkRCY25YZ2ExSlBqKyt6RGpoa1JOSFArVWpHbEphc1JHMmk2?=
 =?utf-8?B?NmtTTDJqQlBqb3lOQlRlZmsyOGEya3REMmk4aDJCRzJmVHYxY1NvYWhEUlh2?=
 =?utf-8?B?NkRUSFFJYStKNDZGb2hrZitqY1NycGQ2RmhkTWVmZUVyV3BoSmtmZGtTWmV0?=
 =?utf-8?B?WG93d0dSNzdGT3NVQ1pwUGRrY0E0MGppbnpLME1PbnBGT1MzcUJpS3JaSC9X?=
 =?utf-8?B?VnJNa1V2TDdKVjlYUC84RlF3dkV3TC9pWlU3SklaQ1pMdGQweUlNcnlTb0V4?=
 =?utf-8?B?WkxaeUVHcnJoaDI4RmRPT3ZmWkRVc3pKLzEvT0ZJcjc3UjhIcTVITDdrRFdB?=
 =?utf-8?B?d1JqV0J0d1U4Qm1RNk5BNmt2aERZL0xTREkwcldzY1ZFSytrK05FYktCc0cw?=
 =?utf-8?B?ekkza1U1L2xlNStVTXE1aGx3THZoOW1PWW9BZWozbkZSOW9WSjZpNjBtUG5V?=
 =?utf-8?B?QnpGdTF5RXZvMStmamFlVkI2UHlSWTdIeHY3OWhucHl2NWlxVzA2L25PSmFP?=
 =?utf-8?B?VlArUkJ1WDhmMFVmWlFCeFd0Kys5aGwxTjdDbHM5RWFPM0I0SjVtWDlxYm1Y?=
 =?utf-8?B?NEMvQUNnY1hraiswUTNQV0FDQXNOcDVrc3hwNExHeUhFM0ZEQ3Ywb3JGMVlI?=
 =?utf-8?B?dDNMSUQ2dzAwVVF3Q3c0eDZudE9DU1ExVEpBb2x6eWxRUjJENllYaHordFIz?=
 =?utf-8?B?blZzWitjVXYwZ1NuMlI0NjlqaHRwTUtwTVNIbGJFMytJdmVqaGpYTllXSlVv?=
 =?utf-8?B?N1VsUEt3VXV2VFpIaHhKU0FUSCsvWmRZYzdQT1R2ZjJ6aTN4Mnc3TE5VSU9z?=
 =?utf-8?B?YlV5LzhYbnp6WHlDTFJEUmNUVTVQTmZ4bUUza1k5dzFJNTdkaE1LdzExRFA4?=
 =?utf-8?B?bGJVMStUaVZlOUlCdit6NnNzNUt6a05wTlFlL3lFRXJTdEZqSXpRU2VZYlgv?=
 =?utf-8?B?bjFPbTZZOW1JQ01qTDltS0VVTWJCc3lRQVhoU3ZqUlp0elhvSS96MjVOY2ps?=
 =?utf-8?B?K0RyWWNJSHlBK2ZvYU9RZGRrWVBvaWZ4T2RkMVBUYzRlV1ZVbFc2aFIySGxI?=
 =?utf-8?B?cFhBNnprQ3pUaUJUeUo0YlN3OWVEQnFUd0xEZ3VrNmlzblhqcVpOWlBjRmlX?=
 =?utf-8?B?ZVNwY2VmYmtQZVBPa25tUTJWVldXeDdDeEFJU3hRL3VyMVJ1VWVONVRseE8x?=
 =?utf-8?B?TzZYVFdXV2xvYWVFL0ZtQzlESGJWSmJNcUFrYkwwcUFUTnp6QStNY29YcnJL?=
 =?utf-8?B?YWRFTVQ4bDBPYVBzdkxFc0VBcHJpcmtNQk5DSnpIWWVqN2dKSnlaL1IwY1M1?=
 =?utf-8?B?RjJ6b2h5STZDSWxOS2hJNW9VYjNRVFdpTnNveGcycG9HZHdvbUNVdisxWHlR?=
 =?utf-8?B?OWRxa2VndXMwMkUva1dJQ1o1YTVmRzNZWmN2dkdXNFNjN2xoZVMrVE9PdzNG?=
 =?utf-8?B?WVVpUThlbTUxSXJvTnZaRlNzb1ptaFhPcG5nTmZDSW9VWTZ2TnFFdDJHOWt1?=
 =?utf-8?Q?I2IBeYseqIUL5nGdkBE2hHL2t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d64e073-252e-44e3-f43d-08dd7bd9fae0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 04:57:10.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFDDpXLXmt8ZwM74Ig0B7RDIq/jqpiXUQPyzTjeccZe+0t1s+Udzt1s6xMElRU8jnfGp7HPh7rGIPPuI5x4yYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7416

--------------THGHd2BzcuMsi2RtFkv0mWFl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 01c6df60d5d4

Best Regards,
Shivank

On 4/14/2025 3:14 AM, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 7ee3647243e5c4a9d74d4c7ec621eac75c6d37ea
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Wed Apr 2 14:59:57 2025 +0000
> 
>     migrate: Remove call to ->writepage
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15be8fe4580000
> start commit:   01c6df60d5d4 Add linux-next specific files for 20250411
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=17be8fe4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=13be8fe4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=db03cefa26ecf825
> dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10afca3f980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116f5c04580000
> 
> Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
> Fixes: 7ee3647243e5 ("migrate: Remove call to ->writepage")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

--------------THGHd2BzcuMsi2RtFkv0mWFl
Content-Type: text/plain; charset=UTF-8;
 name="0001-jfs-implement-migrate_folio-for-jfs_metapage_aops.patch"
Content-Disposition: attachment;
 filename*0="0001-jfs-implement-migrate_folio-for-jfs_metapage_aops.patch"
Content-Transfer-Encoding: base64

RnJvbSAwY2Q1N2QxMDJhMDdmNDUzZDRhNzIyMjE1Y2U4YWUzNGZmODFjMGExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2YW5rIEdhcmcgPHNoaXZhbmtnQGFtZC5jb20+CkRhdGU6
IFN1biwgMTMgQXByIDIwMjUgMTY6NDA6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBqZnM6IGlt
cGxlbWVudCBtaWdyYXRlX2ZvbGlvIGZvciBqZnNfbWV0YXBhZ2VfYW9wcwoKQWRkIHRoZSBtaXNz
aW5nIG1pZ3JhdGVfZm9saW8gb3BlcmF0aW9uIHRvIGpmc19tZXRhcGFnZV9hb3BzIHRvIGZpeAp3
YXJuaW5ncyBkdXJpbmcgbWVtb3J5IGNvbXBhY3Rpb24uIFRoZXNlIHdhcm5pbmdzIHdlcmUgaW50
cm9kdWNlZCBieQpjb21taXQgN2VlMzY0NzI0M2U1ICgibWlncmF0ZTogUmVtb3ZlIGNhbGwgdG8g
LT53cml0ZXBhZ2UiKSB3aGljaAphZGRlZCBleHBsaWNpdCB3YXJuaW5ncyB3aGVuIGZpbGVzeXN0
ZW1zIGRvbid0IGltcGxlbWVudCBtaWdyYXRlX2ZvbGlvLgoKU3lzdGVtIHJlcG9ydHMgZm9sbG93
aW5nIHdhcm5pbmdzOgogIGpmc19tZXRhcGFnZV9hb3BzIGRvZXMgbm90IGltcGxlbWVudCBtaWdy
YXRlX2ZvbGlvCiAgV0FSTklORzogQ1BVOiAwIFBJRDogNjg3MCBhdCBtbS9taWdyYXRlLmM6OTU1
IGZhbGxiYWNrX21pZ3JhdGVfZm9saW8gbW0vbWlncmF0ZS5jOjk1MyBbaW5saW5lXQogIFdBUk5J
Tkc6IENQVTogMCBQSUQ6IDY4NzAgYXQgbW0vbWlncmF0ZS5jOjk1NSBtb3ZlX3RvX25ld19mb2xp
bysweDcwZS8weDg0MCBtbS9taWdyYXRlLmM6MTAwNwoKSW1wbGVtZW50IG1ldGFwYWdlX21pZ3Jh
dGVfZm9saW8gd2hpY2ggaGFuZGxlcyBib3RoIHNpbmdsZSBhbmQgbXVsdGlwbGUKbWV0YXBhZ2Vz
IHBlciBwYWdlIGNvbmZpZ3VyYXRpb25zLgoKRml4ZXM6IDM1NDc0ZDUyYzYwNSAoImpmczogQ29u
dmVydCBtZXRhcGFnZV93cml0ZXBhZ2UgdG8gbWV0YXBhZ2Vfd3JpdGVfZm9saW8iKQpSZXBvcnRl
ZC1ieTogc3l6Ym90KzhiYjZmZDk0NWFmNGUwYWQ5Mjk5QHN5emthbGxlci5hcHBzcG90bWFpbC5j
b20KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNjdmYWZmNTIuMDUwYTAyMjAu
Mzc5ZDg0LjAwMWIuR0FFQGdvb2dsZS5jb20KU2lnbmVkLW9mZi1ieTogU2hpdmFuayBHYXJnIDxz
aGl2YW5rZ0BhbWQuY29tPgotLS0KIGZzL2pmcy9qZnNfbWV0YXBhZ2UuYyAgIHwgOTQgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbWlncmF0
ZS5oIHwgIDEgKwogbW0vbWlncmF0ZS5jICAgICAgICAgICAgfCAgMyArLQogMyBmaWxlcyBjaGFu
Z2VkLCA5NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvamZz
L2pmc19tZXRhcGFnZS5jIGIvZnMvamZzL2pmc19tZXRhcGFnZS5jCmluZGV4IGRmNTc1YTg3M2Vj
Ni4uNTA3NTlhODQ2ZTIyIDEwMDY0NAotLS0gYS9mcy9qZnMvamZzX21ldGFwYWdlLmMKKysrIGIv
ZnMvamZzL2pmc19tZXRhcGFnZS5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8bGludXgv
bWVtcG9vbC5oPgogI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+CiAjaW5jbHVkZSA8bGludXgv
d3JpdGViYWNrLmg+CisjaW5jbHVkZSA8bGludXgvbWlncmF0ZS5oPgogI2luY2x1ZGUgImpmc19p
bmNvcmUuaCIKICNpbmNsdWRlICJqZnNfc3VwZXJibG9jay5oIgogI2luY2x1ZGUgImpmc19maWxz
eXMuaCIKQEAgLTE1MSw2ICsxNTIsNTQgQEAgc3RhdGljIGlubGluZSB2b2lkIGRlY19pbyhzdHJ1
Y3QgZm9saW8gKmZvbGlvLCBibGtfc3RhdHVzX3Qgc3RhdHVzLAogCQloYW5kbGVyKGZvbGlvLCBh
bmNob3ItPnN0YXR1cyk7CiB9CiAKK3N0YXRpYyBpbnQgX19tZXRhcGFnZV9taWdyYXRlX2ZvbGlv
KHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzdHJ1Y3QgZm9saW8gKmRzdCwKKwkJCQkg
ICAgc3RydWN0IGZvbGlvICpzcmMsIGVudW0gbWlncmF0ZV9tb2RlIG1vZGUpCit7CisJc3RydWN0
IG1ldGFfYW5jaG9yICpzcmNfYW5jaG9yID0gc3JjLT5wcml2YXRlOworCXN0cnVjdCBtZXRhcGFn
ZSAqbXBzW01QU19QRVJfUEFHRV0gPSB7MH07CisJc3RydWN0IG1ldGFwYWdlICptcDsKKwlpbnQg
aSwgcmM7CisKKwlmb3IgKGkgPSAwOyBpIDwgTVBTX1BFUl9QQUdFOyBpKyspIHsKKwkJbXAgPSBz
cmNfYW5jaG9yLT5tcFtpXTsKKwkJaWYgKG1wICYmIG1ldGFwYWdlX2xvY2tlZChtcCkpCisJCQly
ZXR1cm4gLUVBR0FJTjsKKwl9CisKKwlyYyA9IGZpbGVtYXBfbWlncmF0ZV9mb2xpbyhtYXBwaW5n
LCBkc3QsIHNyYywgbW9kZSk7CisJaWYgKHJjICE9IE1JR1JBVEVQQUdFX1NVQ0NFU1MpCisJCXJl
dHVybiByYzsKKworCWZvciAoaSA9IDA7IGkgPCBNUFNfUEVSX1BBR0U7IGkrKykgeworCQltcCA9
IHNyY19hbmNob3ItPm1wW2ldOworCQlpZiAoIW1wKQorCQkJY29udGludWU7CisJCWlmICh1bmxp
a2VseShpbnNlcnRfbWV0YXBhZ2UoZHN0LCBtcCkpKSB7CisJCQkvKiBJZiBlcnJvciwgcm9sbC1i
YWNrIHByZXZpb3NseSBpbnNlcnRlZCBwYWdlcyAqLworCQkJZm9yIChpbnQgaiA9IDAgOyBqIDwg
aTsgaisrKSB7CisJCQkJaWYgKG1wc1tqXSkKKwkJCQkJcmVtb3ZlX21ldGFwYWdlKGRzdCwgbXBz
W2pdKTsKKwkJCX0KKwkJCXJldHVybiAtRUFHQUlOOworCQl9CisJCW1wc1tpXSA9IG1wOworCX0K
KworCS8qIFVwZGF0ZSB0aGUgbWV0YXBhZ2UgYW5kIHJlbW92ZSBpdCBmcm9tIHNyYyAqLworCWZv
ciAoaW50IGkgPSAwOyBpIDwgTVBTX1BFUl9QQUdFOyBpKyspIHsKKwkJbXAgPSBtcHNbaV07CisJ
CWlmIChtcCkgeworCQkJaW50IHBhZ2Vfb2Zmc2V0ID0gbXAtPmRhdGEgLSBmb2xpb19hZGRyZXNz
KHNyYyk7CisKKwkJCW1wLT5kYXRhID0gZm9saW9fYWRkcmVzcyhkc3QpICsgcGFnZV9vZmZzZXQ7
CisJCQltcC0+Zm9saW8gPSBkc3Q7CisJCQlyZW1vdmVfbWV0YXBhZ2Uoc3JjLCBtcCk7CisJCX0K
Kwl9CisKKwlyZXR1cm4gTUlHUkFURVBBR0VfU1VDQ0VTUzsKK30KKwogI2Vsc2UKIHN0YXRpYyBp
bmxpbmUgc3RydWN0IG1ldGFwYWdlICpmb2xpb190b19tcChzdHJ1Y3QgZm9saW8gKmZvbGlvLCBp
bnQgb2Zmc2V0KQogewpAQCAtMTc1LDYgKzIyNCwzMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmVt
b3ZlX21ldGFwYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCBtZXRhcGFnZSAqbXApCiAj
ZGVmaW5lIGluY19pbyhmb2xpbykgZG8ge30gd2hpbGUoMCkKICNkZWZpbmUgZGVjX2lvKGZvbGlv
LCBzdGF0dXMsIGhhbmRsZXIpIGhhbmRsZXIoZm9saW8sIHN0YXR1cykKIAorc3RhdGljIGludCBf
X21ldGFwYWdlX21pZ3JhdGVfZm9saW8oc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHN0
cnVjdCBmb2xpbyAqZHN0LAorCQkJCSAgICBzdHJ1Y3QgZm9saW8gKnNyYywgZW51bSBtaWdyYXRl
X21vZGUgbW9kZSkKK3sKKwlzdHJ1Y3QgbWV0YXBhZ2UgKm1wOworCWludCBwYWdlX29mZnNldDsK
KwlpbnQgcmM7CisKKwltcCA9IGZvbGlvX3RvX21wKHNyYywgMCk7CisJaWYgKG1wICYmIG1ldGFw
YWdlX2xvY2tlZChtcCkpCisJCXJldHVybiAtRUFHQUlOOworCisJcmMgPSBmaWxlbWFwX21pZ3Jh
dGVfZm9saW8obWFwcGluZywgZHN0LCBzcmMsIG1vZGUpOworCWlmIChyYyAhPSBNSUdSQVRFUEFH
RV9TVUNDRVNTKQorCQlyZXR1cm4gcmM7CisKKwlpZiAodW5saWtlbHkoaW5zZXJ0X21ldGFwYWdl
KHNyYywgbXApKSkKKwkJcmV0dXJuIC1FQUdBSU47CisKKwlwYWdlX29mZnNldCA9IG1wLT5kYXRh
IC0gZm9saW9fYWRkcmVzcyhzcmMpOworCW1wLT5kYXRhID0gZm9saW9fYWRkcmVzcyhkc3QpICsg
cGFnZV9vZmZzZXQ7CisJbXAtPmZvbGlvID0gZHN0OworCXJlbW92ZV9tZXRhcGFnZShzcmMsIG1w
KTsKKworCXJldHVybiBNSUdSQVRFUEFHRV9TVUNDRVNTOworfQorCiAjZW5kaWYKIAogc3RhdGlj
IGlubGluZSBzdHJ1Y3QgbWV0YXBhZ2UgKmFsbG9jX21ldGFwYWdlKGdmcF90IGdmcF9tYXNrKQpA
QCAtNTU0LDYgKzYyOSwyNCBAQCBzdGF0aWMgYm9vbCBtZXRhcGFnZV9yZWxlYXNlX2ZvbGlvKHN0
cnVjdCBmb2xpbyAqZm9saW8sIGdmcF90IGdmcF9tYXNrKQogCXJldHVybiByZXQ7CiB9CiAKKy8q
KgorICogbWV0YXBhZ2VfbWlncmF0ZV9mb2xpbyAtIE1pZ3JhdGlvbiBmdW5jdGlvbiBmb3IgSkZT
IG1ldGFwYWdlcworICovCitzdGF0aWMgaW50IG1ldGFwYWdlX21pZ3JhdGVfZm9saW8oc3RydWN0
IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsIHN0cnVjdCBmb2xpbyAqZHN0LAorCQkJCSAgc3RydWN0
IGZvbGlvICpzcmMsIGVudW0gbWlncmF0ZV9tb2RlIG1vZGUpCit7CisJaW50IGV4cGVjdGVkX2Nv
dW50OworCisJaWYgKCFzcmMtPnByaXZhdGUpCisJCXJldHVybiBmaWxlbWFwX21pZ3JhdGVfZm9s
aW8obWFwcGluZywgZHN0LCBzcmMsIG1vZGUpOworCisJLyogQ2hlY2sgd2hldGhlciBwYWdlIGRv
ZXMgbm90IGhhdmUgZXh0cmEgcmVmcyBiZWZvcmUgd2UgZG8gbW9yZSB3b3JrICovCisJZXhwZWN0
ZWRfY291bnQgPSBmb2xpb19leHBlY3RlZF9yZWZzKG1hcHBpbmcsIHNyYyk7CisJaWYgKGZvbGlv
X3JlZl9jb3VudChzcmMpICE9IGV4cGVjdGVkX2NvdW50KQorCQlyZXR1cm4gLUVBR0FJTjsKKwly
ZXR1cm4gX19tZXRhcGFnZV9taWdyYXRlX2ZvbGlvKG1hcHBpbmcsIGRzdCwgc3JjLCBtb2RlKTsK
K30KKwogc3RhdGljIHZvaWQgbWV0YXBhZ2VfaW52YWxpZGF0ZV9mb2xpbyhzdHJ1Y3QgZm9saW8g
KmZvbGlvLCBzaXplX3Qgb2Zmc2V0LAogCQkJCSAgICBzaXplX3QgbGVuZ3RoKQogewpAQCAtNTcw
LDYgKzY2Myw3IEBAIGNvbnN0IHN0cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgamZzX21l
dGFwYWdlX2FvcHMgPSB7CiAJLnJlbGVhc2VfZm9saW8JPSBtZXRhcGFnZV9yZWxlYXNlX2ZvbGlv
LAogCS5pbnZhbGlkYXRlX2ZvbGlvID0gbWV0YXBhZ2VfaW52YWxpZGF0ZV9mb2xpbywKIAkuZGly
dHlfZm9saW8JPSBmaWxlbWFwX2RpcnR5X2ZvbGlvLAorCS5taWdyYXRlX2ZvbGlvCT0gbWV0YXBh
Z2VfbWlncmF0ZV9mb2xpbywKIH07CiAKIHN0cnVjdCBtZXRhcGFnZSAqX19nZXRfbWV0YXBhZ2Uo
c3RydWN0IGlub2RlICppbm9kZSwgdW5zaWduZWQgbG9uZyBsYmxvY2ssCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L21pZ3JhdGUuaCBiL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCmluZGV4IGFh
YTIxMTQ0OThkNi4uY2IzMWM1YjFlYjZhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21pZ3Jh
dGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaApAQCAtNjAsNiArNjAsNyBAQCBzdHJ1
Y3QgbW92YWJsZV9vcGVyYXRpb25zIHsKIC8qIERlZmluZWQgaW4gbW0vZGVidWcuYzogKi8KIGV4
dGVybiBjb25zdCBjaGFyICptaWdyYXRlX3JlYXNvbl9uYW1lc1tNUl9UWVBFU107CiAKK2ludCBm
b2xpb19leHBlY3RlZF9yZWZzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLCBzdHJ1Y3Qg
Zm9saW8gKmZvbGlvKTsKICNpZmRlZiBDT05GSUdfTUlHUkFUSU9OCiAKIHZvaWQgcHV0YmFja19t
b3ZhYmxlX3BhZ2VzKHN0cnVjdCBsaXN0X2hlYWQgKmwpOwpkaWZmIC0tZ2l0IGEvbW0vbWlncmF0
ZS5jIGIvbW0vbWlncmF0ZS5jCmluZGV4IDZlMjQ4OGU1ZGJlNC4uMGYwMWI4YTg3ZGVjIDEwMDY0
NAotLS0gYS9tbS9taWdyYXRlLmMKKysrIGIvbW0vbWlncmF0ZS5jCkBAIC00NDUsNyArNDQ1LDcg
QEAgdm9pZCBwbWRfbWlncmF0aW9uX2VudHJ5X3dhaXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBt
ZF90ICpwbWQpCiB9CiAjZW5kaWYKIAotc3RhdGljIGludCBmb2xpb19leHBlY3RlZF9yZWZzKHN0
cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nLAoraW50IGZvbGlvX2V4cGVjdGVkX3JlZnMoc3Ry
dWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCiAJCXN0cnVjdCBmb2xpbyAqZm9saW8pCiB7CiAJ
aW50IHJlZnMgPSAxOwpAQCAtNDU4LDYgKzQ1OCw3IEBAIHN0YXRpYyBpbnQgZm9saW9fZXhwZWN0
ZWRfcmVmcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKIAogCXJldHVybiByZWZzOwog
fQorRVhQT1JUX1NZTUJPTF9HUEwoZm9saW9fZXhwZWN0ZWRfcmVmcyk7CiAKIC8qCiAgKiBSZXBs
YWNlIHRoZSBmb2xpbyBpbiB0aGUgbWFwcGluZy4KLS0gCjIuMzQuMQoK

--------------THGHd2BzcuMsi2RtFkv0mWFl--
