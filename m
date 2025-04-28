Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013005.outbound.protection.outlook.com [52.101.127.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0947A289343
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868390; cv=fail; b=XVyKdM5e91dr6OpdiBlH0f8ylABpNME/QNJ15F+DeDKXEl8ghzv7f7uyPxBatJtjHwRXKD4CgFRX/rhrFGbuilZmqut2P0dXyFwR4hlotwpJou/yks9cqqbZQAW05eOp3uU5QUDyDqToEO+zS4aEohTwXRRAkSGOTMzvDx7f3OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868390; c=relaxed/simple;
	bh=aX+zMCWTHIqVaf9lUW02BPqKJir0wUfSl0zOl30ATjs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN0KU0KL1N5XLZCeMb6HcWpRlLPHjDTDF+iTTu5JuWrALQGOV0S9iAa7pNKNbH8BCbMwbfXDcbWs8HOQfc/2YDYyndG55Wa2MKfNwkfC5jglcZWTpl9EN33sZ1fIjsF6YU21IiTxmh4Sx2/EDtHpxNmr2VKgOcaoFtt+May+yBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=a2U9RL2M; arc=fail smtp.client-ip=52.101.127.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="a2U9RL2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhLihS9U++Vuxz3Z3AdNOOIgGagFMQgaWZbuJMhi+jpZN5DatELhcxQtBqQmLEJcatHwVHRaAnXxf5TgcDDL5HgFgIweQH8T8GFOxWn4a24BgNkLppfAj21hc6KpvC/9Oudt1Njd+BkJDw5kJ4jENaSUZ+sQE8OZLWITaaYdQP7zISJsV5shaC0gtkdmNFJ5mOYY9GImWUq5pgSFhicdw71EPPBe0NJTBcFHUsoNMepgU5CrUE1uegh67GJ6yFsDEwHyvkelbyKf2qKNO8UJ3M808bI1ZqBtped12anhdayNxOY1GcQVgCD006A1a07rIbxK296wUXP4ce0prz/0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQWn1q+ibVqmnnFXwiM5TWqdHov0/rwC04dFoAWr9j8=;
 b=tiZFL7Je76pOpfa9AarZE1sKN7N+ZqljJeVFy9ngMQ183NX5Vu+6t140VRUJwtet/9bl8833Vs+WG7LndwAYBRmBw6jWPTpFl3V1VrXpBaxBpEFSs3LMwZAb/2gAhkucI9YFqOzncSRVVXc5K+rAjtEg0m/1mcNLjuT9jdJmCiwdpI7q9u2dJ3nJAm1vuPSI4tr3aQ9xfoWQBEhKhJ3adW1zJl/L0C6muaE9Wpps3bnv4UYfQ4VIson/OvW5Wh6/R3/jn8EvWaE6LG2rUYNya7f/8oYS1FoA4vjYVBi4kXBs4EqF5vSZbwUkkATV02Obfk64DP4o+jEjCd3ZDLaAGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=oracle.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQWn1q+ibVqmnnFXwiM5TWqdHov0/rwC04dFoAWr9j8=;
 b=a2U9RL2MbOIa38aGS1Y9IilqYVN2JD6oul5gKTaO3KNG6y0cXHp9moBPeiDsytnndmlNsiiU7CAE7UoNetxD/x/90Iy89Eabjk4hPQBfEBnFSiglFbGD7EzHCaOgfEcCXYqJ2L8nX71c2oYtwBlJ7L5NlOcR/SZgYiXvkTVUmMc=
Received: from SG2PR02CA0122.apcprd02.prod.outlook.com (2603:1096:4:188::10)
 by TY2PPF21D6777C1.apcprd02.prod.outlook.com (2603:1096:408::98a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.25; Mon, 28 Apr
 2025 19:26:18 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::59) by SG2PR02CA0122.outlook.office365.com
 (2603:1096:4:188::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 19:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 19:26:17 +0000
Received: from oppo.com (172.16.40.118) by mailappw31.adc.com (172.16.56.198)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 03:26:16 +0800
Date: Tue, 29 Apr 2025 03:26:11 +0800
From: Hailong Liu <hailong.liu@oppo.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, "surenb@google.com" <surenb@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	=?utf-8?B?6buE5pyd6ZizIChaaGFveWFuZyBIdWFuZyk=?= <zhaoyang.huang@unisoc.com>,
	"zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [bug] [stable-6.6.66] [maple_tree] [mmap] mab_mas_cp+0xb0/0x278
 invalid maple_state for spanning
Message-ID: <20250428192611.n7ptrzwarch2us3q@oppo.com>
References: <1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com>
 <znbfqcbanvur2et7oy2yakkvjmfsnzvkphc3frohy7jh7hggcq@5e3nvk7hiijc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <znbfqcbanvur2et7oy2yakkvjmfsnzvkphc3frohy7jh7hggcq@5e3nvk7hiijc>
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TY2PPF21D6777C1:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4edf3f-5c6e-4cf7-e5a1-08dd868a8c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NBT457IVR2Pak1eCCixAZ234ZSUKQBbIQYjzXecbia0yogfx0X3JFBr2PI47?=
 =?us-ascii?Q?dz1tUriY5DsL09q3za8pNXxpsqJ6kP5xstfMdbb87wM1lBZj+NuY8kgia5CR?=
 =?us-ascii?Q?vZg9RO6ZVvyJKqrLU4cWDp2pERnJBU1ZBiUoMVmeU6d7g50aseI2Z5YGeLIb?=
 =?us-ascii?Q?LRbgPe97YVynEvlSL/8h7JpMwceOl8QLGs49d4m+CZshAi3vCjbFrFYeXX74?=
 =?us-ascii?Q?ZJblkzetFDW1fTyK5EjwjBnzQfw/M0f1cI0+15QTdEElUeVE2lND4T3x/FCs?=
 =?us-ascii?Q?XhxODrKVutqnZJXQAEaELqBWNskVgKut0f7aTXC6viKSzsfdH7FZ41xFIJuA?=
 =?us-ascii?Q?y6BGvE2tDZKDk52As73nCfyLsqhLEdeKLKxdtqlryVQ8C6fJkNMKyn7M2L/N?=
 =?us-ascii?Q?PsMamMZ5d2oO/RMsDYcqi81PkjwR2KQSPX3NEbrGoPNsEvySmscCHaKEKyC/?=
 =?us-ascii?Q?iayE/tl/1UMOoTBF4I3Rty2VPl11UuiCU4uI4X4xsz96vkAc0knk7RbeMyfm?=
 =?us-ascii?Q?SBldqDijUoeaT+Fi21i8d/zywF+7YRUggchUzzxKrBJuQG8m5j2ML9kuHEW3?=
 =?us-ascii?Q?tWbLc3uN0GCRETw7mhPjSEBd2U5zj+ZbTV3DcgaGNe5mYH12J3pKKMXfZpm2?=
 =?us-ascii?Q?qx1f6G6t3xL7HWZlZ+/VfCUYnovfclvXAPGBRJ4Mlgoh4G0gjITsij/HdbYM?=
 =?us-ascii?Q?9tMzyUBn4brqbiy4nWLaaPKbYmzKBYfsS9794ct2KUs1yjOnwmDgsUqPPwHV?=
 =?us-ascii?Q?zb9KKFCnigV8MjLIP+krKQznUMFr/J+RGmoixUWc+r5dXoUfuKjgbKFjsFtL?=
 =?us-ascii?Q?oZvHn/1giNlIZ+6Dg9FpNa/q3Qbfh/AzuVtI3GPwRucoDNkxS/hEO49/0yf5?=
 =?us-ascii?Q?xT/rxe9r+tX+SqnQeMRhTEfJAQw/rtkhfLuZgujGtzG/zF1cQkMdzMntSB35?=
 =?us-ascii?Q?KlEyIU7noqGq9WfXjogdeotyklKWvSqpwNubR5z+tYAg8J8wogF+o61Wdeon?=
 =?us-ascii?Q?UIMeQvtkf333HmbELRGYcuw4w1o5v0cZWD1OaPckNi7L5IwqbRUR2vAj0S1j?=
 =?us-ascii?Q?Oh4J6Eh7DYx9R3dPru0/SXleKlIhext5LWIhOFY7aor1bROuT7pFQU4mTOH6?=
 =?us-ascii?Q?huJ2bwX9fpWQdI+BXY6XGyzleigq8ASlevcG7w3pRBTWP9T1+bfCjzxByNdM?=
 =?us-ascii?Q?W8hyEVWP1RUs27LA3cEsVxXXbE90eq5Q7EGrhmmRMlEtGbb6xsZjbwPfeEEI?=
 =?us-ascii?Q?gAByGxRrp3OP0yPxQVYptkMPH19J4KTQ9bUPA+OjcrdNs/MGGeOiwx6nHVMN?=
 =?us-ascii?Q?5Oo41Qa5FIWIMY79+8OceIM3zzNd9Jt5wLhAUSEIpdr9XIGGFn3FaIdF0MrZ?=
 =?us-ascii?Q?rShf80RUdlgCmLXk60lXmCNArN6VNIrnwVh7Ex4XOwZtpSI0uj1zQVLHbkUd?=
 =?us-ascii?Q?G9g4/XfXgQnee3xrqgUb674EFi5FIAZLuaLZPmXyxTzSkD0gDDeCyHQ5q0Jr?=
 =?us-ascii?Q?C1pC6pyU9FL5nDW4gvS0v0SJXA8DbYAU+teX?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:26:17.5469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4edf3f-5c6e-4cf7-e5a1-08dd868a8c74
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF21D6777C1

On Mon, 28. Apr 14:12, Liam R. Howlett wrote:
> * Hailong Liu <hailong.liu@oppo.com> [250428 10:34]:
> > Hi:
> >
> > After upgrade to kernel-6.6-y we face a panic on vma_merge()
> >
> > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
>
> Thank you for reporting this issue upstream.
>
> There should also be a warning prior to this issue pointing out that
> there are no nodes left from the preallocation?
>
paste kernel log to help you.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/mm/mmap.c?h=linux-6.6.y#n2800
[   52.301442][  T369] ---> [__mmap_region] [0x000100e000 - 0x000100f000]
[   52.301813][  T369] MAS: tree=ffffff8005718040 enode=ffffff8005a8f90c mas=ffffffc0834bbc58
[   52.301860][  T369] [0] index=100e000 last=100efff
[   52.303009][  T369]      min=100e000 max=7fad2f3fff alloc=ffffff8005a8ef00, depth=1, flags=4

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/mm/mmap.c?h=linux-6.6.y#n1021
[   52.303814][  T369] ---> [vma_merge]
[   52.304097][  T369] MAS: tree=ffffff8005718040 enode=ffffff8005a8fb1c mas=ffffffc0834bbc58
[   52.304140][  T369] [0] index=100d000 last=100efff
[   52.304824][  T369]      min=0 max=ffffffffffffffff alloc=ffffff8005a8ef00, depth=1, flags=4

dump mapletree
[   52.305401][  T369] maple_tree(ffffff8005718040) flags 30B, height 2 root ffffff8005a8fb1e
[   52.305945][  T369] 0x0000000000, 0xffffffffffffffff: node ffffff8005a8fb00 depth 0 type 3 parent ffffff8005718041 contents: 1000000 5574b62000 f000 ffffff8009b8d000 0 0 0 0 0 0 | 03 03| ffffff8005a8e50c 100DFFF ffffff8005a8f90c 7FAD2F3FFF ffffff8005a8ec0c 7FAD601FFF ffffff8005a8f30c FFFFFFFFFFFFFFFF 0000000000000000 0 0000000000000000 0 0000000000000000 0 0000000000000000 0 0000000000000000 0 0000000000000000
[   52.309827][  T369]   0x0000000000, 0x000100dfff: node ffffff8005a8e500 depth 1 type 1 parent ffffff8005a8fb06 contents: slot:ffffff8005a8e580
[   52.311292][  T369] 0000000000000000 FFFFFF ffffff800779ded8 1000FFF ffffff800779daf0 1001FFF ffffff800779d640 1002FFF ffffff800779d258 1003FFF ffffff800956b708 1004FFF ffffff800956baf0 1005FFF ffffff800956b0c8 1006FFF ffffff800a4b6578 1007FFF ffffff80096d33e8 1008FFF ffffff80096d3d48 1009FFF ffffff8004618a28 100AFFF ffffff8004618c80 100BFFF ffffff8004618190 100CFFF ffffff8004618d48 100DFFF 000000000000000e
[   52.313697][  T369]     0x0000000000, 0x0000ffffff: 0000000000000000
[   52.314463][  T369]     0x0001000000, 0x0001000fff: ffffff800779ded8
[   52.314977][  T369]     0x0001001000, 0x0001001fff: ffffff800779daf0
[   52.315386][  T369]     0x0001002000, 0x0001002fff: ffffff800779d640
[   52.315754][  T369]     0x0001003000, 0x0001003fff: ffffff800779d258
[   52.316127][  T369]     0x0001004000, 0x0001004fff: ffffff800956b708
[   52.316539][  T369]     0x0001005000, 0x0001005fff: ffffff800956baf0
[   52.316943][  T369]     0x0001006000, 0x0001006fff: ffffff800956b0c8
[   52.317383][  T369]     0x0001007000, 0x0001007fff: ffffff800a4b6578
[   52.317791][  T369]     0x0001008000, 0x0001008fff: ffffff80096d33e8
[   52.318519][  T369]     0x0001009000, 0x0001009fff: ffffff80096d3d48
[   52.319008][  T369]     0x000100a000, 0x000100afff: ffffff8004618a28
[   52.319406][  T369]     0x000100b000, 0x000100bfff: ffffff8004618c80
[   52.319852][  T369]     0x000100c000, 0x000100cfff: ffffff8004618190
[   52.320245][  T369]     0x000100d000, 0x000100dfff: ffffff8004618d48
[   52.320669][  T369]   0x000100e000, 0x7fad2f3fff: node ffffff8005a8f900 depth 1 type 1 parent ffffff8005a8fb0e contents: slot:ffffff8005a8f980
[   52.321373][  T369] 0000000000000000 5575B6FFFF ffffff80064febb8 5575B70FFF 0000000000000000 5575B8EFFF ffffff80064fe000 5575B8FFFF ffffff800779d898 5575B90FFF 0000000000000000 559AD97FFF ffffff800779d320 559ADB8FFF 0000000000000000 7FAD12FFFF ffffff80096d3ed8 7FAD2B7FFF ffffff80096d30c8 7FAD2CBFFF ffffff800779d190 7FAD2CFFFF ffffff800779d578 7FAD2D1FFF ffffff800779de10 7FAD2DEFFF 0000000000000000 7FAD2DFFFF ffffff80096d3960 7FAD2F3FFF 000000000000000e
[   52.324464][  T369]     0x000100e000, 0x5575b6ffff: 0000000000000000
[   52.324905][  T369]     0x5575b70000, 0x5575b70fff: ffffff80064febb8
[   52.325352][  T369]     0x5575b71000, 0x5575b8efff: 0000000000000000
[   52.325776][  T369]     0x5575b8f000, 0x5575b8ffff: ffffff80064fe000
[   52.326549][  T369]     0x5575b90000, 0x5575b90fff: ffffff800779d898
[   52.327060][  T369]     0x5575b91000, 0x559ad97fff: 0000000000000000
[   52.327424][  T369]     0x559ad98000, 0x559adb8fff: ffffff800779d320
[   52.327812][  T369]     0x559adb9000, 0x7fad12ffff: 0000000000000000
[   52.328186][  T369]     0x7fad130000, 0x7fad2b7fff: ffffff80096d3ed8
[   52.328661][  T369]     0x7fad2b8000, 0x7fad2cbfff: ffffff80096d30c8
[   52.329095][  T369]     0x7fad2cc000, 0x7fad2cffff: ffffff800779d190
[   52.329507][  T369]     0x7fad2d0000, 0x7fad2d1fff: ffffff800779d578
[   52.329883][  T369]     0x7fad2d2000, 0x7fad2defff: ffffff800779de10
[   52.330727][  T369]     0x7fad2df000, 0x7fad2dffff: 0000000000000000
[   52.331163][  T369]     0x7fad2e0000, 0x7fad2f3fff: ffffff80096d3960
[   52.331641][  T369]   0x7fad2f4000, 0x7fad601fff: node ffffff8005a8ec00 depth 1 type 1 parent ffffff8005a8fb16 contents: slot:ffffff8005a8ec80
[   52.332487][  T369] ffffff80096d3320 7FAD30EFFF ffffff80096d3258 7FAD30FFFF ffffff800779d7d0 7FAD310FFF 0000000000000000 7FAD31FFFF ffffff80096d3c80 7FAD39FFFF ffffff80096d3a28 7FAD3AEFFF ffffff80096d34b0 7FAD3AFFFF ffffff800779dbb8 7FAD3B0FFF 0000000000000000 7FAD3BFFFF ffffff80096d3e10 7FAD5BAFFF ffffff80096d3000 7FAD5C4FFF ffffff80096d3bb8 7FAD5CFFFF ffffff800779d4b0 7FAD5D2FFF ffffff80096d3af0 7FAD5D5FFF 0000000000000000 7FAD5DAFFF ffffff80064fe578
[   52.335259][  T369]     0x7fad2f4000, 0x7fad30efff: ffffff80096d3320
[   52.335666][  T369]     0x7fad30f000, 0x7fad30ffff: ffffff80096d3258
[   52.336037][  T369]     0x7fad310000, 0x7fad310fff: ffffff800779d7d0
[   52.336409][  T369]     0x7fad311000, 0x7fad31ffff: 0000000000000000
[   52.336764][  T369]     0x7fad320000, 0x7fad39ffff: ffffff80096d3c80
[   52.337148][  T369]     0x7fad3a0000, 0x7fad3aefff: ffffff80096d3a28
[   52.337576][  T369]     0x7fad3af000, 0x7fad3affff: ffffff80096d34b0
[   52.337979][  T369]     0x7fad3b0000, 0x7fad3b0fff: ffffff800779dbb8
[   52.339030][  T369]     0x7fad3b1000, 0x7fad3bffff: 0000000000000000
[   52.339594][  T369]     0x7fad3c0000, 0x7fad5bafff: ffffff80096d3e10
[   52.340022][  T369]     0x7fad5bb000, 0x7fad5c4fff: ffffff80096d3000
[   52.340459][  T369]     0x7fad5c5000, 0x7fad5cffff: ffffff80096d3bb8
[   52.340857][  T369]     0x7fad5d0000, 0x7fad5d2fff: ffffff800779d4b0
[   52.341253][  T369]     0x7fad5d3000, 0x7fad5d5fff: ffffff80096d3af0
[   52.341628][  T369]     0x7fad5d6000, 0x7fad5dafff: 0000000000000000
[   52.342030][  T369]     0x7fad5db000, 0x7fad601fff: ffffff80064fe578
[   52.342829][  T369]   0x7fad602000, 0xffffffffffffffff: node ffffff8005a8f300 depth 1 type 1 parent ffffff8005a8fb1e contents: slot:ffffff8005a8f380
[   52.343634][  T369] 0000000000000000 7FAD609FFF ffffff800779d3e8 7FAD60DFFF 0000000000000000 7FAD613FFF ffffff800956bed8 7FAD615FFF ffffff80064fec80 7FAD617FFF ffffff800956be10 7FAD618FFF ffffff80064fe960 7FAD61AFFF ffffff800779dc80 7FAD61CFFF 0000000000000000 7FF6451FFF ffffff80064fe190 7FF6472FFF 0000000000000000 FFFFFFFFFFFFFFFF 0000000000000000 0 0000000000000000 0 0000000000000000 0 0000000000000000 0 000000000000000a
[   52.345856][  T369]     0x7fad602000, 0x7fad609fff: 0000000000000000
[   52.346676][  T369]     0x7fad60a000, 0x7fad60dfff: ffffff800779d3e8
[   52.347122][  T369]     0x7fad60e000, 0x7fad613fff: 0000000000000000
[   52.347526][  T369]     0x7fad614000, 0x7fad615fff: ffffff800956bed8
[   52.347942][  T369]     0x7fad616000, 0x7fad617fff: ffffff80064fec80
[   52.348385][  T369]     0x7fad618000, 0x7fad618fff: ffffff800956be10
[   52.348788][  T369]     0x7fad619000, 0x7fad61afff: ffffff80064fe960
[   52.349152][  T369]     0x7fad61b000, 0x7fad61cfff: ffffff800779dc80
[   52.349534][  T369]     0x7fad61d000, 0x7ff6451fff: 0000000000000000
[   52.349898][  T369]     0x7ff6452000, 0x7ff6472fff: ffffff80064fe190
[   52.350621][  T369]     0x7ff6473000, 0xffffffffffffffff: 0000000000000000

vma_iter_store
print(mas) before mas_store_prealloc()
[   52.351430][  T369] MAS: tree=ffffff8005718040 enode=ffffff8005a8fb1c mas=ffffffc0834bbc58
[   52.351472][  T369] [0] index=100d000 last=100efff
[   52.352216][  T369]      min=0 max=ffffffffffffffff alloc=ffffff8005a8ef00, depth=1, flags=4

mas_store_prealloc(&vmi->mas, vma);
[   52.352668][  T369] ---> [mas_pop_node]
[   52.352895][  T369] MAS: tree=ffffff8005718040 enode=ffffff8005a8fb1c mas=ffffffc0834bbc58
[   52.352934][  T369] [0] index=100d000 last=100efff
[   52.353688][  T369]      min=0 max=ffffffffffffffff alloc=ffffff8005a8ef00, depth=1, flags=4
[   52.354542][  T369] ---> [mas_pop_node]
[   52.354857][  T369] MAS: tree=ffffff8005718040 enode=ffffff8005a8fb1c mas=ffffffc0834bbc58
[   52.354909][  T369] [0] index=100d000 last=100efff
[   52.355536][  T369]      min=0 max=ffffffffffffffff alloc=0000000000000000, depth=1, flags=4
[   52.356455][  T369] ------------[ cut here ]------------
[   52.356870][  T369] WARNING: CPU: 5 PID: 369 at lib/maple_tree.c:1236 mas_pop_node+0xec/0x188
[   52.357771][  T369] Modules linked in:
[   52.358183][  T369] CPU: 5 PID: 369 Comm: mmap Not tainted 6.6.82-4k-ga3b47b4bc710-dirty #66 5b7a90f617366aca8ae8e8ea9b300ac63899e36e
[   52.359069][  T369] Hardware name: linux,dummy-virt (DT)
[   52.359577][  T369] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   52.360086][  T369] pc : mas_pop_node+0xec/0x188
[   52.360350][  T369] lr : mas_pop_node+0x60/0x188
[   52.360604][  T369] sp : ffffffc0834bb3f0
[   52.360837][  T369] x29: ffffffc0834bb3f0 x28: ffffffc0834bb5f0 x27: 0000000000000000
[   52.361369][  T369] x26: ffffffc0834bbc58 x25: 0000000000000000 x24: ffffffc081585860
[   52.361905][  T369] x23: 0000000000000000 x22: 0000000000000000 x21: ffffff80072d08d8
[   52.362782][  T369] x20: ffffffc0834bbc58 x19: 0000000000000000 x18: 0000000000000000
[   52.363388][  T369] x17: 2c313d6874706564 x16: 202c303030303030 x15: 3030303030303030
[   52.363926][  T369] x14: 30303d636f6c6c61 x13: 000000000004ffff x12: 0000000000040174
[   52.364398][  T369] x11: 00000000ffffefff x10: 00000000ffffefff x9 : ffffffc08016c988
[   52.364887][  T369] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000000
[   52.365309][  T369] x5 : ffffffc082124000 x4 : 0000000000000001 x3 : 0000000000000000
[   52.365734][  T369] x2 : 0000000000000000 x1 : 000000000100d000 x0 : 000000000100efff
[   52.366303][  T369] Call trace:
[   52.366570][  T369]  mas_pop_node+0xec/0x188
[   52.366993][  T369]  mas_spanning_rebalance.isra.0+0x8d4/0xf80
[   52.367339][  T369]  mas_wr_spanning_store.isra.0+0x1e8/0x3c8
[   52.367657][  T369]  mas_wr_store_entry.isra.0+0x2c4/0x418
[   52.367936][  T369]  mas_store_prealloc+0x70/0x1a8
[   52.368192][  T369]  vma_iter_store+0x1e8/0x2a8
[   52.368460][  T369]  vma_merge+0x738/0xbe8
[   52.368735][  T369]  mmap_region+0x2b8/0x9c8
[   52.368968][  T369]  do_mmap+0x3ec/0x580
[   52.369250][  T369]  vm_mmap_pgoff+0xbc/0x2a8
[   52.369507][  T369]  ksys_mmap_pgoff+0x158/0x218
[   52.369780][  T369]  __arm64_sys_mmap+0x38/0x58
[   52.370038][  T369]  invoke_syscall+0x50/0x128
[   52.370612][  T369]  el0_svc_common.constprop.0+0x48/0xf8
[   52.370956][  T369]  do_el0_svc+0x28/0x40
[   52.371214][  T369]  el0_svc+0x50/0x120
[   52.371432][  T369]  el0t_64_sync_handler+0x13c/0x158
[   52.371706][  T369]  el0t_64_sync+0x1a0/0x1a8
[   52.372077][  T369] irq event stamp: 19676
[   52.372419][  T369] hardirqs last  enabled at (19675): [<ffffffc08016ed9c>] console_unlock+0x174/0x1b8
[   52.372977][  T369] hardirqs last disabled at (19676): [<ffffffc0812a3e7c>] el1_dbg+0x24/0x90
[   52.373405][  T369] softirqs last  enabled at (18304): [<ffffffc0800c9108>] handle_softirqs+0x518/0x548
[   52.373863][  T369] softirqs last disabled at (18283): [<ffffffc0800102dc>] __do_softirq+0x1c/0x28
[   52.374449][  T369] ---[ end trace 0000000000000000 ]---
[   52.376016][  T369] Unable to handle kernel access to user memory outside uaccess routines at virtual address 0000000000000078
[   52.376706][  T369] Mem abort info:
[   52.376936][  T369]   ESR = 0x0000000096000005
[   52.377211][  T369]   EC = 0x25: DABT (current EL), IL = 32 bits
[   52.377597][  T369]   SET = 0, FnV = 0
[   52.377885][  T369]   EA = 0, S1PTW = 0
[   52.378788][  T369]   FSC = 0x05: level 1 translation fault
[   52.379211][  T369] Data abort info:
[   52.379459][  T369]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[   52.379783][  T369]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   52.380098][  T369]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   52.380526][  T369] user pgtable: 4k pages, 39-bit VAs, pgdp=000000004a534000
[   52.380890][  T369] [0000000000000078] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
[   52.382222][  T369] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
[   52.383086][  T369] Modules linked in:
[   52.383374][  T369] CPU: 5 PID: 369 Comm: mmap Tainted: G        W          6.6.82-4k-ga3b47b4bc710-dirty #66 5b7a90f617366aca8ae8e8ea9b300ac63899e36e
[   52.384054][  T369] Hardware name: linux,dummy-virt (DT)
[   52.384349][  T369] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   52.384685][  T369] pc : mab_mas_cp+0x98/0x2c0
[   52.384907][  T369] lr : mas_spanning_rebalance.isra.0+0x334/0xf80
[   52.385252][  T369] sp : ffffffc0834bb3a0
[   52.385452][  T369] x29: ffffffc0834bb3a0 x28: 0000000000000008 x27: 0000000000000001
[   52.385936][  T369] x26: 0000000000000000 x25: 000000000000000c x24: ffffffc081585860
[   52.386584][  T369] x23: 0000000000000000 x22: ffffffc081585860 x21: ffffffc0834bb508
[   52.387126][  T369] x20: ffffffc0834bb750 x19: ffffff8005a8ef0c x18: 0000000000000000
[   52.387524][  T369] x17: ffffff800956b0c8 x16: ffffff800956baf0 x15: ffffff800956b708
[   52.387882][  T369] x14: ffffff800779d258 x13: ffffff8004618d48 x12: ffffff8004618190
[   52.388307][  T369] x11: ffffff8004618c80 x10: ffffff8004618a28 x9 : 000000000000000e
[   52.388840][  T369] x8 : 0000000000000001 x7 : 0000000000000080 x6 : ffffffc081585000
[   52.389265][  T369] x5 : ffffff8005a8eff8 x4 : 000000000000000e x3 : 000000000000001d
[   52.389630][  T369] x2 : 000000000000001d x1 : 000000000000000f x0 : 000000000000000f
[   52.389997][  T369] Call trace:
[   52.390247][  T369]  mab_mas_cp+0x98/0x2c0
[   52.390578][  T369]  mas_spanning_rebalance.isra.0+0x334/0xf80
[   52.390983][  T369]  mas_wr_spanning_store.isra.0+0x1e8/0x3c8
[   52.391347][  T369]  mas_wr_store_entry.isra.0+0x2c4/0x418
[   52.391635][  T369]  mas_store_prealloc+0x70/0x1a8
[   52.391911][  T369]  vma_iter_store+0x1e8/0x2a8
[   52.392154][  T369]  vma_merge+0x738/0xbe8
[   52.392345][  T369]  mmap_region+0x2b8/0x9c8
[   52.392538][  T369]  do_mmap+0x3ec/0x580
[   52.392728][  T369]  vm_mmap_pgoff+0xbc/0x2a8
[   52.392973][  T369]  ksys_mmap_pgoff+0x158/0x218
[   52.393253][  T369]  __arm64_sys_mmap+0x38/0x58
[   52.393562][  T369]  invoke_syscall+0x50/0x128
[   52.393792][  T369]  el0_svc_common.constprop.0+0x48/0xf8
[   52.394142][  T369]  do_el0_svc+0x28/0x40
[   52.394567][  T369]  el0_svc+0x50/0x120
[   52.394810][  T369]  el0t_64_sync_handler+0x13c/0x158
[   52.395038][  T369]  el0t_64_sync+0x1a0/0x1a8
[   52.395360][  T369] Code: 387b4ac0 51000404 6b00013f 1a82c063 (f864db82)
[   52.395895][  T369] ---[ end trace 0000000000000000 ]---
[   52.396393][  T369] Kernel panic - not syncing: Oops: Fatal exception
[   52.396771][  T369] SMP: stopping secondary CPUs
[   52.397516][  T369] Kernel Offset: disabled
[   52.397745][  T369] CPU features: 0x000000,88000202,3c020000,0000421b
[   52.398113][  T369] Memory Limit: none

[...]
> > the issue introduced by bdc136e2b05f ("mm: resolve faulty mmap_region() error path behaviour")
>
> I'm not entirely sure this is the commit to blame.
>
> >
> > the reason is that call vma_iter_prealloc() twice and the maple_state is invalid. I write a reproducer here
> > by cat /proc/maple_test_merge the patch in attachment(maple_tree_debug.patch).
>
> Not quite correct.  The reason is that the vma iterator is adjusted by
> the vma_merge() code to span the previous node without resetting the vma
> iterator state prior to the second vma_iter_prealloc() call, but then
> vma_iter_store() DOES reset the vma iterator prior to the store.
>
> It should be fine to call vma_iter_prealloc() twice.  This code does not
> reset the maple state; the reset is in vma_iter_store() via
> vma_iter_invalidate().
>
> The vma iterator is not reset during vma_iter_config() to avoid a
> re-walk to the exact same place in the tree, for most cases.  This
> optimisation would really be the root of the issue.
>
> Looking into this further, the only reason we don't get a corrupt tree
> is that the vma_iter_store() code detects the issue and resets the
> iterator itself.  Unfortunately, we then run out of preallocated nodes.
> There is a warning to detect this issue, but it is only enabled by
> CONFIG_DEBUG_VM_MAPLE_TREE, which is heavy handed.
>
> Spanning the next node is already checked in the mas_preallocate() code,
> so the fix could go in the vma iterator, the vma code, or even the
> underlying maple tree code.
>
> Fixing the maple tree code directly means that we can still get into
> this state in the future when people call vma_iter_config() between
> vma_iter_prealloc() and vma_iter_store() - which should not be allowed
> either.
Thank You for the Explanation.

>
> >
> > the reproducer simulates vma mmap at frist. then mmap_region() vma_merge(),
> >
> > the code from stable-6.6.y
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/mm/mmap.c?h=linux-6.6.y
> >
> > the reason show as follows
> > maple_tree
> >                parent
> >     leaf_1(..|c)   leaf_2(d..f|..)
> >
> > __mmap_region(addr=d)
> >     1. vma_iter_prealloc()
> >         mas_state node=leaf_2 alloc=*mt_alloc_one* new_node_a
> >
> >     2. mmap_file(file, vma)
> >         the vm_flags changed by some driver (ashmem) https://android.googlesource.com/kernel/msm/+/android-6.0.1_r0.74/drivers/staging/android/ashmem.c#312
>
> btw, this is an out of tree driver.
Agreed, I also see the behavior on memfd.

>
> I also hate the optimisation here of trying to merge a second time after
> a driver changes its flags.
>
> >
> > vma_merge() (c can merge with d)
> >     3. vma_prev()
> >         mas_state node=leaf_1 alloc=new_node_a
> >     5. vma_iter_config()
> >         mas_state node=parent alloc=new_node_a
> >     4. vma_iter_prealloc()
> >         mas_state node=parent alloc=new_node_a
> >     6. vma_iter_store() --> panic
> >         use invalid new_node_a for spanning write
> >
> >
> > IMO, this issue can be fixed by mmap side maybe conflict with the patch. if
> > fix in maple_tree which need to destory the new_node_a
>
> No.  Destroying new_node_a will make a larger regression.  The current
> code will either use those nodes or add to them.  Any unused nodes are
> freed accordingly.
>
> I think we need to do several things to avoid this situation.
>
> First, the maple tree needs to do a better job detecting when to reset
> the maple state.  I don't like this because it's supposed to be the
> advanced interface.
>
> Unfortunately it is a bit more work than I would like - but that work is
> necessary for the newer code that preallocates less anyways, so we're
> going to eat into that savings a bit.  Most of this is cache-hot anyways
> though.
>
> Second, we should change the detection of the issue in the vma iterator
> store code to a CONFIG_DEBUG_VM so that it is shown to more users.  This
> should mean that it will become less likely to get into a situation
> where the vma iterator has issues during a store.
>
> Another part of the vma iterator fix would be commenting the iterator
> code to point out potential misuses.
>
> Third, we should add more testing for both the maple tree and vma
> userspace code for these scenarios.
I see your RFC patch and test later. Thanks for your help.

>
> ...
>
> Thanks,
> Liam

--

Help you, Help me,
Hailong.
