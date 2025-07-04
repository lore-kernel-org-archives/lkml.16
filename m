Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558492609C6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611109; cv=fail; b=rFXy2SVhrjCBSGY90rjsePFTo/knu10/rQ4SciMJTTRe8o8Z4TrSfgOgVTK+mAQTrkPSkjtxU1Im48JhdF9xHSYsdbObn0dDBQTh7HbHGIc37y36hi1MGPWPzwjuQgpGL6xmZffp2bBVN/rj7QHHQeXREi9hEYCGrtIRqh50pzs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611109; c=relaxed/simple;
	bh=6MBsUyNHhUK6VXwS6e8C+/gPjlRgKo9GtZODcGTI4AE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q1qTW/qUdVCpLsu7vHScAyVtXrKhX2lFnLEEXOGmb8gXSlGZmk5OGHUcniRrJvTHd6aqCLhYgO95gTkgkNWhJB0n8ZofLvbZCZ6aaVQQj9xKWWIyJr4go4RFVKSOiip9tNhz+wcd8jkSh8zfXPI/Mh1MpCnNM/eFqtkWtnwwAas=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F93xExoi; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F93xExoi; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F93xExoi";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F93xExoi"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vrys8SA3ssYKHWwglyd7O6VNzcpHGnYYI3RVJQ+xXNIYdPU5i2omJEuEy2xcU5XxWQwxKoUiz8zcyaFjr0YYaIrQjAL4L5H7TbOyd0upf/4KykcGhmg6G3ontkvFOcd0Twl1QAyraOoEpuN2Ef2n+BBNzXqiPhsgK7Sre6A/9AGZsXEbz+9mkH+gm3O2cU+kleX83TjFS+Uhi1qhtyQhloOSSUcNKelDYW27bzm/HXHNIE+GsLrMP9WCN1OBmtYkO9S7VE1P+SHrMazLTusKDcL+/wi16coCaT3tug6r0nR90QVxpNqf0wNiDD1ZCgouUbyoagjPB0SqCbAgADeYgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7K3lVuNilo0UQyAaqe8g0wsFZhpzfE/xjj4rswuSQM=;
 b=VQjGK+PwU8Kcpb1cP7ZuuWIkbv77gP2NyMutsYh+aH+wQsy8GRSVBJImjtnXdlW1lL1U/3H+ewsJa7c8GpSnu1iyYM7fP0IhFe2crs7ATfi8pv1UpV+i33VY4YyjE91Ez8FGT5nmGbvL+HrNjwPeGTOUR87zhwzMDpBW0+OhE9XWLX12Djdxx3b3Ul6/bPwi+D1dpvlVgCKGsc2slMoYCyFx7OLCnwQEbmltFodDL5Oap6K9F0YVwsKTUkbeLJ1qby445niBL/yhGhMnut2a9GmqOM+gbBawbcjAWTtrvP3NxP7N0mYPPJSFkK765EzdD6m5EtODjlRotBeEYAk3hA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7K3lVuNilo0UQyAaqe8g0wsFZhpzfE/xjj4rswuSQM=;
 b=F93xExoixAbgOdu+Cd7HQy8WOPW25FOw1F5X2GBEDGPiQnRbwG2vt9wG1jg5al5qSV5/LObfikbOHk8XkU6NabRVUvIxA5drJxlD6mUqVh0ccrhH91K3aAYtC5vCUjwfo8lVVzKS6ClPTFhR6f5XMKN86/eT3y+7G7YzIUU74CE=
Received: from AS9PR04CA0097.eurprd04.prod.outlook.com (2603:10a6:20b:50e::28)
 by AM8PR08MB6593.eurprd08.prod.outlook.com (2603:10a6:20b:364::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 06:38:22 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e:cafe::3f) by AS9PR04CA0097.outlook.office365.com
 (2603:10a6:20b:50e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 06:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Fri, 4 Jul 2025 06:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmOcIscA7P7uvyzWmHz5W+6O1PC0sK2shfTSSWZBX301CjWW0YE6hwI3APopugsDlYL8jgRv0+gbjh/KBvNK2nkb1Ow91jjER0juverRmKZcsC65wHobJgmvr2CK9Vq8vEOeUwjSG8fZ2b4ejf0NB90dn8XlqH2jYRHhckof+xiihI6/9rjFSM+fphYgYb8+LUG1gOz1W+sgZINssQq419zN8bZtEFX2i/b/zObL2aB1ejP18IZvK7T7TBGtgYCSU5d3yeQJXNxqQMI8NvGrgeStGq+IMairhlMqd2/0AoHUdvNyM1ZKK8Dl+F1axNKslMhqq+Wk8Yxb+n6Mj6SNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7K3lVuNilo0UQyAaqe8g0wsFZhpzfE/xjj4rswuSQM=;
 b=LYtTmLhHc0KasIy+GvYrJGvdSjM2aWcU9mae1Rvxf1L8314vKb1eR5lkZ1jCj3HwqTp9rjyjxCndLxlpsRqm8bEm+ZCY1H8Rj/8aB1OYBq2aNsGcEN8/XIVQCJBfcBIFMtxzIzxIBtGevqPgtoV3HWePs2TQs+plFW64Zlz1T+h61WhddhdNxwW4udJKn9JeG0EMpjbvW6137kS+QoB4WnwZlEjlccU70pZqUMd+89hlhD0cSMN2yDnwvtbJa4uEIC5ZB9wRq/Obimf64p5lSWYZFhjw/xi8v7yzJc9/Kywrmf4300alW9Q8euDLJr6iU4f4e6BODnbgGx1R+VTu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7K3lVuNilo0UQyAaqe8g0wsFZhpzfE/xjj4rswuSQM=;
 b=F93xExoixAbgOdu+Cd7HQy8WOPW25FOw1F5X2GBEDGPiQnRbwG2vt9wG1jg5al5qSV5/LObfikbOHk8XkU6NabRVUvIxA5drJxlD6mUqVh0ccrhH91K3aAYtC5vCUjwfo8lVVzKS6ClPTFhR6f5XMKN86/eT3y+7G7YzIUU74CE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GVXPR08MB7870.eurprd08.prod.outlook.com (2603:10a6:150::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Fri, 4 Jul 2025 06:37:45 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 06:37:44 +0000
Message-ID: <1d6ece48-cd92-42c8-95ee-c77f5967535a@arm.com>
Date: Fri, 4 Jul 2025 12:07:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: quic_zhenhuah@quicinc.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250626052524.332-1-dev.jain@arm.com>
 <4e76b35e-8afb-469a-9e61-fa8e0f344859@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4e76b35e-8afb-469a-9e61-fa8e0f344859@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::23) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GVXPR08MB7870:EE_|AM3PEPF00009B9C:EE_|AM8PR08MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9247cb-eb02-4a73-211a-08ddbac55e40
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RlJRWHIyMmR4M2xBWWRyekRQZlVYTmdwdzhsd0l4bll1UGdXMUQweEZhNVhD?=
 =?utf-8?B?KzRrdC9yTkJ6YVpnaStiNmhYY0dwdDVscS9obTVSYktTKzJ6YWhjTDZEYnEw?=
 =?utf-8?B?bU1JaERWTXdRYmNkV24wUmVaN08yMGVjOVA0cWZ0VExobVBGMVdFTm8wU0Vm?=
 =?utf-8?B?VVovZjZEOE10R1hybXV6KzZtem9qNmtOYkZJMG4xNlRTRndWWDZxd05WNSsx?=
 =?utf-8?B?RlJuMWozc2NEbFcrSGp5MXlMM1VrVXQ1Zk90Z3llYldnWGt2SmtwQ2p4cGhs?=
 =?utf-8?B?T2pmd2JhUGZLV2d2R3pzd0FkSjY0d1ZSbXB4MTZRNjJtOENVZTFyNFBDb2tm?=
 =?utf-8?B?YSt3UWFBRGFscEEwRFFHQTZISzJPRjBjMUhMbVhPT3hCTmJublMvcFB6dTll?=
 =?utf-8?B?M2NsZFRvVWNQZ1l4K1RDSHdSNWxHOEVLZXdxcnRYOVZQNDNTVU9kNzdCSHRG?=
 =?utf-8?B?OEV0YmRaZ1pFdy8rSWhaYmJRSXoyUzkyR1YzZmQ5RGxWd0tnNlZCWFQ3YzJy?=
 =?utf-8?B?UWI5WjVwZjZ1eTJ4TnBzcjl5WUoxMFo1ajJidk5JM1NCdmtyZzlvaFMrYkpB?=
 =?utf-8?B?S3JVNUhiOGsrclNYdTJ6bnRPRVFRRm56ZjJaOHhiSkJNV1JFYyt5TGhsZkxE?=
 =?utf-8?B?Um9vNzE2eFgxc01zK200MjZvR0ZaSEpWWkFKTldhM1RFWlhxZHg5ZEpid3Rx?=
 =?utf-8?B?cklIZGd4TTBhVzl5djVqNnY0b2hMVkRnaENKc3BkMUZIVnJmVFh0Wisza1VG?=
 =?utf-8?B?WVVWckhRQmRiT09WUjBMOWNqRzlRVElrQngwenc2TGdMNU54SStER05RT3RG?=
 =?utf-8?B?Z3pUUE5QYi9FdUFlK0hEWWlLZVg1b1RFQVByQ3JleTFvR3UrYUlpUkQ3ekox?=
 =?utf-8?B?MmVFWVUvdVpFT3NWc2JOSHl6THhVMWFsaVdIbGZMSU9RUTRWbU9GdXJ1WmZ6?=
 =?utf-8?B?MEpjUGQzZmlIYXB2RldPWWFOcWxSZkdXcEJqV1dTNk5ESCtzYmd4OEtHMnhD?=
 =?utf-8?B?RWVTTjg4dTROeXl2YTMvY1lnTHhIYUlOQXhpeHpQMHBPWjhQam5MakdidXNk?=
 =?utf-8?B?eCtmRmM4UTNsOElPWkp1U1FMaFpLTnVBM3FWY0ZEeDhOVVhMVEVDZVBWb1Fz?=
 =?utf-8?B?cHhTR2c4TlUzbXcwODhIc3RSVkpmd0dGODBxREtnTHp1aXVnN1JHQU9TcXkz?=
 =?utf-8?B?OEx3UUtiMFp5cE1KODR5K1M4dDZwOEZ4TGNiVnJMcnZXbXhLY2lUZHNRbUR4?=
 =?utf-8?B?NDR0bm9zMjFGRGxWRXNEMlUvTEtqWEpDK09vNzlaa2R4RkMvUTVOVEUrMFpK?=
 =?utf-8?B?cWY1WVI0YUltbVloSXZpUzBLNURZZzlTVXg5ZzdUQzVxZ2dxWjVDMC95eWpt?=
 =?utf-8?B?VzVOUXhlK0lLc3VQa3RoYkt3aHUzbkV0NTh5M2hoSUFkVlVRaFFGZ2tIaGo1?=
 =?utf-8?B?SXdIY2ZUTlczelYrWnVZMGQ5bkRQQlc5bU5GWTUvSUlPSVRQYXFSemhmdXI4?=
 =?utf-8?B?Q2lVV2lodXdYMEJvdCt2Z3hHU0Z6dFZMV041Q1M2VmJ5QkFWWUpHMy85VGVG?=
 =?utf-8?B?bFd2R01jMEtJZ2dycmxaUGlTNzdQelRhRVRJVnBOVHdCaUNmNllobHpKMzJ1?=
 =?utf-8?B?eEhJQWVDVHVNVFRTNUcxSHozR1JEMHVsSjBjR0hSbVgxMFR6QmhGWW43NWpw?=
 =?utf-8?B?T3J2V2MrRHI4c1ducURSUGp2MVJKSDV2MzhtQmtSa0ZkN25WY2w4ZDdPWjRB?=
 =?utf-8?B?Wjc5eTdSaWZtbkRhalFPdzcrZDBkd1V1V0xOczJmakFwb3lXZVJYMG9HVXlC?=
 =?utf-8?B?OXZycEEvQVhBaVpSRFh4cjk5MjMvTEhpWnRpVFNCTnNDTXlEVUlZOFVDWkxQ?=
 =?utf-8?B?UVBZb2dxMGJ2NkpvMjlHRHJpWktEdkQ4anEvQTdrTDgyM3Q5WHhWdldmazVi?=
 =?utf-8?Q?u1bv/o1ko4E=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7870
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52265eca-85bd-4cf3-06d0-08ddbac54886
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|36860700013|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N291QWppc3BCVk1QYWVyL0swN25sbGYwWFpLNFRhM0o1eEZRRlVIUnYwSlBx?=
 =?utf-8?B?K3I5aUc5WWFXSERPUVpET2Q0NWdneVFlandLRDE1dWN5SEhaSWxpcGYyclFh?=
 =?utf-8?B?SGR3NkpUVzlsUGRGNEUyNExudWZUS0xzdklYUWt2RkFibkdaZS9MbThWMTlt?=
 =?utf-8?B?MDJ1Zm52VC9oaDFLUEZyM3R4d1RjdlBKMEIvV0hDQ3ZKbEtmelB1V2xuWE1G?=
 =?utf-8?B?VHdvMnBldFlpcG8xVkZWYk9GUkdRclU1ZlpJemZBSkdqamRrNjZxZ0hrZUIy?=
 =?utf-8?B?aHhRZVpManJEUlR4VWlMY1gvKzlGT0x1M2dPdU00a3RIbWx6V2dEVmlDQ2tx?=
 =?utf-8?B?TTZLR0Q3eWtzTFphRkFRQ3RtNTg1eko0ckYzalBEcFhEdHVWR1FRNFFuT2w2?=
 =?utf-8?B?bHA0bS9Jejh6cDRmR0xlVWVPNXZUOW5ZZ050T2k1cCsxcGNEdFEwdno1MXUy?=
 =?utf-8?B?WmJsL3dMbVNUbFZUUU1Fb3piUkE4ZmpPdGYzRHJXKzVhczhFYjdENkRNWkgr?=
 =?utf-8?B?VjdQM0djKzVJVFhxZ1FHN0RNcFhDaXNEZXlWRDhVeFJnWkVlREYwbVpSTUpi?=
 =?utf-8?B?Ty9XbldHTjk5VDFkRUlwdVBXK0pJMkNIYVpHWXVmWmxPdVNRYUtlSFptSytz?=
 =?utf-8?B?RUg5UmJqUnZ4ZWQ0UlBVcXBhTk5JUTRLQ1g5SXZ1U1dyNVRlVndlc2JqYmVR?=
 =?utf-8?B?R2pZV1VtTHRhaS9vRC9pNGxZajhxN2VGSGc4bFpJZFo0MmRBUG5SZUUzOFdE?=
 =?utf-8?B?N1RuMGRsUVhoYm9ZZmNLUUNJWXJhT0hvU1ZtRm9NeHlvQVNnSFlNazNVcVF3?=
 =?utf-8?B?ckJzRmV1SFJlSzMxdVZjM0RtSEdiWTlmUGh2Vm1RdzNJVzdhMTdGU2xNbnlh?=
 =?utf-8?B?MS9rY2Fldk4zeHFoSExhQXMvRWUwR2NqVnZBendvSjdvc1prUHpqVWwyV09q?=
 =?utf-8?B?ajNFM1FTNjl6NHJFb2EyT1J0RXc3V0xLWEdMN3JIdnQ4YXdIYllZaHg2b2t6?=
 =?utf-8?B?dGowMzZXMFA1OEkzbjMvcUFBWDMzZkZjSXd1RlBRR3M5N1F6YVg0RWlhTlJU?=
 =?utf-8?B?WjBITmRhakxFV3dDKzlOREcrelJqY1V5ZDNPcnpCUXNQTTZGcG8wZkhrTlRj?=
 =?utf-8?B?SmdhQmhVUkFRcDZSTmZGdjBZYmVySHJ3N3VKbE1OTWJEZDBIazRWSlpkVzhW?=
 =?utf-8?B?Z0JwdDFFODhEWGR2eTY4NnBWeHFZWncrSXhzR3EzQTlKRUlrcVllbDA4T0c4?=
 =?utf-8?B?OEwwcFJvSEs3K3pjamxhYTRWSzg3VkhOUU9yMlI4dHRicDMzeEpIeGo2aGtx?=
 =?utf-8?B?cmRrNkJ0bWJpcVB0SnpneXI3cmZvLzlZalRoYVpPQ29RNUdvc0ZVYVVXTk1q?=
 =?utf-8?B?SkVvRHp1c3FUd25wTllkZ0NnanBwdFlYcTJ1UjRTV0w0OG9XMDYweGtQNXpG?=
 =?utf-8?B?azVYZ2l2SzNTOFRIOWNYSjB3RmJiOEptQ2hxNGc3OTBMMERPRnVkd05HcEly?=
 =?utf-8?B?aWw1U2VDZ3JCOExJZUoydmVCRWZxeC90TDdsalUwQmpkWWUyME5OaTd0Kzdi?=
 =?utf-8?B?WEpTNG92ZDQrZFZmbHc0RDAwK3N0Nmt4ZCs4dTVOOGpDeVE0aGE2RU81dEg1?=
 =?utf-8?B?eU50OTVxREVRUEpnMmJYSlNDci9DeFBQZWRkc0s3TWs0ZXBadE9HVllpOWpT?=
 =?utf-8?B?ZDRIZVF4U25PdXRKT2RDMnlDbFk2TnQwbjViNi9CV3BQTzVKcHE3bkZpekJ0?=
 =?utf-8?B?Z2FKNnoxWHY3Tit6SDdVMGVjWDZQdC9CS3QvOXo1YUdPdHVyT3UrL3lNUTdV?=
 =?utf-8?B?b0ZSeTZjTjUvdFQ3TkZuZi8xSVNJaXhmbjN1SnVBaDJqWGZaV3BjVXE4NUd3?=
 =?utf-8?B?SEU1aG94ZEwwbUQ5TjRONTZiVThLeHpOaGxLc0RaK1JTMnZGQk43Vk84RVdQ?=
 =?utf-8?B?eGRuRlZRSXpTVm5GeTFDSWxPNGJMRzNuVWFOVVBiR3JLRmIxQy9EcDVxdWtT?=
 =?utf-8?B?TTNFKzRuc2lWZzdqdmtlNUxELytwOW9QNHZSdW5GUGo3Zmo4YmVxWTVDSXdw?=
 =?utf-8?Q?GTSABQ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(36860700013)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 06:38:20.8042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9247cb-eb02-4a73-211a-08ddbac55e40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6593


On 04/07/25 11:28 am, Anshuman Khandual wrote:
>
> On 26/06/25 10:55 AM, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
> Please keep this paragraph separate explaining the current scenario. It
> might be worth adding bit more details such CONFIG_PTDUMP_DEBUGFS config
> dependency in vmalloc()'s arch call backs arch_vmap_pud|pmd_supported().
>   > analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> Please keep this paragraph separate explaining what is the benefit of
> enabling ptdump with huge vmalloc() mappings. This will establish the
> required motivation to change the current scenario.
>
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race.
> Different page tables ? OR different areas in same page table i.e init_mm.

Yes different areas, will clear that.

>
>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>> 512 times again via pmd_free_pte_page().
> This talks about subsequent optimization without establishing the base
> solution first.
>   >
>> We implement the locking mechanism using static keys, since the chance
>> of a race is very small. Observe that the synchronization is needed
>> to avoid the following race:
>>
>> CPU1							CPU2
>> 						take reference of PMD table
>> pud_clear()
>> pte_free_kernel()
>> 						walk freed PMD table
>>
>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>
>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>> we are safe. If not, then the patched-in read and write locks help us
>> avoid the race.
>>
>> To implement the mechanism, we need the static key access from mmu.c and
>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>> target in the Makefile, therefore we cannot initialize the key there, as
>> is being done, for example, in the static key implementation of
>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>> the jump_label mechanism. Declare the key there and define the key to false
>> in mmu.c.
> Above write up is convoluted and not very clear. Please rewrite the solution
> description while avoiding too much implementation and code file details that
> can be derived from the patch itself.

Okay.

>
>> No issues were observed with mm-selftests. No issues were observed while
>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>> sysfs in a loop.
> Please provide some more details about test_vmallo.sh which seems to be a
> custom script.

What do you mean by "custom script"? It is part of selftests/mm and explaining
what a selftest is doing in the patch description, when the name makes it pretty
clear (test_vmalloc) seems redundant.

>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> v3->v4:
>>   - Lock-unlock immediately
>>   - Simplify includes
>>
>> v2->v3:
>>   - Use static key mechanism
>>
>> v1->v2:
>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>     the lock 512 times again via pmd_free_pte_page()
>>
>>   arch/arm64/include/asm/ptdump.h |  2 ++
>>   arch/arm64/mm/mmu.c             | 44 ++++++++++++++++++++++++++++++---
>>   arch/arm64/mm/ptdump.c          |  5 +++-
>>   3 files changed, 46 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>> index fded5358641f..5b331f2a7be1 100644
>> --- a/arch/arm64/include/asm/ptdump.h
>> +++ b/arch/arm64/include/asm/ptdump.h
>> @@ -7,6 +7,8 @@
>>   
>>   #include <linux/ptdump.h>
>>   
>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>> +
>>   #ifdef CONFIG_PTDUMP
>>   
>>   #include <linux/mm_types.h>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 00ab1d648db6..9d3be249047c 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -46,6 +46,8 @@
>>   #define NO_CONT_MAPPINGS	BIT(1)
>>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>   
>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>> +ptdump_lock_key sounds too generic even though this locking
> requirement is currently arm64 platform specific. Otherwise
> this might just appear as a locking from the generic ptdump
> Could this be renamed as arm64_ptdump_lock_key instead ?

Sure.

>
>>   enum pgtable_type {
>>   	TABLE_PTE,
>>   	TABLE_PMD,
>> @@ -1267,7 +1269,7 @@ int pmd_clear_huge(pmd_t *pmdp)
>>   	return 1;
>>   }
>>   
>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>   {
> 'lock' argument needs explanation here in a comment.

Sure.

>
>>   	pte_t *table;
>>   	pmd_t pmd;
>> @@ -1279,13 +1281,24 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   		return 1;
>>   	}
>>   
>> +	/* See comment in pud_free_pmd_page for static key logic */
>>   	table = pte_offset_kernel(pmdp, addr);
>>   	pmd_clear(pmdp);
>>   	__flush_tlb_kernel_pgtable(addr);
> Or here ?

I'll do it above the function declaration, the reader then won't
have to look for the comment.

>
>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>> +		mmap_read_lock(&init_mm);
>> +		mmap_read_unlock(&init_mm);
>> +	}
>> +
>>   	pte_free_kernel(NULL, table);
>>   	return 1;
>>   }
>>   
>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +{
>> +	return __pmd_free_pte_page(pmdp, addr, true);
>> +}
>> +
>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   {
>>   	pmd_t *table;
>> @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   	}
>>   
>>   	table = pmd_offset(pudp, addr);
>> +	/*
>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>> +	 *
>> +	 * Static key logic:
>> +	 *
>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>> +	 * execute the if block, then this patches in the read lock, ptdump has
>> +	 * the write lock patched in, therefore ptdump will never read from
>> +	 * a potentially freed PMD table.
>> +	 *
>> +	 * Case 2: If the if block starts executing before ptdump's
>> +	 * static_branch_enable(), then no locking synchronization
>> +	 * will be done. However, pud_clear() + the dsb() in
>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>> +	 * empty PUD. Thus, it will never walk over a potentially freed
>> +	 * PMD table.
>> +	 */
>> +	pud_clear(pudp);
>> +	__flush_tlb_kernel_pgtable(addr);
>> +	if (static_branch_unlikely(&ptdump_lock_key)) {
> 		/* case 1 - ptdump comes first
> 		 *
> 		 * mmap_read_lock() here will wait on mmap_write_lock()
> 	 	 * taken in generic ptdump until it has been released.
> 		 */
>
>> +		mmap_read_lock(&init_mm);
>> +		mmap_read_unlock(&init_mm);
>> +	}
> 	} else {
> 		/* case 2 - pud_free_pmd_page() comes first
> 		 *
> 		 * pud_clear() and __flush_tlb_kernel_pgtable() are
> 		 * sufficient for ptdump to observe an empty PUD.
> 		 */	
> 	}> +

Thanks.

>>   	pmdp = table;
>>   	next = addr;
>>   	end = addr + PUD_SIZE;
>>   	do {
>>   		if (pmd_present(pmdp_get(pmdp)))
>> -			pmd_free_pte_page(pmdp, next);
>> +			__pmd_free_pte_page(pmdp, next, false);
>>   	} while (pmdp++, next += PMD_SIZE, next != end);
>>   
>> -	pud_clear(pudp);
>> -	__flush_tlb_kernel_pgtable(addr);
>>   	pmd_free(NULL, table);
>>   	return 1;
>>   }
>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>> index 421a5de806c6..41c9ea61813b 100644
>> --- a/arch/arm64/mm/ptdump.c
>> +++ b/arch/arm64/mm/ptdump.c
>> @@ -25,7 +25,6 @@
>>   #include <asm/pgtable-hwdef.h>
>>   #include <asm/ptdump.h>
>>   
>> -
> Stray change. Please drop it.

Thanks.

>
>>   #define pt_dump_seq_printf(m, fmt, args...)	\
>>   ({						\
>>   	if (m)					\
>> @@ -311,7 +310,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>>   		}
>>   	};
>>   
>> +	static_branch_enable(&ptdump_lock_key);
>>   	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>> +	static_branch_disable(&ptdump_lock_key);
>>   }
>>   
>>   static void __init ptdump_initialize(void)
>> @@ -353,7 +354,9 @@ bool ptdump_check_wx(void)
>>   		}
>>   	};
>>   
>> +	static_branch_enable(&ptdump_lock_key);
>>   	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>> +	static_branch_disable(&ptdump_lock_key);
>>   
>>   	if (st.wx_pages || st.uxn_pages) {
>>   		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",Although tempting but I guess encapsulating above ptdump_walk_pgd()
> locking sequence inside a new helper arm64_ptdump_walk_pgd() while
> also explaining this locking might be worth ?

Okay.

>
> PUD/PMD vmalloc mappings need to be enabled via these arch callback
> changes via dropping the current CONFIG_PTDUMP_DEBUGFS dependency.
>
> #define arch_vmap_pud_supported arch_vmap_pud_supported
> static inline bool arch_vmap_pud_supported(pgprot_t prot)
> {
> 	return pud_sect_supported()
> }
>
> #define arch_vmap_pmd_supported arch_vmap_pmd_supported
> static inline bool arch_vmap_pmd_supported(pgprot_t prot)
> {
> 	return return.
> }

Thanks for the spot.

