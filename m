Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2117.outbound.protection.outlook.com [40.107.237.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2B12DCBF0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375370; cv=fail; b=FOG0YIugFheNSxrczasQOSZ87zOvKAgu5KOyhtzAdfcc7SNWZvEJT7IlCFFj6j12o51SDUp+/7YuYBEnj6hjK+rW9gx4ComVfHAawzM/ZyTrxvpBMAk7cXCFBE8fk0vcrN6BDXO+Ehpa/5gYLVuTOAT4iMUtmsFWOgcMvaWrLEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375370; c=relaxed/simple;
	bh=Za9NayqREXGKwoPR0zwK3ulH0D5PJ++YVr6PBpuUKME=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=Ha8wQR8P44Td5nQHfBWAho7FYA8mfWFPMUZFemeaZ5zJ9C6Xx2BCaYOQlE7F77zz1dnS4Q2vGfeusfCxKdNXy/eUdEaCGd2sCedcakWc4Km1tT0kYamdLQbgZOoq7IzS72+1oz7C2IiJ84PbxRojn+W6q16hxJRc3THv3R7I9wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b=nWm6lQ/j; arc=fail smtp.client-ip=40.107.237.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b="nWm6lQ/j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JasXN9uLpjds+qMsaBslexw47QWlJuTb3xi7PRezyowHUzfT7uTW05pCaBmmDQEY9Y2X0qCWkt+bYI+rRKKqi2nu2hSzSsDNrLK8ZQM4f3nUjs135gK+9uGBALcVN9DID3b2JonfIW4eggPgTC6aLODYgUBlW0QPtjMJw2xvM+JDTkkMfDR/ZBmsSCvf4I2pxfIgl8mtIF3+qykJnZSHEc7FGFdZVqNIDw0NQeigZ0ALxPR0ms37+F1CAKM/aSmYAfLQqtsHqh7Jhzc4tGz8AgF/ZXqYFVXFcynww3mwKwMTRIC8w2cA8AEo3Xi1VzheX7B58hLfHm4+5t6Fex1TIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGoCzU38MmStZDIoqiydq+95sm3M9lQkFYu8GaUPQ7Y=;
 b=qxkmNKnr1J0dblkPPJiTWtwGjceP8InxLx99oSFi3QQlee/8HeSrSZulbRvck2kaYPp6LSkXBri+t6Yhmr4SkhSCzPRvLz6+D2ADg1MFC3xxXM4L8Fdp/fJEorirMpOwyv61AVyQs/MuP0KRLTxYi4mLtywW9pRF9yKiGxUrjutGF9tb934mpbN1IbEwISuPX5MVavUZVMNaJEUpgge4/qSEkYrdJrPkK+JZrY1s6H/YT4nfB1jwYyUoztJ6G2ugEQRonwvri9Sipv06gxH/SaH6LKHW0tetrxRz8bUk0EmgN3aV747eGescUDLrib90ahzQ3BXhf4k7RCg9k+ZQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGoCzU38MmStZDIoqiydq+95sm3M9lQkFYu8GaUPQ7Y=;
 b=nWm6lQ/jPB8LcBo5NCeeDNiJ3l0UUMjh4Lx2Fx4Pr5W+KOnC+r3zQm2N/Gx6lT9/449Q3y81FoGpNYMPt8YsdKqeW++VckIS4BmYDU13thkgXnaTbC8hkIswjvKUxtRmzZQ3hO1nAR38kBIhiWh34W2efsfYdd7Bm66mDGo67BA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW5PR10MB5714.namprd10.prod.outlook.com (2603:10b6:303:19b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Tue, 27 May
 2025 19:49:24 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%5]) with mapi id 15.20.8746.032; Tue, 27 May 2025
 19:49:23 +0000
Date: Tue, 27 May 2025 14:49:20 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org
Subject: Crash when user space allocates non-highmem memory
Message-ID: <aDYXQDdT3dTodTlq@colin-ia-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MN0P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::6) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW5PR10MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3c0455-0202-43ee-6b0e-08dd9d57944d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i61JOdVm+HrYX4dEQGDlJAnWey7eyQdAfaMbNtSKQHE78OxLPhxxqpWTHc7x?=
 =?us-ascii?Q?dDkuS13LKydmAXP6AltrHFwYD94vGzK5P9rumtAgwR0ELJUDBo+Iy8GCzD4q?=
 =?us-ascii?Q?4PWO2m0hlaxXy4r5sM4jziGy2q2aIL2zweLq6B1JeXnoWTDJxFVRPgz9Qy4R?=
 =?us-ascii?Q?m+FA2uN+wRIX1R7N2skVxu1Qqj4hdRFj40h/vFgm4gR+icnbuY6oNBrbrFdn?=
 =?us-ascii?Q?bsFSARCWVXzAdaVJ7D5IrVMBpzlndrfCQrAkVWXW2ceFZNeEhMhhXkujqN/I?=
 =?us-ascii?Q?P50HnGR08MICrEc4KIfxWoh6Y5OuthekElf8ngQoXHHrLrYC6BxR2SSTTePx?=
 =?us-ascii?Q?UE/9qAHuUXJPOP66MKq+TvtCawv5EYUap3stl61kJ22TmNDq0IQbn1LUz/DN?=
 =?us-ascii?Q?I3FSVQSuvKw/5Z7OOeFzeNr2o8o6y8hE/gwg21qQHTYbGxte7RkDV2BbrpSM?=
 =?us-ascii?Q?/NuBa4JaMoT7HQIuIgkRQo/bo3u+cjXX3zKu9Ok+pv30GTC3bV+yOuX5NQD4?=
 =?us-ascii?Q?PbP9YqvJu/t5aYAfMi6s0V325oCvr8QFcqTaw4DjLkthIReHziS7v8II8lG/?=
 =?us-ascii?Q?B6W9Snpn3BvipbW6m1yvfdjRDnXk8zS5tghjS+BBJDnrjAwA0sFGWU4JihcS?=
 =?us-ascii?Q?ONblAF5OMFuC8FHXw1sSvu14EuVqmToK+Uy8eHop/tHePmhplQOBxC7+bH3c?=
 =?us-ascii?Q?WcVSzBubsi8oUTHe5CvqpV6QEVFdr+UQITIq2FHfRB7f4WAggpkHqy3FX/TY?=
 =?us-ascii?Q?pfTycQOCRdEsCB0qVIVMk49127eBfSrGg3bc/f47j70MBsc/LcZ6FoIRyzbM?=
 =?us-ascii?Q?c83uQVy/szv8t7zFNYaiuHILfqaFSurb10UxQBuoWgZJjY7HMd5YjNdY0Nsb?=
 =?us-ascii?Q?os4YXejY43YzMcyQguE2IdmO34vItRtNZGBqXZwl5Z1hwMoiO4Wut1ngC+jO?=
 =?us-ascii?Q?O1fMOsfpAYza74CM27DJCIEyq97sTzSd1oaOKYW558umzgLrtcOK1VdXpoDL?=
 =?us-ascii?Q?GJQXqUspXSSha8wD7mH6X8akiBlrevEZpxBqVw2YbwTfjUVFf/Ofpar/TCQG?=
 =?us-ascii?Q?ZD68r1NYVUSFwyWtbvEdPCuPTo6KjqwzTAhVShM2N6zyaawNXQ/0wWrHZXXl?=
 =?us-ascii?Q?E+74BIMO2kGQ03wyNd8CHevxrkeIqyHBkTMLTpTzHyB8NweSL1KKZWd4dngS?=
 =?us-ascii?Q?QR7r1kG5W2JuK8Lq8c0jEwVPH5cEUdpoY6uGsvjut/mO49AfEQ3fFP1nz79f?=
 =?us-ascii?Q?TCv+P6j6EQQyl99mirk8ae0IOSOicDbu81HeK3gmbqZr3npwtyTnlEJz0aUL?=
 =?us-ascii?Q?+uUu4cv/jYY6FY+WpohFPX+sZHaMiQBoTYsH3ECzGUwZ+1V2tfkBGkfePsmx?=
 =?us-ascii?Q?uwDpX4Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6974.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eWo4MmtPReg/j/9oEccJDmKIuFq5CQVu/PzCbLDjEsdkXtdZQ4umua6NRKO9?=
 =?us-ascii?Q?zAlQTMVUqDc4OhBuCcNYPFNiWPRTsx9Mns5R33Tome856ogFCqWpbTVZbJP8?=
 =?us-ascii?Q?4Mrq12hU/5ZFbGW6rraY6EIRyTtvhKaudSZUBEt3ie3IqJxFeh8/qAfxNgAT?=
 =?us-ascii?Q?1lPDUhTO1x0pARzA6V3Nspm1Ma3r8JvuMvHdewc2z8mpvaoiDWZgWvTXk2od?=
 =?us-ascii?Q?Kzp7I1m79SkOsWGf7LRd8WQuyBYrWIN+j9cPpWYBvwKRlIG2hZhhjMmLU9J9?=
 =?us-ascii?Q?l0Z7r5jn1dQQ/3epgyKkwnx6jssWRxpfJb6Y758xmMlQVeYnp01qb8j3EiM3?=
 =?us-ascii?Q?2FSAeEn9RF2755qFkEpc+Va9PTRlQYrllg9HNx5bCKwk5NcQaLzpkNWS+vUL?=
 =?us-ascii?Q?TKHk9Gbm7DTGJzBShiGBYLcvaIzURzJd6QXRLg+ozYOYdOlteT/asJg7K6V6?=
 =?us-ascii?Q?gL72VQ35SL97TbMoLqsftbXo2lVSiFsbrJ9Y3pshQncJ42z8gYQFnDoBwXNk?=
 =?us-ascii?Q?UkmBZSJiPOUkOPdPG1nnfxyjxBuXLc90pJb4Nkn8zC8mRE+1ghasEDvdhvHY?=
 =?us-ascii?Q?d1zNUROP3YYhy3PD8tbd4zKow4BlZk+h4MlY86MhiIwjidLmt7ir602epbzm?=
 =?us-ascii?Q?6k32KcDUhG0ruf+2oujXFv/1pu4d8IahyNlrPG45T8HwokB6yizRXzxxC5d0?=
 =?us-ascii?Q?R2bnwDH53XfYKRqdzS2xciN+xsFlcV/6ijCi/BxC8LjrCLk8telyyy3aZ93b?=
 =?us-ascii?Q?C7JSooVK2qeEXvJQGvZw6qchGRhm3+XOm13gfvdysOg68GjKGzGyWCffiGgB?=
 =?us-ascii?Q?f/YTvCjUEby43A/vuKMOAespcKzwXTtgum+NqcXE5hGPY6Mi96Ob8APEPXq7?=
 =?us-ascii?Q?K7mTW8Q0hxreRjKpgL6iuXcVBsQn5ycOIDOsFo6ucuA2LmQYazTlAPcs/dZ7?=
 =?us-ascii?Q?Zv9/sxAue4cIMOz1KQOQ+K3edljFTT5WUEFh5xj+5l2Gp7Ydden8qgXq7CHL?=
 =?us-ascii?Q?5T1B9TKmnbqELEvQMvmENhOUfQm+RPeYE83IABVz1E7+aCSKIsCAJ58mhyR0?=
 =?us-ascii?Q?Yupjiq/89TclmK+u5emZN/kczfXG8Qr3QYdR7//mhy8TDEXOeHQnIqyUoO4h?=
 =?us-ascii?Q?Wrry9zhjZScoK8jJo7o1L7QE1UH+iqly0pdm0GCGbwwX4pZxHKglmMeia0pi?=
 =?us-ascii?Q?qzffkETIajWgOVnTXaoznBeIJ2mksWcCZy/ZXZV269zoDl4+o5+7OGWAqm8s?=
 =?us-ascii?Q?JN9bXLoOkaXe7ixUWc5YZSHvV17c35xMdQXhUf26uqVXALOyjddFj5CSjxzo?=
 =?us-ascii?Q?W/i3mupBiyYpYR17pjxn9W8mydAh6T6GmTycEb1azp2ctljKImQsT0yDc5p/?=
 =?us-ascii?Q?Tycs+H4sJnHP5Gy/K1FWJCktspMisGOYIKSpbPKJqHrAVvQy9BtUerXlDAER?=
 =?us-ascii?Q?OVFKop9rpbZslxpnc1or6w6bgFNK0L8VBE51nFDbq5jCmjG8pJGDri2rmY7d?=
 =?us-ascii?Q?+mBPRbA7GO0/1JlPD3rSyZu7h6nE2nKAhDjsPG8d7RIZy5lSPCwdJRnIpOjJ?=
 =?us-ascii?Q?CEFaJHZysWHL2D/huv5xqtjn6eQeGy6awd1nzcACKxQLH4qyxM+iZsP6k4ny?=
 =?us-ascii?Q?gb5KYMsOfofopIKY1/2Aq+I=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3c0455-0202-43ee-6b0e-08dd9d57944d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:49:23.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mH14XJ9sIpjcDUQ0SZ5BiSefsMCMfRN8M0zPkw7r/ATSrMv/5+bO13bgbHnNhBufzksB0wp6sLXtiO821wgzL99JdeDUxqYsKX/DLmSyx4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5714

Hello,

I'm running up against a reliable failure mode on my hardware and want
to see if there are any suggestions for tracking down what might be
going on.

The kernel is currently 6.12.28, with essentially no out-of-tree patches
besides our DTS. The hardware is an OMAP 4460 processor.

The behavior I see is quite repeatable. I can allocate about 220MB of
RAM by running:

dd if=/dev/zero of=/tmp/myfile1 bs=1M count=220

After that point I can essentially allocate smaller chunks of RAM.
Eventually - somewhere around 225MB - I see the kernel lock up during
memory allocation. An example of a stack dump:

# dd if=/dev/zero of=/tmp/myfile13 bs=4K count=150
[  457.552825] ------------[ cut here ]------------
[  457.557556] WARNING: CPU: 0 PID: 577 at mm/gup.c:149 try_grab_folio+0x1c0/0x200
[  457.564941] Modules linked in: bq27xxx_battery_hdq bq27xxx_battery phy_omap_usb2 omap_mailbox ehci_omap omap_hdq wire cn pwm_twl pwm_twl_led tps62360_regulator tmp102 hwmon cpufreq_dt nfnetlink
[  457.582397] CPU: 0 UID: 0 PID: 577 Comm: lpc_manager Tainted: G        W          6.12.28 #30
[  457.582397] Tainted: [W]=WARN
[  457.582397] Hardware name: Generic OMAP4 (Flattened Device Tree)
[  457.582397] Call trace:
[  457.600006]  unwind_backtrace from show_stack+0x18/0x1c
[  457.600006]  show_stack from dump_stack_lvl+0x38/0x58
[  457.600006]  dump_stack_lvl from __warn+0x84/0x158
[  457.612945]  __warn from warn_slowpath_fmt+0x1a8/0x1bc
[  457.612945]  warn_slowpath_fmt from try_grab_folio+0x1c0/0x200
[  457.628845]  try_grab_folio from follow_page_pte+0x138/0x440
[  457.628845]  follow_page_pte from __get_user_pages+0x17c/0x824
[  457.628845]  __get_user_pages from __gup_longterm_locked+0xec/0xc68
[  457.646728]  __gup_longterm_locked from gup_fast_fallback+0xcc/0x1ac
[  457.653137]  gup_fast_fallback from get_user_pages_fast+0x50/0x60
[  457.653137]  get_user_pages_fast from get_futex_key+0x88/0x43c
[  457.653137]  get_futex_key from futex_wake+0x5c/0x1c4
[  457.653137]  futex_wake from do_futex+0xd4/0x188
[  457.674896]  do_futex from mm_release+0x10c/0x110
[  457.674896]  mm_release from do_exit+0x2cc/0xc20
[  457.684295]  do_exit from do_group_exit+0x0/0xc8
[  457.688964]  do_group_exit from __sys_trace_return+0x0/0x10
[  457.688964] Exception stack(0xf0aa9fa8 to 0xf0aa9ff0)
[  457.688964] 9fa0:                   b3efe000 b46fe614 00000000 00800000 00000000 00000000
[  457.699676] 9fc0: b3efe000 b46fe614 00801000 00000001 b46fe400 b46fe400 b3efe000 00000000
[  457.699676] 9fe0: 00000001 b46fdd80 b6b42197 b6b03826
[  457.721221] ---[ end trace 0000000000000000 ]---
[  457.732635] page: refcount:0 mapcount:1 mapping:00000000 index:0x0 pfn:0xbdb69
[  457.732635] flags: 0x0(zone=0)
[  457.743011] raw: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  457.751159] raw: 00000000
[  457.751159] page dumped because: VM_BUG_ON_FOLIO(((unsigned int) folio_ref_count(folio) + 127u <= 127u))
[  457.763336] ------------[ cut here ]------------
[  457.763336] kernel BUG at include/linux/mm.h:1444!
[  457.763336] Internal error: Oops - BUG: 0 [#1] PREEMPT ARM
[  457.763336] Modules linked in: bq27xxx_battery_hdq bq27xxx_battery phy_omap_usb2 omap_mailbox ehci_omap omap_hdq wire cn pwm_twl pwm_twl_led tps62360_regulator tmp102 hwmon cpufreq_dt nfnetlink
[  457.778472] CPU: 0 UID: 0 PID: 109 Comm: systemd-journal Tainted: G        W          6.12.28 #30
[  457.804687] Tainted: [W]=WARN
[  457.804687] Hardware name: Generic OMAP4 (Flattened Device Tree)
[  457.804687] PC is at do_wp_page+0x9a4/0xea4
[  457.817932] LR is at do_wp_page+0x9a4/0xea4
[  457.817932] pc : [<c02f2bd4>]    lr : [<c02f2bd4>]    psr: 600e0113
[  457.817932] sp : f0195e80  ip : 00000000  fp : f0195ee8
[  457.817932] r10: c2b91480  r9 : 00000002  r8 : c2b91480
[  457.817932] r7 : c2b91480  r6 : 00000000  r5 : efda6ac4  r4 : f0195ee8
[  457.838958] r3 : 00000000  r2 : 00000000  r1 : c13f6c50  r0 : 0000005c
[  457.852081] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  457.852081] Control: 10c5387d  Table: 82b40059  DAC: 00000051
[  457.852081] Register r0 information: non-paged memory
[  457.870117] Register r1 information: non-slab/vmalloc memory
[  457.870117] Register r2 information: NULL pointer
[  457.875823] Register r3 information: NULL pointer
[  457.880554] Register r4 information: 2-page vmalloc region starting at 0xf0194000 allocated at kernel_clone+0xb0/0x414
[  457.880554] Register r5 information: non-slab/vmalloc memory
[  457.880554] Register r6 information: NULL pointer
[  457.901763] Register r7 information: slab vm_area_struct start c2b91480 pointer offset 0 size 72
[  457.906524] Register r8 information: slab vm_area_struct start c2b91480 pointer offset 0 size 72
[  457.915374] Register r9 information: non-paged memory
[  457.929290] Register r10 information: slab vm_area_struct start c2b91480 pointer offset 0 size 72
[  457.929321] Register r11 information: 2-page vmalloc region starting at 0xf0194000 allocated at kernel_clone+0xb0/0x414
[  457.949096] Register r12 information: NULL pointer
[  457.949096] Process systemd-journal (pid: 109, stack limit = 0x40806a5f)
[  457.949096] Stack: (0xf0195e80 to 0xf0196000)
[  457.960662] 5e80: c2bb3600 c02eb5f4 00000001 00000000 00000000 00000000 00000000 c2bb3600
[  457.973266] 5ea0: 002d8788 00000255 b61e2000 f0195fb0 bdb6938f c2bb3600 00000002 c2b91480
[  457.973266] 5ec0: f0195ee8 c02f4d94 b6158000 b6393fff c1d0cc0c 00000000 b69c5fff 00000000
[  457.989715] 5ee0: 00000000 18000801 c2b91480 00100cca 0000008a b61e2000 b61e2000 00000a55
[  457.989715] 5f00: c2b42d80 c2b42d80 bdb6938f 00000000 efda6ac4 ffefd788 c2bb362c 00000000
[  457.989715] 5f20: 00000001 23c69c7f 00000000 0000081f f0195fb0 b61e2ff8 00000255 0000081f
[  458.006164] 5f40: 00000002 c2bb3600 b61e2000 c0d5dd00 000001c9 00000000 2b85e570 00000000
[  458.006164] 5f60: 0000006d 0000081f c130af80 b61e2ff8 f0195fb0 c0d5dba4 19dbb5a5 00000000
[  458.030822] 5f80: be88c2f0 c0113ce0 2b85e570 00000000 be88bff8 23c69c7f b6e399a4 600e0110
[  458.030822] 5fa0: ffffffff 10c5387d 10c5387d c0100f4c 00000000 00000001 00000000 b61e2ff8
[  458.030822] 5fc0: 004bf530 00000000 0000006d 00000000 00000001 19dbb5a5 00000000 be88c2f0
[  458.047271] 5fe0: 00000000 be88c1f0 b6e4b9ec b6e399a4 600e0110 ffffffff 00000000 00000000
[  458.047271] Call trace:
[  458.063720]  do_wp_page from handle_mm_fault+0x758/0x121c
[  458.063720]  handle_mm_fault from do_page_fault+0x15c/0x380
[  458.071716]  do_page_fault from do_DataAbort+0x40/0xc0
[  458.071716]  do_DataAbort from __dabt_usr+0x4c/0x60
[  458.071716] Exception stack(0xf0195fb0 to 0xf0195ff8)
[  458.092529] 5fa0:                                     00000000 00000001 00000000 b61e2ff8
[  458.092529] 5fc0: 004bf530 00000000 0000006d 00000000 00000001 19dbb5a5 00000000 be88c2f0
[  458.108978] 5fe0: 00000000 be88c1f0 b6e4b9ec b6e399a4 600e0110 ffffffff
[  458.108978] Code: eaffff6f e59f14ec e1a00005 ebffc6dd (e7f001f2)
[  458.121765] ---[ end trace 0000000000000000 ]---
[  458.121765] Kernel panic - not syncing: Fatal exception
[  458.121765] ---[ end Kernel panic - not syncing: Fatal exception ]---


My observations:

This feels to be related to a transition from the HighMem to the
Normal region in memory.

[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   HighMem  [mem 0x00000000afe00000-0x00000000bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000afdfffff]
[    0.000000]   node   0: [mem 0x00000000b0000000-0x00000000bfffffff]

If I boot with "mem=900M" then the same behavior happens around 125MB
instead of 225MB.

I'm currently running with SMP disabled, to aid in debugging.

If I allocate too much memory (via "memhog 250M") the kernel locks up
and I don't get any traces / panics.

A couple searches led me to this ancient thread, which seems like
similar behavior, but of course was resolved 15 years ago.

https://bugs.launchpad.net/ubuntu/+source/linux-ti-omap4/+bug/633227

I figured it can't hurt to throw these observations out to the mailing
lists, in case there are any ideas or if it is actually a bug. I'm not
well-versed in the memory subsystem, so if there are suggestions on
things to try I'm all ears!


Many thanks,

Colin
