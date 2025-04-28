Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012017.outbound.protection.outlook.com [40.107.75.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC14270575
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850880; cv=fail; b=YzcjIW9gpi7nhVVQJWhUtYSOVVjQ4tfyIRDgYuu8DvbHQF+gEVy6GD6fWrTe6/ldV08evfmKIfBgzpspXGJHuYeFhNfGgy1QZw1sq14u5Sjivn7bodVqKfj+Qk6HxjC55oudyF5NTNnrrfkq0URJb8gS70X7SXYlLZ9xIi/4JGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850880; c=relaxed/simple;
	bh=mkiRUnHWcJqFslWjLs5kuzcTS9wRZJr91ciIZA5uB6E=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:CC:From:Subject; b=iAq2RIjhnwQL7F9tT5vWlLztKPaApZVdWEGMgRGSmIrBYp1q1Rx1S7zyY9etKXnm1lKsYIH/jAEasPLFCA4MkmOAMDO4axlt8Ksu/D2OJsEgd62dEpLhJiaXIgi7vcaapiVgTC1eluyAYl2QscppSlKyn4W9r+h7+AcUjazvmTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=nSj3ASNZ; arc=fail smtp.client-ip=40.107.75.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="nSj3ASNZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx5geQJ42ffbiwoooNLLvdaFyDO6IPxk6+8Yy/kmpdhpm2khYBv5xpvXstcCmgZIAAf6n2WdlOKbLTwnQ5JHoPmbX9lDPCSpowJF3LSf0uKlwf+NnrG3kJPEeY4TjwOqvGyxWaGM5p2sc5LATEmasHEaJXuxJPpKeg+tKI16nXzts633e58pLj3pEkAeEt9Xphk/tko6rjo7lfOqNXintopY+0PyXctanp53vd8Y/FT1qNojbQk11Mfb4msXO/pQnGR5zueoc31fbEVwxMJQRh6UcNgWd5PdnJ5ou3ti0sSzJ2iIZbHJB7GTVxPTsDHIaoTp+3We+6oKaKuMaMIpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSokiTusC1prLc1ff3bb5VGnmL1cndlcSmn5NhveYHE=;
 b=Zpg8IegHfW1E7iW2V4MJgvbtEQ5IbVoOTvS2X/vyWB3GuhqSsLNGTn8B3XqYE7UlzSJ6MrJ96B2roligOZJVQUCTKMaveMKPRYEmKivlKx67tn4Xz0G1+naoj1/W8DTINiVdHgAVAkf7LqvXN0emS/p2T0Z5COBrXcmhlQPkUSeuZhr9U/0wKvpyKch8fHV67FwV1Oj0dHkeAwcM6MHpcgFplFlAhc5kjEUwIUW5+ax9yQmDGCSqsayQ13fdhuF0nC0VTTmJiM1hPDAGNn4POWBnV2FlUT7lntyD7citvZNC2mWsVNB0yh3/DFodnkV9EjVC5z68VtXd/PDPyASLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=oracle.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSokiTusC1prLc1ff3bb5VGnmL1cndlcSmn5NhveYHE=;
 b=nSj3ASNZOLPxLzFO9ze80hlHVWlgDahEeyLMlBUiVpF2tsh03ufMDIj2imwmKqZdMabqxO3v+KK7kFOn4SSOtM+IfCRQdNmaZKWew5ClDJmnNtrGETa6IDvpS6OXO1k9g+yNEAjQivQTHSxB1UhfIsVf3Aj0TTZ8+HWJuWQnGbE=
Received: from SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) by SEZPR02MB7423.apcprd02.prod.outlook.com
 (2603:1096:101:1f9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 14:34:30 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::2f) by SI2PR01CA0010.outlook.office365.com
 (2603:1096:4:191::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 14:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 14:34:29 +0000
Received: from [127.0.0.1] (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Apr
 2025 22:34:06 +0800
Content-Type: multipart/mixed;
	boundary="------------daohaMVnCDdTZFhEkGCoBm5X"
Message-ID: <1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com>
Date: Mon, 28 Apr 2025 22:34:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "surenb@google.com"
	<surenb@google.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: =?UTF-8?B?6buE5pyd6ZizIChaaGFveWFuZyBIdWFuZyk=?=
	<zhaoyang.huang@unisoc.com>, "zhangpeng.00@bytedance.com"
	<zhangpeng.00@bytedance.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Hailong Liu <hailong.liu@oppo.com>
Subject: [bug] [stable-6.6.66] [maple_tree] [mmap] mab_mas_cp+0xb0/0x278
 invalid maple_state for spanning
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|SEZPR02MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 2583e49d-dc68-400d-fbb4-08dd8661c923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXJDdnd3VGxWR2pKOVY1SEk0RWszL3lPL2hiYjJRNWhZTzFxTno5UHF5UzRJ?=
 =?utf-8?B?UTJob2JiMUhEMndHdkxPNVlBVDNpYW9EeTNZazZxcDJadXVVdEMxTUpkUnJO?=
 =?utf-8?B?QlV6ZEVRWmhJR3ltU1cvTW9WbVlkUVUvNTUyZXNtdCs3SUlIcEhJNmpOdzNM?=
 =?utf-8?B?dDVnQ0VHa21zQWNwT1cxdWtRcUlOak1ma0lpVFNpbzNSSk5yejdMckF5VmJT?=
 =?utf-8?B?Rm81Z3dubE5OTlQ0cSsydVFNQkxaYVNDOGxCY3hJeHBiU0ZsWGNNSStPVDNE?=
 =?utf-8?B?UWpoMWh6Y1B6WldlWHdVY0FUU1FDV2pmR0JDTWVmNWt3SlNZNFdjTVRuWi9K?=
 =?utf-8?B?Mk1JbkVpcmx5Tmt2OUVLM3JObTN2eE15ZVJuaWprYlBkZGdsNFVLUTJNWlQv?=
 =?utf-8?B?dzJEOEtvY1ZJQmROSVVSQkhMb3BqSDRVeFhYaGtPbDFhREdCK1o1d1dkejQ4?=
 =?utf-8?B?a21MT01xYUM4R3dQQ3JJTkJPb1owcENwZGFod0VOR0k0Rk1WU2xnMjFiNHVQ?=
 =?utf-8?B?aEJ2SndlYlZGaEhFY0kzaWFnKzgreVNJQzZ1ZjhoeEdjSElCK3ExS1ZlNmdZ?=
 =?utf-8?B?d3h3SHlySGZaTStGN0lUK1V0aEd6ZnRGZXl6UGd4d1p2eTV1Mmw2SjRuNmdL?=
 =?utf-8?B?SGJWZ243UEFhc2tYRDljdWh1UEdjZjNicE9BVFllRnRvdTVXOFJheVNZYWw1?=
 =?utf-8?B?bXNRNXNVbXNiMXdQQXFZa0JvcGVDTFJFMHUxV04yMjNtWmtkS2JZSjJxenFQ?=
 =?utf-8?B?WGxqVTZaNjJPQmdGOVJYS1VzK05WNFZiRGhUak0yeE56dEljSGNTc0wzY3U4?=
 =?utf-8?B?YTh1TUxsWFRxSytLOU1sR0JWZ0wzVkxSYW5VR2hTbEQwV3kvWE5QUGRYd09S?=
 =?utf-8?B?U3NhdjZCZ3dJK1dzYS96MlJIQURJcFdjc1BnSXk0azZ5QmxLN1pNcWViS0xQ?=
 =?utf-8?B?WjVFcjJaZkNteXdrM3Z6NldPUDNIMzdYT0hQMy9QWEl0ZCt1UUh0MURWVjJ5?=
 =?utf-8?B?K2RJLzhGandycGNzTEMrVDRmNVVIZ3ZHdmRPQlpoVGE4c3dadXVKM2pVUjZz?=
 =?utf-8?B?TlJHZUNpZWJpOVlOYkRadXVkcEpFYU1RY0N4Rm1hV09vL0NTZ2Yvek5kRmd6?=
 =?utf-8?B?OGNlZExaYStycStWMFVvam9YS2ZLalVGbiswSDh1RmNlZ3IyRzhGR2NXREQx?=
 =?utf-8?B?UXZTdFNWMXFya1ZScHNuSmlYNFlHUFFBSFovSlJ3bnJlUTRMNWVZN1Bqd3dS?=
 =?utf-8?B?ZWQ1eDJKRGp5YTJ0MWtRaW45VTRxc3paWnpvMUMvOElkY295YUZ3ZHMyUVN2?=
 =?utf-8?B?bWU0U3oxRk5yY0tKdlA0UzJYS0FKRmtuUEduZk9ZM0krUWFpRWg2Sk51Zndz?=
 =?utf-8?B?RDJFRWdlUEJZbWNXQVo2RmhGakZHdnEzRHJCeUFlQzA2T0g4dENvREtuOG1x?=
 =?utf-8?B?WDFDOHU0YzVHcTErbWUxcCtQTk9SMTB5VzdYMmMrVGtoVzA5RE9PUXBMVW96?=
 =?utf-8?B?VFd6bXVWeHZaSUpvbVhZYUdYVjJqTVVQV3dVVVlac3ZJalRwN1ZHSVByU2Rp?=
 =?utf-8?B?OE9WK1dqZExIbFl6NDBpZzBGeTJrQlVqakwxWE03bmk2aGc3MXBaREx2bTFR?=
 =?utf-8?B?UXpNR003VC9TOGU0Qmk2a1RiYnpJQzcrYU9ibGt2N3ovaTQ1NzRzNmdWeGhV?=
 =?utf-8?B?TitjRUs0SzA1NjVFZFVrT0RPc29rUUlTYlpmYVpHbC8zZjExaTVZNzdOeHcy?=
 =?utf-8?B?M0kxa3F6aTZiSFZFZ1E0cHZuQnBCYTZlUWN4cC90MEVqNmU2MU5SNWgvQWQw?=
 =?utf-8?B?RWNIYVdqaXFhWE1kMXZPQUl5aVM3MWZqaENtdzE4TnpNN2lBOTQ4emNkOElq?=
 =?utf-8?B?NWxWUEg4MDhDakV5aVIydFczclRGQXM1M0Q5ZWJzZG1NS25TVDd5NDBGQ1U5?=
 =?utf-8?B?Zk1LR1hMNHJKNHZDOTBZWk8vVnRjQTNJdDJiQmFuazdPaDJBMkV6UlN1V3VJ?=
 =?utf-8?B?UW54NEM3NTE0dzBBNFlCUlRKM3BianhEY2h6VGJqN0dTWURMaG4wMXB1Q3Mv?=
 =?utf-8?B?QlZDNVhOc3Fqb1Q4T1ZKR2svOW85K2hSbmdVQT09?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007)(4053099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:34:29.9985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2583e49d-dc68-400d-fbb4-08dd8661c923
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7423

--------------daohaMVnCDdTZFhEkGCoBm5X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi:

After upgrade to kernel-6.6-y we face a panic on vma_merge()

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 39-bit VAs, pgdp=0000000a381d0000
[0000000000000078] pgd=0800000a381d1003, p4d=0800000a381d1003, pud=0800000a381d1003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Skip md ftrace buffer dump for: 0x1609e0
CPU: 7 PID: 11563 Comm: x Tainted: G        W  OE      6.6.56-android15
Hardware name: Qualcomm Technologies, Inc. Parrot QRD, Alpha-M (DT)
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mab_mas_cp+0xb0/0x278
lr : mas_spanning_rebalance+0x830/0xeb4
sp : ffffffc0b2323410
x29: ffffffc0b2323420 x28: 0000000000000009 x27: 0000000000000001
x26: ffffff804c0ddb0c x25: 0000000000000001 x24: 0000000000000008
x23: 000000000000000c x22: 000000000000000c x21: ffffffc0b23236d0
x20: 0000000000000000 x19: ffffffc0b2323690 x18: ffffffc0ac5a2088
x17: 0000000000000000 x16: ffffff89b7d68d48 x15: ffffff897cfb6898
x14: ffffff89ca568000 x13: ffffff88082e74b0 x12: 0000000000000000
x11: 000000000000000f x10: 0000000000000080 x9 : 000000000000000d
x8 : 000000000000000d x7 : ffffff89d16690c8 x6 : ffffff87b3847bb8
x5 : ffffff804c0ddbe8 x4 : 0000000000000000 x3 : ffffffc0b23234c8
x2 : 0000000000000019 x1 : 000000000000000d x0 : 0000000000000080
Call trace:
 mab_mas_cp+0xb0/0x278
 mas_spanning_rebalance+0x830/0xeb4
 mas_wr_spanning_store+0x8ac/0xa58
 mas_wr_store_entry+0x130/0x180
 mas_store_prealloc+0x98/0x1bc
 vma_iter_store+0x64/0x74
 vma_merge+0x5e4/0x73c
 mmap_region+0x8d8/0xa30
 do_mmap+0x3e0/0x578
 vm_mmap_pgoff+0x1a0/0x1f8
 ksys_mmap_pgoff+0x78/0xf4
 __arm64_sys_mmap+0x34/0x44
 invoke_syscall+0x58/0x114
 el0_svc_common+0x80/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x38/0x68
 el0t_64_sync_handler+0x68/0xbc
 el0t_64_sync+0x1a8/0x1ac

the issue introduced by bdc136e2b05f ("mm: resolve faulty mmap_region() error path behaviour")

the reason is that call vma_iter_prealloc() twice and the maple_state is invalid. I write a reproducer here
by cat /proc/maple_test_merge the patch in attachment(maple_tree_debug.patch).

the reproducer simulates vma mmap at frist. then mmap_region() vma_merge(), 

the code from stable-6.6.y
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/mm/mmap.c?h=linux-6.6.y

the reason show as follows
maple_tree
               parent
    leaf_1(..|c)   leaf_2(d..f|..)

__mmap_region(addr=d)
    1. vma_iter_prealloc()
        mas_state node=leaf_2 alloc=*mt_alloc_one* new_node_a

    2. mmap_file(file, vma)
        the vm_flags changed by some driver (ashmem) https://android.googlesource.com/kernel/msm/+/android-6.0.1_r0.74/drivers/staging/android/ashmem.c#312

vma_merge() (c can merge with d)
    3. vma_prev()
        mas_state node=leaf_1 alloc=new_node_a
    5. vma_iter_config()
        mas_state node=parent alloc=new_node_a
    4. vma_iter_prealloc()
        mas_state node=parent alloc=new_node_a
    6. vma_iter_store() --> panic
        use invalid new_node_a for spanning write


IMO, this issue can be fixed by mmap side maybe conflict with the patch. if
fix in maple_tree which need to destory the new_node_a


Brs,
Hailong.
--------------daohaMVnCDdTZFhEkGCoBm5X
Content-Type: text/plain; charset="UTF-8"; name="maple_tree_debug.patch"
Content-Disposition: attachment; filename="maple_tree_debug.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCA2ZGYzZTc3OGU3NDku
LmY2ZGQzNjY3NGFiMyAxMDA3NTUKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21tL21tYXAuYwpA
QCAtNDksNiArNDksNyBAQAogI2luY2x1ZGUgPGxpbnV4L29vbS5oPgogI2luY2x1ZGUgPGxp
bnV4L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8bGludXgva3NtLmg+CisjaW5jbHVkZSA8bGlu
dXgvcHJvY19mcy5oPgogCiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogI2luY2x1ZGUg
PGFzbS9jYWNoZWZsdXNoLmg+CkBAIC0zOTU1LDExICszOTU2LDE3MiBAQCBzdGF0aWMgaW50
IHJlc2VydmVfbWVtX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsCiAJcmV0
dXJuIE5PVElGWV9PSzsKIH0KIAorc3RhdGljIHZvaWQgdm1pX2l0ZXJfaW5pdGlhbGl6ZShz
dHJ1Y3Qgdm1hX2l0ZXJhdG9yICp2bWksIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAorCQkJCXVu
c2lnbmVkIGxvbmcgc3RhcnQpCit7CisJc3RydWN0IG1hX3N0YXRlICptYXMgPSAmdm1pLT5t
YXM7CisKKwltZW1zZXQodm1pLCAwLCBzaXplb2YoKnZtaSkpOworCW1hcy0+dHJlZSA9ICZt
bS0+bW1fbXQ7CisJbWFzLT5pbmRleCA9IHN0YXJ0OworCW1hcy0+bm9kZSA9IE1BU19TVEFS
VDsKK30KKworc3RhdGljIHZvaWQgZHVtcF9tdF92bWEoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCit7CisJcHJfaW5mbygiW1ZNQV06IFsweCUxMGx4LTB4JTEwbHhdXG4iLCB2bWEt
PnZtX3N0YXJ0LCB2bWEtPnZtX2VuZCk7Cit9CisKK3N0cnVjdCBzbmFwc2hvdF92bWEgewor
CXVuc2lnbmVkIGxvbmcgdm1fc3RhcnQsIHZtX2VuZCwgZW50cnk7Cit9OworCitzdHJ1Y3Qg
c25hcHNob3Rfdm1hIHNuYXBzaG90X3ZtYXNbXSA9IHsKKwl7IDB4MDAwMDAwMDAwMCwgMHgw
MDAwZmZmZmZmLCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4MDAwMTAwMDAwMCwgMHgw
MDAxMDAwZmZmLCAweGZmZmZmZjgwMDhjMzVjODAgfSwKKwl7IDB4MDAwMTAwMTAwMCwgMHgw
MDAxMDAxZmZmLCAweGZmZmZmZjgwMDhjMzU0YjAgfSwKKwl7IDB4MDAwMTAwMjAwMCwgMHgw
MDAxMDAyZmZmLCAweGZmZmZmZjgwMGExN2QzZTggfSwKKwl7IDB4MDAwMTAwMzAwMCwgMHgw
MDAxMDAzZmZmLCAweGZmZmZmZjgwMGExN2Q4OTggfSwKKwl7IDB4MDAwMTAwNDAwMCwgMHgw
MDAxMDA0ZmZmLCAweGZmZmZmZjgwMGExN2RhZjAgfSwKKwl7IDB4MDAwMTAwNTAwMCwgMHgw
MDAxMDA1ZmZmLCAweGZmZmZmZjgwMGExN2Q3MDggfSwKKwl7IDB4MDAwMTAwNjAwMCwgMHgw
MDAxMDA2ZmZmLCAweGZmZmZmZjgwMGExN2Q3ZDAgfSwKKwl7IDB4MDAwMTAwNzAwMCwgMHgw
MDAxMDA3ZmZmLCAweGZmZmZmZjgwMGExN2QzMjAgfSwKKwl7IDB4MDAwMTAwODAwMCwgMHgw
MDAxMDA4ZmZmLCAweGZmZmZmZjgwMGExN2Q1NzggfSwKKwl7IDB4MDAwMTAwOTAwMCwgMHgw
MDAxMDA5ZmZmLCAweGZmZmZmZjgwMGExN2QyNTggfSwKKwl7IDB4MDAwMTAwYTAwMCwgMHgw
MDAxMDBhZmZmLCAweGZmZmZmZjgwMGExN2RlMTAgfSwKKwl7IDB4MDAwMTAwYjAwMCwgMHgw
MDAxMDBiZmZmLCAweGZmZmZmZjgwMGExN2RiYjggfSwKKwl7IDB4MDAwMTAwYzAwMCwgMHgw
MDAxMDBjZmZmLCAweGZmZmZmZjgwMGExN2QxOTAgfSwKKwkvKiBtZXJnZV9wcmV2IGluZGV4
IDE1ICovCisJeyAweDAwMDEwMGQwMDAsIDB4MDAwMTAwZGZmZiwgMHhmZmZmZmY4MDBhMTdk
ZWQ4IH0sCisJLyogaW5kZXggMTYgKi8KKwl7IDB4MDAwMTAwZTAwMCwgMHg1NTgwYTJmZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4NTU4MGEzMDAwMCwgMHg1NTgwYTMwZmZm
LCAweGZmZmZmZjgwMDhjMzUzZTggfSwKKwl7IDB4NTU4MGEzMTAwMCwgMHg1NTgwYTRlZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4NTU4MGE0ZjAwMCwgMHg1NTgwYTRmZmZm
LCAweGZmZmZmZjgwMDhjMzUwYzggfSwKKwl7IDB4NTU4MGE1MDAwMCwgMHg1NTgwYTUwZmZm
LCAweGZmZmZmZjgwMDhjMzVlZDggfSwKKwl7IDB4NTU4MGE1MTAwMCwgMHg1NTgwYzRhZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4NTU4MGM0YjAwMCwgMHg1NTgwYzZiZmZm
LCAweGZmZmZmZjgwMDhjMzU3MDggfSwKKwl7IDB4NTU4MGM2YzAwMCwgMHg3Zjg4MGNmZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODBkMDAwMCwgMHg3Zjg4MjU3ZmZm
LCAweGZmZmZmZjgwMDhkODAwMDAgfSwKKwl7IDB4N2Y4ODI1ODAwMCwgMHg3Zjg4MjZiZmZm
LCAweGZmZmZmZjgwMDhkODA3ZDAgfSwKKwl7IDB4N2Y4ODI2YzAwMCwgMHg3Zjg4MjZmZmZm
LCAweGZmZmZmZjgwMDhjOTA0YjAgfSwKKwl7IDB4N2Y4ODI3MDAwMCwgMHg3Zjg4MjcxZmZm
LCAweGZmZmZmZjgwMDhjOTBiYjggfSwKKwl7IDB4N2Y4ODI3MjAwMCwgMHg3Zjg4MjdlZmZm
LCAweGZmZmZmZjgwMDhjOTA1NzggfSwKKwl7IDB4N2Y4ODI3ZjAwMCwgMHg3Zjg4MjdmZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODI4MDAwMCwgMHg3Zjg4MjkzZmZm
LCAweGZmZmZmZjgwMDhjNGFhMjggfSwKKwl7IDB4N2Y4ODI5NDAwMCwgMHg3Zjg4MmFlZmZm
LCAweGZmZmZmZjgwMDhjNGE0YjAgfSwKKwl7IDB4N2Y4ODJhZjAwMCwgMHg3Zjg4MmFmZmZm
LCAweGZmZmZmZjgwMDhjMzVhMjggfSwKKwl7IDB4N2Y4ODJiMDAwMCwgMHg3Zjg4MmIwZmZm
LCAweGZmZmZmZjgwMDhjOTAzZTggfSwKKwl7IDB4N2Y4ODJiMTAwMCwgMHg3Zjg4MmJmZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODJjMDAwMCwgMHg3Zjg4MzNmZmZm
LCAweGZmZmZmZjgwMDhjMzVkNDggfSwKKwl7IDB4N2Y4ODM0MDAwMCwgMHg3Zjg4MzRlZmZm
LCAweGZmZmZmZjgwMDhjMzUwMDAgfSwKKwl7IDB4N2Y4ODM0ZjAwMCwgMHg3Zjg4MzRmZmZm
LCAweGZmZmZmZjgwMDhjMzU2NDAgfSwKKwl7IDB4N2Y4ODM1MDAwMCwgMHg3Zjg4MzUwZmZm
LCAweGZmZmZmZjgwMDhjOTA3ZDAgfSwKKwl7IDB4N2Y4ODM1MTAwMCwgMHg3Zjg4MzVmZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODM2MDAwMCwgMHg3Zjg4NTVhZmZm
LCAweGZmZmZmZjgwMDhjMzVhZjAgfSwKKwl7IDB4N2Y4ODU1YjAwMCwgMHg3Zjg4NTY0ZmZm
LCAweGZmZmZmZjgwMDhjMzUzMjAgfSwKKwl7IDB4N2Y4ODU2NTAwMCwgMHg3Zjg4NTZmZmZm
LCAweGZmZmZmZjgwMDhjMzUxOTAgfSwKKwl7IDB4N2Y4ODU3MDAwMCwgMHg3Zjg4NTcyZmZm
LCAweGZmZmZmZjgwMDhjOTA3MDggfSwKKwl7IDB4N2Y4ODU3MzAwMCwgMHg3Zjg4NTc1ZmZm
LCAweGZmZmZmZjgwMDhjMzU3ZDAgfSwKKwl7IDB4N2Y4ODU3NjAwMCwgMHg3Zjg4NTg0ZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODU4NTAwMCwgMHg3Zjg4NWFiZmZm
LCAweGZmZmZmZjgwMDhjMzViYjggfSwKKwl7IDB4N2Y4ODVhYzAwMCwgMHg3Zjg4NWIzZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODViNDAwMCwgMHg3Zjg4NWI3ZmZm
LCAweGZmZmZmZjgwMDhjOTBkNDggfSwKKwl7IDB4N2Y4ODViODAwMCwgMHg3Zjg4NWJkZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2Y4ODViZTAwMCwgMHg3Zjg4NWJmZmZm
LCAweGZmZmZmZjgwMDhjMzUyNTggfSwKKwl7IDB4N2Y4ODVjMDAwMCwgMHg3Zjg4NWMxZmZm
LCAweGZmZmZmZjgwMDhjMzU1NzggfSwKKwl7IDB4N2Y4ODVjMjAwMCwgMHg3Zjg4NWMyZmZm
LCAweGZmZmZmZjgwMDhjMzU4OTggfSwKKwl7IDB4N2Y4ODVjMzAwMCwgMHg3Zjg4NWM0ZmZm
LCAweGZmZmZmZjgwMDhjMzVlMTAgfSwKKwl7IDB4N2Y4ODVjNTAwMCwgMHg3Zjg4NWM2ZmZm
LCAweGZmZmZmZjgwMDhjMzU5NjAgfSwKKwl7IDB4N2Y4ODVjNzAwMCwgMHg3ZmRhMzJiZmZm
LCAweDAwMDAwMDAwMDAwMDAwMDAgfSwKKwl7IDB4N2ZkYTMyYzAwMCwgMHg3ZmRhMzRjZmZm
LCAweGZmZmZmZjgwMDk0MGRjODAgfSwKKwl7IDB4N2ZkYTM0ZDAwMCwgMHhmZmZmZmZmZmZm
ZmZmZiwgMDAwMDAwMDAwMDAwMDAwMCB9LAorfTsKKworI2RlZmluZSBNRVJHRV9JTlggKDE1
KQorc3RhdGljIGludCBtYXBsZV90ZXN0X21lcmdlX3Byb2Nfc2hvdyhzdHJ1Y3Qgc2VxX2Zp
bGUgKm0sIHZvaWQgKnYpCit7CisJc3RydWN0IHZtYV9pdGVyYXRvciB2bWk7CisJc3RydWN0
IG1tX3N0cnVjdCAqbW07CisJc3RydWN0IHNuYXBzaG90X3ZtYSAqc25hcHNob3Rfdm1hOwor
CXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hcywgKnZtYSwgKnByZXZfdm1hOworCWludCBz
bmFwc2hvdF9sZW4gPSBBUlJBWV9TSVpFKHNuYXBzaG90X3ZtYXMpOworCWludCBpOworCisJ
bW0gPSBrbWFsbG9jKHNpemVvZigqbW0pLCBHRlBfS0VSTkVMIHwgX19HRlBfTk9GQUlMKTsK
Kwl2bWFzID0ga21hbGxvY19hcnJheShzbmFwc2hvdF9sZW4sIHNpemVvZihzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QpLAorCQkJICAgICBHRlBfS0VSTkVMIHwgX19HRlBfTk9GQUlMKTsKKwlC
VUdfT04oIW1tIHx8ICF2bWFzKTsKKwltdF9pbml0X2ZsYWdzKCZtbS0+bW1fbXQsIE1NX01U
X0ZMQUdTKTsKKworCWZvciAoaSA9IDA7IGkgPCBzbmFwc2hvdF9sZW47IGkrKykgeworCQlz
bmFwc2hvdF92bWEgPSBzbmFwc2hvdF92bWFzICsgaTsKKwkJdm1hID0gdm1hcyArIGk7CisJ
CS8qIGdhcCAqLworCQlpZiAoIXNuYXBzaG90X3ZtYS0+ZW50cnkpCisJCQljb250aW51ZTsK
KworCQl2bWEtPnZtX3N0YXJ0ID0gc25hcHNob3Rfdm1hLT52bV9zdGFydDsKKwkJdm1hLT52
bV9lbmQgPSBzbmFwc2hvdF92bWEtPnZtX2VuZCArIDE7CisKKwkJLyogbW1hX3JlZ2lvbiAq
LworCQl2bWlfaXRlcl9pbml0aWFsaXplKCZ2bWksIG1tLCB2bWEtPnZtX3N0YXJ0KTsKKwkJ
dm1hX2l0ZXJfY29uZmlnKCZ2bWksIHZtYS0+dm1fc3RhcnQsIHZtYS0+dm1fZW5kKTsKKwkJ
aWYgKHZtYV9pdGVyX3ByZWFsbG9jKCZ2bWksIHZtYSkpCisJCQlCVUdfT04odHJ1ZSk7CisJ
CXZtYV9pdGVyX3N0b3JlKCZ2bWksIHZtYSk7CisJfQorCisJLyoKKwkgKiAxLiBtb2NrIF9f
bW1hcF9yZWdpb24oKQorCSAqIHRoZSBuZXdfdm1hOiBbMHgxMDBlMDAwLTB4MTAwZjAwMF0K
KwkgKi8KKwlzbmFwc2hvdF92bWEgPSBzbmFwc2hvdF92bWFzICsgTUVSR0VfSU5YOworCXZt
YS0+dm1fc3RhcnQgPSBzbmFwc2hvdF92bWEtPnZtX3N0YXJ0OworCXZtYS0+dm1fZW5kID0g
c25hcHNob3Rfdm1hLT52bV9zdGFydCArIDB4MTAwMDsKKwlkdW1wX210X3ZtYSh2bWEpOwor
CXZtaV9pdGVyX2luaXRpYWxpemUoJnZtaSwgbW0sIHZtYS0+dm1fc3RhcnQpOworCXZtYV9p
dGVyX2NvbmZpZygmdm1pLCB2bWEtPnZtX3N0YXJ0LCB2bWEtPnZtX2VuZCk7CisKKwkvKgor
CSAqIDIuIG1vY2sgdm1hX2l0ZXJfcHJlYWxsb2MoKQorCSAqIGluIF9fbW1hcF9yZWdpb24o
KQorCSAqLworCWlmICh2bWFfaXRlcl9wcmVhbGxvYygmdm1pLCB2bWEpKQorCQlCVUdfT04o
dHJ1ZSk7CisKKwkvKgorCSAqIDMuIG1vY2sgdm1hX21lcmdlKCkKKwkgKiB0aGUgbmV3X3Zt
YSBjYW4gYmUgbWVyZ2VkIHdpdGggcHJldl92bWEgWzB4MTAwZDAwMC0weDEwMGUwMDBdCisJ
ICovCisJcHJldl92bWEgPSB2bWFfcHJldigmdm1pKTsKKwlwcmV2X3ZtYS0+dm1fZW5kID0g
dm1hLT52bV9lbmQ7CisJZHVtcF9tdF92bWEocHJldl92bWEpOworCXZtYV9pdGVyX2NvbmZp
Zygmdm1pLCBwcmV2X3ZtYS0+dm1fc3RhcnQsIHByZXZfdm1hLT52bV9lbmQpOworCisJLyoK
KwkgKiA0LiBtb2NrIHZtYV9pdGVyX3ByZWFsbG9jKCkKKwkgKiBpbiB2bWFfbWVyZ2UoKTsK
KwkgKi8KKwlpZiAodm1hX2l0ZXJfcHJlYWxsb2MoJnZtaSwgcHJldl92bWEpKQorCQlCVUdf
T04odHJ1ZSk7CisKKwkvKgorCSAqIDUuIHBhbmljIGhlcmUKKwkgKi8KKwl2bWFfaXRlcl9z
dG9yZSgmdm1pLCBwcmV2X3ZtYSk7CisJX19tdF9kZXN0cm95KCZtbS0+bW1fbXQpOworCWtm
cmVlKG1tKTsKKwlrZnJlZSh2bWFzKTsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBf
X21lbWluaXQgaW5pdF9yZXNlcnZlX25vdGlmaWVyKHZvaWQpCiB7CiAJaWYgKGhvdHBsdWdf
bWVtb3J5X25vdGlmaWVyKHJlc2VydmVfbWVtX25vdGlmaWVyLCBERUZBVUxUX0NBTExCQUNL
X1BSSSkpCiAJCXByX2VycigiRmFpbGVkIHJlZ2lzdGVyaW5nIG1lbW9yeSBhZGQvcmVtb3Zl
IG5vdGlmaWVyIGZvciBhZG1pbiByZXNlcnZlXG4iKTsKIAorCXByb2NfY3JlYXRlX3Npbmds
ZSgibWFwbGVfdGVzdF9tZXJnZSIsIDAsIE5VTEwsIG1hcGxlX3Rlc3RfbWVyZ2VfcHJvY19z
aG93KTsKIAlyZXR1cm4gMDsKIH0KIHN1YnN5c19pbml0Y2FsbChpbml0X3Jlc2VydmVfbm90
aWZpZXIpOwo=

--------------daohaMVnCDdTZFhEkGCoBm5X--
